Return-Path: <rebecca.swee.fun.chang@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 8844660DD7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Oct 2014 01:14:13 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 12 Oct 2014 18:07:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,707,1406617200"; d="scan'208";a="617444407"
Received: from pgsmsx101.gar.corp.intel.com ([10.221.44.78])
	by orsmga002.jf.intel.com with ESMTP; 12 Oct 2014 18:14:12 -0700
Received: from pgsmsx104.gar.corp.intel.com (10.221.44.91) by
	PGSMSX101.gar.corp.intel.com (10.221.44.78) with Microsoft SMTP Server
	(TLS) id 14.3.195.1; Mon, 13 Oct 2014 09:11:38 +0800
Received: from pgsmsx108.gar.corp.intel.com ([169.254.8.26]) by
	PGSMSX104.gar.corp.intel.com ([169.254.3.16]) with mapi id
	14.03.0195.001; Mon, 13 Oct 2014 09:11:38 +0800
From: "Chang, Rebecca Swee Fun" <rebecca.swee.fun.chang@intel.com>
To: "Kamble, Nitin A" <nitin.a.kamble@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [daisy] [PATCH 1/1] lttng-modules: Update to version
	2.4.2
Thread-Index: AQHP3uiVJrdQX8K3k0CVTMjcKZkDzJwebBgAgA7bA5A=
Date: Mon, 13 Oct 2014 01:11:37 +0000
Message-ID: <50B33AC5ED75F74F991980326F1C438D0FBECBE0@PGSMSX108.gar.corp.intel.com>
References: <1412326818-32462-1-git-send-email-rebecca.swee.fun.chang@intel.com>
	<1412326818-32462-2-git-send-email-rebecca.swee.fun.chang@intel.com>
	<D0546E97.6E12%nitin.a.kamble@intel.com>
In-Reply-To: <D0546E97.6E12%nitin.a.kamble@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.30.20.205]
MIME-Version: 1.0
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: Re: [daisy] [PATCH 1/1] lttng-modules: Update to version 2.4.2
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
X-List-Received-Date: Mon, 13 Oct 2014 01:14:20 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Kamble, Nitin A
> Sent: 04 October, 2014 6:19 AM
> To: Chang, Rebecca Swee Fun; openembedded-core@lists.openembedded.org
> Cc: Ong, Boon Leong; Zanussi, Tom; Darren Hart
> Subject: Re: [OE-core] [daisy] [PATCH 1/1] lttng-modules: Update to versi=
on
> 2.4.2
>=20
>=20
>=20
> On 10/3/14, 2:00 AM, "Chang, Rebecca Swee Fun"
> <rebecca.swee.fun.chang@intel.com> wrote:
>=20
> >lttng-modules breaks when building with kernel 3.10.43.
> >This updates lttng-modules for 2.4.2 and it will also fixes the build
> >failure with kernel 3.10.43.
> >
> >Fixes for [YOCTO #6788]
> >
> >Signed-off-by: Chang Rebecca Swee Fun
> ><rebecca.swee.fun.chang@intel.com>
> >---
> > meta/recipes-kernel/lttng/lttng-modules_2.4.0.bb |   38
> >----------------------
> > meta/recipes-kernel/lttng/lttng-modules_2.4.2.bb |   38
> >++++++++++++++++++++++
> > 2 files changed, 38 insertions(+), 38 deletions(-) delete mode 100644
> > meta/recipes-kernel/lttng/lttng-modules_2.4.0.bb
> > create mode 100644 meta/recipes-kernel/lttng/lttng-modules_2.4.2.bb
> >
> >diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.4.0.bb
> >b/meta/recipes-kernel/lttng/lttng-modules_2.4.0.bb
> >deleted file mode 100644
> >index aa01a8d..0000000
> >--- a/meta/recipes-kernel/lttng/lttng-modules_2.4.0.bb
> >+++ /dev/null
> >@@ -1,38 +0,0 @@
> >-SECTION =3D "devel"
> >-SUMMARY =3D "Linux Trace Toolkit KERNEL MODULE"
> >-DESCRIPTION =3D "The lttng-modules 2.0 package contains the kernel
> >tracer modules"
> >-LICENSE =3D "LGPLv2.1 & GPLv2"
> >-LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D1412caf5a1aa90d6a48588a4794c0eac \
> >-
> >file://gpl-2.0.txt;md5=3D751419260aa954499f7abaabaa882bbe \
> >-
> >file://lgpl-2.1.txt;md5=3D243b725d71bb5df4a1e5920b344b86ad"
> >-
> >-DEPENDS =3D "virtual/kernel"
> >-
> >-inherit module
> >-
> >-SRCREV =3D "fb2c37799306d16fb590aebee6fad8be431264b7"
> >-PV =3D "2.4.0"
> >-
> >-# lttng currently blacklists arm with gcc-4.8 -COMPATIBLE_HOST =3D
> >'(x86_64|i.86|powerpc|aarch64|mips).*-linux'
> >-
> >-SRC_URI =3D "git://git.lttng.org/lttng-modules.git;branch=3Dstable-2.4 =
\
> >-           file://lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch=
 \
> >-           file://bio-bvec-iter.patch"
> If the patch is removed from SRC_URI, then it can also go from the reposi=
tory.
>=20
> Nitin

I've missed out that patch. Thanks for reminding. I will resend a v2 patch =
soon.

Rebecca

