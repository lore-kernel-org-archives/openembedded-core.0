Return-Path: <cristian.iorga@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 1D1D8761D3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 14:04:37 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 28 Jul 2015 07:04:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,563,1432623600"; d="scan'208";a="772803846"
Received: from irsmsx102.ger.corp.intel.com ([163.33.3.155])
	by orsmga002.jf.intel.com with ESMTP; 28 Jul 2015 07:04:29 -0700
Received: from irsmsx155.ger.corp.intel.com (163.33.192.3) by
	IRSMSX102.ger.corp.intel.com (163.33.3.155) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Tue, 28 Jul 2015 15:04:28 +0100
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.223]) by
	irsmsx155.ger.corp.intel.com ([169.254.14.43]) with mapi id
	14.03.0224.002; Tue, 28 Jul 2015 15:04:28 +0100
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: "Yang, Liezhi (Wind River)" <liezhi.yang@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 3/3] qemu_git.bb: remove it
Thread-Index: AQHQyRScwNnEnEHPQUW8YQJX/5MTGJ3w6ZRg
Date: Tue, 28 Jul 2015 14:04:28 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB44B6C087@irsmsx105.ger.corp.intel.com>
References: <cover.1438074266.git.liezhi.yang@windriver.com>
	<d2fde8961c75893e53e9cacdbadcfedf69bcca3b.1438074266.git.liezhi.yang@windriver.com>
In-Reply-To: <d2fde8961c75893e53e9cacdbadcfedf69bcca3b.1438074266.git.liezhi.yang@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.181]
MIME-Version: 1.0
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
X-List-Received-Date: Tue, 28 Jul 2015 14:04:38 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Robert,

Hmm,
Qemu git recipe is useful, and is close to being up to date, why to remove =
it??
Qemu brakes quite often, as seen recently on autobuilders, building from gi=
t allowed us to move forward (although it is true that the git upgrade was =
not integrated into master.)
I vote against this patch.

Thanks,
Cristian

-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Robert Yang
Sent: Tuesday, July 28, 2015 12:05 PM
To: openembedded-core@lists.openembedded.org
Subject: [OE-core] [PATCH 3/3] qemu_git.bb: remove it

Remove it since we have 2.4.0, the git version is 1.3 can't be built by
deafult:
ERROR: Fetcher failure: Unable to find revision 04024dea2674861fcf13582a77b=
58130c67fccd8 in branch master even from upstream

We can fix it, but seems that no one uses it any more.

And move patches from "files" dir to "qemu" dir.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...-Arm-versatilepb-Add-memory-size-checking.patch |    0
 .../exclude-some-arm-EABI-obsolete-syscalls.patch  |    0
 .../qemu-enlarge-env-entry-size.patch              |    0
 meta/recipes-devtools/qemu/qemu_git.bb             |   15 ---------------
 4 files changed, 15 deletions(-)
 rename meta/recipes-devtools/qemu/{files =3D> qemu}/Qemu-Arm-versatilepb-A=
dd-memory-size-checking.patch (100%)  rename meta/recipes-devtools/qemu/{fi=
les =3D> qemu}/exclude-some-arm-EABI-obsolete-syscalls.patch (100%)  rename=
 meta/recipes-devtools/qemu/{files =3D> qemu}/qemu-enlarge-env-entry-size.p=
atch (100%)  delete mode 100644 meta/recipes-devtools/qemu/qemu_git.bb

diff --git a/meta/recipes-devtools/qemu/files/Qemu-Arm-versatilepb-Add-memo=
ry-size-checking.patch b/meta/recipes-devtools/qemu/qemu/Qemu-Arm-versatile=
pb-Add-memory-size-checking.patch
similarity index 100%
rename from meta/recipes-devtools/qemu/files/Qemu-Arm-versatilepb-Add-memor=
y-size-checking.patch
rename to meta/recipes-devtools/qemu/qemu/Qemu-Arm-versatilepb-Add-memory-s=
ize-checking.patch
diff --git a/meta/recipes-devtools/qemu/files/exclude-some-arm-EABI-obsolet=
e-syscalls.patch b/meta/recipes-devtools/qemu/qemu/exclude-some-arm-EABI-ob=
solete-syscalls.patch
similarity index 100%
rename from meta/recipes-devtools/qemu/files/exclude-some-arm-EABI-obsolete=
-syscalls.patch
rename to meta/recipes-devtools/qemu/qemu/exclude-some-arm-EABI-obsolete-sy=
scalls.patch
diff --git a/meta/recipes-devtools/qemu/files/qemu-enlarge-env-entry-size.p=
atch b/meta/recipes-devtools/qemu/qemu/qemu-enlarge-env-entry-size.patch
similarity index 100%
rename from meta/recipes-devtools/qemu/files/qemu-enlarge-env-entry-size.pa=
tch
rename to meta/recipes-devtools/qemu/qemu/qemu-enlarge-env-entry-size.patch
diff --git a/meta/recipes-devtools/qemu/qemu_git.bb b/meta/recipes-devtools=
/qemu/qemu_git.bb
deleted file mode 100644
index a30932a..0000000
--- a/meta/recipes-devtools/qemu/qemu_git.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-require qemu.inc
-
-SRCREV =3D "04024dea2674861fcf13582a77b58130c67fccd8"
-
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D441c28d2cf86e15a37fa47e15a72fba=
c \
-                    file://COPYING.LIB;endline=3D24;md5=3Dc04def7ae38850e7=
d3ef548588159913"
-
-PV =3D "1.3.0+git${SRCPV}"
-
-SRC_URI_prepend =3D "git://git.qemu.org/qemu.git"
-S =3D "${WORKDIR}/git"
-
-DEFAULT_PREFERENCE =3D "-1"
-
-COMPATIBLE_HOST_class-target_mips64 =3D "null"
--
1.7.9.5

--
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core

