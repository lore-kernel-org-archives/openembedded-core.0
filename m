Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C94D1E6529E
	for <webhook@archiver.kernel.org>; Sun,  1 Feb 2026 13:13:10 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29053.1769951564839847440
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Feb 2026 05:12:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=iSTGYwHb;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=N2Fz9/Ez;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019c1955cab0-b6b63c9d-70f7-4955-8221-a574c3e8c1cf-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1769951578;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=mPxswXifWZW++qpbgdkmd0LZrJMmshyoxtY2a6Vqf5M=;
	b=iSTGYwHb8oGgpmu1dHQXOTD2ZjT/GJt5NQNGLHFHkLsgLslxIkjlqKiQnlBsweXA
	3VSDvs9UL6VenMlSbvwJsreh34RrCKqUIsshlc1zXaBK/y/CTI8aXoVIwnTrx0Usoze
	pGjrLcAehdIYxQz+igwts0qzk8ByP0n5cwbnvRtE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1769951578;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=mPxswXifWZW++qpbgdkmd0LZrJMmshyoxtY2a6Vqf5M=;
	b=N2Fz9/EzwiDBuFa7yLS2bvnqwTg7WeHDxmfuADh5i7AImOzocNekxMNwuJGSK7dy
	9swDuO8bZxAfamGtB9t9jpwrNmGHqWLr/kLNEEYLvEb4HblYdggDX9bjH+1gDkETQXa
	JpLq7v2gFyhRHpLea/WjigPCKdiVbAQaY0NEYySc=
Content-Type: multipart/mixed; boundary="===============3408297878729292055=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libtraceevent: upgrading to 1.8.7 SUCCEEDED
Message-ID: <0101019c1955cab0-b6b63c9d-70f7-4955-8221-a574c3e8c1cf-000000@us-west-2.amazonses.com>
Date: Sun, 1 Feb 2026 13:12:58 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Feb 2026 13:13:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230318

--===============3408297878729292055==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libtraceevent* to *1.8.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libtraceevent-upgrade-1.8.6-1.8.7.patch
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
From dc6e389917a205377bd6e2426944ed7177cf6738 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Feb 2026 12:08:09 +0000
Subject: [PATCH] libtraceevent: upgrade 1.8.6 -> 1.8.7

---
 .../{libtraceevent_1.8.6.bb => libtraceevent_1.8.7.bb}        | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta/recipes-kernel/libtraceevent/{libtraceevent_1.8.6.bb => libtraceevent_1.8.7.bb} (90%)

diff --git a/meta/recipes-kernel/libtraceevent/libtraceevent_1.8.6.bb b/meta/recipes-kernel/libtraceevent/libtraceevent_1.8.7.bb
similarity index 90%
rename from meta/recipes-kernel/libtraceevent/libtraceevent_1.8.6.bb
rename to meta/recipes-kernel/libtraceevent/libtraceevent_1.8.7.bb
index deddb60f63..0e891c1498 100644
--- a/meta/recipes-kernel/libtraceevent/libtraceevent_1.8.6.bb
+++ b/meta/recipes-kernel/libtraceevent/libtraceevent_1.8.7.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSES/GPL-2.0;md5=e6a75371ba4d16749254a51215d13f97
                     file://LICENSES/LGPL-2.1;md5=b370887980db5dd40659b50909238dbd"
 SECTION = "libs"
 
-SRCREV = "98c217427183f66f09f4a27300ad87d71814c38f"
+SRCREV = "7a8fee57d87aa61c9d578cd67e99d2677b894772"
 SRC_URI = "git://git.kernel.org/pub/scm/libs/libtrace/libtraceevent.git;branch=${BPN};protocol=https \
           "
 
@@ -19,3 +19,5 @@ EXTRA_OEMESON = "-Ddoc=false"
 PACKAGES += "${PN}-plugins"
 
 FILES:${PN}-plugins += "${libdir}/traceevent/plugins"
+
+BPN = "libtraceevent-v1.8"
-- 
2.47.1


--===============3408297878729292055==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent: FILELIST: removed "/usr/lib/libtraceevent.so.1.8.6", added "/usr/lib/libtraceevent.so.1.8.7"
Changes to packages/x86-64-v3-poky-linux/libtraceevent (sysroot):
  /usr/lib/libtraceevent.so.1 changed symlink target from libtraceevent.so.1.8.6 to libtraceevent.so.1.8.7
  /usr/lib/libtraceevent.so.1.8.6 moved to /usr/lib/libtraceevent.so.1.8.7

--===============3408297878729292055==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libtraceevent: PV changed from "1.8.6" to "1.8.7"
packages/x86-64-v3-poky-linux/libtraceevent: PKGV changed from 1.8.6 [default] to 1.8.7 [default]
packages/x86-64-v3-poky-linux/libtraceevent: SRC_URI changed from "git://git.kernel.org/pub/scm/libs/libtrace/libtraceevent.git;branch=libtraceevent;protocol=https" to "git://git.kernel.org/pub/scm/libs/libtrace/libtraceevent.git;branch=libtraceevent-v1.8;protocol=https"
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-dbg: PV changed from "1.8.6" to "1.8.7"
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-dbg: FILELIST: removed "/usr/lib/.debug/libtraceevent.so.1.8.6", added "/usr/lib/.debug/libtraceevent.so.1.8.7"
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-dbg: PKGV changed from 1.8.6 [default] to 1.8.7 [default]
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-dbg: PKGSIZE changed from 608312 to 612704 (+1%)
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-dev: PV changed from "1.8.6" to "1.8.7"
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-dev: PKGV changed from 1.8.6 [default] to 1.8.7 [default]
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-dev: PKGSIZE changed from 28895 to 29056 (+1%)
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-dev: FILES: removed "/usr/lib/libtraceevent/*.la", added "/usr/lib/libtraceevent-v1.8/*.la"
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-doc: PV changed from "1.8.6" to "1.8.7"
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-doc: PKGV changed from 1.8.6 [default] to 1.8.7 [default]
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-locale: PV changed from "1.8.6" to "1.8.7"
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-locale: PKGV changed from 1.8.6 [default] to 1.8.7 [default]
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-plugins: PV changed from "1.8.6" to "1.8.7"
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-plugins: PKGV changed from 1.8.6 [default] to 1.8.7 [default]
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-src: PV changed from "1.8.6" to "1.8.7"
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-src: FILELIST: directory renamed /usr/src/debug/libtraceevent/1.8.6/include/traceevent -> /usr/src/debug/libtraceevent/1.8.7/include/traceevent, directory renamed /usr/src/debug/libtraceevent/1.8.6/plugins -> /usr/src/debug/libtraceevent/1.8.7/plugins, directory renamed /usr/src/debug/libtraceevent/1.8.6/src -> /usr/src/debug/libtraceevent/1.8.7/src
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-src: PKGV changed from 1.8.6 [default] to 1.8.7 [default]
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-src: PKGSIZE changed from 398698 to 400743 (+1%)
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-staticdev: PV changed from "1.8.6" to "1.8.7"
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-staticdev: PKGV changed from 1.8.6 [default] to 1.8.7 [default]
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-staticdev: PKGSIZE changed from 745342 to 751910 (+1%)
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-staticdev: FILES: removed "/usr/lib/libtraceevent/*.a", added "/usr/lib/libtraceevent-v1.8/*.a"
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent: PV changed from "1.8.6" to "1.8.7"
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent: FILELIST: removed "/usr/lib/libtraceevent.so.1.8.6", added "/usr/lib/libtraceevent.so.1.8.7"
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent: PKGV changed from 1.8.6 [default] to 1.8.7 [default]
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent: FILES: removed "/usr/share/libtraceevent /usr/lib/libtraceevent/*", added "/usr/share/libtraceevent-v1.8 /usr/lib/libtraceevent-v1.8/*"
Changes to packages/x86-64-v3-poky-linux/libtraceevent (sysroot):
  /usr/lib/libtraceevent.so.1 changed symlink target from libtraceevent.so.1.8.6 to libtraceevent.so.1.8.7
  /usr/lib/libtraceevent.so.1.8.6 moved to /usr/lib/libtraceevent.so.1.8.7

--===============3408297878729292055==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libtraceevent-upgrade-1.8.6-1.8.7.patch"

RnJvbSBkYzZlMzg5OTE3YTIwNTM3N2JkNmUyNDI2OTQ0ZWQ3MTc3Y2Y2NzM4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBGZWIgMjAyNiAxMjowODowOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnRyYWNlZXZlbnQ6IHVwZ3JhZGUgMS44LjYgLT4gMS44LjcKCi0tLQogLi4uL3tsaWJ0cmFjZWV2
ZW50XzEuOC42LmJiID0+IGxpYnRyYWNlZXZlbnRfMS44LjcuYmJ9ICAgICAgICB8IDQgKysrLQog
MSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1rZXJuZWwvbGlidHJhY2VldmVudC97bGlidHJhY2VldmVudF8xLjguNi5iYiA9
PiBsaWJ0cmFjZWV2ZW50XzEuOC43LmJifSAoOTAlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1rZXJuZWwvbGlidHJhY2VldmVudC9saWJ0cmFjZWV2ZW50XzEuOC42LmJiIGIvbWV0YS9yZWNp
cGVzLWtlcm5lbC9saWJ0cmFjZWV2ZW50L2xpYnRyYWNlZXZlbnRfMS44LjcuYmIKc2ltaWxhcml0
eSBpbmRleCA5MCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWtlcm5lbC9saWJ0cmFjZWV2ZW50
L2xpYnRyYWNlZXZlbnRfMS44LjYuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1rZXJuZWwvbGli
dHJhY2VldmVudC9saWJ0cmFjZWV2ZW50XzEuOC43LmJiCmluZGV4IGRlZGRiNjBmNjMuLjBlODkx
YzE0OTggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1rZXJuZWwvbGlidHJhY2VldmVudC9saWJ0
cmFjZWV2ZW50XzEuOC42LmJiCisrKyBiL21ldGEvcmVjaXBlcy1rZXJuZWwvbGlidHJhY2VldmVu
dC9saWJ0cmFjZWV2ZW50XzEuOC43LmJiCkBAIC04LDcgKzgsNyBAQCBMSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9MSUNFTlNFUy9HUEwtMi4wO21kNT1lNmE3NTM3MWJhNGQxNjc0OTI1NGE1MTIx
NWQxM2Y5NwogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vTElDRU5TRVMvTEdQTC0yLjE7bWQ1
PWIzNzA4ODc5ODBkYjVkZDQwNjU5YjUwOTA5MjM4ZGJkIgogU0VDVElPTiA9ICJsaWJzIgogCi1T
UkNSRVYgPSAiOThjMjE3NDI3MTgzZjY2ZjA5ZjRhMjczMDBhZDg3ZDcxODE0YzM4ZiIKK1NSQ1JF
ViA9ICI3YThmZWU1N2Q4N2FhNjFjOWQ1NzhjZDY3ZTk5ZDI2NzdiODk0NzcyIgogU1JDX1VSSSA9
ICJnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpYnMvbGlidHJhY2UvbGlidHJhY2VldmVu
dC5naXQ7YnJhbmNoPSR7QlBOfTtwcm90b2NvbD1odHRwcyBcCiAgICAgICAgICAgIgogCkBAIC0x
OSwzICsxOSw1IEBAIEVYVFJBX09FTUVTT04gPSAiLURkb2M9ZmFsc2UiCiBQQUNLQUdFUyArPSAi
JHtQTn0tcGx1Z2lucyIKIAogRklMRVM6JHtQTn0tcGx1Z2lucyArPSAiJHtsaWJkaXJ9L3RyYWNl
ZXZlbnQvcGx1Z2lucyIKKworQlBOID0gImxpYnRyYWNlZXZlbnQtdjEuOCIKLS0gCjIuNDcuMQoK

--===============3408297878729292055==--

