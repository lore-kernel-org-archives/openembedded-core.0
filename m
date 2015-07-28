Return-Path: <cristian.iorga@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 0C8F360167
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 14:33:38 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 28 Jul 2015 07:33:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,563,1432623600"; d="scan'208";a="772825003"
Received: from irsmsx106.ger.corp.intel.com ([163.33.3.31])
	by orsmga002.jf.intel.com with ESMTP; 28 Jul 2015 07:33:38 -0700
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.223]) by
	IRSMSX106.ger.corp.intel.com ([169.254.8.137]) with mapi id
	14.03.0224.002; Tue, 28 Jul 2015 15:33:36 +0100
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Thread-Topic: [OE-core] [PATCH 3/3] qemu_git.bb: remove it
Thread-Index: AQHQyRScwNnEnEHPQUW8YQJX/5MTGJ3w6ZRg///zXoCAABQq8A==
Date: Tue, 28 Jul 2015 14:33:35 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB44B6C0FD@irsmsx105.ger.corp.intel.com>
References: <cover.1438074266.git.liezhi.yang@windriver.com>
	<d2fde8961c75893e53e9cacdbadcfedf69bcca3b.1438074266.git.liezhi.yang@windriver.com>
	<969F26A8BAB325438E7EB80D3C3134FB44B6C087@irsmsx105.ger.corp.intel.com>
	<20150728141603.GC2465@jama>
In-Reply-To: <20150728141603.GC2465@jama>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.181]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] qemu_git.bb: remove it
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
X-List-Received-Date: Tue, 28 Jul 2015 14:33:40 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I am not in the habit of talking without knowing. Usually.
There might be exceptions. This is not one.
That being said, I was able to switch to qemu git recipe (instead of the ta=
rball releases) and make it work for a git head just before 2.4.0RC0 in und=
er 20 minutes.
The patch was not submitted for inclusion into master however.
I am not sure why the git recipe bothers everyone that much in this specifi=
c case, when I just explained that it was quite useful for me (and by exten=
sion, to the project).
Thanks,
Cristian

-----Original Message-----
From: Martin Jansa [mailto:martin.jansa@gmail.com]=20
Sent: Tuesday, July 28, 2015 5:16 PM
To: Iorga, Cristian
Cc: Yang, Liezhi (Wind River); openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 3/3] qemu_git.bb: remove it

On Tue, Jul 28, 2015 at 02:04:28PM +0000, Iorga, Cristian wrote:
> Hi Robert,
>=20
> Hmm,
> Qemu git recipe is useful, and is close to being up to date, why to remov=
e it??

Close to being up to date? Aren't you talking about ./meta/recipes-devtools=
/qemu/qemu_2.4.0-rc2.bb?

bitbake@jama:/OE/webos/ow/oe-core$ find . -name qemu\*bb -exec grep PV.*=3D=
 {} \; REALPV =3D "2.4.0-rc2"
PV =3D "2.3.99+${REALPV}"
PV =3D "1.3.0+git${SRCPV}"

As Robert said, 1.3 version is old and current qemu_git recipe broken, beca=
use 04024dea2674861fcf13582a77b58130c67fccd8 isn't in master branch anymore=
 after it was moved to stable-1.3 branch:

bitbake@jama:/OE/projects/qemu$ git branch -a --contains 04024dea2674861fcf=
13582a77b58130c67fccd8
  remotes/origin/stable-1.3

> Qemu brakes quite often, as seen recently on autobuilders, building=20
> from git allowed us to move forward (although it is true that the git upg=
rade was not integrated into master.) I vote against this patch.

Regards,
>=20
> Thanks,
> Cristian
>=20
> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org=20
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of=20
> Robert Yang
> Sent: Tuesday, July 28, 2015 12:05 PM
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 3/3] qemu_git.bb: remove it
>=20
> Remove it since we have 2.4.0, the git version is 1.3 can't be built=20
> by
> deafult:
> ERROR: Fetcher failure: Unable to find revision=20
> 04024dea2674861fcf13582a77b58130c67fccd8 in branch master even from=20
> upstream
>=20
> We can fix it, but seems that no one uses it any more.
>=20
> And move patches from "files" dir to "qemu" dir.
>=20
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  ...-Arm-versatilepb-Add-memory-size-checking.patch |    0
>  .../exclude-some-arm-EABI-obsolete-syscalls.patch  |    0
>  .../qemu-enlarge-env-entry-size.patch              |    0
>  meta/recipes-devtools/qemu/qemu_git.bb             |   15 --------------=
-
>  4 files changed, 15 deletions(-)
>  rename meta/recipes-devtools/qemu/{files =3D>=20
> qemu}/Qemu-Arm-versatilepb-Add-memory-size-checking.patch (100%) =20
> rename meta/recipes-devtools/qemu/{files =3D>=20
> qemu}/exclude-some-arm-EABI-obsolete-syscalls.patch (100%)  rename=20
> meta/recipes-devtools/qemu/{files =3D>=20
> qemu}/qemu-enlarge-env-entry-size.patch (100%)  delete mode 100644=20
> meta/recipes-devtools/qemu/qemu_git.bb
>=20
> diff --git=20
> a/meta/recipes-devtools/qemu/files/Qemu-Arm-versatilepb-Add-memory-siz
> e-checking.patch=20
> b/meta/recipes-devtools/qemu/qemu/Qemu-Arm-versatilepb-Add-memory-size
> -checking.patch
> similarity index 100%
> rename from=20
> meta/recipes-devtools/qemu/files/Qemu-Arm-versatilepb-Add-memory-size-
> checking.patch rename to=20
> meta/recipes-devtools/qemu/qemu/Qemu-Arm-versatilepb-Add-memory-size-c
> hecking.patch diff --git=20
> a/meta/recipes-devtools/qemu/files/exclude-some-arm-EABI-obsolete-sysc
> alls.patch=20
> b/meta/recipes-devtools/qemu/qemu/exclude-some-arm-EABI-obsolete-sysca
> lls.patch
> similarity index 100%
> rename from=20
> meta/recipes-devtools/qemu/files/exclude-some-arm-EABI-obsolete-syscal
> ls.patch rename to=20
> meta/recipes-devtools/qemu/qemu/exclude-some-arm-EABI-obsolete-syscall
> s.patch diff --git=20
> a/meta/recipes-devtools/qemu/files/qemu-enlarge-env-entry-size.patch=20
> b/meta/recipes-devtools/qemu/qemu/qemu-enlarge-env-entry-size.patch
> similarity index 100%
> rename from=20
> meta/recipes-devtools/qemu/files/qemu-enlarge-env-entry-size.patch
> rename to=20
> meta/recipes-devtools/qemu/qemu/qemu-enlarge-env-entry-size.patch
> diff --git a/meta/recipes-devtools/qemu/qemu_git.bb=20
> b/meta/recipes-devtools/qemu/qemu_git.bb
> deleted file mode 100644
> index a30932a..0000000
> --- a/meta/recipes-devtools/qemu/qemu_git.bb
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -require qemu.inc
> -
> -SRCREV =3D "04024dea2674861fcf13582a77b58130c67fccd8"
> -
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D441c28d2cf86e15a37fa47e15a72f=
bac \
> -                    file://COPYING.LIB;endline=3D24;md5=3Dc04def7ae38850=
e7d3ef548588159913"
> -
> -PV =3D "1.3.0+git${SRCPV}"
> -
> -SRC_URI_prepend =3D "git://git.qemu.org/qemu.git"
> -S =3D "${WORKDIR}/git"
> -
> -DEFAULT_PREFERENCE =3D "-1"
> -
> -COMPATIBLE_HOST_class-target_mips64 =3D "null"
> --
> 1.7.9.5
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

