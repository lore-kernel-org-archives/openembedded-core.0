Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D1D2CDE017
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 16:32:11 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50613.1781195504555509130
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 09:31:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=DiMpJcPT;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=qW4v2mVS;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019eb786ac85-f12d1c0d-ebd0-461a-a92e-a151bcdbe8b2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781195517;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=N+eE9igv7LXmvS837OuhRLQUScW2p6DdcGcq77BDtyk=;
	b=DiMpJcPTrD4p+pJmjGX8lY5kzmWCnYvpNhtNQYodDiwDszh+aewM/5e8kZim6b8r
	1g6hUsFzMY+Xqkty13QPKV4fIyIAZLPUaEanVaVIo74G3j0GYl5adTm9cbjgdlLhHFI
	HYv1ZBH0stCdgpsCVB+sY7Cg+RvH2v1lm7MHoH7Y=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781195517;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=N+eE9igv7LXmvS837OuhRLQUScW2p6DdcGcq77BDtyk=;
	b=qW4v2mVSJ7pC5V4izYRwJDLLAxa8HptOjlJcpasTQgEAzyGFqVlBXwlTuwQROgqG
	dFUHlr6E23zZ+BBiLRRY0DjFMykTLkNeIdtjbTxtsYkZkYewqfIEWI78PpkF+hoZADM
	alkCFPo99496M+gfvyL4J90KGg2oLzNBAV7JDm7s=
Content-Type: multipart/mixed; boundary="===============4503327502050489956=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-samples: upgrading to
 ab1e93d4a5dadf4c804fb6abbbe0b27dfa912b5a SUCCEEDED
Message-ID: <0101019eb786ac85-f12d1c0d-ebd0-461a-a92e-a151bcdbe8b2-000000@us-west-2.amazonses.com>
Date: Thu, 11 Jun 2026 16:31:57 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.11-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 16:32:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238542

--===============4503327502050489956==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *vulkan-samples* to *ab1e93d4a5dadf4c804fb6abbbe0b27dfa912b5a* has Succeeded.

Next steps:
    - apply the patch: git am 0001-vulkan-samples-upgrade-to-latest-revision.patch
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
From 047305d5538effec36dad14d81650bd5c27d9c01 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 11 Jun 2026 12:48:55 +0000
Subject: [PATCH] vulkan-samples: upgrade to latest revision

---
 meta/recipes-graphics/vulkan/vulkan-samples_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
index dd7b151aa5..c7e09b4b7d 100644
--- a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
@@ -9,7 +9,7 @@ SRC_URI = "gitsm://github.com/KhronosGroup/Vulkan-Samples.git;branch=main;protoc
            "
 
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "f9b160340bf3066313825c119710c9f51e75edd8"
+SRCREV = "ab1e93d4a5dadf4c804fb6abbbe0b27dfa912b5a"
 
 UPSTREAM_CHECK_GITTAGREGEX = "These are not the releases you're looking for"
 
-- 
2.47.1


--===============4503327502050489956==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vulkan-samples-upgrade-to-latest-revision.patch"

RnJvbSAwNDczMDVkNTUzOGVmZmVjMzZkYWQxNGQ4MTY1MGJkNWMyN2Q5YzAxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTEgSnVuIDIwMjYgMTI6NDg6NTUgKzAwMDAKU3ViamVjdDogW1BBVENIXSB2
dWxrYW4tc2FtcGxlczogdXBncmFkZSB0byBsYXRlc3QgcmV2aXNpb24KCi0tLQogbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL3Z1bGthbi92dWxrYW4tc2FtcGxlc19naXQuYmIgfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi1zYW1wbGVzX2dpdC5iYiBiL21ldGEvcmVj
aXBlcy1ncmFwaGljcy92dWxrYW4vdnVsa2FuLXNhbXBsZXNfZ2l0LmJiCmluZGV4IGRkN2IxNTFh
YTUuLmM3ZTA5YjRiN2QgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4v
dnVsa2FuLXNhbXBsZXNfZ2l0LmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4v
dnVsa2FuLXNhbXBsZXNfZ2l0LmJiCkBAIC05LDcgKzksNyBAQCBTUkNfVVJJID0gImdpdHNtOi8v
Z2l0aHViLmNvbS9LaHJvbm9zR3JvdXAvVnVsa2FuLVNhbXBsZXMuZ2l0O2JyYW5jaD1tYWluO3By
b3RvYwogICAgICAgICAgICAiCiAKIFVQU1RSRUFNX0NIRUNLX0NPTU1JVFMgPSAiMSIKLVNSQ1JF
ViA9ICJmOWIxNjAzNDBiZjMwNjYzMTM4MjVjMTE5NzEwYzlmNTFlNzVlZGQ4IgorU1JDUkVWID0g
ImFiMWU5M2Q0YTVkYWRmNGM4MDRmYjZhYmJiZTBiMjdkZmE5MTJiNWEiCiAKIFVQU1RSRUFNX0NI
RUNLX0dJVFRBR1JFR0VYID0gIlRoZXNlIGFyZSBub3QgdGhlIHJlbGVhc2VzIHlvdSdyZSBsb29r
aW5nIGZvciIKIAotLSAKMi40Ny4xCgo=

--===============4503327502050489956==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1980 targets, 62 skipped, 0 masked, 0 errors.

Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: Nothing PROVIDES 'vulkan-samples'
vulkan-samples was skipped: incompatible with host arm-poky-linux-musleabi (not in COMPATIBLE_HOST)

--===============4503327502050489956==--

