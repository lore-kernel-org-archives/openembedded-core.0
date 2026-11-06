Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7338.1793976214391252784
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 06:43:34 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=fVwAgvLI;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3915; q=dns/txt;
  s=iport01; t=1793976214; x=1795185814;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=quOX5xExJnhpag+52bXKkMRvSXEns79UKaRAqAb+skg=;
  b=fVwAgvLI+SujEWXds7M++2FuxeD/+FvxSQ/LgvvL+FoYaO3rG+NZNtdR
   +cjbcn14lAwf+zT9qx66dInJ1HDyoGECdqGMlyM/0vJoLdXqfrH4ln9Oy
   ZIlmChIa6+QhlA6I3z4tfVVdKMvKXFQ+7KZOMIbt4cBX7pQR1vZ6iOYsY
   11uhPGykzKy33A9eD2g0QPDwWMLFFyzp5FOTcTTdPoUHGKQ9nugHlXWMy
   sLnd5WCKhhvKwaP1NFz+SspcxnWniXqOsPIGCbLKW2q8vh34e3l+HOsrb
   EyWHcusfW8peq26BGnur2oxZ000llkIMGMm7y1ewlAryo/luytVAnpwtP
   w==;
X-CSE-ConnectionGUID: Kt94mkVNSSSUcsLOAEO5cg==
X-CSE-MsgGUID: 0uDnVC+HSwCp/yMhSVuT3w==
X-IPAS-Result: =?us-ascii?q?A0BJAgAQ5u1q/5D/Ja1aH4I6gld1YENJA5QngiEDniGBf?=
 =?us-ascii?q?g8BAQEPRA0EAQGEP0YCjh0CJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBA?=
 =?us-ascii?q?QECAQcFgQ4Thk8NkBIBAgEDJwsBGAE9HAMBAi8rIwgZgwIBgjoDNwMRvD+Be?=
 =?us-ascii?q?TOBAYMpAT8CQ1DYTBBvgWgBCxQBgTiFQogkXRgBhH0nG4FJRIEVg2mBBYFcA?=
 =?us-ascii?q?ogmBIINgQ8SgVqBA4IiiXMCgVGGeUiBHgNZLAFVEw0KCwcFgWgDNRIqFW4yH?=
 =?us-ascii?q?YEjPheBBxsGBYEdgR6BEoEHXYErKF4hgQiBdgKCUYIAAgFJQQ4HRVMJJUMSR?=
 =?us-ascii?q?yQiCBIJARMaLAqBGjU8CSY/FQxkCxoFYQgCDQx0ORAwHiQvBRwmPhsKLxgNS?=
 =?us-ascii?q?BEsNxUZBD5uB5I9gkVNPVEBK4IsD5MokB6CIaERhCqMJJU6GjOqcQuYfY4Kl?=
 =?us-ascii?q?lGEaYFoPIFZMxoIGxU7gmcJShkPjjmDa4UTUcYIJjICBgMDLwEBBwIHDgMLg?=
 =?us-ascii?q?WiQAi2BTwEB?=
IronPort-Data: A9a23:vEFLX6NkqKBleK3vrR3ylsFynXyQoLVcMsEvi/4bfWQNrUol1GRSy
 DRMX2rQM/3bZzP1Lox1bdjnp0wPuceBm9JrGXM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeap1yFjmD9k/F3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WVzlV
 e/a+ZWFZgb8g2Msawr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj69ZyXR0zPrM+wd1MPGpV0
 dsxBRdQZR/W0opawJrjIgVtrt4oIM+uOMYUvWttiGmGS/0nWpvEBa7N4Le03h9p2ZsIRqmYP
 ZdEL2MzMHwsYDUXUrsTIIMjhu6ki1H0ciZTrxSeoq9fD237kVAsiOa2aYWOEjCMbZ1IskCmj
 SHmxHvSGlYLEdyk9ye5qW3504cjmgu+Aur+DoaQ8eZnhlCWzGEfBBAaEFC8u/SRjk+lR8kZL
 FQZ/Ccrp6U++EGnCN7nUHWFTGWspBUQXZ9UVuY98gzIkvWS6AeCDW9CRTlEADA7iPILqfUR/
 gfht7vU6fZH6tV5lVr1Gm+okA6P
IronPort-HdrOrdr: A9a23:xQUQGa1T6On/lqrf2gEQeQqjBJ4kLtp133Aq2lEZdPUzSL39qy
 nAppomPHPP5Qr5HUtQ+uxoW5PwJE80i6QV3WB5B97LN2PbUSmTXeNfBODZrAEIdReTygck78
 ddWpk7LsHsBl5nisu/ygy5H9E8hOSjysmT9IDjJ7MHd3ASV0mmhD0JbDqmLg==
X-Talos-CUID: 9a23:b975H2Mt4yqLhO5DezU2qEsXJOYeSUbgx2z0BGaVLjtiR+jA
X-Talos-MUID: =?us-ascii?q?9a23=3A2AtDeA6pT3jKlOAW5LXCJjrRxoww/oioNmtOsa4?=
 =?us-ascii?q?ZkNHDJAlwAAmAsG+oF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,197,1787011200"; 
   d="scan'208";a="545063173"
Received: from rcdn-l-core-07.cisco.com ([173.37.255.144])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 06 Nov 2026 14:43:33 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-07.cisco.com (Postfix) with ESMTPS id 695F0180003C1
	for <openembedded-core@lists.openembedded.org>; Fri,  6 Nov 2026 14:43:33 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id D77A2CBEF8A; Fri,  6 Nov 2026 06:43:32 -0800 (PST)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][v2 PATCH 07/27] python3-git: fix CVE-2026-73625
Date: Fri,  6 Nov 2026 06:43:11 -0800
Message-Id: <20261106144331.3354811-8-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261106144331.3354811-1-yurade@cisco.com>
References: <20261106144331.3354811-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-7871.cisco.com [10.30.222.158];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.30.222.158, sjc-ads-7871.cisco.com
X-Outbound-Node: rcdn-l-core-07.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 14:43:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249669
Content-Type: text/plain; charset="utf-8"

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/gitpython-developers/GitPython/commit/e8d0fbf774d1f6baa3b481adfe48bd262e43b453
[2] https://security-tracker.debian.org/tracker/CVE-2026-73625

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
Changes in v2:
- Changed the advisory reference from NVD to Debian Security Tracker.
  Refreshed the embedded hunk context and index hashes.
---
 .../python/python3-git/CVE-2026-73625.patch   | 59 +++++++++++++++++++
 .../python/python3-git_3.1.43.bb              |  1 +
 2 files changed, 60 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-73625.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-73625.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-73625.patch
new file mode 100644
index 0000000000..8f2638017c
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-73625.patch
@@ -0,0 +1,59 @@
+From ef95f1434023af72deabaf91e7154260d4625271 Mon Sep 17 00:00:00 2001
+From: "GPT 5.6" <codex@openai.com>
+Date: Wed, 22 Jul 2026 04:39:00 +0200
+Subject: [PATCH] fix: validate split short-option values
+
+<!-- agent -->
+
+Single-character keyword arguments are transformed into an option token and
+a separate value token. The unsafe-option candidate builder only checked the
+keyword name, allowing an option-like value to bypass guards shared by clone,
+remote, revision, blame, and archive operations.
+
+Include dash-prefixed values only when short options are actually split,
+including sequence values, while preserving bare values and the non-splitting
+compatibility path.
+
+Git baseline a23bace9 defines clone -n and --upload-pack as distinct options,
+matching the argv boundary this validation now preserves.
+
+Refs GHSA-r9mr-m37c-5fr3.
+
+CVE: CVE-2026-73625
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/commit/e8d0fbf774d1f6baa3b481adfe48bd262e43b453]
+
+Backport Changes:
+- Omitted test/test_git.py because the current PyPI source archive
+  does not include the test suite and the python3-git recipe does
+  not run it.
+
+Co-authored-by: Sebastian Thiel <sebastian.thiel@icloud.com>
+(cherry picked from commit e8d0fbf774d1f6baa3b481adfe48bd262e43b453)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ git/cmd.py | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/git/cmd.py b/git/cmd.py
+index eb7bf055..2ce27290 100644
+--- a/git/cmd.py
++++ b/git/cmd.py
+@@ -804,11 +804,18 @@ Git._option_candidates
+             option for option in cls._unpack_args([arg for arg in args if arg is not None]) if option.startswith("-")
+         ]
+         if kwargs:
++            split_single_char_options = kwargs.get("split_single_char_options", True)
+             for key, value in kwargs.items():
+                 values = value if isinstance(value, (list, tuple)) else (value,)
+                 if any(value is True or (value is not False and value is not None) for value in values):
+                     key = str(key)
+                     options.append(f"-{key}" if len(key) == 1 else f"--{dashify(key)}")
++                    if len(key) == 1 and split_single_char_options:
++                        options.extend(
++                            str(value)
++                            for value in values
++                            if value is not True and value not in (False, None) and str(value).startswith("-")
++                        )
+         return options
+ 
+     class AutoInterrupt:
diff --git a/meta/recipes-devtools/python/python3-git_3.1.43.bb b/meta/recipes-devtools/python/python3-git_3.1.43.bb
index 781ec512cc..551b47fc39 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.43.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.43.bb
@@ -28,6 +28,7 @@ SRC_URI += "file://CVE-2026-42284.patch \
            file://CVE-2026-67324.patch \
            file://CVE-2026-67322.patch \
            file://CVE-2026-69097.patch \
+           file://CVE-2026-73625.patch \
            "
 SRC_URI[sha256sum] = "35f314a9f878467f5453cc1fee295c3e18e52f1b99f10f6cf5b1682e968a9e7c"
 
-- 
2.53.0

