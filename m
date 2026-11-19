Received: from aer-iport-8.cisco.com (aer-iport-8.cisco.com [173.38.203.70])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8012.1795062168222848626
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 20:22:50 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=F4yFXHt0;
 spf=pass (domain: cisco.com, ip: 173.38.203.70, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4606; q=dns/txt;
  s=iport01; t=1795062170; x=1796271770;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=kT60JdFhRHqkmefSH2f+89VJZUY3p91UywYCa6KUAI8=;
  b=F4yFXHt06Q8sTsQc/INJGH9dRZ921VDx0JTAcopUz/cwm55wfUpe5KLD
   PeZ1KWy8iyBa+4eOWO5bwqqSAJvX6tVZcYveP6PTvQKUBgJnizFqcrDZv
   3r8V7v65hyFsa2V7GIvsYEtsDF0Cklcz+1ry4IaNMsn9MJQgBRzCmHfQw
   r5yD/gx+QQCc0hCzv9R5yINCFC/l2hLKm4byZMofeAkLPLBw1Ru1Mk1Yh
   oGtcwtQ4FT8PHArdTaqsMl9YbZ27F0Md34xMBTomAKJqP3i0Fm9FZe62h
   frRwQYGPt08yJg3kI2Btv3uiEd6XY5d+Tt+vSmjLqqrsH7qiJvPHAT1UL
   w==;
X-CSE-ConnectionGUID: XrQ2AysPQv2PaXkcmkOyQA==
X-CSE-MsgGUID: BdGMwTEAR2uv8hsLv3MC8Q==
X-IPAS-Result: =?us-ascii?q?A0BJAgDWd/5q/9BK/pBaglmCV3VgQ0kDlCeCIQOeKYF+D?=
 =?us-ascii?q?wEBAQ9EDQQBAYQ/RgKOIAImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBA?=
 =?us-ascii?q?QIBBwWBDhOGTw2QEgECAQMnCwEYAT0cAwECLysjCBmDAgGCOgM3AxG5NYF5M?=
 =?us-ascii?q?4EBgykBPwJDUNhMEG+BaAELFAGBOIVCiCRdGAGEfScbgUlEgRWDaoEFgVwCi?=
 =?us-ascii?q?CYEgxwSgVSNFwKBT4gKSIEeA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM7F4EHG?=
 =?us-ascii?q?wYFgRyBHoESgQNdgSsoXiGBCIF2AoJRggACAUlBDgdFUwklQxJHJCIIEgkBE?=
 =?us-ascii?q?xosCoEaNTwJJj8VDGcLGgVhCAINDHQ5EDAeJC8FGiY+GwqBDCcfHhsOAg4YD?=
 =?us-ascii?q?UgRLDcVGQQ+bgeTUYJLTAEtThMBK4FDQSgiLKUnoRGEK4wklToaM4QEgVeSQ?=
 =?us-ascii?q?5JUC5h9jgqWUYRqgWg8gVkzGggbFYMiCUoZD445g2uFE1HGWiYyAgkDLwEBB?=
 =?us-ascii?q?wIHDgMLgWiRfgEB?=
IronPort-Data: A9a23:0LPeLqg5XgX47QNF0JTt/1iZX161KhEKZh0ujC45NGQN5FlHY01je
 htvWmjXOPfeMWDyKo92bYi3/U9VsMfUn983QQVs/yE8F3hjpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FHwdOCn/SMhvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeAULOZ82QsaDxNsvvT8EgHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqUo4N8tKHBVz
 cUGcggEXhOIguGR0YuSH7wEasQLdKEHPasWt2slyXTSCuwrBMicBa7L/tRfmjw3g6iiH96HO
 5ZfM2czKkucJUcXaj/7C7pm9AusrmjiaTRUpXqepLE85C7YywkZPL3FbYuOJozVHJw9ckCwj
 G7p2nvFLzggbsGBmTqe1mz3o8SfpHauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8gUmkVvpbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJZHvd/7ESGzbDZpl7GQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSn1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:8N1VJ699Wh+kfLMEkPFuk+D0I+orL9Y04lQ7vn2ZLiYlFvBw+P
 rBoB1273LJYXMqKRIdcLO7Scy9qA3nlKKdiLN5VdzJYOClghrLEGgI1+TfKlPbdxEWjtQ86Y
 5QN45jFdb3EV92yez+4AW+DpIc5ePvytHOuQ8bpE0dND2DrMpbnmFENjo=
X-Talos-CUID: 9a23:so53d2D9AXmkF0X6Exl9zRQ9C9sdS2OH9H7gIES9CkF4cZTAHA==
X-Talos-MUID: 9a23:R+T55wq2bqXX9K6sZjgezxtuG+J334mHMhoQj8UGoO2abglbaw7I2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,220,1787011200"; 
   d="scan'208";a="59348711"
Received: from aer-l-core-07.cisco.com ([144.254.74.208])
  by aer-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 19 Nov 2026 04:22:47 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-07.cisco.com (Postfix) with ESMTPS id 6FD3018000441
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 04:22:47 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id 901B7CC8C93; Wed, 18 Nov 2026 20:22:43 -0800 (PST)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][v3 PATCH 22/27] python3-git: fix CVE-2026-78676
Date: Wed, 18 Nov 2026 20:22:37 -0800
Message-Id: <20261119042242.1640611-23-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261119042242.1640611-1-yurade@cisco.com>
References: <20261106144331.3354811-1-yurade@cisco.com>
 <20261119042242.1640611-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-7871.cisco.com [10.30.222.158];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.30.222.158, sjc-ads-7871.cisco.com
X-Outbound-Node: aer-l-core-07.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 04:22:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250626
Content-Type: text/plain; charset="utf-8"

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/gitpython-developers/GitPython/commit/4b4e47fc1224e23b0c8ee7220a7192818f2e4abb
[2] https://security-tracker.debian.org/tracker/CVE-2026-78676

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
Changes in v2:
- Changed the advisory reference from NVD to Debian Security Tracker.
- Included the reader-side prerequisite from 47e5738074e7, which prevents
  IndexError when reading serialized config values.
---
Changes in v3:
- Restored the required trailing spaces.
---
 .../python/python3-git/CVE-2026-78676.patch   | 67 +++++++++++++++++++
 .../python/python3-git_3.1.43.bb              |  1 +
 2 files changed, 68 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-78676.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-78676.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-78676.patch
new file mode 100644
index 0000000000..7eb690b80d
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-78676.patch
@@ -0,0 +1,67 @@
+From 5095b034dc451f3ec0c4c77c69403c8fce7eb6d7 Mon Sep 17 00:00:00 2001
+From: Byron <sebastian.thiel@icloud.com>
+Date: Mon, 10 Aug 2026 12:22:31 +0200
+Subject: [PATCH] fix: preserve multiline config values when writing
+
+<!-- agent -->
+GitConfigParser decoded valid multiline values into embedded newlines, but
+_write() serialized those newlines as indented physical lines. Rewriting an
+otherwise unchanged config could therefore change its meaning to Git.
+
+Serialize resident multiline values with Git-compatible escapes inside a
+quoted continuation, preserving GitPython read compatibility while keeping
+each option structurally intact. This addresses GHSA-284h-m62q-gf8w.
+
+The regression starts with an inert multiline value, performs an unrelated
+write, and verifies with both GitPython and git config that it remains one
+value and does not create another option.
+
+Git baseline: config.c parse_value() and write_pair() at cf5497b14c5a escape
+embedded LF as \\n rather than emitting it as a physical config line.
+
+CVE: CVE-2026-78676
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/commit/4b4e47fc1224e23b0c8ee7220a7192818f2e4abb]
+
+Backport Changes:
+- Commit 47e5738074e7 is an earlier prerequisite for this serialization
+  change. Its reader-side empty-string guard prevents IndexError when
+  reading serialized config values.
+- Omitted test/test_config.py changes from both upstream commits;
+  the recipe source archive excludes the test suite and the recipe
+  does not run it.
+
+Assisted-by: GPT 5.6
+Co-authored-by: GPT 5.6 <codex@openai.com>
+(cherry picked from commit 4b4e47fc1224e23b0c8ee7220a7192818f2e4abb)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ git/config.py | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/git/config.py b/git/config.py
+index 30218dba..e8482a08 100644
+--- a/git/config.py
++++ b/git/config.py
+@@ -454,8 +454,8 @@ class GitConfigParser(cp.RawConfigParser, metaclass=MetaParserBuilder):
+         def string_decode(v: str) -> str:
+-            if v[-1] == "\\":
++            if v and v[-1] == "\\":
+                 v = v[:-1]
+             # END cut trailing escapes to prevent decode error
+ 
+             return v.encode(defenc).decode("unicode_escape")
+ 
+         # END string_decode
+@@ -681,7 +681,11 @@ class GitConfigParser(cp.RawConfigParser, metaclass=MetaParserBuilder):
+                     continue
+ 
+                 for v in values:
+-                    fp.write(("\t%s = %s\n" % (key, self._value_to_string(v).replace("\n", "\n\t"))).encode(defenc))
++                    value = self._value_to_string(v)
++                    if any(char in value for char in '\n\t\b\\"'):
++                        value = value.replace("\\", "\\\\").replace('"', '\\"')
++                        value = '"%s\\\n"' % value.replace("\n", "\\n").replace("\t", "\\t").replace("\b", "\\b")
++                    fp.write(("\t%s = %s\n" % (key, value)).encode(defenc))
+                 # END if key is not __name__
+ 
+         # END section writing
diff --git a/meta/recipes-devtools/python/python3-git_3.1.43.bb b/meta/recipes-devtools/python/python3-git_3.1.43.bb
index fbb1553778..badbf04415 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.43.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.43.bb
@@ -46,6 +46,7 @@ SRC_URI += "file://CVE-2026-42284.patch \
            file://CVE-2026-76222_p2.patch \
            file://CVE-2026-78678_CVE-2026-78679.patch \
            file://CVE-2026-78677.patch \
+           file://CVE-2026-78676.patch \
            "
 SRC_URI[sha256sum] = "35f314a9f878467f5453cc1fee295c3e18e52f1b99f10f6cf5b1682e968a9e7c"
 
-- 
2.35.6

