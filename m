Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66998D47CD1
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 01:25:52 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1436.1768526749201889216
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jan 2026 17:25:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=hPZh9XjU;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=cRZURxAD;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019bc4689acc-b8224c9d-2856-4058-90b4-8b7d856de71e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1768526748;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Hb6Fh5/0VAW0cOWRgqyIDEGVyscpr4P/7e8qbqAs1JE=;
	b=hPZh9XjU+eBt4wUF9vIet3QLsIv14WjE2lc/m071AVdIudLRKMBhlMXZGrcBn+Io
	hvKtmE5tcB2J+x8UuK+AG5jLJPkbZlQolmHSvygsLCdYNIU9v+LN5wsDMYhrXYwNkl/
	IMyJJ/DhmWp35VGxSm8Hbl58EUmOXTAKhBUxIC40=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1768526748;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Hb6Fh5/0VAW0cOWRgqyIDEGVyscpr4P/7e8qbqAs1JE=;
	b=cRZURxADxWeEepWG8Vtbhqyi0V59osDwiA3sVg/+A5EFVw3gsZ88pnRPXP/Fh1sj
	YNAUKP9woyn3ffgLRrTzgyYX/0vKlm3Ss+iEMyJ1yKsS//uOVgrwqzy2xjhC7pXxxri
	IK7cHev4axKxiHJIA/z+ARlym7bDU557i1tXBNUg=
Content-Type: multipart/mixed; boundary="===============6294069562211690175=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-meson-python: upgrading to 0.19.0 SUCCEEDED
Message-ID: <0101019bc4689acc-b8224c9d-2856-4058-90b4-8b7d856de71e-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jan 2026 01:25:48 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.01.16-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 01:25:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229468

--===============6294069562211690175==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-meson-python* to *0.19.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-meson-python-upgrade-0.18.0-0.19.0.patch
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
From 1159f9d267c360470162bba5070ecf37cfaf4808 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Jan 2026 21:33:40 +0000
Subject: [PATCH] python3-meson-python: upgrade 0.18.0 -> 0.19.0

---
 ...n3-meson-python_0.18.0.bb => python3-meson-python_0.19.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-meson-python_0.18.0.bb => python3-meson-python_0.19.0.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-meson-python_0.18.0.bb b/meta/recipes-devtools/python/python3-meson-python_0.19.0.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-meson-python_0.18.0.bb
rename to meta/recipes-devtools/python/python3-meson-python_0.19.0.bb
index 742a2580a7..66e636ef82 100644
--- a/meta/recipes-devtools/python/python3-meson-python_0.18.0.bb
+++ b/meta/recipes-devtools/python/python3-meson-python_0.19.0.bb
@@ -14,7 +14,7 @@ PYPI_PACKAGE = "meson_python"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi python_mesonpy
-SRC_URI[sha256sum] = "c56a99ec9df669a40662fe46960321af6e4b14106c14db228709c1628e23848d"
+SRC_URI[sha256sum] = "9959d198aa69b57fcfd354a34518c6f795b781a73ed0656f4d01660160cc2553"
 
 DEPENDS:remove:class-native = "python3-meson-python-native"
 
-- 
2.47.1


--===============6294069562211690175==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-meson-python/python3-meson-python: FILELIST: directory renamed /usr/lib/python3.13/site-packages/meson_python-0.18.0.dist-info/licenses/LICENSES -> /usr/lib/python3.13/site-packages/meson_python-0.19.0.dist-info/licenses/LICENSES, directory renamed /usr/lib/python3.13/site-packages/meson_python-0.18.0.dist-info -> /usr/lib/python3.13/site-packages/meson_python-0.19.0.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-meson-python (sysroot):
  /usr/lib/python3.13/site-packages/meson_python-0.18.0.dist-info moved to /usr/lib/python3.13/site-packages/meson_python-0.19.0.dist-info
Changes to packages/x86_64-linux/python3-meson-python-native (sysroot):
  /usr/lib/python3.13/site-packages/meson_python-0.18.0.dist-info moved to /usr/lib/python3.13/site-packages/meson_python-0.19.0.dist-info

--===============6294069562211690175==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-meson-python-upgrade-0.18.0-0.19.0.patch"

RnJvbSAxMTU5ZjlkMjY3YzM2MDQ3MDE2MmJiYTUwNzBlY2YzN2NmYWY0ODA4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgSmFuIDIwMjYgMjE6MzM6NDAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLW1lc29uLXB5dGhvbjogdXBncmFkZSAwLjE4LjAgLT4gMC4xOS4wCgotLS0KIC4uLm4z
LW1lc29uLXB5dGhvbl8wLjE4LjAuYmIgPT4gcHl0aG9uMy1tZXNvbi1weXRob25fMC4xOS4wLmJi
fSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtbWVzb24tcHl0aG9u
XzAuMTguMC5iYiA9PiBweXRob24zLW1lc29uLXB5dGhvbl8wLjE5LjAuYmJ9ICg4NiUpCgpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1lc29uLXB5dGhv
bl8wLjE4LjAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbWVzb24t
cHl0aG9uXzAuMTkuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDg2JQpyZW5hbWUgZnJvbSBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbWVzb24tcHl0aG9uXzAuMTguMC5iYgpyZW5h
bWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1lc29uLXB5dGhvbl8w
LjE5LjAuYmIKaW5kZXggNzQyYTI1ODBhNy4uNjZlNjM2ZWY4MiAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1lc29uLXB5dGhvbl8wLjE4LjAuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1lc29uLXB5dGhvbl8wLjE5
LjAuYmIKQEAgLTE0LDcgKzE0LDcgQEAgUFlQSV9QQUNLQUdFID0gIm1lc29uX3B5dGhvbiIKIFVQ
U1RSRUFNX0NIRUNLX1BZUElfUEFDS0FHRSA9ICIke1BZUElfUEFDS0FHRX0iCiAKIGluaGVyaXQg
cHlwaSBweXRob25fbWVzb25weQotU1JDX1VSSVtzaGEyNTZzdW1dID0gImM1NmE5OWVjOWRmNjY5
YTQwNjYyZmU0Njk2MDMyMWFmNmU0YjE0MTA2YzE0ZGIyMjg3MDljMTYyOGUyMzg0OGQiCitTUkNf
VVJJW3NoYTI1NnN1bV0gPSAiOTk1OWQxOThhYTY5YjU3ZmNmZDM1NGEzNDUxOGM2Zjc5NWI3ODFh
NzNlZDA2NTZmNGQwMTY2MDE2MGNjMjU1MyIKIAogREVQRU5EUzpyZW1vdmU6Y2xhc3MtbmF0aXZl
ID0gInB5dGhvbjMtbWVzb24tcHl0aG9uLW5hdGl2ZSIKIAotLSAKMi40Ny4xCgo=

--===============6294069562211690175==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-meson-python: PKGV changed from 0.18.0 [default] to 0.19.0 [default]
packages/x86-64-v3-poky-linux/python3-meson-python: SRC_URI changed from "https://files.pythonhosted.org/packages/source/m/meson_python/meson_python-0.18.0.tar.gz;downloadfilename=meson_python-0.18.0.tar.gz" to "https://files.pythonhosted.org/packages/source/m/meson_python/meson_python-0.19.0.tar.gz;downloadfilename=meson_python-0.19.0.tar.gz"
packages/x86-64-v3-poky-linux/python3-meson-python: PV changed from "0.18.0" to "0.19.0"
packages/x86-64-v3-poky-linux/python3-meson-python/python3-meson-python-dbg: PKGV changed from 0.18.0 [default] to 0.19.0 [default]
packages/x86-64-v3-poky-linux/python3-meson-python/python3-meson-python-dbg: PV changed from "0.18.0" to "0.19.0"
packages/x86-64-v3-poky-linux/python3-meson-python/python3-meson-python-dev: PKGV changed from 0.18.0 [default] to 0.19.0 [default]
packages/x86-64-v3-poky-linux/python3-meson-python/python3-meson-python-dev: PV changed from "0.18.0" to "0.19.0"
packages/x86-64-v3-poky-linux/python3-meson-python/python3-meson-python-doc: PKGV changed from 0.18.0 [default] to 0.19.0 [default]
packages/x86-64-v3-poky-linux/python3-meson-python/python3-meson-python-doc: PV changed from "0.18.0" to "0.19.0"
packages/x86-64-v3-poky-linux/python3-meson-python/python3-meson-python-locale: PKGV changed from 0.18.0 [default] to 0.19.0 [default]
packages/x86-64-v3-poky-linux/python3-meson-python/python3-meson-python-locale: PV changed from "0.18.0" to "0.19.0"
packages/x86-64-v3-poky-linux/python3-meson-python/python3-meson-python-src: PKGV changed from 0.18.0 [default] to 0.19.0 [default]
packages/x86-64-v3-poky-linux/python3-meson-python/python3-meson-python-src: PV changed from "0.18.0" to "0.19.0"
packages/x86-64-v3-poky-linux/python3-meson-python/python3-meson-python-staticdev: PKGV changed from 0.18.0 [default] to 0.19.0 [default]
packages/x86-64-v3-poky-linux/python3-meson-python/python3-meson-python-staticdev: PV changed from "0.18.0" to "0.19.0"
packages/x86-64-v3-poky-linux/python3-meson-python/python3-meson-python: PKGV changed from 0.18.0 [default] to 0.19.0 [default]
packages/x86-64-v3-poky-linux/python3-meson-python/python3-meson-python: PKGSIZE changed from 199355 to 206530 (+4%)
packages/x86-64-v3-poky-linux/python3-meson-python/python3-meson-python: FILELIST: directory renamed /usr/lib/python3.13/site-packages/meson_python-0.18.0.dist-info -> /usr/lib/python3.13/site-packages/meson_python-0.19.0.dist-info, directory renamed /usr/lib/python3.13/site-packages/meson_python-0.18.0.dist-info/licenses/LICENSES -> /usr/lib/python3.13/site-packages/meson_python-0.19.0.dist-info/licenses/LICENSES
packages/x86-64-v3-poky-linux/python3-meson-python/python3-meson-python: PV changed from "0.18.0" to "0.19.0"
Changes to packages/x86-64-v3-poky-linux/python3-meson-python (sysroot):
  /usr/lib/python3.13/site-packages/meson_python-0.18.0.dist-info moved to /usr/lib/python3.13/site-packages/meson_python-0.19.0.dist-info
Changes to packages/x86_64-linux/python3-meson-python-native (sysroot):
  /usr/lib/python3.13/site-packages/meson_python-0.18.0.dist-info moved to /usr/lib/python3.13/site-packages/meson_python-0.19.0.dist-info

--===============6294069562211690175==--

