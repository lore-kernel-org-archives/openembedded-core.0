Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f182.google.com (mail-we0-f182.google.com
	[74.125.82.182])
	by mail.openembedded.org (Postfix) with ESMTP id 628AD7381B;
	Wed,  4 Mar 2015 02:23:09 +0000 (UTC)
Received: by wesw62 with SMTP id w62so43502619wes.9;
	Tue, 03 Mar 2015 18:23:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=jQE7XKyqEpIkejmps+A5mdINugHNj5bwfcNWs+s91vY=;
	b=JOJ7+/eeYxRxT9YXYMevHnZw6prWCO2J/bLsGG6ekunyUvTmtf0eRw+58FeX7XzkJH
	aJRK3a/AfvCwqBZcI4ROEmrbaUcktb0NDaLicZnDfvbHwEcj8GOuvlJDs+gKh8aMcanV
	7VjX/8ngeBxA2C95u9wL5BhIfNVij6jDE7isSlEwCiaj2SVP4mvW2MmzEmKd7eSb8b0J
	Omf2ZynEvlvEjcCs1qamWq/wKmv+8tAfBBo+mkJ0Sc79AbWkq/HRcmN/wI+/n9h16Vh+
	pzPDzVBURi3XCFn+waLR5HTkWyawqOx9xoPM5saSfe1gvdwvJEQWOUhWpoLqCGSM5JK0
	WOlw==
X-Received: by 10.194.133.196 with SMTP id pe4mr3420330wjb.76.1425435789973;
	Tue, 03 Mar 2015 18:23:09 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	yr10sm1006007wjc.0.2015.03.03.18.23.08
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 03 Mar 2015 18:23:08 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 4 Mar 2015 03:23:12 +0100
To: openembedded-core@lists.openembedded.org,
	Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <20150304022312.GF2337@jama>
References: <20150302220550.8A2F450367@opal.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <20150302220550.8A2F450367@opal.openembedded.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Bruce Ashfield : kern-tools: improve patch application performance
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
X-List-Received-Date: Wed, 04 Mar 2015 02:23:14 -0000
X-Groupsio-MsgNum: 62924
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MZf7D3rAEoQgPanC"
Content-Disposition: inline

--MZf7D3rAEoQgPanC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 02, 2015 at 10:05:50PM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: 148c78e0f5de2689de3ad9beaa9f6de618d87758
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D148c78e0f5de2689de3ad9beaa9f6de618d87758
>=20
> Author: Bruce Ashfield <bruce.ashfield@windriver.com>
> Date:   Mon Mar  2 16:36:41 2015 -0500
>=20
> kern-tools: improve patch application performance
>=20
> Update the SRCREV for the following incremental improvement in patch
> processing time:
>=20
>     kgit-meta: skip patches on non-leaf nodes
>=20
>     In a similar way as commit 0768d697 [kgit-meta: dont run kgit-s2q
>     for
>     non-leaf nodes], we can save even more processing time by not even
>     analysing and linking patches if we aren't on the leaf node of the
>     tree.
>=20
>     This early exit can save nearly 95% of the time required to "patch"
>     a tree when no changes are actually applied.
>=20
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Not sure if it's related to this, but today's world build is failing
with:

ERROR: Function failed: do_kernel_configme (log file is located at /home/je=
nkins/oe/world/shr-core/tmp-glibc/work/qemux86-oe-linux/linux-yocto/3.19+gi=
tAUTOINC+f7a81274b4_43b9eced9b-r0/temp/log.do_kernel_configme.29401)
ERROR: Logfile of failure stored in: /home/jenkins/oe/world/shr-core/tmp-gl=
ibc/work/qemux86-oe-linux/linux-yocto/3.19+gitAUTOINC+f7a81274b4_43b9eced9b=
-r0/temp/log.do_kernel_configme.29401
Log data follows:
| DEBUG: Executing shell function do_kernel_configme
| NOTE: kernel configme
| [INFO] Configuring target/machine combo: "standard/qemux86"
| [INFO] collecting configs in .meta/meta-series
| mv: cannot move `/home/jenkins/oe/world/shr-core/tmp-glibc/work/qemux86-o=
e-linux/linux-yocto/3.19+gitAUTOINC+f7a81274b4_43b9eced9b-r0/linux-qemux86-=
standard-build/.tmp.config.PKIfLNkSVj' to `.meta/cfg/standard/common-pc/qem=
ux86-standard-config-3.19': No such file or directory
| creation of pre-processed config data failed
| config of "standard/qemux86" failed
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_kernel_configme (log file is located at /home/=
jenkins/oe/world/shr-core/tmp-glibc/work/qemux86-oe-linux/linux-yocto/3.19+=
gitAUTOINC+f7a81274b4_43b9eced9b-r0/temp/log.do_kernel_configme.29401)
NOTE: recipe linux-yocto-3.19+gitAUTOINC+f7a81274b4_43b9eced9b-r0: task do_=
kernel_configme: Failed
ERROR: Task 30091 (/home/jenkins/oe/world/shr-core/openembedded-core/meta/r=
ecipes-kernel/linux/linux-yocto_3.19.bb, do_kernel_configme) failed with ex=
it code '1'

>=20
> ---
>=20
>  meta/recipes-kernel/kern-tools/kern-tools-native_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/me=
ta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> index 80d26f9..131c5e9 100644
> --- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> +++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM =3D "file://git/tools/kgit;beginline=3D5=
;endline=3D9;md5=3Dd8d1d729a70c
> =20
>  DEPENDS =3D "git-native"
> =20
> -SRCREV =3D "cab17f884998b43692244a863dea6f505c7f67af"
> +SRCREV =3D "0c51a3d02fa54726141f32824b11d0676960e0a5"
>  PR =3D "r12"
>  PV =3D "0.2+git${SRCPV}"
> =20
>=20
> --=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--MZf7D3rAEoQgPanC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlT2bJAACgkQN1Ujt2V2gBy0ZQCfYw0qQS9VTvBQZUy0UDOMbttk
v/cAniA0AWmNXrF6q3sBd13A+5dRz/cA
=O1fr
-----END PGP SIGNATURE-----

--MZf7D3rAEoQgPanC--
