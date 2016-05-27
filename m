Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3923262132;
	Fri, 27 May 2016 13:21:36 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id n129so14411803wmn.1;
	Fri, 27 May 2016 06:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=D26Li22IslWGw821qKxEiiiLo6gh0rbdwmDe+FFbUDQ=;
	b=d5VuVhNcXgvhRNN4j6Qu35lpMm2I5B1SgB3gvd197WfS+TNtbdM2Ly8ZS4xeHMJDMT
	NaiS4p8S28O8/WuWRhFxxcQHwxEYnDLo1uFsCeFu2M39IndVkw1upn4MUVfLizAHNjzS
	Kua47XmvS/2FVd70lVon9dlCMdLtzSi8KmbTlEm6G6tcnFg1PJqHCjJeCeA/+egn384C
	cOVw8yXz2WNIssEHm8iy+Dm3nATNL/R3rhfz8iD8XFZv+SzvKgjRL6C2ffFJqULptrTc
	/UOrjFvwqAALLEkRsUaIWnWggRk+GgikLse9VW0737MpS9DyuRARC6Dcr0src9wXuMcG
	zSFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=D26Li22IslWGw821qKxEiiiLo6gh0rbdwmDe+FFbUDQ=;
	b=Tc48RoZgCbcB45+I2zQ3EwxauECyAHv016HMuVTCMN2tkY7lq0GW9xmNkHhrJ+iF9K
	8JHz15L+yjCABNM9f1IJ9aFcgvupc4Fn2d3YdKuEg4Yiv6qvZjiHSKi6EwTSFiYkHl4a
	YqrOYvJTKff1fuAVueBIamTZlGZafPHpCidFwb4N8Jl0A001T7ItUZjIOPTkwtAzhzgj
	4nRo8yD75kDXDwquKQd7Na5zqR0DNCxtt5PQIQ9DWeTuf+D1AOU7uimPVmUk4cmTZ2Rs
	BvtZJOf4kXrlh1AM9vpIk5lkEsmvSglDVP7c7zeBiKjkEvIxoMI+xDRd3E6BMJI+RcQW
	PKSw==
X-Gm-Message-State: ALyK8tJlr6hFeicz3UET+92wtgi4BhzrBtaI5DAaGAnB1iUTbuADIfmI29Ivo9LwnkMP4A==
X-Received: by 10.28.60.215 with SMTP id j206mr9358203wma.82.1464355296931;
	Fri, 27 May 2016 06:21:36 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	dd7sm19412150wjb.22.2016.05.27.06.21.33
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 27 May 2016 06:21:33 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 27 May 2016 15:22:01 +0200
To: openembedded-core@lists.openembedded.org,
	Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20160527132201.GD2570@jama>
References: <20160511093456.15363.8004@opal.openembedded.org>
	<20160511093459.4336E5043D@opal.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <20160511093459.4336E5043D@opal.openembedded.org>
User-Agent: Mutt/1.6.1 (2016-04-27)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] [openembedded-core] 09/12: classes/insane: do not force LIC_FILES_CHKSUM unless SRC_URI is set
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
X-List-Received-Date: Fri, 27 May 2016 13:21:37 -0000
X-Groupsio-MsgNum: 82789
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XvKFcGCOAo53UbWW"
Content-Disposition: inline

--XvKFcGCOAo53UbWW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 11, 2016 at 09:35:05AM +0000, git@git.openembedded.org wrote:
> rpurdie pushed a commit to branch master
> in repository openembedded-core.
>=20
> commit c269547ae8e90a78349f6003385137e4145e145f
> Author: Paul Eggleton <paul.eggleton@linux.intel.com>
> AuthorDate: Tue May 10 10:25:05 2016 +1200
>=20
>     classes/insane: do not force LIC_FILES_CHKSUM unless SRC_URI is set
>    =20
>     Recipes such as images and packagegroups don't actually fetch or build
>     any source, so there's really no point having LIC_FILES_CHKSUM set.
>     Forcing users to set it (as we have done for images inheriting
>     image.bbclass) just makes things more difficult for the user for no
>     discernable benefit. The easiest way to adjust this check is simply to
>     skip it if SRC_URI is not set since this is a pretty good indicator t=
hat
>     no source is being pulled in.

I'm not sure which recent change caused it, but can we keep the QA issues
stored in qa.log to contain all important information on single line
which ends with [check-name]? (it can have more details on preceeding lines
like installed-not-packaged check)

The qa.log from last world build is missing many line-feeds and
[license-checksum] are hard to read (even worse to parse automatically)

see:
http://logs.nslu2-linux.org/buildlogs/oe/world//log.world.qemuarm.20160523_=
030221.log//qa.log

libnewt-0.52.18: /usr/bin/whiptail contained in package whiptail requires l=
ibnewt.so, but no providers found in RDEPENDS_whiptail? [file-rdeps]qtwayla=
nd-5.6.99+5.7.0-beta+gitAUTOINC+d27075a3f9: qtwayland-plugins rdepends on l=
ibxcomposite, but it isn't a build dependency, missing libxcomposite in DEP=
ENDS or PACKAGECONFIG? [build-deps]gnome-menus-2.30.5: /usr/bin/gmenu-simpl=
e-editor contained in package gnome-menus requires /home/jenkins/oe/world/s=
hr-core/tmp-glibc/sysroots/x86_64-linux/usr/bin/python-native/python, but n=
o providers found in RDEPENDS_gnome-menus? [file-rdeps]networkmanager-1.0.1=
0: /usr/bin/nmtui-connect contained in package networkmanager-nmtui require=
s libnewt.so, but no providers found in RDEPENDS_networkmanager-nmtui? [fil=
e-rdeps]samba-4.4.2: samba rdepends on libpam, but it isn't a build depende=
ncy, missing libpam in DEPENDS or PACKAGECONFIG? [build-deps]xfsprogs-3.2.3=
: /usr/sbin/xfs_db contained in package xfsprogs requires libxfs.so.0, but =
no providers found in RDEPENDS_xfsprogs? [file-rdeps]xfsprogs-3.2.3: /sbin/=
mkfs.xfs contained in package xfsprogs-mkfs requires libxfs.so.0, but no pr=
oviders found in RDEPENDS_xfsprogs-mkfs? [file-rdeps]chkconfig-1.3.58: /usr=
/sbin/ntsysv contained in package chkconfig requires libnewt.so, but no pro=
viders found in RDEPENDS_chkconfig? [file-rdeps]numptyphysics-0.2+svnr109: =
/usr/share/numptyphysics/convert_all.sh contained in package numptyphysics =
requires /bin/bash, but no providers found in RDEPENDS_numptyphysics? [file=
-rdeps]qtcharts-5.6.99+5.7.0-beta+gitAUTOINC+8a78184181: qtcharts-examples =
rdepends on qtmultimedia, but it isn't a build dependency, missing qtmultim=
edia in DEPENDS or PACKAGECONFIG? [build-deps]libmodule-build-perl-0.31: /u=
sr/bin/config_data contained in package libmodule-build-perl requires /home=
/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/bin/perl-nat=
ive/perl.real, but no providers found in RDEPENDS_libmodule-build-perl? [fi=
le-rdeps]dvb-apps-1.1.1: /usr/bin/dvbdate contained in package dvbdate requ=
ires libucsi.so, but no providers found in RDEPENDS_dvbdate? [file-rdeps]dv=
b-apps-1.1.1: /usr/bin/dvbtraffic contained in package dvbtraffic requires =
libdvbapi.so, but no providers found in RDEPENDS_dvbtraffic? [file-rdeps]dv=
b-apps-1.1.1: /usr/bin/dvbscan contained in package dvb-scan requires libdv=
bapi.so, but no providers found in RDEPENDS_dvb-scan? [file-rdeps]dvb-apps-=
1.1.1: /usr/bin/gotox contained in package dvb-apps requires libdvbapi.so, =
but no providers found in RDEPENDS_dvb-apps? [file-rdeps]dvb-apps-1.1.1: /u=
sr/bin/femon contained in package dvb-femon requires libdvbapi.so, but no p=
roviders found in RDEPENDS_dvb-femon? [file-rdeps]dvb-apps-1.1.1: /usr/bin/=
dvbnet contained in package dvbnet requires libdvbapi.so, but no providers =
found in RDEPENDS_dvbnet? [file-rdeps]libnewt-python-0.52.18: /usr/lib/pyth=
on2.7/site-packages/_snack.so contained in package libnewt-python requires =
libnewt.so, but no providers found in RDEPENDS_libnewt-python? [file-rdeps]=
packagegroup-tools-bluetooth-1.0: packagegroup-tools-bluetooth: The LIC_FIL=
ES_CHKSUM does not match for file:///home/jenkins/oe/world/shr-core/openemb=
edded-core/LICENSE;md5=3D3f40d7994397109285ec7b81fdeb3b58
packagegroup-tools-bluetooth: The new md5 checksum is 4d92cd373abda3937c2bc=
47fbc49d690
packagegroup-tools-bluetooth: Check if the license information has changed =
in /home/jenkins/oe/world/shr-core/openembedded-core/LICENSE to verify that=
 the LICENSE value "MIT" remains valid [license-checksum]ubx-utils-0.0.0+gi=
trAUTOINC+b63c0932dd: /usr/bin/memory-map.sh contained in package ubx-utils=
 requires /bin/bash, but no providers found in RDEPENDS_ubx-utils? [file-rd=
eps]

>     Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
>     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes/insane.bbclass | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index 097dc3a..0b151c2 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -681,15 +681,15 @@ python populate_lic_qa_checksum() {
>      import tempfile
>      sane =3D True
> =20
> -    lic_files =3D d.getVar('LIC_FILES_CHKSUM', True)
> +    lic_files =3D d.getVar('LIC_FILES_CHKSUM', True) or ''
>      lic =3D d.getVar('LICENSE', True)
>      pn =3D d.getVar('PN', True)
> =20
>      if lic =3D=3D "CLOSED":
>          return
> =20
> -    if not lic_files:
> -        package_qa_handle_error("license-checksum", pn + ": Recipe file =
does not have license file information (LIC_FILES_CHKSUM)", d)
> +    if not lic_files and d.getVar('SRC_URI', True):
> +        package_qa_handle_error("license-checksum", pn + ": Recipe file =
fetches files and does not have license file information (LIC_FILES_CHKSUM)=
", d)
>          return
> =20
>      srcdir =3D d.getVar('S', True)
>=20
> --=20
> To stop receiving notification emails like this one, please contact
> the administrator of this repository.
> --=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--XvKFcGCOAo53UbWW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAldISfgACgkQN1Ujt2V2gBw90ACgga5MJl3dZ6ONJeDcs1vPp0mv
J+kAn0MAqRSYpUmPhpGeyqzrf42BIBAu
=i9ay
-----END PGP SIGNATURE-----

--XvKFcGCOAo53UbWW--
