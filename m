Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F731CD4842
	for <webhook@archiver.kernel.org>; Fri,  1 May 2026 14:25:57 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15610.1777645533598114196
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 May 2026 07:25:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=cgqvvxui;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=iuV0Tjcu;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019de3ee5ced-9687b3a0-4fe7-4c08-a620-76e218d89246-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1777645542;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=UMMR6yNHv6pW9+QT229pHWbqNAD/Ks+QbBmP9W09qks=;
	b=cgqvvxuiuD+MB98ZilBZS2xFvPrx3AVkOrE+Y6mb3PzAWQfH/YGGaI17UzWQdrZY
	lZ6gvuaKhj9iyRAoRDDX+M+E03/tUwFfiWsEI3z4vaIya/jmsnigxZeIpsfr5M5hHrG
	hsmcQXlkf2Fr6dq7vFFrUM8Gc6v5M7uErY4P5tlo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1777645542;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=UMMR6yNHv6pW9+QT229pHWbqNAD/Ks+QbBmP9W09qks=;
	b=iuV0Tjcug8uGF24fMs0jb9Ah585zQ38ynGc31Pq4DdH/0L3AECRRINwcbYPD8Rp/
	jG6/JlztkCIevtzXN5iZw5mkj5f9cCd8ytQXd2For2POEQc/tMHiAbBP0oc6eRwbKMB
	l4lJGuzzQ4MDLYj6lx6MvN3X6Zr+/9PUXM1xz5xA=
Content-Type: multipart/mixed; boundary="===============4369598612815065861=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pyopenssl: upgrading to 26.1.0 SUCCEEDED
Message-ID: <0101019de3ee5ced-9687b3a0-4fe7-4c08-a620-76e218d89246-000000@us-west-2.amazonses.com>
Date: Fri, 1 May 2026 14:25:42 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 May 2026 14:25:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236243

--===============4369598612815065861==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pyopenssl* to *26.1.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pyopenssl-upgrade-26.0.0-26.1.0.patch
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
From 3117c729b5ff2cd56bcad8836eeb645f47fd048b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 May 2026 09:11:50 +0000
Subject: [PATCH] python3-pyopenssl: upgrade 26.0.0 -> 26.1.0

---
 ...{python3-pyopenssl_26.0.0.bb => python3-pyopenssl_26.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyopenssl_26.0.0.bb => python3-pyopenssl_26.1.0.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-pyopenssl_26.0.0.bb b/meta/recipes-devtools/python/python3-pyopenssl_26.1.0.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-pyopenssl_26.0.0.bb
rename to meta/recipes-devtools/python/python3-pyopenssl_26.1.0.bb
index ca2ee93d29..6163093ca9 100644
--- a/meta/recipes-devtools/python/python3-pyopenssl_26.0.0.bb
+++ b/meta/recipes-devtools/python/python3-pyopenssl_26.1.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 DEPENDS += "openssl python3-cryptography"
 
-SRC_URI[sha256sum] = "f293934e52936f2e3413b89c6ce36df66a0b34ae1ea3a053b8c5020ff2f513fc"
+SRC_URI[sha256sum] = "737f0a2275c5bc54f3b02137687e1a765931fb3949b9a92a825e4d33b9eec08b"
 
 inherit pypi setuptools3
 
-- 
2.47.1


--===============4369598612815065861==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pyopenssl-26.0.0.dist-info -> /usr/lib/python3.14/site-packages/pyopenssl-26.1.0.dist-info, directory renamed /usr/lib/python3.14/site-packages/pyopenssl-26.0.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/pyopenssl-26.1.0.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-pyopenssl (sysroot):
  /usr/lib/python3.14/site-packages/pyopenssl-26.0.0.dist-info moved to /usr/lib/python3.14/site-packages/pyopenssl-26.1.0.dist-info

--===============4369598612815065861==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pyopenssl-upgrade-26.0.0-26.1.0.patch"

RnJvbSAzMTE3YzcyOWI1ZmYyY2Q1NmJjYWQ4ODM2ZWViNjQ1ZjQ3ZmQwNDhiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBNYXkgMjAyNiAwOToxMTo1MCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcHlvcGVuc3NsOiB1cGdyYWRlIDI2LjAuMCAtPiAyNi4xLjAKCi0tLQogLi4ue3B5dGhv
bjMtcHlvcGVuc3NsXzI2LjAuMC5iYiA9PiBweXRob24zLXB5b3BlbnNzbF8yNi4xLjAuYmJ9IHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1weW9wZW5zc2xfMjYuMC4w
LmJiID0+IHB5dGhvbjMtcHlvcGVuc3NsXzI2LjEuMC5iYn0gKDg1JSkKCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHlvcGVuc3NsXzI2LjAuMC5iYiBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weW9wZW5zc2xfMjYuMS4wLmJi
CnNpbWlsYXJpdHkgaW5kZXggODUlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1weW9wZW5zc2xfMjYuMC4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHlvcGVuc3NsXzI2LjEuMC5iYgppbmRleCBjYTJlZTkz
ZDI5Li42MTYzMDkzY2E5IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtcHlvcGVuc3NsXzI2LjAuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtcHlvcGVuc3NsXzI2LjEuMC5iYgpAQCAtNSw3ICs1LDcgQEAgTElDX0ZJ
TEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9M2I4M2VmOTYzODdmMTQ2NTVmYzg1NGRk
YzNjNmJkNTciCiAKIERFUEVORFMgKz0gIm9wZW5zc2wgcHl0aG9uMy1jcnlwdG9ncmFwaHkiCiAK
LVNSQ19VUklbc2hhMjU2c3VtXSA9ICJmMjkzOTM0ZTUyOTM2ZjJlMzQxM2I4OWM2Y2UzNmRmNjZh
MGIzNGFlMWVhM2EwNTNiOGM1MDIwZmYyZjUxM2ZjIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjcz
N2YwYTIyNzVjNWJjNTRmM2IwMjEzNzY4N2UxYTc2NTkzMWZiMzk0OWI5YTkyYTgyNWU0ZDMzYjll
ZWMwOGIiCiAKIGluaGVyaXQgcHlwaSBzZXR1cHRvb2xzMwogCi0tIAoyLjQ3LjEKCg==

--===============4369598612815065861==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pyopenssl: PKGV changed from 26.0.0 [default] to 26.1.0 [default]
packages/x86-64-v3-poky-linux/python3-pyopenssl: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pyopenssl/pyopenssl-26.0.0.tar.gz;downloadfilename=pyopenssl-26.0.0.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pyopenssl/pyopenssl-26.1.0.tar.gz;downloadfilename=pyopenssl-26.1.0.tar.gz"
packages/x86-64-v3-poky-linux/python3-pyopenssl: PV changed from "26.0.0" to "26.1.0"
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl-dbg: PKGV changed from 26.0.0 [default] to 26.1.0 [default]
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl-dbg: PV changed from "26.0.0" to "26.1.0"
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl-dev: PKGV changed from 26.0.0 [default] to 26.1.0 [default]
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl-dev: PV changed from "26.0.0" to "26.1.0"
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl-doc: PKGV changed from 26.0.0 [default] to 26.1.0 [default]
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl-doc: PV changed from "26.0.0" to "26.1.0"
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl-locale: PKGV changed from 26.0.0 [default] to 26.1.0 [default]
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl-locale: PV changed from "26.0.0" to "26.1.0"
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl-src: PKGV changed from 26.0.0 [default] to 26.1.0 [default]
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl-src: PV changed from "26.0.0" to "26.1.0"
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl-staticdev: PKGV changed from 26.0.0 [default] to 26.1.0 [default]
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl-staticdev: PV changed from "26.0.0" to "26.1.0"
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl-tests: PKGV changed from 26.0.0 [default] to 26.1.0 [default]
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl-tests: PV changed from "26.0.0" to "26.1.0"
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pyopenssl-26.0.0.dist-info -> /usr/lib/python3.14/site-packages/pyopenssl-26.1.0.dist-info, directory renamed /usr/lib/python3.14/site-packages/pyopenssl-26.0.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/pyopenssl-26.1.0.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl: PKGV changed from 26.0.0 [default] to 26.1.0 [default]
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl: PKGSIZE changed from 520448 to 520999 (+0%)
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl: PV changed from "26.0.0" to "26.1.0"
Changes to packages/x86-64-v3-poky-linux/python3-pyopenssl (sysroot):
  /usr/lib/python3.14/site-packages/pyopenssl-26.0.0.dist-info moved to /usr/lib/python3.14/site-packages/pyopenssl-26.1.0.dist-info

--===============4369598612815065861==--

