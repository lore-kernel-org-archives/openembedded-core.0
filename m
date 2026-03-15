Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52012F013DB
	for <webhook@archiver.kernel.org>; Sun, 15 Mar 2026 13:42:11 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28965.1773582112022947695
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Mar 2026 06:42:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=WLXfy0WZ;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=XdJz/Ona;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019cf1bb866e-fd8af9a2-61dd-468e-ace5-b1315ecd091a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1773582124;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=VD9OGgeRAlrkxgxw+Frg0J1I/7V/6nBg4dzjkFzvfuQ=;
	b=WLXfy0WZDRNy1DmuPiJsTuA35mmby2InxmS8h2fzJNFpYwrzE61w75a6twrqc93c
	PoyR0oNOKYQN9SKr0g3S8fTzzxmtRcDdGDW4tvPXP+q53NheX926w7/3B2miya4JCSv
	Gijgt0NI123hJ/SKQHqnvoRr29dcpQIdOb/MYD+k=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1773582124;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=VD9OGgeRAlrkxgxw+Frg0J1I/7V/6nBg4dzjkFzvfuQ=;
	b=XdJz/OnaJPdyuvBH1Z3co/gSetlD5yPbMMCMWCrfmwKZYqVQ3VunsdT5e/smdC0f
	pn1dudlZvArNRrilxjAR0vOpyqrP7zrztekO7NO2l9tsg0L8vXb2xZGz/m3leV5XhEc
	X7I/Xd5ZO9n0yQV0ajn5+MwiPXmafsT/8GSAVAgQ=
Content-Type: multipart/mixed; boundary="===============1831419845987017391=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-samples: upgrading to
 c1b3c2dd0a0199b8fb9473da9f8d8c6d4d562f62 SUCCEEDED
Message-ID: <0101019cf1bb866e-fd8af9a2-61dd-468e-ace5-b1315ecd091a-000000@us-west-2.amazonses.com>
Date: Sun, 15 Mar 2026 13:42:04 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.03.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Mar 2026 13:42:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233175

--===============1831419845987017391==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *vulkan-samples* to *c1b3c2dd0a0199b8fb9473da9f8d8c6d4d562f62* has Succeeded.

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
From 1b76294f6d3656dcf443f30e146063b23d59f11a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Mar 2026 10:54:42 +0000
Subject: [PATCH] vulkan-samples: upgrade to latest revision

---
 meta/recipes-graphics/vulkan/vulkan-samples_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
index 66c034a794..71664e4c36 100644
--- a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
@@ -9,7 +9,7 @@ SRC_URI = "gitsm://github.com/KhronosGroup/Vulkan-Samples.git;branch=main;protoc
            "
 
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "3abbdf8b5a3bf250f6475f9fe674567b14e9b1ad"
+SRCREV = "c1b3c2dd0a0199b8fb9473da9f8d8c6d4d562f62"
 
 UPSTREAM_CHECK_GITTAGREGEX = "These are not the releases you're looking for"
 
-- 
2.47.1


--===============1831419845987017391==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vulkan-samples-upgrade-to-latest-revision.patch"

RnJvbSAxYjc2Mjk0ZjZkMzY1NmRjZjQ0M2YzMGUxNDYwNjNiMjNkNTlmMTFhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgTWFyIDIwMjYgMTA6NTQ6NDIgKzAwMDAKU3ViamVjdDogW1BBVENIXSB2
dWxrYW4tc2FtcGxlczogdXBncmFkZSB0byBsYXRlc3QgcmV2aXNpb24KCi0tLQogbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL3Z1bGthbi92dWxrYW4tc2FtcGxlc19naXQuYmIgfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi1zYW1wbGVzX2dpdC5iYiBiL21ldGEvcmVj
aXBlcy1ncmFwaGljcy92dWxrYW4vdnVsa2FuLXNhbXBsZXNfZ2l0LmJiCmluZGV4IDY2YzAzNGE3
OTQuLjcxNjY0ZTRjMzYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4v
dnVsa2FuLXNhbXBsZXNfZ2l0LmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4v
dnVsa2FuLXNhbXBsZXNfZ2l0LmJiCkBAIC05LDcgKzksNyBAQCBTUkNfVVJJID0gImdpdHNtOi8v
Z2l0aHViLmNvbS9LaHJvbm9zR3JvdXAvVnVsa2FuLVNhbXBsZXMuZ2l0O2JyYW5jaD1tYWluO3By
b3RvYwogICAgICAgICAgICAiCiAKIFVQU1RSRUFNX0NIRUNLX0NPTU1JVFMgPSAiMSIKLVNSQ1JF
ViA9ICIzYWJiZGY4YjVhM2JmMjUwZjY0NzVmOWZlNjc0NTY3YjE0ZTliMWFkIgorU1JDUkVWID0g
ImMxYjNjMmRkMGEwMTk5YjhmYjk0NzNkYTlmOGQ4YzZkNGQ1NjJmNjIiCiAKIFVQU1RSRUFNX0NI
RUNLX0dJVFRBR1JFR0VYID0gIlRoZXNlIGFyZSBub3QgdGhlIHJlbGVhc2VzIHlvdSdyZSBsb29r
aW5nIGZvciIKIAotLSAKMi40Ny4xCgo=

--===============1831419845987017391==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/vulkan-samples/vulkan-samples-dbg: PKGSIZE changed from 40254704 to 40680632 (+1%)
packages/x86-64-v3-poky-linux/vulkan-samples/vulkan-samples-dev: PKGSIZE changed from 1523884 to 1524945 (+0%)
packages/x86-64-v3-poky-linux/vulkan-samples/vulkan-samples-src: PKGSIZE changed from 3421892 to 3441464 (+1%)
packages/x86-64-v3-poky-linux/vulkan-samples/vulkan-samples-src: FILELIST: added "/usr/src/debug/vulkan-samples/git/third_party/spirv-cross/NonSemanticShaderDebugInfo100.h"
packages/x86-64-v3-poky-linux/vulkan-samples/vulkan-samples-staticdev: PKGSIZE changed from 64709962 to 65330984 (+1%)
packages/x86-64-v3-poky-linux/vulkan-samples/vulkan-samples: PKGSIZE changed from 3214922 to 3239498 (+1%)

--===============1831419845987017391==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 950 .bb files complete (0 cached, 950 parsed). 1971 targets, 64 skipped, 0 masked, 0 errors.

Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: Nothing PROVIDES 'vulkan-samples'
vulkan-samples was skipped: incompatible with host arm-poky-linux-musleabi (not in COMPATIBLE_HOST)

--===============1831419845987017391==--

