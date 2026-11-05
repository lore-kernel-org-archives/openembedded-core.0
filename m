Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27916.1793856421855118275
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2026 21:27:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=apIX32YF;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=MgA1XNqF;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101a1aa2cbc0f-0aa5d5aa-0568-4c71-a090-ef5933b837c0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1793856421;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=8qUtCdmP9oi0YENLvSVWJwIkXYC4e/OgMBvVuKHHxgE=;
	b=apIX32YFcBnby5CHIqXpf+I0MNvuOyOBhUrz44ts5ihdG+Dud9zoJomFiNi2jPqv
	7WNogt4cWBj6i15+Zw8b/kdr741QDi9DqhJ8Fuz4tqVPHqZQ3/2NqBiWfnBcLSdYRJr
	HVEFcgkI7ywaBGMUDRYH+hRYtJ7QIYB+SorMWXnY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1793856421;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=8qUtCdmP9oi0YENLvSVWJwIkXYC4e/OgMBvVuKHHxgE=;
	b=MgA1XNqFrxypQXIEZWtyNdU+sn4bT85a/3GKeogU9PZmuCT1m2zFGVBJBg5ji2YQ
	y9LlznXVr9E5HlusuwcSV/1qWpjE7d8xd7pqG+mdDcCW4JxmyaQNNfh23+MscEDTZZY
	4WQzMEOtJ5oS/1J2xiNDw/dHqYTj71/lS11UN7HU=
Content-Type: multipart/mixed; boundary="===============4383616474410880893=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Marta Rybczynska <marta.rybczynska@ygreky.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-uritools: upgrading to 6.1.4 SUCCEEDED
Message-ID: <010101a1aa2cbc0f-0aa5d5aa-0568-4c71-a090-ef5933b837c0-000000@us-west-2.amazonses.com>
Date: Thu, 5 Nov 2026 05:27:00 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.05-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 05:27:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249424

--===============4383616474410880893==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-uritools* to *6.1.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-uritools-upgrade-6.1.3-6.1.4.patch
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
From d055bc54d3b04cc005a3504256808d6e2f57aa84 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 5 Nov 2026 05:18:52 +0000
Subject: [PATCH] python3-uritools: upgrade 6.1.3 -> 6.1.4

v6.1.4 (2026-11-04)
===================

- Fix newline handling in ``uricompose()`` and ``urisplit()``.
- Compare schemes case-insensitively in non-strict ``urijoin()``.
- Recognize an uppercase ``IPvFuture`` version flag.
- Various documentation improvements.
- Minor unit test improvements.
- Update build environment.
---
 .../{python3-uritools_6.1.3.bb => python3-uritools_6.1.4.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-uritools_6.1.3.bb => python3-uritools_6.1.4.bb} (79%)

diff --git a/meta/recipes-devtools/python/python3-uritools_6.1.3.bb b/meta/recipes-devtools/python/python3-uritools_6.1.4.bb
similarity index 79%
rename from meta/recipes-devtools/python/python3-uritools_6.1.3.bb
rename to meta/recipes-devtools/python/python3-uritools_6.1.4.bb
index 47fddec046..f327edb469 100644
--- a/meta/recipes-devtools/python/python3-uritools_6.1.3.bb
+++ b/meta/recipes-devtools/python/python3-uritools_6.1.4.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/tkem/uritools/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=079933dfba36eb60b5e3512ca0ab61ae"
 
-SRC_URI[sha256sum] = "3a498e7e85ef3249343d5710618d641a414da0fbae6d23053ada7976ee83ea5f"
+SRC_URI[sha256sum] = "d0b0b589582c29c5085aa1815e4abca59ded3d4420315743328166d65ee73429"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-- 
2.47.1


--===============4383616474410880893==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-uritools: PV changed from "6.1.3" to "6.1.4"
packages/x86-64-v3-poky-linux/python3-uritools: SRC_URI changed from "https://files.pythonhosted.org/packages/source/u/uritools/uritools-6.1.3.tar.gz" to "https://files.pythonhosted.org/packages/source/u/uritools/uritools-6.1.4.tar.gz"
packages/x86-64-v3-poky-linux/python3-uritools: PKGV changed from 6.1.3 [default] to 6.1.4 [default]
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-dbg: PV changed from "6.1.3" to "6.1.4"
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-dbg: PKGV changed from 6.1.3 [default] to 6.1.4 [default]
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-dev: PV changed from "6.1.3" to "6.1.4"
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-dev: PKGV changed from 6.1.3 [default] to 6.1.4 [default]
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-doc: PV changed from "6.1.3" to "6.1.4"
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-doc: PKGV changed from 6.1.3 [default] to 6.1.4 [default]
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-locale: PV changed from "6.1.3" to "6.1.4"
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-locale: PKGV changed from 6.1.3 [default] to 6.1.4 [default]
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-ptest: PV changed from "6.1.3" to "6.1.4"
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-ptest: PKGSIZE changed from 50062 to 56221 (+12%)
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-ptest: PKGV changed from 6.1.3 [default] to 6.1.4 [default]
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-src: PV changed from "6.1.3" to "6.1.4"
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-src: PKGV changed from 6.1.3 [default] to 6.1.4 [default]
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-staticdev: PV changed from "6.1.3" to "6.1.4"
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-staticdev: PKGV changed from 6.1.3 [default] to 6.1.4 [default]
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools: PV changed from "6.1.3" to "6.1.4"
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools: PKGSIZE changed from 73198 to 74971 (+2%)
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools: PKGV changed from 6.1.3 [default] to 6.1.4 [default]
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools: FILELIST: directory renamed /usr/lib/python3.14/site-packages/uritools-6.1.3.dist-info/licenses -> /usr/lib/python3.14/site-packages/uritools-6.1.4.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/uritools-6.1.3.dist-info -> /usr/lib/python3.14/site-packages/uritools-6.1.4.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-uritools (sysroot):
  /usr/lib/python3.14/site-packages/uritools-6.1.3.dist-info moved to /usr/lib/python3.14/site-packages/uritools-6.1.4.dist-info

--===============4383616474410880893==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="python3-uritools-changelog.txt"

v6.1.4 (2026-11-04)
===================

- Fix newline handling in ``uricompose()`` and ``urisplit()``.
- Compare schemes case-insensitively in non-strict ``urijoin()``.
- Recognize an uppercase ``IPvFuture`` version flag.
- Various documentation improvements.
- Minor unit test improvements.
- Update build environment.

--===============4383616474410880893==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-ptest: PKGSIZE changed from 50062 to 56221 (+12%)
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools: FILELIST: directory renamed /usr/lib/python3.14/site-packages/uritools-6.1.3.dist-info -> /usr/lib/python3.14/site-packages/uritools-6.1.4.dist-info, directory renamed /usr/lib/python3.14/site-packages/uritools-6.1.3.dist-info/licenses -> /usr/lib/python3.14/site-packages/uritools-6.1.4.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-uritools (sysroot):
  /usr/lib/python3.14/site-packages/uritools-6.1.3.dist-info moved to /usr/lib/python3.14/site-packages/uritools-6.1.4.dist-info

--===============4383616474410880893==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-uritools-upgrade-6.1.3-6.1.4.patch"

RnJvbSBkMDU1YmM1NGQzYjA0Y2MwMDVhMzUwNDI1NjgwOGQ2ZTJmNTdhYTg0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgNSBOb3YgMjAyNiAwNToxODo1MiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtdXJpdG9vbHM6IHVwZ3JhZGUgNi4xLjMgLT4gNi4xLjQKCnY2LjEuNCAoMjAyNi0xMS0w
NCkKPT09PT09PT09PT09PT09PT09PQoKLSBGaXggbmV3bGluZSBoYW5kbGluZyBpbiBgYHVyaWNv
bXBvc2UoKWBgIGFuZCBgYHVyaXNwbGl0KClgYC4KLSBDb21wYXJlIHNjaGVtZXMgY2FzZS1pbnNl
bnNpdGl2ZWx5IGluIG5vbi1zdHJpY3QgYGB1cmlqb2luKClgYC4KLSBSZWNvZ25pemUgYW4gdXBw
ZXJjYXNlIGBgSVB2RnV0dXJlYGAgdmVyc2lvbiBmbGFnLgotIFZhcmlvdXMgZG9jdW1lbnRhdGlv
biBpbXByb3ZlbWVudHMuCi0gTWlub3IgdW5pdCB0ZXN0IGltcHJvdmVtZW50cy4KLSBVcGRhdGUg
YnVpbGQgZW52aXJvbm1lbnQuCi0tLQogLi4uL3tweXRob24zLXVyaXRvb2xzXzYuMS4zLmJiID0+
IHB5dGhvbjMtdXJpdG9vbHNfNi4xLjQuYmJ9ICAgIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi97cHl0aG9uMy11cml0b29sc182LjEuMy5iYiA9PiBweXRob24zLXVyaXRvb2xzXzYu
MS40LmJifSAoNzklKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy11cml0b29sc182LjEuMy5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy11cml0b29sc182LjEuNC5iYgpzaW1pbGFyaXR5IGluZGV4IDc5JQpyZW5hbWUgZnJv
bSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXJpdG9vbHNfNi4xLjMuYmIK
cmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11cml0b29sc182
LjEuNC5iYgppbmRleCA0N2ZkZGVjMDQ2Li5mMzI3ZWRiNDY5IDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXJpdG9vbHNfNi4xLjMuYmIKKysrIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXVyaXRvb2xzXzYuMS40LmJiCkBAIC00
LDcgKzQsNyBAQCBIT01FUEFHRSA9ICJodHRwczovL2dpdGh1Yi5jb20vdGtlbS91cml0b29scy8i
CiBMSUNFTlNFID0gIk1JVCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1
PTA3OTkzM2RmYmEzNmViNjBiNWUzNTEyY2EwYWI2MWFlIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0g
PSAiM2E0OThlN2U4NWVmMzI0OTM0M2Q1NzEwNjE4ZDY0MWE0MTRkYTBmYmFlNmQyMzA1M2FkYTc5
NzZlZTgzZWE1ZiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJkMGIwYjU4OTU4MmMyOWM1MDg1YWEx
ODE1ZTRhYmNhNTlkZWQzZDQ0MjAzMTU3NDMzMjgxNjZkNjVlZTczNDI5IgogCiBpbmhlcml0IHB5
cGkgcHl0aG9uX3NldHVwdG9vbHNfYnVpbGRfbWV0YSBwdGVzdC1weXRob24tcHl0ZXN0CiAKLS0g
CjIuNDcuMQoK

--===============4383616474410880893==--
