Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7519.1793976214351860561
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 06:43:34 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=PF3hqeEP;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4156; q=dns/txt;
  s=iport01; t=1793976214; x=1795185814;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=hI5OHc9H9/CpMJjGmXRIIZ2x36D0UfmQX2jesPli3MY=;
  b=PF3hqeEP0O/x+ld4fVoihbHmEXjXgcLv3l2c1iYoUvOQ5Kg1cR6bUPpm
   2hXCRPtVq4kL190Mck2PbCQ0ixI3Mpjz+9zLKDxNxuY9crllIbTbePuzw
   nRB9dJZQJ/YYfPKwjYKRlh1xDWWkpXdCHGxqr4T8S2PsQ8qtlZPNiMdtA
   6b0yRa4Fy+2mKSKMRiCCBfAqI7Y8GEI6/q3SkgwnZB9qEpuEMEe/Ffor6
   B2RgMYauFRWyfg7wRppyxpHKz2cyOr0pzZEDqHS0/tUsBnBEmZ75wfIL3
   p0AK8zbArPJA0b6VJDsNiSe2eSSAeFOMwvUqPvZRrwht/7q8w2VTbizAo
   w==;
X-CSE-ConnectionGUID: 0S+xYF4lRliPP2SdFsCxcQ==
X-CSE-MsgGUID: g18/uSD/RKySU4/jaUPgTw==
X-IPAS-Result: =?us-ascii?q?A0BIAgCS5u1q/4//Ja1aHgEBCxIMggULgld1YENJA5Qng?=
 =?us-ascii?q?iEDniGBfg8BAQEPRA0EAQGEP0YCjh0CJjQJDgECBAMCAwEBAQEBAQEBAQEBA?=
 =?us-ascii?q?QoBAQUBAQECAQcFgQ4Thk8NkBIBAgEDMgEYAT0cAwECLysjCBmDAgGCOgM3A?=
 =?us-ascii?q?xG8RYIsgQGDKQE/AkNQ2EwQb4FoAQsUAYE4hUKIJF0YAYR9JxuBSUSEfoEFg?=
 =?us-ascii?q?TIqAogmBIMcEoFajRgCgVGGeUiBHgNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjP?=
 =?us-ascii?q?heBBxsGBYEdgR6BEoEHXYErKF4hgQiBdgKCUYIAAgFJQQ4HRVMJJUMSRyQiC?=
 =?us-ascii?q?BIJARMaLAqBGjU8CSY/FQxkCxoFYQgCDQx0ORAwHiQvBRwmPhsKLxgNSBEsN?=
 =?us-ascii?q?xUZBD5uB5I9gkU7Ej1RASuBQwpfIhiSfZAegiGhEYQqjCSHJ44TGjOFW6UWC?=
 =?us-ascii?q?5h9jgqVZRxQhGmBaDyBWTMaCBsVgyIJShkPjjmDa4UTUcYIJjICCQMvAQEHA?=
 =?us-ascii?q?gcOAwuBaJF+AQE?=
IronPort-Data: A9a23:yOEISq8VhIHhaUAMXaOBDrUD13+TJUtcMsCJ2f8bNWPcYEJGY0x3m
 DEaUWuDPayKN2LzKtslYdzg8B4PvsODn9E3G1BvqCpEQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmB4E/rbei5xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mtyyHjEAX9gWAtazpJs/vrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2luBs4Iy8grBVtK9
 MQgcgsBQAuol+mPlefTpulE3qzPLeHxN48Z/3UlxjbDALN+H9bIQr7B4plT2zJYasJmRKmFI
 ZFGL2AyMVKZP0Yn1lQ/UPrSmM+5m2P2fzBwo1OOrq1x6G/WpOB0+OWxbYSNJoXaHa25mG6X/
 zKB4l/VRSs5JeeilX2H+0+UidPQyHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rbyyjVSzc9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc8BbH+t/7ESGzbDZpl7HQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSv1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:Dqq8Oq24fZ+10gBq5eLqrAqjBJ4kLtp133Aq2lEZdPUzSL39qy
 nAppomPHPP5Qr5HUtQ+uxoW5PwJE80i6QV3WB5B97LN2PbUSmTXeNfBODZrAEIdReTygck78
 ddWpk7LsHsBl5nisu/ygy5H9E8hOSjysmT9IDjJ7MHd3ASV0mmhD0JbDqmLg==
X-Talos-CUID: =?us-ascii?q?9a23=3ACZeQk2nQ5hm3ltwXcec8G57dHijXOSXmj2fhDRO?=
 =?us-ascii?q?8M2JocIXPclO+44h0mPM7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AuNTPdAw32695vLQ0dAakstNgk2eaqKv3WAcQqrl?=
 =?us-ascii?q?BgeqVDhEsfDWUsQy4fpByfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,197,1787011200"; 
   d="scan'208";a="545604180"
Received: from rcdn-l-core-06.cisco.com ([173.37.255.143])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 06 Nov 2026 14:43:33 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-06.cisco.com (Postfix) with ESMTPS id 7886B18000385
	for <openembedded-core@lists.openembedded.org>; Fri,  6 Nov 2026 14:43:33 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id F0BEDCBEFBF; Fri,  6 Nov 2026 06:43:32 -0800 (PST)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][v2 PATCH 10/27] python3-git: fix CVE-2026-73622
Date: Fri,  6 Nov 2026 06:43:14 -0800
Message-Id: <20261106144331.3354811-11-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261106144331.3354811-1-yurade@cisco.com>
References: <20261106144331.3354811-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-7871.cisco.com [10.30.222.158];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.30.222.158, sjc-ads-7871.cisco.com
X-Outbound-Node: rcdn-l-core-06.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 14:43:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249667
Content-Type: text/plain; charset="utf-8"

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/gitpython-developers/GitPython/commit/863417457a0633db7ea5aed4fd01e0b291a41162
[2] https://security-tracker.debian.org/tracker/CVE-2026-73622

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
Changes in v2:
- Changed the advisory reference from NVD to Debian Security Tracker.
  Cleaned whitespace in the Backport Changes note.
---
 .../python/python3-git/CVE-2026-73622.patch   | 60 +++++++++++++++++++
 .../python/python3-git_3.1.43.bb              |  1 +
 2 files changed, 61 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-73622.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-73622.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-73622.patch
new file mode 100644
index 0000000000..a9a31c4f4d
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-73622.patch
@@ -0,0 +1,60 @@
+From 5043b75a697c0f9110d2014234831dd1bc568a60 Mon Sep 17 00:00:00 2001
+From: "GPT 5.6" <codex@openai.com>
+Date: Wed, 22 Jul 2026 15:42:44 +0200
+Subject: [PATCH] fix: prevent environment expansion in remote URLs
+
+Remote and submodule creation expanded environment-variable references in
+caller-supplied URLs before storing them in Git configuration. This could
+expose process environment values through a later network request or a tracked
+.gitmodules file.
+
+Preserve variables literally in the remaining untrusted URL callers while
+retaining Git.polish_url() expansion for intentional local-path normalization.
+Add regression tests covering remote configuration and submodule configuration.
+
+Git baseline: git remote add and git submodule add accept URL arguments
+literally; Git does not perform shell-style environment expansion on those
+arguments.
+
+CVE: CVE-2026-73622
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/commit/863417457a0633db7ea5aed4fd01e0b291a41162]
+
+Backport Changes:
+- Omitted test/test_remote.py, test/test_submodule.py because the current
+  PyPI source archive does not include the test suite and the python3-git
+  recipe does not run it.
+
+Co-authored-by: Sebastian Thiel <sebastian.thiel@icloud.com>
+(cherry picked from commit 863417457a0633db7ea5aed4fd01e0b291a41162)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ git/objects/submodule/base.py | 2 +-
+ git/remote.py                 | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/git/objects/submodule/base.py b/git/objects/submodule/base.py
+index fa60bcda..43e0ec9a 100644
+--- a/git/objects/submodule/base.py
++++ b/git/objects/submodule/base.py
+@@ -601,7 +601,7 @@ class Submodule(IndexObject, TraversableIterableObj):
+         # END verify url
+
+         ## See #525 for ensuring git URLs in config-files are valid under Windows.
+-        url = Git.polish_url(url)
++        url = Git.polish_url(url, expand_vars=False)
+
+         # It's important to add the URL to the parent config, to let `git submodule` know.
+         # Otherwise there is a '-' character in front of the submodule listing:
+diff --git a/git/remote.py b/git/remote.py
+index cafa1f84..dd892fdc 100644
+--- a/git/remote.py
++++ b/git/remote.py
+@@ -805,7 +805,7 @@ class Remote(LazyMixin, IterableObj):
+         """
+         scmd = "add"
+         kwargs["insert_kwargs_after"] = scmd
+-        url = Git.polish_url(url)
++        url = Git.polish_url(url, expand_vars=False)
+         if not allow_unsafe_protocols:
+             Git.check_unsafe_protocols(url)
+         repo.git.remote(scmd, "--", name, url, **kwargs)
diff --git a/meta/recipes-devtools/python/python3-git_3.1.43.bb b/meta/recipes-devtools/python/python3-git_3.1.43.bb
index 847bdfeab2..6456031620 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.43.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.43.bb
@@ -31,6 +31,7 @@ SRC_URI += "file://CVE-2026-42284.patch \
            file://CVE-2026-73625.patch \
            file://CVE-2026-73623.patch \
            file://CVE-2026-73624.patch \
+           file://CVE-2026-73622.patch \
            "
 SRC_URI[sha256sum] = "35f314a9f878467f5453cc1fee295c3e18e52f1b99f10f6cf5b1682e968a9e7c"
 
-- 
2.53.0

