Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E25F9C25B7C
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 17:32:18 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.1240.1715794337546557322
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 May 2024 10:32:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=SNVeWU6c;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=JNdU9I1g;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018f7d4fdc55-2075fb1f-1351-4e8f-b544-88fd173a587e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1715794337;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=25a5HCxUxTbmubnJON2FfL66150qp7PYIjbsOfHZHYY=;
	b=SNVeWU6czYCDnHNJ6fo0YAX1uQ3qWWOH4E7TW/dZMuQrKhm0SpvX2p6NAoTI+Woz
	/52br7djyZD+0CDCztiWMnDqqpP7y586yrGImygCh89hvEyqA3nKIC4VeTR3UfGam+u
	K4Nz7P6f9YtIrQTt5PY6eofTD9iWW5pCLQrPAZgw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1715794337;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=25a5HCxUxTbmubnJON2FfL66150qp7PYIjbsOfHZHYY=;
	b=JNdU9I1gqPVZWlh6Tf3eaJ3z6ObCxcIOq0DmGj1NTtrCZXvklYyG2Z2ez/ZpOHdC
	3RqgmCBu0u8lV6YRFpH8tkj+8kE/hcGrGO6VND6yJW9wk8/nd7GN6pfuaqHcTjrwcgW
	jsf8n3YzcBmdsXlgR7d8Ovbe4sLwsPOaCLZDl9Dw=
Content-Type: multipart/mixed; boundary="===============6136695676759861334=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libxml2: upgrading to 2.12.7 SUCCEEDED
Message-ID: <0101018f7d4fdc55-2075fb1f-1351-4e8f-b544-88fd173a587e-000000@us-west-2.amazonses.com>
Date: Wed, 15 May 2024 17:32:16 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.05.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 17:32:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199311

--===============6136695676759861334==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libxml2* to *2.12.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libxml2-upgrade-2.12.6-2.12.7.patch
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
From cc40c402799954b4bab1c6a37c711f61f8502d55 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 May 2024 07:44:55 +0000
Subject: [PATCH] libxml2: upgrade 2.12.6 -> 2.12.7

---
 meta/recipes-core/libxml/libxml2/install-tests.patch            | 2 +-
 .../libxml/{libxml2_2.12.6.bb => libxml2_2.12.7.bb}             | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/libxml/{libxml2_2.12.6.bb => libxml2_2.12.7.bb} (97%)

diff --git a/meta/recipes-core/libxml/libxml2/install-tests.patch b/meta/recipes-core/libxml/libxml2/install-tests.patch
index 478eeea81b..dc41c1fbbe 100644
--- a/meta/recipes-core/libxml/libxml2/install-tests.patch
+++ b/meta/recipes-core/libxml/libxml2/install-tests.patch
@@ -1,4 +1,4 @@
-From 0779511838a8cbd1e0f431c22f28f286a2a37b1b Mon Sep 17 00:00:00 2001
+From 7095cfa61ff41f9e6f276ee742231a7846667ec2 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Mon, 5 Dec 2022 17:02:32 +0000
 Subject: [PATCH] add yocto-specific install-ptest target
diff --git a/meta/recipes-core/libxml/libxml2_2.12.6.bb b/meta/recipes-core/libxml/libxml2_2.12.7.bb
similarity index 97%
rename from meta/recipes-core/libxml/libxml2_2.12.6.bb
rename to meta/recipes-core/libxml/libxml2_2.12.7.bb
index 14fcff7fa4..84601c282f 100644
--- a/meta/recipes-core/libxml/libxml2_2.12.6.bb
+++ b/meta/recipes-core/libxml/libxml2_2.12.7.bb
@@ -20,7 +20,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://install-tests.patch \
            "
 
-SRC_URI[archive.sha256sum] = "889c593a881a3db5fdd96cc9318c87df34eb648edfc458272ad46fd607353fbb"
+SRC_URI[archive.sha256sum] = "24ae78ff1363a973e6d8beba941a7945da2ac056e19b53956aeb6927fd6cfb56"
 SRC_URI[testtar.sha256sum] = "c6b2d42ee50b8b236e711a97d68e6c4b5c8d83e69a2be4722379f08702ea7273"
 
 # Disputed as a security issue, but fixed in d39f780
-- 
2.44.0


--===============6136695676759861334==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libxml2: SRC_URI changed from "https://download.gnome.org/sources//libxml2/2.12/libxml2-2.12.6.tar.xz;name=archive http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=libxml2-2.12.6;name=testtar file://run-ptest file://install-tests.patch" to "https://download.gnome.org/sources//libxml2/2.12/libxml2-2.12.7.tar.xz;name=archive http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=libxml2-2.12.7;name=testtar file://run-ptest file://install-tests.patch"
packages/core2-64-poky-linux/libxml2: PKGV changed from 2.12.6 [default] to 2.12.7 [default]
packages/core2-64-poky-linux/libxml2: PV changed from "2.12.6" to "2.12.7"
packages/core2-64-poky-linux/libxml2/libxml2-dbg: PKGSIZE changed from 7515768 to 7515544 (-0%)
packages/core2-64-poky-linux/libxml2/libxml2-dbg: PKGV changed from 2.12.6 [default] to 2.12.7 [default]
packages/core2-64-poky-linux/libxml2/libxml2-dbg: FILELIST: removed "/usr/lib/.debug/libxml2.so.2.12.6", added "/usr/lib/.debug/libxml2.so.2.12.7"
packages/core2-64-poky-linux/libxml2/libxml2-dbg: PV changed from "2.12.6" to "2.12.7"
packages/core2-64-poky-linux/libxml2/libxml2-dev: PKGV changed from 2.12.6 [default] to 2.12.7 [default]
packages/core2-64-poky-linux/libxml2/libxml2-dev: PV changed from "2.12.6" to "2.12.7"
packages/core2-64-poky-linux/libxml2/libxml2-doc: PKGSIZE changed from 3119599 to 3119618 (+0%)
packages/core2-64-poky-linux/libxml2/libxml2-doc: PKGV changed from 2.12.6 [default] to 2.12.7 [default]
packages/core2-64-poky-linux/libxml2/libxml2-doc: PV changed from "2.12.6" to "2.12.7"
packages/core2-64-poky-linux/libxml2/libxml2-locale: PKGV changed from 2.12.6 [default] to 2.12.7 [default]
packages/core2-64-poky-linux/libxml2/libxml2-locale: PV changed from "2.12.6" to "2.12.7"
packages/core2-64-poky-linux/libxml2/libxml2-ptest: PKGV changed from 2.12.6 [default] to 2.12.7 [default]
packages/core2-64-poky-linux/libxml2/libxml2-ptest: PV changed from "2.12.6" to "2.12.7"
packages/core2-64-poky-linux/libxml2/libxml2-python: PKGV changed from 2.12.6 [default] to 2.12.7 [default]
packages/core2-64-poky-linux/libxml2/libxml2-python: PV changed from "2.12.6" to "2.12.7"
packages/core2-64-poky-linux/libxml2/libxml2-src: PKGSIZE changed from 7764699 to 7765135 (+0%)
packages/core2-64-poky-linux/libxml2/libxml2-src: PKGV changed from 2.12.6 [default] to 2.12.7 [default]
packages/core2-64-poky-linux/libxml2/libxml2-src: PV changed from "2.12.6" to "2.12.7"
packages/core2-64-poky-linux/libxml2/libxml2-staticdev: PKGV changed from 2.12.6 [default] to 2.12.7 [default]
packages/core2-64-poky-linux/libxml2/libxml2-staticdev: PV changed from "2.12.6" to "2.12.7"
packages/core2-64-poky-linux/libxml2/libxml2-utils: PKGV changed from 2.12.6 [default] to 2.12.7 [default]
packages/core2-64-poky-linux/libxml2/libxml2-utils: PV changed from "2.12.6" to "2.12.7"
packages/core2-64-poky-linux/libxml2/libxml2: PKGV changed from 2.12.6 [default] to 2.12.7 [default]
packages/core2-64-poky-linux/libxml2/libxml2: FILELIST: removed "/usr/lib/libxml2.so.2.12.6", added "/usr/lib/libxml2.so.2.12.7"
packages/core2-64-poky-linux/libxml2/libxml2: PV changed from "2.12.6" to "2.12.7"
Changes to packages/core2-64-poky-linux/libxml2 (sysroot):
  /usr/lib/libxml2.so.2 changed symlink target from libxml2.so.2.12.6 to libxml2.so.2.12.7
  /usr/lib/libxml2.so changed symlink target from libxml2.so.2.12.6 to libxml2.so.2.12.7
  /usr/lib/libxml2.so.2.12.6 moved to /usr/lib/libxml2.so.2.12.7
Changes to packages/x86_64-linux/libxml2-native (sysroot):
  /usr/lib/libxml2.so.2 changed symlink target from libxml2.so.2.12.6 to libxml2.so.2.12.7
  /usr/lib/libxml2.so changed symlink target from libxml2.so.2.12.6 to libxml2.so.2.12.7
  /usr/lib/libxml2.so.2.12.6 moved to /usr/lib/libxml2.so.2.12.7

--===============6136695676759861334==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/libxml2/libxml2: FILELIST: removed "/usr/lib/libxml2.so.2.12.6", added "/usr/lib/libxml2.so.2.12.7"
Changes to packages/core2-64-poky-linux/libxml2 (sysroot):
  /usr/lib/libxml2.so.2 changed symlink target from libxml2.so.2.12.6 to libxml2.so.2.12.7
  /usr/lib/libxml2.so changed symlink target from libxml2.so.2.12.6 to libxml2.so.2.12.7
  /usr/lib/libxml2.so.2.12.6 moved to /usr/lib/libxml2.so.2.12.7
Changes to packages/x86_64-linux/libxml2-native (sysroot):
  /usr/lib/libxml2.so.2 changed symlink target from libxml2.so.2.12.6 to libxml2.so.2.12.7
  /usr/lib/libxml2.so changed symlink target from libxml2.so.2.12.6 to libxml2.so.2.12.7
  /usr/lib/libxml2.so.2.12.6 moved to /usr/lib/libxml2.so.2.12.7

--===============6136695676759861334==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libxml2-upgrade-2.12.6-2.12.7.patch"

RnJvbSBjYzQwYzQwMjc5OTk1NGI0YmFiMWM2YTM3YzcxMWY2MWY4NTAyZDU1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTWF5IDIwMjQgMDc6NDQ6NTUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJ4bWwyOiB1cGdyYWRlIDIuMTIuNiAtPiAyLjEyLjcKCi0tLQogbWV0YS9yZWNpcGVzLWNvcmUv
bGlieG1sL2xpYnhtbDIvaW5zdGFsbC10ZXN0cy5wYXRjaCAgICAgICAgICAgIHwgMiArLQogLi4u
L2xpYnhtbC97bGlieG1sMl8yLjEyLjYuYmIgPT4gbGlieG1sMl8yLjEyLjcuYmJ9ICAgICAgICAg
ICAgIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvcmUvbGlieG1sL3tsaWJ4bWwyXzIuMTIuNi5iYiA9
PiBsaWJ4bWwyXzIuMTIuNy5iYn0gKDk3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29y
ZS9saWJ4bWwvbGlieG1sMi9pbnN0YWxsLXRlc3RzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUv
bGlieG1sL2xpYnhtbDIvaW5zdGFsbC10ZXN0cy5wYXRjaAppbmRleCA0NzhlZWVhODFiLi5kYzQx
YzFmYmJlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9saWJ4bWwvbGlieG1sMi9pbnN0
YWxsLXRlc3RzLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2xpYnhtbC9saWJ4bWwyL2lu
c3RhbGwtdGVzdHMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDA3Nzk1MTE4MzhhOGNiZDFl
MGY0MzFjMjJmMjhmMjg2YTJhMzdiMWIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDcw
OTVjZmE2MWZmNDFmOWU2ZjI3NmVlNzQyMjMxYTc4NDY2NjdlYzIgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCiBGcm9tOiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AYXJtLmNvbT4KIERhdGU6IE1v
biwgNSBEZWMgMjAyMiAxNzowMjozMiArMDAwMAogU3ViamVjdDogW1BBVENIXSBhZGQgeW9jdG8t
c3BlY2lmaWMgaW5zdGFsbC1wdGVzdCB0YXJnZXQKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1j
b3JlL2xpYnhtbC9saWJ4bWwyXzIuMTIuNi5iYiBiL21ldGEvcmVjaXBlcy1jb3JlL2xpYnhtbC9s
aWJ4bWwyXzIuMTIuNy5iYgpzaW1pbGFyaXR5IGluZGV4IDk3JQpyZW5hbWUgZnJvbSBtZXRhL3Jl
Y2lwZXMtY29yZS9saWJ4bWwvbGlieG1sMl8yLjEyLjYuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBl
cy1jb3JlL2xpYnhtbC9saWJ4bWwyXzIuMTIuNy5iYgppbmRleCAxNGZjZmY3ZmE0Li44NDYwMWMy
ODJmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9saWJ4bWwvbGlieG1sMl8yLjEyLjYu
YmIKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvbGlieG1sL2xpYnhtbDJfMi4xMi43LmJiCkBAIC0y
MCw3ICsyMCw3IEBAIFNSQ19VUkkgKz0gImh0dHA6Ly93d3cudzMub3JnL1hNTC9UZXN0L3htbHRz
MjAxMzA5MjMudGFyO3N1YmRpcj0ke0JQfTtuYW1lPXRlc3R0CiAgICAgICAgICAgIGZpbGU6Ly9p
bnN0YWxsLXRlc3RzLnBhdGNoIFwKICAgICAgICAgICAgIgogCi1TUkNfVVJJW2FyY2hpdmUuc2hh
MjU2c3VtXSA9ICI4ODljNTkzYTg4MWEzZGI1ZmRkOTZjYzkzMThjODdkZjM0ZWI2NDhlZGZjNDU4
MjcyYWQ0NmZkNjA3MzUzZmJiIgorU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0gPSAiMjRhZTc4
ZmYxMzYzYTk3M2U2ZDhiZWJhOTQxYTc5NDVkYTJhYzA1NmUxOWI1Mzk1NmFlYjY5MjdmZDZjZmI1
NiIKIFNSQ19VUklbdGVzdHRhci5zaGEyNTZzdW1dID0gImM2YjJkNDJlZTUwYjhiMjM2ZTcxMWE5
N2Q2OGU2YzRiNWM4ZDgzZTY5YTJiZTQ3MjIzNzlmMDg3MDJlYTcyNzMiCiAKICMgRGlzcHV0ZWQg
YXMgYSBzZWN1cml0eSBpc3N1ZSwgYnV0IGZpeGVkIGluIGQzOWY3ODAKLS0gCjIuNDQuMAoK

--===============6136695676759861334==--

