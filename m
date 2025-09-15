Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C229BCAC5A8
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 11:54:47 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.30933.1757937284721168318
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Sep 2025 04:54:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=mG3FK2uC;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=NY1Kmp06;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101994d3a33e8-f26286cd-ba19-44a0-8216-1e1e42b26da5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1757937284;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=pmHGGVdzg/6DVIY/N90Xo0QEskFK3po1XUpOy9ums4k=;
	b=mG3FK2uCvkYdgXlmCf0cHly01NNZGByFZqzAPUS8PKihj1bLf5y2EnzhZTHLJDwK
	LcYdfttrTmSYl3QKXrPlEQYVIE3JoaQnRp4mM+gnNom4YEie4qSg7JuJVH3kJc/ADbF
	8qsdxzvTzyzZ+2bvU4Povh4hCz5s0x7XuVx1TUgk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1757937284;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=pmHGGVdzg/6DVIY/N90Xo0QEskFK3po1XUpOy9ums4k=;
	b=NY1Kmp06H4DpR8cGu2zLrdBymaQ/kEHK3vyShLrdjF8t0WCdet28YArQQ80y1Ltn
	ADozHQtR8tA9yhzNhuxzexDjBZXU0Q1XxLy8i31cc6KVyzLZbq6RsvcZOA0jrWf5MKa
	j62/7bVk1saA3A98782SEYosK2uijPkWPg1Ahn7Y=
Content-Type: multipart/mixed; boundary="===============5110904457259705085=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Leon Anavi <leon.anavi@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-xmltodict: upgrading to 1.0.0 SUCCEEDED
Message-ID: <010101994d3a33e8-f26286cd-ba19-44a0-8216-1e1e42b26da5-000000@us-west-2.amazonses.com>
Date: Mon, 15 Sep 2025 11:54:44 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.09.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 11:54:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223435

--===============5110904457259705085==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-xmltodict* to *1.0.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-xmltodict-upgrade-0.15.1-1.0.0.patch
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
From bcb938a8251fc2428e826f6147f64009eade34c2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Sep 2025 08:34:23 +0000
Subject: [PATCH] python3-xmltodict: upgrade 0.15.1 -> 1.0.0

---
 .../{python3-xmltodict_0.15.1.bb => python3-xmltodict_1.0.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-xmltodict_0.15.1.bb => python3-xmltodict_1.0.0.bb} (81%)

diff --git a/meta/recipes-devtools/python/python3-xmltodict_0.15.1.bb b/meta/recipes-devtools/python/python3-xmltodict_1.0.0.bb
similarity index 81%
rename from meta/recipes-devtools/python/python3-xmltodict_0.15.1.bb
rename to meta/recipes-devtools/python/python3-xmltodict_1.0.0.bb
index a1d1bb47e4..48266e947c 100644
--- a/meta/recipes-devtools/python/python3-xmltodict_0.15.1.bb
+++ b/meta/recipes-devtools/python/python3-xmltodict_1.0.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/martinblech/xmltodict"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=01441d50dc74476db58a41ac10cb9fa2"
 
-SRC_URI[sha256sum] = "3d8d49127f3ce6979d40a36dbcad96f8bab106d232d24b49efdd4bd21716983c"
+SRC_URI[sha256sum] = "f50eb9020d28c673b40bbe3f43458ee165f0267c67f8ad8df0d70d9a4f3ac824"
 
 PYPI_PACKAGE = "xmltodict"
 
-- 
2.47.1


--===============5110904457259705085==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-xmltodict: PKGV changed from 0.15.1 [default] to 1.0.0 [default]
packages/x86-64-v3-poky-linux/python3-xmltodict: SRC_URI changed from "https://files.pythonhosted.org/packages/source/x/xmltodict/xmltodict-0.15.1.tar.gz;downloadfilename=xmltodict-0.15.1.tar.gz" to "https://files.pythonhosted.org/packages/source/x/xmltodict/xmltodict-1.0.0.tar.gz;downloadfilename=xmltodict-1.0.0.tar.gz"
packages/x86-64-v3-poky-linux/python3-xmltodict: PV changed from "0.15.1" to "1.0.0"
packages/x86-64-v3-poky-linux/python3-xmltodict/python3-xmltodict-dbg: PKGV changed from 0.15.1 [default] to 1.0.0 [default]
packages/x86-64-v3-poky-linux/python3-xmltodict/python3-xmltodict-dbg: PV changed from "0.15.1" to "1.0.0"
packages/x86-64-v3-poky-linux/python3-xmltodict/python3-xmltodict-dev: PKGV changed from 0.15.1 [default] to 1.0.0 [default]
packages/x86-64-v3-poky-linux/python3-xmltodict/python3-xmltodict-dev: PV changed from "0.15.1" to "1.0.0"
packages/x86-64-v3-poky-linux/python3-xmltodict/python3-xmltodict-doc: PKGV changed from 0.15.1 [default] to 1.0.0 [default]
packages/x86-64-v3-poky-linux/python3-xmltodict/python3-xmltodict-doc: PV changed from "0.15.1" to "1.0.0"
packages/x86-64-v3-poky-linux/python3-xmltodict/python3-xmltodict-locale: PKGV changed from 0.15.1 [default] to 1.0.0 [default]
packages/x86-64-v3-poky-linux/python3-xmltodict/python3-xmltodict-locale: PV changed from "0.15.1" to "1.0.0"
packages/x86-64-v3-poky-linux/python3-xmltodict/python3-xmltodict-ptest: PKGV changed from 0.15.1 [default] to 1.0.0 [default]
packages/x86-64-v3-poky-linux/python3-xmltodict/python3-xmltodict-ptest: PV changed from "0.15.1" to "1.0.0"
packages/x86-64-v3-poky-linux/python3-xmltodict/python3-xmltodict-ptest: PKGSIZE changed from 216978 to 246305 (+14%)
packages/x86-64-v3-poky-linux/python3-xmltodict/python3-xmltodict-src: PKGV changed from 0.15.1 [default] to 1.0.0 [default]
packages/x86-64-v3-poky-linux/python3-xmltodict/python3-xmltodict-src: PV changed from "0.15.1" to "1.0.0"
packages/x86-64-v3-poky-linux/python3-xmltodict/python3-xmltodict-staticdev: PKGV changed from 0.15.1 [default] to 1.0.0 [default]
packages/x86-64-v3-poky-linux/python3-xmltodict/python3-xmltodict-staticdev: PV changed from "0.15.1" to "1.0.0"
packages/x86-64-v3-poky-linux/python3-xmltodict/python3-xmltodict: PKGV changed from 0.15.1 [default] to 1.0.0 [default]
packages/x86-64-v3-poky-linux/python3-xmltodict/python3-xmltodict: PV changed from "0.15.1" to "1.0.0"
packages/x86-64-v3-poky-linux/python3-xmltodict/python3-xmltodict: PKGSIZE changed from 55088 to 64202 (+17%)
Changes to packages/x86-64-v3-poky-linux/python3-xmltodict (sysroot):
  /usr/lib/python3.13/site-packages/xmltodict-1.0.0.dist-info was added
  /usr/lib/python3.13/site-packages/xmltodict-1.0.0.dist-info/licenses was added
  /usr/lib/python3.13/site-packages/xmltodict-1.0.0.dist-info/licenses/LICENSE was added
  /usr/lib/python3.13/site-packages/xmltodict-1.0.0.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/xmltodict-1.0.0.dist-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/xmltodict-1.0.0.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/xmltodict-0.15.1.dist-info was removed
  /usr/lib/python3.13/site-packages/xmltodict-0.15.1.dist-info/licenses was removed
  /usr/lib/python3.13/site-packages/xmltodict-0.15.1.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.13/site-packages/xmltodict-0.15.1.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/xmltodict-0.15.1.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/xmltodict-0.15.1.dist-info/WHEEL was removed

--===============5110904457259705085==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-xmltodict/python3-xmltodict-ptest: PKGSIZE changed from 216978 to 246305 (+14%)
packages/x86-64-v3-poky-linux/python3-xmltodict/python3-xmltodict: PKGSIZE changed from 55088 to 64202 (+17%)
Changes to packages/x86-64-v3-poky-linux/python3-xmltodict (sysroot):
  /usr/lib/python3.13/site-packages/xmltodict-1.0.0.dist-info was added
  /usr/lib/python3.13/site-packages/xmltodict-1.0.0.dist-info/licenses was added
  /usr/lib/python3.13/site-packages/xmltodict-1.0.0.dist-info/licenses/LICENSE was added
  /usr/lib/python3.13/site-packages/xmltodict-1.0.0.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/xmltodict-1.0.0.dist-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/xmltodict-1.0.0.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/xmltodict-0.15.1.dist-info was removed
  /usr/lib/python3.13/site-packages/xmltodict-0.15.1.dist-info/licenses was removed
  /usr/lib/python3.13/site-packages/xmltodict-0.15.1.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.13/site-packages/xmltodict-0.15.1.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/xmltodict-0.15.1.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/xmltodict-0.15.1.dist-info/WHEEL was removed

--===============5110904457259705085==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-xmltodict-upgrade-0.15.1-1.0.0.patch"

RnJvbSBiY2I5MzhhODI1MWZjMjQyOGU4MjZmNjE0N2Y2NDAwOWVhZGUzNGMyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgU2VwIDIwMjUgMDg6MzQ6MjMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXhtbHRvZGljdDogdXBncmFkZSAwLjE1LjEgLT4gMS4wLjAKCi0tLQogLi4uL3tweXRo
b24zLXhtbHRvZGljdF8wLjE1LjEuYmIgPT4gcHl0aG9uMy14bWx0b2RpY3RfMS4wLjAuYmJ9IHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy14bWx0b2RpY3RfMC4xNS4x
LmJiID0+IHB5dGhvbjMteG1sdG9kaWN0XzEuMC4wLmJifSAoODElKQoKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy14bWx0b2RpY3RfMC4xNS4xLmJiIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXhtbHRvZGljdF8xLjAuMC5iYgpz
aW1pbGFyaXR5IGluZGV4IDgxJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMteG1sdG9kaWN0XzAuMTUuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLXhtbHRvZGljdF8xLjAuMC5iYgppbmRleCBhMWQxYmI0N2U0
Li40ODI2NmU5NDdjIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMteG1sdG9kaWN0XzAuMTUuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMteG1sdG9kaWN0XzEuMC4wLmJiCkBAIC0zLDcgKzMsNyBAQCBIT01FUEFHRSA9
ICJodHRwczovL2dpdGh1Yi5jb20vbWFydGluYmxlY2gveG1sdG9kaWN0IgogTElDRU5TRSA9ICJN
SVQiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT0wMTQ0MWQ1MGRjNzQ0
NzZkYjU4YTQxYWMxMGNiOWZhMiIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjNkOGQ0OTEyN2Yz
Y2U2OTc5ZDQwYTM2ZGJjYWQ5NmY4YmFiMTA2ZDIzMmQyNGI0OWVmZGQ0YmQyMTcxNjk4M2MiCitT
UkNfVVJJW3NoYTI1NnN1bV0gPSAiZjUwZWI5MDIwZDI4YzY3M2I0MGJiZTNmNDM0NThlZTE2NWYw
MjY3YzY3ZjhhZDhkZjBkNzBkOWE0ZjNhYzgyNCIKIAogUFlQSV9QQUNLQUdFID0gInhtbHRvZGlj
dCIKIAotLSAKMi40Ny4xCgo=

--===============5110904457259705085==--

