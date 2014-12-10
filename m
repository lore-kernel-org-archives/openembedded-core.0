Return-Path: <lh_post@yahoo.com>
Received: from nm28-vm1.bullet.mail.ne1.yahoo.com
	(nm28-vm1.bullet.mail.ne1.yahoo.com [98.138.91.35])
	by mail.openembedded.org (Postfix) with ESMTP id 82C6472456
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Dec 2014 14:45:43 +0000 (UTC)
Received: from [98.138.226.179] by nm28.bullet.mail.ne1.yahoo.com with NNFMP;
	10 Dec 2014 14:45:43 -0000
Received: from [98.138.226.165] by tm14.bullet.mail.ne1.yahoo.com with NNFMP;
	10 Dec 2014 14:45:43 -0000
Received: from [127.0.0.1] by omp1066.mail.ne1.yahoo.com with NNFMP;
	10 Dec 2014 14:45:43 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 282880.24643.bm@omp1066.mail.ne1.yahoo.com
Received: (qmail 91524 invoked by uid 60001); 10 Dec 2014 14:45:43 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024;
	t=1418222743; bh=f02ITZMsZ/TY5HKtM9HuEPHhwr8s7GKE9B815+zxUTs=;
	h=Message-ID:Date:From:Subject:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding;
	b=vE0K0nDeG4GYi9nnCAFyXYaspp2ZYSbQF4W8s7/wfXXZYXWLlCFVGJmk4FdZqH/hxrjSqfwHFwjDpnt5W//jX9hQmVaBqtyx484+HvWyYCpluI7qnA/M74VFnj2/IJ3WDVAkMzPNVtUesUZMvU0KFD9aOI65Jy1Q2VRL6AEG0dw=
X-YMail-OSG: hH2DvpYVM1lo6O4mM6Uqup3PIEmH_skPJW.bkC3Qu3GDoxO
	vSI.zEZAeStovrvCgULUzTsXrp4ao.Y0aPSx8vE_u.2Z0IYRNx7UB1Si8XUo
	.UfK0TYFMILiPb1sz4nqr3sq1tlfb056lLzPdlIME_MGj0WjpHStPyqzwpAg
	9ON6hsX8kQTUwsdcm5T.fb6oWKCqNbrXz.3UMLxqCppFzdIXJHzjMdbr.rMm
	5Rk4MuDc4nZzMG3J50bhpuV7_aSXZxcaFfuJk.P2T86WrQsFD97qVfvEqSTx
	WSMZJ7icRnJ2ipJocjpNRXDopv8m5DGUAiiTVtd4Hrkldj52sYQ0Y.7eDZqG
	eYYvw9.yq1mkstlkK3PGtEsaW.ZRdxIVEhNYkELluNNRLqaLm2c7p4BgYr0Q
	VT6JmmqP0aeXojpWimcYlJA6nu.szwutYjUUUwjDJXsuuBBZcKRDREFQVo5c
	GJp4bHa.yuSou5bvQNRyhm3xrxiC_FGi4UswvEs2YFNq6oYNga71xckEKj84
	I5FZ6hWEVOWvrBaD6Donq1xY1OaiUTjbNuIdXbQ0hBF8GhodJx5Vfxm3sIj5
	D99EfCm1VTQG5jJk1ewQMgzMBOP2rgYrWlMsl1WgZJsniVUN6ZOvzLCwojRF
	CASNcs92SGCECo2tYVdscHAE32tX4Y53_T87aTzRs5UnQeF8chMRehr1Q1G.
	feLuj7nkIrhgaFeeCNRbBmmjfI4LNRkZkPBB0Rn4OFzKamtnDN3YbgItYexP
	txtojojqYIAPyMKF_jCxKOFeX4w6F_UVU1h1u
Received: from [87.48.158.178] by web125605.mail.ne1.yahoo.com via HTTP;
	Wed, 10 Dec 2014 06:45:43 PST
X-Rocket-MIMEInfo: 002.001,
	LS0tIE9uIFdlZCwgMTAvMTIvMTQsIFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnPiB3cm90ZToNCg0KPiA.IFRvIHN1cHBvcnQgc2lnbmVkIHBhY2thZ2VzIEkgaGF2ZSBhZGRlZA0KPiBncGcgdG8gdGhlIFBBQ0tBR0VDT05GSUcgZm9yDQo.ID4gb3BrZy4gSQ0KPiBoYXZlIGRvbmUgdGhpcyBieSBjcmVhdGluZyBhbiBvcGtnXzAuMi4xLmJiYXBwZW5kIGZpbGUNCj4gd2l0aA0KPiA.IHRoZSBsaW5lOiANCj4gPg0KPiBQQUNLQUdFQ09ORklHICs9ICJncGciDQo.ID4BMAEBAQE-
X-Mailer: YahooMailClassic/881 YahooMailWebService/0.8.203.740
Message-ID: <1418222743.73229.YahooMailBasic@web125605.mail.ne1.yahoo.com>
Date: Wed, 10 Dec 2014 06:45:43 -0800
From: Lars Michael <lh_post@yahoo.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
MIME-Version: 1.0
Subject: Re: Problem building image with opkg and gpg support
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
X-List-Received-Date: Wed, 10 Dec 2014 14:45:48 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

--- On Wed, 10/12/14, Richard Purdie <richard.purdie@linuxfoundation.org> w=
rote:

> > To support signed packages I have added
> gpg to the PACKAGECONFIG for
> > opkg. I
> have done this by creating an opkg_0.2.1.bbappend file
> with
> > the line:=20
> >
> PACKAGECONFIG +=3D "gpg"
> >
> > In my image recipe I added:
> > IMAGE_INSTALL_append =3D "
> opkg"
> > IMAGE_INSTALL_append =3D
> " gpgme"
> >
> >
> 'bitbake opkg' seems to run ok and builds libgpgme
> and opkg ipk's. But
> > when I run
> 'bitbake myimage' I get:
> >
> > ERROR: Nothing PROVIDES
> 'gpgme-native' (but
> >
> virtual:native:/media/datadisk/arm/fsl-community-bsp-daisy/sources/poky/m=
eta/recipes-devtools/opkg/opkg_0.2.1.bb
> DEPENDS on or otherwise requires it). Close matches:
> >=A0=A0=A0gperf-native
> >=A0=A0=A0rpm-native
> >=A0=A0=A0gmp-native
> > ERROR: Required build target
> 'myimage' has no buildable providers.
> > Missing or unbuildable dependency chain
> was: ['myimage',
> >
> 'opkg-native', 'gpgme-native']
> >
=20
> You've enabled gpg for both the target and
> native opkg recipes and there
> is no
> gpg-native for opkg-native to work. If you only the
> target
> verison, you could try:
>=20
> PACKAGECONFIG_append_class-target =3D "
> gpg"
>=20
> otherwise you
> need to enable a native version of gpgme, probably adding
> BBCLASSEXTEND =3D "native" to the
> recipe for starters, there may then be
> other
> tweaks needed.

Richard,

I tried to use the PACKAGECONFIG_append_class-target but in that case opkg =
is build
without pgpme and signing enabled. Note: I wish to be able sign packages on=
 the build machine and verify
the signatures on the board. Both using PGP.

Then I also tried to add 'native' to the gpme_1.4.3.bb recipe, but the buil=
d failed. Obviously other
changes are required for that to work.

Finally I tried to apply the patches described here:
https://www.mail-archive.com/openembedded-core@lists.openembedded.org/msg55=
204.html

But the build fails:

ERROR: Nothing RPROVIDES 'gnupg-native' (but virtual:native:/media/datadisk=
/arm/fsl-
community-bsp-daisy/sources/poky/meta/recipes-devtools/opkg/opkg_0.2.1.bb R=
DEPENDS on or otherwise requires it)
NOTE: Runtime target 'gnupg-native' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['gnupg-native']
ERROR: Required build target 'my-image' has no buildable providers.
Missing or unbuildable dependency chain was: ['my-image', 'opkg-native', 'g=
nupg-native']

Summary: There were 2 ERROR messages shown, returning a non-zero exit code.

Thanks and regards,
Lars


