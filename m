Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E140C53218
	for <webhook@archiver.kernel.org>; Thu, 15 Aug 2024 18:59:02 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.131449.1723748335993756923
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Aug 2024 11:58:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=J3TeqgRm;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=16AXBXpa;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019157683f64-dce64837-5cbe-4c4b-9b9d-ca89b5e10a08-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1723748335;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=7xED/APX6kI8Zd6YkOQkKbmdmzN0Z8E3ziCviEBTN9Y=;
	b=J3TeqgRmf1S7BOa+FlCqesLLLjlcEyr5UyiSFhJHIahhbVi0YDJ2QAo8Z88twMyi
	Pwlnd/QU7NpdlBLJQyOWBM18QCxNJfprZeJFAPzI/WHyaMhVEt49vY4kPgngVACX0Or
	rZgVaSPiVZikcXXpIJbU1mO4BYLDxfz/NUD4kMiY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1723748335;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=7xED/APX6kI8Zd6YkOQkKbmdmzN0Z8E3ziCviEBTN9Y=;
	b=16AXBXpabpNwkU8y/l/cnAfvFM89U8p+F9HkB7W1EkrRR8t+navJFfDlBC27PEd1
	tl/fX1p67gN4DziAUl13hgxKnxbgsxRJodncv+P45dZ3YJOSYGl3KBsOlp96ruh0ujc
	Zifpcqt97kxPjE/xGxFAlr8aDnCVqGnKmNVAVQms=
Content-Type: multipart/mixed; boundary="===============0662665849737364168=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] boost-build-native: upgrading to 1.86.0 SUCCEEDED
Message-ID: <0101019157683f64-dce64837-5cbe-4c4b-9b9d-ca89b5e10a08-000000@us-west-2.amazonses.com>
Date: Thu, 15 Aug 2024 18:58:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Aug 2024 18:59:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203444

--===============0662665849737364168==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *boost-build-native* to *1.86.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-boost-build-native-upgrade-1.85.0-1.86.0.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From 07acfbd6d79fd7c9436dbfa0491f612457e1d9b4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Aug 2024 17:59:22 +0000
Subject: [PATCH] boost-build-native: upgrade 1.85.0 -> 1.86.0

---
 ...oost-build-native_1.85.0.bb => boost-build-native_1.86.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/boost/{boost-build-native_1.85.0.bb => boost-build-native_1.86.0.bb} (92%)

diff --git a/meta/recipes-support/boost/boost-build-native_1.85.0.bb b/meta/recipes-support/boost/boost-build-native_1.86.0.bb
similarity index 92%
rename from meta/recipes-support/boost/boost-build-native_1.85.0.bb
rename to meta/recipes-support/boost/boost-build-native_1.86.0.bb
index b333c7c81a..8819b43390 100644
--- a/meta/recipes-support/boost/boost-build-native_1.85.0.bb
+++ b/meta/recipes-support/boost/boost-build-native_1.86.0.bb
@@ -7,7 +7,7 @@ LICENSE = "BSL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
 
 SRC_URI = "git://github.com/boostorg/build;protocol=https;branch=master"
-SRCREV = "b0311a0d4f3bb0f93d06d3c6faca510c7f5a2012"
+SRCREV = "4a52d8c06635435b64e31a56eaf7ca5dc912a71d"
 PE = "1"
 
 UPSTREAM_CHECK_GITTAGREGEX = "boost-(?P<pver>(\d+(\.\d+)+))"
-- 
2.44.0


--===============0662665849737364168==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/x86_64-linux/boost-build-native (sysroot):
  /usr was removed
  /usr/bin was removed
  /usr/bin/b2 was removed
  /usr/share was removed
  /usr/share/b2 was removed
  /usr/share/b2/src was removed
  /usr/share/b2/src/build was removed
  /usr/share/b2/src/build/ac.jam was removed
  /usr/share/b2/src/build/alias.jam was removed
  /usr/share/b2/src/build/build-request.jam was removed
  /usr/share/b2/src/build/config-cache.jam was removed
  /usr/share/b2/src/build/configure.jam was removed
  /usr/share/b2/src/build/feature.jam was removed
  /usr/share/b2/src/build/generators.jam was removed
  /usr/share/b2/src/build/project.jam was removed
  /usr/share/b2/src/build/property.jam was removed
  /usr/share/b2/src/build/property-set.jam was removed
  /usr/share/b2/src/build/scanner.jam was removed
  /usr/share/b2/src/build-system.jam was removed
  /usr/share/b2/src/build/targets.jam was removed
  /usr/share/b2/src/build/toolset.jam was removed
  /usr/share/b2/src/build/type.jam was removed
  /usr/share/b2/src/build/version.jam was removed
  /usr/share/b2/src/build/virtual-target.jam was removed
  /usr/share/b2/src/contrib was removed
  /usr/share/b2/src/contrib/boost.jam was removed
  /usr/share/b2/src/contrib/modular.jam was removed
  /usr/share/b2/src/contrib/tntnet.jam was removed
  /usr/share/b2/src/contrib/wxFormBuilder.jam was removed
  /usr/share/b2/src/options was removed
  /usr/share/b2/src/options/help.jam was removed
  /usr/share/b2/src/tools was removed
  /usr/share/b2/src/tools/acc.jam was removed
  /usr/share/b2/src/tools/asciidoctor.jam was removed
  /usr/share/b2/src/tools/auto-index.jam was removed
  /usr/share/b2/src/tools/bison.jam was removed
  /usr/share/b2/src/tools/boostbook.jam was removed
  /usr/share/b2/src/tools/borland.jam was removed
  /usr/share/b2/src/tools/builtin.jam was removed
  /usr/share/b2/src/tools/bzip2.jam was removed
  /usr/share/b2/src/tools/cast.jam was removed
  /usr/share/b2/src/tools/clang-darwin.jam was removed
  /usr/share/b2/src/tools/clang.jam was removed
  /usr/share/b2/src/tools/clang-linux.jam was removed
  /usr/share/b2/src/tools/clang-vxworks.jam was removed
  /usr/share/b2/src/tools/clang-win.jam was removed
  /usr/share/b2/src/tools/common.jam was removed
  /usr/share/b2/src/tools/como.jam was removed
  /usr/share/b2/src/tools/como-linux.jam was removed
  /usr/share/b2/src/tools/como-win.jam was removed
  /usr/share/b2/src/tools/convert.jam was removed
  /usr/share/b2/src/tools/cray.jam was removed
  /usr/share/b2/src/tools/cw-config.jam was removed
  /usr/share/b2/src/tools/cw.jam was removed
  /usr/share/b2/src/tools/cygwin.jam was removed
  /usr/share/b2/src/tools/darwin.jam was removed
  /usr/share/b2/src/tools/diab.jam was removed
  /usr/share/b2/src/tools/dmc.jam was removed
  /usr/share/b2/src/tools/docutils.jam was removed
  /usr/share/b2/src/tools/doxproc.py was removed
  /usr/share/b2/src/tools/doxygen was removed
  /usr/share/b2/src/tools/doxygen.jam was removed
  /usr/share/b2/src/tools/doxygen/windows-paths-check.doxyfile was removed
  /usr/share/b2/src/tools/doxygen/windows-paths-check.hpp was removed
  /usr/share/b2/src/tools/embarcadero.jam was removed
  /usr/share/b2/src/tools/emscripten.jam was removed
  /usr/share/b2/src/tools/features was removed
  /usr/share/b2/src/tools/features/address-model-feature.jam was removed
  /usr/share/b2/src/tools/features/allow-feature.jam was removed
  /usr/share/b2/src/tools/features/architecture-feature.jam was removed
  /usr/share/b2/src/tools/features/archiveflags-feature.jam was removed
  /usr/share/b2/src/tools/features/asmflags-feature.jam was removed
  /usr/share/b2/src/tools/features/build-feature.jam was removed
  /usr/share/b2/src/tools/features/cflags-feature.jam was removed
  /usr/share/b2/src/tools/features/compileflags-feature.jam was removed
  /usr/share/b2/src/tools/features/conditional-feature.jam was removed
  /usr/share/b2/src/tools/features/coverage-feature.jam was removed
  /usr/share/b2/src/tools/features/cxxabi-feature.jam was removed
  /usr/share/b2/src/tools/features/cxxflags-feature.jam was removed
  /usr/share/b2/src/tools/features/cxxstd-feature.jam was removed
  /usr/share/b2/src/tools/features/cxx-template-depth-feature.jam was removed
  /usr/share/b2/src/tools/features/debug-feature.jam was removed
  /usr/share/b2/src/tools/features/define-feature.jam was removed
  /usr/share/b2/src/tools/features/dependency-feature.jam was removed
  /usr/share/b2/src/tools/features/dll-feature.jam was removed
  /usr/share/b2/src/tools/features/exception-feature.jam was removed
  /usr/share/b2/src/tools/features/fflags-feature.jam was removed
  /usr/share/b2/src/tools/features/file-feature.jam was removed
  /usr/share/b2/src/tools/features/find-lib-feature.jam was removed
  /usr/share/b2/src/tools/features/flags-feature.jam was removed
  /usr/share/b2/src/tools/features/force-include-feature.jam was removed
  /usr/share/b2/src/tools/features/include-feature.jam was removed
  /usr/share/b2/src/tools/features/__init_features__.jam was removed
  /usr/share/b2/src/tools/features/instruction-set-feature.jam was removed
  /usr/share/b2/src/tools/features/internal-feature.jam was removed
  /usr/share/b2/src/tools/features/library-feature.jam was removed
  /usr/share/b2/src/tools/features/linemarkers-feature.jam was removed
  /usr/share/b2/src/tools/features/link-feature.jam was removed
  /usr/share/b2/src/tools/features/linkflags-feature.jam was removed
  /usr/share/b2/src/tools/features/local-visibility-feature.jam was removed
  /usr/share/b2/src/tools/features/location-feature.jam was removed
  /usr/share/b2/src/tools/features/location-prefix-feature.jam was removed
  /usr/share/b2/src/tools/features/lto-feature.jam was removed
  /usr/share/b2/src/tools/features/name-feature.jam was removed
  /usr/share/b2/src/tools/features/objcflags-feature.jam was removed
  /usr/share/b2/src/tools/features/optimization-feature.jam was removed
  /usr/share/b2/src/tools/features/os-feature.jam was removed
  /usr/share/b2/src/tools/features/relevant-feature.jam was removed
  /usr/share/b2/src/tools/features/response-file-feature.jam was removed
  /usr/share/b2/src/tools/features/rtti-feature.jam was removed
  /usr/share/b2/src/tools/features/runtime-feature.jam was removed
  /usr/share/b2/src/tools/features/sanitizers-feature.jam was removed
  /usr/share/b2/src/tools/features/search-feature.jam was removed
  /usr/share/b2/src/tools/features/source-feature.jam was removed
  /usr/share/b2/src/tools/features/stdlib-feature.jam was removed
  /usr/share/b2/src/tools/features/strip-feature.jam was removed
  /usr/share/b2/src/tools/features/tag-feature.jam was removed
  /usr/share/b2/src/tools/features/threadapi-feature.jam was removed
  /usr/share/b2/src/tools/features/threading-feature.jam was removed
  /usr/share/b2/src/tools/features/toolset-feature.jam was removed
  /usr/share/b2/src/tools/features/translate-path-feature.jam was removed
  /usr/share/b2/src/tools/features/user-interface-feature.jam was removed
  /usr/share/b2/src/tools/features/variant-feature.jam was removed
  /usr/share/b2/src/tools/features/version-feature.jam was removed
  /usr/share/b2/src/tools/features/visibility-feature.jam was removed
  /usr/share/b2/src/tools/features/warnings-feature.jam was removed
  /usr/share/b2/src/tools/flags.jam was removed
  /usr/share/b2/src/tools/fop.jam was removed
  /usr/share/b2/src/tools/fortran.jam was removed
  /usr/share/b2/src/tools/gcc.jam was removed
  /usr/share/b2/src/tools/generate.jam was removed
  /usr/share/b2/src/tools/generators was removed
  /usr/share/b2/src/tools/generators/archive-generator.jam was removed
  /usr/share/b2/src/tools/generators/c-compiling-generator.jam was removed
  /usr/share/b2/src/tools/generators/c-preprocessing-generator.jam was removed
  /usr/share/b2/src/tools/generators/dummy-generator.jam was removed
  /usr/share/b2/src/tools/generators/__init_generators__.jam was removed
  /usr/share/b2/src/tools/generators/lib-generator.jam was removed
  /usr/share/b2/src/tools/generators/linking-generator.jam was removed
  /usr/share/b2/src/tools/generators/prebuilt-lib-generator.jam was removed
  /usr/share/b2/src/tools/generators/searched-lib-generator.jam was removed
  /usr/share/b2/src/tools/gettext.jam was removed
  /usr/share/b2/src/tools/gfortran.jam was removed
  /usr/share/b2/src/tools/hp_cxx.jam was removed
  /usr/share/b2/src/tools/hpfortran.jam was removed
  /usr/share/b2/src/tools/ifort.jam was removed
  /usr/share/b2/src/tools/intel-darwin.jam was removed
  /usr/share/b2/src/tools/intel.jam was removed
  /usr/share/b2/src/tools/intel-linux.jam was removed
  /usr/share/b2/src/tools/intel-vxworks.jam was removed
  /usr/share/b2/src/tools/intel-win.jam was removed
  /usr/share/b2/src/tools/lex.jam was removed
  /usr/share/b2/src/tools/libjpeg.jam was removed
  /usr/share/b2/src/tools/libpng.jam was removed
  /usr/share/b2/src/tools/libtiff.jam was removed
  /usr/share/b2/src/tools/link.jam was removed
  /usr/share/b2/src/tools/lzma.jam was removed
  /usr/share/b2/src/tools/make.jam was removed
  /usr/share/b2/src/tools/mc.jam was removed
  /usr/share/b2/src/tools/message.jam was removed
  /usr/share/b2/src/tools/midl.jam was removed
  /usr/share/b2/src/tools/mipspro.jam was removed
  /usr/share/b2/src/tools/mpi.jam was removed
  /usr/share/b2/src/tools/msvc.jam was removed
  /usr/share/b2/src/tools/notfile.jam was removed
  /usr/share/b2/src/tools/openssl.jam was removed
  /usr/share/b2/src/tools/package.jam was removed
  /usr/share/b2/src/tools/pathscale.jam was removed
  /usr/share/b2/src/tools/pch.jam was removed
  /usr/share/b2/src/tools/pgi.jam was removed
  /usr/share/b2/src/tools/pkg-config.jam was removed
  /usr/share/b2/src/tools/python-config.jam was removed
  /usr/share/b2/src/tools/python.jam was removed
  /usr/share/b2/src/tools/qcc.jam was removed
  /usr/share/b2/src/tools/qt3.jam was removed
  /usr/share/b2/src/tools/qt4.jam was removed
  /usr/share/b2/src/tools/qt5.jam was removed
  /usr/share/b2/src/tools/qt.jam was removed
  /usr/share/b2/src/tools/quickbook-config.jam was removed
  /usr/share/b2/src/tools/quickbook.jam was removed
  /usr/share/b2/src/tools/rc.jam was removed
  /usr/share/b2/src/tools/sass.jam was removed
  /usr/share/b2/src/tools/saxonhe.jam was removed
  /usr/share/b2/src/tools/stage.jam was removed
  /usr/share/b2/src/tools/stlport.jam was removed
  /usr/share/b2/src/tools/sun.jam was removed
  /usr/share/b2/src/tools/symlink.jam was removed
  /usr/share/b2/src/tools/testing-aux.jam was removed
  /usr/share/b2/src/tools/testing.jam was removed
  /usr/share/b2/src/tools/types was removed
  /usr/share/b2/src/tools/types/adoc.jam was removed
  /usr/share/b2/src/tools/types/asm.jam was removed
  /usr/share/b2/src/tools/types/cpp.jam was removed
  /usr/share/b2/src/tools/types/css.jam was removed
  /usr/share/b2/src/tools/types/docbook.jam was removed
  /usr/share/b2/src/tools/types/exe.jam was removed
  /usr/share/b2/src/tools/types/html.jam was removed
  /usr/share/b2/src/tools/types/lib.jam was removed
  /usr/share/b2/src/tools/types/man.jam was removed
  /usr/share/b2/src/tools/types/markdown.jam was removed
  /usr/share/b2/src/tools/types/objc.jam was removed
  /usr/share/b2/src/tools/types/obj.jam was removed
  /usr/share/b2/src/tools/types/pdf.jam was removed
  /usr/share/b2/src/tools/types/preprocessed.jam was removed
  /usr/share/b2/src/tools/types/qt.jam was removed
  /usr/share/b2/src/tools/types/register.jam was removed
  /usr/share/b2/src/tools/types/rsp.jam was removed
  /usr/share/b2/src/tools/types/sass-type.jam was removed
  /usr/share/b2/src/tools/types/xml.jam was removed
  /usr/share/b2/src/tools/unix.jam was removed
  /usr/share/b2/src/tools/vacpp.jam was removed
  /usr/share/b2/src/tools/vmsdecc.jam was removed
  /usr/share/b2/src/tools/whale.jam was removed
  /usr/share/b2/src/tools/xlcpp.jam was removed
  /usr/share/b2/src/tools/xlf.jam was removed
  /usr/share/b2/src/tools/xsltproc was removed
  /usr/share/b2/src/tools/xsltproc-config.jam was removed
  /usr/share/b2/src/tools/xsltproc/included.xsl was removed
  /usr/share/b2/src/tools/xsltproc.jam was removed
  /usr/share/b2/src/tools/xsltproc/test.xml was removed
  /usr/share/b2/src/tools/xsltproc/test.xsl was removed
  /usr/share/b2/src/tools/zlib.jam was removed
  /usr/share/b2/src/tools/zstd.jam was removed
  /usr/share/b2/src/util was removed
  /usr/share/b2/src/util/assert.jam was removed
  /usr/share/b2/src/util/container.jam was removed
  /usr/share/b2/src/util/doc.jam was removed
  /usr/share/b2/src/util/indirect.jam was removed
  /usr/share/b2/src/util/numbers.jam was removed
  /usr/share/b2/src/util/option.jam was removed
  /usr/share/b2/src/util/order.jam was removed
  /usr/share/b2/src/util/os.jam was removed
  /usr/share/b2/src/util/param.jam was removed
  /usr/share/b2/src/util/path.jam was removed
  /usr/share/b2/src/util/print.jam was removed
  /usr/share/b2/src/util/sequence.jam was removed
  /usr/share/b2/src/util/utility.jam was removed

--===============0662665849737364168==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

Changes to packages/x86_64-linux/boost-build-native (sysroot):
  /usr was removed
  /usr/bin was removed
  /usr/bin/b2 was removed
  /usr/share was removed
  /usr/share/b2 was removed
  /usr/share/b2/src was removed
  /usr/share/b2/src/build was removed
  /usr/share/b2/src/build/ac.jam was removed
  /usr/share/b2/src/build/alias.jam was removed
  /usr/share/b2/src/build/build-request.jam was removed
  /usr/share/b2/src/build/config-cache.jam was removed
  /usr/share/b2/src/build/configure.jam was removed
  /usr/share/b2/src/build/feature.jam was removed
  /usr/share/b2/src/build/generators.jam was removed
  /usr/share/b2/src/build/project.jam was removed
  /usr/share/b2/src/build/property.jam was removed
  /usr/share/b2/src/build/property-set.jam was removed
  /usr/share/b2/src/build/scanner.jam was removed
  /usr/share/b2/src/build-system.jam was removed
  /usr/share/b2/src/build/targets.jam was removed
  /usr/share/b2/src/build/toolset.jam was removed
  /usr/share/b2/src/build/type.jam was removed
  /usr/share/b2/src/build/version.jam was removed
  /usr/share/b2/src/build/virtual-target.jam was removed
  /usr/share/b2/src/contrib was removed
  /usr/share/b2/src/contrib/boost.jam was removed
  /usr/share/b2/src/contrib/modular.jam was removed
  /usr/share/b2/src/contrib/tntnet.jam was removed
  /usr/share/b2/src/contrib/wxFormBuilder.jam was removed
  /usr/share/b2/src/options was removed
  /usr/share/b2/src/options/help.jam was removed
  /usr/share/b2/src/tools was removed
  /usr/share/b2/src/tools/acc.jam was removed
  /usr/share/b2/src/tools/asciidoctor.jam was removed
  /usr/share/b2/src/tools/auto-index.jam was removed
  /usr/share/b2/src/tools/bison.jam was removed
  /usr/share/b2/src/tools/boostbook.jam was removed
  /usr/share/b2/src/tools/borland.jam was removed
  /usr/share/b2/src/tools/builtin.jam was removed
  /usr/share/b2/src/tools/bzip2.jam was removed
  /usr/share/b2/src/tools/cast.jam was removed
  /usr/share/b2/src/tools/clang-darwin.jam was removed
  /usr/share/b2/src/tools/clang.jam was removed
  /usr/share/b2/src/tools/clang-linux.jam was removed
  /usr/share/b2/src/tools/clang-vxworks.jam was removed
  /usr/share/b2/src/tools/clang-win.jam was removed
  /usr/share/b2/src/tools/common.jam was removed
  /usr/share/b2/src/tools/como.jam was removed
  /usr/share/b2/src/tools/como-linux.jam was removed
  /usr/share/b2/src/tools/como-win.jam was removed
  /usr/share/b2/src/tools/convert.jam was removed
  /usr/share/b2/src/tools/cray.jam was removed
  /usr/share/b2/src/tools/cw-config.jam was removed
  /usr/share/b2/src/tools/cw.jam was removed
  /usr/share/b2/src/tools/cygwin.jam was removed
  /usr/share/b2/src/tools/darwin.jam was removed
  /usr/share/b2/src/tools/diab.jam was removed
  /usr/share/b2/src/tools/dmc.jam was removed
  /usr/share/b2/src/tools/docutils.jam was removed
  /usr/share/b2/src/tools/doxproc.py was removed
  /usr/share/b2/src/tools/doxygen was removed
  /usr/share/b2/src/tools/doxygen.jam was removed
  /usr/share/b2/src/tools/doxygen/windows-paths-check.doxyfile was removed
  /usr/share/b2/src/tools/doxygen/windows-paths-check.hpp was removed
  /usr/share/b2/src/tools/embarcadero.jam was removed
  /usr/share/b2/src/tools/emscripten.jam was removed
  /usr/share/b2/src/tools/features was removed
  /usr/share/b2/src/tools/features/address-model-feature.jam was removed
  /usr/share/b2/src/tools/features/allow-feature.jam was removed
  /usr/share/b2/src/tools/features/architecture-feature.jam was removed
  /usr/share/b2/src/tools/features/archiveflags-feature.jam was removed
  /usr/share/b2/src/tools/features/asmflags-feature.jam was removed
  /usr/share/b2/src/tools/features/build-feature.jam was removed
  /usr/share/b2/src/tools/features/cflags-feature.jam was removed
  /usr/share/b2/src/tools/features/compileflags-feature.jam was removed
  /usr/share/b2/src/tools/features/conditional-feature.jam was removed
  /usr/share/b2/src/tools/features/coverage-feature.jam was removed
  /usr/share/b2/src/tools/features/cxxabi-feature.jam was removed
  /usr/share/b2/src/tools/features/cxxflags-feature.jam was removed
  /usr/share/b2/src/tools/features/cxxstd-feature.jam was removed
  /usr/share/b2/src/tools/features/cxx-template-depth-feature.jam was removed
  /usr/share/b2/src/tools/features/debug-feature.jam was removed
  /usr/share/b2/src/tools/features/define-feature.jam was removed
  /usr/share/b2/src/tools/features/dependency-feature.jam was removed
  /usr/share/b2/src/tools/features/dll-feature.jam was removed
  /usr/share/b2/src/tools/features/exception-feature.jam was removed
  /usr/share/b2/src/tools/features/fflags-feature.jam was removed
  /usr/share/b2/src/tools/features/file-feature.jam was removed
  /usr/share/b2/src/tools/features/find-lib-feature.jam was removed
  /usr/share/b2/src/tools/features/flags-feature.jam was removed
  /usr/share/b2/src/tools/features/force-include-feature.jam was removed
  /usr/share/b2/src/tools/features/include-feature.jam was removed
  /usr/share/b2/src/tools/features/__init_features__.jam was removed
  /usr/share/b2/src/tools/features/instruction-set-feature.jam was removed
  /usr/share/b2/src/tools/features/internal-feature.jam was removed
  /usr/share/b2/src/tools/features/library-feature.jam was removed
  /usr/share/b2/src/tools/features/linemarkers-feature.jam was removed
  /usr/share/b2/src/tools/features/link-feature.jam was removed
  /usr/share/b2/src/tools/features/linkflags-feature.jam was removed
  /usr/share/b2/src/tools/features/local-visibility-feature.jam was removed
  /usr/share/b2/src/tools/features/location-feature.jam was removed
  /usr/share/b2/src/tools/features/location-prefix-feature.jam was removed
  /usr/share/b2/src/tools/features/lto-feature.jam was removed
  /usr/share/b2/src/tools/features/name-feature.jam was removed
  /usr/share/b2/src/tools/features/objcflags-feature.jam was removed
  /usr/share/b2/src/tools/features/optimization-feature.jam was removed
  /usr/share/b2/src/tools/features/os-feature.jam was removed
  /usr/share/b2/src/tools/features/relevant-feature.jam was removed
  /usr/share/b2/src/tools/features/response-file-feature.jam was removed
  /usr/share/b2/src/tools/features/rtti-feature.jam was removed
  /usr/share/b2/src/tools/features/runtime-feature.jam was removed
  /usr/share/b2/src/tools/features/sanitizers-feature.jam was removed
  /usr/share/b2/src/tools/features/search-feature.jam was removed
  /usr/share/b2/src/tools/features/source-feature.jam was removed
  /usr/share/b2/src/tools/features/stdlib-feature.jam was removed
  /usr/share/b2/src/tools/features/strip-feature.jam was removed
  /usr/share/b2/src/tools/features/tag-feature.jam was removed
  /usr/share/b2/src/tools/features/threadapi-feature.jam was removed
  /usr/share/b2/src/tools/features/threading-feature.jam was removed
  /usr/share/b2/src/tools/features/toolset-feature.jam was removed
  /usr/share/b2/src/tools/features/translate-path-feature.jam was removed
  /usr/share/b2/src/tools/features/user-interface-feature.jam was removed
  /usr/share/b2/src/tools/features/variant-feature.jam was removed
  /usr/share/b2/src/tools/features/version-feature.jam was removed
  /usr/share/b2/src/tools/features/visibility-feature.jam was removed
  /usr/share/b2/src/tools/features/warnings-feature.jam was removed
  /usr/share/b2/src/tools/flags.jam was removed
  /usr/share/b2/src/tools/fop.jam was removed
  /usr/share/b2/src/tools/fortran.jam was removed
  /usr/share/b2/src/tools/gcc.jam was removed
  /usr/share/b2/src/tools/generate.jam was removed
  /usr/share/b2/src/tools/generators was removed
  /usr/share/b2/src/tools/generators/archive-generator.jam was removed
  /usr/share/b2/src/tools/generators/c-compiling-generator.jam was removed
  /usr/share/b2/src/tools/generators/c-preprocessing-generator.jam was removed
  /usr/share/b2/src/tools/generators/dummy-generator.jam was removed
  /usr/share/b2/src/tools/generators/__init_generators__.jam was removed
  /usr/share/b2/src/tools/generators/lib-generator.jam was removed
  /usr/share/b2/src/tools/generators/linking-generator.jam was removed
  /usr/share/b2/src/tools/generators/prebuilt-lib-generator.jam was removed
  /usr/share/b2/src/tools/generators/searched-lib-generator.jam was removed
  /usr/share/b2/src/tools/gettext.jam was removed
  /usr/share/b2/src/tools/gfortran.jam was removed
  /usr/share/b2/src/tools/hp_cxx.jam was removed
  /usr/share/b2/src/tools/hpfortran.jam was removed
  /usr/share/b2/src/tools/ifort.jam was removed
  /usr/share/b2/src/tools/intel-darwin.jam was removed
  /usr/share/b2/src/tools/intel.jam was removed
  /usr/share/b2/src/tools/intel-linux.jam was removed
  /usr/share/b2/src/tools/intel-vxworks.jam was removed
  /usr/share/b2/src/tools/intel-win.jam was removed
  /usr/share/b2/src/tools/lex.jam was removed
  /usr/share/b2/src/tools/libjpeg.jam was removed
  /usr/share/b2/src/tools/libpng.jam was removed
  /usr/share/b2/src/tools/libtiff.jam was removed
  /usr/share/b2/src/tools/link.jam was removed
  /usr/share/b2/src/tools/lzma.jam was removed
  /usr/share/b2/src/tools/make.jam was removed
  /usr/share/b2/src/tools/mc.jam was removed
  /usr/share/b2/src/tools/message.jam was removed
  /usr/share/b2/src/tools/midl.jam was removed
  /usr/share/b2/src/tools/mipspro.jam was removed
  /usr/share/b2/src/tools/mpi.jam was removed
  /usr/share/b2/src/tools/msvc.jam was removed
  /usr/share/b2/src/tools/notfile.jam was removed
  /usr/share/b2/src/tools/openssl.jam was removed
  /usr/share/b2/src/tools/package.jam was removed
  /usr/share/b2/src/tools/pathscale.jam was removed
  /usr/share/b2/src/tools/pch.jam was removed
  /usr/share/b2/src/tools/pgi.jam was removed
  /usr/share/b2/src/tools/pkg-config.jam was removed
  /usr/share/b2/src/tools/python-config.jam was removed
  /usr/share/b2/src/tools/python.jam was removed
  /usr/share/b2/src/tools/qcc.jam was removed
  /usr/share/b2/src/tools/qt3.jam was removed
  /usr/share/b2/src/tools/qt4.jam was removed
  /usr/share/b2/src/tools/qt5.jam was removed
  /usr/share/b2/src/tools/qt.jam was removed
  /usr/share/b2/src/tools/quickbook-config.jam was removed
  /usr/share/b2/src/tools/quickbook.jam was removed
  /usr/share/b2/src/tools/rc.jam was removed
  /usr/share/b2/src/tools/sass.jam was removed
  /usr/share/b2/src/tools/saxonhe.jam was removed
  /usr/share/b2/src/tools/stage.jam was removed
  /usr/share/b2/src/tools/stlport.jam was removed
  /usr/share/b2/src/tools/sun.jam was removed
  /usr/share/b2/src/tools/symlink.jam was removed
  /usr/share/b2/src/tools/testing-aux.jam was removed
  /usr/share/b2/src/tools/testing.jam was removed
  /usr/share/b2/src/tools/types was removed
  /usr/share/b2/src/tools/types/adoc.jam was removed
  /usr/share/b2/src/tools/types/asm.jam was removed
  /usr/share/b2/src/tools/types/cpp.jam was removed
  /usr/share/b2/src/tools/types/css.jam was removed
  /usr/share/b2/src/tools/types/docbook.jam was removed
  /usr/share/b2/src/tools/types/exe.jam was removed
  /usr/share/b2/src/tools/types/html.jam was removed
  /usr/share/b2/src/tools/types/lib.jam was removed
  /usr/share/b2/src/tools/types/man.jam was removed
  /usr/share/b2/src/tools/types/markdown.jam was removed
  /usr/share/b2/src/tools/types/objc.jam was removed
  /usr/share/b2/src/tools/types/obj.jam was removed
  /usr/share/b2/src/tools/types/pdf.jam was removed
  /usr/share/b2/src/tools/types/preprocessed.jam was removed
  /usr/share/b2/src/tools/types/qt.jam was removed
  /usr/share/b2/src/tools/types/register.jam was removed
  /usr/share/b2/src/tools/types/rsp.jam was removed
  /usr/share/b2/src/tools/types/sass-type.jam was removed
  /usr/share/b2/src/tools/types/xml.jam was removed
  /usr/share/b2/src/tools/unix.jam was removed
  /usr/share/b2/src/tools/vacpp.jam was removed
  /usr/share/b2/src/tools/vmsdecc.jam was removed
  /usr/share/b2/src/tools/whale.jam was removed
  /usr/share/b2/src/tools/xlcpp.jam was removed
  /usr/share/b2/src/tools/xlf.jam was removed
  /usr/share/b2/src/tools/xsltproc was removed
  /usr/share/b2/src/tools/xsltproc-config.jam was removed
  /usr/share/b2/src/tools/xsltproc/included.xsl was removed
  /usr/share/b2/src/tools/xsltproc.jam was removed
  /usr/share/b2/src/tools/xsltproc/test.xml was removed
  /usr/share/b2/src/tools/xsltproc/test.xsl was removed
  /usr/share/b2/src/tools/zlib.jam was removed
  /usr/share/b2/src/tools/zstd.jam was removed
  /usr/share/b2/src/util was removed
  /usr/share/b2/src/util/assert.jam was removed
  /usr/share/b2/src/util/container.jam was removed
  /usr/share/b2/src/util/doc.jam was removed
  /usr/share/b2/src/util/indirect.jam was removed
  /usr/share/b2/src/util/numbers.jam was removed
  /usr/share/b2/src/util/option.jam was removed
  /usr/share/b2/src/util/order.jam was removed
  /usr/share/b2/src/util/os.jam was removed
  /usr/share/b2/src/util/param.jam was removed
  /usr/share/b2/src/util/path.jam was removed
  /usr/share/b2/src/util/print.jam was removed
  /usr/share/b2/src/util/sequence.jam was removed
  /usr/share/b2/src/util/utility.jam was removed

--===============0662665849737364168==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-boost-build-native-upgrade-1.85.0-1.86.0.patch"

RnJvbSAwN2FjZmJkNmQ3OWZkN2M5NDM2ZGJmYTA0OTFmNjEyNDU3ZTFkOWI0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgQXVnIDIwMjQgMTc6NTk6MjIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBi
b29zdC1idWlsZC1uYXRpdmU6IHVwZ3JhZGUgMS44NS4wIC0+IDEuODYuMAoKLS0tCiAuLi5vb3N0
LWJ1aWxkLW5hdGl2ZV8xLjg1LjAuYmIgPT4gYm9vc3QtYnVpbGQtbmF0aXZlXzEuODYuMC5iYn0g
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtc3VwcG9ydC9ib29zdC97Ym9vc3QtYnVpbGQtbmF0aXZlXzEuODUu
MC5iYiA9PiBib29zdC1idWlsZC1uYXRpdmVfMS44Ni4wLmJifSAoOTIlKQoKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1zdXBwb3J0L2Jvb3N0L2Jvb3N0LWJ1aWxkLW5hdGl2ZV8xLjg1LjAuYmIg
Yi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9ib29zdC9ib29zdC1idWlsZC1uYXRpdmVfMS44Ni4wLmJi
CnNpbWlsYXJpdHkgaW5kZXggOTIlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2Jv
b3N0L2Jvb3N0LWJ1aWxkLW5hdGl2ZV8xLjg1LjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1z
dXBwb3J0L2Jvb3N0L2Jvb3N0LWJ1aWxkLW5hdGl2ZV8xLjg2LjAuYmIKaW5kZXggYjMzM2M3Yzgx
YS4uODgxOWI0MzM5MCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvYm9vc3QvYm9v
c3QtYnVpbGQtbmF0aXZlXzEuODUuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9ib29z
dC9ib29zdC1idWlsZC1uYXRpdmVfMS44Ni4wLmJiCkBAIC03LDcgKzcsNyBAQCBMSUNFTlNFID0g
IkJTTC0xLjAiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFLnR4dDttZDU9ZTQy
MjRjY2FlY2IxNGQ5NDJjNzFkMzFiZWYyMGQ3OGMiCiAKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHVi
LmNvbS9ib29zdG9yZy9idWlsZDtwcm90b2NvbD1odHRwczticmFuY2g9bWFzdGVyIgotU1JDUkVW
ID0gImIwMzExYTBkNGYzYmIwZjkzZDA2ZDNjNmZhY2E1MTBjN2Y1YTIwMTIiCitTUkNSRVYgPSAi
NGE1MmQ4YzA2NjM1NDM1YjY0ZTMxYTU2ZWFmN2NhNWRjOTEyYTcxZCIKIFBFID0gIjEiCiAKIFVQ
U1RSRUFNX0NIRUNLX0dJVFRBR1JFR0VYID0gImJvb3N0LSg/UDxwdmVyPihcZCsoXC5cZCspKykp
IgotLSAKMi40NC4wCgo=

--===============0662665849737364168==--

