Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A05BFC369A0
	for <webhook@archiver.kernel.org>; Sat, 15 Mar 2025 14:18:31 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.10342.1742048302997228661
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Mar 2025 07:18:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=d3+NekUk;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Pe+/aKar;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101959a2b952d-4f335169-d22b-48f7-aaa6-3a96384668ec-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1742048302;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=P/x7K5i8HacfYnUAf8yjchZIBX9SLw7DO2SkXAzq8tM=;
	b=d3+NekUkjr9pJosX/H90KPfyxA8m0o4J8MFm4Qh/pXl+wRH5M8RVTkQc/608xlbp
	8drM/WrkoFnt0KaSjqy4WZ8LVNHS9eN2v69s1nF7qfaxgUv0yH2djT/MOf/sNr0hecG
	/yP7DITXbc/4THyknfCj2GiGb7pT3okWF9L63+XQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1742048302;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=P/x7K5i8HacfYnUAf8yjchZIBX9SLw7DO2SkXAzq8tM=;
	b=Pe+/aKara8KvtGx8Yl82HrSBzqGuMbeT9epqMQ+z/q50R5BnWsHzMyAY5+J/H5IH
	JrolX6yS5bhmwCwWZJiZ+kZY30X9np2x6MN2CiJf6Dn2u1QCeTdM4uerKXOzT1ZJB+c
	/OmVfNWaFYeUB0jFcOR1Q8rgWeqnf9oX6ebBpXjg=
Content-Type: multipart/mixed; boundary="===============3778953132726993665=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-yamllint: upgrading to 1.36.0 SUCCEEDED
Message-ID: <010101959a2b952d-4f335169-d22b-48f7-aaa6-3a96384668ec-000000@us-west-2.amazonses.com>
Date: Sat, 15 Mar 2025 14:18:22 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.03.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Mar 2025 14:18:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212924

--===============3778953132726993665==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-yamllint* to *1.36.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-yamllint-upgrade-1.35.1-1.36.0.patch
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
From 5a63673dfa63056dc8b80ba23507c37e9c449ac4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Mar 2025 09:56:48 +0000
Subject: [PATCH] python3-yamllint: upgrade 1.35.1 -> 1.36.0

---
 .../{python3-yamllint_1.35.1.bb => python3-yamllint_1.36.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-yamllint_1.35.1.bb => python3-yamllint_1.36.0.bb} (79%)

diff --git a/meta/recipes-devtools/python/python3-yamllint_1.35.1.bb b/meta/recipes-devtools/python/python3-yamllint_1.36.0.bb
similarity index 79%
rename from meta/recipes-devtools/python/python3-yamllint_1.35.1.bb
rename to meta/recipes-devtools/python/python3-yamllint_1.36.0.bb
index 116209f683..f6c1a1dd90 100644
--- a/meta/recipes-devtools/python/python3-yamllint_1.35.1.bb
+++ b/meta/recipes-devtools/python/python3-yamllint_1.36.0.bb
@@ -7,7 +7,7 @@ inherit pypi python_setuptools_build_meta
 
 PYPI_PACKAGE = "yamllint"
 
-SRC_URI[sha256sum] = "7a003809f88324fd2c877734f2d575ee7881dd9043360657cc8049c809eba6cd"
+SRC_URI[sha256sum] = "3835a65994858679ea06fd998dd968c3f71935cd93742990405999d888e21130"
 
 RDEPENDS:${PN} += "python3-pathspec python3-pyyaml"
 
-- 
2.44.1


--===============3778953132726993665==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-yamllint-upgrade-1.35.1-1.36.0.patch"

RnJvbSA1YTYzNjczZGZhNjMwNTZkYzhiODBiYTIzNTA3YzM3ZTljNDQ5YWM0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgTWFyIDIwMjUgMDk6NTY6NDggKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXlhbWxsaW50OiB1cGdyYWRlIDEuMzUuMSAtPiAxLjM2LjAKCi0tLQogLi4uL3tweXRo
b24zLXlhbWxsaW50XzEuMzUuMS5iYiA9PiBweXRob24zLXlhbWxsaW50XzEuMzYuMC5iYn0gIHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy15YW1sbGludF8xLjM1LjEu
YmIgPT4gcHl0aG9uMy15YW1sbGludF8xLjM2LjAuYmJ9ICg3OSUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXlhbWxsaW50XzEuMzUuMS5iYiBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy15YW1sbGludF8xLjM2LjAuYmIKc2lt
aWxhcml0eSBpbmRleCA3OSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLXlhbWxsaW50XzEuMzUuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLXlhbWxsaW50XzEuMzYuMC5iYgppbmRleCAxMTYyMDlmNjgzLi5m
NmMxYTFkZDkwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMteWFtbGxpbnRfMS4zNS4xLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy15YW1sbGludF8xLjM2LjAuYmIKQEAgLTcsNyArNyw3IEBAIGluaGVyaXQgcHlwaSBw
eXRob25fc2V0dXB0b29sc19idWlsZF9tZXRhCiAKIFBZUElfUEFDS0FHRSA9ICJ5YW1sbGludCIK
IAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjdhMDAzODA5Zjg4MzI0ZmQyYzg3NzczNGYyZDU3NWVl
Nzg4MWRkOTA0MzM2MDY1N2NjODA0OWM4MDllYmE2Y2QiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAi
MzgzNWE2NTk5NDg1ODY3OWVhMDZmZDk5OGRkOTY4YzNmNzE5MzVjZDkzNzQyOTkwNDA1OTk5ZDg4
OGUyMTEzMCIKIAogUkRFUEVORFM6JHtQTn0gKz0gInB5dGhvbjMtcGF0aHNwZWMgcHl0aG9uMy1w
eXlhbWwiCiAKLS0gCjIuNDQuMQoK

--===============3778953132726993665==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-yamllint: SRC_URI changed from "https://files.pythonhosted.org/packages/source/y/yamllint/yamllint-1.35.1.tar.gz;downloadfilename=yamllint-1.35.1.tar.gz" to "https://files.pythonhosted.org/packages/source/y/yamllint/yamllint-1.36.0.tar.gz;downloadfilename=yamllint-1.36.0.tar.gz"
packages/core2-64-poky-linux/python3-yamllint: PKGV changed from 1.35.1 [default] to 1.36.0 [default]
packages/core2-64-poky-linux/python3-yamllint: PV changed from "1.35.1" to "1.36.0"
packages/core2-64-poky-linux/python3-yamllint/python3-yamllint-dbg: PKGV changed from 1.35.1 [default] to 1.36.0 [default]
packages/core2-64-poky-linux/python3-yamllint/python3-yamllint-dbg: PV changed from "1.35.1" to "1.36.0"
packages/core2-64-poky-linux/python3-yamllint/python3-yamllint-dev: PKGV changed from 1.35.1 [default] to 1.36.0 [default]
packages/core2-64-poky-linux/python3-yamllint/python3-yamllint-dev: PV changed from "1.35.1" to "1.36.0"
packages/core2-64-poky-linux/python3-yamllint/python3-yamllint-doc: PKGV changed from 1.35.1 [default] to 1.36.0 [default]
packages/core2-64-poky-linux/python3-yamllint/python3-yamllint-doc: PV changed from "1.35.1" to "1.36.0"
packages/core2-64-poky-linux/python3-yamllint/python3-yamllint-locale: PKGV changed from 1.35.1 [default] to 1.36.0 [default]
packages/core2-64-poky-linux/python3-yamllint/python3-yamllint-locale: PV changed from "1.35.1" to "1.36.0"
packages/core2-64-poky-linux/python3-yamllint/python3-yamllint-src: PKGV changed from 1.35.1 [default] to 1.36.0 [default]
packages/core2-64-poky-linux/python3-yamllint/python3-yamllint-src: PV changed from "1.35.1" to "1.36.0"
packages/core2-64-poky-linux/python3-yamllint/python3-yamllint-staticdev: PKGV changed from 1.35.1 [default] to 1.36.0 [default]
packages/core2-64-poky-linux/python3-yamllint/python3-yamllint-staticdev: PV changed from "1.35.1" to "1.36.0"
packages/core2-64-poky-linux/python3-yamllint/python3-yamllint: PKGSIZE changed from 342565 to 344727 (+1%)
packages/core2-64-poky-linux/python3-yamllint/python3-yamllint: PKGV changed from 1.35.1 [default] to 1.36.0 [default]
packages/core2-64-poky-linux/python3-yamllint/python3-yamllint: PV changed from "1.35.1" to "1.36.0"
Changes to packages/core2-64-poky-linux/python3-yamllint (sysroot):
  /usr/lib/python3.13/site-packages/yamllint-1.35.1.dist-info moved to /usr/lib/python3.13/site-packages/yamllint-1.36.0.dist-info

--===============3778953132726993665==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-yamllint (sysroot):
  /usr/lib/python3.13/site-packages/yamllint-1.35.1.dist-info moved to /usr/lib/python3.13/site-packages/yamllint-1.36.0.dist-info

--===============3778953132726993665==--

