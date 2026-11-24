Received: from aer-iport-8.cisco.com (aer-iport-8.cisco.com [173.38.203.70])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14765.1795513776543561315
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 01:49:37 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=FeoVQvXN;
 spf=pass (domain: cisco.com, ip: 173.38.203.70, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2949; q=dns/txt;
  s=iport01; t=1795513776; x=1796723376;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=RD5n2Ve/Uob0fCrqOv5eeMHUJkoSxwpzw89FO2B6aM0=;
  b=FeoVQvXNiLcfnRQJK252ZQe3zx2ikmpTh61QPlNzskAjq/5ipfxDGkB8
   HMuwiUl7uzkvJj0pIgB9zuS11NesHGINMSowYHSIkCtC0IAmKmoGSeBGo
   AbHf0744J4HMRRFXWXo1ofICOZXh9SQd7BlQlZLMqlVi93jC0AIVIsJ9j
   +xz//PM6l3EnRbl8X3CRQK+mr2ZUuLLhh87xo3R3tNWpl11V05iYNtRmm
   SoYZPvCnUArOX1IM+ZZ5ZlK3xhJ1ZhNJG/C4dOhZq3kNFZek/E6c1c1Z7
   gFQHOrFrqHRf/MqLMoUs0os+fy1cXUIXk/F7BBArYcRoTc9kToISljel3
   w==;
X-CSE-ConnectionGUID: Qifav9JDS3We+xZ3tgAOfw==
X-CSE-MsgGUID: +N/VfJJ5Rw+AKYx9lQFD4Q==
X-IPAS-Result: =?us-ascii?q?A0BEAgBZWwVr/9BK/pBaglmCV3VgQ0mUKoIhniwUgWoPA?=
 =?us-ascii?q?QEBD0QNBAEBkykCJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBAQECAQcFg?=
 =?us-ascii?q?Q4Thk8NkBIBLQsBGAFZAwECWiMhgwIBgnQDEbpkgXkzgQGDKQE/AkNQ2zMBC?=
 =?us-ascii?q?xQBgTiFQogkXRgBhH0nGxuBcoR/gQWBXAICGIENIGaFeQSCInoSgVQejHkCg?=
 =?us-ascii?q?U+ISUiBHgNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjOxeBBxsGBYEcgR6BEoEDX?=
 =?us-ascii?q?YErKF4hgQiBdgKCUYIAAgFJQQ4HRVMJJUMSRyQiCBIJARMaLAqBGjU8CSY/F?=
 =?us-ascii?q?QxnCxoFYQgCDQx0ORAwHiQvBRomPhsKgQwnHx4bDgIfEAYWIQsbGA1IESw3F?=
 =?us-ascii?q?RkEPm4HlBSDCBJYIwkKASoBUEgIZDk9kmCSR4E1n1wKKIN5jCSVOhozhVulF?=
 =?us-ascii?q?wuYfY4KllGEaoFoPIFZcBWDIglKGQ+OOYNrhFg7yUgmMgIJMgEBBwIHDgMLg?=
 =?us-ascii?q?WiQAIF+AQE?=
IronPort-Data: A9a23:J375dayuPXh9e3pbbhF6t+djxyrEfRIJ4+MujC+fZmUNrF6WrkUHz
 2YYXjuDMvmPMGr3eN52bIW+/BwE756Emoc3GgRpr1hgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCKa/lH9aOWJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 4yaT/H3Ygf/hWctaDlMscpvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJHg3M4QGq8RbOjpx+
 L8IGmsRYTmkif3jldpXSsE07igiBMDmJsYb/3pn1zycValgSpHYSKKM7thdtNsyrpkSQbCEO
 pZfNmYpNkyQC/FMEg9/5JYWkOq2j3/kcyVwo1OOrq1x6G/WpOB0+Oa1aYuKJobbLSlTtgW+4
 VzI3UakOA5ZHf+u2WuBy1yA2taayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PK+kEOWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0UtdKVul/4waXx++MvECSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXMIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:v+dh/qs1gq9YPIxAq9I8b4Ra7skDRtV00zEX/kB9WHVpm6uj5q
 KTdZsguyMc5Ax9ZJhCo6HiBED/exLhHPdOiOF7V4tKNzOIhILHFu1fBPPZowHIKmnZ6vNX07
 tmfuxVDd39CkU/sOPBiTPIdurJBLK8gceVbSC09QYIcT1X
X-Talos-CUID: 9a23:Itqfn28vN6qFh+bhC3WVv3cVFMk7I1/x9yzvLgyoOz11R5SyR0DFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3AG0GyYA8EkSYAU+N5J/GcouuQf4ROpJqgKmJQq4p?=
 =?us-ascii?q?Fkuq1JX10Ahmx0A3iFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,229,1787011200"; 
   d="scan'208";a="60197429"
Received: from aer-l-core-07.cisco.com ([144.254.74.208])
  by aer-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Nov 2026 09:49:34 +0000
Received: from sjc-ads-4935.cisco.com (sjc-ads-4935.cisco.com [10.28.39.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-07.cisco.com (Postfix) with ESMTPS id 5D3DA18000241
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 09:49:34 +0000 (GMT)
Received: by sjc-ads-4935.cisco.com (Postfix, from userid 1887503)
	id 138D8CC2EF3; Tue, 24 Nov 2026 01:49:33 -0800 (PST)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH 1/2] zlib: fix CVE-2026-85091
Date: Tue, 24 Nov 2026 01:49:32 -0800
Message-Id: <20261124094933.1559995-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-4935.cisco.com [10.28.39.199];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.39.199, sjc-ads-4935.cisco.com
X-Outbound-Node: aer-l-core-07.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 09:49:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250994
Content-Type: text/plain; charset="utf-8"

From: Devansh Patel <devanshp@cisco.com>

This patch applies the upstream zlib 1.4 backport for
CVE-2026-85091. The upstream fix commit is referenced in [1], and
the public CVE advisory is referenced in [2].

Reset the retained caller-buffer input state after a failed direct
write. Adapt the error branch to zlib 1.3.1 while retaining its
existing return value; non-blocking support is not required.

[1] https://github.com/madler/zlib/commit/df84af25dc1942490e1d1c899a07619152a46148
[2] https://www.cve.org/CVERecord?id=CVE-2026-85091

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 .../zlib/zlib/CVE-2026-85091.patch            | 40 +++++++++++++++++++
 meta/recipes-core/zlib/zlib_1.3.1.bb          |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-core/zlib/zlib/CVE-2026-85091.patch

diff --git a/meta/recipes-core/zlib/zlib/CVE-2026-85091.patch b/meta/recipes-core/zlib/zlib/CVE-2026-85091.patch
new file mode 100644
index 00000000..1905df18
--- /dev/null
+++ b/meta/recipes-core/zlib/zlib/CVE-2026-85091.patch
@@ -0,0 +1,40 @@
+From 529a7dec05d4d7c39582715bf2b9c50ec633b5f4 Mon Sep 17 00:00:00 2001
+From: Mark Adler <git@madler.net>
+Date: Wed, 16 Sep 2026 16:26:14 -0700
+Subject: [PATCH] Fix buffer overflow bug in non-blocking gzwrite.
+
+This addresses CVE-2026-85091.
+
+CVE: CVE-2026-85091
+Upstream-Status: Backport [https://github.com/madler/zlib/commit/df84af25dc1942490e1d1c899a07619152a46148]
+
+Backport Changes:
+- The original hunk does not apply to zlib 1.3.1, which lacks the
+  later ret/state->again write accounting. Reset the same two input
+  fields in its existing gz_comp() failure branch and preserve its
+  return 0 behavior. No non-blocking support prerequisite is needed.
+
+AI-Generated: Uses Codex
+(cherry picked from commit df84af25dc1942490e1d1c899a07619152a46148)
+Signed-off-by: Devansh Patel <devanshp@cisco.com>
+---
+ gzwrite.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/gzwrite.c b/gzwrite.c
+index 435b462..fd340f0 100644
+--- a/gzwrite.c
++++ b/gzwrite.c
+@@ -223,8 +223,11 @@ local z_size_t gz_write(gz_statep state, voidpc buf, z_size_t len) {
+                 n = (unsigned)len;
+             state->strm.avail_in = n;
+             state->x.pos += n;
+-            if (gz_comp(state, Z_NO_FLUSH) == -1)
++            if (gz_comp(state, Z_NO_FLUSH) == -1) {
++                state->strm.avail_in = 0;
++                state->strm.next_in = state->in;
+                 return 0;
++            }
+             len -= n;
+         } while (len);
+     }
diff --git a/meta/recipes-core/zlib/zlib_1.3.1.bb b/meta/recipes-core/zlib/zlib_1.3.1.bb
index e42578fd..bfcf8ea2 100644
--- a/meta/recipes-core/zlib/zlib_1.3.1.bb
+++ b/meta/recipes-core/zlib/zlib_1.3.1.bb
@@ -11,6 +11,7 @@ SRC_URI = "https://zlib.net/${BP}.tar.gz \
            file://0001-configure-Pass-LDFLAGS-to-link-tests.patch \
            file://run-ptest \
            file://CVE-2026-27171.patch \
+           file://CVE-2026-85091.patch \
            "
 UPSTREAM_CHECK_URI = "http://zlib.net/"
 
-- 
2.35.6

