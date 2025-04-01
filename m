Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B85FC3ABA6
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 12:43:36 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.18072.1743511394822083804
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 05:43:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=ejv1X93s;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=cs6eLruN;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010195f160c174-96640ba8-d892-49e2-a333-311208fa7692-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1743511405;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=RFKa8M1fmu75Vpmqdnn0poyD6+yv474GIKFKgQdFpcI=;
	b=ejv1X93sbjTCZrP/o9bxT5OsVQWPM+Ku6myqJ1zFsdOen7CkFHfxzL/Ejk4i6bkb
	PaB0Th3toyNgw2dLeaAcFIUWiGXzemuK5djdtU+JpJPybHTgHWOWDC4vRPnE6Bvuu7X
	sYI5LFGyS0zswcGZqySHXBiosD0XZv7mMoTf7WkY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1743511405;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=RFKa8M1fmu75Vpmqdnn0poyD6+yv474GIKFKgQdFpcI=;
	b=cs6eLruNOlfcH/+uM/j32a9+Ep5+F9ODnn32OqxZNqTCpTKeWGZ6sCNNsSLfDPD5
	gkBeiVscUr+mjKXgUs0ZPqLJjBFApUE7nIFZVUCcQO609I2uK+wopp1UeEJ/hxdA+aS
	nqIwXDjhRnZBpQIbTxe0sVmCOd6tmAckkK3jU5O4=
Content-Type: multipart/mixed; boundary="===============1868496941001945254=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] sysklogd: upgrading to 2.7.2 SUCCEEDED
Message-ID: <01010195f160c174-96640ba8-d892-49e2-a333-311208fa7692-000000@us-west-2.amazonses.com>
Date: Tue, 1 Apr 2025 12:43:24 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.04.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 12:43:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214089

--===============1868496941001945254==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *sysklogd* to *2.7.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-sysklogd-upgrade-2.7.1-2.7.2.patch
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
From e127b51cae7442501dff44003fc8bd9f13ebae4e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Apr 2025 10:14:02 +0000
Subject: [PATCH] sysklogd: upgrade 2.7.1 -> 2.7.2

---
 .../sysklogd/{sysklogd_2.7.1.bb => sysklogd_2.7.2.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/sysklogd/{sysklogd_2.7.1.bb => sysklogd_2.7.2.bb} (97%)

diff --git a/meta/recipes-extended/sysklogd/sysklogd_2.7.1.bb b/meta/recipes-extended/sysklogd/sysklogd_2.7.2.bb
similarity index 97%
rename from meta/recipes-extended/sysklogd/sysklogd_2.7.1.bb
rename to meta/recipes-extended/sysklogd/sysklogd_2.7.2.bb
index b7e3254277..cce0687e8c 100644
--- a/meta/recipes-extended/sysklogd/sysklogd_2.7.1.bb
+++ b/meta/recipes-extended/sysklogd/sysklogd_2.7.2.bb
@@ -14,7 +14,7 @@ SRC_URI = "git://github.com/troglobit/sysklogd.git;branch=master;protocol=https
            file://sysklogd \
            "
 
-SRCREV = "5552a3ea0d025573a5e212d62ee3e04bd376c7c4"
+SRCREV = "5fb314cb9060afa3bd4eed2f0be3200f02f729e9"
 
 S = "${WORKDIR}/git"
 
-- 
2.47.1


--===============1868496941001945254==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-sysklogd-upgrade-2.7.1-2.7.2.patch"

RnJvbSBlMTI3YjUxY2FlNzQ0MjUwMWRmZjQ0MDAzZmM4YmQ5ZjEzZWJhZTRlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBBcHIgMjAyNSAxMDoxNDowMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHN5
c2tsb2dkOiB1cGdyYWRlIDIuNy4xIC0+IDIuNy4yCgotLS0KIC4uLi9zeXNrbG9nZC97c3lza2xv
Z2RfMi43LjEuYmIgPT4gc3lza2xvZ2RfMi43LjIuYmJ9ICAgICAgICAgICB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1leHRlbmRlZC9zeXNrbG9nZC97c3lza2xvZ2RfMi43LjEuYmIgPT4gc3lza2xvZ2RfMi43
LjIuYmJ9ICg5NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3N5c2tsb2dk
L3N5c2tsb2dkXzIuNy4xLmJiIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3N5c2tsb2dkL3N5c2ts
b2dkXzIuNy4yLmJiCnNpbWlsYXJpdHkgaW5kZXggOTclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBl
cy1leHRlbmRlZC9zeXNrbG9nZC9zeXNrbG9nZF8yLjcuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNp
cGVzLWV4dGVuZGVkL3N5c2tsb2dkL3N5c2tsb2dkXzIuNy4yLmJiCmluZGV4IGI3ZTMyNTQyNzcu
LmNjZTA2ODdlOGMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9zeXNrbG9nZC9z
eXNrbG9nZF8yLjcuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc3lza2xvZ2Qvc3lz
a2xvZ2RfMi43LjIuYmIKQEAgLTE0LDcgKzE0LDcgQEAgU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIu
Y29tL3Ryb2dsb2JpdC9zeXNrbG9nZC5naXQ7YnJhbmNoPW1hc3Rlcjtwcm90b2NvbD1odHRwcwog
ICAgICAgICAgICBmaWxlOi8vc3lza2xvZ2QgXAogICAgICAgICAgICAiCiAKLVNSQ1JFViA9ICI1
NTUyYTNlYTBkMDI1NTczYTVlMjEyZDYyZWUzZTA0YmQzNzZjN2M0IgorU1JDUkVWID0gIjVmYjMx
NGNiOTA2MGFmYTNiZDRlZWQyZjBiZTMyMDBmMDJmNzI5ZTkiCiAKIFMgPSAiJHtXT1JLRElSfS9n
aXQiCiAKLS0gCjIuNDcuMQoK

--===============1868496941001945254==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/sysklogd: PV changed from "2.7.1" to "2.7.2"
packages/core2-64-poky-linux/sysklogd: PKGV changed from 2.7.1 [default] to 2.7.2 [default]
packages/core2-64-poky-linux/sysklogd/sysklogd-dbg: PV changed from "2.7.1" to "2.7.2"
packages/core2-64-poky-linux/sysklogd/sysklogd-dbg: PKGV changed from 2.7.1 [default] to 2.7.2 [default]
packages/core2-64-poky-linux/sysklogd/sysklogd-dev: PV changed from "2.7.1" to "2.7.2"
packages/core2-64-poky-linux/sysklogd/sysklogd-dev: PKGSIZE changed from 9858 to 9857 (-0%)
packages/core2-64-poky-linux/sysklogd/sysklogd-dev: PKGV changed from 2.7.1 [default] to 2.7.2 [default]
packages/core2-64-poky-linux/sysklogd/sysklogd-doc: PV changed from "2.7.1" to "2.7.2"
packages/core2-64-poky-linux/sysklogd/sysklogd-doc: PKGSIZE changed from 111015 to 111420 (+0%)
packages/core2-64-poky-linux/sysklogd/sysklogd-doc: PKGV changed from 2.7.1 [default] to 2.7.2 [default]
packages/core2-64-poky-linux/sysklogd/sysklogd-locale: PV changed from "2.7.1" to "2.7.2"
packages/core2-64-poky-linux/sysklogd/sysklogd-locale: PKGV changed from 2.7.1 [default] to 2.7.2 [default]
packages/core2-64-poky-linux/sysklogd/sysklogd-src: PV changed from "2.7.1" to "2.7.2"
packages/core2-64-poky-linux/sysklogd/sysklogd-src: PKGSIZE changed from 168752 to 168754 (+0%)
packages/core2-64-poky-linux/sysklogd/sysklogd-src: PKGV changed from 2.7.1 [default] to 2.7.2 [default]
packages/core2-64-poky-linux/sysklogd/sysklogd-staticdev: PV changed from "2.7.1" to "2.7.2"
packages/core2-64-poky-linux/sysklogd/sysklogd-staticdev: PKGV changed from 2.7.1 [default] to 2.7.2 [default]
packages/core2-64-poky-linux/sysklogd/sysklogd: PV changed from "2.7.1" to "2.7.2"
packages/core2-64-poky-linux/sysklogd/sysklogd: PKGSIZE changed from 102716 to 102718 (+0%)
packages/core2-64-poky-linux/sysklogd/sysklogd: PKGV changed from 2.7.1 [default] to 2.7.2 [default]

--===============1868496941001945254==--

