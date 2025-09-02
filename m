Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35177CA1017
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 21:56:54 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.90003.1756850193856220405
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Sep 2025 14:56:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=2CiXP81t;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=iVAu6Afm;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101990c6eaa97-1da6db79-d151-4b54-86e4-5c12f8e1e14a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1756850203;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=UzbynhksdtQaIYYeCHOkuBkPRQFEktYp1rfsFiUWj7Y=;
	b=2CiXP81tr1PRkQgi8Nk01LbCZsGgkd9CFGcQhcVXGGDDfJL9uVVwGyuvHBieMQoQ
	s5Pb3SZijCXPMljN8MTPMr9PyEr3IMDqXC4pcPfN/nAxTt3EZv7sdQIMdLEofx0BmC9
	tlF9imnqWtXgZghx9MMnb1Cs5FMjOI2Phu2PPZwI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1756850203;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=UzbynhksdtQaIYYeCHOkuBkPRQFEktYp1rfsFiUWj7Y=;
	b=iVAu6AfmU2TKNxTMS4p6Sm2LeP44XRRzW2Zldi7fpRro2LbpHdXmizcJkJpXluCu
	+gmKUtRQ5jNRIqJiZghYvxVfMHPjlnTxZbeDvjmc0mdBwRgwH721NS0w6rz6HPq6SUD
	wiG7WXgZNwVd/LL1wUHT3wk9IzEGdk6EigCNpjUY=
Content-Type: multipart/mixed; boundary="===============6273036155864458275=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] x264: upgrading to b35605ace3ddf7c1a5d67a2eb553f034aef41d55
 SUCCEEDED
Message-ID: <010101990c6eaa97-1da6db79-d151-4b54-86e4-5c12f8e1e14a-000000@us-west-2.amazonses.com>
Date: Tue, 2 Sep 2025 21:56:43 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.09.02-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 21:56:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222823

--===============6273036155864458275==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *x264* to *b35605ace3ddf7c1a5d67a2eb553f034aef41d55* has Succeeded.

Next steps:
    - apply the patch: git am 0001-x264-upgrade-to-latest-revision.patch
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
From 55f5e19890d52d730430f0d3b214ca17d519ec0f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 2 Sep 2025 21:09:35 +0000
Subject: [PATCH] x264: upgrade to latest revision

---
 meta/recipes-multimedia/x264/x264_git.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-multimedia/x264/x264_git.bb b/meta/recipes-multimedia/x264/x264_git.bb
index 3cc3392593..2c5f024eea 100644
--- a/meta/recipes-multimedia/x264/x264_git.bb
+++ b/meta/recipes-multimedia/x264/x264_git.bb
@@ -8,11 +8,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 DEPENDS = "nasm-native"
 
-SRC_URI = "git://code.videolan.org/videolan/x264.git;branch=stable;protocol=https \
-           "
+SRC_URI = "git://code.videolan.org/videolan/x264.git;branch=master;protocol=https"
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRCREV = "31e19f92f00c7003fa115047ce50978bc98c3a0d"
+SRCREV = "b35605ace3ddf7c1a5d67a2eb553f034aef41d55"
 
 PV = "r3039+git"
 
-- 
2.47.1


--===============6273036155864458275==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-x264-upgrade-to-latest-revision.patch"

RnJvbSA1NWY1ZTE5ODkwZDUyZDczMDQzMGYwZDNiMjE0Y2ExN2Q1MTllYzBmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMiBTZXAgMjAyNSAyMTowOTozNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHgy
NjQ6IHVwZ3JhZGUgdG8gbGF0ZXN0IHJldmlzaW9uCgotLS0KIG1ldGEvcmVjaXBlcy1tdWx0aW1l
ZGlhL3gyNjQveDI2NF9naXQuYmIgfCA1ICsrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1l
ZGlhL3gyNjQveDI2NF9naXQuYmIgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS94MjY0L3gyNjRf
Z2l0LmJiCmluZGV4IDNjYzMzOTI1OTMuLjJjNWYwMjRlZWEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1tdWx0aW1lZGlhL3gyNjQveDI2NF9naXQuYmIKKysrIGIvbWV0YS9yZWNpcGVzLW11bHRp
bWVkaWEveDI2NC94MjY0X2dpdC5iYgpAQCAtOCwxMSArOCwxMCBAQCBMSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9DT1BZSU5HO21kNT05NGQ1NWQ1MTJhOWJhMzZjYWE5YjdkZjA3OWJhZTE5ZiIK
IAogREVQRU5EUyA9ICJuYXNtLW5hdGl2ZSIKIAotU1JDX1VSSSA9ICJnaXQ6Ly9jb2RlLnZpZGVv
bGFuLm9yZy92aWRlb2xhbi94MjY0LmdpdDticmFuY2g9c3RhYmxlO3Byb3RvY29sPWh0dHBzIFwK
LSAgICAgICAgICAgIgorU1JDX1VSSSA9ICJnaXQ6Ly9jb2RlLnZpZGVvbGFuLm9yZy92aWRlb2xh
bi94MjY0LmdpdDticmFuY2g9bWFzdGVyO3Byb3RvY29sPWh0dHBzIgogVVBTVFJFQU1fQ0hFQ0tf
Q09NTUlUUyA9ICIxIgogCi1TUkNSRVYgPSAiMzFlMTlmOTJmMDBjNzAwM2ZhMTE1MDQ3Y2U1MDk3
OGJjOThjM2EwZCIKK1NSQ1JFViA9ICJiMzU2MDVhY2UzZGRmN2MxYTVkNjdhMmViNTUzZjAzNGFl
ZjQxZDU1IgogCiBQViA9ICJyMzAzOStnaXQiCiAKLS0gCjIuNDcuMQoK

--===============6273036155864458275==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/x264: SRC_URI changed from "git://code.videolan.org/videolan/x264.git;branch=stable;protocol=https" to "git://code.videolan.org/videolan/x264.git;branch=master;protocol=https"
Changes to packages/x86-64-v3-poky-linux/x264 (sysroot):
  /usr/lib/libx264.so changed symlink target from libx264.so.164 to libx264.so.165
  /usr/lib/libx264.so.164 moved to /usr/lib/libx264.so.165
packages/x86-64-v3-poky-linux/x264/x264-bin: PKGV changed from r3039+git0+31e19f92f0 to r3039+git0+b35605ace3
packages/x86-64-v3-poky-linux/x264/x264-dbg: FILELIST: removed "/usr/lib/.debug/libx264.so.164", added "/usr/lib/.debug/libx264.so.165"
packages/x86-64-v3-poky-linux/x264/x264-dbg: PKGV changed from r3039+git0+31e19f92f0 to r3039+git0+b35605ace3
packages/x86-64-v3-poky-linux/x264/x264-dbg: PKGSIZE changed from 12732640 to 12731712 (-0%)
packages/x86-64-v3-poky-linux/x264/x264-dev: PKGV changed from r3039+git0+31e19f92f0 to r3039+git0+b35605ace3
packages/x86-64-v3-poky-linux/x264/x264-dev: PKGSIZE changed from 49168 to 49574 (+1%)
packages/x86-64-v3-poky-linux/x264/x264-doc: PKGV changed from r3039+git0+31e19f92f0 to r3039+git0+b35605ace3
packages/x86-64-v3-poky-linux/x264/x264-locale: PKGV changed from r3039+git0+31e19f92f0 to r3039+git0+b35605ace3
packages/x86-64-v3-poky-linux/x264/x264-src: PKGV changed from r3039+git0+31e19f92f0 to r3039+git0+b35605ace3
packages/x86-64-v3-poky-linux/x264/x264-src: PKGSIZE changed from 2228009 to 2246041 (+1%)
packages/x86-64-v3-poky-linux/x264/x264-staticdev: PKGV changed from r3039+git0+31e19f92f0 to r3039+git0+b35605ace3
packages/x86-64-v3-poky-linux/x264/x264-staticdev: PKGSIZE changed from 10464066 to 10468890 (+0%)
packages/x86-64-v3-poky-linux/x264/x264: PKG changed from libx264-164 to libx264-165
packages/x86-64-v3-poky-linux/x264/x264: FILELIST: removed "/usr/lib/libx264.so.164", added "/usr/lib/libx264.so.165"
packages/x86-64-v3-poky-linux/x264/x264: PKGV changed from r3039+git0+31e19f92f0 to r3039+git0+b35605ace3

--===============6273036155864458275==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/x86-64-v3-poky-linux/x264 (sysroot):
  /usr/lib/libx264.so changed symlink target from libx264.so.164 to libx264.so.165
  /usr/lib/libx264.so.164 moved to /usr/lib/libx264.so.165
packages/x86-64-v3-poky-linux/x264/x264-bin: PKGV changed from r3039+git0+31e19f92f0 to r3039+git0+b35605ace3
packages/x86-64-v3-poky-linux/x264/x264-dbg: PKGV changed from r3039+git0+31e19f92f0 to r3039+git0+b35605ace3
packages/x86-64-v3-poky-linux/x264/x264-dev: PKGV changed from r3039+git0+31e19f92f0 to r3039+git0+b35605ace3
packages/x86-64-v3-poky-linux/x264/x264-doc: PKGV changed from r3039+git0+31e19f92f0 to r3039+git0+b35605ace3
packages/x86-64-v3-poky-linux/x264/x264-locale: PKGV changed from r3039+git0+31e19f92f0 to r3039+git0+b35605ace3
packages/x86-64-v3-poky-linux/x264/x264-src: PKGV changed from r3039+git0+31e19f92f0 to r3039+git0+b35605ace3
packages/x86-64-v3-poky-linux/x264/x264-staticdev: PKGV changed from r3039+git0+31e19f92f0 to r3039+git0+b35605ace3
packages/x86-64-v3-poky-linux/x264/x264: PKG changed from libx264-164 to libx264-165
packages/x86-64-v3-poky-linux/x264/x264: PKGV changed from r3039+git0+31e19f92f0 to r3039+git0+b35605ace3
packages/x86-64-v3-poky-linux/x264/x264: FILELIST: removed "/usr/lib/libx264.so.164", added "/usr/lib/libx264.so.165"

--===============6273036155864458275==--

