Received: from mail-ea0-f176.google.com ([209.85.215.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UROg6-0005sL-6P
	for openembedded-core@lists.openembedded.org;
	Sun, 14 Apr 2013 17:17:14 +0200
Received: by mail-ea0-f176.google.com with SMTP id h10so1802082eaj.7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Apr 2013 07:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=o9hGvKu9ATVeI0ezITO/KYGvpAmA5Otu47EzBurGZiI=;
	b=gLKYcNBHk3ITZCNJ07AX6CIYSOg3XvZ/oLLGsA/FvK57hgUjgQk9XOhg7TDk01yYFr
	RtvOrfmS7vd+cQngtTwhRL5oB4BdST02kAw+EJ4DoACWIJ9ub2+j++ijMbN6sFUwa4/v
	CDhXz34CeYyr5X1UBqDLP2+3/CwcHKXzvT4sqIfJZ66RbI6gLS+Q/z5v/kGOoQ1mEWTy
	uiI0lcYyGdhXcyNqmRTzXQnN9TEJ8S0la8SlReG5yr38TPIa4bahyfF9mk+To9uyFUVJ
	ESdFxT7usUgMF+PeTZgjDPdQFidYZ+TFC2M1D4A1emB5AkE6FN+QuFM1o3kTT86n/txy
	oivw==
X-Received: by 10.15.98.66 with SMTP id bi42mr30463081eeb.39.1365951587003;
	Sun, 14 Apr 2013 07:59:47 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id d47sm21904916eem.9.2013.04.14.07.59.46
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sun, 14 Apr 2013 07:59:46 -0700 (PDT)
Date: Sun, 14 Apr 2013 16:59:51 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Message-ID: <20130414145951.GE2475@jama>
References: <1365947722-16267-1-git-send-email-koen@dominion.thruhere.net>
	<20130414140517.GA2475@jama>
	<7E440FB0-F32A-4E9F-A849-339B3102CF7C@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <7E440FB0-F32A-4E9F-A849-339B3102CF7C@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCH] systemd: remove udev-extraconf from RRECOMMENDS
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 14 Apr 2013 15:17:14 -0000
X-Groupsio-MsgNum: 37872
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="imjhCm/Pyz7Rq5F2"
Content-Disposition: inline

--imjhCm/Pyz7Rq5F2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 14, 2013 at 04:21:15PM +0200, Koen Kooi wrote:
>=20
> Op 14 apr. 2013, om 16:05 heeft Martin Jansa <martin.jansa@gmail.com> het=
 volgende geschreven:
>=20
> > On Sun, Apr 14, 2013 at 03:55:22PM +0200, Koen Kooi wrote:
> >> In the original udev and systemd updates these extra conf rules and sc=
ripts where removed and moved to a different recipe to avoid pulling them i=
n by default, making them opt-in. The systemd merge into oe-core regressed =
this into making it impossible to opt out of it when using package feeds fo=
r upgrades.
> >>=20
> >> Change it back to opt-in for images/packagegroups.
> >=20
> > Maybe RSUGGESTS?
>=20
> Not sure if that fixes the case where people do want it. I explicitly don=
't want this ending up in my rootfs (BAD_RRECOMMENDS might work here), but =
that doesn't work when doing 'opkg upgrade'.=20

It does not, but it will build udev-extraconf in feed and notify user
that there is "more" in case he decides to install udev-extraconf
manually.

> I'm just trying to fix regressions compared to the meta-oe udev/systemd s=
tate in 1.3 :)

I guess we all are :)

> >> ---
> >>=20
> >> Since udev-extraconf is persona non grata in angstrom I have no idea w=
hat depends on it, so please tell me what needs to get fixed after removing=
 this.
> >>=20
> >> meta/recipes-core/systemd/systemd_199.bb | 2 +-
> >> 1 file changed, 1 insertion(+), 1 deletion(-)
> >>=20
> >> diff --git a/meta/recipes-core/systemd/systemd_199.bb b/meta/recipes-c=
ore/systemd/systemd_199.bb
> >> index 0d07f85..fbf2a2f 100644
> >> --- a/meta/recipes-core/systemd/systemd_199.bb
> >> +++ b/meta/recipes-core/systemd/systemd_199.bb
> >> @@ -202,7 +202,7 @@ FILES_udev-dbg +=3D "/lib/udev/.debug"
> >>=20
> >> RDEPENDS_udev +=3D "udev-utils"
> >> RPROVIDES_udev =3D "hotplug"
> >> -RRECOMMENDS_udev +=3D "udev-extraconf udev-hwdb"
> >> +RRECOMMENDS_udev +=3D "udev-hwdb"
> >>=20
> >> FILES_udev +=3D "${base_sbindir}/udevd \
> >>                ${base_libdir}/systemd/systemd-udevd \
> >> --=20
> >> 1.8.1.4
> >>=20
> >>=20
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> >=20
> > --=20
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--imjhCm/Pyz7Rq5F2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFqxGcACgkQN1Ujt2V2gBzYJQCgm5z41XsAB/bmXOTWKgsKm9Ve
uZoAn3kulvghBjipopf3L8Hiuf2fVNkc
=q78J
-----END PGP SIGNATURE-----

--imjhCm/Pyz7Rq5F2--
