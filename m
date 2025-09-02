Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1578ACA1009
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 21:56:31 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.89802.1756850190593172053
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Sep 2025 14:56:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=aExv81Pk;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=SvyoftPK;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101990c6e75ff-3c62d5e3-db4b-41d0-baec-e9dab340e081-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1756850189;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=nWi1Ra0fMJckypfqYb0mUAq3YxLt+CaR3YftgJCMIeY=;
	b=aExv81PkYdDbN7bPhn/amtrND9jUaLHfxfE1VQgbJJLnO+T3gOgECVQVxqpaYy1U
	Ka3Mmq3VyEuMAARsWIFQ1EnRsGyi6CZceOuLq9/N8BRoPWMbk3BJZXdWq9WDvDmq1xW
	QXWZrj7aEN8QovZf1vLsbIFBTC+MpEzUoD36hZCg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1756850189;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=nWi1Ra0fMJckypfqYb0mUAq3YxLt+CaR3YftgJCMIeY=;
	b=SvyoftPKrzD/iULT+sWUAZIGcQ1ksF1jHgwOgAb8IeOKeq1MitZsx9RUaNBE3ztZ
	TdLBHSgpkRbpvWU3fg8SWk82oj9ghaBqInRTBiFxw3eKu4f+wC12dviRQVSJkiU4s89
	8MPSi6N9NPuxfedmr9JnMei5fEjc3bgeiKJvGBPA=
Content-Type: multipart/mixed; boundary="===============8440468530643315556=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pdm: upgrading to 2.25.9 SUCCEEDED
Message-ID: <010101990c6e75ff-3c62d5e3-db4b-41d0-baec-e9dab340e081-000000@us-west-2.amazonses.com>
Date: Tue, 2 Sep 2025 21:56:29 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.09.02-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 21:56:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222781

--===============8440468530643315556==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pdm* to *2.25.9* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pdm-upgrade-2.25.4-2.25.9.patch
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
From 2667cd0da32f0b4fe88c550a383bf7bb9fee9778 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 2 Sep 2025 18:27:52 +0000
Subject: [PATCH] python3-pdm: upgrade 2.25.4 -> 2.25.9

---
 .../python/{python3-pdm_2.25.4.bb => python3-pdm_2.25.9.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pdm_2.25.4.bb => python3-pdm_2.25.9.bb} (80%)

diff --git a/meta/recipes-devtools/python/python3-pdm_2.25.4.bb b/meta/recipes-devtools/python/python3-pdm_2.25.9.bb
similarity index 80%
rename from meta/recipes-devtools/python/python3-pdm_2.25.4.bb
rename to meta/recipes-devtools/python/python3-pdm_2.25.9.bb
index da77ed8f6c..6938edb82f 100644
--- a/meta/recipes-devtools/python/python3-pdm_2.25.4.bb
+++ b/meta/recipes-devtools/python/python3-pdm_2.25.9.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2eb31a2cc1a758c34b499f287dd04ef2"
 
-SRC_URI[sha256sum] = "bd655d789429928d6e27ff6693c19c82bc81aa75ba51d7b1c6102d039c8f211c"
+SRC_URI[sha256sum] = "fb5fcd561986db1d83255d01e97e2e16f80debf743934d891a62ff2933ccc80c"
 
 inherit pypi python_pdm
 
-- 
2.47.1


--===============8440468530643315556==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pdm-upgrade-2.25.4-2.25.9.patch"

RnJvbSAyNjY3Y2QwZGEzMmYwYjRmZTg4YzU1MGEzODNiZjdiYjlmZWU5Nzc4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMiBTZXAgMjAyNSAxODoyNzo1MiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcGRtOiB1cGdyYWRlIDIuMjUuNCAtPiAyLjI1LjkKCi0tLQogLi4uL3B5dGhvbi97cHl0
aG9uMy1wZG1fMi4yNS40LmJiID0+IHB5dGhvbjMtcGRtXzIuMjUuOS5iYn0gICAgIHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1wZG1fMi4yNS40LmJiID0+IHB5dGhv
bjMtcGRtXzIuMjUuOS5iYn0gKDgwJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtcGRtXzIuMjUuNC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1wZG1fMi4yNS45LmJiCnNpbWlsYXJpdHkgaW5kZXggODAlCnJlbmFtZSBm
cm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wZG1fMi4yNS40LmJiCnJl
bmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGRtXzIuMjUuOS5i
YgppbmRleCBkYTc3ZWQ4ZjZjLi42OTM4ZWRiODJmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGRtXzIuMjUuNC5iYgorKysgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGRtXzIuMjUuOS5iYgpAQCAtNCw3ICs0LDcgQEAgTElD
RU5TRSA9ICJNSVQiCiBTRUNUSU9OID0gImRldmVsL3B5dGhvbiIKIExJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTJlYjMxYTJjYzFhNzU4YzM0YjQ5OWYyODdkZDA0ZWYyIgog
Ci1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiYmQ2NTVkNzg5NDI5OTI4ZDZlMjdmZjY2OTNjMTljODJi
YzgxYWE3NWJhNTFkN2IxYzYxMDJkMDM5YzhmMjExYyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJm
YjVmY2Q1NjE5ODZkYjFkODMyNTVkMDFlOTdlMmUxNmY4MGRlYmY3NDM5MzRkODkxYTYyZmYyOTMz
Y2NjODBjIgogCiBpbmhlcml0IHB5cGkgcHl0aG9uX3BkbQogCi0tIAoyLjQ3LjEKCg==

--===============8440468530643315556==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pdm: PV changed from "2.25.4" to "2.25.9"
packages/x86-64-v3-poky-linux/python3-pdm: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pdm/pdm-2.25.4.tar.gz;downloadfilename=pdm-2.25.4.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pdm/pdm-2.25.9.tar.gz;downloadfilename=pdm-2.25.9.tar.gz"
packages/x86-64-v3-poky-linux/python3-pdm: PKGV changed from 2.25.4 [default] to 2.25.9 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-dbg: PV changed from "2.25.4" to "2.25.9"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-dbg: PKGV changed from 2.25.4 [default] to 2.25.9 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-dev: PV changed from "2.25.4" to "2.25.9"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-dev: PKGV changed from 2.25.4 [default] to 2.25.9 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-doc: PV changed from "2.25.4" to "2.25.9"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-doc: PKGV changed from 2.25.4 [default] to 2.25.9 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-locale: PV changed from "2.25.4" to "2.25.9"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-locale: PKGV changed from 2.25.4 [default] to 2.25.9 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-src: PV changed from "2.25.4" to "2.25.9"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-src: PKGV changed from 2.25.4 [default] to 2.25.9 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-staticdev: PV changed from "2.25.4" to "2.25.9"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-staticdev: PKGV changed from 2.25.4 [default] to 2.25.9 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm: PV changed from "2.25.4" to "2.25.9"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm: PKGV changed from 2.25.4 [default] to 2.25.9 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm: PKGSIZE changed from 2239953 to 2242786 (+0%)
Changes to packages/x86-64-v3-poky-linux/python3-pdm (sysroot):
  /usr/lib/python3.13/site-packages/pdm-2.25.4.dist-info moved to /usr/lib/python3.13/site-packages/pdm-2.25.9.dist-info

--===============8440468530643315556==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/x86-64-v3-poky-linux/python3-pdm (sysroot):
  /usr/lib/python3.13/site-packages/pdm-2.25.4.dist-info moved to /usr/lib/python3.13/site-packages/pdm-2.25.9.dist-info

--===============8440468530643315556==--

