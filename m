Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3DB9CD12A5
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 18:11:14 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.44906.1711995071701328193
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Apr 2024 11:11:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=KlMNqEII;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=kYmzUFiM;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018e9adbaacb-a932a092-064f-4dee-abdd-08523a595cf1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1711995071;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=lcID9IsSFUGQ6iv7AdJyHXRxc1W8AwnFEAO5JqQltA0=;
	b=KlMNqEIIvYuGpiIIIWfgeTAbqE1zFrVzVr4Zi6SEqeHK5VR6Na6YZ5sfHlrnC3HP
	yNcycvs0bCEQINYymt3IlGFnNcpOtTci5KYTmkbICGHrbyAA/wCaUtH57Fb1C3VJS+v
	Wd+KC7wvYppNhlRqrjxYtOZPyUH3vaoyNYN0RTfs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1711995071;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=lcID9IsSFUGQ6iv7AdJyHXRxc1W8AwnFEAO5JqQltA0=;
	b=kYmzUFiM72oLM3Y4EW6I/SCuPcrjLAzoByTnPCcNsHImGcoqECvldeyFaPp4mRd4
	s3LnFjSuaTM4pv5przC0/QKVaf5ixwGOaaP2plD7YQGUlCE7riq3ZkzJ511sRys1TpT
	CNJ2IVWqgQLBmuUFmHb+VHGQ9yGWMvJvsRhuIjwg=
Content-Type: multipart/mixed; boundary="===============5723034074975488087=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libpng: upgrading to 1.6.43 SUCCEEDED
Message-ID: <0101018e9adbaacb-a932a092-064f-4dee-abdd-08523a595cf1-000000@us-west-2.amazonses.com>
Date: Mon, 1 Apr 2024 18:11:11 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 18:11:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197834

--===============5723034074975488087==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libpng* to *1.6.43* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libpng-upgrade-1.6.42-1.6.43.patch
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
From 265ac00e68fc5a6042c35eb049196f0bd899fbdb Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Apr 2024 16:07:19 +0000
Subject: [PATCH] libpng: upgrade 1.6.42 -> 1.6.43

---
 .../libpng/{libpng_1.6.42.bb => libpng_1.6.43.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/libpng/{libpng_1.6.42.bb => libpng_1.6.43.bb} (93%)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.42.bb b/meta/recipes-multimedia/libpng/libpng_1.6.43.bb
similarity index 93%
rename from meta/recipes-multimedia/libpng/libpng_1.6.42.bb
rename to meta/recipes-multimedia/libpng/libpng_1.6.43.bb
index cadbe957db..44869dce73 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.42.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.43.bb
@@ -11,7 +11,7 @@ DEPENDS = "zlib"
 LIBV = "16"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "c919dbc11f4c03b05aba3f8884d8eb7adfe3572ad228af972bb60057bdb48450"
+SRC_URI[sha256sum] = "6a5ca0652392a2d7c9db2ae5b40210843c0bbc081cbd410825ab00cc59f14a6c"
 
 MIRRORS += "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/ ${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/older-releases/"
 
-- 
2.42.0


--===============5723034074975488087==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/libpng/libpng: FILELIST: removed "/usr/lib/libpng16.so.16.41.0", added "/usr/lib/libpng16.so.16.43.0"
Changes to packages/core2-64-poky-linux/libpng (sysroot):
  /usr/lib/libpng16.so.16 changed symlink target from libpng16.so.16.41.0 to libpng16.so.16.43.0
  /usr/lib/libpng16.so changed symlink target from libpng16.so.16.41.0 to libpng16.so.16.43.0
  /usr/lib/libpng16.so.16.41.0 moved to /usr/lib/libpng16.so.16.43.0

--===============5723034074975488087==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libpng-upgrade-1.6.42-1.6.43.patch"

RnJvbSAyNjVhYzAwZTY4ZmM1YTYwNDJjMzVlYjA0OTE5NmYwYmQ4OTlmYmRiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBBcHIgMjAyNCAxNjowNzoxOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnBuZzogdXBncmFkZSAxLjYuNDIgLT4gMS42LjQzCgotLS0KIC4uLi9saWJwbmcve2xpYnBuZ18x
LjYuNDIuYmIgPT4gbGlicG5nXzEuNi40My5iYn0gICAgICAgICAgICAgICB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1tdWx0aW1lZGlhL2xpYnBuZy97bGlicG5nXzEuNi40Mi5iYiA9PiBsaWJwbmdfMS42LjQz
LmJifSAoOTMlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2xpYnBuZy9s
aWJwbmdfMS42LjQyLmJiIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvbGlicG5nL2xpYnBuZ18x
LjYuNDMuYmIKc2ltaWxhcml0eSBpbmRleCA5MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLW11
bHRpbWVkaWEvbGlicG5nL2xpYnBuZ18xLjYuNDIuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1t
dWx0aW1lZGlhL2xpYnBuZy9saWJwbmdfMS42LjQzLmJiCmluZGV4IGNhZGJlOTU3ZGIuLjQ0ODY5
ZGNlNzMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2xpYnBuZy9saWJwbmdf
MS42LjQyLmJiCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2xpYnBuZy9saWJwbmdfMS42
LjQzLmJiCkBAIC0xMSw3ICsxMSw3IEBAIERFUEVORFMgPSAiemxpYiIKIExJQlYgPSAiMTYiCiAK
IFNSQ19VUkkgPSAiJHtTT1VSQ0VGT1JHRV9NSVJST1J9L3Byb2plY3QvJHtCUE59LyR7QlBOfSR7
TElCVn0vJHtCUH0udGFyLnh6IgotU1JDX1VSSVtzaGEyNTZzdW1dID0gImM5MTlkYmMxMWY0YzAz
YjA1YWJhM2Y4ODg0ZDhlYjdhZGZlMzU3MmFkMjI4YWY5NzJiYjYwMDU3YmRiNDg0NTAiCitTUkNf
VVJJW3NoYTI1NnN1bV0gPSAiNmE1Y2EwNjUyMzkyYTJkN2M5ZGIyYWU1YjQwMjEwODQzYzBiYmMw
ODFjYmQ0MTA4MjVhYjAwY2M1OWYxNGE2YyIKIAogTUlSUk9SUyArPSAiJHtTT1VSQ0VGT1JHRV9N
SVJST1J9L3Byb2plY3QvJHtCUE59LyR7QlBOfSR7TElCVn0vICR7U09VUkNFRk9SR0VfTUlSUk9S
fS9wcm9qZWN0LyR7QlBOfS8ke0JQTn0ke0xJQlZ9L29sZGVyLXJlbGVhc2VzLyIKIAotLSAKMi40
Mi4wCgo=

--===============5723034074975488087==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libpng: PV changed from "1.6.42" to "1.6.43"
packages/core2-64-poky-linux/libpng: SRC_URI changed from "https://downloads.sourceforge.net/project/libpng/libpng16/libpng-1.6.42.tar.xz" to "https://downloads.sourceforge.net/project/libpng/libpng16/libpng-1.6.43.tar.xz"
packages/core2-64-poky-linux/libpng: PKGV changed from 1.6.42 [default] to 1.6.43 [default]
packages/core2-64-poky-linux/libpng/libpng-dbg: PKGSIZE changed from 789992 to 790432 (+0%)
packages/core2-64-poky-linux/libpng/libpng-dbg: PV changed from "1.6.42" to "1.6.43"
packages/core2-64-poky-linux/libpng/libpng-dbg: PKGV changed from 1.6.42 [default] to 1.6.43 [default]
packages/core2-64-poky-linux/libpng/libpng-dbg: FILELIST: removed "/usr/lib/.debug/libpng16.so.16.41.0", added "/usr/lib/.debug/libpng16.so.16.43.0"
packages/core2-64-poky-linux/libpng/libpng-dev: PKGSIZE changed from 174169 to 174214 (+0%)
packages/core2-64-poky-linux/libpng/libpng-dev: PV changed from "1.6.42" to "1.6.43"
packages/core2-64-poky-linux/libpng/libpng-dev: PKGV changed from 1.6.42 [default] to 1.6.43 [default]
packages/core2-64-poky-linux/libpng/libpng-doc: PKGSIZE changed from 268658 to 268667 (+0%)
packages/core2-64-poky-linux/libpng/libpng-doc: PV changed from "1.6.42" to "1.6.43"
packages/core2-64-poky-linux/libpng/libpng-doc: PKGV changed from 1.6.42 [default] to 1.6.43 [default]
packages/core2-64-poky-linux/libpng/libpng-locale: PV changed from "1.6.42" to "1.6.43"
packages/core2-64-poky-linux/libpng/libpng-locale: PKGV changed from 1.6.42 [default] to 1.6.43 [default]
packages/core2-64-poky-linux/libpng/libpng-src: PKGSIZE changed from 1400483 to 1400624 (+0%)
packages/core2-64-poky-linux/libpng/libpng-src: PV changed from "1.6.42" to "1.6.43"
packages/core2-64-poky-linux/libpng/libpng-src: PKGV changed from 1.6.42 [default] to 1.6.43 [default]
packages/core2-64-poky-linux/libpng/libpng-staticdev: PV changed from "1.6.42" to "1.6.43"
packages/core2-64-poky-linux/libpng/libpng-staticdev: PKGV changed from 1.6.42 [default] to 1.6.43 [default]
packages/core2-64-poky-linux/libpng/libpng-tools: PV changed from "1.6.42" to "1.6.43"
packages/core2-64-poky-linux/libpng/libpng-tools: PKGV changed from 1.6.42 [default] to 1.6.43 [default]
packages/core2-64-poky-linux/libpng/libpng: PV changed from "1.6.42" to "1.6.43"
packages/core2-64-poky-linux/libpng/libpng: PKGV changed from 1.6.42 [default] to 1.6.43 [default]
packages/core2-64-poky-linux/libpng/libpng: FILELIST: removed "/usr/lib/libpng16.so.16.41.0", added "/usr/lib/libpng16.so.16.43.0"
Changes to packages/core2-64-poky-linux/libpng (sysroot):
  /usr/lib/libpng16.so.16 changed symlink target from libpng16.so.16.41.0 to libpng16.so.16.43.0
  /usr/lib/libpng16.so changed symlink target from libpng16.so.16.41.0 to libpng16.so.16.43.0
  /usr/lib/libpng16.so.16.41.0 moved to /usr/lib/libpng16.so.16.43.0

--===============5723034074975488087==--

