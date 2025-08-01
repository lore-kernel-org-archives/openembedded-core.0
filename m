Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33F69CA0ED1
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 14:08:00 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.88618.1754057264357149762
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Aug 2025 07:07:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=X/k16XWA;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Yz828WcK;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019865f5fe32-bc6a22a0-1511-4e62-a324-5809fcbebcf8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1754057277;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=YkfO85b2joLOwUgzf3yxuoUQsbDTyBhJ+hwzT09oNXU=;
	b=X/k16XWA9ZZnFEC77JmghhmmHxgBOEqqW+Ucl5JD7cqAjqo7UkXOfEPPaRYCBSqZ
	UeuBkv0+5t9p5lnysj/dIEPWKdJNKLMN+dUf4WyKbdiMJ3n79Ir+Pn8ToqKEol3FqmY
	lXGHSY1z7Jvs96FwqsVY5CO0Z5HPDcaWRPUqCqNQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1754057277;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=YkfO85b2joLOwUgzf3yxuoUQsbDTyBhJ+hwzT09oNXU=;
	b=Yz828WcKHy3kv5axng7hNYi2XuxBg9JRghcx7UcqtsveQlkr5257XLW6Efc7l23A
	4qmCbtbJM9NcEYAWs+snZC9f4xxgWlS3tPCZEZEYWwLIrpF+Fkl4SdjSz0OvRiURpF3
	9JFnlhd4fqgSFCW2tRsCxc/TWSVTn7Cp8+cnpGgQ=
Content-Type: multipart/mixed; boundary="===============4547975730100528942=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] ed: upgrading to 1.22 SUCCEEDED
Message-ID: <0101019865f5fe32-bc6a22a0-1511-4e62-a324-5809fcbebcf8-000000@us-west-2.amazonses.com>
Date: Fri, 1 Aug 2025 14:07:56 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.08.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 14:08:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221292

--===============4547975730100528942==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ed* to *1.22* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ed-upgrade-1.21.1-1.22.patch
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
From 6fc718117127fba8ec7dd48c93a5b94504585a41 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Aug 2025 10:29:26 +0000
Subject: [PATCH] ed: upgrade 1.21.1 -> 1.22

---
 meta/recipes-extended/ed/{ed_1.21.1.bb => ed_1.22.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/ed/{ed_1.21.1.bb => ed_1.22.bb} (93%)

diff --git a/meta/recipes-extended/ed/ed_1.21.1.bb b/meta/recipes-extended/ed/ed_1.22.bb
similarity index 93%
rename from meta/recipes-extended/ed/ed_1.21.1.bb
rename to meta/recipes-extended/ed/ed_1.22.bb
index 03a61c6d5f..272c11fff6 100644
--- a/meta/recipes-extended/ed/ed_1.21.1.bb
+++ b/meta/recipes-extended/ed/ed_1.22.bb
@@ -19,7 +19,7 @@ bindir = "${base_bindir}"
 SRC_URI = "${GNU_MIRROR}/ed/${BP}.tar.lz"
 UPSTREAM_CHECK_URI = "${GNU_MIRROR}/ed/"
 
-SRC_URI[sha256sum] = "d6d0c7192b02b0519c902a93719053e865ade5a784a3b327d93d888457b23c4b"
+SRC_URI[sha256sum] = "7eb22c30a99dcdb50a8630ef7ff3e4642491ac4f8cd1aa9f3182264df4f4ad08"
 
 EXTRA_OEMAKE = "-e MAKEFLAGS="
 
-- 
2.47.1


--===============4547975730100528942==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-ed-upgrade-1.21.1-1.22.patch"

RnJvbSA2ZmM3MTgxMTcxMjdmYmE4ZWM3ZGQ0OGM5M2E1Yjk0NTA0NTg1YTQxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBBdWcgMjAyNSAxMDoyOToyNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGVk
OiB1cGdyYWRlIDEuMjEuMSAtPiAxLjIyCgotLS0KIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9lZC97
ZWRfMS4yMS4xLmJiID0+IGVkXzEuMjIuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2Vk
L3tlZF8xLjIxLjEuYmIgPT4gZWRfMS4yMi5iYn0gKDkzJSkKCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZXh0ZW5kZWQvZWQvZWRfMS4yMS4xLmJiIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2Vk
L2VkXzEuMjIuYmIKc2ltaWxhcml0eSBpbmRleCA5MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVz
LWV4dGVuZGVkL2VkL2VkXzEuMjEuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWV4dGVuZGVk
L2VkL2VkXzEuMjIuYmIKaW5kZXggMDNhNjFjNmQ1Zi4uMjcyYzExZmZmNiAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWV4dGVuZGVkL2VkL2VkXzEuMjEuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMt
ZXh0ZW5kZWQvZWQvZWRfMS4yMi5iYgpAQCAtMTksNyArMTksNyBAQCBiaW5kaXIgPSAiJHtiYXNl
X2JpbmRpcn0iCiBTUkNfVVJJID0gIiR7R05VX01JUlJPUn0vZWQvJHtCUH0udGFyLmx6IgogVVBT
VFJFQU1fQ0hFQ0tfVVJJID0gIiR7R05VX01JUlJPUn0vZWQvIgogCi1TUkNfVVJJW3NoYTI1NnN1
bV0gPSAiZDZkMGM3MTkyYjAyYjA1MTljOTAyYTkzNzE5MDUzZTg2NWFkZTVhNzg0YTNiMzI3ZDkz
ZDg4ODQ1N2IyM2M0YiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI3ZWIyMmMzMGE5OWRjZGI1MGE4
NjMwZWY3ZmYzZTQ2NDI0OTFhYzRmOGNkMWFhOWYzMTgyMjY0ZGY0ZjRhZDA4IgogCiBFWFRSQV9P
RU1BS0UgPSAiLWUgTUFLRUZMQUdTPSIKIAotLSAKMi40Ny4xCgo=

--===============4547975730100528942==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/ed/ed-dbg: PV changed from "1.21.1" to "1.22"
packages/core2-64-poky-linux/ed/ed-dbg: PKGV changed from 1.21.1 [default] to 1.22 [default]
packages/core2-64-poky-linux/ed/ed-dbg: PKGSIZE changed from 172216 to 177864 (+3%)
packages/core2-64-poky-linux/ed/ed-dev: PV changed from "1.21.1" to "1.22"
packages/core2-64-poky-linux/ed/ed-dev: PKGV changed from 1.21.1 [default] to 1.22 [default]
packages/core2-64-poky-linux/ed/ed-doc: PV changed from "1.21.1" to "1.22"
packages/core2-64-poky-linux/ed/ed-doc: PKGV changed from 1.21.1 [default] to 1.22 [default]
packages/core2-64-poky-linux/ed/ed-doc: PKGSIZE changed from 75915 to 76188 (+0%)
packages/core2-64-poky-linux/ed/ed-locale: PV changed from "1.21.1" to "1.22"
packages/core2-64-poky-linux/ed/ed-locale: PKGV changed from 1.21.1 [default] to 1.22 [default]
packages/core2-64-poky-linux/ed/ed-src: PV changed from "1.21.1" to "1.22"
packages/core2-64-poky-linux/ed/ed-src: PKGV changed from 1.21.1 [default] to 1.22 [default]
packages/core2-64-poky-linux/ed/ed-src: PKGSIZE changed from 114270 to 116044 (+2%)
packages/core2-64-poky-linux/ed/ed-staticdev: PV changed from "1.21.1" to "1.22"
packages/core2-64-poky-linux/ed/ed-staticdev: PKGV changed from 1.21.1 [default] to 1.22 [default]
packages/core2-64-poky-linux/ed/ed: PV changed from "1.21.1" to "1.22"
packages/core2-64-poky-linux/ed/ed: PKGV changed from 1.21.1 [default] to 1.22 [default]
packages/core2-64-poky-linux/ed: PV changed from "1.21.1" to "1.22"
packages/core2-64-poky-linux/ed: PKGV changed from 1.21.1 [default] to 1.22 [default]
packages/core2-64-poky-linux/ed: SRC_URI changed from "https://ftpmirror.gnu.org/gnu/ed/ed-1.21.1.tar.lz" to "https://ftpmirror.gnu.org/gnu/ed/ed-1.22.tar.lz"

--===============4547975730100528942==--

