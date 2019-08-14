Return-Path: <prvs=122729fd1=Mikko.Rapeli@bmw.de>
Received: from esa9.bmw.c3s2.iphmx.com (esa9.bmw.c3s2.iphmx.com
	[68.232.133.110])
	by mail.openembedded.org (Postfix) with ESMTP id 5B89D7EC66
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2019 14:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
	t=1565794081; x=1597330081;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-id:content-transfer-encoding: mime-version;
	bh=k8MSGdQJSRnbYLYRiWc3DPCxOVavQ/pyniutmCP6h0s=;
	b=oG6oqjezpj0Eyf+Ma1fIqOTmkNRw+siAQKdOgxt+k00WgWnwCAGeCN4u
	boCa+5JCl3JCPb5bg0JK5/aP3FFwy4qQCj6ow87t7gYB13mkcMgVwptMN
	yECNb1nC7KJSEW90jXyKaTpObh4UHL+/pAEtGHagD5h3h0NT7ArzlJAt5 I=;
IronPort-SDR: i+EOOrGgOMlfxEtPAxdC+GaALfhdOMxteD/4NEMgDDpZGoRHnesTa2nWtEQUdDiZv9WizRDc3J
	ZvpJRLK1aiINEpu0y3l+gnKWqpYqwR8+TL8nN/2MC64Oz0bcsaiDaptPhTtr5Lt2zS/8Cl/jjq
	IC2m4tPQmzTvN/Sr0uSczRJOrjccdM3kaZzZLL1Fyi+OuyJq0lIbcaOo7nJ99qCtC7acrTlCw9
	X2e2Cv0xhoG9u9cYguxWxmZ1nltFBd87JkrkwUXvWtvzBkx/5XdWSeQR5aiDGXWqPHtlMP1LSb
	PqA=
Received: from esagw4.bmwgroup.com (HELO esagw4.muc) ([160.46.252.39]) by
	esa9.bmw.c3s2.iphmx.com with ESMTP/TLS; 14 Aug 2019 16:48:00 +0200
Received: from esabb1.muc ([160.50.100.31])  by esagw4.muc with ESMTP/TLS;
	14 Aug 2019 16:47:59 +0200
Received: from smucm10l.bmwgroup.net (HELO smucm10l.europe.bmw.corp)
	([160.48.96.48])
	by esabb1.muc with ESMTP/TLS; 14 Aug 2019 16:47:59 +0200
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by
	smucm10l.europe.bmw.corp
	(160.48.96.48) with Microsoft SMTP Server (TLS;
	Wed, 14 Aug 2019 16:47:58 +0200
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
	smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1473.005;
	Wed, 14 Aug 2019 16:47:58 +0200
From: <Mikko.Rapeli@bmw.de>
To: <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH] stress-ng: provide stress
Thread-Index: AQHVUp/OL4jcc6z9cE6qdHa2vFWNLab6lTkAgAAChwA=
Date: Wed, 14 Aug 2019 14:47:58 +0000
Message-ID: <20190814144758.GG3459@hiutale>
References: <1565787413-8109-1-git-send-email-mikko.rapeli@bmw.de>
	<f860d0823bb97bdc818095b369af276f170b7433.camel@linuxfoundation.org>
In-Reply-To: <f860d0823bb97bdc818095b369af276f170b7433.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [192.168.221.46]
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] stress-ng: provide stress
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
X-List-Received-Date: Wed, 14 Aug 2019 14:47:59 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <72139EB8F3AC9547A34916967D6E659B@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 14, 2019 at 03:38:56PM +0100, Richard Purdie wrote:
> On Wed, 2019-08-14 at 15:56 +0300, Mikko Rapeli wrote:
> > Since stress-ng replaces and is compatible with stress,
> > provide stress to be compatible with the old recipe
> > and binary packages.
> >=20
> > Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
> > ---
> >  meta/recipes-extended/stress-ng/stress-ng_0.10.00.bb | 4 ++++
> >  1 file changed, 4 insertions(+)
> >=20
> > diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.10.00.bb
> > b/meta/recipes-extended/stress-ng/stress-ng_0.10.00.bb
> > index e800040..64e0928 100644
> > --- a/meta/recipes-extended/stress-ng/stress-ng_0.10.00.bb
> > +++ b/meta/recipes-extended/stress-ng/stress-ng_0.10.00.bb
> > @@ -14,6 +14,10 @@ SRC_URI[sha256sum] =3D
> > "d09dd2a1aea549e478995bf9be90b38906a4cdf33ea7b245ef9d46aa52
> > =20
> >  DEPENDS =3D "coreutils-native"
> > =20
> > +PROVIDES =3D "stress"
> > +RPROVIDES_${PN} =3D "stress"
> > +RPROVIDES_${PN}-dev =3D "stress-dev"
> > +
>=20
> Isn't that going to need RCONFLICTS and RREPLACES too?

I did not need them. I'm not updating existing images or mixing
stress and stress-ng binary packages in a package repo.

But I will add them in a v2.

-Mikko=

