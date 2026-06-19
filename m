Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DD34CD98E6
	for <webhook@archiver.kernel.org>; Fri, 19 Jun 2026 06:18:41 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36828.1781849908347305541
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2026 23:18:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=uFEGaVWN;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Epdu5OhW;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019ede87ef1b-548c9476-d657-4be7-b52d-175d68a4c6bb-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781849911;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=VdNPoReF+jqYaauxUmr2n19U7X6KSl+Y5HYXRUp/Bh0=;
	b=uFEGaVWNEHIMqlT6k2LELHIinPI9BgsvpHxfWOqvl4y0ByzFCxpalxeyNP/fqo+o
	6xDDjvURP9B148VCwm2u/anNQwzZooy29Dmgo3ImIDXml6lqstjHoblRIQpJc37Cjm4
	unpx+ai1YIdyUo0stnq0sA845KWPRm85I3jTp8DU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781849911;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=VdNPoReF+jqYaauxUmr2n19U7X6KSl+Y5HYXRUp/Bh0=;
	b=Epdu5OhWXxdtNckWrl/IyBGHRmAWAoFPmyvelShZPYKN2fytlfMypcMLX7FIQFtm
	XaiqeT4t4neNaA7gJm6Ijk4jcYM1iQBZhLXN9n/BAN6wp6bin8prMSBbGB/G0vNcuzl
	VYIW+/Sop2BK9e2TgemMthmGh2YMuRHMGo+5Kt6w=
Content-Type: multipart/mixed; boundary="===============5796719234065443558=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] appstream: upgrading to 1.1.3 FAILED
Message-ID: <0101019ede87ef1b-548c9476-d657-4be7-b52d-175d68a4c6bb-000000@us-west-2.amazonses.com>
Date: Fri, 19 Jun 2026 06:18:31 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.19-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 06:18:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239128

--===============5796719234065443558==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *appstream* to *1.1.3* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-appstream-upgrade-1.1.2-1.1.3.patch
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
From 5ecb51985e6cdb7314d3f80b86a5c4d79f1d0900 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 19 Jun 2026 06:18:21 +0000
Subject: [PATCH] appstream: upgrade 1.1.2 -> 1.1.3

---
 .../appstream/appstream/0001-remove-hardcoded-path.patch     | 4 ++--
 .../appstream/appstream/0002-Do-not-build-qt-tests.patch     | 5 +----
 ...ix-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch | 2 +-
 .../appstream/{appstream_1.1.2.bb => appstream_1.1.3.bb}     | 2 +-
 4 files changed, 5 insertions(+), 8 deletions(-)
 rename meta/recipes-support/appstream/{appstream_1.1.2.bb => appstream_1.1.3.bb} (95%)

diff --git a/meta/recipes-support/appstream/appstream/0001-remove-hardcoded-path.patch b/meta/recipes-support/appstream/appstream/0001-remove-hardcoded-path.patch
index 5f4ec29628..56a5479099 100644
--- a/meta/recipes-support/appstream/appstream/0001-remove-hardcoded-path.patch
+++ b/meta/recipes-support/appstream/appstream/0001-remove-hardcoded-path.patch
@@ -1,4 +1,4 @@
-From e713f4d6ce2ee198eabcc31bc734e84cdb20ea32 Mon Sep 17 00:00:00 2001
+From bf79c20cfee4a074ca752a1466dc96d0b9eb6175 Mon Sep 17 00:00:00 2001
 From: Markus Volk <f_l_k@t-online.de>
 Date: Mon, 12 Dec 2022 15:42:42 +0100
 Subject: [PATCH] remove hardcoded path
@@ -14,7 +14,7 @@ Upstream-Status: Inappropriate [oe-specific]
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/meson.build b/meson.build
-index ee5b179..8a06e75 100644
+index 9af5f58..ad1483d 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -194,10 +194,10 @@ endif
diff --git a/meta/recipes-support/appstream/appstream/0002-Do-not-build-qt-tests.patch b/meta/recipes-support/appstream/appstream/0002-Do-not-build-qt-tests.patch
index f6bbdd180a..3e666181eb 100644
--- a/meta/recipes-support/appstream/appstream/0002-Do-not-build-qt-tests.patch
+++ b/meta/recipes-support/appstream/appstream/0002-Do-not-build-qt-tests.patch
@@ -1,4 +1,4 @@
-From 5763a61ca9aff2e2383c1eeb1ef3f5e6cd07c539 Mon Sep 17 00:00:00 2001
+From 1a1619dce3c3fa54fa5f47f7ed89447e0805de43 Mon Sep 17 00:00:00 2001
 From: Marc Ferland <marc.ferland@sonatest.com>
 Date: Fri, 26 Jul 2024 15:41:00 -0400
 Subject: [PATCH] Do not build qt/tests
@@ -32,6 +32,3 @@ index 407a57a..840c838 100644
  )
 -
 -subdir('tests/')
--- 
-2.34.1
-
diff --git a/meta/recipes-support/appstream/appstream/0003-Fix-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch b/meta/recipes-support/appstream/appstream/0003-Fix-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch
index d1994e3c4c..8ba4de95c9 100644
--- a/meta/recipes-support/appstream/appstream/0003-Fix-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch
+++ b/meta/recipes-support/appstream/appstream/0003-Fix-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch
@@ -1,4 +1,4 @@
-From f19365d8b90cde7d2a385f8c85b74a2565ff25fa Mon Sep 17 00:00:00 2001
+From 4fdd29346b51eea577ee46c7166348dad19bbcb0 Mon Sep 17 00:00:00 2001
 From: Marc Ferland <marc.ferland@sonatest.com>
 Date: Mon, 29 Jul 2024 09:35:51 -0400
 Subject: [PATCH] Fix PACKAGE_PREFIX_DIR in qt/cmake/AppStreamQtConfig.cmake.in
diff --git a/meta/recipes-support/appstream/appstream_1.1.2.bb b/meta/recipes-support/appstream/appstream_1.1.3.bb
similarity index 95%
rename from meta/recipes-support/appstream/appstream_1.1.2.bb
rename to meta/recipes-support/appstream/appstream_1.1.3.bb
index c6ec0fff0a..53eee13e84 100644
--- a/meta/recipes-support/appstream/appstream_1.1.2.bb
+++ b/meta/recipes-support/appstream/appstream_1.1.3.bb
@@ -30,7 +30,7 @@ SRC_URI = " \
 	file://0002-Do-not-build-qt-tests.patch \
 	file://0003-Fix-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch \
 "
-SRC_URI[sha256sum] = "46b4257100e25a6468ceed7b3ab82441f47b119da3398d30aea6d7b91174b586"
+SRC_URI[sha256sum] = "2624f967068427edc94f3979edae3571bb077063f5bc231f737776da527bf467"
 
 S = "${UNPACKDIR}/AppStream-${PV}"
 
-- 
2.47.1


--===============5796719234065443558==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-appstream-upgrade-1.1.2-1.1.3.patch"

RnJvbSA1ZWNiNTE5ODVlNmNkYjczMTRkM2Y4MGI4NmE1YzRkNzlmMWQwOTAwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTkgSnVuIDIwMjYgMDY6MTg6MjEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBh
cHBzdHJlYW06IHVwZ3JhZGUgMS4xLjIgLT4gMS4xLjMKCi0tLQogLi4uL2FwcHN0cmVhbS9hcHBz
dHJlYW0vMDAwMS1yZW1vdmUtaGFyZGNvZGVkLXBhdGgucGF0Y2ggICAgIHwgNCArKy0tCiAuLi4v
YXBwc3RyZWFtL2FwcHN0cmVhbS8wMDAyLURvLW5vdC1idWlsZC1xdC10ZXN0cy5wYXRjaCAgICAg
fCA1ICstLS0tCiAuLi5peC1QQUNLQUdFX1BSRUZJWF9ESVItaW4tcXQtY21ha2UtQXBwU3RyZWFt
UXRDb25maWcucGF0Y2ggfCAyICstCiAuLi4vYXBwc3RyZWFtL3thcHBzdHJlYW1fMS4xLjIuYmIg
PT4gYXBwc3RyZWFtXzEuMS4zLmJifSAgICAgfCAyICstCiA0IGZpbGVzIGNoYW5nZWQsIDUgaW5z
ZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtc3VwcG9ydC9h
cHBzdHJlYW0ve2FwcHN0cmVhbV8xLjEuMi5iYiA9PiBhcHBzdHJlYW1fMS4xLjMuYmJ9ICg5NSUp
CgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvYXBwc3RyZWFtL2FwcHN0cmVhbS8w
MDAxLXJlbW92ZS1oYXJkY29kZWQtcGF0aC5wYXRjaCBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2Fw
cHN0cmVhbS9hcHBzdHJlYW0vMDAwMS1yZW1vdmUtaGFyZGNvZGVkLXBhdGgucGF0Y2gKaW5kZXgg
NWY0ZWMyOTYyOC4uNTZhNTQ3OTA5OSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQv
YXBwc3RyZWFtL2FwcHN0cmVhbS8wMDAxLXJlbW92ZS1oYXJkY29kZWQtcGF0aC5wYXRjaAorKysg
Yi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9hcHBzdHJlYW0vYXBwc3RyZWFtLzAwMDEtcmVtb3ZlLWhh
cmRjb2RlZC1wYXRoLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBlNzEzZjRkNmNlMmVlMTk4
ZWFiY2MzMWJjNzM0ZTg0Y2RiMjBlYTMyIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBi
Zjc5YzIwY2ZlZTRhMDc0Y2E3NTJhMTQ2NmRjOTZkMGI5ZWI2MTc1IE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQogRnJvbTogTWFya3VzIFZvbGsgPGZfbF9rQHQtb25saW5lLmRlPgogRGF0ZTogTW9u
LCAxMiBEZWMgMjAyMiAxNTo0Mjo0MiArMDEwMAogU3ViamVjdDogW1BBVENIXSByZW1vdmUgaGFy
ZGNvZGVkIHBhdGgKQEAgLTE0LDcgKzE0LDcgQEAgVXBzdHJlYW0tU3RhdHVzOiBJbmFwcHJvcHJp
YXRlIFtvZS1zcGVjaWZpY10KICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvbWVzb24uYnVpbGQgYi9tZXNvbi5idWlsZAotaW5k
ZXggZWU1YjE3OS4uOGEwNmU3NSAxMDA2NDQKK2luZGV4IDlhZjVmNTguLmFkMTQ4M2QgMTAwNjQ0
CiAtLS0gYS9tZXNvbi5idWlsZAogKysrIGIvbWVzb24uYnVpbGQKIEBAIC0xOTQsMTAgKzE5NCwx
MCBAQCBlbmRpZgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvYXBwc3RyZWFtL2Fw
cHN0cmVhbS8wMDAyLURvLW5vdC1idWlsZC1xdC10ZXN0cy5wYXRjaCBiL21ldGEvcmVjaXBlcy1z
dXBwb3J0L2FwcHN0cmVhbS9hcHBzdHJlYW0vMDAwMi1Eby1ub3QtYnVpbGQtcXQtdGVzdHMucGF0
Y2gKaW5kZXggZjZiYmRkMTgwYS4uM2U2NjYxODFlYiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LXN1cHBvcnQvYXBwc3RyZWFtL2FwcHN0cmVhbS8wMDAyLURvLW5vdC1idWlsZC1xdC10ZXN0cy5w
YXRjaAorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9hcHBzdHJlYW0vYXBwc3RyZWFtLzAwMDIt
RG8tbm90LWJ1aWxkLXF0LXRlc3RzLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA1NzYzYTYx
Y2E5YWZmMmUyMzgzYzFlZWIxZWYzZjVlNmNkMDdjNTM5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQorRnJvbSAxYTE2MTlkY2UzYzNmYTU0ZmE1ZjQ3ZjdlZDg5NDQ3ZTA4MDVkZTQzIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQogRnJvbTogTWFyYyBGZXJsYW5kIDxtYXJjLmZlcmxhbmRAc29uYXRl
c3QuY29tPgogRGF0ZTogRnJpLCAyNiBKdWwgMjAyNCAxNTo0MTowMCAtMDQwMAogU3ViamVjdDog
W1BBVENIXSBEbyBub3QgYnVpbGQgcXQvdGVzdHMKQEAgLTMyLDYgKzMyLDMgQEAgaW5kZXggNDA3
YTU3YS4uODQwYzgzOCAxMDA2NDQKICApCiAtCiAtc3ViZGlyKCd0ZXN0cy8nKQotLS0gCi0yLjM0
LjEKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvYXBwc3RyZWFtL2FwcHN0cmVh
bS8wMDAzLUZpeC1QQUNLQUdFX1BSRUZJWF9ESVItaW4tcXQtY21ha2UtQXBwU3RyZWFtUXRDb25m
aWcucGF0Y2ggYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9hcHBzdHJlYW0vYXBwc3RyZWFtLzAwMDMt
Rml4LVBBQ0tBR0VfUFJFRklYX0RJUi1pbi1xdC1jbWFrZS1BcHBTdHJlYW1RdENvbmZpZy5wYXRj
aAppbmRleCBkMTk5NGUzYzRjLi44YmE0ZGU5NWM5IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
c3VwcG9ydC9hcHBzdHJlYW0vYXBwc3RyZWFtLzAwMDMtRml4LVBBQ0tBR0VfUFJFRklYX0RJUi1p
bi1xdC1jbWFrZS1BcHBTdHJlYW1RdENvbmZpZy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtc3Vw
cG9ydC9hcHBzdHJlYW0vYXBwc3RyZWFtLzAwMDMtRml4LVBBQ0tBR0VfUFJFRklYX0RJUi1pbi1x
dC1jbWFrZS1BcHBTdHJlYW1RdENvbmZpZy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZjE5
MzY1ZDhiOTBjZGU3ZDJhMzg1ZjhjODViNzRhMjU2NWZmMjVmYSBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKK0Zyb20gNGZkZDI5MzQ2YjUxZWVhNTc3ZWU0NmM3MTY2MzQ4ZGFkMTliYmNiMCBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IE1hcmMgRmVybGFuZCA8bWFyYy5mZXJsYW5kQHNv
bmF0ZXN0LmNvbT4KIERhdGU6IE1vbiwgMjkgSnVsIDIwMjQgMDk6MzU6NTEgLTA0MDAKIFN1Ympl
Y3Q6IFtQQVRDSF0gRml4IFBBQ0tBR0VfUFJFRklYX0RJUiBpbiBxdC9jbWFrZS9BcHBTdHJlYW1R
dENvbmZpZy5jbWFrZS5pbgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvYXBwc3Ry
ZWFtL2FwcHN0cmVhbV8xLjEuMi5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2FwcHN0cmVhbS9h
cHBzdHJlYW1fMS4xLjMuYmIKc2ltaWxhcml0eSBpbmRleCA5NSUKcmVuYW1lIGZyb20gbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvYXBwc3RyZWFtL2FwcHN0cmVhbV8xLjEuMi5iYgpyZW5hbWUgdG8gbWV0
YS9yZWNpcGVzLXN1cHBvcnQvYXBwc3RyZWFtL2FwcHN0cmVhbV8xLjEuMy5iYgppbmRleCBjNmVj
MGZmZjBhLi41M2VlZTEzZTg0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9hcHBz
dHJlYW0vYXBwc3RyZWFtXzEuMS4yLmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2FwcHN0
cmVhbS9hcHBzdHJlYW1fMS4xLjMuYmIKQEAgLTMwLDcgKzMwLDcgQEAgU1JDX1VSSSA9ICIgXAog
CWZpbGU6Ly8wMDAyLURvLW5vdC1idWlsZC1xdC10ZXN0cy5wYXRjaCBcCiAJZmlsZTovLzAwMDMt
Rml4LVBBQ0tBR0VfUFJFRklYX0RJUi1pbi1xdC1jbWFrZS1BcHBTdHJlYW1RdENvbmZpZy5wYXRj
aCBcCiAiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNDZiNDI1NzEwMGUyNWE2NDY4Y2VlZDdiM2Fi
ODI0NDFmNDdiMTE5ZGEzMzk4ZDMwYWVhNmQ3YjkxMTc0YjU4NiIKK1NSQ19VUklbc2hhMjU2c3Vt
XSA9ICIyNjI0Zjk2NzA2ODQyN2VkYzk0ZjM5NzllZGFlMzU3MWJiMDc3MDYzZjViYzIzMWY3Mzc3
NzZkYTUyN2JmNDY3IgogCiBTID0gIiR7VU5QQUNLRElSfS9BcHBTdHJlYW0tJHtQVn0iCiAKLS0g
CjIuNDcuMQoK

--===============5796719234065443558==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1978 targets, 40 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-7f7623a221b1e0ba4bbc216e837413ec9b69573b"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:7f7623a221b1e0ba4bbc216e837413ec9b69573b"
meta-yocto-bsp       
meta-poky            = "master:366fa2f21bfb0d9c4de492e0204a0dd38ce241ab"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 446 Local 427 Mirrors 0 Missed 19 Current 497 (95% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 894 of 943 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.27.bb:do_create_spdx_setscene)
NOTE: Running setscene task 896 of 943 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.6.bb:do_create_spdx_setscene)
NOTE: Running task 1113 of 2250 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.1.3.bb:do_recipe_qa)
NOTE: Running task 1118 of 2250 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.1.3.bb:do_recipe_qa)
NOTE: Running task 1148 of 2250 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.1.3.bb:do_write_config)
NOTE: Running task 1149 of 2250 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.1.3.bb:do_write_config)
NOTE: recipe libfyaml-native-0.9.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxmlb-native-0.3.27-r0: task do_create_spdx_setscene: Started
NOTE: recipe libfyaml-native-0.9.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 919 of 943 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.6.bb:do_create_recipe_spdx_setscene)
NOTE: recipe appstream-1.1.3-r0: task do_recipe_qa: Started
NOTE: recipe libxmlb-native-0.3.27-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 924 of 943 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 927 of 943 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.27.bb:do_create_recipe_spdx_setscene)
NOTE: recipe appstream-1.1.3-r0: task do_write_config: Started
NOTE: recipe appstream-native-1.1.3-r0: task do_recipe_qa: Started
NOTE: recipe appstream-native-1.1.3-r0: task do_write_config: Started
NOTE: recipe appstream-1.1.3-r0: task do_write_config: Succeeded
NOTE: recipe appstream-native-1.1.3-r0: task do_write_config: Succeeded
NOTE: recipe libfyaml-native-0.9.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxmlb-native-0.3.27-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe glib-2.0-native-1_2.88.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libfyaml-native-0.9.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libxmlb-native-0.3.27-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe glib-2.0-native-1_2.88.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 938 of 943 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe appstream-native-1.1.3-r0: task do_recipe_qa: Succeeded
NOTE: recipe appstream-1.1.3-r0: task do_recipe_qa: Succeeded
NOTE: recipe glib-2.0-native-1_2.88.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe glib-2.0-native-1_2.88.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1944 of 2250 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.1.3.bb:do_fetch)
NOTE: Running task 1959 of 2250 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.1.3.bb:do_fetch)
NOTE: Running task 2175 of 2250 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.1.3.bb:do_create_recipe_spdx)
NOTE: recipe appstream-1.1.3-r0: task do_fetch: Started
NOTE: recipe appstream-1.1.3-r0: task do_fetch: Succeeded
NOTE: recipe appstream-native-1.1.3-r0: task do_fetch: Started
NOTE: Running task 2223 of 2250 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.1.3.bb:do_unpack)
NOTE: recipe appstream-native-1.1.3-r0: task do_fetch: Succeeded
NOTE: Running task 2224 of 2250 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.1.3.bb:do_unpack)
NOTE: Running task 2225 of 2250 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe appstream-native-1.1.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe appstream-1.1.3-r0: task do_unpack: Started
NOTE: recipe appstream-native-1.1.3-r0: task do_unpack: Started
NOTE: recipe appstream-native-1.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe appstream-1.1.3-r0: task do_unpack: Succeeded
NOTE: Running task 2226 of 2250 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.1.3.bb:do_patch)
NOTE: recipe appstream-native-1.1.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe appstream-1.1.3-r0: task do_patch: Started
NOTE: Running task 2227 of 2250 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.1.3.bb:do_create_recipe_spdx)
NOTE: recipe appstream-native-1.1.3-r0: task do_unpack: Succeeded
NOTE: Running task 2228 of 2250 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.1.3.bb:do_patch)
NOTE: recipe appstream-1.1.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe appstream-native-1.1.3-r0: task do_patch: Started
NOTE: recipe appstream-native-1.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe appstream-1.1.3-r0: task do_patch: Succeeded
NOTE: Running task 2229 of 2250 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.1.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2230 of 2250 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.1.3.bb:do_populate_lic)
NOTE: recipe appstream-1.1.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe appstream-1.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe appstream-1.1.3-r0: task do_populate_lic: Started
NOTE: recipe appstream-native-1.1.3-r0: task do_patch: Succeeded
NOTE: Running task 2231 of 2250 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.1.3.bb:do_deploy_source_date_epoch)
NOTE: recipe appstream-1.1.3-r0: task do_populate_lic: Succeeded
NOTE: recipe appstream-1.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe appstream-native-1.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe appstream-native-1.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2232 of 2250 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.1.3.bb:do_configure)
NOTE: recipe appstream-native-1.1.3-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/gettext/gettext-minimal-native_1.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/quilt/quilt-native_0.69.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.1.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembe
 dded-core/meta/recipes-devtools/meson/meson_1.11.1.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pkgconf/pkgconf_2.5.1.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.20.0.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.6.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.19.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gperf/gperf_3.3.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-
 worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.27.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.20.0.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/itstool/itstool_2.0.7.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.6.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libxslt/libxslt_1.1.45.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['gettext-minimal-native', 'cmake-native', 'libtool-native', 'm4-native', 'quilt-native', 'texinfo-dummy-native', 'openssl-native', 'expat-native', 'gettext-native', 'glib-2.0-native', 'libxml2-native', 'ncurses-native', 'util-linux-libuuid-native', 'zlib-native', 'docbook-xml-dtd4-native', 'docbook-xsl-stylesheets-native', 'flex-native', 'gnu-config-native', 'libedit-native', 'make-native', 'meson-native', 'ninja-native', 'perl-native', 'pkgconf-native', 'python3-build-native', 'python3-calver-native', 'python3-editables-native', 'python3-flit-core-native', 'python3-hatchling-native', 'python3-installer-native', 'python3-lxml-native', 'python3-packaging-native', 'python3-pathspec-native', 'python3-pluggy-native', 'python3-pygments-native', 'python3-pyproject-hooks-native', 'python3-setuptools-scm-native', 'python3-setuptools-native', 'python3-trove-classifiers-native', 'python3-typing-extensions-native', 'python3-vcs-versioning-native',
  'python3-wheel-native', 'python3-native', 'vala-native', 'bzip2-native', 'gperf-native', 'unzip-native', 'xz-native', 'zstd-native', 'gobject-introspection-native', 'libxmlb-native', 'curl-native', 'gdbm-native', 'itstool-native', 'libffi-native', 'libfyaml-native', 'libpcre2-native', 'libxslt-native', 're2c-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Dapidocs=false -Dgir=false -Dvapi=false -Dbash-completion=false -Dqt=false -Dstemming=false -Dsystemd=false...
| The Meson build system
| Version: 1.11.1
| Source dir: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/appstream-native/1.1.3/sources/AppStream-1.1.3
| Build dir: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/appstream-native/1.1.3/build
| Build type: native build
| Project name: AppStream
| Project version: 1.1.3
| C compiler for the host machine: gcc (gcc 14.2.0 "gcc (GCC) 14.2.0")
| C linker for the host machine: gcc ld.bfd 2.43.1.20241111
| Host machine cpu family: x86_64
| Host machine cpu: x86_64
| Compiler for C supports arguments -Werror=shadow: YES
| Compiler for C supports arguments -Werror=empty-body: YES
| Compiler for C supports arguments -Werror=strict-prototypes: YES
| Compiler for C supports arguments -Werror=missing-prototypes: YES
| Compiler for C supports arguments -Werror=implicit-function-declaration: YES
| Compiler for C supports arguments -Werror=pointer-arith: YES
| Compiler for C supports arguments -Werror=missing-declarations: YES
| Compiler for C supports arguments -Werror=return-type: YES
| Compiler for C supports arguments -Werror=int-conversion: YES
| Compiler for C supports arguments -Werror=incompatible-pointer-types: YES
| Compiler for C supports arguments -Werror=misleading-indentation: YES
| Compiler for C supports arguments -Werror=missing-include-dirs: YES
| Compiler for C supports arguments -Werror=declaration-after-statement: YES
| Compiler for C supports arguments -Werror=format-security: NO
| Compiler for C supports arguments -Wno-missing-field-initializers: YES
| Compiler for C supports arguments -Wno-error=missing-field-initializers: YES
| Compiler for C supports arguments -Wno-unused-parameter: YES
| Compiler for C supports arguments -Wno-error=unused-parameter: YES
| Found pkg-config: YES (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/appstream-native/1.1.3/recipe-sysroot-native/usr/bin/pkg-config-native) 2.5.1
| Run-time dependency glib-2.0 found: YES 2.88.1
| Run-time dependency gobject-2.0 found: YES 2.88.1
| Run-time dependency gio-2.0 found: YES 2.88.1
| Run-time dependency libcurl found: YES 8.20.0
| Run-time dependency libxml-2.0 found: YES 2.15.3
| Run-time dependency libfyaml found: YES 0.9.6
| Run-time dependency xmlb found: YES 0.3.27
| Run-time dependency libzstd found: YES 1.5.7
| Program gperf found: YES (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/appstream-native/1.1.3/recipe-sysroot-native/usr/bin/gperf)
| Configuring config.h using configuration
| Configuring as-version.h using configuration
| Dependency glib-2.0 for build machine found: YES 2.88.1 (cached)
| Program glib-mkenums found: YES (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/appstream-native/1.1.3/recipe-sysroot-native/usr/bin/glib-mkenums)
| Dependency glib-2.0 for build machine found: YES 2.88.1 (cached)
| Program glib-mkenums found: YES (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/appstream-native/1.1.3/recipe-sysroot-native/usr/bin/glib-mkenums)
| Dependency gio-2.0 for build machine found: YES 2.88.1 (cached)
| Program glib-compile-resources found: YES (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/appstream-native/1.1.3/recipe-sysroot-native/usr/bin/glib-compile-resources)
| Found pkg-config: YES (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/appstream-native/1.1.3/recipe-sysroot-native/usr/bin/pkg-config-native) 2.5.1
| Program sed found: YES (/srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/sed)
| Program msgfmt found: YES (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/appstream-native/1.1.3/recipe-sysroot-native/usr/bin/msgfmt)
| Program msginit found: YES (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/appstream-native/1.1.3/recipe-sysroot-native/usr/bin/msginit)
| Program msgmerge found: YES (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/appstream-native/1.1.3/recipe-sysroot-native/usr/bin/msgmerge)
| Program xgettext found: YES (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/appstream-native/1.1.3/recipe-sysroot-native/usr/bin/xgettext)
| Program itstool found: YES (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/appstream-native/1.1.3/recipe-sysroot-native/usr/bin/itstool)
| Program xsltproc found: YES (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/appstream-native/1.1.3/recipe-sysroot-native/usr/bin/xsltproc)
| 
| ../sources/AppStream-1.1.3/docs/meson.build:16:8: ERROR: Problem encountered: Unable to find Docbook XSL stylesheets for man pages
| 
| A full log can be found at /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/appstream-native/1.1.3/build/meson-logs/meson-log.txt
| 
| Last 10 lines of meson-log.txt:
| --- stdout ---
| 
| --- stderr ---
| I/O error : failed to load "http://docbook.sourceforge.net/release/xsl-ns/current/manpages/docbook.xsl": Attempt to load network entity
| warning: failed to load external entity "http://docbook.sourceforge.net/release/xsl-ns/current/manpages/docbook.xsl"
| cannot parse http://docbook.sourceforge.net/release/xsl-ns/current/manpages/docbook.xsl
| 
| 
| 
| ../sources/AppStream-1.1.3/docs/meson.build:16:8: ERROR: Problem encountered: Unable to find Docbook XSL stylesheets for man pages
| 
| ERROR: meson setup failed
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/appstream-native/1.1.3/temp/run.do_configure.1809275:175 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/appstream-native/1.1.3/temp/run.do_configure.1809275, line 175
| 	#2: meson_do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/appstream-native/1.1.3/temp/run.do_configure.1809275, line 164
| 	#3: do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/appstream-native/1.1.3/temp/run.do_configure.1809275, line 151
| 	#4: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/appstream-native/1.1.3/temp/run.do_configure.1809275, line 188
NOTE: recipe appstream-native-1.1.3-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 2232 tasks of which 2215 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260619061806.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260619061806.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.1.3.bb:do_configure
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/appstream-native/1.1.3/temp/log.do_configure.1809275
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: appstream-native-1.1.3-r0 do_configure: meson setup failed
ERROR: appstream-native-1.1.3-r0 do_configure: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/appstream-native/1.1.3/temp/run.do_configure.1809275' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/appstream-native/1.1.3/temp/log.do_configure.1809275
ERROR: Task (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.1.3.bb:do_configure) failed with exit code '1'

--===============5796719234065443558==--

