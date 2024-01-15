Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3CB6C5478B
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 17:34:01 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.88846.1705340029579445291
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 09:33:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=LC9p10XB;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=JpOjl4eD;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018d0e2fc6f0-74e6a8ae-9932-44df-9e0c-373afd2c17d0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1705340028;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ISZ6DZmnXdQDPKYH8W+JslcjvIWck+jmt2pbZLqKOYU=;
	b=LC9p10XBoAcsDcbJ11h/NMnqlUR2CZUwVWjHlpZPOhOXjCIJ4kubvUZ2hydBNG4y
	+NfP62OAx8WfVI6O5xSYGUjsnvaemPys5Omg+mMT4XClKBs2EVNYK0uq0+YAGpdrWlX
	o2Cllbz8087w7b7L88/EYb/8aEKPZKmVv3rYC0q4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1705340028;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ISZ6DZmnXdQDPKYH8W+JslcjvIWck+jmt2pbZLqKOYU=;
	b=JpOjl4eD/7izhG2erfakbaLVD/0+4QkhYc1gxqU+qsJJFdx+yMjCIN7rJMoFV7BF
	P54ZLZ0zaH1PJnpG9RW58F5vHTSL9L5Z05M5GFrxhsIvQZ81XLayNYgyc8bKMKtCBKE
	PG7PvztPmR6Guj6lH5S5gI8U2WB+CyiWXggcqKrk=
Content-Type: multipart/mixed; boundary="===============1254812342299833462=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] update-rc.d: upgrading to
 b8f950105010270a768aa12245d6abf166346015 SUCCEEDED
Message-ID: <0101018d0e2fc6f0-74e6a8ae-9932-44df-9e0c-373afd2c17d0-000000@us-west-2.amazonses.com>
Date: Mon, 15 Jan 2024 17:33:48 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.01.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 17:34:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193704

--===============1254812342299833462==
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
From ad938c49a9e702c73cf66c1e7006e3b9493d7557 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Jan 2024 05:55:06 +0000
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


--===============1254812342299833462==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-update-rc.d-upgrade-to-latest-revision.patch"

RnJvbSBhZDkzOGM0OWE5ZTcwMmM3M2NmNjZjMWU3MDA2ZTNiOTQ5M2Q3NTU3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgSmFuIDIwMjQgMDU6NTU6MDYgKzAwMDAKU3ViamVjdDogW1BBVENIXSB1
cGRhdGUtcmMuZDogdXBncmFkZSB0byBsYXRlc3QgcmV2aXNpb24KCi0tLQogbWV0YS9yZWNpcGVz
LWNvcmUvdXBkYXRlLXJjLmQvdXBkYXRlLXJjLmRfMC44LmJiIHwgMiArLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWNvcmUvdXBkYXRlLXJjLmQvdXBkYXRlLXJjLmRfMC44LmJiIGIvbWV0YS9yZWNpcGVzLWNv
cmUvdXBkYXRlLXJjLmQvdXBkYXRlLXJjLmRfMC44LmJiCmluZGV4IDA0M2NiM2YxM2UuLmJhNjIy
ZmU3MTYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL3VwZGF0ZS1yYy5kL3VwZGF0ZS1y
Yy5kXzAuOC5iYgorKysgYi9tZXRhL3JlY2lwZXMtY29yZS91cGRhdGUtcmMuZC91cGRhdGUtcmMu
ZF8wLjguYmIKQEAgLTcsNyArNyw3IEBAIExJQ0VOU0UgPSAiR1BMLTIuMC1vci1sYXRlciIKIExJ
Q19GSUxFU19DSEtTVU0gPSAiZmlsZTovL3VwZGF0ZS1yYy5kO2JlZ2lubGluZT01O2VuZGxpbmU9
MTU7bWQ1PWQ0MGEwN2MyN2Y1MzU0MjU5MzRiYjUwMDFmMjAzN2Q5IgogCiBTUkNfVVJJID0gImdp
dDovL2dpdC55b2N0b3Byb2plY3Qub3JnL3VwZGF0ZS1yYy5kO2JyYW5jaD1tYXN0ZXI7cHJvdG9j
b2w9aHR0cHMiCi1TUkNSRVYgPSAiODYzNmNmNDc4ZDQyNmI1NjhjMWJlMTFkYmQ5MzQ2ZjY3ZTAz
YWRhYyIKK1NSQ1JFViA9ICJiOGY5NTAxMDUwMTAyNzBhNzY4YWExMjI0NWQ2YWJmMTY2MzQ2MDE1
IgogCiBVUFNUUkVBTV9DSEVDS19DT01NSVRTID0gIjEiCiAKLS0gCjIuNDIuMAoK

--===============1254812342299833462==--

