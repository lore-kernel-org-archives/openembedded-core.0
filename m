Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 491BCF013F2
	for <webhook@archiver.kernel.org>; Sun, 15 Mar 2026 13:42:12 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28800.1773582115411178817
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Mar 2026 06:42:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Ru3rx+O+;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ChMZEitO;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019cf1bb7e3f-ea2b7f67-b2ea-4171-8c4f-37989b3e293a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1773582122;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=rR9/PR7yORkA9FEqUUF/oZNOyLHsRM4zI7437JMi01M=;
	b=Ru3rx+O+bU5671z0RcympGzAGVtNPFwnxXIDeX5E+SaIvW4zls8VHryLZRlh7l4O
	1vI5UV/Sx97lRaIXjMT1OhsxV7iytIlDXkdDoHIBx5Kbjv0+ggMGomWgBCb02giO/a8
	evxKd2XJsgzCAnlebBELGdBxKujy4Pl+hQXFgSYI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1773582122;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=rR9/PR7yORkA9FEqUUF/oZNOyLHsRM4zI7437JMi01M=;
	b=ChMZEitOlF/BvSFYA6ImqwGQYVPDuRyVTbqGnNVj7He7Rj1zA171s63VBajc7JDS
	4eYByyGNhOzZVGUgLgozqPpvhA4RGz1LonUPduqxAOLELfVH7xTYC0Gweg3hcPJIVBL
	3dDhCul6sVOQIUBCnrfQrzAKQlQ4XKJGGlJGN/N8=
Content-Type: multipart/mixed; boundary="===============3469184640211479323=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] epiphany: upgrading to 50.0 FAILED
Message-ID: <0101019cf1bb7e3f-ea2b7f67-b2ea-4171-8c4f-37989b3e293a-000000@us-west-2.amazonses.com>
Date: Sun, 15 Mar 2026 13:42:02 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.03.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Mar 2026 13:42:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233165

--===============3469184640211479323==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *epiphany* to *50.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-epiphany-upgrade-49.2-50.0.patch
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
From 0a6ba35a5deba0429985612a7b6de8632d5b039f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Mar 2026 10:16:11 +0000
Subject: [PATCH] epiphany: upgrade 49.2 -> 50.0

---
 .../epiphany/{epiphany_49.2.bb => epiphany_50.0.bb}           | 2 +-
 .../files/0002-help-meson.build-disable-the-use-of-yelp.patch | 2 +-
 meta/recipes-gnome/epiphany/files/distributor.patch           | 4 ++--
 meta/recipes-gnome/epiphany/files/migrator.patch              | 4 ++--
 4 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-gnome/epiphany/{epiphany_49.2.bb => epiphany_50.0.bb} (94%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_49.2.bb b/meta/recipes-gnome/epiphany/epiphany_50.0.bb
similarity index 94%
rename from meta/recipes-gnome/epiphany/epiphany_49.2.bb
rename to meta/recipes-gnome/epiphany/epiphany_50.0.bb
index 4c27a6b6c7..3a1df4aa72 100644
--- a/meta/recipes-gnome/epiphany/epiphany_49.2.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_50.0.bb
@@ -32,7 +32,7 @@ SRC_URI += "\
            file://migrator.patch \
            file://distributor.patch \
            "
-SRC_URI[archive.sha256sum] = "b3ba3d68213e87f81f1733e85500c37b82b5938f9009e4fe89994963d5fb2b8e"
+SRC_URI[archive.sha256sum] = "474dc6d0a663e8d890b8433d9b49f83164308d53b7cc8df82626aaf7d4105a3d"
 
 export GI_TYPELIB_PATH = "${STAGING_LIBDIR}/girepository-1.0/"
 
diff --git a/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch b/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
index 6c00ab9b40..674b043b88 100644
--- a/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
+++ b/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
@@ -1,4 +1,4 @@
-From 91045ece41faefbeac14b60d7b19b0c652e586fb Mon Sep 17 00:00:00 2001
+From c445cae392e5bd4f7168be9cad6b5168483eaad4 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 31 Jan 2018 15:50:38 +0200
 Subject: [PATCH] help/meson.build: disable the use of yelp
diff --git a/meta/recipes-gnome/epiphany/files/distributor.patch b/meta/recipes-gnome/epiphany/files/distributor.patch
index 54a3305aaf..e7132ba824 100644
--- a/meta/recipes-gnome/epiphany/files/distributor.patch
+++ b/meta/recipes-gnome/epiphany/files/distributor.patch
@@ -1,4 +1,4 @@
-From 46084da03b5f20423a2946d988c68e9ea9339c9c Mon Sep 17 00:00:00 2001
+From 60499cf12c7a3dd82d79f59c46d86dd68d259574 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Fri, 26 Feb 2021 10:17:52 +0000
 Subject: [PATCH] Don't encode the distro from /etc/os-release into the
@@ -11,7 +11,7 @@ RP 2021/2/26
  1 file changed, 1 insertion(+)
 
 diff --git a/meson.build b/meson.build
-index df0340c..8ec6c79 100644
+index 7c82b56..e39fed0 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -15,6 +15,7 @@ if r.returncode() == 0
diff --git a/meta/recipes-gnome/epiphany/files/migrator.patch b/meta/recipes-gnome/epiphany/files/migrator.patch
index 8ebcdc9991..3514ad6b57 100644
--- a/meta/recipes-gnome/epiphany/files/migrator.patch
+++ b/meta/recipes-gnome/epiphany/files/migrator.patch
@@ -1,4 +1,4 @@
-From ca504370b9aa893ceac21141d8f24e28a474b674 Mon Sep 17 00:00:00 2001
+From bf400fc3fba91a04feafd0454c2769d28aad34b2 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Thu, 25 Feb 2021 14:52:32 +0000
 Subject: [PATCH] epiphany: Fix reproducibility issue
@@ -14,7 +14,7 @@ RP 2021/2/25
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/lib/ephy-profile-utils.c b/lib/ephy-profile-utils.c
-index a2f6181..5218077 100644
+index ea2ea99..13c27c8 100644
 --- a/lib/ephy-profile-utils.c
 +++ b/lib/ephy-profile-utils.c
 @@ -130,10 +130,10 @@ ephy_profile_utils_do_migration (const char *profile_directory,
-- 
2.47.1


--===============3469184640211479323==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-epiphany-upgrade-49.2-50.0.patch"

RnJvbSAwYTZiYTM1YTVkZWJhMDQyOTk4NTYxMmE3YjZkZTg2MzJkNWIwMzlmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgTWFyIDIwMjYgMTA6MTY6MTEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBl
cGlwaGFueTogdXBncmFkZSA0OS4yIC0+IDUwLjAKCi0tLQogLi4uL2VwaXBoYW55L3tlcGlwaGFu
eV80OS4yLmJiID0+IGVwaXBoYW55XzUwLjAuYmJ9ICAgICAgICAgICB8IDIgKy0KIC4uLi9maWxl
cy8wMDAyLWhlbHAtbWVzb24uYnVpbGQtZGlzYWJsZS10aGUtdXNlLW9mLXllbHAucGF0Y2ggfCAy
ICstCiBtZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZmlsZXMvZGlzdHJpYnV0b3IucGF0Y2gg
ICAgICAgICAgIHwgNCArKy0tCiBtZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZmlsZXMvbWln
cmF0b3IucGF0Y2ggICAgICAgICAgICAgIHwgNCArKy0tCiA0IGZpbGVzIGNoYW5nZWQsIDYgaW5z
ZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZ25vbWUvZXBp
cGhhbnkve2VwaXBoYW55XzQ5LjIuYmIgPT4gZXBpcGhhbnlfNTAuMC5iYn0gKDk0JSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZXBpcGhhbnlfNDkuMi5iYiBiL21l
dGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFueS9lcGlwaGFueV81MC4wLmJiCnNpbWlsYXJpdHkgaW5k
ZXggOTQlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFueS9lcGlwaGFueV80
OS4yLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZXBpcGhhbnlfNTAu
MC5iYgppbmRleCA0YzI3YTZiNmM3Li4zYTFkZjRhYTcyIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtZ25vbWUvZXBpcGhhbnkvZXBpcGhhbnlfNDkuMi5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ25v
bWUvZXBpcGhhbnkvZXBpcGhhbnlfNTAuMC5iYgpAQCAtMzIsNyArMzIsNyBAQCBTUkNfVVJJICs9
ICJcCiAgICAgICAgICAgIGZpbGU6Ly9taWdyYXRvci5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6
Ly9kaXN0cmlidXRvci5wYXRjaCBcCiAgICAgICAgICAgICIKLVNSQ19VUklbYXJjaGl2ZS5zaGEy
NTZzdW1dID0gImIzYmEzZDY4MjEzZTg3ZjgxZjE3MzNlODU1MDBjMzdiODJiNTkzOGY5MDA5ZTRm
ZTg5OTk0OTYzZDVmYjJiOGUiCitTUkNfVVJJW2FyY2hpdmUuc2hhMjU2c3VtXSA9ICI0NzRkYzZk
MGE2NjNlOGQ4OTBiODQzM2Q5YjQ5ZjgzMTY0MzA4ZDUzYjdjYzhkZjgyNjI2YWFmN2Q0MTA1YTNk
IgogCiBleHBvcnQgR0lfVFlQRUxJQl9QQVRIID0gIiR7U1RBR0lOR19MSUJESVJ9L2dpcmVwb3Np
dG9yeS0xLjAvIgogCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZmls
ZXMvMDAwMi1oZWxwLW1lc29uLmJ1aWxkLWRpc2FibGUtdGhlLXVzZS1vZi15ZWxwLnBhdGNoIGIv
bWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2ZpbGVzLzAwMDItaGVscC1tZXNvbi5idWlsZC1k
aXNhYmxlLXRoZS11c2Utb2YteWVscC5wYXRjaAppbmRleCA2YzAwYWI5YjQwLi42NzRiMDQzYjg4
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZmlsZXMvMDAwMi1oZWxw
LW1lc29uLmJ1aWxkLWRpc2FibGUtdGhlLXVzZS1vZi15ZWxwLnBhdGNoCisrKyBiL21ldGEvcmVj
aXBlcy1nbm9tZS9lcGlwaGFueS9maWxlcy8wMDAyLWhlbHAtbWVzb24uYnVpbGQtZGlzYWJsZS10
aGUtdXNlLW9mLXllbHAucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDkxMDQ1ZWNlNDFmYWVm
YmVhYzE0YjYwZDdiMTliMGM2NTJlNTg2ZmIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9t
IGM0NDVjYWUzOTJlNWJkNGY3MTY4YmU5Y2FkNmI1MTY4NDgzZWFhZDQgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNv
bT4KIERhdGU6IFdlZCwgMzEgSmFuIDIwMTggMTU6NTA6MzggKzAyMDAKIFN1YmplY3Q6IFtQQVRD
SF0gaGVscC9tZXNvbi5idWlsZDogZGlzYWJsZSB0aGUgdXNlIG9mIHllbHAKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFueS9maWxlcy9kaXN0cmlidXRvci5wYXRjaCBiL21l
dGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFueS9maWxlcy9kaXN0cmlidXRvci5wYXRjaAppbmRleCA1
NGEzMzA1YWFmLi5lNzEzMmJhODI0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ25vbWUvZXBp
cGhhbnkvZmlsZXMvZGlzdHJpYnV0b3IucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWdub21lL2Vw
aXBoYW55L2ZpbGVzL2Rpc3RyaWJ1dG9yLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA0NjA4
NGRhMDNiNWYyMDQyM2EyOTQ2ZDk4OGM2OGU5ZWE5MzM5YzljIE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQorRnJvbSA2MDQ5OWNmMTJjN2EzZGQ4MmQ3OWY1OWM0NmQ4NmRkNjhkMjU5NTc0IE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGll
QGxpbnV4Zm91bmRhdGlvbi5vcmc+CiBEYXRlOiBGcmksIDI2IEZlYiAyMDIxIDEwOjE3OjUyICsw
MDAwCiBTdWJqZWN0OiBbUEFUQ0hdIERvbid0IGVuY29kZSB0aGUgZGlzdHJvIGZyb20gL2V0Yy9v
cy1yZWxlYXNlIGludG8gdGhlCkBAIC0xMSw3ICsxMSw3IEBAIFJQIDIwMjEvMi8yNgogIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQogCiBkaWZmIC0tZ2l0IGEvbWVzb24uYnVpbGQgYi9t
ZXNvbi5idWlsZAotaW5kZXggZGYwMzQwYy4uOGVjNmM3OSAxMDA2NDQKK2luZGV4IDdjODJiNTYu
LmUzOWZlZDAgMTAwNjQ0CiAtLS0gYS9tZXNvbi5idWlsZAogKysrIGIvbWVzb24uYnVpbGQKIEBA
IC0xNSw2ICsxNSw3IEBAIGlmIHIucmV0dXJuY29kZSgpID09IDAKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1nbm9tZS9lcGlwaGFueS9maWxlcy9taWdyYXRvci5wYXRjaCBiL21ldGEvcmVjaXBl
cy1nbm9tZS9lcGlwaGFueS9maWxlcy9taWdyYXRvci5wYXRjaAppbmRleCA4ZWJjZGM5OTkxLi4z
NTE0YWQ2YjU3IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZmlsZXMv
bWlncmF0b3IucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2ZpbGVzL21p
Z3JhdG9yLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBjYTUwNDM3MGI5YWE4OTNjZWFjMjEx
NDFkOGYyNGUyOGE0NzRiNjc0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBiZjQwMGZj
M2ZiYTkxYTA0ZmVhZmQwNDU0YzI3NjlkMjhhYWQzNGIyIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQogRnJvbTogUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5v
cmc+CiBEYXRlOiBUaHUsIDI1IEZlYiAyMDIxIDE0OjUyOjMyICswMDAwCiBTdWJqZWN0OiBbUEFU
Q0hdIGVwaXBoYW55OiBGaXggcmVwcm9kdWNpYmlsaXR5IGlzc3VlCkBAIC0xNCw3ICsxNCw3IEBA
IFJQIDIwMjEvMi8yNQogIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pCiAKIGRpZmYgLS1naXQgYS9saWIvZXBoeS1wcm9maWxlLXV0aWxzLmMgYi9saWIvZXBo
eS1wcm9maWxlLXV0aWxzLmMKLWluZGV4IGEyZjYxODEuLjUyMTgwNzcgMTAwNjQ0CitpbmRleCBl
YTJlYTk5Li4xM2MyN2M4IDEwMDY0NAogLS0tIGEvbGliL2VwaHktcHJvZmlsZS11dGlscy5jCiAr
KysgYi9saWIvZXBoeS1wcm9maWxlLXV0aWxzLmMKIEBAIC0xMzAsMTAgKzEzMCwxMCBAQCBlcGh5
X3Byb2ZpbGVfdXRpbHNfZG9fbWlncmF0aW9uIChjb25zdCBjaGFyICpwcm9maWxlX2RpcmVjdG9y
eSwKLS0gCjIuNDcuMQoK

--===============3469184640211479323==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 950 .bb files complete (0 cached, 950 parsed). 1971 targets, 42 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-ae6f2d2df1ae61b740564d6ea7c65a468b6af248"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:ae6f2d2df1ae61b740564d6ea7c65a468b6af248"
meta-yocto-bsp       
meta-poky            = "master:31e68c7cf6a3686bedbcbdd99056bbd23dda2551"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 496 Local 483 Mirrors 0 Missed 13 Current 1267 (97% match, 99% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 1710 of 1763 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.4.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.86.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.86.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4283 of 4856 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/epiphany/epiphany_50.0.bb:do_recipe_qa)
NOTE: Running task 4547 of 4856 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/epiphany/epiphany_50.0.bb:do_write_config)
NOTE: recipe epiphany-50.0-r0: task do_recipe_qa: Started
NOTE: recipe epiphany-50.0-r0: task do_write_config: Started
NOTE: recipe epiphany-50.0-r0: task do_write_config: Succeeded
NOTE: recipe epiphany-50.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 4837 of 4856 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/epiphany/epiphany_50.0.bb:do_fetch)
NOTE: recipe epiphany-50.0-r0: task do_fetch: Started
NOTE: recipe epiphany-50.0-r0: task do_fetch: Succeeded
NOTE: Running task 4838 of 4856 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/epiphany/epiphany_50.0.bb:do_unpack)
NOTE: Running task 4839 of 4856 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/epiphany/epiphany_50.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe epiphany-50.0-r0: task do_unpack: Started
NOTE: recipe epiphany-50.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe epiphany-50.0-r0: task do_unpack: Succeeded
NOTE: Running task 4840 of 4856 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/epiphany/epiphany_50.0.bb:do_patch)
NOTE: Running task 4841 of 4856 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/epiphany/epiphany_50.0.bb:do_collect_spdx_deps)
NOTE: recipe epiphany-50.0-r0: task do_patch: Started
NOTE: recipe epiphany-50.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe epiphany-50.0-r0: task do_patch: Succeeded
NOTE: Running task 4842 of 4856 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/epiphany/epiphany_50.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 4843 of 4856 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/epiphany/epiphany_50.0.bb:do_populate_lic)
NOTE: recipe epiphany-50.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe epiphany-50.0-r0: task do_populate_lic: Started
NOTE: recipe epiphany-50.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe epiphany-50.0-r0: task do_populate_lic: Succeeded
NOTE: recipe epiphany-50.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe epiphany-50.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4844 of 4856 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/epiphany/epiphany_50.0.bb:do_configure)
NOTE: recipe epiphany-50.0-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu-native_10.2.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/quilt/quilt-native_0.69.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.6.bb:do_populate_sysroot', '/srv/pokybuild/
 yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gcr/gcr_4.4.0.1.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_49.1.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.18.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libadwaita/libadwaita_1.8.4.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build
 /layers/openembedded-core/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libportal/libportal_0.9.1.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/webkitgtk_2.50.4.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libsoup/libsoup_3.6.6.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.10.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-c
 ore/gettext/gettext_1.0.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.4.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.10.1.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/patch/patch_2.8.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/bu
 ild/layers/openembedded-core/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.3.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/blueprint-compiler/blueprint-compiler_0.20.0.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['bluez5', 'openssl', 'base-files', 'base-passwd', 'dbus', 'expat', 'gettext-minimal-native', 'glib-2.0', 'glibc', 'libxcrypt', 'libxml2', 'ncurses', 'readline', 'systemd', 'util-linux-libuuid', 'util-linux', 'zlib', 'binutils-cross-x86_64', 'llvm-tblgen-native', 'llvm', 'cmake-native', 'desktop-file-utils', 'elfutils', 'file', 'gcc-cross-x86_64', 'gcc-runtime', 'libgcc', 'json-c', 'libedit', 'libtool-native', 'm4-native', 'opkg-utils', 'orc', 'python3-setuptools', 'python3', 'qemu-native', 'quilt-native', 'libstd-rs', 'vala', 'bzip2', 'libarchive', 'libidn2', 'lzlib', 'libpam', 'shadow-sysroot', 'shadow', 'texinfo-dummy-native', 'xz', 'zstd', 'gcr', 'gdk-pixbuf', 'gobject-introspection', 'gsettings-desktop-schemas', 'gtk+3', 'gtk4', 'hicolor-icon-theme', 'json-glib', 'libadwaita', 'libdazzle', 'libgudev', 'libhandy', 'libnotify', 'libportal', 'librsvg', 'libsecret', 'libxmlb', 'cairo', 'libdrm', 'fontconfig', 'freetype', 'graphene', 'ha
 rfbuzz', 'libjpeg-turbo', 'libepoxy', 'libglu', 'mesa', 'pango', 'vulkan-headers', 'vulkan-loader', 'wayland-protocols', 'wayland', 'xrandr', 'libice', 'libpciaccess', 'libpthread-stubs', 'libsm', 'libx11', 'libxau', 'libxcb', 'libxcomposite', 'libxcursor', 'libxdamage', 'libxdmcp', 'libxext', 'libxfixes', 'libxft', 'libxi', 'libxinerama', 'libxkbcommon', 'libxrandr', 'libxrender', 'libxshmfence', 'libxt', 'libxtst', 'libxv', 'libxxf86vm', 'pixman', 'xkeyboard-config', 'xtrans', 'xcb-proto', 'xorgproto', 'util-macros', 'kmod', 'linux-libc-headers', 'alsa-lib', 'flac', 'gstreamer1.0-plugins-bad', 'gstreamer1.0-plugins-base', 'gstreamer1.0', 'libogg', 'libpng', 'libsndfile1', 'libtheora', 'tiff', 'libvorbis', 'sbc', 'libwebp', 'libwpe', 'webkitgtk', 'wpebackend-fdo', 'appstream', 'aspell', 'at-spi2-core', 'acl', 'attr', 'bash-completion', 'curl', 'enchant2', 'fribidi', 'gdbm', 'gmp', 'gnutls', 'libtasn1', 'icu', 'iso-codes', 'libcap-ng', 'libcap', 'libffi', 'libgcrypt', 'libgpg-error'
 , 'libical', 'libmicrohttpd', 'libpcre2', 'libpsl', 'libseccomp', 'libsoup', 'libunistring', 'libusb1', 'libxslt', 'libyaml', 'nettle', 'nghttp2', 'p11-kit', 'shared-mime-info', 'sqlite3', 'openssl-native', 'coreutils-native', 'dbus-native', 'expat-native', 'gettext-native', 'glib-2.0-native', 'libxml2-native', 'ncurses-native', 'util-linux-libuuid-native', 'util-linux-native', 'zlib-native', 'cargo-c-native', 'llvm-native', 'desktop-file-utils-native', 'flex-native', 'gnu-config-native', 'libedit-native', 'make-native', 'meson-native', 'ninja-native', 'patch-native', 'patchelf-native', 'perl-native', 'pkgconfig-native', 'pseudo-native', 'python3-build-native', 'python3-docutils-native', 'python3-flit-core-native', 'python3-installer-native', 'python3-packaging-native', 'python3-pygobject-native', 'python3-pyproject-hooks-native', 'python3-setuptools-native', 'python3-wheel-native', 'python3-native', 'cargo-native', 'rust-native', 'vala-native', 'bzip2-native', 'shadow-native', 'unz
 ip-native', 'xz-native', 'zstd-native', 'blueprint-compiler-native', 'gdk-pixbuf-native', 'gobject-introspection-native', 'gtk+3-native', 'librsvg-native', 'cairo-native', 'fontconfig-native', 'freetype-native', 'harfbuzz-native', 'libjpeg-turbo-native', 'pango-native', 'libpthread-stubs-native', 'libx11-native', 'libxau-native', 'libxcb-native', 'libxcomposite-native', 'libxcursor-native', 'libxdamage-native', 'libxdmcp-native', 'libxext-native', 'libxfixes-native', 'libxft-native', 'libxi-native', 'libxrandr-native', 'libxrender-native', 'libxtst-native', 'pixman-native', 'xtrans-native', 'xcb-proto-native', 'xorgproto-native', 'util-macros-native', 'libpng-native', 'at-spi2-core-native', 'attr-native', 'ca-certificates-native', 'curl-native', 'fribidi-native', 'gdbm-native', 'gmp-native', 'icu-native', 'libbsd-native', 'libcap-ng-native', 'libffi-native', 'libmd-native', 'libmpc-native', 'libpcre2-native', 'libssh2-native', 'mpfr-native', 're2c-native', 'shared-mime-info-native',
  'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Ddeveloper_mode=false...
| The Meson build system
| Version: 1.10.1
| Source dir: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/epiphany/50.0/sources/epiphany-50.0
| Build dir: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/epiphany/50.0/build
| Build type: cross build
| Project name: epiphany
| Project version: 50.0
| C compiler for the host machine: x86_64-poky-linux-gcc -m64 -march=x86-64-v3 -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/epiphany/50.0/recipe-sysroot (gcc 15.2.0 "x86_64-poky-linux-gcc (GCC) 15.2.0")
| C linker for the host machine: x86_64-poky-linux-gcc -m64 -march=x86-64-v3 -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/epiphany/50.0/recipe-sysroot ld.bfd 2.46
| C compiler for the build machine: gcc (gcc 14.2.0 "gcc (GCC) 14.2.0")
| C linker for the build machine: gcc ld.bfd 2.43.1.20241111
| Build machine cpu family: x86_64
| Build machine cpu: x86_64
| Host machine cpu family: x86_64
| Host machine cpu: x86_64
| Target machine cpu family: x86_64
| Target machine cpu: x86_64
| Found pkg-config: YES (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/epiphany/50.0/recipe-sysroot-native/usr/bin/pkg-config) 0.29.2
| Run-time dependency iso-codes found: YES 4.20.1
| Run-time dependency cairo found: YES 1.18.4
| Run-time dependency gck-2 found: YES 4.4.0.1
| Run-time dependency gcr-4 found: YES 4.4.0.1
| Run-time dependency gdk-pixbuf-2.0 found: YES 2.44.5
| Run-time dependency gio-2.0 found: YES 2.86.4
| Run-time dependency gio-unix-2.0 found: YES 2.86.4
| Run-time dependency glib-2.0 found: YES 2.86.4
| Dependency granite-7 skipped: feature granite disabled
| Run-time dependency gsettings-desktop-schemas found: YES 49.1
| Run-time dependency gstreamer-1.0 found: YES 1.26.9
| Dependency gtk4 found: NO. Found 4.20.3 but need: '>= 4.21.0'
| Found CMake: NO
| Run-time dependency gtk4 found: NO
| 
| ../sources/epiphany-50.0/meson.build:97:10: ERROR: Dependency lookup for gtk4 with method 'pkgconfig' failed: Invalid version, need 'gtk4' ['>= 4.21.0'] found '4.20.3'.
| 
| A full log can be found at /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/epiphany/50.0/build/meson-logs/meson-log.txt
| 
| Last 10 lines of meson-log.txt:
| Dependency gtk4 found: NO. Found 4.20.3 but need: '>= 4.21.0'
| Dependency lookup for gtk4 with method 'pkgconfig' failed: Invalid version, need 'gtk4' ['>= 4.21.0'] found '4.20.3'.
| CMake binary for host machine is not cached
| CMake binary missing from cross or native file, or env var undefined.
| Default target is not allowed for cross use
| Found CMake: NO
| Dependency lookup for gtk4 with method 'cmake' failed: CMake binary for machine host machine not found. Giving up.
| Run-time dependency gtk4 found: NO
| 
| ../sources/epiphany-50.0/meson.build:97:10: ERROR: Dependency lookup for gtk4 with method 'pkgconfig' failed: Invalid version, need 'gtk4' ['>= 4.21.0'] found '4.20.3'.
| 
| ERROR: meson setup failed
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/epiphany/50.0/temp/run.do_configure.886938:172 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/epiphany/50.0/temp/run.do_configure.886938, line 172
| 	#2: meson_do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/epiphany/50.0/temp/run.do_configure.886938, line 161
| 	#3: do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/epiphany/50.0/temp/run.do_configure.886938, line 148
| 	#4: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/epiphany/50.0/temp/run.do_configure.886938, line 185
NOTE: recipe epiphany-50.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 4844 tasks of which 4834 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260315101546.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260315101546.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/epiphany/epiphany_50.0.bb:do_configure
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/epiphany/50.0/temp/log.do_configure.886938
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: epiphany-50.0-r0 do_configure: meson setup failed
ERROR: epiphany-50.0-r0 do_configure: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/epiphany/50.0/temp/run.do_configure.886938' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/epiphany/50.0/temp/log.do_configure.886938
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/epiphany/epiphany_50.0.bb:do_configure) failed with exit code '1'

--===============3469184640211479323==--

