Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2BE8C07524
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 14:25:12 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.8485.1698848704000323679
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 07:25:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=SUB7u09t;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=RQJsjCa/;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.29, mailfrom: 0101018b8b460ba9-1c8f00e2-dd89-485f-9c14-98986a1c9316-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1698848705;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=71hYQbVhmJUkSS7yY/eMooHXQNJwTyE/pxlGVzBSb/A=;
	b=SUB7u09t1G7nRBGbhLDG8ozr5qv9Ta6bSuccrcHEIOK/uEl3avbocZ0M6Go0NKlk
	VCUJfOWcQJAK1rSTFCXKyHeD45WQH1UBal+yLjyPEE3Z4k+NXmyrZg/rhFHI69F0eZR
	mGQCCk6ZWxpjn0oNCCtNayG5VDz/5N9e0+FWGzLI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1698848705;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=71hYQbVhmJUkSS7yY/eMooHXQNJwTyE/pxlGVzBSb/A=;
	b=RQJsjCa/7hi/T81Dn/PdyQJaNxhGATTI/xpCFIbDBoJnq5wlmb5HgKq0pNvupocd
	vK/t9Eo9++YVNWM7iBXvD7aqbLMczmIPIa8tB3mhSHc7RA+L75JN2Uo+J8TIHCSNZFf
	nbn86qhfuZSqXL8I6n3AyPBSIMwjz09ZSfiE+myg=
Content-Type: multipart/mixed; boundary="===============9184038031937762574=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Carlos Rafael Giani <crg7475@mailbox.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] kmscube: upgrading to 96d63eb59e34c647cda1cbb489265f8c536ae055
 SUCCEEDED
Message-ID: <0101018b8b460ba9-1c8f00e2-dd89-485f-9c14-98986a1c9316-000000@us-west-2.amazonses.com>
Date: Wed, 1 Nov 2023 14:25:05 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 14:25:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190006

--===============9184038031937762574==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *kmscube* to *96d63eb59e34c647cda1cbb489265f8c536ae055* has Succeeded.

Next steps:
    - apply the patch: git am 0001-kmscube-upgrade-to-latest-revision.patch
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
From 8a412caf41bd2597301dc9f3118bb1000421fb63 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Nov 2023 12:27:29 +0000
Subject: [PATCH] kmscube: upgrade to latest revision

---
 meta/recipes-graphics/kmscube/kmscube_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/kmscube/kmscube_git.bb b/meta/recipes-graphics/kmscube/kmscube_git.bb
index 4cdc0f06bb..aab582281a 100644
--- a/meta/recipes-graphics/kmscube/kmscube_git.bb
+++ b/meta/recipes-graphics/kmscube/kmscube_git.bb
@@ -10,7 +10,7 @@ DEPENDS = "virtual/libgles3 virtual/libgles2 virtual/egl libdrm virtual/libgbm"
 
 LIC_FILES_CHKSUM = "file://kmscube.c;beginline=1;endline=23;md5=8b309d4ee67b7315ff7381270dd631fb"
 
-SRCREV = "ea6c5d1eeefbfb0a1c27ab74a6e4621f1d9adf4c"
+SRCREV = "96d63eb59e34c647cda1cbb489265f8c536ae055"
 SRC_URI = "git://gitlab.freedesktop.org/mesa/kmscube;branch=master;protocol=https"
 
 UPSTREAM_CHECK_COMMITS = "1"
-- 
2.39.2


--===============9184038031937762574==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/kmscube/kmscube-dbg: PKGSIZE changed from 320616 to 351240 (+10%)
packages/core2-64-poky-linux/kmscube/kmscube-src: FILELIST: added "/usr/src/debug/kmscube/git-r0/cube-gears.c"
packages/core2-64-poky-linux/kmscube/kmscube-src: PKGSIZE changed from 4583630 to 4610159 (+1%)
packages/core2-64-poky-linux/kmscube/kmscube: PKGSIZE changed from 1565256 to 1585736 (+1%)

--===============9184038031937762574==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-kmscube-upgrade-to-latest-revision.patch"

RnJvbSA4YTQxMmNhZjQxYmQyNTk3MzAxZGM5ZjMxMThiYjEwMDA0MjFmYjYzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBOb3YgMjAyMyAxMjoyNzoyOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGtt
c2N1YmU6IHVwZ3JhZGUgdG8gbGF0ZXN0IHJldmlzaW9uCgotLS0KIG1ldGEvcmVjaXBlcy1ncmFw
aGljcy9rbXNjdWJlL2ttc2N1YmVfZ2l0LmJiIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL2ttc2N1YmUva21zY3ViZV9naXQuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mva21zY3Vi
ZS9rbXNjdWJlX2dpdC5iYgppbmRleCA0Y2RjMGYwNmJiLi5hYWI1ODIyODFhIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mva21zY3ViZS9rbXNjdWJlX2dpdC5iYgorKysgYi9tZXRh
L3JlY2lwZXMtZ3JhcGhpY3Mva21zY3ViZS9rbXNjdWJlX2dpdC5iYgpAQCAtMTAsNyArMTAsNyBA
QCBERVBFTkRTID0gInZpcnR1YWwvbGliZ2xlczMgdmlydHVhbC9saWJnbGVzMiB2aXJ0dWFsL2Vn
bCBsaWJkcm0gdmlydHVhbC9saWJnYm0iCiAKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL2tt
c2N1YmUuYztiZWdpbmxpbmU9MTtlbmRsaW5lPTIzO21kNT04YjMwOWQ0ZWU2N2I3MzE1ZmY3Mzgx
MjcwZGQ2MzFmYiIKIAotU1JDUkVWID0gImVhNmM1ZDFlZWVmYmZiMGExYzI3YWI3NGE2ZTQ2MjFm
MWQ5YWRmNGMiCitTUkNSRVYgPSAiOTZkNjNlYjU5ZTM0YzY0N2NkYTFjYmI0ODkyNjVmOGM1MzZh
ZTA1NSIKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9tZXNhL2ttc2N1
YmU7YnJhbmNoPW1hc3Rlcjtwcm90b2NvbD1odHRwcyIKIAogVVBTVFJFQU1fQ0hFQ0tfQ09NTUlU
UyA9ICIxIgotLSAKMi4zOS4yCgo=

--===============9184038031937762574==--

