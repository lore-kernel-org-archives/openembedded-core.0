Return-Path: <prvs=7981aab84=Mikko.Rapeli@bmw.de>
Received: from esa10.bmw.c3s2.iphmx.com (esa10.bmw.c3s2.iphmx.com
	[68.232.139.98])
	by mail.openembedded.org (Postfix) with ESMTP id EFC0F747A2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2018 07:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
	t=1537772622; x=1569308622;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-id:content-transfer-encoding: mime-version;
	bh=yuzAyqlMhvkR78r5WHAU/rRRRW4wMOHfCSJTG1zSLo0=;
	b=BdpyZPfDtFkxK1d69UqsZNCCVp0em/jFVYj3WCGZ1BUlBWGPn08bI7LB
	XMrsrQR9rQ55xvAegXTCOOdpZyY2HbLQ1LzC2jeH7mo5UZi8DLVV4CFBa
	AMsdBrg0hTDHBpFbDRbsR9sinPeKCeMhzYziH1TdHH+8zrXuu7bZAGvdO o=;
Received: from esagw4.bmwgroup.com (HELO esagw4.muc) ([160.46.252.39]) by
	esa10.bmw.c3s2.iphmx.com with ESMTP/TLS; 24 Sep 2018 09:03:40 +0200
Received: from esabb4.muc ([160.50.100.33])  by esagw4.muc with ESMTP/TLS;
	24 Sep 2018 09:03:39 +0200
Received: from smucm10k.bmwgroup.net (HELO smucm10k.europe.bmw.corp)
	([160.48.96.47])
	by esabb4.muc with ESMTP/TLS; 24 Sep 2018 09:03:39 +0200
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by
	smucm10k.europe.bmw.corp
	(160.48.96.47) with Microsoft SMTP Server (TLS;
	Mon, 24 Sep 2018 09:03:38 +0200
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
	smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1367.000;
	Mon, 24 Sep 2018 09:03:38 +0200
From: <Mikko.Rapeli@bmw.de>
To: <peter.kjellerstedt@axis.com>
Thread-Topic: [OE-core] [PATCH] openssl10: remove extra slash from libdir path
Thread-Index: AQHUUcSFjraUbKE8DEKhYM1zuHiswKT6zuwAgAQVcwA=
Date: Mon, 24 Sep 2018 07:03:38 +0000
Message-ID: <20180924070338.GB9430@hiutale>
References: <1537545717-26570-1-git-send-email-mikko.rapeli@bmw.de>
	<cff1f5c8f79f46dfa369c102d57d13b4@XBOX02.axis.com>
In-Reply-To: <cff1f5c8f79f46dfa369c102d57d13b4@XBOX02.axis.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [192.168.221.36]
MIME-Version: 1.0
Cc: Michael.Ho@bmw.de, Thomas.Witt@bmw.de,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] openssl10: remove extra slash from libdir path
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Sep 2018 07:03:40 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6718170A0498614FA48EB7ACE12508BD@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 21, 2018 at 04:41:50PM +0000, Peter Kjellerstedt wrote:
> > diff --git a/meta/recipes-connectivity/openssl/openssl10_1.0.2p.bb
> > b/meta/recipes-connectivity/openssl/openssl10_1.0.2p.bb
> > index b7297fc..f09782c 100644
> > --- a/meta/recipes-connectivity/openssl/openssl10_1.0.2p.bb
> > +++ b/meta/recipes-connectivity/openssl/openssl10_1.0.2p.bb
> > @@ -191,7 +191,7 @@ do_configure () {
> >  	if [ "x$useprefix" =3D "x" ]; then
> >  		useprefix=3D/
> >  	fi
> > -	libdirleaf=3D"$(echo ${libdir} | sed s:$useprefix::)"
> > +	libdirleaf=3D"$( basename "${libdir}" )"
>=20
> You are making assumptions about the value of ${libdir} here.
> May I suggest the following instead (just in case someone has=20
> defined libdir as ${prefix}/foo/lib):
>=20
> 	libdirleaf=3D"$(echo ${libdir} | sed s:^$useprefix/*::)"

Ok, sending v2 with this.

-Mikko=

