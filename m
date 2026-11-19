Received: from aer-iport-8.cisco.com (aer-iport-8.cisco.com [173.38.203.70])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8012.1795062168222848626
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 20:22:49 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=kzLcTGs1;
 spf=pass (domain: cisco.com, ip: 173.38.203.70, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4451; q=dns/txt;
  s=iport01; t=1795062169; x=1796271769;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=V3nfPgPcI/YAqb6PjUO03IJWerwg2AIMBjiXElxhzmw=;
  b=kzLcTGs1zWbAP+NEoD231CvMKzk/vnmMuj1K0XYldSpmBsD7POaBEVeE
   nJGgG2S1KcU4hTdBY0eq6CjWgH7KHhBgA0CIqxIGQFuJVk+os11YJUbS3
   DhpTr7p78txh7YnQQePd9AAUTMLzmkFS/3uwZ9XgOUA957m3q5EmAzI8s
   w5UDCYIXGh87smDXzqjbnu4xPMQldlvZimGTbbU66c31S62M8xDh3df33
   wElORJbl/txOCUwOFS1+N0KKW86BPIjN8BvuabbIp6r1pw7WLjGrlBLQN
   jpK+zqDEq4fFObBijD7dBfvNvUBS1nIfnYpRKG0Gzh4tbEguBJ5MhZktN
   w==;
X-CSE-ConnectionGUID: lmkRN3SCSXmxixvl7HPvUA==
X-CSE-MsgGUID: Tt3Zw53xRoGstp8e6ibZfA==
X-IPAS-Result: =?us-ascii?q?A0BJAgDWd/5q/89K/pBaglmCV3VgQ0kDlCeCIQOeKYF+D?=
 =?us-ascii?q?wEBAQ9EDQQBAYQ/RgKOIAImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBA?=
 =?us-ascii?q?QIBBwWBDhOGTw2QEgECAQMnCwEYAT0cAwECLysjCBmDAgGCOgM3AxG5NYF5M?=
 =?us-ascii?q?4EBgykBPwJDUNhMEG+BaAELFAGBOIVCiCRdGAGEfScbgUlEgRWDaoEFgVwCg?=
 =?us-ascii?q?SeGfwSCDYEPEoFUgQKCIIl1AoFPiApIgR4DWSwBVRMNCgsHBYFoAzUSKhVuM?=
 =?us-ascii?q?h2BIzsXgQcbBgWBHIEegRKBA12BKyheIYEIgXYCglGCAAIBSUEOB0VTCSVDE?=
 =?us-ascii?q?kckIggSCQETGiwKgRo1PAkmPxUMZwsaBWEIAg0MdDkQMB4kLwUaJj4bCoEMJ?=
 =?us-ascii?q?x8eGw4CDhgNSBEsNxUZBD5uB5NRgiUmRgc9UQEQGwSBAYEnD6VmoRGEK4wkl?=
 =?us-ascii?q?ToaM4VbpRcLmH2OCpVoHE2EaoFoPIFZMxoIGxU7gmcJShkPji4LC4NghRNRb?=
 =?us-ascii?q?MVuJjICCQMvAQEHAgcOAwuBaJAAAiYHgU8BAQ?=
IronPort-Data: A9a23:x6XxkKjeKdFQtOMcncdRnOsdX161KhEKZh0ujC45NGQN5FlHY01je
 htvWzuFb//YazSgeNl1OdzkoU8Pv5fSn4djSARkryk8FC5jpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FHwdOCn/SMhvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeAULOZ82QsaDxNsvvT8EgHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqUc/+VNJzp13
 scoLSAMfg6H2MKO3o+SH7wEasQLdKEHPasWt2slyXTSCuwrBMidBa7L/tRfmjw3g6iiH96HO
 5ZfM2czKkucJUcXZT/7C7pm9AusrmjiaTRUpXqepLE85C7YywkZPL3FbYuOJozVHZg9ckCwm
 n6dzXukWQEgM/OE1SLV/yytjN3BtHauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8gUmkVvpbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJZHvd/7ESGzbDZpl7HQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSj1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:Eq5EValuxb+QujJaPY71mgHbW2TpDfIA3DAbv31ZSRFFG/Fw8P
 re+MjzuiWbtN98YhwdcJW7Scq9qBDnhPtICPcqXItKNTOO0ADDEGgh1/qB/9SKIULDH4BmuZ
 uIC5IfNPTASX5nkM39/A60V/wkwNWB7eSUoN229QYLcemvAJsQljuQzW2gYytLeDU=
X-Talos-CUID: =?us-ascii?q?9a23=3APyffyWjeNXT2sDGxbm8+5WReVTJudnje9lGLGGS?=
 =?us-ascii?q?DOWN5Sa2LTQCwwL1Zup87?=
X-Talos-MUID: =?us-ascii?q?9a23=3Ak1+KnA5V+eyUKoJu9o3bND5RxoxU//+cFx1Wga8?=
 =?us-ascii?q?BlNKYLXx9ZTaXvjqeF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,220,1787011200"; 
   d="scan'208";a="59348705"
Received: from aer-l-core-06.cisco.com ([144.254.74.207])
  by aer-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 19 Nov 2026 04:22:46 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-06.cisco.com (Postfix) with ESMTPS id F1F37180004AA
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 04:22:45 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id 3C1D5CBEF6B; Wed, 18 Nov 2026 20:22:43 -0800 (PST)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][v3 PATCH 11/27] python3-git: fix CVE-2026-73621
Date: Wed, 18 Nov 2026 20:22:26 -0800
Message-Id: <20261119042242.1640611-12-yurade@cisco.com>
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
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 04:22:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250623
Content-Type: text/plain; charset="utf-8"

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/gitpython-developers/GitPython/commit/38553b6fddc7f6a667cdb45a6762343a08fc72b2
[2] https://security-tracker.debian.org/tracker/CVE-2026-73621

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
Changes in v2:
- Changed the advisory reference from NVD to Debian Security Tracker.
  Cleaned whitespace in the Backport Changes note.
---
 .../python/python3-git/CVE-2026-73621.patch   | 72 +++++++++++++++++++
 .../python/python3-git_3.1.43.bb              |  1 +
 2 files changed, 73 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-73621.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-73621.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-73621.patch
new file mode 100644
index 0000000000..9a67673297
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-73621.patch
@@ -0,0 +1,72 @@
+From 3186ded297a9818f887c3de47fc2f0aba6a8b298 Mon Sep 17 00:00:00 2001
+From: Sebastian Thiel <sebastian.thiel@icloud.com>
+Date: Sat, 25 Jul 2026 06:27:01 +0200
+Subject: [PATCH] fix: reject unsafe output options in Commit.count
+
+<!-- agent -->
+
+Commit.count forwards keyword arguments to git rev-list but did not apply the
+unsafe-option validation used by the sibling revision APIs.
+
+Validate forwarded options with the existing Git.check_unsafe_options helper
+and retain the explicit allow_unsafe_options escape hatch. This covers
+GHSA-p538-c434-8v24 without adding another option parser.
+
+Git baseline: git.git a23bace963 defines --output as a shared diff option
+consumed by setup_revisions; t/t6000-rev-list-misc.sh exercises that option
+with rev-list.
+
+CVE: CVE-2026-73621
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/commit/38553b6fddc7f6a667cdb45a6762343a08fc72b2]
+
+Backport Changes:
+- Omitted test/test_commit.py because the current PyPI source
+  archive does not include the test suite and the python3-git
+  recipe does not run it.
+
+Co-authored-by: GPT 5.6 <codex@openai.com>
+(cherry picked from commit 38553b6fddc7f6a667cdb45a6762343a08fc72b2)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ git/objects/commit.py | 15 ++++++++++++++-
+ 1 file changed, 14 insertions(+), 1 deletion(-)
+
+diff --git a/git/objects/commit.py b/git/objects/commit.py
+index cc85e7dd..549e12c7 100644
+--- a/git/objects/commit.py
++++ b/git/objects/commit.py
+@@ -269,13 +269,21 @@ class Commit(base.Object, TraversableIterableObj, Diffable, Serializable):
+         else:
+             return self.message.split(b"\n", 1)[0]
+ 
+-    def count(self, paths: Union[PathLike, Sequence[PathLike]] = "", **kwargs: Any) -> int:
++    def count(
++        self,
++        paths: Union[PathLike, Sequence[PathLike]] = "",
++        allow_unsafe_options: bool = False,
++        **kwargs: Any,
++    ) -> int:
+         """Count the number of commits reachable from this commit.
+ 
+         :param paths:
+             An optional path or a list of paths restricting the return value to commits
+             actually containing the paths.
+ 
++        :param allow_unsafe_options:
++            Allow unsafe options, like ``--output``.
++
+         :param kwargs:
+             Additional options to be passed to :manpage:`git-rev-list(1)`. They must not
+             alter the output style of the command, or parsing will yield incorrect
+@@ -284,6 +292,11 @@ class Commit(base.Object, TraversableIterableObj, Diffable, Serializable):
+         :return:
+             An int defining the number of reachable commits
+         """
++        if not allow_unsafe_options:
++            Git.check_unsafe_options(
++                options=Git._option_candidates([], kwargs), unsafe_options=self.unsafe_git_rev_options
++            )
++
+         # Yes, it makes a difference whether empty paths are given or not in our case as
+         # the empty paths version will ignore merge commits for some reason.
+         if paths:
diff --git a/meta/recipes-devtools/python/python3-git_3.1.43.bb b/meta/recipes-devtools/python/python3-git_3.1.43.bb
index 6456031620..f712a0e699 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.43.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.43.bb
@@ -32,6 +32,7 @@ SRC_URI += "file://CVE-2026-42284.patch \
            file://CVE-2026-73623.patch \
            file://CVE-2026-73624.patch \
            file://CVE-2026-73622.patch \
+           file://CVE-2026-73621.patch \
            "
 SRC_URI[sha256sum] = "35f314a9f878467f5453cc1fee295c3e18e52f1b99f10f6cf5b1682e968a9e7c"
 
-- 
2.35.6

