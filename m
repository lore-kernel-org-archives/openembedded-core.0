Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B16A8CA1003
	for <webhook@archiver.kernel.org>; Sat,  2 Sep 2023 10:29:13 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.5668.1693650552427791468
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Sep 2023 03:29:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=UitjeA8g;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=l+DLuTcf;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018a55708366-28d40df5-78d1-4ffd-81ca-16acc3d5aaa1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1693650551;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=n3GQ66cTd6g953UYfUX69ywwUiSzmVmIguN6qk/Q+Pg=;
	b=UitjeA8gp3G+il7So7bvZ4zvLX8hsse398ncR1zGFJZhWdBwxN9p5zLJiWdKKO+w
	lCcoS1qMqKY5RN7WGQ+HzlZP+YMprl2Tnh0av44TLQtSJAAnDhGcYBc4BX08dnrFtR9
	uOwqqIXfbw2YrSMkO5hAd6+749mWwALESvhaCjU8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1693650551;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=n3GQ66cTd6g953UYfUX69ywwUiSzmVmIguN6qk/Q+Pg=;
	b=l+DLuTcfDGvDl0RiS5y3xznzZ2qIuQgr3itHDRPQHXltHjZiLe4jbuoC9tMdtGKV
	w8HdxF+Z+sp5SJkdOGBPmudQo2oo8rYQCI2haPAmj279PQeALkbTMNbhoFr+PvGBn89
	YHPFVavROE6cWN5p0jM/cjWlttHiUwEjDOlsbha4=
Content-Type: multipart/mixed; boundary="===============1080261838007941072=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libxml2: upgrading to 2.11.5 SUCCEEDED
Message-ID: <0101018a55708366-28d40df5-78d1-4ffd-81ca-16acc3d5aaa1-000000@us-west-2.amazonses.com>
Date: Sat, 2 Sep 2023 10:29:11 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.09.02-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Sep 2023 10:29:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187038

--===============1080261838007941072==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libxml2* to *2.11.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libxml2-upgrade-2.11.4-2.11.5.patch
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
From 6631ddcc9b0ccb5fd0ef359d9ad89e35d837fa5b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Sep 2023 09:36:43 +0000
Subject: [PATCH] libxml2: upgrade 2.11.4 -> 2.11.5

---
 .../libxml/{libxml2_2.11.4.bb => libxml2_2.11.5.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/libxml/{libxml2_2.11.4.bb => libxml2_2.11.5.bb} (97%)

diff --git a/meta/recipes-core/libxml/libxml2_2.11.4.bb b/meta/recipes-core/libxml/libxml2_2.11.5.bb
similarity index 97%
rename from meta/recipes-core/libxml/libxml2_2.11.4.bb
rename to meta/recipes-core/libxml/libxml2_2.11.5.bb
index cbf20504f8..4cf6dd09a9 100644
--- a/meta/recipes-core/libxml/libxml2_2.11.4.bb
+++ b/meta/recipes-core/libxml/libxml2_2.11.5.bb
@@ -18,7 +18,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://install-tests.patch \
            "
 
-SRC_URI[archive.sha256sum] = "737e1d7f8ab3f139729ca13a2494fd17bf30ddb4b7a427cf336252cab57f57f7"
+SRC_URI[archive.sha256sum] = "3727b078c360ec69fa869de14bd6f75d7ee8d36987b071e6928d4720a28df3a6"
 SRC_URI[testtar.sha256sum] = "c6b2d42ee50b8b236e711a97d68e6c4b5c8d83e69a2be4722379f08702ea7273"
 
 BINCONFIG = "${bindir}/xml2-config"
-- 
2.39.2


--===============1080261838007941072==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libxml2: PKGV changed from 2.11.4 [default] to 2.11.5 [default]
packages/core2-32-poky-linux/libxml2: SRC_URI changed from "https://download.gnome.org/sources//libxml2/2.11/libxml2-2.11.4.tar.xz;name=archive http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=libxml2-2.11.4;name=testtar file://run-ptest file://install-tests.patch" to "https://download.gnome.org/sources//libxml2/2.11/libxml2-2.11.5.tar.xz;name=archive http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=libxml2-2.11.5;name=testtar file://run-ptest file://install-tests.patch"
packages/core2-32-poky-linux/libxml2: PV changed from "2.11.4" to "2.11.5"
packages/core2-32-poky-linux/libxml2/libxml2-dbg: PKGV changed from 2.11.4 [default] to 2.11.5 [default]
packages/core2-32-poky-linux/libxml2/libxml2-dbg: PV changed from "2.11.4" to "2.11.5"
packages/core2-32-poky-linux/libxml2/libxml2-dbg: FILELIST: removed "/usr/lib/.debug/libxml2.so.2.11.4", added "/usr/lib/.debug/libxml2.so.2.11.5"
packages/core2-32-poky-linux/libxml2/libxml2-dbg: PKGSIZE changed from 6351992 to 6352084 (+0%)
packages/core2-32-poky-linux/libxml2/libxml2-dev: PKGV changed from 2.11.4 [default] to 2.11.5 [default]
packages/core2-32-poky-linux/libxml2/libxml2-dev: PV changed from "2.11.4" to "2.11.5"
packages/core2-32-poky-linux/libxml2/libxml2-doc: PKGV changed from 2.11.4 [default] to 2.11.5 [default]
packages/core2-32-poky-linux/libxml2/libxml2-doc: PV changed from "2.11.4" to "2.11.5"
packages/core2-32-poky-linux/libxml2/libxml2-locale: PKGV changed from 2.11.4 [default] to 2.11.5 [default]
packages/core2-32-poky-linux/libxml2/libxml2-locale: PV changed from "2.11.4" to "2.11.5"
packages/core2-32-poky-linux/libxml2/libxml2-ptest: PKGV changed from 2.11.4 [default] to 2.11.5 [default]
packages/core2-32-poky-linux/libxml2/libxml2-ptest: PV changed from "2.11.4" to "2.11.5"
packages/core2-32-poky-linux/libxml2/libxml2-python: PKGV changed from 2.11.4 [default] to 2.11.5 [default]
packages/core2-32-poky-linux/libxml2/libxml2-python: PV changed from "2.11.4" to "2.11.5"
packages/core2-32-poky-linux/libxml2/libxml2-src: PKGV changed from 2.11.4 [default] to 2.11.5 [default]
packages/core2-32-poky-linux/libxml2/libxml2-src: PV changed from "2.11.4" to "2.11.5"
packages/core2-32-poky-linux/libxml2/libxml2-src: PKGSIZE changed from 7845637 to 7846177 (+0%)
packages/core2-32-poky-linux/libxml2/libxml2-staticdev: PKGV changed from 2.11.4 [default] to 2.11.5 [default]
packages/core2-32-poky-linux/libxml2/libxml2-staticdev: PV changed from "2.11.4" to "2.11.5"
packages/core2-32-poky-linux/libxml2/libxml2-utils: PKGV changed from 2.11.4 [default] to 2.11.5 [default]
packages/core2-32-poky-linux/libxml2/libxml2-utils: PV changed from "2.11.4" to "2.11.5"
packages/core2-32-poky-linux/libxml2/libxml2: PKGV changed from 2.11.4 [default] to 2.11.5 [default]
packages/core2-32-poky-linux/libxml2/libxml2: PV changed from "2.11.4" to "2.11.5"
packages/core2-32-poky-linux/libxml2/libxml2: FILELIST: removed "/usr/lib/libxml2.so.2.11.4", added "/usr/lib/libxml2.so.2.11.5"
Changes to packages/core2-32-poky-linux/libxml2 (sysroot):
  /usr/lib/libxml2.so.2 changed symlink target from libxml2.so.2.11.4 to libxml2.so.2.11.5
  /usr/lib/libxml2.so changed symlink target from libxml2.so.2.11.4 to libxml2.so.2.11.5
  /usr/lib/libxml2.so.2.11.4 moved to /usr/lib/libxml2.so.2.11.5
Changes to packages/x86_64-linux/libxml2-native (sysroot):
  /usr/lib/libxml2.so.2 changed symlink target from libxml2.so.2.11.4 to libxml2.so.2.11.5
  /usr/lib/libxml2.so changed symlink target from libxml2.so.2.11.4 to libxml2.so.2.11.5
  /usr/lib/libxml2.so.2.11.4 moved to /usr/lib/libxml2.so.2.11.5

--===============1080261838007941072==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libxml2-upgrade-2.11.4-2.11.5.patch"

RnJvbSA2NjMxZGRjYzliMGNjYjVmZDBlZjM1OWQ5YWQ4OWUzNWQ4MzdmYTViIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBTZXAgMjAyMyAwOTozNjo0MyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnhtbDI6IHVwZ3JhZGUgMi4xMS40IC0+IDIuMTEuNQoKLS0tCiAuLi4vbGlieG1sL3tsaWJ4bWwy
XzIuMTEuNC5iYiA9PiBsaWJ4bWwyXzIuMTEuNS5iYn0gICAgICAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtY29yZS9saWJ4bWwve2xpYnhtbDJfMi4xMS40LmJiID0+IGxpYnhtbDJfMi4xMS41LmJi
fSAoOTclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2xpYnhtbC9saWJ4bWwyXzIu
MTEuNC5iYiBiL21ldGEvcmVjaXBlcy1jb3JlL2xpYnhtbC9saWJ4bWwyXzIuMTEuNS5iYgpzaW1p
bGFyaXR5IGluZGV4IDk3JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29yZS9saWJ4bWwvbGli
eG1sMl8yLjExLjQuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb3JlL2xpYnhtbC9saWJ4bWwy
XzIuMTEuNS5iYgppbmRleCBjYmYyMDUwNGY4Li40Y2Y2ZGQwOWE5IDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtY29yZS9saWJ4bWwvbGlieG1sMl8yLjExLjQuYmIKKysrIGIvbWV0YS9yZWNpcGVz
LWNvcmUvbGlieG1sL2xpYnhtbDJfMi4xMS41LmJiCkBAIC0xOCw3ICsxOCw3IEBAIFNSQ19VUkkg
Kz0gImh0dHA6Ly93d3cudzMub3JnL1hNTC9UZXN0L3htbHRzMjAxMzA5MjMudGFyO3N1YmRpcj0k
e0JQfTtuYW1lPXRlc3R0CiAgICAgICAgICAgIGZpbGU6Ly9pbnN0YWxsLXRlc3RzLnBhdGNoIFwK
ICAgICAgICAgICAgIgogCi1TUkNfVVJJW2FyY2hpdmUuc2hhMjU2c3VtXSA9ICI3MzdlMWQ3Zjhh
YjNmMTM5NzI5Y2ExM2EyNDk0ZmQxN2JmMzBkZGI0YjdhNDI3Y2YzMzYyNTJjYWI1N2Y1N2Y3Igor
U1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0gPSAiMzcyN2IwNzhjMzYwZWM2OWZhODY5ZGUxNGJk
NmY3NWQ3ZWU4ZDM2OTg3YjA3MWU2OTI4ZDQ3MjBhMjhkZjNhNiIKIFNSQ19VUklbdGVzdHRhci5z
aGEyNTZzdW1dID0gImM2YjJkNDJlZTUwYjhiMjM2ZTcxMWE5N2Q2OGU2YzRiNWM4ZDgzZTY5YTJi
ZTQ3MjIzNzlmMDg3MDJlYTcyNzMiCiAKIEJJTkNPTkZJRyA9ICIke2JpbmRpcn0veG1sMi1jb25m
aWciCi0tIAoyLjM5LjIKCg==

--===============1080261838007941072==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libxml2/libxml2: FILELIST: removed "/usr/lib/libxml2.so.2.11.4", added "/usr/lib/libxml2.so.2.11.5"
Changes to packages/core2-32-poky-linux/libxml2 (sysroot):
  /usr/lib/libxml2.so.2 changed symlink target from libxml2.so.2.11.4 to libxml2.so.2.11.5
  /usr/lib/libxml2.so changed symlink target from libxml2.so.2.11.4 to libxml2.so.2.11.5
  /usr/lib/libxml2.so.2.11.4 moved to /usr/lib/libxml2.so.2.11.5
Changes to packages/x86_64-linux/libxml2-native (sysroot):
  /usr/lib/libxml2.so.2 changed symlink target from libxml2.so.2.11.4 to libxml2.so.2.11.5
  /usr/lib/libxml2.so changed symlink target from libxml2.so.2.11.4 to libxml2.so.2.11.5
  /usr/lib/libxml2.so.2.11.4 moved to /usr/lib/libxml2.so.2.11.5

--===============1080261838007941072==--

