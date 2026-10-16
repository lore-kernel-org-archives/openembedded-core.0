Return-Path: <yurade@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C3C8CCF2C7
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 05:41:19 +0000 (UTC)
Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15557.1792129268905469582
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 22:41:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=HVriJVvf;
 spf=pass (domain: cisco.com, ip: 173.37.86.78, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3654; q=dns/txt;
  s=iport01; t=1792129269; x=1793338869;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=qIy6giTj2ndvkXxtJtDa3PgSfgln3mhXlPiKYSEzXn8=;
  b=HVriJVvfGFspb8IPM5gkKAN6GJdihhtZY06tzn7eyYyZ5cRbfNkdevBX
   P2dDoveO3pNrhHgAh05YbdrZxJn9ljzvxatbmT3sbnychcDMyVU2+u8NF
   yqNbu9Sv2DCswUENS32wNph6iXL7pBnnYD5o/yn0yoPiaXn1r75amrvvv
   YEMcUln2VJ1pJcfqQ5teCHNizDBZ+JILo2BOCW05sZH3jnLi6C9FNBM0d
   syo27TfJRTYuiQTOPOzSF0LZjG66XzN1nEkSZmXynY6SPyMz8zetd9tsm
   RcSOHuiM3FHtn6gajducB3riaIQmhE0ceLaD3gYyyD1k+X0DYcvoQq4BA
   Q==;
X-CSE-ConnectionGUID: sEhgEPXrTDS7lqXOp81ivg==
X-CSE-MsgGUID: orqSJW1GR8eubCVGe3rS7A==
X-IPAS-Result: =?us-ascii?q?A0ADAAAeuNFq/5X/Ja1aGgEBAQEBAQEBAQEDAQEBARIBA?=
 =?us-ascii?q?QEBAgIBAQEBgXwFAQEBAQsBglZ1YENJjHKHN4IhA54cgX4PAQEBD0QNBAEBh?=
 =?us-ascii?q?D9GAo4VAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBAgEHBYEOE4ZPD?=
 =?us-ascii?q?ZASAQIBAzIBGAE9HAMBAi8rIwgZgwIBgjoDNwMRvHiCLIEBgykBPwJDUNhLE?=
 =?us-ascii?q?G+BaAELFAGBOAGFP4gjXRgBhHwnG4FJRIEVg2mBBYFcAQGIJQSDHBKBWoEDl?=
 =?us-ascii?q?ERIgR4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BIz4XgQcbBgWBHYEgghYjGTZ6g?=
 =?us-ascii?q?QlegSspYRAXgQmCBwKCVIIAAgFJQQ4HRVMJJUMSRyYiCBIJARMaMAuBGzg8C?=
 =?us-ascii?q?ShBFwxzDB0FcggCDQkHKRgNSBEsNxUZBD5uB5IUHoFyJi0OEj1PAgErqCGhD?=
 =?us-ascii?q?4QojCKVOhozhVulFAuYfY4Klk+EaYFoPIFHCwczGggbFYMiCUoZD445g2uBf?=
 =?us-ascii?q?4NlyHYnMgIJMgEBBwIHDgMLgWiRfgEB?=
IronPort-Data: A9a23:lrAqla5Jh5Kl2cVN01ECCgxRtG/GchMFZxGqfqrLsTDasY5as4F+v
 mQYWmGBPq2IYzeheNh1bt/go0hX6MfRx9BmGwo4qylmZn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa+1H1dOex9RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/KUzBHf/g2QqazpNtfrawP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eJqAY9ctPMXty2
 cdHLCk9SQjT3uOoz+fuIgVsrpxLwMjDJogTvDRkiDreF/tjGMqFSKTR7tge1zA17ixMNa+BP
 IxCNnw1MUmGOkEeUrsUIMpWcOOAl2TlejFVgFmUvqEwpWPUyWSd1ZCwa4eIK4zWFJQ9ckCwo
 XjfxEbGWz4gZNGCwxG73X/3nNSQtHauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8gUmkVvpbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJKGOE8rQXIwa3O7kPAXC4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rHnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:hxhk8qjD4nCmjnL76uTEH11lgnBQXvYji2hC6mlwRA09TyX+rb
 HLoB1173HJYVoqNU3I3OrwW5VoIkmskKKdn7NxAV7KZmCP0wGVxcNZnOnfKlbbdBEWmNQw6U
 4ZSchDIey1K0RmhsDn5wT9OdMhzN6btJ2Mv47lvhBQpcUAUdAY0++/YTzrdHFLeA==
X-Talos-CUID: =?us-ascii?q?9a23=3AWen4UWj3JD2DC1b1qTiXWVrZpzJuaVDdw1roE1W?=
 =?us-ascii?q?EJV02TKSlbkfAoaJ6nJ87?=
X-Talos-MUID: 9a23:k6fS1Aq54TfUQ1KOwX0ezzZ4LfxK3P2BMhAAjJ8theaJbjZLZB7I2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="535598499"
Received: from rcdn-l-core-12.cisco.com ([173.37.255.149])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 05:41:08 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-12.cisco.com (Postfix) with ESMTPS id 0846B180001E6
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 05:41:08 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id 6CC93CBEF6F; Thu, 15 Oct 2026 22:41:07 -0700 (PDT)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH 13/27] python3-git: fix CVE-2026-73619
Date: Thu, 15 Oct 2026 22:40:52 -0700
Message-Id: <20261016054106.210444-14-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016054106.210444-1-yurade@cisco.com>
References: <20261016054106.210444-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-7871.cisco.com [10.30.222.158];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.30.222.158, sjc-ads-7871.cisco.com
X-Outbound-Node: rcdn-l-core-12.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 05:41:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247943

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/gitpython-developers/GitPython/commit/7a4f5dcb7bf3cbcbf6e438017efcdfe0bc0d36ca
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-73619

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
 .../python/python3-git/CVE-2026-73619.patch   | 58 +++++++++++++++++++
 .../python/python3-git_3.1.43.bb              |  1 +
 2 files changed, 59 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-73619.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-73619.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-73619.patch
new file mode 100644
index 0000000000..288566b891
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-73619.patch
@@ -0,0 +1,58 @@
+From 91f2b27eb8976ef5c663f1a0ea8180e2cf28cb10 Mon Sep 17 00:00:00 2001
+From: "GPT 5.6" <codex@openai.com>
+Date: Sun, 26 Jul 2026 06:00:59 +0200
+Subject: [PATCH] Block unsafe archive additions and bundle URI
+
+GHSA-539m-9xh6-q6rr reports incomplete unsafe option lists for archive inputs
+and clone bundle URLs. Caller-controlled archive additions can expose or inject
+filesystem content, while clone --bundle-uri can dereference an additional
+caller-controlled URL.
+
+Extend the existing archive denylist with --add-file and --add-virtual-file,
+and the clone denylist with --bundle-uri. Regression coverage exercises archive
+kwargs plus both clone multi-option and keyword paths.
+
+Git baseline: a23bace963d508bd96983cc637131392d3face18.
+Documentation/git-archive.adoc defines --add-file/--add-virtual-file, and
+Documentation/git-clone.adoc defines --bundle-uri as fetching from the supplied
+URI.
+
+CVE: CVE-2026-73619
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/commit/7a4f5dcb7bf3cbcbf6e438017efcdfe0bc0d36ca]
+
+Backport Changes:
+- Omitted test/test_clone.py, test/test_repo.py because the current PyPI 
+  source archive does not include the test suite and the python3-git recipe 
+  does not run it.
+
+Co-authored-by: Sebastian Thiel <sebastian.thiel@icloud.com>
+(cherry picked from commit 7a4f5dcb7bf3cbcbf6e438017efcdfe0bc0d36ca)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ git/repo/base.py | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/git/repo/base.py b/git/repo/base.py
+index 2776c19e..4b783586 100644
+--- a/git/repo/base.py
++++ b/git/repo/base.py
+@@ -150,6 +150,8 @@ class Repo:
+         "-c",
+         # Can install hooks that execute during clone:
+         "--template",
++        # Fetches from a caller-controlled URL:
++        "--bundle-uri",
+     ]
+     """Options to :manpage:`git-clone(1)` that allow arbitrary commands to be executed.
+ 
+@@ -171,6 +173,10 @@ class Repo:
+         # Writes output to a caller-controlled filesystem path.
+         "--output",
+         "-o",
++        # Reads from a caller-controlled filesystem path:
++        "--add-file",
++        # Injects a caller-controlled path and contents:
++        "--add-virtual-file",
+     ]
+ 
+     unsafe_git_revision_options = [
diff --git a/meta/recipes-devtools/python/python3-git_3.1.43.bb b/meta/recipes-devtools/python/python3-git_3.1.43.bb
index d47ce73d72..d6b5cdb00e 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.43.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.43.bb
@@ -34,6 +34,7 @@ SRC_URI += "file://CVE-2026-42284.patch \
            file://CVE-2026-73622.patch \
            file://CVE-2026-73621.patch \
            file://CVE-2026-73620.patch \
+           file://CVE-2026-73619.patch \
            "
 SRC_URI[sha256sum] = "35f314a9f878467f5453cc1fee295c3e18e52f1b99f10f6cf5b1682e968a9e7c"
 
-- 
2.44.4


