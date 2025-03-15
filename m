Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9083CC369B5
	for <webhook@archiver.kernel.org>; Sat, 15 Mar 2025 14:18:32 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.10346.1742048306930262152
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Mar 2025 07:18:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=jiKtoHko;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=sqDduHAy;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101959a2ba474-e3ce52f1-8f60-4545-8723-9552b493374f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1742048306;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=WRf8HBU7Cr5NDuOnlupoN4n6b6liuBialAa9EAKXQvQ=;
	b=jiKtoHkozk03q7zuNX+9fESKn4QgY5kWklOUMkcFXD4+a36mJkEwDjYHJc2oHsOD
	Y9aI5r4k4kQfWQfujSmUSWWnCO8rHQ58k7DtC70QwN7xtxgS2Ser6OiQCAd/vR5MSOn
	Mw228yu0uBadRMCSJSnZT4uIgmfuCiSW+tSQ8RLg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1742048306;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=WRf8HBU7Cr5NDuOnlupoN4n6b6liuBialAa9EAKXQvQ=;
	b=sqDduHAyDJOxHHvqotzA9R+re1N9TaRP/8yxILFkuTIEMC1v6TL1CVAVBGRN6Tc6
	vZ255u84J+kZ2YuNgO3xpbNNuc2iho+8wCMmEVhPAApgEpNJUvjNq6r88lDvfPi/lP7
	wZT2ZYCbs9hviOb5KBiPunyWlHdAJRAihe9/Tu4o=
Content-Type: multipart/mixed; boundary="===============9103620227682877199=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] epiphany: upgrading to 48.0 SUCCEEDED
Message-ID: <010101959a2ba474-e3ce52f1-8f60-4545-8723-9552b493374f-000000@us-west-2.amazonses.com>
Date: Sat, 15 Mar 2025 14:18:26 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.03.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Mar 2025 14:18:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212934

--===============9103620227682877199==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *epiphany* to *48.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-epiphany-upgrade-47.3.1-48.0.patch
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
From 7bb8fb4e5d61a91a460b7d7d83dfbf31bccd7c64 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Mar 2025 11:34:30 +0000
Subject: [PATCH] epiphany: upgrade 47.3.1 -> 48.0

---
 .../epiphany/{epiphany_47.3.1.bb => epiphany_48.0.bb}         | 2 +-
 .../files/0002-help-meson.build-disable-the-use-of-yelp.patch | 2 +-
 meta/recipes-gnome/epiphany/files/distributor.patch           | 4 ++--
 meta/recipes-gnome/epiphany/files/migrator.patch              | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-gnome/epiphany/{epiphany_47.3.1.bb => epiphany_48.0.bb} (94%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_47.3.1.bb b/meta/recipes-gnome/epiphany/epiphany_48.0.bb
similarity index 94%
rename from meta/recipes-gnome/epiphany/epiphany_47.3.1.bb
rename to meta/recipes-gnome/epiphany/epiphany_48.0.bb
index d55369f12b..9eff56df3a 100644
--- a/meta/recipes-gnome/epiphany/epiphany_47.3.1.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_48.0.bb
@@ -31,7 +31,7 @@ SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@oe.utils.trim_version("${PV}", 1)}/${GN
            file://migrator.patch \
            file://distributor.patch \
            "
-SRC_URI[archive.sha256sum] = "795d7b81f18b7487d9e9bfc0cb2d68a893d2200f45f9397cd42cb3392b2081a9"
+SRC_URI[archive.sha256sum] = "c9d1f6dffbad03b0916436901c770da302879ca60a636d2b72b25b142ec05f80"
 
 # Developer mode enables debugging
 PACKAGECONFIG[developer-mode] = "-Ddeveloper_mode=true,-Ddeveloper_mode=false"
diff --git a/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch b/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
index 361d857120..929e33b015 100644
--- a/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
+++ b/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
@@ -1,4 +1,4 @@
-From 5377cbe00b82a873dfa623d2c2c539357b05a05d Mon Sep 17 00:00:00 2001
+From 165ef2bf636c170d81576f7d3e6348fc3d781821 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 31 Jan 2018 15:50:38 +0200
 Subject: [PATCH] help/meson.build: disable the use of yelp
diff --git a/meta/recipes-gnome/epiphany/files/distributor.patch b/meta/recipes-gnome/epiphany/files/distributor.patch
index cb930b4c85..dac4855750 100644
--- a/meta/recipes-gnome/epiphany/files/distributor.patch
+++ b/meta/recipes-gnome/epiphany/files/distributor.patch
@@ -1,4 +1,4 @@
-From 47db432ad98d74ab61bdb0b1ff07fe0e17761020 Mon Sep 17 00:00:00 2001
+From c43bbbb4154bb9686756297a7e2eecaa72bb1e9f Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Fri, 26 Feb 2021 10:17:52 +0000
 Subject: [PATCH] Don't encode the distro from /etc/os-release into the
@@ -11,7 +11,7 @@ RP 2021/2/26
  1 file changed, 1 insertion(+)
 
 diff --git a/meson.build b/meson.build
-index 3c08643..0f465af 100644
+index 96554b7..f5c9727 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -15,6 +15,7 @@ if r.returncode() == 0
diff --git a/meta/recipes-gnome/epiphany/files/migrator.patch b/meta/recipes-gnome/epiphany/files/migrator.patch
index d8399b90d5..5407d893d6 100644
--- a/meta/recipes-gnome/epiphany/files/migrator.patch
+++ b/meta/recipes-gnome/epiphany/files/migrator.patch
@@ -1,4 +1,4 @@
-From c6b3236266d2162912ca6e7a0916186f6f33e110 Mon Sep 17 00:00:00 2001
+From 4c5f6b0b44b959f0156cb74f76b2db46a0042c4a Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Thu, 25 Feb 2021 14:52:32 +0000
 Subject: [PATCH] epiphany: Fix reproducibility issue
-- 
2.44.1


--===============9103620227682877199==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-epiphany-upgrade-47.3.1-48.0.patch"

RnJvbSA3YmI4ZmI0ZTVkNjFhOTFhNDYwYjdkN2Q4M2RmYmYzMWJjY2Q3YzY0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgTWFyIDIwMjUgMTE6MzQ6MzAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBl
cGlwaGFueTogdXBncmFkZSA0Ny4zLjEgLT4gNDguMAoKLS0tCiAuLi4vZXBpcGhhbnkve2VwaXBo
YW55XzQ3LjMuMS5iYiA9PiBlcGlwaGFueV80OC4wLmJifSAgICAgICAgIHwgMiArLQogLi4uL2Zp
bGVzLzAwMDItaGVscC1tZXNvbi5idWlsZC1kaXNhYmxlLXRoZS11c2Utb2YteWVscC5wYXRjaCB8
IDIgKy0KIG1ldGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFueS9maWxlcy9kaXN0cmlidXRvci5wYXRj
aCAgICAgICAgICAgfCA0ICsrLS0KIG1ldGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFueS9maWxlcy9t
aWdyYXRvci5wYXRjaCAgICAgICAgICAgICAgfCAyICstCiA0IGZpbGVzIGNoYW5nZWQsIDUgaW5z
ZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZ25vbWUvZXBp
cGhhbnkve2VwaXBoYW55XzQ3LjMuMS5iYiA9PiBlcGlwaGFueV80OC4wLmJifSAoOTQlKQoKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFueS9lcGlwaGFueV80Ny4zLjEuYmIg
Yi9tZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZXBpcGhhbnlfNDguMC5iYgpzaW1pbGFyaXR5
IGluZGV4IDk0JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZXBpcGhh
bnlfNDcuMy4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZXBpcGhh
bnlfNDguMC5iYgppbmRleCBkNTUzNjlmMTJiLi45ZWZmNTZkZjNhIDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZXBpcGhhbnlfNDcuMy4xLmJiCisrKyBiL21ldGEvcmVj
aXBlcy1nbm9tZS9lcGlwaGFueS9lcGlwaGFueV80OC4wLmJiCkBAIC0zMSw3ICszMSw3IEBAIFNS
Q19VUkkgPSAiJHtHTk9NRV9NSVJST1J9LyR7R05PTUVCTn0vJHtAb2UudXRpbHMudHJpbV92ZXJz
aW9uKCIke1BWfSIsIDEpfS8ke0dOCiAgICAgICAgICAgIGZpbGU6Ly9taWdyYXRvci5wYXRjaCBc
CiAgICAgICAgICAgIGZpbGU6Ly9kaXN0cmlidXRvci5wYXRjaCBcCiAgICAgICAgICAgICIKLVNS
Q19VUklbYXJjaGl2ZS5zaGEyNTZzdW1dID0gIjc5NWQ3YjgxZjE4Yjc0ODdkOWU5YmZjMGNiMmQ2
OGE4OTNkMjIwMGY0NWY5Mzk3Y2Q0MmNiMzM5MmIyMDgxYTkiCitTUkNfVVJJW2FyY2hpdmUuc2hh
MjU2c3VtXSA9ICJjOWQxZjZkZmZiYWQwM2IwOTE2NDM2OTAxYzc3MGRhMzAyODc5Y2E2MGE2MzZk
MmI3MmIyNWIxNDJlYzA1ZjgwIgogCiAjIERldmVsb3BlciBtb2RlIGVuYWJsZXMgZGVidWdnaW5n
CiBQQUNLQUdFQ09ORklHW2RldmVsb3Blci1tb2RlXSA9ICItRGRldmVsb3Blcl9tb2RlPXRydWUs
LURkZXZlbG9wZXJfbW9kZT1mYWxzZSIKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1nbm9tZS9l
cGlwaGFueS9maWxlcy8wMDAyLWhlbHAtbWVzb24uYnVpbGQtZGlzYWJsZS10aGUtdXNlLW9mLXll
bHAucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZmlsZXMvMDAwMi1oZWxwLW1l
c29uLmJ1aWxkLWRpc2FibGUtdGhlLXVzZS1vZi15ZWxwLnBhdGNoCmluZGV4IDM2MWQ4NTcxMjAu
LjkyOWUzM2IwMTUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFueS9maWxl
cy8wMDAyLWhlbHAtbWVzb24uYnVpbGQtZGlzYWJsZS10aGUtdXNlLW9mLXllbHAucGF0Y2gKKysr
IGIvbWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2ZpbGVzLzAwMDItaGVscC1tZXNvbi5idWls
ZC1kaXNhYmxlLXRoZS11c2Utb2YteWVscC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNTM3
N2NiZTAwYjgyYTg3M2RmYTYyM2QyYzJjNTM5MzU3YjA1YTA1ZCBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKK0Zyb20gMTY1ZWYyYmY2MzZjMTcwZDgxNTc2ZjdkM2U2MzQ4ZmMzZDc4MTgyMSBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2
aW5AZ21haWwuY29tPgogRGF0ZTogV2VkLCAzMSBKYW4gMjAxOCAxNTo1MDozOCArMDIwMAogU3Vi
amVjdDogW1BBVENIXSBoZWxwL21lc29uLmJ1aWxkOiBkaXNhYmxlIHRoZSB1c2Ugb2YgeWVscApk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2ZpbGVzL2Rpc3RyaWJ1dG9y
LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2ZpbGVzL2Rpc3RyaWJ1dG9yLnBh
dGNoCmluZGV4IGNiOTMwYjRjODUuLmRhYzQ4NTU3NTAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1nbm9tZS9lcGlwaGFueS9maWxlcy9kaXN0cmlidXRvci5wYXRjaAorKysgYi9tZXRhL3JlY2lw
ZXMtZ25vbWUvZXBpcGhhbnkvZmlsZXMvZGlzdHJpYnV0b3IucGF0Y2gKQEAgLTEsNCArMSw0IEBA
Ci1Gcm9tIDQ3ZGI0MzJhZDk4ZDc0YWI2MWJkYjBiMWZmMDdmZTBlMTc3NjEwMjAgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCitGcm9tIGM0M2JiYmI0MTU0YmI5Njg2NzU2Mjk3YTdlMmVlY2FhNzJi
YjFlOWYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBSaWNoYXJkIFB1cmRpZSA8cmlj
aGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4KIERhdGU6IEZyaSwgMjYgRmViIDIwMjEg
MTA6MTc6NTIgKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0gRG9uJ3QgZW5jb2RlIHRoZSBkaXN0cm8g
ZnJvbSAvZXRjL29zLXJlbGVhc2UgaW50byB0aGUKQEAgLTExLDcgKzExLDcgQEAgUlAgMjAyMS8y
LzI2CiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCiAKIGRpZmYgLS1naXQgYS9tZXNv
bi5idWlsZCBiL21lc29uLmJ1aWxkCi1pbmRleCAzYzA4NjQzLi4wZjQ2NWFmIDEwMDY0NAoraW5k
ZXggOTY1NTRiNy4uZjVjOTcyNyAxMDA2NDQKIC0tLSBhL21lc29uLmJ1aWxkCiArKysgYi9tZXNv
bi5idWlsZAogQEAgLTE1LDYgKzE1LDcgQEAgaWYgci5yZXR1cm5jb2RlKCkgPT0gMApkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2ZpbGVzL21pZ3JhdG9yLnBhdGNoIGIv
bWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2ZpbGVzL21pZ3JhdG9yLnBhdGNoCmluZGV4IGQ4
Mzk5YjkwZDUuLjU0MDdkODkzZDYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1nbm9tZS9lcGlw
aGFueS9maWxlcy9taWdyYXRvci5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhh
bnkvZmlsZXMvbWlncmF0b3IucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGM2YjMyMzYyNjZk
MjE2MjkxMmNhNmU3YTA5MTYxODZmNmYzM2UxMTAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitG
cm9tIDRjNWY2YjBiNDRiOTU5ZjAxNTZjYjc0Zjc2YjJkYjQ2YTAwNDJjNGEgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCiBGcm9tOiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGludXhm
b3VuZGF0aW9uLm9yZz4KIERhdGU6IFRodSwgMjUgRmViIDIwMjEgMTQ6NTI6MzIgKzAwMDAKIFN1
YmplY3Q6IFtQQVRDSF0gZXBpcGhhbnk6IEZpeCByZXByb2R1Y2liaWxpdHkgaXNzdWUKLS0gCjIu
NDQuMQoK

--===============9103620227682877199==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 923 .bb files complete (0 cached, 923 parsed). 1885 targets, 50 skipped, 0 masked, 0 errors.
Removing 153 recipes from the core2-64 sysroot...done.
Removing 162 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:069bfa23b8eab20df511abbc0aa7d69ff6e93916"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1205 Local 1056 Mirrors 0 Missed 149 Current 485 (87% match, 91% complete)
Removing 6 stale sstate objects for arch qemux86_64...done.
Removing 7 stale sstate objects for arch x86_64...done.
Removing 4 stale sstate objects for arch allarch...done.
NOTE: Executing Tasks
NOTE: Running setscene task 518 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_48.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 621 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 631 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gnome/adwaita-icon-theme_47.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 635 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 638 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 643 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_24.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 644 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 645 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dbusmock_0.33.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 647 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 650 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 672 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 673 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 676 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/aspell/aspell_0.60.8.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 679 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 684 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/p11-kit/p11-kit_0.25.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 686 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_create_spdx_setscene)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Started
NOTE: recipe tzdata-2025a-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe epiphany-48.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe adwaita-icon-theme-47.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-dbusmock-0.33.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-packaging-24.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libyaml-0.2.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.10.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libarchive-3.7.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe aspell-0.60.8.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe coreutils-9.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe p11-kit-0.25.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe epiphany-48.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe adwaita-icon-theme-47.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe nettle-3.10.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.7.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxt-1_1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe aspell-0.60.8.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 691 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_populate_sysroot_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 693 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gnome/adwaita-icon-theme_47.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 694 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.42.bb:do_create_spdx_setscene)
NOTE: Running setscene task 696 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.12.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 697 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpsl/libpsl_0.21.5.bb:do_create_spdx_setscene)
NOTE: recipe python3-dbusmock-0.33.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe p11-kit-0.25.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 702 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-packaging-24.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tzdata-2025a-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 705 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 707 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 709 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.18.bb:do_create_spdx_setscene)
NOTE: Running setscene task 712 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 717 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.65.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 719 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 722 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 724 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_create_spdx_setscene)
NOTE: recipe nettle-3.10.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxslt-1.1.42-r0: task do_create_spdx_setscene: Started
NOTE: recipe adwaita-icon-theme-47.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpsl-0.21.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe curl-8.12.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libarchive-3.7.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libyaml-0.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe hicolor-icon-theme-0.18-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 725 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_packagedata_setscene)
NOTE: recipe nghttp2-1.65.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcr-4.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpsl-0.21.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxslt-1.1.42-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 741 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.41.bb:do_create_spdx_setscene)
NOTE: Running setscene task 742 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 745 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_create_spdx_setscene)
NOTE: recipe curl-8.12.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 746 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/aspell/aspell_0.60.8.1.bb:do_packagedata_setscene)
NOTE: recipe hicolor-icon-theme-0.18-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe adwaita-icon-theme-47.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 747 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtiff/tiff_4.7.0.bb:do_create_spdx_setscene)
NOTE: recipe coreutils-9.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 748 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libyaml-0.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.10.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe nghttp2-1.65.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gcr-4.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe nettle-3.10.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.7.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 753 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 754 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/p11-kit/p11-kit_0.25.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 755 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.5.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 759 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_create_spdx_setscene)
NOTE: Running setscene task 760 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/p11-kit/p11-kit_0.25.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 765 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.79.bb:do_create_spdx_setscene)
NOTE: Running setscene task 766 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 769 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxt-1_1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libarchive-3.7.7-r0: task do_packagedata_setscene: Started
NOTE: recipe orc-0.4.41-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 771 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.46.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe aspell-0.60.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe tiff-4.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libadwaita-1.6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libwebp-1.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libusb1-1.0.27-r0: task do_create_spdx_setscene: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe p11-kit-0.25.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe p11-kit-0.25.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe nettle-3.10.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wpebackend-fdo-1.14.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bluez5-5.79-r0: task do_create_spdx_setscene: Started
NOTE: recipe orc-0.4.41-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 775 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.9.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 776 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe json-glib-1.10.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 778 of 1690 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/cargo-c_0.10.5+cargo-0.83.0.bb:do_create_spdx_setscene)
NOTE: recipe tiff-4.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe webkitgtk-2.46.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libadwaita-1.6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 780 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.65.0.bb:do_packagedata_setscene)
NOTE: recipe libarchive-3.7.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 782 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_create_spdx_setscene)
NOTE: recipe libdazzle-3.44.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 786 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpsl/libpsl_0.21.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libwebp-1.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe wpebackend-fdo-1.14.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libusb1-1.0.27-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe json-glib-1.10.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxt-1_1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe webkitgtk-2.46.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libportal-0.9.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 793 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.8.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bluez5-5.79-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe nghttp2-1.65.0-r0: task do_packagedata_setscene: Started
NOTE: recipe p11-kit-0.25.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 796 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.42.bb:do_packagedata_setscene)
NOTE: recipe libpsl-0.21.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libportal-0.9.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe aspell-0.60.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 799 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_create_spdx_setscene)
NOTE: recipe enchant2-2.8.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 800 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.6.bb:do_recipe_qa_setscene)
NOTE: recipe libxt-1_1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 804 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 807 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_create_spdx_setscene)
NOTE: Running setscene task 810 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_create_spdx_setscene)
NOTE: Running setscene task 811 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_create_spdx_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 816 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.42.bb:do_populate_sysroot_setscene)
NOTE: recipe nghttp2-1.65.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 818 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/aspell/aspell_0.60.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxslt-1.1.42-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 819 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_create_spdx_setscene)
NOTE: recipe enchant2-2.8.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpsl-0.21.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 820 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/iso-codes/iso-codes_4.17.0.bb:do_create_spdx_setscene)
NOTE: recipe libxv-1.0.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe vala-0.56.17-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsoup-3.6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe json-glib-1.10.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxslt-1.1.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cargo-c-native-0.10.5+cargo-0.83.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe aspell-0.60.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxslt-1.1.42-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe p11-kit-0.25.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsoup-3.6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe json-glib-1.10.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxv-1.0.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 827 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.83.0.bb:do_create_spdx_setscene)
NOTE: recipe vala-0.56.17-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 830 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 833 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 834 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_47.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 836 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe iso-codes-4.17.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 838 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 839 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 840 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 843 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cargo-c-native-0.10.5+cargo-0.83.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 848 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 850 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxslt-1.1.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 851 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 852 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.8.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 853 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.21.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe nettle-3.10.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libyaml-0.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libstd-rs-1.83.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxkbcommon-1.8.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe iso-codes-4.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe aspell-0.60.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gsettings-desktop-schemas-47.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wpebackend-fdo-1.14.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcr-4.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libhandy-1.8.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 857 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.13.bb:do_create_spdx_setscene)
NOTE: Running setscene task 859 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpsl/libpsl_0.21.5.bb:do_packagedata_setscene)
NOTE: recipe appstream-1.0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.10.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe enchant2-2.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gsettings-desktop-schemas-47.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe wpebackend-fdo-1.14.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 861 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.65.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libstd-rs-1.83.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxkbcommon-1.8.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gcr-4.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libhandy-1.8.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 862 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_76-1.bb:do_create_spdx_setscene)
NOTE: recipe libxmlb-0.3.21-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 866 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.9.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 867 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.6.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 868 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/p11-kit/p11-kit_0.25.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 869 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 870 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 871 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_create_spdx_setscene)
NOTE: recipe libxft-1_2.3.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 873 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_packagedata_setscene)
NOTE: recipe alsa-lib-1.2.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpsl-0.21.5-r0: task do_packagedata_setscene: Started
NOTE: recipe appstream-1.0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe enchant2-2.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 875 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.6.4.bb:do_recipe_qa_setscene)
NOTE: recipe libxmlb-0.3.21-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 876 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 878 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_47.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 880 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe nghttp2-1.65.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe icu-76-1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libportal-0.9.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe alsa-lib-1.2.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libadwaita-1.6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 881 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe p11-kit-0.25.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 882 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.46.6.bb:do_recipe_qa_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsoup-3.6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libportal-0.9.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gsettings-desktop-schemas-47.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsecret-0.21.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libadwaita-1.6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 883 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpsl-0.21.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe p11-kit-0.25.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 884 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 889 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 890 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtiff/tiff_4.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 891 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 892 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe nghttp2-1.65.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnotify-0.8.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe webkitgtk-2.46.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe icu-76-1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsoup-3.6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe desktop-file-utils-0.28-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 895 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.4.bb:do_recipe_qa_setscene)
NOTE: recipe gsettings-desktop-schemas-47.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsecret-0.21.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 896 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 899 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 900 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.296.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 901 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 902 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 906 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 910 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.124.bb:do_create_spdx_setscene)
NOTE: recipe hicolor-icon-theme-0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe tiff-4.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libnotify-0.8.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe webkitgtk-2.46.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 912 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 913 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_recipe_qa_setscene)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe appstream-1.0.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-loader-1.3.296.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 914 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/aspell/aspell_0.60.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe libdrm-2.4.124-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 915 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: recipe hicolor-icon-theme-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 917 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.21.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-4.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tiff-4.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libhandy-1.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe appstream-1.0.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 920 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 923 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 924 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.41.bb:do_create_spdx_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 925 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_create_spdx_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe aspell-0.60.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 926 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.2.bb:do_create_spdx_setscene)
NOTE: recipe vulkan-loader-1.3.296.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 927 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 928 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe libhandy-1.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libdrm-2.4.124-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 929 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtiff/tiff_4.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 931 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 934 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 935 of 1690 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_create_spdx_setscene)
NOTE: recipe libxmlb-0.3.21-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 942 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.5.bb:do_create_spdx_setscene)
NOTE: recipe libwpe-1.16.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-protocols-1.41-r0: task do_create_spdx_setscene: Started
NOTE: recipe aspell-0.60.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 943 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.6.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-4.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 944 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.65.0.bb:do_recipe_qa_setscene)
NOTE: recipe cairo-1.18.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxmlb-0.3.21-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe tiff-4.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 945 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_create_spdx_setscene)
NOTE: recipe libwpe-1.16.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe gtk4-4.16.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe wayland-protocols-1.41-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 947 of 1690 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/cargo_1.83.0.bb:do_create_spdx_setscene)
NOTE: recipe libsm-1_1.2.5-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 950 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 958 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 963 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe shared-mime-info-native-2.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe nghttp2-1.65.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsecret-0.21.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cairo-1.18.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 964 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: recipe gtk4-4.16.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 965 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.79.bb:do_populate_sysroot_setscene)
NOTE: recipe libxi-1_1.8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 966 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 967 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_recipe_qa_setscene)
NOTE: recipe libsm-1_1.2.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-native-2.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe nghttp2-1.65.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsecret-0.21.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe tiff-4.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 974 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.296.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 975 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_create_spdx_setscene)
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 976 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 978 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 979 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.74.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 980 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_packagedata_setscene)
NOTE: recipe cargo-native-1.83.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 983 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.0.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.23.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bluez5-5.79-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 985 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.4.bb:do_recipe_qa_setscene)
NOTE: recipe gtk+3-3.24.43-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.296.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe cargo-native-1.83.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcap-2.74-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 988 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.12.1.bb:do_packagedata_setscene)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.51-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 990 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.79.bb:do_packagedata_setscene)
NOTE: Running setscene task 992 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 994 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_create_spdx_setscene)
NOTE: recipe desktop-file-utils-0.28-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 995 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtiff/tiff_4.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxkbcommon-1.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnotify-0.8.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 996 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.3.296.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 997 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 998 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.7.bb:do_recipe_qa_setscene)
NOTE: recipe xrandr-1_1.5.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1002 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_populate_sysroot_setscene)
NOTE: recipe bluez5-5.79-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-8.12.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1006 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe tiff-4.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bluez5-5.79-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk4-4.16.12-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1008 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1010 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.6.bb:do_create_spdx_setscene)
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libnotify-0.8.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-2.74-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1011 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1012 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_create_spdx_setscene)
NOTE: recipe libgpg-error-1.51-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1013 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libwpe-1.16.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libusb1-1.0.27-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1014 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_recipe_qa_setscene)
NOTE: recipe libarchive-3.7.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe tiff-4.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gtk4-4.16.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1018 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1019 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_create_spdx_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxml2-2.13.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libwpe-1.16.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libwebp-1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1020 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.0.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-8.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.7.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe bluez5-5.79-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1021 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1022 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb:do_packagedata_setscene)
NOTE: recipe libyaml-0.2.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1024 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1025 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1028 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpsl/libpsl_0.21.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxt-1_1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe fontconfig-2.15.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libusb1-1.0.27-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1030 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_packagedata_setscene)
NOTE: Running setscene task 1031 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_create_spdx_setscene)
NOTE: recipe libyaml-0.2.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.13.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1033 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1034 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.54.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxkbcommon-1.8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1036 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1041 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.42.bb:do_recipe_qa_setscene)
NOTE: recipe libwebp-1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.51-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1042 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gtk+3-3.24.43-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1043 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpsl-0.21.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1044 of 1690 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/rust_1.83.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1046 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe libusb1-1.0.27-r0: task do_packagedata_setscene: Started
NOTE: recipe libwebp-1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgudev-238-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe at-spi2-core-2.54.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxslt-1.1.42-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1047 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.74.bb:do_packagedata_setscene)
NOTE: Running setscene task 1048 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_packagedata_setscene)
NOTE: recipe libpsl-0.21.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1049 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_create_spdx_setscene)
NOTE: recipe libxkbcommon-1.8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1050 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_recipe_qa_setscene)
NOTE: recipe libgcrypt-1.11.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe curl-8.12.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe at-spi2-core-2.54.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgudev-238-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1051 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_create_spdx_setscene)
NOTE: recipe libxslt-1.1.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1054 of 1690 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.29.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1055 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.54.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1056 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_create_spdx_setscene)
NOTE: recipe libcap-2.74-r0: task do_packagedata_setscene: Started
NOTE: recipe libusb1-1.0.27-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe rust-native-1.83.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgpg-error-1.51-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.82.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1076 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_packagedata_setscene)
NOTE: Running setscene task 1077 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1080 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1082 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1083 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.41.bb:do_populate_sysroot_setscene)
NOTE: recipe libwebp-1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1086 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.19.bb:do_packagedata_setscene)
NOTE: recipe freetype-2.13.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe rust-native-1.83.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe at-spi2-core-2.54.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xmlto-native-0.0.29-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1090 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_packagedata_setscene)
NOTE: recipe curl-8.12.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.82.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libcap-2.74-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sbc-2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1093 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.83.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1094 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.44-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1095 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 1096 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.0.bb:do_recipe_qa_setscene)
NOTE: recipe xkeyboard-config-2.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe orc-0.4.41-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1097 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.24.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libical-3.0.19-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.13.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe at-spi2-core-2.54.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xmlto-native-0.0.29-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1099 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1100 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1102 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/iso-codes/iso-codes_4.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1103 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxv-1.0.13-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1105 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.12.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.24.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libstd-rs-1.83.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.8.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1108 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.47.bb:do_create_spdx_setscene)
NOTE: recipe libical-3.0.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe iso-codes-4.17.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1109 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.41.bb:do_packagedata_setscene)
NOTE: recipe libxi-1_1.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxkbcommon-1.8.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1110 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_populate_sysroot_setscene)
NOTE: recipe libtasn1-4.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxv-1.0.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe orc-0.4.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.24.12-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1112 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1113 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 1114 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1115 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.79.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.47-r0: task do_create_spdx_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe orc-0.4.41-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1117 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_create_spdx_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1119 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_recipe_qa_setscene)
NOTE: recipe readline-8.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1120 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1123 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.19.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.44-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.47-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe readline-8.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libxv-1.0.13-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1126 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.83.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1129 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata_setscene)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1130 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: recipe bluez5-5.79-r0: task do_recipe_qa_setscene: Started
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/libidn2/2.3.7/temp/log.do_packagedata_setscene.734
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 1132 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_packagedata_setscene)
NOTE: recipe orc-0.4.41-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1133 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_recipe_qa_setscene)
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libical-3.0.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.40.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libstd-rs-1.83.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bluez5-5.79-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1134 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_recipe_qa_setscene)
NOTE: recipe readline-8.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1137 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_populate_sysroot_setscene)
NOTE: recipe readline-8.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1138 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb:do_recipe_qa_setscene)
NOTE: recipe libxv-1.0.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1140 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1141 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.59.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1143 of 1690 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/cargo-c_0.10.5+cargo-0.83.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.40.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1149 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1150 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1151 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libstd-rs-1.83.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1152 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.51-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1153 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.12.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxtst-1_1.2.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.24.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libical-3.0.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgpg-error-1.51-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libstd-rs-1.83.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.12.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe librsvg-2.59.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe curl-8.12.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libidn2-2.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe librsvg-2.59.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1157 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-1.24.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1158 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.11.bb:do_create_spdx_setscene)
NOTE: recipe cargo-c-native-0.10.5+cargo-0.83.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1162 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1165 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1170 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 1172 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1173 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_package_setscene)
NOTE: recipe iso-codes-4.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.11-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_recipe_qa_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.24.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1174 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1176 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1177 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.19.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1178 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1180 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.5.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1183 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1184 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1185 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1186 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1187 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1188 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1190 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 1192 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.59.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1194 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libwebp-1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libical-3.0.19-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-1.24.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe vala-0.56.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libusb1-1.0.27-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libwebp-1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libical-3.0.19-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libusb1-1.0.27-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.24.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1201 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1202 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1203 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1206 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1207 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1208 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.56.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpam-1.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe librsvg-2.59.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1210 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.74.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1211 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1213 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1216 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.41.bb:do_recipe_qa_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1219 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.4.bb:do_create_spdx_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cargo-c-native-0.10.5+cargo-0.83.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1223 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.83.0.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.6.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe librsvg-2.59.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.4.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1224 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_packagedata_setscene)
NOTE: recipe pango-1.56.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe vala-0.56.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1225 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_packagedata_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.74-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1226 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.47.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe orc-0.4.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.6.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libstd-rs-1.83.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.6.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe pango-1.56.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1228 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1230 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.13.bb:do_packagedata_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.4.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libcap-2.74-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1236 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1237 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_33.bb:do_packagedata_setscene)
NOTE: Running setscene task 1238 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_recipe_qa_setscene)
NOTE: recipe orc-0.4.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.47.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1239 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1240 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1241 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1242 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_packagedata_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libstd-rs-1.83.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1243 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx_setscene)
NOTE: recipe xz-5.6.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libidn2-2.3.7-r0: task do_package_setscene: Started
NOTE: Running setscene task 1244 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.5.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe alsa-lib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1245 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: recipe libtheora-1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-33-r0: task do_packagedata_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vala-0.56.17-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-lib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flac-1.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1249 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_recipe_qa_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1250 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_33.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1251 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsm-1_1.2.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1252 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1253 of 1690 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/cargo-c_0.10.5+cargo-0.83.0.bb:do_recipe_qa_setscene)
NOTE: recipe sbc-2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1254 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe alsa-lib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxv-1.0.13-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1256 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1257 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.6.bb:do_packagedata_setscene)
NOTE: recipe kmod-33-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-33-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/vala/0.56.17/temp/log.do_packagedata_setscene.2719
NOTE: recipe flac-1.4.3-r0: task do_packagedata_setscene: Succeeded
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 1259 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1260 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 1261 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe readline-8.2.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxv-1.0.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsm-1_1.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1263 of 1690 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/cargo_1.83.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxi-1_1.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1264 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_populate_sysroot_setscene)
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.2.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-33-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1266 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1268 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 1269 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1270 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1271 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.56.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1273 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1274 of 1690 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.29.bb:do_populate_sysroot_setscene)
NOTE: recipe libxi-1_1.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1276 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_package_setscene)
NOTE: recipe base-passwd-3.6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cargo-native-1.83.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.17.3-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe pango-1.56.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1278 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cargo-c-native-0.10.5+cargo-0.83.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xmlto-native-0.0.29-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1279 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_76-1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1280 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: recipe pango-1.56.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1284 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.124.bb:do_packagedata_setscene)
NOTE: recipe vala-0.56.17-r0: task do_package_setscene: Started
NOTE: Running setscene task 1286 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.124.bb:do_populate_sysroot_setscene)
NOTE: recipe cargo-c-native-0.10.5+cargo-0.83.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1287 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: recipe flac-1.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1289 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1290 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_10.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1292 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1293 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.296.0.bb:do_packagedata_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe icu-76-1-r0: task do_packagedata_setscene: Started
NOTE: recipe xmlto-native-0.0.29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1295 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.2.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libdrm-2.4.124-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.124-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1296 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.2.bb:do_packagedata_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-loader-1.3.296.0-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-10.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cargo-native-1.83.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1298 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.296.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1299 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shadow-4.17.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1301 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_recipe_qa_setscene)
NOTE: recipe cairo-1.18.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1302 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe icu-76-1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe harfbuzz-10.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1304 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_10.4.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1307 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1309 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1311 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata_setscene)
NOTE: recipe cairo-1.18.2-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.3.296.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.124-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.124-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1312 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-loader-1.3.296.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1313 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_76-1.bb:do_populate_sysroot_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1314 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1317 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.41.bb:do_packagedata_setscene)
NOTE: recipe fribidi-1.0.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.17.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-10.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1318 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: recipe cairo-1.18.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1319 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libatomic-ops-7.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe icu-76-1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-protocols-1.41-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cairo-1.18.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1320 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_packagedata_setscene)
NOTE: recipe vulkan-loader-1.3.296.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe harfbuzz-10.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1322 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1325 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1326 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1327 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mesa-2_24.0.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.17.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1331 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1332 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1334 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1335 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libatomic-ops-7.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-protocols-1.41-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1336 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libatomic-ops-7.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libidn2-2.3.7-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1338 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1339 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_packagedata_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1341 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_33.bb:do_recipe_qa_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1342 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_create_spdx_setscene)
NOTE: recipe xrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1344 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1345 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.5.bb:do_populate_sysroot_setscene)
NOTE: recipe icu-76-1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1347 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.6.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1348 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1349 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1350 of 1690 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/rust_1.83.0.bb:do_populate_sysroot_setscene)
NOTE: recipe kmod-33-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1353 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.13.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1358 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_recipe_qa_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1359 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1361 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.44.2.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1362 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.296.0.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-33-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vala-0.56.17-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1364 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1365 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.44.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1367 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1370 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe alsa-lib-1.2.13-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1373 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe rust-native-1.83.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1374 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_recipe_qa_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.44.2-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.296.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1375 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_24.0.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsm-1_1.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1377 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_packagedata_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pixman-1_0.44.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.23.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1379 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe alsa-lib-1.2.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1380 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_24.0.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1381 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1382 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.124.bb:do_recipe_qa_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pixman-1_0.44.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.296.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1384 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1385 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1387 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1388 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_recipe_qa_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1390 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.18.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1392 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_packagedata_setscene)
NOTE: recipe pixman-1_0.44.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1395 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe libdrm-2.4.124-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1397 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.296.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1399 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.17.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cairo-1.18.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1400 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1402 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_recipe_qa_setscene)
NOTE: recipe libdrm-2.4.124-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1403 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_recipe_qa_setscene)
NOTE: recipe libunwind-1.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.3.296.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.17.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libidn2-2.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fontconfig-2.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1404 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.5.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1406 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1407 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.296.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1408 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1409 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_recipe_qa_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vala-0.56.17-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1413 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1416 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libsm-1_1.2.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1419 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_76-1.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-loader-1.3.296.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1420 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.23.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe vala-0.56.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1424 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1429 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1430 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1432 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsm-1_1.2.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1433 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_recipe_qa_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1434 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.3.296.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe icu-76-1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-loader-1.3.296.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1436 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1437 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.44.2.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1438 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.6.bb:do_populate_sysroot_setscene)
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libatomic-ops-7.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1441 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.296.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1442 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe icu-76-1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1443 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_populate_sysroot_setscene)
NOTE: recipe freetype-2.13.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1444 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_populate_sysroot_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libatomic-ops-7.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pixman-1_0.44.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1446 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 1447 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.6.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.13.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1450 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 1451 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1452 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-headers-1.3.296.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1453 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.13.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.44.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1454 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1456 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe vulkan-headers-1.3.296.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe freetype-2.13.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1457 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1459 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.47.bb:do_packagedata_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.13.6-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1460 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_package_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxml2-2.13.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fontconfig-2.15.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.13.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpng-1.6.47-r0: task do_packagedata_setscene: Started
NOTE: recipe rust-native-1.83.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.13.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_package_setscene: Started
NOTE: recipe libpng-1.6.47-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1468 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.47.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1470 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1472 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1474 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1477 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1478 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 1479 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1480 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.6.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.47-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.13.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.13.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.13.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.13.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libx11-1_1.8.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1490 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1491 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe libpng-1.6.47-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.8.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1493 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.47.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1494 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1495 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1497 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.11.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.47-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.47-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1500 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1502 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1503 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1504 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 1506 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1507 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1508 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1509 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1510 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1511 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1514 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1515 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1519 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1520 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1521 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1523 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1525 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1527 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1531 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1533 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1136 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_fetch)
NOTE: Running task 1139 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_fetch)
NOTE: recipe shared-mime-info-2.4-r0: task do_fetch: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_fetch: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_fetch: Succeeded
NOTE: Running task 1247 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_unpack)
NOTE: Running task 1260 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.12.bb:do_fetch)
NOTE: Running task 1320 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_write_config)
NOTE: Running task 1321 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_write_config)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-1.24.12-r0: task do_fetch: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_fetch: Succeeded
NOTE: Running task 1343 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_unpack)
NOTE: recipe gstreamer1.0-1.24.12-r0: task do_fetch: Succeeded
NOTE: Running task 1353 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.12.bb:do_unpack)
NOTE: recipe shared-mime-info-2.4-r0: task do_write_config: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_write_config: Started
NOTE: Running task 1383 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_10.4.0.bb:do_fetch)
NOTE: recipe shared-mime-info-2.4-r0: task do_unpack: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_write_config: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-1.24.12-r0: task do_unpack: Started
NOTE: recipe harfbuzz-10.4.0-r0: task do_fetch: Started
NOTE: Running task 1466 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_fetch)
NOTE: Running task 1474 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.56.1.bb:do_fetch)
NOTE: recipe harfbuzz-10.4.0-r0: task do_fetch: Succeeded
NOTE: Running task 1488 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_10.4.0.bb:do_unpack)
NOTE: Running task 1499 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.12.bb:do_write_config)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_unpack: Succeeded
NOTE: Running task 1531 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_patch)
NOTE: recipe pango-1.56.1-r0: task do_fetch: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_fetch: Started
NOTE: recipe pango-1.56.1-r0: task do_fetch: Succeeded
NOTE: recipe harfbuzz-10.4.0-r0: task do_unpack: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-1.24.12-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-1.24.12-r0: task do_unpack: Succeeded
NOTE: Running task 1582 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_unpack)
NOTE: Running task 1583 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.12.bb:do_patch)
NOTE: Running task 1586 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.56.1.bb:do_unpack)
NOTE: recipe gstreamer1.0-1.24.12-r0: task do_write_config: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_patch: Started
NOTE: Running task 1639 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_10.4.0.bb:do_write_config)
NOTE: Running task 1642 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.59.2.bb:do_fetch)
NOTE: recipe pango-1.56.1-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-1.24.12-r0: task do_patch: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_unpack: Started
NOTE: recipe harfbuzz-10.4.0-r0: task do_write_config: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_patch: Succeeded
NOTE: recipe harfbuzz-10.4.0-r0: task do_write_config: Succeeded
NOTE: recipe librsvg-2.59.2-r0: task do_fetch: Started
NOTE: recipe pango-1.56.1-r0: task do_unpack: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_unpack: Succeeded
NOTE: Running task 1752 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.56.1.bb:do_patch)
NOTE: Running task 1753 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_patch)
NOTE: recipe pango-1.56.1-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-1.24.12-r0: task do_patch: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_patch: Started
NOTE: Running task 1798 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_write_config)
NOTE: Running task 1810 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.56.1.bb:do_write_config)
NOTE: recipe pango-1.56.1-r0: task do_patch: Succeeded
NOTE: recipe librsvg-2.59.2-r0: task do_fetch: Succeeded
NOTE: Running task 1852 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_fetch)
NOTE: Running task 1855 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.54.1.bb:do_fetch)
NOTE: Running task 1859 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.59.2.bb:do_unpack)
NOTE: recipe pango-1.56.1-r0: task do_write_config: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_write_config: Started
NOTE: Running task 1903 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_fetch)
NOTE: recipe pango-1.56.1-r0: task do_write_config: Succeeded
NOTE: Running task 1910 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.21.bb:do_fetch)
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_write_config: Succeeded
NOTE: recipe at-spi2-core-2.54.1-r0: task do_fetch: Started
NOTE: recipe at-spi2-core-2.54.1-r0: task do_fetch: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_patch: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_fetch: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_fetch: Succeeded
NOTE: recipe libxmlb-0.3.21-r0: task do_fetch: Started
NOTE: Running task 1931 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.54.1.bb:do_unpack)
NOTE: recipe librsvg-2.59.2-r0: task do_unpack: Started
NOTE: Running task 1944 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.12.bb:do_fetch)
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Succeeded
NOTE: Running task 1967 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_fetch)
NOTE: Running task 1970 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_unpack)
NOTE: Running task 1971 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_unpack)
NOTE: recipe at-spi2-core-2.54.1-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.12-r0: task do_fetch: Started
NOTE: Running task 1998 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_fetch)
NOTE: recipe gstreamer1.0-plugins-base-1.24.12-r0: task do_fetch: Succeeded
NOTE: Running task 1999 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.12.bb:do_fetch)
NOTE: recipe libgudev-238-r0: task do_fetch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_unpack: Started
NOTE: Running task 2000 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.12.bb:do_unpack)
NOTE: recipe libxmlb-0.3.21-r0: task do_fetch: Succeeded
NOTE: recipe libgudev-238-r0: task do_fetch: Succeeded
NOTE: Running task 2002 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.21.bb:do_unpack)
NOTE: Running task 2015 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_unpack)
NOTE: Running task 2018 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_fetch)
NOTE: recipe at-spi2-core-2.54.1-r0: task do_unpack: Succeeded
NOTE: recipe harfbuzz-10.4.0-r0: task do_unpack: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Started
NOTE: Running task 2022 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.54.1.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.12-r0: task do_fetch: Started
NOTE: Running task 2023 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_10.4.0.bb:do_patch)
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.24.12-r0: task do_unpack: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.24.12-r0: task do_fetch: Succeeded
NOTE: Running task 2027 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_patch)
NOTE: Running task 2029 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_write_config)
NOTE: Running task 2031 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.54.1.bb:do_write_config)
NOTE: Running task 2034 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.6.bb:do_fetch)
NOTE: recipe libxmlb-0.3.21-r0: task do_unpack: Started
NOTE: Running task 2036 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.59.2.bb:do_write_config)
NOTE: recipe libgudev-238-r0: task do_unpack: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_fetch: Started
NOTE: recipe at-spi2-core-2.54.1-r0: task do_patch: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_fetch: Succeeded
NOTE: recipe harfbuzz-10.4.0-r0: task do_patch: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_patch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Started
NOTE: recipe at-spi2-core-2.54.1-r0: task do_patch: Succeeded
NOTE: Running task 2061 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.12.bb:do_fetch)
NOTE: recipe at-spi2-core-2.54.1-r0: task do_write_config: Started
NOTE: recipe harfbuzz-10.4.0-r0: task do_patch: Succeeded
NOTE: recipe json-glib-1.10.6-r0: task do_fetch: Started
NOTE: recipe json-glib-1.10.6-r0: task do_fetch: Succeeded
NOTE: Running task 2064 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_unpack)
NOTE: recipe libglu-2_9.0.3-r0: task do_patch: Succeeded
NOTE: recipe libgudev-238-r0: task do_unpack: Succeeded
NOTE: Running task 2065 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_patch)
NOTE: recipe at-spi2-core-2.54.1-r0: task do_write_config: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Succeeded
NOTE: Running task 2067 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.12.bb:do_unpack)
NOTE: recipe gtk4-4.16.12-r0: task do_fetch: Started
NOTE: recipe librsvg-2.59.2-r0: task do_write_config: Started
NOTE: Running task 2070 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_write_config)
NOTE: recipe gtk4-4.16.12-r0: task do_fetch: Succeeded
NOTE: Running task 2071 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.21.bb:do_write_config)
NOTE: recipe gstreamer1.0-plugins-base-1.24.12-r0: task do_unpack: Succeeded
NOTE: Running task 2073 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.12.bb:do_patch)
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Succeeded
NOTE: recipe librsvg-2.59.2-r0: task do_write_config: Succeeded
NOTE: Running task 2079 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_patch)
NOTE: recipe libgudev-238-r0: task do_patch: Started
NOTE: Running task 2084 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.12-r0: task do_unpack: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_write_config: Started
NOTE: Running task 2098 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.2.bb:do_fetch)
NOTE: recipe mesa-2_24.0.7-r0: task do_unpack: Succeeded
NOTE: Running task 2101 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.6.bb:do_unpack)
NOTE: Running task 2102 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_patch)
NOTE: recipe libxmlb-0.3.21-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.12-r0: task do_patch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Started
NOTE: Running task 2107 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.12.bb:do_write_config)
NOTE: recipe libglu-2_9.0.3-r0: task do_write_config: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Succeeded
NOTE: recipe libxmlb-0.3.21-r0: task do_write_config: Succeeded
NOTE: recipe gtk+3-3.24.43-r0: task do_unpack: Started
NOTE: recipe libgudev-238-r0: task do_patch: Succeeded
NOTE: Running task 2113 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_patch)
NOTE: recipe libwpe-1.16.2-r0: task do_fetch: Started
NOTE: recipe libwpe-1.16.2-r0: task do_fetch: Succeeded
NOTE: Running task 2117 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.12.bb:do_unpack)
NOTE: recipe libxmlb-0.3.21-r0: task do_unpack: Succeeded
NOTE: Running task 2118 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_write_config)
NOTE: Running task 2119 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.21.bb:do_patch)
NOTE: Running task 2122 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.2.bb:do_unpack)
NOTE: recipe json-glib-1.10.6-r0: task do_unpack: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_patch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.24.12-r0: task do_write_config: Started
NOTE: recipe graphene-1.10.8-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.12-r0: task do_write_config: Succeeded
NOTE: recipe libgudev-238-r0: task do_write_config: Started
NOTE: recipe libwpe-1.16.2-r0: task do_unpack: Started
NOTE: recipe gtk4-4.16.12-r0: task do_unpack: Started
NOTE: Running task 2156 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_write_config)
NOTE: recipe libxmlb-0.3.21-r0: task do_patch: Started
NOTE: Running task 2157 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.12.bb:do_write_config)
NOTE: Running task 2164 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_write_config)
NOTE: Running task 2168 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_fetch)
NOTE: recipe gstreamer1.0-plugins-base-1.24.12-r0: task do_patch: Succeeded
NOTE: recipe json-glib-1.10.6-r0: task do_unpack: Succeeded
NOTE: Running task 2172 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.6.4.bb:do_fetch)
NOTE: Running task 2173 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.6.bb:do_patch)
NOTE: recipe graphene-1.10.8-r0: task do_patch: Succeeded
NOTE: Running task 2176 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.6.bb:do_write_config)
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Started
NOTE: recipe libgudev-238-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.24.12-r0: task do_write_config: Started
NOTE: recipe libwpe-1.16.2-r0: task do_unpack: Succeeded
NOTE: Running task 2177 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.2.bb:do_patch)
NOTE: recipe desktop-file-utils-0.28-r0: task do_fetch: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_write_config: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_fetch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.24.12-r0: task do_write_config: Succeeded
NOTE: recipe libsoup-3.6.4-r0: task do_fetch: Started
NOTE: recipe libsoup-3.6.4-r0: task do_fetch: Succeeded
NOTE: recipe json-glib-1.10.6-r0: task do_patch: Started
NOTE: recipe libxmlb-0.3.21-r0: task do_patch: Succeeded
NOTE: recipe gtk+3-3.24.43-r0: task do_write_config: Succeeded
NOTE: recipe json-glib-1.10.6-r0: task do_write_config: Started
NOTE: recipe libwpe-1.16.2-r0: task do_patch: Started
NOTE: Running task 2215 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.12.bb:do_write_config)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.12-r0: task do_unpack: Succeeded
NOTE: recipe json-glib-1.10.6-r0: task do_patch: Succeeded
NOTE: Running task 2228 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.12.bb:do_patch)
NOTE: Running task 2234 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_unpack)
NOTE: recipe libwpe-1.16.2-r0: task do_patch: Succeeded
NOTE: Running task 2237 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.6.4.bb:do_unpack)
NOTE: recipe json-glib-1.10.6-r0: task do_write_config: Succeeded
NOTE: Running task 2252 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.6.bb:do_fetch)
NOTE: Running task 2253 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.4.bb:do_fetch)
NOTE: Running task 2254 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.8.2.bb:do_fetch)
NOTE: Running task 2256 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.3.bb:do_fetch)
NOTE: Running task 2259 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.4.bb:do_fetch)
NOTE: recipe gtk4-4.16.12-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.12-r0: task do_patch: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_unpack: Started
NOTE: recipe libsoup-3.6.4-r0: task do_unpack: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_patch: Succeeded
NOTE: recipe gtk4-4.16.12-r0: task do_write_config: Succeeded
NOTE: recipe enchant2-2.8.2-r0: task do_fetch: Started
NOTE: recipe wpebackend-fdo-1.14.3-r0: task do_fetch: Started
NOTE: recipe libsecret-0.21.6-r0: task do_fetch: Started
NOTE: Running task 2291 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.2.bb:do_generate_toolchain_file)
NOTE: recipe libnotify-0.8.4-r0: task do_fetch: Started
NOTE: recipe enchant2-2.8.2-r0: task do_fetch: Succeeded
NOTE: recipe appstream-1.0.4-r0: task do_fetch: Started
NOTE: recipe wpebackend-fdo-1.14.3-r0: task do_fetch: Succeeded
NOTE: recipe libsecret-0.21.6-r0: task do_fetch: Succeeded
NOTE: recipe libnotify-0.8.4-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_package_setscene: Succeeded
NOTE: Running task 2294 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_47.1.bb:do_fetch)
NOTE: recipe appstream-1.0.4-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1534 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1535 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1536 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1537 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1538 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1539 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_packagedata_setscene)
NOTE: recipe desktop-file-utils-0.28-r0: task do_unpack: Succeeded
NOTE: Running task 2297 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_patch)
NOTE: recipe libwpe-1.16.2-r0: task do_generate_toolchain_file: Started
NOTE: Running task 2298 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.46.6.bb:do_fetch)
NOTE: recipe gsettings-desktop-schemas-47.1-r0: task do_fetch: Started
NOTE: recipe libsoup-3.6.4-r0: task do_unpack: Succeeded
NOTE: recipe libwpe-1.16.2-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 2307 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.6.4.bb:do_patch)
NOTE: recipe gobject-introspection-1.82.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.45-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.82.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gsettings-desktop-schemas-47.1-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-2.40.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.40.4-r0: task do_packagedata_setscene: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.12-r0: task do_patch: Succeeded
NOTE: recipe webkitgtk-2.46.6-r0: task do_fetch: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_unpack: Succeeded
NOTE: Running task 2335 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_patch)
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1540 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_recipe_qa_setscene)
NOTE: recipe webkitgtk-2.46.6-r0: task do_fetch: Succeeded
NOTE: recipe desktop-file-utils-0.28-r0: task do_patch: Succeeded
NOTE: Running task 2337 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.6.bb:do_unpack)
NOTE: Running task 2338 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.4.bb:do_unpack)
NOTE: recipe libsoup-3.6.4-r0: task do_patch: Started
NOTE: Running task 2339 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.8.2.bb:do_unpack)
NOTE: Running task 2341 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.3.bb:do_unpack)
NOTE: recipe libpcre2-10.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.82.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.82.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1542 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_75.8.2.bb:do_packagedata_setscene)
NOTE: recipe libsoup-3.6.4-r0: task do_patch: Succeeded
NOTE: recipe util-linux-2.40.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1545 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_75.8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1548 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1549 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_populate_sysroot_setscene)
NOTE: recipe gtk+3-3.24.43-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsecret-0.21.6-r0: task do_unpack: Started
NOTE: recipe enchant2-2.8.2-r0: task do_unpack: Started
NOTE: recipe libnotify-0.8.4-r0: task do_unpack: Started
NOTE: recipe wpebackend-fdo-1.14.3-r0: task do_unpack: Started
NOTE: Running task 2351 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.4.bb:do_unpack)
NOTE: recipe python3-setuptools-75.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-75.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk4-4.16.12-r0: task do_unpack: Succeeded
NOTE: recipe enchant2-2.8.2-r0: task do_unpack: Succeeded
NOTE: recipe gobject-introspection-1.82.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 2367 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.12.bb:do_patch)
NOTE: Running task 2368 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.8.2.bb:do_patch)
NOTE: recipe gtk+3-3.24.43-r0: task do_patch: Succeeded
NOTE: recipe libnotify-0.8.4-r0: task do_unpack: Succeeded
NOTE: recipe gobject-introspection-1.82.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsecret-0.21.6-r0: task do_unpack: Succeeded
NOTE: recipe appstream-1.0.4-r0: task do_unpack: Started
NOTE: recipe wpebackend-fdo-1.14.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-setuptools-75.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1552 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_packagedata_setscene)
NOTE: Running task 2385 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.6.bb:do_patch)
NOTE: Running task 2386 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.4.bb:do_patch)
NOTE: recipe enchant2-2.8.2-r0: task do_patch: Started
NOTE: Running task 2387 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.3.bb:do_patch)
NOTE: recipe gtk4-4.16.12-r0: task do_patch: Started
NOTE: recipe libpcre2-10.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1554 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_recipe_qa_setscene)
NOTE: recipe gtk4-4.16.12-r0: task do_patch: Succeeded
NOTE: Running task 2413 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_fetch)
NOTE: Running task 2414 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.9.1.bb:do_fetch)
NOTE: Running task 2415 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.0.bb:do_fetch)
NOTE: Running task 2416 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_fetch)
NOTE: Running task 2418 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.6.4.bb:do_fetch)
NOTE: Running task 2419 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.46.6.bb:do_unpack)
NOTE: recipe wpebackend-fdo-1.14.3-r0: task do_patch: Started
NOTE: recipe libsecret-0.21.6-r0: task do_patch: Started
NOTE: recipe libnotify-0.8.4-r0: task do_patch: Started
NOTE: recipe enchant2-2.8.2-r0: task do_patch: Succeeded
NOTE: recipe python3-setuptools-75.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.45-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wpebackend-fdo-1.14.3-r0: task do_patch: Succeeded
NOTE: recipe libnotify-0.8.4-r0: task do_patch: Succeeded
NOTE: Running setscene task 1556 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1557 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_75.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe appstream-1.0.4-r0: task do_unpack: Succeeded
NOTE: recipe libdazzle-3.44.0-r0: task do_fetch: Started
NOTE: recipe libportal-0.9.1-r0: task do_fetch: Started
NOTE: Running task 2421 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.4.bb:do_patch)
NOTE: recipe libhandy-1.8.3-r0: task do_fetch: Started
NOTE: recipe gcr-4.3.0-r0: task do_fetch: Started
NOTE: recipe libadwaita-1.6.4-r0: task do_fetch: Started
NOTE: recipe webkitgtk-2.46.6-r0: task do_unpack: Started
NOTE: recipe libpcre2-10.45-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libdazzle-3.44.0-r0: task do_fetch: Succeeded
NOTE: recipe gcr-4.3.0-r0: task do_fetch: Succeeded
NOTE: recipe libadwaita-1.6.4-r0: task do_fetch: Succeeded
NOTE: recipe libsecret-0.21.6-r0: task do_patch: Succeeded
NOTE: recipe python3-setuptools-75.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 2440 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_47.1.bb:do_unpack)
NOTE: Running task 2442 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_write_config)
NOTE: recipe appstream-1.0.4-r0: task do_patch: Started
NOTE: Running task 2445 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.6.4.bb:do_write_config)
NOTE: recipe python3-3.13.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-setuptools-75.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libportal-0.9.1-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-2.40.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libhandy-1.8.3-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1559 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1561 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1562 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1563 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1564 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1565 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1566 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_packagedata_setscene)
NOTE: recipe desktop-file-utils-0.28-r0: task do_write_config: Started
NOTE: recipe gsettings-desktop-schemas-47.1-r0: task do_unpack: Started
NOTE: recipe libsoup-3.6.4-r0: task do_write_config: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_write_config: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1568 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.1.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1569 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1570 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_packagedata_setscene)
NOTE: recipe libsoup-3.6.4-r0: task do_write_config: Succeeded
NOTE: recipe util-linux-2.40.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1571 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_packagedata_setscene)
NOTE: recipe appstream-1.0.4-r0: task do_patch: Succeeded
NOTE: recipe gsettings-desktop-schemas-47.1-r0: task do_unpack: Succeeded
NOTE: Running setscene task 1572 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1573 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.40.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1574 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1575 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.2.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.4.7-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1576 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1577 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1578 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1583 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.47.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1584 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1587 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1588 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.4.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1589 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1590 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1591 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1592 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.2.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.47.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1593 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1596 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.1.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1597 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1598 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1600 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1601 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.47.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1605 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1610 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1613 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1615 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1617 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.47.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1618 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe expat-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1620 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1622 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.13.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1626 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1627 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1630 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1631 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1632 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.47.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1634 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1636 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1637 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.47.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1640 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1642 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1644 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 2563 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_47.1.bb:do_patch)
NOTE: Running setscene task 1646 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1647 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1648 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gsettings-desktop-schemas-47.1-r0: task do_patch: Started
NOTE: Running setscene task 1650 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_packagedata_setscene)
NOTE: Running task 2627 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_unpack)
NOTE: Running task 2628 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.9.1.bb:do_unpack)
NOTE: Running task 2629 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.0.bb:do_unpack)
NOTE: Running task 2630 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_unpack)
NOTE: Running task 2632 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.6.4.bb:do_unpack)
NOTE: recipe gsettings-desktop-schemas-47.1-r0: task do_patch: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1652 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdazzle-3.44.0-r0: task do_unpack: Started
NOTE: recipe libportal-0.9.1-r0: task do_unpack: Started
NOTE: Running setscene task 1654 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1655 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libhandy-1.8.3-r0: task do_unpack: Started
NOTE: recipe gcr-4.3.0-r0: task do_unpack: Started
NOTE: recipe libadwaita-1.6.4-r0: task do_unpack: Started
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 2684 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.6.bb:do_write_config)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1657 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: Running task 2685 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.4.bb:do_write_config)
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 2686 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.3.bb:do_write_config)
NOTE: Running task 2688 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.4.bb:do_write_config)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 2701 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_48.0.bb:do_recipe_qa)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libdazzle-3.44.0-r0: task do_unpack: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcr-4.3.0-r0: task do_unpack: Succeeded
NOTE: recipe libsecret-0.21.6-r0: task do_write_config: Started
NOTE: recipe libnotify-0.8.4-r0: task do_write_config: Started
NOTE: recipe wpebackend-fdo-1.14.3-r0: task do_write_config: Started
NOTE: recipe appstream-1.0.4-r0: task do_write_config: Started
NOTE: Running task 2712 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_patch)
NOTE: Running task 2713 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.0.bb:do_patch)
NOTE: Running task 2719 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_47.1.bb:do_write_config)
NOTE: recipe libsecret-0.21.6-r0: task do_write_config: Succeeded
NOTE: recipe epiphany-48.0-r0: task do_recipe_qa: Started
NOTE: recipe wpebackend-fdo-1.14.3-r0: task do_write_config: Succeeded
NOTE: recipe libnotify-0.8.4-r0: task do_write_config: Succeeded
NOTE: recipe libadwaita-1.6.4-r0: task do_unpack: Succeeded
NOTE: recipe appstream-1.0.4-r0: task do_write_config: Succeeded
NOTE: Running task 2731 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.6.4.bb:do_patch)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1659 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 1660 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 1661 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_packagedata_setscene)
NOTE: recipe libdazzle-3.44.0-r0: task do_patch: Started
NOTE: recipe gsettings-desktop-schemas-47.1-r0: task do_write_config: Started
NOTE: recipe gcr-4.3.0-r0: task do_patch: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_patch: Succeeded
NOTE: recipe libadwaita-1.6.4-r0: task do_patch: Started
NOTE: recipe gcr-4.3.0-r0: task do_patch: Succeeded
NOTE: recipe gsettings-desktop-schemas-47.1-r0: task do_write_config: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 2782 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_write_config)
NOTE: Running task 2783 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.9.1.bb:do_write_config)
NOTE: Running task 2784 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.0.bb:do_write_config)
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Started
NOTE: Running task 2785 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_write_config)
NOTE: Running task 2786 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.6.4.bb:do_write_config)
NOTE: recipe libadwaita-1.6.4-r0: task do_patch: Succeeded
NOTE: recipe libportal-0.9.1-r0: task do_unpack: Succeeded
NOTE: Running task 2796 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.9.1.bb:do_patch)
NOTE: recipe epiphany-48.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe libhandy-1.8.3-r0: task do_unpack: Succeeded
NOTE: Running task 2802 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_48.0.bb:do_fetch)
NOTE: Running task 2804 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_patch)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdazzle-3.44.0-r0: task do_write_config: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libportal-0.9.1-r0: task do_write_config: Started
NOTE: Running setscene task 1663 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_recipe_qa_setscene)
NOTE: recipe libadwaita-1.6.4-r0: task do_write_config: Started
NOTE: recipe gcr-4.3.0-r0: task do_write_config: Started
NOTE: recipe libhandy-1.8.3-r0: task do_write_config: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1665 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libdazzle-3.44.0-r0: task do_write_config: Succeeded
NOTE: recipe libportal-0.9.1-r0: task do_write_config: Succeeded
NOTE: recipe libportal-0.9.1-r0: task do_patch: Started
NOTE: recipe gcr-4.3.0-r0: task do_write_config: Succeeded
NOTE: recipe libadwaita-1.6.4-r0: task do_write_config: Succeeded
NOTE: recipe epiphany-48.0-r0: task do_fetch: Started
NOTE: recipe libhandy-1.8.3-r0: task do_write_config: Succeeded
NOTE: recipe libhandy-1.8.3-r0: task do_patch: Started
NOTE: recipe epiphany-48.0-r0: task do_fetch: Succeeded
NOTE: Running task 2837 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_48.0.bb:do_unpack)
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 2848 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_48.0.bb:do_write_config)
NOTE: recipe libportal-0.9.1-r0: task do_patch: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libhandy-1.8.3-r0: task do_patch: Succeeded
NOTE: recipe epiphany-48.0-r0: task do_unpack: Started
NOTE: recipe webkitgtk-2.46.6-r0: task do_unpack: Succeeded
NOTE: recipe epiphany-48.0-r0: task do_write_config: Started
NOTE: Running task 2915 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.46.6.bb:do_patch)
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1668 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1670 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe epiphany-48.0-r0: task do_write_config: Succeeded
NOTE: recipe webkitgtk-2.46.6-r0: task do_patch: Started
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe epiphany-48.0-r0: task do_unpack: Succeeded
NOTE: Running task 3013 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_48.0.bb:do_patch)
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1671 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1673 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1674 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe epiphany-48.0-r0: task do_patch: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1679 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1680 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1682 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe webkitgtk-2.46.6-r0: task do_patch: Succeeded
NOTE: Running task 3022 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.46.6.bb:do_generate_toolchain_file)
NOTE: recipe epiphany-48.0-r0: task do_patch: Succeeded
NOTE: Running task 3023 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_48.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe webkitgtk-2.46.6-r0: task do_generate_toolchain_file: Started
NOTE: recipe epiphany-48.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe webkitgtk-2.46.6-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe librsvg-2.59.2-r0: task do_unpack: Succeeded
NOTE: Running task 3042 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.59.2.bb:do_patch)
NOTE: recipe epiphany-48.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe librsvg-2.59.2-r0: task do_patch: Started
NOTE: recipe librsvg-2.59.2-r0: task do_patch: Succeeded
NOTE: Running task 3044 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.59.2.bb:do_rust_gen_targets)
NOTE: recipe librsvg-2.59.2-r0: task do_rust_gen_targets: Started
NOTE: recipe librsvg-2.59.2-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1685 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1688 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.44.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1689 of 1690 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3472 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3536 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe shared-mime-info-2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3587 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_10.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-1.24.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3653 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_prepare_recipe_sysroot)
NOTE: recipe harfbuzz-10.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3827 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.54.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3856 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.21.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3871 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_packagedata)
NOTE: Running task 3889 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-core-2.54.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3916 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxmlb-0.3.21-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vala-0.56.17-r0: task do_packagedata: Started
NOTE: Running task 3947 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgudev-238-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3978 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_packagedata)
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 4013 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_prepare_recipe_sysroot)
NOTE: Running task 4017 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.6.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe json-glib-1.10.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 4043 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_collect_spdx_deps)
NOTE: recipe libsoup-3.6.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 4047 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_10.4.0.bb:do_collect_spdx_deps)
NOTE: recipe vala-0.56.17-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-1.24.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4062 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 4063 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.8.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe shared-mime-info-2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4064 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_configure)
NOTE: recipe mesa-2_24.0.7-r0: task do_collect_spdx_deps: Started
NOTE: Running task 4065 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.12.bb:do_configure)
NOTE: recipe harfbuzz-10.4.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe harfbuzz-10.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsecret-0.21.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe enchant2-2.8.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 4066 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_10.4.0.bb:do_configure)
NOTE: recipe shared-mime-info-2.4-r0: task do_configure: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.24.12-r0: task do_configure: Started
NOTE: Running task 4067 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_configure)
NOTE: recipe mesa-2_24.0.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe harfbuzz-10.4.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe harfbuzz-10.4.0-r0: task do_configure: Started
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata: Succeeded
NOTE: Running task 4093 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_47.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxmlb-0.3.21-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4094 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_collect_spdx_deps)
NOTE: recipe libgudev-238-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4107 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.21.bb:do_configure)
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mesa-2_24.0.7-r0: task do_configure: Started
NOTE: Running task 4137 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_configure)
NOTE: Running task 4140 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_configure)
NOTE: recipe gsettings-desktop-schemas-47.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe json-glib-1.10.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe at-spi2-core-2.54.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_collect_spdx_deps: Started
NOTE: Running task 4153 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.6.bb:do_configure)
NOTE: Running task 4154 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.54.1.bb:do_configure)
NOTE: recipe libxmlb-0.3.21-r0: task do_configure: Started
NOTE: Running task 4156 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.54.1.bb:do_collect_spdx_deps)
NOTE: recipe desktop-file-utils-0.28-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgudev-238-r0: task do_configure: Started
NOTE: recipe graphene-1.10.8-r0: task do_configure: Started
NOTE: Running task 4157 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_configure)
NOTE: recipe libsoup-3.6.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4158 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.6.4.bb:do_configure)
NOTE: recipe json-glib-1.10.6-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe at-spi2-core-2.54.1-r0: task do_configure: Started
NOTE: Running task 4161 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.12.bb:do_collect_spdx_deps)
NOTE: recipe at-spi2-core-2.54.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_configure: Started
NOTE: recipe libsoup-3.6.4-r0: task do_configure: Started
NOTE: recipe enchant2-2.8.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.24.12-r0: task do_collect_spdx_deps: Started
NOTE: Running task 4162 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.8.2.bb:do_configure)
NOTE: recipe libsecret-0.21.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4163 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.6.bb:do_configure)
NOTE: recipe at-spi2-core-2.54.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe enchant2-2.8.2-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-1.24.12-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libsecret-0.21.6-r0: task do_configure: Started
NOTE: Running task 4212 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_collect_spdx_deps)
NOTE: Running task 4216 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_collect_spdx_deps)
NOTE: recipe libgudev-238-r0: task do_collect_spdx_deps: Started
NOTE: recipe gsettings-desktop-schemas-47.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4217 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_47.1.bb:do_configure)
NOTE: recipe graphene-1.10.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe gsettings-desktop-schemas-47.1-r0: task do_configure: Started
NOTE: recipe graphene-1.10.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libgudev-238-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4244 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.6.4.bb:do_collect_spdx_deps)
NOTE: Running task 4245 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_collect_spdx_deps)
NOTE: recipe libsoup-3.6.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_collect_spdx_deps: Started
NOTE: recipe libsoup-3.6.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe desktop-file-utils-0.28-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4272 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_47.1.bb:do_collect_spdx_deps)
NOTE: Running task 4274 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.21.bb:do_collect_spdx_deps)
NOTE: recipe gsettings-desktop-schemas-47.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxmlb-0.3.21-r0: task do_collect_spdx_deps: Started
NOTE: recipe gsettings-desktop-schemas-47.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4278 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.6.bb:do_collect_spdx_deps)
NOTE: recipe libxmlb-0.3.21-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4279 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.8.2.bb:do_collect_spdx_deps)
NOTE: recipe libsecret-0.21.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe enchant2-2.8.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libsecret-0.21.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe enchant2-2.8.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4290 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.6.bb:do_collect_spdx_deps)
NOTE: recipe json-glib-1.10.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_configure: Succeeded
NOTE: Running task 4295 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_compile)
NOTE: recipe json-glib-1.10.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe desktop-file-utils-0.28-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_configure: Succeeded
NOTE: Running task 4296 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_compile)
NOTE: recipe shared-mime-info-2.4-r0: task do_compile: Started
NOTE: recipe libgudev-238-r0: task do_configure: Succeeded
NOTE: Running task 4297 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_compile)
NOTE: recipe libgudev-238-r0: task do_compile: Started
NOTE: recipe gsettings-desktop-schemas-47.1-r0: task do_configure: Succeeded
NOTE: recipe libxmlb-0.3.21-r0: task do_configure: Succeeded
NOTE: recipe json-glib-1.10.6-r0: task do_configure: Succeeded
NOTE: Running task 4298 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_47.1.bb:do_compile)
NOTE: Running task 4299 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.21.bb:do_configure_ptest_base)
NOTE: Running task 4300 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.6.bb:do_configure_ptest_base)
NOTE: recipe desktop-file-utils-0.28-r0: task do_compile: Succeeded
NOTE: Running task 4301 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_install)
NOTE: recipe libsoup-3.6.4-r0: task do_configure: Succeeded
NOTE: Running task 4302 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.6.4.bb:do_compile)
NOTE: recipe gsettings-desktop-schemas-47.1-r0: task do_compile: Started
NOTE: recipe libxmlb-0.3.21-r0: task do_configure_ptest_base: Started
NOTE: recipe json-glib-1.10.6-r0: task do_configure_ptest_base: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_install: Started
NOTE: recipe libsoup-3.6.4-r0: task do_compile: Started
NOTE: recipe libxmlb-0.3.21-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe json-glib-1.10.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 4303 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.21.bb:do_compile)
NOTE: Running task 4304 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.6.bb:do_compile)
NOTE: recipe libsecret-0.21.6-r0: task do_configure: Succeeded
NOTE: Running task 4305 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.6.bb:do_compile)
NOTE: recipe libxmlb-0.3.21-r0: task do_compile: Started
NOTE: recipe json-glib-1.10.6-r0: task do_compile: Started
NOTE: recipe libsecret-0.21.6-r0: task do_compile: Started
NOTE: recipe graphene-1.10.8-r0: task do_configure: Succeeded
NOTE: Running task 4306 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_compile)
NOTE: recipe graphene-1.10.8-r0: task do_compile: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_install: Succeeded
NOTE: recipe gsettings-desktop-schemas-47.1-r0: task do_compile: Succeeded
NOTE: Running task 4307 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_47.1.bb:do_install)
NOTE: Running task 4308 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_populate_sysroot)
NOTE: Running task 4309 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_package)
NOTE: recipe gsettings-desktop-schemas-47.1-r0: task do_install: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_populate_sysroot: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_package: Started
NOTE: recipe at-spi2-core-2.54.1-r0: task do_configure: Succeeded
NOTE: recipe desktop-file-utils-0.28-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4310 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.54.1.bb:do_compile)
NOTE: recipe harfbuzz-10.4.0-r0: task do_configure: Succeeded
NOTE: Running task 4311 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_10.4.0.bb:do_compile)
NOTE: recipe at-spi2-core-2.54.1-r0: task do_compile: Started
NOTE: recipe harfbuzz-10.4.0-r0: task do_compile: Started
NOTE: recipe gsettings-desktop-schemas-47.1-r0: task do_install: Succeeded
NOTE: recipe libgudev-238-r0: task do_compile: Succeeded
NOTE: Running task 4312 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_install)
NOTE: Running task 4313 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_47.1.bb:do_package)
NOTE: Running task 4314 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_47.1.bb:do_populate_sysroot)
NOTE: recipe libgudev-238-r0: task do_install: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_compile: Succeeded
NOTE: Running task 4315 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_install)
NOTE: recipe gsettings-desktop-schemas-47.1-r0: task do_populate_sysroot: Started
NOTE: recipe gsettings-desktop-schemas-47.1-r0: task do_package: Started
NOTE: recipe gstreamer1.0-1.24.12-r0: task do_configure: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_install: Started
NOTE: Running task 4316 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.12.bb:do_configure_ptest_base)
NOTE: recipe gstreamer1.0-1.24.12-r0: task do_configure_ptest_base: Started
NOTE: recipe gstreamer1.0-1.24.12-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 4317 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.12.bb:do_compile)
NOTE: recipe gsettings-desktop-schemas-47.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.24.12-r0: task do_compile: Started
NOTE: recipe libgudev-238-r0: task do_install: Succeeded
NOTE: Running task 4318 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_populate_sysroot)
NOTE: Running task 4319 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_package)
NOTE: recipe libgudev-238-r0: task do_populate_sysroot: Started
NOTE: recipe libgudev-238-r0: task do_package: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_package: Succeeded
NOTE: Running task 4320 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_packagedata)
NOTE: recipe desktop-file-utils-0.28-r0: task do_packagedata: Started
NOTE: recipe libgudev-238-r0: task do_populate_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.28-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_packagedata unihash changed to 1eb0c930ae87cd3322ebe39329138c6ca50a4d528a193a85d0b0dcb13b1d4a8e
NOTE: Setscene tasks completed
NOTE: Running task 4321 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_create_spdx)
NOTE: recipe shared-mime-info-2.4-r0: task do_install: Succeeded
NOTE: recipe desktop-file-utils-0.28-r0: task do_create_spdx: Started
NOTE: Running task 4323 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_prepare_recipe_sysroot)
NOTE: Running task 4324 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_package)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_package: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_create_spdx: Succeeded
NOTE: recipe libxmlb-0.3.21-r0: task do_compile: Succeeded
NOTE: Running task 4325 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.21.bb:do_compile_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4326 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_configure)
NOTE: recipe libxmlb-0.3.21-r0: task do_compile_ptest_base: Started
NOTE: recipe libxmlb-0.3.21-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 4327 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.21.bb:do_install)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_configure: Started
NOTE: recipe libxmlb-0.3.21-r0: task do_install: Started
NOTE: recipe json-glib-1.10.6-r0: task do_compile: Succeeded
NOTE: Running task 4328 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.6.bb:do_compile_ptest_base)
NOTE: recipe json-glib-1.10.6-r0: task do_compile_ptest_base: Started
NOTE: recipe json-glib-1.10.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 4329 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.6.bb:do_install)
NOTE: recipe mesa-2_24.0.7-r0: task do_configure: Succeeded
NOTE: recipe libgudev-238-r0: task do_package: Succeeded
NOTE: Running task 4330 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_compile)
NOTE: Running task 4331 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_packagedata)
NOTE: recipe graphene-1.10.8-r0: task do_compile: Succeeded
NOTE: recipe json-glib-1.10.6-r0: task do_install: Started
NOTE: Running task 4332 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_install)
NOTE: recipe libgudev-238-r0: task do_packagedata: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_compile: Started
NOTE: recipe graphene-1.10.8-r0: task do_install: Started
NOTE: recipe libxmlb-0.3.21-r0: task do_install: Succeeded
NOTE: recipe libsecret-0.21.6-r0: task do_compile: Succeeded
NOTE: Running task 4333 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.6.bb:do_install)
NOTE: Running task 4334 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.21.bb:do_install_ptest_base)
NOTE: recipe libgudev-238-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_packagedata unihash changed to 8557ee9582a39f55fc4b83d5ed1a6f305205837da66da9e568b666f30c9e2586
NOTE: recipe libsecret-0.21.6-r0: task do_install: Started
NOTE: recipe libxmlb-0.3.21-r0: task do_install_ptest_base: Started
NOTE: recipe libxmlb-0.3.21-r0: task do_install_ptest_base: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4335 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_create_spdx)
NOTE: Running task 4336 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.21.bb:do_populate_sysroot)
NOTE: Running task 4337 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.21.bb:do_package)
NOTE: recipe libgudev-238-r0: task do_create_spdx: Started
NOTE: recipe libxmlb-0.3.21-r0: task do_populate_sysroot: Started
NOTE: recipe libxmlb-0.3.21-r0: task do_package: Started
NOTE: recipe at-spi2-core-2.54.1-r0: task do_compile: Succeeded
NOTE: Running task 4338 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.54.1.bb:do_install)
NOTE: recipe json-glib-1.10.6-r0: task do_install: Succeeded
NOTE: Running task 4339 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.6.bb:do_install_ptest_base)
NOTE: recipe graphene-1.10.8-r0: task do_install: Succeeded
NOTE: Running task 4340 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_populate_sysroot)
NOTE: Running task 4341 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_package)
NOTE: recipe libgudev-238-r0: task do_create_spdx: Succeeded
NOTE: recipe at-spi2-core-2.54.1-r0: task do_install: Started
NOTE: recipe json-glib-1.10.6-r0: task do_install_ptest_base: Started
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Started
NOTE: recipe graphene-1.10.8-r0: task do_package: Started
NOTE: recipe libsecret-0.21.6-r0: task do_install: Succeeded
NOTE: recipe libxmlb-0.3.21-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4342 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe json-glib-1.10.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 4343 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.6.bb:do_populate_sysroot)
NOTE: Running task 4344 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.6.bb:do_package)
NOTE: Running task 4345 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.6.bb:do_package)
NOTE: recipe libsecret-0.21.6-r0: task do_populate_sysroot: Started
NOTE: recipe appstream-1.0.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsecret-0.21.6-r0: task do_package: Started
NOTE: recipe json-glib-1.10.6-r0: task do_package: Started
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4346 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.6.bb:do_populate_sysroot)
NOTE: recipe json-glib-1.10.6-r0: task do_populate_sysroot: Started
NOTE: recipe libsecret-0.21.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libsoup-3.6.4-r0: task do_compile: Succeeded
NOTE: Running task 4347 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.6.4.bb:do_install)
NOTE: recipe at-spi2-core-2.54.1-r0: task do_install: Succeeded
NOTE: recipe gsettings-desktop-schemas-47.1-r0: task do_package: Succeeded
NOTE: Running task 4348 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.54.1.bb:do_populate_sysroot)
NOTE: Running task 4349 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.54.1.bb:do_package)
NOTE: recipe appstream-1.0.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe json-glib-1.10.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libsoup-3.6.4-r0: task do_install: Started
NOTE: Running task 4350 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.4.bb:do_configure)
NOTE: Running task 4351 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_47.1.bb:do_packagedata)
NOTE: recipe at-spi2-core-2.54.1-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-core-2.54.1-r0: task do_package: Started
NOTE: recipe gsettings-desktop-schemas-47.1-r0: task do_packagedata: Started
NOTE: recipe appstream-1.0.4-r0: task do_configure: Started
NOTE: recipe at-spi2-core-2.54.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_configure: Succeeded
NOTE: recipe gsettings-desktop-schemas-47.1-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_47.1.bb:do_packagedata unihash changed to 0f7c004fe629ac0e67a46bd0bf5c21107ee9af0dafa2891c35801817bdd3b4a2
NOTE: Setscene tasks completed
NOTE: Running task 4352 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_configure_ptest_base)
NOTE: Running task 4353 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_47.1.bb:do_create_spdx)
NOTE: Running task 4354 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_47.1.bb:do_package_write_ipk)
NOTE: Running task 4355 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_47.1.bb:do_package_write_deb)
NOTE: recipe libsoup-3.6.4-r0: task do_install: Succeeded
NOTE: recipe gsettings-desktop-schemas-47.1-r0: task do_create_spdx: Started
NOTE: Running task 4356 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.6.4.bb:do_populate_sysroot)
NOTE: recipe libxmlb-0.3.21-r0: task do_package: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_configure_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 4357 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_compile)
NOTE: recipe gsettings-desktop-schemas-47.1-r0: task do_package_write_ipk: Started
NOTE: recipe libsoup-3.6.4-r0: task do_populate_sysroot: Started
NOTE: Running task 4358 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.6.4.bb:do_package)
NOTE: recipe gsettings-desktop-schemas-47.1-r0: task do_package_write_deb: Started
NOTE: recipe graphene-1.10.8-r0: task do_package: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_compile: Started
NOTE: Running task 4359 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_packagedata)
NOTE: recipe libsoup-3.6.4-r0: task do_package: Started
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Started
NOTE: recipe gsettings-desktop-schemas-47.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 4360 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.21.bb:do_packagedata)
NOTE: recipe libsoup-3.6.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Succeeded
NOTE: recipe libxmlb-0.3.21-r0: task do_packagedata: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_packagedata unihash changed to 639f31ce41657a15652556f2c7fbdc511551843ce8dfc6ada2e97e28a5d32428
NOTE: Running task 4361 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_create_spdx)
NOTE: Running task 4362 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_47.1.bb:do_package_write_rpm)
NOTE: recipe libxmlb-0.3.21-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.21.bb:do_packagedata unihash changed to 81be96935678d841a120e1de8ea3030c55a6dde1102bdbab01860b386ad38765
NOTE: recipe graphene-1.10.8-r0: task do_create_spdx: Started
NOTE: recipe gsettings-desktop-schemas-47.1-r0: task do_package_write_rpm: Started
NOTE: Setscene tasks completed
NOTE: Running task 4363 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.21.bb:do_create_spdx)
NOTE: recipe libxmlb-0.3.21-r0: task do_create_spdx: Started
NOTE: recipe graphene-1.10.8-r0: task do_create_spdx: Succeeded
NOTE: Running task 4364 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_47.1.bb:do_package_qa)
NOTE: recipe gsettings-desktop-schemas-47.1-r0: task do_package_qa: Started
NOTE: recipe libxmlb-0.3.21-r0: task do_create_spdx: Succeeded
NOTE: Running task 4365 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.4.bb:do_collect_spdx_deps)
NOTE: recipe appstream-1.0.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe appstream-1.0.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gsettings-desktop-schemas-47.1-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_47.1.bb:do_package_write_ipk unihash changed to b9c0b8268fc5fc1a4089751d4f9d48a9e68c16c413c5f589bb8a1e3f26e5b3fa
NOTE: recipe gsettings-desktop-schemas-47.1-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_47.1.bb:do_package_write_deb unihash changed to 589c6ce2b3483bef1d723a7c4ad28ba9ba4fef61c5f18284b0d06879f699ff9b
NOTE: recipe gsettings-desktop-schemas-47.1-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_47.1.bb:do_package_qa unihash changed to 597d94cc541bc94893a6f513347e626ff3befc55bffc176d1bc5a67f0af28041
NOTE: recipe appstream-1.0.4-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4366 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.4.bb:do_compile)
NOTE: recipe appstream-1.0.4-r0: task do_compile: Started
NOTE: recipe gsettings-desktop-schemas-47.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_47.1.bb:do_package_write_rpm unihash changed to 8ec912e11971477257b2ff999d193097c4c056fcb8eda9f1d150a7c984275d64
NOTE: recipe libsecret-0.21.6-r0: task do_package: Succeeded
NOTE: Running task 4367 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.6.bb:do_packagedata)
NOTE: recipe libsecret-0.21.6-r0: task do_packagedata: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_package: Succeeded
NOTE: Running task 4368 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_packagedata)
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata: Started
NOTE: recipe json-glib-1.10.6-r0: task do_package: Succeeded
NOTE: Running task 4369 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.6.bb:do_packagedata)
NOTE: recipe json-glib-1.10.6-r0: task do_packagedata: Started
NOTE: recipe libsecret-0.21.6-r0: task do_packagedata: Succeeded
NOTE: Running task 4370 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.6.bb:do_create_spdx)
NOTE: recipe libsecret-0.21.6-r0: task do_create_spdx: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_packagedata unihash changed to 8f52414d31262acf8098672e54fafd7b6ce5197a7efd62bb61c920f187c4dc0c
NOTE: Running task 4371 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_create_spdx)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_compile: Succeeded
NOTE: Running task 4372 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_package_write_ipk)
NOTE: Running task 4373 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_compile_ptest_base)
NOTE: Running task 4374 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_package_write_deb)
NOTE: recipe json-glib-1.10.6-r0: task do_packagedata: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_create_spdx: Started
NOTE: Running task 4375 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_package_write_rpm)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.6.bb:do_packagedata unihash changed to f3102f350dd1470a2585ff662ae4ca7daeceda278eaf8f12daedc2c3c4560b95
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_package_write_ipk: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_package_write_deb: Started
NOTE: Setscene tasks completed
NOTE: Running task 4376 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_install)
NOTE: recipe gstreamer1.0-1.24.12-r0: task do_compile: Succeeded
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_package_write_rpm: Started
NOTE: Running task 4377 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.6.bb:do_create_spdx)
NOTE: Running task 4378 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.12.bb:do_compile_ptest_base)
NOTE: recipe libsecret-0.21.6-r0: task do_create_spdx: Succeeded
NOTE: Running task 4379 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_package_qa)
NOTE: recipe json-glib-1.10.6-r0: task do_create_spdx: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.24.12-r0: task do_compile_ptest_base: Started
NOTE: recipe gstreamer1.0-1.24.12-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_package_qa: Started
NOTE: Running task 4380 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.12.bb:do_install)
NOTE: recipe gstreamer1.0-1.24.12-r0: task do_install: Started
NOTE: recipe json-glib-1.10.6-r0: task do_create_spdx: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 4381 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_collect_spdx_deps)
NOTE: recipe libsoup-3.6.4-r0: task do_package: Succeeded
NOTE: Running task 4382 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.6.4.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_collect_spdx_deps: Started
NOTE: recipe libsoup-3.6.4-r0: task do_packagedata: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_install: Succeeded
NOTE: recipe libsoup-3.6.4-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.6.4.bb:do_packagedata unihash changed to 5db8b782e0c916959670080306bf12cec1fb8fdcb2d925c1421908b002bf3cae
NOTE: Setscene tasks completed
NOTE: Running task 4383 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_install_ptest_base)
NOTE: Running task 4384 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.6.4.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-1.24.12-r0: task do_install: Succeeded
NOTE: Running task 4385 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.12.bb:do_install_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_install_ptest_base: Started
NOTE: recipe libsoup-3.6.4-r0: task do_create_spdx: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_install_ptest_base: Succeeded
NOTE: recipe gstreamer1.0-1.24.12-r0: task do_install_ptest_base: Started
NOTE: Running task 4387 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_package)
NOTE: Running task 4388 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-1.24.12-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 4389 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.12.bb:do_populate_sysroot)
NOTE: Running task 4390 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.12.bb:do_package)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_package: Started
NOTE: recipe libnotify-0.8.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-1.24.12-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-1.24.12-r0: task do_package: Started
NOTE: recipe enchant2-2.8.2-r0: task do_configure: Succeeded
NOTE: Running task 4391 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.8.2.bb:do_compile)
NOTE: recipe libsoup-3.6.4-r0: task do_create_spdx: Succeeded
NOTE: recipe at-spi2-core-2.54.1-r0: task do_package: Succeeded
NOTE: Running task 4392 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.54.1.bb:do_packagedata)
NOTE: recipe enchant2-2.8.2-r0: task do_compile: Started
NOTE: recipe appstream-1.0.4-r0: task do_compile: Succeeded
NOTE: Running task 4393 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.4.bb:do_install)
NOTE: recipe at-spi2-core-2.54.1-r0: task do_packagedata: Started
NOTE: recipe libnotify-0.8.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4394 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.4.bb:do_configure)
NOTE: recipe gstreamer1.0-1.24.12-r0: task do_populate_sysroot: Succeeded
NOTE: recipe appstream-1.0.4-r0: task do_install: Started
NOTE: recipe libnotify-0.8.4-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_package_write_ipk unihash changed to bd7ffff0a85782fde38b0e92ff18b5692fd7b1f61502eb3e1301c9899da4c040
NOTE: recipe at-spi2-core-2.54.1-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.54.1.bb:do_packagedata unihash changed to e932ee11a0f64ebf7d3767a7419854f659f4910a55be911b560b4cf2142e08e2
NOTE: Setscene tasks completed
NOTE: Running task 4395 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.54.1.bb:do_create_spdx)
NOTE: recipe at-spi2-core-2.54.1-r0: task do_create_spdx: Started
NOTE: recipe appstream-1.0.4-r0: task do_install: Succeeded
NOTE: Running task 4396 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.4.bb:do_populate_sysroot)
NOTE: Running task 4397 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.4.bb:do_package)
NOTE: recipe appstream-1.0.4-r0: task do_populate_sysroot: Started
NOTE: recipe appstream-1.0.4-r0: task do_package: Started
NOTE: recipe appstream-1.0.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe at-spi2-core-2.54.1-r0: task do_create_spdx: Succeeded
NOTE: recipe libnotify-0.8.4-r0: task do_configure: Succeeded
NOTE: Running task 4398 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.4.bb:do_compile)
NOTE: recipe libnotify-0.8.4-r0: task do_compile: Started
NOTE: recipe enchant2-2.8.2-r0: task do_compile: Succeeded
NOTE: Running task 4399 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.8.2.bb:do_install)
NOTE: recipe enchant2-2.8.2-r0: task do_install: Started
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_package_write_rpm unihash changed to fbe5ed4142c23c39cae6dfb10e5afa2230bf409c5a15b37ccfda4402006c2815
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_package_qa unihash changed to 886af7faaaa76e2cdce58dc24fd6980142bd0645b2c66f185f19b7d670a70710
NOTE: recipe enchant2-2.8.2-r0: task do_install: Succeeded
NOTE: Running task 4400 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.8.2.bb:do_populate_sysroot)
NOTE: Running task 4401 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.8.2.bb:do_package)
NOTE: recipe enchant2-2.8.2-r0: task do_populate_sysroot: Started
NOTE: recipe enchant2-2.8.2-r0: task do_package: Started
NOTE: recipe enchant2-2.8.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libnotify-0.8.4-r0: task do_compile: Succeeded
NOTE: Running task 4402 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.4.bb:do_install)
NOTE: recipe libnotify-0.8.4-r0: task do_install: Started
NOTE: recipe appstream-1.0.4-r0: task do_package: Succeeded
NOTE: Running task 4403 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.4.bb:do_packagedata)
NOTE: recipe appstream-1.0.4-r0: task do_packagedata: Started
NOTE: recipe enchant2-2.8.2-r0: task do_package: Succeeded
NOTE: Running task 4404 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.8.2.bb:do_packagedata)
NOTE: recipe libnotify-0.8.4-r0: task do_install: Succeeded
NOTE: recipe enchant2-2.8.2-r0: task do_packagedata: Started
NOTE: Running task 4405 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.4.bb:do_populate_sysroot)
NOTE: recipe libnotify-0.8.4-r0: task do_populate_sysroot: Started
NOTE: recipe enchant2-2.8.2-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.8.2.bb:do_packagedata unihash changed to b9edd48e8923144dbff8421524eb1e704800390ced893cb52d1bff044b8feb60
NOTE: recipe appstream-1.0.4-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.4.bb:do_packagedata unihash changed to f37e4ce977e63ba7adc7ad2a4c1795f2131d9b6b0ba5dd17224fc59144c5dea5
NOTE: Setscene tasks completed
NOTE: Running task 4406 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.8.2.bb:do_create_spdx)
NOTE: Running task 4407 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.4.bb:do_create_spdx)
NOTE: recipe libnotify-0.8.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe enchant2-2.8.2-r0: task do_create_spdx: Started
NOTE: recipe appstream-1.0.4-r0: task do_create_spdx: Started
NOTE: recipe enchant2-2.8.2-r0: task do_create_spdx: Succeeded
NOTE: recipe appstream-1.0.4-r0: task do_create_spdx: Succeeded
NOTE: recipe gstreamer1.0-1.24.12-r0: task do_package: Succeeded
NOTE: Running task 4408 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.12.bb:do_packagedata)
NOTE: recipe gstreamer1.0-1.24.12-r0: task do_packagedata: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_package: Succeeded
NOTE: Running task 4409 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-1.24.12-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.12.bb:do_packagedata unihash changed to 3c83436b7e5647e073665509541707737d5c9baab9265961f8d46ecfd1504cb9
NOTE: Running task 4410 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.12.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-1.24.12-r0: task do_create_spdx: Started
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_package_write_deb unihash changed to 016a53d794396669afea8d53e0ea81fcbb02af859675065bdeda27f5391253c6
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_packagedata unihash changed to 2949c0eea458bb49027204d45980d450967d1aac52ca1a0940c1ff340e51c32c
NOTE: Setscene tasks completed
NOTE: Running task 4411 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_create_spdx)
NOTE: Running task 4412 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.4.bb:do_package)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_create_spdx: Started
NOTE: recipe libnotify-0.8.4-r0: task do_package: Started
NOTE: recipe gstreamer1.0-1.24.12-r0: task do_create_spdx: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_create_spdx: Succeeded
NOTE: Running task 4413 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.4.bb:do_collect_spdx_deps)
NOTE: recipe libnotify-0.8.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe libnotify-0.8.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libnotify-0.8.4-r0: task do_package: Succeeded
NOTE: Running task 4414 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.4.bb:do_packagedata)
NOTE: recipe libnotify-0.8.4-r0: task do_packagedata: Started
NOTE: recipe libnotify-0.8.4-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.4.bb:do_packagedata unihash changed to 778c8a19a69bef877778963d5a07fa8c059dfc6bc37a29c38617c2f02b7cd15b
NOTE: Setscene tasks completed
NOTE: Running task 4415 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.4.bb:do_create_spdx)
NOTE: recipe libnotify-0.8.4-r0: task do_create_spdx: Started
NOTE: recipe libnotify-0.8.4-r0: task do_create_spdx: Succeeded
NOTE: recipe harfbuzz-10.4.0-r0: task do_compile: Succeeded
NOTE: Running task 4416 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_10.4.0.bb:do_install)
NOTE: recipe harfbuzz-10.4.0-r0: task do_install: Started
NOTE: recipe harfbuzz-10.4.0-r0: task do_install: Succeeded
NOTE: Running task 4417 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_10.4.0.bb:do_populate_sysroot)
NOTE: Running task 4418 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_10.4.0.bb:do_package)
NOTE: recipe harfbuzz-10.4.0-r0: task do_populate_sysroot: Started
NOTE: recipe harfbuzz-10.4.0-r0: task do_package: Started
NOTE: recipe harfbuzz-10.4.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4419 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.56.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.56.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.56.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4420 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.56.1.bb:do_configure)
NOTE: recipe pango-1.56.1-r0: task do_configure: Started
NOTE: recipe harfbuzz-10.4.0-r0: task do_package: Succeeded
NOTE: Running task 4421 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_10.4.0.bb:do_packagedata)
NOTE: recipe harfbuzz-10.4.0-r0: task do_packagedata: Started
NOTE: recipe harfbuzz-10.4.0-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_10.4.0.bb:do_packagedata unihash changed to 29960c88e3d5e3ead0c71629f53b7479016131f1fda0ec33ce0f55c1abef2039
NOTE: Setscene tasks completed
NOTE: Running task 4422 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_10.4.0.bb:do_create_spdx)
NOTE: recipe pango-1.56.1-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4423 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.56.1.bb:do_compile)
NOTE: recipe harfbuzz-10.4.0-r0: task do_create_spdx: Started
NOTE: recipe pango-1.56.1-r0: task do_compile: Started
NOTE: recipe harfbuzz-10.4.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 4424 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.56.1.bb:do_collect_spdx_deps)
NOTE: recipe pango-1.56.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe pango-1.56.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe pango-1.56.1-r0: task do_compile: Succeeded
NOTE: Running task 4425 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.56.1.bb:do_install)
NOTE: recipe pango-1.56.1-r0: task do_install: Started
NOTE: recipe pango-1.56.1-r0: task do_install: Succeeded
NOTE: Running task 4426 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.56.1.bb:do_populate_sysroot)
NOTE: Running task 4427 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.56.1.bb:do_package)
NOTE: recipe pango-1.56.1-r0: task do_populate_sysroot: Started
NOTE: recipe pango-1.56.1-r0: task do_package: Started
NOTE: recipe pango-1.56.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4428 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.59.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe librsvg-2.59.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe librsvg-2.59.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4429 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.59.2.bb:do_rust_create_wrappers)
NOTE: recipe librsvg-2.59.2-r0: task do_rust_create_wrappers: Started
NOTE: recipe librsvg-2.59.2-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 4430 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.59.2.bb:do_configure)
NOTE: recipe librsvg-2.59.2-r0: task do_configure: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_compile: Succeeded
NOTE: Running task 4431 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_install)
NOTE: recipe pango-1.56.1-r0: task do_package: Succeeded
NOTE: Running task 4432 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.56.1.bb:do_packagedata)
NOTE: recipe mesa-2_24.0.7-r0: task do_install: Started
NOTE: recipe pango-1.56.1-r0: task do_packagedata: Started
NOTE: recipe pango-1.56.1-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.56.1.bb:do_packagedata unihash changed to 1d7149044693221786734a2e3991549997ad16045e4005518f92f385722c4548
NOTE: Setscene tasks completed
NOTE: Running task 4433 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.56.1.bb:do_create_spdx)
NOTE: recipe pango-1.56.1-r0: task do_create_spdx: Started
NOTE: recipe pango-1.56.1-r0: task do_create_spdx: Succeeded
NOTE: recipe mesa-2_24.0.7-r0: task do_install: Succeeded
NOTE: Running task 4434 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.59.2.bb:do_collect_spdx_deps)
NOTE: Running task 4435 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_populate_sysroot)
NOTE: Running task 4436 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_package)
NOTE: recipe mesa-2_24.0.7-r0: task do_populate_sysroot: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_package: Started
NOTE: recipe librsvg-2.59.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe librsvg-2.59.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe librsvg-2.59.2-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4437 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.59.2.bb:do_compile)
NOTE: recipe librsvg-2.59.2-r0: task do_compile: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4438 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 4439 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 4440 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libepoxy-1.5.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libwpe-1.16.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libwpe-1.16.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4441 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.2.bb:do_configure)
NOTE: recipe libepoxy-1.5.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4442 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_configure)
NOTE: recipe libglu-2_9.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4443 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_configure)
NOTE: recipe libwpe-1.16.2-r0: task do_configure: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_configure: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_configure: Started
NOTE: recipe libwpe-1.16.2-r0: task do_configure: Succeeded
NOTE: Running task 4444 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.2.bb:do_compile)
NOTE: recipe libwpe-1.16.2-r0: task do_compile: Started
NOTE: recipe libwpe-1.16.2-r0: task do_compile: Succeeded
NOTE: Running task 4445 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.2.bb:do_install)
NOTE: recipe libglu-2_9.0.3-r0: task do_configure: Succeeded
NOTE: Running task 4446 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_compile)
NOTE: recipe libwpe-1.16.2-r0: task do_install: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_compile: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_configure: Succeeded
NOTE: Running task 4447 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_compile)
NOTE: recipe libwpe-1.16.2-r0: task do_install: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_compile: Started
NOTE: Running task 4448 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.2.bb:do_populate_sysroot)
NOTE: recipe libwpe-1.16.2-r0: task do_populate_sysroot: Started
NOTE: recipe libwpe-1.16.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_compile: Succeeded
NOTE: Running task 4449 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_install)
NOTE: recipe libglu-2_9.0.3-r0: task do_install: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_install: Succeeded
NOTE: Running task 4450 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_populate_sysroot)
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4451 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.24.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4452 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.12.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.24.12-r0: task do_configure: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_package: Succeeded
NOTE: Running task 4453 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_packagedata)
NOTE: recipe mesa-2_24.0.7-r0: task do_packagedata: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_packagedata: Succeeded
NOTE: Running task 4454 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_package)
NOTE: Running task 4455 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_create_spdx)
NOTE: Running task 4456 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.2.bb:do_package)
NOTE: recipe libglu-2_9.0.3-r0: task do_package: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_create_spdx: Started
NOTE: recipe libwpe-1.16.2-r0: task do_package: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_compile: Succeeded
NOTE: Running task 4457 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_install)
NOTE: recipe libepoxy-1.5.10-r0: task do_install: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_create_spdx: Succeeded
NOTE: recipe libwpe-1.16.2-r0: task do_package: Succeeded
NOTE: Running task 4458 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_collect_spdx_deps)
NOTE: Running task 4459 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.2.bb:do_packagedata)
NOTE: Running task 4460 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_collect_spdx_deps)
NOTE: Running task 4461 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.2.bb:do_collect_spdx_deps)
NOTE: recipe libepoxy-1.5.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe libwpe-1.16.2-r0: task do_packagedata: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_package: Succeeded
NOTE: recipe libwpe-1.16.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_install: Succeeded
NOTE: Running task 4462 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_packagedata)
NOTE: Running task 4463 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot)
NOTE: Running task 4464 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_package)
NOTE: recipe libepoxy-1.5.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libwpe-1.16.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_package: Started
NOTE: recipe libwpe-1.16.2-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.2.bb:do_packagedata unihash changed to 45b546a92ea6cf00757645463e37fb4218a511b2c448ffee4053014f483326f1
NOTE: Setscene tasks completed
NOTE: Running task 4465 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.2.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-plugins-base-1.24.12-r0: task do_configure: Succeeded
NOTE: Running task 4466 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.12.bb:do_compile)
NOTE: recipe libwpe-1.16.2-r0: task do_create_spdx: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_packagedata unihash changed to 9e07d13dba066a3ed2ff29a7a9bb79483f235b3f2ea2975a35daca64d13a55a0
NOTE: recipe gstreamer1.0-plugins-base-1.24.12-r0: task do_compile: Started
NOTE: Setscene tasks completed
NOTE: Running task 4467 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_create_spdx)
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4468 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_prepare_recipe_sysroot)
NOTE: recipe libwpe-1.16.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 4469 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libglu-2_9.0.3-r0: task do_create_spdx: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wpebackend-fdo-1.14.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 4470 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.12.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-base-1.24.12-r0: task do_collect_spdx_deps: Started
NOTE: recipe wpebackend-fdo-1.14.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4471 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.3.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.24.12-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe wpebackend-fdo-1.14.3-r0: task do_configure: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4472 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_configure)
NOTE: recipe gtk+3-3.24.43-r0: task do_configure: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_package: Succeeded
NOTE: Running task 4473 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata)
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata unihash changed to d77f10842f8a9aeee9fc61e700c3a095eefc103b281e9bec48a7a1312f96504b
NOTE: Setscene tasks completed
NOTE: Running task 4474 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_create_spdx)
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx: Succeeded
NOTE: Running task 4475 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_collect_spdx_deps)
NOTE: Running task 4476 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.3.bb:do_collect_spdx_deps)
NOTE: recipe gtk+3-3.24.43-r0: task do_collect_spdx_deps: Started
NOTE: recipe wpebackend-fdo-1.14.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe wpebackend-fdo-1.14.3-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4477 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.3.bb:do_compile)
NOTE: recipe wpebackend-fdo-1.14.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe wpebackend-fdo-1.14.3-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe wpebackend-fdo-1.14.3-r0: task do_compile: Succeeded
NOTE: Running task 4478 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.3.bb:do_install)
NOTE: recipe wpebackend-fdo-1.14.3-r0: task do_install: Started
NOTE: recipe wpebackend-fdo-1.14.3-r0: task do_install: Succeeded
NOTE: Running task 4479 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.3.bb:do_populate_sysroot)
NOTE: Running task 4480 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.3.bb:do_package)
NOTE: recipe wpebackend-fdo-1.14.3-r0: task do_populate_sysroot: Started
NOTE: recipe wpebackend-fdo-1.14.3-r0: task do_package: Started
NOTE: recipe wpebackend-fdo-1.14.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gtk+3-3.24.43-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4481 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_compile)
NOTE: recipe gtk+3-3.24.43-r0: task do_compile: Started
NOTE: recipe wpebackend-fdo-1.14.3-r0: task do_package: Succeeded
NOTE: Running task 4482 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.3.bb:do_packagedata)
NOTE: recipe wpebackend-fdo-1.14.3-r0: task do_packagedata: Started
NOTE: recipe wpebackend-fdo-1.14.3-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.3.bb:do_packagedata unihash changed to ebf8bfe246ddbf1620d0dccaa3ca6d2836ff18ce4dede1a238f781adcfb4b9a1
NOTE: Setscene tasks completed
NOTE: Running task 4483 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.3.bb:do_create_spdx)
NOTE: recipe wpebackend-fdo-1.14.3-r0: task do_create_spdx: Started
NOTE: recipe wpebackend-fdo-1.14.3-r0: task do_create_spdx: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.24.12-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4484 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.12.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-base-1.24.12-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.12-r0: task do_install: Succeeded
NOTE: Running task 4485 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.12.bb:do_populate_sysroot)
NOTE: Running task 4486 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.12.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-base-1.24.12-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.12-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.12-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.24.12-r0: task do_package: Succeeded
NOTE: Running task 4487 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.12.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-base-1.24.12-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.12-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.12.bb:do_packagedata unihash changed to 64e2f1a284d093093e6ca063dde333274ac453347c1616b6c328e08aad2f636e
NOTE: Setscene tasks completed
NOTE: Running task 4488 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.12.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-plugins-base-1.24.12-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.12-r0: task do_create_spdx: Succeeded
NOTE: recipe gtk+3-3.24.43-r0: task do_compile: Succeeded
NOTE: Running task 4489 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_install)
NOTE: recipe gtk+3-3.24.43-r0: task do_install: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_install: Succeeded
NOTE: Running task 4490 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_populate_sysroot)
NOTE: Running task 4491 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_package)
NOTE: recipe gtk+3-3.24.43-r0: task do_populate_sysroot: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_package: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4492 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 4493 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libdazzle-3.44.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libhandy-1.8.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libhandy-1.8.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4499 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_configure)
NOTE: Running task 4500 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_configure)
NOTE: recipe libdazzle-3.44.0-r0: task do_configure: Started
NOTE: recipe libhandy-1.8.3-r0: task do_configure: Started
NOTE: recipe libhandy-1.8.3-r0: task do_configure: Succeeded
NOTE: Running task 4501 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_compile)
NOTE: recipe libhandy-1.8.3-r0: task do_compile: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_configure: Succeeded
NOTE: Running task 4502 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_compile)
NOTE: recipe libdazzle-3.44.0-r0: task do_compile: Started
NOTE: recipe libhandy-1.8.3-r0: task do_compile: Succeeded
NOTE: Running task 4503 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_install)
NOTE: recipe libhandy-1.8.3-r0: task do_install: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_package: Succeeded
NOTE: Running task 4504 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_packagedata)
NOTE: recipe gtk+3-3.24.43-r0: task do_packagedata: Started
NOTE: recipe libhandy-1.8.3-r0: task do_install: Succeeded
NOTE: Running task 4505 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_populate_sysroot)
NOTE: recipe libhandy-1.8.3-r0: task do_populate_sysroot: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_packagedata unihash changed to 86ce1836b84d00e88aade6aa09d0eba2325176e1d7f734ec1416dc71414a836d
NOTE: Setscene tasks completed
NOTE: Running task 4506 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_package)
NOTE: Running task 4508 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_create_spdx)
NOTE: recipe libhandy-1.8.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libhandy-1.8.3-r0: task do_package: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_create_spdx: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4514 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_install)
NOTE: recipe libdazzle-3.44.0-r0: task do_install: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_install: Succeeded
NOTE: Running task 4515 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_package)
NOTE: Running task 4516 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_populate_sysroot)
NOTE: recipe gtk+3-3.24.43-r0: task do_create_spdx: Succeeded
NOTE: recipe libdazzle-3.44.0-r0: task do_package: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_populate_sysroot: Started
NOTE: Running task 4517 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_collect_spdx_deps)
NOTE: Running task 4518 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_collect_spdx_deps)
NOTE: recipe libdazzle-3.44.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libhandy-1.8.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libhandy-1.8.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libdazzle-3.44.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libhandy-1.8.3-r0: task do_package: Succeeded
NOTE: Running task 4521 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_packagedata)
NOTE: recipe libhandy-1.8.3-r0: task do_packagedata: Started
NOTE: recipe libhandy-1.8.3-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_packagedata unihash changed to b5f2eb1439bfe10cdb0bf9f09eaf73b58cdd9f4330095f7551a7f58499863f43
NOTE: Setscene tasks completed
NOTE: Running task 4522 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_create_spdx)
NOTE: recipe libhandy-1.8.3-r0: task do_create_spdx: Started
NOTE: recipe libhandy-1.8.3-r0: task do_create_spdx: Succeeded
NOTE: recipe libdazzle-3.44.0-r0: task do_package: Succeeded
NOTE: Running task 4523 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_packagedata)
NOTE: recipe libdazzle-3.44.0-r0: task do_packagedata: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_packagedata unihash changed to 7f3ab27ea000ffd4fb901341cc7e7942fc8cc8dd25915b33b93c10d5cc5adb14
NOTE: Setscene tasks completed
NOTE: Running task 4524 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_create_spdx)
NOTE: recipe libdazzle-3.44.0-r0: task do_create_spdx: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_create_spdx: Succeeded
NOTE: recipe librsvg-2.59.2-r0: task do_compile: Succeeded
NOTE: Running task 4525 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.59.2.bb:do_install)
NOTE: recipe librsvg-2.59.2-r0: task do_install: Started
NOTE: recipe librsvg-2.59.2-r0: task do_install: Succeeded
NOTE: Running task 4526 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.59.2.bb:do_populate_sysroot)
NOTE: Running task 4527 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.59.2.bb:do_package)
NOTE: recipe librsvg-2.59.2-r0: task do_populate_sysroot: Started
NOTE: recipe librsvg-2.59.2-r0: task do_package: Started
NOTE: recipe librsvg-2.59.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4528 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4529 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.12.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.12-r0: task do_configure: Started
NOTE: recipe librsvg-2.59.2-r0: task do_package: Succeeded
NOTE: Running task 4530 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.59.2.bb:do_packagedata)
NOTE: recipe librsvg-2.59.2-r0: task do_packagedata: Started
NOTE: recipe librsvg-2.59.2-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.59.2.bb:do_packagedata unihash changed to cf322c6ea62c94b513333c9e74d98140b48ac97870ce1ad3f67d636e6548e612
NOTE: Setscene tasks completed
NOTE: Running task 4531 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.59.2.bb:do_create_spdx)
NOTE: recipe librsvg-2.59.2-r0: task do_create_spdx: Started
NOTE: recipe librsvg-2.59.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 4532 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.12.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.12-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.12-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.24.12-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4533 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.12.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.12-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.12-r0: task do_compile: Succeeded
NOTE: Running task 4534 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.12.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.12-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.12-r0: task do_install: Succeeded
NOTE: Running task 4535 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.12.bb:do_populate_sysroot)
NOTE: Running task 4536 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.12.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.12-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.12-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.12-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4537 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk4-4.16.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk4-4.16.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4538 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.12.bb:do_configure)
NOTE: recipe gtk4-4.16.12-r0: task do_configure: Started
NOTE: recipe gtk4-4.16.12-r0: task do_configure: Succeeded
NOTE: Running task 4539 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.12.bb:do_compile)
NOTE: recipe gtk4-4.16.12-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.12-r0: task do_package: Succeeded
NOTE: Running task 4540 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.12.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.12-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.12-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.12.bb:do_packagedata unihash changed to a63f2534519f118aeb1b2db43c7c801445786ea6ef84543203d703061ddfc09f
NOTE: Setscene tasks completed
NOTE: Running task 4541 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.12.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.12-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.12-r0: task do_create_spdx: Succeeded
NOTE: Running task 4542 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.12.bb:do_collect_spdx_deps)
NOTE: recipe gtk4-4.16.12-r0: task do_collect_spdx_deps: Started
NOTE: recipe gtk4-4.16.12-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gtk4-4.16.12-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4543 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.12.bb:do_install)
NOTE: recipe gtk4-4.16.12-r0: task do_install: Started
NOTE: recipe gtk4-4.16.12-r0: task do_install: Succeeded
NOTE: Running task 4544 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.12.bb:do_populate_sysroot)
NOTE: Running task 4545 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.12.bb:do_package)
NOTE: recipe gtk4-4.16.12-r0: task do_populate_sysroot: Started
NOTE: recipe gtk4-4.16.12-r0: task do_package: Started
NOTE: recipe gtk4-4.16.12-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4546 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.46.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 4547 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.9.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 4548 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 4549 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.6.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe webkitgtk-2.46.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libportal-0.9.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gcr-4.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libadwaita-1.6.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libportal-0.9.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4550 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.9.1.bb:do_configure)
NOTE: recipe webkitgtk-2.46.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libadwaita-1.6.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4551 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.46.6.bb:do_configure)
NOTE: Running task 4552 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.6.4.bb:do_configure)
NOTE: recipe libportal-0.9.1-r0: task do_configure: Started
NOTE: recipe webkitgtk-2.46.6-r0: task do_configure: Started
NOTE: recipe gcr-4.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4553 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.0.bb:do_configure)
NOTE: recipe libadwaita-1.6.4-r0: task do_configure: Started
NOTE: recipe gcr-4.3.0-r0: task do_configure: Started
NOTE: recipe libportal-0.9.1-r0: task do_configure: Succeeded
NOTE: Running task 4554 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.9.1.bb:do_compile)
NOTE: recipe libportal-0.9.1-r0: task do_compile: Started
NOTE: recipe gcr-4.3.0-r0: task do_configure: Succeeded
NOTE: Running task 4555 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.0.bb:do_compile)
NOTE: recipe gcr-4.3.0-r0: task do_compile: Started
NOTE: recipe libadwaita-1.6.4-r0: task do_configure: Succeeded
NOTE: Running task 4556 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.6.4.bb:do_compile)
NOTE: recipe libadwaita-1.6.4-r0: task do_compile: Started
NOTE: recipe gcr-4.3.0-r0: task do_compile: Succeeded
NOTE: Running task 4557 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.0.bb:do_install)
NOTE: recipe gcr-4.3.0-r0: task do_install: Started
NOTE: recipe libportal-0.9.1-r0: task do_compile: Succeeded
NOTE: Running task 4558 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.9.1.bb:do_install)
NOTE: recipe libportal-0.9.1-r0: task do_install: Started
NOTE: recipe gcr-4.3.0-r0: task do_install: Succeeded
NOTE: Running task 4559 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.0.bb:do_populate_sysroot)
NOTE: recipe gcr-4.3.0-r0: task do_populate_sysroot: Started
NOTE: recipe libportal-0.9.1-r0: task do_install: Succeeded
NOTE: Running task 4560 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.9.1.bb:do_populate_sysroot)
NOTE: recipe libportal-0.9.1-r0: task do_populate_sysroot: Started
NOTE: recipe gcr-4.3.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libportal-0.9.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gtk4-4.16.12-r0: task do_package: Succeeded
NOTE: Running task 4561 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.12.bb:do_packagedata)
NOTE: recipe gtk4-4.16.12-r0: task do_packagedata: Started
NOTE: recipe gtk4-4.16.12-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.12.bb:do_packagedata unihash changed to 449d24a56fae9101f2d57cef86401f9864a9edad92d12f3e961b8e76ae63d2de
NOTE: Setscene tasks completed
NOTE: Running task 4562 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.9.1.bb:do_package)
NOTE: Running task 4563 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.0.bb:do_package)
NOTE: Running task 4564 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.12.bb:do_create_spdx)
NOTE: recipe libportal-0.9.1-r0: task do_package: Started
NOTE: recipe gcr-4.3.0-r0: task do_package: Started
NOTE: recipe gtk4-4.16.12-r0: task do_create_spdx: Started
NOTE: recipe gtk4-4.16.12-r0: task do_create_spdx: Succeeded
NOTE: Running task 4565 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.46.6.bb:do_collect_spdx_deps)
NOTE: Running task 4566 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.9.1.bb:do_collect_spdx_deps)
NOTE: Running task 4567 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.0.bb:do_collect_spdx_deps)
NOTE: Running task 4568 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.6.4.bb:do_collect_spdx_deps)
NOTE: recipe webkitgtk-2.46.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe libportal-0.9.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe gcr-4.3.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libadwaita-1.6.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe libportal-0.9.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe webkitgtk-2.46.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libadwaita-1.6.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gcr-4.3.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libadwaita-1.6.4-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4569 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.6.4.bb:do_install)
NOTE: recipe libadwaita-1.6.4-r0: task do_install: Started
NOTE: recipe libportal-0.9.1-r0: task do_package: Succeeded
NOTE: Running task 4570 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.9.1.bb:do_packagedata)
NOTE: recipe libportal-0.9.1-r0: task do_packagedata: Started
NOTE: recipe libportal-0.9.1-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.9.1.bb:do_packagedata unihash changed to 47316cfed1d76206efa5f5209caae553d7d8d274b3108bca371d6d3fb9bbf6bd
NOTE: recipe libadwaita-1.6.4-r0: task do_install: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4571 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.9.1.bb:do_create_spdx)
NOTE: Running task 4572 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.6.4.bb:do_package)
NOTE: Running task 4573 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.6.4.bb:do_populate_sysroot)
NOTE: recipe libportal-0.9.1-r0: task do_create_spdx: Started
NOTE: recipe libadwaita-1.6.4-r0: task do_package: Started
NOTE: recipe libadwaita-1.6.4-r0: task do_populate_sysroot: Started
NOTE: recipe libportal-0.9.1-r0: task do_create_spdx: Succeeded
NOTE: recipe libadwaita-1.6.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gcr-4.3.0-r0: task do_package: Succeeded
NOTE: Running task 4574 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.0.bb:do_packagedata)
NOTE: recipe gcr-4.3.0-r0: task do_packagedata: Started
NOTE: recipe gcr-4.3.0-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.0.bb:do_packagedata unihash changed to 6886a0f42d074d052223d5c177953e0c3c342aee085f3a7f809e3fa0e7464379
NOTE: Setscene tasks completed
NOTE: Running task 4575 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.0.bb:do_create_spdx)
NOTE: recipe gcr-4.3.0-r0: task do_create_spdx: Started
NOTE: recipe gcr-4.3.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libadwaita-1.6.4-r0: task do_package: Succeeded
NOTE: Running task 4576 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.6.4.bb:do_packagedata)
NOTE: recipe libadwaita-1.6.4-r0: task do_packagedata: Started
NOTE: recipe libadwaita-1.6.4-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.6.4.bb:do_packagedata unihash changed to 27f05f5d45581a9b5b15d24d5adb9dd35e86b866652036e9f4ccc1ba3c3a7f7f
NOTE: Setscene tasks completed
NOTE: Running task 4577 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.6.4.bb:do_create_spdx)
NOTE: recipe libadwaita-1.6.4-r0: task do_create_spdx: Started
NOTE: recipe libadwaita-1.6.4-r0: task do_create_spdx: Succeeded
NOTE: recipe webkitgtk-2.46.6-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4578 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.46.6.bb:do_compile)
NOTE: recipe webkitgtk-2.46.6-r0: task do_compile: Started
Bitbake still alive (no events for 600s). Active tasks:
/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.46.6.bb:do_compile
Bitbake still alive (no events for 1200s). Active tasks:
/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.46.6.bb:do_compile
NOTE: recipe webkitgtk-2.46.6-r0: task do_compile: Succeeded
NOTE: Running task 4579 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.46.6.bb:do_install)
NOTE: recipe webkitgtk-2.46.6-r0: task do_install: Started
NOTE: recipe webkitgtk-2.46.6-r0: task do_install: Succeeded
NOTE: Running task 4580 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.46.6.bb:do_package)
NOTE: Running task 4581 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.46.6.bb:do_populate_sysroot)
NOTE: recipe webkitgtk-2.46.6-r0: task do_package: Started
NOTE: recipe webkitgtk-2.46.6-r0: task do_populate_sysroot: Started
NOTE: recipe webkitgtk-2.46.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4582 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_48.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe epiphany-48.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe epiphany-48.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4583 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_48.0.bb:do_configure)
NOTE: recipe epiphany-48.0-r0: task do_configure: Started
NOTE: recipe epiphany-48.0-r0: task do_configure: Succeeded
NOTE: Running task 4584 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_48.0.bb:do_compile)
NOTE: recipe epiphany-48.0-r0: task do_compile: Started
NOTE: recipe epiphany-48.0-r0: task do_compile: Succeeded
NOTE: Running task 4585 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_48.0.bb:do_install)
NOTE: recipe epiphany-48.0-r0: task do_install: Started
NOTE: recipe epiphany-48.0-r0: task do_install: Succeeded
NOTE: Running task 4586 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_48.0.bb:do_populate_sysroot)
NOTE: recipe epiphany-48.0-r0: task do_populate_sysroot: Started
NOTE: recipe epiphany-48.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe webkitgtk-2.46.6-r0: task do_package: Succeeded
NOTE: Running task 4587 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.46.6.bb:do_packagedata)
NOTE: recipe webkitgtk-2.46.6-r0: task do_packagedata: Started
NOTE: recipe webkitgtk-2.46.6-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.46.6.bb:do_packagedata unihash changed to dd57f00faeac7906b2740fba29d5581a8cfc112bbd985db0859c19212ff966e7
NOTE: Setscene tasks completed
NOTE: Running task 4588 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_48.0.bb:do_package)
NOTE: Running task 4589 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.46.6.bb:do_create_spdx)
NOTE: recipe epiphany-48.0-r0: task do_package: Started
NOTE: recipe webkitgtk-2.46.6-r0: task do_create_spdx: Started
NOTE: recipe epiphany-48.0-r0: task do_package: Succeeded
NOTE: Running task 4590 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_48.0.bb:do_packagedata)
NOTE: recipe epiphany-48.0-r0: task do_packagedata: Started
NOTE: recipe webkitgtk-2.46.6-r0: task do_create_spdx: Succeeded
NOTE: Running task 4591 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_48.0.bb:do_collect_spdx_deps)
NOTE: recipe epiphany-48.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe epiphany-48.0-r0: task do_packagedata: Succeeded
NOTE: Running task 4592 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_48.0.bb:do_package_write_ipk)
NOTE: Running task 4593 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_48.0.bb:do_package_write_deb)
NOTE: Running task 4594 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_48.0.bb:do_package_write_rpm)
NOTE: recipe epiphany-48.0-r0: task do_package_write_ipk: Started
NOTE: Running task 4595 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_48.0.bb:do_package_qa)
NOTE: recipe epiphany-48.0-r0: task do_package_write_deb: Started
NOTE: recipe epiphany-48.0-r0: task do_package_write_rpm: Started
NOTE: recipe epiphany-48.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4596 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_48.0.bb:do_create_spdx)
NOTE: recipe epiphany-48.0-r0: task do_package_qa: Started
NOTE: recipe epiphany-48.0-r0: task do_create_spdx: Started
NOTE: recipe epiphany-48.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 4597 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_48.0.bb:do_create_package_spdx)
NOTE: recipe epiphany-48.0-r0: task do_create_package_spdx: Started
NOTE: recipe epiphany-48.0-r0: task do_package_qa: Succeeded
NOTE: recipe epiphany-48.0-r0: task do_package_write_ipk: Succeeded
NOTE: recipe epiphany-48.0-r0: task do_create_package_spdx: Succeeded
NOTE: recipe epiphany-48.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe epiphany-48.0-r0: task do_package_write_deb: Succeeded
NOTE: Running noexec task 4598 of 4598 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_48.0.bb:do_build)
NOTE: Tasks Summary: Attempted 4598 tasks of which 4127 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 41 ERROR messages, returning a non-zero exit code.
ERROR: libidn2-2.3.7-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-src went backwards which would break package feeds (from 0:2.3.8-r0 to 0:2.3.7-r0) [version-going-backwards]
ERROR: libidn2-2.3.7-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-dbg went backwards which would break package feeds (from 0:2.3.8-r0 to 0:2.3.7-r0) [version-going-backwards]
ERROR: libidn2-2.3.7-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-staticdev went backwards which would break package feeds (from 0:2.3.8-r0 to 0:2.3.7-r0) [version-going-backwards]
ERROR: libidn2-2.3.7-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-dev went backwards which would break package feeds (from 0:2.3.8-r0 to 0:2.3.7-r0) [version-going-backwards]
ERROR: libidn2-2.3.7-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-doc went backwards which would break package feeds (from 0:2.3.8-r0 to 0:2.3.7-r0) [version-going-backwards]
ERROR: libidn2-2.3.7-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-cs went backwards which would break package feeds (from 0:2.3.8-r0 to 0:2.3.7-r0) [version-going-backwards]
ERROR: libidn2-2.3.7-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-da went backwards which would break package feeds (from 0:2.3.8-r0 to 0:2.3.7-r0) [version-going-backwards]
ERROR: libidn2-2.3.7-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-de went backwards which would break package feeds (from 0:2.3.8-r0 to 0:2.3.7-r0) [version-going-backwards]
ERROR: libidn2-2.3.7-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-eo went backwards which would break package feeds (from 0:2.3.8-r0 to 0:2.3.7-r0) [version-going-backwards]
ERROR: libidn2-2.3.7-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-es went backwards which would break package feeds (from 0:2.3.8-r0 to 0:2.3.7-r0) [version-going-backwards]
ERROR: libidn2-2.3.7-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-fi went backwards which would break package feeds (from 0:2.3.8-r0 to 0:2.3.7-r0) [version-going-backwards]
ERROR: libidn2-2.3.7-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-fr went backwards which would break package feeds (from 0:2.3.8-r0 to 0:2.3.7-r0) [version-going-backwards]
ERROR: libidn2-2.3.7-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-fur went backwards which would break package feeds (from 0:2.3.8-r0 to 0:2.3.7-r0) [version-going-backwards]
ERROR: libidn2-2.3.7-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-hr went backwards which would break package feeds (from 0:2.3.8-r0 to 0:2.3.7-r0) [version-going-backwards]
ERROR: libidn2-2.3.7-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-hu went backwards which would break package feeds (from 0:2.3.8-r0 to 0:2.3.7-r0) [version-going-backwards]
ERROR: libidn2-2.3.7-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-id went backwards which would break package feeds (from 0:2.3.8-r0 to 0:2.3.7-r0) [version-going-backwards]
ERROR: libidn2-2.3.7-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-it went backwards which would break package feeds (from 0:2.3.8-r0 to 0:2.3.7-r0) [version-going-backwards]
ERROR: libidn2-2.3.7-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-ja went backwards which would break package feeds (from 0:2.3.8-r0 to 0:2.3.7-r0) [version-going-backwards]
ERROR: libidn2-2.3.7-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-ka went backwards which would break package feeds (from 0:2.3.8-r0 to 0:2.3.7-r0) [version-going-backwards]
ERROR: libidn2-2.3.7-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-ko went backwards which would break package feeds (from 0:2.3.8-r0 to 0:2.3.7-r0) [version-going-backwards]
ERROR: libidn2-2.3.7-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-nl went backwards which would break package feeds (from 0:2.3.8-r0 to 0:2.3.7-r0) [version-going-backwards]
ERROR: libidn2-2.3.7-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-pl went backwards which would break package feeds (from 0:2.3.8-r0 to 0:2.3.7-r0) [version-going-backwards]
ERROR: libidn2-2.3.7-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-pt-br went backwards which would break package feeds (from 0:2.3.8-r0 to 0:2.3.7-r0) [version-going-backwards]
ERROR: libidn2-2.3.7-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-ro went backwards which would break package feeds (from 0:2.3.8-r0 to 0:2.3.7-r0) [version-going-backwards]
ERROR: libidn2-2.3.7-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-ru went backwards which would break package feeds (from 0:2.3.8-r0 to 0:2.3.7-r0) [version-going-backwards]
ERROR: libidn2-2.3.7-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-sr went backwards which would break package feeds (from 0:2.3.8-r0 to 0:2.3.7-r0) [version-going-backwards]
ERROR: libidn2-2.3.7-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-sv went backwards which would break package feeds (from 0:2.3.8-r0 to 0:2.3.7-r0) [version-going-backwards]
ERROR: libidn2-2.3.7-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-uk went backwards which would break package feeds (from 0:2.3.8-r0 to 0:2.3.7-r0) [version-going-backwards]
ERROR: libidn2-2.3.7-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-vi went backwards which would break package feeds (from 0:2.3.8-r0 to 0:2.3.7-r0) [version-going-backwards]
ERROR: libidn2-2.3.7-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-zh-cn went backwards which would break package feeds (from 0:2.3.8-r0 to 0:2.3.7-r0) [version-going-backwards]
ERROR: libidn2-2.3.7-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-bin went backwards which would break package feeds (from 0:2.3.8-r0 to 0:2.3.7-r0) [version-going-backwards]
ERROR: libidn2-2.3.7-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2 went backwards which would break package feeds (from 0:2.3.8-r0 to 0:2.3.7-r0) [version-going-backwards]
ERROR: libidn2-2.3.7-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: vala-0.56.17-r0 do_packagedata_setscene: QA Issue: Package version for package vala-src went backwards which would break package feeds (from 0:0.56.18-r0 to 0:0.56.17-r0) [version-going-backwards]
ERROR: vala-0.56.17-r0 do_packagedata_setscene: QA Issue: Package version for package vala-dbg went backwards which would break package feeds (from 0:0.56.18-r0 to 0:0.56.17-r0) [version-going-backwards]
ERROR: vala-0.56.17-r0 do_packagedata_setscene: QA Issue: Package version for package vala-staticdev went backwards which would break package feeds (from 0:0.56.18-r0 to 0:0.56.17-r0) [version-going-backwards]
ERROR: vala-0.56.17-r0 do_packagedata_setscene: QA Issue: Package version for package vala-dev went backwards which would break package feeds (from 0:0.56.18-r0 to 0:0.56.17-r0) [version-going-backwards]
ERROR: vala-0.56.17-r0 do_packagedata_setscene: QA Issue: Package version for package vala-doc went backwards which would break package feeds (from 0:0.56.18-r0 to 0:0.56.17-r0) [version-going-backwards]
ERROR: vala-0.56.17-r0 do_packagedata_setscene: QA Issue: Package version for package vala-locale went backwards which would break package feeds (from 0:0.56.18-r0 to 0:0.56.17-r0) [version-going-backwards]
ERROR: vala-0.56.17-r0 do_packagedata_setscene: QA Issue: Package version for package vala went backwards which would break package feeds (from 0:0.56.18-r0 to 0:0.56.17-r0) [version-going-backwards]
ERROR: vala-0.56.17-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============9103620227682877199==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/epiphany/epiphany-dbg: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-dbg: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-dbg: PKGSIZE changed from 5848440 to 5891600 (+1%)
packages/core2-64-poky-linux/epiphany/epiphany-dev: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-dev: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-doc: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-doc: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ab: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ab: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-af: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-af: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-am: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-am: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-an: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-an: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ar: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ar: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-as: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-as: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ast: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ast: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-az: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-az: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-be+latin: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-be+latin: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-be: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-be: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-be: PKGSIZE changed from 116456 to 115981 (-0%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-bg: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-bg: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-bg: PKGSIZE changed from 118770 to 120431 (+1%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-bn-in: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-bn-in: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-bn: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-bn: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-bn: PKGSIZE changed from 37597 to 74674 (+99%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-br: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-br: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-bs: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-bs: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ca+valencia: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ca+valencia: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ca: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ca: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ca: PKGSIZE changed from 93172 to 93876 (+1%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-ckb: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ckb: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-cs: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-cs: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-cs: PKGSIZE changed from 92837 to 94110 (+1%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-cy: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-cy: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-da: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-da: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-da: PKGSIZE changed from 88639 to 88698 (+0%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-de: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-de: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-dz: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-dz: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-el: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-el: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-en+shaw: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-en+shaw: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-en-ca: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-en-ca: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-en-gb: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-en-gb: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-eo: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-eo: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-es: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-es: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-es: PKGSIZE changed from 92279 to 92032 (-0%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-et: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-et: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-eu: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-eu: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-eu: PKGSIZE changed from 90750 to 91618 (+1%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-fa: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-fa: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-fa: PKGSIZE changed from 109837 to 111394 (+1%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-fi: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-fi: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-fi: PKGSIZE changed from 74083 to 74304 (+0%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-fr: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-fr: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-fr: PKGSIZE changed from 97612 to 98309 (+1%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-fur: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-fur: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-fur: PKGSIZE changed from 92107 to 92382 (+0%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-fy: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-fy: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ga: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ga: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-gl: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-gl: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-gl: PKGSIZE changed from 91699 to 92283 (+1%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-gu: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-gu: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-gv: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-gv: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-he: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-he: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-he: PKGSIZE changed from 96342 to 97080 (+1%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-hi: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-hi: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-hr: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-hr: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-hu: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-hu: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-hu: PKGSIZE changed from 94389 to 95194 (+1%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-hy: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-hy: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-id: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-id: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-id: PKGSIZE changed from 87460 to 88068 (+1%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-ie: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ie: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ig: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ig: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-is: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-is: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-it: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-it: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ja: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ja: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ka: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ka: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ka: PKGSIZE changed from 143071 to 145194 (+1%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-kab: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-kab: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-kk: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-kk: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-km: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-km: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-kn: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-kn: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ko: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ko: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ko: PKGSIZE changed from 93403 to 94236 (+1%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-ku: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ku: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-li: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-li: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-lt: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-lt: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-lt: PKGSIZE changed from 91025 to 91632 (+1%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-lv: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-lv: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-mai: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-mai: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-mg: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-mg: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-mi: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-mi: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-mk: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-mk: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ml: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ml: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-mn: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-mn: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-mr: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-mr: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ms: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ms: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-nb: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-nb: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-nds: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-nds: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ne: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ne: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ne: PKGSIZE changed from 76497 to 144659 (+89%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-nl: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-nl: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-nn: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-nn: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-oc: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-oc: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-or: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-or: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-pa: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-pa: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-pl: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-pl: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-pl: PKGSIZE changed from 92673 to 93243 (+1%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-ps: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ps: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-pt-br: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-pt-br: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-pt-br: PKGSIZE changed from 92554 to 93152 (+1%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-pt: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-pt: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-pt: PKGSIZE changed from 92220 to 92933 (+1%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-ro: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ro: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ru: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ru: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ru: PKGSIZE changed from 118159 to 119817 (+1%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-rw: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-rw: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-si: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-si: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-sk: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-sk: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-sl: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-sl: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-sl: PKGSIZE changed from 89738 to 90950 (+1%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-sq: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-sq: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-sr+latin: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-sr+latin: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-sr: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-sr: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-sr: PKGSIZE changed from 117199 to 117931 (+1%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-sv: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-sv: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-sv: PKGSIZE changed from 88999 to 90142 (+1%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-ta: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ta: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-te: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-te: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-tg: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-tg: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-th: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-th: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-tk: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-tk: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-tr: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-tr: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-tr: PKGSIZE changed from 90014 to 91038 (+1%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-ug: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ug: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-uk: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-uk: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-uk: PKGSIZE changed from 115761 to 117452 (+1%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-uz+cyrillic: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-uz+cyrillic: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-uz: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-uz: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-vi: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-vi: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-wa: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-wa: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-yo: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-yo: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-zh-cn: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-zh-cn: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-zh-cn: PKGSIZE changed from 83974 to 84480 (+1%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-zh-hk: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-zh-hk: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-zh-tw: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-locale-zh-tw: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-zh-tw: PKGSIZE changed from 80094 to 83889 (+5%)
packages/core2-64-poky-linux/epiphany/epiphany-src: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-src: FILELIST: directory renamed /usr/src/debug/epiphany/47.3.1/lib/autofill -> /usr/src/debug/epiphany/48.0/lib/autofill, directory renamed /usr/src/debug/epiphany/47.3.1/lib/contrib -> /usr/src/debug/epiphany/48.0/lib/contrib, directory renamed /usr/src/debug/epiphany/47.3.1/embed/web-process-extension -> /usr/src/debug/epiphany/48.0/embed/web-process-extension, directory renamed /usr/src/debug/epiphany/47.3.1/src -> /usr/src/debug/epiphany/48.0/src, directory renamed /usr/src/debug/epiphany/47.3.1/src/bookmarks -> /usr/src/debug/epiphany/48.0/src/bookmarks, directory renamed /usr/src/debug/epiphany/47.3.1/lib/sync -> /usr/src/debug/epiphany/48.0/lib/sync, directory renamed /usr/src/debug/epiphany/47.3.1/lib/sync/debug -> /usr/src/debug/epiphany/48.0/lib/sync/debug, directory renamed /usr/src/debug/epiphany/47.3.1/src/search-provider -> /usr/src/debug/epiphany/48.0/src/search-provider, directory renamed /usr/src/debug/epiphany/47.3.1/t
 hird-party -> /usr/src/debug/epiphany/48.0/third-party, directory renamed /usr/src/debug/epiphany/47.3.1/embed -> /usr/src/debug/epiphany/48.0/embed, directory renamed /usr/src/debug/epiphany/47.3.1/third-party/gvdb -> /usr/src/debug/epiphany/48.0/third-party/gvdb, directory renamed /usr/src/debug/epiphany/47.3.1/src/webapp-provider -> /usr/src/debug/epiphany/48.0/src/webapp-provider, directory renamed /usr/src/debug/epiphany/47.3.1/lib -> /usr/src/debug/epiphany/48.0/lib, directory renamed /usr/src/debug/epiphany/47.3.1/src/webextension -> /usr/src/debug/epiphany/48.0/src/webextension, directory renamed /usr/src/debug/epiphany/47.3.1/src/webextension/api -> /usr/src/debug/epiphany/48.0/src/webextension/api, directory renamed /usr/src/debug/epiphany/47.3.1/src/profile-migrator -> /usr/src/debug/epiphany/48.0/src/profile-migrator, directory renamed /usr/src/debug/epiphany/47.3.1/lib/history -> /usr/src/debug/epiphany/48.0/lib/history, removed "/usr/src/debug/epiphany/47.3.1/src/prefe
 rences/prefs-general-page.h /usr/src/debug/epiphany/47.3.1/src/preferences/prefs-general-page.c /usr/src/debug/epiphany/47.3.1/src/preferences/ephy-search-engine-listbox.c /usr/src/debug/epiphany/47.3.1/src/preferences/ephy-search-engine-listbox.h /usr/src/debug/epiphany/47.3.1/src/preferences/autofill-view.c /usr/src/debug/epiphany/47.3.1/src/preferences/autofill-view.h /usr/src/debug/epiphany/47.3.1/src/preferences/passwords-view.h /usr/src/debug/epiphany/47.3.1/src/preferences/passwords-view.c /usr/src/debug/epiphany/47.3.1/src/preferences/ephy-lang-row.h /usr/src/debug/epiphany/47.3.1/src/preferences/ephy-data-view.h /usr/src/debug/epiphany/47.3.1/src/preferences/extension-view.c /usr/src/debug/epiphany/47.3.1/src/preferences/ephy-lang-row.c /usr/src/debug/epiphany/47.3.1/src/preferences/extension-view.h /usr/src/debug/epiphany/47.3.1/src/preferences/ephy-data-view.c /usr/src/debug/epiphany/47.3.1/src/preferences/webapp-additional-urls-dialog.h /usr/src/debug/epiphany/47.3.1/src
 /preferences/ephy-search-engine-row.h /usr/src/debug/epiphany/47.3.1/src/preferences/prefs-privacy-page.c /usr/src/debug/epiphany/47.3.1/src/preferences/webapp-additional-urls-dialog.c /usr/src/debug/epiphany/47.3.1/src/preferences/prefs-privacy-page.h /usr/src/debug/epiphany/47.3.1/src/preferences/ephy-search-engine-row.c /usr/src/debug/epiphany/47.3.1/src/preferences/prefs-appearance-page.h /usr/src/debug/epiphany/47.3.1/src/preferences/prefs-extensions-page.h /usr/src/debug/epiphany/47.3.1/src/preferences/prefs-appearance-page.c /usr/src/debug/epiphany/47.3.1/src/preferences/prefs-extensions-page.c /usr/src/debug/epiphany/47.3.1/src/preferences/ephy-prefs-dialog.c /usr/src/debug/epiphany/47.3.1/src/preferences/clear-data-view.h /usr/src/debug/epiphany/47.3.1/src/preferences/ephy-prefs-dialog.h /usr/src/debug/epiphany/47.3.1/src/preferences/clear-data-view.c", added "/usr/src/debug/epiphany/48.0/src/preferences/ephy-search-engine-listbox.c /usr/src/debug/epiphany/48.0/src/preferen
 ces/prefs-appearance-page.h /usr/src/debug/epiphany/48.0/src/preferences/prefs-appearance-page.c /usr/src/debug/epiphany/48.0/src/preferences/ephy-search-engine-listbox.h /usr/src/debug/epiphany/48.0/src/preferences/autofill-view.c /usr/src/debug/epiphany/48.0/src/preferences/passwords-view.h /usr/src/debug/epiphany/48.0/src/preferences/passwords-view.c /usr/src/debug/epiphany/48.0/src/preferences/autofill-view.h /usr/src/debug/epiphany/48.0/src/preferences/ephy-prefs-dialog.c /usr/src/debug/epiphany/48.0/src/preferences/ephy-data-view.c /usr/src/debug/epiphany/48.0/src/preferences/ephy-prefs-dialog.h /usr/src/debug/epiphany/48.0/src/preferences/ephy-data-view.h /usr/src/debug/epiphany/48.0/src/preferences/extension-view.h /usr/src/debug/epiphany/48.0/src/preferences/ephy-lang-row.c /usr/src/debug/epiphany/48.0/src/preferences/webapp-additional-urls-dialog.c /usr/src/debug/epiphany/48.0/src/preferences/extension-view.c /usr/src/debug/epiphany/48.0/src/preferences/webapp-additional-u
 rls-dialog.h /usr/src/debug/epiphany/48.0/src/preferences/ephy-lang-row.h /usr/src/debug/epiphany/48.0/src/preferences/ephy-search-engine-row.c /usr/src/debug/epiphany/48.0/src/preferences/ephy-search-engine-row.h /usr/src/debug/epiphany/48.0/src/preferences/clear-data-view.c /usr/src/debug/epiphany/48.0/src/preferences/clear-data-view.h /usr/src/debug/epiphany/48.0/src/preferences/prefs-privacy-page.c /usr/src/debug/epiphany/48.0/src/preferences/prefs-general-page.c /usr/src/debug/epiphany/48.0/src/preferences/prefs-extensions-page.c /usr/src/debug/epiphany/48.0/src/preferences/webapp-additional-urls-list-item.c /usr/src/debug/epiphany/48.0/src/preferences/prefs-privacy-page.h /usr/src/debug/epiphany/48.0/src/preferences/webapp-additional-urls-list-item.h /usr/src/debug/epiphany/48.0/src/preferences/prefs-extensions-page.h /usr/src/debug/epiphany/48.0/src/preferences/prefs-general-page.h"
packages/core2-64-poky-linux/epiphany/epiphany-src: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany-src: PKGSIZE changed from 4563810 to 4610598 (+1%)
packages/core2-64-poky-linux/epiphany/epiphany-staticdev: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany-staticdev: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany/epiphany: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany/epiphany: PKGSIZE changed from 2096970 to 2109832 (+1%)
packages/core2-64-poky-linux/epiphany: PV changed from "47.3.1" to "48.0"
packages/core2-64-poky-linux/epiphany: SRC_URI changed from "https://download.gnome.org/sources//epiphany/47/epiphany-47.3.1.tar.xz;name=archive file://0002-help-meson.build-disable-the-use-of-yelp.patch file://migrator.patch file://distributor.patch" to "https://download.gnome.org/sources//epiphany/48/epiphany-48.0.tar.xz;name=archive file://0002-help-meson.build-disable-the-use-of-yelp.patch file://migrator.patch file://distributor.patch"
packages/core2-64-poky-linux/epiphany: PKGV changed from 47.3.1 [default] to 48.0 [default]
packages/core2-64-poky-linux/epiphany: PACKAGES: added "epiphany-locale-ia"

--===============9103620227682877199==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/epiphany/epiphany-locale-bn: PKGSIZE changed from 37597 to 74674 (+99%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-ne: PKGSIZE changed from 76497 to 144659 (+89%)
packages/core2-64-poky-linux/epiphany: PACKAGES: added "epiphany-locale-ia"

--===============9103620227682877199==--

