Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8257C54EBA
	for <webhook@archiver.kernel.org>; Fri, 15 Mar 2024 17:00:13 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.1234.1710522010374095625
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Mar 2024 10:00:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=M3PAULaS;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=PCDfGdC8;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018e430e8e93-7a7dd42d-13dc-4be1-ab05-1ca099793114-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1710522011;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=THUBM5BNbKlSDDKA8C/zOW65ibi1gPNNEnDyktq7FEs=;
	b=M3PAULaSJb5CR5T38v+JUoV1Q/YFbG3lQTKjP20uNDMNAGnFYWY7ByLYf/SuAGa8
	GjC0avVWqEczst0WfY+lqsfsoOzEE1I28vhflzgYH9BC3/As/mZl5j+bjclD9vV8BrF
	uvXeH95fd8JkVzVh93sqJuqV82C51YSg+QRY8Z+E=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1710522011;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=THUBM5BNbKlSDDKA8C/zOW65ibi1gPNNEnDyktq7FEs=;
	b=PCDfGdC8ZXnv6vt+eM7iT514xlHtDOJZw34pzGGdvvNnfR/Cn6m2wPjICeYei215
	+IizUBRD3XPw1Kx6H3mNYgiBP2qkxHzogJPCImSvoyWthPXWkki+8zYBhV3WMggedwT
	/SE2Om4MhZX+a557Mi32W4kpUAJ3vttJ/ly089O4=
Content-Type: multipart/mixed; boundary="===============4090290144938216786=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pyelftools: upgrading to 0.31 SUCCEEDED
Message-ID: <0101018e430e8e93-7a7dd42d-13dc-4be1-ab05-1ca099793114-000000@us-west-2.amazonses.com>
Date: Fri, 15 Mar 2024 17:00:11 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.03.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 17:00:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197163

--===============4090290144938216786==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pyelftools* to *0.31* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pyelftools-upgrade-0.30-0.31.patch
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
From 623760723869065fbceddf9b3e2f94a670cff674 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Mar 2024 08:48:16 +0000
Subject: [PATCH] python3-pyelftools: upgrade 0.30 -> 0.31

---
 .../{python3-pyelftools_0.30.bb => python3-pyelftools_0.31.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyelftools_0.30.bb => python3-pyelftools_0.31.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-pyelftools_0.30.bb b/meta/recipes-devtools/python/python3-pyelftools_0.31.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-pyelftools_0.30.bb
rename to meta/recipes-devtools/python/python3-pyelftools_0.31.bb
index 837edb7165..551fed6876 100644
--- a/meta/recipes-devtools/python/python3-pyelftools_0.30.bb
+++ b/meta/recipes-devtools/python/python3-pyelftools_0.31.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5ce2a2b07fca326bc7c146d10105ccfc"
 
-SRC_URI[sha256sum] = "2fc92b0d534f8b081f58c7c370967379123d8e00984deb53c209364efd575b40"
+SRC_URI[sha256sum] = "c774416b10310156879443b81187d182d8d9ee499660380e645918b50bc88f99"
 
 PYPI_PACKAGE = "pyelftools"
 
-- 
2.42.0


--===============4090290144938216786==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-pyelftools: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pyelftools/pyelftools-0.30.tar.gz;downloadfilename=pyelftools-0.30.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pyelftools/pyelftools-0.31.tar.gz;downloadfilename=pyelftools-0.31.tar.gz"
packages/core2-64-poky-linux/python3-pyelftools: PV changed from "0.30" to "0.31"
packages/core2-64-poky-linux/python3-pyelftools: PKGV changed from 0.30 [default] to 0.31 [default]
packages/core2-64-poky-linux/python3-pyelftools/python3-pyelftools-dbg: PV changed from "0.30" to "0.31"
packages/core2-64-poky-linux/python3-pyelftools/python3-pyelftools-dbg: PKGV changed from 0.30 [default] to 0.31 [default]
packages/core2-64-poky-linux/python3-pyelftools/python3-pyelftools-dev: PV changed from "0.30" to "0.31"
packages/core2-64-poky-linux/python3-pyelftools/python3-pyelftools-dev: PKGV changed from 0.30 [default] to 0.31 [default]
packages/core2-64-poky-linux/python3-pyelftools/python3-pyelftools-doc: PV changed from "0.30" to "0.31"
packages/core2-64-poky-linux/python3-pyelftools/python3-pyelftools-doc: PKGV changed from 0.30 [default] to 0.31 [default]
packages/core2-64-poky-linux/python3-pyelftools/python3-pyelftools-locale: PV changed from "0.30" to "0.31"
packages/core2-64-poky-linux/python3-pyelftools/python3-pyelftools-locale: PKGV changed from 0.30 [default] to 0.31 [default]
packages/core2-64-poky-linux/python3-pyelftools/python3-pyelftools-src: PV changed from "0.30" to "0.31"
packages/core2-64-poky-linux/python3-pyelftools/python3-pyelftools-src: PKGV changed from 0.30 [default] to 0.31 [default]
packages/core2-64-poky-linux/python3-pyelftools/python3-pyelftools-staticdev: PV changed from "0.30" to "0.31"
packages/core2-64-poky-linux/python3-pyelftools/python3-pyelftools-staticdev: PKGV changed from 0.30 [default] to 0.31 [default]
packages/core2-64-poky-linux/python3-pyelftools/python3-pyelftools: PV changed from "0.30" to "0.31"
packages/core2-64-poky-linux/python3-pyelftools/python3-pyelftools: PKGV changed from 0.30 [default] to 0.31 [default]
packages/core2-64-poky-linux/python3-pyelftools/python3-pyelftools: PKGSIZE changed from 1366400 to 1388559 (+2%)
packages/core2-64-poky-linux/python3-pyelftools/python3-pyelftools: FILELIST: directory renamed /usr/lib/python3.12/site-packages/pyelftools-0.30.dist-info -> /usr/lib/python3.12/site-packages/pyelftools-0.31.dist-info, added "/usr/lib/python3.12/site-packages/elftools/py.typed"
Changes to packages/core2-64-poky-linux/python3-pyelftools (sysroot):
  /usr/lib/python3.12/site-packages/pyelftools-0.30.dist-info moved to /usr/lib/python3.12/site-packages/pyelftools-0.31.dist-info
  /usr/lib/python3.12/site-packages/elftools/py.typed was added

--===============4090290144938216786==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pyelftools-upgrade-0.30-0.31.patch"

RnJvbSA2MjM3NjA3MjM4NjkwNjVmYmNlZGRmOWIzZTJmOTRhNjcwY2ZmNjc0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgTWFyIDIwMjQgMDg6NDg6MTYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXB5ZWxmdG9vbHM6IHVwZ3JhZGUgMC4zMCAtPiAwLjMxCgotLS0KIC4uLi97cHl0aG9u
My1weWVsZnRvb2xzXzAuMzAuYmIgPT4gcHl0aG9uMy1weWVsZnRvb2xzXzAuMzEuYmJ9ICB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1l
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcHllbGZ0b29sc18wLjMwLmJi
ID0+IHB5dGhvbjMtcHllbGZ0b29sc18wLjMxLmJifSAoODIlKQoKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWVsZnRvb2xzXzAuMzAuYmIgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHllbGZ0b29sc18wLjMxLmJiCnNpbWls
YXJpdHkgaW5kZXggODIlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1weWVsZnRvb2xzXzAuMzAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1weWVsZnRvb2xzXzAuMzEuYmIKaW5kZXggODM3ZWRiNzE2NS4uNTUx
ZmVkNjg3NiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LXB5ZWxmdG9vbHNfMC4zMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtcHllbGZ0b29sc18wLjMxLmJiCkBAIC00LDcgKzQsNyBAQCBTRUNUSU9OID0gImRldmVs
L3B5dGhvbiIKIExJQ0VOU0UgPSAiUEQiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNF
TlNFO21kNT01Y2UyYTJiMDdmY2EzMjZiYzdjMTQ2ZDEwMTA1Y2NmYyIKIAotU1JDX1VSSVtzaGEy
NTZzdW1dID0gIjJmYzkyYjBkNTM0ZjhiMDgxZjU4YzdjMzcwOTY3Mzc5MTIzZDhlMDA5ODRkZWI1
M2MyMDkzNjRlZmQ1NzViNDAiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYzc3NDQxNmIxMDMxMDE1
Njg3OTQ0M2I4MTE4N2QxODJkOGQ5ZWU0OTk2NjAzODBlNjQ1OTE4YjUwYmM4OGY5OSIKIAogUFlQ
SV9QQUNLQUdFID0gInB5ZWxmdG9vbHMiCiAKLS0gCjIuNDIuMAoK

--===============4090290144938216786==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-pyelftools/python3-pyelftools: FILELIST: directory renamed /usr/lib/python3.12/site-packages/pyelftools-0.30.dist-info -> /usr/lib/python3.12/site-packages/pyelftools-0.31.dist-info, added "/usr/lib/python3.12/site-packages/elftools/py.typed"
Changes to packages/core2-64-poky-linux/python3-pyelftools (sysroot):
  /usr/lib/python3.12/site-packages/pyelftools-0.30.dist-info moved to /usr/lib/python3.12/site-packages/pyelftools-0.31.dist-info
  /usr/lib/python3.12/site-packages/elftools/py.typed was added

--===============4090290144938216786==--

