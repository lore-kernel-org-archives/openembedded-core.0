Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 972B7C46CA0
	for <webhook@archiver.kernel.org>; Fri,  1 Dec 2023 13:14:57 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.22335.1701436492995047964
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Dec 2023 05:14:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=HNUOU0mG;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ThbQZxU1;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018c258489d9-b9a5f130-352b-43ae-b366-302de5da6c6c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1701436492;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=s3GhDUy+3YpzuDvZmqUv//TyRFhwdu1JszS60xQ4+Bo=;
	b=HNUOU0mGAxp6TcGgaSqTMxSif3JwywyAPMDR+qMrWR7Mr5oaS9I26KInkU8hcR1u
	7mjQiP3mr4wSUGJjCDXXyKC2MoNgPXqV8WdMoGv6DR1qQaM0Z8R6dLEQO0Oes9eY0Vt
	hxsng3oHqTpoJoN3BFQMkQaiiqYpRth+C7WA2UTk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1701436492;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=s3GhDUy+3YpzuDvZmqUv//TyRFhwdu1JszS60xQ4+Bo=;
	b=ThbQZxU1j5LfSeYCUolJyE727uKg82jtNMnwOIbc8XK0flyjql7HMdqtulVuUXEV
	WJTHTE8vTKOq2HMa6inXStCKhSvNgsjBVBhm4PLfVQFz3NwKoIzEvYqYjeUbu0WmseN
	sOKH6TmtgthZRdkGFcf3cebpY/rMaNWVdfSwjUD0=
Content-Type: multipart/mixed; boundary="===============4921411127461823495=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] xz: upgrading to 5.4.5 SUCCEEDED
Message-ID: <0101018c258489d9-b9a5f130-352b-43ae-b366-302de5da6c6c-000000@us-west-2.amazonses.com>
Date: Fri, 1 Dec 2023 13:14:52 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.12.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Dec 2023 13:14:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191648

--===============4921411127461823495==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *xz* to *5.4.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xz-upgrade-5.4.4-5.4.5.patch
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
From c6e2b8ba96e3c7bf0c00fe6c0dc4d206d9f6e256 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Dec 2023 11:09:07 +0000
Subject: [PATCH] xz: upgrade 5.4.4 -> 5.4.5

---
 meta/recipes-extended/xz/{xz_5.4.4.bb => xz_5.4.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/xz/{xz_5.4.4.bb => xz_5.4.5.bb} (95%)

diff --git a/meta/recipes-extended/xz/xz_5.4.4.bb b/meta/recipes-extended/xz/xz_5.4.5.bb
similarity index 95%
rename from meta/recipes-extended/xz/xz_5.4.4.bb
rename to meta/recipes-extended/xz/xz_5.4.5.bb
index 90f4c3d82c..09eade8be0 100644
--- a/meta/recipes-extended/xz/xz_5.4.4.bb
+++ b/meta/recipes-extended/xz/xz_5.4.5.bb
@@ -25,7 +25,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c8ea84ebe7b93cce676b54355dc6b2c0 \
                     "
 
 SRC_URI = "https://tukaani.org/xz/xz-${PV}.tar.gz"
-SRC_URI[sha256sum] = "aae39544e254cfd27e942d35a048d592959bd7a79f9a624afb0498bb5613bdf8"
+SRC_URI[sha256sum] = "135c90b934aee8fbc0d467de87a05cb70d627da36abe518c357a873709e5b7d6"
 UPSTREAM_CHECK_REGEX = "xz-(?P<pver>\d+(\.\d+)+)\.tar"
 
 CACHED_CONFIGUREVARS += "gl_cv_posix_shell=/bin/sh"
-- 
2.39.2


--===============4921411127461823495==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/xz: PKGV changed from 5.4.4 [default] to 5.4.5 [default]
packages/core2-64-poky-linux/xz: SRC_URI changed from "https://tukaani.org/xz/xz-5.4.4.tar.gz" to "https://tukaani.org/xz/xz-5.4.5.tar.gz"
packages/core2-64-poky-linux/xz: PV changed from "5.4.4" to "5.4.5"
packages/core2-64-poky-linux/xz/liblzma: PKGV changed from 5.4.4 [default] to 5.4.5 [default]
packages/core2-64-poky-linux/xz/liblzma: FILELIST: removed "/usr/lib/liblzma.so.5.4.4", added "/usr/lib/liblzma.so.5.4.5"
packages/core2-64-poky-linux/xz/liblzma: PV changed from "5.4.4" to "5.4.5"
Changes to packages/core2-64-poky-linux/xz (sysroot):
  /usr/lib/liblzma.so.5 changed symlink target from liblzma.so.5.4.4 to liblzma.so.5.4.5
  /usr/lib/liblzma.so changed symlink target from liblzma.so.5.4.4 to liblzma.so.5.4.5
  /usr/lib/liblzma.so.5.4.4 moved to /usr/lib/liblzma.so.5.4.5
packages/core2-64-poky-linux/xz/xz-dbg: PKGV changed from 5.4.4 [default] to 5.4.5 [default]
packages/core2-64-poky-linux/xz/xz-dbg: FILELIST: removed "/usr/lib/.debug/liblzma.so.5.4.4", added "/usr/lib/.debug/liblzma.so.5.4.5"
packages/core2-64-poky-linux/xz/xz-dbg: PKGSIZE changed from 1048912 to 1047928 (-0%)
packages/core2-64-poky-linux/xz/xz-dbg: PV changed from "5.4.4" to "5.4.5"
packages/core2-64-poky-linux/xz/xz-dev: PKGV changed from 5.4.4 [default] to 5.4.5 [default]
packages/core2-64-poky-linux/xz/xz-dev: PKGSIZE changed from 225642 to 225688 (+0%)
packages/core2-64-poky-linux/xz/xz-dev: PV changed from "5.4.4" to "5.4.5"
packages/core2-64-poky-linux/xz/xz-doc: PKGV changed from 5.4.4 [default] to 5.4.5 [default]
packages/core2-64-poky-linux/xz/xz-doc: PKGSIZE changed from 1790015 to 1792415 (+0%)
packages/core2-64-poky-linux/xz/xz-doc: PV changed from "5.4.4" to "5.4.5"
packages/core2-64-poky-linux/xz/xz-locale-ca: PKGV changed from 5.4.4 [default] to 5.4.5 [default]
packages/core2-64-poky-linux/xz/xz-locale-ca: PV changed from "5.4.4" to "5.4.5"
packages/core2-64-poky-linux/xz/xz-locale-cs: PKGV changed from 5.4.4 [default] to 5.4.5 [default]
packages/core2-64-poky-linux/xz/xz-locale-cs: PV changed from "5.4.4" to "5.4.5"
packages/core2-64-poky-linux/xz/xz-locale-da: PKGV changed from 5.4.4 [default] to 5.4.5 [default]
packages/core2-64-poky-linux/xz/xz-locale-da: PV changed from "5.4.4" to "5.4.5"
packages/core2-64-poky-linux/xz/xz-locale-de: PKGV changed from 5.4.4 [default] to 5.4.5 [default]
packages/core2-64-poky-linux/xz/xz-locale-de: PV changed from "5.4.4" to "5.4.5"
packages/core2-64-poky-linux/xz/xz-locale-eo: PKGV changed from 5.4.4 [default] to 5.4.5 [default]
packages/core2-64-poky-linux/xz/xz-locale-eo: PKGSIZE changed from 26104 to 26139 (+0%)
packages/core2-64-poky-linux/xz/xz-locale-eo: PV changed from "5.4.4" to "5.4.5"
packages/core2-64-poky-linux/xz/xz-locale-es: PKGV changed from 5.4.4 [default] to 5.4.5 [default]
packages/core2-64-poky-linux/xz/xz-locale-es: PV changed from "5.4.4" to "5.4.5"
packages/core2-64-poky-linux/xz/xz-locale-fi: PKGV changed from 5.4.4 [default] to 5.4.5 [default]
packages/core2-64-poky-linux/xz/xz-locale-fi: PV changed from "5.4.4" to "5.4.5"
packages/core2-64-poky-linux/xz/xz-locale-fr: PKGV changed from 5.4.4 [default] to 5.4.5 [default]
packages/core2-64-poky-linux/xz/xz-locale-fr: PV changed from "5.4.4" to "5.4.5"
packages/core2-64-poky-linux/xz/xz-locale-hr: PKGV changed from 5.4.4 [default] to 5.4.5 [default]
packages/core2-64-poky-linux/xz/xz-locale-hr: PV changed from "5.4.4" to "5.4.5"
packages/core2-64-poky-linux/xz/xz-locale-hu: PKGV changed from 5.4.4 [default] to 5.4.5 [default]
packages/core2-64-poky-linux/xz/xz-locale-hu: PV changed from "5.4.4" to "5.4.5"
packages/core2-64-poky-linux/xz/xz-locale-it: PKGV changed from 5.4.4 [default] to 5.4.5 [default]
packages/core2-64-poky-linux/xz/xz-locale-it: PV changed from "5.4.4" to "5.4.5"
packages/core2-64-poky-linux/xz/xz-locale-ko: PKGV changed from 5.4.4 [default] to 5.4.5 [default]
packages/core2-64-poky-linux/xz/xz-locale-ko: PV changed from "5.4.4" to "5.4.5"
packages/core2-64-poky-linux/xz/xz-locale-pl: PKGV changed from 5.4.4 [default] to 5.4.5 [default]
packages/core2-64-poky-linux/xz/xz-locale-pl: PV changed from "5.4.4" to "5.4.5"
packages/core2-64-poky-linux/xz/xz-locale-pt-br: PKGV changed from 5.4.4 [default] to 5.4.5 [default]
packages/core2-64-poky-linux/xz/xz-locale-pt-br: PV changed from "5.4.4" to "5.4.5"
packages/core2-64-poky-linux/xz/xz-locale-pt: PKGV changed from 5.4.4 [default] to 5.4.5 [default]
packages/core2-64-poky-linux/xz/xz-locale-pt: PV changed from "5.4.4" to "5.4.5"
packages/core2-64-poky-linux/xz/xz-locale-ro: PKGV changed from 5.4.4 [default] to 5.4.5 [default]
packages/core2-64-poky-linux/xz/xz-locale-ro: PV changed from "5.4.4" to "5.4.5"
packages/core2-64-poky-linux/xz/xz-locale-sr: PKGV changed from 5.4.4 [default] to 5.4.5 [default]
packages/core2-64-poky-linux/xz/xz-locale-sr: PV changed from "5.4.4" to "5.4.5"
packages/core2-64-poky-linux/xz/xz-locale-sv: PKGV changed from 5.4.4 [default] to 5.4.5 [default]
packages/core2-64-poky-linux/xz/xz-locale-sv: PV changed from "5.4.4" to "5.4.5"
packages/core2-64-poky-linux/xz/xz-locale-tr: PKGV changed from 5.4.4 [default] to 5.4.5 [default]
packages/core2-64-poky-linux/xz/xz-locale-tr: PV changed from "5.4.4" to "5.4.5"
packages/core2-64-poky-linux/xz/xz-locale-uk: PKGV changed from 5.4.4 [default] to 5.4.5 [default]
packages/core2-64-poky-linux/xz/xz-locale-uk: PV changed from "5.4.4" to "5.4.5"
packages/core2-64-poky-linux/xz/xz-locale-vi: PKGV changed from 5.4.4 [default] to 5.4.5 [default]
packages/core2-64-poky-linux/xz/xz-locale-vi: PV changed from "5.4.4" to "5.4.5"
packages/core2-64-poky-linux/xz/xz-locale-zh-cn: PKGV changed from 5.4.4 [default] to 5.4.5 [default]
packages/core2-64-poky-linux/xz/xz-locale-zh-cn: PV changed from "5.4.4" to "5.4.5"
packages/core2-64-poky-linux/xz/xz-locale-zh-tw: PKGV changed from 5.4.4 [default] to 5.4.5 [default]
packages/core2-64-poky-linux/xz/xz-locale-zh-tw: PV changed from "5.4.4" to "5.4.5"
packages/core2-64-poky-linux/xz/xz-src: PKGV changed from 5.4.4 [default] to 5.4.5 [default]
packages/core2-64-poky-linux/xz/xz-src: PKGSIZE changed from 1326020 to 1331834 (+0%)
packages/core2-64-poky-linux/xz/xz-src: PV changed from "5.4.4" to "5.4.5"
packages/core2-64-poky-linux/xz/xz-staticdev: PKGV changed from 5.4.4 [default] to 5.4.5 [default]
packages/core2-64-poky-linux/xz/xz-staticdev: PV changed from "5.4.4" to "5.4.5"
packages/core2-64-poky-linux/xz/xz: PKGV changed from 5.4.4 [default] to 5.4.5 [default]
packages/core2-64-poky-linux/xz/xz: PV changed from "5.4.4" to "5.4.5"
Changes to packages/x86_64-linux/xz-native (sysroot):
  /usr/lib/liblzma.so.5 changed symlink target from liblzma.so.5.4.4 to liblzma.so.5.4.5
  /usr/lib/liblzma.so changed symlink target from liblzma.so.5.4.4 to liblzma.so.5.4.5
  /usr/lib/liblzma.so.5.4.4 moved to /usr/lib/liblzma.so.5.4.5

--===============4921411127461823495==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/xz/liblzma: FILELIST: removed "/usr/lib/liblzma.so.5.4.4", added "/usr/lib/liblzma.so.5.4.5"
Changes to packages/core2-64-poky-linux/xz (sysroot):
  /usr/lib/liblzma.so.5 changed symlink target from liblzma.so.5.4.4 to liblzma.so.5.4.5
  /usr/lib/liblzma.so changed symlink target from liblzma.so.5.4.4 to liblzma.so.5.4.5
  /usr/lib/liblzma.so.5.4.4 moved to /usr/lib/liblzma.so.5.4.5
Changes to packages/x86_64-linux/xz-native (sysroot):
  /usr/lib/liblzma.so.5 changed symlink target from liblzma.so.5.4.4 to liblzma.so.5.4.5
  /usr/lib/liblzma.so changed symlink target from liblzma.so.5.4.4 to liblzma.so.5.4.5
  /usr/lib/liblzma.so.5.4.4 moved to /usr/lib/liblzma.so.5.4.5

--===============4921411127461823495==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-xz-upgrade-5.4.4-5.4.5.patch"

RnJvbSBjNmUyYjhiYTk2ZTNjN2JmMGMwMGZlNmMwZGM0ZDIwNmQ5ZjZlMjU2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBEZWMgMjAyMyAxMTowOTowNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHh6
OiB1cGdyYWRlIDUuNC40IC0+IDUuNC41CgotLS0KIG1ldGEvcmVjaXBlcy1leHRlbmRlZC94ei97
eHpfNS40LjQuYmIgPT4geHpfNS40LjUuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3h6
L3t4el81LjQuNC5iYiA9PiB4el81LjQuNS5iYn0gKDk1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZXh0ZW5kZWQveHoveHpfNS40LjQuYmIgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQveHov
eHpfNS40LjUuYmIKc2ltaWxhcml0eSBpbmRleCA5NSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVz
LWV4dGVuZGVkL3h6L3h6XzUuNC40LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQv
eHoveHpfNS40LjUuYmIKaW5kZXggOTBmNGMzZDgyYy4uMDllYWRlOGJlMCAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWV4dGVuZGVkL3h6L3h6XzUuNC40LmJiCisrKyBiL21ldGEvcmVjaXBlcy1l
eHRlbmRlZC94ei94el81LjQuNS5iYgpAQCAtMjUsNyArMjUsNyBAQCBMSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9DT1BZSU5HO21kNT1jOGVhODRlYmU3YjkzY2NlNjc2YjU0MzU1ZGM2YjJjMCBc
CiAgICAgICAgICAgICAgICAgICAgICIKIAogU1JDX1VSSSA9ICJodHRwczovL3R1a2Fhbmkub3Jn
L3h6L3h6LSR7UFZ9LnRhci5neiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJhYWUzOTU0NGUyNTRj
ZmQyN2U5NDJkMzVhMDQ4ZDU5Mjk1OWJkN2E3OWY5YTYyNGFmYjA0OThiYjU2MTNiZGY4IgorU1JD
X1VSSVtzaGEyNTZzdW1dID0gIjEzNWM5MGI5MzRhZWU4ZmJjMGQ0NjdkZTg3YTA1Y2I3MGQ2Mjdk
YTM2YWJlNTE4YzM1N2E4NzM3MDllNWI3ZDYiCiBVUFNUUkVBTV9DSEVDS19SRUdFWCA9ICJ4ei0o
P1A8cHZlcj5cZCsoXC5cZCspKylcLnRhciIKIAogQ0FDSEVEX0NPTkZJR1VSRVZBUlMgKz0gImds
X2N2X3Bvc2l4X3NoZWxsPS9iaW4vc2giCi0tIAoyLjM5LjIKCg==

--===============4921411127461823495==--

