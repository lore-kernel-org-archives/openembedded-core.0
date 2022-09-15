Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A82CC6FA9C
	for <webhook@archiver.kernel.org>; Thu, 15 Sep 2022 14:18:43 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com
 (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web08.10736.1663251514832180960
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Sep 2022 07:18:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=STm5uUWO;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33,
 mailfrom: 010101834184026c-6b47da6d-116d-4ee2-b3da-a64762c4bb66-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1663251514;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=ldpTcKB2mOQhZ9j+m38LDb4qQbVoiKL4o1XzgwHYlkU=;
	b=STm5uUWOCHz9b6mkG9jwr3s/0YQb/4vDxKYGRTTZqQmSAACh0rsFCX/AMaTKDELb
	CaScn7Sdz8/7le8OGX7b3hc+PNfmvZjPTvJUp2zbgh0i3WcJoEc0QWQJbFRhA+6lmC/
	JAjczt7f8XlbfrCGoGRLNZyI5STvuDCNMZAMz1Ac=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1663251514;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=ldpTcKB2mOQhZ9j+m38LDb4qQbVoiKL4o1XzgwHYlkU=;
	b=QGbCzOp0GSoXDZhqZaaHyFRusnLYd4Yq8bGxN95MnXYhT0QWNQTisTTMYhX5IrPC
	zE7tU3Mm5TNTmuRrpvK+uj0jfPiEIWBEcKFaPzVZJ1T4kZWni59n4gB3xt8F11diJel
	zpwLFUb6jI1JIDVgWxoZ0RtgivM46yb3JUzcRhjo=
Content-Type: multipart/mixed; boundary="===============4368664966129388157=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] flac: upgrading to 1.4.0 FAILED
Message-ID: 
 <010101834184026c-6b47da6d-116d-4ee2-b3da-a64762c4bb66-000000@us-west-2.amazonses.com>
Date: Thu, 15 Sep 2022 14:18:34 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.09.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Sep 2022 14:18:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170748

--===============4368664966129388157==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *flac* to *1.4.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade flac -V 1.4.0
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1661 entries from dependency cache.

Summary: There was 1 WARNING message.
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-9d876aef9fa79cc72cea6a457109a82253e6e4a8"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:9d876aef9fa79cc72cea6a457109a82253e6e4a8"
workspace            = "master:6a27236fed8e7c27974c2313366bdbfd8edfa927"

Initialising tasks...done.
Sstate summary: Wanted 1 Local 1 Mirrors 0 Missed 0 Current 21 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 102 tasks of which 99 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1661 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (884 cached, 2 parsed). 1662 targets, 35 skipped, 0 masked, 0 errors.

Summary: There was 1 WARNING message.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-9d876aef9fa79cc72cea6a457109a82253e6e4a8"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:9d876aef9fa79cc72cea6a457109a82253e6e4a8"
workspace            = "master:6a27236fed8e7c27974c2313366bdbfd8edfa927"

Initialising tasks...done.
Sstate summary: Wanted 1 Local 1 Mirrors 0 Missed 0 Current 17 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 83 tasks of which 81 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching http://downloads.xiph.org/releases/flac/flac-1.4.0.tar.xz...
ERROR: Execution of 'git add -f -A "CHANGELOG.md" "README.md" "cmake/CheckA64NEON.c.in" "cmake/CheckA64NEON.cmake" "cmake/CheckAttribute.c.in" "cmake/CheckAttribute.cmake" "cmake/CheckVSX.c.in" "cmake/CheckVSX.cmake" "doc/images/Makefile.am" "doc/images/Makefile.in" "doc/images/logo.svg" "doc/images/logo130.gif" "man/flac.md" "man/metaflac.md" "oss-fuzz/Readme.md" "oss-fuzz/fuzzer_common.h" "oss-fuzz/fuzzer_decoder.cc" "oss-fuzz/fuzzer_encoder.cc" "oss-fuzz/fuzzer_encoder.dict" "oss-fuzz/fuzzer_encoder_v2.cc" "oss-fuzz/fuzzer_metadata.cc" "oss-fuzz/fuzzer_seek.cc" "src/libFLAC/deduplication/lpc_compute_autocorrelation_intrin.c" "src/libFLAC/deduplication/lpc_compute_autocorrelation_intrin_neon.c" "src/libFLAC/deduplication/lpc_compute_autocorrelation_intrin_sse2.c" "src/libFLAC/deduplication/lpc_compute_autocorrelation_intrin_vsx.c" "src/libFLAC/lpc_intrin_fma.c" "src/libFLAC/lpc_intrin_neon.c" ""test/flac-to-flac-metadata-test-files/Pr\303\270ve.flac"" ""test/flac-to-flac-metadata-t
 est-files/\327\251\327\234\327\225\327\235.flac"" ""test/flac-to-flac-metadata-test-files/\360\237\244\224.flac"" "AUTHORS" "CMakeLists.txt" "COPYING.Xiph" "FLAC-vs2005.sln" "FLAC.sln" "Makefile.am" "Makefile.deps" "Makefile.in" "Makefile.lite" "README" "aclocal.m4" "ar-lib" "build/Makefile.am" "build/Makefile.in" "build/compile.mk" "build/config.mk" "build/exe.mk" "build/lib.mk" "cmake/CheckCPUArch.cmake" "cmake/UseSystemExtensions.cmake" "compile" "config.cmake.h.in" "config.guess" "config.h.in" "config.sub" "configure" "configure.ac" "depcomp" "doc/CMakeLists.txt" "doc/Doxyfile.in" "doc/FLAC.tag" "doc/Makefile.am" "doc/Makefile.in" "doc/Makefile.lite" "doc/doxygen.footer.html" "doc/doxygen.header.html" "doc/html/Makefile.am" "doc/html/Makefile.in" "doc/html/api/FLAC_09_09_2all_8h_source.html" "doc/html/api/FLAC_09_09_2export_8h.html" "doc/html/api/FLAC_09_09_2export_8h_source.html" "doc/html/api/FLAC_09_09_2metadata_8h.html" "doc/html/api/FLAC_09_09_2metadata_8h_source.html" "doc
 /html/api/FLAC_2all_8h_source.html" "doc/html/api/FLAC_2export_8h.html" "doc/html/api/FLAC_2export_8h_source.html" "doc/html/api/FLAC_2metadata_8h.html" "doc/html/api/FLAC_2metadata_8h_source.html" "doc/html/api/annotated.html" "doc/html/api/assert_8h_source.html" "doc/html/api/bc_s.png" "doc/html/api/bdwn.png" "doc/html/api/callback_8h.html" "doc/html/api/callback_8h_source.html" "doc/html/api/classFLAC_1_1Decoder_1_1File-members.html" "doc/html/api/classFLAC_1_1Decoder_1_1File.html" "doc/html/api/classFLAC_1_1Decoder_1_1File.png" "doc/html/api/classFLAC_1_1Decoder_1_1Stream-members.html" "doc/html/api/classFLAC_1_1Decoder_1_1Stream.html" "doc/html/api/classFLAC_1_1Decoder_1_1Stream.png" "doc/html/api/classFLAC_1_1Decoder_1_1Stream_1_1State-members.html" "doc/html/api/classFLAC_1_1Decoder_1_1Stream_1_1State.html" "doc/html/api/classFLAC_1_1Encoder_1_1File-members.html" "doc/html/api/classFLAC_1_1Encoder_1_1File.html" "doc/html/api/classFLAC_1_1Encoder_1_1File.png" "doc/html/api/cla
 ssFLAC_1_1Encoder_1_1Stream-members.html" "doc/html/api/classFLAC_1_1Encoder_1_1Stream.html" "doc/html/api/classFLAC_1_1Encoder_1_1Stream.png" "doc/html/api/classFLAC_1_1Encoder_1_1Stream_1_1State-members.html"' failed with exit code 128:
fatal: pathspec 'test/flac-to-flac-metadata-test-files/Pr303270ve.flac' did not match any files



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4368664966129388157==--

