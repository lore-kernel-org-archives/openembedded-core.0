Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E03BCA0EF4
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 13:07:11 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.11318.1755263214708443277
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Aug 2025 06:07:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=qPzOi8Ez;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=si2atF/M;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010198add75616-a6465281-8abf-422f-bba4-ba040e2e33d4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1755263227;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ztJdGIUxCCrp+H9BP0Ugk9SE5xZqf/6pzYslEz5eErc=;
	b=qPzOi8EzynnH6+C048DDKJn2Slb9hNLFX08AO70R9z8NUn16Yh/xd6NCwkzMMMDq
	CPba24MkxB0SSyDeak9qxPe8nDn6/yxIwFtVhx2MoTDMnAWynASDcDgG9xRGUSjS8sa
	6DzsncOGb5qC0LjQTSYfV8+YpwbfpyH+55P8EnbI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1755263227;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ztJdGIUxCCrp+H9BP0Ugk9SE5xZqf/6pzYslEz5eErc=;
	b=si2atF/Mai6QNhwapttBtoCGYviRdJI3FxQVUponqqMrQL6lFkMkLSQZ3Zcbvqdh
	nE+ZlR2vbMZ5qkoAevOqD+KxguJB511SfP7aHQ7WbGG2MI2aZ3vZEFnTRp8psAygmJh
	GkKLoYAfYIqk4d5u6w7Et9bFPsqM3fCuaU6L5P1s=
Content-Type: multipart/mixed; boundary="===============0454650684517156075=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pdm: upgrading to 2.25.6 SUCCEEDED
Message-ID: <01010198add75616-a6465281-8abf-422f-bba4-ba040e2e33d4-000000@us-west-2.amazonses.com>
Date: Fri, 15 Aug 2025 13:07:07 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.08.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Aug 2025 13:07:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221914

--===============0454650684517156075==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pdm* to *2.25.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pdm-upgrade-2.25.4-2.25.6.patch
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
From b614dafedc50719d5ac5bb1ec2662f4b79d07548 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Aug 2025 09:21:28 +0000
Subject: [PATCH] python3-pdm: upgrade 2.25.4 -> 2.25.6

---
 .../python/{python3-pdm_2.25.4.bb => python3-pdm_2.25.6.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pdm_2.25.4.bb => python3-pdm_2.25.6.bb} (80%)

diff --git a/meta/recipes-devtools/python/python3-pdm_2.25.4.bb b/meta/recipes-devtools/python/python3-pdm_2.25.6.bb
similarity index 80%
rename from meta/recipes-devtools/python/python3-pdm_2.25.4.bb
rename to meta/recipes-devtools/python/python3-pdm_2.25.6.bb
index da77ed8f6c..71123e3bc1 100644
--- a/meta/recipes-devtools/python/python3-pdm_2.25.4.bb
+++ b/meta/recipes-devtools/python/python3-pdm_2.25.6.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2eb31a2cc1a758c34b499f287dd04ef2"
 
-SRC_URI[sha256sum] = "bd655d789429928d6e27ff6693c19c82bc81aa75ba51d7b1c6102d039c8f211c"
+SRC_URI[sha256sum] = "46693c26dde87bdeffecf18eb852ea55434c9b6b2aec42edef237f4ac595763c"
 
 inherit pypi python_pdm
 
-- 
2.47.1


--===============0454650684517156075==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pdm-upgrade-2.25.4-2.25.6.patch"

RnJvbSBiNjE0ZGFmZWRjNTA3MTlkNWFjNWJiMWVjMjY2MmY0Yjc5ZDA3NTQ4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgQXVnIDIwMjUgMDk6MjE6MjggKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXBkbTogdXBncmFkZSAyLjI1LjQgLT4gMi4yNS42CgotLS0KIC4uLi9weXRob24ve3B5
dGhvbjMtcGRtXzIuMjUuNC5iYiA9PiBweXRob24zLXBkbV8yLjI1LjYuYmJ9ICAgICB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcGRtXzIuMjUuNC5iYiA9PiBweXRo
b24zLXBkbV8yLjI1LjYuYmJ9ICg4MCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLXBkbV8yLjI1LjQuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtcGRtXzIuMjUuNi5iYgpzaW1pbGFyaXR5IGluZGV4IDgwJQpyZW5hbWUg
ZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGRtXzIuMjUuNC5iYgpy
ZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBkbV8yLjI1LjYu
YmIKaW5kZXggZGE3N2VkOGY2Yy4uNzExMjNlM2JjMSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBkbV8yLjI1LjQuYmIKKysrIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBkbV8yLjI1LjYuYmIKQEAgLTQsNyArNCw3IEBAIExJ
Q0VOU0UgPSAiTUlUIgogU0VDVElPTiA9ICJkZXZlbC9weXRob24iCiBMSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9MSUNFTlNFO21kNT0yZWIzMWEyY2MxYTc1OGMzNGI0OTlmMjg3ZGQwNGVmMiIK
IAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImJkNjU1ZDc4OTQyOTkyOGQ2ZTI3ZmY2NjkzYzE5Yzgy
YmM4MWFhNzViYTUxZDdiMWM2MTAyZDAzOWM4ZjIxMWMiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAi
NDY2OTNjMjZkZGU4N2JkZWZmZWNmMThlYjg1MmVhNTU0MzRjOWI2YjJhZWM0MmVkZWYyMzdmNGFj
NTk1NzYzYyIKIAogaW5oZXJpdCBweXBpIHB5dGhvbl9wZG0KIAotLSAKMi40Ny4xCgo=

--===============0454650684517156075==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-pdm (sysroot):
  /usr/lib/python3.13/site-packages/pdm-2.25.4.dist-info moved to /usr/lib/python3.13/site-packages/pdm-2.25.6.dist-info

--===============0454650684517156075==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-pdm: PV changed from "2.25.4" to "2.25.6"
packages/core2-64-poky-linux/python3-pdm: PKGV changed from 2.25.4 [default] to 2.25.6 [default]
packages/core2-64-poky-linux/python3-pdm: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pdm/pdm-2.25.4.tar.gz;downloadfilename=pdm-2.25.4.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pdm/pdm-2.25.6.tar.gz;downloadfilename=pdm-2.25.6.tar.gz"
packages/core2-64-poky-linux/python3-pdm/python3-pdm-dbg: PV changed from "2.25.4" to "2.25.6"
packages/core2-64-poky-linux/python3-pdm/python3-pdm-dbg: PKGV changed from 2.25.4 [default] to 2.25.6 [default]
packages/core2-64-poky-linux/python3-pdm/python3-pdm-dev: PV changed from "2.25.4" to "2.25.6"
packages/core2-64-poky-linux/python3-pdm/python3-pdm-dev: PKGV changed from 2.25.4 [default] to 2.25.6 [default]
packages/core2-64-poky-linux/python3-pdm/python3-pdm-doc: PV changed from "2.25.4" to "2.25.6"
packages/core2-64-poky-linux/python3-pdm/python3-pdm-doc: PKGV changed from 2.25.4 [default] to 2.25.6 [default]
packages/core2-64-poky-linux/python3-pdm/python3-pdm-locale: PV changed from "2.25.4" to "2.25.6"
packages/core2-64-poky-linux/python3-pdm/python3-pdm-locale: PKGV changed from 2.25.4 [default] to 2.25.6 [default]
packages/core2-64-poky-linux/python3-pdm/python3-pdm-src: PV changed from "2.25.4" to "2.25.6"
packages/core2-64-poky-linux/python3-pdm/python3-pdm-src: PKGV changed from 2.25.4 [default] to 2.25.6 [default]
packages/core2-64-poky-linux/python3-pdm/python3-pdm-staticdev: PV changed from "2.25.4" to "2.25.6"
packages/core2-64-poky-linux/python3-pdm/python3-pdm-staticdev: PKGV changed from 2.25.4 [default] to 2.25.6 [default]
packages/core2-64-poky-linux/python3-pdm/python3-pdm: PV changed from "2.25.4" to "2.25.6"
packages/core2-64-poky-linux/python3-pdm/python3-pdm: PKGSIZE changed from 2239953 to 2241139 (+0%)
packages/core2-64-poky-linux/python3-pdm/python3-pdm: PKGV changed from 2.25.4 [default] to 2.25.6 [default]
Changes to packages/core2-64-poky-linux/python3-pdm (sysroot):
  /usr/lib/python3.13/site-packages/pdm-2.25.4.dist-info moved to /usr/lib/python3.13/site-packages/pdm-2.25.6.dist-info

--===============0454650684517156075==--

