Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C203C4829F
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 18:00:15 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.2094.1706810405005668227
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 10:00:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=UfxnJZL9;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=WeY/BIZZ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018d65d3ed35-55f35c81-ed6f-47c5-a3dc-78d48959d320-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1706810404;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=LU9jTMwCdj+6lAJm7rT+QhO+/HCsuk2vlMCaEp83diE=;
	b=UfxnJZL9gsMhSijILQZ5O56YcEMFZCGrGzxQHxiOO2WjCN4LrUvpnir6Kh4WV2pW
	I8oHjr7O4GyDYryS9zVHKPl0lyDyj8ifopmbl8MkGEYiCI3cmgL/sUAG2s5Pmqag807
	nW9V25q75AVzk9ilki4UIQwGlt2dMJcXFHO9fa9g=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1706810404;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=LU9jTMwCdj+6lAJm7rT+QhO+/HCsuk2vlMCaEp83diE=;
	b=WeY/BIZZ/lAPNt6kpAbf16NulDkRjii/t7mHV+7zrX6TZoscCFLheMgRMucwyeDK
	80A7VC28+Fv4KYd6QIdyb67uZ2Ygd9l0Qc9sjwinomcjJH6PQijLfldzFchTP2k3faT
	0espTd2nQ++H3j4kdeBGf9Dfht+naxst31qHQPPw=
Content-Type: multipart/mixed; boundary="===============2429676400807889247=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] update-rc.d: upgrading to
 b8f950105010270a768aa12245d6abf166346015 SUCCEEDED
Message-ID: <0101018d65d3ed35-55f35c81-ed6f-47c5-a3dc-78d48959d320-000000@us-west-2.amazonses.com>
Date: Thu, 1 Feb 2024 18:00:04 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 18:00:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194607

--===============2429676400807889247==
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
From f549e796319d5c4b0ec5b6f27c415bb4a44e1386 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Feb 2024 06:16:50 +0000
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


--===============2429676400807889247==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-update-rc.d-upgrade-to-latest-revision.patch"

RnJvbSBmNTQ5ZTc5NjMxOWQ1YzRiMGVjNWI2ZjI3YzQxNWJiNGE0NGUxMzg2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBGZWIgMjAyNCAwNjoxNjo1MCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHVw
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

--===============2429676400807889247==--

