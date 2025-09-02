Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8E81CAC58F
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 21:56:42 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.89795.1756850186776840562
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Sep 2025 14:56:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=lVIVk0CL;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=dJDQfyyD;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101990c6e8bd8-9192bc15-c4fc-4997-b3d6-e4928bbf4598-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1756850195;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ji0b+dAoNmuRax1ETVZ7poyAsWXTdayaSrK3RqVZ6K8=;
	b=lVIVk0CL9WV0jYwivX/LfCIDg8ujcCYk1+JS1UaJI1qrZoGtbqbUbALlE5y8ed0u
	wtXvM5fs5vrVtv3hVXRNfV9BdQJD5XZv5ENdVYCi5DPl0ehXRDZGE/ZHEcEE9pn0QMx
	JUtWp4i+jP9fEpO1RxOKXzCNpVxJhxMXRW/o5Eys=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1756850195;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ji0b+dAoNmuRax1ETVZ7poyAsWXTdayaSrK3RqVZ6K8=;
	b=dJDQfyyDhUJTYwftXFk8abzY5mcnLnSv3m4Mm9QjvSulAZCftAzLT3Mj/exJqKoG
	NwxBML/JIwHdyvSZhlINqJpuLHIKfOeSev+k+ezF2GTN1k6XZldxXjuGjcjZgfJrnVK
	b0ADgc4IKF0dXI4C5wzJpL49KBJ6kEwWjzYB0eBo=
Content-Type: multipart/mixed; boundary="===============2936871091216463824=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] ed: upgrading to 1.22.2 SUCCEEDED
Message-ID: <010101990c6e8bd8-9192bc15-c4fc-4997-b3d6-e4928bbf4598-000000@us-west-2.amazonses.com>
Date: Tue, 2 Sep 2025 21:56:35 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.09.02-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 21:56:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222795

--===============2936871091216463824==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ed* to *1.22.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ed-upgrade-1.22.1-1.22.2.patch
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
From cd084e0b399d4a575f919682cf85280f55f5a66a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 2 Sep 2025 19:14:08 +0000
Subject: [PATCH] ed: upgrade 1.22.1 -> 1.22.2

---
 meta/recipes-extended/ed/{ed_1.22.1.bb => ed_1.22.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/ed/{ed_1.22.1.bb => ed_1.22.2.bb} (93%)

diff --git a/meta/recipes-extended/ed/ed_1.22.1.bb b/meta/recipes-extended/ed/ed_1.22.2.bb
similarity index 93%
rename from meta/recipes-extended/ed/ed_1.22.1.bb
rename to meta/recipes-extended/ed/ed_1.22.2.bb
index bfcff37e69..80d4e116ac 100644
--- a/meta/recipes-extended/ed/ed_1.22.1.bb
+++ b/meta/recipes-extended/ed/ed_1.22.2.bb
@@ -19,7 +19,7 @@ bindir = "${base_bindir}"
 SRC_URI = "${GNU_MIRROR}/ed/${BP}.tar.lz"
 UPSTREAM_CHECK_URI = "${GNU_MIRROR}/ed/"
 
-SRC_URI[sha256sum] = "1af541116796d6b9e4b66ef9c45ddce0e15a19ed62bfca362ccd7d472cc1c8fb"
+SRC_URI[sha256sum] = "f58d15242056e15af76f13f34c60d890fa2a2d5cb0abef91c115e4d83794ffe3"
 
 EXTRA_OEMAKE = "-e MAKEFLAGS="
 
-- 
2.47.1


--===============2936871091216463824==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ed-upgrade-1.22.1-1.22.2.patch"

RnJvbSBjZDA4NGUwYjM5OWQ0YTU3NWY5MTk2ODJjZjg1MjgwZjU1ZjVhNjZhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMiBTZXAgMjAyNSAxOToxNDowOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGVk
OiB1cGdyYWRlIDEuMjIuMSAtPiAxLjIyLjIKCi0tLQogbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2Vk
L3tlZF8xLjIyLjEuYmIgPT4gZWRfMS4yMi4yLmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1leHRlbmRl
ZC9lZC97ZWRfMS4yMi4xLmJiID0+IGVkXzEuMjIuMi5iYn0gKDkzJSkKCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZWQvZWRfMS4yMi4xLmJiIGIvbWV0YS9yZWNpcGVzLWV4dGVu
ZGVkL2VkL2VkXzEuMjIuMi5iYgpzaW1pbGFyaXR5IGluZGV4IDkzJQpyZW5hbWUgZnJvbSBtZXRh
L3JlY2lwZXMtZXh0ZW5kZWQvZWQvZWRfMS4yMi4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
ZXh0ZW5kZWQvZWQvZWRfMS4yMi4yLmJiCmluZGV4IGJmY2ZmMzdlNjkuLjgwZDRlMTE2YWMgMTAw
NjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9lZC9lZF8xLjIyLjEuYmIKKysrIGIvbWV0
YS9yZWNpcGVzLWV4dGVuZGVkL2VkL2VkXzEuMjIuMi5iYgpAQCAtMTksNyArMTksNyBAQCBiaW5k
aXIgPSAiJHtiYXNlX2JpbmRpcn0iCiBTUkNfVVJJID0gIiR7R05VX01JUlJPUn0vZWQvJHtCUH0u
dGFyLmx6IgogVVBTVFJFQU1fQ0hFQ0tfVVJJID0gIiR7R05VX01JUlJPUn0vZWQvIgogCi1TUkNf
VVJJW3NoYTI1NnN1bV0gPSAiMWFmNTQxMTE2Nzk2ZDZiOWU0YjY2ZWY5YzQ1ZGRjZTBlMTVhMTll
ZDYyYmZjYTM2MmNjZDdkNDcyY2MxYzhmYiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJmNThkMTUy
NDIwNTZlMTVhZjc2ZjEzZjM0YzYwZDg5MGZhMmEyZDVjYjBhYmVmOTFjMTE1ZTRkODM3OTRmZmUz
IgogCiBFWFRSQV9PRU1BS0UgPSAiLWUgTUFLRUZMQUdTPSIKIAotLSAKMi40Ny4xCgo=

--===============2936871091216463824==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/ed/ed-dbg: PKGSIZE changed from 178488 to 179288 (+0%)
packages/x86-64-v3-poky-linux/ed/ed-dbg: PKGV changed from 1.22.1 [default] to 1.22.2 [default]
packages/x86-64-v3-poky-linux/ed/ed-dbg: PV changed from "1.22.1" to "1.22.2"
packages/x86-64-v3-poky-linux/ed/ed-dev: PKGV changed from 1.22.1 [default] to 1.22.2 [default]
packages/x86-64-v3-poky-linux/ed/ed-dev: PV changed from "1.22.1" to "1.22.2"
packages/x86-64-v3-poky-linux/ed/ed-doc: PKGSIZE changed from 75940 to 76012 (+0%)
packages/x86-64-v3-poky-linux/ed/ed-doc: PKGV changed from 1.22.1 [default] to 1.22.2 [default]
packages/x86-64-v3-poky-linux/ed/ed-doc: PV changed from "1.22.1" to "1.22.2"
packages/x86-64-v3-poky-linux/ed/ed-locale: PKGV changed from 1.22.1 [default] to 1.22.2 [default]
packages/x86-64-v3-poky-linux/ed/ed-locale: PV changed from "1.22.1" to "1.22.2"
packages/x86-64-v3-poky-linux/ed/ed-src: PKGSIZE changed from 116045 to 116351 (+0%)
packages/x86-64-v3-poky-linux/ed/ed-src: PKGV changed from 1.22.1 [default] to 1.22.2 [default]
packages/x86-64-v3-poky-linux/ed/ed-src: PV changed from "1.22.1" to "1.22.2"
packages/x86-64-v3-poky-linux/ed/ed-staticdev: PKGV changed from 1.22.1 [default] to 1.22.2 [default]
packages/x86-64-v3-poky-linux/ed/ed-staticdev: PV changed from "1.22.1" to "1.22.2"
packages/x86-64-v3-poky-linux/ed/ed: PKGV changed from 1.22.1 [default] to 1.22.2 [default]
packages/x86-64-v3-poky-linux/ed/ed: PV changed from "1.22.1" to "1.22.2"
packages/x86-64-v3-poky-linux/ed: PKGV changed from 1.22.1 [default] to 1.22.2 [default]
packages/x86-64-v3-poky-linux/ed: PV changed from "1.22.1" to "1.22.2"
packages/x86-64-v3-poky-linux/ed: SRC_URI changed from "https://ftpmirror.gnu.org/gnu/ed/ed-1.22.1.tar.lz" to "https://ftpmirror.gnu.org/gnu/ed/ed-1.22.2.tar.lz"

--===============2936871091216463824==--

