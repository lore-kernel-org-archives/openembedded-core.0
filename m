Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCEECC369A3
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 12:43:12 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.18039.1743511388019161033
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 05:43:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Oc1dRsis;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=asBcq3Ep;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010195f1607c43-a0ac2f0c-edf8-4b09-868c-c022fff9f506-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1743511387;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=sDoivw16pv0HckDGS05tK/ie6HCNSeinG1GIzmwXKzk=;
	b=Oc1dRsis2lxp4O3TkeU6LDa+sEevo2Gh3TQPWR5ewtAWKNXpFwlRxPuUEOz28ZWA
	DScrLMrOoF1nL4Alv8FKwr13tAIQoT6Q1kDIe3MCQUxy4wLRdHnx9wRzQ3iQpl26UGZ
	rBEEB+iqOOM6PWlwBXfx+ZWZzdzsFSbW1uTSWlac=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1743511387;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=sDoivw16pv0HckDGS05tK/ie6HCNSeinG1GIzmwXKzk=;
	b=asBcq3Ep6TKx/TXkFtIK+XHyAPhShWkYAFRuI7JYdTat0bgYdbVs6GDowhVajUIT
	enjKSV9Gz9SZEddgRszPt8ncjEBOLT7byDLfOfa4eJuUuPvOUhGjGORLI6Uchzj60d7
	RwpQ8RGZO1wGMnl3jLRcxm/0FKGhEjG6hCLE8xsc=
Content-Type: multipart/mixed; boundary="===============1446742885184835125=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>, Anuj Mittal <anuj.mittal@intel.com>, 
	Anuj Mittal <anuj.mittal@intel.com>, 
	Anuj Mittal <anuj.mittal@intel.com>, 
	Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH]
 gstreamer1.0-rtsp-server,gstreamer1.0-plugins-base,gstreamer1.0-plugins-good,gstreamer1.0-plugins-ugly,gstreamer1.0-plugins-bad:
 upgrading to 1.26.0,1.26.0,1.26.0,1.26.0,1.26.0 FAILED
Message-ID: <01010195f1607c43-a0ac2f0c-edf8-4b09-868c-c022fff9f506-000000@us-west-2.amazonses.com>
Date: Tue, 1 Apr 2025 12:43:07 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.04.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 12:43:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214030

--===============1446742885184835125==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gstreamer1.0-rtsp-server,gstreamer1.0-plugins-base,gstreamer1.0-plugins-good,gstreamer1.0-plugins-ugly,gstreamer1.0-plugins-bad* to *1.26.0,1.26.0,1.26.0,1.26.0,1.26.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade gstreamer1.0-plugins-bad -V 1.26.0
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1886 entries from dependency cache.
Parsing recipes...done.
Parsing of 928 .bb files complete (924 cached, 4 parsed). 1890 targets, 39 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.12.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:f8df60281b654061508d217a79714ce569e1c354"

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
Parsing of 929 .bb files complete (0 cached, 929 parsed). 1891 targets, 39 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.12.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:f8df60281b654061508d217a79714ce569e1c354"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 9 Mirrors 0 Missed 1 Current 18 (90% match, 96% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-f2ov0hjj: the directory /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-4eoltwq7/emptysrc (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-4eoltwq7/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
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
--===============1446742885184835125==--

