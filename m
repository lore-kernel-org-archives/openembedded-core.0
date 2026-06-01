Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AA0BCD98D1
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 15:36:03 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1556.1780328132368531067
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 08:35:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Bi11KV+q;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=g/lOh9aH;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019e83d3b961-5fa2736b-980e-4446-ab05-9b2e59792a9f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1780328151;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=qI9JDSBqF6icJjW8AIOE7Y0RzgrbEfF3wWbmHKWUfPA=;
	b=Bi11KV+qCQeFVyMflgdFEb3pRM3SEeKodIjYfBKA6WwdcWTimhNoIFYTEAd8608p
	7b3e11d1posiikgzzerLuNQXqybXrJdcHWdGW43bL8b/MFkyGQ3dGWdyJ3BCDM6VOE/
	B098EjO7bE7Si5CgwajO4BMZZnexNqktVPr8WZ0o=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1780328151;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=qI9JDSBqF6icJjW8AIOE7Y0RzgrbEfF3wWbmHKWUfPA=;
	b=g/lOh9aHJuvKnF9MrOzCjo7L8t+MD65ajy8hoxKPitp9YivdX/dyfQCM6VIMrMKd
	ncT5DAyuk8cDtdkb6miniVEx+XR/mZ3+SuIh9sEuAx/EhjE2GnmL5n26u6zBBhCm+px
	7CMWYcmHSoFnrCx2LFHco/MicWFY6QQwnrNebb2U=
Content-Type: multipart/mixed; boundary="===============6021468125582100500=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-samples: upgrading to
 f5daf09c2514b1bd30ffdf3e12fd6eaf857b69ca SUCCEEDED
Message-ID: <0101019e83d3b961-5fa2736b-980e-4446-ab05-9b2e59792a9f-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jun 2026 15:35:51 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 15:36:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237930

--===============6021468125582100500==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *vulkan-samples* to *f5daf09c2514b1bd30ffdf3e12fd6eaf857b69ca* has Succeeded.

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
From f139f10c366c4b531afce962653cda259136b110 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jun 2026 11:55:37 +0000
Subject: [PATCH] vulkan-samples: upgrade to latest revision

---
 meta/recipes-graphics/vulkan/vulkan-samples_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
index dd7b151aa5..892b9c5889 100644
--- a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
@@ -9,7 +9,7 @@ SRC_URI = "gitsm://github.com/KhronosGroup/Vulkan-Samples.git;branch=main;protoc
            "
 
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "f9b160340bf3066313825c119710c9f51e75edd8"
+SRCREV = "f5daf09c2514b1bd30ffdf3e12fd6eaf857b69ca"
 
 UPSTREAM_CHECK_GITTAGREGEX = "These are not the releases you're looking for"
 
-- 
2.47.1


--===============6021468125582100500==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vulkan-samples-upgrade-to-latest-revision.patch"

RnJvbSBmMTM5ZjEwYzM2NmM0YjUzMWFmY2U5NjI2NTNjZGEyNTkxMzZiMTEwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKdW4gMjAyNiAxMTo1NTozNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHZ1
bGthbi1zYW1wbGVzOiB1cGdyYWRlIHRvIGxhdGVzdCByZXZpc2lvbgoKLS0tCiBtZXRhL3JlY2lw
ZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi1zYW1wbGVzX2dpdC5iYiB8IDIgKy0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1ncmFwaGljcy92dWxrYW4vdnVsa2FuLXNhbXBsZXNfZ2l0LmJiIGIvbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL3Z1bGthbi92dWxrYW4tc2FtcGxlc19naXQuYmIKaW5kZXggZGQ3YjE1MWFh
NS4uODkyYjljNTg4OSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi92
dWxrYW4tc2FtcGxlc19naXQuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi92
dWxrYW4tc2FtcGxlc19naXQuYmIKQEAgLTksNyArOSw3IEBAIFNSQ19VUkkgPSAiZ2l0c206Ly9n
aXRodWIuY29tL0tocm9ub3NHcm91cC9WdWxrYW4tU2FtcGxlcy5naXQ7YnJhbmNoPW1haW47cHJv
dG9jCiAgICAgICAgICAgICIKIAogVVBTVFJFQU1fQ0hFQ0tfQ09NTUlUUyA9ICIxIgotU1JDUkVW
ID0gImY5YjE2MDM0MGJmMzA2NjMxMzgyNWMxMTk3MTBjOWY1MWU3NWVkZDgiCitTUkNSRVYgPSAi
ZjVkYWYwOWMyNTE0YjFiZDMwZmZkZjNlMTJmZDZlYWY4NTdiNjljYSIKIAogVVBTVFJFQU1fQ0hF
Q0tfR0lUVEFHUkVHRVggPSAiVGhlc2UgYXJlIG5vdCB0aGUgcmVsZWFzZXMgeW91J3JlIGxvb2tp
bmcgZm9yIgogCi0tIAoyLjQ3LjEKCg==

--===============6021468125582100500==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 950 .bb files complete (0 cached, 950 parsed). 1975 targets, 62 skipped, 0 masked, 0 errors.

Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: Nothing PROVIDES 'vulkan-samples'
vulkan-samples was skipped: incompatible with host arm-poky-linux-musleabi (not in COMPATIBLE_HOST)

--===============6021468125582100500==--

