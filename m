Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
	by mail.openembedded.org (Postfix) with ESMTP id 18CE2619B9
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Mar 2020 13:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=axis.com; l=2664; q=dns/txt; s=axis-central1;
	t=1583241346; x=1614777346;
	h=from:to:subject:date:message-id:references:in-reply-to:
	content-transfer-encoding:mime-version;
	bh=fPs8blzKeeeNEArAxq4rdelHSIAxakOfN+CZ+NY8gzI=;
	b=bWdpxAu4rA/aM+HknxTK45pTS8ZOIKScqH+x3ujsjDXx1dJrqvnZ7/VQ
	x8VIloIGp6OxIHLadktOy07e2BGGIBBBXeB0QR21DWsGII8nusq7cXZbA
	ixsqSsmnWnkycyJVvHct1n7PABl0Di4wT2Xc57fOOnEz66Rb6dgQ3nh+X
	RRyyIp/07ug5fqJs18SY7OP/5exFfmthkLCfHgmxr1LscdWVsVk5bN7l1
	4HPrOxjCD76BQ86IROD2VXJ1KrbdzrrZnpYNoMB/bZVZPk3us4fZ/wBgU
	NzwXfCNlh+kW5luToJudgQBj5wDIzDwIZ8ptaF+fn30xgzUxHc+1xqSwK w==;
IronPort-SDR: bwUkQ4+pjZ8iO9eEh2s6njdARcHKfNJKJiVG9qNXwoZ8xI3ll3Vukojm7GxrEu3Ugf2fGrK9lm
	jp8KBNkBhmVu7+KBoPiFLQ218gPPNuUs+FeXX3JnU19t3qWKmuzB4+7IS25es34VDBIbwhXfYa
	SpJePqvftx8uYEdKsah5mfkJ5oZ5y5ipJVFqfEl5AECMVlXg0p0OXhCJNnmw/jEE4MmxiudJUR
	cd+QwO9VhMwmuhdifNwB2/oW+9RXXdguV/38mu69uM3k9Kl0I3LpIBWgprc86PJSYaJQn9mpVX
	SsE=
X-IronPort-AV: E=Sophos;i="5.70,511,1574118000"; 
   d="scan'208";a="6042478"
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, OE Core mailing list
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] is there ever a compelling reason for
	"FILESEXTRAPATHS_append := ..."?
Thread-Index: AQHV774hmsJz5zIW+0uS6YrxyoT826gzjxKAgANI5DA=
Date: Tue, 3 Mar 2020 13:15:45 +0000
Message-ID: <673fe5c88b2842ea8a023562a2043be3@XBOX03.axis.com>
References: <alpine.LFD.2.21.2003010633290.73263@localhost.localdomain>
	<alpine.LFD.2.21.2003010645240.73653@localhost.localdomain>
In-Reply-To: <alpine.LFD.2.21.2003010645240.73653@localhost.localdomain>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Subject: Re: is there ever a compelling reason for "FILESEXTRAPATHS_append := ..."?
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
X-List-Received-Date: Tue, 03 Mar 2020 13:15:45 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-core=
-
> bounces@lists.openembedded.org> On Behalf Of Robert P. J. Day
> Sent: den 1 mars 2020 12:51
> To: OE Core mailing list <openembedded-core@lists.openembedded.org>
> Subject: Re: [OE-core] is there ever a compelling reason for
> "FILESEXTRAPATHS_append :=3D ..."?
>=20
> On Sun, 1 Mar 2020, Robert P. J. Day wrote:
>=20
> >
> >   occasionally, i run across an existing bbappend file which contains
> >
> >   FILESEXTRAPATHS_append :=3D ...
> >
> > and that makes me nervous as i don't see the rationale in *appending*
> > to that variable in a bbappend file -- seems to defeat the purpose of
> > potentially overriding what's in the original .bb recipe.
> >
> >   now, sometimes it's obvious that it's broken as i'm currently
> > looking at an example:
> >
> >   FILESEXTRAPATHS_append :=3D "${THISDIR}/${PN}:"
> >
> > which makes no sense at all with the colon at the end. but other than
> > something so clearly broken, are there situations to append to
> > FILESEXTRAPATHS? that just seems counter-productive, but maybe i'm
> > missing something.
>=20
>   figured i'd scan for examples of that in some of the many layers i
> have checked out and found the following:
>=20
> meta-boundary/recipes-qt/qt4/qt4-embedded_%.bbappend:FILESEXTRAPATHS_appe=
nd :=3D "${THISDIR}/files:"
>=20
> meta-intel/recipes-core/zlib/zlib-intel_1.2.11.1.jtkv6.3.bb:FILESEXTRAPAT=
HS_append =3D ":${COREBASE}/meta/recipes-core/zlib/zlib"
>=20
> meta-qt5/recipes-qt/qt5/qt5-ptest.inc:FILESEXTRAPATHS_append :=3D ":${THI=
SDIR}/ptest"
>=20
> meta-virtualization/recipes-networking/openvswitch/openvswitch_git.bb:FIL=
ESEXTRAPATHS_append :=3D "${THISDIR}/${PN}-git:"
>=20
>   note that a couple seem clearly(?) wrong (like that last one), but

Although contradictory to logic, it is apparently correct to use=20
"<path>:" both with _prepend and _append when adding to=20
FILESEXTRAPATHS (see the default value set by bitbake.conf, which is=20
"__default:"). However, problems _will_ arise if different bbappend=20
files for the same recipe do it differently... It can also be noted=20
that the QA test in insane.bbclass suggests to use ":<path>" with=20
_append, further adding to the confusion.

> i'm open to clarification as to when this is useful. (i think i see
> the application in that meta-intel layer example, although should that
> use "OEROOT" rather than "COREBASE"?)

No, ${COREBASE} is correct. (OEROOT is not a bitbake variable, it is=20
only available in the oe-init-build-env script.)

>=20
> rday

//Peter


