Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90A64C30653
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 06:14:12 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.13584.1713248037835722367
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Apr 2024 23:13:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=htD6diYA;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=0j/JDUAn;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018ee58a68e1-74c3300d-aef4-48d9-8b4d-f252da6da0a7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1713248037;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=J+lI/Fo7kl/Z70DTtsXT1XQOtV7u/w2oGGA+t3NmmDE=;
	b=htD6diYAL/ZKECsHLZ2blfXw+zdhGBWALrUtdlg7wc1TIzQRM24gwd9r9cqCH2yG
	9Z4QqBglEX7tmqFv2xO5MwiwMVd9GH74VMCjzmpVc/fs72pNa034RbabnmuWVfZjfJ0
	pKIOsdmE7bnY+enIWs8ILDRbEwK/r4G9npzM9Fzw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1713248037;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=J+lI/Fo7kl/Z70DTtsXT1XQOtV7u/w2oGGA+t3NmmDE=;
	b=0j/JDUAniwvf94Jpj9Cjx9opbcx9aYq41Zx13hhHMOwPng/AHV6BxdyE27/eZD+O
	D2YUeeJ4L/K+mjxy28Mzsa0ztz7f8n3MLkVkiqNS1xhfnb57h/NCanGBGfRJSX5qVpc
	AMh5BplwaSom3sClvOez+cFDMfoHp4vpjckgiOs4=
Content-Type: multipart/mixed; boundary="===============2494041052854791225=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libxml2: upgrading to 2.12.6 SUCCEEDED
Message-ID: <0101018ee58a68e1-74c3300d-aef4-48d9-8b4d-f252da6da0a7-000000@us-west-2.amazonses.com>
Date: Tue, 16 Apr 2024 06:13:57 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.16-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 06:14:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198259

--===============2494041052854791225==
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
From 3b0cb22a81399d6e39e7584b0feb270420383e62 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Apr 2024 18:06:20 +0000
Subject: [PATCH] libxml2: upgrade 2.12.5 -> 2.12.6

---
 meta/recipes-core/libxml/libxml2/install-tests.patch            | 2 +-
 .../libxml/{libxml2_2.12.5.bb => libxml2_2.12.6.bb}             | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/libxml/{libxml2_2.12.5.bb => libxml2_2.12.6.bb} (97%)

diff --git a/meta/recipes-core/libxml/libxml2/install-tests.patch b/meta/recipes-core/libxml/libxml2/install-tests.patch
index 478eeea81b..5919f242af 100644
--- a/meta/recipes-core/libxml/libxml2/install-tests.patch
+++ b/meta/recipes-core/libxml/libxml2/install-tests.patch
@@ -1,4 +1,4 @@
-From 0779511838a8cbd1e0f431c22f28f286a2a37b1b Mon Sep 17 00:00:00 2001
+From eec20cbcee04d55e1e22a1a209e0f6d7145ef329 Mon Sep 17 00:00:00 2001
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


--===============2494041052854791225==
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

--===============2494041052854791225==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libxml2: PV changed from "2.12.5" to "2.12.6"
packages/core2-64-poky-linux/libxml2: PKGV changed from 2.12.5 [default] to 2.12.6 [default]
packages/core2-64-poky-linux/libxml2: SRC_URI changed from "https://download.gnome.org/sources//libxml2/2.12/libxml2-2.12.5.tar.xz;name=archive http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=libxml2-2.12.5;name=testtar file://run-ptest file://install-tests.patch" to "https://download.gnome.org/sources//libxml2/2.12/libxml2-2.12.6.tar.xz;name=archive http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=libxml2-2.12.6;name=testtar file://run-ptest file://install-tests.patch"
packages/core2-64-poky-linux/libxml2/libxml2-dbg: PV changed from "2.12.5" to "2.12.6"
packages/core2-64-poky-linux/libxml2/libxml2-dbg: FILELIST: removed "/usr/lib/.debug/libxml2.so.2.12.5", added "/usr/lib/.debug/libxml2.so.2.12.6"
packages/core2-64-poky-linux/libxml2/libxml2-dbg: PKGSIZE changed from 7512928 to 7515768 (+0%)
packages/core2-64-poky-linux/libxml2/libxml2-dbg: PKGV changed from 2.12.5 [default] to 2.12.6 [default]
packages/core2-64-poky-linux/libxml2/libxml2-dev: PV changed from "2.12.5" to "2.12.6"
packages/core2-64-poky-linux/libxml2/libxml2-dev: PKGV changed from 2.12.5 [default] to 2.12.6 [default]
packages/core2-64-poky-linux/libxml2/libxml2-doc: PV changed from "2.12.5" to "2.12.6"
packages/core2-64-poky-linux/libxml2/libxml2-doc: PKGSIZE changed from 3119076 to 3119599 (+0%)
packages/core2-64-poky-linux/libxml2/libxml2-doc: PKGV changed from 2.12.5 [default] to 2.12.6 [default]
packages/core2-64-poky-linux/libxml2/libxml2-locale: PV changed from "2.12.5" to "2.12.6"
packages/core2-64-poky-linux/libxml2/libxml2-locale: PKGV changed from 2.12.5 [default] to 2.12.6 [default]
packages/core2-64-poky-linux/libxml2/libxml2-ptest: PV changed from "2.12.5" to "2.12.6"
packages/core2-64-poky-linux/libxml2/libxml2-ptest: PKGV changed from 2.12.5 [default] to 2.12.6 [default]
packages/core2-64-poky-linux/libxml2/libxml2-python: PV changed from "2.12.5" to "2.12.6"
packages/core2-64-poky-linux/libxml2/libxml2-python: PKGV changed from 2.12.5 [default] to 2.12.6 [default]
packages/core2-64-poky-linux/libxml2/libxml2-src: PV changed from "2.12.5" to "2.12.6"
packages/core2-64-poky-linux/libxml2/libxml2-src: PKGSIZE changed from 7763131 to 7764699 (+0%)
packages/core2-64-poky-linux/libxml2/libxml2-src: PKGV changed from 2.12.5 [default] to 2.12.6 [default]
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

--===============2494041052854791225==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libxml2-upgrade-2.12.5-2.12.6.patch"

RnJvbSAzYjBjYjIyYTgxMzk5ZDZlMzllNzU4NGIwZmViMjcwNDIwMzgzZTYyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgQXByIDIwMjQgMTg6MDY6MjAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJ4bWwyOiB1cGdyYWRlIDIuMTIuNSAtPiAyLjEyLjYKCi0tLQogbWV0YS9yZWNpcGVzLWNvcmUv
bGlieG1sL2xpYnhtbDIvaW5zdGFsbC10ZXN0cy5wYXRjaCAgICAgICAgICAgIHwgMiArLQogLi4u
L2xpYnhtbC97bGlieG1sMl8yLjEyLjUuYmIgPT4gbGlieG1sMl8yLjEyLjYuYmJ9ICAgICAgICAg
ICAgIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvcmUvbGlieG1sL3tsaWJ4bWwyXzIuMTIuNS5iYiA9
PiBsaWJ4bWwyXzIuMTIuNi5iYn0gKDk3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29y
ZS9saWJ4bWwvbGlieG1sMi9pbnN0YWxsLXRlc3RzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUv
bGlieG1sL2xpYnhtbDIvaW5zdGFsbC10ZXN0cy5wYXRjaAppbmRleCA0NzhlZWVhODFiLi41OTE5
ZjI0MmFmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9saWJ4bWwvbGlieG1sMi9pbnN0
YWxsLXRlc3RzLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2xpYnhtbC9saWJ4bWwyL2lu
c3RhbGwtdGVzdHMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDA3Nzk1MTE4MzhhOGNiZDFl
MGY0MzFjMjJmMjhmMjg2YTJhMzdiMWIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGVl
YzIwY2JjZWUwNGQ1NWUxZTIyYTFhMjA5ZTBmNmQ3MTQ1ZWYzMjkgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCiBGcm9tOiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AYXJtLmNvbT4KIERhdGU6IE1v
biwgNSBEZWMgMjAyMiAxNzowMjozMiArMDAwMAogU3ViamVjdDogW1BBVENIXSBhZGQgeW9jdG8t
c3BlY2lmaWMgaW5zdGFsbC1wdGVzdCB0YXJnZXQKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1j
b3JlL2xpYnhtbC9saWJ4bWwyXzIuMTIuNS5iYiBiL21ldGEvcmVjaXBlcy1jb3JlL2xpYnhtbC9s
aWJ4bWwyXzIuMTIuNi5iYgpzaW1pbGFyaXR5IGluZGV4IDk3JQpyZW5hbWUgZnJvbSBtZXRhL3Jl
Y2lwZXMtY29yZS9saWJ4bWwvbGlieG1sMl8yLjEyLjUuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBl
cy1jb3JlL2xpYnhtbC9saWJ4bWwyXzIuMTIuNi5iYgppbmRleCA0N2MxYTcyZTc3Li4xNGZjZmY3
ZmE0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9saWJ4bWwvbGlieG1sMl8yLjEyLjUu
YmIKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvbGlieG1sL2xpYnhtbDJfMi4xMi42LmJiCkBAIC0y
MCw3ICsyMCw3IEBAIFNSQ19VUkkgKz0gImh0dHA6Ly93d3cudzMub3JnL1hNTC9UZXN0L3htbHRz
MjAxMzA5MjMudGFyO3N1YmRpcj0ke0JQfTtuYW1lPXRlc3R0CiAgICAgICAgICAgIGZpbGU6Ly9p
bnN0YWxsLXRlc3RzLnBhdGNoIFwKICAgICAgICAgICAgIgogCi1TUkNfVVJJW2FyY2hpdmUuc2hh
MjU2c3VtXSA9ICJhOTcyNzk2Njk2YWZkMzgwNzNlMGY1OWMyODNjM2EyZjVhNTYwYjUyNjhiNGJh
YmMzOTFiMjg2MTY2NTI2YjIxIgorU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0gPSAiODg5YzU5
M2E4ODFhM2RiNWZkZDk2Y2M5MzE4Yzg3ZGYzNGViNjQ4ZWRmYzQ1ODI3MmFkNDZmZDYwNzM1M2Zi
YiIKIFNSQ19VUklbdGVzdHRhci5zaGEyNTZzdW1dID0gImM2YjJkNDJlZTUwYjhiMjM2ZTcxMWE5
N2Q2OGU2YzRiNWM4ZDgzZTY5YTJiZTQ3MjIzNzlmMDg3MDJlYTcyNzMiCiAKICMgRGlzcHV0ZWQg
YXMgYSBzZWN1cml0eSBpc3N1ZSwgYnV0IGZpeGVkIGluIGQzOWY3ODAKLS0gCjIuNDIuMAoK

--===============2494041052854791225==--

