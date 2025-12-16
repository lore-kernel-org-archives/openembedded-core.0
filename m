Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AA74D5CCA1
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:38 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17197.1765872154647957023
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=M/mZ8u2E;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=YPUC812f;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019b262eb574-cd1b5b7f-8459-48fc-a22a-340cb571ff29-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872154;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=61fyHm5FLM1iFGX8OYCkJF8qfkQmBlkoUm3VTSm+f24=;
	b=M/mZ8u2E2XmPLmOgMNuhCMK4n17m6em+6zxxSFaL4l1rXDPb8/5LIfO0tq98Wmzl
	TrG3IGXOiM87qx6DTanygdpCLHskNdeEUlj30mIMPqyUHZir19hQaK/EHLA9I7pL1Kk
	9NcM4UfXmLh2kF/Y9+g7JBH8uAMqgEgvDE9QBNZk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872154;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=61fyHm5FLM1iFGX8OYCkJF8qfkQmBlkoUm3VTSm+f24=;
	b=YPUC812foxWmMaol9Ok/1IJO3g0dOOvUDc9Cd7tWVLHl6hqsXuTehSqUaAMIh8Qv
	anJd3MF2XO4E8E3sMq7v6G5BBjliRHIW1V8H3EclBhcxaKhc0IL2Qaby1pLhZOZkCd6
	NLsx+vLVYu5u/QvT7V/RdXf9uKIPrkXQS1J7DWiQ=
Content-Type: multipart/mixed; boundary="===============5385244236398516710=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] cups: upgrading to 2.4.16 SUCCEEDED
Message-ID: <0101019b262eb574-cd1b5b7f-8459-48fc-a22a-340cb571ff29-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:33 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227848

--===============5385244236398516710==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *cups* to *2.4.16* has Succeeded.

Next steps:
    - apply the patch: git am 0001-cups-upgrade-2.4.15-2.4.16.patch
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
From 3cc6b1d5f0f9682bcbb5879449ca3790b61827d0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 16 Dec 2025 02:36:05 +0000
Subject: [PATCH] cups: upgrade 2.4.15 -> 2.4.16

---
 .../cups/cups/0001-use-echo-only-in-init.patch              | 2 +-
 .../cups/0002-don-t-try-to-run-generated-binaries.patch     | 2 +-
 .../0004-cups-fix-multilib-install-file-conflicts.patch     | 6 +++---
 meta/recipes-extended/cups/cups/libexecdir.patch            | 2 +-
 .../cups/{cups_2.4.15.bb => cups_2.4.16.bb}                 | 2 +-
 5 files changed, 7 insertions(+), 7 deletions(-)
 rename meta/recipes-extended/cups/{cups_2.4.15.bb => cups_2.4.16.bb} (51%)

diff --git a/meta/recipes-extended/cups/cups/0001-use-echo-only-in-init.patch b/meta/recipes-extended/cups/cups/0001-use-echo-only-in-init.patch
index c0cb7df581..e4b473aaf3 100644
--- a/meta/recipes-extended/cups/cups/0001-use-echo-only-in-init.patch
+++ b/meta/recipes-extended/cups/cups/0001-use-echo-only-in-init.patch
@@ -1,4 +1,4 @@
-From c5f943b1ac6e1c86ae64686e29e178fedf933e96 Mon Sep 17 00:00:00 2001
+From 575a890a818e8ddc95d22838480b62988ffcd639 Mon Sep 17 00:00:00 2001
 From: Saul Wold <sgw@linux.intel.com>
 Date: Thu, 13 Dec 2012 19:03:52 -0800
 Subject: [PATCH] use echo only in init
diff --git a/meta/recipes-extended/cups/cups/0002-don-t-try-to-run-generated-binaries.patch b/meta/recipes-extended/cups/cups/0002-don-t-try-to-run-generated-binaries.patch
index cf2f1a6747..378ef677a5 100644
--- a/meta/recipes-extended/cups/cups/0002-don-t-try-to-run-generated-binaries.patch
+++ b/meta/recipes-extended/cups/cups/0002-don-t-try-to-run-generated-binaries.patch
@@ -1,4 +1,4 @@
-From da9a313ae5a2d1da683dd58572df0d7a660eb922 Mon Sep 17 00:00:00 2001
+From 36fa890e4b30bf42318065fe3172ef92b2d3e313 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Sun, 30 Jan 2011 16:37:27 +0100
 Subject: [PATCH] don't try to run generated binaries
diff --git a/meta/recipes-extended/cups/cups/0004-cups-fix-multilib-install-file-conflicts.patch b/meta/recipes-extended/cups/cups/0004-cups-fix-multilib-install-file-conflicts.patch
index 31338822e6..2728fc7e3c 100644
--- a/meta/recipes-extended/cups/cups/0004-cups-fix-multilib-install-file-conflicts.patch
+++ b/meta/recipes-extended/cups/cups/0004-cups-fix-multilib-install-file-conflicts.patch
@@ -1,4 +1,4 @@
-From 880bad2c6b08afd2e2e303bc3ceea559edbe76d2 Mon Sep 17 00:00:00 2001
+From 53aeff85692ce3fd0ac325ec7dcdff31748ccee6 Mon Sep 17 00:00:00 2001
 From: Kai Kang <kai.kang@windriver.com>
 Date: Wed, 3 Oct 2018 00:27:11 +0800
 Subject: [PATCH] cups: fix multilib install file conflicts
@@ -15,10 +15,10 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/conf/cups-files.conf.in b/conf/cups-files.conf.in
-index f96f745..27d8be9 100644
+index 6db1392..bc999e4 100644
 --- a/conf/cups-files.conf.in
 +++ b/conf/cups-files.conf.in
-@@ -70,7 +70,7 @@ PageLog @CUPS_LOGDIR@/page_log
+@@ -73,7 +73,7 @@ PageLog @CUPS_LOGDIR@/page_log
  #RequestRoot @CUPS_REQUESTS@
  
  # Location of helper programs...
diff --git a/meta/recipes-extended/cups/cups/libexecdir.patch b/meta/recipes-extended/cups/cups/libexecdir.patch
index 493c7970ea..4acff27e54 100644
--- a/meta/recipes-extended/cups/cups/libexecdir.patch
+++ b/meta/recipes-extended/cups/cups/libexecdir.patch
@@ -1,4 +1,4 @@
-From 4ae7ad87aa022f5128be222dffbf0c50ec6e846e Mon Sep 17 00:00:00 2001
+From fab57dbafccee851b22b757f08fc3273ad78b8ae Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Tue, 13 Jul 2021 12:56:30 +0100
 Subject: [PATCH] Use $libexecdir instead of hardcoding $prefix/lib as this
diff --git a/meta/recipes-extended/cups/cups_2.4.15.bb b/meta/recipes-extended/cups/cups_2.4.16.bb
similarity index 51%
rename from meta/recipes-extended/cups/cups_2.4.15.bb
rename to meta/recipes-extended/cups/cups_2.4.16.bb
index dc22771db3..6c08e49728 100644
--- a/meta/recipes-extended/cups/cups_2.4.15.bb
+++ b/meta/recipes-extended/cups/cups_2.4.16.bb
@@ -2,4 +2,4 @@ require cups.inc
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "eff0bbd48ff1abcbb8e46e28e85aefaffa391a1d9c4d8dc92ab3822a13008d7f"
+SRC_URI[sha256sum] = "0339587204b4f9428dd0592eb301dec0bf9ea6ea8dce5d9690d56be585aba92d"
-- 
2.47.1


--===============5385244236398516710==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-cups-upgrade-2.4.15-2.4.16.patch"

RnJvbSAzY2M2YjFkNWYwZjk2ODJiY2JiNTg3OTQ0OWNhMzc5MGI2MTgyN2QwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTYgRGVjIDIwMjUgMDI6MzY6MDUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBj
dXBzOiB1cGdyYWRlIDIuNC4xNSAtPiAyLjQuMTYKCi0tLQogLi4uL2N1cHMvY3Vwcy8wMDAxLXVz
ZS1lY2hvLW9ubHktaW4taW5pdC5wYXRjaCAgICAgICAgICAgICAgfCAyICstCiAuLi4vY3Vwcy8w
MDAyLWRvbi10LXRyeS10by1ydW4tZ2VuZXJhdGVkLWJpbmFyaWVzLnBhdGNoICAgICB8IDIgKy0K
IC4uLi8wMDA0LWN1cHMtZml4LW11bHRpbGliLWluc3RhbGwtZmlsZS1jb25mbGljdHMucGF0Y2gg
ICAgIHwgNiArKystLS0KIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9jdXBzL2N1cHMvbGliZXhlY2Rp
ci5wYXRjaCAgICAgICAgICAgIHwgMiArLQogLi4uL2N1cHMve2N1cHNfMi40LjE1LmJiID0+IGN1
cHNfMi40LjE2LmJifSAgICAgICAgICAgICAgICAgfCAyICstCiA1IGZpbGVzIGNoYW5nZWQsIDcg
aW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZXh0ZW5k
ZWQvY3Vwcy97Y3Vwc18yLjQuMTUuYmIgPT4gY3Vwc18yLjQuMTYuYmJ9ICg1MSUpCgpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2N1cHMvY3Vwcy8wMDAxLXVzZS1lY2hvLW9ubHkt
aW4taW5pdC5wYXRjaCBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9jdXBzL2N1cHMvMDAwMS11c2Ut
ZWNoby1vbmx5LWluLWluaXQucGF0Y2gKaW5kZXggYzBjYjdkZjU4MS4uZTRiNDczYWFmMyAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2N1cHMvY3Vwcy8wMDAxLXVzZS1lY2hvLW9u
bHktaW4taW5pdC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvY3Vwcy9jdXBzLzAw
MDEtdXNlLWVjaG8tb25seS1pbi1pbml0LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBjNWY5
NDNiMWFjNmUxYzg2YWU2NDY4NmUyOWUxNzhmZWRmOTMzZTk2IE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQorRnJvbSA1NzVhODkwYTgxOGU4ZGRjOTVkMjI4Mzg0ODBiNjI5ODhmZmNkNjM5IE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogU2F1bCBXb2xkIDxzZ3dAbGludXguaW50ZWwuY29t
PgogRGF0ZTogVGh1LCAxMyBEZWMgMjAxMiAxOTowMzo1MiAtMDgwMAogU3ViamVjdDogW1BBVENI
XSB1c2UgZWNobyBvbmx5IGluIGluaXQKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRl
ZC9jdXBzL2N1cHMvMDAwMi1kb24tdC10cnktdG8tcnVuLWdlbmVyYXRlZC1iaW5hcmllcy5wYXRj
aCBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9jdXBzL2N1cHMvMDAwMi1kb24tdC10cnktdG8tcnVu
LWdlbmVyYXRlZC1iaW5hcmllcy5wYXRjaAppbmRleCBjZjJmMWE2NzQ3Li4zNzhlZjY3N2E1IDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvY3Vwcy9jdXBzLzAwMDItZG9uLXQtdHJ5
LXRvLXJ1bi1nZW5lcmF0ZWQtYmluYXJpZXMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVu
ZGVkL2N1cHMvY3Vwcy8wMDAyLWRvbi10LXRyeS10by1ydW4tZ2VuZXJhdGVkLWJpbmFyaWVzLnBh
dGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBkYTlhMzEzYWU1YTJkMWRhNjgzZGQ1ODU3MmRmMGQ3
YTY2MGViOTIyIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAzNmZhODkwZTRiMzBiZjQy
MzE4MDY1ZmUzMTcyZWY5MmIyZDNlMzEzIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTog
S29lbiBLb29pIDxrb2VuQGRvbWluaW9uLnRocnVoZXJlLm5ldD4KIERhdGU6IFN1biwgMzAgSmFu
IDIwMTEgMTY6Mzc6MjcgKzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0gZG9uJ3QgdHJ5IHRvIHJ1biBn
ZW5lcmF0ZWQgYmluYXJpZXMKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9jdXBz
L2N1cHMvMDAwNC1jdXBzLWZpeC1tdWx0aWxpYi1pbnN0YWxsLWZpbGUtY29uZmxpY3RzLnBhdGNo
IGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2N1cHMvY3Vwcy8wMDA0LWN1cHMtZml4LW11bHRpbGli
LWluc3RhbGwtZmlsZS1jb25mbGljdHMucGF0Y2gKaW5kZXggMzEzMzg4MjJlNi4uMjcyOGZjN2Uz
YyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2N1cHMvY3Vwcy8wMDA0LWN1cHMt
Zml4LW11bHRpbGliLWluc3RhbGwtZmlsZS1jb25mbGljdHMucGF0Y2gKKysrIGIvbWV0YS9yZWNp
cGVzLWV4dGVuZGVkL2N1cHMvY3Vwcy8wMDA0LWN1cHMtZml4LW11bHRpbGliLWluc3RhbGwtZmls
ZS1jb25mbGljdHMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDg4MGJhZDJjNmIwOGFmZDJl
MmUzMDNiYzNjZWVhNTU5ZWRiZTc2ZDIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDUz
YWVmZjg1NjkyY2UzZmQwYWMzMjVlYzdkY2RmZjMxNzQ4Y2NlZTYgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCiBGcm9tOiBLYWkgS2FuZyA8a2FpLmthbmdAd2luZHJpdmVyLmNvbT4KIERhdGU6IFdl
ZCwgMyBPY3QgMjAxOCAwMDoyNzoxMSArMDgwMAogU3ViamVjdDogW1BBVENIXSBjdXBzOiBmaXgg
bXVsdGlsaWIgaW5zdGFsbCBmaWxlIGNvbmZsaWN0cwpAQCAtMTUsMTAgKzE1LDEwIEBAIFNpZ25l
ZC1vZmYtYnk6IEthaSBLYW5nIDxrYWkua2FuZ0B3aW5kcml2ZXIuY29tPgogIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvY29uZi9j
dXBzLWZpbGVzLmNvbmYuaW4gYi9jb25mL2N1cHMtZmlsZXMuY29uZi5pbgotaW5kZXggZjk2Zjc0
NS4uMjdkOGJlOSAxMDA2NDQKK2luZGV4IDZkYjEzOTIuLmJjOTk5ZTQgMTAwNjQ0CiAtLS0gYS9j
b25mL2N1cHMtZmlsZXMuY29uZi5pbgogKysrIGIvY29uZi9jdXBzLWZpbGVzLmNvbmYuaW4KLUBA
IC03MCw3ICs3MCw3IEBAIFBhZ2VMb2cgQENVUFNfTE9HRElSQC9wYWdlX2xvZworQEAgLTczLDcg
KzczLDcgQEAgUGFnZUxvZyBAQ1VQU19MT0dESVJAL3BhZ2VfbG9nCiAgI1JlcXVlc3RSb290IEBD
VVBTX1JFUVVFU1RTQAogIAogICMgTG9jYXRpb24gb2YgaGVscGVyIHByb2dyYW1zLi4uCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvY3Vwcy9jdXBzL2xpYmV4ZWNkaXIucGF0Y2gg
Yi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvY3Vwcy9jdXBzL2xpYmV4ZWNkaXIucGF0Y2gKaW5kZXgg
NDkzYzc5NzBlYS4uNGFjZmYyN2U1NCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVk
L2N1cHMvY3Vwcy9saWJleGVjZGlyLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9j
dXBzL2N1cHMvbGliZXhlY2Rpci5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNGFlN2FkODdh
YTAyMmY1MTI4YmUyMjJkZmZiZjBjNTBlYzZlODQ2ZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
K0Zyb20gZmFiNTdkYmFmY2NlZTg1MWIyMmI3NTdmMDhmYzMyNzNhZDc4YjhhZSBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKIEZyb206IFJvc3MgQnVydG9uIDxyb3NzLmJ1cnRvbkBhcm0uY29tPgog
RGF0ZTogVHVlLCAxMyBKdWwgMjAyMSAxMjo1NjozMCArMDEwMAogU3ViamVjdDogW1BBVENIXSBV
c2UgJGxpYmV4ZWNkaXIgaW5zdGVhZCBvZiBoYXJkY29kaW5nICRwcmVmaXgvbGliIGFzIHRoaXMK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9jdXBzL2N1cHNfMi40LjE1LmJiIGIv
bWV0YS9yZWNpcGVzLWV4dGVuZGVkL2N1cHMvY3Vwc18yLjQuMTYuYmIKc2ltaWxhcml0eSBpbmRl
eCA1MSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2N1cHMvY3Vwc18yLjQuMTUu
YmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9jdXBzL2N1cHNfMi40LjE2LmJiCmlu
ZGV4IGRjMjI3NzFkYjMuLjZjMDhlNDk3MjggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRl
bmRlZC9jdXBzL2N1cHNfMi40LjE1LmJiCisrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9jdXBz
L2N1cHNfMi40LjE2LmJiCkBAIC0yLDQgKzIsNCBAQCByZXF1aXJlIGN1cHMuaW5jCiAKIExJQ19G
SUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTNiODNlZjk2Mzg3ZjE0NjU1ZmM4NTRk
ZGMzYzZiZDU3IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZWZmMGJiZDQ4ZmYxYWJjYmI4ZTQ2
ZTI4ZTg1YWVmYWZmYTM5MWExZDljNGQ4ZGM5MmFiMzgyMmExMzAwOGQ3ZiIKK1NSQ19VUklbc2hh
MjU2c3VtXSA9ICIwMzM5NTg3MjA0YjRmOTQyOGRkMDU5MmViMzAxZGVjMGJmOWVhNmVhOGRjZTVk
OTY5MGQ1NmJlNTg1YWJhOTJkIgotLSAKMi40Ny4xCgo=

--===============5385244236398516710==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/cups/cups-dbg: PKGSIZE changed from 8816088 to 8816248 (+0%)
packages/x86-64-v3-poky-linux/cups/cups-dbg: PKGV changed from 2.4.15 [default] to 2.4.16 [default]
packages/x86-64-v3-poky-linux/cups/cups-dbg: PV changed from "2.4.15" to "2.4.16"
packages/x86-64-v3-poky-linux/cups/cups-dev: PKGV changed from 2.4.15 [default] to 2.4.16 [default]
packages/x86-64-v3-poky-linux/cups/cups-dev: PV changed from "2.4.15" to "2.4.16"
packages/x86-64-v3-poky-linux/cups/cups-doc: PKGV changed from 2.4.15 [default] to 2.4.16 [default]
packages/x86-64-v3-poky-linux/cups/cups-doc: PV changed from "2.4.15" to "2.4.16"
packages/x86-64-v3-poky-linux/cups/cups-lib: PKGV changed from 2.4.15 [default] to 2.4.16 [default]
packages/x86-64-v3-poky-linux/cups/cups-lib: PV changed from "2.4.15" to "2.4.16"
packages/x86-64-v3-poky-linux/cups/cups-libimage: PKGV changed from 2.4.15 [default] to 2.4.16 [default]
packages/x86-64-v3-poky-linux/cups/cups-libimage: PV changed from "2.4.15" to "2.4.16"
packages/x86-64-v3-poky-linux/cups/cups-locale-ca: PKGV changed from 2.4.15 [default] to 2.4.16 [default]
packages/x86-64-v3-poky-linux/cups/cups-locale-ca: PV changed from "2.4.15" to "2.4.16"
packages/x86-64-v3-poky-linux/cups/cups-locale-cs: PKGV changed from 2.4.15 [default] to 2.4.16 [default]
packages/x86-64-v3-poky-linux/cups/cups-locale-cs: PV changed from "2.4.15" to "2.4.16"
packages/x86-64-v3-poky-linux/cups/cups-locale-da: PKGV changed from 2.4.15 [default] to 2.4.16 [default]
packages/x86-64-v3-poky-linux/cups/cups-locale-da: PV changed from "2.4.15" to "2.4.16"
packages/x86-64-v3-poky-linux/cups/cups-locale-de: PKGV changed from 2.4.15 [default] to 2.4.16 [default]
packages/x86-64-v3-poky-linux/cups/cups-locale-de: PV changed from "2.4.15" to "2.4.16"
packages/x86-64-v3-poky-linux/cups/cups-locale-en: PKGV changed from 2.4.15 [default] to 2.4.16 [default]
packages/x86-64-v3-poky-linux/cups/cups-locale-en: PV changed from "2.4.15" to "2.4.16"
packages/x86-64-v3-poky-linux/cups/cups-locale-es: PKGV changed from 2.4.15 [default] to 2.4.16 [default]
packages/x86-64-v3-poky-linux/cups/cups-locale-es: PV changed from "2.4.15" to "2.4.16"
packages/x86-64-v3-poky-linux/cups/cups-locale-fr: PKGV changed from 2.4.15 [default] to 2.4.16 [default]
packages/x86-64-v3-poky-linux/cups/cups-locale-fr: PV changed from "2.4.15" to "2.4.16"
packages/x86-64-v3-poky-linux/cups/cups-locale-it: PKGV changed from 2.4.15 [default] to 2.4.16 [default]
packages/x86-64-v3-poky-linux/cups/cups-locale-it: PV changed from "2.4.15" to "2.4.16"
packages/x86-64-v3-poky-linux/cups/cups-locale-ja: PKGV changed from 2.4.15 [default] to 2.4.16 [default]
packages/x86-64-v3-poky-linux/cups/cups-locale-ja: PV changed from "2.4.15" to "2.4.16"
packages/x86-64-v3-poky-linux/cups/cups-locale-pt-br: PKGV changed from 2.4.15 [default] to 2.4.16 [default]
packages/x86-64-v3-poky-linux/cups/cups-locale-pt-br: PV changed from "2.4.15" to "2.4.16"
packages/x86-64-v3-poky-linux/cups/cups-locale-ru: PKGV changed from 2.4.15 [default] to 2.4.16 [default]
packages/x86-64-v3-poky-linux/cups/cups-locale-ru: PV changed from "2.4.15" to "2.4.16"
packages/x86-64-v3-poky-linux/cups/cups-locale-zh-cn: PKGV changed from 2.4.15 [default] to 2.4.16 [default]
packages/x86-64-v3-poky-linux/cups/cups-locale-zh-cn: PV changed from "2.4.15" to "2.4.16"
packages/x86-64-v3-poky-linux/cups/cups-src: FILELIST: directory renamed /usr/src/debug/cups/2.4.15/ppdc -> /usr/src/debug/cups/2.4.16/ppdc, directory renamed /usr/src/debug/cups/2.4.15/berkeley -> /usr/src/debug/cups/2.4.16/berkeley, directory renamed /usr/src/debug/cups/2.4.15/notifier -> /usr/src/debug/cups/2.4.16/notifier, directory renamed /usr/src/debug/cups/2.4.15/backend -> /usr/src/debug/cups/2.4.16/backend, directory renamed /usr/src/debug/cups/2.4.15/systemv -> /usr/src/debug/cups/2.4.16/systemv, directory renamed /usr/src/debug/cups/2.4.15/cgi-bin -> /usr/src/debug/cups/2.4.16/cgi-bin, directory renamed /usr/src/debug/cups/2.4.15/cups -> /usr/src/debug/cups/2.4.16/cups, directory renamed /usr/src/debug/cups/2.4.15/scheduler -> /usr/src/debug/cups/2.4.16/scheduler, directory renamed /usr/src/debug/cups/2.4.15/monitor -> /usr/src/debug/cups/2.4.16/monitor, directory renamed /usr/src/debug/cups/2.4.15/tools -> /usr/src/debug/cups/2.4.16/tools, directory renamed /usr/src/debu
 g/cups/2.4.15/filter -> /usr/src/debug/cups/2.4.16/filter
packages/x86-64-v3-poky-linux/cups/cups-src: PKGSIZE changed from 5984732 to 5984804 (+0%)
packages/x86-64-v3-poky-linux/cups/cups-src: PKGV changed from 2.4.15 [default] to 2.4.16 [default]
packages/x86-64-v3-poky-linux/cups/cups-src: PV changed from "2.4.15" to "2.4.16"
packages/x86-64-v3-poky-linux/cups/cups-staticdev: PKGV changed from 2.4.15 [default] to 2.4.16 [default]
packages/x86-64-v3-poky-linux/cups/cups-staticdev: PV changed from "2.4.15" to "2.4.16"
packages/x86-64-v3-poky-linux/cups/cups-webif: PKGV changed from 2.4.15 [default] to 2.4.16 [default]
packages/x86-64-v3-poky-linux/cups/cups-webif: PV changed from "2.4.15" to "2.4.16"
packages/x86-64-v3-poky-linux/cups/cups: PKGV changed from 2.4.15 [default] to 2.4.16 [default]
packages/x86-64-v3-poky-linux/cups/cups: PV changed from "2.4.15" to "2.4.16"
packages/x86-64-v3-poky-linux/cups: SRC_URI changed from "https://github.com/OpenPrinting/cups/releases/download/v2.4.15/cups-2.4.15-source.tar.gz file://0001-use-echo-only-in-init.patch file://0002-don-t-try-to-run-generated-binaries.patch file://libexecdir.patch file://0004-cups-fix-multilib-install-file-conflicts.patch file://volatiles.99_cups file://cups-volatiles.conf" to "https://github.com/OpenPrinting/cups/releases/download/v2.4.16/cups-2.4.16-source.tar.gz file://0001-use-echo-only-in-init.patch file://0002-don-t-try-to-run-generated-binaries.patch file://libexecdir.patch file://0004-cups-fix-multilib-install-file-conflicts.patch file://volatiles.99_cups file://cups-volatiles.conf"
packages/x86-64-v3-poky-linux/cups: PKGV changed from 2.4.15 [default] to 2.4.16 [default]
packages/x86-64-v3-poky-linux/cups: PV changed from "2.4.15" to "2.4.16"

--===============5385244236398516710==--

