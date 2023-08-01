Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48D66C25B7C
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 16:28:52 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.17707.1690907329723869928
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Aug 2023 09:28:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Wlr2n2Oy;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ORWZWc4j;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010189b1ee4aaa-1b514c36-8dc3-42c2-95e2-3685a397dcee-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1690907331;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=C/31xm2PtwxM1IWTwi2khYKwUqiI0RCRjeXJen4TIdc=;
	b=Wlr2n2OyqzG+ejUvEyugmuyJp++N3L1svux4g0+qzSK7Up5E0Ezev36YSf6jyXfD
	1nmgjLWJ9y+XWdjbDH/ywUguSwbeOWitpxXnvrSaZtY/CeIu+UU4THm7C9fo8e0IoJ5
	zOS9XbDX1cPnndhtLX2nA/+ZkFLAbLi/r+q6wdUM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1690907331;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=C/31xm2PtwxM1IWTwi2khYKwUqiI0RCRjeXJen4TIdc=;
	b=ORWZWc4jNEIlbVWynfImsMR7TBpw0MCzUONw37N6t+2z4yny5ocLgBPqO6sRmvQJ
	qIdVeznQZ2PZY87wQzsviLuW8ndZznjCGm6I17fk/R99AmSHV0xD/ONE8M9La7vEJ44
	H8j+QUBQEjVJpdwjuYsZ003wk5JoSyipekr216vY=
Content-Type: multipart/mixed; boundary="===============0280537276657556068=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] sysklogd: upgrading to 2.5.1 SUCCEEDED
Message-ID: <01010189b1ee4aaa-1b514c36-8dc3-42c2-95e2-3685a397dcee-000000@us-west-2.amazonses.com>
Date: Tue, 1 Aug 2023 16:28:51 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 16:28:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185307

--===============0280537276657556068==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *sysklogd* to *2.5.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-sysklogd-upgrade-2.5.0-2.5.1.patch
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
From fe7f6a93007a22c362471aeba18b28414b591e99 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Aug 2023 13:01:48 +0000
Subject: [PATCH] sysklogd: upgrade 2.5.0 -> 2.5.1

---
 .../sysklogd/{sysklogd_2.5.0.bb => sysklogd_2.5.1.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/sysklogd/{sysklogd_2.5.0.bb => sysklogd_2.5.1.bb} (97%)

diff --git a/meta/recipes-extended/sysklogd/sysklogd_2.5.0.bb b/meta/recipes-extended/sysklogd/sysklogd_2.5.1.bb
similarity index 97%
rename from meta/recipes-extended/sysklogd/sysklogd_2.5.0.bb
rename to meta/recipes-extended/sysklogd/sysklogd_2.5.1.bb
index 096bd376d7..6bfc6772ab 100644
--- a/meta/recipes-extended/sysklogd/sysklogd_2.5.0.bb
+++ b/meta/recipes-extended/sysklogd/sysklogd_2.5.1.bb
@@ -14,7 +14,7 @@ SRC_URI = "git://github.com/troglobit/sysklogd.git;branch=master;protocol=https
            file://sysklogd \
            "
 
-SRCREV = "b6d1ae26671a85e6087c98ec8b630855fc52886a"
+SRCREV = "4b36ea16a3bad76bcef04b58889e1cc23ba6d57d"
 
 S = "${WORKDIR}/git"
 
-- 
2.39.2


--===============0280537276657556068==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/sysklogd: PV changed from "2.5.0" to "2.5.1"
packages/core2-32-poky-linux/sysklogd: PKGV changed from 2.5.0 [default] to 2.5.1 [default]
packages/core2-32-poky-linux/sysklogd/sysklogd-dbg: PV changed from "2.5.0" to "2.5.1"
packages/core2-32-poky-linux/sysklogd/sysklogd-dbg: PKGSIZE changed from 170784 to 170372 (-0%)
packages/core2-32-poky-linux/sysklogd/sysklogd-dbg: PKGV changed from 2.5.0 [default] to 2.5.1 [default]
packages/core2-32-poky-linux/sysklogd/sysklogd-dev: PV changed from "2.5.0" to "2.5.1"
packages/core2-32-poky-linux/sysklogd/sysklogd-dev: PKGSIZE changed from 9554 to 9557 (+0%)
packages/core2-32-poky-linux/sysklogd/sysklogd-dev: PKGV changed from 2.5.0 [default] to 2.5.1 [default]
packages/core2-32-poky-linux/sysklogd/sysklogd-doc: PV changed from "2.5.0" to "2.5.1"
packages/core2-32-poky-linux/sysklogd/sysklogd-doc: PKGSIZE changed from 92563 to 93558 (+1%)
packages/core2-32-poky-linux/sysklogd/sysklogd-doc: PKGV changed from 2.5.0 [default] to 2.5.1 [default]
packages/core2-32-poky-linux/sysklogd/sysklogd-locale: PV changed from "2.5.0" to "2.5.1"
packages/core2-32-poky-linux/sysklogd/sysklogd-locale: PKGV changed from 2.5.0 [default] to 2.5.1 [default]
packages/core2-32-poky-linux/sysklogd/sysklogd-src: PV changed from "2.5.0" to "2.5.1"
packages/core2-32-poky-linux/sysklogd/sysklogd-src: PKGSIZE changed from 149287 to 148991 (-0%)
packages/core2-32-poky-linux/sysklogd/sysklogd-src: PKGV changed from 2.5.0 [default] to 2.5.1 [default]
packages/core2-32-poky-linux/sysklogd/sysklogd-staticdev: PV changed from "2.5.0" to "2.5.1"
packages/core2-32-poky-linux/sysklogd/sysklogd-staticdev: PKGV changed from 2.5.0 [default] to 2.5.1 [default]
packages/core2-32-poky-linux/sysklogd/sysklogd: PV changed from "2.5.0" to "2.5.1"
packages/core2-32-poky-linux/sysklogd/sysklogd: PKGV changed from 2.5.0 [default] to 2.5.1 [default]

--===============0280537276657556068==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-sysklogd-upgrade-2.5.0-2.5.1.patch"

RnJvbSBmZTdmNmE5MzAwN2EyMmMzNjI0NzFhZWJhMThiMjg0MTRiNTkxZTk5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBBdWcgMjAyMyAxMzowMTo0OCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHN5
c2tsb2dkOiB1cGdyYWRlIDIuNS4wIC0+IDIuNS4xCgotLS0KIC4uLi9zeXNrbG9nZC97c3lza2xv
Z2RfMi41LjAuYmIgPT4gc3lza2xvZ2RfMi41LjEuYmJ9ICAgICAgICAgICB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1leHRlbmRlZC9zeXNrbG9nZC97c3lza2xvZ2RfMi41LjAuYmIgPT4gc3lza2xvZ2RfMi41
LjEuYmJ9ICg5NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3N5c2tsb2dk
L3N5c2tsb2dkXzIuNS4wLmJiIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3N5c2tsb2dkL3N5c2ts
b2dkXzIuNS4xLmJiCnNpbWlsYXJpdHkgaW5kZXggOTclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBl
cy1leHRlbmRlZC9zeXNrbG9nZC9zeXNrbG9nZF8yLjUuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNp
cGVzLWV4dGVuZGVkL3N5c2tsb2dkL3N5c2tsb2dkXzIuNS4xLmJiCmluZGV4IDA5NmJkMzc2ZDcu
LjZiZmM2NzcyYWIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9zeXNrbG9nZC9z
eXNrbG9nZF8yLjUuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc3lza2xvZ2Qvc3lz
a2xvZ2RfMi41LjEuYmIKQEAgLTE0LDcgKzE0LDcgQEAgU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIu
Y29tL3Ryb2dsb2JpdC9zeXNrbG9nZC5naXQ7YnJhbmNoPW1hc3Rlcjtwcm90b2NvbD1odHRwcwog
ICAgICAgICAgICBmaWxlOi8vc3lza2xvZ2QgXAogICAgICAgICAgICAiCiAKLVNSQ1JFViA9ICJi
NmQxYWUyNjY3MWE4NWU2MDg3Yzk4ZWM4YjYzMDg1NWZjNTI4ODZhIgorU1JDUkVWID0gIjRiMzZl
YTE2YTNiYWQ3NmJjZWYwNGI1ODg4OWUxY2MyM2JhNmQ1N2QiCiAKIFMgPSAiJHtXT1JLRElSfS9n
aXQiCiAKLS0gCjIuMzkuMgoK

--===============0280537276657556068==--

