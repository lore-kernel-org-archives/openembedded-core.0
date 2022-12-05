Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8F38C3A5A7
	for <webhook@archiver.kernel.org>; Mon,  5 Dec 2022 02:25:41 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web11.5323.1670207126459901017
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Dec 2022 18:25:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=AAO+y0yI;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1670207131; i=@fujitsu.com;
	bh=OV1pMLNJ/xK/3XywGid4S+HGL6lg6RpxLg3llCHmvO0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=AAO+y0yIEdF6kFLflx729e5GkY6RTtTVjZCfY45or4+eAGhr511cgrZ4EJhpRraci
	 FLBjitsOOkK+u8n3OEHoAKU5Xgon9JY5GL4b1f301/9AMvQ7s634deszUw+ktULYFT
	 fVZvttoid+9dm2LkY57v6/ChbBrspOtjnYJHqosQTyiWACecoQVpF0qxdsLMmXkdUP
	 ZskWkz5XOf2YRNrZmr2K/AcNGStWAnRd/9DszdNAz+qGV+eaxmxE7fT1YvvAVvxFoI
	 5Vcc/4YZ4RKBZldfMl3Vyw1dFQDDakQ9ySlay/iLYFhQUttlSszStGGaZAEEfLUPlN
	 GTMJn8hqtFmMA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrHIsWRWlGSWpSXmKPExsViZ8OxWXdWWG+
  ywdwWPYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNeP0+qusBa8UKlo6ZjE1ML6Q7mLk4hASeMAo
  8XfOQlYI5xKTxJf3x5kgnN2MEhPvzWLuYuTkYBOQkrhx/z9bFyMHh4iAnsTVf6IgYWYBFYkXv
  3vYQWxhAVuJB4d6mUBsFqD4tnPvwFp5BRwlrq2exAJiSwgoSEx5+B4szingJPF59XNWEFsIqO
  bN9xOsEPWCEidnPmGBmC8hcfDFC2aIXkWJ2ZeboeZUSMya1cYEYatJXD23iXkCo+AsJO2zkLQ
  vYGRaxWhWnFpUllqka2iml1SUmZ5RkpuYmaOXWKWbqJdaqlueWlyia6SXWF6sl1pcrFdcmZuc
  k6KXl1qyiREYvCnFilt3MN5Y9kfvEKMkB5OSKK/So+5kIb6k/JTKjMTijPii0pzU4kOMMhwcS
  hK8K4N6k4UEi1LTUyvSMnOAkQSTluDgURLhFfIGSvMWFyTmFmemQ6ROMVpyrG04sJeZ4+qVK0
  By5te2A8xCLHn5ealS4rzdIUANAiANGaV5cONg0X6JUVZKmJeRgYFBiKcgtSg3swRV/hWjOAe
  jkjCvmy/QFJ7MvBK4ra+ADmICOmgjfxfIQSWJCCmpBqZd/49OmTIvyYX107QHp+rFDi9vtRDh
  EPg1bUXNDJPr2vNOSSeHvt+tK145qS+1q3GC1FWPuhjrDXqF7KJ6Wlv295m2B6oeZ/4n0OpUu
  4Vp+5Hara/9Noo8OP/26OW7qRsvNlQ7P+Q++D2j7pz8pRvcmbvvL5Go76p8EaP+efNnxfCFaZ
  t5Jmbf+/VwpfW03X96uvnZLQVWLLvmv+oj03wrw4l1prf4uronHpm1+Uitg6/B7HwVLVnefz1
  vHdPOL6zek6h87sjzpQVHfhkVxyzQjvtjdaOQYWbDhdQElgc/OQtcTN6v+yhQv3KL9mzuarm6
  ty56+r/U7wnnK+fLves5aHPmUtWmmRfvfv+wJFJMiaU4I9FQi7moOBEABGMmKHEDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-14.tower-565.messagelabs.com!1670207130!131610!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6000 invoked from network); 5 Dec 2022 02:25:30 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-14.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 5 Dec 2022 02:25:30 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 78729151
	for <openembedded-core@lists.openembedded.org>; Mon,  5 Dec 2022 02:25:30 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 6B3C17B
	for <openembedded-core@lists.openembedded.org>; Mon,  5 Dec 2022 02:25:30 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 5 Dec 2022 02:25:28 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libinput: upgrade 1.21.0 -> 1.22.0
Date: Mon, 5 Dec 2022 10:24:54 +0800
Message-ID: <1670207094-6846-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1670207094-6846-1-git-send-email-wangmy@fujitsu.com>
References: <1670207094-6846-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Dec 2022 02:25:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174260

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
 CI: prettify the include of templates
 CI: remove one occurrence of fedora instead of distro.name
 CI: make freebsd slightly more in line with others
 CI: remove unused test
 CI: do not retry the qemu runs
 CI: rely on b2c to start qemu tests
 CI: include systemd-udev in the fedora image
 CI: start a full systemd environment before running the testsuite
 CI: in b2c, compile on the host, then test in qemu
 quirks: update quirks for Lenovo IdeaPad Duet 3
 quirks: add Lenovo Legion 7 keyboard
 libwacom: fix warnings building without libwacom
 tablet: check libevdev_get_abs_info() return value
 tablet: avoid errors calling libevdev_get_abs_info()
 meson.build: always set HAVE_GTK_WAYLAND
 tools: hide debug-gui help when building with -Ddebug-gui=false
 debug-gui: avoid locking pointer twice
 util: use ck_assert_ptr_eq() instead of ck_assert_ptr_null()
 touchpad: add escape and asterisk to the DWT blacklist
 libinput 1.22.0
 quirks: add quirks for Acer Spin 513 (Lazor)
 quirks: add generic quirks for ARM based chromebooks
 quirks: add volume rocker quirk for Lenovo IdeaPad Duet 3i
 quirks: Add quirks for Surface Laptop Studio touchpad
 quirks: Add quirks to improve tablet-mode on the Surface Laptop Studio
 gitlab CI: drop the manual meson to junit conversion
 meson.build: drop listing of header files from compilation targets
 meson.build: fix build without Wayland
 gitlab CI: dnf remove gtk4-devel for the no-debug-gui deps job
 CODING_STYLE: update with a better description for variable assignments
 evdev: fix a tab vs space indentation issue
 doc/user: minor rewording of the pointer accel profile list
 gitlab ci: drop EOL'd ubuntu 21.10
 tools: add missing dwtp option setting
 evdev: remove duplicate "device is a switch" message
 gitlab-ci: export MESON_TESTTHREADS so meson actually sees it
 gitlab-ci: explicitly call "meson setup" to improve readability
 gitlab-ci: add commandline options to the meson-build.sh script
 CI: drop the job count for the valgrind test suite to 2
 filter: a few whitespace fixes and extra comments
 filter: fix the mix of normalized vs device coordinates
 filter: remove an unnecessary layer of indirection
 filter: constify the tracker API
 filter: localize a few variables
 evdev: rename post_trackpoint_scroll to post_button_scroll
 filter: constify the interfaces and make them static
 filter: don't normalize the const filter approach
 evdev: use filter_dispatch_constant() for button scrolling
 evdev: use filter_dispatch_constant() for the lenovo trackpoint "wheel"
 filter: don't normalize the speed again in the default mouse filter
 filter: apply the same factor for constant motion as for normal motion
 filter: add a flat trackpoint accel
 gitlab CI: don't install valgrind, it's already in the template
 gitlab CI: update freebsd to 13.1
 gitlab CI: pre-install all packages we need
 Fix Framework quirk so it wirks with 12 gen intel
 util: return the number of elements from strv_from_string
 meson: use install_emptydir to create directory
 test: exclude the two high-delay debounce tests from the valgrind CI run

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../wayland/{libinput_1.21.0.bb => libinput_1.22.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/wayland/{libinput_1.21.0.bb => libinput_1.22.0.bb} (97%)

diff --git a/meta/recipes-graphics/wayland/libinput_1.21.0.bb b/meta/recipes-graphics/wayland/libinput_1.22.0.bb
similarity index 97%
rename from meta/recipes-graphics/wayland/libinput_1.21.0.bb
rename to meta/recipes-graphics/wayland/libinput_1.22.0.bb
index cf59bd81c5..5a5fc9f35d 100644
--- a/meta/recipes-graphics/wayland/libinput_1.21.0.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.22.0.bb
@@ -16,7 +16,7 @@ SRC_URI = "git://gitlab.freedesktop.org/libinput/libinput.git;protocol=https;bra
            file://run-ptest \
            file://determinism.patch \
            "
-SRCREV = "bc363328a704b3c5e0ee2f0fcf088de67c708979"
+SRCREV = "fc59e574e050c502c9a3adefacf97babf3d09c7a"
 S = "${WORKDIR}/git"
 
 UPSTREAM_CHECK_REGEX = "libinput-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
-- 
2.25.1


