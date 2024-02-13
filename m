Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51D94C4829A
	for <webhook@archiver.kernel.org>; Tue, 13 Feb 2024 11:21:54 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.9440.1707823313248806871
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Feb 2024 03:21:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=fdEdh2li;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=j22PrQkRQVCojdg4k7yRRd2PVsBIuIO8kQuwH49UQvA=; b=fdEdh2liuu9FRBddGm6kXNaI/Q
	NZy8ytWuR0tRsHaeh4cPM1vKjacpN51D5arjL00EH8kxRc9iqAIVuGUUe7jTj4i2/37Dtvva19O20
	0ztLgZIPeb/qN/TkYE/G9NLtkIeDQddbc93hACONLw2AEeLJ5TDewAPP8NlLS8Mp2s2exmGjiT0kb
	sgAwqAWihTXu8uYR9klZmYHzDQe4sTjAnpem/dGYdTblIBeCNOQBi6L/8Cs43OTjb4QZpiDIa1O8m
	W2VyjC3hmy0DHB+kNCJByu9+YmqQnKt0Zp/wul4O8NPBGJnfuEhowsvlKlz0UeE4I0Z5puGfEhig7
	SSVmLDdg==;
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.102.5]:41540 helo=fedora)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1rZqrA-00EUyc-1B;
	Tue, 13 Feb 2024 06:21:51 -0500
Date: Tue, 13 Feb 2024 06:21:38 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Ross Burton <Ross.Burton@arm.com>
cc: Alex Kiernan <alex.kiernan@gmail.com>, 
    OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] more ptest pedantry: why conditionally include
 "run-ptest" in SRC_URI?
In-Reply-To: <F448E74E-3EF8-4AED-B7C9-C61F300C0C44@arm.com>
Message-ID: <fcc9143-8ba4-7f-f9bd-b059c774d8c6@crashcourse.ca>
References: <8d71c0f-9120-85b7-80ce-d985aa557f8@crashcourse.ca> <8C7A9199-D49B-4190-9D96-F060CD858C71@arm.com> <bef4a38f-aa1e-d57b-e23-f3a059ebe313@crashcourse.ca> <CAO5Uq5Qyr7ca2rcVtRs4seSyKid58J3ZGhRHuynm-AFYgM1PXw@mail.gmail.com>
 <ac14ca2-ef63-6ee-d01b-c4ed4b65d78@crashcourse.ca> <CAO5Uq5TYipCFncPuQFBXOr4BtLUDnsXGNr5w5OsyWjxXMpEZsQ@mail.gmail.com> <F448E74E-3EF8-4AED-B7C9-C61F300C0C44@arm.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-725534526-1707823305=:409599"
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 11:21:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195389

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-725534526-1707823305=:409599
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT


On Mon, 12 Feb 2024, Ross Burton wrote:

> On 12 Feb 2024, at 15:00, Alex Kiernan <alex.kiernan@gmail.com> wrote:
> > PTEST_ENABLED is just set in ptest.bbclass:
> >
> > PTEST_ENABLED = "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', '1', '0', d)}"
> > PTEST_ENABLED:class-native = ""
> > PTEST_ENABLED:class-nativesdk = ""
> > PTEST_ENABLED:class-cross-canadian = ""
> >
> > I'd argue checking PTEST_ENABLED is the right way.
>
> Agreed, I’ve done exactly what you said before: ptest globally is
> off, but I can turn it on for specific recipes.  Or turn it on
> globally but then off for specific recipes.
>
> Ross

  here's just a first pass through oe-core, want to make sure this is
the first stage of cleanup people are talking about. if so, will
submit officially (straightforward replacement):

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index 828f618cda..e6240430db 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -1371,7 +1371,7 @@ python do_qa_patch() {
         return False

     srcdir = d.getVar('S')
-    if not bb.utils.contains('DISTRO_FEATURES', 'ptest', True, False, d):
+    if not bb.utils.contains('PTEST_ENABLED', '1', True, False, d):
         pass
     elif bb.data.inherits_class('ptest', d):
         bb.note("Package %s QA: skipping unimplemented-ptest: ptest implementation detected" % d.getVar('PN'))
diff --git a/meta/classes-recipe/packagegroup.bbclass b/meta/classes-recipe/packagegroup.bbclass
index cf6fc354a8..742fb99953 100644
--- a/meta/classes-recipe/packagegroup.bbclass
+++ b/meta/classes-recipe/packagegroup.bbclass
@@ -32,7 +32,7 @@ python () {
     packages = d.getVar('PACKAGES').split()
     if d.getVar('PACKAGEGROUP_DISABLE_COMPLEMENTARY') != '1':
         types = ['', '-dbg', '-dev']
-        if bb.utils.contains('DISTRO_FEATURES', 'ptest', True, False, d):
+        if bb.utils.contains('PTEST_ENABLED', '1', True, False, d):
             types.append('-ptest')
         packages = [pkg + suffix for pkg in packages
                     for suffix in types]
diff --git a/meta/classes-recipe/testimage.bbclass b/meta/classes-recipe/testimage.bbclass
index 281de4784f..3834b9b9bc 100644
--- a/meta/classes-recipe/testimage.bbclass
+++ b/meta/classes-recipe/testimage.bbclass
@@ -28,7 +28,7 @@ TESTIMAGE_FAILED_QA_ARTIFACTS = "\
     ${sysconfdir}/os-release"

 # If some ptests are run and fail, retrieve corresponding directories
-TESTIMAGE_FAILED_QA_ARTIFACTS += "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', '${libdir}/${MCNAME}/ptest', '', d)}"
+TESTIMAGE_FAILED_QA_ARTIFACTS += "${@bb.utils.contains('PTEST_ENABLED', '1', '${libdir}/${MCNAME}/ptest', '', d)}"

 # You can set (or append to) TEST_SUITES in local.conf to select the tests
 # which you want to run for your target.
diff --git a/meta/recipes-devtools/lua/lua_5.4.6.bb b/meta/recipes-devtools/lua/lua_5.4.6.bb
index eabfc89575..6420b2231b 100644
--- a/meta/recipes-devtools/lua/lua_5.4.6.bb
+++ b/meta/recipes-devtools/lua/lua_5.4.6.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "http://www.lua.org/"

 SRC_URI = "http://www.lua.org/ftp/lua-${PV}.tar.gz;name=tarballsrc \
            file://lua.pc.in \
-           ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'http://www.lua.org/tests/lua-${PV_testsuites}-tests.tar.gz;name=tarballtest file://run-ptest ', '', d)} \
+           ${@bb.utils.contains('PTEST_ENABLED', '1', 'http://www.lua.org/tests/lua-${PV_testsuites}-tests.tar.gz;name=tarballtest file://run-ptest ', '', d)} \
            "

 # if no test suite matches PV release of Lua exactly, download the suite for the closest Lua release.
diff --git a/meta/recipes-devtools/perl/perl-ptest.inc b/meta/recipes-devtools/perl/perl-ptest.inc
index e07355d3f5..98d7b1c2a2 100644
--- a/meta/recipes-devtools/perl/perl-ptest.inc
+++ b/meta/recipes-devtools/perl/perl-ptest.inc
@@ -51,7 +51,7 @@ python populate_packages:prepend() {
     # Put all *.t files from the lib dir in the ptest package
     # do_split_packages requires a pair of () in the regex, but we have nothing
     # to match, so use an empty pair.
-    if bb.utils.contains('DISTRO_FEATURES', 'ptest', True, False, d):
+    if bb.utils.contains('PTEST_ENABLED', '1', True, False, d):
         do_split_packages(d, d.expand('${libdir}/perl/${PV}'), r'.*\.t()',
             '${PN}-ptest%s', '%s', recursive=True, match_path=True)
 }
diff --git a/meta/recipes-devtools/python/python3-bcrypt_4.1.2.bb b/meta/recipes-devtools/python/python3-bcrypt_4.1.2.bb
index 860f291476..f7a184be9a 100644
--- a/meta/recipes-devtools/python/python3-bcrypt_4.1.2.bb
+++ b/meta/recipes-devtools/python/python3-bcrypt_4.1.2.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8f7bb094c7232b058c7e9f2e431f389c"
 HOMEPAGE = "https://pypi.org/project/bcrypt/"

 DEPENDS += "${PYTHON_PN}-cffi-native"
-LDFLAGS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', ' -fuse-ld=bfd', '', d)}"
+LDFLAGS:append = "${@bb.utils.contains('PTEST_ENABLED', '1', ' -fuse-ld=bfd', '', d)}"

 SRC_URI[sha256sum] = "33313a1200a3ae90b75587ceac502b048b840fc69e7f7a0905b5f87fac7a1258"

diff --git a/meta/recipes-devtools/valgrind/valgrind_3.21.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.21.0.bb
index 67a197c509..47a873df31 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.21.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.21.0.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.DOCS;md5=24ea4c7092233849b4394699333b5c56"

 DEPENDS = " \
-           ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'boost', '', d)} \
+           ${@bb.utils.contains('PTEST_ENABLED', '1', 'boost', '', d)} \
         "

 SRC_URI = "https://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2 \
diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
index c91aa073e8..6490a95c67 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -60,7 +60,7 @@ KERNEL_FEATURES:append:qemuall=" cfg/virtio.scc features/drm-bochs/drm-bochs.scc
 KERNEL_FEATURES:append:qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
 KERNEL_FEATURES:append:qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
 KERNEL_FEATURES:append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "", d)}"
-KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "", d)}"
-KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/gpio/mockup.scc", "", d)}"
+KERNEL_FEATURES:append = " ${@bb.utils.contains("PTEST_ENABLED", "1", " features/scsi/scsi-debug.scc", "", d)}"
+KERNEL_FEATURES:append = " ${@bb.utils.contains("PTEST_ENABLED", "1", " features/gpio/mockup.scc", "", d)}"

 KERNEL_VERSION_SANITY_SKIP = "1"
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index af8027c51a..441415f9de 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -44,5 +44,5 @@ KERNEL_FEATURES:append = " ${KERNEL_EXTRA_FEATURES}"
 KERNEL_FEATURES:append:qemuall=" cfg/virtio.scc features/drm-bochs/drm-bochs.scc"
 KERNEL_FEATURES:append:qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
 KERNEL_FEATURES:append:qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
-KERNEL_FEATURES:append = "${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "", d)}"
-KERNEL_FEATURES:append = "${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/gpio/mockup.scc", "", d)}"
+KERNEL_FEATURES:append = "${@bb.utils.contains("PTEST_ENABLED", "1", " features/scsi/scsi-debug.scc", "", d)}"
+KERNEL_FEATURES:append = "${@bb.utils.contains("PTEST_ENABLED", "1", " features/gpio/mockup.scc", "", d)}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 7a47bac057..154cf37bf3 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -62,8 +62,8 @@ KERNEL_FEATURES:append:qemuall=" cfg/virtio.scc features/drm-bochs/drm-bochs.scc
 KERNEL_FEATURES:append:qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
 KERNEL_FEATURES:append:qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
 KERNEL_FEATURES:append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "", d)}"
-KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "", d)}"
-KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/gpio/mockup.scc", "", d)}"
+KERNEL_FEATURES:append = " ${@bb.utils.contains("PTEST_ENABLED", "1", " features/scsi/scsi-debug.scc", "", d)}"
+KERNEL_FEATURES:append = " ${@bb.utils.contains("PTEST_ENABLED", "1", " features/gpio/mockup.scc", "", d)}"
 KERNEL_FEATURES:append:powerpc =" arch/powerpc/powerpc-debug.scc"
 KERNEL_FEATURES:append:powerpc64 =" arch/powerpc/powerpc-debug.scc"
 KERNEL_FEATURES:append:powerpc64le =" arch/powerpc/powerpc-debug.scc"

rday
--8323328-725534526-1707823305=:409599--

