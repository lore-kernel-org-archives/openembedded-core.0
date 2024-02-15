Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4045C48BF0
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 17:32:29 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.20192.1708018348856321020
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 09:32:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=PwHKB7UP;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=UznB5+cG;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018dadd3acf6-1ee245f8-1b77-4344-a190-3bcbaa5533d8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1708018347;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=9Ac242MPn16SXbM6ECTSVqMDABWq9oLi1nm5tyNQS5s=;
	b=PwHKB7UPsBiFcTm4ejtQl5T/P7agDkWRBi/3n3ht/cVOxaAWSAhHn3W7D/Ylb4Fl
	gwCsUxri+O1Rnw/7db8kLmon/So8baunz5Dypf6BUCEWPaUxxnhxc1bcm2WoO4Xc9l2
	l1SVPznNNDuPlIY1nyAzJdOGGmsxR5gBeXd3qG5M=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1708018347;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=9Ac242MPn16SXbM6ECTSVqMDABWq9oLi1nm5tyNQS5s=;
	b=UznB5+cGUnZbh3Ka+JwoNfiKewj54+I/RrfEAXW+n8zEoRQr/We8ewx3wO3ymOcA
	5lLq/X/oIhBreB5WedK72DstRPkFzUK2r7BIgOBK+2hJh/xVUl99+ZpP5y8dmAgT6Ye
	l9uHWf3RWjSeB11llGhrB0hY99Oc/br5jaq5jk28=
Content-Type: multipart/mixed; boundary="===============0159372939821240471=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] enchant2: upgrading to 2.6.7 SUCCEEDED
Message-ID: <0101018dadd3acf6-1ee245f8-1b77-4344-a190-3bcbaa5533d8-000000@us-west-2.amazonses.com>
Date: Thu, 15 Feb 2024 17:32:27 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 17:32:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195684

--===============0159372939821240471==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *enchant2* to *2.6.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-enchant2-upgrade-2.6.5-2.6.7.patch
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
From 5a0f2f6fc1ad0d455afaa1d066944946cbfc558f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Feb 2024 16:53:36 +0000
Subject: [PATCH] enchant2: upgrade 2.6.5 -> 2.6.7

---
 .../enchant/{enchant2_2.6.5.bb => enchant2_2.6.7.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/enchant/{enchant2_2.6.5.bb => enchant2_2.6.7.bb} (91%)

diff --git a/meta/recipes-support/enchant/enchant2_2.6.5.bb b/meta/recipes-support/enchant/enchant2_2.6.7.bb
similarity index 91%
rename from meta/recipes-support/enchant/enchant2_2.6.5.bb
rename to meta/recipes-support/enchant/enchant2_2.6.7.bb
index 1d5c716bab..b31bdc422b 100644
--- a/meta/recipes-support/enchant/enchant2_2.6.5.bb
+++ b/meta/recipes-support/enchant/enchant2_2.6.7.bb
@@ -12,7 +12,7 @@ DEPENDS = "glib-2.0 groff-native"
 inherit autotools pkgconfig github-releases
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/enchant-${PV}.tar.gz"
-SRC_URI[sha256sum] = "9e8fd28cb65a7b6da3545878a5c2f52a15f03c04933a5ff48db89fe86845728e"
+SRC_URI[sha256sum] = "a1c2e5b59acca000bbfb24810af4a1165733d407f2154786588e076c8cd57bfc"
 
 GITHUB_BASE_URI = "https://github.com/AbiWord/enchant/releases"
 
-- 
2.42.0


--===============0159372939821240471==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-enchant2-upgrade-2.6.5-2.6.7.patch"

RnJvbSA1YTBmMmY2ZmMxYWQwZDQ1NWFmYWExZDA2Njk0NDk0NmNiZmM1NThmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgRmViIDIwMjQgMTY6NTM6MzYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBl
bmNoYW50MjogdXBncmFkZSAyLjYuNSAtPiAyLjYuNwoKLS0tCiAuLi4vZW5jaGFudC97ZW5jaGFu
dDJfMi42LjUuYmIgPT4gZW5jaGFudDJfMi42LjcuYmJ9ICAgICAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9lbmNoYW50L3tlbmNoYW50Ml8yLjYuNS5iYiA9PiBlbmNoYW50Ml8yLjYu
Ny5iYn0gKDkxJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9lbmNoYW50L2Vu
Y2hhbnQyXzIuNi41LmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZW5jaGFudC9lbmNoYW50Ml8y
LjYuNy5iYgpzaW1pbGFyaXR5IGluZGV4IDkxJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtc3Vw
cG9ydC9lbmNoYW50L2VuY2hhbnQyXzIuNi41LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc3Vw
cG9ydC9lbmNoYW50L2VuY2hhbnQyXzIuNi43LmJiCmluZGV4IDFkNWM3MTZiYWIuLmIzMWJkYzQy
MmIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2VuY2hhbnQvZW5jaGFudDJfMi42
LjUuYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZW5jaGFudC9lbmNoYW50Ml8yLjYuNy5i
YgpAQCAtMTIsNyArMTIsNyBAQCBERVBFTkRTID0gImdsaWItMi4wIGdyb2ZmLW5hdGl2ZSIKIGlu
aGVyaXQgYXV0b3Rvb2xzIHBrZ2NvbmZpZyBnaXRodWItcmVsZWFzZXMKIAogU1JDX1VSSSA9ICIk
e0dJVEhVQl9CQVNFX1VSSX0vZG93bmxvYWQvdiR7UFZ9L2VuY2hhbnQtJHtQVn0udGFyLmd6Igot
U1JDX1VSSVtzaGEyNTZzdW1dID0gIjllOGZkMjhjYjY1YTdiNmRhMzU0NTg3OGE1YzJmNTJhMTVm
MDNjMDQ5MzNhNWZmNDhkYjg5ZmU4Njg0NTcyOGUiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYTFj
MmU1YjU5YWNjYTAwMGJiZmIyNDgxMGFmNGExMTY1NzMzZDQwN2YyMTU0Nzg2NTg4ZTA3NmM4Y2Q1
N2JmYyIKIAogR0lUSFVCX0JBU0VfVVJJID0gImh0dHBzOi8vZ2l0aHViLmNvbS9BYmlXb3JkL2Vu
Y2hhbnQvcmVsZWFzZXMiCiAKLS0gCjIuNDIuMAoK

--===============0159372939821240471==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/enchant2/enchant2-dbg: PKGSIZE changed from 167072 to 168080 (+1%)
packages/core2-64-poky-linux/enchant2/enchant2-dbg: PV changed from "2.6.5" to "2.6.7"
packages/core2-64-poky-linux/enchant2/enchant2-dbg: FILELIST: removed "/usr/lib/.debug/libenchant-2.so.2.6.5", added "/usr/lib/.debug/libenchant-2.so.2.6.7"
packages/core2-64-poky-linux/enchant2/enchant2-dbg: PKGV changed from 2.6.5 [default] to 2.6.7 [default]
packages/core2-64-poky-linux/enchant2/enchant2-dev: PV changed from "2.6.5" to "2.6.7"
packages/core2-64-poky-linux/enchant2/enchant2-dev: PKGV changed from 2.6.5 [default] to 2.6.7 [default]
packages/core2-64-poky-linux/enchant2/enchant2-doc: PKGSIZE changed from 21756 to 22056 (+1%)
packages/core2-64-poky-linux/enchant2/enchant2-doc: PV changed from "2.6.5" to "2.6.7"
packages/core2-64-poky-linux/enchant2/enchant2-doc: PKGV changed from 2.6.5 [default] to 2.6.7 [default]
packages/core2-64-poky-linux/enchant2/enchant2-locale: PV changed from "2.6.5" to "2.6.7"
packages/core2-64-poky-linux/enchant2/enchant2-locale: PKGV changed from 2.6.5 [default] to 2.6.7 [default]
packages/core2-64-poky-linux/enchant2/enchant2-src: PKGSIZE changed from 168111 to 168424 (+0%)
packages/core2-64-poky-linux/enchant2/enchant2-src: PV changed from "2.6.5" to "2.6.7"
packages/core2-64-poky-linux/enchant2/enchant2-src: PKGV changed from 2.6.5 [default] to 2.6.7 [default]
packages/core2-64-poky-linux/enchant2/enchant2-staticdev: PV changed from "2.6.5" to "2.6.7"
packages/core2-64-poky-linux/enchant2/enchant2-staticdev: PKGV changed from 2.6.5 [default] to 2.6.7 [default]
packages/core2-64-poky-linux/enchant2/enchant2: PV changed from "2.6.5" to "2.6.7"
packages/core2-64-poky-linux/enchant2/enchant2: FILELIST: removed "/usr/lib/libenchant-2.so.2.6.5", added "/usr/lib/libenchant-2.so.2.6.7"
packages/core2-64-poky-linux/enchant2/enchant2: PKGV changed from 2.6.5 [default] to 2.6.7 [default]
packages/core2-64-poky-linux/enchant2: PV changed from "2.6.5" to "2.6.7"
packages/core2-64-poky-linux/enchant2: SRC_URI changed from "https://github.com/AbiWord/enchant/releases/download/v2.6.5/enchant-2.6.5.tar.gz" to "https://github.com/AbiWord/enchant/releases/download/v2.6.7/enchant-2.6.7.tar.gz"
packages/core2-64-poky-linux/enchant2: PKGV changed from 2.6.5 [default] to 2.6.7 [default]
Changes to packages/core2-64-poky-linux/enchant2 (sysroot):
  /usr/lib/libenchant-2.so.2 changed symlink target from libenchant-2.so.2.6.5 to libenchant-2.so.2.6.7
  /usr/lib/libenchant-2.so changed symlink target from libenchant-2.so.2.6.5 to libenchant-2.so.2.6.7
  /usr/lib/libenchant-2.so.2.6.5 moved to /usr/lib/libenchant-2.so.2.6.7

--===============0159372939821240471==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/enchant2/enchant2: FILELIST: removed "/usr/lib/libenchant-2.so.2.6.5", added "/usr/lib/libenchant-2.so.2.6.7"
Changes to packages/core2-64-poky-linux/enchant2 (sysroot):
  /usr/lib/libenchant-2.so.2 changed symlink target from libenchant-2.so.2.6.5 to libenchant-2.so.2.6.7
  /usr/lib/libenchant-2.so changed symlink target from libenchant-2.so.2.6.5 to libenchant-2.so.2.6.7
  /usr/lib/libenchant-2.so.2.6.5 moved to /usr/lib/libenchant-2.so.2.6.7

--===============0159372939821240471==--

