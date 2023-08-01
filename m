Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF2E8C07E8F
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 16:28:51 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.17595.1690907329769184757
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Aug 2023 09:28:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=UXaE6pPo;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Zj+oTVc4;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010189b1ee41b9-b2d569ad-0916-4fae-b642-0c56b90e5e1c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1690907329;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=l7qATKb+I6E7mYD6AASKgSN6V/Ou4uEzgFsO9jGplBQ=;
	b=UXaE6pPoHuVjubixO9wSFZG0RaHWgNzwf2d93wiEZ577vMbyjxidjkxMRU71mlc4
	9sBkhThmExmkEsmtaHSQDk8hxc+LOLVRg850AeXLdVsHgSZZPYqOpiflvmQEUu8d7HD
	AKb8GReN0fKRcSpuBC5Gdm3voJgJwQTpKWJF34Bk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1690907329;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=l7qATKb+I6E7mYD6AASKgSN6V/Ou4uEzgFsO9jGplBQ=;
	b=Zj+oTVc4FemdGqcgVBcsE+chUfxEWhOQeONPwKOprf7eb1m+w1Aa4MUkeKA2RJia
	Jaf5XhF5RpwZ78wppXbzKqHWM3vcQdrX4Lj9M0I4sMwo1xb6QQsMy3T2uijISfIcD6y
	ed/xmONeFaD5SMlQYg+DjZeP8eOERhSdOQLW0A3E=
Content-Type: multipart/mixed; boundary="===============6856389227416115192=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] btrfs-tools: upgrading to 6.3.3 SUCCEEDED
Message-ID: <01010189b1ee41b9-b2d569ad-0916-4fae-b642-0c56b90e5e1c-000000@us-west-2.amazonses.com>
Date: Tue, 1 Aug 2023 16:28:49 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 16:28:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185274

--===============6856389227416115192==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *btrfs-tools* to *6.3.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-btrfs-tools-upgrade-6.3.1-6.3.3.patch
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
From aec19c03dd915f5d35095be744ad2a26c1d8ea74 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Aug 2023 08:35:13 +0000
Subject: [PATCH] btrfs-tools: upgrade 6.3.1 -> 6.3.3

---
 .../btrfs-tools/{btrfs-tools_6.3.1.bb => btrfs-tools_6.3.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_6.3.1.bb => btrfs-tools_6.3.3.bb} (98%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.1.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.3.bb
similarity index 98%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.1.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.3.bb
index 0bdf48ded2..e7a64e8363 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.1.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.3.bb
@@ -18,7 +18,7 @@ DEPENDS = "util-linux zlib"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git;branch=master;protocol=https \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
            "
-SRCREV = "9d2c8c364a6b8df4b1a47ad384cd75fd4ba53e12"
+SRCREV = "bb0ca35245858f17a6ced97aade1dd8d70f9c9d7"
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= " \
-- 
2.39.2


--===============6856389227416115192==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dbg: PKGSIZE changed from 21091980 to 21144932 (+0%)
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dbg: PKGV changed from 6.3.1 [default] to 6.3.3 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dbg: PV changed from "6.3.1" to "6.3.3"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dev: PKGV changed from 6.3.1 [default] to 6.3.3 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dev: PV changed from "6.3.1" to "6.3.3"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-doc: PKGV changed from 6.3.1 [default] to 6.3.3 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-doc: PV changed from "6.3.1" to "6.3.3"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-locale: PKGV changed from 6.3.1 [default] to 6.3.3 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-locale: PV changed from "6.3.1" to "6.3.3"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-src: PKGSIZE changed from 3998178 to 4002612 (+0%)
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-src: PKGV changed from 6.3.1 [default] to 6.3.3 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-src: PV changed from "6.3.1" to "6.3.3"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-staticdev: PKGV changed from 6.3.1 [default] to 6.3.3 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-staticdev: PV changed from "6.3.1" to "6.3.3"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools: PKGSIZE changed from 7012532 to 7024820 (+0%)
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools: PKGV changed from 6.3.1 [default] to 6.3.3 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools: PV changed from "6.3.1" to "6.3.3"
packages/core2-32-poky-linux/btrfs-tools: PKGV changed from 6.3.1 [default] to 6.3.3 [default]
packages/core2-32-poky-linux/btrfs-tools: PV changed from "6.3.1" to "6.3.3"
Changes to packages/core2-32-poky-linux/btrfs-tools (sysroot):
  /usr/lib/python3.11/site-packages/btrfsutil-6.3.1-py3.11.egg-info moved to /usr/lib/python3.11/site-packages/btrfsutil-6.3.3-py3.11.egg-info

--===============6856389227416115192==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-btrfs-tools-upgrade-6.3.1-6.3.3.patch"

RnJvbSBhZWMxOWMwM2RkOTE1ZjVkMzUwOTViZTc0NGFkMmEyNmMxZDhlYTc0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBBdWcgMjAyMyAwODozNToxMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGJ0
cmZzLXRvb2xzOiB1cGdyYWRlIDYuMy4xIC0+IDYuMy4zCgotLS0KIC4uLi9idHJmcy10b29scy97
YnRyZnMtdG9vbHNfNi4zLjEuYmIgPT4gYnRyZnMtdG9vbHNfNi4zLjMuYmJ9ICB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1kZXZ0b29scy9idHJmcy10b29scy97YnRyZnMtdG9vbHNfNi4zLjEuYmIgPT4gYnRy
ZnMtdG9vbHNfNi4zLjMuYmJ9ICg5OCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2J0cmZzLXRvb2xzL2J0cmZzLXRvb2xzXzYuMy4xLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2J0cmZzLXRvb2xzL2J0cmZzLXRvb2xzXzYuMy4zLmJiCnNpbWlsYXJpdHkgaW5kZXggOTgl
CnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9idHJmcy10b29scy9idHJmcy10b29s
c182LjMuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2J0cmZzLXRvb2xzL2J0
cmZzLXRvb2xzXzYuMy4zLmJiCmluZGV4IDBiZGY0OGRlZDIuLmU3YTY0ZTgzNjMgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9idHJmcy10b29scy9idHJmcy10b29sc182LjMuMS5i
YgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYnRyZnMtdG9vbHMvYnRyZnMtdG9vbHNfNi4z
LjMuYmIKQEAgLTE4LDcgKzE4LDcgQEAgREVQRU5EUyA9ICJ1dGlsLWxpbnV4IHpsaWIiCiBTUkNf
VVJJID0gImdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9rZGF2
ZS9idHJmcy1wcm9ncy5naXQ7YnJhbmNoPW1hc3Rlcjtwcm90b2NvbD1odHRwcyBcCiAgICAgICAg
ICAgIGZpbGU6Ly8wMDAxLUFkZC1hLXBvc3NpYmlsaXR5LXRvLXNwZWNpZnktd2hlcmUtcHl0aG9u
LW1vZHVsZXMtYXIucGF0Y2ggXAogICAgICAgICAgICAiCi1TUkNSRVYgPSAiOWQyYzhjMzY0YTZi
OGRmNGIxYTQ3YWQzODRjZDc1ZmQ0YmE1M2UxMiIKK1NSQ1JFViA9ICJiYjBjYTM1MjQ1ODU4ZjE3
YTZjZWQ5N2FhZGUxZGQ4ZDcwZjljOWQ3IgogUyA9ICIke1dPUktESVJ9L2dpdCIKIAogUEFDS0FH
RUNPTkZJRyA/Pz0gIiBcCi0tIAoyLjM5LjIKCg==

--===============6856389227416115192==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/btrfs-tools (sysroot):
  /usr/lib/python3.11/site-packages/btrfsutil-6.3.1-py3.11.egg-info moved to /usr/lib/python3.11/site-packages/btrfsutil-6.3.3-py3.11.egg-info

--===============6856389227416115192==--

