Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54CF2CD13D6
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 18:03:33 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.44637.1711994601281404414
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Apr 2024 11:03:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=AYRhot/N;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=TBnUPn05;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018e9ad47c35-5e7ca7e9-2b09-4366-ae34-7f7f87b2f408-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1711994600;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=HXmoKflsneDLPhPGwUfbNyvAS/SuA3c2fbPJdqrmr8w=;
	b=AYRhot/NV/bFby+Q8MRImisKuwRD3WD3wxjCx+ar9vU/0d4cAM+YkD5GFCTEDnUB
	ZYU0NrNZmLyqM4RwDRZe4cTESqZ3sTNRDkbdfWP/mD72yEjoi1wr53qFwLxKYCxwQOR
	2ukOVPx0zURufEZBHQmam0KAC6ZxDalIAV2RWE1c=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1711994600;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=HXmoKflsneDLPhPGwUfbNyvAS/SuA3c2fbPJdqrmr8w=;
	b=TBnUPn05k1tcIsx2qHw2eSI5zshd2UQYFlCp5MajFtR0YXTTme5sfM/r4siZ0GYs
	Sn3pihzkTvyBCBDc956OMOp6AiUC35uh5gszHtKmtdfeHPMSONapy/Yj/F5UixDx3J4
	yysuJi3xTa0kKlVVwQxD9JY1qlN1dDsM66Yv/VWY=
Content-Type: multipart/mixed; boundary="===============2146218030759727215=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libxml2: upgrading to 2.12.6 SUCCEEDED
Message-ID: <0101018e9ad47c35-5e7ca7e9-2b09-4366-ae34-7f7f87b2f408-000000@us-west-2.amazonses.com>
Date: Mon, 1 Apr 2024 18:03:20 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 18:03:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197699

--===============2146218030759727215==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libxml2* to *2.12.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libxml2-upgrade-2.12.5-2.12.6.patch
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
From 7c7d65d7aa2f574e8abe8bd7ea93955345f7855c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Apr 2024 06:30:11 +0000
Subject: [PATCH] libxml2: upgrade 2.12.5 -> 2.12.6

---
 meta/recipes-core/libxml/libxml2/install-tests.patch            | 2 +-
 .../libxml/{libxml2_2.12.5.bb => libxml2_2.12.6.bb}             | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/libxml/{libxml2_2.12.5.bb => libxml2_2.12.6.bb} (97%)

diff --git a/meta/recipes-core/libxml/libxml2/install-tests.patch b/meta/recipes-core/libxml/libxml2/install-tests.patch
index 478eeea81b..c65cf9c8ff 100644
--- a/meta/recipes-core/libxml/libxml2/install-tests.patch
+++ b/meta/recipes-core/libxml/libxml2/install-tests.patch
@@ -1,4 +1,4 @@
-From 0779511838a8cbd1e0f431c22f28f286a2a37b1b Mon Sep 17 00:00:00 2001
+From 70509eb6d711b1a9c5d5bd63fd96dcbd1744d26d Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Mon, 5 Dec 2022 17:02:32 +0000
 Subject: [PATCH] add yocto-specific install-ptest target
diff --git a/meta/recipes-core/libxml/libxml2_2.12.5.bb b/meta/recipes-core/libxml/libxml2_2.12.6.bb
similarity index 97%
rename from meta/recipes-core/libxml/libxml2_2.12.5.bb
rename to meta/recipes-core/libxml/libxml2_2.12.6.bb
index 47c1a72e77..14fcff7fa4 100644
--- a/meta/recipes-core/libxml/libxml2_2.12.5.bb
+++ b/meta/recipes-core/libxml/libxml2_2.12.6.bb
@@ -20,7 +20,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://install-tests.patch \
            "
 
-SRC_URI[archive.sha256sum] = "a972796696afd38073e0f59c283c3a2f5a560b5268b4babc391b286166526b21"
+SRC_URI[archive.sha256sum] = "889c593a881a3db5fdd96cc9318c87df34eb648edfc458272ad46fd607353fbb"
 SRC_URI[testtar.sha256sum] = "c6b2d42ee50b8b236e711a97d68e6c4b5c8d83e69a2be4722379f08702ea7273"
 
 # Disputed as a security issue, but fixed in d39f780
-- 
2.42.0


--===============2146218030759727215==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/libxml2/libxml2: FILELIST: removed "/usr/lib/libxml2.so.2.12.5", added "/usr/lib/libxml2.so.2.12.6"
Changes to packages/core2-64-poky-linux/libxml2 (sysroot):
  /usr/lib/libxml2.so.2 changed symlink target from libxml2.so.2.12.5 to libxml2.so.2.12.6
  /usr/lib/libxml2.so changed symlink target from libxml2.so.2.12.5 to libxml2.so.2.12.6
  /usr/lib/libxml2.so.2.12.5 moved to /usr/lib/libxml2.so.2.12.6
Changes to packages/x86_64-linux/libxml2-native (sysroot):
  /usr/lib/libxml2.so.2 changed symlink target from libxml2.so.2.12.5 to libxml2.so.2.12.6
  /usr/lib/libxml2.so changed symlink target from libxml2.so.2.12.5 to libxml2.so.2.12.6
  /usr/lib/libxml2.so.2.12.5 moved to /usr/lib/libxml2.so.2.12.6

--===============2146218030759727215==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libxml2-upgrade-2.12.5-2.12.6.patch"

RnJvbSA3YzdkNjVkN2FhMmY1NzRlOGFiZThiZDdlYTkzOTU1MzQ1Zjc4NTVjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBBcHIgMjAyNCAwNjozMDoxMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnhtbDI6IHVwZ3JhZGUgMi4xMi41IC0+IDIuMTIuNgoKLS0tCiBtZXRhL3JlY2lwZXMtY29yZS9s
aWJ4bWwvbGlieG1sMi9pbnN0YWxsLXRlc3RzLnBhdGNoICAgICAgICAgICAgfCAyICstCiAuLi4v
bGlieG1sL3tsaWJ4bWwyXzIuMTIuNS5iYiA9PiBsaWJ4bWwyXzIuMTIuNi5iYn0gICAgICAgICAg
ICAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtY29yZS9saWJ4bWwve2xpYnhtbDJfMi4xMi41LmJiID0+
IGxpYnhtbDJfMi4xMi42LmJifSAoOTclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3Jl
L2xpYnhtbC9saWJ4bWwyL2luc3RhbGwtdGVzdHMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS9s
aWJ4bWwvbGlieG1sMi9pbnN0YWxsLXRlc3RzLnBhdGNoCmluZGV4IDQ3OGVlZWE4MWIuLmM2NWNm
OWM4ZmYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2xpYnhtbC9saWJ4bWwyL2luc3Rh
bGwtdGVzdHMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvbGlieG1sL2xpYnhtbDIvaW5z
dGFsbC10ZXN0cy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMDc3OTUxMTgzOGE4Y2JkMWUw
ZjQzMWMyMmYyOGYyODZhMmEzN2IxYiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNzA1
MDllYjZkNzExYjFhOWM1ZDViZDYzZmQ5NmRjYmQxNzQ0ZDI2ZCBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKIEZyb206IFJvc3MgQnVydG9uIDxyb3NzLmJ1cnRvbkBhcm0uY29tPgogRGF0ZTogTW9u
LCA1IERlYyAyMDIyIDE3OjAyOjMyICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIGFkZCB5b2N0by1z
cGVjaWZpYyBpbnN0YWxsLXB0ZXN0IHRhcmdldApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNv
cmUvbGlieG1sL2xpYnhtbDJfMi4xMi41LmJiIGIvbWV0YS9yZWNpcGVzLWNvcmUvbGlieG1sL2xp
YnhtbDJfMi4xMi42LmJiCnNpbWlsYXJpdHkgaW5kZXggOTclCnJlbmFtZSBmcm9tIG1ldGEvcmVj
aXBlcy1jb3JlL2xpYnhtbC9saWJ4bWwyXzIuMTIuNS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVz
LWNvcmUvbGlieG1sL2xpYnhtbDJfMi4xMi42LmJiCmluZGV4IDQ3YzFhNzJlNzcuLjE0ZmNmZjdm
YTQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2xpYnhtbC9saWJ4bWwyXzIuMTIuNS5i
YgorKysgYi9tZXRhL3JlY2lwZXMtY29yZS9saWJ4bWwvbGlieG1sMl8yLjEyLjYuYmIKQEAgLTIw
LDcgKzIwLDcgQEAgU1JDX1VSSSArPSAiaHR0cDovL3d3dy53My5vcmcvWE1ML1Rlc3QveG1sdHMy
MDEzMDkyMy50YXI7c3ViZGlyPSR7QlB9O25hbWU9dGVzdHQKICAgICAgICAgICAgZmlsZTovL2lu
c3RhbGwtdGVzdHMucGF0Y2ggXAogICAgICAgICAgICAiCiAKLVNSQ19VUklbYXJjaGl2ZS5zaGEy
NTZzdW1dID0gImE5NzI3OTY2OTZhZmQzODA3M2UwZjU5YzI4M2MzYTJmNWE1NjBiNTI2OGI0YmFi
YzM5MWIyODYxNjY1MjZiMjEiCitTUkNfVVJJW2FyY2hpdmUuc2hhMjU2c3VtXSA9ICI4ODljNTkz
YTg4MWEzZGI1ZmRkOTZjYzkzMThjODdkZjM0ZWI2NDhlZGZjNDU4MjcyYWQ0NmZkNjA3MzUzZmJi
IgogU1JDX1VSSVt0ZXN0dGFyLnNoYTI1NnN1bV0gPSAiYzZiMmQ0MmVlNTBiOGIyMzZlNzExYTk3
ZDY4ZTZjNGI1YzhkODNlNjlhMmJlNDcyMjM3OWYwODcwMmVhNzI3MyIKIAogIyBEaXNwdXRlZCBh
cyBhIHNlY3VyaXR5IGlzc3VlLCBidXQgZml4ZWQgaW4gZDM5Zjc4MAotLSAKMi40Mi4wCgo=

--===============2146218030759727215==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libxml2: SRC_URI changed from "https://download.gnome.org/sources//libxml2/2.12/libxml2-2.12.5.tar.xz;name=archive http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=libxml2-2.12.5;name=testtar file://run-ptest file://install-tests.patch" to "https://download.gnome.org/sources//libxml2/2.12/libxml2-2.12.6.tar.xz;name=archive http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=libxml2-2.12.6;name=testtar file://run-ptest file://install-tests.patch"
packages/core2-64-poky-linux/libxml2: PV changed from "2.12.5" to "2.12.6"
packages/core2-64-poky-linux/libxml2: PKGV changed from 2.12.5 [default] to 2.12.6 [default]
packages/core2-64-poky-linux/libxml2/libxml2-dbg: PV changed from "2.12.5" to "2.12.6"
packages/core2-64-poky-linux/libxml2/libxml2-dbg: FILELIST: removed "/usr/lib/.debug/libxml2.so.2.12.5", added "/usr/lib/.debug/libxml2.so.2.12.6"
packages/core2-64-poky-linux/libxml2/libxml2-dbg: PKGV changed from 2.12.5 [default] to 2.12.6 [default]
packages/core2-64-poky-linux/libxml2/libxml2-dbg: PKGSIZE changed from 7513120 to 7515960 (+0%)
packages/core2-64-poky-linux/libxml2/libxml2-dev: PV changed from "2.12.5" to "2.12.6"
packages/core2-64-poky-linux/libxml2/libxml2-dev: PKGV changed from 2.12.5 [default] to 2.12.6 [default]
packages/core2-64-poky-linux/libxml2/libxml2-doc: PV changed from "2.12.5" to "2.12.6"
packages/core2-64-poky-linux/libxml2/libxml2-doc: PKGV changed from 2.12.5 [default] to 2.12.6 [default]
packages/core2-64-poky-linux/libxml2/libxml2-doc: PKGSIZE changed from 3119076 to 3119599 (+0%)
packages/core2-64-poky-linux/libxml2/libxml2-locale: PV changed from "2.12.5" to "2.12.6"
packages/core2-64-poky-linux/libxml2/libxml2-locale: PKGV changed from 2.12.5 [default] to 2.12.6 [default]
packages/core2-64-poky-linux/libxml2/libxml2-ptest: PV changed from "2.12.5" to "2.12.6"
packages/core2-64-poky-linux/libxml2/libxml2-ptest: PKGV changed from 2.12.5 [default] to 2.12.6 [default]
packages/core2-64-poky-linux/libxml2/libxml2-python: PV changed from "2.12.5" to "2.12.6"
packages/core2-64-poky-linux/libxml2/libxml2-python: PKGV changed from 2.12.5 [default] to 2.12.6 [default]
packages/core2-64-poky-linux/libxml2/libxml2-src: PV changed from "2.12.5" to "2.12.6"
packages/core2-64-poky-linux/libxml2/libxml2-src: PKGV changed from 2.12.5 [default] to 2.12.6 [default]
packages/core2-64-poky-linux/libxml2/libxml2-src: PKGSIZE changed from 7763131 to 7764699 (+0%)
packages/core2-64-poky-linux/libxml2/libxml2-staticdev: PV changed from "2.12.5" to "2.12.6"
packages/core2-64-poky-linux/libxml2/libxml2-staticdev: PKGV changed from 2.12.5 [default] to 2.12.6 [default]
packages/core2-64-poky-linux/libxml2/libxml2-utils: PV changed from "2.12.5" to "2.12.6"
packages/core2-64-poky-linux/libxml2/libxml2-utils: PKGV changed from 2.12.5 [default] to 2.12.6 [default]
packages/core2-64-poky-linux/libxml2/libxml2: PV changed from "2.12.5" to "2.12.6"
packages/core2-64-poky-linux/libxml2/libxml2: FILELIST: removed "/usr/lib/libxml2.so.2.12.5", added "/usr/lib/libxml2.so.2.12.6"
packages/core2-64-poky-linux/libxml2/libxml2: PKGV changed from 2.12.5 [default] to 2.12.6 [default]
Changes to packages/core2-64-poky-linux/libxml2 (sysroot):
  /usr/lib/libxml2.so.2 changed symlink target from libxml2.so.2.12.5 to libxml2.so.2.12.6
  /usr/lib/libxml2.so changed symlink target from libxml2.so.2.12.5 to libxml2.so.2.12.6
  /usr/lib/libxml2.so.2.12.5 moved to /usr/lib/libxml2.so.2.12.6
Changes to packages/x86_64-linux/libxml2-native (sysroot):
  /usr/lib/libxml2.so.2 changed symlink target from libxml2.so.2.12.5 to libxml2.so.2.12.6
  /usr/lib/libxml2.so changed symlink target from libxml2.so.2.12.5 to libxml2.so.2.12.6
  /usr/lib/libxml2.so.2.12.5 moved to /usr/lib/libxml2.so.2.12.6

--===============2146218030759727215==--

