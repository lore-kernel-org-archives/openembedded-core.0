Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7520.1793976214416324349
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 06:43:35 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=UZ1rcx4g;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4543; q=dns/txt;
  s=iport01; t=1793976214; x=1795185814;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=leDOWQA5bwvtWi+XuZldfU1GSRXO20fRIeV80Mz2ugY=;
  b=UZ1rcx4gpjxO4yydlO9vkd9G32W8e68x9R8C/4Dndt0gwppd4PbGJHeJ
   lhtWWf1JaeNIdzuB5lvKb8aVds70UXyvAD1qqGcBTWcRzYHEy6nojdGKd
   OEWmnBTdTH8JHaAYZtt0I/IRkqUcFEwtry41onKjt4mHRAC9A0r0f6Ekm
   CvLoMSPDSkqVYKrjFBvJlLq4q1JWgHMVVgSs7IhqnMC4bZak/Rj5JSYfz
   IFrqtaJui9zLnnOCNyG344/dOubK3m0pNug/7sRHN/RJmh7beedju0ANf
   bHLtsZotOTmmpf5hvcXc2MV6ksJXCNppHVk40+Rgh4DlsDzONMb5BdREL
   g==;
X-CSE-ConnectionGUID: K4QZqbhyRCej8mB79Ylm4Q==
X-CSE-MsgGUID: qsKaWEE5Q++c74sButCoDA==
X-IPAS-Result: =?us-ascii?q?A0BJAgAN5+1q/43/Ja1aglmCV3VgQ0kDlCeCIQOeIYF+D?=
 =?us-ascii?q?wEBAQ9EDQQBAYQ/RgKOHQImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBA?=
 =?us-ascii?q?QIBBwWBDhOGTw2QEgECAQMnCwEYAT0cAwECLysjCBmDAgGCOgM3AxG8TYF5M?=
 =?us-ascii?q?4EBgykBPwJDUNhMEG+BaAELFAGBOIVCiCRdGAGEfScbgUlEgRWDaYEFgVwCi?=
 =?us-ascii?q?CYEgxwSgVqNGAKBUYZ5SIEeA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM+F4EHG?=
 =?us-ascii?q?wYFgR2BHoESgQddgSsoXiGBCIF2AoJRggACAUlBDgdFUwklQxJHJCIIEgkBE?=
 =?us-ascii?q?xosCoEaNTwJJj8VDGQLGgVhCAINDHQ5EDAeJC8FHCY+GwovGA1IESw3FRkEP?=
 =?us-ascii?q?m4Hkj2CRUwBLU4TASuBQ2kiLKUooRGEKowklToaM4QEgVeSQpJUC5h9jgqWU?=
 =?us-ascii?q?YRpgWg8gVkzGggbFYMiCUoZD445g2uFE1HGCCYyAgkDLwEBBwIHDgMLgWiRf?=
 =?us-ascii?q?gEB?=
IronPort-Data: A9a23:WQ4s1qjsOIrkZvpcsW8hQO9WX161NxEKZh0ujC45NGQN5FlHY01je
 htvWzuOO/bYYTahKt12OYWy9kgPuZTVyNY1Glc/qHxhEihjpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FHwdOCn8ikkvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeAULOZ82QsaDxNsvre8EoHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqU7pt9FGGtO5
 MYzJTJdazrc1tOyxe6CH7wEasQLdKEHPasFsX1miDWcBvE8TNWbH+PB5MRT23E7gcUm8fT2P
 pVCL2EwKk6dPlsWZg5/5JEWxI9EglHubidRpF+9rqss6G+Vxwt0uFToGIeOIozWHJUExi50o
 Erf5EfwPTw3aeXcijHarmmGm/Pkmg/SDdd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hgu1XMhSA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO/cx5AfIzu/f5ByUQzBYCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3ur8Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:6XFmFa5j8hIbVDGq3wPXwOTXdLJyesId70hD6qkXc20wTiX2ra
 6TdZgguCMczQxhO03I+urwXZVoP0m8yXcd2+B4Vt2ftUvdyQmVxepZgrcKrQeNJ8SHzI5g/J
 YlVbRiA9vtClU/p8P77A6kV+sE+rC8gceVbSO09QYVcemsAJsQiTtENg==
X-Talos-CUID: 9a23:PA7Kcm2mITIUJR9JQ21vc7xfOZwcQGTXzGbqCEK6WWNDF+ykTVrMwfYx
X-Talos-MUID: 9a23:IjSRlgU+Rf+1+Pzq/Cb3pzhdGeo12uftAx9Rir8bp+KDGQUlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,197,1787011200"; 
   d="scan'208";a="530841890"
Received: from rcdn-l-core-04.cisco.com ([173.37.255.141])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 06 Nov 2026 14:43:34 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-04.cisco.com (Postfix) with ESMTPS id D7EAA180004AF
	for <openembedded-core@lists.openembedded.org>; Fri,  6 Nov 2026 14:43:33 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id 4CEAECBEF7A; Fri,  6 Nov 2026 06:43:33 -0800 (PST)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][v2 PATCH 22/27] python3-git: fix CVE-2026-78676
Date: Fri,  6 Nov 2026 06:43:26 -0800
Message-Id: <20261106144331.3354811-23-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261106144331.3354811-1-yurade@cisco.com>
References: <20261106144331.3354811-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-7871.cisco.com [10.30.222.158];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.30.222.158, sjc-ads-7871.cisco.com
X-Outbound-Node: rcdn-l-core-04.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 14:43:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249679
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
 .../python/python3-git/CVE-2026-78676.patch   | 67 +++++++++++++++++++
 .../python/python3-git_3.1.43.bb              |  1 +
 2 files changed, 68 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-78676.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-78676.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-78676.patch
new file mode 100644
index 0000000000..8adee8140f
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
2.53.0

