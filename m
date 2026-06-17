Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04F90CD98EE
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 05:31:55 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9059.1781674309065106640
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2026 22:31:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=k9fXrjkf;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ctrSYSET;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019ed410713f-86d98348-f4b9-4e6a-b67b-b21ed7da5d3b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781674308;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=J3UB/KUB1TKWCg9jqnHrnseAWJJcXO+SgsQznmDb30U=;
	b=k9fXrjkfMIblwAjzsvM5KUFcLJpMcMxpTqXgIeWxkxw0XF50jDY8XvCXDZYUI9Zq
	qhrdyzvz80XRvGY6h/lObOBSQu4OnIqQakQT/5nhXx5es266PKKULqg7LqhAHyu443f
	F2oZ6CTkqb1MNZTeh4pTtxOPX1bk0Sb3ebEF48B8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781674308;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=J3UB/KUB1TKWCg9jqnHrnseAWJJcXO+SgsQznmDb30U=;
	b=ctrSYSETJgl50dDsCGGzefu/05njkYQJe9nXmBWK96xG9VgvmgJLq1FCxpizO/WD
	fPVcaPSgPFTJaXDEBN64gLt59sxholj9uhOC6aWQKI3qlbMpHr/yzyUcWXc07hjCR0I
	JEEjiBebc07jaTfkMl+/uWFZZ+x9yBDu+A5+cOWQ=
Content-Type: multipart/mixed; boundary="===============6863818588967003866=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-dtschema: upgrading to 2026.6 SUCCEEDED
Message-ID: <0101019ed410713f-86d98348-f4b9-4e6a-b67b-b21ed7da5d3b-000000@us-west-2.amazonses.com>
Date: Wed, 17 Jun 2026 05:31:47 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.17-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 05:31:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238975

--===============6863818588967003866==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-dtschema* to *2026.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-dtschema-upgrade-2026.4-2026.6.patch
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
From 2cca9ccd004375e7febcb2d548c8744d04ecf483 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 17 Jun 2026 05:19:37 +0000
Subject: [PATCH] python3-dtschema: upgrade 2026.4 -> 2026.6

---
 .../{python3-dtschema_2026.4.bb => python3-dtschema_2026.6.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-dtschema_2026.4.bb => python3-dtschema_2026.6.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-dtschema_2026.4.bb b/meta/recipes-devtools/python/python3-dtschema_2026.6.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-dtschema_2026.4.bb
rename to meta/recipes-devtools/python/python3-dtschema_2026.6.bb
index cbd459c151..7e463ed1ad 100644
--- a/meta/recipes-devtools/python/python3-dtschema_2026.4.bb
+++ b/meta/recipes-devtools/python/python3-dtschema_2026.6.bb
@@ -7,7 +7,7 @@ inherit pypi python_setuptools_build_meta
 
 PYPI_PACKAGE = "dtschema"
 
-SRC_URI[sha256sum] = "10cd0ffe239f8d88913390ac5d8213fae382e87a20643b21c65714ded82a4460"
+SRC_URI[sha256sum] = "05188e3727393334b99abb74ae220ccb8158eec67d6bec793326253f9e76d57a"
 
 DEPENDS += "python3-setuptools-scm-native"
 RDEPENDS:${PN} += "\
-- 
2.47.1


--===============6863818588967003866==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-dtschema: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/dtschema/dtschema-2026.4.tar.gz;downloadfilename=dtschema-2026.4.tar.gz" to "https://files.pythonhosted.org/packages/source/d/dtschema/dtschema-2026.6.tar.gz;downloadfilename=dtschema-2026.6.tar.gz"
packages/x86-64-v3-poky-linux/python3-dtschema: PKGV changed from 2026.4 [default] to 2026.6 [default]
packages/x86-64-v3-poky-linux/python3-dtschema: PV changed from "2026.4" to "2026.6"
packages/x86-64-v3-poky-linux/python3-dtschema/python3-dtschema-dbg: PKGV changed from 2026.4 [default] to 2026.6 [default]
packages/x86-64-v3-poky-linux/python3-dtschema/python3-dtschema-dbg: PV changed from "2026.4" to "2026.6"
packages/x86-64-v3-poky-linux/python3-dtschema/python3-dtschema-dev: PKGV changed from 2026.4 [default] to 2026.6 [default]
packages/x86-64-v3-poky-linux/python3-dtschema/python3-dtschema-dev: PV changed from "2026.4" to "2026.6"
packages/x86-64-v3-poky-linux/python3-dtschema/python3-dtschema-doc: PKGV changed from 2026.4 [default] to 2026.6 [default]
packages/x86-64-v3-poky-linux/python3-dtschema/python3-dtschema-doc: PV changed from "2026.4" to "2026.6"
packages/x86-64-v3-poky-linux/python3-dtschema/python3-dtschema-locale: PKGV changed from 2026.4 [default] to 2026.6 [default]
packages/x86-64-v3-poky-linux/python3-dtschema/python3-dtschema-locale: PV changed from "2026.4" to "2026.6"
packages/x86-64-v3-poky-linux/python3-dtschema/python3-dtschema-src: PKGV changed from 2026.4 [default] to 2026.6 [default]
packages/x86-64-v3-poky-linux/python3-dtschema/python3-dtschema-src: PV changed from "2026.4" to "2026.6"
packages/x86-64-v3-poky-linux/python3-dtschema/python3-dtschema-staticdev: PKGV changed from 2026.4 [default] to 2026.6 [default]
packages/x86-64-v3-poky-linux/python3-dtschema/python3-dtschema-staticdev: PV changed from "2026.4" to "2026.6"
packages/x86-64-v3-poky-linux/python3-dtschema/python3-dtschema: PKGSIZE changed from 410205 to 412637 (+1%)
packages/x86-64-v3-poky-linux/python3-dtschema/python3-dtschema: FILELIST: directory renamed /usr/lib/python3.14/site-packages/dtschema-2026.4.dist-info/licenses -> /usr/lib/python3.14/site-packages/dtschema-2026.6.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/dtschema-2026.4.dist-info -> /usr/lib/python3.14/site-packages/dtschema-2026.6.dist-info
packages/x86-64-v3-poky-linux/python3-dtschema/python3-dtschema: PKGV changed from 2026.4 [default] to 2026.6 [default]
packages/x86-64-v3-poky-linux/python3-dtschema/python3-dtschema: PV changed from "2026.4" to "2026.6"
Changes to packages/x86-64-v3-poky-linux/python3-dtschema (sysroot):
  /usr/lib/python3.14/site-packages/dtschema-2026.4.dist-info moved to /usr/lib/python3.14/site-packages/dtschema-2026.6.dist-info

--===============6863818588967003866==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-dtschema-upgrade-2026.4-2026.6.patch"

RnJvbSAyY2NhOWNjZDAwNDM3NWU3ZmViY2IyZDU0OGM4NzQ0ZDA0ZWNmNDgzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTcgSnVuIDIwMjYgMDU6MTk6MzcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWR0c2NoZW1hOiB1cGdyYWRlIDIwMjYuNCAtPiAyMDI2LjYKCi0tLQogLi4uL3tweXRo
b24zLWR0c2NoZW1hXzIwMjYuNC5iYiA9PiBweXRob24zLWR0c2NoZW1hXzIwMjYuNi5iYn0gIHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1kdHNjaGVtYV8yMDI2LjQu
YmIgPT4gcHl0aG9uMy1kdHNjaGVtYV8yMDI2LjYuYmJ9ICg4NSUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWR0c2NoZW1hXzIwMjYuNC5iYiBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1kdHNjaGVtYV8yMDI2LjYuYmIKc2lt
aWxhcml0eSBpbmRleCA4NSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLWR0c2NoZW1hXzIwMjYuNC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLWR0c2NoZW1hXzIwMjYuNi5iYgppbmRleCBjYmQ0NTljMTUxLi43
ZTQ2M2VkMWFkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtZHRzY2hlbWFfMjAyNi40LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1kdHNjaGVtYV8yMDI2LjYuYmIKQEAgLTcsNyArNyw3IEBAIGluaGVyaXQgcHlwaSBw
eXRob25fc2V0dXB0b29sc19idWlsZF9tZXRhCiAKIFBZUElfUEFDS0FHRSA9ICJkdHNjaGVtYSIK
IAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjEwY2QwZmZlMjM5ZjhkODg5MTMzOTBhYzVkODIxM2Zh
ZTM4MmU4N2EyMDY0M2IyMWM2NTcxNGRlZDgyYTQ0NjAiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAi
MDUxODhlMzcyNzM5MzMzNGI5OWFiYjc0YWUyMjBjY2I4MTU4ZWVjNjdkNmJlYzc5MzMyNjI1M2Y5
ZTc2ZDU3YSIKIAogREVQRU5EUyArPSAicHl0aG9uMy1zZXR1cHRvb2xzLXNjbS1uYXRpdmUiCiBS
REVQRU5EUzoke1BOfSArPSAiXAotLSAKMi40Ny4xCgo=

--===============6863818588967003866==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-dtschema/python3-dtschema: FILELIST: directory renamed /usr/lib/python3.14/site-packages/dtschema-2026.4.dist-info -> /usr/lib/python3.14/site-packages/dtschema-2026.6.dist-info, directory renamed /usr/lib/python3.14/site-packages/dtschema-2026.4.dist-info/licenses -> /usr/lib/python3.14/site-packages/dtschema-2026.6.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-dtschema (sysroot):
  /usr/lib/python3.14/site-packages/dtschema-2026.4.dist-info moved to /usr/lib/python3.14/site-packages/dtschema-2026.6.dist-info

--===============6863818588967003866==--

