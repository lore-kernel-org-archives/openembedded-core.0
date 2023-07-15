Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20914C2FC11
	for <webhook@archiver.kernel.org>; Sat, 15 Jul 2023 21:27:40 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.6025.1689456454451001600
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jul 2023 14:27:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=LnG5qMDC;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101895b73a862-1bc16713-5862-4b7e-bddd-e40b25f65b0f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1689456453;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=hfC9qutpKOHnbnR1Bmhg3T7zYK4ifTpY+cGBeLWbsZQ=;
	b=LnG5qMDCVSrlCkhNndHCED+q/2nPj5VplE/kOqLehBAlqHMo1QDtVCKvBK3ywfEk
	GIr33aRm4khbOvjSC7jEXuaReDTvSk9npPdc6N8Eqf0lZamMEcQK7fXn/+Qn2VCPcl6
	XzxsSA/WKAsY86HMzGSbIHrPE06O4nM3h9tayAvQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1689456453;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=hfC9qutpKOHnbnR1Bmhg3T7zYK4ifTpY+cGBeLWbsZQ=;
	b=L/DWl60WMtyPmAfUC+SzkDFXKRwZGpKNWN/ecD4HDugbx2f9eo926Lvh7VvE3vy/
	07li9x4IHGjoFge5TpC8MO7TbJedqgExvlQ+MLHCg91MwAbw5U7+pvAWXInsZzH0zLk
	sgAjMXhFHznFWQpAdeglIBSDgcwYL4+P2FwWilSI=
Content-Type: multipart/mixed; boundary="===============5069483978998395177=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] go-runtime: upgrading to 1.20.6 FAILED
Message-ID: <010101895b73a862-1bc16713-5862-4b7e-bddd-e40b25f65b0f-000000@us-west-2.amazonses.com>
Date: Sat, 15 Jul 2023 21:27:33 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.07.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jul 2023 21:27:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184335

--===============5069483978998395177==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *go-runtime* to *1.20.6* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-go-runtime-upgrade-1.20.5-1.20.6.patch
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
From 4d222401cfae63c48fc77326effde03ae606de65 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Jul 2023 10:52:07 +0000
Subject: [PATCH] go-runtime: upgrade 1.20.5 -> 1.20.6

---
 meta/recipes-devtools/go/{go-1.20.5.inc => go-1.20.6.inc}       | 2 +-
 .../go/{go-runtime_1.20.5.bb => go-runtime_1.20.6.bb}           | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/go/{go-1.20.5.inc => go-1.20.6.inc} (89%)
 rename meta/recipes-devtools/go/{go-runtime_1.20.5.bb => go-runtime_1.20.6.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.20.5.inc b/meta/recipes-devtools/go/go-1.20.6.inc
similarity index 89%
rename from meta/recipes-devtools/go/go-1.20.5.inc
rename to meta/recipes-devtools/go/go-1.20.6.inc
index 4e4e57d5cb..551171b255 100644
--- a/meta/recipes-devtools/go/go-1.20.5.inc
+++ b/meta/recipes-devtools/go/go-1.20.6.inc
@@ -15,4 +15,4 @@ SRC_URI += "\
     file://0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
     file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch \
 "
-SRC_URI[main.sha256sum] = "9a15c133ba2cfafe79652f4815b62e7cfc267f68df1b9454c6ab2a3ca8b96a88"
+SRC_URI[main.sha256sum] = "62ee5bc6fb55b8bae8f705e0cb8df86d6453626b4ecf93279e2867092e0b7f70"
diff --git a/meta/recipes-devtools/go/go-runtime_1.20.5.bb b/meta/recipes-devtools/go/go-runtime_1.20.6.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.20.5.bb
rename to meta/recipes-devtools/go/go-runtime_1.20.6.bb
-- 
2.39.2


--===============5069483978998395177==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1803 entries from dependency cache.
Parsing recipes...
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: ParseError at /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/go/go-native_1.20.5.bb:4: Could not include required file go-1.20.5.inc
ERROR: Parsing halted due to errors, see error messages above

--===============5069483978998395177==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-go-runtime-upgrade-1.20.5-1.20.6.patch"

RnJvbSA0ZDIyMjQwMWNmYWU2M2M0OGZjNzczMjZlZmZkZTAzYWU2MDZkZTY1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgSnVsIDIwMjMgMTA6NTI6MDcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
by1ydW50aW1lOiB1cGdyYWRlIDEuMjAuNSAtPiAxLjIwLjYKCi0tLQogbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2dvL3tnby0xLjIwLjUuaW5jID0+IGdvLTEuMjAuNi5pbmN9ICAgICAgIHwgMiArLQog
Li4uL2dvL3tnby1ydW50aW1lXzEuMjAuNS5iYiA9PiBnby1ydW50aW1lXzEuMjAuNi5iYn0gICAg
ICAgICAgIHwgMAogMiBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9nby97Z28tMS4yMC41LmluYyA9PiBnby0x
LjIwLjYuaW5jfSAoODklKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9nby97Z28tcnVu
dGltZV8xLjIwLjUuYmIgPT4gZ28tcnVudGltZV8xLjIwLjYuYmJ9ICgxMDAlKQoKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9nby0xLjIwLjUuaW5jIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2dvL2dvLTEuMjAuNi5pbmMKc2ltaWxhcml0eSBpbmRleCA4OSUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dvL2dvLTEuMjAuNS5pbmMKcmVuYW1lIHRvIG1ldGEv
cmVjaXBlcy1kZXZ0b29scy9nby9nby0xLjIwLjYuaW5jCmluZGV4IDRlNGU1N2Q1Y2IuLjU1MTE3
MWIyNTUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9nby0xLjIwLjUuaW5j
CisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9nby0xLjIwLjYuaW5jCkBAIC0xNSw0ICsx
NSw0IEBAIFNSQ19VUkkgKz0gIlwKICAgICBmaWxlOi8vMDAwOC1zcmMtY21kLWRpc3QtYnVpbGRn
by5nby1kby1ub3QtaGFyZGNvZGUtaG9zdC1jb21waWxlLnBhdGNoIFwKICAgICBmaWxlOi8vMDAw
OS1nby1GaWx0ZXItYnVpbGQtcGF0aHMtb24tc3RhdGljbHktbGlua2VkLWFyY2hlcy5wYXRjaCBc
CiAiCi1TUkNfVVJJW21haW4uc2hhMjU2c3VtXSA9ICI5YTE1YzEzM2JhMmNmYWZlNzk2NTJmNDgx
NWI2MmU3Y2ZjMjY3ZjY4ZGYxYjk0NTRjNmFiMmEzY2E4Yjk2YTg4IgorU1JDX1VSSVttYWluLnNo
YTI1NnN1bV0gPSAiNjJlZTViYzZmYjU1YjhiYWU4ZjcwNWUwY2I4ZGY4NmQ2NDUzNjI2YjRlY2Y5
MzI3OWUyODY3MDkyZTBiN2Y3MCIKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9n
by9nby1ydW50aW1lXzEuMjAuNS5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9nby1ydW50
aW1lXzEuMjAuNi5iYgpzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZyb20gbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2dvL2dvLXJ1bnRpbWVfMS4yMC41LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvZ28vZ28tcnVudGltZV8xLjIwLjYuYmIKLS0gCjIuMzkuMgoK

--===============5069483978998395177==--

