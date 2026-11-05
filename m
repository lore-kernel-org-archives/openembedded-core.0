Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27968.1793856710413638174
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2026 21:31:50 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Zu093x+6;
 spf=pass (domain: cisco.com, ip: 173.37.86.75, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2956; q=dns/txt;
  s=iport01; t=1793856710; x=1795066310;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=LE9vly+RJadceeYszl3W0vLQOfhDxYWbEc38f2YVV1I=;
  b=Zu093x+6nx1SoBNXx5sXyQT3PgtwcQ5TBx71Vhxdnk85CDTllPS8Rvzh
   A0EfF1bCLCURnKXw9vNs7ZgO9qWIVdA0jCKakaxrjoqWeFMlRSHFT1g+e
   DMGPjrHRnde0ocX9Mgys80QpmMTUK+bcLBNZSumBn7xZUHRiqazRPSvZ7
   CggIHiuThoF2x0wF1sNvrmCwkTWxfnK/mZFNgxHJN0Hky6aZ+cVBiogYc
   XnOh4eNsOB5aDkK3hPISd6Mho/XoprpEUda7X9+Sok+9a5i1Z9Do4BDBI
   tM5V3jn1yN7v/mzkIaTcT0pHp7BA9OZHTrEivTkefCq35mC4vgJOBikH8
   w==;
X-CSE-ConnectionGUID: WLPlh6M5R2GtQ3BVqlfjDQ==
X-CSE-MsgGUID: ESu0rfPhQ+ueDyPa9YEzRw==
X-IPAS-Result: =?us-ascii?q?A0DJAgASFOxq/5X/Ja1aHgEBCxIMggULgld1YUJJlCqCJ?=
 =?us-ascii?q?J4hgX4PAQEBD0QNBAEBhD9GAo4dAiY1CA4BAgQDAgMBAQEBAQEBAQEBAQEKA?=
 =?us-ascii?q?QEFAQEBAgEHBYEOE4ZPDZASAQIBAzIBGAE9HAMBAi8rIwgZgwIBgnQCARG8P?=
 =?us-ascii?q?oIsgQGDKQE/AkNQ2zMBCxQBgTiFQIgjXRgBhH0nGxuBcoR+gQWBXAEBA4Iqh?=
 =?us-ascii?q?XkEgiKBDIFaHoYihlgCgVKGcEiBHgNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjP?=
 =?us-ascii?q?heBBxsGBYEdgR6BEoEHXYErKF4hgQiBdgKCUYIAAgFJQQ4HRVMJJUMSRyQiC?=
 =?us-ascii?q?BIJARMaLAqBGjU8CSY/FQxkCxoFYQgCDQxyORAwHiQvBRwmQBsKGBgNSBEsN?=
 =?us-ascii?q?xUZBD5uB5IvgxEBehMBKgGoIqERCiiDeIwklToaM6pxC5h9jgqWUYRpgWkBO?=
 =?us-ascii?q?oFHCwdwFYMiCUoZD445g2uBf4MUyUgjNQsyAQEHAgcOAwuBaJF+AQE?=
IronPort-Data: A9a23:ZBzXE6mifEOS4wwsCZQqp03o5gzXJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIfC27SP66JNmXyLowgbIS18RsAscDcxoMyT1BlrXo3FFtH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4Errav6+/SEUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZK31GONgWYubDtNs/7b8nuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FbI8wuJ3X0QTz
 6Y3NAlWRC6ag+y07IvuH4GAhux7RCXqFJkUtnclyXTSCuwrBMmZBa7L/tRfmjw3g6iiH96HO
 JFfMmUpNkmdJUQTaz/7C7pm9AusrnnjczRboUi9rqss6G+Vxwt0uFToGIeJJoHSFZsMxC50o
 ErrxHmhGB8iNOXc1Dep40ql197ijxnkDdd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hgu1XMhSA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO/cx5AfIzu/f5ByUQzFeCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3u78Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:1X+ZDaDy0gxgEo7lHemA55DYdb4zR+YMi2TDsHoBLSC9Hfb3qy
 nDppkmPFrP+VUssRIb6LW90de7IE80nKQdieJ6AV7hZniFhILCFu5fBOXZrwEIYxefysdtkY
 F9bqN5FNr8SXJ+jcr8/U2ENuxI+qjhzEht7t2utkuEimpRGsdd0zs=
X-Talos-CUID: 9a23:yhXv5GBUX1oU5mb6ExZDzEoUROV4SCfy0E6LCXGhDWhrZITAHA==
X-Talos-MUID: 9a23:owxkzAoGo8H3hkf/rkkezxxZKZ9y7ZyuMQMQnLkXg8DVBAFiASjI2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,196,1787011200"; 
   d="scan'208";a="544508612"
Received: from rcdn-l-core-12.cisco.com ([173.37.255.149])
  by rcdn-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Nov 2026 05:31:49 +0000
Received: from sjc-ads-2020.cisco.com (sjc-ads-2020.cisco.com [171.70.61.208])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-12.cisco.com (Postfix) with ESMTPS id 59634180001C9
	for <openembedded-core@lists.openembedded.org>; Thu,  5 Nov 2026 05:31:49 +0000 (GMT)
Received: by sjc-ads-2020.cisco.com (Postfix, from userid 1887505)
	id F1B8ACC124D; Wed,  4 Nov 2026 21:31:48 -0800 (PST)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH  3/8] openssh: Fix CVE-2026-106584
Date: Wed,  4 Nov 2026 21:31:43 -0800
Message-Id: <20261105053148.2704106-3-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261105053148.2704106-1-hthakar@cisco.com>
References: <20261105053148.2704106-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-2020.cisco.com [171.70.61.208];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.61.208, sjc-ads-2020.cisco.com
X-Outbound-Node: rcdn-l-core-12.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 05:31:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249436
Content-Type: text/plain; charset="utf-8"

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream OpenSSH 10.6p1 backport for
CVE-2026-106584. The fix is referenced in [1] and the advisory in [2].

[1] https://github.com/openssh/openssh-portable/commit/aef20dfe30e68a469911a229b9117e7134766311
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-106584

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../openssh/openssh/CVE-2026-106584.patch     | 39 +++++++++++++++++++
 .../openssh/openssh_9.6p1.bb                  |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-106584.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-106584.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-106584.patch
new file mode 100644
index 0000000000..69840fe880
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-106584.patch
@@ -0,0 +1,39 @@
+From aef20dfe30e68a469911a229b9117e7134766311 Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Tue, 15 Sep 2026 08:31:46 +0000
+Subject: [PATCH] upstream: Correct handling of DST when converting dates
+
+Timestamps conversion was ignoring Daylight Savings Time (DST) causing
+date conversions to be +/-1 hour under some circumstances.
+
+bz4004; from Khush Patel, ok deraadt
+
+OpenBSD-Commit-ID: bd5eb2603c04d4b5072b0e593b137a98ef75b731
+
+CVE: CVE-2026-106584
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/aef20dfe30e68a469911a229b9117e7134766311]
+
+Backport Changes:
+- Omitted the upstream OpenBSD RCS revision-only hunk and retained the
+  OpenSSH 9.6p1 revision identifier.
+- Kept the 9.6p1 mktime error check; this version has no tm_wday
+  sentinel. The added tm_isdst assignment is unchanged.
+
+(cherry picked from commit aef20dfe30e68a469911a229b9117e7134766311)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ misc.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/misc.c b/misc.c
+index cac246b..55906d4 100644
+--- a/misc.c
++++ b/misc.c
+@@ -2476,6 +2476,7 @@ parse_absolute_time(const char *s, uint64_t *tp)
+ 		if ((tt = timegm(&tm)) < 0)
+ 			return SSH_ERR_INVALID_FORMAT;
+ 	} else {
++		tm.tm_isdst = -1;	/* mktime decides DST */
+ 		if ((tt = mktime(&tm)) < 0)
+ 			return SSH_ERR_INVALID_FORMAT;
+ 	}
diff --git a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
index 1e00522d16..5fe975180e 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
@@ -48,6 +48,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://CVE-2026-106586_p2.patch \
            file://CVE-2026-106586_p3.patch \
            file://CVE-2026-106585.patch \
+           file://CVE-2026-106584.patch \
            file://CVE-2026-73283.patch \
            file://CVE-2026-73282.patch \
            file://CVE-2026-73281.patch \
-- 
2.35.6

