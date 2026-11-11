Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3725.1794377113838369280
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Nov 2026 22:05:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=n6HM+JGg;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=yZCPCVxP;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101a1c935dde6-2c2c9162-d7f8-4b7b-97ae-36dd078bf524-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1794377113;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=zd6lQ/8FeVnUnVgil1OnzPKDM7Ew9yQCir7t2NILVvI=;
	b=n6HM+JGgcBC1GHC9BuWxCVuY1LkE5L5LBavJZ+uj/4DEzhJxkEW9BJRSsmCQPrvG
	KA3SeYPmJo4FPDhf5gqkN11B+R7AoLGLUc0mnejB7kwP3wpUx/vManeopWf5doEPED6
	VUyUE9TcUM8FvRPs8W9J14+0DRMZGjbuF04F5mzA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1794377113;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=zd6lQ/8FeVnUnVgil1OnzPKDM7Ew9yQCir7t2NILVvI=;
	b=yZCPCVxPnnfNTHQ6xV3Pbfc96JsFqxmJZlOd/egcSxHrkSyYbSm/s/TYUGn9PY3G
	BYcXODSA/1MFPjonJwc8hQyRZNZSdP+OZFPJUwLkrnXoeofQfMkVqq+sVOjeHiZoaqJ
	HR9xqdXKKVMKZzPRgwqQzWFveVEHLYUl9+/vVyAE=
Content-Type: multipart/mixed; boundary="===============5758142968756958865=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] appstream: upgrading to 1.2.3 SUCCEEDED
Message-ID: <010101a1c935dde6-2c2c9162-d7f8-4b7b-97ae-36dd078bf524-000000@us-west-2.amazonses.com>
Date: Wed, 11 Nov 2026 06:05:13 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.11-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 06:05:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249966

--===============5758142968756958865==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *appstream* to *1.2.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-appstream-upgrade-1.2.1-1.2.3.patch
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
From 3f64dec6ea4297e3b264b354fc9d96d651141e5a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 11 Nov 2026 06:02:53 +0000
Subject: [PATCH] appstream: upgrade 1.2.1 -> 1.2.3

Version 1.2.3
~~~~~~~~~~~~~
Released: 2026-11-10

Features:
Bugfixes:
Miscellaneous:

Contributors:
 Alexander Vanhee, LeeJiEun, Matthias Klumpp, Vladimir Romanov

Version 1.2.2
~~~~~~~~~~~~~
Released: 2026-10-28

Features:
Bugfixes:

Contributors:
 Eugenio Depalo, Florian Leander Singer, Matthias Klumpp, Vladimir Romanov
---
 .../appstream/appstream/0002-Do-not-build-qt-tests.patch    | 6 +++---
 ...x-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch | 4 ++--
 .../appstream/{appstream_1.2.1.bb => appstream_1.2.3.bb}    | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-support/appstream/{appstream_1.2.1.bb => appstream_1.2.3.bb} (95%)

diff --git a/meta/recipes-support/appstream/appstream/0002-Do-not-build-qt-tests.patch b/meta/recipes-support/appstream/appstream/0002-Do-not-build-qt-tests.patch
index 5f35a8bf23..b1993f58c2 100644
--- a/meta/recipes-support/appstream/appstream/0002-Do-not-build-qt-tests.patch
+++ b/meta/recipes-support/appstream/appstream/0002-Do-not-build-qt-tests.patch
@@ -1,4 +1,4 @@
-From 1110cb5c658de30c63642929c1128ab4f9b9b98e Mon Sep 17 00:00:00 2001
+From bdf11270cdd510f119a8be42cad3d417e9aa0072 Mon Sep 17 00:00:00 2001
 From: Marc Ferland <marc.ferland@sonatest.com>
 Date: Fri, 26 Jul 2024 15:41:00 -0400
 Subject: [PATCH] Do not build qt/tests
@@ -23,10 +23,10 @@ Signed-off-by: Marc Ferland <marc.ferland@sonatest.com>
  1 file changed, 2 deletions(-)
 
 diff --git a/qt/meson.build b/qt/meson.build
-index 488fe60b61c0..83c2715c5fe7 100644
+index 1837c97..131aaef 100644
 --- a/qt/meson.build
 +++ b/qt/meson.build
-@@ -144,5 +144,3 @@ install_data (
+@@ -148,5 +148,3 @@ install_data (
      join_paths(meson.current_build_dir(), 'AppStreamQtConfigVersion.cmake'),
      install_dir: join_paths(get_option('libdir'), 'cmake', 'AppStreamQt')
  )
diff --git a/meta/recipes-support/appstream/appstream/0003-Fix-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch b/meta/recipes-support/appstream/appstream/0003-Fix-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch
index 3774bfa7c6..06196f7639 100644
--- a/meta/recipes-support/appstream/appstream/0003-Fix-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch
+++ b/meta/recipes-support/appstream/appstream/0003-Fix-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch
@@ -1,4 +1,4 @@
-From b8d73820cdb685089c0f805c7ca8163b21a78acd Mon Sep 17 00:00:00 2001
+From 393214ea44d02eb83cb186c3864764206727bd39 Mon Sep 17 00:00:00 2001
 From: Marc Ferland <marc.ferland@sonatest.com>
 Date: Mon, 29 Jul 2024 09:35:51 -0400
 Subject: [PATCH] Fix PACKAGE_PREFIX_DIR in qt/cmake/AppStreamQtConfig.cmake.in
@@ -39,7 +39,7 @@ Signed-off-by: Marc Ferland <marc.ferland@sonatest.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/qt/cmake/AppStreamQtConfig.cmake.in b/qt/cmake/AppStreamQtConfig.cmake.in
-index 63df65f25676..5ab2d0ec7bd3 100644
+index 63df65f..5ab2d0e 100644
 --- a/qt/cmake/AppStreamQtConfig.cmake.in
 +++ b/qt/cmake/AppStreamQtConfig.cmake.in
 @@ -1,5 +1,5 @@
diff --git a/meta/recipes-support/appstream/appstream_1.2.1.bb b/meta/recipes-support/appstream/appstream_1.2.3.bb
similarity index 95%
rename from meta/recipes-support/appstream/appstream_1.2.1.bb
rename to meta/recipes-support/appstream/appstream_1.2.3.bb
index fcfc1aea6c..84e5791e65 100644
--- a/meta/recipes-support/appstream/appstream_1.2.1.bb
+++ b/meta/recipes-support/appstream/appstream_1.2.3.bb
@@ -22,7 +22,7 @@ SRC_URI = "https://www.freedesktop.org/software/appstream/releases/AppStream-${P
            file://0002-Do-not-build-qt-tests.patch \
            file://0003-Fix-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch \
            "
-SRC_URI[sha256sum] = "7df664fd3ad3b1640c6a0ff77fa84f9fabe264111bf1fe8f5df3444d6d4caaca"
+SRC_URI[sha256sum] = "8daa01a4d66c73f036aa92af9bf76abfe8408eaa76fcda6ca54fa8ef5b93ed17"
 
 S = "${UNPACKDIR}/AppStream-${PV}"
 
-- 
2.47.1


--===============5758142968756958865==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-appstream-upgrade-1.2.1-1.2.3.patch"

RnJvbSAzZjY0ZGVjNmVhNDI5N2UzYjI2NGIzNTRmYzlkOTZkNjUxMTQxZTVhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTEgTm92IDIwMjYgMDY6MDI6NTMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBh
cHBzdHJlYW06IHVwZ3JhZGUgMS4yLjEgLT4gMS4yLjMKClZlcnNpb24gMS4yLjMKfn5+fn5+fn5+
fn5+fgpSZWxlYXNlZDogMjAyNi0xMS0xMAoKRmVhdHVyZXM6CkJ1Z2ZpeGVzOgpNaXNjZWxsYW5l
b3VzOgoKQ29udHJpYnV0b3JzOgogQWxleGFuZGVyIFZhbmhlZSwgTGVlSmlFdW4sIE1hdHRoaWFz
IEtsdW1wcCwgVmxhZGltaXIgUm9tYW5vdgoKVmVyc2lvbiAxLjIuMgp+fn5+fn5+fn5+fn5+ClJl
bGVhc2VkOiAyMDI2LTEwLTI4CgpGZWF0dXJlczoKQnVnZml4ZXM6CgpDb250cmlidXRvcnM6CiBF
dWdlbmlvIERlcGFsbywgRmxvcmlhbiBMZWFuZGVyIFNpbmdlciwgTWF0dGhpYXMgS2x1bXBwLCBW
bGFkaW1pciBSb21hbm92Ci0tLQogLi4uL2FwcHN0cmVhbS9hcHBzdHJlYW0vMDAwMi1Eby1ub3Qt
YnVpbGQtcXQtdGVzdHMucGF0Y2ggICAgfCA2ICsrKy0tLQogLi4ueC1QQUNLQUdFX1BSRUZJWF9E
SVItaW4tcXQtY21ha2UtQXBwU3RyZWFtUXRDb25maWcucGF0Y2ggfCA0ICsrLS0KIC4uLi9hcHBz
dHJlYW0ve2FwcHN0cmVhbV8xLjIuMS5iYiA9PiBhcHBzdHJlYW1fMS4yLjMuYmJ9ICAgIHwgMiAr
LQogMyBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLXN1cHBvcnQvYXBwc3RyZWFtL3thcHBzdHJlYW1fMS4yLjEuYmIgPT4g
YXBwc3RyZWFtXzEuMi4zLmJifSAoOTUlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBw
b3J0L2FwcHN0cmVhbS9hcHBzdHJlYW0vMDAwMi1Eby1ub3QtYnVpbGQtcXQtdGVzdHMucGF0Y2gg
Yi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9hcHBzdHJlYW0vYXBwc3RyZWFtLzAwMDItRG8tbm90LWJ1
aWxkLXF0LXRlc3RzLnBhdGNoCmluZGV4IDVmMzVhOGJmMjMuLmIxOTkzZjU4YzIgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2FwcHN0cmVhbS9hcHBzdHJlYW0vMDAwMi1Eby1ub3Qt
YnVpbGQtcXQtdGVzdHMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvYXBwc3RyZWFt
L2FwcHN0cmVhbS8wMDAyLURvLW5vdC1idWlsZC1xdC10ZXN0cy5wYXRjaApAQCAtMSw0ICsxLDQg
QEAKLUZyb20gMTExMGNiNWM2NThkZTMwYzYzNjQyOTI5YzExMjhhYjRmOWI5Yjk4ZSBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYmRmMTEyNzBjZGQ1MTBmMTE5YThiZTQyY2FkM2Q0MTdl
OWFhMDA3MiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IE1hcmMgRmVybGFuZCA8bWFy
Yy5mZXJsYW5kQHNvbmF0ZXN0LmNvbT4KIERhdGU6IEZyaSwgMjYgSnVsIDIwMjQgMTU6NDE6MDAg
LTA0MDAKIFN1YmplY3Q6IFtQQVRDSF0gRG8gbm90IGJ1aWxkIHF0L3Rlc3RzCkBAIC0yMywxMCAr
MjMsMTAgQEAgU2lnbmVkLW9mZi1ieTogTWFyYyBGZXJsYW5kIDxtYXJjLmZlcmxhbmRAc29uYXRl
c3QuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEv
cXQvbWVzb24uYnVpbGQgYi9xdC9tZXNvbi5idWlsZAotaW5kZXggNDg4ZmU2MGI2MWMwLi44M2My
NzE1YzVmZTcgMTAwNjQ0CitpbmRleCAxODM3Yzk3Li4xMzFhYWVmIDEwMDY0NAogLS0tIGEvcXQv
bWVzb24uYnVpbGQKICsrKyBiL3F0L21lc29uLmJ1aWxkCi1AQCAtMTQ0LDUgKzE0NCwzIEBAIGlu
c3RhbGxfZGF0YSAoCitAQCAtMTQ4LDUgKzE0OCwzIEBAIGluc3RhbGxfZGF0YSAoCiAgICAgIGpv
aW5fcGF0aHMobWVzb24uY3VycmVudF9idWlsZF9kaXIoKSwgJ0FwcFN0cmVhbVF0Q29uZmlnVmVy
c2lvbi5jbWFrZScpLAogICAgICBpbnN0YWxsX2Rpcjogam9pbl9wYXRocyhnZXRfb3B0aW9uKCds
aWJkaXInKSwgJ2NtYWtlJywgJ0FwcFN0cmVhbVF0JykKICApCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9hcHBzdHJlYW0vYXBwc3RyZWFtLzAwMDMtRml4LVBBQ0tBR0VfUFJFRklY
X0RJUi1pbi1xdC1jbWFrZS1BcHBTdHJlYW1RdENvbmZpZy5wYXRjaCBiL21ldGEvcmVjaXBlcy1z
dXBwb3J0L2FwcHN0cmVhbS9hcHBzdHJlYW0vMDAwMy1GaXgtUEFDS0FHRV9QUkVGSVhfRElSLWlu
LXF0LWNtYWtlLUFwcFN0cmVhbVF0Q29uZmlnLnBhdGNoCmluZGV4IDM3NzRiZmE3YzYuLjA2MTk2
Zjc2MzkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2FwcHN0cmVhbS9hcHBzdHJl
YW0vMDAwMy1GaXgtUEFDS0FHRV9QUkVGSVhfRElSLWluLXF0LWNtYWtlLUFwcFN0cmVhbVF0Q29u
ZmlnLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2FwcHN0cmVhbS9hcHBzdHJlYW0v
MDAwMy1GaXgtUEFDS0FHRV9QUkVGSVhfRElSLWluLXF0LWNtYWtlLUFwcFN0cmVhbVF0Q29uZmln
LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBiOGQ3MzgyMGNkYjY4NTA4OWMwZjgwNWM3Y2E4
MTYzYjIxYTc4YWNkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAzOTMyMTRlYTQ0ZDAy
ZWI4M2NiMTg2YzM4NjQ3NjQyMDY3MjdiZDM5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJv
bTogTWFyYyBGZXJsYW5kIDxtYXJjLmZlcmxhbmRAc29uYXRlc3QuY29tPgogRGF0ZTogTW9uLCAy
OSBKdWwgMjAyNCAwOTozNTo1MSAtMDQwMAogU3ViamVjdDogW1BBVENIXSBGaXggUEFDS0FHRV9Q
UkVGSVhfRElSIGluIHF0L2NtYWtlL0FwcFN0cmVhbVF0Q29uZmlnLmNtYWtlLmluCkBAIC0zOSw3
ICszOSw3IEBAIFNpZ25lZC1vZmYtYnk6IE1hcmMgRmVybGFuZCA8bWFyYy5mZXJsYW5kQHNvbmF0
ZXN0LmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
IAogZGlmZiAtLWdpdCBhL3F0L2NtYWtlL0FwcFN0cmVhbVF0Q29uZmlnLmNtYWtlLmluIGIvcXQv
Y21ha2UvQXBwU3RyZWFtUXRDb25maWcuY21ha2UuaW4KLWluZGV4IDYzZGY2NWYyNTY3Ni4uNWFi
MmQwZWM3YmQzIDEwMDY0NAoraW5kZXggNjNkZjY1Zi4uNWFiMmQwZSAxMDA2NDQKIC0tLSBhL3F0
L2NtYWtlL0FwcFN0cmVhbVF0Q29uZmlnLmNtYWtlLmluCiArKysgYi9xdC9jbWFrZS9BcHBTdHJl
YW1RdENvbmZpZy5jbWFrZS5pbgogQEAgLTEsNSArMSw1IEBACmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9hcHBzdHJlYW0vYXBwc3RyZWFtXzEuMi4xLmJiIGIvbWV0YS9yZWNpcGVz
LXN1cHBvcnQvYXBwc3RyZWFtL2FwcHN0cmVhbV8xLjIuMy5iYgpzaW1pbGFyaXR5IGluZGV4IDk1
JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtc3VwcG9ydC9hcHBzdHJlYW0vYXBwc3RyZWFtXzEu
Mi4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc3VwcG9ydC9hcHBzdHJlYW0vYXBwc3RyZWFt
XzEuMi4zLmJiCmluZGV4IGZjZmMxYWVhNmMuLjg0ZTU3OTFlNjUgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1zdXBwb3J0L2FwcHN0cmVhbS9hcHBzdHJlYW1fMS4yLjEuYmIKKysrIGIvbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvYXBwc3RyZWFtL2FwcHN0cmVhbV8xLjIuMy5iYgpAQCAtMjIsNyArMjIs
NyBAQCBTUkNfVVJJID0gImh0dHBzOi8vd3d3LmZyZWVkZXNrdG9wLm9yZy9zb2Z0d2FyZS9hcHBz
dHJlYW0vcmVsZWFzZXMvQXBwU3RyZWFtLSR7UAogICAgICAgICAgICBmaWxlOi8vMDAwMi1Eby1u
b3QtYnVpbGQtcXQtdGVzdHMucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vMDAwMy1GaXgtUEFD
S0FHRV9QUkVGSVhfRElSLWluLXF0LWNtYWtlLUFwcFN0cmVhbVF0Q29uZmlnLnBhdGNoIFwKICAg
ICAgICAgICAgIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjdkZjY2NGZkM2FkM2IxNjQwYzZhMGZm
NzdmYTg0ZjlmYWJlMjY0MTExYmYxZmU4ZjVkZjM0NDRkNmQ0Y2FhY2EiCitTUkNfVVJJW3NoYTI1
NnN1bV0gPSAiOGRhYTAxYTRkNjZjNzNmMDM2YWE5MmFmOWJmNzZhYmZlODQwOGVhYTc2ZmNkYTZj
YTU0ZmE4ZWY1YjkzZWQxNyIKIAogUyA9ICIke1VOUEFDS0RJUn0vQXBwU3RyZWFtLSR7UFZ9Igog
Ci0tIAoyLjQ3LjEKCg==

--===============5758142968756958865==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="appstream-changelog.txt"

Version 1.2.3
~~~~~~~~~~~~~
Released: 2026-11-10

Features:
Bugfixes:
Miscellaneous:

Contributors:
 Alexander Vanhee, LeeJiEun, Matthias Klumpp, Vladimir Romanov

Version 1.2.2
~~~~~~~~~~~~~
Released: 2026-10-28

Features:
Bugfixes:

Contributors:
 Eugenio Depalo, Florian Leander Singer, Matthias Klumpp, Vladimir Romanov

--===============5758142968756958865==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/appstream/appstream-dev: FILELIST: added "/usr/include/appstream/as-locale.h"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-nb: PKGSIZE changed from 34644 to 123336 (+256%)
packages/x86-64-v3-poky-linux/appstream/appstream: FILELIST: removed "/usr/lib/libappstream.so.1.2.1", added "/usr/lib/libappstream.so.1.2.3"
packages/x86-64-v3-poky-linux/appstream: PACKAGES: added "appstream-locale-nn"
Changes to packages/x86-64-v3-poky-linux/appstream (sysroot):
  /usr/lib/libappstream.so.5 changed symlink target from libappstream.so.1.2.1 to libappstream.so.1.2.3
  /usr/lib/libappstream.so.1.2.1 moved to /usr/lib/libappstream.so.1.2.3
  /usr/include/appstream/as-locale.h was added
Changes to packages/x86_64-linux/appstream-native (sysroot):
  /usr/lib/libappstream.so.5 changed symlink target from libappstream.so.1.2.1 to libappstream.so.1.2.3
  /usr/lib/libappstream.so.1.2.1 moved to /usr/lib/libappstream.so.1.2.3
  /usr/include/appstream/as-locale.h was added

--===============5758142968756958865==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 960 .bb files complete (0 cached, 960 parsed). 2004 targets, 66 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.20.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.1.99+snapshot-3e2f0290990a3c1acefc090ef0db9627ce07424a"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
meta                 = "tmp-auh-upgrades:3e2f0290990a3c1acefc090ef0db9627ce07424a"
meta-yocto-bsp       
meta-poky            = "master:8becfabefdf5df564aafe2d07d10e4b05fbaedb1"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 428 Local 401 Mirrors 0 Missed 27 Current 270 (93% match, 96% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 285 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 286 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_package_qa_setscene)
NOTE: Running setscene task 297 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 298 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 350 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.2.3.bb:do_populate_lic_setscene)
NOTE: Running setscene task 404 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.23.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 412 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.26.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 414 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 434 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.19.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 436 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 438 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.29.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-completion-2.18.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_package_qa_setscene: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe appstream-1.2.3-r0: task do_populate_lic_setscene: Started
NOTE: recipe libfyaml-0.9.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe vala-0.56.19-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe curl-8.23.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-1.26.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxmlb-0.3.29-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.18.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe bash-completion-2.18.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-completion-2.18.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe vala-0.56.19-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 439 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 440 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.19.bb:do_recipe_qa_setscene)
NOTE: recipe appstream-1.2.3-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe wayland-1.26.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libfyaml-0.9.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 442 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.26.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 443 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 444 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.26.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 445 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.26.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 446 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.6.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.23.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxmlb-0.3.29-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 447 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.23.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 448 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.29.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 449 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.23.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 450 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.23.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 454 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 457 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 459 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 460 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_populate_sysroot_setscene)
NOTE: recipe vala-0.56.19-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libfyaml-0.9.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.26.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.15.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-1.26.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.26.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe curl-8.23.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.23.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxmlb-0.3.29-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.23.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running task 854 of 1711 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.29.bb:do_write_config)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.19-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 864 of 1711 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.19.bb:do_fetch)
NOTE: recipe libfyaml-0.9.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 866 of 1711 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.6.bb:do_fetch)
NOTE: recipe wayland-1.26.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libxmlb-0.3.29-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.15.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 873 of 1711 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.29.bb:do_fetch)
NOTE: Running setscene task 461 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_create_recipe_spdx_setscene)
NOTE: recipe curl-8.23.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running task 890 of 1711 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.2.3.bb:do_recipe_qa)
NOTE: recipe wayland-1.26.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 466 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 923 of 1711 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.2.3.bb:do_write_config)
NOTE: recipe libxmlb-0.3.29-r0: task do_write_config: Started
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe curl-8.23.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 469 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 470 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 472 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe wayland-1.26.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 475 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_populate_sysroot_setscene)
NOTE: recipe vala-0.56.19-r0: task do_fetch: Started
NOTE: recipe curl-8.23.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libfyaml-0.9.6-r0: task do_fetch: Started
NOTE: Running setscene task 483 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_create_spdx_setscene)
NOTE: recipe libxmlb-0.3.29-r0: task do_write_config: Succeeded
NOTE: recipe libxml2-2.15.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libfyaml-0.9.6-r0: task do_fetch: Succeeded
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxmlb-0.3.29-r0: task do_fetch: Started
NOTE: Running setscene task 484 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_packagedata_setscene)
NOTE: recipe appstream-1.2.3-r0: task do_recipe_qa: Started
NOTE: Running setscene task 486 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 492 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.23.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.15.4-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.19-r0: task do_fetch: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 496 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.26.0.bb:do_recipe_qa_setscene)
NOTE: recipe appstream-1.2.3-r0: task do_write_config: Started
NOTE: recipe libxml2-2.15.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe xz-5.8.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 927 of 1711 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.19.bb:do_unpack)
NOTE: recipe libxml2-2.15.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running task 928 of 1711 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.6.bb:do_unpack)
NOTE: recipe libpsl-0.23.3-r0: task do_packagedata_setscene: Started
NOTE: recipe appstream-1.2.3-r0: task do_write_config: Succeeded
NOTE: recipe libpsl-0.23.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe curl-8.23.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe wayland-1.26.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 502 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libxml2-2.15.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 508 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe xz-5.8.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 514 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 515 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 516 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: recipe vala-0.56.19-r0: task do_unpack: Started
NOTE: recipe appstream-1.2.3-r0: task do_recipe_qa: Succeeded
NOTE: recipe libfyaml-0.9.6-r0: task do_unpack: Started
NOTE: recipe curl-8.23.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 962 of 1711 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.2.3.bb:do_fetch)
NOTE: recipe libxml2-2.15.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.26.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 518 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_recipe_qa_setscene)
NOTE: recipe libpsl-0.23.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 520 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpsl-0.23.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 521 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 523 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxmlb-0.3.29-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libfyaml-0.9.6-r0: task do_unpack: Succeeded
NOTE: Running task 974 of 1711 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.29.bb:do_unpack)
NOTE: Running setscene task 525 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 526 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.49.bb:do_packagedata_setscene)
NOTE: Running setscene task 527 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 528 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_packagedata_setscene)
NOTE: recipe appstream-1.2.3-r0: task do_fetch: Started
NOTE: recipe libxml2-2.15.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe appstream-1.2.3-r0: task do_fetch: Succeeded
NOTE: Running setscene task 530 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe bash-completion-2.18.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 531 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 976 of 1711 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.6.bb:do_patch)
NOTE: Running task 977 of 1711 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.2.3.bb:do_unpack)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 532 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_create_spdx_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libpsl-0.23.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 533 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libxml2-2.15.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 534 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libxmlb-0.3.29-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.49-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.42.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpsl-0.23.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe util-linux-2.42.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe appstream-1.2.3-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libfyaml-0.9.6-r0: task do_patch: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 536 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 538 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 539 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 541 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.10.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libpcre2-10.49-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 544 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 545 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 548 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 549 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 550 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.49.bb:do_populate_sysroot_setscene)
NOTE: recipe libunistring-1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.42.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vala-0.56.19-r0: task do_unpack: Succeeded
NOTE: Running task 1000 of 1711 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.19.bb:do_patch)
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.14.10-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe appstream-1.2.3-r0: task do_unpack: Succeeded
NOTE: recipe libpcre2-10.49-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1006 of 1711 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.2.3.bb:do_patch)
NOTE: recipe libunistring-1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vala-0.56.19-r0: task do_patch: Started
NOTE: recipe python3-3.14.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libunistring-1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 559 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.5.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 561 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_recipe_spdx_setscene)
NOTE: recipe appstream-1.2.3-r0: task do_patch: Started
NOTE: recipe libfyaml-0.9.6-r0: task do_patch: Succeeded
NOTE: recipe vala-0.56.19-r0: task do_patch: Succeeded
NOTE: recipe libpcre2-10.49-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunistring-1.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 563 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.49.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libunistring-1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.14.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libpcre2-10.49-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 565 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 566 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 567 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 568 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 569 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 570 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: Running setscene task 571 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.10.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 572 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.1.0.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.42.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 586 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 587 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 588 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 589 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.49-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 590 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.54.1.bb:do_packagedata_setscene)
NOTE: recipe libedit-20260512-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe appstream-1.2.3-r0: task do_patch: Succeeded
NOTE: recipe libffi-3.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 591 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.4.bb:do_packagedata_setscene)
NOTE: recipe xz-5.8.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.10.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-4.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.9.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxmlb-0.3.29-r0: task do_unpack: Succeeded
NOTE: recipe python3-3.14.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.54.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 592 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 594 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 595 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.54.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 597 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.4.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 598 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 599 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.10.0.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.10.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 600 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 601 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-ng-0.9.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 603 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-4.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20260512-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.9.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 606 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.10.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.54.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 608 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 609 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 610 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.54.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 611 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 612 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_packagedata_setscene)
NOTE: recipe expat-2.10.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-4.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.42.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.14.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.9.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20260512-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 617 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 623 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.54.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 624 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 626 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.10.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 628 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 630 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.54.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.14.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.42.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 631 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 633 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 637 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.10.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 638 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20260512-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 639 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 641 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.4.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 644 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.18.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.9.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 646 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.54.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-4.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.8.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 648 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.1.0.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.10.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 651 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.3.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.9.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1133 of 1711 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.29.bb:do_patch)
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1177 of 1711 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.2.3.bb:do_deploy_source_date_epoch)
NOTE: recipe sqlite3-3_3.54.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.8.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1203 of 1711 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.19.bb:do_create_recipe_spdx)
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.10.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1211 of 1711 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.29.bb:do_create_recipe_spdx)
NOTE: Running task 1212 of 1711 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.6.bb:do_create_recipe_spdx)
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-4.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 653 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxmlb-0.3.29-r0: task do_patch: Started
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.8.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 655 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 656 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 658 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 659 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_recipe_qa_setscene)
NOTE: recipe appstream-1.2.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vala-0.56.19-r0: task do_create_recipe_spdx: Started
NOTE: recipe openssl-4.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libfyaml-0.9.6-r0: task do_create_recipe_spdx: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxmlb-0.3.29-r0: task do_create_recipe_spdx: Started
NOTE: recipe libpam-1.7.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxmlb-0.3.29-r0: task do_patch: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 661 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 663 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 664 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 666 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe appstream-1.2.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gcc-runtime-16.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vala-0.56.19-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libxmlb-0.3.29-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe gcc-runtime-16.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libfyaml-0.9.6-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1281 of 1711 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.2.3.bb:do_create_recipe_spdx)
NOTE: recipe gcc-runtime-16.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 668 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_packagedata_setscene)
NOTE: recipe appstream-1.2.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe libgcc-16.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-16.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 670 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-16.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 671 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 672 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-16.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe appstream-1.2.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 675 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 676 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 677 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-16.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-16.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe linux-libc-headers-7.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 678 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 679 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-16.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-16.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 684 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 686 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 687 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 688 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 694 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 696 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 698 of 698 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-7.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1571 of 1711 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.29.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1626 of 1711 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.19.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1627 of 1711 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxmlb-0.3.29-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libfyaml-0.9.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vala-0.56.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libfyaml-0.9.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1674 of 1711 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.6.bb:do_configure)
NOTE: recipe libfyaml-0.9.6-r0: task do_configure: Started
NOTE: recipe libxmlb-0.3.29-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1675 of 1711 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.29.bb:do_configure)
NOTE: recipe vala-0.56.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1676 of 1711 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.19.bb:do_configure)
NOTE: recipe libxmlb-0.3.29-r0: task do_configure: Started
NOTE: recipe vala-0.56.19-r0: task do_configure: Started
NOTE: recipe libxmlb-0.3.29-r0: task do_configure: Succeeded
NOTE: Running task 1677 of 1711 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.29.bb:do_configure_ptest_base)
NOTE: recipe libxmlb-0.3.29-r0: task do_configure_ptest_base: Started
NOTE: recipe libxmlb-0.3.29-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1678 of 1711 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.29.bb:do_compile)
NOTE: recipe libxmlb-0.3.29-r0: task do_compile: Started
NOTE: recipe libxmlb-0.3.29-r0: task do_compile: Succeeded
NOTE: Running task 1679 of 1711 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.29.bb:do_compile_ptest_base)
NOTE: recipe libxmlb-0.3.29-r0: task do_compile_ptest_base: Started
NOTE: recipe libxmlb-0.3.29-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1680 of 1711 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.29.bb:do_install)
NOTE: recipe libxmlb-0.3.29-r0: task do_install: Started
NOTE: recipe libfyaml-0.9.6-r0: task do_configure: Succeeded
NOTE: Running task 1681 of 1711 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.6.bb:do_compile)
NOTE: recipe libfyaml-0.9.6-r0: task do_compile: Started
NOTE: recipe libxmlb-0.3.29-r0: task do_install: Succeeded
NOTE: Running task 1682 of 1711 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.29.bb:do_install_ptest_base)
NOTE: recipe libxmlb-0.3.29-r0: task do_install_ptest_base: Started
NOTE: recipe libxmlb-0.3.29-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1683 of 1711 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.29.bb:do_package)
NOTE: Running task 1684 of 1711 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.29.bb:do_populate_sysroot)
NOTE: recipe libxmlb-0.3.29-r0: task do_package: Started
NOTE: recipe libxmlb-0.3.29-r0: task do_populate_sysroot: Started
NOTE: recipe vala-0.56.19-r0: task do_configure: Succeeded
NOTE: Running task 1685 of 1711 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.19.bb:do_compile)
NOTE: recipe vala-0.56.19-r0: task do_compile: Started
NOTE: recipe libxmlb-0.3.29-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxmlb-0.3.29-r0: task do_package: Succeeded
NOTE: Running task 1686 of 1711 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.29.bb:do_packagedata)
NOTE: recipe libxmlb-0.3.29-r0: task do_packagedata: Started
NOTE: recipe libfyaml-0.9.6-r0: task do_compile: Succeeded
NOTE: Running task 1687 of 1711 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.6.bb:do_install)
NOTE: recipe libfyaml-0.9.6-r0: task do_install: Started
NOTE: recipe libxmlb-0.3.29-r0: task do_packagedata: Failed
NOTE: recipe libfyaml-0.9.6-r0: task do_install: Succeeded
NOTE: recipe vala-0.56.19-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1687 tasks of which 1650 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20261111060212.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20261111060212.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.29.bb:do_packagedata
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libxmlb/0.3.29/temp/log.do_packagedata.1539374
Summary: There were 10 ERROR messages, returning a non-zero exit code.
ERROR: libxmlb-0.3.29-r0 do_packagedata: QA Issue: Package version for package libxmlb-src went backwards which would break package feeds (from 0:0.3.30-r0 to 0:0.3.29-r0) [version-going-backwards]
ERROR: libxmlb-0.3.29-r0 do_packagedata: QA Issue: Package version for package libxmlb-dbg went backwards which would break package feeds (from 0:0.3.30-r0 to 0:0.3.29-r0) [version-going-backwards]
ERROR: libxmlb-0.3.29-r0 do_packagedata: QA Issue: Package version for package libxmlb-ptest went backwards which would break package feeds (from 0:0.3.30-r0 to 0:0.3.29-r0) [version-going-backwards]
ERROR: libxmlb-0.3.29-r0 do_packagedata: QA Issue: Package version for package libxmlb-staticdev went backwards which would break package feeds (from 0:0.3.30-r0 to 0:0.3.29-r0) [version-going-backwards]
ERROR: libxmlb-0.3.29-r0 do_packagedata: QA Issue: Package version for package libxmlb-dev went backwards which would break package feeds (from 0:0.3.30-r0 to 0:0.3.29-r0) [version-going-backwards]
ERROR: libxmlb-0.3.29-r0 do_packagedata: QA Issue: Package version for package libxmlb-doc went backwards which would break package feeds (from 0:0.3.30-r0 to 0:0.3.29-r0) [version-going-backwards]
ERROR: libxmlb-0.3.29-r0 do_packagedata: QA Issue: Package version for package libxmlb-locale went backwards which would break package feeds (from 0:0.3.30-r0 to 0:0.3.29-r0) [version-going-backwards]
ERROR: libxmlb-0.3.29-r0 do_packagedata: QA Issue: Package version for package libxmlb-bin went backwards which would break package feeds (from 0:0.3.30-r0 to 0:0.3.29-r0) [version-going-backwards]
ERROR: libxmlb-0.3.29-r0 do_packagedata: QA Issue: Package version for package libxmlb went backwards which would break package feeds (from 0:0.3.30-r0 to 0:0.3.29-r0) [version-going-backwards]
ERROR: libxmlb-0.3.29-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libxmlb/0.3.29/temp/log.do_packagedata.1539374
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.29.bb:do_packagedata) failed with exit code '1'

--===============5758142968756958865==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/appstream/appstream-bash-completion: PKGV changed from 1.2.1 [default] to 1.2.3 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-bash-completion: PV changed from "1.2.1" to "1.2.3"
packages/x86-64-v3-poky-linux/appstream/appstream-dbg: PKGV changed from 1.2.1 [default] to 1.2.3 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-dbg: PV changed from "1.2.1" to "1.2.3"
packages/x86-64-v3-poky-linux/appstream/appstream-dbg: PKGSIZE changed from 2835216 to 2944856 (+4%)
packages/x86-64-v3-poky-linux/appstream/appstream-dbg: FILELIST: removed "/usr/lib/.debug/libappstream.so.1.2.1", added "/usr/lib/.debug/libappstream.so.1.2.3"
packages/x86-64-v3-poky-linux/appstream/appstream-dev: PKGV changed from 1.2.1 [default] to 1.2.3 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-dev: PV changed from "1.2.1" to "1.2.3"
packages/x86-64-v3-poky-linux/appstream/appstream-dev: PKGSIZE changed from 1360901 to 1375289 (+1%)
packages/x86-64-v3-poky-linux/appstream/appstream-dev: FILELIST: added "/usr/include/appstream/as-locale.h"
packages/x86-64-v3-poky-linux/appstream/appstream-doc: PKGV changed from 1.2.1 [default] to 1.2.3 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-doc: PV changed from "1.2.1" to "1.2.3"
packages/x86-64-v3-poky-linux/appstream/appstream-doc: PKGSIZE changed from 2851570 to 2853395 (+0%)
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ain: PKGV changed from 1.2.1 [default] to 1.2.3 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ain: PV changed from "1.2.1" to "1.2.3"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ar: PKGV changed from 1.2.1 [default] to 1.2.3 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ar: PV changed from "1.2.1" to "1.2.3"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-bg: PKGV changed from 1.2.1 [default] to 1.2.3 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-bg: PV changed from "1.2.1" to "1.2.3"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-bn-bd: PKGV changed from 1.2.1 [default] to 1.2.3 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-bn-bd: PV changed from "1.2.1" to "1.2.3"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-bn: PKGV changed from 1.2.1 [default] to 1.2.3 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-bn: PV changed from "1.2.1" to "1.2.3"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ca: PKGV changed from 1.2.1 [default] to 1.2.3 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ca: PV changed from "1.2.1" to "1.2.3"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ckb: PKGV changed from 1.2.1 [default] to 1.2.3 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ckb: PV changed from "1.2.1" to "1.2.3"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-cs: PKGV changed from 1.2.1 [default] to 1.2.3 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-cs: PV changed from "1.2.1" to "1.2.3"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-da: PKGV changed from 1.2.1 [default] to 1.2.3 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-da: PV changed from "1.2.1" to "1.2.3"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-de: PKGV changed from 1.2.1 [default] to 1.2.3 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-de: PV changed from "1.2.1" to "1.2.3"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-de: PKGSIZE changed from 116159 to 116651 (+0%)
packages/x86-64-v3-poky-linux/appstream/appstream-locale-en-gb: PKGV changed from 1.2.1 [default] to 1.2.3 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-en-gb: PV changed from "1.2.1" to "1.2.3"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-eo: PKGV changed from 1.2.1 [default] to 1.2.3 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-eo: PV changed from "1.2.1" to "1.2.3"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-es: PKGV changed from 1.2.1 [default] to 1.2.3 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-es: PV changed from "1.2.1" to "1.2.3"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-et: PKGV changed from 1.2.1 [default] to 1.2.3 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-et: PV changed from "1.2.1" to "1.2.3"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-eu: PKGV changed from 1.2.1 [default] to 1.2.3 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-eu: PV changed from "1.2.1" to "1.2.3"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-fi: PKGV changed from 1.2.1 [default] to 1.2.3 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-fi: PV changed from "1.2.1" to "1.2.3"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-fr: PKGV changed from 1.2.1 [default] to 1.2.3 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-fr: PV changed from "1.2.1" to "1.2.3"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-gd: PKGV changed from 1.2.1 [default] to 1.2.3 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-gd: PV changed from "1.2.1" to "1.2.3"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-gl: PKGV changed from 1.2.1 [default] to 1.2.3 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-gl: PV changed from "1.2.1" to "1.2.3"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-he: PKGV changed from 1.2.1 [default] to 1.2.3 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-he: PV changed from "1.2.1" to "1.2.3"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-hi: PKGV changed from 1.2.1 [default] to 1.2.3 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-hi: PV changed from "1.2.1" to "1.2.3"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-hr: PKGV changed from 1.2.1 [default] to 1.2.3 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-hr: PV changed from "1.2.1" to "1.2.3"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-hu: PKGV changed from 1.2.1 [default] to 1.2.3 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-hu: PV changed from "1.2.1" to "1.2.3"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ia: PKGV changed from 1.2.1 [default] to 1.2.3 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ia: PV changed from "1.2.1" to "1.2.3"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-id: PKGV changed from 1.2.1 [default] to 1.2.3 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-id: PV changed from "1.2.1" to "1.2.3"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-it: PKGV changed from 1.2.1 [default] to 1.2.3 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-it: PV changed from "1.2.1" to "1.2.3"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-it: PKGSIZE changed from 103308 to 110553 (+7%)
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ja: PKGV changed from 1.2.1 [default] to 1.2.3 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ja: PV changed from "1.2.1" to "1.2.3"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ka: PKGV changed from 1.2.1 [default] to 1.2.3 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ka: PV changed from "1.2.1" to "1.2.3"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ka: PKGSIZE changed from 38076 to 39385 (+3%)
packages/x86-64-v3-poky-linux/appstream/appstream-locale-kk: PKGV changed from 1.2.1 [default] to 1.2.3 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-kk: PV changed from "1.2.1" to "1.2.3"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-kk: PKGSIZE changed from 158911 to 166468 (+5%)
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ko: PKGV changed from 1.2.1 [default] to 1.2.3 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ko: PV changed from "1.2.1" to "1.2.3"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-kw: PKGV changed from 1.2.1 [default] to 1.2.3 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-kw: PV changed from "1.2.1" to "1.2.3"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-lt: PKGV changed from 1.2.1 [default] to 1.2.3 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-lt: PV changed from "1.2.1" to "1.2.3"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-nb: PKGV changed from 1.2.1 [default] to 1.2.3 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-nb: PV changed from "1.2.1" to "1.2.3"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-nb: PKGSIZE changed from 34644 to 123336 (+256%)
packages/x86-64-v3-poky-linux/appstream/appstream-locale-nl: PKGV changed from 1.2.1 [default] to 1.2.3 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-nl: PV changed from "1.2.1" to "1.2.3"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-oc: PKGV changed from 1.2.1 [default] to 1.2.3 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-oc: PV changed from "1.2.1" to "1.2.3"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-pl: PKGV changed from 1.2.1 [default] to 1.2.3 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-pl: PV changed from "1.2.1" to "1.2.3"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-pl: PKGSIZE changed from 125936 to 132339 (+5%)
packages/x86-64-v3-poky-linux/appstream/appstream-locale-pt-br: PKGV changed from 1.2.1 [default] to 1.2.3 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-pt-br: PV changed from "1.2.1" to "1.2.3"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-pt: PKGV changed from 1.2.1 [default] to 1.2.3 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-pt: PV changed from "1.2.1" to "1.2.3"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-pt: PKGSIZE changed from 124871 to 130696 (+5%)
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ro: PKGV changed from 1.2.1 [default] to 1.2.3 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ro: PV changed from "1.2.1" to "1.2.3"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ro: PKGSIZE changed from 129639 to 135628 (+5%)
packages/x86-64-v3-poky-linux/appstream/appstream-locale-rom: PKGV changed from 1.2.1 [default] to 1.2.3 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-rom: PV changed from "1.2.1" to "1.2.3"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ru: PKGV changed from 1.2.1 [default] to 1.2.3 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ru: PV changed from "1.2.1" to "1.2.3"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ru: PKGSIZE changed from 150574 to 161454 (+7%)
packages/x86-64-v3-poky-linux/appstream/appstream-locale-sk: PKGV changed from 1.2.1 [default] to 1.2.3 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-sk: PV changed from "1.2.1" to "1.2.3"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-sl: PKGV changed from 1.2.1 [default] to 1.2.3 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-sl: PV changed from "1.2.1" to "1.2.3"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-sl: PKGSIZE changed from 120689 to 126144 (+5%)
packages/x86-64-v3-poky-linux/appstream/appstream-locale-sr+latin: PKGV changed from 1.2.1 [default] to 1.2.3 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-sr+latin: PV changed from "1.2.1" to "1.2.3"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-sr: PKGV changed from 1.2.1 [default] to 1.2.3 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-sr: PV changed from "1.2.1" to "1.2.3"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-sv: PKGV changed from 1.2.1 [default] to 1.2.3 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-sv: PV changed from "1.2.1" to "1.2.3"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-sv: PKGSIZE changed from 119857 to 125956 (+5%)
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ta: PKGV changed from 1.2.1 [default] to 1.2.3 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ta: PV changed from "1.2.1" to "1.2.3"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-th: PKGV changed from 1.2.1 [default] to 1.2.3 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-th: PV changed from "1.2.1" to "1.2.3"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-tr: PKGV changed from 1.2.1 [default] to 1.2.3 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-tr: PV changed from "1.2.1" to "1.2.3"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-uk: PKGV changed from 1.2.1 [default] to 1.2.3 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-uk: PV changed from "1.2.1" to "1.2.3"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-uk: PKGSIZE changed from 160784 to 163663 (+2%)
packages/x86-64-v3-poky-linux/appstream/appstream-locale-zh-cn: PKGV changed from 1.2.1 [default] to 1.2.3 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-zh-cn: PV changed from "1.2.1" to "1.2.3"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-zh-tw: PKGV changed from 1.2.1 [default] to 1.2.3 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-zh-tw: PV changed from "1.2.1" to "1.2.3"
packages/x86-64-v3-poky-linux/appstream/appstream-src: PKGV changed from 1.2.1 [default] to 1.2.3 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-src: PV changed from "1.2.1" to "1.2.3"
packages/x86-64-v3-poky-linux/appstream/appstream-src: PKGSIZE changed from 2081554 to 2156316 (+4%)
packages/x86-64-v3-poky-linux/appstream/appstream-src: FILELIST: directory renamed /usr/src/debug/appstream/1.2.1/tools -> /usr/src/debug/appstream/1.2.3/tools, removed "/usr/src/debug/appstream/1.2.1/src/as-agreement-section-private.h /usr/src/debug/appstream/1.2.1/src/as-developer.h /usr/src/debug/appstream/1.2.1/src/as-relation-private.h /usr/src/debug/appstream/1.2.1/src/as-developer.c /usr/src/debug/appstream/1.2.1/src/as-yaml.h /usr/src/debug/appstream/1.2.1/src/as-validator-issue.h /usr/src/debug/appstream/1.2.1/src/as-reference.h /usr/src/debug/appstream/1.2.1/src/as-validator-issue.c /usr/src/debug/appstream/1.2.1/src/as-yaml.c /usr/src/debug/appstream/1.2.1/src/as-reference.c /usr/src/debug/appstream/1.2.1/src/as-video-private.h /usr/src/debug/appstream/1.2.1/src/as-release-list.h /usr/src/debug/appstream/1.2.1/src/as-component.h /usr/src/debug/appstream/1.2.1/src/as-component.c /usr/src/debug/appstream/1.2.1/src/as-release-list.c /usr/src/debug/appstream/1.2.1/src/as-compo
 nent-private.h /usr/src/debug/appstream/1.2.1/src/as-enum-types.h /usr/src/debug/appstream/1.2.1/src/as-enum-types.c /usr/src/debug/appstream/1.2.1/src/as-wayland-private.c /usr/src/debug/appstream/1.2.1/src/as-tag-yaml.gperf /usr/src/debug/appstream/1.2.1/src/as-wayland-private.h /usr/src/debug/appstream/1.2.1/src/as-file-monitor.h /usr/src/debug/appstream/1.2.1/src/as-file-monitor.c /usr/src/debug/appstream/1.2.1/src/as-utils-private.h /usr/src/debug/appstream/1.2.1/src/as-desktop-entry.c /usr/src/debug/appstream/1.2.1/src/as-icon.c /usr/src/debug/appstream/1.2.1/src/as-bundle-private.h /usr/src/debug/appstream/1.2.1/src/as-curl.h /usr/src/debug/appstream/1.2.1/src/as-relation-check-result.h /usr/src/debug/appstream/1.2.1/src/as-spdx-data.h /usr/src/debug/appstream/1.2.1/src/as-curl.c /usr/src/debug/appstream/1.2.1/src/as-relation-check-result.c /usr/src/debug/appstream/1.2.1/src/as-desktop-entry.h /usr/src/debug/appstream/1.2.1/src/as-icon.h /usr/src/debug/appstream/1.2.1/src/as-
 checksum.c /usr/src/debug/appstream/1.2.1/src/as-checksum.h /usr/src/debug/appstream/1.2.1/src/as-version.c /usr/src/debug/appstream/1.2.1/src/as-release.h /usr/src/debug/appstream/1.2.1/src/as-version.h /usr/src/debug/appstream/1.2.1/src/as-release.c /usr/src/debug/appstream/1.2.1/src/as-resources.c /usr/src/debug/appstream/1.2.1/src/as-provided.c /usr/src/debug/appstream/1.2.1/src/as-category.c /usr/src/debug/appstream/1.2.1/src/as-image.c /usr/src/debug/appstream/1.2.1/src/as-category.h /usr/src/debug/appstream/1.2.1/src/as-launchable-private.h /usr/src/debug/appstream/1.2.1/src/as-provided.h /usr/src/debug/appstream/1.2.1/src/as-resources.h /usr/src/debug/appstream/1.2.1/src/as-image.h /usr/src/debug/appstream/1.2.1/src/as-artifact.c /usr/src/debug/appstream/1.2.1/src/as-screenshot-private.h /usr/src/debug/appstream/1.2.1/src/as-desktop-env-data.h /usr/src/debug/appstream/1.2.1/src/as-review-private.h /usr/src/debug/appstream/1.2.1/src/as-reference-private.h /usr/src/debug/appst
 ream/1.2.1/src/as-artifact.h /usr/src/debug/appstream/1.2.1/src/as-news-convert.h /usr/src/debug/appstream/1.2.1/src/as-issue-private.h /usr/src/debug/appstream/1.2.1/src/as-image-private.h /usr/src/debug/appstream/1.2.1/src/as-distro-extras.c /usr/src/debug/appstream/1.2.1/src/as-news-convert.c /usr/src/debug/appstream/1.2.1/src/as-screenshot.h /usr/src/debug/appstream/1.2.1/src/as-vercmp.h /usr/src/debug/appstream/1.2.1/src/as-agreement.c /usr/src/debug/appstream/1.2.1/src/as-pool.c /usr/src/debug/appstream/1.2.1/src/as-validator-issue-tag.h /usr/src/debug/appstream/1.2.1/src/as-agreement.h /usr/src/debug/appstream/1.2.1/src/as-branding-private.h /usr/src/debug/appstream/1.2.1/src/as-pool.h /usr/src/debug/appstream/1.2.1/src/as-screenshot.c /usr/src/debug/appstream/1.2.1/src/as-vercmp.c /usr/src/debug/appstream/1.2.1/src/as-icon-private.h /usr/src/debug/appstream/1.2.1/src/as-pool-private.h /usr/src/debug/appstream/1.2.1/src/as-issue.h /usr/src/debug/appstream/1.2.1/src/as-release
 -list-private.h /usr/src/debug/appstream/1.2.1/src/as-issue.c /usr/src/debug/appstream/1.2.1/src/as-artifact-private.h /usr/src/debug/appstream/1.2.1/src/as-branding.h /usr/src/debug/appstream/1.2.1/src/as-component-box.h /usr/src/debug/appstream/1.2.1/src/as-tag.c /usr/src/debug/appstream/1.2.1/src/as-tag.h /usr/src/debug/appstream/1.2.1/src/as-branding.c /usr/src/debug/appstream/1.2.1/src/as-component-box.c /usr/src/debug/appstream/1.2.1/src/as-gcve.c /usr/src/debug/appstream/1.2.1/src/as-metadata.h /usr/src/debug/appstream/1.2.1/src/as-agreement-private.h /usr/src/debug/appstream/1.2.1/src/as-gcve.h /usr/src/debug/appstream/1.2.1/src/as-metadata.c /usr/src/debug/appstream/1.2.1/src/as-context-private.h /usr/src/debug/appstream/1.2.1/src/as-launchable.h /usr/src/debug/appstream/1.2.1/src/as-launchable.c /usr/src/debug/appstream/1.2.1/src/as-developer-private.h /usr/src/debug/appstream/1.2.1/src/as-translation.c /usr/src/debug/appstream/1.2.1/src/as-release-private.h /usr/src/debug
 /appstream/1.2.1/src/as-zstd-decompressor.c /usr/src/debug/appstream/1.2.1/src/as-translation.h /usr/src/debug/appstream/1.2.1/src/as-zstd-decompressor.h /usr/src/debug/appstream/1.2.1/src/as-agreement-section.h /usr/src/debug/appstream/1.2.1/src/as-utils.h /usr/src/debug/appstream/1.2.1/src/as-content-rating.c /usr/src/debug/appstream/1.2.1/src/as-video.c /usr/src/debug/appstream/1.2.1/src/as-utils.c /usr/src/debug/appstream/1.2.1/src/as-agreement-section.c /usr/src/debug/appstream/1.2.1/src/as-video.h /usr/src/debug/appstream/1.2.1/src/as-content-rating.h /usr/src/debug/appstream/1.2.1/src/as-translation-private.h /usr/src/debug/appstream/1.2.1/src/as-cache.h /usr/src/debug/appstream/1.2.1/src/as-xml.c /usr/src/debug/appstream/1.2.1/src/as-tag-xml.gperf /usr/src/debug/appstream/1.2.1/src/as-cache.c /usr/src/debug/appstream/1.2.1/src/as-xml.h /usr/src/debug/appstream/1.2.1/src/as-content-rating-private.h /usr/src/debug/appstream/1.2.1/src/as-review.h /usr/src/debug/appstream/1.2.1/
 src/as-stemmer.h /usr/src/debug/appstream/1.2.1/src/as-validator.c /usr/src/debug/appstream/1.2.1/src/as-validator.h /usr/src/debug/appstream/1.2.1/src/as-review.c /usr/src/debug/appstream/1.2.1/src/as-stemmer.c /usr/src/debug/appstream/1.2.1/src/as-bundle.h /usr/src/debug/appstream/1.2.1/src/as-profile.c /usr/src/debug/appstream/1.2.1/src/as-spdx.h /usr/src/debug/appstream/1.2.1/src/as-relation.h /usr/src/debug/appstream/1.2.1/src/as-bundle.c /usr/src/debug/appstream/1.2.1/src/as-profile.h /usr/src/debug/appstream/1.2.1/src/as-relation.c /usr/src/debug/appstream/1.2.1/src/as-spdx.c /usr/src/debug/appstream/1.2.1/src/as-reviews-client.h /usr/src/debug/appstream/1.2.1/src/as-reviews-client.c /usr/src/debug/appstream/1.2.1/src/as-suggested.h /usr/src/debug/appstream/1.2.1/src/as-suggested.c /usr/src/debug/appstream/1.2.1/src/as-context.c /usr/src/debug/appstream/1.2.1/src/as-suggested-private.h /usr/src/debug/appstream/1.2.1/src/as-system-info.c /usr/src/debug/appstream/1.2.1/src/as-c
 ontext.h /usr/src/debug/appstream/1.2.1/src/as-system-info.h /usr/src/debug/appstream/1.2.1/src/as-checksum-private.h", added "/usr/src/debug/appstream/1.2.3/src/as-agreement-section-private.h /usr/src/debug/appstream/1.2.3/src/as-developer.h /usr/src/debug/appstream/1.2.3/src/as-relation-private.h /usr/src/debug/appstream/1.2.3/src/as-developer.c /usr/src/debug/appstream/1.2.3/src/as-yaml.h /usr/src/debug/appstream/1.2.3/src/as-validator-issue.h /usr/src/debug/appstream/1.2.3/src/as-reference.h /usr/src/debug/appstream/1.2.3/src/as-validator-issue.c /usr/src/debug/appstream/1.2.3/src/as-yaml.c /usr/src/debug/appstream/1.2.3/src/as-reference.c /usr/src/debug/appstream/1.2.3/src/as-video-private.h /usr/src/debug/appstream/1.2.3/src/as-release-list.h /usr/src/debug/appstream/1.2.3/src/as-component.h /usr/src/debug/appstream/1.2.3/src/as-component.c /usr/src/debug/appstream/1.2.3/src/as-release-list.c /usr/src/debug/appstream/1.2.3/src/as-component-private.h /usr/src/debug/appstream/1.
 2.3/src/as-enum-types.h /usr/src/debug/appstream/1.2.3/src/as-enum-types.c /usr/src/debug/appstream/1.2.3/src/as-wayland-private.c /usr/src/debug/appstream/1.2.3/src/as-tag-yaml.gperf /usr/src/debug/appstream/1.2.3/src/as-wayland-private.h /usr/src/debug/appstream/1.2.3/src/as-file-monitor.h /usr/src/debug/appstream/1.2.3/src/as-file-monitor.c /usr/src/debug/appstream/1.2.3/src/as-utils-private.h /usr/src/debug/appstream/1.2.3/src/as-locale-private.h /usr/src/debug/appstream/1.2.3/src/as-desktop-entry.c /usr/src/debug/appstream/1.2.3/src/as-icon.c /usr/src/debug/appstream/1.2.3/src/as-bundle-private.h /usr/src/debug/appstream/1.2.3/src/as-curl.h /usr/src/debug/appstream/1.2.3/src/as-relation-check-result.h /usr/src/debug/appstream/1.2.3/src/as-spdx-data.h /usr/src/debug/appstream/1.2.3/src/as-curl.c /usr/src/debug/appstream/1.2.3/src/as-desktop-entry.h /usr/src/debug/appstream/1.2.3/src/as-icon.h /usr/src/debug/appstream/1.2.3/src/as-relation-check-result.c /usr/src/debug/appstream/
 1.2.3/src/as-checksum.c /usr/src/debug/appstream/1.2.3/src/as-checksum.h /usr/src/debug/appstream/1.2.3/src/as-version.c /usr/src/debug/appstream/1.2.3/src/as-release.h /usr/src/debug/appstream/1.2.3/src/as-version.h /usr/src/debug/appstream/1.2.3/src/as-release.c /usr/src/debug/appstream/1.2.3/src/as-resources.c /usr/src/debug/appstream/1.2.3/src/as-provided.c /usr/src/debug/appstream/1.2.3/src/as-category.c /usr/src/debug/appstream/1.2.3/src/as-image.c /usr/src/debug/appstream/1.2.3/src/as-category.h /usr/src/debug/appstream/1.2.3/src/as-launchable-private.h /usr/src/debug/appstream/1.2.3/src/as-provided.h /usr/src/debug/appstream/1.2.3/src/as-resources.h /usr/src/debug/appstream/1.2.3/src/as-image.h /usr/src/debug/appstream/1.2.3/src/as-artifact.c /usr/src/debug/appstream/1.2.3/src/as-screenshot-private.h /usr/src/debug/appstream/1.2.3/src/as-desktop-env-data.h /usr/src/debug/appstream/1.2.3/src/as-review-private.h /usr/src/debug/appstream/1.2.3/src/as-reference-private.h /usr/sr
 c/debug/appstream/1.2.3/src/as-artifact.h /usr/src/debug/appstream/1.2.3/src/as-news-convert.h /usr/src/debug/appstream/1.2.3/src/as-issue-private.h /usr/src/debug/appstream/1.2.3/src/as-image-private.h /usr/src/debug/appstream/1.2.3/src/as-distro-extras.c /usr/src/debug/appstream/1.2.3/src/as-news-convert.c /usr/src/debug/appstream/1.2.3/src/as-screenshot.h /usr/src/debug/appstream/1.2.3/src/as-vercmp.h /usr/src/debug/appstream/1.2.3/src/as-agreement.c /usr/src/debug/appstream/1.2.3/src/as-pool.c /usr/src/debug/appstream/1.2.3/src/as-validator-issue-tag.h /usr/src/debug/appstream/1.2.3/src/as-agreement.h /usr/src/debug/appstream/1.2.3/src/as-branding-private.h /usr/src/debug/appstream/1.2.3/src/as-pool.h /usr/src/debug/appstream/1.2.3/src/as-screenshot.c /usr/src/debug/appstream/1.2.3/src/as-vercmp.c /usr/src/debug/appstream/1.2.3/src/as-icon-private.h /usr/src/debug/appstream/1.2.3/src/as-pool-private.h /usr/src/debug/appstream/1.2.3/src/as-issue.h /usr/src/debug/appstream/1.2.3/s
 rc/as-release-list-private.h /usr/src/debug/appstream/1.2.3/src/as-issue.c /usr/src/debug/appstream/1.2.3/src/as-artifact-private.h /usr/src/debug/appstream/1.2.3/src/as-branding.h /usr/src/debug/appstream/1.2.3/src/as-component-box.h /usr/src/debug/appstream/1.2.3/src/as-tag.c /usr/src/debug/appstream/1.2.3/src/as-tag.h /usr/src/debug/appstream/1.2.3/src/as-branding.c /usr/src/debug/appstream/1.2.3/src/as-component-box.c /usr/src/debug/appstream/1.2.3/src/as-gcve.c /usr/src/debug/appstream/1.2.3/src/as-metadata.h /usr/src/debug/appstream/1.2.3/src/as-agreement-private.h /usr/src/debug/appstream/1.2.3/src/as-gcve.h /usr/src/debug/appstream/1.2.3/src/as-metadata.c /usr/src/debug/appstream/1.2.3/src/as-context-private.h /usr/src/debug/appstream/1.2.3/src/as-launchable.h /usr/src/debug/appstream/1.2.3/src/as-launchable.c /usr/src/debug/appstream/1.2.3/src/as-developer-private.h /usr/src/debug/appstream/1.2.3/src/as-translation.c /usr/src/debug/appstream/1.2.3/src/as-release-private.h /
 usr/src/debug/appstream/1.2.3/src/as-zstd-decompressor.c /usr/src/debug/appstream/1.2.3/src/as-translation.h /usr/src/debug/appstream/1.2.3/src/as-zstd-decompressor.h /usr/src/debug/appstream/1.2.3/src/as-agreement-section.h /usr/src/debug/appstream/1.2.3/src/as-utils.h /usr/src/debug/appstream/1.2.3/src/as-content-rating.c /usr/src/debug/appstream/1.2.3/src/as-video.c /usr/src/debug/appstream/1.2.3/src/as-utils.c /usr/src/debug/appstream/1.2.3/src/as-agreement-section.c /usr/src/debug/appstream/1.2.3/src/as-video.h /usr/src/debug/appstream/1.2.3/src/as-content-rating.h /usr/src/debug/appstream/1.2.3/src/as-translation-private.h /usr/src/debug/appstream/1.2.3/src/as-cache.h /usr/src/debug/appstream/1.2.3/src/as-xml.c /usr/src/debug/appstream/1.2.3/src/as-tag-xml.gperf /usr/src/debug/appstream/1.2.3/src/as-cache.c /usr/src/debug/appstream/1.2.3/src/as-xml.h /usr/src/debug/appstream/1.2.3/src/as-content-rating-private.h /usr/src/debug/appstream/1.2.3/src/as-review.h /usr/src/debug/app
 stream/1.2.3/src/as-locale.c /usr/src/debug/appstream/1.2.3/src/as-stemmer.h /usr/src/debug/appstream/1.2.3/src/as-validator.c /usr/src/debug/appstream/1.2.3/src/as-locale.h /usr/src/debug/appstream/1.2.3/src/as-review.c /usr/src/debug/appstream/1.2.3/src/as-stemmer.c /usr/src/debug/appstream/1.2.3/src/as-validator.h /usr/src/debug/appstream/1.2.3/src/as-bundle.h /usr/src/debug/appstream/1.2.3/src/as-profile.c /usr/src/debug/appstream/1.2.3/src/as-spdx.h /usr/src/debug/appstream/1.2.3/src/as-relation.h /usr/src/debug/appstream/1.2.3/src/as-bundle.c /usr/src/debug/appstream/1.2.3/src/as-profile.h /usr/src/debug/appstream/1.2.3/src/as-relation.c /usr/src/debug/appstream/1.2.3/src/as-spdx.c /usr/src/debug/appstream/1.2.3/src/as-reviews-client.h /usr/src/debug/appstream/1.2.3/src/as-reviews-client.c /usr/src/debug/appstream/1.2.3/src/as-suggested.h /usr/src/debug/appstream/1.2.3/src/as-suggested.c /usr/src/debug/appstream/1.2.3/src/as-context.c /usr/src/debug/appstream/1.2.3/src/as-sugg
 ested-private.h /usr/src/debug/appstream/1.2.3/src/as-system-info.c /usr/src/debug/appstream/1.2.3/src/as-context.h /usr/src/debug/appstream/1.2.3/src/as-system-info.h /usr/src/debug/appstream/1.2.3/src/as-checksum-private.h"
packages/x86-64-v3-poky-linux/appstream/appstream-staticdev: PKGV changed from 1.2.1 [default] to 1.2.3 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-staticdev: PV changed from "1.2.1" to "1.2.3"
packages/x86-64-v3-poky-linux/appstream/appstream: PKGV changed from 1.2.1 [default] to 1.2.3 [default]
packages/x86-64-v3-poky-linux/appstream/appstream: PV changed from "1.2.1" to "1.2.3"
packages/x86-64-v3-poky-linux/appstream/appstream: PKGSIZE changed from 1110354 to 1140762 (+3%)
packages/x86-64-v3-poky-linux/appstream/appstream: FILELIST: removed "/usr/lib/libappstream.so.1.2.1", added "/usr/lib/libappstream.so.1.2.3"
packages/x86-64-v3-poky-linux/appstream: PKGV changed from 1.2.1 [default] to 1.2.3 [default]
packages/x86-64-v3-poky-linux/appstream: PV changed from "1.2.1" to "1.2.3"
packages/x86-64-v3-poky-linux/appstream: SRC_URI changed from "https://www.freedesktop.org/software/appstream/releases/AppStream-1.2.1.tar.xz file://0002-Do-not-build-qt-tests.patch file://0003-Fix-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch" to "https://www.freedesktop.org/software/appstream/releases/AppStream-1.2.3.tar.xz file://0002-Do-not-build-qt-tests.patch file://0003-Fix-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch"
packages/x86-64-v3-poky-linux/appstream: PACKAGES: added "appstream-locale-nn"
Changes to packages/x86-64-v3-poky-linux/appstream (sysroot):
  /usr/lib/libappstream.so.5 changed symlink target from libappstream.so.1.2.1 to libappstream.so.1.2.3
  /usr/lib/libappstream.so.1.2.1 moved to /usr/lib/libappstream.so.1.2.3
  /usr/include/appstream/as-locale.h was added
Changes to packages/x86_64-linux/appstream-native (sysroot):
  /usr/lib/libappstream.so.5 changed symlink target from libappstream.so.1.2.1 to libappstream.so.1.2.3
  /usr/lib/libappstream.so.1.2.1 moved to /usr/lib/libappstream.so.1.2.3
  /usr/include/appstream/as-locale.h was added

--===============5758142968756958865==--
