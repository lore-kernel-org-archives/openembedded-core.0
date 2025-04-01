Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA2E5C36014
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 12:43:22 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.18066.1743511391043823306
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 05:43:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=SSjI6wVM;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=P+LwD/eq;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010195f1609317-c0423d4b-14fe-4ad9-9508-fafaa304cc27-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1743511393;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=+8ZyiCQ/hSvDoJF2fyOLlbOiKMMYCHjrzPP8SL8gGys=;
	b=SSjI6wVMSseko63f49v1IKDrubhpeuF1c4Hcrbvez2MMZv5lFqHU/C67BwjW73Qj
	rqRhCk7Xhw4L52yh79LWsNp/dE9ZNmfuGrHlsuK9hOqrffjNj9MhYCmoOAB60H48V+n
	yHRZt1fOY1PE2GjfTGAWN/Dnx2B616Md7CnItjQ4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1743511393;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=+8ZyiCQ/hSvDoJF2fyOLlbOiKMMYCHjrzPP8SL8gGys=;
	b=P+LwD/eqnPiVa1cnYzYEmr+BygImSiNVRWPlTmtxbJ/BgrqC48Ygz05ydYL3EqQn
	WIkwSSbYK3U4QVr71PrfdforWhUI3+RQHCW3hEm+BiT8JaAEW/IIpBHfEKeQI0Z7tZr
	wO3wVkF6IsKi3e4IhZ9NPsgL8P28S5/lRp00iCkE=
Content-Type: multipart/mixed; boundary="===============3017465136258307818=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ccache: upgrading to 4.11.2 SUCCEEDED
Message-ID: <01010195f1609317-c0423d4b-14fe-4ad9-9508-fafaa304cc27-000000@us-west-2.amazonses.com>
Date: Tue, 1 Apr 2025 12:43:13 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.04.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 12:43:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214043

--===============3017465136258307818==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ccache* to *4.11.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ccache-upgrade-4.11-4.11.2.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From 239d40c087320459e24d2c4d48a905474e4c0101 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Apr 2025 07:43:49 +0000
Subject: [PATCH] ccache: upgrade 4.11 -> 4.11.2

---
 .../ccache/{ccache_4.11.bb => ccache_4.11.2.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/ccache/{ccache_4.11.bb => ccache_4.11.2.bb} (93%)

diff --git a/meta/recipes-devtools/ccache/ccache_4.11.bb b/meta/recipes-devtools/ccache/ccache_4.11.2.bb
similarity index 93%
rename from meta/recipes-devtools/ccache/ccache_4.11.bb
rename to meta/recipes-devtools/ccache/ccache_4.11.2.bb
index 9a305c257f..3a41cb5736 100644
--- a/meta/recipes-devtools/ccache/ccache_4.11.bb
+++ b/meta/recipes-devtools/ccache/ccache_4.11.2.bb
@@ -17,7 +17,7 @@ DEPENDS = "zstd fmt xxhash"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz"
 
-SRC_URI[sha256sum] = "7dba208540dc61cedd5c93df8c960055a35f06e29a0a3cf766962251d4a5c766"
+SRC_URI[sha256sum] = "d51b82bb8c3932649323fd4cb8e5a0a9f7fe7f672c71a6d6839bee13b4ded4c5"
 
 inherit cmake github-releases
 
-- 
2.47.1


--===============3017465136258307818==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ccache-upgrade-4.11-4.11.2.patch"

RnJvbSAyMzlkNDBjMDg3MzIwNDU5ZTI0ZDJjNGQ0OGE5MDU0NzRlNGMwMTAxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBBcHIgMjAyNSAwNzo0Mzo0OSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGNj
YWNoZTogdXBncmFkZSA0LjExIC0+IDQuMTEuMgoKLS0tCiAuLi4vY2NhY2hlL3tjY2FjaGVfNC4x
MS5iYiA9PiBjY2FjaGVfNC4xMS4yLmJifSAgICAgICAgICAgICAgICAgfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvY2NhY2hlL3tjY2FjaGVfNC4xMS5iYiA9PiBjY2FjaGVfNC4xMS4yLmJifSAo
OTMlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jY2FjaGUvY2NhY2hlXzQu
MTEuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY2NhY2hlL2NjYWNoZV80LjExLjIuYmIKc2lt
aWxhcml0eSBpbmRleCA5MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NjYWNo
ZS9jY2FjaGVfNC4xMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NjYWNoZS9j
Y2FjaGVfNC4xMS4yLmJiCmluZGV4IDlhMzA1YzI1N2YuLjNhNDFjYjU3MzYgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9jY2FjaGUvY2NhY2hlXzQuMTEuYmIKKysrIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2NjYWNoZS9jY2FjaGVfNC4xMS4yLmJiCkBAIC0xNyw3ICsxNyw3IEBA
IERFUEVORFMgPSAienN0ZCBmbXQgeHhoYXNoIgogCiBTUkNfVVJJID0gIiR7R0lUSFVCX0JBU0Vf
VVJJfS9kb3dubG9hZC92JHtQVn0vJHtCUH0udGFyLmd6IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0g
PSAiN2RiYTIwODU0MGRjNjFjZWRkNWM5M2RmOGM5NjAwNTVhMzVmMDZlMjlhMGEzY2Y3NjY5NjIy
NTFkNGE1Yzc2NiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJkNTFiODJiYjhjMzkzMjY0OTMyM2Zk
NGNiOGU1YTBhOWY3ZmU3ZjY3MmM3MWE2ZDY4MzliZWUxM2I0ZGVkNGM1IgogCiBpbmhlcml0IGNt
YWtlIGdpdGh1Yi1yZWxlYXNlcwogCi0tIAoyLjQ3LjEKCg==

--===============3017465136258307818==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/ccache/ccache-dbg: PKGSIZE changed from 33720824 to 33770056 (+0%)
packages/core2-64-poky-linux/ccache/ccache-dbg: PV changed from "4.11" to "4.11.2"
packages/core2-64-poky-linux/ccache/ccache-dbg: PKGV changed from 4.11 [default] to 4.11.2 [default]
packages/core2-64-poky-linux/ccache/ccache-dev: PV changed from "4.11" to "4.11.2"
packages/core2-64-poky-linux/ccache/ccache-dev: PKGV changed from 4.11 [default] to 4.11.2 [default]
packages/core2-64-poky-linux/ccache/ccache-doc: PV changed from "4.11" to "4.11.2"
packages/core2-64-poky-linux/ccache/ccache-doc: PKGV changed from 4.11 [default] to 4.11.2 [default]
packages/core2-64-poky-linux/ccache/ccache-locale: PV changed from "4.11" to "4.11.2"
packages/core2-64-poky-linux/ccache/ccache-locale: PKGV changed from 4.11 [default] to 4.11.2 [default]
packages/core2-64-poky-linux/ccache/ccache-src: PKGSIZE changed from 1774933 to 1775879 (+0%)
packages/core2-64-poky-linux/ccache/ccache-src: PV changed from "4.11" to "4.11.2"
packages/core2-64-poky-linux/ccache/ccache-src: PKGV changed from 4.11 [default] to 4.11.2 [default]
packages/core2-64-poky-linux/ccache/ccache-staticdev: PV changed from "4.11" to "4.11.2"
packages/core2-64-poky-linux/ccache/ccache-staticdev: PKGV changed from 4.11 [default] to 4.11.2 [default]
packages/core2-64-poky-linux/ccache/ccache: PV changed from "4.11" to "4.11.2"
packages/core2-64-poky-linux/ccache/ccache: PKGV changed from 4.11 [default] to 4.11.2 [default]
packages/core2-64-poky-linux/ccache: SRC_URI changed from "https://github.com/ccache/ccache/releases//download/v4.11/ccache-4.11.tar.gz" to "https://github.com/ccache/ccache/releases//download/v4.11.2/ccache-4.11.2.tar.gz"
packages/core2-64-poky-linux/ccache: PV changed from "4.11" to "4.11.2"
packages/core2-64-poky-linux/ccache: PKGV changed from 4.11 [default] to 4.11.2 [default]

--===============3017465136258307818==--

