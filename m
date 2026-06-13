Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 978A3CD98DE
	for <webhook@archiver.kernel.org>; Sat, 13 Jun 2026 07:50:34 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.87192.1781337025499560530
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Jun 2026 00:50:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=nH7i+0ZB;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=F6Bo/WJG;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019ebff5e8af-2da017c9-93f0-4063-b5c0-1e192c288f60-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781337024;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=9W4fft9dc+BIahkWd5ALS0NFB+SCH6Kl/RJr6Z2DxBg=;
	b=nH7i+0ZBCEdr1zoJ5NuuxVFB66DBxzkf0t2MGa01fOgig0nz7scXy9b8JQOO3jwf
	8YvQUt7BoYnQgDEBGHD4bT3SSbjlNK9y9KsJ9gumY9ipmae1zTkuSBgvgGfUafjdXUk
	TiCSSF4vo9YwjSGNH5DTpSGaLwT4J6AZu7c8zpOM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781337024;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=9W4fft9dc+BIahkWd5ALS0NFB+SCH6Kl/RJr6Z2DxBg=;
	b=F6Bo/WJGUakLytRhJG2xiNn4r/wyY9cgbeGfQigVZZjUCj/g+JhzUfkTkYw/0EnA
	j02VqU1HCZJBjV3vT4h37Xw70mv7polHK/8EEw7+gn0a4x9ccoMI+VucuGBZvF76O92
	MrrdygUKfpUJ16e1J1Bxugr4mtcUHJPR68OsKXlA=
Content-Type: multipart/mixed; boundary="===============8995661182640328741=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pyopenssl: upgrading to 26.3.0 SUCCEEDED
Message-ID: <0101019ebff5e8af-2da017c9-93f0-4063-b5c0-1e192c288f60-000000@us-west-2.amazonses.com>
Date: Sat, 13 Jun 2026 07:50:24 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.13-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Jun 2026 07:50:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238657

--===============8995661182640328741==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pyopenssl* to *26.3.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pyopenssl-upgrade-26.2.0-26.3.0.patch
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
From 6209cc7872a127953994cd8e0a6aaee7774efdea Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 13 Jun 2026 07:22:08 +0000
Subject: [PATCH] python3-pyopenssl: upgrade 26.2.0 -> 26.3.0

---
 ...{python3-pyopenssl_26.2.0.bb => python3-pyopenssl_26.3.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyopenssl_26.2.0.bb => python3-pyopenssl_26.3.0.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-pyopenssl_26.2.0.bb b/meta/recipes-devtools/python/python3-pyopenssl_26.3.0.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-pyopenssl_26.2.0.bb
rename to meta/recipes-devtools/python/python3-pyopenssl_26.3.0.bb
index 9660a03f89..c27f0719d1 100644
--- a/meta/recipes-devtools/python/python3-pyopenssl_26.2.0.bb
+++ b/meta/recipes-devtools/python/python3-pyopenssl_26.3.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 DEPENDS += "openssl python3-cryptography"
 
-SRC_URI[sha256sum] = "8c6fcecd1183a7fc897548dfe388b0cdb7f37e018200d8409cf33959dbe35387"
+SRC_URI[sha256sum] = "589de7fae1c9ea670d18422ed00fc04da787bbde8e1454aea872aa57b49ad341"
 
 inherit pypi setuptools3
 
-- 
2.47.1


--===============8995661182640328741==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pyopenssl: PKGV changed from 26.2.0 [default] to 26.3.0 [default]
packages/x86-64-v3-poky-linux/python3-pyopenssl: PV changed from "26.2.0" to "26.3.0"
packages/x86-64-v3-poky-linux/python3-pyopenssl: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pyopenssl/pyopenssl-26.2.0.tar.gz;downloadfilename=pyopenssl-26.2.0.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pyopenssl/pyopenssl-26.3.0.tar.gz;downloadfilename=pyopenssl-26.3.0.tar.gz"
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl-dbg: PKGV changed from 26.2.0 [default] to 26.3.0 [default]
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl-dbg: PV changed from "26.2.0" to "26.3.0"
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl-dev: PKGV changed from 26.2.0 [default] to 26.3.0 [default]
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl-dev: PV changed from "26.2.0" to "26.3.0"
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl-doc: PKGV changed from 26.2.0 [default] to 26.3.0 [default]
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl-doc: PV changed from "26.2.0" to "26.3.0"
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl-locale: PKGV changed from 26.2.0 [default] to 26.3.0 [default]
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl-locale: PV changed from "26.2.0" to "26.3.0"
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl-src: PKGV changed from 26.2.0 [default] to 26.3.0 [default]
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl-src: PV changed from "26.2.0" to "26.3.0"
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl-staticdev: PKGV changed from 26.2.0 [default] to 26.3.0 [default]
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl-staticdev: PV changed from "26.2.0" to "26.3.0"
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl-tests: PKGV changed from 26.2.0 [default] to 26.3.0 [default]
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl-tests: PV changed from "26.2.0" to "26.3.0"
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl: PKGV changed from 26.2.0 [default] to 26.3.0 [default]
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl: PV changed from "26.2.0" to "26.3.0"
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pyopenssl-26.2.0.dist-info -> /usr/lib/python3.14/site-packages/pyopenssl-26.3.0.dist-info, directory renamed /usr/lib/python3.14/site-packages/pyopenssl-26.2.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/pyopenssl-26.3.0.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl: PKGSIZE changed from 497634 to 489068 (-2%)
Changes to packages/x86-64-v3-poky-linux/python3-pyopenssl (sysroot):
  /usr/lib/python3.14/site-packages/pyopenssl-26.2.0.dist-info moved to /usr/lib/python3.14/site-packages/pyopenssl-26.3.0.dist-info

--===============8995661182640328741==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pyopenssl-upgrade-26.2.0-26.3.0.patch"

RnJvbSA2MjA5Y2M3ODcyYTEyNzk1Mzk5NGNkOGUwYTZhYWVlNzc3NGVmZGVhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTMgSnVuIDIwMjYgMDc6MjI6MDggKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXB5b3BlbnNzbDogdXBncmFkZSAyNi4yLjAgLT4gMjYuMy4wCgotLS0KIC4uLntweXRo
b24zLXB5b3BlbnNzbF8yNi4yLjAuYmIgPT4gcHl0aG9uMy1weW9wZW5zc2xfMjYuMy4wLmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcHlvcGVuc3NsXzI2LjIu
MC5iYiA9PiBweXRob24zLXB5b3BlbnNzbF8yNi4zLjAuYmJ9ICg4NSUpCgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5b3BlbnNzbF8yNi4yLjAuYmIg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHlvcGVuc3NsXzI2LjMuMC5i
YgpzaW1pbGFyaXR5IGluZGV4IDg1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtcHlvcGVuc3NsXzI2LjIuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5b3BlbnNzbF8yNi4zLjAuYmIKaW5kZXggOTY2MGEw
M2Y4OS4uYzI3ZjA3MTlkMSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLXB5b3BlbnNzbF8yNi4yLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLXB5b3BlbnNzbF8yNi4zLjAuYmIKQEAgLTUsNyArNSw3IEBAIExJQ19G
SUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTNiODNlZjk2Mzg3ZjE0NjU1ZmM4NTRk
ZGMzYzZiZDU3IgogCiBERVBFTkRTICs9ICJvcGVuc3NsIHB5dGhvbjMtY3J5cHRvZ3JhcGh5Igog
Ci1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiOGM2ZmNlY2QxMTgzYTdmYzg5NzU0OGRmZTM4OGIwY2Ri
N2YzN2UwMTgyMDBkODQwOWNmMzM5NTlkYmUzNTM4NyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI1
ODlkZTdmYWUxYzllYTY3MGQxODQyMmVkMDBmYzA0ZGE3ODdiYmRlOGUxNDU0YWVhODcyYWE1N2I0
OWFkMzQxIgogCiBpbmhlcml0IHB5cGkgc2V0dXB0b29sczMKIAotLSAKMi40Ny4xCgo=

--===============8995661182640328741==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pyopenssl-26.2.0.dist-info -> /usr/lib/python3.14/site-packages/pyopenssl-26.3.0.dist-info, directory renamed /usr/lib/python3.14/site-packages/pyopenssl-26.2.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/pyopenssl-26.3.0.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-pyopenssl (sysroot):
  /usr/lib/python3.14/site-packages/pyopenssl-26.2.0.dist-info moved to /usr/lib/python3.14/site-packages/pyopenssl-26.3.0.dist-info

--===============8995661182640328741==--

