Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 400E4E77350
	for <webhook@archiver.kernel.org>; Sun,  1 Oct 2023 18:13:18 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.65021.1696183991015324190
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Oct 2023 11:13:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=T2BEtoOT;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=HwbeUwKk;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018aec71b6ef-989159c1-daaa-4562-af68-676f6c35f811-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1696183990;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=UO0a9SFWeIwqmX7rWWS5TLuGdugyi6V/o4ZBfoZQUro=;
	b=T2BEtoOTHQXegTOOD+yHbQkIGG56d/JOea34sb9iFe5Dib3aMbU+HhoxFRL/5jLv
	cE9xUh2XhwGZIA/QatzJt2GKZxTiFdPfOAdS5eiGVbSSODQwJ3SGE9PDnbgJ9YRxiIw
	tSyWn6QsReXLwbZvBBGsbHOx6+257Hx+Oi5FOW28=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1696183990;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=UO0a9SFWeIwqmX7rWWS5TLuGdugyi6V/o4ZBfoZQUro=;
	b=HwbeUwKkbHxMtJOeetHPKtKWsDSEo7lwSrjUTUlBa4QYCCtzFz6WJxk6duLbcEU3
	UKyGBkx3F0PMix2IFFZdGcnWnhOhS3+rfI7vjUxzYd5VHsRH3huCeB8hoynhIPlvvmu
	/xpm4LT9TMltK2uexhF09V6cKXWLHFXT0vdd4qD8=
Content-Type: multipart/mixed; boundary="===============1232556484587022591=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] meson: upgrading to 1.2.2 SUCCEEDED
Message-ID: <0101018aec71b6ef-989159c1-daaa-4562-af68-676f6c35f811-000000@us-west-2.amazonses.com>
Date: Sun, 1 Oct 2023 18:13:10 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.10.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Oct 2023 18:13:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188534

--===============1232556484587022591==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *meson* to *1.2.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-meson-upgrade-1.2.1-1.2.2.patch
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
From c71ba55a72883641a874e145573ff49a2296e19c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Oct 2023 08:41:07 +0000
Subject: [PATCH] meson: upgrade 1.2.1 -> 1.2.2

---
 meta/recipes-devtools/meson/{meson_1.2.1.bb => meson_1.2.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/meson/{meson_1.2.1.bb => meson_1.2.2.bb} (98%)

diff --git a/meta/recipes-devtools/meson/meson_1.2.1.bb b/meta/recipes-devtools/meson/meson_1.2.2.bb
similarity index 98%
rename from meta/recipes-devtools/meson/meson_1.2.1.bb
rename to meta/recipes-devtools/meson/meson_1.2.2.bb
index fe45266202..6a07168ee1 100644
--- a/meta/recipes-devtools/meson/meson_1.2.1.bb
+++ b/meta/recipes-devtools/meson/meson_1.2.2.bb
@@ -15,7 +15,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/meson-${PV}.tar.gz \
            file://0001-Make-CPU-family-warnings-fatal.patch \
            file://0002-Support-building-allarch-recipes-again.patch \
            "
-SRC_URI[sha256sum] = "b1db3a153087549497ee52b1c938d2134e0338214fe14f7efd16fecd57b639f5"
+SRC_URI[sha256sum] = "4a0f04de331fbc7af3b802a844fc8838f4ccd1ded1e792ba4f8f2faf8c5fe4d6"
 
 inherit python_setuptools_build_meta github-releases
 
-- 
2.39.2


--===============1232556484587022591==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/meson: SRC_URI changed from "https://github.com/mesonbuild/meson/releases//download/1.2.1/meson-1.2.1.tar.gz file://meson-setup.py file://meson-wrapper file://0001-python-module-do-not-manipulate-the-environment-when.patch file://0001-Make-CPU-family-warnings-fatal.patch file://0002-Support-building-allarch-recipes-again.patch" to "https://github.com/mesonbuild/meson/releases//download/1.2.2/meson-1.2.2.tar.gz file://meson-setup.py file://meson-wrapper file://0001-python-module-do-not-manipulate-the-environment-when.patch file://0001-Make-CPU-family-warnings-fatal.patch file://0002-Support-building-allarch-recipes-again.patch"
packages/core2-32-poky-linux/meson: PKGV changed from 1.2.1 [default] to 1.2.2 [default]
packages/core2-32-poky-linux/meson: PV changed from "1.2.1" to "1.2.2"
packages/core2-32-poky-linux/meson/meson-dbg: PKGV changed from 1.2.1 [default] to 1.2.2 [default]
packages/core2-32-poky-linux/meson/meson-dbg: PV changed from "1.2.1" to "1.2.2"
packages/core2-32-poky-linux/meson/meson-dev: PKGV changed from 1.2.1 [default] to 1.2.2 [default]
packages/core2-32-poky-linux/meson/meson-dev: PV changed from "1.2.1" to "1.2.2"
packages/core2-32-poky-linux/meson/meson-doc: PKGSIZE changed from 5357 to 5360 (+0%)
packages/core2-32-poky-linux/meson/meson-doc: PKGV changed from 1.2.1 [default] to 1.2.2 [default]
packages/core2-32-poky-linux/meson/meson-doc: PV changed from "1.2.1" to "1.2.2"
packages/core2-32-poky-linux/meson/meson-locale: PKGV changed from 1.2.1 [default] to 1.2.2 [default]
packages/core2-32-poky-linux/meson/meson-locale: PV changed from "1.2.1" to "1.2.2"
packages/core2-32-poky-linux/meson/meson-src: PKGV changed from 1.2.1 [default] to 1.2.2 [default]
packages/core2-32-poky-linux/meson/meson-src: PV changed from "1.2.1" to "1.2.2"
packages/core2-32-poky-linux/meson/meson-staticdev: PKGV changed from 1.2.1 [default] to 1.2.2 [default]
packages/core2-32-poky-linux/meson/meson-staticdev: PV changed from "1.2.1" to "1.2.2"
packages/core2-32-poky-linux/meson/meson: PKGSIZE changed from 8349303 to 8362753 (+0%)
packages/core2-32-poky-linux/meson/meson: PKGV changed from 1.2.1 [default] to 1.2.2 [default]
packages/core2-32-poky-linux/meson/meson: PV changed from "1.2.1" to "1.2.2"
Changes to packages/core2-32-poky-linux/meson (sysroot):
  /usr/lib/python3.11/site-packages/meson-1.2.1.dist-info moved to /usr/lib/python3.11/site-packages/meson-1.2.2.dist-info

--===============1232556484587022591==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-meson-upgrade-1.2.1-1.2.2.patch"

RnJvbSBjNzFiYTU1YTcyODgzNjQxYTg3NGUxNDU1NzNmZjQ5YTIyOTZlMTljIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBPY3QgMjAyMyAwODo0MTowNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG1l
c29uOiB1cGdyYWRlIDEuMi4xIC0+IDEuMi4yCgotLS0KIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9t
ZXNvbi97bWVzb25fMS4yLjEuYmIgPT4gbWVzb25fMS4yLjIuYmJ9IHwgMiArLQogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVz
LWRldnRvb2xzL21lc29uL3ttZXNvbl8xLjIuMS5iYiA9PiBtZXNvbl8xLjIuMi5iYn0gKDk4JSkK
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbWVzb24vbWVzb25fMS4yLjEuYmIg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbWVzb24vbWVzb25fMS4yLjIuYmIKc2ltaWxhcml0eSBp
bmRleCA5OCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL21lc29uL21lc29uXzEu
Mi4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvbWVzb24vbWVzb25fMS4yLjIu
YmIKaW5kZXggZmU0NTI2NjIwMi4uNmEwNzE2OGVlMSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL21lc29uL21lc29uXzEuMi4xLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9tZXNvbi9tZXNvbl8xLjIuMi5iYgpAQCAtMTUsNyArMTUsNyBAQCBTUkNfVVJJID0gIiR7R0lU
SFVCX0JBU0VfVVJJfS9kb3dubG9hZC8ke1BWfS9tZXNvbi0ke1BWfS50YXIuZ3ogXAogICAgICAg
ICAgICBmaWxlOi8vMDAwMS1NYWtlLUNQVS1mYW1pbHktd2FybmluZ3MtZmF0YWwucGF0Y2ggXAog
ICAgICAgICAgICBmaWxlOi8vMDAwMi1TdXBwb3J0LWJ1aWxkaW5nLWFsbGFyY2gtcmVjaXBlcy1h
Z2Fpbi5wYXRjaCBcCiAgICAgICAgICAgICIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJiMWRiM2Ex
NTMwODc1NDk0OTdlZTUyYjFjOTM4ZDIxMzRlMDMzODIxNGZlMTRmN2VmZDE2ZmVjZDU3YjYzOWY1
IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjRhMGYwNGRlMzMxZmJjN2FmM2I4MDJhODQ0ZmM4ODM4
ZjRjY2QxZGVkMWU3OTJiYTRmOGYyZmFmOGM1ZmU0ZDYiCiAKIGluaGVyaXQgcHl0aG9uX3NldHVw
dG9vbHNfYnVpbGRfbWV0YSBnaXRodWItcmVsZWFzZXMKIAotLSAKMi4zOS4yCgo=

--===============1232556484587022591==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/meson (sysroot):
  /usr/lib/python3.11/site-packages/meson-1.2.1.dist-info moved to /usr/lib/python3.11/site-packages/meson-1.2.2.dist-info

--===============1232556484587022591==--

