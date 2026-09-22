Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BE3BC98309
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 05:42:17 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3733.1790055734317144245
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2026 22:42:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=bIRByJK0;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ix+hX6Qn;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101a0c7a2d915-6ae84e41-bea4-4858-87da-393d17514d6c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1790055733;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=9di2DQ/JaSFGbrol2fRI+/6w/jVBZOBNCPN71b1TDCE=;
	b=bIRByJK0APA5B5sPMRfEjVtCxhPseRGS612o4HqbnEvmKagvImY/0mtyRLMRmuFO
	0CY5ij1jmnE9uongN2AzDO8WIFkj6Oj97J+zfDyGvOu7Roo3V+WsB94gUkibbUz+OWg
	He8Vcyt37l0WjP9OWaD3wvJ9WQOROxmnBNWD6ZZc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1790055733;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=9di2DQ/JaSFGbrol2fRI+/6w/jVBZOBNCPN71b1TDCE=;
	b=ix+hX6QnAjM2hCqMwQg0L3ax5SN46FGLC7Vac4aAt0k6g3j1uZRKtFNCJ/LQC9oo
	nFP+FIpfX4iQuqkcCz5VPnHW/M7Ut15r4aU77Frnp5FWD6zwniaWyBMxobOKGSR6/8i
	+K+jcgueyEYDd2rgC9CnBd4z3figL9zSpL8gsZ0c=
Content-Type: multipart/mixed; boundary="===============4422706373014896556=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] libsolv: upgrading to 0.7.40 SUCCEEDED
Message-ID: <010101a0c7a2d915-6ae84e41-bea4-4858-87da-393d17514d6c-000000@us-west-2.amazonses.com>
Date: Tue, 22 Sep 2026 05:42:13 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.22-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 05:42:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246372

--===============4422706373014896556==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libsolv* to *0.7.40* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libsolv-upgrade-0.7.39-0.7.40.patch
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
From e7fff434f105fdd9c27d4dbcf53464c32438a714 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 22 Sep 2026 05:37:00 +0000
Subject: [PATCH] libsolv: upgrade 0.7.39 -> 0.7.40

Version 0.7.40
- selected bug fixes:
---
 .../libsolv/{libsolv_0.7.39.bb => libsolv_0.7.40.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/libsolv/{libsolv_0.7.39.bb => libsolv_0.7.40.bb} (96%)

diff --git a/meta/recipes-extended/libsolv/libsolv_0.7.39.bb b/meta/recipes-extended/libsolv/libsolv_0.7.40.bb
similarity index 96%
rename from meta/recipes-extended/libsolv/libsolv_0.7.39.bb
rename to meta/recipes-extended/libsolv/libsolv_0.7.40.bb
index 48fa03eb70..bd2e26e03d 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.7.39.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.7.40.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://github.com/openSUSE/libsolv.git;branch=master;protocol=https;ta
            file://run-ptest \
 "
 
-SRCREV = "2f58c6f86edd978d6bdbd87dce9c85388e9b9dcc"
+SRCREV = "0e6eea45c9ffc7dd0756060f2b0f5527df02efa7"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
-- 
2.47.1


--===============4422706373014896556==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libsolv-upgrade-0.7.39-0.7.40.patch"

RnJvbSBlN2ZmZjQzNGYxMDVmZGQ5YzI3ZDRkYmNmNTM0NjRjMzI0MzhhNzE0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMjIgU2VwIDIwMjYgMDU6Mzc6MDAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJzb2x2OiB1cGdyYWRlIDAuNy4zOSAtPiAwLjcuNDAKClZlcnNpb24gMC43LjQwCi0gc2VsZWN0
ZWQgYnVnIGZpeGVzOgotLS0KIC4uLi9saWJzb2x2L3tsaWJzb2x2XzAuNy4zOS5iYiA9PiBsaWJz
b2x2XzAuNy40MC5iYn0gICAgICAgICAgICB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9saWJz
b2x2L3tsaWJzb2x2XzAuNy4zOS5iYiA9PiBsaWJzb2x2XzAuNy40MC5iYn0gKDk2JSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGlic29sdi9saWJzb2x2XzAuNy4zOS5iYiBi
L21ldGEvcmVjaXBlcy1leHRlbmRlZC9saWJzb2x2L2xpYnNvbHZfMC43LjQwLmJiCnNpbWlsYXJp
dHkgaW5kZXggOTYlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9saWJzb2x2L2xp
YnNvbHZfMC43LjM5LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGlic29sdi9s
aWJzb2x2XzAuNy40MC5iYgppbmRleCA0OGZhMDNlYjcwLi5iZDJlMjZlMDNkIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGlic29sdi9saWJzb2x2XzAuNy4zOS5iYgorKysgYi9t
ZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGlic29sdi9saWJzb2x2XzAuNy40MC5iYgpAQCAtMTIsNyAr
MTIsNyBAQCBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vb3BlblNVU0UvbGlic29sdi5naXQ7
YnJhbmNoPW1hc3Rlcjtwcm90b2NvbD1odHRwczt0YQogICAgICAgICAgICBmaWxlOi8vcnVuLXB0
ZXN0IFwKICIKIAotU1JDUkVWID0gIjJmNThjNmY4NmVkZDk3OGQ2YmRiZDg3ZGNlOWM4NTM4OGU5
YjlkY2MiCitTUkNSRVYgPSAiMGU2ZWVhNDVjOWZmYzdkZDA3NTYwNjBmMmIwZjU1MjdkZjAyZWZh
NyIKIAogVVBTVFJFQU1fQ0hFQ0tfR0lUVEFHUkVHRVggPSAiKD9QPHB2ZXI+XGQrKFwuXGQrKSsp
IgogCi0tIAoyLjQ3LjEKCg==

--===============4422706373014896556==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libsolv: PV changed from "0.7.39" to "0.7.40"
packages/x86-64-v3-poky-linux/libsolv: SRC_URI changed from "git://github.com/openSUSE/libsolv.git;branch=master;protocol=https;tag=0.7.39 file://run-ptest" to "git://github.com/openSUSE/libsolv.git;branch=master;protocol=https;tag=0.7.40 file://run-ptest"
packages/x86-64-v3-poky-linux/libsolv: PKGV changed from 0.7.39 [default] to 0.7.40 [default]
packages/x86-64-v3-poky-linux/libsolv/libsolv-dbg: PV changed from "0.7.39" to "0.7.40"
packages/x86-64-v3-poky-linux/libsolv/libsolv-dbg: PKGV changed from 0.7.39 [default] to 0.7.40 [default]
packages/x86-64-v3-poky-linux/libsolv/libsolv-dbg: PKGSIZE changed from 3127416 to 3127656 (+0%)
packages/x86-64-v3-poky-linux/libsolv/libsolv-dev: PV changed from "0.7.39" to "0.7.40"
packages/x86-64-v3-poky-linux/libsolv/libsolv-dev: PKGV changed from 0.7.39 [default] to 0.7.40 [default]
packages/x86-64-v3-poky-linux/libsolv/libsolv-dev: PKGSIZE changed from 131588 to 131532 (-0%)
packages/x86-64-v3-poky-linux/libsolv/libsolv-doc: PV changed from "0.7.39" to "0.7.40"
packages/x86-64-v3-poky-linux/libsolv/libsolv-doc: PKGV changed from 0.7.39 [default] to 0.7.40 [default]
packages/x86-64-v3-poky-linux/libsolv/libsolv-locale: PV changed from "0.7.39" to "0.7.40"
packages/x86-64-v3-poky-linux/libsolv/libsolv-locale: PKGV changed from 0.7.39 [default] to 0.7.40 [default]
packages/x86-64-v3-poky-linux/libsolv/libsolv-ptest: PV changed from "0.7.39" to "0.7.40"
packages/x86-64-v3-poky-linux/libsolv/libsolv-ptest: PKGV changed from 0.7.39 [default] to 0.7.40 [default]
packages/x86-64-v3-poky-linux/libsolv/libsolv-src: PV changed from "0.7.39" to "0.7.40"
packages/x86-64-v3-poky-linux/libsolv/libsolv-src: FILELIST: directory renamed /usr/src/debug/libsolv/0.7.39/ext -> /usr/src/debug/libsolv/0.7.40/ext, directory renamed /usr/src/debug/libsolv/0.7.39/tools -> /usr/src/debug/libsolv/0.7.40/tools, directory renamed /usr/src/debug/libsolv/0.7.39/src -> /usr/src/debug/libsolv/0.7.40/src
packages/x86-64-v3-poky-linux/libsolv/libsolv-src: PKGV changed from 0.7.39 [default] to 0.7.40 [default]
packages/x86-64-v3-poky-linux/libsolv/libsolv-src: PKGSIZE changed from 1680644 to 1680650 (+0%)
packages/x86-64-v3-poky-linux/libsolv/libsolv-staticdev: PV changed from "0.7.39" to "0.7.40"
packages/x86-64-v3-poky-linux/libsolv/libsolv-staticdev: PKGV changed from 0.7.39 [default] to 0.7.40 [default]
packages/x86-64-v3-poky-linux/libsolv/libsolv-staticdev: PKGSIZE changed from 4586234 to 4586578 (+0%)
packages/x86-64-v3-poky-linux/libsolv/libsolv-tools: PV changed from "0.7.39" to "0.7.40"
packages/x86-64-v3-poky-linux/libsolv/libsolv-tools: PKGV changed from 0.7.39 [default] to 0.7.40 [default]
packages/x86-64-v3-poky-linux/libsolv/libsolv: PV changed from "0.7.39" to "0.7.40"
packages/x86-64-v3-poky-linux/libsolv/libsolv: PKGV changed from 0.7.39 [default] to 0.7.40 [default]
packages/x86-64-v3-poky-linux/libsolv/libsolvext: PV changed from "0.7.39" to "0.7.40"
packages/x86-64-v3-poky-linux/libsolv/libsolvext: PKGV changed from 0.7.39 [default] to 0.7.40 [default]

--===============4422706373014896556==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="libsolv-changelog.txt"

Version 0.7.40
- selected bug fixes:

--===============4422706373014896556==--

