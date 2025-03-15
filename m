Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C6EDC36004
	for <webhook@archiver.kernel.org>; Sat, 15 Mar 2025 14:18:20 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.10357.1742048292608056005
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Mar 2025 07:18:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=DVP+Xncp;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Iw5oQZvG;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101959a2b6c66-61077d5a-c6a2-405b-8759-5794a0ef9f55-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1742048292;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=LYl0Qwq1RPeoCuCNiebTnfEXpW26eoVzufkrYTffHdY=;
	b=DVP+XncpT1p0vU5iSKahTIsaB4gtjPhlGykQx+JyLw6fEkqnyb5CltGg/qq5lbPb
	14SxTzLYegDlbs7w1nxTI//ZbY8MDW0iM2bEjSd0RpWCxjGL15TEHkutLfzIe7412ST
	mU32gUUd59VF5sHWL1OU1SFmfCTmmDpvoQfOZUmA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1742048292;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=LYl0Qwq1RPeoCuCNiebTnfEXpW26eoVzufkrYTffHdY=;
	b=Iw5oQZvGCT0yyaGJziF10Y8cz0d0Pr98pS/LuHVTahokdnV5vVDpLxWViu24W9ue
	EV4TXmneAWk/BB4ytQz9pwmTTwV8MCbmQ2M7YxVa9wE05fcJ7wST6qhMczKpJZOKJzM
	r1YI4E+Zrp9ZhppmXhX/t+RMlZd9JxGks5dbkt6k=
Content-Type: multipart/mixed; boundary="===============4100450605673882017=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>, Anuj Mittal <anuj.mittal@intel.com>, 
	Anuj Mittal <anuj.mittal@intel.com>, 
	Anuj Mittal <anuj.mittal@intel.com>, 
	Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH]
 gstreamer1.0-plugins-ugly,gstreamer1.0-plugins-bad,gstreamer1.0-rtsp-server,gstreamer1.0-plugins-good,gstreamer1.0-plugins-base:
 upgrading to 1.26.0,1.26.0,1.26.0,1.26.0,1.26.0 FAILED
Message-ID: <010101959a2b6c66-61077d5a-c6a2-405b-8759-5794a0ef9f55-000000@us-west-2.amazonses.com>
Date: Sat, 15 Mar 2025 14:18:11 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.03.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Mar 2025 14:18:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212885

--===============4100450605673882017==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gstreamer1.0-plugins-ugly,gstreamer1.0-plugins-bad,gstreamer1.0-rtsp-server,gstreamer1.0-plugins-good,gstreamer1.0-plugins-base* to *1.26.0,1.26.0,1.26.0,1.26.0,1.26.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade gstreamer1.0-plugins-bad -V 1.26.0
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1884 entries from dependency cache.
Parsing recipes...done.
Parsing of 924 .bb files complete (923 cached, 1 parsed). 1885 targets, 39 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:d08db7bd6f784e3908aad3a7c157a9fe0be7fb33"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 11 Local 11 Mirrors 0 Missed 0 Current 22 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 113 tasks of which 110 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 925 .bb files complete (0 cached, 925 parsed). 1886 targets, 39 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:d08db7bd6f784e3908aad3a7c157a9fe0be7fb33"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 9 Mirrors 0 Missed 1 Current 18 (90% match, 96% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-qk0xwc9k: the directory /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-f75eivb9/emptysrc (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-f75eivb9/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   8% |###                                 | ETA:  0:00:01
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-1.26.0.tar.xz...
ERROR: Execution of 'git add -f -A "sys/d3d12/gstd3d12window-win32.h" "sys/d3d12/gstd3d12yadif.cpp" "sys/d3d12/gstd3d12yadif.h" "sys/dwrite/gstdwriterender.cpp" "sys/dwrite/gstdwriterender.h" "sys/dwrite/gstdwriterender_bitmap.cpp" "sys/dwrite/gstdwriterender_bitmap.h" "sys/dwrite/gstdwriterender_d3d11.cpp" "sys/dwrite/gstdwriterender_d3d11.h" "sys/dwrite/gstdwriterender_d3d12.cpp" "sys/dwrite/gstdwriterender_d3d12.h" "sys/nvcodec/gstcudacompositor.cpp" "sys/nvcodec/gstcudacompositor.h" "sys/nvcodec/gstcudaconverter.cpp" "sys/nvcodec/gstcudainterop_d3d12.cpp" "sys/nvcodec/gstcudainterop_d3d12.h" "sys/nvcodec/gstnvav1encoder.cpp" "sys/nvcodec/gstnvav1encoder.h" "sys/nvcodec/gstnvcodecutils.cpp" "sys/nvcodec/kernel/collect_ptx_headers.py" "sys/nvcodec/kernel/gstcudaconverter-unpack.cu" "sys/nvcodec/kernel/gstcudaconverter.cu" "sys/nvcodec/kernel/gstnvjpegenc.cu" "sys/nvcodec/kernel/meson.build" "sys/v4l2codecs/linux/drm_fourcc.h" "sys/va/gstvacodecalphadecodebin.c" "sys/va/gstvacodecal
 phadecodebin.h" "sys/va/gstvah266dec.c" "sys/va/gstvah266dec.h" "sys/va/gstvajpegenc.c" "sys/va/gstvajpegenc.h" "sys/va/gstvavp8enc.c" "sys/va/gstvavp8enc.h" "sys/va/gstvavp9enc.c" "sys/va/gstvavp9enc.h" "sys/webview2/gstwebview2object.cpp" "sys/webview2/gstwebview2object.h" "sys/webview2/gstwebview2src.cpp" "sys/webview2/gstwebview2src.h" "sys/webview2/meson.build" "sys/webview2/plugin.cpp" "tests/check/elements/dashsink.c" "tests/check/elements/h266parse.c" "tests/check/libs/d3d12device.cpp" "tests/check/libs/h266parser.c" "tests/check/libs/jpegbitwriter.c" "tests/check/libs/vkcodecparams_h264.c" "tests/check/libs/vkcodecparams_h265.c" "tests/check/libs/vkvideoencodeh264.c" "tests/check/libs/vkvideoencodeh265.c" "tests/check/libs/vp9bitwriter.c" "tests/examples/codecparsers/parse-h264-drop-frames.c" "tests/examples/cuda/cuda-template.c" "tests/examples/cuda/cudamemory-sync.c" "tests/examples/cuda/cudamemorypool.c" "tests/examples/cuda/meson.build" "tests/examples/cuda/nvenc-extern
 -pool.c" "tests/examples/cuda/template-plugin/cuda-transform-ip-template.c" "tests/examples/cuda/template-plugin/cuda-transform-ip-template.h" "tests/examples/cuda/template-plugin/plugin.c" "tests/examples/d3d11/d3d11decoder-appsink2.cpp" "tests/examples/d3d12/d3d12swapchainsink-win32.cpp" "tests/examples/d3d12/d3d12swapchainsink-winrt.cpp" "tests/examples/d3d12/d3d12videosink-overlay.cpp" "tests/examples/d3d12/d3d12videosink-switch.cpp" "tests/files/audio-8s-then-reverse.ogg" "tests/interactive/pitch-playback-test.c" "tests/validate/autovideoconvert/renegotiate/flow-expectations/log-^convert-src$-expected" "tests/validate/pitch/change_pitch_properties.validatetest" "tests/validate/pitch/change_pitch_properties/flow-expectations/log-pitch-src-expected" "tests/validate/pitch/maintain_pitch_with_variable_playback_rates.validatetest" "tests/validate/pitch/maintain_pitch_with_variable_playback_rates/flow-expectations/log-pitch-src-expected" "tests/validate/pitch/pitch-test.meta" "tests/
 validate/pitch/reverse.change_pitch_properties.validatetest" "tests/validate/pitch/reverse.change_pitch_properties/flow-expectations/log-pitch-src-expected" "tests/validate/pitch/reverse.maintain_pitch_with_variable_playback_rates.validatetest" "tests/validate/pitch/reverse.maintain_pitch_with_variable_playback_rates/flow-expectations/log-pitch-src-expected" "ChangeLog" "NEWS" "README.md" "RELEASE" "docs/libs/cuda/index.md" "docs/meson.build" "docs/plugins/gst_plugins_cache.json" "ext/aes/meson.build" "ext/analyticsoverlay/gstobjectdetectionoverlay.c" "ext/analyticsoverlay/meson.build" "ext/aom/gstav1enc.c" "ext/aom/gstav1enc.h" "ext/aom/meson.build" "ext/assrender/meson.build" "ext/avtp/gstavtpsrc.c" "ext/avtp/gstavtpsrc.h" "ext/avtp/meson.build" "ext/bs2b/meson.build" "ext/bz2/meson.build" "ext/chromaprint/meson.build" "ext/closedcaption/ccutils.c" "ext/closedcaption/ccutils.h" "ext/closedcaption/gstcccombiner.c"' failed with exit code 128:
fatal: pathspec 'tests/validate/autovideoconvert/renegotiate/flow-expectations/log-^convert-srchBcexpected' did not match any files



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4100450605673882017==--

