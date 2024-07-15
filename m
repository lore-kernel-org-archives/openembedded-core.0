Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2A05C54757
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 19:19:20 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.1367.1721071146757868767
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jul 2024 12:19:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=X2ykqLBd;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=iw0/mcLH;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010190b7d594a1-24e30467-b67a-4425-9254-2b44ab2b93e6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1721071146;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=L4GQSywBgVf3CTns2werHRR6qzS2pCm9hbnjxPsN5dU=;
	b=X2ykqLBdmhHyRHFpphgSE4PAJGWuPBPr1gDdNDAXCYYaGR3GPdUKP3VGMRJX9tax
	1zEVViLwODG3Y92+d8L9/u+OclJf/n8Pkj7jmujuXhcPdriCnBIkK9EgGSsgLbOXeQK
	4HXQAsINwnC/4fl0X7MVxuwdpCEFf1qBnLac1qRY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1721071146;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=L4GQSywBgVf3CTns2werHRR6qzS2pCm9hbnjxPsN5dU=;
	b=iw0/mcLHrjAfOJP9IZuAIFY7LBP7l7m4jXsIFncPkR44ZOe2mMCAnDdsYf3gnX/K
	6FHUN87AMVvFmUk8jVEKTREWqPGwcnLdXhpl7FeKro1l2FKpPTBh3UfBDT6uRLUdL84
	hVsXOgmFj9LEn1HbhHgyZ39EnDf+pmQKAIkkQw1o=
Content-Type: multipart/mixed; boundary="===============6374572382895194684=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-dtschema: upgrading to 2024.5 SUCCEEDED
Message-ID: <01010190b7d594a1-24e30467-b67a-4425-9254-2b44ab2b93e6-000000@us-west-2.amazonses.com>
Date: Mon, 15 Jul 2024 19:19:06 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.07.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 19:19:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201973

--===============6374572382895194684==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-dtschema* to *2024.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-dtschema-upgrade-2024.4-2024.5.patch
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
From b3b80cdca87a411075095a48bdd5b7583945d257 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Jul 2024 10:22:30 +0000
Subject: [PATCH] python3-dtschema: upgrade 2024.4 -> 2024.5

---
 .../{python3-dtschema_2024.4.bb => python3-dtschema_2024.5.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-dtschema_2024.4.bb => python3-dtschema_2024.5.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-dtschema_2024.4.bb b/meta/recipes-devtools/python/python3-dtschema_2024.5.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-dtschema_2024.4.bb
rename to meta/recipes-devtools/python/python3-dtschema_2024.5.bb
index 9583cd57b9..1eb24eca23 100644
--- a/meta/recipes-devtools/python/python3-dtschema_2024.4.bb
+++ b/meta/recipes-devtools/python/python3-dtschema_2024.5.bb
@@ -7,7 +7,7 @@ inherit pypi python_setuptools_build_meta
 
 PYPI_PACKAGE = "dtschema"
 
-SRC_URI[sha256sum] = "18dd1d34b4a5e451291e5444e9ceb4a6febc605871cdaef22673b6f80aa4a131"
+SRC_URI[sha256sum] = "ea259a9ba4d1e1eff44ac8d362950361e46750bdeaf30a437a7ed33159c35fd8"
 
 DEPENDS += "python3-setuptools-scm-native"
 RDEPENDS:${PN} += "\
-- 
2.44.0


--===============6374572382895194684==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-dtschema (sysroot):
  /usr/lib/python3.12/site-packages/dtschema-2024.4.dist-info moved to /usr/lib/python3.12/site-packages/dtschema-2024.5.dist-info

--===============6374572382895194684==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-dtschema-upgrade-2024.4-2024.5.patch"

RnJvbSBiM2I4MGNkY2E4N2E0MTEwNzUwOTVhNDhiZGQ1Yjc1ODM5NDVkMjU3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgSnVsIDIwMjQgMTA6MjI6MzAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWR0c2NoZW1hOiB1cGdyYWRlIDIwMjQuNCAtPiAyMDI0LjUKCi0tLQogLi4uL3tweXRo
b24zLWR0c2NoZW1hXzIwMjQuNC5iYiA9PiBweXRob24zLWR0c2NoZW1hXzIwMjQuNS5iYn0gIHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1kdHNjaGVtYV8yMDI0LjQu
YmIgPT4gcHl0aG9uMy1kdHNjaGVtYV8yMDI0LjUuYmJ9ICg4NSUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWR0c2NoZW1hXzIwMjQuNC5iYiBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1kdHNjaGVtYV8yMDI0LjUuYmIKc2lt
aWxhcml0eSBpbmRleCA4NSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLWR0c2NoZW1hXzIwMjQuNC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLWR0c2NoZW1hXzIwMjQuNS5iYgppbmRleCA5NTgzY2Q1N2I5Li4x
ZWIyNGVjYTIzIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtZHRzY2hlbWFfMjAyNC40LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1kdHNjaGVtYV8yMDI0LjUuYmIKQEAgLTcsNyArNyw3IEBAIGluaGVyaXQgcHlwaSBw
eXRob25fc2V0dXB0b29sc19idWlsZF9tZXRhCiAKIFBZUElfUEFDS0FHRSA9ICJkdHNjaGVtYSIK
IAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjE4ZGQxZDM0YjRhNWU0NTEyOTFlNTQ0NGU5Y2ViNGE2
ZmViYzYwNTg3MWNkYWVmMjI2NzNiNmY4MGFhNGExMzEiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAi
ZWEyNTlhOWJhNGQxZTFlZmY0NGFjOGQzNjI5NTAzNjFlNDY3NTBiZGVhZjMwYTQzN2E3ZWQzMzE1
OWMzNWZkOCIKIAogREVQRU5EUyArPSAicHl0aG9uMy1zZXR1cHRvb2xzLXNjbS1uYXRpdmUiCiBS
REVQRU5EUzoke1BOfSArPSAiXAotLSAKMi40NC4wCgo=

--===============6374572382895194684==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-dtschema: PV changed from "2024.4" to "2024.5"
packages/core2-64-poky-linux/python3-dtschema: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/dtschema/dtschema-2024.4.tar.gz;downloadfilename=dtschema-2024.4.tar.gz" to "https://files.pythonhosted.org/packages/source/d/dtschema/dtschema-2024.5.tar.gz;downloadfilename=dtschema-2024.5.tar.gz"
packages/core2-64-poky-linux/python3-dtschema: PKGV changed from 2024.4 [default] to 2024.5 [default]
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema-dbg: PV changed from "2024.4" to "2024.5"
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema-dbg: PKGV changed from 2024.4 [default] to 2024.5 [default]
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema-dev: PV changed from "2024.4" to "2024.5"
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema-dev: PKGV changed from 2024.4 [default] to 2024.5 [default]
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema-doc: PV changed from "2024.4" to "2024.5"
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema-doc: PKGV changed from 2024.4 [default] to 2024.5 [default]
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema-locale: PV changed from "2024.4" to "2024.5"
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema-locale: PKGV changed from 2024.4 [default] to 2024.5 [default]
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema-src: PV changed from "2024.4" to "2024.5"
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema-src: PKGV changed from 2024.4 [default] to 2024.5 [default]
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema-staticdev: PV changed from "2024.4" to "2024.5"
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema-staticdev: PKGV changed from 2024.4 [default] to 2024.5 [default]
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema: PKGSIZE changed from 359119 to 362571 (+1%)
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema: PV changed from "2024.4" to "2024.5"
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema: PKGV changed from 2024.4 [default] to 2024.5 [default]
Changes to packages/core2-64-poky-linux/python3-dtschema (sysroot):
  /usr/lib/python3.12/site-packages/dtschema-2024.4.dist-info moved to /usr/lib/python3.12/site-packages/dtschema-2024.5.dist-info

--===============6374572382895194684==--

