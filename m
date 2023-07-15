Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D186C2FC0F
	for <webhook@archiver.kernel.org>; Sat, 15 Jul 2023 21:27:40 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.5941.1689456454459825569
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jul 2023 14:27:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=CNEp/plp;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101895b73a7f6-162d2319-9125-4cad-8028-e8bdac0cf243-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1689456453;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=LSCQs6tGb7/iGRxiTCMVyZh5g3h1L4NSkM9gc82f4mU=;
	b=CNEp/plpd9G7D1sZMliI/nm725ZOAqyfpa/U1nSGjgxA8IfJe8SFBZ6R5UPEVP8p
	/7T5dnmFylQwZjWwdySpBaP2fiNAsRGTXuZurIbPOicBcllNPhMTgg5euXX0jJEXD7q
	CVQ8qNaEZ3/TXHZOZ2OcAk/CHIvEMmjo/e5E9A0E=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1689456453;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=LSCQs6tGb7/iGRxiTCMVyZh5g3h1L4NSkM9gc82f4mU=;
	b=NWRRY02fii5t+e9eNJM8IbgmbETFOtFf1gn/iTxuruH8jkDowPSwnmBpS+a+ZJsl
	WocLYbj9ORbXNxLK6+z8hDAnOevnXvO+tQBUnvqr5RWMPsvpiYJaB4A7b3KObn6IRx6
	5XzvKoV7c14DXtMg61tgwXbdrEnhAfMagXKcYRVI=
Content-Type: multipart/mixed; boundary="===============6370341318962983992=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] go: upgrading to 1.20.6 FAILED
Message-ID: <010101895b73a7f6-162d2319-9125-4cad-8028-e8bdac0cf243-000000@us-west-2.amazonses.com>
Date: Sat, 15 Jul 2023 21:27:33 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.07.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jul 2023 21:27:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184336

--===============6370341318962983992==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *go* to *1.20.6* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-go-upgrade-1.20.5-1.20.6.patch
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
From 0420aefb4752d687ddbe4b4a53522bf329e3dec8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Jul 2023 10:54:59 +0000
Subject: [PATCH] go: upgrade 1.20.5 -> 1.20.6

---
 meta/recipes-devtools/go/{go-1.20.5.inc => go-1.20.6.inc} | 2 +-
 meta/recipes-devtools/go/{go_1.20.5.bb => go_1.20.6.bb}   | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/go/{go-1.20.5.inc => go-1.20.6.inc} (89%)
 rename meta/recipes-devtools/go/{go_1.20.5.bb => go_1.20.6.bb} (100%)

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
diff --git a/meta/recipes-devtools/go/go_1.20.5.bb b/meta/recipes-devtools/go/go_1.20.6.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.20.5.bb
rename to meta/recipes-devtools/go/go_1.20.6.bb
-- 
2.39.2


--===============6370341318962983992==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-go-upgrade-1.20.5-1.20.6.patch"

RnJvbSAwNDIwYWVmYjQ3NTJkNjg3ZGRiZTRiNGE1MzUyMmJmMzI5ZTNkZWM4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgSnVsIDIwMjMgMTA6NTQ6NTkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
bzogdXBncmFkZSAxLjIwLjUgLT4gMS4yMC42CgotLS0KIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9n
by97Z28tMS4yMC41LmluYyA9PiBnby0xLjIwLjYuaW5jfSB8IDIgKy0KIG1ldGEvcmVjaXBlcy1k
ZXZ0b29scy9nby97Z29fMS4yMC41LmJiID0+IGdvXzEuMjAuNi5iYn0gICB8IDAKIDIgZmlsZXMg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvZ28ve2dvLTEuMjAuNS5pbmMgPT4gZ28tMS4yMC42LmluY30gKDg5JSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ28ve2dvXzEuMjAuNS5iYiA9PiBnb18xLjIwLjYu
YmJ9ICgxMDAlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9nby0xLjIw
LjUuaW5jIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dvL2dvLTEuMjAuNi5pbmMKc2ltaWxhcml0
eSBpbmRleCA4OSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dvL2dvLTEuMjAu
NS5pbmMKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9nby0xLjIwLjYuaW5jCmlu
ZGV4IDRlNGU1N2Q1Y2IuLjU1MTE3MWIyNTUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9nby9nby0xLjIwLjUuaW5jCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9nby0x
LjIwLjYuaW5jCkBAIC0xNSw0ICsxNSw0IEBAIFNSQ19VUkkgKz0gIlwKICAgICBmaWxlOi8vMDAw
OC1zcmMtY21kLWRpc3QtYnVpbGRnby5nby1kby1ub3QtaGFyZGNvZGUtaG9zdC1jb21waWxlLnBh
dGNoIFwKICAgICBmaWxlOi8vMDAwOS1nby1GaWx0ZXItYnVpbGQtcGF0aHMtb24tc3RhdGljbHkt
bGlua2VkLWFyY2hlcy5wYXRjaCBcCiAiCi1TUkNfVVJJW21haW4uc2hhMjU2c3VtXSA9ICI5YTE1
YzEzM2JhMmNmYWZlNzk2NTJmNDgxNWI2MmU3Y2ZjMjY3ZjY4ZGYxYjk0NTRjNmFiMmEzY2E4Yjk2
YTg4IgorU1JDX1VSSVttYWluLnNoYTI1NnN1bV0gPSAiNjJlZTViYzZmYjU1YjhiYWU4ZjcwNWUw
Y2I4ZGY4NmQ2NDUzNjI2YjRlY2Y5MzI3OWUyODY3MDkyZTBiN2Y3MCIKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9nby9nb18xLjIwLjUuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvZ28vZ29fMS4yMC42LmJiCnNpbWlsYXJpdHkgaW5kZXggMTAwJQpyZW5hbWUgZnJvbSBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvZ28vZ29fMS4yMC41LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvZ28vZ29fMS4yMC42LmJiCi0tIAoyLjM5LjIKCg==

--===============6370341318962983992==
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

--===============6370341318962983992==--

