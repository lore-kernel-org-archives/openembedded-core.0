Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52D75CD98E3
	for <webhook@archiver.kernel.org>; Mon, 15 Jun 2026 05:18:52 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.123075.1781500723783595085
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jun 2026 22:18:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=NH8nEqYl;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=jSO77+/5;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019ec9b7bee9-4260ae30-82ab-4254-85a8-1fd4db18e99f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781500723;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=eJR0ylNMWjnE44sC/IedcPqZ2AcF1Nso5CQPEEP7gRA=;
	b=NH8nEqYl4qTVTA0hWa5xKqz6vPv+8hK+HiO3oiiUjg/JN0Z0TWH3pE2Uc7tNbv92
	S6+1cSwqTmu8C26WftB9tMQlwpk2FhO7G8dggLzzP8mVvQAbAADlKIX++aHShm4Xsyy
	c7LcBg9FJygeAg5OUlSOC3oNYeHTlLDTojV3wtYM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781500723;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=eJR0ylNMWjnE44sC/IedcPqZ2AcF1Nso5CQPEEP7gRA=;
	b=jSO77+/5sTNTbVFw4nmiAF3mHwuAZjDYJysz6BsRxX7qXF7kw1lMOYzg7GBw03Ih
	i0sQqqVaZ4bU7PmbWF19GE4pjEYi8EDi3WtIh42QIql028p57ovYry9WDEBcQOBkRtE
	jvZrZgCpiMkKgKAXhxdsgHmOgKCok6wLsxBjuAeE=
Content-Type: multipart/mixed; boundary="===============7831822315402715610=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] fastfloat: upgrading to 8.2.10 SUCCEEDED
Message-ID: <0101019ec9b7bee9-4260ae30-82ab-4254-85a8-1fd4db18e99f-000000@us-west-2.amazonses.com>
Date: Mon, 15 Jun 2026 05:18:42 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2026 05:18:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238803

--===============7831822315402715610==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *fastfloat* to *8.2.10* has Succeeded.

Next steps:
    - apply the patch: git am 0001-fastfloat-upgrade-8.2.5-8.2.10.patch
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
From c26450f8f811a6b697c2dbcbba30df0f78f901a1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Jun 2026 05:06:29 +0000
Subject: [PATCH] fastfloat: upgrade 8.2.5 -> 8.2.10

---
 .../fastfloat/{fastfloat_8.2.5.bb => fastfloat_8.2.10.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/fastfloat/{fastfloat_8.2.5.bb => fastfloat_8.2.10.bb} (90%)

diff --git a/meta/recipes-devtools/fastfloat/fastfloat_8.2.5.bb b/meta/recipes-devtools/fastfloat/fastfloat_8.2.10.bb
similarity index 90%
rename from meta/recipes-devtools/fastfloat/fastfloat_8.2.5.bb
rename to meta/recipes-devtools/fastfloat/fastfloat_8.2.10.bb
index cbd7151f85..f537bab56c 100644
--- a/meta/recipes-devtools/fastfloat/fastfloat_8.2.5.bb
+++ b/meta/recipes-devtools/fastfloat/fastfloat_8.2.10.bb
@@ -9,6 +9,6 @@ LIC_FILES_CHKSUM = " \
 
 SRC_URI = "git://github.com/fastfloat/fast_float.git;protocol=https;branch=main;tag=v${PV}"
 
-SRCREV = "05087a303dad9c98768b33c829d398223a649bc6"
+SRCREV = "34164f547b7df3f5d794ff67e9f885c36819ebfc"
 
 inherit cmake
-- 
2.47.1


--===============7831822315402715610==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/fastfloat/fastfloat-dbg: PV changed from "8.2.5" to "8.2.10"
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-dbg: PKGV changed from 8.2.5 [default] to 8.2.10 [default]
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-dev: PV changed from "8.2.5" to "8.2.10"
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-dev: PKGV changed from 8.2.5 [default] to 8.2.10 [default]
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-dev: PKGSIZE changed from 173674 to 181252 (+4%)
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-doc: PV changed from "8.2.5" to "8.2.10"
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-doc: PKGV changed from 8.2.5 [default] to 8.2.10 [default]
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-locale: PV changed from "8.2.5" to "8.2.10"
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-locale: PKGV changed from 8.2.5 [default] to 8.2.10 [default]
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-src: PV changed from "8.2.5" to "8.2.10"
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-src: PKGV changed from 8.2.5 [default] to 8.2.10 [default]
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-staticdev: PV changed from "8.2.5" to "8.2.10"
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-staticdev: PKGV changed from 8.2.5 [default] to 8.2.10 [default]
packages/x86-64-v3-poky-linux/fastfloat/fastfloat: PV changed from "8.2.5" to "8.2.10"
packages/x86-64-v3-poky-linux/fastfloat/fastfloat: PKGV changed from 8.2.5 [default] to 8.2.10 [default]
packages/x86-64-v3-poky-linux/fastfloat: SRC_URI changed from "git://github.com/fastfloat/fast_float.git;protocol=https;branch=main;tag=v8.2.5" to "git://github.com/fastfloat/fast_float.git;protocol=https;branch=main;tag=v8.2.10"
packages/x86-64-v3-poky-linux/fastfloat: PV changed from "8.2.5" to "8.2.10"
packages/x86-64-v3-poky-linux/fastfloat: PKGV changed from 8.2.5 [default] to 8.2.10 [default]

--===============7831822315402715610==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-fastfloat-upgrade-8.2.5-8.2.10.patch"

RnJvbSBjMjY0NTBmOGY4MTFhNmI2OTdjMmRiY2JiYTMwZGYwZjc4ZjkwMWExIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgSnVuIDIwMjYgMDU6MDY6MjkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBm
YXN0ZmxvYXQ6IHVwZ3JhZGUgOC4yLjUgLT4gOC4yLjEwCgotLS0KIC4uLi9mYXN0ZmxvYXQve2Zh
c3RmbG9hdF84LjIuNS5iYiA9PiBmYXN0ZmxvYXRfOC4yLjEwLmJifSAgICAgICB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1kZXZ0b29scy9mYXN0ZmxvYXQve2Zhc3RmbG9hdF84LjIuNS5iYiA9PiBmYXN0Zmxv
YXRfOC4yLjEwLmJifSAoOTAlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9m
YXN0ZmxvYXQvZmFzdGZsb2F0XzguMi41LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Zhc3Rm
bG9hdC9mYXN0ZmxvYXRfOC4yLjEwLmJiCnNpbWlsYXJpdHkgaW5kZXggOTAlCnJlbmFtZSBmcm9t
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9mYXN0ZmxvYXQvZmFzdGZsb2F0XzguMi41LmJiCnJlbmFt
ZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZmFzdGZsb2F0L2Zhc3RmbG9hdF84LjIuMTAuYmIK
aW5kZXggY2JkNzE1MWY4NS4uZjUzN2JhYjU2YyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2Zhc3RmbG9hdC9mYXN0ZmxvYXRfOC4yLjUuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2Zhc3RmbG9hdC9mYXN0ZmxvYXRfOC4yLjEwLmJiCkBAIC05LDYgKzksNiBAQCBMSUNf
RklMRVNfQ0hLU1VNID0gIiBcCiAKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9mYXN0Zmxv
YXQvZmFzdF9mbG9hdC5naXQ7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1haW47dGFnPXYke1BWfSIK
IAotU1JDUkVWID0gIjA1MDg3YTMwM2RhZDljOTg3NjhiMzNjODI5ZDM5ODIyM2E2NDliYzYiCitT
UkNSRVYgPSAiMzQxNjRmNTQ3YjdkZjNmNWQ3OTRmZjY3ZTlmODg1YzM2ODE5ZWJmYyIKIAogaW5o
ZXJpdCBjbWFrZQotLSAKMi40Ny4xCgo=

--===============7831822315402715610==--

