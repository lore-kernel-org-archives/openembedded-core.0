Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F221C531FE
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 18:42:02 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1429.1771440109530067755
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Feb 2026 10:41:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=A6IGZoYw;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=jqCQmqIs;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019c720efc92-2a644a4d-6491-4e40-8256-d47ae154c19a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1771440111;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=tM5t1eYX3SrQxcomEJ0MFj7tDbX59IQ78389ll96F1M=;
	b=A6IGZoYwSBJNoUK057u0CNS6S3iwiRP60BbrymLxEOIrs3AXlG5xevmjsvFyKb3T
	i4Bf8VsLo3lNLph2lZoImcHm3pX6XbVj3WD1jQKZiT2hlhZ7lfyVyvzddDUL2tGQpBl
	b0ySWQ5XKor6DeZdaqjAP3ssQdbxiVSqnWjRuroI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1771440111;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=tM5t1eYX3SrQxcomEJ0MFj7tDbX59IQ78389ll96F1M=;
	b=jqCQmqIsAfC8gxAZOyKN+9qHS25qIFgbxnBMACeuah2QsM6vZl8uVsbQuMF178bW
	4QmbuUfVRieEFHOcQ9Yn6HorLqArH8IrgunviaPGrWGoSuTeE+ZIcPdXb36e/bTKGOH
	t2uGQvVWT8b5O7St2QPvjxe6UWCnwgIKLPWjGvWQ=
Content-Type: multipart/mixed; boundary="===============0585120902805436769=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-samples: upgrading to
 3abbdf8b5a3bf250f6475f9fe674567b14e9b1ad SUCCEEDED
Message-ID: <0101019c720efc92-2a644a4d-6491-4e40-8256-d47ae154c19a-000000@us-west-2.amazonses.com>
Date: Wed, 18 Feb 2026 18:41:50 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.18-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 18:42:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231389

--===============0585120902805436769==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *vulkan-samples* to *3abbdf8b5a3bf250f6475f9fe674567b14e9b1ad* has Succeeded.

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
From 86f7805c0fa9495a49e0f55fbf5114e1455ea34d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 18 Feb 2026 15:46:31 +0000
Subject: [PATCH] vulkan-samples: upgrade to latest revision

---
 meta/recipes-graphics/vulkan/vulkan-samples_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
index 64c7e0908c..66c034a794 100644
--- a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
@@ -9,7 +9,7 @@ SRC_URI = "gitsm://github.com/KhronosGroup/Vulkan-Samples.git;branch=main;protoc
            "
 
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "97fcdeecf2db26a78b432b285af3869a65bb00bd"
+SRCREV = "3abbdf8b5a3bf250f6475f9fe674567b14e9b1ad"
 
 UPSTREAM_CHECK_GITTAGREGEX = "These are not the releases you're looking for"
 
-- 
2.47.1


--===============0585120902805436769==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/vulkan-samples/vulkan-samples-dbg: PKGSIZE changed from 40030496 to 40254648 (+1%)
packages/x86-64-v3-poky-linux/vulkan-samples/vulkan-samples-dev: PKGSIZE changed from 1513553 to 1523884 (+1%)
packages/x86-64-v3-poky-linux/vulkan-samples/vulkan-samples-src: PKGSIZE changed from 3384194 to 3421892 (+1%)
packages/x86-64-v3-poky-linux/vulkan-samples/vulkan-samples-staticdev: PKGSIZE changed from 64301642 to 64709794 (+1%)
packages/x86-64-v3-poky-linux/vulkan-samples/vulkan-samples: PKGSIZE changed from 3182154 to 3214922 (+1%)

--===============0585120902805436769==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 944 .bb files complete (0 cached, 944 parsed). 1953 targets, 64 skipped, 0 masked, 0 errors.

Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: Nothing PROVIDES 'vulkan-samples'
vulkan-samples was skipped: incompatible with host arm-poky-linux-musleabi (not in COMPATIBLE_HOST)

--===============0585120902805436769==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vulkan-samples-upgrade-to-latest-revision.patch"

RnJvbSA4NmY3ODA1YzBmYTk0OTVhNDllMGY1NWZiZjUxMTRlMTQ1NWVhMzRkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTggRmViIDIwMjYgMTU6NDY6MzEgKzAwMDAKU3ViamVjdDogW1BBVENIXSB2
dWxrYW4tc2FtcGxlczogdXBncmFkZSB0byBsYXRlc3QgcmV2aXNpb24KCi0tLQogbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL3Z1bGthbi92dWxrYW4tc2FtcGxlc19naXQuYmIgfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi1zYW1wbGVzX2dpdC5iYiBiL21ldGEvcmVj
aXBlcy1ncmFwaGljcy92dWxrYW4vdnVsa2FuLXNhbXBsZXNfZ2l0LmJiCmluZGV4IDY0YzdlMDkw
OGMuLjY2YzAzNGE3OTQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4v
dnVsa2FuLXNhbXBsZXNfZ2l0LmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4v
dnVsa2FuLXNhbXBsZXNfZ2l0LmJiCkBAIC05LDcgKzksNyBAQCBTUkNfVVJJID0gImdpdHNtOi8v
Z2l0aHViLmNvbS9LaHJvbm9zR3JvdXAvVnVsa2FuLVNhbXBsZXMuZ2l0O2JyYW5jaD1tYWluO3By
b3RvYwogICAgICAgICAgICAiCiAKIFVQU1RSRUFNX0NIRUNLX0NPTU1JVFMgPSAiMSIKLVNSQ1JF
ViA9ICI5N2ZjZGVlY2YyZGIyNmE3OGI0MzJiMjg1YWYzODY5YTY1YmIwMGJkIgorU1JDUkVWID0g
IjNhYmJkZjhiNWEzYmYyNTBmNjQ3NWY5ZmU2NzQ1NjdiMTRlOWIxYWQiCiAKIFVQU1RSRUFNX0NI
RUNLX0dJVFRBR1JFR0VYID0gIlRoZXNlIGFyZSBub3QgdGhlIHJlbGVhc2VzIHlvdSdyZSBsb29r
aW5nIGZvciIKIAotLSAKMi40Ny4xCgo=

--===============0585120902805436769==--

