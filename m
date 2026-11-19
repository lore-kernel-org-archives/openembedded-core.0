Received: from aer-iport-2.cisco.com (aer-iport-2.cisco.com [173.38.203.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8250.1795062166873332270
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 20:22:49 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=QxZEpJ8c;
 spf=pass (domain: cisco.com, ip: 173.38.203.52, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4296; q=dns/txt;
  s=iport01; t=1795062168; x=1796271768;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=Q2u5pJjGfzyy5buuxZxpmaYpk4+3lvUb6UTQn/HJSlk=;
  b=QxZEpJ8cMj4dF++m5dcU0oWHKbnOkkSxz+tb/syWhUWlVo+QXI3JzfzZ
   uF6if9lUhEzucdsYuaGsI7oDGehChMNILyqba6NMvyNRII5QGnOEL+76b
   Nh07AQmescSp5IT6eO+z4mwfilSXmIy2e+TnylvEcOFiEAVqgvsjZS2KA
   L/KucPspIIvLPccEVlrgVJT2/R3ZKo1Y2YEqrvrUH+aR1ul2jpUQV/S09
   fA2/SriXgo+K/53CxnOrtteN4//bscQ1UdQzl+SKkiZmQYfFlHidKOjMZ
   LMqkiAD5IOMerBaI5v5+1Jecf5xvH581V46zWxetrfUmUacEE6Smrc21i
   w==;
X-CSE-ConnectionGUID: VJ0Kv61qQXqOxWLQ9U/ZDA==
X-CSE-MsgGUID: do7eOrAmQaOBh2nDtHpmRw==
X-IPAS-Result: =?us-ascii?q?A0BJAgDWd/5q/9NK/pBaglmCV3VgQ0kDlCeCIQOeKRSBa?=
 =?us-ascii?q?g8BAQEPRA0EAQGEP0YCjiACJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBA?=
 =?us-ascii?q?QECAQcFgQ4Thk8NkBIBAgEDJwsBGAE9HAMBAi8rIwgZgwIBgjoDNwMRuTWBe?=
 =?us-ascii?q?TOBAYMpAT8CQ1DYTBBvgWgBCxQBgTiFQogkXRgBhH0nG4FJRIEVg2qBBYFcA?=
 =?us-ascii?q?oFGhmAEgxwSgVSBAowVAoFPiApIgR4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BI?=
 =?us-ascii?q?zsXgQcbBgWBHIEegRKBA12BKyheIYEIgXYCglGCAAIBSUEOB0VTCSVDEkckI?=
 =?us-ascii?q?ggSCQETGiwKgRo1PAkmPxUMZwsaBWEIAg0MdDkQMB4kLwUaJj4bCoEMJx8eG?=
 =?us-ascii?q?w4CDhgNSBEsNxUZBD5uB5NRgktNAR4eUQEKIYEggQyTN5I+oRGEK4wklToaM?=
 =?us-ascii?q?6pyC5h9jgqWUYRqgWg8gVkzGggbFTuCZwlKGQ+OOYNrhRNRxlomMgIGAwMvA?=
 =?us-ascii?q?QEHAgcOAwuBaJACLYFPAQE?=
IronPort-Data: A9a23:YhlvtqnXhv5nY4CEDIuvT17o5gzLJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIbDziEO6qCYGKhc9pwOd7joR8BuMTSx9JiQAdr/yk0EltH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4Errav6x9yQUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZK31GONgWYubDtNsvLb83uDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FbM6osVpXzhXz
 MwBDyAySinSuqWE7JvuH4GAhux7RCXqFIoSoDRkiDreF/tjGMiFSKTR7tge1zA17ixMNa+CO
 4xDNGYpM0iGOUQWUrsUIMpWcOOAl2TlejFVgFmUvqEwpWPUyWSd1ZCzaYuJJofXGa25mG6Uo
 T3L2H7QBygTE/afkzyp7lK0g9XQyHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rbyyjVSzc9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc9NdCag+rQqK0KeRul7fDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9EBpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:dOEiPK16Ea4rOn2nv2lFAQqjBJ4kLtp133Aq2lEZdPUzSL39qy
 nAppomPHPP5Qr5HUtQ+uxoW5PwJE80i6QV3WB5B97LN2PbUSmTXeNfBODZrAEIdReTygck78
 ddWpk7LsHsBl5nisu/ygy5H9E8hOSjysmT9IDjJ7MHd3ASV0mmhD0JbDqmLg==
X-Talos-CUID: 9a23:aaiyuWPR/+C11O5DZgs/11BKQ9kcQmT63Ej0Gh6FTlRFYejA
X-Talos-MUID: 9a23:TpkINwtAq1WUB+OGSM2niDY9OeByyqGXAWcnkc8Al9WkLSlKJGLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,220,1787011200"; 
   d="scan'208";a="61944354"
Received: from aer-l-core-10.cisco.com ([144.254.74.211])
  by aer-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 19 Nov 2026 04:22:47 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-10.cisco.com (Postfix) with ESMTPS id 56AF4180001E9
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 04:22:47 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id 5B388CBEF71; Wed, 18 Nov 2026 20:22:43 -0800 (PST)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][v3 PATCH 15/27] python3-git: fix CVE-2026-76220
Date: Wed, 18 Nov 2026 20:22:30 -0800
Message-Id: <20261119042242.1640611-16-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261119042242.1640611-1-yurade@cisco.com>
References: <20261106144331.3354811-1-yurade@cisco.com>
 <20261119042242.1640611-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-7871.cisco.com [10.30.222.158];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.30.222.158, sjc-ads-7871.cisco.com
X-Outbound-Node: aer-l-core-10.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 04:22:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250620
Content-Type: text/plain; charset="utf-8"

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/gitpython-developers/GitPython/commit/96a888f4d782cb2f80452148e48e60ce4af6d541
[2] https://security-tracker.debian.org/tracker/CVE-2026-76220

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
Changes in v2:
- Changed the advisory reference from NVD to Debian Security Tracker.
  Removed the stale cherry-pick and Signed-off-by trailers and refreshed
  the embedded hunk context.
---
 .../python/python3-git/CVE-2026-76220.patch   | 65 +++++++++++++++++++
 .../python/python3-git_3.1.43.bb              |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-76220.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-76220.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-76220.patch
new file mode 100644
index 0000000000..1a42e7cf04
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-76220.patch
@@ -0,0 +1,65 @@
+From 8f29b889df8dff1c1227dafabac0f49306d45838 Mon Sep 17 00:00:00 2001
+From: Byron <sebastian.thiel@icloud.com>
+Date: Sun, 2 Aug 2026 08:59:57 +0000
+Subject: [PATCH] Check joined short-option values before Git execution
+
+<!-- agent -->
+GHSA-wvpp-8hx9-p66j reports that unsafe-option checks omitted the value
+joined to a one-character option when split_single_char_options was false. A
+regression test reproduced the mismatch: GitPython checked only -n even though
+it emitted a joined -nVALUE token that Git parses as clustered short options.
+
+Collect the exact joined token for unsplit one-character keyword arguments so
+the existing clustered-short-option validation sees every option character.
+The split form and long-option behavior remain unchanged.
+
+A broader audit confirmed that all guarded keyword-forwarding APIs use
+_option_candidates, including clone, ls-remote, fetch, pull, push, archive,
+revision, diff, checkout-index, and tag paths. Git cf5497b14 confirms repeated
+short-option parsing within a joined token. Focused candidate and unsafe-option
+tests pass.
+
+CVE: CVE-2026-76220
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/commit/96a888f4d782cb2f80452148e48e60ce4af6d541]
+
+Backport Changes:
+- Omitted test/test_git.py because the current PyPI source archive
+  does not include the test suite and the python3-git recipe does
+  not run it.
+
+Assisted-by: GPT 5.6
+Co-authored-by: GPT 5.6 <codex@openai.com>
+(cherry picked from commit 96a888f4d782cb2f80452148e48e60ce4af6d541)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ git/cmd.py | 12 ++++++++++--
+ 1 file changed, 10 insertions(+), 2 deletions(-)
+
+diff --git a/git/cmd.py b/git/cmd.py
+index 2ce27290..de68fa34 100644
+--- a/git/cmd.py
++++ b/git/cmd.py
+@@ -809,13 +809,21 @@ Git._option_candidates
+                 values = value if isinstance(value, (list, tuple)) else (value,)
+                 if any(value is True or (value is not False and value is not None) for value in values):
+                     key = str(key)
+-                    options.append(f"-{key}" if len(key) == 1 else f"--{dashify(key)}")
+-                    if len(key) == 1 and split_single_char_options:
++                    if len(key) != 1:
++                        options.append(f"--{dashify(key)}")
++                    elif split_single_char_options:
++                        options.append(f"-{key}")
+                         options.extend(
+                             str(value)
+                             for value in values
+                             if value is not True and value not in (False, None) and str(value).startswith("-")
+                         )
++                    else:
++                        options.extend(
++                            f"-{key}" if value is True else f"-{key}{value}"
++                            for value in values
++                            if value is True or (value is not False and value is not None)
++                        )
+         return options
+ 
+     class AutoInterrupt:
diff --git a/meta/recipes-devtools/python/python3-git_3.1.43.bb b/meta/recipes-devtools/python/python3-git_3.1.43.bb
index 42d251a2df..4a3d516244 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.43.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.43.bb
@@ -37,6 +37,7 @@ SRC_URI += "file://CVE-2026-42284.patch \
            file://CVE-2026-73619_p1.patch \
            file://CVE-2026-73619_p2.patch \
            file://CVE-2026-76221.patch \
+           file://CVE-2026-76220.patch \
            "
 SRC_URI[sha256sum] = "35f314a9f878467f5453cc1fee295c3e18e52f1b99f10f6cf5b1682e968a9e7c"
 
-- 
2.35.6

