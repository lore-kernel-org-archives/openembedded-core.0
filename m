Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BBAECA5FDD
	for <webhook@archiver.kernel.org>; Sat,  3 Oct 2026 06:22:28 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1159.1791008546188095950
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Oct 2026 23:22:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=SMlr+ZHR;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=YIFJuf7Y;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101a1006d99c0-a8fb2603-8802-46f3-b0e4-94df4f4cef64-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1791008545;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=t6ipSP3aoO5milYHRWZaenw/j56riU3bqEcxhOebjTo=;
	b=SMlr+ZHRabuDKWLb3ysqTQQpzdeYt46K7X0N5J3ZhyCVn/EECp4YiddqGzFxQAIK
	bqetf1MRPTzfaKdqg0ZPS5NXPEeuFbvtZOWp9wlHXiiv53+9sbvOcDqJsnJFl1hbdPs
	7UM3RD3r3Tqbv1A5D5PLYtkbJW8n5js5K05RQVXg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1791008545;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=t6ipSP3aoO5milYHRWZaenw/j56riU3bqEcxhOebjTo=;
	b=YIFJuf7Ytk3gXPvUuw15evMsgEVizFbS7KgOjY3bwbCx4gLEszUoHmqJ8obzuotu
	m+GXfLG6KMeS20aP9ElSkz5qF9G3qTpsTrJEkfRupMlke6QL+6wNFGcE28GkusywbRG
	4fVscxaxSN9tpAW5tXeo7LJvLLOpE6H3wlUZl+y4=
Content-Type: multipart/mixed; boundary="===============4149773185547217969=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] librepo: upgrading to 1.21.2 SUCCEEDED
Message-ID: <010101a1006d99c0-a8fb2603-8802-46f3-b0e4-94df4f4cef64-000000@us-west-2.amazonses.com>
Date: Sat, 3 Oct 2026 06:22:25 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.03-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 Oct 2026 06:22:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247140

--===============4149773185547217969==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *librepo* to *1.21.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-librepo-upgrade-1.21.1-1.21.2.patch
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
From abbc5af9af7b5f56ad8aa6ff0a821347d2b3c61c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 3 Oct 2026 05:28:47 +0000
Subject: [PATCH] librepo: upgrade 1.21.1 -> 1.21.2

Release 1.21.2
downloader: Compare HTTP header names case-insensitively
metadata_downloader: Don't use error messages as format strings
Fix swapped function arguments
repomd: Fix a warning message and a memory leak
downloader: Accept file descriptor 0 in lr_download()
Don't pass negative values to ctype functions
checksum: Fix a memory leak and an out-of-bounds read
Fix leaks of zchunk contexts on error paths
package_downloader: Restore the SIGINT handler on all return paths
mirrorlist: Close the duplicated descriptor if fdopen() fails
repoutil_yum: Use S_ISDIR() to check for a directory
util: Handle partial writes in lr_copy_content()
xmlparser: Check the parser context before using it
downloader: hold transfer state per connection, not per target
tests: Run the repo_zck test suite
handle: Validate the new value of LRO_MAXMIRRORTRIES
downloader: don't rescan every target when nothing can be started
---
 ...2-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch | 2 +-
 .../librepo/{librepo_1.21.1.bb => librepo_1.21.2.bb}            | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/librepo/{librepo_1.21.1.bb => librepo_1.21.2.bb} (94%)

diff --git a/meta/recipes-devtools/librepo/librepo/0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch b/meta/recipes-devtools/librepo/librepo/0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch
index 30802fd4f2..0653c3f7d4 100644
--- a/meta/recipes-devtools/librepo/librepo/0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch
+++ b/meta/recipes-devtools/librepo/librepo/0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch
@@ -1,4 +1,4 @@
-From e15c8ab0aab4eda7754e186c63b5ee0feb13f886 Mon Sep 17 00:00:00 2001
+From 88fa058c28a583ee30a532a9fb085be1219554c7 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 30 Dec 2016 18:05:36 +0200
 Subject: [PATCH] Do not try to obtain PYTHON_INSTALL_DIR by running python.
diff --git a/meta/recipes-devtools/librepo/librepo_1.21.1.bb b/meta/recipes-devtools/librepo/librepo_1.21.2.bb
similarity index 94%
rename from meta/recipes-devtools/librepo/librepo_1.21.1.bb
rename to meta/recipes-devtools/librepo/librepo_1.21.2.bb
index 9cefbfd48e..ab60e76b6e 100644
--- a/meta/recipes-devtools/librepo/librepo_1.21.1.bb
+++ b/meta/recipes-devtools/librepo/librepo_1.21.2.bb
@@ -9,7 +9,7 @@ SRC_URI = "git://github.com/rpm-software-management/librepo.git;branch=master;pr
            file://0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch \
            "
 
-SRCREV = "86ed082e25bbd1901d21d75924297c7697b33307"
+SRCREV = "f892f216a8f7934f32846712f56a27f997b300a3"
 
 DEPENDS = "curl glib-2.0 openssl attr gpgme libxml2"
 
-- 
2.47.1


--===============4149773185547217969==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="librepo-changelog.txt"

Release 1.21.2
downloader: Compare HTTP header names case-insensitively
metadata_downloader: Don't use error messages as format strings
Fix swapped function arguments
repomd: Fix a warning message and a memory leak
downloader: Accept file descriptor 0 in lr_download()
Don't pass negative values to ctype functions
checksum: Fix a memory leak and an out-of-bounds read
Fix leaks of zchunk contexts on error paths
package_downloader: Restore the SIGINT handler on all return paths
mirrorlist: Close the duplicated descriptor if fdopen() fails
repoutil_yum: Use S_ISDIR() to check for a directory
util: Handle partial writes in lr_copy_content()
xmlparser: Check the parser context before using it
downloader: hold transfer state per connection, not per target
tests: Run the repo_zck test suite
handle: Validate the new value of LRO_MAXMIRRORTRIES
downloader: don't rescan every target when nothing can be started

--===============4149773185547217969==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/librepo: PV changed from "1.21.1" to "1.21.2"
packages/x86-64-v3-poky-linux/librepo: SRC_URI changed from "git://github.com/rpm-software-management/librepo.git;branch=master;protocol=https;tag=1.21.1 file://0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch" to "git://github.com/rpm-software-management/librepo.git;branch=master;protocol=https;tag=1.21.2 file://0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch"
packages/x86-64-v3-poky-linux/librepo: PKGV changed from 1.21.1 [default] to 1.21.2 [default]
packages/x86-64-v3-poky-linux/librepo/librepo-dbg: PV changed from "1.21.1" to "1.21.2"
packages/x86-64-v3-poky-linux/librepo/librepo-dbg: PKGV changed from 1.21.1 [default] to 1.21.2 [default]
packages/x86-64-v3-poky-linux/librepo/librepo-dbg: PKGSIZE changed from 963624 to 967536 (+0%)
packages/x86-64-v3-poky-linux/librepo/librepo-dev: PV changed from "1.21.1" to "1.21.2"
packages/x86-64-v3-poky-linux/librepo/librepo-dev: PKGV changed from 1.21.1 [default] to 1.21.2 [default]
packages/x86-64-v3-poky-linux/librepo/librepo-doc: PV changed from "1.21.1" to "1.21.2"
packages/x86-64-v3-poky-linux/librepo/librepo-doc: PKGV changed from 1.21.1 [default] to 1.21.2 [default]
packages/x86-64-v3-poky-linux/librepo/librepo-locale: PV changed from "1.21.1" to "1.21.2"
packages/x86-64-v3-poky-linux/librepo/librepo-locale: PKGV changed from 1.21.1 [default] to 1.21.2 [default]
packages/x86-64-v3-poky-linux/librepo/librepo-src: PV changed from "1.21.1" to "1.21.2"
packages/x86-64-v3-poky-linux/librepo/librepo-src: FILELIST: directory renamed /usr/src/debug/librepo/1.21.1/librepo -> /usr/src/debug/librepo/1.21.2/librepo, directory renamed /usr/src/debug/librepo/1.21.1/librepo/python -> /usr/src/debug/librepo/1.21.2/librepo/python
packages/x86-64-v3-poky-linux/librepo/librepo-src: PKGV changed from 1.21.1 [default] to 1.21.2 [default]
packages/x86-64-v3-poky-linux/librepo/librepo-src: PKGSIZE changed from 749319 to 756745 (+1%)
packages/x86-64-v3-poky-linux/librepo/librepo-staticdev: PV changed from "1.21.1" to "1.21.2"
packages/x86-64-v3-poky-linux/librepo/librepo-staticdev: PKGV changed from 1.21.1 [default] to 1.21.2 [default]
packages/x86-64-v3-poky-linux/librepo/librepo: PV changed from "1.21.1" to "1.21.2"
packages/x86-64-v3-poky-linux/librepo/librepo: PKGV changed from 1.21.1 [default] to 1.21.2 [default]
packages/x86-64-v3-poky-linux/librepo/librepo: PKGSIZE changed from 326574 to 330670 (+1%)

--===============4149773185547217969==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-librepo-upgrade-1.21.1-1.21.2.patch"

RnJvbSBhYmJjNWFmOWFmN2I1ZjU2YWQ4YWE2ZmYwYTgyMTM0N2QyYjNjNjFjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMyBPY3QgMjAyNiAwNToyODo0NyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnJlcG86IHVwZ3JhZGUgMS4yMS4xIC0+IDEuMjEuMgoKUmVsZWFzZSAxLjIxLjIKZG93bmxvYWRl
cjogQ29tcGFyZSBIVFRQIGhlYWRlciBuYW1lcyBjYXNlLWluc2Vuc2l0aXZlbHkKbWV0YWRhdGFf
ZG93bmxvYWRlcjogRG9uJ3QgdXNlIGVycm9yIG1lc3NhZ2VzIGFzIGZvcm1hdCBzdHJpbmdzCkZp
eCBzd2FwcGVkIGZ1bmN0aW9uIGFyZ3VtZW50cwpyZXBvbWQ6IEZpeCBhIHdhcm5pbmcgbWVzc2Fn
ZSBhbmQgYSBtZW1vcnkgbGVhawpkb3dubG9hZGVyOiBBY2NlcHQgZmlsZSBkZXNjcmlwdG9yIDAg
aW4gbHJfZG93bmxvYWQoKQpEb24ndCBwYXNzIG5lZ2F0aXZlIHZhbHVlcyB0byBjdHlwZSBmdW5j
dGlvbnMKY2hlY2tzdW06IEZpeCBhIG1lbW9yeSBsZWFrIGFuZCBhbiBvdXQtb2YtYm91bmRzIHJl
YWQKRml4IGxlYWtzIG9mIHpjaHVuayBjb250ZXh0cyBvbiBlcnJvciBwYXRocwpwYWNrYWdlX2Rv
d25sb2FkZXI6IFJlc3RvcmUgdGhlIFNJR0lOVCBoYW5kbGVyIG9uIGFsbCByZXR1cm4gcGF0aHMK
bWlycm9ybGlzdDogQ2xvc2UgdGhlIGR1cGxpY2F0ZWQgZGVzY3JpcHRvciBpZiBmZG9wZW4oKSBm
YWlscwpyZXBvdXRpbF95dW06IFVzZSBTX0lTRElSKCkgdG8gY2hlY2sgZm9yIGEgZGlyZWN0b3J5
CnV0aWw6IEhhbmRsZSBwYXJ0aWFsIHdyaXRlcyBpbiBscl9jb3B5X2NvbnRlbnQoKQp4bWxwYXJz
ZXI6IENoZWNrIHRoZSBwYXJzZXIgY29udGV4dCBiZWZvcmUgdXNpbmcgaXQKZG93bmxvYWRlcjog
aG9sZCB0cmFuc2ZlciBzdGF0ZSBwZXIgY29ubmVjdGlvbiwgbm90IHBlciB0YXJnZXQKdGVzdHM6
IFJ1biB0aGUgcmVwb196Y2sgdGVzdCBzdWl0ZQpoYW5kbGU6IFZhbGlkYXRlIHRoZSBuZXcgdmFs
dWUgb2YgTFJPX01BWE1JUlJPUlRSSUVTCmRvd25sb2FkZXI6IGRvbid0IHJlc2NhbiBldmVyeSB0
YXJnZXQgd2hlbiBub3RoaW5nIGNhbiBiZSBzdGFydGVkCi0tLQogLi4uMi1Eby1ub3QtdHJ5LXRv
LW9idGFpbi1QWVRIT05fSU5TVEFMTF9ESVItYnktcnVubmluZy1wLnBhdGNoIHwgMiArLQogLi4u
L2xpYnJlcG8ve2xpYnJlcG9fMS4yMS4xLmJiID0+IGxpYnJlcG9fMS4yMS4yLmJifSAgICAgICAg
ICAgIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL2xpYnJlcG8ve2xpYnJlcG9fMS4yMS4x
LmJiID0+IGxpYnJlcG9fMS4yMS4yLmJifSAoOTQlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9saWJyZXBvL2xpYnJlcG8vMDAwMi1Eby1ub3QtdHJ5LXRvLW9idGFpbi1QWVRI
T05fSU5TVEFMTF9ESVItYnktcnVubmluZy1wLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2xpYnJlcG8vbGlicmVwby8wMDAyLURvLW5vdC10cnktdG8tb2J0YWluLVBZVEhPTl9JTlNUQUxM
X0RJUi1ieS1ydW5uaW5nLXAucGF0Y2gKaW5kZXggMzA4MDJmZDRmMi4uMDY1M2MzZjdkNCAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2xpYnJlcG8vbGlicmVwby8wMDAyLURvLW5v
dC10cnktdG8tb2J0YWluLVBZVEhPTl9JTlNUQUxMX0RJUi1ieS1ydW5uaW5nLXAucGF0Y2gKKysr
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2xpYnJlcG8vbGlicmVwby8wMDAyLURvLW5vdC10cnkt
dG8tb2J0YWluLVBZVEhPTl9JTlNUQUxMX0RJUi1ieS1ydW5uaW5nLXAucGF0Y2gKQEAgLTEsNCAr
MSw0IEBACi1Gcm9tIGUxNWM4YWIwYWFiNGVkYTc3NTRlMTg2YzYzYjVlZTBmZWIxM2Y4ODYgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDg4ZmEwNThjMjhhNTgzZWUzMGE1MzJhOWZiMDg1
YmUxMjE5NTU0YzcgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2Fu
YXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KIERhdGU6IEZyaSwgMzAgRGVjIDIwMTYgMTg6
MDU6MzYgKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0gRG8gbm90IHRyeSB0byBvYnRhaW4gUFlUSE9O
X0lOU1RBTExfRElSIGJ5IHJ1bm5pbmcgcHl0aG9uLgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2xpYnJlcG8vbGlicmVwb18xLjIxLjEuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvbGlicmVwby9saWJyZXBvXzEuMjEuMi5iYgpzaW1pbGFyaXR5IGluZGV4IDk0JQpyZW5hbWUg
ZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGlicmVwby9saWJyZXBvXzEuMjEuMS5iYgpyZW5h
bWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2xpYnJlcG8vbGlicmVwb18xLjIxLjIuYmIKaW5k
ZXggOWNlZmJmZDQ4ZS4uYWI2MGU3NmI2ZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2xpYnJlcG8vbGlicmVwb18xLjIxLjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2xpYnJlcG8vbGlicmVwb18xLjIxLjIuYmIKQEAgLTksNyArOSw3IEBAIFNSQ19VUkkgPSAiZ2l0
Oi8vZ2l0aHViLmNvbS9ycG0tc29mdHdhcmUtbWFuYWdlbWVudC9saWJyZXBvLmdpdDticmFuY2g9
bWFzdGVyO3ByCiAgICAgICAgICAgIGZpbGU6Ly8wMDAyLURvLW5vdC10cnktdG8tb2J0YWluLVBZ
VEhPTl9JTlNUQUxMX0RJUi1ieS1ydW5uaW5nLXAucGF0Y2ggXAogICAgICAgICAgICAiCiAKLVNS
Q1JFViA9ICI4NmVkMDgyZTI1YmJkMTkwMWQyMWQ3NTkyNDI5N2M3Njk3YjMzMzA3IgorU1JDUkVW
ID0gImY4OTJmMjE2YThmNzkzNGYzMjg0NjcxMmY1NmEyN2Y5OTdiMzAwYTMiCiAKIERFUEVORFMg
PSAiY3VybCBnbGliLTIuMCBvcGVuc3NsIGF0dHIgZ3BnbWUgbGlieG1sMiIKIAotLSAKMi40Ny4x
Cgo=

--===============4149773185547217969==--

