Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3468910F6FC3
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 14:36:22 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14750.1775054160002813458
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 07:36:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=aN+m4r6h;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=kAc5iD4g;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019d49792693-826c4c56-9940-4c40-89ea-d62397b0cbb8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1775054170;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=/x9JqBAb+D0BTmksc4JWefHC0B7/r7gbEqhZR+Zim3c=;
	b=aN+m4r6hGul8AIoh4eaS4vnp43AHGoOu/gDADWDXwYWBYpt6Gn4N3juFGAU3PI0q
	+kUnu2oTSgyNHmwu3TM0KlnvA1KlppnQI6FMT7fnC0Vqy9HUGqy8j/TCUGETJKRvh+O
	vHg/gnvSoRe3358AnoHRoHCTARO8I6WcA7gV/jBc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1775054170;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=/x9JqBAb+D0BTmksc4JWefHC0B7/r7gbEqhZR+Zim3c=;
	b=kAc5iD4gx7XuX42uJIKYl+hpVxBul4wVGGTUe0c3pQM1fHrGkuHQNsS/SN7C2iH7
	jRJWKC3dod+L6LZ7B6CDqtaQizAKHj57Kc7ZQSNoT+zGNeIANjiAUDQ2veIjyUSoLUM
	XhDgq9Kl2nT96hny1J/M1MUAxC5n6sKTyd7tM0WM=
Content-Type: multipart/mixed; boundary="===============0324185264989080809=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] epiphany: upgrading to 50.3 SUCCEEDED
Message-ID: <0101019d49792693-826c4c56-9940-4c40-89ea-d62397b0cbb8-000000@us-west-2.amazonses.com>
Date: Wed, 1 Apr 2026 14:36:09 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 14:36:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234407

--===============0324185264989080809==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *epiphany* to *50.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-epiphany-upgrade-49.7-50.3.patch
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
From 24d20ab59a5ffe65e8032f9dfb865e3d220ffe17 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Apr 2026 12:28:25 +0000
Subject: [PATCH] epiphany: upgrade 49.7 -> 50.3

---
 .../epiphany/{epiphany_49.7.bb => epiphany_50.3.bb}           | 2 +-
 .../files/0002-help-meson.build-disable-the-use-of-yelp.patch | 2 +-
 meta/recipes-gnome/epiphany/files/distributor.patch           | 4 ++--
 meta/recipes-gnome/epiphany/files/migrator.patch              | 4 ++--
 4 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-gnome/epiphany/{epiphany_49.7.bb => epiphany_50.3.bb} (94%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_49.7.bb b/meta/recipes-gnome/epiphany/epiphany_50.3.bb
similarity index 94%
rename from meta/recipes-gnome/epiphany/epiphany_49.7.bb
rename to meta/recipes-gnome/epiphany/epiphany_50.3.bb
index e782855c95..d5cacc848a 100644
--- a/meta/recipes-gnome/epiphany/epiphany_49.7.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_50.3.bb
@@ -32,7 +32,7 @@ SRC_URI += "\
            file://migrator.patch \
            file://distributor.patch \
            "
-SRC_URI[archive.sha256sum] = "3c590c6fe6d9269412a042aa479c91c3229163e2da85a94a5d24644b2ab9e3b4"
+SRC_URI[archive.sha256sum] = "032d6a41e2a079cd41b05ca7abfb3870adf0353d1566194bed8790953a894640"
 
 export GI_TYPELIB_PATH = "${STAGING_LIBDIR}/girepository-1.0/"
 
diff --git a/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch b/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
index 6c00ab9b40..e8fe9861ad 100644
--- a/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
+++ b/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
@@ -1,4 +1,4 @@
-From 91045ece41faefbeac14b60d7b19b0c652e586fb Mon Sep 17 00:00:00 2001
+From e2f632437ac26ed18a099fe89e5d78f6af3b3789 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 31 Jan 2018 15:50:38 +0200
 Subject: [PATCH] help/meson.build: disable the use of yelp
diff --git a/meta/recipes-gnome/epiphany/files/distributor.patch b/meta/recipes-gnome/epiphany/files/distributor.patch
index 54a3305aaf..6d736b5281 100644
--- a/meta/recipes-gnome/epiphany/files/distributor.patch
+++ b/meta/recipes-gnome/epiphany/files/distributor.patch
@@ -1,4 +1,4 @@
-From 46084da03b5f20423a2946d988c68e9ea9339c9c Mon Sep 17 00:00:00 2001
+From 518ec25f4681ca8f81d9e055e3c3e7e85b399e59 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Fri, 26 Feb 2021 10:17:52 +0000
 Subject: [PATCH] Don't encode the distro from /etc/os-release into the
@@ -11,7 +11,7 @@ RP 2021/2/26
  1 file changed, 1 insertion(+)
 
 diff --git a/meson.build b/meson.build
-index df0340c..8ec6c79 100644
+index 7bff641..0e899f1 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -15,6 +15,7 @@ if r.returncode() == 0
diff --git a/meta/recipes-gnome/epiphany/files/migrator.patch b/meta/recipes-gnome/epiphany/files/migrator.patch
index 8ebcdc9991..ce474d3ad4 100644
--- a/meta/recipes-gnome/epiphany/files/migrator.patch
+++ b/meta/recipes-gnome/epiphany/files/migrator.patch
@@ -1,4 +1,4 @@
-From ca504370b9aa893ceac21141d8f24e28a474b674 Mon Sep 17 00:00:00 2001
+From f70a556486995d1c570726277b0d42872643653b Mon Sep 17 00:00:00 2001
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


--===============0324185264989080809==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-epiphany-upgrade-49.7-50.3.patch"

RnJvbSAyNGQyMGFiNTlhNWZmZTY1ZTgwMzJmOWRmYjg2NWUzZDIyMGZmZTE3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBBcHIgMjAyNiAxMjoyODoyNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGVw
aXBoYW55OiB1cGdyYWRlIDQ5LjcgLT4gNTAuMwoKLS0tCiAuLi4vZXBpcGhhbnkve2VwaXBoYW55
XzQ5LjcuYmIgPT4gZXBpcGhhbnlfNTAuMy5iYn0gICAgICAgICAgIHwgMiArLQogLi4uL2ZpbGVz
LzAwMDItaGVscC1tZXNvbi5idWlsZC1kaXNhYmxlLXRoZS11c2Utb2YteWVscC5wYXRjaCB8IDIg
Ky0KIG1ldGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFueS9maWxlcy9kaXN0cmlidXRvci5wYXRjaCAg
ICAgICAgICAgfCA0ICsrLS0KIG1ldGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFueS9maWxlcy9taWdy
YXRvci5wYXRjaCAgICAgICAgICAgICAgfCA0ICsrLS0KIDQgZmlsZXMgY2hhbmdlZCwgNiBpbnNl
cnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1nbm9tZS9lcGlw
aGFueS97ZXBpcGhhbnlfNDkuNy5iYiA9PiBlcGlwaGFueV81MC4zLmJifSAoOTQlKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFueS9lcGlwaGFueV80OS43LmJiIGIvbWV0
YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2VwaXBoYW55XzUwLjMuYmIKc2ltaWxhcml0eSBpbmRl
eCA5NCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2VwaXBoYW55XzQ5
LjcuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFueS9lcGlwaGFueV81MC4z
LmJiCmluZGV4IGU3ODI4NTVjOTUuLmQ1Y2FjYzg0OGEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1nbm9tZS9lcGlwaGFueS9lcGlwaGFueV80OS43LmJiCisrKyBiL21ldGEvcmVjaXBlcy1nbm9t
ZS9lcGlwaGFueS9lcGlwaGFueV81MC4zLmJiCkBAIC0zMiw3ICszMiw3IEBAIFNSQ19VUkkgKz0g
IlwKICAgICAgICAgICAgZmlsZTovL21pZ3JhdG9yLnBhdGNoIFwKICAgICAgICAgICAgZmlsZTov
L2Rpc3RyaWJ1dG9yLnBhdGNoIFwKICAgICAgICAgICAgIgotU1JDX1VSSVthcmNoaXZlLnNoYTI1
NnN1bV0gPSAiM2M1OTBjNmZlNmQ5MjY5NDEyYTA0MmFhNDc5YzkxYzMyMjkxNjNlMmRhODVhOTRh
NWQyNDY0NGIyYWI5ZTNiNCIKK1NSQ19VUklbYXJjaGl2ZS5zaGEyNTZzdW1dID0gIjAzMmQ2YTQx
ZTJhMDc5Y2Q0MWIwNWNhN2FiZmIzODcwYWRmMDM1M2QxNTY2MTk0YmVkODc5MDk1M2E4OTQ2NDAi
CiAKIGV4cG9ydCBHSV9UWVBFTElCX1BBVEggPSAiJHtTVEFHSU5HX0xJQkRJUn0vZ2lyZXBvc2l0
b3J5LTEuMC8iCiAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFueS9maWxl
cy8wMDAyLWhlbHAtbWVzb24uYnVpbGQtZGlzYWJsZS10aGUtdXNlLW9mLXllbHAucGF0Y2ggYi9t
ZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZmlsZXMvMDAwMi1oZWxwLW1lc29uLmJ1aWxkLWRp
c2FibGUtdGhlLXVzZS1vZi15ZWxwLnBhdGNoCmluZGV4IDZjMDBhYjliNDAuLmU4ZmU5ODYxYWQg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFueS9maWxlcy8wMDAyLWhlbHAt
bWVzb24uYnVpbGQtZGlzYWJsZS10aGUtdXNlLW9mLXllbHAucGF0Y2gKKysrIGIvbWV0YS9yZWNp
cGVzLWdub21lL2VwaXBoYW55L2ZpbGVzLzAwMDItaGVscC1tZXNvbi5idWlsZC1kaXNhYmxlLXRo
ZS11c2Utb2YteWVscC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gOTEwNDVlY2U0MWZhZWZi
ZWFjMTRiNjBkN2IxOWIwYzY1MmU1ODZmYiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20g
ZTJmNjMyNDM3YWMyNmVkMThhMDk5ZmU4OWU1ZDc4ZjZhZjNiMzc4OSBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29t
PgogRGF0ZTogV2VkLCAzMSBKYW4gMjAxOCAxNTo1MDozOCArMDIwMAogU3ViamVjdDogW1BBVENI
XSBoZWxwL21lc29uLmJ1aWxkOiBkaXNhYmxlIHRoZSB1c2Ugb2YgeWVscApkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2ZpbGVzL2Rpc3RyaWJ1dG9yLnBhdGNoIGIvbWV0
YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2ZpbGVzL2Rpc3RyaWJ1dG9yLnBhdGNoCmluZGV4IDU0
YTMzMDVhYWYuLjZkNzM2YjUyODEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1nbm9tZS9lcGlw
aGFueS9maWxlcy9kaXN0cmlidXRvci5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZ25vbWUvZXBp
cGhhbnkvZmlsZXMvZGlzdHJpYnV0b3IucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDQ2MDg0
ZGEwM2I1ZjIwNDIzYTI5NDZkOTg4YzY4ZTllYTkzMzljOWMgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCitGcm9tIDUxOGVjMjVmNDY4MWNhOGY4MWQ5ZTA1NWUzYzNlN2U4NWIzOTllNTkgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVA
bGludXhmb3VuZGF0aW9uLm9yZz4KIERhdGU6IEZyaSwgMjYgRmViIDIwMjEgMTA6MTc6NTIgKzAw
MDAKIFN1YmplY3Q6IFtQQVRDSF0gRG9uJ3QgZW5jb2RlIHRoZSBkaXN0cm8gZnJvbSAvZXRjL29z
LXJlbGVhc2UgaW50byB0aGUKQEAgLTExLDcgKzExLDcgQEAgUlAgMjAyMS8yLzI2CiAgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCiAKIGRpZmYgLS1naXQgYS9tZXNvbi5idWlsZCBiL21l
c29uLmJ1aWxkCi1pbmRleCBkZjAzNDBjLi44ZWM2Yzc5IDEwMDY0NAoraW5kZXggN2JmZjY0MS4u
MGU4OTlmMSAxMDA2NDQKIC0tLSBhL21lc29uLmJ1aWxkCiArKysgYi9tZXNvbi5idWlsZAogQEAg
LTE1LDYgKzE1LDcgQEAgaWYgci5yZXR1cm5jb2RlKCkgPT0gMApkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWdub21lL2VwaXBoYW55L2ZpbGVzL21pZ3JhdG9yLnBhdGNoIGIvbWV0YS9yZWNpcGVz
LWdub21lL2VwaXBoYW55L2ZpbGVzL21pZ3JhdG9yLnBhdGNoCmluZGV4IDhlYmNkYzk5OTEuLmNl
NDc0ZDNhZDQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFueS9maWxlcy9t
aWdyYXRvci5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZmlsZXMvbWln
cmF0b3IucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGNhNTA0MzcwYjlhYTg5M2NlYWMyMTE0
MWQ4ZjI0ZTI4YTQ3NGI2NzQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGY3MGE1NTY0
ODY5OTVkMWM1NzA3MjYyNzdiMGQ0Mjg3MjY0MzY1M2IgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CiBGcm9tOiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9y
Zz4KIERhdGU6IFRodSwgMjUgRmViIDIwMjEgMTQ6NTI6MzIgKzAwMDAKIFN1YmplY3Q6IFtQQVRD
SF0gZXBpcGhhbnk6IEZpeCByZXByb2R1Y2liaWxpdHkgaXNzdWUKQEAgLTE0LDcgKzE0LDcgQEAg
UlAgMjAyMS8yLzI1CiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKIAogZGlmZiAtLWdpdCBhL2xpYi9lcGh5LXByb2ZpbGUtdXRpbHMuYyBiL2xpYi9lcGh5
LXByb2ZpbGUtdXRpbHMuYwotaW5kZXggYTJmNjE4MS4uNTIxODA3NyAxMDA2NDQKK2luZGV4IGVh
MmVhOTkuLjEzYzI3YzggMTAwNjQ0CiAtLS0gYS9saWIvZXBoeS1wcm9maWxlLXV0aWxzLmMKICsr
KyBiL2xpYi9lcGh5LXByb2ZpbGUtdXRpbHMuYwogQEAgLTEzMCwxMCArMTMwLDEwIEBAIGVwaHlf
cHJvZmlsZV91dGlsc19kb19taWdyYXRpb24gKGNvbnN0IGNoYXIgKnByb2ZpbGVfZGlyZWN0b3J5
LAotLSAKMi40Ny4xCgo=

--===============0324185264989080809==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/epiphany/epiphany-dbg: PKGSIZE changed from 6299304 to 10825784 (+72%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-oc: PKGSIZE changed from 60611 to 101745 (+68%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-src: PKGSIZE changed from 4713126 to 32625753 (+592%)
packages/x86-64-v3-poky-linux/epiphany/epiphany: PKGSIZE changed from 2131242 to 6648655 (+212%)
packages/x86-64-v3-poky-linux/epiphany: PACKAGES: added "epiphany-locale-my"

--===============0324185264989080809==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1970 targets, 64 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-896213a051b4551ddf773e3e55ea25ae3877de32"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
meta                 = "tmp-auh-upgrades:896213a051b4551ddf773e3e55ea25ae3877de32"
meta-yocto-bsp       
meta-poky            = "master:ac300baea7314ea3c80f2330b2a993f729f32150"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1423 Local 940 Mirrors 0 Missed 483 Current 570 (66% match, 75% complete)
done.
Removing 4 stale sstate objects for arch allarch...done.
NOTE: Executing Tasks
NOTE: Running setscene task 581 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/epiphany/epiphany_50.3.bb:do_populate_lic_setscene)
NOTE: Running setscene task 619 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 630 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 631 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 656 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 663 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gnome/adwaita-icon-theme_49.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 728 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 735 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 753 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 771 of 1993 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/groff/groff_1.23.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 783 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.38.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 825 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 841 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 854 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 907 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_create_spdx_setscene)
NOTE: Running setscene task 908 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/iso-codes/iso-codes_4.20.1.bb:do_create_spdx_setscene)
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe epiphany-50.3-r0: task do_populate_lic_setscene: Started
NOTE: recipe adwaita-icon-theme-49.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-packaging-26.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe coreutils-9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe iso-codes-4.20.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libarchive-3.8.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe tiff-4.7.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgcrypt-1.12.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libusb1-1.0.29-r0: task do_create_spdx_setscene: Started
NOTE: recipe groff-native-1.23.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe adwaita-icon-theme-49.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 920 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.18.bb:do_create_spdx_setscene)
NOTE: recipe epiphany-50.3-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 921 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 933 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_create_spdx_setscene)
NOTE: recipe nettle-3.10.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 944 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libsoup/libsoup_3.6.6.bb:do_recipe_qa_setscene)
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe iso-codes-4.20.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 949 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.19.0.bb:do_create_spdx_setscene)
NOTE: recipe libarchive-3.8.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe tiff-4.7.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libusb1-1.0.29-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe groff-native-1.23.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 954 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gnome/adwaita-icon-theme_49.0.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.12.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 956 of 1993 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 958 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/wpebackend-fdo_1.16.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 961 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libxslt/libxslt_1.1.45.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 963 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 965 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 966 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libsecret/libsecret_0.21.7.bb:do_recipe_qa_setscene)
NOTE: recipe python3-packaging-26.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 967 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.21.5.bb:do_recipe_qa_setscene)
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 971 of 1993 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/cargo-c/cargo-c_0.10.21+cargo-0.95.0.bb:do_create_spdx_setscene)
NOTE: recipe hicolor-icon-theme-0.18-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe readline-8.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe adwaita-icon-theme-49.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libsoup-3.6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.19.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxslt-1.1.45-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wpebackend-fdo-1.16.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpsl-0.21.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsecret-0.21.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-native-4.21.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 983 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe hicolor-icon-theme-0.18-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 991 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libsoup-3.6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe readline-8.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 992 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libxslt-1.1.45-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wpebackend-fdo-1.16.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1003 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1005 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.94.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1007 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 1008 of 1993 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/groff/groff_1.23.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe curl-8.19.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpsl-0.21.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1016 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1019 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/enchant/enchant2_2.8.15.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-native-4.21.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libsecret-0.21.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1020 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.1.bb:do_packagedata_setscene)
NOTE: recipe adwaita-icon-theme-49.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1025 of 1993 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1034 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libnotify/libnotify_0.8.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1036 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.6.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libxt-1_1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.12.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 1038 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe nettle-3.10.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1044 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe cargo-c-native-0.10.21+cargo-0.95.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libusb1-1.0.29-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe tiff-4.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.8.6-r0: task do_packagedata_setscene: Started
NOTE: recipe enchant2-2.8.15-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libstd-rs-1.94.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1045 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcrypt-1.12.1-r0: task do_packagedata_setscene: Started
NOTE: recipe groff-native-1.23.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libnotify-0.8.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libarchive-3.8.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libgcrypt-1.12.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libtasn1-native-4.21.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 1048 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.19.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe cargo-c-native-0.10.21+cargo-0.95.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libgcrypt-1.12.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1049 of 1993 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_create_spdx_setscene)
NOTE: recipe tiff-4.7.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe enchant2-2.8.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1050 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_create_spdx_setscene)
NOTE: recipe libusb1-1.0.29-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1057 of 1993 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.22.4.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1059 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libstd-rs-1.94.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1066 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libnotify-0.8.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe groff-native-1.23.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1068 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1069 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_create_spdx_setscene)
NOTE: recipe libarchive-3.8.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtasn1-native-4.21.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1073 of 1993 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libarchive-3.8.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libarchive-3.8.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tiff-4.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1075 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1078 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/libwpe_1.16.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1084 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.47.bb:do_create_spdx_setscene)
NOTE: recipe tiff-4.7.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1090 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-8.19.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 1101 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_create_spdx_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libical-native-3.0.20-r0: task do_create_spdx_setscene: Started
NOTE: recipe readline-8.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-docutils-native-0.22.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libgcrypt-1.12.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1107 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-4.21.0-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-protocols-1.47-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libwpe-1.16.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.19.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe tiff-4.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1112 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/aspell/aspell_0.60.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe icu-78.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libical-native-3.0.20-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libarchive-3.8.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1118 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1119 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe gdk-pixbuf-native-2.44.5-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe readline-8.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1125 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_create_spdx_setscene)
NOTE: recipe python3-docutils-native-0.22.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1127 of 1993 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1130 of 1993 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/cargo-c/cargo-c_0.10.21+cargo-0.95.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libtasn1-4.21.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1135 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.94.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe desktop-file-utils-0.28-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libwpe-1.16.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-protocols-1.47-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1143 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.77.bb:do_packagedata_setscene)
NOTE: Running setscene task 1153 of 1993 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_create_spdx_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1154 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1167 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe aspell-0.60.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdk-pixbuf-native-2.44.5-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe icu-78.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1168 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1172 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1176 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.18.bb:do_packagedata_setscene)
NOTE: recipe desktop-file-utils-0.28-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe tiff-4.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1186 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1187 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.77.bb:do_populate_sysroot_setscene)
NOTE: recipe libstd-rs-1.94.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libcap-2.77-r0: task do_packagedata_setscene: Started
NOTE: recipe libical-native-3.0.20-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe aspell-0.60.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1192 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_populate_sysroot_setscene)
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxinerama-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1196 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_create_recipe_spdx_setscene)
NOTE: recipe shared-mime-info-native-2.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libarchive-3.8.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1197 of 1993 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/makedepend_1.0.9.bb:do_create_recipe_spdx_setscene)
NOTE: recipe hicolor-icon-theme-0.18-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1205 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_create_spdx_setscene)
NOTE: recipe libcap-2.77-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libical-native-3.0.20-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1206 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_create_spdx_setscene)
NOTE: recipe libstd-rs-1.94.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libxml2-2.15.2-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1207 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe libxinerama-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1210 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.19.0.bb:do_packagedata_setscene)
NOTE: recipe cargo-c-native-0.10.21+cargo-0.95.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libusb1-1.0.29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.77-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-native-2.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libarchive-3.8.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1211 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 1214 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1217 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_spdx_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe hicolor-icon-theme-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1218 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.9.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe makedepend-native-1_1.0.9-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 1219 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_packagedata_setscene)
NOTE: recipe cargo-c-native-0.10.21+cargo-0.95.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.15.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1221 of 1993 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/xmlto/xmlto_0.0.29.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1225 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1229 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.19.0.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-8.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.77-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1234 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1236 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1238 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.59.bb:do_packagedata_setscene)
NOTE: recipe libusb1-1.0.29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe makedepend-native-1_1.0.9-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1242 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1252 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.59.bb:do_populate_sysroot_setscene)
NOTE: recipe libxext-1_1.3.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1255 of 1993 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/glslang/glslang_1.4.341.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libusb1-1.0.29-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.19.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xmlto-native-0.0.29-r0: task do_create_spdx_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1256 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_create_spdx_setscene)
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1257 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1262 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_create_recipe_spdx_setscene)
NOTE: recipe icu-78.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe curl-8.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 1263 of 1993 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_create_recipe_spdx_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgpg-error-1.59-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1265 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1271 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.47.bb:do_create_recipe_spdx_setscene)
NOTE: recipe nettle-3.10.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgpg-error-1.59-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1276 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_create_spdx_setscene)
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe xmlto-native-0.0.29-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1283 of 1993 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/chrpath/chrpath_0.18.bb:do_create_recipe_spdx_setscene)
NOTE: recipe glslang-native-1_1.4.341.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libusb1-1.0.29-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1284 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.94.0.bb:do_packagedata_setscene)
NOTE: recipe icu-78.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1287 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_recipe_qa_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 1288 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_packagedata_setscene)
NOTE: recipe curl-8.19.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-protocols-1.47-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 1289 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.94.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libwebp-1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe shared-mime-info-native-2.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe glslang-native-1_1.4.341.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1291 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1292 of 1993 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-mako_1.3.10.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libtasn1-4.21.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1293 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1303 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libgpg-error-1.59-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libstd-rs-1.94.0-r0: task do_packagedata_setscene: Started
NOTE: recipe chrpath-native-0.18-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 1315 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.1.bb:do_recipe_qa_setscene)
NOTE: recipe cairo-1.18.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1326 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb:do_recipe_qa_setscene)
NOTE: recipe readline-8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-protocols-1.47-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libwebp-1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1329 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1338 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_create_spdx_setscene)
NOTE: recipe shared-mime-info-native-2.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1342 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libgpg-error-1.59-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libstd-rs-1.94.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1343 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1352 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe chrpath-native-0.18-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 1355 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_populate_sysroot_setscene)
NOTE: recipe fontconfig-2.17.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-mako-native-1.3.10-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1360 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.9.bb:do_recipe_qa_setscene)
NOTE: recipe libgcrypt-1.12.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe tiff-4.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libstd-rs-1.94.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1361 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.77.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Started
NOTE: recipe librsvg-2.61.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe readline-8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1362 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: recipe readline-8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-mako-native-1.3.10-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1363 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1364 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/iso-codes/iso-codes_4.20.1.bb:do_packagedata_setscene)
NOTE: recipe fontconfig-2.17.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe tiff-4.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.12.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1369 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 1374 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1375 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.86.bb:do_recipe_qa_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1376 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe librsvg-2.61.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-2.77-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1378 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1381 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1386 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.2.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe iso-codes-4.20.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 1391 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-2.77-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1395 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_create_spdx_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libusb1-1.0.29-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1397 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe readline-8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1399 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_recipe_qa_setscene)
NOTE: recipe bluez5-5.86-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.15.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe sbc-2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1405 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1411 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_create_spdx_setscene)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libusb1-1.0.29-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1414 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_recipe_qa_setscene)
NOTE: recipe bluez5-5.86-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1417 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.3.bb:do_create_spdx_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1425 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.19.0.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.15.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe sbc-2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1427 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb:do_recipe_qa_setscene)
NOTE: recipe fontconfig-2.17.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1434 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.41.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe gtk+3-3.24.51-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1436 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_create_recipe_spdx_setscene)
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1438 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1441 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.0.bb:do_recipe_qa_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.14.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1449 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe gtk+3-3.24.51-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1454 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.19.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libstd-rs-1.94.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1456 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1462 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_recipe_qa_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1463 of 1993 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_populate_sysroot_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.14.3-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1464 of 1993 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_create_spdx_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe pango-1.57.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.14.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1466 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1474 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_create_spdx_setscene)
NOTE: recipe curl-8.19.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1477 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1479 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_recipe_qa_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1481 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pango-1.57.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.14.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1482 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunwind/libunwind_1.8.3.bb:do_packagedata_setscene)
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1483 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunwind/libunwind_1.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-macros-native-1_1.20.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libical-native-3.0.20-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1486 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1489 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_recipe_qa_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1491 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1492 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_packagedata_setscene)
NOTE: recipe libxv-1.0.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1494 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunwind-1.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-native-1_1.20.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1495 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_create_spdx_setscene)
NOTE: recipe libunwind-1.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1496 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1497 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_create_spdx_setscene)
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1499 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_create_spdx_setscene)
NOTE: recipe libxv-1.0.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1505 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe freetype-2.14.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe icu-78.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libical-native-3.0.20-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1507 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1511 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libunistring-1.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunwind-1.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1512 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.0.bb:do_recipe_qa_setscene)
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1515 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1518 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_recipe_qa_setscene)
NOTE: recipe libunwind-1.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe freetype-2.14.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1524 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1525 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.41.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1526 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.55.bb:do_create_spdx_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1528 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1529 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_packagedata_setscene)
NOTE: recipe icu-78.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1530 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.3.bb:do_create_spdx_setscene)
NOTE: recipe libx11-1_1.8.13-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1534 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.14.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe at-spi2-core-2.60.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe orc-0.4.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1535 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.7.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1536 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: recipe libical-3.0.20-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1537 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libpng-1.6.55-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe sqlite3-3_3.51.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe at-spi2-core-2.60.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1538 of 1993 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/xmlto/xmlto_0.0.29.bb:do_populate_sysroot_setscene)
NOTE: recipe orc-0.4.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1541 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.59.bb:do_recipe_qa_setscene)
NOTE: recipe kmod-34.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.14.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1544 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_recipe_qa_setscene)
NOTE: recipe libxtst-1_1.2.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1545 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1551 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libical-3.0.20-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1554 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1557 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.5.bb:do_create_spdx_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe iso-codes-4.20.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1560 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_recipe_qa_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1561 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_create_spdx_setscene)
NOTE: recipe libpam-1.7.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libpng-1.6.55-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1566 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.51.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1568 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1570 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtheora-1.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.59-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xmlto-native-0.0.29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.7.5-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1571 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_recipe_qa_setscene)
NOTE: recipe xkeyboard-config-2.47-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1577 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_populate_sysroot_setscene)
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1579 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.94.0.bb:do_recipe_qa_setscene)
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtheora-1.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1580 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.5.bb:do_create_spdx_setscene)
NOTE: recipe fribidi-1.0.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe flac-1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.59-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1584 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1586 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1587 of 1993 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe xz-5.8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.47-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.7.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1590 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1591 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1592 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1595 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_populate_sysroot_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1596 of 1993 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_recipe_qa_setscene)
NOTE: recipe xmlto-native-0.0.29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1598 of 1993 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.2.bb:do_create_spdx_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe flac-1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1600 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1602 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libucontext_1.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1603 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_recipe_qa_setscene)
NOTE: recipe icu-78.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libstd-rs-1.94.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe openssl-3.5.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-macros-native-1_1.20.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1605 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_spdx_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe readline-8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe harfbuzz-12.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libstd-rs-1.94.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 1611 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_recipe_qa_setscene)
NOTE: recipe libxft-1_2.3.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libucontext-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1613 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_packagedata_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libical-native-3.0.20-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-native-2.15.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe openssl-3.5.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1616 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_packagedata_setscene)
NOTE: recipe util-macros-native-1_1.20.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1617 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.5.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1619 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_create_spdx_setscene)
NOTE: recipe readline-8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe harfbuzz-12.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1620 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libucontext_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1625 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1626 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_recipe_spdx_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libical-native-3.0.20-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1630 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1631 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1632 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libxml2-native-2.15.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1638 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libucontext-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1639 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_create_recipe_spdx_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe expat-2.7.5-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1640 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.55.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libucontext-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.19.4-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe icu-78.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1642 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.51.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 1645 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.47.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1646 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.17.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1656 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.4.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.7.5-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1658 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1659 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1660 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_packagedata_setscene)
NOTE: recipe libpng-1.6.55-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1661 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1664 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.5.bb:do_create_recipe_spdx_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe sqlite3-3_3.51.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1665 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-protocols-1.47-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1669 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.17.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe fontconfig-2.17.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1670 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_packagedata_setscene)
NOTE: recipe libucontext-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fontconfig-2.17.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1672 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1674 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_create_recipe_spdx_setscene)
NOTE: recipe shadow-4.19.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2025.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpng-1.6.55-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1677 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_create_recipe_spdx_setscene)
NOTE: recipe xz-5.8.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.5-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1679 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-protocols-1.47-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1680 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2025.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1683 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1684 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.2.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.19.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1685 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1688 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe vala-0.56.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1690 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1696 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.5.5-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1698 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.19.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1700 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_recipe_qa_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1703 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1705 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1707 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1708 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libxml2-2.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libogg-1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1710 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_recipe_qa_setscene)
NOTE: recipe libdrm-2.4.131-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libogg-1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 1712 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.341.0.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.24.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2025.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 1713 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1715 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1716 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1718 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunwind/libunwind_1.8.3.bb:do_recipe_qa_setscene)
NOTE: recipe cairo-1.18.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1723 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libdrm-2.4.131-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1724 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1725 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1726 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1727 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1728 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2025.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libxml2-2.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1729 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1730 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_packagedata_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libunwind-1.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1732 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 1733 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.14.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.4.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1734 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_packagedata_setscene)
NOTE: recipe libunwind-1.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1735 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1736 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1740 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1742 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1744 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_recipe_qa_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.4.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1745 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libucontext_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1746 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1748 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1749 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe icu-78.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.14.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1750 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.2.bb:do_recipe_qa_setscene)
NOTE: recipe freetype-2.14.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1751 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1755 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1756 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe libpciaccess-0.19-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libucontext-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1757 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_package_setscene)
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe icu-78.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.15.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.19-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libucontext-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe freetype-2.14.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.15.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1759 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1764 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1765 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1766 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1767 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 1769 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1770 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1771 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1772 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.55.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1773 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1776 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1777 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1778 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.55.bb:do_packagedata_setscene)
NOTE: Running setscene task 1782 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1783 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.19.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.55-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.55-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.14.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1784 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1785 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe shadow-4.19.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fontconfig-2.17.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe freetype-2.14.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.55-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpng-1.6.55-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_package_setscene: Started
NOTE: Running setscene task 1788 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1789 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1790 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1797 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1798 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1799 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.55.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1801 of 1993 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/bison/bison_3.8.2.bb:do_create_spdx_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1803 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_recipe_spdx_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.55-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bison-native-3.8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpng-1.6.55-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bison-native-3.8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1813 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1815 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1816 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 1817 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1818 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1819 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1821 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1822 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1823 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1824 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1828 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1829 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1832 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1834 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1836 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1838 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1839 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1840 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2025.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2025.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2025.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 920 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_fetch)
NOTE: Running task 927 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_fetch)
NOTE: Running task 929 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_fetch)
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1844 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2025.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1846 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_recipe_qa_setscene)
NOTE: Running task 1002 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_write_config)
NOTE: Running task 1006 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_write_config)
NOTE: Running task 1007 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_write_config)
NOTE: recipe wayland-1.24.0-r0: task do_fetch: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_fetch: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1042 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_fetch: Started
NOTE: recipe wayland-1.24.0-r0: task do_fetch: Succeeded
NOTE: recipe xorgproto-2025.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1066 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_unpack)
NOTE: Running task 1083 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_fetch)
NOTE: Running task 1087 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb:do_fetch)
NOTE: Running task 1104 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_fetch)
NOTE: Running task 1110 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb:do_fetch)
NOTE: Running task 1112 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_fetch)
NOTE: Running task 1115 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_fetch)
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_write_config: Started
NOTE: recipe wayland-1.24.0-r0: task do_write_config: Started
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_write_config: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: Running task 1123 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.0.bb:do_fetch)
NOTE: recipe xorgproto-2025.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1130 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 1131 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe wayland-1.24.0-r0: task do_unpack: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_fetch: Started
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_fetch: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_write_config: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_write_config: Succeeded
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_write_config: Succeeded
NOTE: recipe vala-0.56.18-r0: task do_fetch: Started
NOTE: Running task 1139 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_fetch)
NOTE: recipe libxft-1_2.3.9-r0: task do_fetch: Started
NOTE: recipe fribidi-1.0.16-r0: task do_fetch: Started
NOTE: recipe harfbuzz-12.3.2-r0: task do_fetch: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_fetch: Succeeded
NOTE: Running task 1156 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_unpack)
NOTE: recipe vala-0.56.18-r0: task do_fetch: Succeeded
NOTE: Running task 1165 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_unpack)
NOTE: recipe pango-1.57.0-r0: task do_fetch: Started
NOTE: Running task 1179 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: Running task 1204 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.341.0.bb:do_fetch)
NOTE: recipe wayland-1.24.0-r0: task do_unpack: Succeeded
NOTE: Running task 1205 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_patch)
NOTE: recipe shared-mime-info-2.4-r0: task do_unpack: Started
NOTE: recipe vala-0.56.18-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1206 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_fetch: Started
NOTE: recipe librsvg-2.61.3-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_patch: Started
NOTE: Running task 1210 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1212 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe libpciaccess-0.19-r0: task do_fetch: Started
NOTE: recipe wayland-1.24.0-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: Running task 1213 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_fetch: Succeeded
NOTE: Running task 1214 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1215 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe vala-0.56.18-r0: task do_unpack: Succeeded
NOTE: Running task 1216 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_patch)
NOTE: recipe wayland-1.24.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pango-1.57.0-r0: task do_fetch: Succeeded
NOTE: Running task 1217 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.0.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_unpack: Started
NOTE: recipe vala-0.56.18-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: recipe vala-0.56.18-r0: task do_patch: Succeeded
NOTE: Running task 1218 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe pango-1.57.0-r0: task do_unpack: Started
NOTE: Running task 1228 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_fetch)
NOTE: recipe wayland-1.24.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_deploy_source_date_epoch unihash changed to 6a4475f06882380a44febcabc2ca80e2943490ce4efa213da59b705b22ec2f64
NOTE: recipe libdrm-2.4.131-r0: task do_fetch: Started
NOTE: recipe fribidi-1.0.16-r0: task do_fetch: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_unpack: Succeeded
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_unpack: Succeeded
NOTE: recipe pango-1.57.0-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: Running task 1229 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_patch)
NOTE: Running task 1230 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_patch)
NOTE: Running task 1231 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_unpack)
NOTE: Running task 1232 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.0.bb:do_patch)
NOTE: Running task 1235 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_fetch)
NOTE: recipe shared-mime-info-2.4-r0: task do_patch: Started
NOTE: recipe fribidi-1.0.16-r0: task do_unpack: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_fetch: Started
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe pango-1.57.0-r0: task do_patch: Started
NOTE: Running task 1239 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb:do_fetch)
NOTE: recipe pango-1.57.0-r0: task do_patch: Succeeded
NOTE: Running task 1248 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_fetch)
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_fetch: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_fetch: Started
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_patch: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_unpack: Succeeded
NOTE: Running task 1249 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1250 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_patch)
NOTE: recipe shared-mime-info-2.4-r0: task do_patch: Succeeded
NOTE: Running task 1251 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_deploy_source_date_epoch)
NOTE: recipe fribidi-1.0.16-r0: task do_patch: Started
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe fribidi-1.0.16-r0: task do_patch: Succeeded
NOTE: Running task 1252 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_fetch)
NOTE: recipe xrandr-1_1.5.3-r0: task do_fetch: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_deploy_source_date_epoch unihash changed to 136350031d83ff80d2178fe7f5bb53f40f8ba9323098440c9eeaf382a9eb415c
NOTE: Running task 1253 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_fetch)
NOTE: recipe libxshmfence-1.3.3-r0: task do_fetch: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_fetch: Succeeded
NOTE: Running task 1254 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_unpack)
NOTE: recipe harfbuzz-12.3.2-r0: task do_fetch: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_fetch: Succeeded
NOTE: Running task 1255 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb:do_unpack)
NOTE: Running task 1256 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_unpack)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_fetch: Succeeded
NOTE: Running task 1257 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_unpack)
NOTE: recipe libxft-1_2.3.9-r0: task do_unpack: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_unpack: Started
NOTE: recipe harfbuzz-12.3.2-r0: task do_unpack: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_unpack: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_unpack: Succeeded
NOTE: Running task 1258 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_patch)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 1259 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_patch)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_unpack: Succeeded
NOTE: recipe libxft-1_2.3.9-r0: task do_patch: Started
NOTE: Running task 1260 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_patch)
NOTE: recipe libxft-1_2.3.9-r0: task do_patch: Succeeded
NOTE: Running task 1261 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_deploy_source_date_epoch)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_patch: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_patch: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_patch: Succeeded
NOTE: Running task 1262 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_patch: Succeeded
NOTE: recipe vala-0.56.18-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1282 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_deploy_source_date_epoch)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_deploy_source_date_epoch unihash changed to e7e37f108102f340ba85dabccb1b8266e489be9945b3927c5a76ef01a1aae21e
NOTE: recipe fribidi-1.0.16-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vala-0.56.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpciaccess-0.19-r0: task do_fetch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_deploy_source_date_epoch unihash changed to bb1ba8e913f38953c8512d41b8ddf04bef8b64cb33950078fa49075fbce4713a
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_deploy_source_date_epoch unihash changed to 4f87b95c7a8ad4b919a32427c5c185814d24cbb2811eb8ef8144c7d471e28818
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_deploy_source_date_epoch unihash changed to f067a1a02e716fb8a003707af091d84c90b8c7b284e864ee06a25fe708d74fe5
NOTE: recipe libxdamage-1_1.1.7-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1714 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1715 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_packagedata_setscene)
NOTE: recipe harfbuzz-12.3.2-r0: task do_unpack: Succeeded
NOTE: Running setscene task 1830 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1833 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1845 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1846 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 1284 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb:do_patch)
NOTE: Running task 1285 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb:do_write_config)
NOTE: recipe libpcre2-10.47-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-12.3.2-r0: task do_write_config: Started
NOTE: recipe util-linux-2.41.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-12.3.2-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe harfbuzz-12.3.2-r0: task do_patch: Succeeded
NOTE: Running setscene task 1853 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_recipe_qa_setscene)
NOTE: recipe harfbuzz-12.3.2-r0: task do_write_config: Succeeded
NOTE: Running task 1286 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1287 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_write_config)
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_fetch: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_fetch: Succeeded
NOTE: Running task 1288 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_unpack)
NOTE: Running task 1291 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_deploy_source_date_epoch)
NOTE: recipe libpcre2-10.47-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1856 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.3.bb:do_packagedata_setscene)
NOTE: Running task 1294 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.41.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1858 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1859 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_populate_sysroot_setscene)
NOTE: recipe harfbuzz-12.3.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.19-r0: task do_unpack: Started
NOTE: recipe fribidi-1.0.16-r0: task do_write_config: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pango-1.57.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe fribidi-1.0.16-r0: task do_write_config: Succeeded
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1861 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.47-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.14.3-r0: task do_packagedata_setscene: Started
NOTE: Running task 1307 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.0.bb:do_write_config)
NOTE: recipe libpciaccess-0.19-r0: task do_unpack: Succeeded
NOTE: recipe python3-3.14.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1308 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_patch)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pango-1.57.0-r0: task do_write_config: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpciaccess-0.19-r0: task do_patch: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_deploy_source_date_epoch unihash changed to 9dd63fc23f766eb264b4568db86fb2a9524594bc06432349977495fdc17231f5
NOTE: recipe libpcre2-10.47-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe harfbuzz-12.3.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpciaccess-0.19-r0: task do_patch: Succeeded
NOTE: recipe pango-1.57.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pango-1.57.0-r0: task do_write_config: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb:do_deploy_source_date_epoch unihash changed to a6396debd7fb3fbdf8532a8d3ecee0ca7de077650671e6aa00cecf8b2e8506b0
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.0.bb:do_deploy_source_date_epoch unihash changed to 66162152275d4d00e1507c398cfb40a19256a828e574051913476ae0a30aa314
NOTE: recipe python3-3.14.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.14.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-2.41.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1805 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1809 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1810 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1811 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1815 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1817 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1822 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: Running setscene task 1823 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1824 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1826 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1827 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-ng-0.9.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.47-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.47-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1828 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1831 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1833 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1835 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.5.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.9.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1836 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.3.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1839 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1840 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1842 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1844 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1845 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1846 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.3.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.51.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.7.5-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.7.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1847 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.51.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1848 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.14.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1849 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.7.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1858 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1879 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 1884 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.7.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1886 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1893 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.14.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1894 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.51.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.9.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1895 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.9.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1896 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1902 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1904 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.5.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20251016-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.51.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1912 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1913 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.5.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1914 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1917 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.131-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1919 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1923 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1925 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1928 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.3.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.7.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1930 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.51.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.7.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.51.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1939 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1942 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1943 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1946 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1948 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1950 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1951 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.5.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1953 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1955 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata_setscene)
NOTE: Running task 1547 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_recipe_qa)
NOTE: Running task 1548 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_deploy_source_date_epoch)
NOTE: recipe openssl-3.5.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1565 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_fetch)
NOTE: Running task 1582 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_unpack)
NOTE: Running task 1584 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_unpack)
NOTE: Running task 1587 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_unpack)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1588 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_unpack)
NOTE: Running setscene task 1956 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1958 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: Running task 1589 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_unpack)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libogg-1.3.6-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mesa-2_26.0.3-r0: task do_recipe_qa: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_unpack: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_unpack: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_unpack: Started
NOTE: recipe libdrm-2.4.131-r0: task do_unpack: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_unpack: Started
NOTE: Running task 1644 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_fetch)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1960 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata_setscene)
NOTE: Running task 1668 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_deploy_source_date_epoch)
NOTE: recipe xrandr-1_1.5.3-r0: task do_unpack: Succeeded
NOTE: Running task 1669 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_patch)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_unpack: Succeeded
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_unpack: Succeeded
NOTE: Running task 1670 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_patch)
NOTE: Running task 1671 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_patch)
NOTE: recipe libdrm-2.4.131-r0: task do_unpack: Succeeded
NOTE: Running task 1672 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_patch)
NOTE: recipe libical-3.0.20-r0: task do_fetch: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_unpack: Succeeded
NOTE: recipe mesa-2_26.0.3-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1673 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_patch)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1674 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_fetch)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_deploy_source_date_epoch unihash changed to 7f73a2b6ff9bf3a84bf6b8b20e00ceda3f5e8e7fb3eee8b1aac82b6175694e0c
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.19-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_patch: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_patch: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_patch: Started
NOTE: recipe libdrm-2.4.131-r0: task do_patch: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_patch: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_patch: Succeeded
NOTE: recipe libxdamage-1_1.1.7-r0: task do_patch: Succeeded
NOTE: recipe libdrm-2.4.131-r0: task do_patch: Succeeded
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_patch: Succeeded
NOTE: recipe mesa-2_26.0.3-r0: task do_fetch: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_patch: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_26.0.3-r0: task do_fetch: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.19-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 1888 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1892 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_populate_sysroot_setscene)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_deploy_source_date_epoch unihash changed to b46c750705d6d26169b2dd932dc75ee69097574ee980e69df9fb2aa9fec24648
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1965 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 1966 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1967 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_recipe_qa_setscene)
NOTE: Running task 1677 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_unpack)
NOTE: Running task 1678 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_write_config)
NOTE: Running task 1696 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.86.bb:do_fetch)
NOTE: Running task 1698 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_write_config)
NOTE: Running task 1700 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_deploy_source_date_epoch)
NOTE: Running task 1702 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_fetch)
NOTE: Running task 1703 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_write_config)
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.19-r0: task do_write_config: Started
NOTE: recipe libical-3.0.20-r0: task do_fetch: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_fetch: Started
NOTE: Running task 1704 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_unpack)
NOTE: recipe libdrm-2.4.131-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bluez5-5.86-r0: task do_fetch: Started
NOTE: recipe mesa-2_26.0.3-r0: task do_unpack: Started
NOTE: recipe libdrm-2.4.131-r0: task do_write_config: Started
NOTE: recipe libpciaccess-0.19-r0: task do_write_config: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe librsvg-2.61.3-r0: task do_write_config: Started
NOTE: Running task 1711 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_deploy_source_date_epoch)
NOTE: recipe libdrm-2.4.131-r0: task do_write_config: Succeeded
NOTE: Running task 1719 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb:do_write_config)
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1970 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 1971 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: recipe libical-3.0.20-r0: task do_unpack: Started
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1972 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe librsvg-2.61.3-r0: task do_write_config: Succeeded
NOTE: Running setscene task 1973 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_write_config: Started
NOTE: recipe libical-3.0.20-r0: task do_unpack: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1974 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.131-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_deploy_source_date_epoch unihash changed to 7a777afe2b2bd2ec4761efac747a1fff1264ccf631ba01527187b017f3332641
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_write_config: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_fetch: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_deploy_source_date_epoch unihash changed to 49ee703cab2d8ccf26a82b77dfdcd5a415ad77014bc11fb18b181205651589e4
NOTE: recipe bluez5-5.86-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1906 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1913 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1915 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1937 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running task 1732 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb:do_unpack)
NOTE: Running task 1733 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_patch)
NOTE: Running task 1746 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 1747 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1748 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_deploy_source_date_epoch)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libical-3.0.20-r0: task do_patch: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_unpack: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1865 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.86.bb:do_unpack)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1894 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_fetch)
NOTE: Running task 1895 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_fetch)
NOTE: Running task 1897 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_fetch)
NOTE: recipe bluez5-5.86-r0: task do_unpack: Started
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_fetch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_fetch: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1990 of 1993 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/bison/bison_3.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.47-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1992 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_recipe_qa_setscene)
NOTE: recipe libical-3.0.20-r0: task do_patch: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_unpack: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_deploy_source_date_epoch unihash changed to 259e1a68594b203d41d05858b12399825ddf0278e969b5b5c970186445d2322c
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bison-native-3.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_fetch: Succeeded
NOTE: recipe bluez5-5.86-r0: task do_unpack: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_deploy_source_date_epoch unihash changed to aa7ff80b6ec83514b471479ed50a62fd68d85048c63aa5984f886d432fb6004d
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_deploy_source_date_epoch unihash changed to a2ac6d6f10409de31aa12966f1d633a87337dc428638fb96e18bbb0f0577e93f
NOTE: recipe bison-native-3.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2255 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2261 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxi-1_1.8.2-r0: task do_fetch: Succeeded
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_fetch: Succeeded
NOTE: Running task 2363 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2374 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.341.0.bb:do_unpack)
NOTE: Running task 2376 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2377 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2378 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2379 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_prepare_recipe_sysroot)
NOTE: recipe wayland-1.24.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2380 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe shared-mime-info-2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2381 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: Running task 2407 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb:do_patch)
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_unpack: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vala-0.56.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe harfbuzz-12.3.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fribidi-1.0.16-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_patch: Started
NOTE: recipe mesa-2_26.0.3-r0: task do_unpack: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2416 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_patch)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2417 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_configure)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxft-1_2.3.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mesa-2_26.0.3-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_patch: Succeeded
NOTE: Running task 2423 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2424 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_configure)
NOTE: Running task 2425 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_configure)
NOTE: recipe wayland-1.24.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 56f86136d7a4cf1994dc4410aea1740546a49f4519d7112a9e473f8c6a2f81f4
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash d4ba6912c58520bcdea5d91d3c26eafc41977a3c62f185885b0fb32f9a48a9fb to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '5f810d200c3dae5ac01f12fceef998a744535744d3d95a3f04927994563d3369', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': 'd4ba6912c58520bcdea5d91d3c26eafc41977a3c62f185885b0fb32f9a48a9fb'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed 5f810d200c3dae5ac01f12fceef998a744535744d3d95a3f04927994563d3369 -> d4ba6912c58520bcdea5d91d3c26eafc41977a3c62f185885b0fb32f9a48a9fb as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_configure: Started
NOTE: Running task 2427 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_configure)
NOTE: Running task 2440 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb:do_deploy_source_date_epoch)
NOTE: recipe libpciaccess-0.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fribidi-1.0.16-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxft-1_2.3.9-r0: task do_configure: Started
NOTE: Running task 2441 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_configure)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_configure: Started
NOTE: recipe mesa-2_26.0.3-r0: task do_patch: Succeeded
NOTE: Running task 2442 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe wayland-1.24.0-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe fribidi-1.0.16-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe harfbuzz-12.3.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vala-0.56.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2443 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_configure)
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_unpack: Succeeded
NOTE: Running task 2444 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_configure)
NOTE: Running task 2445 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.341.0.bb:do_patch)
NOTE: Running task 2446 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb:do_configure)
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb:do_deploy_source_date_epoch unihash changed to 81de8e60a1bf2846df8c4c458d533515b1a6589dc61c6b298c0be1d3418b4ebb
NOTE: recipe shared-mime-info-2.4-r0: task do_configure: Started
NOTE: recipe vala-0.56.18-r0: task do_configure: Started
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_patch: Started
NOTE: recipe harfbuzz-12.3.2-r0: task do_configure: Started
NOTE: recipe libpciaccess-0.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_patch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2447 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_configure)
NOTE: Running task 2448 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.341.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2449 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.341.0.bb:do_generate_toolchain_file)
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_fetch: Succeeded
NOTE: Running task 2450 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb:do_unpack)
NOTE: recipe libpciaccess-0.19-r0: task do_configure: Started
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 2451 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Setscene tasks completed
NOTE: Running task 2452 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb:do_configure)
NOTE: recipe libogg-1.3.6-r0: task do_fetch: Succeeded
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2453 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_unpack)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.341.0.bb:do_deploy_source_date_epoch unihash changed to faebd72cfe7705be46c93d167f182e2b4811eed4b80a265c07d133ff3d15b883
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_configure: Started
NOTE: recipe libogg-1.3.6-r0: task do_unpack: Started
NOTE: recipe libogg-1.3.6-r0: task do_unpack: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2454 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_patch)
NOTE: Running task 2459 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2460 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libogg-1.3.6-r0: task do_patch: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libogg-1.3.6-r0: task do_patch: Succeeded
NOTE: Running task 2471 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_deploy_source_date_epoch)
NOTE: recipe libxshmfence-1.3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libogg-1.3.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Succeeded
NOTE: Running task 2472 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.86.bb:do_patch)
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_unpack: Succeeded
NOTE: Running task 2473 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb:do_patch)
NOTE: recipe bluez5-5.86-r0: task do_patch: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2474 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_configure)
NOTE: recipe libxshmfence-1.3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libogg-1.3.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_patch: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_deploy_source_date_epoch unihash changed to 14e5fcbcb822c6994e8b3ead4634e2096bf04c5bc70e1b7a4d5aa59ceb4e22c3
NOTE: recipe bluez5-5.86-r0: task do_patch: Succeeded
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_patch: Succeeded
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_configure: Started
NOTE: Setscene tasks completed
NOTE: Running task 2475 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2476 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb:do_generate_toolchain_file)
NOTE: Running task 2477 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_configure)
NOTE: Running task 2478 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_configure: Started
NOTE: recipe libogg-1.3.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 2480 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_unpack)
NOTE: recipe fribidi-1.0.16-r0: task do_configure: Succeeded
NOTE: Running task 2481 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_compile)
NOTE: recipe libxi-1_1.8.2-r0: task do_unpack: Started
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb:do_deploy_source_date_epoch unihash changed to a002bb4cd75982198a9d5335c355e2c930fc01fb8e52317739a47d0a27d08e15
NOTE: recipe libogg-1.3.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_compile: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_unpack: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2482 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb:do_configure)
NOTE: Running task 2483 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_configure)
NOTE: Running task 2484 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_patch)
NOTE: recipe wayland-1.24.0-r0: task do_configure: Succeeded
NOTE: Running task 2485 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_configure_ptest_base)
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_configure: Started
NOTE: recipe libogg-1.3.6-r0: task do_configure: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_patch: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_patch: Succeeded
NOTE: recipe libpciaccess-0.19-r0: task do_configure: Succeeded
NOTE: Running task 2538 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_fetch)
NOTE: recipe wayland-1.24.0-r0: task do_configure_ptest_base: Started
NOTE: Running task 2539 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_compile)
NOTE: recipe wayland-1.24.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2540 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_compile)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_fetch: Started
NOTE: recipe libpciaccess-0.19-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_configure: Succeeded
NOTE: Running task 2541 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_compile)
NOTE: recipe wayland-1.24.0-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_compile: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_fetch: Succeeded
NOTE: Running task 2554 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_unpack)
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_unpack: Started
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_configure: Succeeded
NOTE: Running task 2555 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb:do_compile)
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_unpack: Succeeded
NOTE: Running task 2556 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_unpack)
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_compile: Started
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_compile: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Started
NOTE: Running task 2557 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb:do_install)
NOTE: recipe libpciaccess-0.19-r0: task do_compile: Succeeded
NOTE: Running task 2558 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_install)
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_install: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Succeeded
NOTE: Running task 2559 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_unpack)
NOTE: recipe libpciaccess-0.19-r0: task do_install: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_unpack: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_unpack: Succeeded
NOTE: Running task 2560 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_patch)
NOTE: recipe fribidi-1.0.16-r0: task do_compile: Succeeded
NOTE: Running task 2561 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_install)
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_install: Succeeded
NOTE: Running task 2562 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb:do_populate_sysroot)
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_patch: Started
NOTE: recipe wayland-1.24.0-r0: task do_compile: Succeeded
NOTE: Running task 2563 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_compile_ptest_base)
NOTE: recipe fribidi-1.0.16-r0: task do_install: Started
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_populate_sysroot: Started
NOTE: recipe wayland-1.24.0-r0: task do_compile_ptest_base: Started
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_patch: Succeeded
NOTE: Running task 2564 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_patch)
NOTE: recipe wayland-1.24.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2565 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_install)
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Started
NOTE: recipe libpciaccess-0.19-r0: task do_install: Succeeded
NOTE: Running task 2566 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_populate_sysroot)
NOTE: recipe wayland-1.24.0-r0: task do_install: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Succeeded
NOTE: Running task 2568 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_fetch)
NOTE: recipe libpciaccess-0.19-r0: task do_populate_sysroot: Started
NOTE: recipe flac-1.5.0-r0: task do_fetch: Started
NOTE: recipe harfbuzz-12.3.2-r0: task do_configure: Succeeded
NOTE: Running task 2569 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb:do_compile)
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_install: Succeeded
NOTE: Running task 2570 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_patch)
NOTE: Running task 2571 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_populate_sysroot)
NOTE: recipe harfbuzz-12.3.2-r0: task do_compile: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_patch: Started
NOTE: recipe fribidi-1.0.16-r0: task do_populate_sysroot: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_patch: Succeeded
NOTE: recipe libpciaccess-0.19-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2574 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_deploy_source_date_epoch)
NOTE: Running task 2575 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_prepare_recipe_sysroot)
NOTE: recipe wayland-1.24.0-r0: task do_install: Succeeded
NOTE: recipe mesa-2_26.0.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libdrm-2.4.131-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2576 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_install_ptest_base)
NOTE: recipe wayland-1.24.0-r0: task do_install_ptest_base: Started
NOTE: recipe mesa-2_26.0.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2579 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_rust_gen_targets)
NOTE: recipe fribidi-1.0.16-r0: task do_populate_sysroot: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2580 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_write_config)
NOTE: Running task 2581 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_populate_sysroot)
NOTE: recipe mesa-2_26.0.3-r0: task do_rust_gen_targets: Started
NOTE: recipe mesa-2_26.0.3-r0: task do_rust_gen_targets: Succeeded
NOTE: Running task 2589 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_deploy_source_date_epoch)
NOTE: recipe mesa-2_26.0.3-r0: task do_write_config: Started
NOTE: recipe wayland-1.24.0-r0: task do_populate_sysroot: Started
NOTE: recipe libdrm-2.4.131-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2590 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_configure)
NOTE: recipe mesa-2_26.0.3-r0: task do_write_config: Succeeded
NOTE: recipe libical-3.0.20-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2592 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_package)
NOTE: recipe libdrm-2.4.131-r0: task do_configure: Started
NOTE: recipe wayland-1.24.0-r0: task do_package: Started
NOTE: recipe libical-3.0.20-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_deploy_source_date_epoch unihash changed to c1eecc43650ea01d8c3a6a27fee78b4da6061c95264b05dee8c0e0b53747141b
NOTE: recipe wayland-1.24.0-r0: task do_populate_sysroot: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2593 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_generate_toolchain_file)
NOTE: Running task 2602 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.86.bb:do_deploy_source_date_epoch)
NOTE: recipe shared-mime-info-2.4-r0: task do_compile: Succeeded
NOTE: Running task 2603 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_install)
NOTE: recipe libical-3.0.20-r0: task do_generate_toolchain_file: Started
NOTE: recipe bluez5-5.86-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_install: Started
NOTE: recipe libical-3.0.20-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 2612 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_fetch)
NOTE: recipe orc-0.4.42-r0: task do_fetch: Started
NOTE: recipe bluez5-5.86-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.86.bb:do_deploy_source_date_epoch unihash changed to 3b887ae10056636cedf350f893eab74cb2d800980cf7a240c29867ef530d8077
NOTE: Setscene tasks completed
NOTE: Running task 2614 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_fetch)
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_configure: Succeeded
NOTE: Running task 2615 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb:do_configure_ptest_base)
NOTE: recipe libxtst-1_1.2.5-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_configure_ptest_base: Started
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2616 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb:do_compile)
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_install: Succeeded
NOTE: Running task 2617 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_populate_sysroot)
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot: Started
NOTE: recipe libdrm-2.4.131-r0: task do_configure: Succeeded
NOTE: Running task 2618 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_compile)
NOTE: recipe wayland-1.24.0-r0: task do_package: Succeeded
NOTE: Running task 2619 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_packagedata)
NOTE: recipe libdrm-2.4.131-r0: task do_compile: Started
NOTE: recipe wayland-1.24.0-r0: task do_packagedata: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_configure: Succeeded
NOTE: Running task 2620 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_compile)
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2621 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe orc-0.4.42-r0: task do_fetch: Succeeded
NOTE: Running task 2622 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_compile: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_configure: Succeeded
NOTE: Running task 2623 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_compile)
NOTE: recipe libxi-1_1.8.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wayland-1.24.0-r0: task do_packagedata: Succeeded
NOTE: recipe libxft-1_2.3.9-r0: task do_configure: Succeeded
NOTE: Running task 2630 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_fetch)
NOTE: Running task 2631 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_compile)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_compile: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_fetch: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_compile: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_fetch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_deploy_source_date_epoch unihash changed to eacb331d9d5e419a6a0e22481adfd54328191ccc169530c082682382abd64f0f
NOTE: Setscene tasks completed
NOTE: Running task 2633 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_unpack)
NOTE: Running task 2642 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb:do_package)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_compile: Succeeded
NOTE: Running task 2643 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_install)
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_package: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_unpack: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2644 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_configure)
NOTE: recipe libsndfile1-1.2.2-r0: task do_fetch: Succeeded
NOTE: recipe libxrandr-1_1.5.5-r0: task do_compile: Succeeded
NOTE: Running task 2664 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_fetch)
NOTE: Running task 2665 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_install)
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_configure: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Started
NOTE: recipe flac-1.5.0-r0: task do_fetch: Succeeded
NOTE: Running task 2666 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_unpack)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_install: Started
NOTE: recipe flac-1.5.0-r0: task do_unpack: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Succeeded
NOTE: Running task 2670 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.0.bb:do_fetch)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_install: Succeeded
NOTE: Running task 2671 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_populate_sysroot)
NOTE: recipe at-spi2-core-2.60.0-r0: task do_fetch: Started
NOTE: recipe flac-1.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 2672 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_package)
NOTE: recipe libxft-1_2.3.9-r0: task do_compile: Succeeded
NOTE: Running task 2673 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_install)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_package: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_unpack: Succeeded
NOTE: Running task 2674 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_patch)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_install: Succeeded
NOTE: recipe libxft-1_2.3.9-r0: task do_install: Started
NOTE: Running task 2675 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_populate_sysroot)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_patch: Started
NOTE: recipe at-spi2-core-2.60.0-r0: task do_fetch: Succeeded
NOTE: recipe libxrandr-1_1.5.5-r0: task do_populate_sysroot: Started
NOTE: Running task 2676 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_package)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_patch: Succeeded
NOTE: Running task 2677 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_patch)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_package: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_configure: Succeeded
NOTE: recipe flac-1.5.0-r0: task do_patch: Started
NOTE: Running task 2678 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_compile)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2679 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe flac-1.5.0-r0: task do_patch: Succeeded
NOTE: Running task 2680 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_compile: Started
NOTE: recipe libdrm-2.4.131-r0: task do_compile: Succeeded
NOTE: Running task 2681 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_install)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_install: Succeeded
NOTE: Running task 2682 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_populate_sysroot)
NOTE: recipe libxi-1_1.8.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vala-0.56.18-r0: task do_configure: Succeeded
NOTE: recipe libxrandr-1_1.5.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2683 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_compile)
NOTE: Running task 2684 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.341.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libdrm-2.4.131-r0: task do_install: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_populate_sysroot: Started
NOTE: recipe vala-0.56.18-r0: task do_compile: Started
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2685 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_configure)
NOTE: recipe libxi-1_1.8.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2686 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_configure: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_package: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_configure: Succeeded
NOTE: Running task 2687 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_compile)
NOTE: Running task 2688 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_configure)
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2689 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.341.0.bb:do_configure)
NOTE: recipe libxft-1_2.3.9-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2690 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb:do_packagedata)
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_compile: Succeeded
NOTE: recipe libogg-1.3.6-r0: task do_configure: Succeeded
NOTE: Running task 2691 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_install)
NOTE: Running task 2692 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_compile)
NOTE: recipe libxshmfence-1.3.3-r0: task do_compile: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_configure: Started
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_packagedata: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2693 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_configure)
NOTE: recipe libogg-1.3.6-r0: task do_compile: Started
NOTE: recipe libdrm-2.4.131-r0: task do_install: Succeeded
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_install: Started
NOTE: Running task 2694 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_populate_sysroot)
NOTE: recipe xrandr-1_1.5.3-r0: task do_configure: Started
NOTE: recipe libdrm-2.4.131-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb:do_packagedata unihash changed to 15bd1a8ca539975522c3ee293c044dbc89f662611adb383a4a20038c8fefe001
NOTE: Setscene tasks completed
NOTE: Running task 2695 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_fetch)
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_install: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_compile: Succeeded
NOTE: Running task 2696 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_populate_sysroot)
NOTE: Running task 2697 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_install)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_fetch: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_populate_sysroot: Started
NOTE: recipe libdrm-2.4.131-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2706 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_unpack)
NOTE: recipe libxshmfence-1.3.3-r0: task do_install: Started
NOTE: recipe orc-0.4.42-r0: task do_unpack: Started
NOTE: recipe orc-0.4.42-r0: task do_unpack: Succeeded
NOTE: Running task 2707 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_unpack)
NOTE: recipe libxtst-1_1.2.5-r0: task do_unpack: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_configure: Succeeded
NOTE: recipe libogg-1.3.6-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2708 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.341.0.bb:do_compile)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_package: Succeeded
NOTE: Running task 2709 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_install)
NOTE: Running task 2710 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_patch)
NOTE: recipe libxtst-1_1.2.5-r0: task do_unpack: Succeeded
NOTE: Running task 2711 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_patch)
NOTE: recipe libxshmfence-1.3.3-r0: task do_install: Succeeded
NOTE: Running task 2712 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_packagedata)
NOTE: Running task 2713 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_populate_sysroot)
NOTE: recipe orc-0.4.42-r0: task do_patch: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_patch: Started
NOTE: recipe orc-0.4.42-r0: task do_patch: Succeeded
NOTE: recipe libogg-1.3.6-r0: task do_install: Started
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_compile: Started
NOTE: Running task 2715 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_fetch)
NOTE: recipe libxtst-1_1.2.5-r0: task do_patch: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot: Started
NOTE: Running task 2726 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_unpack)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_packagedata: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_fetch: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_package: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_unpack: Started
NOTE: Running task 2727 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_packagedata)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_packagedata: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_unpack: Succeeded
NOTE: Running task 2728 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_patch)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2738 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_fetch)
NOTE: recipe libsndfile1-1.2.2-r0: task do_patch: Started
NOTE: recipe libxv-1.0.13-r0: task do_fetch: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2739 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_fetch)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2740 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_fetch)
NOTE: recipe libtheora-1.2.0-r0: task do_fetch: Started
NOTE: recipe libogg-1.3.6-r0: task do_install: Succeeded
NOTE: Running task 2741 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_populate_sysroot)
NOTE: recipe libglu-2_9.0.3-r0: task do_fetch: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_fetch: Succeeded
NOTE: Running task 2742 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libogg-1.3.6-r0: task do_populate_sysroot: Started
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_configure: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_patch: Succeeded
NOTE: Running task 2743 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 2744 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_configure_ptest_base)
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_configure_ptest_base: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_deploy_source_date_epoch unihash changed to a43a08ece7e6936d9ec387b5e07db4ea8a47a7d11000e0febd5d481489cd481b
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe libogg-1.3.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2745 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_compile)
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2748 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_deploy_source_date_epoch)
NOTE: Running task 2749 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_prepare_recipe_sysroot)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch unihash changed to 31d32bf3418c95d5c02e210d0f86e37a847eae7b5ed2d870bf65f249ca398d3d
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_compile: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_fetch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2750 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2752 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_write_config)
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_write_config: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xkeyboard-config-2.47-r0: task do_write_config: Succeeded
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_deploy_source_date_epoch unihash changed to 0e6dd4b92779ee7f9d4aef6c08a153cd5f194300c4294b28a029766f7a5a9008
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2753 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_configure)
NOTE: Running task 2754 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_configure)
NOTE: Running task 2755 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2756 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.25.bb:do_recipe_qa)
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Started
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_configure: Started
NOTE: recipe libxv-1.0.13-r0: task do_fetch: Succeeded
NOTE: Running task 2762 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_package)
NOTE: recipe xkeyboard-config-2.47-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxmlb-0.3.25-r0: task do_recipe_qa: Started
NOTE: recipe libpciaccess-0.19-r0: task do_package: Started
NOTE: recipe libxmlb-0.3.25-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2763 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.25.bb:do_fetch)
NOTE: recipe libxmlb-0.3.25-r0: task do_fetch: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_fetch: Succeeded
NOTE: Running task 2766 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_unpack)
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2767 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_configure)
NOTE: recipe xkeyboard-config-2.47-r0: task do_configure: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Succeeded
NOTE: Running task 2771 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_patch)
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Succeeded
NOTE: Running task 2773 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_create_recipe_spdx)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe libpciaccess-0.19-r0: task do_package: Succeeded
NOTE: recipe libxmlb-0.3.25-r0: task do_fetch: Succeeded
NOTE: Running task 2774 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.0.bb:do_unpack)
NOTE: Running task 2775 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_unpack)
NOTE: recipe at-spi2-core-2.60.0-r0: task do_unpack: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_unpack: Started
NOTE: Running task 2776 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_packagedata)
NOTE: recipe at-spi2-core-2.60.0-r0: task do_unpack: Succeeded
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_unpack: Succeeded
NOTE: Running task 2777 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.0.bb:do_patch)
NOTE: Running task 2778 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_patch)
NOTE: recipe libpciaccess-0.19-r0: task do_packagedata: Started
NOTE: recipe libtheora-1.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 2781 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.9.bb:do_fetch)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_patch: Started
NOTE: recipe at-spi2-core-2.60.0-r0: task do_patch: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_patch: Succeeded
NOTE: recipe at-spi2-core-2.60.0-r0: task do_patch: Succeeded
NOTE: Running task 2782 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_fetch)
NOTE: Running task 2783 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_fetch: Succeeded
NOTE: Running task 2784 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libwebp-1.6.0-r0: task do_fetch: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_unpack: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_configure: Succeeded
NOTE: recipe libxkbcommon-1.13.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpciaccess-0.19-r0: task do_packagedata: Succeeded
NOTE: Running task 2785 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_compile)
NOTE: Running task 2786 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_package)
NOTE: recipe xkeyboard-config-2.47-r0: task do_configure: Succeeded
NOTE: recipe libxcursor-1_1.2.3-r0: task do_unpack: Succeeded
NOTE: Running task 2787 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_patch)
NOTE: Running task 2788 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_compile)
NOTE: recipe xrandr-1_1.5.3-r0: task do_compile: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_patch: Started
NOTE: recipe libdrm-2.4.131-r0: task do_package: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_compile: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_patch: Succeeded
NOTE: Running task 2793 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_package)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_deploy_source_date_epoch unihash changed to 7627dcc1f3db72a0159690268162ea5a88313780d574bda28f12b8fde6a2e444
NOTE: recipe libogg-1.3.6-r0: task do_package: Started
NOTE: Setscene tasks completed
NOTE: Running task 2794 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_write_config)
NOTE: recipe libwebp-1.6.0-r0: task do_fetch: Succeeded
NOTE: Running task 2802 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_unpack)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_write_config: Started
NOTE: recipe libxv-1.0.13-r0: task do_unpack: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_write_config: Succeeded
NOTE: Running task 2803 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_unpack)
NOTE: recipe libxv-1.0.13-r0: task do_unpack: Succeeded
NOTE: Running task 2804 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_unpack)
NOTE: recipe libtheora-1.2.0-r0: task do_unpack: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_unpack: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_compile: Succeeded
NOTE: recipe libtheora-1.2.0-r0: task do_unpack: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_unpack: Succeeded
NOTE: Running task 2807 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.2.bb:do_fetch)
NOTE: Running task 2808 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_install)
NOTE: Running task 2809 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_fetch)
NOTE: recipe sbc-2.2-r0: task do_fetch: Started
NOTE: recipe libgudev-238-r0: task do_fetch: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_install: Started
NOTE: recipe sbc-2.2-r0: task do_fetch: Succeeded
NOTE: Running task 2810 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_create_recipe_spdx)
NOTE: recipe wayland-1.24.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe libgudev-238-r0: task do_fetch: Succeeded
NOTE: Running task 2811 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_patch)
NOTE: recipe wayland-1.24.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 2812 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_patch)
NOTE: recipe libxv-1.0.13-r0: task do_patch: Started
NOTE: recipe libtheora-1.2.0-r0: task do_patch: Started
NOTE: recipe libxv-1.0.13-r0: task do_patch: Succeeded
NOTE: Running task 2813 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_patch)
NOTE: recipe xrandr-1_1.5.3-r0: task do_compile: Succeeded
NOTE: Running task 2814 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_install)
NOTE: recipe libtheora-1.2.0-r0: task do_patch: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_patch: Started
NOTE: Running task 2815 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libglu-2_9.0.3-r0: task do_patch: Succeeded
NOTE: Running task 2817 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe xrandr-1_1.5.3-r0: task do_install: Started
NOTE: recipe flac-1.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe flac-1.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe flac-1.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_deploy_source_date_epoch unihash changed to c4a7de96a9bb7389e1b445fac5e770cc45cdb08816f3d741d7188ef1628fcca1
NOTE: recipe flac-1.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_install: Succeeded
NOTE: recipe xkeyboard-config-2.47-r0: task do_install: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2818 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_populate_sysroot)
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_compile: Succeeded
NOTE: Running task 2819 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_populate_sysroot)
NOTE: Running task 2820 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.341.0.bb:do_install)
NOTE: Running task 2821 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_configure)
NOTE: Running task 2822 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.25.bb:do_unpack)
NOTE: recipe xrandr-1_1.5.3-r0: task do_populate_sysroot: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_populate_sysroot: Started
NOTE: recipe flac-1.5.0-r0: task do_configure: Started
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_install: Started
NOTE: recipe libxmlb-0.3.25-r0: task do_unpack: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_configure: Succeeded
NOTE: Running task 2823 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_compile)
NOTE: recipe libogg-1.3.6-r0: task do_package: Succeeded
NOTE: Running task 2824 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_packagedata)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_compile: Started
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_install: Succeeded
NOTE: recipe libogg-1.3.6-r0: task do_packagedata: Started
NOTE: Running task 2825 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.341.0.bb:do_populate_sysroot)
NOTE: recipe xrandr-1_1.5.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2826 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.341.0.bb:do_package)
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_populate_sysroot: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2827 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_package: Started
NOTE: recipe libdrm-2.4.131-r0: task do_package: Succeeded
NOTE: Running task 2828 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_packagedata)
NOTE: recipe libogg-1.3.6-r0: task do_packagedata: Succeeded
NOTE: recipe libxkbcommon-1.13.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_configure: Succeeded
NOTE: recipe libxmlb-0.3.25-r0: task do_unpack: Succeeded
NOTE: Running task 2858 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_create_recipe_spdx)
NOTE: Running task 2859 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_compile)
NOTE: Running task 2860 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.25.bb:do_patch)
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_compile: Succeeded
NOTE: Running task 2861 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_compile_ptest_base)
NOTE: recipe libdrm-2.4.131-r0: task do_packagedata: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_compile: Succeeded
NOTE: Running task 2862 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb:do_compile_ptest_base)
NOTE: recipe libxmlb-0.3.25-r0: task do_patch: Started
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_compile_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_compile_ptest_base: Started
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2863 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_install)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_compile: Succeeded
NOTE: Running task 2869 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_deploy_source_date_epoch)
NOTE: Running task 2870 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_install)
NOTE: recipe libxmlb-0.3.25-r0: task do_patch: Succeeded
NOTE: Running task 2871 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_package)
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2872 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb:do_install)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 2873 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_package)
NOTE: recipe orc-0.4.42-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libdrm-2.4.131-r0: task do_packagedata: Succeeded
NOTE: recipe libxdamage-1_1.1.7-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_install: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_package: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2874 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_configure)
NOTE: Running task 2875 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_package)
NOTE: recipe xrandr-1_1.5.3-r0: task do_package: Started
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_install: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_configure: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_package: Started
NOTE: recipe orc-0.4.42-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_deploy_source_date_epoch unihash changed to 736755b861dbf7577e92993c54603a9b8791e85ab3444fc737147dd073400d6e
NOTE: Setscene tasks completed
NOTE: Running task 2876 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_install: Succeeded
NOTE: Running task 2877 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_populate_sysroot)
NOTE: recipe libxtst-1_1.2.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_populate_sysroot: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_deploy_source_date_epoch unihash changed to 24ba60406585344d1350a9f311f0fc2e0634045715030ca49fa0f99972b870ee
NOTE: recipe libxi-1_1.8.2-r0: task do_compile: Succeeded
NOTE: recipe libxdamage-1_1.1.7-r0: task do_populate_sysroot: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2878 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_install)
NOTE: Running task 2879 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2880 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_package)
NOTE: recipe libxi-1_1.8.2-r0: task do_install: Started
NOTE: recipe mesa-2_26.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_package: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Succeeded
NOTE: Running task 2881 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_compile)
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_package: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Started
NOTE: Running task 2882 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.341.0.bb:do_packagedata)
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_install: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_install: Succeeded
NOTE: Running task 2883 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb:do_install_ptest_base)
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_install: Succeeded
NOTE: Running task 2884 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_populate_sysroot)
NOTE: Running task 2885 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_install_ptest_base)
NOTE: recipe mesa-2_26.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2886 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_rust_create_wrappers)
NOTE: recipe libxi-1_1.8.2-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_install_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_install_ptest_base: Started
NOTE: recipe mesa-2_26.0.3-r0: task do_rust_create_wrappers: Started
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2890 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_write_config)
NOTE: Running task 2891 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_prepare_recipe_sysroot)
NOTE: recipe mesa-2_26.0.3-r0: task do_rust_create_wrappers: Succeeded
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2892 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_configure)
NOTE: Running task 2893 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_populate_sysroot)
NOTE: recipe orc-0.4.42-r0: task do_write_config: Started
NOTE: recipe orc-0.4.42-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe orc-0.4.42-r0: task do_write_config: Succeeded
NOTE: Running task 2904 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_deploy_source_date_epoch)
NOTE: recipe mesa-2_26.0.3-r0: task do_configure: Started
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2905 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxtst-1_1.2.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_deploy_source_date_epoch unihash changed to 7f1872850ef448ee2d1a107118d04c6427fe9b11202e704d9371ab678d2b5a91
NOTE: recipe orc-0.4.42-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_package: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_package: Succeeded
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_package: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2906 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_configure)
NOTE: Running task 2907 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_configure)
NOTE: Running task 2908 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_packagedata)
NOTE: Running task 2909 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_packagedata)
NOTE: Running task 2910 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_packagedata)
NOTE: Running task 2918 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.9.bb:do_unpack)
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2919 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_unpack)
NOTE: recipe orc-0.4.42-r0: task do_configure: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_configure: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_packagedata: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_packagedata: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_unpack: Started
NOTE: recipe libwebp-1.6.0-r0: task do_unpack: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Succeeded
NOTE: Running task 2920 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_install)
NOTE: recipe libwebp-1.6.0-r0: task do_unpack: Succeeded
NOTE: Running task 2921 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb:do_create_recipe_spdx)
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Started
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_configure: Succeeded
NOTE: Running task 2922 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_unpack: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2925 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.9.bb:do_patch)
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_packagedata: Succeeded
NOTE: Running task 2926 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_patch)
NOTE: recipe xrandr-1_1.5.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2936 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_fetch)
NOTE: Running task 2937 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_fetch)
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_compile: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_configure: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_patch: Started
NOTE: recipe libwebp-1.6.0-r0: task do_patch: Started
NOTE: Running task 2938 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_compile)
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Started
NOTE: recipe libxinerama-1_1.1.6-r0: task do_fetch: Started
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 2939 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.9.bb:do_fetch)
NOTE: recipe libwebp-1.6.0-r0: task do_patch: Succeeded
NOTE: Running task 2941 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_package)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_fetch: Succeeded
NOTE: Running task 2946 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.2.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_patch: Succeeded
NOTE: Running task 2947 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_unpack)
NOTE: recipe fribidi-1.0.16-r0: task do_package: Started
NOTE: recipe sbc-2.2-r0: task do_unpack: Started
NOTE: recipe libgudev-238-r0: task do_unpack: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_package: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Succeeded
NOTE: Running task 2952 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_package)
NOTE: recipe sbc-2.2-r0: task do_unpack: Succeeded
NOTE: Running task 2953 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.2.bb:do_patch)
NOTE: Running task 2954 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_packagedata)
NOTE: recipe libgudev-238-r0: task do_unpack: Succeeded
NOTE: Running task 2955 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_patch)
NOTE: recipe sbc-2.2-r0: task do_patch: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_packagedata: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_package: Started
NOTE: recipe sbc-2.2-r0: task do_patch: Succeeded
NOTE: Running task 2956 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_package)
NOTE: recipe libgudev-238-r0: task do_patch: Started
NOTE: recipe libgudev-238-r0: task do_patch: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_package: Started
NOTE: Running task 2959 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb:do_populate_sysroot)
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Succeeded
NOTE: Running task 2960 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_populate_sysroot: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_packagedata: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Started
NOTE: Running task 2968 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_deploy_source_date_epoch)
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_deploy_source_date_epoch unihash changed to 28bfd3348bccd791291e882f72f38b3a1f856323f3711b7825f5f6688cd82994
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_populate_sysroot: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2970 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_fetch)
NOTE: Running task 2971 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_write_config)
NOTE: Running task 2972 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.0.bb:do_deploy_source_date_epoch)
NOTE: recipe orc-0.4.42-r0: task do_configure: Succeeded
NOTE: Running task 2973 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_compile)
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Started
NOTE: recipe gtk+3-3.24.51-r0: task do_fetch: Started
NOTE: recipe at-spi2-core-2.60.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxinerama-1_1.1.6-r0: task do_fetch: Succeeded
NOTE: Running task 2974 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_deploy_source_date_epoch)
NOTE: recipe gtk+3-3.24.51-r0: task do_fetch: Succeeded
NOTE: Running task 2977 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.0.bb:do_write_config)
NOTE: recipe orc-0.4.42-r0: task do_compile: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Succeeded
NOTE: Running task 2978 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe at-spi2-core-2.60.0-r0: task do_write_config: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe at-spi2-core-2.60.0-r0: task do_write_config: Succeeded
NOTE: recipe at-spi2-core-2.60.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2980 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_package)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.0.bb:do_deploy_source_date_epoch unihash changed to 90f34b45a2a937fce7b90dbac77a672be7ef2f32fc47f22ed8444913c6b2c2cf
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_package: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_deploy_source_date_epoch unihash changed to 85819d071d9c6f524ecaecdb6ff5d8ea039f769e2688a7f3f860b451e72843e8
NOTE: recipe fribidi-1.0.16-r0: task do_package: Succeeded
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2981 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_packagedata)
NOTE: Running task 2982 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_configure)
NOTE: Running task 2984 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2986 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_configure: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fribidi-1.0.16-r0: task do_packagedata: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_deploy_source_date_epoch unihash changed to 60208da05b72ebc099a80a4ac6494b2c5172c8edb2de9a53e77089b607eb28b7
NOTE: recipe libxcursor-1_1.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_packagedata: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2987 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_configure)
NOTE: Running task 2990 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_recipe_qa)
NOTE: Running task 3016 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_configure: Started
NOTE: recipe json-glib-1.10.8-r0: task do_recipe_qa: Started
NOTE: recipe libxv-1.0.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe json-glib-1.10.8-r0: task do_recipe_qa: Succeeded
NOTE: Running task 3017 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_fetch)
NOTE: recipe libxv-1.0.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_deploy_source_date_epoch unihash changed to 265e7b3015d8766e8641df65e1d48d4c36c23b694998b1b58be4f7bbf4822843
NOTE: recipe json-glib-1.10.8-r0: task do_fetch: Started
NOTE: Setscene tasks completed
NOTE: Running task 3018 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libtheora-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe json-glib-1.10.8-r0: task do_fetch: Succeeded
NOTE: Running task 3019 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libtheora-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_deploy_source_date_epoch unihash changed to 9d7a4b67d32b4ee63c0e74ae9461ebfc3bfc9fcbbf9070dbb0f4a5482bee5df8
NOTE: recipe libglu-2_9.0.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_package: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3020 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_packagedata)
NOTE: Running task 3035 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxft-1_2.3.9-r0: task do_package: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxv-1.0.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_packagedata: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_deploy_source_date_epoch unihash changed to 9042d78ffa5870baf86b2fd57d44a9ad16a63710bf9969910cc6750aa600cc94
NOTE: Setscene tasks completed
NOTE: Running task 3036 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_packagedata)
NOTE: Running task 3037 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxv-1.0.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxft-1_2.3.9-r0: task do_packagedata: Started
NOTE: Running task 3038 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_write_config)
NOTE: recipe libtheora-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3039 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_configure)
NOTE: recipe libglu-2_9.0.3-r0: task do_write_config: Started
NOTE: recipe libxv-1.0.13-r0: task do_configure: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_write_config: Succeeded
NOTE: Running task 3042 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_unpack)
NOTE: recipe libtheora-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3043 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_configure)
NOTE: recipe libxft-1_2.3.9-r0: task do_packagedata: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Started
NOTE: Running task 3044 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_unpack)
NOTE: recipe libtheora-1.2.0-r0: task do_configure: Started
NOTE: recipe libxinerama-1_1.1.6-r0: task do_unpack: Started
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Succeeded
NOTE: Running task 3045 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.9.bb:do_unpack)
NOTE: recipe orc-0.4.42-r0: task do_compile: Succeeded
NOTE: Running task 3046 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_install)
NOTE: recipe libxinerama-1_1.1.6-r0: task do_unpack: Succeeded
NOTE: Running task 3047 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.22.1.bb:do_recipe_qa)
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_unpack: Started
NOTE: recipe gtk4-4.22.1-r0: task do_recipe_qa: Started
NOTE: recipe orc-0.4.42-r0: task do_install: Started
NOTE: recipe gtk4-4.22.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 3048 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.22.1.bb:do_fetch)
NOTE: recipe gtk4-4.22.1-r0: task do_fetch: Started
NOTE: recipe gtk4-4.22.1-r0: task do_fetch: Succeeded
NOTE: Running task 3050 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_unpack: Succeeded
NOTE: Running task 3051 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_patch)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_compile: Succeeded
NOTE: Running task 3052 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_install)
NOTE: recipe graphene-1.10.8-r0: task do_patch: Started
NOTE: recipe libxinerama-1_1.1.6-r0: task do_patch: Started
NOTE: recipe libxinerama-1_1.1.6-r0: task do_patch: Succeeded
NOTE: Running task 3053 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.9.bb:do_patch)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_install: Started
NOTE: recipe graphene-1.10.8-r0: task do_patch: Succeeded
NOTE: Running task 3054 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_create_recipe_spdx)
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_patch: Started
NOTE: recipe libpciaccess-0.19-r0: task do_create_recipe_spdx: Started
NOTE: recipe orc-0.4.42-r0: task do_install: Succeeded
NOTE: Running task 3055 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_populate_sysroot)
NOTE: recipe orc-0.4.42-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_patch: Succeeded
NOTE: Running task 3056 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.25.bb:do_deploy_source_date_epoch)
NOTE: recipe libpciaccess-0.19-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3057 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.25.bb:do_write_config)
NOTE: recipe libxmlb-0.3.25-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxmlb-0.3.25-r0: task do_write_config: Started
NOTE: recipe libxmlb-0.3.25-r0: task do_write_config: Succeeded
NOTE: Running task 3058 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.25.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxmlb-0.3.25-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxkbcommon-1.13.1-r0: task do_install: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.25.bb:do_deploy_source_date_epoch unihash changed to 5c9884c54385addf7d5c7da0058f6bf0c7bce0563997bf5ecbcf819a0154f8dc
NOTE: recipe libxmlb-0.3.25-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe orc-0.4.42-r0: task do_populate_sysroot: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3059 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_populate_sysroot)
NOTE: Running task 3069 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_unpack)
NOTE: Running task 3070 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_create_recipe_spdx)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_populate_sysroot: Started
NOTE: recipe libogg-1.3.6-r0: task do_create_recipe_spdx: Started
NOTE: recipe gtk+3-3.24.51-r0: task do_unpack: Started
NOTE: recipe libogg-1.3.6-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3077 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_create_recipe_spdx)
NOTE: recipe libxmlb-0.3.25-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libdrm-2.4.131-r0: task do_create_recipe_spdx: Started
NOTE: Setscene tasks completed
NOTE: Running task 3078 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.25.bb:do_configure)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3080 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/libwpe_1.16.3.bb:do_fetch)
NOTE: recipe libxmlb-0.3.25-r0: task do_configure: Started
NOTE: recipe mesa-2_26.0.3-r0: task do_configure: Succeeded
NOTE: recipe libwpe-1.16.3-r0: task do_fetch: Started
NOTE: Running task 3081 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_compile)
NOTE: recipe libwpe-1.16.3-r0: task do_fetch: Succeeded
NOTE: recipe libdrm-2.4.131-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3088 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nghttp2/nghttp2_1.68.1.bb:do_recipe_qa)
NOTE: Running task 3099 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.9.bb:do_deploy_source_date_epoch)
NOTE: recipe gtk+3-3.24.51-r0: task do_unpack: Succeeded
NOTE: Running task 3100 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_patch)
NOTE: recipe nghttp2-1.68.1-r0: task do_recipe_qa: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mesa-2_26.0.3-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.51-r0: task do_patch: Started
NOTE: recipe nghttp2-1.68.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 3101 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nghttp2/nghttp2_1.68.1.bb:do_fetch)
NOTE: recipe gtk+3-3.24.51-r0: task do_patch: Succeeded
NOTE: Running task 3102 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.9.bb:do_deploy_source_date_epoch unihash changed to 187b589db7dbee2bf45409cbd9f9aa8a1a11489566baba5f929f1ae5237fd86d
NOTE: recipe nghttp2-1.68.1-r0: task do_fetch: Started
NOTE: recipe libwebp-1.6.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Setscene tasks completed
NOTE: Running task 3105 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libwebp-1.6.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_deploy_source_date_epoch unihash changed to ac7756db6836583e070d78f3a78cf018cf33cf1493bb0684abe9f8ed18ee9e86
NOTE: Setscene tasks completed
NOTE: Running task 3108 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_package)
NOTE: recipe flac-1.5.0-r0: task do_configure: Succeeded
NOTE: Running task 3109 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_compile)
NOTE: recipe xkeyboard-config-2.47-r0: task do_package: Started
NOTE: recipe flac-1.5.0-r0: task do_compile: Started
NOTE: recipe nghttp2-1.68.1-r0: task do_fetch: Succeeded
NOTE: Running task 3111 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.9.bb:do_write_config)
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_write_config: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_configure: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_write_config: Succeeded
NOTE: Running task 3112 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3113 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_compile)
NOTE: recipe libwebp-1.6.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_compile: Started
NOTE: recipe libwebp-1.6.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3114 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_configure)
NOTE: recipe libwebp-1.6.0-r0: task do_configure: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_compile: Succeeded
NOTE: Running task 3115 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_install)
NOTE: recipe libxtst-1_1.2.5-r0: task do_install: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_package: Succeeded
NOTE: Running task 3116 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_packagedata)
NOTE: recipe libxtst-1_1.2.5-r0: task do_install: Succeeded
NOTE: Running task 3117 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_populate_sysroot)
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_populate_sysroot: Started
NOTE: Running task 3118 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_create_recipe_spdx)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3120 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.341.0.bb:do_create_recipe_spdx)
NOTE: recipe libxtst-1_1.2.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3121 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata: Succeeded
NOTE: recipe at-spi2-core-2.60.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3122 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_package)
NOTE: recipe libxmlb-0.3.25-r0: task do_configure: Succeeded
NOTE: Running task 3126 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_unpack)
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_package: Started
NOTE: recipe json-glib-1.10.8-r0: task do_unpack: Started
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3131 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe json-glib-1.10.8-r0: task do_unpack: Succeeded
NOTE: Running task 3132 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_patch)
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_compile: Succeeded
NOTE: Running task 3133 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_install)
NOTE: recipe json-glib-1.10.8-r0: task do_patch: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_configure: Succeeded
NOTE: Running task 3134 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_compile)
NOTE: recipe json-glib-1.10.8-r0: task do_patch: Succeeded
NOTE: Running task 3144 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.2.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_install: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 27a1287f03f8699e6a83b8e7203f6b85f617ccd1b7f11fa183cd486905f39fba
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash d4ba6912c58520bcdea5d91d3c26eafc41977a3c62f185885b0fb32f9a48a9fb to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': 'a07d7296b5b90cb071c49258ad083577914e8c50b8622ee1dad601bbb5c1df33', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': 'd4ba6912c58520bcdea5d91d3c26eafc41977a3c62f185885b0fb32f9a48a9fb'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed a07d7296b5b90cb071c49258ad083577914e8c50b8622ee1dad601bbb5c1df33 -> d4ba6912c58520bcdea5d91d3c26eafc41977a3c62f185885b0fb32f9a48a9fb as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Running task 3145 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_compile: Started
NOTE: recipe sbc-2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe at-spi2-core-2.60.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3146 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.0.bb:do_configure)
NOTE: recipe libgudev-238-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sbc-2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.2.bb:do_deploy_source_date_epoch unihash changed to 77df565be99352dcc168daa2e8cec706a2ebd6aa830ddc9a73241e2c713f333b
NOTE: recipe at-spi2-core-2.60.0-r0: task do_configure: Started
NOTE: recipe libgudev-238-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_deploy_source_date_epoch unihash changed to 4f9d13590d3c80e4177b4a63bce550a56674fbe0a6d588e2a8e971eee4720d3a
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3147 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_install)
NOTE: Running task 3151 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_package)
NOTE: Running task 3152 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.22.1.bb:do_unpack)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_configure: Succeeded
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_install: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Started
NOTE: recipe gtk4-4.22.1-r0: task do_unpack: Started
NOTE: Running task 3153 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_compile)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_compile: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_install: Succeeded
NOTE: Running task 3154 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_populate_sysroot)
NOTE: recipe libtheora-1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 3155 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_compile)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_populate_sysroot: Started
NOTE: recipe harfbuzz-12.3.2-r0: task do_compile: Succeeded
NOTE: Running task 3156 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb:do_install)
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_install: Succeeded
NOTE: Running task 3157 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_populate_sysroot)
NOTE: recipe libtheora-1.2.0-r0: task do_compile: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_package: Succeeded
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_populate_sysroot: Started
NOTE: Running task 3158 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_packagedata)
NOTE: recipe harfbuzz-12.3.2-r0: task do_install: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_packagedata: Started
NOTE: recipe gtk4-4.22.1-r0: task do_unpack: Succeeded
NOTE: Running task 3159 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_package)
NOTE: recipe vala-0.56.18-r0: task do_compile: Succeeded
NOTE: Running task 3160 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_install)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3161 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_write_config)
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_package: Started
NOTE: recipe vala-0.56.18-r0: task do_install: Started
NOTE: recipe libgudev-238-r0: task do_write_config: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_compile: Succeeded
NOTE: Running task 3162 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_install)
NOTE: recipe libgudev-238-r0: task do_write_config: Succeeded
NOTE: Running task 3163 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3165 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.22.1.bb:do_patch)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_install: Started
NOTE: recipe libgudev-238-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk4-4.22.1-r0: task do_patch: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_packagedata: Succeeded
NOTE: recipe gtk4-4.22.1-r0: task do_patch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_packagedata unihash changed to 73d788881519ecfa52eda71ce71ff71dccd00d3025edff7140f518e792f86e06
NOTE: recipe libxv-1.0.13-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3167 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_compile)
NOTE: Running task 3170 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_package)
NOTE: Running task 3172 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_create_recipe_spdx)
NOTE: recipe harfbuzz-12.3.2-r0: task do_install: Succeeded
NOTE: Running task 3173 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb:do_populate_sysroot)
NOTE: recipe libxv-1.0.13-r0: task do_compile: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_install: Succeeded
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_package: Started
NOTE: Running task 3174 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb:do_package)
NOTE: recipe harfbuzz-12.3.2-r0: task do_populate_sysroot: Started
NOTE: recipe libgudev-238-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3175 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_populate_sysroot)
NOTE: recipe harfbuzz-12.3.2-r0: task do_package: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3176 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_configure)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_populate_sysroot: Started
NOTE: recipe libgudev-238-r0: task do_configure: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe harfbuzz-12.3.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3177 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_create_recipe_spdx)
NOTE: Running task 3178 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe xrandr-1_1.5.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe pango-1.57.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxv-1.0.13-r0: task do_compile: Succeeded
NOTE: Running task 3179 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_install)
NOTE: recipe xrandr-1_1.5.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe vala-0.56.18-r0: task do_install: Succeeded
NOTE: Running task 3181 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_create_recipe_spdx)
NOTE: recipe libtheora-1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 3182 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_populate_sysroot)
NOTE: recipe libxv-1.0.13-r0: task do_install: Started
NOTE: Running task 3183 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_install)
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Succeeded
NOTE: Running task 3184 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_package)
NOTE: recipe libxshmfence-1.3.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe vala-0.56.18-r0: task do_populate_sysroot: Started
NOTE: recipe libtheora-1.2.0-r0: task do_install: Started
NOTE: recipe vala-0.56.18-r0: task do_package: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3185 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Started
NOTE: recipe pango-1.57.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3186 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.0.bb:do_configure)
NOTE: recipe libxv-1.0.13-r0: task do_install: Succeeded
NOTE: Running task 3187 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_populate_sysroot)
NOTE: recipe pango-1.57.0-r0: task do_configure: Started
NOTE: recipe libxv-1.0.13-r0: task do_populate_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Succeeded
NOTE: Running task 3194 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/libwpe_1.16.3.bb:do_unpack)
NOTE: recipe libtheora-1.2.0-r0: task do_install: Succeeded
NOTE: Running task 3195 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_populate_sysroot)
NOTE: recipe vala-0.56.18-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libwpe-1.16.3-r0: task do_unpack: Started
NOTE: Running task 3196 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtheora-1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe libwpe-1.16.3-r0: task do_unpack: Succeeded
NOTE: Running task 3198 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.21.5.bb:do_fetch)
NOTE: recipe libical-3.0.20-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpsl-0.21.5-r0: task do_fetch: Started
NOTE: recipe libxv-1.0.13-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3199 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nghttp2/nghttp2_1.68.1.bb:do_unpack)
NOTE: recipe nghttp2-1.68.1-r0: task do_unpack: Started
NOTE: recipe libtheora-1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3201 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/libwpe_1.16.3.bb:do_patch)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_package: Succeeded
NOTE: Running task 3206 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_packagedata)
NOTE: recipe libwpe-1.16.3-r0: task do_patch: Started
NOTE: recipe nghttp2-1.68.1-r0: task do_unpack: Succeeded
NOTE: recipe at-spi2-core-2.60.0-r0: task do_configure: Succeeded
NOTE: Running task 3207 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nghttp2/nghttp2_1.68.1.bb:do_patch)
NOTE: recipe libwpe-1.16.3-r0: task do_patch: Succeeded
NOTE: Running task 3208 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.0.bb:do_compile)
NOTE: Running task 3214 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb:do_create_recipe_spdx)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_packagedata: Started
NOTE: recipe nghttp2-1.68.1-r0: task do_patch: Started
NOTE: recipe flac-1.5.0-r0: task do_compile: Succeeded
NOTE: recipe libical-3.0.20-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe at-spi2-core-2.60.0-r0: task do_compile: Started
NOTE: recipe harfbuzz-12.3.2-r0: task do_create_recipe_spdx: Started
NOTE: Running task 3215 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_configure)
NOTE: Running task 3216 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_install)
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_package: Succeeded
NOTE: recipe nghttp2-1.68.1-r0: task do_patch: Succeeded
NOTE: Running task 3217 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_create_recipe_spdx)
NOTE: Running task 3218 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_packagedata)
NOTE: recipe libical-3.0.20-r0: task do_configure: Started
NOTE: recipe flac-1.5.0-r0: task do_install: Started
NOTE: recipe libpsl-0.21.5-r0: task do_fetch: Succeeded
NOTE: Running task 3223 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_create_recipe_spdx)
NOTE: recipe fribidi-1.0.16-r0: task do_create_recipe_spdx: Started
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_packagedata: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3226 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_deploy_source_date_epoch)
NOTE: recipe harfbuzz-12.3.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3227 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_deploy_source_date_epoch)
NOTE: recipe libgudev-238-r0: task do_configure: Succeeded
NOTE: recipe mesa-2_26.0.3-r0: task do_create_recipe_spdx: Started
NOTE: Running task 3228 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_compile)
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxinerama-1_1.1.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe fribidi-1.0.16-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3229 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.9.bb:do_deploy_source_date_epoch)
NOTE: recipe libgudev-238-r0: task do_compile: Started
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3230 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_create_recipe_spdx)
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxinerama-1_1.1.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_deploy_source_date_epoch unihash changed to df565cc150da9ad44a6e90d5f273c5ff654a5f8dcfcd3c8c3451a6e9b1adb457
NOTE: recipe libxft-1_2.3.9-r0: task do_create_recipe_spdx: Started
NOTE: recipe mesa-2_26.0.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_deploy_source_date_epoch unihash changed to ea7d1af69bd20eacb114257902c0423f308f69a5874cfd7d41f260c6f6bbcd48
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxft-1_2.3.9-r0: task do_create_recipe_spdx: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.9.bb:do_deploy_source_date_epoch unihash changed to ae8f9c1d698c02d14600200efe944d143ed62bf5c6201151f57426fe04ed2278
NOTE: Setscene tasks completed
NOTE: Running task 3232 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.25.bb:do_configure_ptest_base)
NOTE: Running task 3234 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_write_config)
NOTE: Running task 3235 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3236 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3237 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.9.bb:do_write_config)
NOTE: recipe libwebp-1.6.0-r0: task do_configure: Succeeded
NOTE: recipe libxmlb-0.3.25-r0: task do_configure_ptest_base: Started
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Started
NOTE: Running task 3238 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_compile)
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxinerama-1_1.1.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxmlb-0.3.25-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_write_config: Started
NOTE: Running task 3239 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.25.bb:do_compile)
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Succeeded
NOTE: recipe libwebp-1.6.0-r0: task do_compile: Started
NOTE: Running task 3246 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_write_config: Succeeded
NOTE: Running task 3249 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_create_recipe_spdx)
NOTE: recipe libxmlb-0.3.25-r0: task do_compile: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_create_spdx: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxinerama-1_1.1.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3250 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_configure)
NOTE: recipe libxinerama-1_1.1.6-r0: task do_configure: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3251 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_package)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_create_spdx: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3252 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_configure)
NOTE: Running task 3254 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb:do_package)
NOTE: recipe libxtst-1_1.2.5-r0: task do_package: Started
NOTE: recipe graphene-1.10.8-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_package: Started
NOTE: recipe harfbuzz-12.3.2-r0: task do_package: Succeeded
NOTE: Running task 3255 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb:do_packagedata)
NOTE: recipe harfbuzz-12.3.2-r0: task do_packagedata: Started
NOTE: recipe harfbuzz-12.3.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3264 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.21.5.bb:do_unpack)
NOTE: recipe flac-1.5.0-r0: task do_install: Succeeded
NOTE: recipe libpsl-0.21.5-r0: task do_unpack: Started
NOTE: Running task 3265 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_populate_sysroot)
NOTE: recipe vala-0.56.18-r0: task do_package: Succeeded
NOTE: recipe flac-1.5.0-r0: task do_populate_sysroot: Started
NOTE: Running task 3266 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_packagedata)
NOTE: recipe vala-0.56.18-r0: task do_packagedata: Started
NOTE: recipe libpsl-0.21.5-r0: task do_unpack: Succeeded
NOTE: Running task 3267 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_package)
NOTE: recipe libgudev-238-r0: task do_compile: Succeeded
NOTE: Running task 3268 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_install)
NOTE: recipe flac-1.5.0-r0: task do_package: Started
NOTE: recipe pango-1.57.0-r0: task do_configure: Succeeded
NOTE: Running task 3269 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.0.bb:do_compile)
NOTE: recipe libgudev-238-r0: task do_install: Started
NOTE: recipe flac-1.5.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3270 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.57.0-r0: task do_compile: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3271 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_configure)
NOTE: recipe libsndfile1-1.2.2-r0: task do_configure: Started
NOTE: recipe libgudev-238-r0: task do_install: Succeeded
NOTE: Running task 3272 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_populate_sysroot)
NOTE: recipe libgudev-238-r0: task do_populate_sysroot: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_package: Succeeded
NOTE: Running task 3273 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_deploy_source_date_epoch)
NOTE: recipe gtk+3-3.24.51-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_package: Succeeded
NOTE: Running task 3274 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_packagedata)
NOTE: recipe gtk+3-3.24.51-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_deploy_source_date_epoch unihash changed to 9f281ae700dd469b716e59a81d556f783b322f5e26b0182948194491eff91d5f
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_packagedata: Started
NOTE: recipe libgudev-238-r0: task do_populate_sysroot: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3275 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_package)
NOTE: Running task 3276 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_packagedata)
NOTE: recipe at-spi2-core-2.60.0-r0: task do_compile: Succeeded
NOTE: Running task 3277 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.0.bb:do_install)
NOTE: recipe libxtst-1_1.2.5-r0: task do_packagedata: Started
NOTE: recipe orc-0.4.42-r0: task do_package: Started
NOTE: recipe at-spi2-core-2.60.0-r0: task do_install: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3279 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.21.5.bb:do_patch)
NOTE: recipe libpsl-0.21.5-r0: task do_patch: Started
NOTE: recipe libpsl-0.21.5-r0: task do_patch: Succeeded
NOTE: Running task 3282 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_create_recipe_spdx)
NOTE: recipe shared-mime-info-2.4-r0: task do_create_recipe_spdx: Started
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3283 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_fetch)
NOTE: recipe desktop-file-utils-0.28-r0: task do_fetch: Started
NOTE: recipe graphene-1.10.8-r0: task do_configure: Succeeded
NOTE: Running task 3284 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_compile)
NOTE: recipe shared-mime-info-2.4-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3289 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.0.bb:do_create_recipe_spdx)
NOTE: recipe graphene-1.10.8-r0: task do_compile: Started
NOTE: recipe libxmlb-0.3.25-r0: task do_compile: Succeeded
NOTE: Running task 3290 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_write_config)
NOTE: recipe pango-1.57.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe libical-3.0.20-r0: task do_configure: Succeeded
NOTE: Running task 3291 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_compile)
NOTE: recipe gtk+3-3.24.51-r0: task do_write_config: Started
NOTE: recipe gtk+3-3.24.51-r0: task do_write_config: Succeeded
NOTE: recipe at-spi2-core-2.60.0-r0: task do_install: Succeeded
NOTE: Running task 3294 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libsoup/libsoup_3.6.6.bb:do_fetch)
NOTE: Running task 3295 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.0.bb:do_populate_sysroot)
NOTE: recipe libical-3.0.20-r0: task do_compile: Started
NOTE: recipe pango-1.57.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3296 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.0.bb:do_package)
NOTE: recipe libsoup-3.6.6-r0: task do_fetch: Started
NOTE: recipe at-spi2-core-2.60.0-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-core-2.60.0-r0: task do_package: Started
NOTE: recipe libsoup-3.6.6-r0: task do_fetch: Succeeded
NOTE: Running task 3297 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_package)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_package: Started
NOTE: recipe flac-1.5.0-r0: task do_package: Succeeded
NOTE: recipe at-spi2-core-2.60.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3300 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.4.bb:do_recipe_qa)
NOTE: Running task 3301 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_packagedata)
NOTE: recipe orc-0.4.42-r0: task do_package: Succeeded
NOTE: Running task 3302 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_packagedata)
NOTE: recipe libfyaml-0.9.4-r0: task do_recipe_qa: Started
NOTE: recipe flac-1.5.0-r0: task do_packagedata: Started
NOTE: recipe orc-0.4.42-r0: task do_packagedata: Started
NOTE: recipe libfyaml-0.9.4-r0: task do_recipe_qa: Succeeded
NOTE: Running task 3304 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.4.bb:do_fetch)
NOTE: recipe libfyaml-0.9.4-r0: task do_fetch: Started
NOTE: recipe flac-1.5.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3305 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/aspell/aspell_0.60.8.2.bb:do_fetch)
NOTE: recipe orc-0.4.42-r0: task do_packagedata: Succeeded
NOTE: Running task 3308 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_create_spdx)
NOTE: recipe desktop-file-utils-0.28-r0: task do_fetch: Succeeded
NOTE: recipe aspell-0.60.8.2-r0: task do_fetch: Started
NOTE: Running task 3313 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_deploy_source_date_epoch)
NOTE: recipe wayland-1.24.0-r0: task do_create_spdx: Started
NOTE: recipe json-glib-1.10.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe json-glib-1.10.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_deploy_source_date_epoch unihash changed to 84c49ef177a7f664bbeede84ddf8f910d84f50d0c80817e66d7b29cd998fc153
NOTE: Setscene tasks completed
NOTE: recipe wayland-1.24.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3316 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_write_config)
NOTE: Running task 3317 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe libfyaml-0.9.4-r0: task do_fetch: Succeeded
NOTE: Running task 3328 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_package)
NOTE: recipe json-glib-1.10.8-r0: task do_write_config: Started
NOTE: recipe json-glib-1.10.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_package: Started
NOTE: recipe json-glib-1.10.8-r0: task do_write_config: Succeeded
NOTE: Running task 3375 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.22.1.bb:do_deploy_source_date_epoch)
NOTE: recipe gtk4-4.22.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gtk4-4.22.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3383 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_create_recipe_spdx)
NOTE: recipe json-glib-1.10.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3384 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_configure)
NOTE: recipe libwebp-1.6.0-r0: task do_compile: Succeeded
NOTE: recipe vala-0.56.18-r0: task do_create_recipe_spdx: Started
NOTE: Running task 3385 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_install)
NOTE: recipe libwebp-1.6.0-r0: task do_install: Started
NOTE: recipe json-glib-1.10.8-r0: task do_configure: Started
NOTE: recipe vala-0.56.18-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3389 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.22.1.bb:do_write_config)
NOTE: recipe gtk4-4.22.1-r0: task do_write_config: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_package: Succeeded
NOTE: recipe gtk4-4.22.1-r0: task do_write_config: Succeeded
NOTE: Running task 3399 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_create_spdx)
NOTE: Running task 3400 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_packagedata)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_create_spdx: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_packagedata: Started
NOTE: recipe vala-0.56.18-r0: task do_packagedata: Failed
NOTE: recipe libxrandr-1_1.5.5-r0: task do_create_spdx: Succeeded
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_packagedata: Succeeded
NOTE: recipe libxinerama-1_1.1.6-r0: task do_configure: Succeeded
NOTE: recipe libwebp-1.6.0-r0: task do_install: Succeeded
NOTE: recipe libxcursor-1_1.2.3-r0: task do_package: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_compile: Succeeded
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_package: Succeeded
NOTE: recipe json-glib-1.10.8-r0: task do_configure: Succeeded
NOTE: recipe libical-3.0.20-r0: task do_compile: Succeeded
NOTE: recipe at-spi2-core-2.60.0-r0: task do_package: Succeeded
NOTE: recipe pango-1.57.0-r0: task do_compile: Succeeded
NOTE: recipe librsvg-2.61.3-r0: task do_fetch: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_configure: Succeeded
NOTE: recipe aspell-0.60.8.2-r0: task do_fetch: Succeeded
NOTE: recipe mesa-2_26.0.3-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 3401 tasks of which 2861 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260401122652.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260401122652.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_packagedata
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/vala/0.56.18/temp/log.do_packagedata.2593594
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: vala-0.56.18-r0 do_packagedata: QA Issue: Package version for package vala-src went backwards which would break package feeds (from 0:0.56.19-r0 to 0:0.56.18-r0) [version-going-backwards]
ERROR: vala-0.56.18-r0 do_packagedata: QA Issue: Package version for package vala-dbg went backwards which would break package feeds (from 0:0.56.19-r0 to 0:0.56.18-r0) [version-going-backwards]
ERROR: vala-0.56.18-r0 do_packagedata: QA Issue: Package version for package vala-staticdev went backwards which would break package feeds (from 0:0.56.19-r0 to 0:0.56.18-r0) [version-going-backwards]
ERROR: vala-0.56.18-r0 do_packagedata: QA Issue: Package version for package vala-dev went backwards which would break package feeds (from 0:0.56.19-r0 to 0:0.56.18-r0) [version-going-backwards]
ERROR: vala-0.56.18-r0 do_packagedata: QA Issue: Package version for package vala-doc went backwards which would break package feeds (from 0:0.56.19-r0 to 0:0.56.18-r0) [version-going-backwards]
ERROR: vala-0.56.18-r0 do_packagedata: QA Issue: Package version for package vala-locale went backwards which would break package feeds (from 0:0.56.19-r0 to 0:0.56.18-r0) [version-going-backwards]
ERROR: vala-0.56.18-r0 do_packagedata: QA Issue: Package version for package vala went backwards which would break package feeds (from 0:0.56.19-r0 to 0:0.56.18-r0) [version-going-backwards]
ERROR: vala-0.56.18-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/vala/0.56.18/temp/log.do_packagedata.2593594
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_packagedata) failed with exit code '1'

--===============0324185264989080809==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/epiphany/epiphany-dbg: PKGSIZE changed from 6299304 to 10825784 (+72%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-dbg: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-dbg: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-dev: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-dev: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-doc: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-doc: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ab: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ab: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-af: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-af: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-am: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-am: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-an: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-an: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ar: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ar: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-as: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-as: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ast: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ast: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-az: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-az: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-be+latin: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-be+latin: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-be: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-be: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-bg: PKGSIZE changed from 127218 to 129093 (+1%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-bg: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-bg: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-bn-in: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-bn-in: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-bn: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-bn: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-br: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-br: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-bs: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-bs: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ca+valencia: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ca+valencia: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ca: PKGSIZE changed from 99742 to 101198 (+1%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ca: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ca: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ckb: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ckb: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-cs: PKGSIZE changed from 99043 to 100565 (+2%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-cs: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-cs: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-cy: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-cy: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-da: PKGSIZE changed from 94177 to 95528 (+1%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-da: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-da: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-de: PKGSIZE changed from 99656 to 100263 (+1%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-de: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-de: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-dz: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-dz: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-el: PKGSIZE changed from 134921 to 136892 (+1%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-el: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-el: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-en+shaw: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-en+shaw: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-en-ca: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-en-ca: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-en-gb: PKGSIZE changed from 90781 to 92044 (+1%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-en-gb: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-en-gb: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-eo: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-eo: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-es: PKGSIZE changed from 98222 to 99636 (+1%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-es: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-es: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-et: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-et: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-eu: PKGSIZE changed from 96613 to 98011 (+1%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-eu: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-eu: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-fa: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-fa: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-fi: PKGSIZE changed from 75209 to 77798 (+3%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-fi: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-fi: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-fr: PKGSIZE changed from 98309 to 105437 (+7%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-fr: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-fr: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-fur: PKGSIZE changed from 94248 to 98787 (+5%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-fur: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-fur: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-fy: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-fy: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ga: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ga: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-gl: PKGSIZE changed from 97413 to 98854 (+1%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-gl: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-gl: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-gu: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-gu: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-gv: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-gv: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-he: PKGSIZE changed from 102094 to 103656 (+2%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-he: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-he: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-hi: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-hi: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-hr: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-hr: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-hu: PKGSIZE changed from 100530 to 102014 (+1%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-hu: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-hu: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-hy: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-hy: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ia: PKGSIZE changed from 47722 to 48762 (+2%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ia: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ia: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-id: PKGSIZE changed from 92922 to 94232 (+1%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-id: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-id: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ie: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ie: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ig: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ig: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-is: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-is: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-it: PKGSIZE changed from 98969 to 100449 (+1%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-it: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-it: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ja: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ja: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ka: PKGSIZE changed from 152974 to 155289 (+2%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ka: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ka: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-kab: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-kab: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-kk: PKGSIZE changed from 122788 to 124504 (+1%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-kk: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-kk: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-km: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-km: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-kn: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-kn: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ko: PKGSIZE changed from 99230 to 100648 (+1%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ko: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ko: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ku: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ku: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-li: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-li: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-lt: PKGSIZE changed from 96543 to 97951 (+1%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-lt: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-lt: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-lv: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-lv: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-mai: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-mai: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-mg: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-mg: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-mi: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-mi: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-mk: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-mk: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ml: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ml: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-mn: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-mn: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-mr: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-mr: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ms: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ms: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-nb: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-nb: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-nds: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-nds: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ne: PKGSIZE changed from 144659 to 143049 (-1%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ne: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ne: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-nl: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-nl: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-nn: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-nn: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-oc: PKGSIZE changed from 60611 to 101745 (+68%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-oc: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-oc: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-or: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-or: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-pa: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-pa: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-pl: PKGSIZE changed from 98350 to 100429 (+2%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-pl: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-pl: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ps: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ps: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-pt-br: PKGSIZE changed from 98177 to 99630 (+1%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-pt-br: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-pt-br: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-pt: PKGSIZE changed from 98037 to 99449 (+1%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-pt: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-pt: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ro: PKGSIZE changed from 98666 to 100198 (+2%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ro: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ro: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ru: PKGSIZE changed from 126492 to 128319 (+1%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ru: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ru: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-rw: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-rw: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-si: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-si: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-sk: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-sk: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-sl: PKGSIZE changed from 95557 to 96937 (+1%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-sl: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-sl: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-sq: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-sq: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-sr+latin: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-sr+latin: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-sr: PKGSIZE changed from 125427 to 127739 (+2%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-sr: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-sr: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-sv: PKGSIZE changed from 94970 to 96344 (+1%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-sv: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-sv: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ta: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ta: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-te: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-te: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-tg: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-tg: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-th: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-th: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-tk: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-tk: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-tr: PKGSIZE changed from 96006 to 97300 (+1%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-tr: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-tr: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ug: PKGSIZE changed from 124726 to 126495 (+1%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ug: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ug: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-uk: PKGSIZE changed from 124057 to 125756 (+1%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-uk: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-uk: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-uz+cyrillic: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-uz+cyrillic: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-uz: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-uz: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-vi: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-vi: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-wa: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-wa: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-yo: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-yo: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-zh-cn: PKGSIZE changed from 88921 to 90220 (+1%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-zh-cn: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-zh-cn: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-zh-hk: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-zh-hk: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-zh-tw: PKGSIZE changed from 84523 to 90880 (+8%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-zh-tw: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-zh-tw: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-src: PKGSIZE changed from 4713126 to 32625753 (+592%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-src: FILELIST: directory renamed /usr/src/debug/epiphany/49.7/third-party/gvdb -> /usr/src/debug/epiphany/50.3/third-party/gvdb, directory renamed /usr/src/debug/epiphany/49.7/src/webapp-provider -> /usr/src/debug/epiphany/50.3/src/webapp-provider, directory renamed /usr/src/debug/epiphany/49.7/lib/history -> /usr/src/debug/epiphany/50.3/lib/history, directory renamed /usr/src/debug/epiphany/49.7/lib/autofill -> /usr/src/debug/epiphany/50.3/lib/autofill, directory renamed /usr/src/debug/epiphany/49.7/embed/web-process-extension -> /usr/src/debug/epiphany/50.3/embed/web-process-extension, directory renamed /usr/src/debug/epiphany/49.7/lib/sync/debug -> /usr/src/debug/epiphany/50.3/lib/sync/debug, directory renamed /usr/src/debug/epiphany/49.7/src/webextension -> /usr/src/debug/epiphany/50.3/src/webextension, directory renamed /usr/src/debug/epiphany/49.7/src/webextension/api -> /usr/src/debug/epiphany/50.3/src/webextension/api, directory
  renamed /usr/src/debug/epiphany/49.7/lib/sync -> /usr/src/debug/epiphany/50.3/lib/sync, directory renamed /usr/src/debug/epiphany/49.7/lib -> /usr/src/debug/epiphany/50.3/lib, directory renamed /usr/src/debug/epiphany/49.7/lib/contrib -> /usr/src/debug/epiphany/50.3/lib/contrib, directory renamed /usr/src/debug/epiphany/49.7/embed -> /usr/src/debug/epiphany/50.3/embed, directory renamed /usr/src/debug/epiphany/49.7/src/bookmarks -> /usr/src/debug/epiphany/50.3/src/bookmarks, directory renamed /usr/src/debug/epiphany/49.7/third-party -> /usr/src/debug/epiphany/50.3/third-party, directory renamed /usr/src/debug/epiphany/49.7/src/search-provider -> /usr/src/debug/epiphany/50.3/src/search-provider, removed "/usr/src/debug/epiphany/49.7/src/preferences/extension-view.c /usr/src/debug/epiphany/49.7/src/ephy-fullscreen-box.c /usr/src/debug/epiphany/49.7/src/ephy-fullscreen-box.h /usr/src/debug/epiphany/49.7/src/preferences/extension-view.h /usr/src/debug/epiphany/49.7/src/ephy-location-co
 ntroller.h /usr/src/debug/epiphany/49.7/src/ephy-downloads-popover.h /usr/src/debug/epiphany/49.7/src/ephy-desktop-utils.c /usr/src/debug/epiphany/49.7/src/ephy-mouse-gesture-controller.h /usr/src/debug/epiphany/49.7/src/ephy-action-helper.h /usr/src/debug/epiphany/49.7/src/ephy-encoding-row.h /usr/src/debug/epiphany/49.7/src/ephy-desktop-utils.h /usr/src/debug/epiphany/49.7/src/ephy-downloads-popover.c /usr/src/debug/epiphany/49.7/src/ephy-location-controller.c /usr/src/debug/epiphany/49.7/src/ephy-encoding-row.c /usr/src/debug/epiphany/49.7/src/ephy-action-helper.c /usr/src/debug/epiphany/49.7/src/ephy-mouse-gesture-controller.c /usr/src/debug/epiphany/49.7/src/ephy-session.c /usr/src/debug/epiphany/49.7/src/ephy-webapp-provider-generated.h /usr/src/debug/epiphany/49.7/src/ephy-webapp-provider-generated.c /usr/src/debug/epiphany/49.7/src/ephy-session.h /usr/src/debug/epiphany/49.7/src/ephy-site-menu-button.h /usr/src/debug/epiphany/49.7/src/ephy-site-menu-button.c /usr/src/debug/e
 piphany/49.7/src/ephy-tab-view.c /usr/src/debug/epiphany/49.7/src/ephy-tab-view.h /usr/src/debug/epiphany/49.7/src/window-commands.h /usr/src/debug/epiphany/49.7/src/ephy-add-opensearch-engine-button.c /usr/src/debug/epiphany/49.7/src/window-commands.c /usr/src/debug/epiphany/49.7/src/ephy-add-opensearch-engine-button.h /usr/src/debug/epiphany/49.7/src/ephy-title-widget.c /usr/src/debug/epiphany/49.7/src/ephy-title-widget.h /usr/src/debug/epiphany/49.7/src/ephy-history-dialog.c /usr/src/debug/epiphany/49.7/src/ephy-history-dialog.h /usr/src/debug/epiphany/49.7/src/ephy-type-builtins.c /usr/src/debug/epiphany/49.7/src/ephy-header-bar.h /usr/src/debug/epiphany/49.7/src/preferences/prefs-privacy-page.c /usr/src/debug/epiphany/49.7/src/ephy-title-box.h /usr/src/debug/epiphany/49.7/src/preferences/prefs-privacy-page.h /usr/src/debug/epiphany/49.7/src/ephy-header-bar.c /usr/src/debug/epiphany/49.7/src/ephy-type-builtins.h /usr/src/debug/epiphany/49.7/src/ephy-title-box.c /usr/src/debug/ep
 iphany/49.7/src/epiphany-resources.c /usr/src/debug/epiphany/49.7/src/preferences/prefs-extensions-page.h /usr/src/debug/epiphany/49.7/src/ephy-passwords-view.c /usr/src/debug/epiphany/49.7/src/ephy-passwords-view.h /usr/src/debug/epiphany/49.7/src/preferences/prefs-extensions-page.c /usr/src/debug/epiphany/49.7/src/ephy-privacy-report.h /usr/src/debug/epiphany/49.7/src/preferences/ephy-search-engine-row.c /usr/src/debug/epiphany/49.7/src/ephy-privacy-report.c /usr/src/debug/epiphany/49.7/src/preferences/ephy-search-engine-row.h /usr/src/debug/epiphany/49.7/src/ephy-page-menu-button.h /usr/src/debug/epiphany/49.7/src/ephy-downloads-paintable.h /usr/src/debug/epiphany/49.7/src/ephy-downloads-paintable.c /usr/src/debug/epiphany/49.7/src/ephy-page-menu-button.c /usr/src/debug/epiphany/49.7/src/ephy-location-entry.c /usr/src/debug/epiphany/49.7/src/ephy-location-entry.h /usr/src/debug/epiphany/49.7/src/ephy-action-bar.c /usr/src/debug/epiphany/49.7/src/preferences/prefs-appearance-page.
 h /usr/src/debug/epiphany/49.7/src/ephy-action-bar.h /usr/src/debug/epiphany/49.7/src/preferences/prefs-appearance-page.c /usr/src/debug/epiphany/49.7/src/ephy-lockdown.h /usr/src/debug/epiphany/49.7/src/ephy-download-widget.c /usr/src/debug/epiphany/49.7/src/preferences/webapp-additional-urls-dialog.c /usr/src/debug/epiphany/49.7/src/ephy-shell-search-provider-generated.h /usr/src/debug/epiphany/49.7/src/ephy-download-widget.h /usr/src/debug/epiphany/49.7/src/preferences/webapp-additional-urls-dialog.h /usr/src/debug/epiphany/49.7/src/ephy-lockdown.c /usr/src/debug/epiphany/49.7/src/ephy-shell-search-provider-generated.c /usr/src/debug/epiphany/49.7/src/preferences/prefs-general-page.h /usr/src/debug/epiphany/49.7/src/preferences/autofill-view.c /usr/src/debug/epiphany/49.7/src/preferences/prefs-general-page.c /usr/src/debug/epiphany/49.7/src/preferences/autofill-view.h /usr/src/debug/epiphany/49.7/src/preferences/ephy-lang-row.c /usr/src/debug/epiphany/49.7/src/profile-migrator/ep
 hy-legacy-web-app-utils.c /usr/src/debug/epiphany/49.7/src/preferences/ephy-lang-row.h /usr/src/debug/epiphany/49.7/src/preferences/clear-data-view.c /usr/src/debug/epiphany/49.7/src/preferences/clear-data-view.h /usr/src/debug/epiphany/49.7/src/ephy-main.c /usr/src/debug/epiphany/49.7/src/synced-tabs-dialog.h /usr/src/debug/epiphany/49.7/src/ephy-action-bar-end.c /usr/src/debug/epiphany/49.7/src/synced-tabs-dialog.c /usr/src/debug/epiphany/49.7/src/ephy-action-bar-end.h /usr/src/debug/epiphany/49.7/src/context-menu-commands.h /usr/src/debug/epiphany/49.7/src/ephy-firefox-sync-dialog.c /usr/src/debug/epiphany/49.7/src/context-menu-commands.c /usr/src/debug/epiphany/49.7/src/ephy-firefox-sync-dialog.h /usr/src/debug/epiphany/49.7/src/ephy-suggestion-model.h /usr/src/debug/epiphany/49.7/src/ephy-window.c /usr/src/debug/epiphany/49.7/src/ephy-window.h /usr/src/debug/epiphany/49.7/src/ephy-suggestion-model.c /usr/src/debug/epiphany/49.7/src/preferences/ephy-prefs-dialog.h /usr/src/debug
 /epiphany/49.7/src/preferences/ephy-prefs-dialog.c /usr/src/debug/epiphany/49.7/src/ephy-shell.c /usr/src/debug/epiphany/49.7/src/preferences/ephy-search-engine-listbox.c /usr/src/debug/epiphany/49.7/src/preferences/ephy-search-engine-listbox.h /usr/src/debug/epiphany/49.7/src/ephy-shell.h /usr/src/debug/epiphany/49.7/src/preferences/prefs-features-page.h /usr/src/debug/epiphany/49.7/src/ephy-action-bar-start.c /usr/src/debug/epiphany/49.7/src/preferences/prefs-features-page.c /usr/src/debug/epiphany/49.7/src/ephy-action-bar-start.h /usr/src/debug/epiphany/49.7/src/ephy-encoding-dialog.h /usr/src/debug/epiphany/49.7/src/ephy-security-dialog.h /usr/src/debug/epiphany/49.7/src/ephy-encoding-dialog.c /usr/src/debug/epiphany/49.7/src/ephy-link.c /usr/src/debug/epiphany/49.7/src/ephy-security-dialog.c /usr/src/debug/epiphany/49.7/src/preferences/ephy-data-view.c /usr/src/debug/epiphany/49.7/src/ephy-link.h /usr/src/debug/epiphany/49.7/src/preferences/ephy-data-view.h /usr/src/debug/epiph
 any/49.7/src/ephy-certificate-dialog.h /usr/src/debug/epiphany/49.7/src/profile-migrator/ephy-profile-migrator.c /usr/src/debug/epiphany/49.7/src/ephy-certificate-dialog.c", added "/usr/src/debug/epiphany/50.3/src/preferences/ephy-lang-row.c /usr/src/debug/epiphany/50.3/src/ephy-window.h /usr/src/debug/epiphany/50.3/src/ephy-firefox-sync-dialog.h /usr/src/debug/epiphany/50.3/src/ephy-window.c /usr/src/debug/epiphany/50.3/src/preferences/ephy-lang-row.h /usr/src/debug/epiphany/50.3/src/preferences/prefs-privacy-page.h /usr/src/debug/epiphany/50.3/src/ephy-firefox-sync-dialog.c /usr/src/debug/epiphany/50.3/src/preferences/prefs-privacy-page.c /usr/src/debug/epiphany/50.3/src/preferences/ephy-search-engine-row.c /usr/src/debug/epiphany/50.3/src/preferences/ephy-search-engine-row.h /usr/src/debug/epiphany/50.3/src/preferences/autofill-view.c /usr/src/debug/epiphany/50.3/src/preferences/prefs-extensions-page.c /usr/src/debug/epiphany/50.3/src/preferences/autofill-view.h /usr/src/debug/ep
 iphany/50.3/src/preferences/prefs-extensions-page.h /usr/src/debug/epiphany/50.3/src/ephy-fullscreen-box.h /usr/src/debug/epiphany/50.3/src/ephy-passwords-view.c /usr/src/debug/epiphany/50.3/src/ephy-history-dialog.h /usr/src/debug/epiphany/50.3/src/ephy-history-dialog.c /usr/src/debug/epiphany/50.3/src/ephy-passwords-view.h /usr/src/debug/epiphany/50.3/src/ephy-fullscreen-box.c /usr/src/debug/epiphany/50.3/src/ephy-shell.c /usr/src/debug/epiphany/50.3/src/ephy-link.c /usr/src/debug/epiphany/50.3/src/ephy-link.h /usr/src/debug/epiphany/50.3/src/ephy-shell.h /usr/src/debug/epiphany/50.3/src/ephy-encoding-row.h /usr/src/debug/epiphany/50.3/src/ephy-encoding-row.c /usr/src/debug/epiphany/50.3/src/preferences/webapp-additional-urls-dialog.h /usr/src/debug/epiphany/50.3/src/ephy-action-bar.c /usr/src/debug/epiphany/50.3/src/preferences/webapp-additional-urls-dialog.c /usr/src/debug/epiphany/50.3/src/ephy-action-bar.h /usr/src/debug/epiphany/50.3/src/preferences/prefs-general-page.c /usr/
 src/debug/epiphany/50.3/src/preferences/prefs-general-page.h /usr/src/debug/epiphany/50.3/src/ephy-tab-view.h /usr/src/debug/epiphany/50.3/src/preferences/ephy-data-view.c /usr/src/debug/epiphany/50.3/src/window-commands.c /usr/src/debug/epiphany/50.3/src/ephy-suggestion-model.c /usr/src/debug/epiphany/50.3/src/ephy-tab-view.c /usr/src/debug/epiphany/50.3/src/ephy-main.c /usr/src/debug/epiphany/50.3/src/ephy-suggestion-model.h /usr/src/debug/epiphany/50.3/src/preferences/ephy-data-view.h /usr/src/debug/epiphany/50.3/src/window-commands.h /usr/src/debug/epiphany/50.3/src/ephy-action-bar-start.c /usr/src/debug/epiphany/50.3/src/ephy-title-widget.h /usr/src/debug/epiphany/50.3/src/ephy-action-bar-start.h /usr/src/debug/epiphany/50.3/src/ephy-title-widget.c /usr/src/debug/epiphany/50.3/src/ephy-shell-search-provider-generated.c /usr/src/debug/epiphany/50.3/src/ephy-shell-search-provider-generated.h /usr/src/debug/epiphany/50.3/src/ephy-certificate-dialog.h /usr/src/debug/epiphany/50.3/s
 rc/ephy-lockdown.c /usr/src/debug/epiphany/50.3/src/ephy-mouse-gesture-controller.h /usr/src/debug/epiphany/50.3/src/ephy-mouse-gesture-controller.c /usr/src/debug/epiphany/50.3/src/ephy-certificate-dialog.c /usr/src/debug/epiphany/50.3/src/ephy-lockdown.h /usr/src/debug/epiphany/50.3/src/ephy-downloads-paintable.h /usr/src/debug/epiphany/50.3/src/ephy-downloads-paintable.c /usr/src/debug/epiphany/50.3/src/ephy-page-menu-button.c /usr/src/debug/epiphany/50.3/src/ephy-page-menu-button.h /usr/src/debug/epiphany/50.3/src/ephy-action-bar-end.h /usr/src/debug/epiphany/50.3/src/ephy-downloads-popover.h /usr/src/debug/epiphany/50.3/src/ephy-location-entry.c /usr/src/debug/epiphany/50.3/src/ephy-webapp-provider-generated.h /usr/src/debug/epiphany/50.3/src/ephy-action-helper.c /usr/src/debug/epiphany/50.3/src/synced-tabs-dialog.c /usr/src/debug/epiphany/50.3/src/ephy-downloads-popover.c /usr/src/debug/epiphany/50.3/src/ephy-action-bar-end.c /usr/src/debug/epiphany/50.3/src/ephy-action-helper
 .h /usr/src/debug/epiphany/50.3/src/synced-tabs-dialog.h /usr/src/debug/epiphany/50.3/src/ephy-location-entry.h /usr/src/debug/epiphany/50.3/src/preferences/prefs-features-page.c /usr/src/debug/epiphany/50.3/src/ephy-webapp-provider-generated.c /usr/src/debug/epiphany/50.3/src/preferences/prefs-features-page.h /usr/src/debug/epiphany/50.3/src/preferences/extension-view.h /usr/src/debug/epiphany/50.3/src/ephy-session.h /usr/src/debug/epiphany/50.3/src/ephy-privacy-report.c /usr/src/debug/epiphany/50.3/src/ephy-location-controller.c /usr/src/debug/epiphany/50.3/src/preferences/clear-data-view.h /usr/src/debug/epiphany/50.3/src/preferences/extension-view.c /usr/src/debug/epiphany/50.3/src/ephy-location-controller.h /usr/src/debug/epiphany/50.3/src/ephy-privacy-report.h /usr/src/debug/epiphany/50.3/src/preferences/clear-data-view.c /usr/src/debug/epiphany/50.3/src/ephy-session.c /usr/src/debug/epiphany/50.3/src/ephy-encoding-dialog.h /usr/src/debug/epiphany/50.3/src/ephy-security-dialog
 .h /usr/src/debug/epiphany/50.3/src/ephy-encoding-dialog.c /usr/src/debug/epiphany/50.3/src/ephy-security-dialog.c /usr/src/debug/epiphany/50.3/src/preferences/ephy-prefs-dialog.h /usr/src/debug/epiphany/50.3/src/preferences/prefs-appearance-page.h /usr/src/debug/epiphany/50.3/src/preferences/ephy-prefs-dialog.c /usr/src/debug/epiphany/50.3/src/preferences/prefs-appearance-page.c /usr/src/debug/epiphany/50.3/src/ephy-site-menu-button.c /usr/src/debug/epiphany/50.3/src/ephy-site-menu-button.h /usr/src/debug/epiphany/50.3/src/ephy-title-box.h /usr/src/debug/epiphany/50.3/src/ephy-desktop-utils.c /usr/src/debug/epiphany/50.3/src/preferences/ephy-search-engine-listbox.h /usr/src/debug/epiphany/50.3/src/ephy-title-box.c /usr/src/debug/epiphany/50.3/src/profile-migrator/ephy-profile-migrator.c /usr/src/debug/epiphany/50.3/src/ephy-desktop-utils.h /usr/src/debug/epiphany/50.3/src/preferences/ephy-search-engine-listbox.c /usr/src/debug/epiphany/50.3/src/preferences/prefs-search-engine-page.
 h /usr/src/debug/epiphany/50.3/src/ephy-type-builtins.h /usr/src/debug/epiphany/50.3/src/ephy-header-bar.c /usr/src/debug/epiphany/50.3/src/preferences/prefs-search-engine-page.c /usr/src/debug/epiphany/50.3/src/ephy-header-bar.h /usr/src/debug/epiphany/50.3/src/ephy-type-builtins.c /usr/src/debug/epiphany/50.3/src/context-menu-commands.c /usr/src/debug/epiphany/50.3/src/ephy-download-widget.c /usr/src/debug/epiphany/50.3/src/context-menu-commands.h /usr/src/debug/epiphany/50.3/src/ephy-download-widget.h /usr/src/debug/epiphany/50.3/src/epiphany-resources.c"
packages/x86-64-v3-poky-linux/epiphany/epiphany-src: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-src: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-staticdev: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-staticdev: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany: PKGSIZE changed from 2131242 to 6648655 (+212%)
packages/x86-64-v3-poky-linux/epiphany/epiphany: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany: PACKAGES: added "epiphany-locale-my"
packages/x86-64-v3-poky-linux/epiphany: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany: SRC_URI changed from "https://download.gnome.org/sources//epiphany/49/epiphany-49.7.tar.xz;name=archive file://0002-help-meson.build-disable-the-use-of-yelp.patch file://migrator.patch file://distributor.patch" to "https://download.gnome.org/sources//epiphany/50/epiphany-50.3.tar.xz;name=archive file://0002-help-meson.build-disable-the-use-of-yelp.patch file://migrator.patch file://distributor.patch"
packages/x86-64-v3-poky-linux/epiphany: PV changed from "49.7" to "50.3"

--===============0324185264989080809==--

