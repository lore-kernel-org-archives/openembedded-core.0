Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 005DAC5DF81
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 09:14:20 +0000 (UTC)
Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3101.1787217255498984693
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2026 02:14:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Iue2YN5f;
 spf=pass (domain: cisco.com, ip: 173.37.86.79, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3601; q=dns/txt;
  s=iport01; t=1787217255; x=1788426855;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=bfkBxLGC/3jLs0PTKqG/jfPIY8LKBsf4cKlWabXl+pI=;
  b=Iue2YN5ftIvMUaqRE0l4h7w0NIdtouD6GTKuzJMaLyNPEp20ZlHPoPxG
   M/Mt0tCvIl+DEah5NRhjX8H9NQOPTVKKlhmuYkKtuBOxQxmYz/4HfWZYH
   jil6mqipX9e02cqIbynsb4hz/fN9X31gMkc68esD/RBcpvarxOnNVDIhG
   1EczrTswjO80XWdXo8VR/ocbgkMTw/CHmQiCf8U8IvIVHroLBGvYiRLSy
   YoWzQ1fGyTDU35ucW0Yh6G5gFBI5PwbNwNQytdKh8WEcJNOaZb19GDCG7
   Kp9GZBX+ImPbELXxAkcnPmmyFvO1InBQHbHgcMBoVdUAXDhAVPZapSP4y
   Q==;
X-CSE-ConnectionGUID: y+b2aewYTXiqun/XKiC48w==
X-CSE-MsgGUID: XK4zv0eLQU23FdNhfx3QEQ==
X-IPAS-Result: =?us-ascii?q?A0BCAgANxIZq/43/Ja1aHgEBCxIMggULgld0X0JJlCmCI?=
 =?us-ascii?q?Z4egX4PAQEBD0QNBAEBknICJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBA?=
 =?us-ascii?q?QIBBwWBDhOGTw2GWgE4AXIDAQJaIxkIgwIBgjoDNwMRwWwaN4IsgQGEfdswA?=
 =?us-ascii?q?QsUAYE4hT+IIl2FFScbG4FygRWDaYIfQgWIIgSCIoEMgVoegmOBF41YSIEeA?=
 =?us-ascii?q?1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4ENGwYFgR2BKIQ3Ixk2fIEJXoErK?=
 =?us-ascii?q?mISF4EJggoCgnCCBgIBSUUOCRcLGA1IESw3FBkEPm4HjlEggkQGAQF6EwErI?=
 =?us-ascii?q?oFyNKVXoRIKKIN2jCGVOhozhVulES6YWo4KllCEaYFoPIFZcBWDIglKGQ+SI?=
 =?us-ascii?q?4UTxw48NQsyAgcCBw4DC5NmAQE?=
IronPort-Data: A9a23:pTmEgKwSuswby82D83N6t+dmxyrEfRIJ4+MujC+fZmUNrF6WrkVWz
 DYXWD3TOvbYNmP1e41/b4nj801SuZeEytJlSFFp+FhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCea/VH1buSJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 46aT/H3Ygf/hWYkazNMscpvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJFB1N9cR9/lGPVFP7
 OEebwAubzvf1/3jldpXSsE07igiBNPgMIVavjRryivUSK56B5vCWK7No9Rf2V/chOgXQq2YP
 JVfM2cyKk2cOnWjOX9PYH46tOuli2P2bz1fgFmUvqEwpWPUyWSd1ZCwaYCPK4bVGpk9ckCwl
 kGa7XqhDzUjCYbE5zaj8ny83dbipHauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8gUmkVvpbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJKGOE8rQXIwa3O7kPBWi4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rEnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:IEGpIK3p4Dh1nGPwkrJRvAqjBIIkLtp133Aq2lEZdPUzSL37qy
 nAppomPHPP5Qr5O0tQ+uxoRpPgfZq0z/cciuMs1NyZMzUO1lHFEGgb1+vf6gylPTHi/ehA0q
 olWa1/BNrsSWVet6/BkWyF+xJK+qjhzEhu7t2uq0tQcQ==
X-Talos-CUID: 9a23:1NQKVm8E89ha4XW/RQyVv19XEJosf2Ls8EfROlK+TlZKSZbJGUDFrQ==
X-Talos-MUID: 9a23:CjTEogqUG69eIGQWy5gezwFBaNV2u6mKMX1XyrsKncmKJXdJFg7I2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,232,1779148800"; 
   d="scan'208";a="512292774"
Received: from rcdn-l-core-04.cisco.com ([173.37.255.141])
  by rcdn-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Aug 2026 09:14:14 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-04.cisco.com (Postfix) with ESMTPS id 61EB018000184
	for <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 09:14:14 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id 87259CC037D; Thu, 20 Aug 2026 14:44:12 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH] qemu: guard RESOLVE_CACHED strace flag
Date: Thu, 20 Aug 2026 14:42:54 +0530
Message-Id: <20260820091254.1000114-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: rcdn-l-core-04.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 09:14:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243845

From: Deepak Rathore <deeratho@cisco.com>

qemu-native build can fail on build hosts which have an older
linux/openat2.h header. The header is new enough to enable
HAVE_OPENAT2_H, but it does not have RESOLVE_CACHED because that flag
was added later in kernel 5.12.

In that case linux-user/strace.c tries to use RESOLVE_CACHED and build
fails with:

    error: 'RESOLVE_CACHED' undeclared here

This is mainly seen with qemu-native because it is built for the host
and can pick the host kernel UAPI header. The buildtools header may have
RESOLVE_CACHED, but native build still has to be safe with older host
headers also.

Add the upstream QEMU fix which checks RESOLVE_CACHED before using it.
This does not change anything on newer hosts. On older hosts QEMU just
does not print this one strace flag because the local header does not
know about it.

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 ...-if-RESOLVE_CACHED-flag-is-defined-b.patch | 38 +++++++++++++++++++
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0012-linux-user-Check-if-RESOLVE_CACHED-flag-is-defined-b.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 60a5c62fe9..cc8f2ecdfa 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -41,6 +41,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2026-0665.patch \
            file://CVE-2025-14876_p1.patch \
            file://CVE-2025-14876_p2.patch \
+           file://0012-linux-user-Check-if-RESOLVE_CACHED-flag-is-defined-b.patch \
            "
 # file index at download.qemu.org isn't reliable: https://gitlab.com/qemu-project/qemu-web/-/issues/9
 UPSTREAM_CHECK_URI = "https://www.qemu.org"
diff --git a/meta/recipes-devtools/qemu/qemu/0012-linux-user-Check-if-RESOLVE_CACHED-flag-is-defined-b.patch b/meta/recipes-devtools/qemu/qemu/0012-linux-user-Check-if-RESOLVE_CACHED-flag-is-defined-b.patch
new file mode 100644
index 0000000000..fc86d68e7d
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0012-linux-user-Check-if-RESOLVE_CACHED-flag-is-defined-b.patch
@@ -0,0 +1,38 @@
+From 09e077b87eed754cc0aac0f54d193d49f978c93f Mon Sep 17 00:00:00 2001
+From: Frank Chang <frank.chang@sifive.com>
+Date: Thu, 12 Feb 2026 17:54:49 +0800
+Subject: [PATCH] linux-user: Check if RESOLVE_CACHED flag is defined before
+ using it
+
+Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit/7ac4bded6af90a15a9562515743a789236b062d1]
+
+openat2.h was introduced in Linux kernel 5.6. However, RESOLVE_CACHED
+flag was only added in kernel 5.12 and later. Therefore, we need to check
+if RESOLVE_CACHED flag is defined before using it.
+
+Signed-off-by: Frank Chang <frank.chang@sifive.com>
+Reviewed-by: Helge Deller <deller@gmx.de>
+Signed-off-by: Helge Deller <deller@gmx.de>
+(cherry picked from commit 7ac4bded6af90a15a9562515743a789236b062d1)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ linux-user/strace.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/linux-user/strace.c b/linux-user/strace.c
+index 758c5d32b6..a903b414fd 100644
+--- a/linux-user/strace.c
++++ b/linux-user/strace.c
+@@ -1125,7 +1125,9 @@ UNUSED static const struct flags openat2_resolve_flags[] = {
+     FLAG_GENERIC(RESOLVE_NO_SYMLINKS),
+     FLAG_GENERIC(RESOLVE_BENEATH),
+     FLAG_GENERIC(RESOLVE_IN_ROOT),
++#ifdef RESOLVE_CACHED
+     FLAG_GENERIC(RESOLVE_CACHED),
++#endif
+ #endif
+     FLAG_END,
+ };
+-- 
+2.35.6
+
-- 
2.35.6


