Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16034CFD319
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 19:36:05 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.53260.1728588944661100897
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 12:35:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=fKl1Zkys;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=BgI2Sug3;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019277ee41db-1899cdd0-b439-4ba7-9e2d-531133ea9111-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728588956;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=oCxCTL+Cnpp3VhkMrjojEx3NEp9Az5y+2ICaORZiOFU=;
	b=fKl1ZkysYIgT3ReA1+OjTBv3VLIMg0TB60H+D3M9eehC9oZ9i7LR+J4JNQVSi3+u
	VBUMv3Gsae1Hna9tDeaWP9QSoFm9N5YDcPpa0T3Kf/sfQUDtpXPjL+Blw4/QpsEoYtS
	25QVGgzXuYEAukOhtI5JAbEApu50GtNXm08iX5MU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728588956;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=oCxCTL+Cnpp3VhkMrjojEx3NEp9Az5y+2ICaORZiOFU=;
	b=BgI2Sug3+YdJsXWtG1/QIkDXeZu7/9mnInq9KeCQKBmsVZCOGlQz7s2LvqFw6ZxF
	LIjAyhDBMdwrMgwTuFVklhXGvgGd3xunlD0v9p52yovrVbvWajs56FX6wx4uYIeK2Dj
	AL9f3VV2PFcHOSHJkPlSIT3VfdTCdx202pP8aoDw=
Content-Type: multipart/mixed; boundary="===============2918555657850892575=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] xz: upgrading to 5.6.3 SUCCEEDED
Message-ID: <0101019277ee41db-1899cdd0-b439-4ba7-9e2d-531133ea9111-000000@us-west-2.amazonses.com>
Date: Thu, 10 Oct 2024 19:35:56 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.10-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 19:36:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205481

--===============2918555657850892575==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *xz* to *5.6.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xz-upgrade-5.6.2-5.6.3.patch
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
From 546312efa75e80d851f9c9782ef2f1314f8af0f6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 10 Oct 2024 04:11:53 +0000
Subject: [PATCH] xz: upgrade 5.6.2 -> 5.6.3

---
 meta/recipes-extended/xz/{xz_5.6.2.bb => xz_5.6.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/xz/{xz_5.6.2.bb => xz_5.6.3.bb} (97%)

diff --git a/meta/recipes-extended/xz/xz_5.6.2.bb b/meta/recipes-extended/xz/xz_5.6.3.bb
similarity index 97%
rename from meta/recipes-extended/xz/xz_5.6.2.bb
rename to meta/recipes-extended/xz/xz_5.6.3.bb
index 96fc691ef7..67070850ab 100644
--- a/meta/recipes-extended/xz/xz_5.6.2.bb
+++ b/meta/recipes-extended/xz/xz_5.6.3.bb
@@ -28,7 +28,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c02de712b028a5cc7e22472e8f2b3db1 \
 SRC_URI = "https://github.com/tukaani-project/xz/releases/download/v${PV}/xz-${PV}.tar.gz \
            file://run-ptest \
           "
-SRC_URI[sha256sum] = "8bfd20c0e1d86f0402f2497cfa71c6ab62d4cd35fd704276e3140bfb71414519"
+SRC_URI[sha256sum] = "b1d45295d3f71f25a4c9101bd7c8d16cb56348bbef3bbc738da0351e17c73317"
 UPSTREAM_CHECK_REGEX = "releases/tag/v(?P<pver>\d+(\.\d+)+)"
 UPSTREAM_CHECK_URI = "https://github.com/tukaani-project/xz/releases/"
 
-- 
2.44.1


--===============2918555657850892575==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/xz/liblzma: FILELIST: removed "/usr/lib/liblzma.so.5.6.2", added "/usr/lib/liblzma.so.5.6.3"
Changes to packages/core2-64-poky-linux/xz (sysroot):
  /usr/lib/liblzma.so.5 changed symlink target from liblzma.so.5.6.2 to liblzma.so.5.6.3
  /usr/lib/liblzma.so changed symlink target from liblzma.so.5.6.2 to liblzma.so.5.6.3
  /usr/lib/liblzma.so.5.6.2 moved to /usr/lib/liblzma.so.5.6.3
packages/core2-64-poky-linux/xz/xz-locale-ca: PKGSIZE changed from 22289 to 31014 (+39%)
packages/core2-64-poky-linux/xz/xz-locale-pt-br: PKGSIZE changed from 22302 to 30957 (+39%)
packages/core2-64-poky-linux/xz/xz-locale-zh-cn: PKGSIZE changed from 22476 to 28989 (+29%)
Changes to packages/x86_64-linux/xz-native (sysroot):
  /usr/lib/liblzma.so.5 changed symlink target from liblzma.so.5.6.2 to liblzma.so.5.6.3
  /usr/lib/liblzma.so changed symlink target from liblzma.so.5.6.2 to liblzma.so.5.6.3
  /usr/lib/liblzma.so.5.6.2 moved to /usr/lib/liblzma.so.5.6.3

--===============2918555657850892575==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/xz: SRC_URI changed from "https://github.com/tukaani-project/xz/releases/download/v5.6.2/xz-5.6.2.tar.gz file://run-ptest" to "https://github.com/tukaani-project/xz/releases/download/v5.6.3/xz-5.6.3.tar.gz file://run-ptest"
packages/core2-64-poky-linux/xz: PV changed from "5.6.2" to "5.6.3"
packages/core2-64-poky-linux/xz: PKGV changed from 5.6.2 [default] to 5.6.3 [default]
packages/core2-64-poky-linux/xz/liblzma: FILELIST: removed "/usr/lib/liblzma.so.5.6.2", added "/usr/lib/liblzma.so.5.6.3"
packages/core2-64-poky-linux/xz/liblzma: PV changed from "5.6.2" to "5.6.3"
packages/core2-64-poky-linux/xz/liblzma: PKGV changed from 5.6.2 [default] to 5.6.3 [default]
Changes to packages/core2-64-poky-linux/xz (sysroot):
  /usr/lib/liblzma.so.5 changed symlink target from liblzma.so.5.6.2 to liblzma.so.5.6.3
  /usr/lib/liblzma.so changed symlink target from liblzma.so.5.6.2 to liblzma.so.5.6.3
  /usr/lib/liblzma.so.5.6.2 moved to /usr/lib/liblzma.so.5.6.3
packages/core2-64-poky-linux/xz/xz-dbg: FILELIST: removed "/usr/lib/.debug/liblzma.so.5.6.2", added "/usr/lib/.debug/liblzma.so.5.6.3"
packages/core2-64-poky-linux/xz/xz-dbg: PV changed from "5.6.2" to "5.6.3"
packages/core2-64-poky-linux/xz/xz-dbg: PKGV changed from 5.6.2 [default] to 5.6.3 [default]
packages/core2-64-poky-linux/xz/xz-dbg: PKGSIZE changed from 1999880 to 2000560 (+0%)
packages/core2-64-poky-linux/xz/xz-dev: PV changed from "5.6.2" to "5.6.3"
packages/core2-64-poky-linux/xz/xz-dev: PKGV changed from 5.6.2 [default] to 5.6.3 [default]
packages/core2-64-poky-linux/xz/xz-dev: PKGSIZE changed from 226687 to 226685 (-0%)
packages/core2-64-poky-linux/xz/xz-doc: PV changed from "5.6.2" to "5.6.3"
packages/core2-64-poky-linux/xz/xz-doc: PKGV changed from 5.6.2 [default] to 5.6.3 [default]
packages/core2-64-poky-linux/xz/xz-doc: PKGSIZE changed from 993542 to 999286 (+1%)
packages/core2-64-poky-linux/xz/xz-locale-ca: PV changed from "5.6.2" to "5.6.3"
packages/core2-64-poky-linux/xz/xz-locale-ca: PKGV changed from 5.6.2 [default] to 5.6.3 [default]
packages/core2-64-poky-linux/xz/xz-locale-ca: PKGSIZE changed from 22289 to 31014 (+39%)
packages/core2-64-poky-linux/xz/xz-locale-cs: PV changed from "5.6.2" to "5.6.3"
packages/core2-64-poky-linux/xz/xz-locale-cs: PKGV changed from 5.6.2 [default] to 5.6.3 [default]
packages/core2-64-poky-linux/xz/xz-locale-da: PV changed from "5.6.2" to "5.6.3"
packages/core2-64-poky-linux/xz/xz-locale-da: PKGV changed from 5.6.2 [default] to 5.6.3 [default]
packages/core2-64-poky-linux/xz/xz-locale-de: PV changed from "5.6.2" to "5.6.3"
packages/core2-64-poky-linux/xz/xz-locale-de: PKGV changed from 5.6.2 [default] to 5.6.3 [default]
packages/core2-64-poky-linux/xz/xz-locale-eo: PV changed from "5.6.2" to "5.6.3"
packages/core2-64-poky-linux/xz/xz-locale-eo: PKGV changed from 5.6.2 [default] to 5.6.3 [default]
packages/core2-64-poky-linux/xz/xz-locale-es: PV changed from "5.6.2" to "5.6.3"
packages/core2-64-poky-linux/xz/xz-locale-es: PKGV changed from 5.6.2 [default] to 5.6.3 [default]
packages/core2-64-poky-linux/xz/xz-locale-fi: PV changed from "5.6.2" to "5.6.3"
packages/core2-64-poky-linux/xz/xz-locale-fi: PKGV changed from 5.6.2 [default] to 5.6.3 [default]
packages/core2-64-poky-linux/xz/xz-locale-fr: PV changed from "5.6.2" to "5.6.3"
packages/core2-64-poky-linux/xz/xz-locale-fr: PKGV changed from 5.6.2 [default] to 5.6.3 [default]
packages/core2-64-poky-linux/xz/xz-locale-hr: PV changed from "5.6.2" to "5.6.3"
packages/core2-64-poky-linux/xz/xz-locale-hr: PKGV changed from 5.6.2 [default] to 5.6.3 [default]
packages/core2-64-poky-linux/xz/xz-locale-hu: PV changed from "5.6.2" to "5.6.3"
packages/core2-64-poky-linux/xz/xz-locale-hu: PKGV changed from 5.6.2 [default] to 5.6.3 [default]
packages/core2-64-poky-linux/xz/xz-locale-it: PV changed from "5.6.2" to "5.6.3"
packages/core2-64-poky-linux/xz/xz-locale-it: PKGV changed from 5.6.2 [default] to 5.6.3 [default]
packages/core2-64-poky-linux/xz/xz-locale-ko: PV changed from "5.6.2" to "5.6.3"
packages/core2-64-poky-linux/xz/xz-locale-ko: PKGV changed from 5.6.2 [default] to 5.6.3 [default]
packages/core2-64-poky-linux/xz/xz-locale-pl: PV changed from "5.6.2" to "5.6.3"
packages/core2-64-poky-linux/xz/xz-locale-pl: PKGV changed from 5.6.2 [default] to 5.6.3 [default]
packages/core2-64-poky-linux/xz/xz-locale-pt-br: PV changed from "5.6.2" to "5.6.3"
packages/core2-64-poky-linux/xz/xz-locale-pt-br: PKGV changed from 5.6.2 [default] to 5.6.3 [default]
packages/core2-64-poky-linux/xz/xz-locale-pt-br: PKGSIZE changed from 22302 to 30957 (+39%)
packages/core2-64-poky-linux/xz/xz-locale-pt: PV changed from "5.6.2" to "5.6.3"
packages/core2-64-poky-linux/xz/xz-locale-pt: PKGV changed from 5.6.2 [default] to 5.6.3 [default]
packages/core2-64-poky-linux/xz/xz-locale-ro: PV changed from "5.6.2" to "5.6.3"
packages/core2-64-poky-linux/xz/xz-locale-ro: PKGV changed from 5.6.2 [default] to 5.6.3 [default]
packages/core2-64-poky-linux/xz/xz-locale-sr: PV changed from "5.6.2" to "5.6.3"
packages/core2-64-poky-linux/xz/xz-locale-sr: PKGV changed from 5.6.2 [default] to 5.6.3 [default]
packages/core2-64-poky-linux/xz/xz-locale-sv: PV changed from "5.6.2" to "5.6.3"
packages/core2-64-poky-linux/xz/xz-locale-sv: PKGV changed from 5.6.2 [default] to 5.6.3 [default]
packages/core2-64-poky-linux/xz/xz-locale-tr: PV changed from "5.6.2" to "5.6.3"
packages/core2-64-poky-linux/xz/xz-locale-tr: PKGV changed from 5.6.2 [default] to 5.6.3 [default]
packages/core2-64-poky-linux/xz/xz-locale-uk: PV changed from "5.6.2" to "5.6.3"
packages/core2-64-poky-linux/xz/xz-locale-uk: PKGV changed from 5.6.2 [default] to 5.6.3 [default]
packages/core2-64-poky-linux/xz/xz-locale-vi: PV changed from "5.6.2" to "5.6.3"
packages/core2-64-poky-linux/xz/xz-locale-vi: PKGV changed from 5.6.2 [default] to 5.6.3 [default]
packages/core2-64-poky-linux/xz/xz-locale-zh-cn: PV changed from "5.6.2" to "5.6.3"
packages/core2-64-poky-linux/xz/xz-locale-zh-cn: PKGV changed from 5.6.2 [default] to 5.6.3 [default]
packages/core2-64-poky-linux/xz/xz-locale-zh-cn: PKGSIZE changed from 22476 to 28989 (+29%)
packages/core2-64-poky-linux/xz/xz-locale-zh-tw: PV changed from "5.6.2" to "5.6.3"
packages/core2-64-poky-linux/xz/xz-locale-zh-tw: PKGV changed from 5.6.2 [default] to 5.6.3 [default]
packages/core2-64-poky-linux/xz/xz-ptest: PV changed from "5.6.2" to "5.6.3"
packages/core2-64-poky-linux/xz/xz-ptest: PKGV changed from 5.6.2 [default] to 5.6.3 [default]
packages/core2-64-poky-linux/xz/xz-src: PV changed from "5.6.2" to "5.6.3"
packages/core2-64-poky-linux/xz/xz-src: PKGV changed from 5.6.2 [default] to 5.6.3 [default]
packages/core2-64-poky-linux/xz/xz-src: PKGSIZE changed from 1647469 to 1648215 (+0%)
packages/core2-64-poky-linux/xz/xz-staticdev: PV changed from "5.6.2" to "5.6.3"
packages/core2-64-poky-linux/xz/xz-staticdev: PKGV changed from 5.6.2 [default] to 5.6.3 [default]
packages/core2-64-poky-linux/xz/xz: PV changed from "5.6.2" to "5.6.3"
packages/core2-64-poky-linux/xz/xz: PKGV changed from 5.6.2 [default] to 5.6.3 [default]
Changes to packages/x86_64-linux/xz-native (sysroot):
  /usr/lib/liblzma.so.5 changed symlink target from liblzma.so.5.6.2 to liblzma.so.5.6.3
  /usr/lib/liblzma.so changed symlink target from liblzma.so.5.6.2 to liblzma.so.5.6.3
  /usr/lib/liblzma.so.5.6.2 moved to /usr/lib/liblzma.so.5.6.3

--===============2918555657850892575==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-xz-upgrade-5.6.2-5.6.3.patch"

RnJvbSA1NDYzMTJlZmE3NWU4MGQ4NTFmOWM5NzgyZWYyZjEzMTRmOGFmMGY2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTAgT2N0IDIwMjQgMDQ6MTE6NTMgKzAwMDAKU3ViamVjdDogW1BBVENIXSB4
ejogdXBncmFkZSA1LjYuMiAtPiA1LjYuMwoKLS0tCiBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQveHov
e3h6XzUuNi4yLmJiID0+IHh6XzUuNi4zLmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1leHRlbmRlZC94
ei97eHpfNS42LjIuYmIgPT4geHpfNS42LjMuYmJ9ICg5NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWV4dGVuZGVkL3h6L3h6XzUuNi4yLmJiIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3h6
L3h6XzUuNi4zLmJiCnNpbWlsYXJpdHkgaW5kZXggOTclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBl
cy1leHRlbmRlZC94ei94el81LjYuMi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWV4dGVuZGVk
L3h6L3h6XzUuNi4zLmJiCmluZGV4IDk2ZmM2OTFlZjcuLjY3MDcwODUwYWIgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1leHRlbmRlZC94ei94el81LjYuMi5iYgorKysgYi9tZXRhL3JlY2lwZXMt
ZXh0ZW5kZWQveHoveHpfNS42LjMuYmIKQEAgLTI4LDcgKzI4LDcgQEAgTElDX0ZJTEVTX0NIS1NV
TSA9ICJmaWxlOi8vQ09QWUlORzttZDU9YzAyZGU3MTJiMDI4YTVjYzdlMjI0NzJlOGYyYjNkYjEg
XAogU1JDX1VSSSA9ICJodHRwczovL2dpdGh1Yi5jb20vdHVrYWFuaS1wcm9qZWN0L3h6L3JlbGVh
c2VzL2Rvd25sb2FkL3Yke1BWfS94ei0ke1BWfS50YXIuZ3ogXAogICAgICAgICAgICBmaWxlOi8v
cnVuLXB0ZXN0IFwKICAgICAgICAgICAiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiOGJmZDIwYzBl
MWQ4NmYwNDAyZjI0OTdjZmE3MWM2YWI2MmQ0Y2QzNWZkNzA0Mjc2ZTMxNDBiZmI3MTQxNDUxOSIK
K1NSQ19VUklbc2hhMjU2c3VtXSA9ICJiMWQ0NTI5NWQzZjcxZjI1YTRjOTEwMWJkN2M4ZDE2Y2I1
NjM0OGJiZWYzYmJjNzM4ZGEwMzUxZTE3YzczMzE3IgogVVBTVFJFQU1fQ0hFQ0tfUkVHRVggPSAi
cmVsZWFzZXMvdGFnL3YoP1A8cHZlcj5cZCsoXC5cZCspKykiCiBVUFNUUkVBTV9DSEVDS19VUkkg
PSAiaHR0cHM6Ly9naXRodWIuY29tL3R1a2FhbmktcHJvamVjdC94ei9yZWxlYXNlcy8iCiAKLS0g
CjIuNDQuMQoK

--===============2918555657850892575==--

