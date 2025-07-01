Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0363C83038
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 16:20:34 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.1425.1751386807795013058
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 09:20:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=NbNPHR07;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=QmZqXxnG;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010197c6ca4469-9b944f32-912d-4dbf-acca-21d60b29c6b7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1751386834;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=jlc6S6tR9/2fDzeCs2mYVz1Lk39P/V4CVJOumuYgs1I=;
	b=NbNPHR0797Q5KKtHW9OxNHsdJrnXLQ2zoDFymLDauqToGkwk3rIzYzkn47/J+L7X
	9HCBzNgy2BWiauK9Wnp04by7kC35Y/ZxOuokZv+ermQi02zFnAM72r4ildRYYOg9V86
	AgHHxN2y2axIp4OWUIkOdr3U/nFW11dOUkCiTtMU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1751386834;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=jlc6S6tR9/2fDzeCs2mYVz1Lk39P/V4CVJOumuYgs1I=;
	b=QmZqXxnGoywAgBpFO0VyjyeOC+Vj42g4PorEChGQwMPzsydYAYQwWkK4jmA5qS7Q
	BBLyh8Yv7smiUaZtzc8eomdulM3uHUrvxaGmHCUZp5KLDhXw5lVx5dTRoAONnCct76j
	MWCzldvTTM4KZwYFnXsWF1xzxwL64MZ3cc4FIz78=
Content-Type: multipart/mixed; boundary="===============5202660579931619622=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libproxy: upgrading to 0.5.10 SUCCEEDED
Message-ID: <01010197c6ca4469-9b944f32-912d-4dbf-acca-21d60b29c6b7-000000@us-west-2.amazonses.com>
Date: Tue, 1 Jul 2025 16:20:34 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 16:20:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219705

--===============5202660579931619622==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libproxy* to *0.5.10* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libproxy-upgrade-0.5.9-0.5.10.patch
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
From 03b5d00059530d974b9186404137664a43685485 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Jul 2025 15:55:56 +0000
Subject: [PATCH] libproxy: upgrade 0.5.9 -> 0.5.10

---
 .../libproxy/{libproxy_0.5.9.bb => libproxy_0.5.10.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libproxy/{libproxy_0.5.9.bb => libproxy_0.5.10.bb} (95%)

diff --git a/meta/recipes-support/libproxy/libproxy_0.5.9.bb b/meta/recipes-support/libproxy/libproxy_0.5.10.bb
similarity index 95%
rename from meta/recipes-support/libproxy/libproxy_0.5.9.bb
rename to meta/recipes-support/libproxy/libproxy_0.5.10.bb
index ed8a4df2a8..bb16f2f073 100644
--- a/meta/recipes-support/libproxy/libproxy_0.5.9.bb
+++ b/meta/recipes-support/libproxy/libproxy_0.5.10.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 DEPENDS = "glib-2.0"
 
 SRC_URI = "git://github.com/libproxy/libproxy;protocol=https;branch=main"
-SRCREV = "77e2a2b88a319974cf099c8eaaaa03030bc4c0d4"
+SRCREV = "7e4852f9658084c61a95973b8a1d720b1763437a"
 
 inherit meson pkgconfig gobject-introspection vala gi-docgen
 GIDOCGEN_MESON_OPTION = 'docs'
-- 
2.47.1


--===============5202660579931619622==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/libproxy/libproxy: FILELIST: removed "/usr/lib/libproxy.so.0.5.9", added "/usr/lib/libproxy.so.0.5.10"
Changes to packages/core2-64-poky-linux/libproxy (sysroot):
  /usr/lib/libproxy.so.1 changed symlink target from libproxy.so.0.5.9 to libproxy.so.0.5.10
  /usr/lib/libproxy.so.0.5.10 was added
  /usr/lib/libproxy.so.0.5.9 was removed

--===============5202660579931619622==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libproxy-upgrade-0.5.9-0.5.10.patch"

RnJvbSAwM2I1ZDAwMDU5NTMwZDk3NGI5MTg2NDA0MTM3NjY0YTQzNjg1NDg1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBKdWwgMjAyNSAxNTo1NTo1NiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnByb3h5OiB1cGdyYWRlIDAuNS45IC0+IDAuNS4xMAoKLS0tCiAuLi4vbGlicHJveHkve2xpYnBy
b3h5XzAuNS45LmJiID0+IGxpYnByb3h5XzAuNS4xMC5iYn0gICAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9saWJwcm94eS97bGlicHJveHlfMC41LjkuYmIgPT4gbGlicHJveHlfMC41
LjEwLmJifSAoOTUlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYnByb3h5
L2xpYnByb3h5XzAuNS45LmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlicHJveHkvbGlicHJv
eHlfMC41LjEwLmJiCnNpbWlsYXJpdHkgaW5kZXggOTUlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBl
cy1zdXBwb3J0L2xpYnByb3h5L2xpYnByb3h5XzAuNS45LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lw
ZXMtc3VwcG9ydC9saWJwcm94eS9saWJwcm94eV8wLjUuMTAuYmIKaW5kZXggZWQ4YTRkZjJhOC4u
YmIxNmYyZjA3MyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlicHJveHkvbGli
cHJveHlfMC41LjkuYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlicHJveHkvbGlicHJv
eHlfMC41LjEwLmJiCkBAIC0xNCw3ICsxNCw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTov
L0NPUFlJTkc7bWQ1PTRmYmQ2NTM4MGNkZDI1NTk1MTA3OTAwOGIzNjQ1MTZjIFwKIERFUEVORFMg
PSAiZ2xpYi0yLjAiCiAKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9saWJwcm94eS9saWJw
cm94eTtwcm90b2NvbD1odHRwczticmFuY2g9bWFpbiIKLVNSQ1JFViA9ICI3N2UyYTJiODhhMzE5
OTc0Y2YwOTljOGVhYWFhMDMwMzBiYzRjMGQ0IgorU1JDUkVWID0gIjdlNDg1MmY5NjU4MDg0YzYx
YTk1OTczYjhhMWQ3MjBiMTc2MzQzN2EiCiAKIGluaGVyaXQgbWVzb24gcGtnY29uZmlnIGdvYmpl
Y3QtaW50cm9zcGVjdGlvbiB2YWxhIGdpLWRvY2dlbgogR0lET0NHRU5fTUVTT05fT1BUSU9OID0g
J2RvY3MnCi0tIAoyLjQ3LjEKCg==

--===============5202660579931619622==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libproxy: PV changed from "0.5.9" to "0.5.10"
packages/core2-64-poky-linux/libproxy: PKGV changed from 0.5.9 [default] to 0.5.10 [default]
packages/core2-64-poky-linux/libproxy/libproxy-dbg: PV changed from "0.5.9" to "0.5.10"
packages/core2-64-poky-linux/libproxy/libproxy-dbg: PKGV changed from 0.5.9 [default] to 0.5.10 [default]
packages/core2-64-poky-linux/libproxy/libproxy-dbg: FILELIST: removed "/usr/lib/.debug/libproxy.so.0.5.9", added "/usr/lib/.debug/libproxy.so.0.5.10"
packages/core2-64-poky-linux/libproxy/libproxy-dbg: PKGSIZE changed from 153544 to 154232 (+0%)
packages/core2-64-poky-linux/libproxy/libproxy-dev: PV changed from "0.5.9" to "0.5.10"
packages/core2-64-poky-linux/libproxy/libproxy-dev: PKGV changed from 0.5.9 [default] to 0.5.10 [default]
packages/core2-64-poky-linux/libproxy/libproxy-dev: PKGSIZE changed from 14051 to 14052 (+0%)
packages/core2-64-poky-linux/libproxy/libproxy-doc: PV changed from "0.5.9" to "0.5.10"
packages/core2-64-poky-linux/libproxy/libproxy-doc: PKGV changed from 0.5.9 [default] to 0.5.10 [default]
packages/core2-64-poky-linux/libproxy/libproxy-locale: PV changed from "0.5.9" to "0.5.10"
packages/core2-64-poky-linux/libproxy/libproxy-locale: PKGV changed from 0.5.9 [default] to 0.5.10 [default]
packages/core2-64-poky-linux/libproxy/libproxy-src: PV changed from "0.5.9" to "0.5.10"
packages/core2-64-poky-linux/libproxy/libproxy-src: PKGV changed from 0.5.9 [default] to 0.5.10 [default]
packages/core2-64-poky-linux/libproxy/libproxy-staticdev: PV changed from "0.5.9" to "0.5.10"
packages/core2-64-poky-linux/libproxy/libproxy-staticdev: PKGV changed from 0.5.9 [default] to 0.5.10 [default]
packages/core2-64-poky-linux/libproxy/libproxy: PV changed from "0.5.9" to "0.5.10"
packages/core2-64-poky-linux/libproxy/libproxy: PKGV changed from 0.5.9 [default] to 0.5.10 [default]
packages/core2-64-poky-linux/libproxy/libproxy: FILES: removed "/usr/lib/libproxy/0.5.9/modules", added "/usr/lib/libproxy/0.5.10/modules"
packages/core2-64-poky-linux/libproxy/libproxy: FILELIST: removed "/usr/lib/libproxy.so.0.5.9", added "/usr/lib/libproxy.so.0.5.10"
packages/core2-64-poky-linux/libproxy/libproxy: PKGSIZE changed from 68185 to 68186 (+0%)
Changes to packages/core2-64-poky-linux/libproxy (sysroot):
  /usr/lib/libproxy.so.1 changed symlink target from libproxy.so.0.5.9 to libproxy.so.0.5.10
  /usr/lib/libproxy.so.0.5.10 was added
  /usr/lib/libproxy.so.0.5.9 was removed

--===============5202660579931619622==--

