Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F80EEE208C
	for <webhook@archiver.kernel.org>; Fri,  6 Feb 2026 10:57:12 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8839.1770375421863936638
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Feb 2026 02:57:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mroLi4Gk;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-82361bcbd8fso404497b3a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Feb 2026 02:57:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770375421; x=1770980221; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OkViUDb4nIed+oho9pOxNX6l2rnrAJtg3fzQrq0MQHk=;
        b=mroLi4GkBbGOVjt7fbkw+NVl+eJcnOozejFA6snf7OgGTXCdWpqjYK7MXNc27BiVke
         F8rgNoKWMbTyyg064VppY/8vF8glgT+bQaoE4OBUc/5WQTQ6ApTm4jVy8+fCfX4gkBBw
         +uWIYEXGD1yBr+X4N03yBgtbSkdD/832xt03wQF83sn4FvqoFN6EyFyRlzqpXaqpROsd
         p+ao+YjABpHNI6c5YZ0WHXpHwzwC4TqPCuQ19lw8TlbLsKejZjSTmqRqzyfoL2RAdNMF
         G5msCjF1Ij5bYo2sBpTyben7XL2PjIYk3mQ/NFvHVjRk3SJ/2HBCYSvs+cKxUepDavYH
         q1Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770375421; x=1770980221;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OkViUDb4nIed+oho9pOxNX6l2rnrAJtg3fzQrq0MQHk=;
        b=dF7GW2bGScrB11Vjno8B8lagXLk8+pK1S1fgQenH1D+s1PfRbTWadi4x7FVeOgDSCg
         8tx+85+wLWE8ILhl1w4cecoBbdZIL6ob722mZZI9RNskT7F/jpuYDO8b7GCeM+QRTrN8
         1PymsGfTYvizNH7dWMHj/1R1D0PiGfoLoc+DRa9If2STZgyOMYaXmcrASetfG0Fe6ean
         De4U1DJuasAwXQ39JeSmhBdk6cli4gpiMZ75AcsYcYMYTwyhoIbk9C7rK7805sC2E5nT
         PbX9Muh8eMldYvLu3+GpcRGF5qMUzWdT7orRgv460ZBYhYY1rhfnBOsHZ1DkvyMlB4tq
         gh5g==
X-Gm-Message-State: AOJu0YwzKI178EzLd+28SDdJUVIT2fI8WXiGN49oIKSJ/vfB+IwjFxhK
	LqGvnjlK/1MnaJhdwE4+MifTLmESIQekyMrfL9wfxVRE1Q8i6ljn2yqlaKa2HQ==
X-Gm-Gg: AZuq6aJuBx3NuICwWa2V0gG/6Nuj5UfXPrWDMEexYFRF+5JtSKOKe+YVZpU6yag/4AP
	RKdPCJj7gyEeiuTqrBY/nBXnLn1hTSHsIzRPU1UYG8/YZNzXk8Mzk3bzArVR7D3myDXQhNejTy6
	kvaWWlKMC+bIrbR6XhYPUA9XBbverTSu0UBnPvMbZPob6ecaTONqt9c3ghqVQ9tOB8wwQU9bpU8
	jvaG8xut9udtxslr/OWTXfO8f0C9k5DljQpc5XtL9gbKcfltVYtRng4LUiP6nP1DuY9yF6n3V82
	7dSB3Pnt5ediwUWK4h1AFcr9/lqVfzJ3DYYsb3+HHYojLb2KNlEXMU6QuiZw45pjYHRZhoBH5SF
	9/zSdxATITDkyaNT3GdSxFCcAdLCy2GsrzbDs8QfuRzum7OSWA6uAVpZgpyf8qazVXCAPiUd1lZ
	krjRru5jdK+vtFMQQxUQK6sMg=
X-Received: by 2002:a05:6a20:cf8a:b0:38d:ed39:35a0 with SMTP id adf61e73a8af0-393ad39d3d9mr2794552637.61.1770375420986;
        Fri, 06 Feb 2026 02:57:00 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.33])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6dcb526676sm1779496a12.12.2026.02.06.02.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 02:57:00 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][whinlatter][PATCH 1/3] avahi: Backport fix CVE-2025-68276
Date: Fri,  6 Feb 2026 23:56:41 +1300
Message-ID: <20260206105643.2636897-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Feb 2026 10:57:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230610

From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>

Include the patch linked in the NVD report: https://github.com/avahi/avahi/pull/806/commits/0c013e2e819be3bda74cecf48b5f64956cf8a760

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 330160efaa755be1336dab62e502df307325c20c)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta/recipes-connectivity/avahi/avahi_0.8.bb  |  1 +
 .../avahi/files/CVE-2025-68276.patch          | 68 +++++++++++++++++++
 2 files changed, 69 insertions(+)
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2025-68276.patch

diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb b/meta/recipes-connectivity/avahi/avahi_0.8.bb
index 4fe8ba4d28..bd61c39dbf 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
@@ -37,6 +37,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/avahi-${PV}.tar.gz \
            file://CVE-2023-38473.patch \
            file://CVE-2024-52616.patch \
            file://CVE-2024-52615.patch \
+           file://CVE-2025-68276.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/avahi/avahi/releases/"
diff --git a/meta/recipes-connectivity/avahi/files/CVE-2025-68276.patch b/meta/recipes-connectivity/avahi/files/CVE-2025-68276.patch
new file mode 100644
index 0000000000..b3e11f9597
--- /dev/null
+++ b/meta/recipes-connectivity/avahi/files/CVE-2025-68276.patch
@@ -0,0 +1,68 @@
+From d5d18ced67e969d6a5052cacdbd7d4b2c97a1a3f Mon Sep 17 00:00:00 2001
+From: Evgeny Vereshchagin <evvers@ya.ru>
+Date: Wed, 17 Dec 2025 08:11:23 +0000
+Subject: [PATCH] core: refuse to create wide-area record browsers when
+ wide-area is off
+
+It fixes a bug where it was possible for unprivileged local users to
+crash avahi-daemon (with wide-area disabled) by creating record browsers
+with the AVAHI_LOOKUP_USE_WIDE_AREA flag set via D-Bus (either by calling
+the RecordBrowserNew method directly or by creating hostname/address/service
+resolvers/browsers that create those browsers internally themselves).
+
+```
+$ gdbus call --system --dest org.freedesktop.Avahi --object-path / --method org.freedesktop.Avahi.Server.ResolveHostName -- -1 -1 yo.local -1 1
+Error: GDBus.Error:org.freedesktop.DBus.Error.NoReply: Message recipient disconnected from message bus without replying
+```
+```
+dbus-protocol.c: interface=org.freedesktop.Avahi.Server, path=/, member=ResolveHostName
+avahi-daemon: wide-area.c:725: avahi_wide_area_scan_cache: Assertion `e' failed.
+==307948==
+==307948== Process terminating with default action of signal 6 (SIGABRT)
+==307948==    at 0x4B3630C: __pthread_kill_implementation (pthread_kill.c:44)
+==307948==    by 0x4ADF921: raise (raise.c:26)
+==307948==    by 0x4AC74AB: abort (abort.c:77)
+==307948==    by 0x4AC741F: __assert_fail_base.cold (assert.c:118)
+==307948==    by 0x48D8B85: avahi_wide_area_scan_cache (wide-area.c:725)
+==307948==    by 0x48C8953: lookup_scan_cache (browse.c:351)
+==307948==    by 0x48C8B1B: lookup_go (browse.c:386)
+==307948==    by 0x48C9148: defer_callback (browse.c:516)
+==307948==    by 0x48AEA0E: expiration_event (timeeventq.c:94)
+==307948==    by 0x489D3AE: timeout_callback (simple-watch.c:447)
+==307948==    by 0x489D787: avahi_simple_poll_dispatch (simple-watch.c:563)
+==307948==    by 0x489D91E: avahi_simple_poll_iterate (simple-watch.c:605)
+==307948==
+```
+
+wide-area has been disabled by default since
+9c4214146738146e454f098264690e8e884c39bd (v0.9-rc2).
+
+https://github.com/avahi/avahi/security/advisories/GHSA-mhf3-865v-g5rc
+
+CVE: CVE-2025-68276
+Upstream-Status: Backport [https://github.com/avahi/avahi/pull/806/commits/0c013e2e819be3bda74cecf48b5f64956cf8a760]
+
+Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
+---
+ avahi-core/browse.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/avahi-core/browse.c b/avahi-core/browse.c
+index e8a915e..59d53cb 100644
+--- a/avahi-core/browse.c
++++ b/avahi-core/browse.c
+@@ -541,6 +541,11 @@ AvahiSRecordBrowser *avahi_s_record_browser_prepare(
+     AVAHI_CHECK_VALIDITY_RETURN_NULL(server, AVAHI_FLAGS_VALID(flags, AVAHI_LOOKUP_USE_WIDE_AREA|AVAHI_LOOKUP_USE_MULTICAST), AVAHI_ERR_INVALID_FLAGS);
+     AVAHI_CHECK_VALIDITY_RETURN_NULL(server, !(flags & AVAHI_LOOKUP_USE_WIDE_AREA) || !(flags & AVAHI_LOOKUP_USE_MULTICAST), AVAHI_ERR_INVALID_FLAGS);
+ 
++    if ((flags & AVAHI_LOOKUP_USE_WIDE_AREA) && !server->wide_area_lookup_engine) {
++        avahi_server_set_errno(server, AVAHI_ERR_NOT_SUPPORTED);
++        return NULL;
++    }
++
+     if (!(b = avahi_new(AvahiSRecordBrowser, 1))) {
+         avahi_server_set_errno(server, AVAHI_ERR_NO_MEMORY);
+         return NULL;
+-- 
+2.34.1
+

