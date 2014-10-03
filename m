Return-Path: <nitin.a.kamble@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id E52A3601A8
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Oct 2014 22:19:27 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 03 Oct 2014 15:19:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,650,1406617200"; d="scan'208";a="609470715"
Received: from orsmsx104.amr.corp.intel.com ([10.22.225.131])
	by fmsmga002.fm.intel.com with ESMTP; 03 Oct 2014 15:18:54 -0700
Received: from orsmsx112.amr.corp.intel.com (10.22.240.13) by
	ORSMSX104.amr.corp.intel.com (10.22.225.131) with Microsoft SMTP Server
	(TLS) id 14.3.195.1; Fri, 3 Oct 2014 15:18:53 -0700
Received: from orsmsx103.amr.corp.intel.com ([169.254.2.106]) by
	ORSMSX112.amr.corp.intel.com ([169.254.12.175]) with mapi id
	14.03.0195.001; Fri, 3 Oct 2014 15:18:53 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: "Chang, Rebecca Swee Fun" <rebecca.swee.fun.chang@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [daisy] [PATCH 1/1] lttng-modules: Update to version
	2.4.2
Thread-Index: AQHP3uiU0f0F6vzsKUGcZ9dykGfjsZwe8lCA
Date: Fri, 3 Oct 2014 22:18:52 +0000
Message-ID: <D0546E97.6E12%nitin.a.kamble@intel.com>
References: <1412326818-32462-1-git-send-email-rebecca.swee.fun.chang@intel.com>
	<1412326818-32462-2-git-send-email-rebecca.swee.fun.chang@intel.com>
In-Reply-To: <1412326818-32462-2-git-send-email-rebecca.swee.fun.chang@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/14.4.4.140807
x-originating-ip: [10.254.11.173]
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
X-List-Received-Date: Fri, 03 Oct 2014 22:19:29 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F92D90138B336D44B42EAECC7147559D@intel.com>
Content-Transfer-Encoding: quoted-printable



On 10/3/14, 2:00 AM, "Chang, Rebecca Swee Fun"
<rebecca.swee.fun.chang@intel.com> wrote:

>lttng-modules breaks when building with kernel 3.10.43.
>This updates lttng-modules for 2.4.2 and it will also
>fixes the build failure with kernel 3.10.43.
>
>Fixes for [YOCTO #6788]
>
>Signed-off-by: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
>---
> meta/recipes-kernel/lttng/lttng-modules_2.4.0.bb |   38
>----------------------
> meta/recipes-kernel/lttng/lttng-modules_2.4.2.bb |   38
>++++++++++++++++++++++
> 2 files changed, 38 insertions(+), 38 deletions(-)
> delete mode 100644 meta/recipes-kernel/lttng/lttng-modules_2.4.0.bb
> create mode 100644 meta/recipes-kernel/lttng/lttng-modules_2.4.2.bb
>
>diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.4.0.bb
>b/meta/recipes-kernel/lttng/lttng-modules_2.4.0.bb
>deleted file mode 100644
>index aa01a8d..0000000
>--- a/meta/recipes-kernel/lttng/lttng-modules_2.4.0.bb
>+++ /dev/null
>@@ -1,38 +0,0 @@
>-SECTION =3D "devel"
>-SUMMARY =3D "Linux Trace Toolkit KERNEL MODULE"
>-DESCRIPTION =3D "The lttng-modules 2.0 package contains the kernel tracer
>modules"
>-LICENSE =3D "LGPLv2.1 & GPLv2"
>-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D1412caf5a1aa90d6a48588a4794c0e=
ac \
>-                =20
>file://gpl-2.0.txt;md5=3D751419260aa954499f7abaabaa882bbe \
>-                =20
>file://lgpl-2.1.txt;md5=3D243b725d71bb5df4a1e5920b344b86ad"
>-
>-DEPENDS =3D "virtual/kernel"
>-
>-inherit module
>-
>-SRCREV =3D "fb2c37799306d16fb590aebee6fad8be431264b7"
>-PV =3D "2.4.0"
>-
>-# lttng currently blacklists arm with gcc-4.8
>-COMPATIBLE_HOST =3D '(x86_64|i.86|powerpc|aarch64|mips).*-linux'
>-
>-SRC_URI =3D "git://git.lttng.org/lttng-modules.git;branch=3Dstable-2.4 \
>-           file://lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch \
>-           file://bio-bvec-iter.patch"
If the patch is removed from SRC_URI, then it can also go from the
repository.

Nitin


>-
>-export INSTALL_MOD_DIR=3D"kernel/lttng-modules"
>-export KERNEL_SRC=3D"${STAGING_KERNEL_DIR}"
>-
>-
>-S =3D "${WORKDIR}/git"
>-
>-do_install_append() {
>-	# Delete empty directories to avoid QA failures if no modules were built
>-	find ${D}/lib -depth -type d -empty -exec rmdir {} \;
>-}
>-
>-python do_package_prepend() {
>-    if not os.path.exists(os.path.join(d.getVar('D', True),
>'lib/modules')):
>-        bb.warn("%s: no modules were created; this may be due to
>CONFIG_TRACEPOINTS not being enabled in your kernel." % d.getVar('PN',
>True))
>-}
>-
>diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.4.2.bb
>b/meta/recipes-kernel/lttng/lttng-modules_2.4.2.bb
>new file mode 100644
>index 0000000..1967631
>--- /dev/null
>+++ b/meta/recipes-kernel/lttng/lttng-modules_2.4.2.bb
>@@ -0,0 +1,38 @@
>+SECTION =3D "devel"
>+SUMMARY =3D "Linux Trace Toolkit KERNEL MODULE"
>+DESCRIPTION =3D "The lttng-modules 2.0 package contains the kernel tracer
>modules"
>+LICENSE =3D "LGPLv2.1 & GPLv2"
>+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D1412caf5a1aa90d6a48588a4794c0e=
ac \
>+                =20
>file://gpl-2.0.txt;md5=3D751419260aa954499f7abaabaa882bbe \
>+                =20
>file://lgpl-2.1.txt;md5=3D243b725d71bb5df4a1e5920b344b86ad"
>+
>+DEPENDS =3D "virtual/kernel"
>+
>+inherit module
>+
>+SRCREV =3D "85016adfb21268836df48dfb5cda106391e72fd1"
>+PV =3D "2.4.2"
>+
>+# lttng currently blacklists arm with gcc-4.8
>+COMPATIBLE_HOST =3D '(x86_64|i.86|powerpc|aarch64|mips).*-linux'
>+
>+SRC_URI =3D "git://git.lttng.org/lttng-modules.git;branch=3Dstable-2.4 \
>+           file://lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch \
>+           "
>+
>+export INSTALL_MOD_DIR=3D"kernel/lttng-modules"
>+export KERNEL_SRC=3D"${STAGING_KERNEL_DIR}"
>+
>+
>+S =3D "${WORKDIR}/git"
>+
>+do_install_append() {
>+	# Delete empty directories to avoid QA failures if no modules were built
>+	find ${D}/lib -depth -type d -empty -exec rmdir {} \;
>+}
>+
>+python do_package_prepend() {
>+    if not os.path.exists(os.path.join(d.getVar('D', True),
>'lib/modules')):
>+        bb.warn("%s: no modules were created; this may be due to
>CONFIG_TRACEPOINTS not being enabled in your kernel." % d.getVar('PN',
>True))
>+}
>+
>--=20
>1.7.9.5
>


