Received: from aer-iport-2.cisco.com (aer-iport-2.cisco.com [173.38.203.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8250.1795062166873332270
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 20:22:48 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=gewmuvwd;
 spf=pass (domain: cisco.com, ip: 173.38.203.52, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3714; q=dns/txt;
  s=iport01; t=1795062167; x=1796271767;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=sm/UYcXuo08JHmZ7lqEKUN/yM+hbgldIHuTzdBhCtuE=;
  b=gewmuvwdQh2rJDOJnBJ3bb3nOQdFIpCaJGusBeENUl/2Kql4B9COA3pc
   iK5l1x+fuK34VH5m3pyzErBqH3YzVWuL2RbMn7k9NBjQom81gxiGoJbPM
   RtC7ULt3Hf6lEFSANB5AyriOqcfA0xKzYvV/qxqxCu4U7AKR660fQYODF
   cF7cztFvP+jgvLu3x6D/z8t2gshFa39TYvew6/kTtKQqXGFfFg2XwTlpr
   e65bImJ9vG2j8PUUxYgxa94qUinYbZ871sq/B7DitKKwiYTtsgmIW7CvL
   5KjHQPAxDLnuOYmxsbC+jplKf80wWKxHm+obZEs+Om86QG4zgB3c/rsKL
   Q==;
X-CSE-ConnectionGUID: WQ3ipdkmRXWnuL0+KbwUhw==
X-CSE-MsgGUID: dpopWd37TcKIg2g2KhcDLw==
X-IPAS-Result: =?us-ascii?q?A0BJAgDWd/5q/89K/pBaglmCV3VgQ0kDlCeCIQOeKYF+D?=
 =?us-ascii?q?wEBAQ9EDQQBAYQ/RgKOIAImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBA?=
 =?us-ascii?q?QIBBwWBDhOGTw2QEgECAQMnCwEYAT0cAwECLysjCBmDAgGCOgM3AxG5NYF5M?=
 =?us-ascii?q?4EBgykBPwICQAFQ2EwQb4FoAQsUAYE4hUKIJF0YAYR9JxuBSUSBFYNqgQWBX?=
 =?us-ascii?q?AICiCQEgxwSgVSNFwKBT4gKSIEeA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM7F?=
 =?us-ascii?q?4EHGwYFgRyBHoESgQNdgSsoXiGBCIF2AoJRggACAUlBDgdFUwklQxJHJCIIE?=
 =?us-ascii?q?gkBExosCoEaNTwJJj8VDGcLGgVhCAINDHQ5EDAeJC8FGiY+GwqBDCcfHhsOA?=
 =?us-ascii?q?g4YDUgRLDcVGQQ+bgeTUYJLOxI9GwktASuCLB4GpVGhEYQrjCSVOhozhVulF?=
 =?us-ascii?q?wuYfY4KllGEaoFoPIFZMxoIGxWDIglKGQ+OOYNrhRNRxlomMgIJAy8BAQcCB?=
 =?us-ascii?q?w4DC4FokAItgU8BAQ?=
IronPort-Data: A9a23:GhpF1a7Ek2JhmlsPDWK/NAxRtHLGchMFZxGqfqrLsTDasY5as4F+v
 mZKWmrVaPyDM2umeI9xYN+/8h8DvZaGmocySgQ9qXg8Zn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa+1H1dOi78BGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/KUzBHf/g2QqaztNu/rYwP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eArRD+/57AmR0x
 cMeNRRVLTOJmN+23+fuIgVsrpxLwMjDNY4F/3UlxjbDALN+H9bIQr7B4plT2zJYasJmRKqCI
 ZBENXwwMFKaO0In1lQ/UPrSmM+5m2P2fzBwo1OOrq1x6G/WpOB0+Oa0YYaJIYHQLSlTtkqAo
 Xr58z+mPho5FdPFxmCm8nmAovCayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PK+kEOWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0UtdKVul/4waXx++MvUCSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXMIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:fCx6XK/HFdNAquwC5ktuk+D0I+orL9Y04lQ7vn2ZLiYlFvBw+P
 rBoB1273LJYXMqKRIdcLO7Scy9qA3nlKKdiLN5VdzJYOClghrLEGgI1+TfKlPbdxEWjtQ86Y
 5QN45jFdb3EV92yez+4AW+DpIc5ePvytHOuQ8bpE0dND2DrMpbnmFENjo=
X-Talos-CUID: =?us-ascii?q?9a23=3AYBsdxWnlWwE7X7Io+ZKD8gg5tivXOULkl3bIL0y?=
 =?us-ascii?q?9M1ZWTqCxERyz8rxZk9U7zg=3D=3D?=
X-Talos-MUID: 9a23:590b/gieX5v6sOmQLUL9TMMpON9v+5uiUx8xmrYntJOLbw9wMBu5k2Hi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,220,1787011200"; 
   d="scan'208";a="61944352"
Received: from aer-l-core-06.cisco.com ([144.254.74.207])
  by aer-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 19 Nov 2026 04:22:46 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-06.cisco.com (Postfix) with ESMTPS id E6F41180001F6
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 04:22:45 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id 24F96CBEF98; Wed, 18 Nov 2026 20:22:43 -0800 (PST)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][v3 PATCH 08/27] python3-git: fix CVE-2026-73623
Date: Wed, 18 Nov 2026 20:22:23 -0800
Message-Id: <20261119042242.1640611-9-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261119042242.1640611-1-yurade@cisco.com>
References: <20261106144331.3354811-1-yurade@cisco.com>
 <20261119042242.1640611-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-7871.cisco.com [10.30.222.158];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.30.222.158, sjc-ads-7871.cisco.com
X-Outbound-Node: aer-l-core-06.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 04:22:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250614
Content-Type: text/plain; charset="utf-8"

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/gitpython-developers/GitPython/commit/ffcb5359e87619f4fe4a70a4aff5f08c5580ba97
[2] https://security-tracker.debian.org/tracker/CVE-2026-73623

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
Changes in v2:
- Changed the advisory reference from NVD to Debian Security Tracker.
  Updated the Backport Changes line wrapping and hunk context.
---
 .../python/python3-git/CVE-2026-73623.patch   | 53 +++++++++++++++++++
 .../python/python3-git_3.1.43.bb              |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-73623.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-73623.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-73623.patch
new file mode 100644
index 0000000000..7cb48e1511
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-73623.patch
@@ -0,0 +1,53 @@
+From 3621c3099fef859e91f9f960707902018a370978 Mon Sep 17 00:00:00 2001
+From: "GPT 5.6" <codex@openai.com>
+Date: Wed, 22 Jul 2026 04:43:26 +0200
+Subject: [PATCH] fix: reject unsafe clone templates
+
+<!-- agent -->
+
+Treat git clone --template as unsafe because caller-controlled
+templates can install hooks that execute during clone.
+
+Add regression coverage for both direct option and keyword forms.
+
+References GHSA-6p8h-3wgx-97gf.
+Validated against Git baseline a23bace9.
+
+CVE: CVE-2026-73623
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/commit/ffcb5359e87619f4fe4a70a4aff5f08c5580ba97]
+
+Backport Changes:
+- Omitted test/test_clone.py because the current PyPI
+  source archive does not include the test suite and
+  the python3-git recipe does not run it.
+
+Co-authored-by: Sebastian Thiel <sebastian.thiel@icloud.com>
+(cherry picked from commit ffcb5359e87619f4fe4a70a4aff5f08c5580ba97)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ git/repo/base.py | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/git/repo/base.py b/git/repo/base.py
+index d661f036..2776c19e 100644
+--- a/git/repo/base.py
++++ b/git/repo/base.py
+@@ -148,6 +148,8 @@ Repo.unsafe_git_clone_options
+         # Can override configuration variables that execute arbitrary commands:
+         "--config",
+         "-c",
++        # Can install hooks that execute during clone:
++        "--template",
+     ]
+     """Options to :manpage:`git-clone(1)` that allow arbitrary commands to be executed.
+ 
+@@ -158,6 +160,9 @@ Repo.unsafe_git_clone_options
+     The ``--config``/``-c`` option allows users to override configuration variables like
+     ``protocol.allow`` and ``core.gitProxy`` to execute arbitrary commands:
+     https://git-scm.com/docs/git-clone#Documentation/git-clone.txt---configltkeygtltvaluegt
++
++    The ``--template`` option can install hooks that execute during clone:
++    https://git-scm.com/docs/git-clone#Documentation/git-clone.txt---templatetemplate-directory
+     """
+     unsafe_git_archive_options = [
+         # Allows arbitrary command execution through the remote git-upload-archive command.
diff --git a/meta/recipes-devtools/python/python3-git_3.1.43.bb b/meta/recipes-devtools/python/python3-git_3.1.43.bb
index 551b47fc39..d996d4f9f5 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.43.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.43.bb
@@ -29,6 +29,7 @@ SRC_URI += "file://CVE-2026-42284.patch \
            file://CVE-2026-67322.patch \
            file://CVE-2026-69097.patch \
            file://CVE-2026-73625.patch \
+           file://CVE-2026-73623.patch \
            "
 SRC_URI[sha256sum] = "35f314a9f878467f5453cc1fee295c3e18e52f1b99f10f6cf5b1682e968a9e7c"
 
-- 
2.35.6

