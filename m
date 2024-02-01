Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37C8EC48286
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 18:00:14 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.2088.1706810404217592641
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 10:00:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=dtW3C9aP;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=cdy/IgN2;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018d65d3e99d-12fef906-8f50-43ed-b001-9b8d97f91178-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1706810403;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=xPtXc/LU8JGVxXq46lTCEkdMTPUSlSIb5ZGAj9/UhLA=;
	b=dtW3C9aPhDC9d7mXiz27O2STJwFIrC8nFp1WDq5xD22uerhNOrBwj4PBKfFEF4s+
	bSmljNIN4x9p0/yPpw3Fd2Le4D8IpfE1snDYYFFbp5+PjD3tjD0gZgfmNkZCVVJo595
	yaNghyh+DvYW2r1ePw3m59sZaAg/wccWiiDYPte8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1706810403;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=xPtXc/LU8JGVxXq46lTCEkdMTPUSlSIb5ZGAj9/UhLA=;
	b=cdy/IgN24qTByvnaxmrE59iZyyG6W0qfR6h8ZVc2HV/XRljH6xhZsJUVQW/PvJmn
	YRt7NgSmbqFlucGeFcrQd5kF7nIbwVtsaamkbz91obPyg5P+ZW3QBE2fhgpX2menfQU
	Hxdw4jHH9515ITfRS4ewe1Ad/ERv85QGRBji8vh4=
Content-Type: multipart/mixed; boundary="===============8345600096562106758=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] efivar: upgrading to 39 SUCCEEDED
Message-ID: <0101018d65d3e99d-12fef906-8f50-43ed-b001-9b8d97f91178-000000@us-west-2.amazonses.com>
Date: Thu, 1 Feb 2024 18:00:03 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 18:00:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194598

--===============8345600096562106758==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *efivar* to *39* has Succeeded.

Next steps:
    - apply the patch: git am 0001-efivar-upgrade-38-39.patch
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
From f39a64bc99a11b3391418a816ee8fe58e338b504 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Feb 2024 05:01:34 +0000
Subject: [PATCH] efivar: upgrade 38 -> 39

---
 .../efivar/0001-docs-do-not-build-efisecdb-manpage.patch      | 3 ++-
 meta/recipes-bsp/efivar/efivar_38.bb                          | 4 +++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/efivar/efivar/0001-docs-do-not-build-efisecdb-manpage.patch b/meta/recipes-bsp/efivar/efivar/0001-docs-do-not-build-efisecdb-manpage.patch
index cb30d3c430..c87e4672eb 100644
--- a/meta/recipes-bsp/efivar/efivar/0001-docs-do-not-build-efisecdb-manpage.patch
+++ b/meta/recipes-bsp/efivar/efivar/0001-docs-do-not-build-efisecdb-manpage.patch
@@ -1,4 +1,4 @@
-From f39a1481a9e465387901d52b07ae56dedcc3838b Mon Sep 17 00:00:00 2001
+From 15683a831ad830b7de3ed5feea8aecd76fc1abeb Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Sun, 16 Jan 2022 18:25:33 +0100
 Subject: [PATCH] docs: do not build efisecdb manpage
@@ -7,6 +7,7 @@ It requires mandoc, which oe-core does not have.
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+
 ---
  docs/Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/meta/recipes-bsp/efivar/efivar_38.bb b/meta/recipes-bsp/efivar/efivar_38.bb
index d88eb3fef5..3500acf88b 100644
--- a/meta/recipes-bsp/efivar/efivar_38.bb
+++ b/meta/recipes-bsp/efivar/efivar_38.bb
@@ -10,7 +10,7 @@ COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
 SRC_URI = "git://github.com/rhinstaller/efivar.git;branch=main;protocol=https \
            file://0001-docs-do-not-build-efisecdb-manpage.patch \
            "
-SRCREV = "90e88b221e8bc60dc50f3246051369b8f580c0d0"
+SRCREV = "c47820c37ac26286559ec004de07d48d05f3308c"
 PV .= "+39+git"
 
 S = "${WORKDIR}/git"
@@ -32,3 +32,5 @@ BBCLASSEXTEND = "native"
 RRECOMMENDS:${PN}:class-target = "kernel-module-efivarfs"
 
 CLEANBROKEN = "1"
+
+PV = "39"
-- 
2.42.0


--===============8345600096562106758==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/efivar/efivar-dbg: PKGV changed from 38+39+git0+90e88b221e to 39 [default]
packages/core2-64-poky-linux/efivar/efivar-dev: PKGV changed from 38+39+git0+90e88b221e to 39 [default]
packages/core2-64-poky-linux/efivar/efivar-doc: PKGV changed from 38+39+git0+90e88b221e to 39 [default]
packages/core2-64-poky-linux/efivar/efivar-locale: PKGV changed from 38+39+git0+90e88b221e to 39 [default]
packages/core2-64-poky-linux/efivar/efivar-src: PKGV changed from 38+39+git0+90e88b221e to 39 [default]
packages/core2-64-poky-linux/efivar/efivar-staticdev: PKGV changed from 38+39+git0+90e88b221e to 39 [default]
packages/core2-64-poky-linux/efivar/efivar: PKGV changed from 38+39+git0+90e88b221e to 39 [default]
packages/core2-64-poky-linux/efivar/efivar: FILELIST: removed "/usr/lib/libefivar.so.1.38 /usr/lib/libefiboot.so.1.38 /usr/lib/libefisec.so.1.38", added "/usr/lib/libefivar.so.1.39 /usr/lib/libefisec.so.1.39 /usr/lib/libefiboot.so.1.39"
Changes to packages/core2-64-poky-linux/efivar (sysroot):
  /usr/lib/libefiboot.so.1 changed symlink target from libefiboot.so.1.38 to libefiboot.so.1.39
  /usr/lib/libefiboot.so changed symlink target from libefiboot.so.1.38 to libefiboot.so.1.39
  /usr/lib/libefisec.so.1 changed symlink target from libefisec.so.1.38 to libefisec.so.1.39
  /usr/lib/libefisec.so changed symlink target from libefisec.so.1.38 to libefisec.so.1.39
  /usr/lib/libefivar.so.1 changed symlink target from libefivar.so.1.38 to libefivar.so.1.39
  /usr/lib/libefivar.so changed symlink target from libefivar.so.1.38 to libefivar.so.1.39
  /usr/lib/libefiboot.so.1.38 moved to /usr/lib/libefiboot.so.1.39
  /usr/lib/libefisec.so.1.38 moved to /usr/lib/libefisec.so.1.39
  /usr/lib/libefivar.so.1.38 moved to /usr/lib/libefivar.so.1.39

--===============8345600096562106758==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/efivar/efivar-dbg: FILELIST: removed "/usr/lib/.debug/libefiboot.so.1.38 /usr/lib/.debug/libefivar.so.1.38 /usr/lib/.debug/libefisec.so.1.38", added "/usr/lib/.debug/libefisec.so.1.39 /usr/lib/.debug/libefiboot.so.1.39 /usr/lib/.debug/libefivar.so.1.39"
packages/core2-64-poky-linux/efivar/efivar-dbg: PV changed from "38+39+git" to "39"
packages/core2-64-poky-linux/efivar/efivar-dbg: PKGSIZE changed from 1144584 to 1141272 (-0%)
packages/core2-64-poky-linux/efivar/efivar-dbg: PKGV changed from 38+39+git0+90e88b221e to 39 [default]
packages/core2-64-poky-linux/efivar/efivar-dev: PV changed from "38+39+git" to "39"
packages/core2-64-poky-linux/efivar/efivar-dev: PKGSIZE changed from 67885 to 67853 (-0%)
packages/core2-64-poky-linux/efivar/efivar-dev: PKGV changed from 38+39+git0+90e88b221e to 39 [default]
packages/core2-64-poky-linux/efivar/efivar-doc: PV changed from "38+39+git" to "39"
packages/core2-64-poky-linux/efivar/efivar-doc: PKGV changed from 38+39+git0+90e88b221e to 39 [default]
packages/core2-64-poky-linux/efivar/efivar-locale: PV changed from "38+39+git" to "39"
packages/core2-64-poky-linux/efivar/efivar-locale: PKGV changed from 38+39+git0+90e88b221e to 39 [default]
packages/core2-64-poky-linux/efivar/efivar-src: PV changed from "38+39+git" to "39"
packages/core2-64-poky-linux/efivar/efivar-src: PKGSIZE changed from 490931 to 490953 (+0%)
packages/core2-64-poky-linux/efivar/efivar-src: PKGV changed from 38+39+git0+90e88b221e to 39 [default]
packages/core2-64-poky-linux/efivar/efivar-staticdev: PV changed from "38+39+git" to "39"
packages/core2-64-poky-linux/efivar/efivar-staticdev: PKGV changed from 38+39+git0+90e88b221e to 39 [default]
packages/core2-64-poky-linux/efivar/efivar: FILELIST: removed "/usr/lib/libefisec.so.1.38 /usr/lib/libefiboot.so.1.38 /usr/lib/libefivar.so.1.38", added "/usr/lib/libefisec.so.1.39 /usr/lib/libefiboot.so.1.39 /usr/lib/libefivar.so.1.39"
packages/core2-64-poky-linux/efivar/efivar: PV changed from "38+39+git" to "39"
packages/core2-64-poky-linux/efivar/efivar: PKGV changed from 38+39+git0+90e88b221e to 39 [default]
packages/core2-64-poky-linux/efivar: PKGV changed from 38+39+git [default] to 39 [default]
packages/core2-64-poky-linux/efivar: PV changed from "38+39+git" to "39"
Changes to packages/core2-64-poky-linux/efivar (sysroot):
  /usr/lib/libefiboot.so.1 changed symlink target from libefiboot.so.1.38 to libefiboot.so.1.39
  /usr/lib/libefiboot.so changed symlink target from libefiboot.so.1.38 to libefiboot.so.1.39
  /usr/lib/libefisec.so.1 changed symlink target from libefisec.so.1.38 to libefisec.so.1.39
  /usr/lib/libefisec.so changed symlink target from libefisec.so.1.38 to libefisec.so.1.39
  /usr/lib/libefivar.so.1 changed symlink target from libefivar.so.1.38 to libefivar.so.1.39
  /usr/lib/libefivar.so changed symlink target from libefivar.so.1.38 to libefivar.so.1.39
  /usr/lib/libefiboot.so.1.38 moved to /usr/lib/libefiboot.so.1.39
  /usr/lib/libefisec.so.1.38 moved to /usr/lib/libefisec.so.1.39
  /usr/lib/libefivar.so.1.38 moved to /usr/lib/libefivar.so.1.39

--===============8345600096562106758==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-efivar-upgrade-38-39.patch"

RnJvbSBmMzlhNjRiYzk5YTExYjMzOTE0MThhODE2ZWU4ZmU1OGUzMzhiNTA0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBGZWIgMjAyNCAwNTowMTozNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGVm
aXZhcjogdXBncmFkZSAzOCAtPiAzOQoKLS0tCiAuLi4vZWZpdmFyLzAwMDEtZG9jcy1kby1ub3Qt
YnVpbGQtZWZpc2VjZGItbWFucGFnZS5wYXRjaCAgICAgIHwgMyArKy0KIG1ldGEvcmVjaXBlcy1i
c3AvZWZpdmFyL2VmaXZhcl8zOC5iYiAgICAgICAgICAgICAgICAgICAgICAgICAgfCA0ICsrKy0K
IDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1ic3AvZWZpdmFyL2VmaXZhci8wMDAxLWRvY3MtZG8tbm90LWJ1
aWxkLWVmaXNlY2RiLW1hbnBhZ2UucGF0Y2ggYi9tZXRhL3JlY2lwZXMtYnNwL2VmaXZhci9lZml2
YXIvMDAwMS1kb2NzLWRvLW5vdC1idWlsZC1lZmlzZWNkYi1tYW5wYWdlLnBhdGNoCmluZGV4IGNi
MzBkM2M0MzAuLmM4N2U0NjcyZWIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ic3AvZWZpdmFy
L2VmaXZhci8wMDAxLWRvY3MtZG8tbm90LWJ1aWxkLWVmaXNlY2RiLW1hbnBhZ2UucGF0Y2gKKysr
IGIvbWV0YS9yZWNpcGVzLWJzcC9lZml2YXIvZWZpdmFyLzAwMDEtZG9jcy1kby1ub3QtYnVpbGQt
ZWZpc2VjZGItbWFucGFnZS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZjM5YTE0ODFhOWU0
NjUzODc5MDFkNTJiMDdhZTU2ZGVkY2MzODM4YiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zy
b20gMTU2ODNhODMxYWQ4MzBiN2RlM2VkNWZlZWE4YWVjZDc2ZmMxYWJlYiBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4QGxpbnV0cm9uaXguZGU+
CiBEYXRlOiBTdW4sIDE2IEphbiAyMDIyIDE4OjI1OjMzICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hd
IGRvY3M6IGRvIG5vdCBidWlsZCBlZmlzZWNkYiBtYW5wYWdlCkBAIC03LDYgKzcsNyBAQCBJdCBy
ZXF1aXJlcyBtYW5kb2MsIHdoaWNoIG9lLWNvcmUgZG9lcyBub3QgaGF2ZS4KIAogVXBzdHJlYW0t
U3RhdHVzOiBJbmFwcHJvcHJpYXRlIFtvZS1jb3JlIHNwZWNpZmljXQogU2lnbmVkLW9mZi1ieTog
QWxleGFuZGVyIEthbmF2aW4gPGFsZXhAbGludXRyb25peC5kZT4KKwogLS0tCiAgZG9jcy9NYWtl
ZmlsZSB8IDIgKy0KICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ic3AvZWZpdmFyL2VmaXZhcl8zOC5iYiBiL21l
dGEvcmVjaXBlcy1ic3AvZWZpdmFyL2VmaXZhcl8zOC5iYgppbmRleCBkODhlYjNmZWY1Li4zNTAw
YWNmODhiIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtYnNwL2VmaXZhci9lZml2YXJfMzguYmIK
KysrIGIvbWV0YS9yZWNpcGVzLWJzcC9lZml2YXIvZWZpdmFyXzM4LmJiCkBAIC0xMCw3ICsxMCw3
IEBAIENPTVBBVElCTEVfSE9TVCA9ICIoaS44Nnx4ODZfNjR8YXJtfGFhcmNoNjQpLiotbGludXgi
CiBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vcmhpbnN0YWxsZXIvZWZpdmFyLmdpdDticmFu
Y2g9bWFpbjtwcm90b2NvbD1odHRwcyBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLWRvY3MtZG8t
bm90LWJ1aWxkLWVmaXNlY2RiLW1hbnBhZ2UucGF0Y2ggXAogICAgICAgICAgICAiCi1TUkNSRVYg
PSAiOTBlODhiMjIxZThiYzYwZGM1MGYzMjQ2MDUxMzY5YjhmNTgwYzBkMCIKK1NSQ1JFViA9ICJj
NDc4MjBjMzdhYzI2Mjg2NTU5ZWMwMDRkZTA3ZDQ4ZDA1ZjMzMDhjIgogUFYgLj0gIiszOStnaXQi
CiAKIFMgPSAiJHtXT1JLRElSfS9naXQiCkBAIC0zMiwzICszMiw1IEBAIEJCQ0xBU1NFWFRFTkQg
PSAibmF0aXZlIgogUlJFQ09NTUVORFM6JHtQTn06Y2xhc3MtdGFyZ2V0ID0gImtlcm5lbC1tb2R1
bGUtZWZpdmFyZnMiCiAKIENMRUFOQlJPS0VOID0gIjEiCisKK1BWID0gIjM5IgotLSAKMi40Mi4w
Cgo=

--===============8345600096562106758==--

