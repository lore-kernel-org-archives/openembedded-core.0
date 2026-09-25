Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 663F8C98326
	for <webhook@archiver.kernel.org>; Fri, 25 Sep 2026 06:52:58 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2758.1790319177378072491
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Sep 2026 23:52:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=CCTkB+JE;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=OwogCbUp;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101a0d756ab86-e5703565-40d0-4eeb-b6dc-3c894c43303f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1790319176;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=dUm58GT8I8bs3qLMI9+V73HAPho7Xj/KttZLtA1KqIA=;
	b=CCTkB+JEl1y/ZZ4aGyoV2RbIpoqh9Rm7GfM2OjAF6GAUlzeRPHipRNpjZqmeptsh
	5+uE6Y1HUu+WVxz301ho5FGDRN9YT9deP2s/sADt4xCIl4dxtwv9+ufjtfV2ZaZMu1X
	2fG1q/yfl2LygBy9VnWE6gd/L9VgL8JhfnTfAD6w=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1790319176;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=dUm58GT8I8bs3qLMI9+V73HAPho7Xj/KttZLtA1KqIA=;
	b=OwogCbUpbpTCGIUIYnMeHyR9e4FLoYlJmoQHR4zu+NQJj68NEiwAd2NVaEkbkxUF
	zJjolK0ayDAg/lsT/NJVYPLILJoDEEZHprxJKeWdW/zrjHP7tlHTKPPfY4uzblt4lWu
	KDa16wcxqkFwj3zMuHU1AZiiyzT55xWS2PbHOu0U=
Content-Type: multipart/mixed; boundary="===============2707370104857767367=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] epiphany: upgrading to 51.1 SUCCEEDED
Message-ID: <010101a0d756ab86-e5703565-40d0-4eeb-b6dc-3c894c43303f-000000@us-west-2.amazonses.com>
Date: Fri, 25 Sep 2026 06:52:56 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.25-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Sep 2026 06:52:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246603

--===============2707370104857767367==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *epiphany* to *51.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-epiphany-upgrade-51.0-51.1.patch
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
From 007b0a46e4dac4fec99db30e5b6f6066ad500ba9 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 25 Sep 2026 06:52:50 +0000
Subject: [PATCH] epiphany: upgrade 51.0 -> 51.1

51.1 - September 24, 2026
=========================
---
 .../epiphany/{epiphany_51.0.bb => epiphany_51.1.bb}           | 2 +-
 .../files/0002-help-meson.build-disable-the-use-of-yelp.patch | 2 +-
 meta/recipes-gnome/epiphany/files/distributor.patch           | 4 ++--
 meta/recipes-gnome/epiphany/files/migrator.patch              | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-gnome/epiphany/{epiphany_51.0.bb => epiphany_51.1.bb} (94%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_51.0.bb b/meta/recipes-gnome/epiphany/epiphany_51.1.bb
similarity index 94%
rename from meta/recipes-gnome/epiphany/epiphany_51.0.bb
rename to meta/recipes-gnome/epiphany/epiphany_51.1.bb
index 63ec9bb100..cf1f69dfd2 100644
--- a/meta/recipes-gnome/epiphany/epiphany_51.0.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_51.1.bb
@@ -32,7 +32,7 @@ SRC_URI += "\
            file://migrator.patch \
            file://distributor.patch \
            "
-SRC_URI[archive.sha256sum] = "abaf33576462030c65bb963a56300a7786e7d75834f1c90a9dffda873835c33d"
+SRC_URI[archive.sha256sum] = "beb93b3b86b763092a1175b6e505789b7613071c0dc1ad56cac1979fe879e9dd"
 
 export GI_TYPELIB_PATH = "${STAGING_LIBDIR}/girepository-1.0/"
 
diff --git a/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch b/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
index bdb06e407b..b697b5f640 100644
--- a/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
+++ b/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
@@ -1,4 +1,4 @@
-From 2bb52be1e80d1f4693a383be8270e80ef1d9586a Mon Sep 17 00:00:00 2001
+From 20c45cb379ee910b89175019388df1a63b01c0d4 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 31 Jan 2018 15:50:38 +0200
 Subject: [PATCH] help/meson.build: disable the use of yelp
diff --git a/meta/recipes-gnome/epiphany/files/distributor.patch b/meta/recipes-gnome/epiphany/files/distributor.patch
index 8677f1558c..28a961323a 100644
--- a/meta/recipes-gnome/epiphany/files/distributor.patch
+++ b/meta/recipes-gnome/epiphany/files/distributor.patch
@@ -1,4 +1,4 @@
-From 2f52672597ab74cb17e41d308f8d9934c25d8fc0 Mon Sep 17 00:00:00 2001
+From 82196d415819d517d8cba2142600be279e499540 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Fri, 26 Feb 2021 10:17:52 +0000
 Subject: [PATCH] Don't encode the distro from /etc/os-release into the
@@ -11,7 +11,7 @@ RP 2021/2/26
  1 file changed, 1 insertion(+)
 
 diff --git a/meson.build b/meson.build
-index 8aec3cf..4a06ab6 100644
+index 65324e5..2e70ef0 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -15,6 +15,7 @@ if r.returncode() == 0
diff --git a/meta/recipes-gnome/epiphany/files/migrator.patch b/meta/recipes-gnome/epiphany/files/migrator.patch
index dcc162040a..491ff35ea2 100644
--- a/meta/recipes-gnome/epiphany/files/migrator.patch
+++ b/meta/recipes-gnome/epiphany/files/migrator.patch
@@ -1,4 +1,4 @@
-From e336c2dd1368aff496a6ba01e2ca9ca7e88860a2 Mon Sep 17 00:00:00 2001
+From 84c26f054ab3520d06febc2e8a99502d2cff98cf Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Thu, 25 Feb 2021 14:52:32 +0000
 Subject: [PATCH] epiphany: Fix reproducibility issue
-- 
2.47.1


--===============2707370104857767367==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-nn: PKGSIZE changed from 59558 to 93763 (+57%)

--===============2707370104857767367==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="epiphany-changelog.txt"

51.1 - September 24, 2026
=========================

--===============2707370104857767367==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-epiphany-upgrade-51.0-51.1.patch"

RnJvbSAwMDdiMGE0NmU0ZGFjNGZlYzk5ZGIzMGU1YjZmNjA2NmFkNTAwYmE5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMjUgU2VwIDIwMjYgMDY6NTI6NTAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBl
cGlwaGFueTogdXBncmFkZSA1MS4wIC0+IDUxLjEKCjUxLjEgLSBTZXB0ZW1iZXIgMjQsIDIwMjYK
PT09PT09PT09PT09PT09PT09PT09PT09PQotLS0KIC4uLi9lcGlwaGFueS97ZXBpcGhhbnlfNTEu
MC5iYiA9PiBlcGlwaGFueV81MS4xLmJifSAgICAgICAgICAgfCAyICstCiAuLi4vZmlsZXMvMDAw
Mi1oZWxwLW1lc29uLmJ1aWxkLWRpc2FibGUtdGhlLXVzZS1vZi15ZWxwLnBhdGNoIHwgMiArLQog
bWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2ZpbGVzL2Rpc3RyaWJ1dG9yLnBhdGNoICAgICAg
ICAgICB8IDQgKystLQogbWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2ZpbGVzL21pZ3JhdG9y
LnBhdGNoICAgICAgICAgICAgICB8IDIgKy0KIDQgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25z
KCspLCA1IGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFueS97
ZXBpcGhhbnlfNTEuMC5iYiA9PiBlcGlwaGFueV81MS4xLmJifSAoOTQlKQoKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFueS9lcGlwaGFueV81MS4wLmJiIGIvbWV0YS9yZWNp
cGVzLWdub21lL2VwaXBoYW55L2VwaXBoYW55XzUxLjEuYmIKc2ltaWxhcml0eSBpbmRleCA5NCUK
cmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2VwaXBoYW55XzUxLjAuYmIK
cmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFueS9lcGlwaGFueV81MS4xLmJiCmlu
ZGV4IDYzZWM5YmIxMDAuLmNmMWY2OWRmZDIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1nbm9t
ZS9lcGlwaGFueS9lcGlwaGFueV81MS4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1nbm9tZS9lcGlw
aGFueS9lcGlwaGFueV81MS4xLmJiCkBAIC0zMiw3ICszMiw3IEBAIFNSQ19VUkkgKz0gIlwKICAg
ICAgICAgICAgZmlsZTovL21pZ3JhdG9yLnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovL2Rpc3Ry
aWJ1dG9yLnBhdGNoIFwKICAgICAgICAgICAgIgotU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0g
PSAiYWJhZjMzNTc2NDYyMDMwYzY1YmI5NjNhNTYzMDBhNzc4NmU3ZDc1ODM0ZjFjOTBhOWRmZmRh
ODczODM1YzMzZCIKK1NSQ19VUklbYXJjaGl2ZS5zaGEyNTZzdW1dID0gImJlYjkzYjNiODZiNzYz
MDkyYTExNzViNmU1MDU3ODliNzYxMzA3MWMwZGMxYWQ1NmNhYzE5NzlmZTg3OWU5ZGQiCiAKIGV4
cG9ydCBHSV9UWVBFTElCX1BBVEggPSAiJHtTVEFHSU5HX0xJQkRJUn0vZ2lyZXBvc2l0b3J5LTEu
MC8iCiAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFueS9maWxlcy8wMDAy
LWhlbHAtbWVzb24uYnVpbGQtZGlzYWJsZS10aGUtdXNlLW9mLXllbHAucGF0Y2ggYi9tZXRhL3Jl
Y2lwZXMtZ25vbWUvZXBpcGhhbnkvZmlsZXMvMDAwMi1oZWxwLW1lc29uLmJ1aWxkLWRpc2FibGUt
dGhlLXVzZS1vZi15ZWxwLnBhdGNoCmluZGV4IGJkYjA2ZTQwN2IuLmI2OTdiNWY2NDAgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFueS9maWxlcy8wMDAyLWhlbHAtbWVzb24u
YnVpbGQtZGlzYWJsZS10aGUtdXNlLW9mLXllbHAucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWdu
b21lL2VwaXBoYW55L2ZpbGVzLzAwMDItaGVscC1tZXNvbi5idWlsZC1kaXNhYmxlLXRoZS11c2Ut
b2YteWVscC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMmJiNTJiZTFlODBkMWY0NjkzYTM4
M2JlODI3MGU4MGVmMWQ5NTg2YSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMjBjNDVj
YjM3OWVlOTEwYjg5MTc1MDE5Mzg4ZGYxYTYzYjAxYzBkNCBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgogRGF0
ZTogV2VkLCAzMSBKYW4gMjAxOCAxNTo1MDozOCArMDIwMAogU3ViamVjdDogW1BBVENIXSBoZWxw
L21lc29uLmJ1aWxkOiBkaXNhYmxlIHRoZSB1c2Ugb2YgeWVscApkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWdub21lL2VwaXBoYW55L2ZpbGVzL2Rpc3RyaWJ1dG9yLnBhdGNoIGIvbWV0YS9yZWNp
cGVzLWdub21lL2VwaXBoYW55L2ZpbGVzL2Rpc3RyaWJ1dG9yLnBhdGNoCmluZGV4IDg2NzdmMTU1
OGMuLjI4YTk2MTMyM2EgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFueS9m
aWxlcy9kaXN0cmlidXRvci5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkv
ZmlsZXMvZGlzdHJpYnV0b3IucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDJmNTI2NzI1OTdh
Yjc0Y2IxN2U0MWQzMDhmOGQ5OTM0YzI1ZDhmYzAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitG
cm9tIDgyMTk2ZDQxNTgxOWQ1MTdkOGNiYTIxNDI2MDBiZTI3OWU0OTk1NDAgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCiBGcm9tOiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGludXhm
b3VuZGF0aW9uLm9yZz4KIERhdGU6IEZyaSwgMjYgRmViIDIwMjEgMTA6MTc6NTIgKzAwMDAKIFN1
YmplY3Q6IFtQQVRDSF0gRG9uJ3QgZW5jb2RlIHRoZSBkaXN0cm8gZnJvbSAvZXRjL29zLXJlbGVh
c2UgaW50byB0aGUKQEAgLTExLDcgKzExLDcgQEAgUlAgMjAyMS8yLzI2CiAgMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspCiAKIGRpZmYgLS1naXQgYS9tZXNvbi5idWlsZCBiL21lc29uLmJ1
aWxkCi1pbmRleCA4YWVjM2NmLi40YTA2YWI2IDEwMDY0NAoraW5kZXggNjUzMjRlNS4uMmU3MGVm
MCAxMDA2NDQKIC0tLSBhL21lc29uLmJ1aWxkCiArKysgYi9tZXNvbi5idWlsZAogQEAgLTE1LDYg
KzE1LDcgQEAgaWYgci5yZXR1cm5jb2RlKCkgPT0gMApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWdub21lL2VwaXBoYW55L2ZpbGVzL21pZ3JhdG9yLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWdub21l
L2VwaXBoYW55L2ZpbGVzL21pZ3JhdG9yLnBhdGNoCmluZGV4IGRjYzE2MjA0MGEuLjQ5MWZmMzVl
YTIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFueS9maWxlcy9taWdyYXRv
ci5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZmlsZXMvbWlncmF0b3Iu
cGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGUzMzZjMmRkMTM2OGFmZjQ5NmE2YmEwMWUyY2E5
Y2E3ZTg4ODYwYTIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDg0YzI2ZjA1NGFiMzUy
MGQwNmZlYmMyZThhOTk1MDJkMmNmZjk4Y2YgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9t
OiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4KIERh
dGU6IFRodSwgMjUgRmViIDIwMjEgMTQ6NTI6MzIgKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0gZXBp
cGhhbnk6IEZpeCByZXByb2R1Y2liaWxpdHkgaXNzdWUKLS0gCjIuNDcuMQoK

--===============2707370104857767367==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/epiphany/epiphany-dbg: PKGSIZE changed from 10988872 to 10990824 (+0%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-dbg: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-dbg: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-dev: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-dev: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-doc: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-doc: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ab: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ab: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-af: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-af: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-am: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-am: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-an: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-an: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ar: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ar: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-as: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-as: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ast: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ast: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-az: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-az: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-be+latin: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-be+latin: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-be: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-be: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-bg: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-bg: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-bn-in: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-bn-in: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-bn: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-bn: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-br: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-br: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-bs: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-bs: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ca+valencia: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ca+valencia: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ca: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ca: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ckb: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ckb: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-cs: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-cs: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-cy: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-cy: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-da: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-da: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-de: PKGSIZE changed from 101152 to 100925 (-0%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-de: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-de: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-dz: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-dz: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-el: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-el: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-en+shaw: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-en+shaw: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-en-ca: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-en-ca: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-en-gb: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-en-gb: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-eo: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-eo: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-es: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-es: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-et: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-et: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-eu: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-eu: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-fa: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-fa: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-fi: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-fi: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-fr: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-fr: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-fur: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-fur: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-fy: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-fy: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ga: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ga: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-gl: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-gl: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-gu: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-gu: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-gv: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-gv: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-he: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-he: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-hi: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-hi: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-hr: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-hr: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-hu: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-hu: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-hy: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-hy: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ia: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ia: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-id: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-id: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ie: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ie: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ig: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ig: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-is: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-is: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-it: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-it: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ja: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ja: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ka: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ka: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-kab: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-kab: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-kk: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-kk: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-km: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-km: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-kn: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-kn: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ko: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ko: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ku: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ku: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-li: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-li: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-lo: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-lo: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-lt: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-lt: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-lv: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-lv: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-mai: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-mai: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-mg: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-mg: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-mi: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-mi: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-mk: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-mk: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ml: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ml: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-mn: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-mn: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-mr: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-mr: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ms: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ms: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-my: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-my: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-nb: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-nb: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-nds: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-nds: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ne: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ne: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-nl: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-nl: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-nn: PKGSIZE changed from 59558 to 93763 (+57%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-nn: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-nn: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-oc: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-oc: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-or: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-or: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-pa: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-pa: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-pl: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-pl: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ps: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ps: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-pt-br: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-pt-br: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-pt: PKGSIZE changed from 99449 to 99230 (-0%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-pt: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-pt: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ro: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ro: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ru: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ru: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-rw: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-rw: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-si: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-si: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-sk: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-sk: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-sl: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-sl: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-sq: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-sq: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-sr+latin: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-sr+latin: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-sr: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-sr: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-sv: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-sv: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ta: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ta: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-te: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-te: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-tg: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-tg: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-th: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-th: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-tk: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-tk: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-tr: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-tr: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ug: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ug: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-uk: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-uk: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-uz+cyrillic: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-uz+cyrillic: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-uz: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-uz: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-vi: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-vi: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-wa: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-wa: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-yo: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-yo: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-zh-cn: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-zh-cn: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-zh-hk: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-zh-hk: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-zh-tw: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-zh-tw: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-src: PKGSIZE changed from 32692565 to 32693968 (+0%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-src: FILELIST: directory renamed /usr/src/debug/epiphany/51.0/lib -> /usr/src/debug/epiphany/51.1/lib, directory renamed /usr/src/debug/epiphany/51.0/src/search-provider -> /usr/src/debug/epiphany/51.1/src/search-provider, directory renamed /usr/src/debug/epiphany/51.0/lib/sync -> /usr/src/debug/epiphany/51.1/lib/sync, directory renamed /usr/src/debug/epiphany/51.0/src/webapp-provider -> /usr/src/debug/epiphany/51.1/src/webapp-provider, directory renamed /usr/src/debug/epiphany/51.0/embed -> /usr/src/debug/epiphany/51.1/embed, directory renamed /usr/src/debug/epiphany/51.0/src/bookmarks -> /usr/src/debug/epiphany/51.1/src/bookmarks, directory renamed /usr/src/debug/epiphany/51.0/third-party -> /usr/src/debug/epiphany/51.1/third-party, directory renamed /usr/src/debug/epiphany/51.0/embed/web-process-extension -> /usr/src/debug/epiphany/51.1/embed/web-process-extension, directory renamed /usr/src/debug/epiphany/51.0/lib/contrib -> /usr/sr
 c/debug/epiphany/51.1/lib/contrib, directory renamed /usr/src/debug/epiphany/51.0/lib/sync/debug -> /usr/src/debug/epiphany/51.1/lib/sync/debug, directory renamed /usr/src/debug/epiphany/51.0/src/webextension -> /usr/src/debug/epiphany/51.1/src/webextension, directory renamed /usr/src/debug/epiphany/51.0/lib/autofill -> /usr/src/debug/epiphany/51.1/lib/autofill, directory renamed /usr/src/debug/epiphany/51.0/lib/history -> /usr/src/debug/epiphany/51.1/lib/history, directory renamed /usr/src/debug/epiphany/51.0/src -> /usr/src/debug/epiphany/51.1/src, directory renamed /usr/src/debug/epiphany/51.0/src/webextension/api -> /usr/src/debug/epiphany/51.1/src/webextension/api, directory renamed /usr/src/debug/epiphany/51.0/src/preferences -> /usr/src/debug/epiphany/51.1/src/preferences, directory renamed /usr/src/debug/epiphany/51.0/third-party/gvdb -> /usr/src/debug/epiphany/51.1/third-party/gvdb, directory renamed /usr/src/debug/epiphany/51.0/src/profile-migrator -> /usr/src/debug/epipha
 ny/51.1/src/profile-migrator
packages/x86-64-v3-poky-linux/epiphany/epiphany-src: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-src: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-staticdev: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany-staticdev: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany: PKGSIZE changed from 6704022 to 6719808 (+0%)
packages/x86-64-v3-poky-linux/epiphany/epiphany: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany/epiphany: PKGV changed from 51.0 [default] to 51.1 [default]
packages/x86-64-v3-poky-linux/epiphany: SRC_URI changed from "https://download.gnome.org/sources//epiphany/51/epiphany-51.0.tar.xz;name=archive file://0002-help-meson.build-disable-the-use-of-yelp.patch file://migrator.patch file://distributor.patch" to "https://download.gnome.org/sources//epiphany/51/epiphany-51.1.tar.xz;name=archive file://0002-help-meson.build-disable-the-use-of-yelp.patch file://migrator.patch file://distributor.patch"
packages/x86-64-v3-poky-linux/epiphany: PV changed from "51.0" to "51.1"
packages/x86-64-v3-poky-linux/epiphany: PKGV changed from 51.0 [default] to 51.1 [default]

--===============2707370104857767367==--

