Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA1C4C4167D
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 14:25:13 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.8484.1698848703888072599
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 07:25:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ZNaSuqf3;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=j6NeiPxW;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.193, mailfrom: 0101018b8b460213-a1681eb7-0943-43b0-97ef-b9b03e2d2ed6-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1698848703;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=vWEpjPsesRlQ37cPCq67OBTs7gV03kg6Bozfh+ju0Qo=;
	b=ZNaSuqf3dXYULliMUwLKIHsF40GbeJiC8Bi7eTgltr06ENvjWw2DidbrRUNu4hSc
	fI/Sw8JjM5ZbPAPumHZN01HGGRrWf4MJg20xiITYXLNkvMuRMYNAOBu2TivAlwqylrw
	LKyECeP5lLSsqYJACndkSCkYvxA0XGaqtF3HxWXs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1698848703;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=vWEpjPsesRlQ37cPCq67OBTs7gV03kg6Bozfh+ju0Qo=;
	b=j6NeiPxWXf1g0sMZEDu8/ejbq/mO9Ak7Kfmgj8f4/Cn1Fo7VUIktnWJXrh+6ULzZ
	0BUKc8h3NMuFb+mCgrZV1DA1z5PzVGSv1bgLRS1/To6NvuaXmfgHrnDFA2smmDvxtpq
	Uck3mq7AJVe4pfKCMyAb0QLYN6t/iOoDzQ/b53qM=
Content-Type: multipart/mixed; boundary="===============0229672970004776514=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libdnf: upgrading to 0.72.0 SUCCEEDED
Message-ID: <0101018b8b460213-a1681eb7-0943-43b0-97ef-b9b03e2d2ed6-000000@us-west-2.amazonses.com>
Date: Wed, 1 Nov 2023 14:25:02 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 14:25:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189946

--===============0229672970004776514==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libdnf* to *0.72.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libdnf-upgrade-0.71.0-0.72.0.patch
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
From 9588253b81a3fb036ce3a5a414ac7d40ef087003 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Nov 2023 07:00:16 +0000
Subject: [PATCH] libdnf: upgrade 0.71.0 -> 0.72.0

---
 .../libdnf/{libdnf_0.71.0.bb => libdnf_0.72.0.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/libdnf/{libdnf_0.71.0.bb => libdnf_0.72.0.bb} (97%)

diff --git a/meta/recipes-devtools/libdnf/libdnf_0.71.0.bb b/meta/recipes-devtools/libdnf/libdnf_0.72.0.bb
similarity index 97%
rename from meta/recipes-devtools/libdnf/libdnf_0.71.0.bb
rename to meta/recipes-devtools/libdnf/libdnf_0.72.0.bb
index 396a6664bc..d58ad0353f 100644
--- a/meta/recipes-devtools/libdnf/libdnf_0.71.0.bb
+++ b/meta/recipes-devtools/libdnf/libdnf_0.72.0.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://github.com/rpm-software-management/libdnf;branch=dnf-4-master;p
            file://0001-drop-FindPythonInstDir.cmake.patch \
            "
 
-SRCREV = "39098f39806becdc87cf93e03a49ae89a33e7ede"
+SRCREV = "908dba63c9e18c86a2d81166ce7523559e65338c"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(?!4\.90)\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.39.2


--===============0229672970004776514==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libdnf-upgrade-0.71.0-0.72.0.patch"

RnJvbSA5NTg4MjUzYjgxYTNmYjAzNmNlM2E1YTQxNGFjN2Q0MGVmMDg3MDAzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBOb3YgMjAyMyAwNzowMDoxNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YmRuZjogdXBncmFkZSAwLjcxLjAgLT4gMC43Mi4wCgotLS0KIC4uLi9saWJkbmYve2xpYmRuZl8w
LjcxLjAuYmIgPT4gbGliZG5mXzAuNzIuMC5iYn0gICAgICAgICAgICAgICB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1kZXZ0b29scy9saWJkbmYve2xpYmRuZl8wLjcxLjAuYmIgPT4gbGliZG5mXzAuNzIuMC5i
Yn0gKDk3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGliZG5mL2xpYmRu
Zl8wLjcxLjAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGliZG5mL2xpYmRuZl8wLjcyLjAu
YmIKc2ltaWxhcml0eSBpbmRleCA5NyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2xpYmRuZi9saWJkbmZfMC43MS4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
bGliZG5mL2xpYmRuZl8wLjcyLjAuYmIKaW5kZXggMzk2YTY2NjRiYy4uZDU4YWQwMzUzZiAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2xpYmRuZi9saWJkbmZfMC43MS4wLmJiCisr
KyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9saWJkbmYvbGliZG5mXzAuNzIuMC5iYgpAQCAtMTIs
NyArMTIsNyBAQCBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vcnBtLXNvZnR3YXJlLW1hbmFn
ZW1lbnQvbGliZG5mO2JyYW5jaD1kbmYtNC1tYXN0ZXI7cAogICAgICAgICAgICBmaWxlOi8vMDAw
MS1kcm9wLUZpbmRQeXRob25JbnN0RGlyLmNtYWtlLnBhdGNoIFwKICAgICAgICAgICAgIgogCi1T
UkNSRVYgPSAiMzkwOThmMzk4MDZiZWNkYzg3Y2Y5M2UwM2E0OWFlODlhMzNlN2VkZSIKK1NSQ1JF
ViA9ICI5MDhkYmE2M2M5ZTE4Yzg2YTJkODExNjZjZTc1MjM1NTllNjUzMzhjIgogVVBTVFJFQU1f
Q0hFQ0tfR0lUVEFHUkVHRVggPSAiKD9QPHB2ZXI+KD8hNFwuOTApXGQrKFwuXGQrKSspIgogCiBT
ID0gIiR7V09SS0RJUn0vZ2l0IgotLSAKMi4zOS4yCgo=

--===============0229672970004776514==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libdnf: PACKAGES: added "libdnf-locale-ka"
packages/core2-64-poky-linux/libdnf: PKGV changed from 0.71.0 [default] to 0.72.0 [default]
packages/core2-64-poky-linux/libdnf: PV changed from "0.71.0" to "0.72.0"
packages/core2-64-poky-linux/libdnf/libdnf-dbg: PKGSIZE changed from 57856000 to 57996560 (+0%)
packages/core2-64-poky-linux/libdnf/libdnf-dbg: PKGV changed from 0.71.0 [default] to 0.72.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-dbg: PV changed from "0.71.0" to "0.72.0"
packages/core2-64-poky-linux/libdnf/libdnf-dev: PKGSIZE changed from 212332 to 212911 (+0%)
packages/core2-64-poky-linux/libdnf/libdnf-dev: PKGV changed from 0.71.0 [default] to 0.72.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-dev: PV changed from "0.71.0" to "0.72.0"
packages/core2-64-poky-linux/libdnf/libdnf-doc: PKGV changed from 0.71.0 [default] to 0.72.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-doc: PV changed from "0.71.0" to "0.72.0"
packages/core2-64-poky-linux/libdnf/libdnf-locale-as: PKGV changed from 0.71.0 [default] to 0.72.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-as: PV changed from "0.71.0" to "0.72.0"
packages/core2-64-poky-linux/libdnf/libdnf-locale-bg: PKGV changed from 0.71.0 [default] to 0.72.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-bg: PV changed from "0.71.0" to "0.72.0"
packages/core2-64-poky-linux/libdnf/libdnf-locale-bn-in: PKGV changed from 0.71.0 [default] to 0.72.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-bn-in: PV changed from "0.71.0" to "0.72.0"
packages/core2-64-poky-linux/libdnf/libdnf-locale-bn: PKGV changed from 0.71.0 [default] to 0.72.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-bn: PV changed from "0.71.0" to "0.72.0"
packages/core2-64-poky-linux/libdnf/libdnf-locale-ca: PKGV changed from 0.71.0 [default] to 0.72.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-ca: PV changed from "0.71.0" to "0.72.0"
packages/core2-64-poky-linux/libdnf/libdnf-locale-cs: PKGSIZE changed from 3093 to 17761 (+474%)
packages/core2-64-poky-linux/libdnf/libdnf-locale-cs: PKGV changed from 0.71.0 [default] to 0.72.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-cs: PV changed from "0.71.0" to "0.72.0"
packages/core2-64-poky-linux/libdnf/libdnf-locale-da: PKGSIZE changed from 2683 to 2606 (-3%)
packages/core2-64-poky-linux/libdnf/libdnf-locale-da: PKGV changed from 0.71.0 [default] to 0.72.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-da: PV changed from "0.71.0" to "0.72.0"
packages/core2-64-poky-linux/libdnf/libdnf-locale-de: PKGSIZE changed from 16245 to 14333 (-12%)
packages/core2-64-poky-linux/libdnf/libdnf-locale-de: PKGV changed from 0.71.0 [default] to 0.72.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-de: PV changed from "0.71.0" to "0.72.0"
packages/core2-64-poky-linux/libdnf/libdnf-locale-el: PKGV changed from 0.71.0 [default] to 0.72.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-el: PV changed from "0.71.0" to "0.72.0"
packages/core2-64-poky-linux/libdnf/libdnf-locale-es: PKGSIZE changed from 11388 to 10980 (-4%)
packages/core2-64-poky-linux/libdnf/libdnf-locale-es: PKGV changed from 0.71.0 [default] to 0.72.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-es: PV changed from "0.71.0" to "0.72.0"
packages/core2-64-poky-linux/libdnf/libdnf-locale-eu: PKGV changed from 0.71.0 [default] to 0.72.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-eu: PV changed from "0.71.0" to "0.72.0"
packages/core2-64-poky-linux/libdnf/libdnf-locale-fa: PKGSIZE changed from 469 to 618 (+32%)
packages/core2-64-poky-linux/libdnf/libdnf-locale-fa: PKGV changed from 0.71.0 [default] to 0.72.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-fa: PV changed from "0.71.0" to "0.72.0"
packages/core2-64-poky-linux/libdnf/libdnf-locale-fi: PKGSIZE changed from 26045 to 26832 (+3%)
packages/core2-64-poky-linux/libdnf/libdnf-locale-fi: PKGV changed from 0.71.0 [default] to 0.72.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-fi: PV changed from "0.71.0" to "0.72.0"
packages/core2-64-poky-linux/libdnf/libdnf-locale-fil: PKGV changed from 0.71.0 [default] to 0.72.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-fil: PV changed from "0.71.0" to "0.72.0"
packages/core2-64-poky-linux/libdnf/libdnf-locale-fr: PKGSIZE changed from 27613 to 25900 (-6%)
packages/core2-64-poky-linux/libdnf/libdnf-locale-fr: PKGV changed from 0.71.0 [default] to 0.72.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-fr: PV changed from "0.71.0" to "0.72.0"
packages/core2-64-poky-linux/libdnf/libdnf-locale-fur: PKGSIZE changed from 20445 to 21134 (+3%)
packages/core2-64-poky-linux/libdnf/libdnf-locale-fur: PKGV changed from 0.71.0 [default] to 0.72.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-fur: PV changed from "0.71.0" to "0.72.0"
packages/core2-64-poky-linux/libdnf/libdnf-locale-gu: PKGV changed from 0.71.0 [default] to 0.72.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-gu: PV changed from "0.71.0" to "0.72.0"
packages/core2-64-poky-linux/libdnf/libdnf-locale-hi: PKGV changed from 0.71.0 [default] to 0.72.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-hi: PV changed from "0.71.0" to "0.72.0"
packages/core2-64-poky-linux/libdnf/libdnf-locale-hu: PKGSIZE changed from 7506 to 14162 (+89%)
packages/core2-64-poky-linux/libdnf/libdnf-locale-hu: PKGV changed from 0.71.0 [default] to 0.72.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-hu: PV changed from "0.71.0" to "0.72.0"
packages/core2-64-poky-linux/libdnf/libdnf-locale-ia: PKGV changed from 0.71.0 [default] to 0.72.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-ia: PV changed from "0.71.0" to "0.72.0"
packages/core2-64-poky-linux/libdnf/libdnf-locale-id: PKGSIZE changed from 1541 to 1708 (+11%)
packages/core2-64-poky-linux/libdnf/libdnf-locale-id: PKGV changed from 0.71.0 [default] to 0.72.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-id: PV changed from "0.71.0" to "0.72.0"
packages/core2-64-poky-linux/libdnf/libdnf-locale-is: PKGV changed from 0.71.0 [default] to 0.72.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-is: PV changed from "0.71.0" to "0.72.0"
packages/core2-64-poky-linux/libdnf/libdnf-locale-it: PKGSIZE changed from 11081 to 11429 (+3%)
packages/core2-64-poky-linux/libdnf/libdnf-locale-it: PKGV changed from 0.71.0 [default] to 0.72.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-it: PV changed from "0.71.0" to "0.72.0"
packages/core2-64-poky-linux/libdnf/libdnf-locale-ja: PKGSIZE changed from 29059 to 28087 (-3%)
packages/core2-64-poky-linux/libdnf/libdnf-locale-ja: PKGV changed from 0.71.0 [default] to 0.72.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-ja: PV changed from "0.71.0" to "0.72.0"
packages/core2-64-poky-linux/libdnf/libdnf-locale-kn: PKGV changed from 0.71.0 [default] to 0.72.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-kn: PV changed from "0.71.0" to "0.72.0"
packages/core2-64-poky-linux/libdnf/libdnf-locale-ko: PKGSIZE changed from 27383 to 29748 (+9%)
packages/core2-64-poky-linux/libdnf/libdnf-locale-ko: PKGV changed from 0.71.0 [default] to 0.72.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-ko: PV changed from "0.71.0" to "0.72.0"
packages/core2-64-poky-linux/libdnf/libdnf-locale-mai: PKGV changed from 0.71.0 [default] to 0.72.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-mai: PV changed from "0.71.0" to "0.72.0"
packages/core2-64-poky-linux/libdnf/libdnf-locale-ml: PKGV changed from 0.71.0 [default] to 0.72.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-ml: PV changed from "0.71.0" to "0.72.0"
packages/core2-64-poky-linux/libdnf/libdnf-locale-mr: PKGV changed from 0.71.0 [default] to 0.72.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-mr: PV changed from "0.71.0" to "0.72.0"
packages/core2-64-poky-linux/libdnf/libdnf-locale-nb: PKGV changed from 0.71.0 [default] to 0.72.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-nb: PV changed from "0.71.0" to "0.72.0"
packages/core2-64-poky-linux/libdnf/libdnf-locale-nl: PKGSIZE changed from 25805 to 27970 (+8%)
packages/core2-64-poky-linux/libdnf/libdnf-locale-nl: PKGV changed from 0.71.0 [default] to 0.72.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-nl: PV changed from "0.71.0" to "0.72.0"
packages/core2-64-poky-linux/libdnf/libdnf-locale-or: PKGV changed from 0.71.0 [default] to 0.72.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-or: PV changed from "0.71.0" to "0.72.0"
packages/core2-64-poky-linux/libdnf/libdnf-locale-pa: PKGV changed from 0.71.0 [default] to 0.72.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-pa: PV changed from "0.71.0" to "0.72.0"
packages/core2-64-poky-linux/libdnf/libdnf-locale-pl: PKGSIZE changed from 27504 to 29704 (+8%)
packages/core2-64-poky-linux/libdnf/libdnf-locale-pl: PKGV changed from 0.71.0 [default] to 0.72.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-pl: PV changed from "0.71.0" to "0.72.0"
packages/core2-64-poky-linux/libdnf/libdnf-locale-pt-br: PKGSIZE changed from 19262 to 18333 (-5%)
packages/core2-64-poky-linux/libdnf/libdnf-locale-pt-br: PKGV changed from 0.71.0 [default] to 0.72.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-pt-br: PV changed from "0.71.0" to "0.72.0"
packages/core2-64-poky-linux/libdnf/libdnf-locale-pt: PKGV changed from 0.71.0 [default] to 0.72.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-pt: PV changed from "0.71.0" to "0.72.0"
packages/core2-64-poky-linux/libdnf/libdnf-locale-ru: PKGSIZE changed from 33916 to 31513 (-7%)
packages/core2-64-poky-linux/libdnf/libdnf-locale-ru: PKGV changed from 0.71.0 [default] to 0.72.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-ru: PV changed from "0.71.0" to "0.72.0"
packages/core2-64-poky-linux/libdnf/libdnf-locale-si: PKGV changed from 0.71.0 [default] to 0.72.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-si: PV changed from "0.71.0" to "0.72.0"
packages/core2-64-poky-linux/libdnf/libdnf-locale-sk: PKGV changed from 0.71.0 [default] to 0.72.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-sk: PV changed from "0.71.0" to "0.72.0"
packages/core2-64-poky-linux/libdnf/libdnf-locale-sq: PKGV changed from 0.71.0 [default] to 0.72.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-sq: PV changed from "0.71.0" to "0.72.0"
packages/core2-64-poky-linux/libdnf/libdnf-locale-sr+latin: PKGV changed from 0.71.0 [default] to 0.72.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-sr+latin: PV changed from "0.71.0" to "0.72.0"
packages/core2-64-poky-linux/libdnf/libdnf-locale-sr: PKGV changed from 0.71.0 [default] to 0.72.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-sr: PV changed from "0.71.0" to "0.72.0"
packages/core2-64-poky-linux/libdnf/libdnf-locale-sv: PKGSIZE changed from 26253 to 28405 (+8%)
packages/core2-64-poky-linux/libdnf/libdnf-locale-sv: PKGV changed from 0.71.0 [default] to 0.72.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-sv: PV changed from "0.71.0" to "0.72.0"
packages/core2-64-poky-linux/libdnf/libdnf-locale-ta: PKGV changed from 0.71.0 [default] to 0.72.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-ta: PV changed from "0.71.0" to "0.72.0"
packages/core2-64-poky-linux/libdnf/libdnf-locale-te: PKGV changed from 0.71.0 [default] to 0.72.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-te: PV changed from "0.71.0" to "0.72.0"
packages/core2-64-poky-linux/libdnf/libdnf-locale-th: PKGV changed from 0.71.0 [default] to 0.72.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-th: PV changed from "0.71.0" to "0.72.0"
packages/core2-64-poky-linux/libdnf/libdnf-locale-tr: PKGSIZE changed from 26179 to 24120 (-8%)
packages/core2-64-poky-linux/libdnf/libdnf-locale-tr: PKGV changed from 0.71.0 [default] to 0.72.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-tr: PV changed from "0.71.0" to "0.72.0"
packages/core2-64-poky-linux/libdnf/libdnf-locale-uk: PKGSIZE changed from 34311 to 37067 (+8%)
packages/core2-64-poky-linux/libdnf/libdnf-locale-uk: PKGV changed from 0.71.0 [default] to 0.72.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-uk: PV changed from "0.71.0" to "0.72.0"
packages/core2-64-poky-linux/libdnf/libdnf-locale-zh-cn: PKGSIZE changed from 22673 to 21940 (-3%)
packages/core2-64-poky-linux/libdnf/libdnf-locale-zh-cn: PKGV changed from 0.71.0 [default] to 0.72.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-zh-cn: PV changed from "0.71.0" to "0.72.0"
packages/core2-64-poky-linux/libdnf/libdnf-locale-zh-tw: PKGSIZE changed from 18914 to 15441 (-18%)
packages/core2-64-poky-linux/libdnf/libdnf-locale-zh-tw: PKGV changed from 0.71.0 [default] to 0.72.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-zh-tw: PV changed from "0.71.0" to "0.72.0"
packages/core2-64-poky-linux/libdnf/libdnf-src: PKGSIZE changed from 7393025 to 7405062 (+0%)
packages/core2-64-poky-linux/libdnf/libdnf-src: PKGV changed from 0.71.0 [default] to 0.72.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-src: PV changed from "0.71.0" to "0.72.0"
packages/core2-64-poky-linux/libdnf/libdnf-staticdev: PKGV changed from 0.71.0 [default] to 0.72.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-staticdev: PV changed from "0.71.0" to "0.72.0"
packages/core2-64-poky-linux/libdnf/libdnf: PKGSIZE changed from 5646856 to 5656039 (+0%)
packages/core2-64-poky-linux/libdnf/libdnf: FILELIST: added "/usr/lib/python3.11/site-packages/libdnf-0.72.0.dist-info/METADATA"
packages/core2-64-poky-linux/libdnf/libdnf: PKGV changed from 0.71.0 [default] to 0.72.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf: PV changed from "0.71.0" to "0.72.0"
Changes to packages/core2-64-poky-linux/libdnf (sysroot):
  /usr/lib/python3.11/site-packages/libdnf-0.72.0.dist-info was added
  /usr/lib/python3.11/site-packages/libdnf-0.72.0.dist-info/METADATA was added

--===============0229672970004776514==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/libdnf: PACKAGES: added "libdnf-locale-ka"
packages/core2-64-poky-linux/libdnf/libdnf-locale-cs: PKGSIZE changed from 3093 to 17761 (+474%)
packages/core2-64-poky-linux/libdnf/libdnf-locale-de: PKGSIZE changed from 16245 to 14333 (-12%)
packages/core2-64-poky-linux/libdnf/libdnf-locale-fa: PKGSIZE changed from 469 to 618 (+32%)
packages/core2-64-poky-linux/libdnf/libdnf-locale-hu: PKGSIZE changed from 7506 to 14162 (+89%)
packages/core2-64-poky-linux/libdnf/libdnf-locale-id: PKGSIZE changed from 1541 to 1708 (+11%)
packages/core2-64-poky-linux/libdnf/libdnf-locale-zh-tw: PKGSIZE changed from 18914 to 15441 (-18%)
packages/core2-64-poky-linux/libdnf/libdnf: FILELIST: added "/usr/lib/python3.11/site-packages/libdnf-0.72.0.dist-info/METADATA"
Changes to packages/core2-64-poky-linux/libdnf (sysroot):
  /usr/lib/python3.11/site-packages/libdnf-0.72.0.dist-info was added
  /usr/lib/python3.11/site-packages/libdnf-0.72.0.dist-info/METADATA was added

--===============0229672970004776514==--

