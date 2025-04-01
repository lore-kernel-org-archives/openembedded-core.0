Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFFCDC369B7
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 12:43:23 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.18059.1743511400018472189
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 05:43:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=gVu5r5rg;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=hrpP/4sk;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010195f160ac57-9afc1342-25b9-4ab6-9ea4-c6d8895b8d79-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1743511399;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=IHiNt+MKcu7MYROmBHkVqDHmPPc2BQg+gpRnRf2exaQ=;
	b=gVu5r5rg8v/4VbvKbPZH1bn3IHHUe8QNC/BqJwKAcQlt5rfDI45c3FG0AXUmkmam
	TxzA7p0TQPwFY33HnoMtxjr0R/YYpQnOezAY8gEpaXIWgYXa+lNAlcbaD4dwZIIkBbU
	ms7M61t9Dg2u+DCcCFMfRCXuM45/yFNgEERCjfa0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1743511399;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=IHiNt+MKcu7MYROmBHkVqDHmPPc2BQg+gpRnRf2exaQ=;
	b=hrpP/4sk80T5WUobiZ8NTKcJbk8KjHcOOO67AaqdKHLS9Wk04R6vzIaTXwpqeO1R
	mMdcsVptV92JgubSwJ/cxFKotAid+yqy87H4lRbec4WTmLF7ccMWv6TK99aklsf6zd+
	T0iDgI3V/pX6GzD3OcXHdC3BkzkUPHE3GDWXXdc4=
Content-Type: multipart/mixed; boundary="===============3767790471924755885=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-scons: upgrading to 4.9.1 SUCCEEDED
Message-ID: <01010195f160ac57-9afc1342-25b9-4ab6-9ea4-c6d8895b8d79-000000@us-west-2.amazonses.com>
Date: Tue, 1 Apr 2025 12:43:19 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.04.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 12:43:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214070

--===============3767790471924755885==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-scons* to *4.9.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-scons-upgrade-4.9.0-4.9.1.patch
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
From 59f8a1d14fefed9a60565c53b98de455f4c6955f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Apr 2025 09:22:42 +0000
Subject: [PATCH] python3-scons: upgrade 4.9.0 -> 4.9.1

---
 .../python/{python3-scons_4.9.0.bb => python3-scons_4.9.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-scons_4.9.0.bb => python3-scons_4.9.1.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-scons_4.9.0.bb b/meta/recipes-devtools/python/python3-scons_4.9.1.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-scons_4.9.0.bb
rename to meta/recipes-devtools/python/python3-scons_4.9.1.bb
index 2163d4b1a3..c849667970 100644
--- a/meta/recipes-devtools/python/python3-scons_4.9.0.bb
+++ b/meta/recipes-devtools/python/python3-scons_4.9.1.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d903b0b8027f461402bac9b5169b36f7"
 
-SRC_URI[sha256sum] = "f1a5e161bf3d1411d780d65d7919654b9405555994621d3d68e42d62114b592a"
+SRC_URI[sha256sum] = "bacac880ba2e86d6a156c116e2f8f2bfa82b257046f3ac2666c85c53c615c338"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.47.1


--===============3767790471924755885==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-scons (sysroot):
  /usr/lib/python3.13/site-packages/scons-4.9.0.dist-info moved to /usr/lib/python3.13/site-packages/scons-4.9.1.dist-info

--===============3767790471924755885==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-scons: PV changed from "4.9.0" to "4.9.1"
packages/core2-64-poky-linux/python3-scons: PKGV changed from 4.9.0 [default] to 4.9.1 [default]
packages/core2-64-poky-linux/python3-scons: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/scons/scons-4.9.0.tar.gz;downloadfilename=scons-4.9.0.tar.gz" to "https://files.pythonhosted.org/packages/source/s/scons/scons-4.9.1.tar.gz;downloadfilename=scons-4.9.1.tar.gz"
packages/core2-64-poky-linux/python3-scons/python3-scons-dbg: PV changed from "4.9.0" to "4.9.1"
packages/core2-64-poky-linux/python3-scons/python3-scons-dbg: PKGV changed from 4.9.0 [default] to 4.9.1 [default]
packages/core2-64-poky-linux/python3-scons/python3-scons-dev: PV changed from "4.9.0" to "4.9.1"
packages/core2-64-poky-linux/python3-scons/python3-scons-dev: PKGV changed from 4.9.0 [default] to 4.9.1 [default]
packages/core2-64-poky-linux/python3-scons/python3-scons-doc: PV changed from "4.9.0" to "4.9.1"
packages/core2-64-poky-linux/python3-scons/python3-scons-doc: PKGV changed from 4.9.0 [default] to 4.9.1 [default]
packages/core2-64-poky-linux/python3-scons/python3-scons-locale: PV changed from "4.9.0" to "4.9.1"
packages/core2-64-poky-linux/python3-scons/python3-scons-locale: PKGV changed from 4.9.0 [default] to 4.9.1 [default]
packages/core2-64-poky-linux/python3-scons/python3-scons-src: PV changed from "4.9.0" to "4.9.1"
packages/core2-64-poky-linux/python3-scons/python3-scons-src: PKGV changed from 4.9.0 [default] to 4.9.1 [default]
packages/core2-64-poky-linux/python3-scons/python3-scons-staticdev: PV changed from "4.9.0" to "4.9.1"
packages/core2-64-poky-linux/python3-scons/python3-scons-staticdev: PKGV changed from 4.9.0 [default] to 4.9.1 [default]
packages/core2-64-poky-linux/python3-scons/python3-scons: PV changed from "4.9.0" to "4.9.1"
packages/core2-64-poky-linux/python3-scons/python3-scons: PKGSIZE changed from 21989882 to 21993221 (+0%)
packages/core2-64-poky-linux/python3-scons/python3-scons: PKGV changed from 4.9.0 [default] to 4.9.1 [default]
Changes to packages/core2-64-poky-linux/python3-scons (sysroot):
  /usr/lib/python3.13/site-packages/scons-4.9.0.dist-info moved to /usr/lib/python3.13/site-packages/scons-4.9.1.dist-info

--===============3767790471924755885==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-scons-upgrade-4.9.0-4.9.1.patch"

RnJvbSA1OWY4YTFkMTRmZWZlZDlhNjA1NjVjNTNiOThkZTQ1NWY0YzY5NTVmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBBcHIgMjAyNSAwOToyMjo0MiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtc2NvbnM6IHVwZ3JhZGUgNC45LjAgLT4gNC45LjEKCi0tLQogLi4uL3B5dGhvbi97cHl0
aG9uMy1zY29uc180LjkuMC5iYiA9PiBweXRob24zLXNjb25zXzQuOS4xLmJifSAgIHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1zY29uc180LjkuMC5iYiA9PiBweXRo
b24zLXNjb25zXzQuOS4xLmJifSAoODglKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1zY29uc180LjkuMC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1zY29uc180LjkuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDg4JQpyZW5h
bWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2NvbnNfNC45LjAu
YmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zY29uc180
LjkuMS5iYgppbmRleCAyMTYzZDRiMWEzLi5jODQ5NjY3OTcwIDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2NvbnNfNC45LjAuYmIKKysrIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNjb25zXzQuOS4xLmJiCkBAIC00LDcgKzQs
NyBAQCBTRUNUSU9OID0gImRldmVsL3B5dGhvbiIKIExJQ0VOU0UgPSAiTUlUIgogTElDX0ZJTEVT
X0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9ZDkwM2IwYjgwMjdmNDYxNDAyYmFjOWI1MTY5
YjM2ZjciCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJmMWE1ZTE2MWJmM2QxNDExZDc4MGQ2NWQ3
OTE5NjU0Yjk0MDU1NTU5OTQ2MjFkM2Q2OGU0MmQ2MjExNGI1OTJhIgorU1JDX1VSSVtzaGEyNTZz
dW1dID0gImJhY2FjODgwYmEyZTg2ZDZhMTU2YzExNmUyZjhmMmJmYTgyYjI1NzA0NmYzYWMyNjY2
Yzg1YzUzYzYxNWMzMzgiCiAKIGluaGVyaXQgcHlwaSBweXRob25fc2V0dXB0b29sc19idWlsZF9t
ZXRhCiAKLS0gCjIuNDcuMQoK

--===============3767790471924755885==--

