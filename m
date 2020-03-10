Return-Path: <prvs=3311916b7=Mikko.Rapeli@bmw.de>
Received: from esa5.bmw.c3s2.iphmx.com (esa5.bmw.c3s2.iphmx.com
	[68.232.139.67])
	by mail.openembedded.org (Postfix) with ESMTP id 21BFE60AF5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2020 12:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
	t=1583843216; x=1615379216;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-id:content-transfer-encoding: mime-version;
	bh=giZI9eyRTM9gFZuF2YYDs8Nn8MHxp+u+gtxJj3elwA4=;
	b=hVknuG31ud2Lznbx02aKEhhSIeBYJtSv6zoMAA7sjE1EvqnuXE3qOyfS
	LIU0jnemy1Z3Wv/MPkASnIsqPToWxp3BeAdEWBS8CNjCSttyLDfAboN/E
	n6beWtjEPyBsRNBoOtwByPIJVPj+z1SRWw5NzTYQ/8FVI5Bf0deOmps/5 o=;
Received: from esagw6.bmwgroup.com (HELO esagw6.muc) ([160.46.252.49]) by
	esa5.bmw.c3s2.iphmx.com with ESMTP/TLS; 10 Mar 2020 13:26:53 +0100
Received: from esabb3.muc ([160.50.100.30])  by esagw6.muc with ESMTP/TLS;
	10 Mar 2020 13:26:49 +0100
Received: from smucm10l.bmwgroup.net (HELO smucm10l.europe.bmw.corp)
	([160.48.96.48])
	by esabb3.muc with ESMTP/TLS; 10 Mar 2020 13:26:47 +0100
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by
	smucm10l.europe.bmw.corp
	(160.48.96.48) with Microsoft SMTP Server (TLS;
	Tue, 10 Mar 2020 13:26:47 +0100
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
	smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1473.005;
	Tue, 10 Mar 2020 13:26:47 +0100
From: <Mikko.Rapeli@bmw.de>
To: <rpjday@crashcourse.ca>
Thread-Topic: [OE-core] how to cleanly centralize a zillion BBCLASSEXTEND +=
	"nativesdk" settings?
Thread-Index: AQHV8I/Z9MPDKw1wfkCizf5lA8GWKahBvHAA
Date: Tue, 10 Mar 2020 12:26:47 +0000
Message-ID: <20200310122646.GW104502@korppu>
References: <20200302074035.Horde.5xguZSt_-_Yd241eE1Zo8Pb@crashcourse.ca>
In-Reply-To: <20200302074035.Horde.5xguZSt_-_Yd241eE1Zo8Pb@crashcourse.ca>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: how to cleanly centralize a zillion BBCLASSEXTEND += "nativesdk" settings?
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
X-List-Received-Date: Tue, 10 Mar 2020 12:26:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1D9F1D79FDFEF148ACF2367AA623F738@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 02, 2020 at 07:40:35AM -0500, rpjday@crashcourse.ca wrote:
> layer i'm currently perusing has many, many bbappend files, of which
> quite a number are nothing more than the single line:
>=20
>   BBCLASSEXTEND +=3D "nativesdk"
>=20
> literally, at least a hundred append files are like that. so rather
> than clutter up the layer with all those trivial .bbappend files,
> can one cram all that into a single .conf file? as i read it, can i
> do something like:
>=20
>   BBCLASSEXTEND_append_pn-pkg1 =3D " nativesdk"
>   BBCLASSEXTEND_append_pn-pkg2 =3D " nativesdk"
>   ... and on and on ...
>=20
> and toss all that into a distro.conf file or something?
>=20
>   and even if that works, is it considered good coding style?

FWIW, I have the same problem. Solution until now is large number of
bbappends for adding native and nativesdk support.

-Mikko=

