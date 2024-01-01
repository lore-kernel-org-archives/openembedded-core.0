Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34089C48BF0
	for <webhook@archiver.kernel.org>; Mon,  1 Jan 2024 13:12:09 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.4627.1704114719511820484
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jan 2024 05:11:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=gG+JU33X;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=bfqxG+Ow;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018cc5270778-6e6bdea1-beed-4067-baeb-0b957381d8ac-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1704114718;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=fs9v9lTycsI0cv5Duf4sMyi1XXD+QyDskHDKTmhjUUw=;
	b=gG+JU33XTPzUgbVB8cPFm0BpJSAFyiTooQkjCg+yH4+18aBEpD+cCcKjyf9awDp9
	PZHv6429i9v8CD/mOEiKA4Kud7a8HBpIhaqwJrY50ppEtH6g0qXQqCD9JqLhTF6oGGu
	S+MFmpDArL1XaP+x8v/WBuWL04uDwtoDhlYnuxPo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1704114718;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=fs9v9lTycsI0cv5Duf4sMyi1XXD+QyDskHDKTmhjUUw=;
	b=bfqxG+Ow8QjVkz/6URmZsI01qWCc54FvCOXZ/EXyOg3MsPUVIGJ5kTPc/iAwGt6d
	odNKVZDMswzcNNDQv6aOdW1SACb3pbmaimqgTXK3I6C3blRAcz6aVWDZHg6kzFHLRmL
	SmeTT9I+5m00oGEZi8rxlVmqpKBobXTNbT9mVm5A=
Content-Type: multipart/mixed; boundary="===============6038573137649042439=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] update-rc.d: upgrading to
 b8f950105010270a768aa12245d6abf166346015 SUCCEEDED
Message-ID: <0101018cc5270778-6e6bdea1-beed-4067-baeb-0b957381d8ac-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jan 2024 13:11:58 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.01.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jan 2024 13:12:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193112

--===============6038573137649042439==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *update-rc.d* to *b8f950105010270a768aa12245d6abf166346015* has Succeeded.

Next steps:
    - apply the patch: git am 0001-update-rc.d-upgrade-to-latest-revision.patch
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
From c024408c3fce76a8a7e4e4cedfe213eabade3331 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jan 2024 05:42:13 +0000
Subject: [PATCH] update-rc.d: upgrade to latest revision

---
 meta/recipes-core/update-rc.d/update-rc.d_0.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb b/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb
index 043cb3f13e..ba622fe716 100644
--- a/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb
+++ b/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb
@@ -7,7 +7,7 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://update-rc.d;beginline=5;endline=15;md5=d40a07c27f535425934bb5001f2037d9"
 
 SRC_URI = "git://git.yoctoproject.org/update-rc.d;branch=master;protocol=https"
-SRCREV = "8636cf478d426b568c1be11dbd9346f67e03adac"
+SRCREV = "b8f950105010270a768aa12245d6abf166346015"
 
 UPSTREAM_CHECK_COMMITS = "1"
 
-- 
2.42.0


--===============6038573137649042439==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-update-rc.d-upgrade-to-latest-revision.patch"

RnJvbSBjMDI0NDA4YzNmY2U3NmE4YTdlNGU0Y2VkZmUyMTNlYWJhZGUzMzMxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKYW4gMjAyNCAwNTo0MjoxMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHVw
ZGF0ZS1yYy5kOiB1cGdyYWRlIHRvIGxhdGVzdCByZXZpc2lvbgoKLS0tCiBtZXRhL3JlY2lwZXMt
Y29yZS91cGRhdGUtcmMuZC91cGRhdGUtcmMuZF8wLjguYmIgfCAyICstCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtY29yZS91cGRhdGUtcmMuZC91cGRhdGUtcmMuZF8wLjguYmIgYi9tZXRhL3JlY2lwZXMtY29y
ZS91cGRhdGUtcmMuZC91cGRhdGUtcmMuZF8wLjguYmIKaW5kZXggMDQzY2IzZjEzZS4uYmE2MjJm
ZTcxNiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvdXBkYXRlLXJjLmQvdXBkYXRlLXJj
LmRfMC44LmJiCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL3VwZGF0ZS1yYy5kL3VwZGF0ZS1yYy5k
XzAuOC5iYgpAQCAtNyw3ICs3LDcgQEAgTElDRU5TRSA9ICJHUEwtMi4wLW9yLWxhdGVyIgogTElD
X0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vdXBkYXRlLXJjLmQ7YmVnaW5saW5lPTU7ZW5kbGluZT0x
NTttZDU9ZDQwYTA3YzI3ZjUzNTQyNTkzNGJiNTAwMWYyMDM3ZDkiCiAKIFNSQ19VUkkgPSAiZ2l0
Oi8vZ2l0LnlvY3RvcHJvamVjdC5vcmcvdXBkYXRlLXJjLmQ7YnJhbmNoPW1hc3Rlcjtwcm90b2Nv
bD1odHRwcyIKLVNSQ1JFViA9ICI4NjM2Y2Y0NzhkNDI2YjU2OGMxYmUxMWRiZDkzNDZmNjdlMDNh
ZGFjIgorU1JDUkVWID0gImI4Zjk1MDEwNTAxMDI3MGE3NjhhYTEyMjQ1ZDZhYmYxNjYzNDYwMTUi
CiAKIFVQU1RSRUFNX0NIRUNLX0NPTU1JVFMgPSAiMSIKIAotLSAKMi40Mi4wCgo=

--===============6038573137649042439==--

