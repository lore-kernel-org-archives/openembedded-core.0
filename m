Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10C0DCD3431
	for <webhook@archiver.kernel.org>; Fri,  1 May 2026 14:25:54 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15620.1777645536402545244
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 May 2026 07:25:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=GARYxkcx;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=oqNbFiQW;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019de3ee778e-a835b6b9-4ea2-41d6-9206-104fe9e0d077-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1777645549;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=q+bGJlmNjqbOXG3MgjnqF637+RoQbE+FiQSafvL++eY=;
	b=GARYxkcxoshLU0qyWrVygCybEj1ZvCCzzgUorGqca1+srIV71/yUFKt7LMOKGiBa
	KobbBLYerHh87NfNm8LD+8M3EXf85+pTDjUqcqLLzUFDCbuEne7EdZqOD0E/LkSZ2/f
	umRqlkLrn20mLashT0g1MFZ9HW/JvrA7w8gxvO70=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1777645549;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=q+bGJlmNjqbOXG3MgjnqF637+RoQbE+FiQSafvL++eY=;
	b=oqNbFiQWTuPdz7PcSQbAdaruF/qn3LRzVmV7xpa3cmqIjm3BnQLW4UqV3bJc0AXE
	+Qo8B/Olme0EO5igeXRKi1LxZ4um1VyMPVVYC/eR4t0q/Uv6y184mia2Ju/Ftl40HDO
	yOd1bCUNBCVXv/lspN0jKBBp+611CAiZX0OaCxD4=
Content-Type: multipart/mixed; boundary="===============5553008532091493829=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libxmlb: upgrading to 0.3.26 SUCCEEDED
Message-ID: <0101019de3ee778e-a835b6b9-4ea2-41d6-9206-104fe9e0d077-000000@us-west-2.amazonses.com>
Date: Fri, 1 May 2026 14:25:49 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 May 2026 14:25:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236268

--===============5553008532091493829==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libxmlb* to *0.3.26* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libxmlb-upgrade-0.3.25-0.3.26.patch
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
From 3ce01b36b85250a4a5f8dcc56617b1167f80c5f9 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 May 2026 11:48:32 +0000
Subject: [PATCH] libxmlb: upgrade 0.3.25 -> 0.3.26

---
 .../libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch | 6 +++---
 .../libxmlb/{libxmlb_0.3.25.bb => libxmlb_0.3.26.bb}        | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-gnome/libxmlb/{libxmlb_0.3.25.bb => libxmlb_0.3.26.bb} (93%)

diff --git a/meta/recipes-gnome/libxmlb/libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch b/meta/recipes-gnome/libxmlb/libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch
index 1c46f6fc1e..96707c2b0f 100644
--- a/meta/recipes-gnome/libxmlb/libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch
+++ b/meta/recipes-gnome/libxmlb/libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch
@@ -1,4 +1,4 @@
-From 2dbc50d49e2048f7227c406931a69f747e0eb12c Mon Sep 17 00:00:00 2001
+From 463658f88ed0c3d0b41a5f9e546d00e574f44e79 Mon Sep 17 00:00:00 2001
 From: Markus Volk <f_l_k@t-online.de>
 Date: Sat, 16 Sep 2023 14:02:57 +0200
 Subject: [PATCH] xb-self-test.c: hardcode G_TEST_SRCDIR
@@ -18,10 +18,10 @@ Signed-off-by: Markus Volk <f_l_k@t-online.de>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/xb-self-test.c b/src/xb-self-test.c
-index 76b2e12..c68c13a 100644
+index ce2ced7..aa60b6b 100644
 --- a/src/xb-self-test.c
 +++ b/src/xb-self-test.c
-@@ -2912,7 +2912,7 @@ xb_speed_func(void)
+@@ -2960,7 +2960,7 @@ xb_speed_func(void)
  int
  main(int argc, char **argv)
  {
diff --git a/meta/recipes-gnome/libxmlb/libxmlb_0.3.25.bb b/meta/recipes-gnome/libxmlb/libxmlb_0.3.26.bb
similarity index 93%
rename from meta/recipes-gnome/libxmlb/libxmlb_0.3.25.bb
rename to meta/recipes-gnome/libxmlb/libxmlb_0.3.26.bb
index 8687436052..b736346a8f 100644
--- a/meta/recipes-gnome/libxmlb/libxmlb_0.3.25.bb
+++ b/meta/recipes-gnome/libxmlb/libxmlb_0.3.26.bb
@@ -8,7 +8,7 @@ SRC_URI = " \
 	file://0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch \
 	file://run-ptest \
 "
-SRCREV = "b31dec072f4428123db3866c18bf32bc5db04d35"
+SRCREV = "f969b4dd491a7367f7500f55f576c810985363d7"
 
 DEPENDS = "glib-2.0 xz zstd"
 
-- 
2.47.1


--===============5553008532091493829==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libxmlb-upgrade-0.3.25-0.3.26.patch"

RnJvbSAzY2UwMWIzNmI4NTI1MGE0YTVmOGRjYzU2NjE3YjExNjdmODBjNWY5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBNYXkgMjAyNiAxMTo0ODozMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnhtbGI6IHVwZ3JhZGUgMC4zLjI1IC0+IDAuMy4yNgoKLS0tCiAuLi4vbGlieG1sYi8wMDAxLXhi
LXNlbGZ0ZXN0LmMtaGFyZGNvZGUtR19URVNUX1NSQ0RJUi5wYXRjaCB8IDYgKysrLS0tCiAuLi4v
bGlieG1sYi97bGlieG1sYl8wLjMuMjUuYmIgPT4gbGlieG1sYl8wLjMuMjYuYmJ9ICAgICAgICB8
IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1nbm9tZS9saWJ4bWxiL3tsaWJ4bWxiXzAuMy4yNS5iYiA9PiBs
aWJ4bWxiXzAuMy4yNi5iYn0gKDkzJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ25vbWUv
bGlieG1sYi9saWJ4bWxiLzAwMDEteGItc2VsZnRlc3QuYy1oYXJkY29kZS1HX1RFU1RfU1JDRElS
LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWdub21lL2xpYnhtbGIvbGlieG1sYi8wMDAxLXhiLXNlbGZ0
ZXN0LmMtaGFyZGNvZGUtR19URVNUX1NSQ0RJUi5wYXRjaAppbmRleCAxYzQ2ZjZmYzFlLi45Njcw
N2MyYjBmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ25vbWUvbGlieG1sYi9saWJ4bWxiLzAw
MDEteGItc2VsZnRlc3QuYy1oYXJkY29kZS1HX1RFU1RfU1JDRElSLnBhdGNoCisrKyBiL21ldGEv
cmVjaXBlcy1nbm9tZS9saWJ4bWxiL2xpYnhtbGIvMDAwMS14Yi1zZWxmdGVzdC5jLWhhcmRjb2Rl
LUdfVEVTVF9TUkNESVIucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDJkYmM1MGQ0OWUyMDQ4
ZjcyMjdjNDA2OTMxYTY5Zjc0N2UwZWIxMmMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9t
IDQ2MzY1OGY4OGVkMGMzZDBiNDFhNWY5ZTU0NmQwMGU1NzRmNDRlNzkgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCiBGcm9tOiBNYXJrdXMgVm9sayA8Zl9sX2tAdC1vbmxpbmUuZGU+CiBEYXRlOiBT
YXQsIDE2IFNlcCAyMDIzIDE0OjAyOjU3ICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hdIHhiLXNlbGYt
dGVzdC5jOiBoYXJkY29kZSBHX1RFU1RfU1JDRElSCkBAIC0xOCwxMCArMTgsMTAgQEAgU2lnbmVk
LW9mZi1ieTogTWFya3VzIFZvbGsgPGZfbF9rQHQtb25saW5lLmRlPgogIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvc3JjL3hiLXNl
bGYtdGVzdC5jIGIvc3JjL3hiLXNlbGYtdGVzdC5jCi1pbmRleCA3NmIyZTEyLi5jNjhjMTNhIDEw
MDY0NAoraW5kZXggY2UyY2VkNy4uYWE2MGI2YiAxMDA2NDQKIC0tLSBhL3NyYy94Yi1zZWxmLXRl
c3QuYwogKysrIGIvc3JjL3hiLXNlbGYtdGVzdC5jCi1AQCAtMjkxMiw3ICsyOTEyLDcgQEAgeGJf
c3BlZWRfZnVuYyh2b2lkKQorQEAgLTI5NjAsNyArMjk2MCw3IEBAIHhiX3NwZWVkX2Z1bmModm9p
ZCkKICBpbnQKICBtYWluKGludCBhcmdjLCBjaGFyICoqYXJndikKICB7CmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZ25vbWUvbGlieG1sYi9saWJ4bWxiXzAuMy4yNS5iYiBiL21ldGEvcmVjaXBl
cy1nbm9tZS9saWJ4bWxiL2xpYnhtbGJfMC4zLjI2LmJiCnNpbWlsYXJpdHkgaW5kZXggOTMlCnJl
bmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1nbm9tZS9saWJ4bWxiL2xpYnhtbGJfMC4zLjI1LmJiCnJl
bmFtZSB0byBtZXRhL3JlY2lwZXMtZ25vbWUvbGlieG1sYi9saWJ4bWxiXzAuMy4yNi5iYgppbmRl
eCA4Njg3NDM2MDUyLi5iNzM2MzQ2YThmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ25vbWUv
bGlieG1sYi9saWJ4bWxiXzAuMy4yNS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ25vbWUvbGlieG1s
Yi9saWJ4bWxiXzAuMy4yNi5iYgpAQCAtOCw3ICs4LDcgQEAgU1JDX1VSSSA9ICIgXAogCWZpbGU6
Ly8wMDAxLXhiLXNlbGZ0ZXN0LmMtaGFyZGNvZGUtR19URVNUX1NSQ0RJUi5wYXRjaCBcCiAJZmls
ZTovL3J1bi1wdGVzdCBcCiAiCi1TUkNSRVYgPSAiYjMxZGVjMDcyZjQ0MjgxMjNkYjM4NjZjMThi
ZjMyYmM1ZGIwNGQzNSIKK1NSQ1JFViA9ICJmOTY5YjRkZDQ5MWE3MzY3Zjc1MDBmNTVmNTc2Yzgx
MDk4NTM2M2Q3IgogCiBERVBFTkRTID0gImdsaWItMi4wIHh6IHpzdGQiCiAKLS0gCjIuNDcuMQoK

--===============5553008532091493829==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libxmlb: PKGV changed from 0.3.25 [default] to 0.3.26 [default]
packages/x86-64-v3-poky-linux/libxmlb: PV changed from "0.3.25" to "0.3.26"
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-bin: PKGV changed from 0.3.25 [default] to 0.3.26 [default]
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-bin: PV changed from "0.3.25" to "0.3.26"
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-dbg: PKGV changed from 0.3.25 [default] to 0.3.26 [default]
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-dbg: PKGSIZE changed from 1870968 to 1897720 (+1%)
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-dbg: PV changed from "0.3.25" to "0.3.26"
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-dev: PKGV changed from 0.3.25 [default] to 0.3.26 [default]
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-dev: PKGSIZE changed from 355644 to 355651 (+0%)
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-dev: PV changed from "0.3.25" to "0.3.26"
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-doc: PKGV changed from 0.3.25 [default] to 0.3.26 [default]
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-doc: PV changed from "0.3.25" to "0.3.26"
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-locale: PKGV changed from 0.3.25 [default] to 0.3.26 [default]
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-locale: PV changed from "0.3.25" to "0.3.26"
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-ptest: PKGV changed from 0.3.25 [default] to 0.3.26 [default]
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-ptest: PKGSIZE changed from 277094 to 281190 (+1%)
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-ptest: PV changed from "0.3.25" to "0.3.26"
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-src: FILELIST: directory renamed /usr/src/debug/libxmlb/0.3.25/src -> /usr/src/debug/libxmlb/0.3.26/src
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-src: PKGV changed from 0.3.25 [default] to 0.3.26 [default]
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-src: PKGSIZE changed from 519007 to 524066 (+1%)
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-src: PV changed from "0.3.25" to "0.3.26"
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-staticdev: PKGV changed from 0.3.25 [default] to 0.3.26 [default]
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-staticdev: PV changed from "0.3.25" to "0.3.26"
packages/x86-64-v3-poky-linux/libxmlb/libxmlb: PKGV changed from 0.3.25 [default] to 0.3.26 [default]
packages/x86-64-v3-poky-linux/libxmlb/libxmlb: PV changed from "0.3.25" to "0.3.26"

--===============5553008532091493829==--

