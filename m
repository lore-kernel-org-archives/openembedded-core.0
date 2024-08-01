Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32623C5474F
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 18:27:13 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.75737.1722536823011266854
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Aug 2024 11:27:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=WYDTNJze;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=X33qltvj;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101910f32281d-e052cd47-a1fc-4caa-a104-b7989400a2aa-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1722536831;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=7EDT0BfBCRhaxKQJnjT9OdvFFlkMBMewtEtfTglr0Z0=;
	b=WYDTNJzecP8YLplLIGp/60J2sAVIgFqtacojt4uX4Rmh2Cp4WzNWi9v8CpBlSfOr
	A8CNHniUUR8lB438J+zBKl1Bf7Z9BCjVgeMyS597fDtXSplk3QYtHQkcmG13MfwPU4F
	VAngDiA8jeYnVaw/IYx/9KdWMZZKGm8wSdBEKeg8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1722536831;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=7EDT0BfBCRhaxKQJnjT9OdvFFlkMBMewtEtfTglr0Z0=;
	b=X33qltvj2GadpPtEywGsj/iOxnaG8Br6zFyo/3Uz3+R+YxtyJFwVskQ2B3oLBWvv
	gXh6jHN04Eg466gAYCxQOa4VNggpOFfjuS18RCygBLDliVXlKxCg9hxQQ+RIUf0YxLJ
	dj7tigi4B1cHGptFwSvVlCIA7NVuds78CS86ZtCo=
Content-Type: multipart/mixed; boundary="===============5967569579553741521=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] sysklogd: upgrading to 2.6.1 SUCCEEDED
Message-ID: <010101910f32281d-e052cd47-a1fc-4caa-a104-b7989400a2aa-000000@us-west-2.amazonses.com>
Date: Thu, 1 Aug 2024 18:27:11 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 18:27:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202833

--===============5967569579553741521==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *sysklogd* to *2.6.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-sysklogd-upgrade-2.5.2-2.6.1.patch
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
From 74475f3c2d52c9f523e28e62931a14b1a858ab5a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Aug 2024 12:10:36 +0000
Subject: [PATCH] sysklogd: upgrade 2.5.2 -> 2.6.1

---
 .../sysklogd/{sysklogd_2.5.2.bb => sysklogd_2.6.1.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/sysklogd/{sysklogd_2.5.2.bb => sysklogd_2.6.1.bb} (97%)

diff --git a/meta/recipes-extended/sysklogd/sysklogd_2.5.2.bb b/meta/recipes-extended/sysklogd/sysklogd_2.6.1.bb
similarity index 97%
rename from meta/recipes-extended/sysklogd/sysklogd_2.5.2.bb
rename to meta/recipes-extended/sysklogd/sysklogd_2.6.1.bb
index e488603086..99454b8230 100644
--- a/meta/recipes-extended/sysklogd/sysklogd_2.5.2.bb
+++ b/meta/recipes-extended/sysklogd/sysklogd_2.6.1.bb
@@ -14,7 +14,7 @@ SRC_URI = "git://github.com/troglobit/sysklogd.git;branch=master;protocol=https
            file://sysklogd \
            "
 
-SRCREV = "3332c550f1a68393daec5d64cd81f3b7674c0af5"
+SRCREV = "c2bc519697aaa94f7b5e658a31ff55b9d54e7c8d"
 
 S = "${WORKDIR}/git"
 
-- 
2.44.0


--===============5967569579553741521==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/sysklogd: PV changed from "2.5.2" to "2.6.1"
packages/core2-64-poky-linux/sysklogd: PKGV changed from 2.5.2 [default] to 2.6.1 [default]
packages/core2-64-poky-linux/sysklogd/sysklogd-dbg: PKGSIZE changed from 201128 to 207352 (+3%)
packages/core2-64-poky-linux/sysklogd/sysklogd-dbg: PV changed from "2.5.2" to "2.6.1"
packages/core2-64-poky-linux/sysklogd/sysklogd-dbg: PKGV changed from 2.5.2 [default] to 2.6.1 [default]
packages/core2-64-poky-linux/sysklogd/sysklogd-dev: PV changed from "2.5.2" to "2.6.1"
packages/core2-64-poky-linux/sysklogd/sysklogd-dev: PKGV changed from 2.5.2 [default] to 2.6.1 [default]
packages/core2-64-poky-linux/sysklogd/sysklogd-doc: PKGSIZE changed from 93833 to 97164 (+4%)
packages/core2-64-poky-linux/sysklogd/sysklogd-doc: PV changed from "2.5.2" to "2.6.1"
packages/core2-64-poky-linux/sysklogd/sysklogd-doc: PKGV changed from 2.5.2 [default] to 2.6.1 [default]
packages/core2-64-poky-linux/sysklogd/sysklogd-locale: PV changed from "2.5.2" to "2.6.1"
packages/core2-64-poky-linux/sysklogd/sysklogd-locale: PKGV changed from 2.5.2 [default] to 2.6.1 [default]
packages/core2-64-poky-linux/sysklogd/sysklogd-src: PKGSIZE changed from 145808 to 149954 (+3%)
packages/core2-64-poky-linux/sysklogd/sysklogd-src: PV changed from "2.5.2" to "2.6.1"
packages/core2-64-poky-linux/sysklogd/sysklogd-src: PKGV changed from 2.5.2 [default] to 2.6.1 [default]
packages/core2-64-poky-linux/sysklogd/sysklogd-staticdev: PV changed from "2.5.2" to "2.6.1"
packages/core2-64-poky-linux/sysklogd/sysklogd-staticdev: PKGV changed from 2.5.2 [default] to 2.6.1 [default]
packages/core2-64-poky-linux/sysklogd/sysklogd: PKGSIZE changed from 94126 to 98476 (+5%)
packages/core2-64-poky-linux/sysklogd/sysklogd: PV changed from "2.5.2" to "2.6.1"
packages/core2-64-poky-linux/sysklogd/sysklogd: PKGV changed from 2.5.2 [default] to 2.6.1 [default]

--===============5967569579553741521==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-sysklogd-upgrade-2.5.2-2.6.1.patch"

RnJvbSA3NDQ3NWYzYzJkNTJjOWY1MjNlMjhlNjI5MzFhMTRiMWE4NThhYjVhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBBdWcgMjAyNCAxMjoxMDozNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHN5
c2tsb2dkOiB1cGdyYWRlIDIuNS4yIC0+IDIuNi4xCgotLS0KIC4uLi9zeXNrbG9nZC97c3lza2xv
Z2RfMi41LjIuYmIgPT4gc3lza2xvZ2RfMi42LjEuYmJ9ICAgICAgICAgICB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1leHRlbmRlZC9zeXNrbG9nZC97c3lza2xvZ2RfMi41LjIuYmIgPT4gc3lza2xvZ2RfMi42
LjEuYmJ9ICg5NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3N5c2tsb2dk
L3N5c2tsb2dkXzIuNS4yLmJiIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3N5c2tsb2dkL3N5c2ts
b2dkXzIuNi4xLmJiCnNpbWlsYXJpdHkgaW5kZXggOTclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBl
cy1leHRlbmRlZC9zeXNrbG9nZC9zeXNrbG9nZF8yLjUuMi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNp
cGVzLWV4dGVuZGVkL3N5c2tsb2dkL3N5c2tsb2dkXzIuNi4xLmJiCmluZGV4IGU0ODg2MDMwODYu
Ljk5NDU0YjgyMzAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9zeXNrbG9nZC9z
eXNrbG9nZF8yLjUuMi5iYgorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc3lza2xvZ2Qvc3lz
a2xvZ2RfMi42LjEuYmIKQEAgLTE0LDcgKzE0LDcgQEAgU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIu
Y29tL3Ryb2dsb2JpdC9zeXNrbG9nZC5naXQ7YnJhbmNoPW1hc3Rlcjtwcm90b2NvbD1odHRwcwog
ICAgICAgICAgICBmaWxlOi8vc3lza2xvZ2QgXAogICAgICAgICAgICAiCiAKLVNSQ1JFViA9ICIz
MzMyYzU1MGYxYTY4MzkzZGFlYzVkNjRjZDgxZjNiNzY3NGMwYWY1IgorU1JDUkVWID0gImMyYmM1
MTk2OTdhYWE5NGY3YjVlNjU4YTMxZmY1NWI5ZDU0ZTdjOGQiCiAKIFMgPSAiJHtXT1JLRElSfS9n
aXQiCiAKLS0gCjIuNDQuMAoK

--===============5967569579553741521==--

