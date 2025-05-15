Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FECFC54799
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 12:31:49 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.11257.1747312308478905269
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 May 2025 05:31:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=fbkt2i1b;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=HHBPzo9b;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010196d3eded47-3e8e7500-6d59-41c7-b0a1-75baa9d315e8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1747312307;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=JezgYF5J3U4snCLSSl7Kbswg1QQM6GDh8dEuyrELRs0=;
	b=fbkt2i1b5K62q9op8lB0XiUbjhr/xTIpLn0zSc8AXCqLdvmg5WXfy2T1IFTbXVW2
	c8XYFOoOeoVeNVKvsp0IHduLcAZKlFgQMU1x/f2ddbgmYe9qI7iTmTzTrZOuXD/SV6T
	3xta/Wdgvmf+/hAKiDQY9oUD412QD73UzcWBjbZo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1747312307;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=JezgYF5J3U4snCLSSl7Kbswg1QQM6GDh8dEuyrELRs0=;
	b=HHBPzo9bM58mhbbY4oOQli4SQZDvc13NK50hNvbXdO1NCOK0jQpHu9aF8SDpGAX1
	zG0z5HhX7u0N2bFK6aVnr7egO4WYefG6A9MYeYrm8bOfSC/hZh3ZGDzOmPTCfODxCH6
	lKOcS593rK6z+hFbqsRmyP4OpHJNvN21LVvPaDZY=
Content-Type: multipart/mixed; boundary="===============3419649518332854733=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] openssh: upgrading to 10.0p1 SUCCEEDED
Message-ID: <01010196d3eded47-3e8e7500-6d59-41c7-b0a1-75baa9d315e8-000000@us-west-2.amazonses.com>
Date: Thu, 15 May 2025 12:31:47 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 12:31:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216587

--===============3419649518332854733==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *openssh* to *10.0p1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-openssh-upgrade-9.9p2-10.0p1.patch
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
From 08e5ac05fa7e44cfb4142fda7a392c1d0988217f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 May 2025 06:59:22 +0000
Subject: [PATCH] openssh: upgrade 9.9p2 -> 10.0p1

---
 ...gress-banner.sh-log-input-and-output-files-on-erro.patch | 2 +-
 ...gress-test-exec-use-the-absolute-path-in-the-SSH-e.patch | 6 +++---
 .../openssh/{openssh_9.9p2.bb => openssh_10.0p1.bb}         | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-connectivity/openssh/{openssh_9.9p2.bb => openssh_10.0p1.bb} (99%)

diff --git a/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-input-and-output-files-on-erro.patch b/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-input-and-output-files-on-erro.patch
index f424288e37..2bcf8ee29a 100644
--- a/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-input-and-output-files-on-erro.patch
+++ b/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-input-and-output-files-on-erro.patch
@@ -1,4 +1,4 @@
-From 5cc897fe2effe549e1e280c2f606bce8b532b61e Mon Sep 17 00:00:00 2001
+From e31f9f9beff993932957e9942c2dc2f851f423c8 Mon Sep 17 00:00:00 2001
 From: Mikko Rapeli <mikko.rapeli@linaro.org>
 Date: Mon, 11 Sep 2023 09:55:21 +0100
 Subject: [PATCH] regress/banner.sh: log input and output files on error
diff --git a/meta/recipes-connectivity/openssh/openssh/0001-regress-test-exec-use-the-absolute-path-in-the-SSH-e.patch b/meta/recipes-connectivity/openssh/openssh/0001-regress-test-exec-use-the-absolute-path-in-the-SSH-e.patch
index b90cd2e69d..c360cfac76 100644
--- a/meta/recipes-connectivity/openssh/openssh/0001-regress-test-exec-use-the-absolute-path-in-the-SSH-e.patch
+++ b/meta/recipes-connectivity/openssh/openssh/0001-regress-test-exec-use-the-absolute-path-in-the-SSH-e.patch
@@ -1,4 +1,4 @@
-From fb762172fb678fe29327b667f8fe7380962a4540 Mon Sep 17 00:00:00 2001
+From ec64b6605ee549afcf9b96f9e6b197bc5a36cc06 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <jose.quaresma@foundries.io>
 Date: Mon, 15 Jul 2024 18:43:08 +0100
 Subject: [PATCH] regress/test-exec: use the absolute path in the SSH env
@@ -18,10 +18,10 @@ Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
  1 file changed, 5 insertions(+)
 
 diff --git a/regress/test-exec.sh b/regress/test-exec.sh
-index 7afc2807..175f554b 100644
+index 8a00c72..2891f27 100644
 --- a/regress/test-exec.sh
 +++ b/regress/test-exec.sh
-@@ -175,6 +175,11 @@ if [ "x$TEST_SSH_OPENSSL" != "x" ]; then
+@@ -179,6 +179,11 @@ if [ "x$TEST_SSH_OPENSSL" != "x" ]; then
  fi
  
  # Path to sshd must be absolute for rexec
diff --git a/meta/recipes-connectivity/openssh/openssh_9.9p2.bb b/meta/recipes-connectivity/openssh/openssh_10.0p1.bb
similarity index 99%
rename from meta/recipes-connectivity/openssh/openssh_9.9p2.bb
rename to meta/recipes-connectivity/openssh/openssh_10.0p1.bb
index 5191725796..21e1e50759 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.9p2.bb
+++ b/meta/recipes-connectivity/openssh/openssh_10.0p1.bb
@@ -26,7 +26,7 @@ SRC_URI = "https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.ta
            file://0001-regress-banner.sh-log-input-and-output-files-on-erro.patch \
            file://0001-regress-test-exec-use-the-absolute-path-in-the-SSH-e.patch \
            "
-SRC_URI[sha256sum] = "91aadb603e08cc285eddf965e1199d02585fa94d994d6cae5b41e1721e215673"
+SRC_URI[sha256sum] = "021a2e709a0edf4250b1256bd5a9e500411a90dddabea830ed59cef90eb9d85c"
 
 CVE_STATUS[CVE-2007-2768] = "not-applicable-config: This CVE is specific to OpenSSH with the pam opie which we don't build/use here."
 
-- 
2.47.1


--===============3419649518332854733==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-openssh-upgrade-9.9p2-10.0p1.patch"

RnJvbSAwOGU1YWMwNWZhN2U0NGNmYjQxNDJmZGE3YTM5MmMxZDA5ODgyMTdmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgTWF5IDIwMjUgMDY6NTk6MjIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBv
cGVuc3NoOiB1cGdyYWRlIDkuOXAyIC0+IDEwLjBwMQoKLS0tCiAuLi5ncmVzcy1iYW5uZXIuc2gt
bG9nLWlucHV0LWFuZC1vdXRwdXQtZmlsZXMtb24tZXJyby5wYXRjaCB8IDIgKy0KIC4uLmdyZXNz
LXRlc3QtZXhlYy11c2UtdGhlLWFic29sdXRlLXBhdGgtaW4tdGhlLVNTSC1lLnBhdGNoIHwgNiAr
KystLS0KIC4uLi9vcGVuc3NoL3tvcGVuc3NoXzkuOXAyLmJiID0+IG9wZW5zc2hfMTAuMHAxLmJi
fSAgICAgICAgIHwgMiArLQogMyBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDUgZGVs
ZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NoL3tvcGVu
c3NoXzkuOXAyLmJiID0+IG9wZW5zc2hfMTAuMHAxLmJifSAoOTklKQoKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzaC9vcGVuc3NoLzAwMDEtcmVncmVzcy1iYW5u
ZXIuc2gtbG9nLWlucHV0LWFuZC1vdXRwdXQtZmlsZXMtb24tZXJyby5wYXRjaCBiL21ldGEvcmVj
aXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzaC9vcGVuc3NoLzAwMDEtcmVncmVzcy1iYW5uZXIuc2gt
bG9nLWlucHV0LWFuZC1vdXRwdXQtZmlsZXMtb24tZXJyby5wYXRjaAppbmRleCBmNDI0Mjg4ZTM3
Li4yYmNmOGVlMjlhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5z
c2gvb3BlbnNzaC8wMDAxLXJlZ3Jlc3MtYmFubmVyLnNoLWxvZy1pbnB1dC1hbmQtb3V0cHV0LWZp
bGVzLW9uLWVycm8ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3No
L29wZW5zc2gvMDAwMS1yZWdyZXNzLWJhbm5lci5zaC1sb2ctaW5wdXQtYW5kLW91dHB1dC1maWxl
cy1vbi1lcnJvLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA1Y2M4OTdmZTJlZmZlNTQ5ZTFl
MjgwYzJmNjA2YmNlOGI1MzJiNjFlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBlMzFm
OWY5YmVmZjk5MzkzMjk1N2U5OTQyYzJkYzJmODUxZjQyM2M4IE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQogRnJvbTogTWlra28gUmFwZWxpIDxtaWtrby5yYXBlbGlAbGluYXJvLm9yZz4KIERhdGU6
IE1vbiwgMTEgU2VwIDIwMjMgMDk6NTU6MjEgKzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0gcmVncmVz
cy9iYW5uZXIuc2g6IGxvZyBpbnB1dCBhbmQgb3V0cHV0IGZpbGVzIG9uIGVycm9yCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2gvb3BlbnNzaC8wMDAxLXJlZ3Jl
c3MtdGVzdC1leGVjLXVzZS10aGUtYWJzb2x1dGUtcGF0aC1pbi10aGUtU1NILWUucGF0Y2ggYi9t
ZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2gvb3BlbnNzaC8wMDAxLXJlZ3Jlc3MtdGVz
dC1leGVjLXVzZS10aGUtYWJzb2x1dGUtcGF0aC1pbi10aGUtU1NILWUucGF0Y2gKaW5kZXggYjkw
Y2QyZTY5ZC4uYzM2MGNmYWM3NiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0
eS9vcGVuc3NoL29wZW5zc2gvMDAwMS1yZWdyZXNzLXRlc3QtZXhlYy11c2UtdGhlLWFic29sdXRl
LXBhdGgtaW4tdGhlLVNTSC1lLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkv
b3BlbnNzaC9vcGVuc3NoLzAwMDEtcmVncmVzcy10ZXN0LWV4ZWMtdXNlLXRoZS1hYnNvbHV0ZS1w
YXRoLWluLXRoZS1TU0gtZS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZmI3NjIxNzJmYjY3
OGZlMjkzMjdiNjY3ZjhmZTczODA5NjJhNDU0MCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zy
b20gZWM2NGI2NjA1ZWU1NDlhZmNmOWI5NmY5ZTZiMTk3YmM1YTM2Y2MwNiBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKIEZyb206IEpvc2UgUXVhcmVzbWEgPGpvc2UucXVhcmVzbWFAZm91bmRyaWVz
LmlvPgogRGF0ZTogTW9uLCAxNSBKdWwgMjAyNCAxODo0MzowOCArMDEwMAogU3ViamVjdDogW1BB
VENIXSByZWdyZXNzL3Rlc3QtZXhlYzogdXNlIHRoZSBhYnNvbHV0ZSBwYXRoIGluIHRoZSBTU0gg
ZW52CkBAIC0xOCwxMCArMTgsMTAgQEAgU2lnbmVkLW9mZi1ieTogSm9zZSBRdWFyZXNtYSA8am9z
ZS5xdWFyZXNtYUBmb3VuZHJpZXMuaW8+CiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygr
KQogCiBkaWZmIC0tZ2l0IGEvcmVncmVzcy90ZXN0LWV4ZWMuc2ggYi9yZWdyZXNzL3Rlc3QtZXhl
Yy5zaAotaW5kZXggN2FmYzI4MDcuLjE3NWY1NTRiIDEwMDY0NAoraW5kZXggOGEwMGM3Mi4uMjg5
MWYyNyAxMDA2NDQKIC0tLSBhL3JlZ3Jlc3MvdGVzdC1leGVjLnNoCiArKysgYi9yZWdyZXNzL3Rl
c3QtZXhlYy5zaAotQEAgLTE3NSw2ICsxNzUsMTEgQEAgaWYgWyAieCRURVNUX1NTSF9PUEVOU1NM
IiAhPSAieCIgXTsgdGhlbgorQEAgLTE3OSw2ICsxNzksMTEgQEAgaWYgWyAieCRURVNUX1NTSF9P
UEVOU1NMIiAhPSAieCIgXTsgdGhlbgogIGZpCiAgCiAgIyBQYXRoIHRvIHNzaGQgbXVzdCBiZSBh
YnNvbHV0ZSBmb3IgcmV4ZWMKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkv
b3BlbnNzaC9vcGVuc3NoXzkuOXAyLmJiIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVu
c3NoL29wZW5zc2hfMTAuMHAxLmJiCnNpbWlsYXJpdHkgaW5kZXggOTklCnJlbmFtZSBmcm9tIG1l
dGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzaC9vcGVuc3NoXzkuOXAyLmJiCnJlbmFtZSB0
byBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2gvb3BlbnNzaF8xMC4wcDEuYmIKaW5k
ZXggNTE5MTcyNTc5Ni4uMjFlMWU1MDc1OSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5l
Y3Rpdml0eS9vcGVuc3NoL29wZW5zc2hfOS45cDIuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5l
Y3Rpdml0eS9vcGVuc3NoL29wZW5zc2hfMTAuMHAxLmJiCkBAIC0yNiw3ICsyNiw3IEBAIFNSQ19V
UkkgPSAiaHR0cHM6Ly9mdHAub3BlbmJzZC5vcmcvcHViL09wZW5CU0QvT3BlblNTSC9wb3J0YWJs
ZS9vcGVuc3NoLSR7UFZ9LnRhCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLXJlZ3Jlc3MtYmFubmVy
LnNoLWxvZy1pbnB1dC1hbmQtb3V0cHV0LWZpbGVzLW9uLWVycm8ucGF0Y2ggXAogICAgICAgICAg
ICBmaWxlOi8vMDAwMS1yZWdyZXNzLXRlc3QtZXhlYy11c2UtdGhlLWFic29sdXRlLXBhdGgtaW4t
dGhlLVNTSC1lLnBhdGNoIFwKICAgICAgICAgICAgIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjkx
YWFkYjYwM2UwOGNjMjg1ZWRkZjk2NWUxMTk5ZDAyNTg1ZmE5NGQ5OTRkNmNhZTViNDFlMTcyMWUy
MTU2NzMiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMDIxYTJlNzA5YTBlZGY0MjUwYjEyNTZiZDVh
OWU1MDA0MTFhOTBkZGRhYmVhODMwZWQ1OWNlZjkwZWI5ZDg1YyIKIAogQ1ZFX1NUQVRVU1tDVkUt
MjAwNy0yNzY4XSA9ICJub3QtYXBwbGljYWJsZS1jb25maWc6IFRoaXMgQ1ZFIGlzIHNwZWNpZmlj
IHRvIE9wZW5TU0ggd2l0aCB0aGUgcGFtIG9waWUgd2hpY2ggd2UgZG9uJ3QgYnVpbGQvdXNlIGhl
cmUuIgogCi0tIAoyLjQ3LjEKCg==

--===============3419649518332854733==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/openssh: SRC_URI changed from "https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-9.9p2.tar.gz file://sshd_config file://ssh_config file://init file://sshd file://sshd.service file://sshd.socket file://sshd@.service file://sshdgenkeys.service file://volatiles.99_sshd file://run-ptest file://sshd_check_keys file://0001-regress-banner.sh-log-input-and-output-files-on-erro.patch file://0001-regress-test-exec-use-the-absolute-path-in-the-SSH-e.patch" to "https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-10.0p1.tar.gz file://sshd_config file://ssh_config file://init file://sshd file://sshd.service file://sshd.socket file://sshd@.service file://sshdgenkeys.service file://volatiles.99_sshd file://run-ptest file://sshd_check_keys file://0001-regress-banner.sh-log-input-and-output-files-on-erro.patch file://0001-regress-test-exec-use-the-absolute-path-in-the-SSH-e.patch"
packages/core2-64-poky-linux/openssh: PV changed from "9.9p2" to "10.0p1"
packages/core2-64-poky-linux/openssh: PKGV changed from 9.9p2 [default] to 10.0p1 [default]
packages/core2-64-poky-linux/openssh/openssh-dbg: FILELIST: added "/usr/libexec/.debug/sshd-auth"
packages/core2-64-poky-linux/openssh/openssh-dbg: PV changed from "9.9p2" to "10.0p1"
packages/core2-64-poky-linux/openssh/openssh-dbg: PKGV changed from 9.9p2 [default] to 10.0p1 [default]
packages/core2-64-poky-linux/openssh/openssh-dbg: PKGSIZE changed from 25475320 to 28289528 (+11%)
packages/core2-64-poky-linux/openssh/openssh-dev: PV changed from "9.9p2" to "10.0p1"
packages/core2-64-poky-linux/openssh/openssh-dev: PKGV changed from 9.9p2 [default] to 10.0p1 [default]
packages/core2-64-poky-linux/openssh/openssh-doc: PV changed from "9.9p2" to "10.0p1"
packages/core2-64-poky-linux/openssh/openssh-doc: PKGV changed from 9.9p2 [default] to 10.0p1 [default]
packages/core2-64-poky-linux/openssh/openssh-doc: PKGSIZE changed from 346781 to 353134 (+2%)
packages/core2-64-poky-linux/openssh/openssh-keygen: PV changed from "9.9p2" to "10.0p1"
packages/core2-64-poky-linux/openssh/openssh-keygen: PKGV changed from 9.9p2 [default] to 10.0p1 [default]
packages/core2-64-poky-linux/openssh/openssh-keygen: PKGSIZE changed from 547008 to 542912 (-1%)
packages/core2-64-poky-linux/openssh/openssh-locale: PV changed from "9.9p2" to "10.0p1"
packages/core2-64-poky-linux/openssh/openssh-locale: PKGV changed from 9.9p2 [default] to 10.0p1 [default]
packages/core2-64-poky-linux/openssh/openssh-misc: RDEPENDS: added "libpam (['>= 1.7.0']) libxcrypt (['>= 4.4.38'])"
packages/core2-64-poky-linux/openssh/openssh-misc: FILELIST: added "/usr/libexec/sshd-auth"
packages/core2-64-poky-linux/openssh/openssh-misc: PV changed from "9.9p2" to "10.0p1"
packages/core2-64-poky-linux/openssh/openssh-misc: PKGV changed from 9.9p2 [default] to 10.0p1 [default]
packages/core2-64-poky-linux/openssh/openssh-misc: PKGSIZE changed from 2284506 to 3286962 (+44%)
packages/core2-64-poky-linux/openssh/openssh-ptest: FILELIST: added "/usr/lib/openssh/ptest/regress/sftp-resume.sh /usr/lib/openssh/ptest/regress/misc/ssh-verify-attestation/ssh-verify-attestation.c /usr/lib/openssh/ptest/regress/misc/ssh-verify-attestation/Makefile"
packages/core2-64-poky-linux/openssh/openssh-ptest: PV changed from "9.9p2" to "10.0p1"
packages/core2-64-poky-linux/openssh/openssh-ptest: PKGV changed from 9.9p2 [default] to 10.0p1 [default]
packages/core2-64-poky-linux/openssh/openssh-ptest: PKGSIZE changed from 6016874 to 6036375 (+0%)
packages/core2-64-poky-linux/openssh/openssh-scp: PV changed from "9.9p2" to "10.0p1"
packages/core2-64-poky-linux/openssh/openssh-scp: PKGV changed from 9.9p2 [default] to 10.0p1 [default]
packages/core2-64-poky-linux/openssh/openssh-sftp-server: PV changed from "9.9p2" to "10.0p1"
packages/core2-64-poky-linux/openssh/openssh-sftp-server: PKGV changed from 9.9p2 [default] to 10.0p1 [default]
packages/core2-64-poky-linux/openssh/openssh-sftp: PV changed from "9.9p2" to "10.0p1"
packages/core2-64-poky-linux/openssh/openssh-sftp: PKGV changed from 9.9p2 [default] to 10.0p1 [default]
packages/core2-64-poky-linux/openssh/openssh-sftp: PKGSIZE changed from 231824 to 227728 (-2%)
packages/core2-64-poky-linux/openssh/openssh-src: FILELIST: directory renamed /usr/src/debug/openssh/9.9p2/regress/unittests/sshbuf -> /usr/src/debug/openssh/10.0p1/regress/unittests/sshbuf, directory renamed /usr/src/debug/openssh/9.9p2/regress/unittests/authopt -> /usr/src/debug/openssh/10.0p1/regress/unittests/utf8, directory renamed /usr/src/debug/openssh/9.9p2/regress/unittests/hostkeys -> /usr/src/debug/openssh/10.0p1/regress/unittests/hostkeys, directory renamed /usr/src/debug/openssh/9.9p2/regress/unittests/utf8 -> /usr/src/debug/openssh/10.0p1/regress/unittests/bitmap, directory renamed /usr/src/debug/openssh/9.9p2/regress/unittests/sshsig -> /usr/src/debug/openssh/10.0p1/regress/unittests/sshsig, directory renamed /usr/src/debug/openssh/9.9p2/regress/unittests/match -> /usr/src/debug/openssh/10.0p1/regress/unittests/authopt, directory renamed /usr/src/debug/openssh/9.9p2/regress -> /usr/src/debug/openssh/10.0p1/regress, directory renamed /usr/src/debug/openssh/9.9p2/regress
 /unittests/bitmap -> /usr/src/debug/openssh/10.0p1/regress/unittests/match, directory renamed /usr/src/debug/openssh/9.9p2/regress/unittests/kex -> /usr/src/debug/openssh/10.0p1/regress/unittests/kex, directory renamed /usr/src/debug/openssh/9.9p2/regress/unittests/test_helper -> /usr/src/debug/openssh/10.0p1/regress/unittests/test_helper, directory renamed /usr/src/debug/openssh/9.9p2/regress/unittests/sshkey -> /usr/src/debug/openssh/10.0p1/regress/unittests/sshkey, directory renamed /usr/src/debug/openssh/9.9p2/regress/unittests/conversion -> /usr/src/debug/openssh/10.0p1/regress/unittests/conversion, directory renamed /usr/src/debug/openssh/9.9p2/regress/unittests/misc -> /usr/src/debug/openssh/10.0p1/regress/unittests/misc, directory renamed /usr/src/debug/openssh/9.9p2/openbsd-compat -> /usr/src/debug/openssh/10.0p1/openbsd-compat, removed "/usr/src/debug/openssh/9.9p2/authfile.h /usr/src/debug/openssh/9.9p2/misc.h /usr/src/debug/openssh/9.9p2/hmac.h /usr/src/debug/openssh/9.9
 p2/packet.c /usr/src/debug/openssh/9.9p2/monitor_wrap.h /usr/src/debug/openssh/9.9p2/auth-options.h /usr/src/debug/openssh/9.9p2/hmac.c /usr/src/debug/openssh/9.9p2/authfile.c /usr/src/debug/openssh/9.9p2/misc.c /usr/src/debug/openssh/9.9p2/monitor_wrap.c /usr/src/debug/openssh/9.9p2/auth-options.c /usr/src/debug/openssh/9.9p2/ssh-sandbox.h /usr/src/debug/openssh/9.9p2/packet.h /usr/src/debug/openssh/9.9p2/ssh-ed25519.c /usr/src/debug/openssh/9.9p2/ssh-keyscan.c /usr/src/debug/openssh/9.9p2/readconf.c /usr/src/debug/openssh/9.9p2/ssh-keysign.c /usr/src/debug/openssh/9.9p2/bitmap.c /usr/src/debug/openssh/9.9p2/readconf.h /usr/src/debug/openssh/9.9p2/libcrux_mlkem768_sha3.h /usr/src/debug/openssh/9.9p2/bitmap.h /usr/src/debug/openssh/9.9p2/progressmeter.h /usr/src/debug/openssh/9.9p2/progressmeter.c /usr/src/debug/openssh/9.9p2/auth2-pubkeyfile.c /usr/src/debug/openssh/9.9p2/cipher.c /usr/src/debug/openssh/9.9p2/loginrec.c /usr/src/debug/openssh/9.9p2/utf8.c /usr/src/debug/openssh/9.9
 p2/utf8.h /usr/src/debug/openssh/9.9p2/kexgex.c /usr/src/debug/openssh/9.9p2/loginrec.h /usr/src/debug/openssh/9.9p2/cipher.h /usr/src/debug/openssh/9.9p2/kexdh.c /usr/src/debug/openssh/9.9p2/ssh-pkcs11.c /usr/src/debug/openssh/9.9p2/auth2-methods.c /usr/src/debug/openssh/9.9p2/ssh-pkcs11.h /usr/src/debug/openssh/9.9p2/sshlogin.h /usr/src/debug/openssh/9.9p2/kexgexs.c /usr/src/debug/openssh/9.9p2/sshlogin.c /usr/src/debug/openssh/9.9p2/pkcs11.h /usr/src/debug/openssh/9.9p2/kexmlkem768x25519.c /usr/src/debug/openssh/9.9p2/sftp.h /usr/src/debug/openssh/9.9p2/sshconnect.h /usr/src/debug/openssh/9.9p2/sshconnect.c /usr/src/debug/openssh/9.9p2/sftp.c /usr/src/debug/openssh/9.9p2/sftp-usergroup.c /usr/src/debug/openssh/9.9p2/dispatch.h /usr/src/debug/openssh/9.9p2/servconf.c /usr/src/debug/openssh/9.9p2/dispatch.c /usr/src/debug/openssh/9.9p2/sftp-usergroup.h /usr/src/debug/openssh/9.9p2/servconf.h /usr/src/debug/openssh/9.9p2/sshbuf-misc.c /usr/src/debug/openssh/9.9p2/ssh-sk-client.c /us
 r/src/debug/openssh/9.9p2/auth2-hostbased.c /usr/src/debug/openssh/9.9p2/session.c /usr/src/debug/openssh/9.9p2/kexsntrup761x25519.c /usr/src/debug/openssh/9.9p2/canohost.h /usr/src/debug/openssh/9.9p2/session.h /usr/src/debug/openssh/9.9p2/canohost.c /usr/src/debug/openssh/9.9p2/fatal.c /usr/src/debug/openssh/9.9p2/auth.c /usr/src/debug/openssh/9.9p2/authfd.c /usr/src/debug/openssh/9.9p2/hash.c /usr/src/debug/openssh/9.9p2/auth.h /usr/src/debug/openssh/9.9p2/authfd.h /usr/src/debug/openssh/9.9p2/auth2-chall.c /usr/src/debug/openssh/9.9p2/srclimit.h /usr/src/debug/openssh/9.9p2/entropy.c /usr/src/debug/openssh/9.9p2/sntrup761.c /usr/src/debug/openssh/9.9p2/entropy.h /usr/src/debug/openssh/9.9p2/sftp-server-main.c /usr/src/debug/openssh/9.9p2/auth2-kbdint.c /usr/src/debug/openssh/9.9p2/srclimit.c /usr/src/debug/openssh/9.9p2/monitor_fdpass.c /usr/src/debug/openssh/9.9p2/readpass.c /usr/src/debug/openssh/9.9p2/compat.c /usr/src/debug/openssh/9.9p2/xmalloc.h /usr/src/debug/openssh/9.9p
 2/monitor_fdpass.h /usr/src/debug/openssh/9.9p2/xmalloc.c /usr/src/debug/openssh/9.9p2/compat.h /usr/src/debug/openssh/9.9p2/addr.h /usr/src/debug/openssh/9.9p2/ssh-rsa.c /usr/src/debug/openssh/9.9p2/ssh-sk-helper.c /usr/src/debug/openssh/9.9p2/platform-misc.c /usr/src/debug/openssh/9.9p2/addr.c /usr/src/debug/openssh/9.9p2/auth2.c /usr/src/debug/openssh/9.9p2/clientloop.h /usr/src/debug/openssh/9.9p2/mux.c /usr/src/debug/openssh/9.9p2/clientloop.c /usr/src/debug/openssh/9.9p2/moduli.c /usr/src/debug/openssh/9.9p2/platform-listen.c /usr/src/debug/openssh/9.9p2/auth2-passwd.c /usr/src/debug/openssh/9.9p2/sshbuf-io.c /usr/src/debug/openssh/9.9p2/nchan.c /usr/src/debug/openssh/9.9p2/hostfile.c /usr/src/debug/openssh/9.9p2/rijndael.h /usr/src/debug/openssh/9.9p2/hostfile.h /usr/src/debug/openssh/9.9p2/kex-names.c /usr/src/debug/openssh/9.9p2/sshconnect2.c /usr/src/debug/openssh/9.9p2/kexgen.c /usr/src/debug/openssh/9.9p2/dh.h /usr/src/debug/openssh/9.9p2/digest.h /usr/src/debug/openssh/
 9.9p2/ssh-agent.c /usr/src/debug/openssh/9.9p2/ssh-sk.h /usr/src/debug/openssh/9.9p2/dh.c /usr/src/debug/openssh/9.9p2/cipher-chachapoly.h /usr/src/debug/openssh/9.9p2/ed25519.c /usr/src/debug/openssh/9.9p2/cipher-chachapoly-libcrypto.c /usr/src/debug/openssh/9.9p2/digest-openssl.c /usr/src/debug/openssh/9.9p2/monitor.c /usr/src/debug/openssh/9.9p2/poly1305.h /usr/src/debug/openssh/9.9p2/monitor.h /usr/src/debug/openssh/9.9p2/poly1305.c /usr/src/debug/openssh/9.9p2/ssh-keygen.c /usr/src/debug/openssh/9.9p2/addrmatch.c /usr/src/debug/openssh/9.9p2/serverloop.c /usr/src/debug/openssh/9.9p2/uidswap.c /usr/src/debug/openssh/9.9p2/sshtty.c /usr/src/debug/openssh/9.9p2/auth-pam.h /usr/src/debug/openssh/9.9p2/uidswap.h /usr/src/debug/openssh/9.9p2/serverloop.h /usr/src/debug/openssh/9.9p2/sshbuf-getput-crypto.c /usr/src/debug/openssh/9.9p2/auth-pam.c /usr/src/debug/openssh/9.9p2/sftp-glob.c /usr/src/debug/openssh/9.9p2/sshsig.h /usr/src/debug/openssh/9.9p2/sftp-client.c /usr/src/debug/open
 ssh/9.9p2/groupaccess.c /usr/src/debug/openssh/9.9p2/sftp-common.c /usr/src/debug/openssh/9.9p2/sftp-server.c /usr/src/debug/openssh/9.9p2/groupaccess.h /usr/src/debug/openssh/9.9p2/sftp-client.h /usr/src/debug/openssh/9.9p2/sftp-common.h /usr/src/debug/openssh/9.9p2/sshsig.c /usr/src/debug/openssh/9.9p2/scp.c /usr/src/debug/openssh/9.9p2/ssh.c /usr/src/debug/openssh/9.9p2/dns.c /usr/src/debug/openssh/9.9p2/sshbuf-getput-basic.c /usr/src/debug/openssh/9.9p2/platform-pledge.c /usr/src/debug/openssh/9.9p2/kex.c /usr/src/debug/openssh/9.9p2/krl.c /usr/src/debug/openssh/9.9p2/log.c /usr/src/debug/openssh/9.9p2/mac.c /usr/src/debug/openssh/9.9p2/msg.c /usr/src/debug/openssh/9.9p2/dns.h /usr/src/debug/openssh/9.9p2/kex.h /usr/src/debug/openssh/9.9p2/krl.h /usr/src/debug/openssh/9.9p2/log.h /usr/src/debug/openssh/9.9p2/mac.h /usr/src/debug/openssh/9.9p2/msg.h /usr/src/debug/openssh/9.9p2/platform-tracing.c /usr/src/debug/openssh/9.9p2/sftp-realpath.c /usr/src/debug/openssh/9.9p2/sandbox-se
 ccomp-filter.c /usr/src/debug/openssh/9.9p2/umac.h /usr/src/debug/openssh/9.9p2/sshd.c /usr/src/debug/openssh/9.9p2/ssherr.h /usr/src/debug/openssh/9.9p2/sshkey.c /usr/src/debug/openssh/9.9p2/ssherr.c /usr/src/debug/openssh/9.9p2/sshkey.h /usr/src/debug/openssh/9.9p2/cleanup.c /usr/src/debug/openssh/9.9p2/smult_curve25519_ref.c /usr/src/debug/openssh/9.9p2/kexgexc.c /usr/src/debug/openssh/9.9p2/auth2-pubkey.c /usr/src/debug/openssh/9.9p2/kexc25519.c /usr/src/debug/openssh/9.9p2/umac.c /usr/src/debug/openssh/9.9p2/auth-passwd.c /usr/src/debug/openssh/9.9p2/auth-rhosts.c /usr/src/debug/openssh/9.9p2/auth-shadow.c /usr/src/debug/openssh/9.9p2/ssh-ecdsa.c /usr/src/debug/openssh/9.9p2/ssh_api.h /usr/src/debug/openssh/9.9p2/match.h /usr/src/debug/openssh/9.9p2/kexecdh.c /usr/src/debug/openssh/9.9p2/ssh_api.c /usr/src/debug/openssh/9.9p2/match.c /usr/src/debug/openssh/9.9p2/platform.c /usr/src/debug/openssh/9.9p2/auth2-none.c /usr/src/debug/openssh/9.9p2/ssh-add.c /usr/src/debug/openssh/9.
 9p2/platform.h /usr/src/debug/openssh/9.9p2/sshpty.c /usr/src/debug/openssh/9.9p2/channels.h /usr/src/debug/openssh/9.9p2/sshpty.h /usr/src/debug/openssh/9.9p2/channels.c /usr/src/debug/openssh/9.9p2/sshd-session.c /usr/src/debug/openssh/9.9p2/ssh-pkcs11-client.c /usr/src/debug/openssh/9.9p2/crypto_api.h /usr/src/debug/openssh/9.9p2/cipher-aesctr.h /usr/src/debug/openssh/9.9p2/ttymodes.c /usr/src/debug/openssh/9.9p2/atomicio.h /usr/src/debug/openssh/9.9p2/ssh-pkcs11-helper.c /usr/src/debug/openssh/9.9p2/sshbuf.c /usr/src/debug/openssh/9.9p2/ttymodes.h /usr/src/debug/openssh/9.9p2/sshbuf.h /usr/src/debug/openssh/9.9p2/atomicio.c", added "/usr/src/debug/openssh/10.0p1/ttymodes.c /usr/src/debug/openssh/10.0p1/kexc25519.c /usr/src/debug/openssh/10.0p1/kex-names.c /usr/src/debug/openssh/10.0p1/ttymodes.h /usr/src/debug/openssh/10.0p1/sandbox-seccomp-filter.c /usr/src/debug/openssh/10.0p1/addrmatch.c /usr/src/debug/openssh/10.0p1/atomicio.h /usr/src/debug/openssh/10.0p1/poly1305.c /usr/sr
 c/debug/openssh/10.0p1/monitor_fdpass.c /usr/src/debug/openssh/10.0p1/ssh-ed25519.c /usr/src/debug/openssh/10.0p1/poly1305.h /usr/src/debug/openssh/10.0p1/atomicio.c /usr/src/debug/openssh/10.0p1/readpass.c /usr/src/debug/openssh/10.0p1/monitor_fdpass.h /usr/src/debug/openssh/10.0p1/platform-misc.c /usr/src/debug/openssh/10.0p1/mac.h /usr/src/debug/openssh/10.0p1/kexecdh.c /usr/src/debug/openssh/10.0p1/mac.c /usr/src/debug/openssh/10.0p1/libcrux_mlkem768_sha3.h /usr/src/debug/openssh/10.0p1/ssh-rsa.c /usr/src/debug/openssh/10.0p1/sshbuf.h /usr/src/debug/openssh/10.0p1/ssh-agent.c /usr/src/debug/openssh/10.0p1/ssh-ecdsa.c /usr/src/debug/openssh/10.0p1/sshconnect2.c /usr/src/debug/openssh/10.0p1/sshbuf.c /usr/src/debug/openssh/10.0p1/sshd-session.c /usr/src/debug/openssh/10.0p1/ssh-add.c /usr/src/debug/openssh/10.0p1/hmac.c /usr/src/debug/openssh/10.0p1/compat.h /usr/src/debug/openssh/10.0p1/umac.c /usr/src/debug/openssh/10.0p1/compat.c /usr/src/debug/openssh/10.0p1/hmac.h /usr/src/de
 bug/openssh/10.0p1/umac.h /usr/src/debug/openssh/10.0p1/sftp-usergroup.c /usr/src/debug/openssh/10.0p1/sftp-usergroup.h /usr/src/debug/openssh/10.0p1/fatal.c /usr/src/debug/openssh/10.0p1/smult_curve25519_ref.c /usr/src/debug/openssh/10.0p1/kexdh.c /usr/src/debug/openssh/10.0p1/crypto_api.h /usr/src/debug/openssh/10.0p1/sshbuf-misc.c /usr/src/debug/openssh/10.0p1/misc.h /usr/src/debug/openssh/10.0p1/auth2-methods.c /usr/src/debug/openssh/10.0p1/misc.c /usr/src/debug/openssh/10.0p1/pkcs11.h /usr/src/debug/openssh/10.0p1/progressmeter.h /usr/src/debug/openssh/10.0p1/session.h /usr/src/debug/openssh/10.0p1/ssh-pkcs11-helper.c /usr/src/debug/openssh/10.0p1/addr.c /usr/src/debug/openssh/10.0p1/sshpty.h /usr/src/debug/openssh/10.0p1/bitmap.c /usr/src/debug/openssh/10.0p1/session.c /usr/src/debug/openssh/10.0p1/sshpty.c /usr/src/debug/openssh/10.0p1/progressmeter.c /usr/src/debug/openssh/10.0p1/bitmap.h /usr/src/debug/openssh/10.0p1/addr.h /usr/src/debug/openssh/10.0p1/auth2-pubkey.c /usr/
 src/debug/openssh/10.0p1/digest.h /usr/src/debug/openssh/10.0p1/monitor_wrap.h /usr/src/debug/openssh/10.0p1/sshlogin.c /usr/src/debug/openssh/10.0p1/log.h /usr/src/debug/openssh/10.0p1/auth2-pubkeyfile.c /usr/src/debug/openssh/10.0p1/msg.h /usr/src/debug/openssh/10.0p1/log.c /usr/src/debug/openssh/10.0p1/monitor_wrap.c /usr/src/debug/openssh/10.0p1/msg.c /usr/src/debug/openssh/10.0p1/sshlogin.h /usr/src/debug/openssh/10.0p1/kexsntrup761x25519.c /usr/src/debug/openssh/10.0p1/sshsig.h /usr/src/debug/openssh/10.0p1/auth-shadow.c /usr/src/debug/openssh/10.0p1/ssh-pkcs11.h /usr/src/debug/openssh/10.0p1/sshconnect.h /usr/src/debug/openssh/10.0p1/sshsig.c /usr/src/debug/openssh/10.0p1/ssh-keygen.c /usr/src/debug/openssh/10.0p1/scp.c /usr/src/debug/openssh/10.0p1/ssh-pkcs11.c /usr/src/debug/openssh/10.0p1/sshconnect.c /usr/src/debug/openssh/10.0p1/authfd.c /usr/src/debug/openssh/10.0p1/canohost.h /usr/src/debug/openssh/10.0p1/hostfile.h /usr/src/debug/openssh/10.0p1/authfd.h /usr/src/debug
 /openssh/10.0p1/canohost.c /usr/src/debug/openssh/10.0p1/hostfile.c /usr/src/debug/openssh/10.0p1/cleanup.c /usr/src/debug/openssh/10.0p1/ed25519.c /usr/src/debug/openssh/10.0p1/kexgen.c /usr/src/debug/openssh/10.0p1/kexgexs.c /usr/src/debug/openssh/10.0p1/ssh-keyscan.c /usr/src/debug/openssh/10.0p1/moduli.c /usr/src/debug/openssh/10.0p1/ssh-keysign.c /usr/src/debug/openssh/10.0p1/auth2-none.c /usr/src/debug/openssh/10.0p1/loginrec.c /usr/src/debug/openssh/10.0p1/auth2.c /usr/src/debug/openssh/10.0p1/loginrec.h /usr/src/debug/openssh/10.0p1/channels.h /usr/src/debug/openssh/10.0p1/monitor.h /usr/src/debug/openssh/10.0p1/sftp-common.h /usr/src/debug/openssh/10.0p1/srclimit.h /usr/src/debug/openssh/10.0p1/channels.c /usr/src/debug/openssh/10.0p1/monitor.c /usr/src/debug/openssh/10.0p1/sshtty.c /usr/src/debug/openssh/10.0p1/srclimit.c /usr/src/debug/openssh/10.0p1/sftp-common.c /usr/src/debug/openssh/10.0p1/cipher.c /usr/src/debug/openssh/10.0p1/serverloop.c /usr/src/debug/openssh/10.0
 p1/sshd.c /usr/src/debug/openssh/10.0p1/auth2-kbdint.c /usr/src/debug/openssh/10.0p1/cipher.h /usr/src/debug/openssh/10.0p1/auth2-chall.c /usr/src/debug/openssh/10.0p1/serverloop.h /usr/src/debug/openssh/10.0p1/authfile.c /usr/src/debug/openssh/10.0p1/entropy.h /usr/src/debug/openssh/10.0p1/hash.c /usr/src/debug/openssh/10.0p1/platform-tracing.c /usr/src/debug/openssh/10.0p1/authfile.h /usr/src/debug/openssh/10.0p1/entropy.c /usr/src/debug/openssh/10.0p1/sftp-client.c /usr/src/debug/openssh/10.0p1/sshbuf-io.c /usr/src/debug/openssh/10.0p1/servconf.h /usr/src/debug/openssh/10.0p1/sshd-auth.c /usr/src/debug/openssh/10.0p1/servconf.c /usr/src/debug/openssh/10.0p1/sftp-client.h /usr/src/debug/openssh/10.0p1/digest-openssl.c /usr/src/debug/openssh/10.0p1/cipher-aesctr.h /usr/src/debug/openssh/10.0p1/clientloop.h /usr/src/debug/openssh/10.0p1/clientloop.c /usr/src/debug/openssh/10.0p1/sftp-server.c /usr/src/debug/openssh/10.0p1/sftp.c /usr/src/debug/openssh/10.0p1/sftp.h /usr/src/debug/op
 enssh/10.0p1/auth-options.h /usr/src/debug/openssh/10.0p1/xmalloc.h /usr/src/debug/openssh/10.0p1/dh.c /usr/src/debug/openssh/10.0p1/auth-passwd.c /usr/src/debug/openssh/10.0p1/xmalloc.c /usr/src/debug/openssh/10.0p1/auth-options.c /usr/src/debug/openssh/10.0p1/cipher-chachapoly-libcrypto.c /usr/src/debug/openssh/10.0p1/kexgexc.c /usr/src/debug/openssh/10.0p1/dh.h /usr/src/debug/openssh/10.0p1/groupaccess.h /usr/src/debug/openssh/10.0p1/rijndael.h /usr/src/debug/openssh/10.0p1/sshbuf-getput-basic.c /usr/src/debug/openssh/10.0p1/ssherr.h /usr/src/debug/openssh/10.0p1/ssherr.c /usr/src/debug/openssh/10.0p1/groupaccess.c /usr/src/debug/openssh/10.0p1/cipher-chachapoly.h /usr/src/debug/openssh/10.0p1/uidswap.h /usr/src/debug/openssh/10.0p1/uidswap.c /usr/src/debug/openssh/10.0p1/dns.h /usr/src/debug/openssh/10.0p1/krl.h /usr/src/debug/openssh/10.0p1/ssh-pkcs11-client.c /usr/src/debug/openssh/10.0p1/sshkey.h /usr/src/debug/openssh/10.0p1/krl.c /usr/src/debug/openssh/10.0p1/dns.c /usr/src
 /debug/openssh/10.0p1/nchan.c /usr/src/debug/openssh/10.0p1/sshkey.c /usr/src/debug/openssh/10.0p1/sftp-realpath.c /usr/src/debug/openssh/10.0p1/kexgex.c /usr/src/debug/openssh/10.0p1/ssh_api.c /usr/src/debug/openssh/10.0p1/auth2-passwd.c /usr/src/debug/openssh/10.0p1/platform.h /usr/src/debug/openssh/10.0p1/auth.h /usr/src/debug/openssh/10.0p1/ssh_api.h /usr/src/debug/openssh/10.0p1/kexmlkem768x25519.c /usr/src/debug/openssh/10.0p1/auth.c /usr/src/debug/openssh/10.0p1/platform-pledge.c /usr/src/debug/openssh/10.0p1/platform.c /usr/src/debug/openssh/10.0p1/auth-pam.h /usr/src/debug/openssh/10.0p1/platform-listen.c /usr/src/debug/openssh/10.0p1/auth-pam.c /usr/src/debug/openssh/10.0p1/auth2-hostbased.c /usr/src/debug/openssh/10.0p1/ssh.c /usr/src/debug/openssh/10.0p1/auth-rhosts.c /usr/src/debug/openssh/10.0p1/ssh-sk-client.c /usr/src/debug/openssh/10.0p1/readconf.h /usr/src/debug/openssh/10.0p1/dispatch.c /usr/src/debug/openssh/10.0p1/ssh-sandbox.h /usr/src/debug/openssh/10.0p1/ssh-
 sk-helper.c /usr/src/debug/openssh/10.0p1/dispatch.h /usr/src/debug/openssh/10.0p1/readconf.c /usr/src/debug/openssh/10.0p1/utf8.c /usr/src/debug/openssh/10.0p1/match.h /usr/src/debug/openssh/10.0p1/packet.c /usr/src/debug/openssh/10.0p1/sftp-glob.c /usr/src/debug/openssh/10.0p1/sntrup761.c /usr/src/debug/openssh/10.0p1/sftp-server-main.c /usr/src/debug/openssh/10.0p1/match.c /usr/src/debug/openssh/10.0p1/packet.h /usr/src/debug/openssh/10.0p1/utf8.h /usr/src/debug/openssh/10.0p1/sshbuf-getput-crypto.c /usr/src/debug/openssh/10.0p1/ssh-sk.h /usr/src/debug/openssh/10.0p1/kex.c /usr/src/debug/openssh/10.0p1/mux.c /usr/src/debug/openssh/10.0p1/kex.h"
packages/core2-64-poky-linux/openssh/openssh-src: PV changed from "9.9p2" to "10.0p1"
packages/core2-64-poky-linux/openssh/openssh-src: PKGV changed from 9.9p2 [default] to 10.0p1 [default]
packages/core2-64-poky-linux/openssh/openssh-src: PKGSIZE changed from 4257000 to 4302446 (+1%)
packages/core2-64-poky-linux/openssh/openssh-ssh: PV changed from "9.9p2" to "10.0p1"
packages/core2-64-poky-linux/openssh/openssh-ssh: PKGV changed from 9.9p2 [default] to 10.0p1 [default]
packages/core2-64-poky-linux/openssh/openssh-sshd: PV changed from "9.9p2" to "10.0p1"
packages/core2-64-poky-linux/openssh/openssh-sshd: PKGV changed from 9.9p2 [default] to 10.0p1 [default]
packages/core2-64-poky-linux/openssh/openssh-sshd: PKGSIZE changed from 2144429 to 2199383 (+3%)
packages/core2-64-poky-linux/openssh/openssh-staticdev: PV changed from "9.9p2" to "10.0p1"
packages/core2-64-poky-linux/openssh/openssh-staticdev: PKGV changed from 9.9p2 [default] to 10.0p1 [default]
packages/core2-64-poky-linux/openssh/openssh: PV changed from "9.9p2" to "10.0p1"
packages/core2-64-poky-linux/openssh/openssh: PKGV changed from 9.9p2 [default] to 10.0p1 [default]

--===============3419649518332854733==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/openssh/openssh-dbg: PKGSIZE changed from 25475320 to 28289528 (+11%)
packages/core2-64-poky-linux/openssh/openssh-misc: FILELIST: added "/usr/libexec/sshd-auth"
packages/core2-64-poky-linux/openssh/openssh-misc: RDEPENDS: added "libxcrypt (['>= 4.4.38']) libpam (['>= 1.7.0'])"
packages/core2-64-poky-linux/openssh/openssh-misc: PKGSIZE changed from 2284506 to 3286962 (+44%)
packages/core2-64-poky-linux/openssh/openssh-ptest: FILELIST: added "/usr/lib/openssh/ptest/regress/misc/ssh-verify-attestation/ssh-verify-attestation.c /usr/lib/openssh/ptest/regress/misc/ssh-verify-attestation/Makefile /usr/lib/openssh/ptest/regress/sftp-resume.sh"

--===============3419649518332854733==--

