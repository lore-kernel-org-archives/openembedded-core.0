Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03B2ECD3438
	for <webhook@archiver.kernel.org>; Fri,  1 May 2026 14:25:54 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15708.1777645532001932005
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 May 2026 07:25:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=KR2hZSO6;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=CvOCZ0ra;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019de3ee76b5-cf0e03d2-c1f9-41fe-ba19-b64c6ac95321-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1777645549;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=eSQOjBA22VdBYFNgP8liWYaiPFvJocPvcAaqbyuO8QY=;
	b=KR2hZSO664br/XISl6yC82FuXSbSMdtZ16TubBe6jN8/TbEZD3BuOnKDoUBMq4QK
	z31zqvDnQSymxkQoZZxrootiBuWU95VWuvAbI24ueRRTxgGf1sNePRqzDlVxwPbC9vZ
	QwLg1Wk9lOgDmR7rUfxJQsSeBFUqZkclXnkZaVfc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1777645549;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=eSQOjBA22VdBYFNgP8liWYaiPFvJocPvcAaqbyuO8QY=;
	b=CvOCZ0raruWbq1vDjmnMvFCBWfPxJUY2hT0h6uXsuDAtcLiqWTCpPdw50FG+w7RR
	+7zM9zwwBybDSDQ2sbJBixXlWJ1vX7FB0bpOnnfrkdP1MhHVc0jQtvxno0HTxv/qlFV
	Bb2x/nnKMp6ERbGp8UEsBPMWGxrDqLI0OYX2O9eE=
Content-Type: multipart/mixed; boundary="===============4022641372915889629=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] epiphany: upgrading to 50.4 SUCCEEDED
Message-ID: <0101019de3ee76b5-cf0e03d2-c1f9-41fe-ba19-b64c6ac95321-000000@us-west-2.amazonses.com>
Date: Fri, 1 May 2026 14:25:49 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 May 2026 14:25:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236269

--===============4022641372915889629==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *epiphany* to *50.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-epiphany-upgrade-50.3-50.4.patch
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
From a8a73e4f4d281e99fa4584f7dabbc006cd6fa667 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 May 2026 11:28:12 +0000
Subject: [PATCH] epiphany: upgrade 50.3 -> 50.4

---
 .../epiphany/{epiphany_50.3.bb => epiphany_50.4.bb}           | 2 +-
 .../files/0002-help-meson.build-disable-the-use-of-yelp.patch | 2 +-
 meta/recipes-gnome/epiphany/files/distributor.patch           | 4 ++--
 meta/recipes-gnome/epiphany/files/migrator.patch              | 4 ++--
 4 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-gnome/epiphany/{epiphany_50.3.bb => epiphany_50.4.bb} (94%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_50.3.bb b/meta/recipes-gnome/epiphany/epiphany_50.4.bb
similarity index 94%
rename from meta/recipes-gnome/epiphany/epiphany_50.3.bb
rename to meta/recipes-gnome/epiphany/epiphany_50.4.bb
index d5cacc848a..8fa187828b 100644
--- a/meta/recipes-gnome/epiphany/epiphany_50.3.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_50.4.bb
@@ -32,7 +32,7 @@ SRC_URI += "\
            file://migrator.patch \
            file://distributor.patch \
            "
-SRC_URI[archive.sha256sum] = "032d6a41e2a079cd41b05ca7abfb3870adf0353d1566194bed8790953a894640"
+SRC_URI[archive.sha256sum] = "1e26f9901f0f08bfe943aa70163c953334c7ec3d4aefc8d354e8a9c140b334a7"
 
 export GI_TYPELIB_PATH = "${STAGING_LIBDIR}/girepository-1.0/"
 
diff --git a/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch b/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
index 6c00ab9b40..3506113945 100644
--- a/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
+++ b/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
@@ -1,4 +1,4 @@
-From 91045ece41faefbeac14b60d7b19b0c652e586fb Mon Sep 17 00:00:00 2001
+From 00469cfc5818c776aa02546e9e5643a5cf903e8b Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 31 Jan 2018 15:50:38 +0200
 Subject: [PATCH] help/meson.build: disable the use of yelp
diff --git a/meta/recipes-gnome/epiphany/files/distributor.patch b/meta/recipes-gnome/epiphany/files/distributor.patch
index 54a3305aaf..4d3e13bb31 100644
--- a/meta/recipes-gnome/epiphany/files/distributor.patch
+++ b/meta/recipes-gnome/epiphany/files/distributor.patch
@@ -1,4 +1,4 @@
-From 46084da03b5f20423a2946d988c68e9ea9339c9c Mon Sep 17 00:00:00 2001
+From d3a99151068c9abc231cf562b2875bec83ddd1eb Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Fri, 26 Feb 2021 10:17:52 +0000
 Subject: [PATCH] Don't encode the distro from /etc/os-release into the
@@ -11,7 +11,7 @@ RP 2021/2/26
  1 file changed, 1 insertion(+)
 
 diff --git a/meson.build b/meson.build
-index df0340c..8ec6c79 100644
+index c7dedcb..9518ced 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -15,6 +15,7 @@ if r.returncode() == 0
diff --git a/meta/recipes-gnome/epiphany/files/migrator.patch b/meta/recipes-gnome/epiphany/files/migrator.patch
index 8ebcdc9991..0aeefc6f2b 100644
--- a/meta/recipes-gnome/epiphany/files/migrator.patch
+++ b/meta/recipes-gnome/epiphany/files/migrator.patch
@@ -1,4 +1,4 @@
-From ca504370b9aa893ceac21141d8f24e28a474b674 Mon Sep 17 00:00:00 2001
+From 435d89fd265c334fc4b64a315d6d2732853c4463 Mon Sep 17 00:00:00 2001
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


--===============4022641372915889629==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-epiphany-upgrade-50.3-50.4.patch"

RnJvbSBhOGE3M2U0ZjRkMjgxZTk5ZmE0NTg0ZjdkYWJiYzAwNmNkNmZhNjY3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBNYXkgMjAyNiAxMToyODoxMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGVw
aXBoYW55OiB1cGdyYWRlIDUwLjMgLT4gNTAuNAoKLS0tCiAuLi4vZXBpcGhhbnkve2VwaXBoYW55
XzUwLjMuYmIgPT4gZXBpcGhhbnlfNTAuNC5iYn0gICAgICAgICAgIHwgMiArLQogLi4uL2ZpbGVz
LzAwMDItaGVscC1tZXNvbi5idWlsZC1kaXNhYmxlLXRoZS11c2Utb2YteWVscC5wYXRjaCB8IDIg
Ky0KIG1ldGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFueS9maWxlcy9kaXN0cmlidXRvci5wYXRjaCAg
ICAgICAgICAgfCA0ICsrLS0KIG1ldGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFueS9maWxlcy9taWdy
YXRvci5wYXRjaCAgICAgICAgICAgICAgfCA0ICsrLS0KIDQgZmlsZXMgY2hhbmdlZCwgNiBpbnNl
cnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1nbm9tZS9lcGlw
aGFueS97ZXBpcGhhbnlfNTAuMy5iYiA9PiBlcGlwaGFueV81MC40LmJifSAoOTQlKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFueS9lcGlwaGFueV81MC4zLmJiIGIvbWV0
YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2VwaXBoYW55XzUwLjQuYmIKc2ltaWxhcml0eSBpbmRl
eCA5NCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2VwaXBoYW55XzUw
LjMuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFueS9lcGlwaGFueV81MC40
LmJiCmluZGV4IGQ1Y2FjYzg0OGEuLjhmYTE4NzgyOGIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1nbm9tZS9lcGlwaGFueS9lcGlwaGFueV81MC4zLmJiCisrKyBiL21ldGEvcmVjaXBlcy1nbm9t
ZS9lcGlwaGFueS9lcGlwaGFueV81MC40LmJiCkBAIC0zMiw3ICszMiw3IEBAIFNSQ19VUkkgKz0g
IlwKICAgICAgICAgICAgZmlsZTovL21pZ3JhdG9yLnBhdGNoIFwKICAgICAgICAgICAgZmlsZTov
L2Rpc3RyaWJ1dG9yLnBhdGNoIFwKICAgICAgICAgICAgIgotU1JDX1VSSVthcmNoaXZlLnNoYTI1
NnN1bV0gPSAiMDMyZDZhNDFlMmEwNzljZDQxYjA1Y2E3YWJmYjM4NzBhZGYwMzUzZDE1NjYxOTRi
ZWQ4NzkwOTUzYTg5NDY0MCIKK1NSQ19VUklbYXJjaGl2ZS5zaGEyNTZzdW1dID0gIjFlMjZmOTkw
MWYwZjA4YmZlOTQzYWE3MDE2M2M5NTMzMzRjN2VjM2Q0YWVmYzhkMzU0ZThhOWMxNDBiMzM0YTci
CiAKIGV4cG9ydCBHSV9UWVBFTElCX1BBVEggPSAiJHtTVEFHSU5HX0xJQkRJUn0vZ2lyZXBvc2l0
b3J5LTEuMC8iCiAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFueS9maWxl
cy8wMDAyLWhlbHAtbWVzb24uYnVpbGQtZGlzYWJsZS10aGUtdXNlLW9mLXllbHAucGF0Y2ggYi9t
ZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZmlsZXMvMDAwMi1oZWxwLW1lc29uLmJ1aWxkLWRp
c2FibGUtdGhlLXVzZS1vZi15ZWxwLnBhdGNoCmluZGV4IDZjMDBhYjliNDAuLjM1MDYxMTM5NDUg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFueS9maWxlcy8wMDAyLWhlbHAt
bWVzb24uYnVpbGQtZGlzYWJsZS10aGUtdXNlLW9mLXllbHAucGF0Y2gKKysrIGIvbWV0YS9yZWNp
cGVzLWdub21lL2VwaXBoYW55L2ZpbGVzLzAwMDItaGVscC1tZXNvbi5idWlsZC1kaXNhYmxlLXRo
ZS11c2Utb2YteWVscC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gOTEwNDVlY2U0MWZhZWZi
ZWFjMTRiNjBkN2IxOWIwYzY1MmU1ODZmYiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20g
MDA0NjljZmM1ODE4Yzc3NmFhMDI1NDZlOWU1NjQzYTVjZjkwM2U4YiBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29t
PgogRGF0ZTogV2VkLCAzMSBKYW4gMjAxOCAxNTo1MDozOCArMDIwMAogU3ViamVjdDogW1BBVENI
XSBoZWxwL21lc29uLmJ1aWxkOiBkaXNhYmxlIHRoZSB1c2Ugb2YgeWVscApkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2ZpbGVzL2Rpc3RyaWJ1dG9yLnBhdGNoIGIvbWV0
YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2ZpbGVzL2Rpc3RyaWJ1dG9yLnBhdGNoCmluZGV4IDU0
YTMzMDVhYWYuLjRkM2UxM2JiMzEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1nbm9tZS9lcGlw
aGFueS9maWxlcy9kaXN0cmlidXRvci5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZ25vbWUvZXBp
cGhhbnkvZmlsZXMvZGlzdHJpYnV0b3IucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDQ2MDg0
ZGEwM2I1ZjIwNDIzYTI5NDZkOTg4YzY4ZTllYTkzMzljOWMgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCitGcm9tIGQzYTk5MTUxMDY4YzlhYmMyMzFjZjU2MmIyODc1YmVjODNkZGQxZWIgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVA
bGludXhmb3VuZGF0aW9uLm9yZz4KIERhdGU6IEZyaSwgMjYgRmViIDIwMjEgMTA6MTc6NTIgKzAw
MDAKIFN1YmplY3Q6IFtQQVRDSF0gRG9uJ3QgZW5jb2RlIHRoZSBkaXN0cm8gZnJvbSAvZXRjL29z
LXJlbGVhc2UgaW50byB0aGUKQEAgLTExLDcgKzExLDcgQEAgUlAgMjAyMS8yLzI2CiAgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCiAKIGRpZmYgLS1naXQgYS9tZXNvbi5idWlsZCBiL21l
c29uLmJ1aWxkCi1pbmRleCBkZjAzNDBjLi44ZWM2Yzc5IDEwMDY0NAoraW5kZXggYzdkZWRjYi4u
OTUxOGNlZCAxMDA2NDQKIC0tLSBhL21lc29uLmJ1aWxkCiArKysgYi9tZXNvbi5idWlsZAogQEAg
LTE1LDYgKzE1LDcgQEAgaWYgci5yZXR1cm5jb2RlKCkgPT0gMApkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWdub21lL2VwaXBoYW55L2ZpbGVzL21pZ3JhdG9yLnBhdGNoIGIvbWV0YS9yZWNpcGVz
LWdub21lL2VwaXBoYW55L2ZpbGVzL21pZ3JhdG9yLnBhdGNoCmluZGV4IDhlYmNkYzk5OTEuLjBh
ZWVmYzZmMmIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFueS9maWxlcy9t
aWdyYXRvci5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZmlsZXMvbWln
cmF0b3IucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGNhNTA0MzcwYjlhYTg5M2NlYWMyMTE0
MWQ4ZjI0ZTI4YTQ3NGI2NzQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDQzNWQ4OWZk
MjY1YzMzNGZjNGI2NGEzMTVkNmQyNzMyODUzYzQ0NjMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
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

--===============4022641372915889629==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1976 targets, 62 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-6f7591c767d702d9c04866c73ea2b9e768564f3f"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
meta                 = "tmp-auh-upgrades:6f7591c767d702d9c04866c73ea2b9e768564f3f"
meta-yocto-bsp       
meta-poky            = "master:a67ae0e83d8aba0c46cb8383808b2d1203fbb414"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1424 Local 1003 Mirrors 0 Missed 421 Current 617 (70% match, 79% complete)
done.
Removing 5 stale sstate objects for arch x86_64...done.
Removing 4 stale sstate objects for arch allarch...done.
NOTE: Executing Tasks
NOTE: Running setscene task 659 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 691 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/epiphany/epiphany_50.4.bb:do_populate_lic_setscene)
NOTE: Running setscene task 732 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 763 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gnome/adwaita-icon-theme_50.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 785 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libxslt/libxslt_1.1.45.bb:do_create_spdx_setscene)
NOTE: Running setscene task 786 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 789 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 790 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 805 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 806 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 811 of 2041 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/groff/groff_1.24.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 857 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 862 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 873 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 890 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.19.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 906 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gcr/gcr_4.4.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe adwaita-icon-theme-50.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxslt-1.1.45-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-packaging-26.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe epiphany-50.4-r0: task do_populate_lic_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libarchive-3.8.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgcrypt-1.12.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe curl-8.19.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcr-4.4.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe groff-native-1.24.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe adwaita-icon-theme-50.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 936 of 2041 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.4.bb:do_create_spdx_setscene)
NOTE: recipe epiphany-50.4-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 939 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.38.1.bb:do_recipe_qa_setscene)
NOTE: recipe nettle-3.10.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxt-1_1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 943 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 944 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gnome/adwaita-icon-theme_50.0.bb:do_packagedata_setscene)
NOTE: recipe libarchive-3.8.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gcr-4.4.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 959 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/webkitgtk_2.50.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 963 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.7.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 965 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxslt-1.1.45-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe groff-native-1.24.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libgcrypt-1.12.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-packaging-26.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 969 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 973 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 975 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.18.bb:do_create_spdx_setscene)
NOTE: Running setscene task 976 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/enchant/enchant2_2.8.15.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.19.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 977 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 980 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libportal/libportal_0.9.1.bb:do_recipe_qa_setscene)
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 981 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.4.bb:do_create_spdx_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe adwaita-icon-theme-50.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-native-4.19.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe hicolor-icon-theme-0.18-r0: task do_create_spdx_setscene: Started
NOTE: recipe webkitgtk-2.50.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libarchive-3.8.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe enchant2-2.8.15-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libportal-0.9.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.19.4-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 983 of 2041 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_create_spdx_setscene)
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 987 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.94.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 989 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libxslt/libxslt_1.1.45.bb:do_populate_sysroot_setscene)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe webkitgtk-2.50.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe hicolor-icon-theme-0.18-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shadow-native-4.19.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 993 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 995 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 997 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_create_spdx_setscene)
NOTE: recipe libdazzle-3.44.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe enchant2-2.8.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 999 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.1.bb:do_packagedata_setscene)
NOTE: recipe libarchive-3.8.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1001 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1004 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libportal-0.9.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1006 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_packagedata_setscene)
NOTE: recipe adwaita-icon-theme-50.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1008 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.7.bb:do_packagedata_setscene)
NOTE: recipe coreutils-9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1009 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1011 of 2041 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/cargo-c/cargo-c_0.10.21+cargo-0.95.0.bb:do_create_spdx_setscene)
NOTE: recipe shadow-4.19.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1015 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_create_spdx_setscene)
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1017 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libxt-1_1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxslt-1.1.45-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1019 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_recipe_qa_setscene)
NOTE: recipe libstd-rs-1.94.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libical-native-3.0.20-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgcrypt-1.12.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.12.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libarchive-3.8.7-r0: task do_packagedata_setscene: Started
NOTE: recipe json-glib-1.10.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe libical-native-3.0.20-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libarchive-3.8.7-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1021 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libxslt/libxslt_1.1.45.bb:do_packagedata_setscene)
NOTE: recipe libstd-rs-1.94.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1028 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libhandy-1.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe readline-8.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1029 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxt-1_1.3.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1031 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libgcrypt-1.12.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1032 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libsecret/libsecret_0.21.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1036 of 2041 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/groff/groff_1.24.1.bb:do_populate_sysroot_setscene)
NOTE: recipe json-glib-1.10.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcrypt-1.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1048 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1054 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1055 of 2041 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/groff/groff_1.24.1.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1072 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_create_spdx_setscene)
NOTE: recipe libhandy-1.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libarchive-3.8.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxt-1_1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1073 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_create_spdx_setscene)
NOTE: recipe libxslt-1.1.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1078 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libxslt/libxslt_1.1.45.bb:do_create_recipe_spdx_setscene)
NOTE: recipe cargo-c-native-0.10.21+cargo-0.95.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1087 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/iso-codes/iso-codes_4.20.1.bb:do_create_spdx_setscene)
NOTE: recipe libxslt-1.1.45-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1089 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_create_spdx_setscene)
NOTE: recipe nettle-3.10.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.12.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libarchive-3.8.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsecret-0.21.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1092 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_populate_sysroot_setscene)
NOTE: recipe desktop-file-utils-0.28-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe groff-native-1.24.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe cargo-c-native-0.10.21+cargo-0.95.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1102 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_create_spdx_setscene)
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe iso-codes-4.20.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxslt-1.1.45-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe groff-native-1.24.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libsecret-0.21.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1115 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.48.bb:do_create_spdx_setscene)
NOTE: recipe nettle-3.10.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1123 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libsoup/libsoup_3.6.6.bb:do_recipe_qa_setscene)
NOTE: recipe desktop-file-utils-0.28-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1126 of 2041 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_create_spdx_setscene)
NOTE: recipe libtasn1-4.21.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxslt-1.1.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1127 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_create_spdx_setscene)
NOTE: recipe libtasn1-4.21.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1136 of 2041 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/shaderc/shaderc_2026.1.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1138 of 2041 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_create_recipe_spdx_setscene)
NOTE: recipe nettle-3.10.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe groff-native-1.24.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1139 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libgcrypt-1.12.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe iso-codes-4.20.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1140 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.341.0.bb:do_create_spdx_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1142 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_50.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1153 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.19.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1156 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/libwpe_1.16.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1159 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libnotify/libnotify_0.8.8.bb:do_recipe_qa_setscene)
NOTE: recipe libxslt-1.1.45-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1161 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-protocols-1.48-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsoup-3.6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1162 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_spdx_setscene)
NOTE: recipe shared-mime-info-native-2.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe readline-8.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gsettings-desktop-schemas-50.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shaderc-native-2026.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libwpe-1.16.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-protocols-1.48-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe orc-native-0.4.42-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe curl-8.19.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1164 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1167 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_create_spdx_setscene)
NOTE: recipe libnotify-0.8.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsoup-3.6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1168 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.7.bb:do_recipe_qa_setscene)
NOTE: recipe groff-native-1.24.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1172 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_create_recipe_spdx_setscene)
NOTE: recipe xrandr-1_1.5.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1176 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe shared-mime-info-native-2.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1179 of 2041 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-mako_1.3.10.bb:do_create_spdx_setscene)
NOTE: recipe readline-8.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libwpe-1.16.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shaderc-native-2026.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe gsettings-desktop-schemas-50.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1182 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/wpebackend-fdo_1.16.1.bb:do_recipe_qa_setscene)
NOTE: recipe orc-native-0.4.42-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1188 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.26.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxt-1_1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1190 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/aspell/aspell_0.60.8.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1194 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1197 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.22.2.bb:do_recipe_qa_setscene)
NOTE: recipe libnotify-0.8.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe curl-8.19.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1200 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libadwaita/libadwaita_1.9.0.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1205 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1206 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1207 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_create_spdx_setscene)
NOTE: recipe nettle-3.10.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libarchive-3.8.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1213 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe wpebackend-fdo-1.16.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe aspell-0.60.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1216 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-mako-native-1.3.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe p11-kit-0.26.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libadwaita-1.9.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gtk4-4.22.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdrm-2.4.131-r0: task do_create_spdx_setscene: Started
NOTE: recipe libarchive-3.8.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe curl-8.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1221 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1223 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.4.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1227 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.59.bb:do_populate_sysroot_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1232 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe wpebackend-fdo-1.16.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe aspell-0.60.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1233 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1237 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.21.5.bb:do_recipe_qa_setscene)
NOTE: recipe python3-mako-native-1.3.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe p11-kit-0.26.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1240 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.19.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libadwaita-1.9.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gtk4-4.22.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1251 of 2041 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/xmlto/xmlto_0.0.29.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1252 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/iso-codes/iso-codes_4.20.1.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1254 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libtasn1-4.21.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libdrm-2.4.131-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1255 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1256 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_create_spdx_setscene)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-4.19.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libgpg-error-1.59-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1258 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.18.bb:do_packagedata_setscene)
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1264 of 2041 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/cargo-c/cargo-c_0.10.21+cargo-0.95.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1265 of 2041 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libpsl-0.21.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe iso-codes-4.20.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe curl-8.19.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe xmlto-native-0.0.29-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1268 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_recipe_spdx_setscene)
NOTE: recipe wayland-1.24.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-4.19.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1274 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.94.1.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1275 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nghttp2/nghttp2_1.68.1.bb:do_recipe_qa_setscene)
NOTE: recipe hicolor-icon-theme-0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe libpsl-0.21.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe iso-codes-4.20.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1278 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1287 of 2041 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1295 of 2041 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.22.4.bb:do_create_recipe_spdx_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe xmlto-native-0.0.29-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1298 of 2041 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-mako_1.3.10.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libgpg-error-1.59-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1299 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1307 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb:do_recipe_qa_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 1308 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.59.bb:do_packagedata_setscene)
NOTE: recipe libical-native-3.0.20-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1314 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1317 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe nghttp2-1.68.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libstd-rs-1.94.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe curl-8.19.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1320 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_recipe_qa_setscene)
NOTE: recipe hicolor-icon-theme-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1321 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libxext-1_1.3.7-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1322 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_create_spdx_setscene)
NOTE: recipe libical-native-3.0.20-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe tiff-4.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1324 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-docutils-native-0.22.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe cargo-c-native-0.10.21+cargo-0.95.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libgpg-error-1.59-r0: task do_packagedata_setscene: Started
NOTE: recipe nghttp2-1.68.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-mako-native-1.3.10-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 1325 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.48.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gdk-pixbuf-native-2.44.5-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libstd-rs-1.94.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1333 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.1.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.78-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1336 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_create_recipe_spdx_setscene)
NOTE: recipe tiff-4.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1341 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-docutils-native-0.22.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libxext-1_1.3.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe cargo-c-native-0.10.21+cargo-0.95.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1346 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1347 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1348 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libcap-2.78-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-mako-native-1.3.10-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe fontconfig-2.17.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1350 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/iso-codes/iso-codes_4.20.1.bb:do_packagedata_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1353 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libxslt/libxslt_1.1.45.bb:do_recipe_qa_setscene)
NOTE: recipe gdk-pixbuf-native-2.44.5-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe wayland-protocols-1.48-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1363 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1369 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1371 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb:do_recipe_qa_setscene)
NOTE: recipe libgcrypt-1.12.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdrm-2.4.131-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libcap-2.78-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1374 of 2041 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_create_spdx_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-protocols-1.48-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe fontconfig-2.17.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe iso-codes-4.20.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1375 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1376 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_create_recipe_spdx_setscene)
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxslt-1.1.45-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.59-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libgcrypt-1.12.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1379 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: recipe readline-8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1382 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.78-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1384 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.341.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe gtk+3-3.24.52-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdrm-2.4.131-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1397 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.0.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.28.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1398 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_packagedata_setscene)
NOTE: recipe libxslt-1.1.45-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1399 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.1.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1401 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.94.1.bb:do_packagedata_setscene)
NOTE: recipe cairo-1.18.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 1403 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1405 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1411 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_populate_sysroot_setscene)
NOTE: recipe icu-native-78.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk+3-3.24.52-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.28.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 1415 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.86.bb:do_recipe_qa_setscene)
NOTE: recipe readline-8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1420 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe at-spi2-core-2.60.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe readline-8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1422 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe appstream-1.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1423 of 2041 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/groff/groff_1.24.1.bb:do_recipe_qa_setscene)
NOTE: recipe icu-native-78.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libstd-rs-1.94.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1427 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.28.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1430 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.2.bb:do_create_spdx_setscene)
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1431 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_create_spdx_setscene)
NOTE: recipe bluez5-5.86-r0: task do_recipe_qa_setscene: Started
NOTE: recipe at-spi2-core-2.60.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1432 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1435 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.4.bb:do_recipe_qa_setscene)
NOTE: recipe appstream-1.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 1437 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe readline-8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1446 of 2041 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_populate_sysroot_setscene)
NOTE: recipe libstd-rs-1.94.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1447 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe groff-native-1.24.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bluez5-5.86-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.15.2-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1448 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1449 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1452 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.94.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libfyaml-0.9.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1453 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.25.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libcap-2.78-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1455 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_populate_sysroot_setscene)
NOTE: recipe librsvg-2.61.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe groff-native-1.24.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1459 of 2041 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fontconfig-2.17.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 1469 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.15.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1470 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 1471 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_packagedata_setscene)
NOTE: recipe libical-native-3.0.20-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libfyaml-0.9.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-2.78-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1476 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1478 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1479 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_create_spdx_setscene)
NOTE: recipe librsvg-2.61.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1481 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_create_spdx_setscene)
NOTE: recipe libstd-rs-1.94.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxmlb-0.3.25-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1482 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe shared-mime-info-native-2.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1483 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe libical-3.0.20-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata_setscene: Started
NOTE: recipe sbc-2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libusb1-1.0.29-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.14.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxmlb-0.3.25-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.13-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1484 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1486 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_populate_sysroot_setscene)
NOTE: recipe shared-mime-info-native-2.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libical-native-3.0.20-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1487 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1491 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1493 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_recipe_qa_setscene)
NOTE: recipe libwebp-1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libical-3.0.20-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sbc-2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1495 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_recipe_qa_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxinerama-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1499 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe libusb1-1.0.29-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1500 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1506 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe freetype-2.14.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1508 of 2041 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libx11-1_1.8.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1509 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1516 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.41.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libwebp-1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1521 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libxinerama-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1522 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtheora-1.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe iso-codes-4.20.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1529 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1530 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.4.bb:do_packagedata_setscene)
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtheora-1.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe icu-native-78.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 1537 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.19.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1538 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.56.bb:do_create_spdx_setscene)
NOTE: recipe util-linux-2.41.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1541 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1543 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe freetype-2.14.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 1544 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1545 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1550 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1551 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_populate_sysroot_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1552 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.59.bb:do_recipe_qa_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1553 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.4.bb:do_populate_sysroot_setscene)
NOTE: recipe icu-native-78.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1554 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_create_spdx_setscene)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libxv-1.0.13-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1558 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.19.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.56-r0: task do_create_spdx_setscene: Started
NOTE: recipe freetype-2.14.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe curl-8.19.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1559 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.1.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.15.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdrm-2.4.131-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libstd-rs-1.94.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1560 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.59-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.19.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxv-1.0.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1563 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_recipe_qa_setscene)
NOTE: recipe libxtst-1_1.2.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1564 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.19.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1565 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libpng-1.6.56-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1566 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libcxx_git.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1567 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.4.bb:do_create_spdx_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.15.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1570 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_create_spdx_setscene)
NOTE: recipe pango-1.57.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.59-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1572 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1573 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.341.0.bb:do_populate_sysroot_setscene)
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libunistring-1.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1574 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_packagedata_setscene)
NOTE: Running setscene task 1576 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_recipe_qa_setscene)
NOTE: recipe orc-0.4.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe readline-8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 1581 of 2041 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_recipe_qa_setscene)
NOTE: recipe pango-1.57.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcxx-22.1.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1582 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe shadow-4.19.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.17.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1583 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_packagedata_setscene)
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1585 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.14.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe orc-0.4.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libdrm-2.4.131-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1587 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_create_spdx_setscene)
NOTE: recipe readline-8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1588 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.19.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1589 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1590 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.47-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdrm-2.4.131-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1591 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1592 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_recipe_qa_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libcxx-22.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1594 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.41.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 1595 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_packagedata_setscene)
NOTE: recipe libical-native-3.0.20-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.14.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.47-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1596 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1600 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.7.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libical-native-3.0.20-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1602 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libcxx_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1605 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1606 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1607 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1608 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.56.bb:do_create_recipe_spdx_setscene)
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2025.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libdrm-2.4.131-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1609 of 2041 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/xmlto/xmlto_0.0.29.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1613 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.341.0.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1614 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1617 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.19.bb:do_recipe_qa_setscene)
NOTE: recipe libcxx-22.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1619 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1622 of 2041 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-mako_1.3.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1624 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2025.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1625 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1626 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1627 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.56-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1628 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xmlto-native-0.0.29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vala-0.56.19-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-mako-native-1.3.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.56-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flac-1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1630 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1631 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_create_spdx_setscene)
NOTE: recipe vala-0.56.19-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe kmod-34.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1632 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1635 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1636 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.7.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1639 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1641 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_recipe_qa_setscene)
NOTE: recipe xmlto-native-0.0.29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1643 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1646 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1648 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_create_spdx_setscene)
NOTE: recipe flac-1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1649 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1650 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_create_spdx_setscene)
NOTE: recipe xrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-mako-native-1.3.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1653 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_spdx_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1654 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_packagedata_setscene)
NOTE: recipe kmod-34.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.53.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1655 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_packagedata_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcxx-22.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1657 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe openssl-3.5.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1660 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1662 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1663 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.4.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Succeeded
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/xrandr/1.5.3/temp/log.do_packagedata_setscene.2803547
NOTE: Running setscene task 1667 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_recipe_qa_setscene)
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 1668 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/compiler-rt_git.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.53.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1669 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1670 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_packagedata_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1671 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.0.bb:do_create_spdx_setscene)
NOTE: recipe kmod-34.2-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1675 of 2041 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.2.bb:do_create_spdx_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1677 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1679 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1686 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_packagedata_setscene)
NOTE: recipe libxft-1_2.3.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1687 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe compiler-rt-22.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.8.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.14.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1689 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.94.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-native-2.15.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpciaccess-0.19-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1690 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_recipe_qa_setscene)
NOTE: recipe kmod-34.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1693 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1696 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libcxx_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1700 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1701 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_package_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe expat-2.8.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe compiler-rt-22.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.14.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libxml2-native-2.15.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libstd-rs-1.94.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libogg-1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcxx-22.1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe harfbuzz-12.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libstd-rs-1.94.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libogg-1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcxx-22.1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe harfbuzz-12.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1702 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1705 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1706 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/compiler-rt_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1707 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1709 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1710 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1712 of 2041 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1715 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1717 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1719 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1720 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1721 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1723 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1724 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1726 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.4.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.17.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe compiler-rt-22.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libdrm-2.4.131-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.19.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-markupsafe-native-3.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_package_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1727 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_create_recipe_spdx_setscene)
NOTE: recipe bash-completion-2.17.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1728 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libx11-1_1.8.13-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1730 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.131-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1731 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1733 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1734 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1735 of 2041 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-mako_1.3.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1736 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_create_recipe_spdx_setscene)
NOTE: recipe xz-5.8.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe shadow-4.19.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1737 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1743 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_populate_sysroot_setscene)
NOTE: recipe compiler-rt-22.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1744 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_recipe_qa_setscene)
NOTE: recipe python3-markupsafe-native-3.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1746 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.341.0.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.24.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1747 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe openssl-3.5.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libpciaccess-0.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1749 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx_setscene)
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1753 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-mako-native-1.3.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libunistring-1.4.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe openssl-3.5.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1755 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1756 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1757 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1758 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1759 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-mako-native-1.3.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1761 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1762 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1763 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1764 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1766 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1767 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_packagedata_setscene)
NOTE: recipe libunistring-1.4.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1769 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe sqlite3-3_3.53.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1772 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1773 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/compiler-rt_git.bb:do_recipe_qa_setscene)
NOTE: recipe icu-78.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.8.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 1775 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe pixman-1_0.46.4-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1776 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.53.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1779 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.2.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe icu-78.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1780 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1781 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1782 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1786 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe fontconfig-2.17.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe compiler-rt-22.1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1787 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_packagedata_setscene)
NOTE: recipe expat-2.8.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1789 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1790 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1791 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe compiler-rt-22.1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fontconfig-2.17.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.15.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1792 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_recipe_qa_setscene)
NOTE: recipe libpciaccess-0.19-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1796 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1797 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2025.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.19-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe xorgproto-2025.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe freetype-2.14.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1799 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1800 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 1802 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1805 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1806 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 1807 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1808 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1810 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1812 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1813 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_recipe_qa_setscene)
NOTE: recipe freetype-2.14.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1815 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.56.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.14.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.15.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.56-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1816 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fontconfig-2.17.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1817 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_package_setscene)
NOTE: recipe libxml2-2.15.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1821 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_create_spdx_setscene)
NOTE: recipe libxext-1_1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1824 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_packagedata_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpng-1.6.56-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1826 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1829 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1830 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_recipe_qa_setscene)
NOTE: recipe freetype-2.14.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1831 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.56.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1833 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gcc-cross-arm-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_package_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-arm-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpng-1.6.56-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.14.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1836 of 2041 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/bison/bison_3.8.2.bb:do_create_spdx_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1842 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe freetype-2.14.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1844 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1845 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bison-native-3.8.2-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1847 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1848 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1849 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libpng-1.6.56-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1851 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.56.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe bison-native-3.8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.56-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpng-1.6.56-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 831 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_fetch)
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1859 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1861 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1862 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 1864 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1865 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1866 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1867 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1868 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1869 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1870 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: Running task 876 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_fetch)
NOTE: Running task 899 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_fetch)
NOTE: Running task 901 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_fetch)
NOTE: recipe icu-78.3-r0: task do_fetch: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 984 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_write_config)
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_fetch: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_fetch: Started
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_fetch: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 990 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_write_config)
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_write_config: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1032 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: Running setscene task 1874 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1875 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1043 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_fetch)
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1878 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1881 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1882 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1883 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1885 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_write_config: Succeeded
NOTE: Running setscene task 1886 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_write_config: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_fetch: Succeeded
NOTE: Running task 1048 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2025.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2025.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_write_config: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_fetch: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1082 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1094 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.19.bb:do_fetch)
NOTE: recipe shared-mime-info-2.4-r0: task do_unpack: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2025.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: Running task 1120 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb:do_fetch)
NOTE: Running task 1122 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_fetch)
NOTE: Running task 1125 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_fetch)
NOTE: Running task 1128 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.1.bb:do_fetch)
NOTE: Running task 1138 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_fetch)
NOTE: recipe vala-0.56.19-r0: task do_fetch: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1890 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2025.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1892 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_recipe_qa_setscene)
NOTE: Running task 1191 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxft-1_2.3.9-r0: task do_fetch: Started
NOTE: recipe harfbuzz-12.3.2-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_fetch: Started
NOTE: recipe pango-1.57.1-r0: task do_fetch: Started
NOTE: Running task 1192 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2025.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe librsvg-2.61.3-r0: task do_fetch: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe xorgproto-2025.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1222 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_write_config)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1250 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1271 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: Running task 1284 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb:do_write_config)
NOTE: recipe dbus-1.16.2-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe harfbuzz-12.3.2-r0: task do_write_config: Started
NOTE: recipe dbus-1.16.2-r0: task do_write_config: Succeeded
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_fetch: Succeeded
NOTE: Running task 1285 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_write_config)
NOTE: Running task 1286 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1287 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe harfbuzz-12.3.2-r0: task do_write_config: Succeeded
NOTE: Running task 1295 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.1.bb:do_write_config)
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_fetch: Succeeded
NOTE: Running task 1296 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_unpack)
NOTE: recipe fribidi-1.0.16-r0: task do_write_config: Started
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe pango-1.57.1-r0: task do_write_config: Started
NOTE: recipe vala-0.56.19-r0: task do_fetch: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_write_config: Succeeded
NOTE: Running task 1297 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.19.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_unpack: Started
NOTE: Running task 1303 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe pango-1.57.1-r0: task do_fetch: Succeeded
NOTE: Running task 1309 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.1.bb:do_unpack)
NOTE: Running task 1330 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_recipe_qa)
NOTE: recipe pango-1.57.1-r0: task do_write_config: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_unpack: Succeeded
NOTE: Running task 1343 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_patch)
NOTE: Running task 1344 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_fetch)
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_unpack: Succeeded
NOTE: Running task 1345 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_patch)
NOTE: recipe vala-0.56.19-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe pango-1.57.1-r0: task do_unpack: Started
NOTE: recipe libogg-1.3.6-r0: task do_fetch: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_patch: Started
NOTE: recipe mesa-2_26.0.5-r0: task do_recipe_qa: Started
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_patch: Started
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_unpack: Succeeded
NOTE: Running task 1346 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_patch)
NOTE: recipe fribidi-1.0.16-r0: task do_fetch: Succeeded
NOTE: Running task 1347 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_unpack)
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_patch: Succeeded
NOTE: Running task 1348 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_deploy_source_date_epoch)
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_patch: Started
NOTE: recipe pango-1.57.1-r0: task do_unpack: Succeeded
NOTE: Running task 1349 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_generate_toolchain_file)
NOTE: recipe fribidi-1.0.16-r0: task do_unpack: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_patch: Succeeded
NOTE: Running task 1350 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_generate_toolchain_file: Started
NOTE: recipe vala-0.56.19-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 1351 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.19.bb:do_patch)
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_patch: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1352 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1353 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.1.bb:do_patch)
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_unpack: Succeeded
NOTE: Running task 1406 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_patch)
NOTE: Running task 1427 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_fetch)
NOTE: recipe vala-0.56.19-r0: task do_patch: Started
NOTE: recipe pango-1.57.1-r0: task do_patch: Started
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vala-0.56.19-r0: task do_patch: Succeeded
NOTE: Running task 1428 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.19.bb:do_deploy_source_date_epoch)
NOTE: recipe pango-1.57.1-r0: task do_patch: Succeeded
NOTE: Running task 1429 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.1.bb:do_deploy_source_date_epoch)
NOTE: recipe fribidi-1.0.16-r0: task do_patch: Started
NOTE: recipe libical-3.0.20-r0: task do_fetch: Started
NOTE: recipe fribidi-1.0.16-r0: task do_patch: Succeeded
NOTE: Running task 1430 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_deploy_source_date_epoch)
NOTE: recipe vala-0.56.19-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pango-1.57.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe harfbuzz-12.3.2-r0: task do_fetch: Succeeded
NOTE: Running task 1431 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb:do_unpack)
NOTE: recipe shared-mime-info-2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_deploy_source_date_epoch unihash changed to 8fb01876969a4a9804fe4db0071118a83ef3fb8081f6bfb9c30c1a340bac5a4b
NOTE: recipe fribidi-1.0.16-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mesa-2_26.0.5-r0: task do_recipe_qa: Succeeded
NOTE: recipe harfbuzz-12.3.2-r0: task do_unpack: Started
NOTE: recipe vala-0.56.19-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_deploy_source_date_epoch unihash changed to 136350031d83ff80d2178fe7f5bb53f40f8ba9323098440c9eeaf382a9eb415c
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.19.bb:do_deploy_source_date_epoch unihash changed to 951b4e8f80179894ceb371733a848aae2caaa0db8a143fc3cc904514f3e21452
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_deploy_source_date_epoch unihash changed to e7e37f108102f340ba85dabccb1b8266e489be9945b3927c5a76ef01a1aae21e
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_deploy_source_date_epoch unihash changed to f067a1a02e716fb8a003707af091d84c90b8c7b284e864ee06a25fe708d74fe5
NOTE: recipe pango-1.57.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.1.bb:do_deploy_source_date_epoch unihash changed to febc172b5ad027f97aac7a8ed5fb8f922b6d1f20be6670d073df330d49c962ec
NOTE: recipe libical-3.0.20-r0: task do_fetch: Succeeded
NOTE: Running task 1432 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_fetch)
NOTE: Running task 1464 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_unpack)
NOTE: Running task 1468 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_fetch)
NOTE: Running task 1469 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.86.bb:do_fetch)
NOTE: Running task 1470 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_write_config)
NOTE: Running task 1473 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_fetch)
NOTE: Running task 1489 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb:do_write_config)
NOTE: Running task 1559 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_fetch)
NOTE: recipe libxi-1_1.8.2-r0: task do_fetch: Started
NOTE: recipe libusb1-1.0.29-r0: task do_fetch: Started
NOTE: recipe libical-3.0.20-r0: task do_unpack: Started
NOTE: recipe mesa-2_26.0.5-r0: task do_fetch: Started
NOTE: recipe dbus-1.16.2-r0: task do_fetch: Succeeded
NOTE: recipe bluez5-5.86-r0: task do_fetch: Started
NOTE: Running task 1560 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_unpack)
NOTE: recipe mesa-2_26.0.5-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_write_config: Started
NOTE: Running task 1561 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_unpack)
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_fetch: Started
NOTE: recipe librsvg-2.61.3-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_write_config: Succeeded
NOTE: Running task 1562 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_fetch)
NOTE: recipe libical-3.0.20-r0: task do_unpack: Succeeded
NOTE: Running task 1563 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_patch)
NOTE: recipe dbus-1.16.2-r0: task do_unpack: Started
NOTE: recipe librsvg-2.61.3-r0: task do_write_config: Succeeded
NOTE: Running task 1565 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_fetch)
NOTE: recipe mesa-2_26.0.5-r0: task do_unpack: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Started
NOTE: recipe libical-3.0.20-r0: task do_patch: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_fetch: Started
NOTE: recipe harfbuzz-12.3.2-r0: task do_unpack: Succeeded
NOTE: recipe bluez5-5.86-r0: task do_fetch: Succeeded
NOTE: Running task 1566 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb:do_patch)
NOTE: recipe xkeyboard-config-2.47-r0: task do_fetch: Succeeded
NOTE: Running task 1567 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.86.bb:do_unpack)
NOTE: Running task 1597 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_fetch)
NOTE: recipe dbus-1.16.2-r0: task do_unpack: Succeeded
NOTE: Running task 1598 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_patch)
NOTE: recipe harfbuzz-12.3.2-r0: task do_patch: Started
NOTE: recipe bluez5-5.86-r0: task do_unpack: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_fetch: Started
NOTE: recipe harfbuzz-12.3.2-r0: task do_patch: Succeeded
NOTE: Running task 1599 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb:do_deploy_source_date_epoch)
NOTE: recipe dbus-1.16.2-r0: task do_patch: Started
NOTE: recipe libical-3.0.20-r0: task do_patch: Succeeded
NOTE: Running task 1603 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_unpack)
NOTE: recipe dbus-1.16.2-r0: task do_patch: Succeeded
NOTE: Running task 1604 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_deploy_source_date_epoch)
NOTE: recipe harfbuzz-12.3.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_unpack: Started
NOTE: recipe bluez5-5.86-r0: task do_unpack: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1605 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.86.bb:do_patch)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_fetch: Succeeded
NOTE: Running task 1607 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_fetch)
NOTE: recipe libusb1-1.0.29-r0: task do_fetch: Succeeded
NOTE: Running task 1608 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_unpack)
NOTE: recipe xkeyboard-config-2.47-r0: task do_unpack: Succeeded
NOTE: Running task 1609 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_patch)
NOTE: recipe bluez5-5.86-r0: task do_patch: Started
NOTE: recipe harfbuzz-12.3.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe flac-1.5.0-r0: task do_fetch: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb:do_deploy_source_date_epoch unihash changed to a6396debd7fb3fbdf8532a8d3ecee0ca7de077650671e6aa00cecf8b2e8506b0
NOTE: recipe libusb1-1.0.29-r0: task do_unpack: Started
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_fetch: Succeeded
NOTE: recipe xkeyboard-config-2.47-r0: task do_patch: Started
NOTE: recipe dbus-1.16.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xkeyboard-config-2.47-r0: task do_patch: Succeeded
NOTE: recipe libusb1-1.0.29-r0: task do_unpack: Succeeded
NOTE: recipe bluez5-5.86-r0: task do_patch: Succeeded
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_package_setscene: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_deploy_source_date_epoch unihash changed to a3a73d783f799038180d92161f93cb048ddde2a4f7140e3a1f7c527a75f78b45
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1825 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1828 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_packagedata_setscene)
NOTE: Running setscene task 1886 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1893 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1897 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1898 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_packagedata_setscene)
NOTE: Running task 1611 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb:do_unpack)
NOTE: Running task 1612 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_patch)
NOTE: recipe libpcre2-10.47-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libusb1-1.0.29-r0: task do_patch: Started
NOTE: recipe util-linux-2.41.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_unpack: Started
NOTE: recipe icu-78.3-r0: task do_fetch: Succeeded
NOTE: Running task 1613 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1899 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_recipe_qa_setscene)
NOTE: recipe libusb1-1.0.29-r0: task do_patch: Succeeded
NOTE: recipe libpcre2-10.47-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1614 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_unpack)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1902 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.4.bb:do_packagedata_setscene)
NOTE: Running task 1619 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_write_config)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.41.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1904 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1907 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.4.bb:do_populate_sysroot_setscene)
NOTE: recipe icu-78.3-r0: task do_unpack: Started
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_unpack: Succeeded
NOTE: Running setscene task 1909 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_26.0.5-r0: task do_write_config: Started
NOTE: recipe python3-3.14.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.14.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1632 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb:do_patch)
NOTE: recipe mesa-2_26.0.5-r0: task do_write_config: Succeeded
NOTE: Running task 1635 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_deploy_source_date_epoch)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.47-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1642 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_generate_toolchain_file)
NOTE: recipe libogg-1.3.6-r0: task do_fetch: Succeeded
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_unpack: Succeeded
NOTE: Running task 1643 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_unpack)
NOTE: Running task 1644 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_patch)
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_patch: Started
NOTE: recipe libical-3.0.20-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libical-3.0.20-r0: task do_generate_toolchain_file: Started
NOTE: recipe libpcre2-10.47-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1911 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_recipe_qa_setscene)
NOTE: recipe libogg-1.3.6-r0: task do_unpack: Started
NOTE: recipe libical-3.0.20-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_patch: Started
NOTE: Running task 1647 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_deploy_source_date_epoch)
NOTE: recipe libpcre2-10.47-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.14.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1913 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_packagedata_setscene)
NOTE: recipe libusb1-1.0.29-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libogg-1.3.6-r0: task do_unpack: Succeeded
NOTE: Running setscene task 1914 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.0.bb:do_packagedata_setscene)
NOTE: recipe libical-3.0.20-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpcre2-10.47-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.14.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1915 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_packagedata_setscene)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_deploy_source_date_epoch unihash changed to c1eecc43650ea01d8c3a6a27fee78b4da6061c95264b05dee8c0e0b53747141b
NOTE: Running setscene task 1875 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_patch: Succeeded
NOTE: recipe util-linux-2.41.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_patch: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_fetch: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1876 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 1878 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1879 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1880 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1881 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: Running setscene task 1883 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: recipe libusb1-1.0.29-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_deploy_source_date_epoch unihash changed to bb69d8504028f62355bcd68943f46e9764665d6a564c392585eefd519ce3ba60
NOTE: Running setscene task 1878 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_packagedata_setscene)
NOTE: recipe expat-2.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_26.0.5-r0: task do_unpack: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1880 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 1882 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1883 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1884 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1886 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1887 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1890 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1891 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 1894 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1895 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1898 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.5.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1899 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1904 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1906 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.0.bb:do_populate_sysroot_setscene)
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1907 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1908 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.17.0-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/xz/5.8.2/temp/log.do_packagedata_setscene.2810085
NOTE: Running setscene task 1913 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_packagedata_setscene)
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe libcap-ng-0.9.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1917 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1920 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.4.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1921 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_package_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.9.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.53.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Succeeded
NOTE: recipe bash-completion-2.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1923 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1927 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1929 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1932 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.14.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_package_setscene: Started
NOTE: recipe expat-2.8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1934 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1935 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.9.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1938 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1947 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.53.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.14.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1950 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20251016-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.53.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1953 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.41.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1963 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1968 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1969 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.1.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.53.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1970 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1981 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1982 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.0.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe icu-78.3-r0: task do_unpack: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.9.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.53.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.8.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.9.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.53.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.8.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1818 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_patch)
NOTE: Running task 1852 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_unpack)
NOTE: Running task 1870 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_patch)
NOTE: Running task 1871 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_patch)
NOTE: Running task 1877 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb:do_deploy_source_date_epoch)
NOTE: recipe icu-78.3-r0: task do_patch: Started
NOTE: Running task 1953 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_unpack)
NOTE: recipe libxft-1_2.3.9-r0: task do_unpack: Started
NOTE: recipe libogg-1.3.6-r0: task do_patch: Started
NOTE: Running task 1979 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_unpack)
NOTE: Running task 1981 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.86.bb:do_deploy_source_date_epoch)
NOTE: Running task 1987 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_fetch)
NOTE: Running task 1989 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_fetch)
NOTE: Running task 1994 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_fetch)
NOTE: Running task 1995 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_unpack)
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mesa-2_26.0.5-r0: task do_patch: Started
NOTE: Running task 2015 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_fetch)
NOTE: recipe libogg-1.3.6-r0: task do_patch: Succeeded
NOTE: Running task 2016 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_deploy_source_date_epoch)
NOTE: recipe libxi-1_1.8.2-r0: task do_unpack: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_unpack: Succeeded
NOTE: recipe orc-0.4.42-r0: task do_fetch: Started
NOTE: Running task 2017 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_patch)
NOTE: recipe bluez5-5.86-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_fetch: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_fetch: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_unpack: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Started
NOTE: recipe libogg-1.3.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_unpack: Succeeded
NOTE: recipe flac-1.5.0-r0: task do_fetch: Succeeded
NOTE: Running task 2018 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_patch)
NOTE: Running task 2019 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_unpack)
NOTE: recipe libxft-1_2.3.9-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxft-1_2.3.9-r0: task do_patch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb:do_deploy_source_date_epoch unihash changed to e04b92f0729440d7ae431cef8a6fb7b44f6ed790ed367625c410512f18b39a1e
NOTE: recipe mesa-2_26.0.5-r0: task do_patch: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_patch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Succeeded
NOTE: recipe flac-1.5.0-r0: task do_unpack: Started
NOTE: recipe bluez5-5.86-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_patch: Succeeded
NOTE: recipe libogg-1.3.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.86.bb:do_deploy_source_date_epoch unihash changed to 3b887ae10056636cedf350f893eab74cb2d800980cf7a240c29867ef530d8077
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_deploy_source_date_epoch unihash changed to 14e5fcbcb822c6994e8b3ead4634e2096bf04c5bc70e1b7a4d5aa59ceb4e22c3
NOTE: recipe icu-78.3-r0: task do_patch: Succeeded
NOTE: recipe flac-1.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 2020 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2021 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_deploy_source_date_epoch)
NOTE: Running task 2022 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_patch)
NOTE: Running task 2023 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_deploy_source_date_epoch)
NOTE: Running task 2024 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_rust_gen_targets)
NOTE: Running task 2025 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2026 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_patch)
NOTE: Running task 2034 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_fetch)
NOTE: Running task 2035 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.0.bb:do_fetch)
NOTE: Running task 2045 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_fetch)
NOTE: recipe xz-5.8.2-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1994 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxft-1_2.3.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Started
NOTE: recipe icu-78.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_fetch: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe flac-1.5.0-r0: task do_patch: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_fetch: Started
NOTE: Running setscene task 1992 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_fetch: Started
NOTE: recipe at-spi2-core-2.60.0-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_26.0.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mesa-2_26.0.5-r0: task do_rust_gen_targets: Started
NOTE: recipe mesa-2_26.0.5-r0: task do_rust_gen_targets: Succeeded
NOTE: Running setscene task 1993 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_unpack: Succeeded
NOTE: Running setscene task 1994 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Succeeded
NOTE: Running task 2046 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_patch)
NOTE: recipe flac-1.5.0-r0: task do_patch: Succeeded
NOTE: Running task 2053 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_unpack)
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 2064 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_fetch)
NOTE: recipe xz-5.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1999 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_patch: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_unpack: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_deploy_source_date_epoch unihash changed to 9dd63fc23f766eb264b4568db86fb2a9524594bc06432349977495fdc17231f5
NOTE: recipe libxi-1_1.8.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe icu-78.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xz-5.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mesa-2_26.0.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_fetch: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_patch: Succeeded
NOTE: recipe at-spi2-core-2.60.0-r0: task do_fetch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_deploy_source_date_epoch unihash changed to 64cb7c01fab5d0ca578f43717b9d33bfe8a06735d31aeee371d2e03b649142f1
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_deploy_source_date_epoch unihash changed to eacb331d9d5e419a6a0e22481adfd54328191ccc169530c082682382abd64f0f
NOTE: recipe libsndfile1-1.2.2-r0: task do_unpack: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1913 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1917 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1918 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 2006 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 2070 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_patch)
NOTE: Running task 2071 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_fetch)
NOTE: Running task 2072 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_fetch)
NOTE: Running task 2073 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2074 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 2075 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_deploy_source_date_epoch)
NOTE: Running task 2076 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_write_config)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxv-1.0.13-r0: task do_fetch: Started
NOTE: recipe libtheora-1.2.0-r0: task do_fetch: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_patch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_write_config: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 2088 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.25.bb:do_fetch)
NOTE: Running task 2095 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_unpack)
NOTE: recipe xkeyboard-config-2.47-r0: task do_write_config: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 2008 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: Running task 2100 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.0.bb:do_unpack)
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Started
NOTE: recipe libxmlb-0.3.25-r0: task do_fetch: Started
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Started
NOTE: recipe at-spi2-core-2.60.0-r0: task do_unpack: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_deploy_source_date_epoch unihash changed to 0e6dd4b92779ee7f9d4aef6c08a153cd5f194300c4294b28a029766f7a5a9008
NOTE: recipe libxtst-1_1.2.5-r0: task do_fetch: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe at-spi2-core-2.60.0-r0: task do_unpack: Succeeded
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_patch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_deploy_source_date_epoch unihash changed to a43a08ece7e6936d9ec387b5e07db4ea8a47a7d11000e0febd5d481489cd481b
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch unihash changed to 31d32bf3418c95d5c02e210d0f86e37a847eae7b5ed2d870bf65f249ca398d3d
NOTE: Running setscene task 1925 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1927 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1944 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 1949 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 1950 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running task 2101 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_unpack)
NOTE: recipe orc-0.4.42-r0: task do_fetch: Succeeded
NOTE: Running task 2102 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.0.bb:do_patch)
NOTE: Running task 2106 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_fetch)
NOTE: Running task 2107 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_unpack)
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Succeeded
NOTE: Running task 2108 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_patch)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_unpack: Started
NOTE: recipe libwebp-1.6.0-r0: task do_fetch: Started
NOTE: recipe at-spi2-core-2.60.0-r0: task do_patch: Started
NOTE: recipe orc-0.4.42-r0: task do_unpack: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe at-spi2-core-2.60.0-r0: task do_patch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Started
NOTE: Running task 2111 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.2.bb:do_fetch)
NOTE: Running task 2112 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 2117 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_write_config)
NOTE: recipe libxtst-1_1.2.5-r0: task do_unpack: Succeeded
NOTE: Running task 2125 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_unpack)
NOTE: Running task 2128 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_fetch)
NOTE: Running task 2129 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_patch)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_fetch: Succeeded
NOTE: recipe orc-0.4.42-r0: task do_unpack: Succeeded
NOTE: Running task 2130 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_unpack)
NOTE: Running task 2131 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_patch)
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 2019 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_recipe_qa_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Succeeded
NOTE: recipe libxcursor-1_1.2.3-r0: task do_fetch: Succeeded
NOTE: recipe libxkbcommon-1.13.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 2020 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.28.2-r0: task do_fetch: Started
NOTE: Running task 2132 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-base-1.28.2-r0: task do_fetch: Succeeded
NOTE: Running task 2133 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.2.bb:do_fetch)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_write_config: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_unpack: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_patch: Started
NOTE: recipe libgudev-238-r0: task do_fetch: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_unpack: Started
NOTE: recipe orc-0.4.42-r0: task do_patch: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_write_config: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_patch: Succeeded
NOTE: Running task 2135 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_unpack: Started
NOTE: recipe orc-0.4.42-r0: task do_patch: Succeeded
NOTE: recipe sbc-2.2-r0: task do_fetch: Started
NOTE: Running task 2163 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_deploy_source_date_epoch)
NOTE: Running task 2164 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_unpack: Succeeded
NOTE: Running task 2169 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_write_config)
NOTE: Running task 2170 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_patch)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_unpack: Succeeded
NOTE: Running task 2171 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_patch)
NOTE: recipe flac-1.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_deploy_source_date_epoch unihash changed to 7627dcc1f3db72a0159690268162ea5a88313780d574bda28f12b8fde6a2e444
NOTE: recipe libxcursor-1_1.2.3-r0: task do_unpack: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe orc-0.4.42-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe orc-0.4.42-r0: task do_write_config: Started
NOTE: recipe libwebp-1.6.0-r0: task do_fetch: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_patch: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_patch: Started
NOTE: recipe sbc-2.2-r0: task do_fetch: Succeeded
NOTE: recipe libgudev-238-r0: task do_fetch: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_patch: Succeeded
NOTE: recipe orc-0.4.42-r0: task do_write_config: Succeeded
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_patch: Succeeded
NOTE: Running setscene task 1967 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1971 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1980 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: recipe libxtst-1_1.2.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2174 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_patch)
NOTE: Running task 2176 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2177 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_unpack)
NOTE: Running task 2178 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.2.bb:do_unpack)
NOTE: Running task 2185 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_fetch)
NOTE: Running task 2186 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb:do_fetch)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_deploy_source_date_epoch unihash changed to 24ba60406585344d1350a9f311f0fc2e0634045715030ca49fa0f99972b870ee
NOTE: recipe flac-1.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe orc-0.4.42-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_patch: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libwebp-1.6.0-r0: task do_unpack: Started
NOTE: recipe libxinerama-1_1.1.6-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.2-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.28.2-r0: task do_fetch: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_deploy_source_date_epoch unihash changed to c4a7de96a9bb7389e1b445fac5e770cc45cdb08816f3d741d7188ef1628fcca1
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_deploy_source_date_epoch unihash changed to 736755b861dbf7577e92993c54603a9b8791e85ab3444fc737147dd073400d6e
NOTE: recipe libxcursor-1_1.2.3-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.28.2-r0: task do_fetch: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxmlb-0.3.25-r0: task do_fetch: Succeeded
NOTE: recipe libwebp-1.6.0-r0: task do_unpack: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxv-1.0.13-r0: task do_fetch: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_deploy_source_date_epoch unihash changed to 7f1872850ef448ee2d1a107118d04c6427fe9b11202e704d9371ab678d2b5a91
NOTE: recipe gstreamer1.0-plugins-base-1.28.2-r0: task do_unpack: Succeeded
NOTE: Running setscene task 1967 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1972 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 2034 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 2192 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_unpack)
NOTE: Running task 2193 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.25.bb:do_unpack)
NOTE: Running task 2194 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_patch)
NOTE: Running task 2195 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.2.bb:do_patch)
NOTE: Running task 2196 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_fetch)
NOTE: Running task 2197 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb:do_fetch)
NOTE: Running task 2203 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_unpack)
NOTE: Running task 2204 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.2.bb:do_unpack)
NOTE: Running task 2215 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_deploy_source_date_epoch)
NOTE: Running task 2217 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb:do_fetch)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-arm-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxv-1.0.13-r0: task do_unpack: Started
NOTE: recipe libwebp-1.6.0-r0: task do_patch: Started
NOTE: recipe tiff-4.7.1-r0: task do_fetch: Started
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Started
NOTE: recipe sbc-2.2-r0: task do_unpack: Started
NOTE: recipe libxmlb-0.3.25-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.2-r0: task do_patch: Started
NOTE: recipe libgudev-238-r0: task do_unpack: Started
NOTE: recipe libtheora-1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2218 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_unpack)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gtk+3-3.24.52-r0: task do_fetch: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gtk+3-3.24.52-r0: task do_fetch: Succeeded
NOTE: Running task 2233 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_write_config)
NOTE: Running task 2234 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 2235 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libwebp-1.6.0-r0: task do_patch: Succeeded
NOTE: recipe libxv-1.0.13-r0: task do_unpack: Succeeded
NOTE: Running task 2237 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.0.bb:do_write_config)
NOTE: Running task 2238 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_patch)
NOTE: recipe libtheora-1.2.0-r0: task do_unpack: Started
NOTE: recipe sbc-2.2-r0: task do_unpack: Succeeded
NOTE: Running task 2239 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.2.bb:do_patch)
NOTE: recipe libgudev-238-r0: task do_unpack: Succeeded
NOTE: Running task 2240 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_patch)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Started
NOTE: recipe at-spi2-core-2.60.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Succeeded
NOTE: recipe libxv-1.0.13-r0: task do_patch: Started
NOTE: recipe at-spi2-core-2.60.0-r0: task do_write_config: Started
NOTE: Running task 2242 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_deploy_source_date_epoch)
NOTE: recipe sbc-2.2-r0: task do_patch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.28.2-r0: task do_patch: Succeeded
NOTE: recipe libgudev-238-r0: task do_patch: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_deploy_source_date_epoch unihash changed to 28bfd3348bccd791291e882f72f38b3a1f856323f3711b7825f5f6688cd82994
NOTE: recipe libxv-1.0.13-r0: task do_patch: Succeeded
NOTE: recipe sbc-2.2-r0: task do_patch: Succeeded
NOTE: recipe at-spi2-core-2.60.0-r0: task do_write_config: Succeeded
NOTE: recipe libtheora-1.2.0-r0: task do_unpack: Succeeded
NOTE: recipe libxcursor-1_1.2.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Succeeded
NOTE: recipe libgudev-238-r0: task do_patch: Succeeded
NOTE: recipe at-spi2-core-2.60.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.0.bb:do_deploy_source_date_epoch unihash changed to 90f34b45a2a937fce7b90dbac77a672be7ef2f32fc47f22ed8444913c6b2c2cf
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_deploy_source_date_epoch unihash changed to 85819d071d9c6f524ecaecdb6ff5d8ea039f769e2688a7f3f860b451e72843e8
NOTE: recipe libxcursor-1_1.2.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_deploy_source_date_epoch unihash changed to 60208da05b72ebc099a80a4ac6494b2c5172c8edb2de9a53e77089b607eb28b7
NOTE: recipe libxmlb-0.3.25-r0: task do_unpack: Succeeded
NOTE: Running task 2245 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_patch)
NOTE: Running task 2246 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.25.bb:do_patch)
NOTE: Running task 2248 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_fetch)
NOTE: Running task 2273 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2274 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_deploy_source_date_epoch)
NOTE: Running task 2288 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_write_config)
NOTE: Running task 2289 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb:do_unpack)
NOTE: Running task 2290 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_unpack)
NOTE: Running task 2292 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.22.2.bb:do_fetch)
NOTE: Running task 2294 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.25.bb:do_write_config)
NOTE: Running task 2298 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb:do_unpack)
NOTE: Running task 2299 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_create_recipe_spdx)
NOTE: recipe libtheora-1.2.0-r0: task do_patch: Started
NOTE: recipe libxmlb-0.3.25-r0: task do_patch: Started
NOTE: recipe json-glib-1.10.8-r0: task do_fetch: Started
NOTE: recipe libxv-1.0.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gcc-cross-arm-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 2036 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_populate_sysroot_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_write_config: Started
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Started
NOTE: recipe libogg-1.3.6-r0: task do_create_recipe_spdx: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.28.2-r0: task do_unpack: Started
NOTE: recipe gtk4-4.22.2-r0: task do_fetch: Started
NOTE: recipe libxmlb-0.3.25-r0: task do_write_config: Started
NOTE: recipe gtk+3-3.24.52-r0: task do_unpack: Started
NOTE: recipe gtk4-4.22.2-r0: task do_fetch: Succeeded
NOTE: Running task 2317 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/libwpe_1.16.3.bb:do_fetch)
NOTE: recipe libglu-2_9.0.3-r0: task do_write_config: Succeeded
NOTE: recipe libtheora-1.2.0-r0: task do_patch: Succeeded
NOTE: Running task 2318 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxmlb-0.3.25-r0: task do_write_config: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 2326 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nghttp2/nghttp2_1.68.1.bb:do_fetch)
NOTE: Running task 2332 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_create_recipe_spdx)
NOTE: recipe libxmlb-0.3.25-r0: task do_patch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Succeeded
NOTE: Running task 2333 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.25.bb:do_deploy_source_date_epoch)
NOTE: Running task 2334 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_patch)
NOTE: recipe libwpe-1.16.3-r0: task do_fetch: Started
NOTE: recipe libtheora-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libwpe-1.16.3-r0: task do_fetch: Succeeded
NOTE: Running task 2336 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_deploy_source_date_epoch)
NOTE: recipe nghttp2-1.68.1-r0: task do_fetch: Started
NOTE: recipe libogg-1.3.6-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe icu-78.3-r0: task do_create_recipe_spdx: Started
NOTE: Running task 2337 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libxv-1.0.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_deploy_source_date_epoch unihash changed to 265e7b3015d8766e8641df65e1d48d4c36c23b694998b1b58be4f7bbf4822843
NOTE: recipe graphene-1.10.8-r0: task do_patch: Started
NOTE: recipe libxmlb-0.3.25-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libwebp-1.6.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtheora-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_patch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_deploy_source_date_epoch unihash changed to 9042d78ffa5870baf86b2fd57d44a9ad16a63710bf9969910cc6750aa600cc94
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_deploy_source_date_epoch unihash changed to 9d7a4b67d32b4ee63c0e74ae9461ebfc3bfc9fcbbf9070dbb0f4a5482bee5df8
NOTE: recipe json-glib-1.10.8-r0: task do_fetch: Succeeded
NOTE: recipe icu-78.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libxmlb-0.3.25-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libwebp-1.6.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.28.2-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.28.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.25.bb:do_deploy_source_date_epoch unihash changed to 5c9884c54385addf7d5c7da0058f6bf0c7bce0563997bf5ecbcf819a0154f8dc
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_deploy_source_date_epoch unihash changed to ac7756db6836583e070d78f3a78cf018cf33cf1493bb0684abe9f8ed18ee9e86
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.2.bb:do_deploy_source_date_epoch unihash changed to 25762f6dfd7e1becf65963840b338a4ae5f0f4bf7d8a04a07a6fccabe36d4449
NOTE: recipe libxinerama-1_1.1.6-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1986 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 2038 of 2041 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils-cross_2.46.bb:do_populate_sysroot_setscene)
NOTE: Running task 2338 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_unpack)
NOTE: Running task 2339 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb:do_patch)
NOTE: Running task 2342 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.2.bb:do_write_config)
NOTE: Running task 2347 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_unpack)
NOTE: Running task 2362 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_deploy_source_date_epoch)
NOTE: Running task 2363 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2367 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.22.2.bb:do_unpack)
NOTE: Running task 2368 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_write_config)
NOTE: Running task 2381 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/libwpe_1.16.3.bb:do_unpack)
NOTE: Running task 2383 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.21.5.bb:do_fetch)
NOTE: recipe gtk+3-3.24.52-r0: task do_unpack: Succeeded
NOTE: recipe binutils-cross-arm-2.46-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 2384 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb:do_patch)
NOTE: recipe libxinerama-1_1.1.6-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.28.2-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.2-r0: task do_write_config: Started
NOTE: recipe sbc-2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe json-glib-1.10.8-r0: task do_unpack: Started
NOTE: recipe libgudev-238-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgudev-238-r0: task do_write_config: Started
NOTE: recipe gtk4-4.22.2-r0: task do_unpack: Started
NOTE: recipe libwpe-1.16.3-r0: task do_unpack: Started
NOTE: recipe libpsl-0.21.5-r0: task do_fetch: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 2390 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_create_recipe_spdx)
NOTE: recipe gstreamer1.0-plugins-base-1.28.2-r0: task do_write_config: Succeeded
NOTE: Running task 2396 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb:do_create_recipe_spdx)
NOTE: recipe gtk+3-3.24.52-r0: task do_patch: Started
NOTE: recipe libgudev-238-r0: task do_write_config: Succeeded
NOTE: Running task 2397 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_create_recipe_spdx)
NOTE: recipe libxinerama-1_1.1.6-r0: task do_unpack: Succeeded
NOTE: Running task 2398 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_patch)
NOTE: recipe libwpe-1.16.3-r0: task do_unpack: Succeeded
NOTE: Running task 2399 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/libwpe_1.16.3.bb:do_patch)
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe harfbuzz-12.3.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe json-glib-1.10.8-r0: task do_unpack: Succeeded
NOTE: recipe nghttp2-1.68.1-r0: task do_fetch: Succeeded
NOTE: recipe gtk+3-3.24.52-r0: task do_patch: Succeeded
NOTE: Running task 2400 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_patch)
NOTE: recipe fribidi-1.0.16-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxinerama-1_1.1.6-r0: task do_patch: Started
NOTE: Running task 2402 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nghttp2/nghttp2_1.68.1.bb:do_unpack)
NOTE: Running task 2406 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_create_recipe_spdx)
NOTE: recipe binutils-cross-arm-2.46-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.28.2-r0: task do_patch: Succeeded
NOTE: Running setscene task 2040 of 2041 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/bison/bison_3.8.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 2411 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libxinerama-1_1.1.6-r0: task do_patch: Succeeded
NOTE: recipe libwpe-1.16.3-r0: task do_patch: Started
NOTE: recipe sbc-2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2412 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_deploy_source_date_epoch)
NOTE: recipe libgudev-238-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.2.bb:do_deploy_source_date_epoch unihash changed to 77df565be99352dcc168daa2e8cec706a2ebd6aa830ddc9a73241e2c713f333b
NOTE: recipe libwpe-1.16.3-r0: task do_patch: Succeeded
NOTE: recipe nghttp2-1.68.1-r0: task do_unpack: Started
NOTE: recipe json-glib-1.10.8-r0: task do_patch: Started
NOTE: recipe mesa-2_26.0.5-r0: task do_create_recipe_spdx: Started
NOTE: recipe bison-native-3.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.28.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxinerama-1_1.1.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe json-glib-1.10.8-r0: task do_patch: Succeeded
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe harfbuzz-12.3.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_deploy_source_date_epoch unihash changed to 4f9d13590d3c80e4177b4a63bce550a56674fbe0a6d588e2a8e971eee4720d3a
NOTE: recipe bison-native-3.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe nghttp2-1.68.1-r0: task do_unpack: Succeeded
NOTE: recipe libxinerama-1_1.1.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_deploy_source_date_epoch unihash changed to ea7d1af69bd20eacb114257902c0423f308f69a5874cfd7d41f260c6f6bbcd48
NOTE: recipe gstreamer1.0-plugins-bad-1.28.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mesa-2_26.0.5-r0: task do_create_recipe_spdx: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb:do_deploy_source_date_epoch unihash changed to 2f25c1b16e996155498adbab7abd2c658073b48000ed022e72920fbb41878127
NOTE: Setscene tasks completed
NOTE: recipe libpsl-0.21.5-r0: task do_fetch: Succeeded
NOTE: recipe tiff-4.7.1-r0: task do_fetch: Succeeded
NOTE: recipe gtk4-4.22.2-r0: task do_unpack: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2743 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2771 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2772 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2889 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2903 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.19.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2904 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2905 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe icu-78.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2928 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_packagedata)
NOTE: recipe shared-mime-info-2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2976 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: Running task 3008 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_prepare_recipe_sysroot)
NOTE: recipe vala-0.56.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3009 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe fribidi-1.0.16-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3042 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_prepare_recipe_sysroot)
NOTE: recipe xz-5.8.2-r0: task do_packagedata: Started
NOTE: Running task 3046 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3072 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3074 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libogg-1.3.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-2_26.0.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libusb1-1.0.29-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe icu-78.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3075 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_make_icudata)
NOTE: recipe xkeyboard-config-2.47-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3076 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_configure)
NOTE: recipe icu-78.3-r0: task do_make_icudata: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libogg-1.3.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_configure: Started
NOTE: Running task 3077 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_configure)
NOTE: Running task 3078 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_configure)
NOTE: recipe icu-78.3-r0: task do_make_icudata: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3079 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_configure)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 56f86136d7a4cf1994dc4410aea1740546a49f4519d7112a9e473f8c6a2f81f4
NOTE: Setscene tasks completed
NOTE: Running task 3080 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe fribidi-1.0.16-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xz-5.8.2-r0: task do_packagedata: Succeeded
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libusb1-1.0.29-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3081 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_configure)
NOTE: recipe libxft-1_2.3.9-r0: task do_configure: Started
NOTE: Running task 3088 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_configure)
NOTE: recipe libogg-1.3.6-r0: task do_configure: Started
NOTE: Running task 3089 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_configure)
NOTE: Running task 3092 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_configure)
NOTE: recipe icu-78.3-r0: task do_configure: Started
NOTE: Running task 3113 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_prepare_recipe_sysroot)
NOTE: recipe fribidi-1.0.16-r0: task do_configure: Started
NOTE: recipe dbus-1.16.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libusb1-1.0.29-r0: task do_configure: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_configure: Started
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_configure: Started
NOTE: recipe orc-0.4.42-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3114 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_configure)
NOTE: recipe xkeyboard-config-2.47-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3115 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_configure)
NOTE: recipe vala-0.56.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3116 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb:do_configure)
NOTE: Running task 3117 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.19.bb:do_configure)
NOTE: recipe mesa-2_26.0.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3118 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_rust_create_wrappers)
NOTE: recipe shared-mime-info-2.4-r0: task do_configure: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_configure: Started
NOTE: recipe vala-0.56.19-r0: task do_configure: Started
NOTE: recipe mesa-2_26.0.5-r0: task do_rust_create_wrappers: Started
NOTE: recipe mesa-2_26.0.5-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 3119 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_configure)
NOTE: recipe orc-0.4.42-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3120 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_configure)
NOTE: recipe orc-0.4.42-r0: task do_configure: Started
NOTE: recipe mesa-2_26.0.5-r0: task do_configure: Started
NOTE: recipe dbus-1.16.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3121 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_configure)
NOTE: recipe dbus-1.16.2-r0: task do_configure: Started
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_configure: Succeeded
NOTE: Running task 3122 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_compile)
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_compile: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_configure: Succeeded
NOTE: Running task 3123 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_compile)
NOTE: recipe fribidi-1.0.16-r0: task do_configure: Succeeded
NOTE: Running task 3124 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_compile)
NOTE: recipe xkeyboard-config-2.47-r0: task do_compile: Started
NOTE: recipe fribidi-1.0.16-r0: task do_compile: Started
NOTE: recipe orc-0.4.42-r0: task do_configure: Succeeded
NOTE: Running task 3125 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_compile)
NOTE: recipe orc-0.4.42-r0: task do_compile: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_compile: Succeeded
NOTE: Running task 3126 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_install)
NOTE: recipe shared-mime-info-2.4-r0: task do_configure: Succeeded
NOTE: Running task 3127 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_compile)
NOTE: recipe xkeyboard-config-2.47-r0: task do_install: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_compile: Started
NOTE: recipe librsvg-2.61.3-r0: task do_fetch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3128 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_unpack)
NOTE: recipe librsvg-2.61.3-r0: task do_unpack: Started
NOTE: recipe fribidi-1.0.16-r0: task do_compile: Succeeded
NOTE: Running task 3129 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_install)
NOTE: recipe fribidi-1.0.16-r0: task do_install: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_install: Succeeded
NOTE: Running task 3130 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_populate_sysroot)
NOTE: recipe xkeyboard-config-2.47-r0: task do_populate_sysroot: Started
NOTE: recipe fribidi-1.0.16-r0: task do_install: Succeeded
NOTE: Running task 3131 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_populate_sysroot)
NOTE: recipe xkeyboard-config-2.47-r0: task do_populate_sysroot: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_populate_sysroot: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_populate_sysroot unihash changed to 9404347cd18ce6f199e149b596c64fa2119d8d2babfa22edf16421cc2edf64ad
NOTE: Setscene tasks completed
NOTE: Running task 3132 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fribidi-1.0.16-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_populate_sysroot unihash changed to e04aceb099a587079ba496da2b0818b50efef2783e13353eea026b513e834858
NOTE: Setscene tasks completed
NOTE: Running task 3142 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_packagedata)
NOTE: recipe icu-78.3-r0: task do_configure: Succeeded
NOTE: Running task 3143 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_configure_ptest_base)
NOTE: recipe xrandr-1_1.5.3-r0: task do_packagedata: Started
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_compile: Succeeded
NOTE: recipe libxkbcommon-1.13.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3144 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_install)
NOTE: recipe icu-78.3-r0: task do_configure_ptest_base: Started
NOTE: Running task 3145 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_configure)
NOTE: recipe orc-0.4.42-r0: task do_compile: Succeeded
NOTE: Running task 3146 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_install)
NOTE: recipe icu-78.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3147 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_compile)
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_install: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_compile: Succeeded
NOTE: Running task 3148 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_install)
NOTE: recipe orc-0.4.42-r0: task do_install: Started
NOTE: recipe icu-78.3-r0: task do_compile: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3162 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_package)
NOTE: recipe shared-mime-info-2.4-r0: task do_install: Started
NOTE: recipe fribidi-1.0.16-r0: task do_package: Started
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_install: Succeeded
NOTE: Running task 3163 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_configure: Succeeded
NOTE: Running task 3164 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb:do_configure_ptest_base)
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_configure_ptest_base: Started
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3165 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb:do_compile)
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_compile: Started
NOTE: recipe orc-0.4.42-r0: task do_install: Succeeded
NOTE: Running task 3166 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_package)
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_populate_sysroot unihash changed to 1f6027b3eab3893170f591748da3ec591e66444bef0be33667a7786a2e2595d2
NOTE: recipe dbus-1.16.2-r0: task do_configure: Succeeded
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_package: Started
NOTE: Setscene tasks completed
NOTE: Running task 3167 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_configure_ptest_base)
NOTE: Running task 3169 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_populate_sysroot)
NOTE: recipe orc-0.4.42-r0: task do_populate_sysroot: Started
NOTE: recipe dbus-1.16.2-r0: task do_configure_ptest_base: Started
NOTE: recipe dbus-1.16.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3170 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_compile)
NOTE: recipe dbus-1.16.2-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_install: Succeeded
NOTE: Running task 3171 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_populate_sysroot)
NOTE: recipe orc-0.4.42-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_populate_sysroot unihash changed to 22b377e24545aa760743ba3ceeb41e71f1433f33f1c1586f6550290b6093d7b3
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot: Started
NOTE: recipe fribidi-1.0.16-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_package unihash changed to bb8506b7d1af675d0be8ef59f13354553e64fd287750380e6b225e42c1187f12
NOTE: Setscene tasks completed
NOTE: Running task 3172 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_packagedata)
NOTE: Running task 3173 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe fribidi-1.0.16-r0: task do_packagedata: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_packagedata: Succeeded
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_packagedata unihash changed to ec573fd9f5cb9465f7a7183e7170a8d2ebdaa02a9374ac6f3a281daf72351865
NOTE: Setscene tasks completed
NOTE: Running task 3174 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3175 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_configure)
NOTE: Running task 3177 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_package)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_package: Started
NOTE: recipe mesa-2_26.0.5-r0: task do_configure: Succeeded
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3178 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_compile)
NOTE: recipe libxft-1_2.3.9-r0: task do_configure: Succeeded
NOTE: Running task 3179 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_compile)
NOTE: recipe libogg-1.3.6-r0: task do_configure: Succeeded
NOTE: Running task 3180 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_compile)
NOTE: recipe libusb1-1.0.29-r0: task do_configure: Succeeded
NOTE: Running task 3181 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_configure_ptest_base)
NOTE: recipe libogg-1.3.6-r0: task do_compile: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_compile: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_configure: Succeeded
NOTE: recipe mesa-2_26.0.5-r0: task do_compile: Started
NOTE: Running task 3182 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_compile)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_configure: Succeeded
NOTE: Running task 3183 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_compile)
NOTE: recipe libusb1-1.0.29-r0: task do_configure_ptest_base: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_compile: Started
NOTE: recipe librsvg-2.61.3-r0: task do_unpack: Succeeded
NOTE: Running task 3184 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_patch)
NOTE: recipe libusb1-1.0.29-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3185 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_compile)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_compile: Started
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_package unihash changed to dd6be97c4c45cea3404f1681ef1e0db0ded2199fe0600d8ffcc85e39a5c59b88
NOTE: recipe libusb1-1.0.29-r0: task do_compile: Started
NOTE: recipe librsvg-2.61.3-r0: task do_patch: Started
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3186 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_configure)
NOTE: Running task 3187 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_compile)
NOTE: Running task 3188 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_packagedata)
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_packagedata: Started
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_configure: Started
NOTE: recipe librsvg-2.61.3-r0: task do_patch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3189 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libogg-1.3.6-r0: task do_compile: Succeeded
NOTE: Running task 3190 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_rust_gen_targets)
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_packagedata: Succeeded
NOTE: recipe librsvg-2.61.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_packagedata unihash changed to aad3f317345bbd6b81fbfcbf655d25e2b9057648f67b423604e0a7d861740a6c
NOTE: recipe librsvg-2.61.3-r0: task do_rust_gen_targets: Started
NOTE: Running task 3191 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_install)
NOTE: recipe librsvg-2.61.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe librsvg-2.61.3-r0: task do_rust_gen_targets: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_deploy_source_date_epoch unihash changed to daa1e36eda1a128a569fc10d594fd3a9626a9a488e507d5daba9ea6b7607ec07
NOTE: recipe libogg-1.3.6-r0: task do_install: Started
NOTE: Setscene tasks completed
NOTE: Running task 3193 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3196 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxv-1.0.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxv-1.0.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3197 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_configure)
NOTE: recipe vala-0.56.19-r0: task do_configure: Succeeded
NOTE: Running task 3198 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.19.bb:do_compile)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3199 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_configure)
NOTE: recipe libxv-1.0.13-r0: task do_configure: Started
NOTE: recipe vala-0.56.19-r0: task do_compile: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_configure: Started
NOTE: recipe libogg-1.3.6-r0: task do_install: Succeeded
NOTE: Running task 3200 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_populate_sysroot)
NOTE: recipe libogg-1.3.6-r0: task do_populate_sysroot: Started
NOTE: recipe dbus-1.16.2-r0: task do_compile: Succeeded
NOTE: Running task 3201 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_compile_ptest_base)
NOTE: recipe libogg-1.3.6-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_populate_sysroot unihash changed to a6cb08e73ec4ad93b49addf5c7c8e40107e2bf43777dd9bf1f9139d76c8ab059
NOTE: recipe dbus-1.16.2-r0: task do_compile_ptest_base: Started
NOTE: Setscene tasks completed
NOTE: Running task 3202 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe dbus-1.16.2-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe libxft-1_2.3.9-r0: task do_compile: Succeeded
NOTE: Running task 3203 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_install)
NOTE: Running task 3204 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_install)
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_install: Started
NOTE: recipe dbus-1.16.2-r0: task do_install: Started
NOTE: recipe libusb1-1.0.29-r0: task do_compile: Succeeded
NOTE: Running task 3205 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_package)
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3206 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_configure)
NOTE: recipe libogg-1.3.6-r0: task do_package: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_install: Succeeded
NOTE: Running task 3207 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_populate_sysroot)
NOTE: recipe libxft-1_2.3.9-r0: task do_populate_sysroot: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3208 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe flac-1.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_configure: Succeeded
NOTE: recipe flac-1.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3209 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_configure_ptest_base)
NOTE: Running task 3210 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_configure)
NOTE: recipe flac-1.5.0-r0: task do_configure: Started
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_configure_ptest_base: Started
NOTE: recipe dbus-1.16.2-r0: task do_install: Succeeded
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3211 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_compile)
NOTE: Running task 3212 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_install_ptest_base)
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_compile: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_compile: Succeeded
NOTE: Running task 3213 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_install)
NOTE: recipe dbus-1.16.2-r0: task do_install_ptest_base: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_install: Started
NOTE: recipe dbus-1.16.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3214 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_populate_sysroot)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_compile: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_populate_sysroot: Started
NOTE: Running task 3215 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_install)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_install: Started
NOTE: recipe libogg-1.3.6-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_package unihash changed to ddd6e6a770d2644e22dfbe10a0f2dd8b6d675869b6d6ef2ae800fabbd1a44606
NOTE: recipe libxi-1_1.8.2-r0: task do_install: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3216 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_populate_sysroot)
NOTE: Running task 3217 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_packagedata)
NOTE: recipe dbus-1.16.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3218 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_compile_ptest_base)
NOTE: recipe libogg-1.3.6-r0: task do_packagedata: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_populate_sysroot: Started
NOTE: recipe libusb1-1.0.29-r0: task do_compile_ptest_base: Started
NOTE: recipe libogg-1.3.6-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_packagedata unihash changed to 41332f40b6af72caacd20241582c918dbad122ff9446a6631735e0081bc30d58
NOTE: recipe libusb1-1.0.29-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe libxkbcommon-1.13.1-r0: task do_install: Succeeded
NOTE: Running task 3219 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_populate_sysroot)
NOTE: recipe libxi-1_1.8.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3220 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_install)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_populate_sysroot unihash changed to ca1256b980ddc3f66331a6926dbef18d8ce5b9a8873a45265e05d8484d309b4d
NOTE: recipe libxkbcommon-1.13.1-r0: task do_populate_sysroot: Started
NOTE: recipe libusb1-1.0.29-r0: task do_install: Started
NOTE: Setscene tasks completed
NOTE: Running task 3221 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3222 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_package)
NOTE: recipe libxtst-1_1.2.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_package: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libusb1-1.0.29-r0: task do_install: Succeeded
NOTE: Running task 3223 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_configure)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3224 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_package)
NOTE: Running task 3225 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtheora-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_configure: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_package: Started
NOTE: recipe libtheora-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3226 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_configure)
NOTE: recipe libtheora-1.2.0-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_package: Succeeded
NOTE: Running task 3227 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_packagedata)
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_configure: Succeeded
NOTE: Running task 3228 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_compile)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_packagedata unihash changed to 0de30892463e2b910bfbe654c6b85b5fa619ed8b4ba1468b05a8ef8a24f6b9fe
NOTE: Setscene tasks completed
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_compile: Succeeded
NOTE: Running task 3230 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb:do_unpack)
NOTE: Running task 3231 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_install)
NOTE: recipe tiff-4.7.1-r0: task do_unpack: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_install: Started
NOTE: recipe tiff-4.7.1-r0: task do_unpack: Succeeded
NOTE: Running task 3232 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb:do_patch)
NOTE: recipe tiff-4.7.1-r0: task do_patch: Started
NOTE: recipe tiff-4.7.1-r0: task do_patch: Succeeded
NOTE: Running task 3233 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.25.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_install: Succeeded
NOTE: recipe libxmlb-0.3.25-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3244 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_populate_sysroot)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_populate_sysroot: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_package: Succeeded
NOTE: Running task 3245 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_packagedata)
NOTE: recipe libxft-1_2.3.9-r0: task do_packagedata: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_package unihash changed to 5bc969469deace3ea51d7470bc51d08b43fd78ea53121e14b0a39e112d253c50
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_populate_sysroot unihash changed to 449e20ccdeaa3ca6394db64a0448e6436ddadc0e56034222130aac05bc8d1041
NOTE: recipe libxft-1_2.3.9-r0: task do_packagedata: Succeeded
NOTE: recipe libxmlb-0.3.25-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_packagedata unihash changed to 554c589d0f7294c43b141832e8f30f3d5b42fcb439f281e9bcde0455ba1e2477
NOTE: Setscene tasks completed
NOTE: Running task 3246 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_packagedata)
NOTE: Running task 3247 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.25.bb:do_configure)
NOTE: Running task 3249 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: Running task 3252 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_package)
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_compile: Succeeded
NOTE: Running task 3253 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_compile_ptest_base)
NOTE: recipe libxi-1_1.8.2-r0: task do_packagedata: Started
NOTE: recipe libxmlb-0.3.25-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Succeeded
NOTE: recipe libxcursor-1_1.2.3-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3254 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_compile)
NOTE: recipe xkeyboard-config-2.47-r0: task do_package: Started
NOTE: Running task 3255 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_compile_ptest_base: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3256 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_install)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_compile: Started
NOTE: recipe libxv-1.0.13-r0: task do_configure: Succeeded
NOTE: Running task 3257 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_compile)
NOTE: recipe libxi-1_1.8.2-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_packagedata unihash changed to da4d7be41987ef9a432557b4f1477c67bf77e9ae628fd44e28036aef2798feae
NOTE: recipe libxv-1.0.13-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_compile: Succeeded
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_install: Started
NOTE: Setscene tasks completed
NOTE: Running task 3258 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb:do_compile_ptest_base)
NOTE: Running task 3259 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libwebp-1.6.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_compile_ptest_base: Started
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3260 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb:do_install)
NOTE: recipe libwebp-1.6.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxcursor-1_1.2.3-r0: task do_compile: Succeeded
NOTE: Running task 3261 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_configure)
NOTE: Running task 3262 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_install)
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_install: Started
NOTE: recipe libwebp-1.6.0-r0: task do_configure: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_install: Started
NOTE: recipe libxv-1.0.13-r0: task do_compile: Succeeded
NOTE: Running task 3263 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_install)
NOTE: recipe libxv-1.0.13-r0: task do_install: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_install: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Succeeded
NOTE: Running task 3264 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_install)
NOTE: Running task 3265 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_populate_sysroot)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_populate_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Started
NOTE: recipe libxv-1.0.13-r0: task do_install: Succeeded
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_install: Succeeded
NOTE: Running task 3266 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_populate_sysroot)
NOTE: Running task 3267 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_install_ptest_base)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_populate_sysroot unihash changed to fd17cd13e094ce40c4a7c258a2861289304ad7e4737b46161d3dc74f81f162d5
NOTE: recipe libxv-1.0.13-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_install_ptest_base: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3268 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: Running task 3271 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3272 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_populate_sysroot)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe libgudev-238-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_install: Succeeded
NOTE: Running task 3273 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb:do_install_ptest_base)
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxv-1.0.13-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_populate_sysroot unihash changed to 83b4999706464e55fccdf777853ec5cabedd4e382e3f8a6afe19f1abef3cb378
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_install_ptest_base: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Running task 3274 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 27a1287f03f8699e6a83b8e7203f6b85f617ccd1b7f11fa183cd486905f39fba
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_install_ptest_base: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3275 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_package)
NOTE: Running task 3276 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb:do_populate_sysroot)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Started
NOTE: Running task 3277 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_package)
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_populate_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Started
NOTE: recipe libgudev-238-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_package: Started
NOTE: Running task 3278 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_configure)
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3279 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_install_ptest_base)
NOTE: recipe libgudev-238-r0: task do_configure: Started
NOTE: recipe libusb1-1.0.29-r0: task do_install_ptest_base: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot unihash changed to de409be25a813c6b99ba41d048ab9e4e91603378fb9291c9c22a2f782bce405c
NOTE: recipe libusb1-1.0.29-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3280 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.22.2.bb:do_patch)
NOTE: Running task 3281 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_package)
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3284 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nghttp2/nghttp2_1.68.1.bb:do_patch)
NOTE: recipe libxmlb-0.3.25-r0: task do_configure: Succeeded
NOTE: recipe gtk4-4.22.2-r0: task do_patch: Started
NOTE: Running task 3289 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_populate_sysroot)
NOTE: recipe gtk4-4.22.2-r0: task do_patch: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_package: Started
NOTE: Running task 3290 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_deploy_source_date_epoch)
NOTE: recipe nghttp2-1.68.1-r0: task do_patch: Started
NOTE: recipe libusb1-1.0.29-r0: task do_populate_sysroot: Started
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe nghttp2-1.68.1-r0: task do_patch: Succeeded
NOTE: Running task 3291 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb:do_deploy_source_date_epoch)
NOTE: recipe tiff-4.7.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_deploy_source_date_epoch unihash changed to df565cc150da9ad44a6e90d5f273c5ff654a5f8dcfcd3c8c3451a6e9b1adb457
NOTE: recipe tiff-4.7.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb:do_deploy_source_date_epoch unihash changed to 542dc977ec38616f99b5b91e99709c7cfc53138c4f578c116b0c0b5c56769977
NOTE: recipe libtheora-1.2.0-r0: task do_configure: Succeeded
NOTE: recipe libusb1-1.0.29-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3292 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_compile)
NOTE: Running task 3293 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_create_recipe_spdx)
NOTE: Running task 3295 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.25.bb:do_configure_ptest_base)
NOTE: Running task 3296 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtheora-1.2.0-r0: task do_compile: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxmlb-0.3.25-r0: task do_configure_ptest_base: Started
NOTE: recipe libxinerama-1_1.1.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxmlb-0.3.25-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe xkeyboard-config-2.47-r0: task do_package: Succeeded
NOTE: Running task 3297 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.25.bb:do_compile)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_package unihash changed to d7e8b75106436df44a35996f4a92315d84441e8f3c92e5a1d5652d7914edb56b
NOTE: recipe libxft-1_2.3.9-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libxmlb-0.3.25-r0: task do_compile: Started
NOTE: Setscene tasks completed
NOTE: Running task 3298 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_packagedata)
NOTE: recipe libxinerama-1_1.1.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3299 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb:do_write_config)
NOTE: Running task 3300 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_write_config)
NOTE: recipe xkeyboard-config-2.47-r0: task do_packagedata: Started
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.28.2-r0: task do_write_config: Started
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Succeeded
NOTE: Running task 3301 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.28.2-r0: task do_write_config: Succeeded
NOTE: Running task 3302 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxtst-1_1.2.5-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3303 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_compile)
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe tiff-4.7.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_compile: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_packagedata unihash changed to 73d788881519ecfa52eda71ce71ff71dccd00d3025edff7140f518e792f86e06
NOTE: recipe tiff-4.7.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3304 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_package)
NOTE: Running task 3305 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_configure)
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3306 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_configure)
NOTE: recipe libxinerama-1_1.1.6-r0: task do_configure: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_package: Started
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_compile: Succeeded
NOTE: Running task 3307 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_install)
NOTE: recipe libgudev-238-r0: task do_configure: Succeeded
NOTE: Running task 3308 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_compile)
NOTE: recipe graphene-1.10.8-r0: task do_configure: Started
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_install: Started
NOTE: recipe libgudev-238-r0: task do_compile: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_package unihash changed to 81ebf3e06ac0395057e682d69a03eec9e609666f72401a381a429bf2324863ad
NOTE: Setscene tasks completed
NOTE: Running task 3309 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata)
NOTE: recipe libxtst-1_1.2.5-r0: task do_compile: Succeeded
NOTE: Running task 3310 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_install)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Started
NOTE: recipe flac-1.5.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3311 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_compile)
NOTE: recipe libxtst-1_1.2.5-r0: task do_install: Started
NOTE: recipe flac-1.5.0-r0: task do_compile: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata unihash changed to 45e36c702de50c18c06c997a253442c282a0906bbf73c0cf824e103196a9e01c
NOTE: Setscene tasks completed
NOTE: Running task 3312 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb:do_configure)
NOTE: recipe libxtst-1_1.2.5-r0: task do_install: Succeeded
NOTE: Running task 3313 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_populate_sysroot)
NOTE: recipe tiff-4.7.1-r0: task do_configure: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_install: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_populate_sysroot unihash changed to 68273d501d1ba46497c449198e11318d989ac7c9fac667d8ebc1b0692627bdc6
NOTE: Setscene tasks completed
NOTE: Running task 3314 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_populate_sysroot)
NOTE: Running task 3315 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-core-2.60.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtheora-1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 3316 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_install)
NOTE: recipe libtheora-1.2.0-r0: task do_install: Started
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_populate_sysroot unihash changed to 0ec472422b89a275b424950c3b1a4d0d194940dbca298a06e6bdd63846e3f180
NOTE: Setscene tasks completed
NOTE: Running task 3317 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_package)
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_package: Started
NOTE: recipe at-spi2-core-2.60.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3318 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.0.bb:do_configure)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_package: Succeeded
NOTE: recipe at-spi2-core-2.60.0-r0: task do_configure: Started
NOTE: recipe libtheora-1.2.0-r0: task do_install: Succeeded
NOTE: Running task 3319 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_packagedata)
NOTE: Running task 3320 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_populate_sysroot)
NOTE: recipe libgudev-238-r0: task do_compile: Succeeded
NOTE: recipe libxkbcommon-1.13.1-r0: task do_packagedata: Started
NOTE: recipe libtheora-1.2.0-r0: task do_populate_sysroot: Started
NOTE: Running task 3321 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_install)
NOTE: recipe libgudev-238-r0: task do_install: Started
NOTE: recipe dbus-1.16.2-r0: task do_package: Succeeded
NOTE: Running task 3322 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_packagedata)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3329 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_create_recipe_spdx)
NOTE: recipe libtheora-1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_populate_sysroot unihash changed to c97f514f51f1928798e0490fdeb59ce45fda49eb7bee989f74a6f2687065cec9
NOTE: recipe dbus-1.16.2-r0: task do_packagedata: Started
NOTE: recipe libxmlb-0.3.25-r0: task do_compile: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_create_recipe_spdx: Started
NOTE: Setscene tasks completed
NOTE: Running task 3330 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_package)
NOTE: Running task 3332 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb:do_package)
NOTE: recipe libwebp-1.6.0-r0: task do_configure: Succeeded
NOTE: Running task 3333 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_compile)
NOTE: recipe libxi-1_1.8.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_package: Started
NOTE: Running task 3343 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.21.5.bb:do_unpack)
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_package: Started
NOTE: recipe libgudev-238-r0: task do_install: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_packagedata: Succeeded
NOTE: recipe libwebp-1.6.0-r0: task do_compile: Started
NOTE: Running task 3344 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_populate_sysroot)
NOTE: Running task 3345 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb:do_deploy_source_date_epoch)
NOTE: recipe libpsl-0.21.5-r0: task do_unpack: Started
NOTE: recipe gtk+3-3.24.52-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgudev-238-r0: task do_populate_sysroot: Started
NOTE: recipe graphene-1.10.8-r0: task do_configure: Succeeded
NOTE: recipe libpsl-0.21.5-r0: task do_unpack: Succeeded
NOTE: Running task 3346 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_compile)
NOTE: recipe gtk+3-3.24.52-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3347 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_package)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb:do_deploy_source_date_epoch unihash changed to 47be967cdaee18766efc07246e37f1fa17377d76e9d96c39d341db61273b95fc
NOTE: recipe graphene-1.10.8-r0: task do_compile: Started
NOTE: recipe orc-0.4.42-r0: task do_package: Started
NOTE: Setscene tasks completed
NOTE: Running task 3351 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.21.5.bb:do_patch)
NOTE: recipe libgudev-238-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3354 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_create_recipe_spdx)
NOTE: recipe libpsl-0.21.5-r0: task do_patch: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_create_recipe_spdx: Started
NOTE: recipe libpsl-0.21.5-r0: task do_patch: Succeeded
NOTE: Running task 3355 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_fetch)
NOTE: recipe desktop-file-utils-0.28-r0: task do_fetch: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3360 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.1.bb:do_create_recipe_spdx)
NOTE: recipe pango-1.57.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe pango-1.57.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3361 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb:do_write_config)
NOTE: recipe gtk+3-3.24.52-r0: task do_write_config: Started
NOTE: recipe gtk+3-3.24.52-r0: task do_write_config: Succeeded
NOTE: Running task 3364 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libsoup/libsoup_3.6.6.bb:do_fetch)
NOTE: recipe libsoup-3.6.6-r0: task do_fetch: Started
NOTE: recipe libsoup-3.6.6-r0: task do_fetch: Succeeded
NOTE: Running task 3365 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_package)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_package: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_fetch: Succeeded
NOTE: Running task 3370 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.4.bb:do_fetch)
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_package: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_package unihash changed to 4ce395c5b9585b6b4fa3658dd27985bfcf68d52ed6208e65d5c801e1078aa5d9
NOTE: recipe libfyaml-0.9.4-r0: task do_fetch: Started
NOTE: recipe orc-0.4.42-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_package unihash changed to 98d1120c9617bae0755f4394b7a474bd7c367f7b41661ad178cade91e08d6e5d
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_package unihash changed to 7c2d9b2cc074325dcc4025ef39733fcf535219b40bedb3e07cb1522429333f7d
NOTE: Setscene tasks completed
NOTE: Running task 3371 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_packagedata)
NOTE: Running task 3372 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_packagedata)
NOTE: Running task 3373 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_packagedata)
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_packagedata: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_packagedata: Started
NOTE: recipe orc-0.4.42-r0: task do_packagedata: Started
NOTE: recipe libfyaml-0.9.4-r0: task do_fetch: Succeeded
NOTE: Running task 3374 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/aspell/aspell_0.60.8.2.bb:do_fetch)
NOTE: recipe libxtst-1_1.2.5-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_packagedata unihash changed to 2b76739be84daf9e45d453ad2dcb1b337fcde460d76c274691076a5c0c64598a
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_packagedata: Succeeded
NOTE: recipe aspell-0.60.8.2-r0: task do_fetch: Started
NOTE: recipe orc-0.4.42-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_packagedata unihash changed to 4ec40053137b434b3f94f1ffa21652ead90e05f0a94528262ca7356f482db275
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_packagedata unihash changed to 08a31115c8462404fc9b0f85711e68055001e84807043e35da88216a182767bb
NOTE: Setscene tasks completed
NOTE: Running task 3379 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 3382 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_write_config)
NOTE: Running task 3383 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe json-glib-1.10.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe json-glib-1.10.8-r0: task do_write_config: Started
NOTE: recipe json-glib-1.10.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe json-glib-1.10.8-r0: task do_write_config: Succeeded
NOTE: Running task 3396 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_package)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_package: Started
NOTE: recipe json-glib-1.10.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_deploy_source_date_epoch unihash changed to 84c49ef177a7f664bbeede84ddf8f910d84f50d0c80817e66d7b29cd998fc153
NOTE: recipe at-spi2-core-2.60.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3397 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.0.bb:do_compile)
NOTE: Running task 3443 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.22.2.bb:do_deploy_source_date_epoch)
NOTE: recipe at-spi2-core-2.60.0-r0: task do_compile: Started
NOTE: recipe gtk4-4.22.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe json-glib-1.10.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3444 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_configure)
NOTE: recipe gtk4-4.22.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.22.2.bb:do_deploy_source_date_epoch unihash changed to d8958eaa69ce4ae03ffac05a62f9b51156d3ba20f708271c5f7ceb0c30865d9d
NOTE: recipe json-glib-1.10.8-r0: task do_configure: Started
NOTE: Running task 3454 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.19.bb:do_create_recipe_spdx)
NOTE: recipe vala-0.56.19-r0: task do_create_recipe_spdx: Started
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_package: Succeeded
NOTE: Running task 3455 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_packagedata)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_package: Succeeded
NOTE: recipe libxinerama-1_1.1.6-r0: task do_configure: Succeeded
NOTE: Running task 3456 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_compile)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_package unihash changed to edb39742ece5ba969417511495e4b20c262aeff8a1438f9dd08243a87798041b
NOTE: recipe vala-0.56.19-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_packagedata: Started
NOTE: Setscene tasks completed
NOTE: Running task 3457 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_packagedata)
NOTE: recipe libxinerama-1_1.1.6-r0: task do_compile: Started
NOTE: Running task 3460 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.22.2.bb:do_write_config)
NOTE: recipe aspell-0.60.8.2-r0: task do_fetch: Succeeded
NOTE: Running task 3475 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_create_recipe_spdx)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_packagedata: Started
NOTE: recipe gtk4-4.22.2-r0: task do_write_config: Started
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_create_recipe_spdx: Started
NOTE: recipe gtk4-4.22.2-r0: task do_write_config: Succeeded
NOTE: Running task 3481 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_unpack)
NOTE: recipe desktop-file-utils-0.28-r0: task do_unpack: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_packagedata unihash changed to a72525fe8a983b0c5d7400964a4e7465161fca4a986548d01063d1485aae4be6
NOTE: recipe desktop-file-utils-0.28-r0: task do_unpack: Succeeded
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_compile: Succeeded
NOTE: Running task 3482 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_install)
NOTE: Running task 3500 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_patch)
NOTE: Running task 3502 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_create_recipe_spdx)
NOTE: Running task 3503 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libsoup/libsoup_3.6.6.bb:do_unpack)
NOTE: recipe desktop-file-utils-0.28-r0: task do_patch: Started
NOTE: recipe graphene-1.10.8-r0: task do_install: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_create_recipe_spdx: Started
NOTE: recipe libsoup-3.6.6-r0: task do_unpack: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_patch: Succeeded
NOTE: Running task 3513 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_create_recipe_spdx)
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_packagedata unihash changed to facdbf2fa96c5d92e6611c6161e766447cfd2bc2821e6839d433802637ef2e21
NOTE: recipe libxinerama-1_1.1.6-r0: task do_compile: Succeeded
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe libsoup-3.6.6-r0: task do_unpack: Succeeded
NOTE: recipe xkeyboard-config-2.47-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe flac-1.5.0-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3514 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_install)
NOTE: Running task 3515 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_install)
NOTE: Running task 3516 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libsoup/libsoup_3.6.6.bb:do_patch)
NOTE: Running task 3517 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_create_recipe_spdx)
NOTE: Running task 3518 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.4.bb:do_unpack)
NOTE: recipe libvorbis-1.3.7-r0: task do_create_recipe_spdx: Started
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libfyaml-0.9.4-r0: task do_unpack: Started
NOTE: Running task 3519 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/aspell/aspell_0.60.8.2.bb:do_unpack)
NOTE: recipe libxinerama-1_1.1.6-r0: task do_install: Started
NOTE: recipe libsoup-3.6.6-r0: task do_patch: Started
NOTE: recipe flac-1.5.0-r0: task do_install: Started
NOTE: recipe libfyaml-0.9.4-r0: task do_unpack: Succeeded
NOTE: Running task 3521 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.4.bb:do_patch)
NOTE: recipe aspell-0.60.8.2-r0: task do_unpack: Started
NOTE: recipe libfyaml-0.9.4-r0: task do_patch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe aspell-0.60.8.2-r0: task do_unpack: Succeeded
NOTE: Running task 3522 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/aspell/aspell_0.60.8.2.bb:do_patch)
NOTE: Running task 3531 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.26.2.bb:do_fetch)
NOTE: recipe libfyaml-0.9.4-r0: task do_patch: Succeeded
NOTE: Running task 3532 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.1.2.bb:do_fetch)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_package: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_install: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_package unihash changed to a3d9263e720b19c3206b79ebaa50b0459cbf982b0a327df7d35a8626f01cefa5
NOTE: recipe aspell-0.60.8.2-r0: task do_patch: Started
NOTE: recipe p11-kit-0.26.2-r0: task do_fetch: Started
NOTE: recipe appstream-1.1.2-r0: task do_fetch: Started
NOTE: recipe appstream-1.1.2-r0: task do_fetch: Succeeded
NOTE: recipe aspell-0.60.8.2-r0: task do_patch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3533 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_populate_sysroot)
NOTE: recipe libxinerama-1_1.1.6-r0: task do_install: Succeeded
NOTE: Running task 3534 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_packagedata)
NOTE: recipe libsoup-3.6.6-r0: task do_patch: Succeeded
NOTE: Running task 3535 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_populate_sysroot)
NOTE: Running task 3536 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libnotify/libnotify_0.8.8.bb:do_fetch)
NOTE: Running task 3538 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libsecret/libsecret_0.21.7.bb:do_fetch)
NOTE: Running task 3540 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/wpebackend-fdo_1.16.1.bb:do_fetch)
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_packagedata: Started
NOTE: recipe libxinerama-1_1.1.6-r0: task do_populate_sysroot: Started
NOTE: recipe libnotify-0.8.8-r0: task do_fetch: Started
NOTE: recipe wpebackend-fdo-1.16.1-r0: task do_fetch: Started
NOTE: recipe libsecret-0.21.7-r0: task do_fetch: Started
NOTE: recipe wpebackend-fdo-1.16.1-r0: task do_fetch: Succeeded
NOTE: Running task 3541 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/enchant/enchant2_2.8.15.bb:do_fetch)
NOTE: recipe enchant2-2.8.15-r0: task do_fetch: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_packagedata unihash changed to 4992744af8bc81c1abc459e2cc2d96a98bc4c57ee60ef9596ebe174da16b40e2
NOTE: recipe p11-kit-0.26.2-r0: task do_fetch: Succeeded
NOTE: recipe libnotify-0.8.8-r0: task do_fetch: Succeeded
NOTE: Running task 3548 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.25.bb:do_compile_ptest_base)
NOTE: recipe libsecret-0.21.7-r0: task do_fetch: Succeeded
NOTE: Running task 3549 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_package)
NOTE: recipe libxinerama-1_1.1.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3550 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_package)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_populate_sysroot unihash changed to 3dc27e92110edb57a502fd41f2dbbd10805ab339b885c5b563f1ceff6b1b8525
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxmlb-0.3.25-r0: task do_compile_ptest_base: Started
NOTE: recipe libxv-1.0.13-r0: task do_package: Started
NOTE: recipe libtheora-1.2.0-r0: task do_package: Started
NOTE: Setscene tasks completed
NOTE: Running task 3556 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_create_recipe_spdx)
NOTE: Running task 3572 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_create_recipe_spdx)
NOTE: Running task 3576 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/libwpe_1.16.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libxmlb-0.3.25-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3577 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.25.bb:do_install)
NOTE: recipe libwpe-1.16.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe dbus-1.16.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxmlb-0.3.25-r0: task do_install: Started
NOTE: recipe enchant2-2.8.15-r0: task do_fetch: Succeeded
NOTE: Running task 3579 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.21.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libwpe-1.16.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/libwpe_1.16.3.bb:do_deploy_source_date_epoch unihash changed to 98e7e3cee656fe1a03b9e5aeec327f95499440cc981304a62d2898e66e83a329
NOTE: recipe libxkbcommon-1.13.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libpsl-0.21.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Setscene tasks completed
NOTE: Running task 3580 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nghttp2/nghttp2_1.68.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 3583 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/libwpe_1.16.3.bb:do_generate_toolchain_file)
NOTE: Running task 3589 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nghttp2/nghttp2_1.68.1.bb:do_generate_toolchain_file)
NOTE: recipe json-glib-1.10.8-r0: task do_configure: Succeeded
NOTE: Running task 3590 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nghttp2/nghttp2_1.68.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe nghttp2-1.68.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libwpe-1.16.3-r0: task do_generate_toolchain_file: Started
NOTE: recipe libwebp-1.6.0-r0: task do_compile: Succeeded
NOTE: recipe nghttp2-1.68.1-r0: task do_generate_toolchain_file: Started
NOTE: Running task 3591 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_install)
NOTE: recipe nghttp2-1.68.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libwpe-1.16.3-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe tiff-4.7.1-r0: task do_configure: Succeeded
NOTE: recipe nghttp2-1.68.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libpsl-0.21.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3597 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/webkitgtk_2.50.6.bb:do_fetch)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.21.5.bb:do_deploy_source_date_epoch unihash changed to 1d3c9b68c800273faea9ab4a4e3567ae23d2213d281b57b574fae318bcf11a2d
NOTE: recipe webkitgtk-2.50.6-r0: task do_fetch: Started
NOTE: recipe webkitgtk-2.50.6-r0: task do_fetch: Succeeded
NOTE: recipe libwebp-1.6.0-r0: task do_install: Started
NOTE: Running task 3598 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb:do_compile)
NOTE: recipe nghttp2-1.68.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nghttp2/nghttp2_1.68.1.bb:do_deploy_source_date_epoch unihash changed to 48b4784184d8605b47c571dce6c08f6a885a690027289d5dddc2330ce49010af
NOTE: recipe tiff-4.7.1-r0: task do_compile: Started
NOTE: Setscene tasks completed
NOTE: recipe libxmlb-0.3.25-r0: task do_install: Succeeded
NOTE: Running task 3604 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_configure_ptest_base)
NOTE: Running task 3613 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_50.1.bb:do_fetch)
NOTE: Running task 3614 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_package)
NOTE: Running task 3615 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_package)
NOTE: recipe nghttp2-1.68.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3624 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.26.2.bb:do_unpack)
NOTE: Setscene tasks completed
NOTE: Running task 3625 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nghttp2/nghttp2_1.68.1.bb:do_configure)
NOTE: recipe gsettings-desktop-schemas-50.1-r0: task do_fetch: Started
NOTE: recipe json-glib-1.10.8-r0: task do_configure_ptest_base: Started
NOTE: recipe p11-kit-0.26.2-r0: task do_unpack: Started
NOTE: recipe libgudev-238-r0: task do_package: Started
NOTE: recipe libusb1-1.0.29-r0: task do_package: Started
NOTE: recipe nghttp2-1.68.1-r0: task do_configure: Started
NOTE: recipe json-glib-1.10.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3626 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_compile)
NOTE: recipe json-glib-1.10.8-r0: task do_compile: Started
NOTE: recipe gsettings-desktop-schemas-50.1-r0: task do_fetch: Succeeded
NOTE: Running task 3627 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.1.2.bb:do_unpack)
NOTE: recipe flac-1.5.0-r0: task do_install: Succeeded
NOTE: recipe appstream-1.1.2-r0: task do_unpack: Started
NOTE: Running task 3628 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_populate_sysroot)
NOTE: recipe flac-1.5.0-r0: task do_populate_sysroot: Started
NOTE: recipe appstream-1.1.2-r0: task do_unpack: Succeeded
NOTE: Running task 3629 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_package)
NOTE: recipe at-spi2-core-2.60.0-r0: task do_compile: Succeeded
NOTE: Running task 3630 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.0.bb:do_install)
NOTE: recipe flac-1.5.0-r0: task do_package: Started
NOTE: recipe libwebp-1.6.0-r0: task do_install: Succeeded
NOTE: Running task 3631 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_populate_sysroot)
NOTE: recipe at-spi2-core-2.60.0-r0: task do_install: Started
NOTE: recipe flac-1.5.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libwebp-1.6.0-r0: task do_populate_sysroot: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_populate_sysroot unihash changed to a2d69eaec95724e04611c769da74cac786920f0453fdad56529f4e553cf0ef22
NOTE: Setscene tasks completed
NOTE: Running task 3632 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsndfile1-1.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libwebp-1.6.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_populate_sysroot unihash changed to 2cd6a62212c72a00a5676ce901024aa457b6d105953cfe4cce6562cb9618ad42
NOTE: recipe p11-kit-0.26.2-r0: task do_unpack: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libtheora-1.2.0-r0: task do_package: Succeeded
NOTE: recipe libxv-1.0.13-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_package unihash changed to 3423fc0a57014fc3b27eeea8659a21da4592c7e6d4135eb9c738c6967b00599c
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_package unihash changed to bf35893a937deb8d25db71cdc4cc32872ae8fa450e006fc4ef2731d1dc2d8ab6
NOTE: Setscene tasks completed
NOTE: Running task 3633 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_configure)
NOTE: recipe vala-0.56.19-r0: task do_compile: Succeeded
NOTE: Running task 3634 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_packagedata)
NOTE: Running task 3635 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_packagedata)
NOTE: Running task 3636 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.19.bb:do_install)
NOTE: Running task 3637 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_package)
NOTE: Running task 3638 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libnotify/libnotify_0.8.8.bb:do_unpack)
NOTE: recipe libsndfile1-1.2.2-r0: task do_configure: Started
NOTE: recipe libxv-1.0.13-r0: task do_packagedata: Started
NOTE: recipe libtheora-1.2.0-r0: task do_packagedata: Started
NOTE: recipe libwebp-1.6.0-r0: task do_package: Started
NOTE: recipe libnotify-0.8.8-r0: task do_unpack: Started
NOTE: recipe vala-0.56.19-r0: task do_install: Started
NOTE: recipe libnotify-0.8.8-r0: task do_unpack: Succeeded
NOTE: Running task 3640 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libsecret/libsecret_0.21.7.bb:do_unpack)
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_package: Succeeded
NOTE: Running task 3641 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb:do_packagedata)
NOTE: recipe at-spi2-core-2.60.0-r0: task do_install: Succeeded
NOTE: recipe libsecret-0.21.7-r0: task do_unpack: Started
NOTE: Running task 3642 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.0.bb:do_populate_sysroot)
NOTE: recipe libxv-1.0.13-r0: task do_packagedata: Succeeded
NOTE: recipe libtheora-1.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe libgudev-238-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_packagedata unihash changed to e3afe005d362a849d718ee452ead4653c974fb37e1dcf6e107308c6422f729db
NOTE: recipe libsecret-0.21.7-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_packagedata: Started
NOTE: recipe at-spi2-core-2.60.0-r0: task do_populate_sysroot: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_packagedata unihash changed to 8f0dc3762872a712f3c1e4e2bd7854d908ba00ed4c9d7e4c21274ed0b8853f25
NOTE: Setscene tasks completed
NOTE: Running task 3643 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.0.bb:do_package)
NOTE: Running task 3645 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/wpebackend-fdo_1.16.1.bb:do_unpack)
NOTE: Running task 3646 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/enchant/enchant2_2.8.15.bb:do_unpack)
NOTE: Running task 3653 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.26.2.bb:do_patch)
NOTE: recipe nghttp2-1.68.1-r0: task do_configure: Succeeded
NOTE: Running task 3654 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nghttp2/nghttp2_1.68.1.bb:do_compile)
NOTE: recipe enchant2-2.8.15-r0: task do_unpack: Started
NOTE: recipe wpebackend-fdo-1.16.1-r0: task do_unpack: Started
NOTE: recipe p11-kit-0.26.2-r0: task do_patch: Started
NOTE: recipe at-spi2-core-2.60.0-r0: task do_package: Started
NOTE: recipe enchant2-2.8.15-r0: task do_unpack: Succeeded
NOTE: recipe nghttp2-1.68.1-r0: task do_compile: Started
NOTE: Running task 3655 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.1.2.bb:do_patch)
NOTE: recipe libusb1-1.0.29-r0: task do_package: Succeeded
NOTE: recipe p11-kit-0.26.2-r0: task do_patch: Succeeded
NOTE: recipe wpebackend-fdo-1.16.1-r0: task do_unpack: Succeeded
NOTE: Running task 3656 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libnotify/libnotify_0.8.8.bb:do_patch)
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3658 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libsecret/libsecret_0.21.7.bb:do_patch)
NOTE: Running task 3660 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/wpebackend-fdo_1.16.1.bb:do_patch)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb:do_packagedata unihash changed to 268e315945be66e2357df0875a5ca126cd47ee6f26523c42f905586e82cdbd3b
NOTE: recipe appstream-1.1.2-r0: task do_patch: Started
NOTE: recipe wpebackend-fdo-1.16.1-r0: task do_patch: Started
NOTE: recipe libnotify-0.8.8-r0: task do_patch: Started
NOTE: recipe libsecret-0.21.7-r0: task do_patch: Started
NOTE: Setscene tasks completed
NOTE: Running task 3661 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/enchant/enchant2_2.8.15.bb:do_patch)
NOTE: recipe libnotify-0.8.8-r0: task do_patch: Succeeded
NOTE: Running task 3663 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_create_recipe_spdx)
NOTE: recipe at-spi2-core-2.60.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3671 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_packagedata)
NOTE: recipe wpebackend-fdo-1.16.1-r0: task do_patch: Succeeded
NOTE: Running task 3672 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_packagedata)
NOTE: recipe libsecret-0.21.7-r0: task do_patch: Succeeded
NOTE: Running task 3674 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb:do_create_recipe_spdx)
NOTE: recipe enchant2-2.8.15-r0: task do_patch: Started
NOTE: recipe appstream-1.1.2-r0: task do_patch: Succeeded
NOTE: Running task 3684 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_create_recipe_spdx)
NOTE: recipe flac-1.5.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe libgudev-238-r0: task do_packagedata: Started
NOTE: recipe enchant2-2.8.15-r0: task do_patch: Succeeded
NOTE: Running task 3686 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_create_recipe_spdx)
NOTE: recipe libusb1-1.0.29-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_create_recipe_spdx: Started
NOTE: recipe flac-1.5.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe orc-0.4.42-r0: task do_create_recipe_spdx: Started
NOTE: Running task 3688 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_package)
NOTE: recipe libxinerama-1_1.1.6-r0: task do_package: Started
NOTE: recipe libgudev-238-r0: task do_packagedata: Succeeded
NOTE: recipe libusb1-1.0.29-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_packagedata unihash changed to 79eb3794c03373e51a8ba98fec87c7f4ed777249a90516c8a56878a079e419ee
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe orc-0.4.42-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_create_recipe_spdx: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_packagedata unihash changed to 48fec9cf1fb20b61a3f670e4837806e276185fd93cc2f9dd63fed23c4eb1b7ff
NOTE: Setscene tasks completed
NOTE: Running task 3689 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_package)
NOTE: Running task 3699 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gcr/gcr_4.4.0.1.bb:do_fetch)
NOTE: Running task 3700 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libadwaita/libadwaita_1.9.0.bb:do_fetch)
NOTE: Running task 3701 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libportal/libportal_0.9.1.bb:do_fetch)
NOTE: Running task 3702 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_fetch)
NOTE: recipe vala-0.56.19-r0: task do_install: Succeeded
NOTE: Running task 3703 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.19.bb:do_populate_sysroot)
NOTE: recipe libadwaita-1.9.0-r0: task do_fetch: Started
NOTE: recipe graphene-1.10.8-r0: task do_package: Started
NOTE: recipe libportal-0.9.1-r0: task do_fetch: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_fetch: Started
NOTE: recipe gcr-4.4.0.1-r0: task do_fetch: Started
NOTE: recipe libadwaita-1.9.0-r0: task do_fetch: Succeeded
NOTE: Running task 3704 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.19.bb:do_package)
NOTE: recipe libdazzle-3.44.0-r0: task do_fetch: Succeeded
NOTE: recipe gcr-4.4.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 3705 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_fetch)
NOTE: Running task 3706 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/webkitgtk_2.50.6.bb:do_unpack)
NOTE: recipe vala-0.56.19-r0: task do_populate_sysroot: Started
NOTE: recipe vala-0.56.19-r0: task do_package: Started
NOTE: recipe libportal-0.9.1-r0: task do_fetch: Succeeded
NOTE: recipe libhandy-1.8.3-r0: task do_fetch: Started
NOTE: recipe webkitgtk-2.50.6-r0: task do_unpack: Started
NOTE: Running task 3710 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_create_recipe_spdx)
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe libhandy-1.8.3-r0: task do_fetch: Succeeded
NOTE: Running task 3713 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_deploy_source_date_epoch)
NOTE: recipe desktop-file-utils-0.28-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe flac-1.5.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_package unihash changed to 7a94242da82fa4a487e6a5ec311bb3b3b551574a7357d8dc15d39f684ccb4b73
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe nghttp2-1.68.1-r0: task do_compile: Succeeded
NOTE: recipe desktop-file-utils-0.28-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3714 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_packagedata)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_deploy_source_date_epoch unihash changed to 73e76bf06240a91e0b6c22691db78d3dde06dfba8b7b2bd2dc4d89c99b409f41
NOTE: Setscene tasks completed
NOTE: Running task 3715 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nghttp2/nghttp2_1.68.1.bb:do_install)
NOTE: Running task 3716 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_create_spdx)
NOTE: Running task 3719 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_create_spdx)
NOTE: recipe vala-0.56.19-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3720 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libsoup/libsoup_3.6.6.bb:do_deploy_source_date_epoch)
NOTE: recipe flac-1.5.0-r0: task do_packagedata: Started
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_create_spdx: Started
NOTE: recipe nghttp2-1.68.1-r0: task do_install: Started
NOTE: recipe libogg-1.3.6-r0: task do_create_spdx: Started
NOTE: recipe libsoup-3.6.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe json-glib-1.10.8-r0: task do_compile: Succeeded
NOTE: Running task 3721 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_write_config)
NOTE: recipe desktop-file-utils-0.28-r0: task do_write_config: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_write_config: Succeeded
NOTE: recipe flac-1.5.0-r0: task do_packagedata: Succeeded
NOTE: recipe libwebp-1.6.0-r0: task do_package: Succeeded
NOTE: Running task 3722 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_prepare_recipe_sysroot)
NOTE: recipe nghttp2-1.68.1-r0: task do_install: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_packagedata unihash changed to 83b777d67bae489b1a2e78bee0279607edc26636d3fde7213d881757e6327d82
NOTE: recipe libsoup-3.6.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libogg-1.3.6-r0: task do_create_spdx: Succeeded
NOTE: recipe desktop-file-utils-0.28-r0: task do_prepare_recipe_sysroot: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_package unihash changed to fd50147e658fd0bb375c7f80177a284b09cdff1a887e9b334a606f64d02949c3
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libsoup/libsoup_3.6.6.bb:do_deploy_source_date_epoch unihash changed to 2b688f747a47bfaa31d6dd881e0fb6471b3c4533cdd4fe77fe32c0cf8cefcae1
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_create_spdx: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3723 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_packagedata)
NOTE: Running task 3724 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nghttp2/nghttp2_1.68.1.bb:do_populate_sysroot)
NOTE: Running task 3725 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 3726 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/aspell/aspell_0.60.8.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 3727 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libsoup/libsoup_3.6.6.bb:do_write_config)
NOTE: Running task 3728 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_create_recipe_spdx)
NOTE: recipe libwebp-1.6.0-r0: task do_packagedata: Started
NOTE: recipe libfyaml-0.9.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe nghttp2-1.68.1-r0: task do_populate_sysroot: Started
NOTE: recipe libsoup-3.6.6-r0: task do_write_config: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_create_recipe_spdx: Started
NOTE: recipe aspell-0.60.8.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsoup-3.6.6-r0: task do_write_config: Succeeded
NOTE: Running task 3729 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_50.1.bb:do_unpack)
NOTE: recipe gsettings-desktop-schemas-50.1-r0: task do_unpack: Started
NOTE: recipe aspell-0.60.8.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe desktop-file-utils-0.28-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/aspell/aspell_0.60.8.2.bb:do_deploy_source_date_epoch unihash changed to 6e3807d231f808ef3b179b6b49da32c43284c1dc49bc44c9f4c0f6ea2a060b68
NOTE: recipe libfyaml-0.9.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gsettings-desktop-schemas-50.1-r0: task do_unpack: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.4.bb:do_deploy_source_date_epoch unihash changed to 463454d62f8b28b7dd9633223a53053c39330c45301bda688395e5a564d1cff0
NOTE: recipe libwebp-1.6.0-r0: task do_packagedata: Succeeded
NOTE: recipe nghttp2-1.68.1-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_packagedata unihash changed to 8209c81046e6cb5047a83246084ad1d609c7a5fe90083936acdfdece3410a8b5
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nghttp2/nghttp2_1.68.1.bb:do_populate_sysroot unihash changed to d607e24003039ed50b436a3a6405d2975cb3eff759d656db80cb605c3ea62646
NOTE: recipe libxinerama-1_1.1.6-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_package unihash changed to a84d265e1a1a33569ddd81bc07da24e848bdf6b4df133d5beb9d2019d26f23ed
NOTE: recipe graphene-1.10.8-r0: task do_package: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3730 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_packagedata)
NOTE: Running task 3731 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_packagedata)
NOTE: Running task 3732 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_configure)
NOTE: Running task 3733 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3734 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/aspell/aspell_0.60.8.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3735 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.25.bb:do_install_ptest_base)
NOTE: Running task 3736 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_create_recipe_spdx)
NOTE: Running task 3737 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.0.bb:do_create_recipe_spdx)
NOTE: Running task 3738 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_50.1.bb:do_patch)
NOTE: recipe libxinerama-1_1.1.6-r0: task do_packagedata: Started
NOTE: recipe tiff-4.7.1-r0: task do_compile: Succeeded
NOTE: Running task 3739 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb:do_install)
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Started
NOTE: recipe libfyaml-0.9.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_configure: Started
NOTE: recipe aspell-0.60.8.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_create_recipe_spdx: Started
NOTE: recipe gsettings-desktop-schemas-50.1-r0: task do_patch: Started
NOTE: recipe at-spi2-core-2.60.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxmlb-0.3.25-r0: task do_install_ptest_base: Started
NOTE: recipe gsettings-desktop-schemas-50.1-r0: task do_patch: Succeeded
NOTE: Running task 3767 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_create_recipe_spdx)
NOTE: recipe tiff-4.7.1-r0: task do_install: Started
NOTE: recipe libxmlb-0.3.25-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3783 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_create_recipe_spdx)
NOTE: recipe libfyaml-0.9.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3784 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.4.bb:do_configure)
NOTE: recipe aspell-0.60.8.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe at-spi2-core-2.60.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libxinerama-1_1.1.6-r0: task do_packagedata: Succeeded
NOTE: recipe librsvg-2.61.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3785 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/aspell/aspell_0.60.8.2.bb:do_configure)
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_packagedata unihash changed to d7d8da1660af99de224c670475940ad1fed04064a93bc3dd495c22e5636fb574
NOTE: recipe libxcursor-1_1.2.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe libfyaml-0.9.4-r0: task do_configure: Started
NOTE: recipe aspell-0.60.8.2-r0: task do_configure: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_packagedata unihash changed to 21e69c9bf010f4d1fbc7aa2ae950521cf0dc66cf283faab99418a8534d212fdc
NOTE: recipe webkitgtk-2.50.6-r0: task do_unpack: Succeeded
NOTE: recipe libxcursor-1_1.2.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe librsvg-2.61.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3786 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/webkitgtk_2.50.6.bb:do_patch)
NOTE: Running task 3837 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_create_spdx)
NOTE: Running task 3838 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gcr/gcr_4.4.0.1.bb:do_unpack)
NOTE: Running task 3839 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libadwaita/libadwaita_1.9.0.bb:do_unpack)
NOTE: Running task 3840 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libportal/libportal_0.9.1.bb:do_unpack)
NOTE: Running task 3841 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_unpack)
NOTE: Running task 3842 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_unpack)
NOTE: recipe webkitgtk-2.50.6-r0: task do_patch: Started
NOTE: recipe fribidi-1.0.16-r0: task do_create_spdx: Started
NOTE: recipe libadwaita-1.9.0-r0: task do_unpack: Started
NOTE: recipe libportal-0.9.1-r0: task do_unpack: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_unpack: Started
NOTE: recipe gcr-4.4.0.1-r0: task do_unpack: Started
NOTE: recipe libhandy-1.8.3-r0: task do_unpack: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_unpack: Succeeded
NOTE: recipe gcr-4.4.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 3843 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_create_spdx)
NOTE: Running task 3847 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gcr/gcr_4.4.0.1.bb:do_patch)
NOTE: recipe libadwaita-1.9.0-r0: task do_unpack: Succeeded
NOTE: Running task 3848 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libadwaita/libadwaita_1.9.0.bb:do_patch)
NOTE: recipe libxi-1_1.8.2-r0: task do_create_spdx: Started
NOTE: recipe gcr-4.4.0.1-r0: task do_patch: Started
NOTE: recipe fribidi-1.0.16-r0: task do_create_spdx: Succeeded
NOTE: recipe libadwaita-1.9.0-r0: task do_patch: Started
NOTE: Running task 3849 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_patch)
NOTE: recipe gcr-4.4.0.1-r0: task do_patch: Succeeded
NOTE: Running task 3861 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_compile_ptest_base)
NOTE: recipe libadwaita-1.9.0-r0: task do_patch: Succeeded
NOTE: Running task 3867 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_create_recipe_spdx)
NOTE: recipe webkitgtk-2.50.6-r0: task do_patch: Succeeded
NOTE: Running task 3868 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_create_recipe_spdx)
NOTE: recipe libdazzle-3.44.0-r0: task do_patch: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_patch: Succeeded
NOTE: Running task 3869 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_create_recipe_spdx)
NOTE: recipe libglu-2_9.0.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe json-glib-1.10.8-r0: task do_compile_ptest_base: Started
NOTE: recipe libxv-1.0.13-r0: task do_create_recipe_spdx: Started
NOTE: recipe json-glib-1.10.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3870 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_install)
NOTE: recipe libtheora-1.2.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe libportal-0.9.1-r0: task do_unpack: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 3871 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libportal/libportal_0.9.1.bb:do_patch)
NOTE: Running task 3877 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_create_spdx)
NOTE: recipe libhandy-1.8.3-r0: task do_unpack: Succeeded
NOTE: Running task 3878 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_patch)
NOTE: recipe libglu-2_9.0.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe json-glib-1.10.8-r0: task do_install: Started
NOTE: recipe libportal-0.9.1-r0: task do_patch: Started
NOTE: Running task 3889 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_create_spdx)
NOTE: recipe libxft-1_2.3.9-r0: task do_create_spdx: Started
NOTE: recipe libxv-1.0.13-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libhandy-1.8.3-r0: task do_patch: Started
NOTE: recipe libtheora-1.2.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3900 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.25.bb:do_populate_sysroot)
NOTE: recipe libportal-0.9.1-r0: task do_patch: Succeeded
NOTE: Running task 3904 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.26.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 3905 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe shared-mime-info-2.4-r0: task do_create_spdx: Started
NOTE: recipe libhandy-1.8.3-r0: task do_patch: Succeeded
NOTE: Running task 3906 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libnotify/libnotify_0.8.8.bb:do_deploy_source_date_epoch)
NOTE: recipe p11-kit-0.26.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe appstream-1.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxmlb-0.3.25-r0: task do_populate_sysroot: Started
NOTE: recipe libnotify-0.8.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_create_spdx: Succeeded
NOTE: recipe desktop-file-utils-0.28-r0: task do_configure: Succeeded
NOTE: Running task 3908 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libsecret/libsecret_0.21.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 3909 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_compile)
NOTE: recipe appstream-1.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe p11-kit-0.26.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.1.2.bb:do_deploy_source_date_epoch unihash changed to 1fc129d39c2dc93bbc47cd63df3b2257b9c647039727b93f101a2d7d5a40abb8
NOTE: recipe libnotify-0.8.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsecret-0.21.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_compile: Started
NOTE: recipe vala-0.56.19-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.26.2.bb:do_deploy_source_date_epoch unihash changed to 03494a06ef70538a94edb19fcb4a88aa6b3013c72d4defb4b8cb8edb7830416f
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libnotify/libnotify_0.8.8.bb:do_deploy_source_date_epoch unihash changed to 76f0c48f8ff622abdba61a48f0770e9256539bea974664e26f760974330453dd
NOTE: Setscene tasks completed
NOTE: Running task 3910 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.19.bb:do_packagedata)
NOTE: Running task 3912 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/wpebackend-fdo_1.16.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 3913 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/enchant/enchant2_2.8.15.bb:do_deploy_source_date_epoch)
NOTE: Running task 3920 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.26.2.bb:do_write_config)
NOTE: recipe libxmlb-0.3.25-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3921 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.26.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsecret-0.21.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vala-0.56.19-r0: task do_packagedata: Started
NOTE: recipe enchant2-2.8.15-r0: task do_deploy_source_date_epoch: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libsecret/libsecret_0.21.7.bb:do_deploy_source_date_epoch unihash changed to 117fb312868ee13b7e3a02db275f0962e6f79685fe755933bbd96de6230813f2
NOTE: recipe wpebackend-fdo-1.16.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe p11-kit-0.26.2-r0: task do_write_config: Started
NOTE: recipe p11-kit-0.26.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe json-glib-1.10.8-r0: task do_install: Succeeded
NOTE: recipe p11-kit-0.26.2-r0: task do_write_config: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3922 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.1.2.bb:do_write_config)
NOTE: Running task 3923 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libnotify/libnotify_0.8.8.bb:do_write_config)
NOTE: Running task 3924 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libnotify/libnotify_0.8.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe appstream-1.1.2-r0: task do_write_config: Started
NOTE: recipe libnotify-0.8.8-r0: task do_write_config: Started
NOTE: recipe enchant2-2.8.15-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe wpebackend-fdo-1.16.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/enchant/enchant2_2.8.15.bb:do_deploy_source_date_epoch unihash changed to 3013f94b2def9adaa4cda19c9ba69a702c9ee3f172c8dd337ece9768ae9a97f4
NOTE: recipe libnotify-0.8.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe appstream-1.1.2-r0: task do_write_config: Succeeded
NOTE: recipe vala-0.56.19-r0: task do_packagedata: Succeeded
NOTE: recipe libnotify-0.8.8-r0: task do_write_config: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/wpebackend-fdo_1.16.1.bb:do_deploy_source_date_epoch unihash changed to 12d2763f7a2e569f6b88a141910f976e663ae120d9a8de337a7cbb9c5478ec73
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.19.bb:do_packagedata unihash changed to b0363053e719b48817d43f617ffc85fc68f5d5ad517054ffca7674df9c0ae59e
NOTE: recipe p11-kit-0.26.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3926 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libsecret/libsecret_0.21.7.bb:do_write_config)
NOTE: Running task 3927 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libsecret/libsecret_0.21.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3929 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/wpebackend-fdo_1.16.1.bb:do_write_config)
NOTE: Running task 3930 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.26.2.bb:do_configure)
NOTE: Running task 3937 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_create_recipe_spdx)
NOTE: Running task 3951 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_create_recipe_spdx)
NOTE: recipe shared-mime-info-2.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 3952 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.2.bb:do_create_recipe_spdx)
NOTE: recipe libsecret-0.21.7-r0: task do_write_config: Started
NOTE: recipe libsecret-0.21.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wpebackend-fdo-1.16.1-r0: task do_write_config: Started
NOTE: recipe p11-kit-0.26.2-r0: task do_configure: Started
NOTE: recipe libwebp-1.6.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe libical-3.0.20-r0: task do_create_recipe_spdx: Started
NOTE: recipe libsecret-0.21.7-r0: task do_write_config: Succeeded
NOTE: Running task 3953 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.19.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-plugins-base-1.28.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe wpebackend-fdo-1.16.1-r0: task do_write_config: Succeeded
NOTE: Running task 3954 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_create_spdx)
NOTE: recipe vala-0.56.19-r0: task do_create_spdx: Started
NOTE: recipe libnotify-0.8.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.28-r0: task do_compile: Succeeded
NOTE: Running task 3955 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libnotify/libnotify_0.8.8.bb:do_configure)
NOTE: Running task 3956 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_install)
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_create_spdx: Started
NOTE: recipe libwebp-1.6.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libical-3.0.20-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3961 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nghttp2/nghttp2_1.68.1.bb:do_package)
NOTE: Running task 3965 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/epiphany/epiphany_50.4.bb:do_recipe_qa)
NOTE: recipe gstreamer1.0-plugins-base-1.28.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3968 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_create_recipe_spdx)
NOTE: recipe libnotify-0.8.8-r0: task do_configure: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_install: Started
NOTE: recipe epiphany-50.4-r0: task do_recipe_qa: Started
NOTE: recipe nghttp2-1.68.1-r0: task do_package: Started
NOTE: recipe libgudev-238-r0: task do_create_recipe_spdx: Started
NOTE: recipe libsecret-0.21.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe epiphany-50.4-r0: task do_recipe_qa: Succeeded
NOTE: Running task 3969 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/epiphany/epiphany_50.4.bb:do_fetch)
NOTE: Running task 3970 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libsecret/libsecret_0.21.7.bb:do_configure)
NOTE: recipe libgudev-238-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe epiphany-50.4-r0: task do_fetch: Started
NOTE: Running task 3971 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_create_recipe_spdx)
NOTE: recipe epiphany-50.4-r0: task do_fetch: Succeeded
NOTE: Running task 3972 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.2.bb:do_create_recipe_spdx)
NOTE: recipe libsecret-0.21.7-r0: task do_configure: Started
NOTE: recipe libusb1-1.0.29-r0: task do_create_recipe_spdx: Started
NOTE: recipe sbc-2.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe vala-0.56.19-r0: task do_create_spdx: Succeeded
NOTE: Running task 3973 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.86.bb:do_create_recipe_spdx)
NOTE: recipe bluez5-5.86-r0: task do_create_recipe_spdx: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_install: Succeeded
NOTE: Running task 3974 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_populate_sysroot)
NOTE: recipe libusb1-1.0.29-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe sbc-2.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3977 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_50.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 3981 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_package)
NOTE: recipe desktop-file-utils-0.28-r0: task do_populate_sysroot: Started
NOTE: recipe gsettings-desktop-schemas-50.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_package: Started
NOTE: recipe bluez5-5.86-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3989 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_50.1.bb:do_write_config)
NOTE: recipe gsettings-desktop-schemas-50.1-r0: task do_write_config: Started
NOTE: recipe gsettings-desktop-schemas-50.1-r0: task do_write_config: Succeeded
NOTE: Running task 3990 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_50.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-core-2.60.0-r0: task do_package: Succeeded
NOTE: recipe gsettings-desktop-schemas-50.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_50.1.bb:do_deploy_source_date_epoch unihash changed to bc675e038be9121061d7132c15861994daaf60372fc56300196f30d326765702
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_create_spdx: Succeeded
NOTE: recipe gsettings-desktop-schemas-50.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_populate_sysroot: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3991 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.0.bb:do_packagedata)
NOTE: Running task 3993 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_create_spdx)
NOTE: Running task 4019 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_create_recipe_spdx)
NOTE: Running task 4020 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb:do_create_recipe_spdx)
NOTE: recipe at-spi2-core-2.60.0-r0: task do_packagedata: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_create_spdx: Started
NOTE: recipe libxinerama-1_1.1.6-r0: task do_create_recipe_spdx: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.28.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe nghttp2-1.68.1-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nghttp2/nghttp2_1.68.1.bb:do_package unihash changed to 3bebcaa5c6388e300e82c1b504c11483f9ef6ba1359eef477496babb1dd8a7a6
NOTE: recipe libxinerama-1_1.1.6-r0: task do_create_recipe_spdx: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4021 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nghttp2/nghttp2_1.68.1.bb:do_packagedata)
NOTE: Running task 4022 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_create_recipe_spdx)
NOTE: recipe gstreamer1.0-plugins-bad-1.28.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 4023 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb:do_create_recipe_spdx)
NOTE: recipe tiff-4.7.1-r0: task do_install: Succeeded
NOTE: recipe nghttp2-1.68.1-r0: task do_packagedata: Started
NOTE: recipe gsettings-desktop-schemas-50.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4024 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb:do_populate_sysroot)
NOTE: recipe graphene-1.10.8-r0: task do_create_recipe_spdx: Started
NOTE: recipe tiff-4.7.1-r0: task do_create_recipe_spdx: Started
NOTE: Running task 4025 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb:do_package)
NOTE: recipe tiff-4.7.1-r0: task do_populate_sysroot: Started
NOTE: recipe tiff-4.7.1-r0: task do_package: Started
NOTE: recipe graphene-1.10.8-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe xkeyboard-config-2.47-r0: task do_create_spdx: Succeeded
NOTE: recipe tiff-4.7.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe at-spi2-core-2.60.0-r0: task do_packagedata: Succeeded
NOTE: Running task 4026 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_50.1.bb:do_configure)
NOTE: recipe nghttp2-1.68.1-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.0.bb:do_packagedata unihash changed to b32144295b2c8e59e463d6d29f91f7fea157f866e5bca58c4008f71f54006a46
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nghttp2/nghttp2_1.68.1.bb:do_packagedata unihash changed to a3e1bccc265959c5ccc1a102c2d9553b1fffbe69072f0899fe5b7c8cd4634705
NOTE: recipe gsettings-desktop-schemas-50.1-r0: task do_configure: Started
NOTE: Setscene tasks completed
NOTE: Running task 4027 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_create_spdx)
NOTE: Running task 4053 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gcr/gcr_4.4.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe tiff-4.7.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4054 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libadwaita/libadwaita_1.9.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 4055 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libportal/libportal_0.9.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 4056 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_create_spdx: Started
NOTE: recipe libadwaita-1.9.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gcr-4.4.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libportal-0.9.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gcr-4.4.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libdazzle-3.44.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libportal-0.9.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libadwaita-1.9.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gcr/gcr_4.4.0.1.bb:do_deploy_source_date_epoch unihash changed to 203d0c99e051b6dd5f35484018a2f4b2aaf0b74e67c4c0a76d1218d4a92c36a5
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_deploy_source_date_epoch unihash changed to f184214859fc5c83d18501f2f43a7acffac4a508a7ce84dad1b5f0f216caf9f8
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libadwaita/libadwaita_1.9.0.bb:do_deploy_source_date_epoch unihash changed to 5433a6268b13f2313d36ba1ce2892dd82cc301067326a17e67cbd8d51ff4a927
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libportal/libportal_0.9.1.bb:do_deploy_source_date_epoch unihash changed to a7f3fb3a30b4ddb9d78f89d229455bf6f9347c75d043b4344951dc7776889e1b
NOTE: recipe libxkbcommon-1.13.1-r0: task do_create_spdx: Succeeded
NOTE: recipe libnotify-0.8.8-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4057 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libnotify/libnotify_0.8.8.bb:do_compile)
NOTE: Running task 4058 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 4059 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/webkitgtk_2.50.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 4062 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx)
NOTE: Running task 4066 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/epiphany/epiphany_50.4.bb:do_unpack)
NOTE: Running task 4067 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gcr/gcr_4.4.0.1.bb:do_write_config)
NOTE: recipe libnotify-0.8.8-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Started
NOTE: recipe libhandy-1.8.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe webkitgtk-2.50.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_package: Succeeded
NOTE: recipe epiphany-50.4-r0: task do_unpack: Started
NOTE: recipe gcr-4.4.0.1-r0: task do_write_config: Started
NOTE: Running task 4068 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_packagedata)
NOTE: recipe gcr-4.4.0.1-r0: task do_write_config: Succeeded
NOTE: Running task 4069 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libadwaita/libadwaita_1.9.0.bb:do_write_config)
NOTE: recipe desktop-file-utils-0.28-r0: task do_packagedata: Started
NOTE: recipe libadwaita-1.9.0-r0: task do_write_config: Started
NOTE: recipe libhandy-1.8.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe webkitgtk-2.50.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_deploy_source_date_epoch unihash changed to 864b03728d2ae97ab71c6441f5cd7ad8eb7d5801eea62337dfb81f8f7689353a
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Succeeded
NOTE: recipe libadwaita-1.9.0-r0: task do_write_config: Succeeded
NOTE: recipe p11-kit-0.26.2-r0: task do_configure: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/webkitgtk_2.50.6.bb:do_deploy_source_date_epoch unihash changed to ce3e67bb21281239e016f6b4476ab748d7984175a176c14591354f7de40a1751
NOTE: recipe epiphany-50.4-r0: task do_unpack: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4070 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.26.2.bb:do_compile)
NOTE: Running task 4071 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_create_spdx)
NOTE: Running task 4072 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libportal/libportal_0.9.1.bb:do_write_config)
NOTE: Running task 4073 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_write_config)
NOTE: Running task 4074 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_write_config)
NOTE: Running task 4075 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/webkitgtk_2.50.6.bb:do_generate_toolchain_file)
NOTE: recipe desktop-file-utils-0.28-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_packagedata unihash changed to bc41bfe3782324f02684b879f0604f2a6c07356097658f7126cde09315729c7a
NOTE: Setscene tasks completed
NOTE: Running task 4076 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_install_ptest_base)
NOTE: recipe p11-kit-0.26.2-r0: task do_compile: Started
NOTE: recipe libportal-0.9.1-r0: task do_write_config: Started
NOTE: recipe libhandy-1.8.3-r0: task do_write_config: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_write_config: Started
NOTE: recipe webkitgtk-2.50.6-r0: task do_generate_toolchain_file: Started
NOTE: recipe dbus-1.16.2-r0: task do_create_spdx: Started
NOTE: recipe libportal-0.9.1-r0: task do_write_config: Succeeded
NOTE: recipe libhandy-1.8.3-r0: task do_write_config: Succeeded
NOTE: Running task 4079 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_create_spdx)
NOTE: recipe libdazzle-3.44.0-r0: task do_write_config: Succeeded
NOTE: recipe webkitgtk-2.50.6-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 4080 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_create_spdx)
NOTE: Running task 4081 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb:do_create_recipe_spdx)
NOTE: recipe json-glib-1.10.8-r0: task do_install_ptest_base: Started
NOTE: Running task 4082 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/epiphany/epiphany_50.4.bb:do_patch)
NOTE: recipe libsecret-0.21.7-r0: task do_configure: Succeeded
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_create_spdx: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx: Started
NOTE: Running task 4083 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libsecret/libsecret_0.21.7.bb:do_compile)
NOTE: recipe json-glib-1.10.8-r0: task do_install_ptest_base: Succeeded
NOTE: recipe gtk+3-3.24.52-r0: task do_create_recipe_spdx: Started
NOTE: recipe epiphany-50.4-r0: task do_patch: Started
NOTE: Running task 4095 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.25.bb:do_package)
NOTE: recipe libsecret-0.21.7-r0: task do_compile: Started
NOTE: recipe libxmlb-0.3.25-r0: task do_package: Started
NOTE: recipe epiphany-50.4-r0: task do_patch: Succeeded
NOTE: Running task 4107 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.22.2.bb:do_create_recipe_spdx)
NOTE: recipe gtk+3-3.24.52-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 4112 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_create_spdx)
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx: Succeeded
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_create_spdx: Succeeded
NOTE: recipe gtk4-4.22.2-r0: task do_create_recipe_spdx: Started
NOTE: Running task 4113 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_create_spdx)
NOTE: recipe dbus-1.16.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 4114 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb:do_create_spdx)
NOTE: recipe libxtst-1_1.2.5-r0: task do_create_spdx: Started
NOTE: recipe icu-78.3-r0: task do_compile: Succeeded
NOTE: Running task 4115 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_compile_ptest_base)
NOTE: Running task 4120 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_create_spdx)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_create_spdx: Started
NOTE: recipe icu-78.3-r0: task do_compile_ptest_base: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_create_spdx: Started
NOTE: recipe gtk4-4.22.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 4123 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_create_spdx)
NOTE: recipe libxtst-1_1.2.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 4124 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.0.bb:do_create_spdx)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_create_spdx: Succeeded
NOTE: recipe orc-0.4.42-r0: task do_create_spdx: Started
NOTE: Running task 4137 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_create_spdx)
NOTE: recipe at-spi2-core-2.60.0-r0: task do_create_spdx: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 4155 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_package)
NOTE: recipe flac-1.5.0-r0: task do_create_spdx: Started
NOTE: recipe gsettings-desktop-schemas-50.1-r0: task do_configure: Succeeded
NOTE: Running task 4156 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_50.1.bb:do_compile)
NOTE: recipe json-glib-1.10.8-r0: task do_package: Started
NOTE: recipe gsettings-desktop-schemas-50.1-r0: task do_compile: Started
NOTE: recipe orc-0.4.42-r0: task do_create_spdx: Succeeded
NOTE: Running task 4162 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/epiphany/epiphany_50.4.bb:do_deploy_source_date_epoch)
NOTE: recipe epiphany-50.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe flac-1.5.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 4165 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/libwpe_1.16.3.bb:do_create_recipe_spdx)
NOTE: recipe libwpe-1.16.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe epiphany-50.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 4170 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.21.5.bb:do_create_recipe_spdx)
NOTE: recipe libpsl-0.21.5-r0: task do_create_recipe_spdx: Started
NOTE: recipe libwpe-1.16.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 4171 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nghttp2/nghttp2_1.68.1.bb:do_create_recipe_spdx)
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 4186 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_populate_sysroot)
NOTE: recipe gsettings-desktop-schemas-50.1-r0: task do_compile: Succeeded
NOTE: Running task 4187 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_50.1.bb:do_install)
NOTE: recipe nghttp2-1.68.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe at-spi2-core-2.60.0-r0: task do_create_spdx: Succeeded
NOTE: recipe aspell-0.60.8.2-r0: task do_configure: Succeeded
NOTE: Running task 4203 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/epiphany/epiphany_50.4.bb:do_write_config)
NOTE: Running task 4204 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/aspell/aspell_0.60.8.2.bb:do_compile)
NOTE: recipe json-glib-1.10.8-r0: task do_populate_sysroot: Started
NOTE: recipe libpsl-0.21.5-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 4211 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_create_spdx)
NOTE: recipe aspell-0.60.8.2-r0: task do_compile: Started
NOTE: recipe epiphany-50.4-r0: task do_write_config: Started
NOTE: recipe gsettings-desktop-schemas-50.1-r0: task do_install: Started
NOTE: recipe nghttp2-1.68.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 4212 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_create_spdx)
NOTE: recipe epiphany-50.4-r0: task do_write_config: Succeeded
NOTE: Running task 4213 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_create_spdx)
NOTE: recipe libxv-1.0.13-r0: task do_create_spdx: Started
NOTE: recipe libtheora-1.2.0-r0: task do_create_spdx: Started
NOTE: recipe libwebp-1.6.0-r0: task do_create_spdx: Started
NOTE: recipe json-glib-1.10.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxv-1.0.13-r0: task do_create_spdx: Succeeded
NOTE: Running task 4222 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.38.1.bb:do_fetch)
NOTE: Running task 4225 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_fetch)
NOTE: recipe libtheora-1.2.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 4228 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_create_recipe_spdx)
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_fetch: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_fetch: Started
NOTE: recipe libwebp-1.6.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 4229 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libsoup/libsoup_3.6.6.bb:do_create_recipe_spdx)
NOTE: recipe desktop-file-utils-0.28-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_fetch: Succeeded
NOTE: Running task 4232 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_create_spdx)
NOTE: recipe tiff-4.7.1-r0: task do_package: Succeeded
NOTE: recipe libsoup-3.6.6-r0: task do_create_recipe_spdx: Started
NOTE: Running task 4233 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb:do_packagedata)
NOTE: recipe gsettings-desktop-schemas-50.1-r0: task do_install: Succeeded
NOTE: recipe libgudev-238-r0: task do_create_spdx: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 4234 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_50.1.bb:do_package)
NOTE: Running task 4235 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_50.1.bb:do_populate_sysroot)
NOTE: recipe tiff-4.7.1-r0: task do_packagedata: Started
NOTE: recipe libxmlb-0.3.25-r0: task do_package: Succeeded
NOTE: Running task 4236 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.25.bb:do_packagedata)
NOTE: recipe gsettings-desktop-schemas-50.1-r0: task do_populate_sysroot: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_configure: Succeeded
NOTE: recipe gsettings-desktop-schemas-50.1-r0: task do_package: Started
NOTE: Setscene tasks completed
NOTE: Running task 4237 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_compile)
NOTE: recipe libsoup-3.6.6-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libxmlb-0.3.25-r0: task do_packagedata: Started
NOTE: Running task 4238 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_create_spdx)
NOTE: recipe libgudev-238-r0: task do_create_spdx: Succeeded
NOTE: Running task 4239 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_create_spdx)
NOTE: recipe tiff-4.7.1-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb:do_packagedata unihash changed to 7fe783ffa641d4c012447755b7ff7efb534f6d07fa93b70aeb13ddf90c7ec057
NOTE: recipe libsndfile1-1.2.2-r0: task do_compile: Started
NOTE: recipe libusb1-1.0.29-r0: task do_create_spdx: Started
NOTE: recipe libfyaml-0.9.4-r0: task do_configure: Succeeded
NOTE: recipe libxinerama-1_1.1.6-r0: task do_create_spdx: Started
NOTE: Running task 4240 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.4.bb:do_compile)
NOTE: Running task 4241 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_create_spdx)
NOTE: recipe libnotify-0.8.8-r0: task do_compile: Succeeded
NOTE: Running task 4242 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libnotify/libnotify_0.8.8.bb:do_install)
NOTE: recipe libxmlb-0.3.25-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.25.bb:do_packagedata unihash changed to 19b4b87301d12853d46a09861d46ad7a1df44d21debde4db9f4bf6f80fadf7bc
NOTE: recipe libfyaml-0.9.4-r0: task do_compile: Started
NOTE: recipe gsettings-desktop-schemas-50.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libusb1-1.0.29-r0: task do_create_spdx: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4243 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb:do_create_spdx)
NOTE: recipe graphene-1.10.8-r0: task do_create_spdx: Started
NOTE: Running task 4248 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.25.bb:do_create_recipe_spdx)
NOTE: Running task 4249 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.4.bb:do_create_recipe_spdx)
NOTE: recipe libnotify-0.8.8-r0: task do_install: Started
NOTE: recipe libxinerama-1_1.1.6-r0: task do_create_spdx: Succeeded
NOTE: Running task 4252 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/aspell/aspell_0.60.8.2.bb:do_create_recipe_spdx)
NOTE: recipe tiff-4.7.1-r0: task do_create_spdx: Started
NOTE: recipe libfyaml-0.9.4-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxmlb-0.3.25-r0: task do_create_recipe_spdx: Started
NOTE: recipe aspell-0.60.8.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_fetch: Succeeded
NOTE: Running task 4266 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.38.1.bb:do_unpack)
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_unpack: Started
NOTE: recipe graphene-1.10.8-r0: task do_create_spdx: Succeeded
NOTE: recipe libfyaml-0.9.4-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_unpack: Succeeded
NOTE: Running task 4269 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_unpack)
NOTE: Running task 4270 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.38.1.bb:do_patch)
NOTE: Running task 4281 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.26.2.bb:do_create_recipe_spdx)
NOTE: recipe libxmlb-0.3.25-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe aspell-0.60.8.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 4284 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.1.2.bb:do_create_recipe_spdx)
NOTE: Running task 4286 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libnotify/libnotify_0.8.8.bb:do_create_recipe_spdx)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_unpack: Started
NOTE: recipe p11-kit-0.26.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_patch: Started
NOTE: recipe appstream-1.1.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe libnotify-0.8.8-r0: task do_create_recipe_spdx: Started
NOTE: recipe tiff-4.7.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 4288 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libsecret/libsecret_0.21.7.bb:do_create_recipe_spdx)
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_patch: Succeeded
NOTE: Running task 4290 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/wpebackend-fdo_1.16.1.bb:do_create_recipe_spdx)
NOTE: recipe libsecret-0.21.7-r0: task do_create_recipe_spdx: Started
NOTE: recipe libnotify-0.8.8-r0: task do_install: Succeeded
NOTE: recipe libnotify-0.8.8-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe p11-kit-0.26.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe wpebackend-fdo-1.16.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe appstream-1.1.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 4291 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/enchant/enchant2_2.8.15.bb:do_create_recipe_spdx)
NOTE: Running task 4292 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libnotify/libnotify_0.8.8.bb:do_populate_sysroot)
NOTE: Running task 4293 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libnotify/libnotify_0.8.8.bb:do_package)
NOTE: Running task 4323 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nghttp2/nghttp2_1.68.1.bb:do_create_spdx)
NOTE: recipe enchant2-2.8.15-r0: task do_create_recipe_spdx: Started
NOTE: recipe libnotify-0.8.8-r0: task do_populate_sysroot: Started
NOTE: recipe libnotify-0.8.8-r0: task do_package: Started
NOTE: recipe nghttp2-1.68.1-r0: task do_create_spdx: Started
NOTE: recipe libsecret-0.21.7-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 4324 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_create_spdx)
NOTE: recipe wpebackend-fdo-1.16.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 4328 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gcr/gcr_4.4.0.1.bb:do_create_recipe_spdx)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_unpack: Succeeded
NOTE: Running task 4329 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_patch)
NOTE: recipe enchant2-2.8.15-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe desktop-file-utils-0.28-r0: task do_create_spdx: Started
NOTE: Running task 4330 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_create_recipe_spdx)
NOTE: recipe gcr-4.4.0.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_patch: Started
NOTE: recipe json-glib-1.10.8-r0: task do_create_recipe_spdx: Started
NOTE: recipe nghttp2-1.68.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 4334 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libadwaita/libadwaita_1.9.0.bb:do_create_recipe_spdx)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_patch: Succeeded
NOTE: Running task 4335 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_50.1.bb:do_create_recipe_spdx)
NOTE: recipe libadwaita-1.9.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe libnotify-0.8.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4336 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libportal/libportal_0.9.1.bb:do_create_recipe_spdx)
NOTE: recipe gcr-4.4.0.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 4337 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_create_recipe_spdx)
NOTE: recipe json-glib-1.10.8-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe desktop-file-utils-0.28-r0: task do_create_spdx: Succeeded
NOTE: Running task 4338 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_create_recipe_spdx)
NOTE: Running task 4340 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/webkitgtk_2.50.6.bb:do_create_recipe_spdx)
NOTE: recipe gsettings-desktop-schemas-50.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe libportal-0.9.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe libhandy-1.8.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe webkitgtk-2.50.6-r0: task do_create_recipe_spdx: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe libadwaita-1.9.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 4351 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.38.1.bb:do_deploy_source_date_epoch)
NOTE: recipe gsettings-desktop-schemas-50.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libportal-0.9.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 4352 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.38.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 4360 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libhandy-1.8.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libdazzle-3.44.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 4361 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe webkitgtk-2.50.6-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 4392 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.25.bb:do_create_spdx)
NOTE: Running task 4412 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/epiphany/epiphany_50.4.bb:do_create_recipe_spdx)
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.38.1.bb:do_deploy_source_date_epoch unihash changed to bedd710279c31aa6cbf4c3b8dbf9bfb944b43bd2b984cb20c560106c8db70e8c
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Setscene tasks completed
NOTE: recipe libxmlb-0.3.25-r0: task do_create_spdx: Started
NOTE: recipe epiphany-50.4-r0: task do_create_recipe_spdx: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_deploy_source_date_epoch unihash changed to 266664f31e63b63b46728403871a5ad81bb9406412961076fbf36a674a24059c
NOTE: Setscene tasks completed
NOTE: recipe libsndfile1-1.2.2-r0: task do_compile: Succeeded
NOTE: recipe epiphany-50.4-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 4420 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_install)
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4421 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.38.1.bb:do_configure)
NOTE: Setscene tasks completed
NOTE: Running task 4422 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_configure)
NOTE: recipe libxmlb-0.3.25-r0: task do_create_spdx: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_install: Started
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_configure: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_configure: Started
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_configure: Succeeded
NOTE: Running task 4423 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.38.1.bb:do_compile)
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_compile: Started
NOTE: recipe libsecret-0.21.7-r0: task do_compile: Succeeded
NOTE: Running task 4424 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libsecret/libsecret_0.21.7.bb:do_install)
NOTE: recipe libsndfile1-1.2.2-r0: task do_install: Succeeded
NOTE: Running task 4425 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_populate_sysroot)
NOTE: Running task 4426 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_package)
NOTE: recipe libsecret-0.21.7-r0: task do_install: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot: Started
NOTE: recipe libnotify-0.8.8-r0: task do_package: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_package: Started
NOTE: Running task 4427 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libnotify/libnotify_0.8.8.bb:do_packagedata)
NOTE: recipe json-glib-1.10.8-r0: task do_package: Succeeded
NOTE: recipe libnotify-0.8.8-r0: task do_packagedata: Started
NOTE: Running task 4428 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_packagedata)
NOTE: recipe aspell-0.60.8.2-r0: task do_compile: Succeeded
NOTE: recipe json-glib-1.10.8-r0: task do_packagedata: Started
NOTE: Running task 4429 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/aspell/aspell_0.60.8.2.bb:do_install)
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_populate_sysroot unihash changed to e379081f2b99acfe50798e8678a67e0b439f84d219abdc84ffc18eecf42fca76
NOTE: recipe libnotify-0.8.8-r0: task do_packagedata: Succeeded
NOTE: recipe aspell-0.60.8.2-r0: task do_install: Started
NOTE: Setscene tasks completed
NOTE: Running task 4430 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 4431 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libnotify/libnotify_0.8.8.bb:do_create_spdx)
NOTE: recipe sbc-2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libnotify-0.8.8-r0: task do_create_spdx: Started
NOTE: recipe libsecret-0.21.7-r0: task do_install: Succeeded
NOTE: Running task 4432 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libsecret/libsecret_0.21.7.bb:do_populate_sysroot)
NOTE: Running task 4433 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libsecret/libsecret_0.21.7.bb:do_package)
NOTE: recipe libsecret-0.21.7-r0: task do_populate_sysroot: Started
NOTE: recipe libsecret-0.21.7-r0: task do_package: Started
NOTE: recipe sbc-2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4434 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.2.bb:do_configure)
NOTE: recipe json-glib-1.10.8-r0: task do_packagedata: Succeeded
NOTE: Running task 4435 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_create_spdx)
NOTE: recipe libnotify-0.8.8-r0: task do_create_spdx: Succeeded
NOTE: recipe sbc-2.2-r0: task do_configure: Started
NOTE: recipe json-glib-1.10.8-r0: task do_create_spdx: Started
NOTE: recipe gsettings-desktop-schemas-50.1-r0: task do_package: Succeeded
NOTE: Running task 4436 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_50.1.bb:do_packagedata)
NOTE: recipe libsecret-0.21.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_compile: Succeeded
NOTE: recipe gsettings-desktop-schemas-50.1-r0: task do_packagedata: Started
NOTE: Running task 4437 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.38.1.bb:do_install)
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_install: Started
NOTE: recipe json-glib-1.10.8-r0: task do_create_spdx: Succeeded
NOTE: recipe aspell-0.60.8.2-r0: task do_install: Succeeded
NOTE: recipe gsettings-desktop-schemas-50.1-r0: task do_packagedata: Succeeded
NOTE: Running task 4438 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/aspell/aspell_0.60.8.2.bb:do_populate_sysroot)
NOTE: Running task 4439 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/aspell/aspell_0.60.8.2.bb:do_package)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_50.1.bb:do_packagedata unihash changed to af26956049054596ef49aabebc2a78a362b66a778f9f13be6156787833f14327
NOTE: Setscene tasks completed
NOTE: Running task 4440 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_50.1.bb:do_create_spdx)
NOTE: recipe aspell-0.60.8.2-r0: task do_populate_sysroot: Started
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_install: Succeeded
NOTE: Running task 4441 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_50.1.bb:do_package_write_ipk)
NOTE: recipe aspell-0.60.8.2-r0: task do_package: Started
NOTE: Running task 4442 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.38.1.bb:do_package)
NOTE: Running task 4443 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_50.1.bb:do_package_write_deb)
NOTE: Running task 4444 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_50.1.bb:do_package_write_rpm)
NOTE: Running task 4445 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_50.1.bb:do_package_qa)
NOTE: recipe gsettings-desktop-schemas-50.1-r0: task do_create_spdx: Started
NOTE: recipe gsettings-desktop-schemas-50.1-r0: task do_package_write_ipk: Started
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_package: Started
NOTE: recipe gsettings-desktop-schemas-50.1-r0: task do_package_write_deb: Started
NOTE: recipe gsettings-desktop-schemas-50.1-r0: task do_package_write_rpm: Started
NOTE: recipe gsettings-desktop-schemas-50.1-r0: task do_package_qa: Started
NOTE: recipe aspell-0.60.8.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4446 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/enchant/enchant2_2.8.15.bb:do_prepare_recipe_sysroot)
NOTE: recipe enchant2-2.8.15-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_package unihash changed to 59cbb60b419636a97f0ce890694a3aec6ed14ffe0b884b2e235f83c9dae14700
NOTE: recipe gsettings-desktop-schemas-50.1-r0: task do_create_spdx: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4447 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_packagedata)
NOTE: recipe gsettings-desktop-schemas-50.1-r0: task do_package_qa: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_50.1.bb:do_package_qa unihash changed to 8c1702b095f65da86ee1fc4e088e8fe04c30230017f83dc238c2ed8e7fbf48b4
NOTE: recipe enchant2-2.8.15-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4448 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/enchant/enchant2_2.8.15.bb:do_configure)
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_packagedata unihash changed to 358aa5d879b9b139e074f47a5434a4d51f270ada4d5bc92eab2f8e71710400f0
NOTE: recipe enchant2-2.8.15-r0: task do_configure: Started
NOTE: recipe gsettings-desktop-schemas-50.1-r0: task do_package_write_deb: Succeeded
NOTE: recipe gsettings-desktop-schemas-50.1-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_50.1.bb:do_package_write_deb unihash changed to c19aecf5b8cd6b28ef7f396021164e9d65c6d12ccc407d3282157c6ce7fffe83
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_50.1.bb:do_package_write_ipk unihash changed to e6652e9cdc6bcdbcb9927395cb169a14e1b9dadc0ec2497353d557b8cfd762aa
NOTE: Setscene tasks completed
NOTE: Running task 4449 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_create_spdx)
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx: Started
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_package: Succeeded
NOTE: recipe gsettings-desktop-schemas-50.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_50.1.bb:do_package_write_rpm unihash changed to 90d8e1e08b4485c1751062ce2821a87ca736fafe8e0e0be12f89515c22ba3d46
NOTE: Running task 4450 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.38.1.bb:do_packagedata)
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_packagedata: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.38.1.bb:do_packagedata unihash changed to 00a8d7c67f4c3329a61e92d5f753a97fbf9bc7a3d3030a06e2e47335a04b6e6d
NOTE: Setscene tasks completed
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_configure: Succeeded
NOTE: Running task 4451 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_compile)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_compile: Started
NOTE: recipe libsecret-0.21.7-r0: task do_package: Succeeded
NOTE: Running task 4452 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libsecret/libsecret_0.21.7.bb:do_packagedata)
NOTE: recipe libsecret-0.21.7-r0: task do_packagedata: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_compile: Succeeded
NOTE: Running task 4453 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_install)
NOTE: recipe libfyaml-0.9.4-r0: task do_compile: Succeeded
NOTE: Running task 4454 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.4.bb:do_install)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_install: Started
NOTE: recipe libfyaml-0.9.4-r0: task do_install: Started
NOTE: recipe libsecret-0.21.7-r0: task do_packagedata: Succeeded
NOTE: Running task 4455 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libsecret/libsecret_0.21.7.bb:do_create_spdx)
NOTE: recipe libsecret-0.21.7-r0: task do_create_spdx: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_install: Succeeded
NOTE: Running task 4456 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package: Started
NOTE: recipe libfyaml-0.9.4-r0: task do_install: Succeeded
NOTE: Running task 4457 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.4.bb:do_populate_sysroot)
NOTE: recipe aspell-0.60.8.2-r0: task do_package: Succeeded
NOTE: Running task 4458 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.4.bb:do_package)
NOTE: Running task 4459 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/aspell/aspell_0.60.8.2.bb:do_packagedata)
NOTE: recipe libfyaml-0.9.4-r0: task do_populate_sysroot: Started
NOTE: recipe libfyaml-0.9.4-r0: task do_package: Started
NOTE: recipe sbc-2.2-r0: task do_configure: Succeeded
NOTE: recipe aspell-0.60.8.2-r0: task do_packagedata: Started
NOTE: Setscene tasks completed
NOTE: Running task 4460 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.2.bb:do_compile)
NOTE: recipe sbc-2.2-r0: task do_compile: Started
NOTE: recipe libsecret-0.21.7-r0: task do_create_spdx: Succeeded
NOTE: recipe libfyaml-0.9.4-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.4.bb:do_populate_sysroot unihash changed to 90eba6f8dbd7be4f2cf2da1f3256cad029cc3f2d4fbbc9bb89be3762401aa33d
NOTE: Setscene tasks completed
NOTE: Running task 4461 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe aspell-0.60.8.2-r0: task do_packagedata: Succeeded
NOTE: Running task 4462 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/aspell/aspell_0.60.8.2.bb:do_create_spdx)
NOTE: recipe appstream-1.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe aspell-0.60.8.2-r0: task do_create_spdx: Started
NOTE: recipe aspell-0.60.8.2-r0: task do_create_spdx: Succeeded
NOTE: recipe appstream-1.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4463 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.1.2.bb:do_configure)
NOTE: recipe appstream-1.1.2-r0: task do_configure: Started
NOTE: recipe mesa-2_26.0.5-r0: task do_compile: Succeeded
NOTE: Running task 4464 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_install)
NOTE: recipe sbc-2.2-r0: task do_compile: Succeeded
NOTE: Running task 4465 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.2.bb:do_install)
NOTE: recipe mesa-2_26.0.5-r0: task do_install: Started
NOTE: recipe sbc-2.2-r0: task do_install: Started
NOTE: recipe sbc-2.2-r0: task do_install: Succeeded
NOTE: Running task 4466 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.2.bb:do_populate_sysroot)
NOTE: Running task 4467 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.2.bb:do_package)
NOTE: recipe libfyaml-0.9.4-r0: task do_package: Succeeded
NOTE: recipe sbc-2.2-r0: task do_populate_sysroot: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.4.bb:do_package unihash changed to 2aaa8a75959fa68fc79a96da4338c0f7416d60f6b9eae3e94611f1f7086ad263
NOTE: recipe sbc-2.2-r0: task do_package: Started
NOTE: Setscene tasks completed
NOTE: Running task 4468 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.4.bb:do_packagedata)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package: Succeeded
NOTE: Running task 4469 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata)
NOTE: recipe libfyaml-0.9.4-r0: task do_packagedata: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata: Started
NOTE: recipe sbc-2.2-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.2.bb:do_populate_sysroot unihash changed to 082ed565315cf5d8d4bd42b55610a45a74a9a426f1e3ee229797d8b65c8f7217
NOTE: recipe libfyaml-0.9.4-r0: task do_packagedata: Succeeded
NOTE: recipe mesa-2_26.0.5-r0: task do_install: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.4.bb:do_packagedata unihash changed to 57d744c481b30723ea7712899b5fc8c3e9d5c08248f1262d935783168eed82f6
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata unihash changed to e5324613a1d2989fa2f9f7c51413de55bf5fafc7ced09dbfe2a3cd9a0bca3f2e
NOTE: Setscene tasks completed
NOTE: Running task 4470 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_populate_sysroot)
NOTE: Running task 4471 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_package)
NOTE: Running task 4472 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.4.bb:do_create_spdx)
NOTE: Running task 4473 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_package_write_ipk)
NOTE: Running task 4474 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_package_write_deb)
NOTE: Running task 4475 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_package_write_rpm)
NOTE: Running task 4476 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_package_qa)
NOTE: recipe libfyaml-0.9.4-r0: task do_create_spdx: Started
NOTE: recipe mesa-2_26.0.5-r0: task do_populate_sysroot: Started
NOTE: recipe mesa-2_26.0.5-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_package_write_ipk: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_package_write_deb: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_package_write_rpm: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_package_qa: Started
NOTE: recipe libfyaml-0.9.4-r0: task do_create_spdx: Succeeded
NOTE: recipe mesa-2_26.0.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4477 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 4478 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 4479 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/libwpe_1.16.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libepoxy-1.5.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libwpe-1.16.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe appstream-1.1.2-r0: task do_configure: Succeeded
NOTE: Running task 4480 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.1.2.bb:do_compile)
NOTE: recipe appstream-1.1.2-r0: task do_compile: Started
NOTE: recipe sbc-2.2-r0: task do_package: Succeeded
NOTE: recipe libwpe-1.16.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.2.bb:do_package unihash changed to 75473ade7b59a13b15c5d0c4ec88d23eb4b80edd43076b742bc54be750fb6920
NOTE: recipe libepoxy-1.5.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4481 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_configure)
NOTE: Running task 4482 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_configure)
NOTE: Running task 4483 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/libwpe_1.16.3.bb:do_configure)
NOTE: Running task 4484 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.2.bb:do_packagedata)
NOTE: recipe libepoxy-1.5.10-r0: task do_configure: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_configure: Started
NOTE: recipe libwpe-1.16.3-r0: task do_configure: Started
NOTE: recipe sbc-2.2-r0: task do_packagedata: Started
NOTE: recipe sbc-2.2-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.2.bb:do_packagedata unihash changed to 9625612be8ac83460a97f36a5e8b7f004add5f7a41153c8fedd3f96f9d5c06e5
NOTE: Setscene tasks completed
NOTE: Running task 4485 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.2.bb:do_create_spdx)
NOTE: recipe sbc-2.2-r0: task do_create_spdx: Started
NOTE: recipe sbc-2.2-r0: task do_create_spdx: Succeeded
NOTE: recipe libwpe-1.16.3-r0: task do_configure: Succeeded
NOTE: Running task 4486 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/libwpe_1.16.3.bb:do_compile)
NOTE: recipe libwpe-1.16.3-r0: task do_compile: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_configure: Succeeded
NOTE: recipe libwpe-1.16.3-r0: task do_compile: Succeeded
NOTE: Running task 4487 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/libwpe_1.16.3.bb:do_install)
NOTE: Running task 4488 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_compile)
NOTE: recipe libwpe-1.16.3-r0: task do_install: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_compile: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_configure: Succeeded
NOTE: Running task 4489 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_compile)
NOTE: recipe libwpe-1.16.3-r0: task do_install: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_compile: Started
NOTE: Running task 4490 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/libwpe_1.16.3.bb:do_populate_sysroot)
NOTE: recipe libwpe-1.16.3-r0: task do_populate_sysroot: Started
NOTE: recipe libwpe-1.16.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_package_write_rpm unihash changed to 1930680d3857b9807d4251f20c9d7fe1d0702d861da1d00fdf88b581eb46babe
NOTE: recipe mesa-2_26.0.5-r0: task do_package: Succeeded
NOTE: Running task 4491 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_packagedata)
NOTE: recipe mesa-2_26.0.5-r0: task do_packagedata: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_compile: Succeeded
NOTE: Running task 4492 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_install)
NOTE: recipe libglu-2_9.0.3-r0: task do_install: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_install: Succeeded
NOTE: Running task 4493 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_populate_sysroot)
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot: Started
NOTE: recipe appstream-1.1.2-r0: task do_compile: Succeeded
NOTE: Running task 4494 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.1.2.bb:do_install)
NOTE: recipe appstream-1.1.2-r0: task do_install: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe appstream-1.1.2-r0: task do_install: Succeeded
NOTE: Running task 4495 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.1.2.bb:do_populate_sysroot)
NOTE: Running task 4496 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.1.2.bb:do_package)
NOTE: recipe appstream-1.1.2-r0: task do_populate_sysroot: Started
NOTE: recipe appstream-1.1.2-r0: task do_package: Started
NOTE: recipe appstream-1.1.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe p11-kit-0.26.2-r0: task do_compile: Succeeded
NOTE: Running task 4497 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.26.2.bb:do_install)
NOTE: recipe p11-kit-0.26.2-r0: task do_install: Started
NOTE: recipe p11-kit-0.26.2-r0: task do_install: Succeeded
NOTE: Running task 4498 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.26.2.bb:do_populate_sysroot)
NOTE: Running task 4499 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.26.2.bb:do_package)
NOTE: recipe p11-kit-0.26.2-r0: task do_populate_sysroot: Started
NOTE: recipe p11-kit-0.26.2-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_package_write_deb unihash changed to 776e367bbd5740adc4b0b482a2acd6bfe6c3755840df277a60960ecd770d4599
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_package_qa unihash changed to d6e5e77883ca52bb53de40e729d76d26893bebe07b1b60ac0a5036e9ccb5a4a8
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_package_write_ipk unihash changed to 270ad9176e4b110f31fff09ea970391b19d98e6692111078734b6148220f7e6c
NOTE: recipe p11-kit-0.26.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe enchant2-2.8.15-r0: task do_configure: Succeeded
NOTE: Running task 4500 of 4706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/enchant/enchant2_2.8.15.bb:do_compile)
NOTE: recipe enchant2-2.8.15-r0: task do_compile: Started
NOTE: recipe mesa-2_26.0.5-r0: task do_packagedata: Failed
NOTE: recipe icu-78.3-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe appstream-1.1.2-r0: task do_package: Succeeded
NOTE: recipe enchant2-2.8.15-r0: task do_compile: Succeeded
NOTE: recipe p11-kit-0.26.2-r0: task do_package: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 4500 tasks of which 3711 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260501112630.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260501112630.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_packagedata
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/mesa/26.0.5/temp/log.do_packagedata.3041430
Summary: There were 70 ERROR messages, returning a non-zero exit code.
ERROR: xrandr-1_1.5.3-r0 do_packagedata_setscene: QA Issue: Package version for package xrandr-src went backwards which would break package feeds (from 1:1.5.4-r0 to 1:1.5.3-r0) [version-going-backwards]
ERROR: xrandr-1_1.5.3-r0 do_packagedata_setscene: QA Issue: Package version for package xrandr-dbg went backwards which would break package feeds (from 1:1.5.4-r0 to 1:1.5.3-r0) [version-going-backwards]
ERROR: xrandr-1_1.5.3-r0 do_packagedata_setscene: QA Issue: Package version for package xrandr-staticdev went backwards which would break package feeds (from 1:1.5.4-r0 to 1:1.5.3-r0) [version-going-backwards]
ERROR: xrandr-1_1.5.3-r0 do_packagedata_setscene: QA Issue: Package version for package xrandr-dev went backwards which would break package feeds (from 1:1.5.4-r0 to 1:1.5.3-r0) [version-going-backwards]
ERROR: xrandr-1_1.5.3-r0 do_packagedata_setscene: QA Issue: Package version for package xrandr-doc went backwards which would break package feeds (from 1:1.5.4-r0 to 1:1.5.3-r0) [version-going-backwards]
ERROR: xrandr-1_1.5.3-r0 do_packagedata_setscene: QA Issue: Package version for package xrandr-locale went backwards which would break package feeds (from 1:1.5.4-r0 to 1:1.5.3-r0) [version-going-backwards]
ERROR: xrandr-1_1.5.3-r0 do_packagedata_setscene: QA Issue: Package version for package xrandr went backwards which would break package feeds (from 1:1.5.4-r0 to 1:1.5.3-r0) [version-going-backwards]
ERROR: xrandr-1_1.5.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: xz-5.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-src went backwards which would break package feeds (from 0:5.8.3-r0 to 0:5.8.2-r0) [version-going-backwards]
ERROR: xz-5.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-dbg went backwards which would break package feeds (from 0:5.8.3-r0 to 0:5.8.2-r0) [version-going-backwards]
ERROR: xz-5.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package liblzma went backwards which would break package feeds (from 0:5.8.3-r0 to 0:5.8.2-r0) [version-going-backwards]
ERROR: xz-5.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-ptest went backwards which would break package feeds (from 0:5.8.3-r0 to 0:5.8.2-r0) [version-going-backwards]
ERROR: xz-5.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-staticdev went backwards which would break package feeds (from 0:5.8.3-r0 to 0:5.8.2-r0) [version-going-backwards]
ERROR: xz-5.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-dev went backwards which would break package feeds (from 0:5.8.3-r0 to 0:5.8.2-r0) [version-going-backwards]
ERROR: xz-5.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-doc went backwards which would break package feeds (from 0:5.8.3-r0 to 0:5.8.2-r0) [version-going-backwards]
ERROR: xz-5.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-ca went backwards which would break package feeds (from 0:5.8.3-r0 to 0:5.8.2-r0) [version-going-backwards]
ERROR: xz-5.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-cs went backwards which would break package feeds (from 0:5.8.3-r0 to 0:5.8.2-r0) [version-going-backwards]
ERROR: xz-5.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-da went backwards which would break package feeds (from 0:5.8.3-r0 to 0:5.8.2-r0) [version-going-backwards]
ERROR: xz-5.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-de went backwards which would break package feeds (from 0:5.8.3-r0 to 0:5.8.2-r0) [version-going-backwards]
ERROR: xz-5.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-eo went backwards which would break package feeds (from 0:5.8.3-r0 to 0:5.8.2-r0) [version-going-backwards]
ERROR: xz-5.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-es went backwards which would break package feeds (from 0:5.8.3-r0 to 0:5.8.2-r0) [version-going-backwards]
ERROR: xz-5.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-fi went backwards which would break package feeds (from 0:5.8.3-r0 to 0:5.8.2-r0) [version-going-backwards]
ERROR: xz-5.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-fr went backwards which would break package feeds (from 0:5.8.3-r0 to 0:5.8.2-r0) [version-going-backwards]
ERROR: xz-5.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-hr went backwards which would break package feeds (from 0:5.8.3-r0 to 0:5.8.2-r0) [version-going-backwards]
ERROR: xz-5.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-hu went backwards which would break package feeds (from 0:5.8.3-r0 to 0:5.8.2-r0) [version-going-backwards]
ERROR: xz-5.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-it went backwards which would break package feeds (from 0:5.8.3-r0 to 0:5.8.2-r0) [version-going-backwards]
ERROR: xz-5.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-ka went backwards which would break package feeds (from 0:5.8.3-r0 to 0:5.8.2-r0) [version-going-backwards]
ERROR: xz-5.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-ko went backwards which would break package feeds (from 0:5.8.3-r0 to 0:5.8.2-r0) [version-going-backwards]
ERROR: xz-5.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-nl went backwards which would break package feeds (from 0:5.8.3-r0 to 0:5.8.2-r0) [version-going-backwards]
ERROR: xz-5.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-pl went backwards which would break package feeds (from 0:5.8.3-r0 to 0:5.8.2-r0) [version-going-backwards]
ERROR: xz-5.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-pt went backwards which would break package feeds (from 0:5.8.3-r0 to 0:5.8.2-r0) [version-going-backwards]
ERROR: xz-5.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-pt-br went backwards which would break package feeds (from 0:5.8.3-r0 to 0:5.8.2-r0) [version-going-backwards]
ERROR: xz-5.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-ro went backwards which would break package feeds (from 0:5.8.3-r0 to 0:5.8.2-r0) [version-going-backwards]
ERROR: xz-5.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-sr went backwards which would break package feeds (from 0:5.8.3-r0 to 0:5.8.2-r0) [version-going-backwards]
ERROR: xz-5.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-sv went backwards which would break package feeds (from 0:5.8.3-r0 to 0:5.8.2-r0) [version-going-backwards]
ERROR: xz-5.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-tr went backwards which would break package feeds (from 0:5.8.3-r0 to 0:5.8.2-r0) [version-going-backwards]
ERROR: xz-5.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-uk went backwards which would break package feeds (from 0:5.8.3-r0 to 0:5.8.2-r0) [version-going-backwards]
ERROR: xz-5.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-vi went backwards which would break package feeds (from 0:5.8.3-r0 to 0:5.8.2-r0) [version-going-backwards]
ERROR: xz-5.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-zh-cn went backwards which would break package feeds (from 0:5.8.3-r0 to 0:5.8.2-r0) [version-going-backwards]
ERROR: xz-5.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-zh-tw went backwards which would break package feeds (from 0:5.8.3-r0 to 0:5.8.2-r0) [version-going-backwards]
ERROR: xz-5.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz went backwards which would break package feeds (from 0:5.8.3-r0 to 0:5.8.2-r0) [version-going-backwards]
ERROR: xz-5.8.2-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: mesa-2_26.0.5-r0 do_packagedata: QA Issue: Package version for package mesa-src went backwards which would break package feeds (from 2:26.0.6-r0 to 2:26.0.5-r0) [version-going-backwards]
ERROR: mesa-2_26.0.5-r0 do_packagedata: QA Issue: Package version for package mesa-dbg went backwards which would break package feeds (from 2:26.0.6-r0 to 2:26.0.5-r0) [version-going-backwards]
ERROR: mesa-2_26.0.5-r0 do_packagedata: QA Issue: Package version for package libegl-mesa went backwards which would break package feeds (from 2:26.0.6-r0 to 2:26.0.5-r0) [version-going-backwards]
ERROR: mesa-2_26.0.5-r0 do_packagedata: QA Issue: Package version for package libegl-mesa-dev went backwards which would break package feeds (from 2:26.0.6-r0 to 2:26.0.5-r0) [version-going-backwards]
ERROR: mesa-2_26.0.5-r0 do_packagedata: QA Issue: Package version for package libgallium went backwards which would break package feeds (from 2:26.0.6-r0 to 2:26.0.5-r0) [version-going-backwards]
ERROR: mesa-2_26.0.5-r0 do_packagedata: QA Issue: Package version for package libgl-mesa went backwards which would break package feeds (from 2:26.0.6-r0 to 2:26.0.5-r0) [version-going-backwards]
ERROR: mesa-2_26.0.5-r0 do_packagedata: QA Issue: Package version for package libgl-mesa-dev went backwards which would break package feeds (from 2:26.0.6-r0 to 2:26.0.5-r0) [version-going-backwards]
ERROR: mesa-2_26.0.5-r0 do_packagedata: QA Issue: Package version for package libglx-mesa went backwards which would break package feeds (from 2:26.0.6-r0 to 2:26.0.5-r0) [version-going-backwards]
ERROR: mesa-2_26.0.5-r0 do_packagedata: QA Issue: Package version for package libglx-mesa-dev went backwards which would break package feeds (from 2:26.0.6-r0 to 2:26.0.5-r0) [version-going-backwards]
ERROR: mesa-2_26.0.5-r0 do_packagedata: QA Issue: Package version for package libglapi went backwards which would break package feeds (from 2:26.0.6-r0 to 2:26.0.5-r0) [version-going-backwards]
ERROR: mesa-2_26.0.5-r0 do_packagedata: QA Issue: Package version for package libglapi-dev went backwards which would break package feeds (from 2:26.0.6-r0 to 2:26.0.5-r0) [version-going-backwards]
ERROR: mesa-2_26.0.5-r0 do_packagedata: QA Issue: Package version for package libgbm went backwards which would break package feeds (from 2:26.0.6-r0 to 2:26.0.5-r0) [version-going-backwards]
ERROR: mesa-2_26.0.5-r0 do_packagedata: QA Issue: Package version for package libgbm-dev went backwards which would break package feeds (from 2:26.0.6-r0 to 2:26.0.5-r0) [version-going-backwards]
ERROR: mesa-2_26.0.5-r0 do_packagedata: QA Issue: Package version for package libgles1-mesa went backwards which would break package feeds (from 2:26.0.6-r0 to 2:26.0.5-r0) [version-going-backwards]
ERROR: mesa-2_26.0.5-r0 do_packagedata: QA Issue: Package version for package libgles1-mesa-dev went backwards which would break package feeds (from 2:26.0.6-r0 to 2:26.0.5-r0) [version-going-backwards]
ERROR: mesa-2_26.0.5-r0 do_packagedata: QA Issue: Package version for package libgles2-mesa went backwards which would break package feeds (from 2:26.0.6-r0 to 2:26.0.5-r0) [version-going-backwards]
ERROR: mesa-2_26.0.5-r0 do_packagedata: QA Issue: Package version for package libgles2-mesa-dev went backwards which would break package feeds (from 2:26.0.6-r0 to 2:26.0.5-r0) [version-going-backwards]
ERROR: mesa-2_26.0.5-r0 do_packagedata: QA Issue: Package version for package libopencl-mesa went backwards which would break package feeds (from 2:26.0.6-r0 to 2:26.0.5-r0) [version-going-backwards]
ERROR: mesa-2_26.0.5-r0 do_packagedata: QA Issue: Package version for package libteflon went backwards which would break package feeds (from 2:26.0.6-r0 to 2:26.0.5-r0) [version-going-backwards]
ERROR: mesa-2_26.0.5-r0 do_packagedata: QA Issue: Package version for package mesa-megadriver went backwards which would break package feeds (from 2:26.0.6-r0 to 2:26.0.5-r0) [version-going-backwards]
ERROR: mesa-2_26.0.5-r0 do_packagedata: QA Issue: Package version for package mesa-vulkan-drivers went backwards which would break package feeds (from 2:26.0.6-r0 to 2:26.0.5-r0) [version-going-backwards]
ERROR: mesa-2_26.0.5-r0 do_packagedata: QA Issue: Package version for package mesa-tools went backwards which would break package feeds (from 2:26.0.6-r0 to 2:26.0.5-r0) [version-going-backwards]
ERROR: mesa-2_26.0.5-r0 do_packagedata: QA Issue: Package version for package mesa-staticdev went backwards which would break package feeds (from 2:26.0.6-r0 to 2:26.0.5-r0) [version-going-backwards]
ERROR: mesa-2_26.0.5-r0 do_packagedata: QA Issue: Package version for package mesa-dev went backwards which would break package feeds (from 2:26.0.6-r0 to 2:26.0.5-r0) [version-going-backwards]
ERROR: mesa-2_26.0.5-r0 do_packagedata: QA Issue: Package version for package mesa-doc went backwards which would break package feeds (from 2:26.0.6-r0 to 2:26.0.5-r0) [version-going-backwards]
ERROR: mesa-2_26.0.5-r0 do_packagedata: QA Issue: Package version for package mesa-locale went backwards which would break package feeds (from 2:26.0.6-r0 to 2:26.0.5-r0) [version-going-backwards]
ERROR: mesa-2_26.0.5-r0 do_packagedata: QA Issue: Package version for package mesa went backwards which would break package feeds (from 2:26.0.6-r0 to 2:26.0.5-r0) [version-going-backwards]
ERROR: mesa-2_26.0.5-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/mesa/26.0.5/temp/log.do_packagedata.3041430
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_packagedata) failed with exit code '1'

--===============4022641372915889629==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/epiphany/epiphany-dbg: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-dbg: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-dbg: PKGSIZE changed from 10825784 to 10852352 (+0%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-dev: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-dev: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-doc: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-doc: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ab: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ab: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-af: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-af: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-am: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-am: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-an: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-an: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ar: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ar: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-as: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-as: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ast: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ast: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-az: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-az: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-be+latin: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-be+latin: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-be: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-be: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-bg: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-bg: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-bn-in: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-bn-in: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-bn: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-bn: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-br: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-br: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-bs: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-bs: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ca+valencia: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ca+valencia: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ca: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ca: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ckb: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ckb: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-cs: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-cs: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-cy: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-cy: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-da: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-da: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-de: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-de: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-de: PKGSIZE changed from 100263 to 100834 (+1%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-dz: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-dz: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-el: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-el: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-en+shaw: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-en+shaw: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-en-ca: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-en-ca: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-en-gb: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-en-gb: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-eo: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-eo: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-es: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-es: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-et: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-et: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-eu: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-eu: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-fa: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-fa: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-fi: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-fi: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-fr: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-fr: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-fur: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-fur: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-fy: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-fy: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ga: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ga: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-gl: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-gl: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-gu: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-gu: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-gv: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-gv: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-he: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-he: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-hi: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-hi: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-hr: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-hr: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-hu: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-hu: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-hy: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-hy: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ia: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ia: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-id: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-id: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ie: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ie: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ig: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ig: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-is: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-is: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-it: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-it: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ja: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ja: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ka: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ka: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-kab: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-kab: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-kk: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-kk: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-km: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-km: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-kn: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-kn: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ko: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ko: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ku: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ku: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-li: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-li: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-lt: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-lt: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-lv: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-lv: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-mai: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-mai: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-mg: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-mg: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-mi: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-mi: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-mk: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-mk: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ml: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ml: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-mn: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-mn: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-mr: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-mr: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ms: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ms: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-my: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-my: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-nb: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-nb: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-nds: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-nds: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ne: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ne: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-nl: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-nl: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-nl: PKGSIZE changed from 97411 to 98946 (+2%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-nn: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-nn: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-oc: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-oc: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-or: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-or: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-pa: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-pa: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-pl: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-pl: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-pl: PKGSIZE changed from 100429 to 100038 (-0%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ps: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ps: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-pt-br: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-pt-br: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-pt: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-pt: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ro: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ro: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ru: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ru: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-rw: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-rw: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-si: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-si: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-sk: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-sk: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-sk: PKGSIZE changed from 95114 to 100442 (+6%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-sl: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-sl: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-sq: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-sq: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-sr+latin: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-sr+latin: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-sr: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-sr: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-sv: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-sv: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ta: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ta: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-te: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-te: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-tg: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-tg: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-th: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-th: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-tk: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-tk: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-tr: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-tr: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-tr: PKGSIZE changed from 97300 to 97356 (+0%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ug: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ug: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-uk: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-uk: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-uz+cyrillic: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-uz+cyrillic: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-uz: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-uz: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-vi: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-vi: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-wa: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-wa: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-yo: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-yo: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-zh-cn: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-zh-cn: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-zh-hk: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-zh-hk: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-zh-tw: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-zh-tw: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-src: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-src: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany-src: PKGSIZE changed from 32625753 to 32638360 (+0%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-src: FILELIST: directory renamed /usr/src/debug/epiphany/50.3/embed -> /usr/src/debug/epiphany/50.4/embed, directory renamed /usr/src/debug/epiphany/50.3/lib/sync/debug -> /usr/src/debug/epiphany/50.4/lib/sync/debug, directory renamed /usr/src/debug/epiphany/50.3/lib/sync -> /usr/src/debug/epiphany/50.4/lib/sync, directory renamed /usr/src/debug/epiphany/50.3/lib/autofill -> /usr/src/debug/epiphany/50.4/lib/autofill, directory renamed /usr/src/debug/epiphany/50.3/third-party/gvdb -> /usr/src/debug/epiphany/50.4/third-party/gvdb, directory renamed /usr/src/debug/epiphany/50.3/lib/history -> /usr/src/debug/epiphany/50.4/lib/history, directory renamed /usr/src/debug/epiphany/50.3/src/preferences -> /usr/src/debug/epiphany/50.4/src/preferences, directory renamed /usr/src/debug/epiphany/50.3/third-party -> /usr/src/debug/epiphany/50.4/third-party, directory renamed /usr/src/debug/epiphany/50.3/src/bookmarks -> /usr/src/debug/epiphany/50.4/sr
 c/bookmarks, directory renamed /usr/src/debug/epiphany/50.3/src/webextension -> /usr/src/debug/epiphany/50.4/src/webextension, directory renamed /usr/src/debug/epiphany/50.3/embed/web-process-extension -> /usr/src/debug/epiphany/50.4/embed/web-process-extension, directory renamed /usr/src/debug/epiphany/50.3/src/search-provider -> /usr/src/debug/epiphany/50.4/src/search-provider, directory renamed /usr/src/debug/epiphany/50.3/src/webapp-provider -> /usr/src/debug/epiphany/50.4/src/webapp-provider, directory renamed /usr/src/debug/epiphany/50.3/lib -> /usr/src/debug/epiphany/50.4/lib, directory renamed /usr/src/debug/epiphany/50.3/src/webextension/api -> /usr/src/debug/epiphany/50.4/src/webextension/api, directory renamed /usr/src/debug/epiphany/50.3/lib/contrib -> /usr/src/debug/epiphany/50.4/lib/contrib, directory renamed /usr/src/debug/epiphany/50.3/src/profile-migrator -> /usr/src/debug/epiphany/50.4/src/profile-migrator, removed "/usr/src/debug/epiphany/50.3/src/ephy-type-builti
 ns.c /usr/src/debug/epiphany/50.3/src/ephy-type-builtins.h /usr/src/debug/epiphany/50.3/src/ephy-firefox-sync-dialog.c /usr/src/debug/epiphany/50.3/src/ephy-firefox-sync-dialog.h /usr/src/debug/epiphany/50.3/src/ephy-webapp-provider-generated.c /usr/src/debug/epiphany/50.3/src/window-commands.c /usr/src/debug/epiphany/50.3/src/ephy-webapp-provider-generated.h /usr/src/debug/epiphany/50.3/src/window-commands.h /usr/src/debug/epiphany/50.3/src/context-menu-commands.h /usr/src/debug/epiphany/50.3/src/ephy-tab-view.c /usr/src/debug/epiphany/50.3/src/ephy-tab-view.h /usr/src/debug/epiphany/50.3/src/context-menu-commands.c /usr/src/debug/epiphany/50.3/src/ephy-downloads-popover.c /usr/src/debug/epiphany/50.3/src/ephy-site-menu-button.c /usr/src/debug/epiphany/50.3/src/ephy-downloads-popover.h /usr/src/debug/epiphany/50.3/src/ephy-site-menu-button.h /usr/src/debug/epiphany/50.3/src/ephy-fullscreen-box.c /usr/src/debug/epiphany/50.3/src/ephy-location-entry.c /usr/src/debug/epiphany/50.3/src
 /ephy-fullscreen-box.h /usr/src/debug/epiphany/50.3/src/ephy-location-entry.h /usr/src/debug/epiphany/50.3/src/ephy-downloads-paintable.h /usr/src/debug/epiphany/50.3/src/ephy-downloads-paintable.c /usr/src/debug/epiphany/50.3/src/ephy-shell-search-provider-generated.c /usr/src/debug/epiphany/50.3/src/ephy-history-dialog.c /usr/src/debug/epiphany/50.3/src/ephy-window.h /usr/src/debug/epiphany/50.3/src/ephy-history-dialog.h /usr/src/debug/epiphany/50.3/src/ephy-shell-search-provider-generated.h /usr/src/debug/epiphany/50.3/src/ephy-window.c /usr/src/debug/epiphany/50.3/src/ephy-location-controller.h /usr/src/debug/epiphany/50.3/src/ephy-location-controller.c /usr/src/debug/epiphany/50.3/src/ephy-title-widget.c /usr/src/debug/epiphany/50.3/src/ephy-title-widget.h /usr/src/debug/epiphany/50.3/src/ephy-shell.h /usr/src/debug/epiphany/50.3/src/ephy-shell.c /usr/src/debug/epiphany/50.3/src/ephy-title-box.c /usr/src/debug/epiphany/50.3/src/ephy-title-box.h /usr/src/debug/epiphany/50.3/src/
 ephy-mouse-gesture-controller.c /usr/src/debug/epiphany/50.3/src/ephy-link.c /usr/src/debug/epiphany/50.3/src/ephy-mouse-gesture-controller.h /usr/src/debug/epiphany/50.3/src/ephy-link.h /usr/src/debug/epiphany/50.3/src/ephy-download-widget.c /usr/src/debug/epiphany/50.3/src/ephy-download-widget.h /usr/src/debug/epiphany/50.3/src/ephy-session.c /usr/src/debug/epiphany/50.3/src/epiphany-resources.c /usr/src/debug/epiphany/50.3/src/ephy-session.h /usr/src/debug/epiphany/50.3/src/ephy-main.c /usr/src/debug/epiphany/50.3/src/ephy-certificate-dialog.h /usr/src/debug/epiphany/50.3/src/ephy-page-menu-button.h /usr/src/debug/epiphany/50.3/src/ephy-desktop-utils.c /usr/src/debug/epiphany/50.3/src/ephy-page-menu-button.c /usr/src/debug/epiphany/50.3/src/ephy-certificate-dialog.c /usr/src/debug/epiphany/50.3/src/ephy-desktop-utils.h /usr/src/debug/epiphany/50.3/src/ephy-action-bar-start.c /usr/src/debug/epiphany/50.3/src/ephy-action-bar-start.h /usr/src/debug/epiphany/50.3/src/ephy-encoding-di
 alog.c /usr/src/debug/epiphany/50.3/src/ephy-security-dialog.c /usr/src/debug/epiphany/50.3/src/ephy-action-bar.c /usr/src/debug/epiphany/50.3/src/ephy-passwords-view.h /usr/src/debug/epiphany/50.3/src/ephy-encoding-dialog.h /usr/src/debug/epiphany/50.3/src/ephy-security-dialog.h /usr/src/debug/epiphany/50.3/src/ephy-passwords-view.c /usr/src/debug/epiphany/50.3/src/ephy-action-bar.h /usr/src/debug/epiphany/50.3/src/ephy-encoding-row.c /usr/src/debug/epiphany/50.3/src/synced-tabs-dialog.c /usr/src/debug/epiphany/50.3/src/ephy-encoding-row.h /usr/src/debug/epiphany/50.3/src/synced-tabs-dialog.h /usr/src/debug/epiphany/50.3/src/ephy-action-bar-end.c /usr/src/debug/epiphany/50.3/src/ephy-header-bar.c /usr/src/debug/epiphany/50.3/src/ephy-action-bar-end.h /usr/src/debug/epiphany/50.3/src/ephy-header-bar.h /usr/src/debug/epiphany/50.3/src/ephy-action-helper.h /usr/src/debug/epiphany/50.3/src/ephy-suggestion-model.h /usr/src/debug/epiphany/50.3/src/ephy-action-helper.c /usr/src/debug/epip
 hany/50.3/src/ephy-suggestion-model.c /usr/src/debug/epiphany/50.3/src/ephy-privacy-report.c /usr/src/debug/epiphany/50.3/src/ephy-lockdown.h /usr/src/debug/epiphany/50.3/src/ephy-privacy-report.h /usr/src/debug/epiphany/50.3/src/ephy-lockdown.c", added "/usr/src/debug/epiphany/50.4/src/ephy-type-builtins.c /usr/src/debug/epiphany/50.4/src/ephy-type-builtins.h /usr/src/debug/epiphany/50.4/src/ephy-firefox-sync-dialog.c /usr/src/debug/epiphany/50.4/src/ephy-firefox-sync-dialog.h /usr/src/debug/epiphany/50.4/src/ephy-webapp-provider-generated.c /usr/src/debug/epiphany/50.4/src/window-commands.c /usr/src/debug/epiphany/50.4/src/ephy-webapp-provider-generated.h /usr/src/debug/epiphany/50.4/src/window-commands.h /usr/src/debug/epiphany/50.4/src/context-menu-commands.h /usr/src/debug/epiphany/50.4/src/ephy-tab-view.c /usr/src/debug/epiphany/50.4/src/ephy-tab-view.h /usr/src/debug/epiphany/50.4/src/context-menu-commands.c /usr/src/debug/epiphany/50.4/src/ephy-downloads-popover.c /usr/src/d
 ebug/epiphany/50.4/src/ephy-site-menu-button.c /usr/src/debug/epiphany/50.4/src/ephy-downloads-popover.h /usr/src/debug/epiphany/50.4/src/ephy-site-menu-button.h /usr/src/debug/epiphany/50.4/src/ephy-fullscreen-box.c /usr/src/debug/epiphany/50.4/src/ephy-location-entry.c /usr/src/debug/epiphany/50.4/src/ephy-fullscreen-box.h /usr/src/debug/epiphany/50.4/src/ephy-location-entry.h /usr/src/debug/epiphany/50.4/src/ephy-downloads-paintable.h /usr/src/debug/epiphany/50.4/src/ephy-downloads-paintable.c /usr/src/debug/epiphany/50.4/src/ephy-history-dialog-row.c /usr/src/debug/epiphany/50.4/src/ephy-shell-search-provider-generated.c /usr/src/debug/epiphany/50.4/src/ephy-history-dialog.c /usr/src/debug/epiphany/50.4/src/ephy-window.h /usr/src/debug/epiphany/50.4/src/ephy-history-dialog.h /usr/src/debug/epiphany/50.4/src/ephy-shell-search-provider-generated.h /usr/src/debug/epiphany/50.4/src/ephy-history-dialog-row.h /usr/src/debug/epiphany/50.4/src/ephy-window.c /usr/src/debug/epiphany/50.4/
 src/ephy-location-controller.h /usr/src/debug/epiphany/50.4/src/ephy-location-controller.c /usr/src/debug/epiphany/50.4/src/ephy-title-widget.c /usr/src/debug/epiphany/50.4/src/ephy-title-widget.h /usr/src/debug/epiphany/50.4/src/ephy-shell.h /usr/src/debug/epiphany/50.4/src/ephy-shell.c /usr/src/debug/epiphany/50.4/src/ephy-title-box.c /usr/src/debug/epiphany/50.4/src/ephy-title-box.h /usr/src/debug/epiphany/50.4/src/ephy-mouse-gesture-controller.c /usr/src/debug/epiphany/50.4/src/ephy-link.c /usr/src/debug/epiphany/50.4/src/ephy-mouse-gesture-controller.h /usr/src/debug/epiphany/50.4/src/ephy-link.h /usr/src/debug/epiphany/50.4/src/ephy-download-widget.c /usr/src/debug/epiphany/50.4/src/ephy-download-widget.h /usr/src/debug/epiphany/50.4/src/ephy-session.c /usr/src/debug/epiphany/50.4/src/epiphany-resources.c /usr/src/debug/epiphany/50.4/src/ephy-session.h /usr/src/debug/epiphany/50.4/src/ephy-main.c /usr/src/debug/epiphany/50.4/src/ephy-certificate-dialog.h /usr/src/debug/epiphan
 y/50.4/src/ephy-page-menu-button.h /usr/src/debug/epiphany/50.4/src/ephy-desktop-utils.c /usr/src/debug/epiphany/50.4/src/ephy-page-menu-button.c /usr/src/debug/epiphany/50.4/src/ephy-certificate-dialog.c /usr/src/debug/epiphany/50.4/src/ephy-desktop-utils.h /usr/src/debug/epiphany/50.4/src/ephy-action-bar-start.c /usr/src/debug/epiphany/50.4/src/ephy-action-bar-start.h /usr/src/debug/epiphany/50.4/src/ephy-encoding-dialog.c /usr/src/debug/epiphany/50.4/src/ephy-security-dialog.c /usr/src/debug/epiphany/50.4/src/ephy-action-bar.c /usr/src/debug/epiphany/50.4/src/ephy-passwords-view.h /usr/src/debug/epiphany/50.4/src/ephy-encoding-dialog.h /usr/src/debug/epiphany/50.4/src/ephy-security-dialog.h /usr/src/debug/epiphany/50.4/src/ephy-passwords-view.c /usr/src/debug/epiphany/50.4/src/ephy-action-bar.h /usr/src/debug/epiphany/50.4/src/ephy-encoding-row.c /usr/src/debug/epiphany/50.4/src/synced-tabs-dialog.c /usr/src/debug/epiphany/50.4/src/ephy-encoding-row.h /usr/src/debug/epiphany/50.4
 /src/synced-tabs-dialog.h /usr/src/debug/epiphany/50.4/src/ephy-action-bar-end.c /usr/src/debug/epiphany/50.4/src/ephy-header-bar.c /usr/src/debug/epiphany/50.4/src/ephy-action-bar-end.h /usr/src/debug/epiphany/50.4/src/ephy-header-bar.h /usr/src/debug/epiphany/50.4/src/ephy-action-helper.h /usr/src/debug/epiphany/50.4/src/ephy-suggestion-model.h /usr/src/debug/epiphany/50.4/src/ephy-action-helper.c /usr/src/debug/epiphany/50.4/src/ephy-suggestion-model.c /usr/src/debug/epiphany/50.4/src/ephy-privacy-report.c /usr/src/debug/epiphany/50.4/src/ephy-lockdown.h /usr/src/debug/epiphany/50.4/src/ephy-privacy-report.h /usr/src/debug/epiphany/50.4/src/ephy-lockdown.c"
packages/x86-64-v3-poky-linux/epiphany/epiphany-staticdev: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-staticdev: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany/epiphany: PKGSIZE changed from 6648655 to 6661106 (+0%)
packages/x86-64-v3-poky-linux/epiphany: PKGV changed from 50.3 [default] to 50.4 [default]
packages/x86-64-v3-poky-linux/epiphany: PV changed from "50.3" to "50.4"
packages/x86-64-v3-poky-linux/epiphany: SRC_URI changed from "https://download.gnome.org/sources//epiphany/50/epiphany-50.3.tar.xz;name=archive file://0002-help-meson.build-disable-the-use-of-yelp.patch file://migrator.patch file://distributor.patch" to "https://download.gnome.org/sources//epiphany/50/epiphany-50.4.tar.xz;name=archive file://0002-help-meson.build-disable-the-use-of-yelp.patch file://migrator.patch file://distributor.patch"

--===============4022641372915889629==--

