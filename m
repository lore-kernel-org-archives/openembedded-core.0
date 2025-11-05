Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B6A8CD484E
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:16:49 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2371.1762384588331825178
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:16:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=R75i3WZF;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=HyuQke92;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019a564edd10-97354728-4311-4fe0-a76a-879d16a4f729-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1762384600;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=hM122FfdOCYoWK+BSewFCCvaVuGyiO82Jhqrzy0nHUc=;
	b=R75i3WZF5V5hF3x1/a6KRm/5cWuq4MZQusyJo5KZSGJammBnZaL+jDIYz6BFxDTO
	FUja1cWe6ThbMACBEjiM+KbQivE/iC8raKf18lgAAbZQLy32dSAh8tBaTgjHH3n3t4T
	fphhVyUSf4swmvEzo7Vxt5N3b98ZWXWDwknnPugA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1762384600;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=hM122FfdOCYoWK+BSewFCCvaVuGyiO82Jhqrzy0nHUc=;
	b=HyuQke92J6IuPxtFRI0CSodbN3usuhkQ2XScHSX9B/j8A16qhK2Bp/mMXxsfCIRz
	BfG9nMpUACxMYeZLIFLZ8BA4n5JmgEwFCaAjMBSpP0pi+0tUsG8rK3iXis+7cODLzFK
	cNxJumQKzvKGaiUFCANrMNThJFpSWGw69G5oqDJQ=
Content-Type: multipart/mixed; boundary="===============8791823827639020433=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] libxkbcommon: upgrading to 1.13.0 SUCCEEDED
Message-ID: <0101019a564edd10-97354728-4311-4fe0-a76a-879d16a4f729-000000@us-west-2.amazonses.com>
Date: Wed, 5 Nov 2025 23:16:40 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.05-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 23:16:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225889

--===============8791823827639020433==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libxkbcommon* to *1.13.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libxkbcommon-upgrade-1.11.0-1.13.0.patch
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
From de6203839ea3661836dd26443c369329e5f5a914 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 5 Nov 2025 21:17:25 +0000
Subject: [PATCH] libxkbcommon: upgrade 1.11.0 -> 1.13.0

---
 .../xorg-lib/{libxkbcommon_1.11.0.bb => libxkbcommon_1.13.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libxkbcommon_1.11.0.bb => libxkbcommon_1.13.0.bb} (96%)

diff --git a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.11.0.bb b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.0.bb
similarity index 96%
rename from meta/recipes-graphics/xorg-lib/libxkbcommon_1.11.0.bb
rename to meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.0.bb
index c953058275..8560064253 100644
--- a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.11.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.0.bb
@@ -9,7 +9,7 @@ DEPENDS = "flex-native bison-native"
 
 SRC_URI = "git://github.com/xkbcommon/libxkbcommon;protocol=https;branch=master;tag=xkbcommon-${PV}"
 
-SRCREV = "0f9cefb1fedb23433666fa5d9045e48ff030c006"
+SRCREV = "3049d310694fd70f1269bf48a1200aa4259e79b1"
 
 inherit meson pkgconfig bash-completion
 
-- 
2.47.1


--===============8791823827639020433==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libxkbcommon/libxkbcommon-x11: FILELIST: removed "/usr/lib/libxkbcommon-x11.so.0.11.0", added "/usr/lib/libxkbcommon-x11.so.0.13.0"
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbcommon-x11: PKGSIZE changed from 38994 to 51282 (+32%)
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbcommon: FILELIST: removed "/usr/lib/libxkbcommon.so.0.11.0", added "/usr/lib/libxkbcommon.so.0.13.0"
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbregistry: FILELIST: removed "/usr/lib/libxkbregistry.so.0.11.0", added "/usr/lib/libxkbregistry.so.0.13.0"
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbregistry: PKGSIZE changed from 38912 to 43008 (+11%)
Changes to packages/x86-64-v3-poky-linux/libxkbcommon (sysroot):
  /usr/lib/libxkbcommon.so.0 changed symlink target from libxkbcommon.so.0.11.0 to libxkbcommon.so.0.13.0
  /usr/lib/libxkbcommon-x11.so.0 changed symlink target from libxkbcommon-x11.so.0.11.0 to libxkbcommon-x11.so.0.13.0
  /usr/lib/libxkbregistry.so.0 changed symlink target from libxkbregistry.so.0.11.0 to libxkbregistry.so.0.13.0
  /usr/lib/libxkbcommon.so.0.11.0 moved to /usr/lib/libxkbcommon.so.0.13.0
  /usr/lib/libxkbcommon-x11.so.0.11.0 moved to /usr/lib/libxkbcommon-x11.so.0.13.0
  /usr/lib/libxkbregistry.so.0.11.0 moved to /usr/lib/libxkbregistry.so.0.13.0

--===============8791823827639020433==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libxkbcommon: SRC_URI changed from "git://github.com/xkbcommon/libxkbcommon;protocol=https;branch=master;tag=xkbcommon-1.11.0" to "git://github.com/xkbcommon/libxkbcommon;protocol=https;branch=master;tag=xkbcommon-1.13.0"
packages/x86-64-v3-poky-linux/libxkbcommon: PKGV changed from 1.11.0 [default] to 1.13.0 [default]
packages/x86-64-v3-poky-linux/libxkbcommon: PV changed from "1.11.0" to "1.13.0"
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbcommon-bash-completion: PKGV changed from 1.11.0 [default] to 1.13.0 [default]
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbcommon-bash-completion: PV changed from "1.11.0" to "1.13.0"
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbcommon-dbg: PKGSIZE changed from 2181904 to 2309464 (+6%)
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbcommon-dbg: FILELIST: removed "/usr/lib/.debug/libxkbregistry.so.0.11.0 /usr/lib/.debug/libxkbcommon-x11.so.0.11.0 /usr/lib/.debug/libxkbcommon.so.0.11.0", added "/usr/lib/.debug/libxkbcommon.so.0.13.0 /usr/lib/.debug/libxkbregistry.so.0.13.0 /usr/lib/.debug/libxkbcommon-x11.so.0.13.0"
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbcommon-dbg: PKGV changed from 1.11.0 [default] to 1.13.0 [default]
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbcommon-dbg: PV changed from "1.11.0" to "1.13.0"
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbcommon-dev: PKGSIZE changed from 401197 to 411390 (+3%)
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbcommon-dev: PKGV changed from 1.11.0 [default] to 1.13.0 [default]
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbcommon-dev: PV changed from "1.11.0" to "1.13.0"
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbcommon-doc: PKGSIZE changed from 16083 to 16563 (+3%)
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbcommon-doc: PKGV changed from 1.11.0 [default] to 1.13.0 [default]
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbcommon-doc: PV changed from "1.11.0" to "1.13.0"
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbcommon-locale: PKGV changed from 1.11.0 [default] to 1.13.0 [default]
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbcommon-locale: PV changed from "1.11.0" to "1.13.0"
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbcommon-src: PKGSIZE changed from 390893 to 393619 (+1%)
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbcommon-src: PKGV changed from 1.11.0 [default] to 1.13.0 [default]
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbcommon-src: PV changed from "1.11.0" to "1.13.0"
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbcommon-staticdev: PKGV changed from 1.11.0 [default] to 1.13.0 [default]
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbcommon-staticdev: PV changed from "1.11.0" to "1.13.0"
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbcommon-x11: PKGSIZE changed from 38994 to 51282 (+32%)
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbcommon-x11: FILES: removed "/usr/lib/libxkbcommon-x11.so.0.11.0", added "/usr/lib/libxkbcommon-x11.so.0.13.0"
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbcommon-x11: FILELIST: removed "/usr/lib/libxkbcommon-x11.so.0.11.0", added "/usr/lib/libxkbcommon-x11.so.0.13.0"
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbcommon-x11: PKGV changed from 1.11.0 [default] to 1.13.0 [default]
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbcommon-x11: PV changed from "1.11.0" to "1.13.0"
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbcommon: PKGSIZE changed from 370902 to 391382 (+6%)
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbcommon: FILES: removed "/usr/lib/libxkbcommon.so.0.11.0", added "/usr/lib/libxkbcommon.so.0.13.0"
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbcommon: FILELIST: removed "/usr/lib/libxkbcommon.so.0.11.0", added "/usr/lib/libxkbcommon.so.0.13.0"
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbcommon: PKGV changed from 1.11.0 [default] to 1.13.0 [default]
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbcommon: PV changed from "1.11.0" to "1.13.0"
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbregistry: PKGSIZE changed from 38912 to 43008 (+11%)
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbregistry: FILES: removed "/usr/lib/libxkbregistry.so.0.11.0", added "/usr/lib/libxkbregistry.so.0.13.0"
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbregistry: FILELIST: removed "/usr/lib/libxkbregistry.so.0.11.0", added "/usr/lib/libxkbregistry.so.0.13.0"
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbregistry: PKGV changed from 1.11.0 [default] to 1.13.0 [default]
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbregistry: PV changed from "1.11.0" to "1.13.0"
Changes to packages/x86-64-v3-poky-linux/libxkbcommon (sysroot):
  /usr/lib/libxkbcommon.so.0 changed symlink target from libxkbcommon.so.0.11.0 to libxkbcommon.so.0.13.0
  /usr/lib/libxkbcommon-x11.so.0 changed symlink target from libxkbcommon-x11.so.0.11.0 to libxkbcommon-x11.so.0.13.0
  /usr/lib/libxkbregistry.so.0 changed symlink target from libxkbregistry.so.0.11.0 to libxkbregistry.so.0.13.0
  /usr/lib/libxkbcommon.so.0.11.0 moved to /usr/lib/libxkbcommon.so.0.13.0
  /usr/lib/libxkbcommon-x11.so.0.11.0 moved to /usr/lib/libxkbcommon-x11.so.0.13.0
  /usr/lib/libxkbregistry.so.0.11.0 moved to /usr/lib/libxkbregistry.so.0.13.0
packages/x86-64-v3-poky-linux/libxkbcommon/xkbcli: PKGSIZE changed from 414704 to 414928 (+0%)
packages/x86-64-v3-poky-linux/libxkbcommon/xkbcli: PKGV changed from 1.11.0 [default] to 1.13.0 [default]
packages/x86-64-v3-poky-linux/libxkbcommon/xkbcli: PV changed from "1.11.0" to "1.13.0"

--===============8791823827639020433==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libxkbcommon-upgrade-1.11.0-1.13.0.patch"

RnJvbSBkZTYyMDM4MzllYTM2NjE4MzZkZDI2NDQzYzM2OTMyOWU1ZjVhOTE0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgNSBOb3YgMjAyNSAyMToxNzoyNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnhrYmNvbW1vbjogdXBncmFkZSAxLjExLjAgLT4gMS4xMy4wCgotLS0KIC4uLi94b3JnLWxpYi97
bGlieGtiY29tbW9uXzEuMTEuMC5iYiA9PiBsaWJ4a2Jjb21tb25fMS4xMy4wLmJifSB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxpYi97bGlieGtiY29tbW9uXzEuMTEuMC5iYiA9PiBs
aWJ4a2Jjb21tb25fMS4xMy4wLmJifSAoOTYlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1n
cmFwaGljcy94b3JnLWxpYi9saWJ4a2Jjb21tb25fMS4xMS4wLmJiIGIvbWV0YS9yZWNpcGVzLWdy
YXBoaWNzL3hvcmctbGliL2xpYnhrYmNvbW1vbl8xLjEzLjAuYmIKc2ltaWxhcml0eSBpbmRleCA5
NiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctbGliL2xpYnhrYmNvbW1v
bl8xLjExLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxpYi9saWJ4
a2Jjb21tb25fMS4xMy4wLmJiCmluZGV4IGM5NTMwNTgyNzUuLjg1NjAwNjQyNTMgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxpYi9saWJ4a2Jjb21tb25fMS4xMS4wLmJi
CisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxpYi9saWJ4a2Jjb21tb25fMS4xMy4w
LmJiCkBAIC05LDcgKzksNyBAQCBERVBFTkRTID0gImZsZXgtbmF0aXZlIGJpc29uLW5hdGl2ZSIK
IAogU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL3hrYmNvbW1vbi9saWJ4a2Jjb21tb247cHJv
dG9jb2w9aHR0cHM7YnJhbmNoPW1hc3Rlcjt0YWc9eGtiY29tbW9uLSR7UFZ9IgogCi1TUkNSRVYg
PSAiMGY5Y2VmYjFmZWRiMjM0MzM2NjZmYTVkOTA0NWU0OGZmMDMwYzAwNiIKK1NSQ1JFViA9ICIz
MDQ5ZDMxMDY5NGZkNzBmMTI2OWJmNDhhMTIwMGFhNDI1OWU3OWIxIgogCiBpbmhlcml0IG1lc29u
IHBrZ2NvbmZpZyBiYXNoLWNvbXBsZXRpb24KIAotLSAKMi40Ny4xCgo=

--===============8791823827639020433==--

