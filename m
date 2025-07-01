Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D302FC83F09
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 16:20:11 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.1436.1751386811025648976
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 09:20:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=s3McKGrI;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=oQhMBf/l;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010197c6c9e797-1eb44c38-eeed-4196-9250-428c6930f898-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1751386810;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=oUTPnBOir+kRzsx9yeiYiis5SC2PMIrouD0UrGOWGe8=;
	b=s3McKGrIn3bHcL4k1xXPJta/FOelNON0dBup8WVCxlgrQun6DDhkVxMyweiVLZUV
	fJ1z5QdFce/9mxfk7c9KAqwFVm3QlhtsCcwFWR+4fOyx9K+DyL+l6BMxVRMyk5m6AGG
	D9T2akzj5m94G8Q602kEAO/h5u33jZQctYXgeD20=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1751386810;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=oUTPnBOir+kRzsx9yeiYiis5SC2PMIrouD0UrGOWGe8=;
	b=oQhMBf/l9VeXtOhpHo8CVJrf7mo4HTRs3ZJ251kl3XjSZEwxriCGWiz8EotAhtN4
	goCOCAeQByBjhiqB0ZzBoS3r5Tuh3RBBGii34KUL40Y2iPGIeO2x90Rzji0eDevxhq+
	A/l5yqdY2y5WiiVeScy7tGfnNT1Ileb8JWkBsR9o=
Content-Type: multipart/mixed; boundary="===============4907293760783414238=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] libmodulemd: upgrading to 2.15.2 SUCCEEDED
Message-ID: <01010197c6c9e797-1eb44c38-eeed-4196-9250-428c6930f898-000000@us-west-2.amazonses.com>
Date: Tue, 1 Jul 2025 16:20:10 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 16:20:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219623

--===============4907293760783414238==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libmodulemd* to *2.15.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libmodulemd-upgrade-2.15.1-2.15.2.patch
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
From ea7a741d57a5d25c52f210154f4f79d27807f61f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Jul 2025 08:26:56 +0000
Subject: [PATCH] libmodulemd: upgrade 2.15.1 -> 2.15.2

---
 .../{libmodulemd_2.15.1.bb => libmodulemd_2.15.2.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/libmodulemd/{libmodulemd_2.15.1.bb => libmodulemd_2.15.2.bb} (93%)

diff --git a/meta/recipes-devtools/libmodulemd/libmodulemd_2.15.1.bb b/meta/recipes-devtools/libmodulemd/libmodulemd_2.15.2.bb
similarity index 93%
rename from meta/recipes-devtools/libmodulemd/libmodulemd_2.15.1.bb
rename to meta/recipes-devtools/libmodulemd/libmodulemd_2.15.2.bb
index 6504414387..0636f8c15b 100644
--- a/meta/recipes-devtools/libmodulemd/libmodulemd_2.15.1.bb
+++ b/meta/recipes-devtools/libmodulemd/libmodulemd_2.15.2.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=25a3927bff3ee4f5b21bcb0ed3fcd6bb"
 
 SRC_URI = "git://github.com/fedora-modularity/libmodulemd;protocol=https;branch=main"
 
-SRCREV = "e7f179eeeb6eee1403f090fc43a3c80bb08b5bfd"
+SRCREV = "b8b11b4dafaa2c4d73883152bfa7e5bd81cd7395"
 
 inherit meson gobject-introspection pkgconfig manpages
 
-- 
2.47.1


--===============4907293760783414238==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/libmodulemd/libmodulemd: FILELIST: removed "/usr/lib/libmodulemd.so.2.15.1", added "/usr/lib/libmodulemd.so.2.15.2"
Changes to packages/core2-64-poky-linux/libmodulemd (sysroot):
  /usr/lib/libmodulemd.so.2 changed symlink target from libmodulemd.so.2.15.1 to libmodulemd.so.2.15.2
  /usr/lib/libmodulemd.so.2.15.1 moved to /usr/lib/libmodulemd.so.2.15.2

--===============4907293760783414238==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libmodulemd-upgrade-2.15.1-2.15.2.patch"

RnJvbSBlYTdhNzQxZDU3YTVkMjVjNTJmMjEwMTU0ZjRmNzlkMjc4MDdmNjFmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBKdWwgMjAyNSAwODoyNjo1NiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
Ym1vZHVsZW1kOiB1cGdyYWRlIDIuMTUuMSAtPiAyLjE1LjIKCi0tLQogLi4uL3tsaWJtb2R1bGVt
ZF8yLjE1LjEuYmIgPT4gbGlibW9kdWxlbWRfMi4xNS4yLmJifSAgICAgICAgICAgIHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWRldnRvb2xzL2xpYm1vZHVsZW1kL3tsaWJtb2R1bGVtZF8yLjE1LjEuYmIgPT4g
bGlibW9kdWxlbWRfMi4xNS4yLmJifSAoOTMlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9saWJtb2R1bGVtZC9saWJtb2R1bGVtZF8yLjE1LjEuYmIgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvbGlibW9kdWxlbWQvbGlibW9kdWxlbWRfMi4xNS4yLmJiCnNpbWlsYXJpdHkgaW5k
ZXggOTMlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9saWJtb2R1bGVtZC9saWJt
b2R1bGVtZF8yLjE1LjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9saWJtb2R1
bGVtZC9saWJtb2R1bGVtZF8yLjE1LjIuYmIKaW5kZXggNjUwNDQxNDM4Ny4uMDYzNmY4YzE1YiAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2xpYm1vZHVsZW1kL2xpYm1vZHVsZW1k
XzIuMTUuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGlibW9kdWxlbWQvbGlibW9k
dWxlbWRfMi4xNS4yLmJiCkBAIC02LDcgKzYsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6
Ly9DT1BZSU5HO21kNT0yNWEzOTI3YmZmM2VlNGY1YjIxYmNiMGVkM2ZjZDZiYiIKIAogU1JDX1VS
SSA9ICJnaXQ6Ly9naXRodWIuY29tL2ZlZG9yYS1tb2R1bGFyaXR5L2xpYm1vZHVsZW1kO3Byb3Rv
Y29sPWh0dHBzO2JyYW5jaD1tYWluIgogCi1TUkNSRVYgPSAiZTdmMTc5ZWVlYjZlZWUxNDAzZjA5
MGZjNDNhM2M4MGJiMDhiNWJmZCIKK1NSQ1JFViA9ICJiOGIxMWI0ZGFmYWEyYzRkNzM4ODMxNTJi
ZmE3ZTViZDgxY2Q3Mzk1IgogCiBpbmhlcml0IG1lc29uIGdvYmplY3QtaW50cm9zcGVjdGlvbiBw
a2djb25maWcgbWFucGFnZXMKIAotLSAKMi40Ny4xCgo=

--===============4907293760783414238==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libmodulemd: PKGV changed from 2.15.1 [default] to 2.15.2 [default]
packages/core2-64-poky-linux/libmodulemd: PV changed from "2.15.1" to "2.15.2"
packages/core2-64-poky-linux/libmodulemd/libmodulemd-dbg: PKGV changed from 2.15.1 [default] to 2.15.2 [default]
packages/core2-64-poky-linux/libmodulemd/libmodulemd-dbg: FILELIST: removed "/usr/lib/.debug/libmodulemd.so.2.15.1", added "/usr/lib/.debug/libmodulemd.so.2.15.2"
packages/core2-64-poky-linux/libmodulemd/libmodulemd-dbg: PV changed from "2.15.1" to "2.15.2"
packages/core2-64-poky-linux/libmodulemd/libmodulemd-dev: PKGV changed from 2.15.1 [default] to 2.15.2 [default]
packages/core2-64-poky-linux/libmodulemd/libmodulemd-dev: PV changed from "2.15.1" to "2.15.2"
packages/core2-64-poky-linux/libmodulemd/libmodulemd-doc: PKGV changed from 2.15.1 [default] to 2.15.2 [default]
packages/core2-64-poky-linux/libmodulemd/libmodulemd-doc: PV changed from "2.15.1" to "2.15.2"
packages/core2-64-poky-linux/libmodulemd/libmodulemd-locale: PKGV changed from 2.15.1 [default] to 2.15.2 [default]
packages/core2-64-poky-linux/libmodulemd/libmodulemd-locale: PV changed from "2.15.1" to "2.15.2"
packages/core2-64-poky-linux/libmodulemd/libmodulemd-src: PKGV changed from 2.15.1 [default] to 2.15.2 [default]
packages/core2-64-poky-linux/libmodulemd/libmodulemd-src: PV changed from "2.15.1" to "2.15.2"
packages/core2-64-poky-linux/libmodulemd/libmodulemd-staticdev: PKGV changed from 2.15.1 [default] to 2.15.2 [default]
packages/core2-64-poky-linux/libmodulemd/libmodulemd-staticdev: PV changed from "2.15.1" to "2.15.2"
packages/core2-64-poky-linux/libmodulemd/libmodulemd: PKGV changed from 2.15.1 [default] to 2.15.2 [default]
packages/core2-64-poky-linux/libmodulemd/libmodulemd: FILELIST: removed "/usr/lib/libmodulemd.so.2.15.1", added "/usr/lib/libmodulemd.so.2.15.2"
packages/core2-64-poky-linux/libmodulemd/libmodulemd: PV changed from "2.15.1" to "2.15.2"
Changes to packages/core2-64-poky-linux/libmodulemd (sysroot):
  /usr/lib/libmodulemd.so.2 changed symlink target from libmodulemd.so.2.15.1 to libmodulemd.so.2.15.2
  /usr/lib/libmodulemd.so.2.15.1 moved to /usr/lib/libmodulemd.so.2.15.2

--===============4907293760783414238==--

