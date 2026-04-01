Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6852D1076395
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 14:36:03 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14651.1775054159015464259
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 07:35:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=fX13cUFi;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=RSaB6qMf;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019d4978f8f8-cb820dfc-3a2c-4016-928c-6d78a9daf084-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1775054158;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=+XGCrzl60sa9GwjDab5Dqdfji84bu8sIoSnl1mGKjlE=;
	b=fX13cUFibHHxAGQgFiuQYpK4gTY28eaEUnQ+cQbn4keMSYq2hYB/ry19lJUJMT5j
	2t6g+wrfLFnQsXYCtjRjiRl52Lt/yTdeSoxpWrXaWBm9YoSVxBTBiNF7HYTSLRBCFGw
	zVc/wUOptGx+VIeGglC3/irzOUE59PHTiVqvlGxk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1775054158;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=+XGCrzl60sa9GwjDab5Dqdfji84bu8sIoSnl1mGKjlE=;
	b=RSaB6qMffax6wlWaerTETlyMQ6SlxwiXknicbESDuSl5eTnYMk1/ITUOfH4XXmcd
	9z0cyvHB7xtSSuBRNoSv3qn3GFyaNef83LmnwkqLyKD0ASmXjKhna5XCu1oFw2yFQY+
	bW710E7lgMcWajBrYjdH0RbA7DDwMEqpGXzuGTeM=
Content-Type: multipart/mixed; boundary="===============7440594388936854728=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] bind: upgrading to 9.20.21 SUCCEEDED
Message-ID: <0101019d4978f8f8-cb820dfc-3a2c-4016-928c-6d78a9daf084-000000@us-west-2.amazonses.com>
Date: Wed, 1 Apr 2026 14:35:58 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 14:36:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234367

--===============7440594388936854728==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *bind* to *9.20.21* has Succeeded.

Next steps:
    - apply the patch: git am 0001-bind-upgrade-9.20.20-9.20.21.patch
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
From 19d882bb26798a07faa037baee5fced200132158 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Apr 2026 06:45:59 +0000
Subject: [PATCH] bind: upgrade 9.20.20 -> 9.20.21

---
 .../bind/bind/0001-avoid-start-failure-with-bind-user.patch   | 2 +-
 ...0001-named-lwresd-V-and-start-log-hide-build-options.patch | 4 ++--
 ...bind-ensure-searching-for-json-headers-searches-sysr.patch | 4 ++--
 meta/recipes-connectivity/bind/bind/conf.patch                | 2 +-
 .../bind/bind/init.d-add-support-for-read-only-rootfs.patch   | 2 +-
 .../bind/bind/make-etc-initd-bind-stop-work.patch             | 2 +-
 .../bind/{bind_9.20.20.bb => bind_9.20.21.bb}                 | 2 +-
 7 files changed, 9 insertions(+), 9 deletions(-)
 rename meta/recipes-connectivity/bind/{bind_9.20.20.bb => bind_9.20.21.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
index 4fa377a594..ecffdb426d 100644
--- a/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
@@ -1,4 +1,4 @@
-From 2a3ff2a026c55dc67655baf28e0f4175232ee0ff Mon Sep 17 00:00:00 2001
+From 8686fc97d3d4139caa808463f0c0cc19d8b823be Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 15 Oct 2018 16:55:09 +0800
 Subject: [PATCH] avoid start failure with bind user
diff --git a/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
index 369185ad86..63f753201a 100644
--- a/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
@@ -1,4 +1,4 @@
-From 49ca7b5432dd6c24541bbde21bca5043cd0c000b Mon Sep 17 00:00:00 2001
+From 6988aa9572064d4323ebe491c940aa619ff56a74 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Mon, 27 Aug 2018 21:24:20 +0800
 Subject: [PATCH] `named/lwresd -V' and start log hide build options
@@ -20,7 +20,7 @@ Signed-off-by: Armin Kuster <akuster@mvista.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index c3852ec..3b7a446 100644
+index f965dcf..3fe5870 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -35,7 +35,7 @@ AC_DEFINE([PACKAGE_VERSION_EXTRA], ["][bind_VERSION_EXTRA]["], [BIND 9 Extra par
diff --git a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
index 4a066294f0..63b0509f4f 100644
--- a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
+++ b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
@@ -1,4 +1,4 @@
-From fa165cb4a9dfeb72f0db787decd527e3d587cd4e Mon Sep 17 00:00:00 2001
+From 8f08459774c77a023dd8e8d09e6172c4699fbe86 Mon Sep 17 00:00:00 2001
 From: Paul Gortmaker <paul.gortmaker@windriver.com>
 Date: Tue, 9 Jun 2015 11:22:00 -0400
 Subject: [PATCH] bind: ensure searching for json headers searches sysroot
@@ -32,7 +32,7 @@ Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index c6a10f6..c3852ec 100644
+index c09513f..f965dcf 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -865,7 +865,7 @@ AS_CASE([$with_lmdb],
diff --git a/meta/recipes-connectivity/bind/bind/conf.patch b/meta/recipes-connectivity/bind/bind/conf.patch
index ec22fe84c4..3681428471 100644
--- a/meta/recipes-connectivity/bind/bind/conf.patch
+++ b/meta/recipes-connectivity/bind/bind/conf.patch
@@ -1,4 +1,4 @@
-From 4b9f6f6735340d558d9c9fba9c84d7f99d3cbde2 Mon Sep 17 00:00:00 2001
+From 0dd2145dbd2f1945f6bc7b76ce1c3473ed8c0e89 Mon Sep 17 00:00:00 2001
 From: Qing He <qing.he@intel.com>
 Date: Tue, 30 Nov 2010 13:35:42 +0800
 Subject: [PATCH] bind: add new recipe
diff --git a/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
index fd96d46448..87d74a684e 100644
--- a/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
+++ b/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
@@ -1,4 +1,4 @@
-From 19933be78902d90014f177b5633dd15984bc1bc9 Mon Sep 17 00:00:00 2001
+From d288bc9b008c23b48547af3bd8c5e586902d5d43 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Thu, 27 Mar 2014 02:34:41 +0000
 Subject: [PATCH] init.d: add support for read-only rootfs
diff --git a/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
index 155cc5a110..198e1aa0ce 100644
--- a/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
+++ b/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
@@ -1,4 +1,4 @@
-From e429899c34ea8a4f85de428e22ee49c453281e82 Mon Sep 17 00:00:00 2001
+From 16dc8f484e5dd8a53090c412232cba95c6ac3bac Mon Sep 17 00:00:00 2001
 From: Roy Li <rongqing.li@windriver.com>
 Date: Thu, 15 Nov 2012 02:27:54 +0000
 Subject: [PATCH] bind: make "/etc/init.d/bind stop" work
diff --git a/meta/recipes-connectivity/bind/bind_9.20.20.bb b/meta/recipes-connectivity/bind/bind_9.20.21.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.20.20.bb
rename to meta/recipes-connectivity/bind/bind_9.20.21.bb
index b42c109105..c6283372a5 100644
--- a/meta/recipes-connectivity/bind/bind_9.20.20.bb
+++ b/meta/recipes-connectivity/bind/bind_9.20.21.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "19b8335d25305231d5eb8f7d924240d1ac97c4da7c93eaa6273503133aa6106a"
+SRC_URI[sha256sum] = "15e1b5a227d2890f7c4e823a6ea018de70ee2f3a0e859cbff3d82aad8590de03"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.47.1


--===============7440594388936854728==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-bind-upgrade-9.20.20-9.20.21.patch"

RnJvbSAxOWQ4ODJiYjI2Nzk4YTA3ZmFhMDM3YmFlZTVmY2VkMjAwMTMyMTU4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBBcHIgMjAyNiAwNjo0NTo1OSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGJp
bmQ6IHVwZ3JhZGUgOS4yMC4yMCAtPiA5LjIwLjIxCgotLS0KIC4uLi9iaW5kL2JpbmQvMDAwMS1h
dm9pZC1zdGFydC1mYWlsdXJlLXdpdGgtYmluZC11c2VyLnBhdGNoICAgfCAyICstCiAuLi4wMDAx
LW5hbWVkLWx3cmVzZC1WLWFuZC1zdGFydC1sb2ctaGlkZS1idWlsZC1vcHRpb25zLnBhdGNoIHwg
NCArKy0tCiAuLi5iaW5kLWVuc3VyZS1zZWFyY2hpbmctZm9yLWpzb24taGVhZGVycy1zZWFyY2hl
cy1zeXNyLnBhdGNoIHwgNCArKy0tCiBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmlu
ZC9jb25mLnBhdGNoICAgICAgICAgICAgICAgIHwgMiArLQogLi4uL2JpbmQvYmluZC9pbml0LmQt
YWRkLXN1cHBvcnQtZm9yLXJlYWQtb25seS1yb290ZnMucGF0Y2ggICB8IDIgKy0KIC4uLi9iaW5k
L2JpbmQvbWFrZS1ldGMtaW5pdGQtYmluZC1zdG9wLXdvcmsucGF0Y2ggICAgICAgICAgICAgfCAy
ICstCiAuLi4vYmluZC97YmluZF85LjIwLjIwLmJiID0+IGJpbmRfOS4yMC4yMS5iYn0gICAgICAg
ICAgICAgICAgIHwgMiArLQogNyBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDkgZGVs
ZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL3tiaW5kXzku
MjAuMjAuYmIgPT4gYmluZF85LjIwLjIxLmJifSAoOTclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kLzAwMDEtYXZvaWQtc3RhcnQtZmFpbHVyZS13aXRo
LWJpbmQtdXNlci5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kLzAw
MDEtYXZvaWQtc3RhcnQtZmFpbHVyZS13aXRoLWJpbmQtdXNlci5wYXRjaAppbmRleCA0ZmEzNzdh
NTk0Li5lY2ZmZGI0MjZkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2Jp
bmQvYmluZC8wMDAxLWF2b2lkLXN0YXJ0LWZhaWx1cmUtd2l0aC1iaW5kLXVzZXIucGF0Y2gKKysr
IGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvMDAwMS1hdm9pZC1zdGFydC1m
YWlsdXJlLXdpdGgtYmluZC11c2VyLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAyYTNmZjJh
MDI2YzU1ZGM2NzY1NWJhZjI4ZTBmNDE3NTIzMmVlMGZmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQorRnJvbSA4Njg2ZmM5N2QzZDQxMzljYWE4MDg0NjNmMGMwY2MxOWQ4YjgyM2JlIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQ2hlbiBRaSA8UWkuQ2hlbkB3aW5kcml2ZXIuY29tPgog
RGF0ZTogTW9uLCAxNSBPY3QgMjAxOCAxNjo1NTowOSArMDgwMAogU3ViamVjdDogW1BBVENIXSBh
dm9pZCBzdGFydCBmYWlsdXJlIHdpdGggYmluZCB1c2VyCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC8wMDAxLW5hbWVkLWx3cmVzZC1WLWFuZC1zdGFydC1s
b2ctaGlkZS1idWlsZC1vcHRpb25zLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9i
aW5kL2JpbmQvMDAwMS1uYW1lZC1sd3Jlc2QtVi1hbmQtc3RhcnQtbG9nLWhpZGUtYnVpbGQtb3B0
aW9ucy5wYXRjaAppbmRleCAzNjkxODVhZDg2Li42M2Y3NTMyMDFhIDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC8wMDAxLW5hbWVkLWx3cmVzZC1WLWFuZC1z
dGFydC1sb2ctaGlkZS1idWlsZC1vcHRpb25zLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb25u
ZWN0aXZpdHkvYmluZC9iaW5kLzAwMDEtbmFtZWQtbHdyZXNkLVYtYW5kLXN0YXJ0LWxvZy1oaWRl
LWJ1aWxkLW9wdGlvbnMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDQ5Y2E3YjU0MzJkZDZj
MjQ1NDFiYmRlMjFiY2E1MDQzY2QwYzAwMGIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9t
IDY5ODhhYTk1NzIwNjRkNDMyM2ViZTQ5MWM5NDBhYTYxOWZmNTZhNzQgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCiBGcm9tOiBIb25neHUgSmlhIDxob25neHUuamlhQHdpbmRyaXZlci5jb20+CiBE
YXRlOiBNb24sIDI3IEF1ZyAyMDE4IDIxOjI0OjIwICswODAwCiBTdWJqZWN0OiBbUEFUQ0hdIGBu
YW1lZC9sd3Jlc2QgLVYnIGFuZCBzdGFydCBsb2cgaGlkZSBidWlsZCBvcHRpb25zCkBAIC0yMCw3
ICsyMCw3IEBAIFNpZ25lZC1vZmYtYnk6IEFybWluIEt1c3RlciA8YWt1c3RlckBtdmlzdGEuY29t
PgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZm
IC0tZ2l0IGEvY29uZmlndXJlLmFjIGIvY29uZmlndXJlLmFjCi1pbmRleCBjMzg1MmVjLi4zYjdh
NDQ2IDEwMDY0NAoraW5kZXggZjk2NWRjZi4uM2ZlNTg3MCAxMDA2NDQKIC0tLSBhL2NvbmZpZ3Vy
ZS5hYwogKysrIGIvY29uZmlndXJlLmFjCiBAQCAtMzUsNyArMzUsNyBAQCBBQ19ERUZJTkUoW1BB
Q0tBR0VfVkVSU0lPTl9FWFRSQV0sIFsiXVtiaW5kX1ZFUlNJT05fRVhUUkFdWyJdLCBbQklORCA5
IEV4dHJhIHBhcgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2Jp
bmQvYmluZC1lbnN1cmUtc2VhcmNoaW5nLWZvci1qc29uLWhlYWRlcnMtc2VhcmNoZXMtc3lzci5w
YXRjaCBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kL2JpbmQtZW5zdXJlLXNl
YXJjaGluZy1mb3ItanNvbi1oZWFkZXJzLXNlYXJjaGVzLXN5c3IucGF0Y2gKaW5kZXggNGEwNjYy
OTRmMC4uNjNiMDUwOWY0ZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9i
aW5kL2JpbmQvYmluZC1lbnN1cmUtc2VhcmNoaW5nLWZvci1qc29uLWhlYWRlcnMtc2VhcmNoZXMt
c3lzci5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC9iaW5k
LWVuc3VyZS1zZWFyY2hpbmctZm9yLWpzb24taGVhZGVycy1zZWFyY2hlcy1zeXNyLnBhdGNoCkBA
IC0xLDQgKzEsNCBAQAotRnJvbSBmYTE2NWNiNGE5ZGZlYjcyZjBkYjc4N2RlY2Q1MjdlM2Q1ODdj
ZDRlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA4ZjA4NDU5Nzc0Yzc3YTAyM2RkOGU4
ZDA5ZTYxNzJjNDY5OWZiZTg2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUGF1bCBH
b3J0bWFrZXIgPHBhdWwuZ29ydG1ha2VyQHdpbmRyaXZlci5jb20+CiBEYXRlOiBUdWUsIDkgSnVu
IDIwMTUgMTE6MjI6MDAgLTA0MDAKIFN1YmplY3Q6IFtQQVRDSF0gYmluZDogZW5zdXJlIHNlYXJj
aGluZyBmb3IganNvbiBoZWFkZXJzIHNlYXJjaGVzIHN5c3Jvb3QKQEAgLTMyLDcgKzMyLDcgQEAg
U2lnbmVkLW9mZi1ieTogUGF1bCBHb3J0bWFrZXIgPHBhdWwuZ29ydG1ha2VyQHdpbmRyaXZlci5j
b20+CiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRp
ZmYgLS1naXQgYS9jb25maWd1cmUuYWMgYi9jb25maWd1cmUuYWMKLWluZGV4IGM2YTEwZjYuLmMz
ODUyZWMgMTAwNjQ0CitpbmRleCBjMDk1MTNmLi5mOTY1ZGNmIDEwMDY0NAogLS0tIGEvY29uZmln
dXJlLmFjCiArKysgYi9jb25maWd1cmUuYWMKIEBAIC04NjUsNyArODY1LDcgQEAgQVNfQ0FTRShb
JHdpdGhfbG1kYl0sCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQv
YmluZC9jb25mLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvY29u
Zi5wYXRjaAppbmRleCBlYzIyZmU4NGM0Li4zNjgxNDI4NDcxIDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC9jb25mLnBhdGNoCisrKyBiL21ldGEvcmVjaXBl
cy1jb25uZWN0aXZpdHkvYmluZC9iaW5kL2NvbmYucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9t
IDRiOWY2ZjY3MzUzNDBkNTU4ZDljOWZiYTljODRkN2Y5OWQzY2JkZTIgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCitGcm9tIDBkZDIxNDVkYmQyZjE5NDVmNmJjN2I3NmNlMWMzNDczZWQ4YzBlODkg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBRaW5nIEhlIDxxaW5nLmhlQGludGVsLmNv
bT4KIERhdGU6IFR1ZSwgMzAgTm92IDIwMTAgMTM6MzU6NDIgKzA4MDAKIFN1YmplY3Q6IFtQQVRD
SF0gYmluZDogYWRkIG5ldyByZWNpcGUKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0
aXZpdHkvYmluZC9iaW5kL2luaXQuZC1hZGQtc3VwcG9ydC1mb3ItcmVhZC1vbmx5LXJvb3Rmcy5w
YXRjaCBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kL2luaXQuZC1hZGQtc3Vw
cG9ydC1mb3ItcmVhZC1vbmx5LXJvb3Rmcy5wYXRjaAppbmRleCBmZDk2ZDQ2NDQ4Li44N2Q3NGE2
ODRlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC9pbml0
LmQtYWRkLXN1cHBvcnQtZm9yLXJlYWQtb25seS1yb290ZnMucGF0Y2gKKysrIGIvbWV0YS9yZWNp
cGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvaW5pdC5kLWFkZC1zdXBwb3J0LWZvci1yZWFkLW9u
bHktcm9vdGZzLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAxOTkzM2JlNzg5MDJkOTAwMTRm
MTc3YjU2MzNkZDE1OTg0YmMxYmM5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBkMjg4
YmM5YjAwOGMyM2I0ODU0N2FmM2JkOGM1ZTU4NjkwMmQ1ZDQzIE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQogRnJvbTogQ2hlbiBRaSA8UWkuQ2hlbkB3aW5kcml2ZXIuY29tPgogRGF0ZTogVGh1LCAy
NyBNYXIgMjAxNCAwMjozNDo0MSArMDAwMAogU3ViamVjdDogW1BBVENIXSBpbml0LmQ6IGFkZCBz
dXBwb3J0IGZvciByZWFkLW9ubHkgcm9vdGZzCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29u
bmVjdGl2aXR5L2JpbmQvYmluZC9tYWtlLWV0Yy1pbml0ZC1iaW5kLXN0b3Atd29yay5wYXRjaCBi
L21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kL21ha2UtZXRjLWluaXRkLWJpbmQt
c3RvcC13b3JrLnBhdGNoCmluZGV4IDE1NWNjNWExMTAuLjE5OGUxYWEwY2UgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kL21ha2UtZXRjLWluaXRkLWJpbmQt
c3RvcC13b3JrLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5k
L21ha2UtZXRjLWluaXRkLWJpbmQtc3RvcC13b3JrLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJv
bSBlNDI5ODk5YzM0ZWE4YTRmODVkZTQyOGUyMmVlNDljNDUzMjgxZTgyIE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQorRnJvbSAxNmRjOGY0ODRlNWRkOGE1MzA5MGM0MTIyMzJjYmE5NWM2YWMzYmFj
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUm95IExpIDxyb25ncWluZy5saUB3aW5k
cml2ZXIuY29tPgogRGF0ZTogVGh1LCAxNSBOb3YgMjAxMiAwMjoyNzo1NCArMDAwMAogU3ViamVj
dDogW1BBVENIXSBiaW5kOiBtYWtlICIvZXRjL2luaXQuZC9iaW5kIHN0b3AiIHdvcmsKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kXzkuMjAuMjAuYmIgYi9t
ZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZF85LjIwLjIxLmJiCnNpbWlsYXJpdHkg
aW5kZXggOTclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5k
XzkuMjAuMjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5k
XzkuMjAuMjEuYmIKaW5kZXggYjQyYzEwOTEwNS4uYzYyODMzNzJhNSAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmRfOS4yMC4yMC5iYgorKysgYi9tZXRhL3Jl
Y2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZF85LjIwLjIxLmJiCkBAIC0yMCw3ICsyMCw3IEBA
IFNSQ19VUkkgPSAiaHR0cHM6Ly9mdHAuaXNjLm9yZy9pc2MvYmluZDkvJHtQVn0vJHtCUE59LSR7
UFZ9LnRhci54eiBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLWF2b2lkLXN0YXJ0LWZhaWx1cmUt
d2l0aC1iaW5kLXVzZXIucGF0Y2ggXAogICAgICAgICAgICAiCiAKLVNSQ19VUklbc2hhMjU2c3Vt
XSA9ICIxOWI4MzM1ZDI1MzA1MjMxZDVlYjhmN2Q5MjQyNDBkMWFjOTdjNGRhN2M5M2VhYTYyNzM1
MDMxMzNhYTYxMDZhIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjE1ZTFiNWEyMjdkMjg5MGY3YzRl
ODIzYTZlYTAxOGRlNzBlZTJmM2EwZTg1OWNiZmYzZDgyYWFkODU5MGRlMDMiCiAKIFVQU1RSRUFN
X0NIRUNLX1VSSSA9ICJodHRwczovL2Z0cC5pc2Mub3JnL2lzYy9iaW5kOS8iCiAjIGZvbGxvdyB0
aGUgRVNWIHZlcnNpb25zIGRpdmlzaWJsZSBieSAyCi0tIAoyLjQ3LjEKCg==

--===============7440594388936854728==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/bind/bind-libs: FILELIST: removed "/usr/lib/libdns-9.20.20.so /usr/lib/libns-9.20.20.so /usr/lib/libisccc-9.20.20.so /usr/lib/libisccfg-9.20.20.so /usr/lib/libisc-9.20.20.so", added "/usr/lib/libisccc-9.20.21.so /usr/lib/libdns-9.20.21.so /usr/lib/libns-9.20.21.so /usr/lib/libisccfg-9.20.21.so /usr/lib/libisc-9.20.21.so"
Changes to packages/x86-64-v3-poky-linux/bind (sysroot):
  /usr/lib/libdns.so changed symlink target from libdns-9.20.20.so to libdns-9.20.21.so
  /usr/lib/libisccc.so changed symlink target from libisccc-9.20.20.so to libisccc-9.20.21.so
  /usr/lib/libisccfg.so changed symlink target from libisccfg-9.20.20.so to libisccfg-9.20.21.so
  /usr/lib/libisc.so changed symlink target from libisc-9.20.20.so to libisc-9.20.21.so
  /usr/lib/libns.so changed symlink target from libns-9.20.20.so to libns-9.20.21.so
  /usr/lib/libdns-9.20.20.so moved to /usr/lib/libdns-9.20.21.so
  /usr/lib/libisc-9.20.20.so moved to /usr/lib/libisc-9.20.21.so
  /usr/lib/libisccc-9.20.20.so moved to /usr/lib/libisccc-9.20.21.so
  /usr/lib/libisccfg-9.20.20.so moved to /usr/lib/libisccfg-9.20.21.so
  /usr/lib/libns-9.20.20.so moved to /usr/lib/libns-9.20.21.so

--===============7440594388936854728==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/bind/bind-dbg: PKGV changed from 9.20.20 [default] to 9.20.21 [default]
packages/x86-64-v3-poky-linux/bind/bind-dbg: PV changed from "9.20.20" to "9.20.21"
packages/x86-64-v3-poky-linux/bind/bind-dbg: PKGSIZE changed from 15883496 to 15885832 (+0%)
packages/x86-64-v3-poky-linux/bind/bind-dbg: FILELIST: removed "/usr/lib/.debug/libisc-9.20.20.so /usr/lib/.debug/libdns-9.20.20.so /usr/lib/.debug/libisccc-9.20.20.so /usr/lib/.debug/libns-9.20.20.so /usr/lib/.debug/libisccfg-9.20.20.so", added "/usr/lib/.debug/libdns-9.20.21.so /usr/lib/.debug/libisc-9.20.21.so /usr/lib/.debug/libns-9.20.21.so /usr/lib/.debug/libisccfg-9.20.21.so /usr/lib/.debug/libisccc-9.20.21.so"
packages/x86-64-v3-poky-linux/bind/bind-dev: PKGV changed from 9.20.20 [default] to 9.20.21 [default]
packages/x86-64-v3-poky-linux/bind/bind-dev: PV changed from "9.20.20" to "9.20.21"
packages/x86-64-v3-poky-linux/bind/bind-dev: PKGSIZE changed from 1603388 to 1603413 (+0%)
packages/x86-64-v3-poky-linux/bind/bind-doc: PKGV changed from 9.20.20 [default] to 9.20.21 [default]
packages/x86-64-v3-poky-linux/bind/bind-doc: PV changed from "9.20.20" to "9.20.21"
packages/x86-64-v3-poky-linux/bind/bind-libs: PKGV changed from 9.20.20 [default] to 9.20.21 [default]
packages/x86-64-v3-poky-linux/bind/bind-libs: PV changed from "9.20.20" to "9.20.21"
packages/x86-64-v3-poky-linux/bind/bind-libs: FILES: removed "/usr/lib/*-9.20.20.so", added "/usr/lib/*-9.20.21.so"
packages/x86-64-v3-poky-linux/bind/bind-libs: FILELIST: removed "/usr/lib/libdns-9.20.20.so /usr/lib/libisccc-9.20.20.so /usr/lib/libns-9.20.20.so /usr/lib/libisc-9.20.20.so /usr/lib/libisccfg-9.20.20.so", added "/usr/lib/libisccc-9.20.21.so /usr/lib/libisccfg-9.20.21.so /usr/lib/libdns-9.20.21.so /usr/lib/libns-9.20.21.so /usr/lib/libisc-9.20.21.so"
packages/x86-64-v3-poky-linux/bind/bind-locale: PKGV changed from 9.20.20 [default] to 9.20.21 [default]
packages/x86-64-v3-poky-linux/bind/bind-locale: PV changed from "9.20.20" to "9.20.21"
packages/x86-64-v3-poky-linux/bind/bind-src: PKGV changed from 9.20.20 [default] to 9.20.21 [default]
packages/x86-64-v3-poky-linux/bind/bind-src: PV changed from "9.20.20" to "9.20.21"
packages/x86-64-v3-poky-linux/bind/bind-src: PKGSIZE changed from 10081900 to 10085120 (+0%)
packages/x86-64-v3-poky-linux/bind/bind-src: FILELIST: directory renamed /usr/src/debug/bind/9.20.20/lib/isccfg -> /usr/src/debug/bind/9.20.21/lib/isccfg, directory renamed /usr/src/debug/bind/9.20.20/lib/isccc -> /usr/src/debug/bind/9.20.21/lib/isccc, directory renamed /usr/src/debug/bind/9.20.20/lib/isccc/include/isccc -> /usr/src/debug/bind/9.20.21/lib/isccc/include/isccc, directory renamed /usr/src/debug/bind/9.20.20/bin/rndc -> /usr/src/debug/bind/9.20.21/bin/rndc, directory renamed /usr/src/debug/bind/9.20.20/bin/confgen/include/confgen -> /usr/src/debug/bind/9.20.21/bin/confgen/include/confgen, directory renamed /usr/src/debug/bind/9.20.20/lib/dns/rdata/generic -> /usr/src/debug/bind/9.20.21/lib/dns/rdata/generic, directory renamed /usr/src/debug/bind/9.20.20/lib/isc -> /usr/src/debug/bind/9.20.21/lib/isc, directory renamed /usr/src/debug/bind/9.20.20/lib/ns/include/ns -> /usr/src/debug/bind/9.20.21/lib/ns/include/ns, directory renamed /usr/src/debug/bind/9.20.20/lib/isc/inclu
 de/isc -> /usr/src/debug/bind/9.20.21/lib/isc/include/isc, directory renamed /usr/src/debug/bind/9.20.20/bin/delv -> /usr/src/debug/bind/9.20.21/bin/delv, directory renamed /usr/src/debug/bind/9.20.20/bin/dig -> /usr/src/debug/bind/9.20.21/bin/dig, directory renamed /usr/src/debug/bind/9.20.20/bin/confgen -> /usr/src/debug/bind/9.20.21/bin/confgen, directory renamed /usr/src/debug/bind/9.20.20/lib/isc/netmgr -> /usr/src/debug/bind/9.20.21/lib/isc/netmgr, directory renamed /usr/src/debug/bind/9.20.20/lib/isccfg/include/isccfg -> /usr/src/debug/bind/9.20.21/lib/isccfg/include/isccfg, directory renamed /usr/src/debug/bind/9.20.20/lib/dns/include/dns -> /usr/src/debug/bind/9.20.21/lib/dns/include/dns, directory renamed /usr/src/debug/bind/9.20.20/lib/dns/rdata/any_255 -> /usr/src/debug/bind/9.20.21/lib/dns/rdata/any_255, directory renamed /usr/src/debug/bind/9.20.20/bin/named/include/dlz -> /usr/src/debug/bind/9.20.21/bin/named/include/dlz, directory renamed /usr/src/debug/bind/9.20.20/
 bin/nsupdate -> /usr/src/debug/bind/9.20.21/bin/nsupdate, directory renamed /usr/src/debug/bind/9.20.20/bin/tools -> /usr/src/debug/bind/9.20.21/bin/tools, directory renamed /usr/src/debug/bind/9.20.20/lib/dns/include/dst -> /usr/src/debug/bind/9.20.21/lib/dns/include/dst, directory renamed /usr/src/debug/bind/9.20.20/bin/dnssec -> /usr/src/debug/bind/9.20.21/bin/dnssec, directory renamed /usr/src/debug/bind/9.20.20/lib/dns/include/irs -> /usr/src/debug/bind/9.20.21/lib/dns/include/irs, directory renamed /usr/src/debug/bind/9.20.20/lib/dns/rdata/hs_4 -> /usr/src/debug/bind/9.20.21/lib/dns/rdata/hs_4, directory renamed /usr/src/debug/bind/9.20.20/bin/named/include/named -> /usr/src/debug/bind/9.20.21/bin/named/include/named, directory renamed /usr/src/debug/bind/9.20.20/bin/named -> /usr/src/debug/bind/9.20.21/bin/named, directory renamed /usr/src/debug/bind/9.20.20/lib/dns -> /usr/src/debug/bind/9.20.21/lib/dns, directory renamed /usr/src/debug/bind/9.20.20/lib/dns/rdata/ch_3 -> /us
 r/src/debug/bind/9.20.21/lib/dns/rdata/ch_3, directory renamed /usr/src/debug/bind/9.20.20/bin/plugins -> /usr/src/debug/bind/9.20.21/bin/plugins, directory renamed /usr/src/debug/bind/9.20.20/bin/check -> /usr/src/debug/bind/9.20.21/bin/check, directory renamed /usr/src/debug/bind/9.20.20/lib/dns/rdata/in_1 -> /usr/src/debug/bind/9.20.21/lib/dns/rdata/in_1, directory renamed /usr/src/debug/bind/9.20.20/lib/ns -> /usr/src/debug/bind/9.20.21/lib/ns
packages/x86-64-v3-poky-linux/bind/bind-staticdev: PKGV changed from 9.20.20 [default] to 9.20.21 [default]
packages/x86-64-v3-poky-linux/bind/bind-staticdev: PV changed from "9.20.20" to "9.20.21"
packages/x86-64-v3-poky-linux/bind/bind-utils: PKGV changed from 9.20.20 [default] to 9.20.21 [default]
packages/x86-64-v3-poky-linux/bind/bind-utils: PV changed from "9.20.20" to "9.20.21"
packages/x86-64-v3-poky-linux/bind/bind: PKGV changed from 9.20.20 [default] to 9.20.21 [default]
packages/x86-64-v3-poky-linux/bind/bind: PV changed from "9.20.20" to "9.20.21"
packages/x86-64-v3-poky-linux/bind: PKGV changed from 9.20.20 [default] to 9.20.21 [default]
packages/x86-64-v3-poky-linux/bind: PV changed from "9.20.20" to "9.20.21"
packages/x86-64-v3-poky-linux/bind: SRC_URI changed from "https://ftp.isc.org/isc/bind9/9.20.20/bind-9.20.20.tar.xz file://conf.patch file://named.service file://bind9 file://generate-rndc-key.sh file://make-etc-initd-bind-stop-work.patch file://init.d-add-support-for-read-only-rootfs.patch file://bind-ensure-searching-for-json-headers-searches-sysr.patch file://0001-named-lwresd-V-and-start-log-hide-build-options.patch file://0001-avoid-start-failure-with-bind-user.patch" to "https://ftp.isc.org/isc/bind9/9.20.21/bind-9.20.21.tar.xz file://conf.patch file://named.service file://bind9 file://generate-rndc-key.sh file://make-etc-initd-bind-stop-work.patch file://init.d-add-support-for-read-only-rootfs.patch file://bind-ensure-searching-for-json-headers-searches-sysr.patch file://0001-named-lwresd-V-and-start-log-hide-build-options.patch file://0001-avoid-start-failure-with-bind-user.patch"
Changes to packages/x86-64-v3-poky-linux/bind (sysroot):
  /usr/lib/libdns.so changed symlink target from libdns-9.20.20.so to libdns-9.20.21.so
  /usr/lib/libisccc.so changed symlink target from libisccc-9.20.20.so to libisccc-9.20.21.so
  /usr/lib/libisccfg.so changed symlink target from libisccfg-9.20.20.so to libisccfg-9.20.21.so
  /usr/lib/libisc.so changed symlink target from libisc-9.20.20.so to libisc-9.20.21.so
  /usr/lib/libns.so changed symlink target from libns-9.20.20.so to libns-9.20.21.so
  /usr/lib/libdns-9.20.20.so moved to /usr/lib/libdns-9.20.21.so
  /usr/lib/libisc-9.20.20.so moved to /usr/lib/libisc-9.20.21.so
  /usr/lib/libisccc-9.20.20.so moved to /usr/lib/libisccc-9.20.21.so
  /usr/lib/libisccfg-9.20.20.so moved to /usr/lib/libisccfg-9.20.21.so
  /usr/lib/libns-9.20.20.so moved to /usr/lib/libns-9.20.21.so

--===============7440594388936854728==--

