Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B941D10F6FCB
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 14:36:22 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14639.1775054152486170389
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 07:36:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=BXkb1OQQ;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Ajl7TorI;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019d49793634-2a57dc61-2599-472f-b5dc-a5b2ea9a0ce5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1775054173;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=JH9HXpKg7lKNjx6ZhzRGEVjvSD8W3b35ymTrHo/uRys=;
	b=BXkb1OQQTns0nb8N8mleD3Am4WYuhNbp3bO1VeYNeYE7KmpEP+jQYQy/qjXtgqqX
	74iUEviuV1PARvCRelKBuf2x8j+IeP1GJuLZCEgychVfRTPiyVWyjcJQByGXCrQFSOL
	Ed3HW8iPQkaAvOwM9RLWNCA2witgxuoIKTBAKbv4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1775054173;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=JH9HXpKg7lKNjx6ZhzRGEVjvSD8W3b35ymTrHo/uRys=;
	b=Ajl7TorIMWjG7HFjLyN+ISqOZWP9NRyg99wZfPSocA2t+gQ/k1LOIYkNctB/7rty
	Tf7JlSNGzkyhAw7WxKHN2MvCSXDTyharY6q4as7JjL3CRCajajeHDcYQSfrIiF1Il8t
	1auSDE76kSYx05+sxPE12eIeyuhAUIOMj+D61/8M=
Content-Type: multipart/mixed; boundary="===============0602195030789151682=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-samples: upgrading to
 ac9edc79abaa58dcfc26a9046b185984aa6adbf9 SUCCEEDED
Message-ID: <0101019d49793634-2a57dc61-2599-472f-b5dc-a5b2ea9a0ce5-000000@us-west-2.amazonses.com>
Date: Wed, 1 Apr 2026 14:36:13 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 14:36:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234423

--===============0602195030789151682==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *vulkan-samples* to *ac9edc79abaa58dcfc26a9046b185984aa6adbf9* has Succeeded.

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
From cef5bfb517086eaf4878a59688c9ae773b2b4c55 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Apr 2026 13:38:47 +0000
Subject: [PATCH] vulkan-samples: upgrade to latest revision

---
 meta/recipes-graphics/vulkan/vulkan-samples_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
index 66c034a794..5dc89890a8 100644
--- a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
@@ -9,7 +9,7 @@ SRC_URI = "gitsm://github.com/KhronosGroup/Vulkan-Samples.git;branch=main;protoc
            "
 
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "3abbdf8b5a3bf250f6475f9fe674567b14e9b1ad"
+SRCREV = "ac9edc79abaa58dcfc26a9046b185984aa6adbf9"
 
 UPSTREAM_CHECK_GITTAGREGEX = "These are not the releases you're looking for"
 
-- 
2.47.1


--===============0602195030789151682==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1970 targets, 64 skipped, 0 masked, 0 errors.

Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: Nothing PROVIDES 'vulkan-samples'
vulkan-samples was skipped: incompatible with host arm-poky-linux-musleabi (not in COMPATIBLE_HOST)

--===============0602195030789151682==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/vulkan-samples/vulkan-samples-dbg: PKGSIZE changed from 40254704 to 40680632 (+1%)
packages/x86-64-v3-poky-linux/vulkan-samples/vulkan-samples-dev: PKGSIZE changed from 1523884 to 1524945 (+0%)
packages/x86-64-v3-poky-linux/vulkan-samples/vulkan-samples-src: FILELIST: added "/usr/src/debug/vulkan-samples/git/third_party/spirv-cross/NonSemanticShaderDebugInfo100.h"
packages/x86-64-v3-poky-linux/vulkan-samples/vulkan-samples-src: PKGSIZE changed from 3421892 to 3441464 (+1%)
packages/x86-64-v3-poky-linux/vulkan-samples/vulkan-samples-staticdev: PKGSIZE changed from 64709962 to 65330984 (+1%)
packages/x86-64-v3-poky-linux/vulkan-samples/vulkan-samples: PKGSIZE changed from 3214922 to 3239498 (+1%)

--===============0602195030789151682==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vulkan-samples-upgrade-to-latest-revision.patch"

RnJvbSBjZWY1YmZiNTE3MDg2ZWFmNDg3OGE1OTY4OGM5YWU3NzNiMmI0YzU1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBBcHIgMjAyNiAxMzozODo0NyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHZ1
bGthbi1zYW1wbGVzOiB1cGdyYWRlIHRvIGxhdGVzdCByZXZpc2lvbgoKLS0tCiBtZXRhL3JlY2lw
ZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi1zYW1wbGVzX2dpdC5iYiB8IDIgKy0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1ncmFwaGljcy92dWxrYW4vdnVsa2FuLXNhbXBsZXNfZ2l0LmJiIGIvbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL3Z1bGthbi92dWxrYW4tc2FtcGxlc19naXQuYmIKaW5kZXggNjZjMDM0YTc5
NC4uNWRjODk4OTBhOCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi92
dWxrYW4tc2FtcGxlc19naXQuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi92
dWxrYW4tc2FtcGxlc19naXQuYmIKQEAgLTksNyArOSw3IEBAIFNSQ19VUkkgPSAiZ2l0c206Ly9n
aXRodWIuY29tL0tocm9ub3NHcm91cC9WdWxrYW4tU2FtcGxlcy5naXQ7YnJhbmNoPW1haW47cHJv
dG9jCiAgICAgICAgICAgICIKIAogVVBTVFJFQU1fQ0hFQ0tfQ09NTUlUUyA9ICIxIgotU1JDUkVW
ID0gIjNhYmJkZjhiNWEzYmYyNTBmNjQ3NWY5ZmU2NzQ1NjdiMTRlOWIxYWQiCitTUkNSRVYgPSAi
YWM5ZWRjNzlhYmFhNThkY2ZjMjZhOTA0NmIxODU5ODRhYTZhZGJmOSIKIAogVVBTVFJFQU1fQ0hF
Q0tfR0lUVEFHUkVHRVggPSAiVGhlc2UgYXJlIG5vdCB0aGUgcmVsZWFzZXMgeW91J3JlIGxvb2tp
bmcgZm9yIgogCi0tIAoyLjQ3LjEKCg==

--===============0602195030789151682==--

