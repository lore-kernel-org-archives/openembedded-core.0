Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD9BAC7EE39
	for <webhook@archiver.kernel.org>; Thu,  1 Jun 2023 09:04:18 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.26248.1685610245892189895
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jun 2023 02:04:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="107150197"
X-IronPort-AV: E=Sophos;i="6.00,209,1681138800"; 
   d="scan'208";a="107150197"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2023 18:04:08 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id C8A1DCA1E4
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Jun 2023 18:04:05 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 07A46D5B20
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Jun 2023 18:04:05 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 2285C88864;
	Thu,  1 Jun 2023 18:04:04 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-numpy: upgrade 1.24.2 -> 1.24.3
Date: Thu,  1 Jun 2023 17:03:31 +0800
Message-Id: <1685610221-29015-25-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1685610221-29015-1-git-send-email-wangmy@fujitsu.com>
References: <1685610221-29015-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27664.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27664.006
X-TMASE-Result: 10--2.669700-10.000000
X-TMASE-MatchedRID: AFiVwG0qm0+jz0nOeth/yUIIxwDaU5mrMi5cVoUvU/bkd9mvuqBe1o3E
	akIoHWNdcJLdFUva/pegIpBAApSETcaZnhgjGx37vybt3bgNxoIYR+gKWoGXzqMQi364g884H4O
	Lf7hBJFzufSp/ltzlkZmL/071DLJJIl+yVqJq9RweUNBGudAtpf9b125Bo1nleIcwow9k6vM7/6
	wm+1WoGcQV6I3bMpYppeBVPY0vLKOQPDv33jKxaFICmG2RReho1cuIRwt/4MiysPB8dBBorXKn6
	DBj/gsEIvrftAIhWmJ5D53rZ0sb/bNdVHptfHl6Ojf3A4DTYuEZiTLIQu4YpBHfiujuTbedkeZP
	2gCbh8iESVL06fzYOxP6uxGv2vDH5UcZtwNsCroURSScn+QSXt0H8LFZNFG76sBnwpOylLMdN5h
	ETaFFMwY/2uesNspmYLY9XBWEkrspqzp8Qx1xVQnHM+AhplzoAnpd/0zbX3t+89Bhg4tlquCjgo
	jmsWWot6Wxxq/VMRuIHqaUMp7VXtL/LK0d4I30Ze/gJB41STsbqpM7Cr+fvX7cGd19dSFd
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jun 2023 09:04:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182084

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
A total of 17 pull requests were merged for this release.

    #23206: BUG: fix for f2py string scalars (#23194)
    #23207: BUG: datetime64/timedelta64 comparisons return NotImplemented
    #23208: MAINT: Pin matplotlib to version 3.6.3 for refguide checks
    #23221: DOC: Fix matplotlib error in documentation
    #23226: CI: Ensure submodules are initialized in gitpod.
    #23341: TYP: Replace duplicate reduce in ufunc type signature with reduceat.
    #23342: TYP: Remove duplicate CLIP/WRAP/RAISE in __init__.pyi.
    #23343: TYP: Mark d argument to fftfreq and rfftfreq as optional...
    #23344: TYP: Add type annotations for comparison operators to MaskedArray.
    #23345: TYP: Remove some stray type-check-only imports of msort
    #23370: BUG: Ensure like is only stripped for like= dispatched functions
    #23543: BUG: fix loading and storing big arrays on s390x
    #23544: MAINT: Bump larsoner/circleci-artifacts-redirector-action
    #23634: BUG: Ignore invalid and overflow warnings in masked setitem
    #23635: BUG: Fix masked array raveling when order="A" or order="K"
    #23636: MAINT: Update conftest for newer hypothesis versions
    #23637: BUG: Fix bug in parsing F77 style string arrays.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-numpy_1.24.2.bb => python3-numpy_1.24.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-numpy_1.24.2.bb => python3-numpy_1.24.3.bb} (96%)

diff --git a/meta/recipes-devtools/python/python3-numpy_1.24.2.bb b/meta/recipes-devtools/python/python3-numpy_1.24.3.bb
similarity index 96%
rename from meta/recipes-devtools/python/python3-numpy_1.24.2.bb
rename to meta/recipes-devtools/python/python3-numpy_1.24.3.bb
index bfcfc52729..710af5fe8f 100644
--- a/meta/recipes-devtools/python/python3-numpy_1.24.2.bb
+++ b/meta/recipes-devtools/python/python3-numpy_1.24.3.bb
@@ -12,7 +12,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
            file://0001-numpy-core-Define-RISCV-32-support.patch \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "003a9f530e880cb2cd177cba1af7220b9aa42def9c4afc2a2fc3ee6be7eb2b22"
+SRC_URI[sha256sum] = "ab344f1bf21f140adab8e47fdbc7c35a477dc01408791f8ba00d018dd0bc5155"
 
 GITHUB_BASE_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
-- 
2.34.1


