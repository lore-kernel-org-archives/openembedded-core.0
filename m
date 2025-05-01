Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2550C3ABC1
	for <webhook@archiver.kernel.org>; Thu,  1 May 2025 15:33:33 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.1783.1746113613410305285
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 May 2025 08:33:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=XCQH3qTe;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=gKXWqekP;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101968c7b4bac-512057c3-2f90-4ee8-bf41-642cc1350147-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1746113612;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=LU4C6GorQn/sroCEhpLWslsOsacM8XFGqicXvppkil8=;
	b=XCQH3qTex/ja5H85ZXLXvPM/dKv5l8UKs/AMJVLMJZhXS0gxcKFcclyKfF0Y1DNA
	F9Z/YpR5dF29ZdoL+KvBm7oypETl6d4NPnFtadzKlHfSysJZvfSd9J4ujBhI5+W7DHU
	IgtDwJgfhJawEbS4kBvbmSl3GaVCaCT1XA27X688=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1746113612;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=LU4C6GorQn/sroCEhpLWslsOsacM8XFGqicXvppkil8=;
	b=gKXWqekPqCSo2WTKWLulUmOTVcFkxyVSB7sFeDnfTW3BQYyUkuQVOi3YMo3KvG4B
	d/1746P+7gbBfuX/3XSWqcClwTQ7F5tEDhmHYDappvUOFz8NlOD69SgWD7BqMCC/5Qz
	zzsU+rwZAeaC496q3qEby0GwDBWkfDvDn968gjhA=
Content-Type: multipart/mixed; boundary="===============5606359637051489371=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] openssh: upgrading to 10.0p1 SUCCEEDED
Message-ID: <010101968c7b4bac-512057c3-2f90-4ee8-bf41-642cc1350147-000000@us-west-2.amazonses.com>
Date: Thu, 1 May 2025 15:33:32 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 May 2025 15:33:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215795

--===============5606359637051489371==
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
From 1a90cf00fcfd641e83a349564dd19ad24d2f00fd Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 May 2025 07:44:11 +0000
Subject: [PATCH] openssh: upgrade 9.9p2 -> 10.0p1

---
 ...gress-banner.sh-log-input-and-output-files-on-erro.patch | 2 +-
 ...gress-test-exec-use-the-absolute-path-in-the-SSH-e.patch | 6 +++---
 .../openssh/{openssh_9.9p2.bb => openssh_10.0p1.bb}         | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-connectivity/openssh/{openssh_9.9p2.bb => openssh_10.0p1.bb} (99%)

diff --git a/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-input-and-output-files-on-erro.patch b/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-input-and-output-files-on-erro.patch
index f424288e37..b0c5a57d69 100644
--- a/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-input-and-output-files-on-erro.patch
+++ b/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-input-and-output-files-on-erro.patch
@@ -1,4 +1,4 @@
-From 5cc897fe2effe549e1e280c2f606bce8b532b61e Mon Sep 17 00:00:00 2001
+From c7c693f5d222772185a1b585639d903143b648cc Mon Sep 17 00:00:00 2001
 From: Mikko Rapeli <mikko.rapeli@linaro.org>
 Date: Mon, 11 Sep 2023 09:55:21 +0100
 Subject: [PATCH] regress/banner.sh: log input and output files on error
diff --git a/meta/recipes-connectivity/openssh/openssh/0001-regress-test-exec-use-the-absolute-path-in-the-SSH-e.patch b/meta/recipes-connectivity/openssh/openssh/0001-regress-test-exec-use-the-absolute-path-in-the-SSH-e.patch
index b90cd2e69d..bb2db80159 100644
--- a/meta/recipes-connectivity/openssh/openssh/0001-regress-test-exec-use-the-absolute-path-in-the-SSH-e.patch
+++ b/meta/recipes-connectivity/openssh/openssh/0001-regress-test-exec-use-the-absolute-path-in-the-SSH-e.patch
@@ -1,4 +1,4 @@
-From fb762172fb678fe29327b667f8fe7380962a4540 Mon Sep 17 00:00:00 2001
+From 63a095d891311fc949c1e67ba6d710a61867a36e Mon Sep 17 00:00:00 2001
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


--===============5606359637051489371==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-openssh-upgrade-9.9p2-10.0p1.patch"

RnJvbSAxYTkwY2YwMGZjZmQ2NDFlODNhMzQ5NTY0ZGQxOWFkMjRkMmYwMGZkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBNYXkgMjAyNSAwNzo0NDoxMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG9w
ZW5zc2g6IHVwZ3JhZGUgOS45cDIgLT4gMTAuMHAxCgotLS0KIC4uLmdyZXNzLWJhbm5lci5zaC1s
b2ctaW5wdXQtYW5kLW91dHB1dC1maWxlcy1vbi1lcnJvLnBhdGNoIHwgMiArLQogLi4uZ3Jlc3Mt
dGVzdC1leGVjLXVzZS10aGUtYWJzb2x1dGUtcGF0aC1pbi10aGUtU1NILWUucGF0Y2ggfCA2ICsr
Ky0tLQogLi4uL29wZW5zc2gve29wZW5zc2hfOS45cDIuYmIgPT4gb3BlbnNzaF8xMC4wcDEuYmJ9
ICAgICAgICAgfCAyICstCiAzIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxl
dGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2gve29wZW5z
c2hfOS45cDIuYmIgPT4gb3BlbnNzaF8xMC4wcDEuYmJ9ICg5OSUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NoL29wZW5zc2gvMDAwMS1yZWdyZXNzLWJhbm5l
ci5zaC1sb2ctaW5wdXQtYW5kLW91dHB1dC1maWxlcy1vbi1lcnJvLnBhdGNoIGIvbWV0YS9yZWNp
cGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NoL29wZW5zc2gvMDAwMS1yZWdyZXNzLWJhbm5lci5zaC1s
b2ctaW5wdXQtYW5kLW91dHB1dC1maWxlcy1vbi1lcnJvLnBhdGNoCmluZGV4IGY0MjQyODhlMzcu
LmIwYzVhNTdkNjkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNz
aC9vcGVuc3NoLzAwMDEtcmVncmVzcy1iYW5uZXIuc2gtbG9nLWlucHV0LWFuZC1vdXRwdXQtZmls
ZXMtb24tZXJyby5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2gv
b3BlbnNzaC8wMDAxLXJlZ3Jlc3MtYmFubmVyLnNoLWxvZy1pbnB1dC1hbmQtb3V0cHV0LWZpbGVz
LW9uLWVycm8ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDVjYzg5N2ZlMmVmZmU1NDllMWUy
ODBjMmY2MDZiY2U4YjUzMmI2MWUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGM3YzY5
M2Y1ZDIyMjc3MjE4NWExYjU4NTYzOWQ5MDMxNDNiNjQ4Y2MgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCiBGcm9tOiBNaWtrbyBSYXBlbGkgPG1pa2tvLnJhcGVsaUBsaW5hcm8ub3JnPgogRGF0ZTog
TW9uLCAxMSBTZXAgMjAyMyAwOTo1NToyMSArMDEwMAogU3ViamVjdDogW1BBVENIXSByZWdyZXNz
L2Jhbm5lci5zaDogbG9nIGlucHV0IGFuZCBvdXRwdXQgZmlsZXMgb24gZXJyb3IKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzaC9vcGVuc3NoLzAwMDEtcmVncmVz
cy10ZXN0LWV4ZWMtdXNlLXRoZS1hYnNvbHV0ZS1wYXRoLWluLXRoZS1TU0gtZS5wYXRjaCBiL21l
dGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzaC9vcGVuc3NoLzAwMDEtcmVncmVzcy10ZXN0
LWV4ZWMtdXNlLXRoZS1hYnNvbHV0ZS1wYXRoLWluLXRoZS1TU0gtZS5wYXRjaAppbmRleCBiOTBj
ZDJlNjlkLi5iYjJkYjgwMTU5IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5
L29wZW5zc2gvb3BlbnNzaC8wMDAxLXJlZ3Jlc3MtdGVzdC1leGVjLXVzZS10aGUtYWJzb2x1dGUt
cGF0aC1pbi10aGUtU1NILWUucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9v
cGVuc3NoL29wZW5zc2gvMDAwMS1yZWdyZXNzLXRlc3QtZXhlYy11c2UtdGhlLWFic29sdXRlLXBh
dGgtaW4tdGhlLVNTSC1lLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBmYjc2MjE3MmZiNjc4
ZmUyOTMyN2I2NjdmOGZlNzM4MDk2MmE0NTQwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJv
bSA2M2EwOTVkODkxMzExZmM5NDljMWU2N2JhNmQ3MTBhNjE4NjdhMzZlIE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQogRnJvbTogSm9zZSBRdWFyZXNtYSA8am9zZS5xdWFyZXNtYUBmb3VuZHJpZXMu
aW8+CiBEYXRlOiBNb24sIDE1IEp1bCAyMDI0IDE4OjQzOjA4ICswMTAwCiBTdWJqZWN0OiBbUEFU
Q0hdIHJlZ3Jlc3MvdGVzdC1leGVjOiB1c2UgdGhlIGFic29sdXRlIHBhdGggaW4gdGhlIFNTSCBl
bnYKQEAgLTE4LDEwICsxOCwxMCBAQCBTaWduZWQtb2ZmLWJ5OiBKb3NlIFF1YXJlc21hIDxqb3Nl
LnF1YXJlc21hQGZvdW5kcmllcy5pbz4KICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCsp
CiAKIGRpZmYgLS1naXQgYS9yZWdyZXNzL3Rlc3QtZXhlYy5zaCBiL3JlZ3Jlc3MvdGVzdC1leGVj
LnNoCi1pbmRleCA3YWZjMjgwNy4uMTc1ZjU1NGIgMTAwNjQ0CitpbmRleCA4YTAwYzcyLi4yODkx
ZjI3IDEwMDY0NAogLS0tIGEvcmVncmVzcy90ZXN0LWV4ZWMuc2gKICsrKyBiL3JlZ3Jlc3MvdGVz
dC1leGVjLnNoCi1AQCAtMTc1LDYgKzE3NSwxMSBAQCBpZiBbICJ4JFRFU1RfU1NIX09QRU5TU0wi
ICE9ICJ4IiBdOyB0aGVuCitAQCAtMTc5LDYgKzE3OSwxMSBAQCBpZiBbICJ4JFRFU1RfU1NIX09Q
RU5TU0wiICE9ICJ4IiBdOyB0aGVuCiAgZmkKICAKICAjIFBhdGggdG8gc3NoZCBtdXN0IGJlIGFi
c29sdXRlIGZvciByZXhlYwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9v
cGVuc3NoL29wZW5zc2hfOS45cDIuYmIgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5z
c2gvb3BlbnNzaF8xMC4wcDEuYmIKc2ltaWxhcml0eSBpbmRleCA5OSUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NoL29wZW5zc2hfOS45cDIuYmIKcmVuYW1lIHRv
IG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzaC9vcGVuc3NoXzEwLjBwMS5iYgppbmRl
eCA1MTkxNzI1Nzk2Li4yMWUxZTUwNzU5IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVj
dGl2aXR5L29wZW5zc2gvb3BlbnNzaF85LjlwMi5iYgorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVj
dGl2aXR5L29wZW5zc2gvb3BlbnNzaF8xMC4wcDEuYmIKQEAgLTI2LDcgKzI2LDcgQEAgU1JDX1VS
SSA9ICJodHRwczovL2Z0cC5vcGVuYnNkLm9yZy9wdWIvT3BlbkJTRC9PcGVuU1NIL3BvcnRhYmxl
L29wZW5zc2gtJHtQVn0udGEKICAgICAgICAgICAgZmlsZTovLzAwMDEtcmVncmVzcy1iYW5uZXIu
c2gtbG9nLWlucHV0LWFuZC1vdXRwdXQtZmlsZXMtb24tZXJyby5wYXRjaCBcCiAgICAgICAgICAg
IGZpbGU6Ly8wMDAxLXJlZ3Jlc3MtdGVzdC1leGVjLXVzZS10aGUtYWJzb2x1dGUtcGF0aC1pbi10
aGUtU1NILWUucGF0Y2ggXAogICAgICAgICAgICAiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiOTFh
YWRiNjAzZTA4Y2MyODVlZGRmOTY1ZTExOTlkMDI1ODVmYTk0ZDk5NGQ2Y2FlNWI0MWUxNzIxZTIx
NTY3MyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIwMjFhMmU3MDlhMGVkZjQyNTBiMTI1NmJkNWE5
ZTUwMDQxMWE5MGRkZGFiZWE4MzBlZDU5Y2VmOTBlYjlkODVjIgogCiBDVkVfU1RBVFVTW0NWRS0y
MDA3LTI3NjhdID0gIm5vdC1hcHBsaWNhYmxlLWNvbmZpZzogVGhpcyBDVkUgaXMgc3BlY2lmaWMg
dG8gT3BlblNTSCB3aXRoIHRoZSBwYW0gb3BpZSB3aGljaCB3ZSBkb24ndCBidWlsZC91c2UgaGVy
ZS4iCiAKLS0gCjIuNDcuMQoK

--===============5606359637051489371==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/openssh: PV changed from "9.9p2" to "10.0p1"
packages/core2-64-poky-linux/openssh: PKGV changed from 9.9p2 [default] to 10.0p1 [default]
packages/core2-64-poky-linux/openssh: SRC_URI changed from "https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-9.9p2.tar.gz file://sshd_config file://ssh_config file://init file://sshd file://sshd.service file://sshd.socket file://sshd@.service file://sshdgenkeys.service file://volatiles.99_sshd file://run-ptest file://sshd_check_keys file://0001-regress-banner.sh-log-input-and-output-files-on-erro.patch file://0001-regress-test-exec-use-the-absolute-path-in-the-SSH-e.patch" to "https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-10.0p1.tar.gz file://sshd_config file://ssh_config file://init file://sshd file://sshd.service file://sshd.socket file://sshd@.service file://sshdgenkeys.service file://volatiles.99_sshd file://run-ptest file://sshd_check_keys file://0001-regress-banner.sh-log-input-and-output-files-on-erro.patch file://0001-regress-test-exec-use-the-absolute-path-in-the-SSH-e.patch"
packages/core2-64-poky-linux/openssh/openssh-dbg: FILELIST: added "/usr/libexec/.debug/sshd-auth"
packages/core2-64-poky-linux/openssh/openssh-dbg: PV changed from "9.9p2" to "10.0p1"
packages/core2-64-poky-linux/openssh/openssh-dbg: PKGSIZE changed from 25502592 to 28321752 (+11%)
packages/core2-64-poky-linux/openssh/openssh-dbg: PKGV changed from 9.9p2 [default] to 10.0p1 [default]
packages/core2-64-poky-linux/openssh/openssh-dev: PV changed from "9.9p2" to "10.0p1"
packages/core2-64-poky-linux/openssh/openssh-dev: PKGV changed from 9.9p2 [default] to 10.0p1 [default]
packages/core2-64-poky-linux/openssh/openssh-doc: PV changed from "9.9p2" to "10.0p1"
packages/core2-64-poky-linux/openssh/openssh-doc: PKGSIZE changed from 346781 to 353134 (+2%)
packages/core2-64-poky-linux/openssh/openssh-doc: PKGV changed from 9.9p2 [default] to 10.0p1 [default]
packages/core2-64-poky-linux/openssh/openssh-keygen: PV changed from "9.9p2" to "10.0p1"
packages/core2-64-poky-linux/openssh/openssh-keygen: PKGSIZE changed from 547008 to 542912 (-1%)
packages/core2-64-poky-linux/openssh/openssh-keygen: PKGV changed from 9.9p2 [default] to 10.0p1 [default]
packages/core2-64-poky-linux/openssh/openssh-locale: PV changed from "9.9p2" to "10.0p1"
packages/core2-64-poky-linux/openssh/openssh-locale: PKGV changed from 9.9p2 [default] to 10.0p1 [default]
packages/core2-64-poky-linux/openssh/openssh-misc: FILELIST: added "/usr/libexec/sshd-auth"
packages/core2-64-poky-linux/openssh/openssh-misc: PV changed from "9.9p2" to "10.0p1"
packages/core2-64-poky-linux/openssh/openssh-misc: PKGSIZE changed from 2268122 to 3266482 (+44%)
packages/core2-64-poky-linux/openssh/openssh-misc: PKGV changed from 9.9p2 [default] to 10.0p1 [default]
packages/core2-64-poky-linux/openssh/openssh-misc: RDEPENDS: added "libpam (['>= 1.7.0']) libxcrypt (['>= 4.4.38'])"
packages/core2-64-poky-linux/openssh/openssh-ptest: FILELIST: added "/usr/lib/openssh/ptest/regress/misc/ssh-verify-attestation/Makefile /usr/lib/openssh/ptest/regress/sftp-resume.sh /usr/lib/openssh/ptest/regress/misc/ssh-verify-attestation/ssh-verify-attestation.c"
packages/core2-64-poky-linux/openssh/openssh-ptest: PV changed from "9.9p2" to "10.0p1"
packages/core2-64-poky-linux/openssh/openssh-ptest: PKGSIZE changed from 5920874 to 5932191 (+0%)
packages/core2-64-poky-linux/openssh/openssh-ptest: PKGV changed from 9.9p2 [default] to 10.0p1 [default]
packages/core2-64-poky-linux/openssh/openssh-scp: PV changed from "9.9p2" to "10.0p1"
packages/core2-64-poky-linux/openssh/openssh-scp: PKGSIZE changed from 227768 to 223672 (-2%)
packages/core2-64-poky-linux/openssh/openssh-scp: PKGV changed from 9.9p2 [default] to 10.0p1 [default]
packages/core2-64-poky-linux/openssh/openssh-sftp-server: PV changed from "9.9p2" to "10.0p1"
packages/core2-64-poky-linux/openssh/openssh-sftp-server: PKGV changed from 9.9p2 [default] to 10.0p1 [default]
packages/core2-64-poky-linux/openssh/openssh-sftp: PV changed from "9.9p2" to "10.0p1"
packages/core2-64-poky-linux/openssh/openssh-sftp: PKGV changed from 9.9p2 [default] to 10.0p1 [default]
packages/core2-64-poky-linux/openssh/openssh-src: FILELIST: directory renamed /usr/src/debug/openssh/9.9p2/regress/unittests/conversion -> /usr/src/debug/openssh/10.0p1/regress/unittests/bitmap, directory renamed /usr/src/debug/openssh/9.9p2/regress/unittests/sshbuf -> /usr/src/debug/openssh/10.0p1/regress/unittests/sshbuf, directory renamed /usr/src/debug/openssh/9.9p2/openbsd-compat -> /usr/src/debug/openssh/10.0p1/openbsd-compat, directory renamed /usr/src/debug/openssh/9.9p2/regress/unittests/misc -> /usr/src/debug/openssh/10.0p1/regress/unittests/misc, directory renamed /usr/src/debug/openssh/9.9p2/regress/unittests/test_helper -> /usr/src/debug/openssh/10.0p1/regress/unittests/test_helper, directory renamed /usr/src/debug/openssh/9.9p2/regress/unittests/hostkeys -> /usr/src/debug/openssh/10.0p1/regress/unittests/hostkeys, directory renamed /usr/src/debug/openssh/9.9p2/regress -> /usr/src/debug/openssh/10.0p1/regress, directory renamed /usr/src/debug/openssh/9.9p2/regress/unitte
 sts/bitmap -> /usr/src/debug/openssh/10.0p1/regress/unittests/authopt, directory renamed /usr/src/debug/openssh/9.9p2/regress/unittests/sshkey -> /usr/src/debug/openssh/10.0p1/regress/unittests/sshkey, directory renamed /usr/src/debug/openssh/9.9p2/regress/unittests/utf8 -> /usr/src/debug/openssh/10.0p1/regress/unittests/conversion, directory renamed /usr/src/debug/openssh/9.9p2/regress/unittests/match -> /usr/src/debug/openssh/10.0p1/regress/unittests/sshsig, directory renamed /usr/src/debug/openssh/9.9p2/regress/unittests/sshsig -> /usr/src/debug/openssh/10.0p1/regress/unittests/utf8, directory renamed /usr/src/debug/openssh/9.9p2/regress/unittests/authopt -> /usr/src/debug/openssh/10.0p1/regress/unittests/match, directory renamed /usr/src/debug/openssh/9.9p2/regress/unittests/kex -> /usr/src/debug/openssh/10.0p1/regress/unittests/kex, removed "/usr/src/debug/openssh/9.9p2/loginrec.c /usr/src/debug/openssh/9.9p2/sftp-usergroup.c /usr/src/debug/openssh/9.9p2/fatal.c /usr/src/debug/
 openssh/9.9p2/kexgexc.c /usr/src/debug/openssh/9.9p2/sftp-usergroup.h /usr/src/debug/openssh/9.9p2/loginrec.h /usr/src/debug/openssh/9.9p2/sshbuf-getput-crypto.c /usr/src/debug/openssh/9.9p2/nchan.c /usr/src/debug/openssh/9.9p2/groupaccess.h /usr/src/debug/openssh/9.9p2/ssh-sk-client.c /usr/src/debug/openssh/9.9p2/cipher-chachapoly-libcrypto.c /usr/src/debug/openssh/9.9p2/dh.h /usr/src/debug/openssh/9.9p2/sshkey.h /usr/src/debug/openssh/9.9p2/groupaccess.c /usr/src/debug/openssh/9.9p2/dh.c /usr/src/debug/openssh/9.9p2/sshkey.c /usr/src/debug/openssh/9.9p2/xmalloc.c /usr/src/debug/openssh/9.9p2/serverloop.c /usr/src/debug/openssh/9.9p2/sshd-session.c /usr/src/debug/openssh/9.9p2/utf8.c /usr/src/debug/openssh/9.9p2/compat.h /usr/src/debug/openssh/9.9p2/readpass.c /usr/src/debug/openssh/9.9p2/serverloop.h /usr/src/debug/openssh/9.9p2/compat.c /usr/src/debug/openssh/9.9p2/utf8.h /usr/src/debug/openssh/9.9p2/xmalloc.h /usr/src/debug/openssh/9.9p2/auth2-passwd.c /usr/src/debug/openssh/9.9
 p2/entropy.c /usr/src/debug/openssh/9.9p2/authfile.c /usr/src/debug/openssh/9.9p2/sftp-glob.c /usr/src/debug/openssh/9.9p2/authfile.h /usr/src/debug/openssh/9.9p2/entropy.h /usr/src/debug/openssh/9.9p2/kexdh.c /usr/src/debug/openssh/9.9p2/sshbuf.h /usr/src/debug/openssh/9.9p2/platform-misc.c /usr/src/debug/openssh/9.9p2/sshbuf.c /usr/src/debug/openssh/9.9p2/sshsig.h /usr/src/debug/openssh/9.9p2/platform-listen.c /usr/src/debug/openssh/9.9p2/sshsig.c /usr/src/debug/openssh/9.9p2/sshlogin.h /usr/src/debug/openssh/9.9p2/sftp-server-main.c /usr/src/debug/openssh/9.9p2/cipher-chachapoly.h /usr/src/debug/openssh/9.9p2/sshlogin.c /usr/src/debug/openssh/9.9p2/dispatch.c /usr/src/debug/openssh/9.9p2/dispatch.h /usr/src/debug/openssh/9.9p2/sandbox-seccomp-filter.c /usr/src/debug/openssh/9.9p2/addr.h /usr/src/debug/openssh/9.9p2/auth2.c /usr/src/debug/openssh/9.9p2/addr.c /usr/src/debug/openssh/9.9p2/auth2-methods.c /usr/src/debug/openssh/9.9p2/authfd.h /usr/src/debug/openssh/9.9p2/authfd.c /u
 sr/src/debug/openssh/9.9p2/readconf.h /usr/src/debug/openssh/9.9p2/dns.c /usr/src/debug/openssh/9.9p2/kex.c /usr/src/debug/openssh/9.9p2/krl.c /usr/src/debug/openssh/9.9p2/log.c /usr/src/debug/openssh/9.9p2/mac.c /usr/src/debug/openssh/9.9p2/msg.c /usr/src/debug/openssh/9.9p2/mux.c /usr/src/debug/openssh/9.9p2/dns.h /usr/src/debug/openssh/9.9p2/kex.h /usr/src/debug/openssh/9.9p2/readconf.c /usr/src/debug/openssh/9.9p2/krl.h /usr/src/debug/openssh/9.9p2/sshd.c /usr/src/debug/openssh/9.9p2/rijndael.h /usr/src/debug/openssh/9.9p2/log.h /usr/src/debug/openssh/9.9p2/mac.h /usr/src/debug/openssh/9.9p2/msg.h /usr/src/debug/openssh/9.9p2/ssh-add.c /usr/src/debug/openssh/9.9p2/progressmeter.h /usr/src/debug/openssh/9.9p2/auth-rhosts.c /usr/src/debug/openssh/9.9p2/auth-shadow.c /usr/src/debug/openssh/9.9p2/auth-passwd.c /usr/src/debug/openssh/9.9p2/sntrup761.c /usr/src/debug/openssh/9.9p2/crypto_api.h /usr/src/debug/openssh/9.9p2/progressmeter.c /usr/src/debug/openssh/9.9p2/cipher.h /usr/src/
 debug/openssh/9.9p2/auth-options.h /usr/src/debug/openssh/9.9p2/auth-options.c /usr/src/debug/openssh/9.9p2/cipher.c /usr/src/debug/openssh/9.9p2/sftp.h /usr/src/debug/openssh/9.9p2/sshconnect.h /usr/src/debug/openssh/9.9p2/sshconnect2.c /usr/src/debug/openssh/9.9p2/sftp.c /usr/src/debug/openssh/9.9p2/sshconnect.c /usr/src/debug/openssh/9.9p2/kex-names.c /usr/src/debug/openssh/9.9p2/addrmatch.c /usr/src/debug/openssh/9.9p2/kexecdh.c /usr/src/debug/openssh/9.9p2/sshtty.c /usr/src/debug/openssh/9.9p2/hostfile.h /usr/src/debug/openssh/9.9p2/auth2-pubkey.c /usr/src/debug/openssh/9.9p2/ssh-pkcs11.h /usr/src/debug/openssh/9.9p2/uidswap.c /usr/src/debug/openssh/9.9p2/ssh-pkcs11.c /usr/src/debug/openssh/9.9p2/uidswap.h /usr/src/debug/openssh/9.9p2/hostfile.c /usr/src/debug/openssh/9.9p2/moduli.c /usr/src/debug/openssh/9.9p2/packet.h /usr/src/debug/openssh/9.9p2/kexgen.c /usr/src/debug/openssh/9.9p2/auth2-none.c /usr/src/debug/openssh/9.9p2/packet.c /usr/src/debug/openssh/9.9p2/servconf.c /u
 sr/src/debug/openssh/9.9p2/monitor.c /usr/src/debug/openssh/9.9p2/sshpty.h /usr/src/debug/openssh/9.9p2/kexsntrup761x25519.c /usr/src/debug/openssh/9.9p2/monitor.h /usr/src/debug/openssh/9.9p2/servconf.h /usr/src/debug/openssh/9.9p2/monitor_wrap.c /usr/src/debug/openssh/9.9p2/pkcs11.h /usr/src/debug/openssh/9.9p2/match.h /usr/src/debug/openssh/9.9p2/sshpty.c /usr/src/debug/openssh/9.9p2/match.c /usr/src/debug/openssh/9.9p2/monitor_wrap.h /usr/src/debug/openssh/9.9p2/kexgex.c /usr/src/debug/openssh/9.9p2/ed25519.c /usr/src/debug/openssh/9.9p2/smult_curve25519_ref.c /usr/src/debug/openssh/9.9p2/auth2-hostbased.c /usr/src/debug/openssh/9.9p2/poly1305.h /usr/src/debug/openssh/9.9p2/sshbuf-io.c /usr/src/debug/openssh/9.9p2/poly1305.c /usr/src/debug/openssh/9.9p2/sshbuf-misc.c /usr/src/debug/openssh/9.9p2/ssherr.c /usr/src/debug/openssh/9.9p2/clientloop.c /usr/src/debug/openssh/9.9p2/digest-openssl.c /usr/src/debug/openssh/9.9p2/auth2-pubkeyfile.c /usr/src/debug/openssh/9.9p2/ssherr.h /us
 r/src/debug/openssh/9.9p2/auth2-kbdint.c /usr/src/debug/openssh/9.9p2/clientloop.h /usr/src/debug/openssh/9.9p2/ssh-ecdsa.c /usr/src/debug/openssh/9.9p2/sshbuf-getput-basic.c /usr/src/debug/openssh/9.9p2/ssh-rsa.c /usr/src/debug/openssh/9.9p2/canohost.c /usr/src/debug/openssh/9.9p2/ssh-ed25519.c /usr/src/debug/openssh/9.9p2/ssh-keyscan.c /usr/src/debug/openssh/9.9p2/ssh-keysign.c /usr/src/debug/openssh/9.9p2/ssh-sk-helper.c /usr/src/debug/openssh/9.9p2/sftp-realpath.c /usr/src/debug/openssh/9.9p2/canohost.h /usr/src/debug/openssh/9.9p2/ssh-sandbox.h /usr/src/debug/openssh/9.9p2/ssh_api.h /usr/src/debug/openssh/9.9p2/platform-pledge.c /usr/src/debug/openssh/9.9p2/scp.c /usr/src/debug/openssh/9.9p2/ssh.c /usr/src/debug/openssh/9.9p2/ssh-pkcs11-client.c /usr/src/debug/openssh/9.9p2/ssh_api.c /usr/src/debug/openssh/9.9p2/channels.h /usr/src/debug/openssh/9.9p2/bitmap.c /usr/src/debug/openssh/9.9p2/bitmap.h /usr/src/debug/openssh/9.9p2/channels.c /usr/src/debug/openssh/9.9p2/libcrux_mlke
 m768_sha3.h /usr/src/debug/openssh/9.9p2/auth.c /usr/src/debug/openssh/9.9p2/hash.c /usr/src/debug/openssh/9.9p2/ttymodes.h /usr/src/debug/openssh/9.9p2/monitor_fdpass.c /usr/src/debug/openssh/9.9p2/platform-tracing.c /usr/src/debug/openssh/9.9p2/auth2-chall.c /usr/src/debug/openssh/9.9p2/kexgexs.c /usr/src/debug/openssh/9.9p2/auth.h /usr/src/debug/openssh/9.9p2/kexc25519.c /usr/src/debug/openssh/9.9p2/ttymodes.c /usr/src/debug/openssh/9.9p2/monitor_fdpass.h /usr/src/debug/openssh/9.9p2/atomicio.c /usr/src/debug/openssh/9.9p2/auth-pam.c /usr/src/debug/openssh/9.9p2/session.c /usr/src/debug/openssh/9.9p2/ssh-pkcs11-helper.c /usr/src/debug/openssh/9.9p2/digest.h /usr/src/debug/openssh/9.9p2/session.h /usr/src/debug/openssh/9.9p2/atomicio.h /usr/src/debug/openssh/9.9p2/auth-pam.h /usr/src/debug/openssh/9.9p2/ssh-sk.h /usr/src/debug/openssh/9.9p2/sftp-client.c /usr/src/debug/openssh/9.9p2/sftp-common.c /usr/src/debug/openssh/9.9p2/sftp-server.c /usr/src/debug/openssh/9.9p2/srclimit.h /u
 sr/src/debug/openssh/9.9p2/hmac.h /usr/src/debug/openssh/9.9p2/misc.h /usr/src/debug/openssh/9.9p2/umac.h /usr/src/debug/openssh/9.9p2/srclimit.c /usr/src/debug/openssh/9.9p2/sftp-client.h /usr/src/debug/openssh/9.9p2/sftp-common.h /usr/src/debug/openssh/9.9p2/hmac.c /usr/src/debug/openssh/9.9p2/misc.c /usr/src/debug/openssh/9.9p2/umac.c /usr/src/debug/openssh/9.9p2/ssh-keygen.c /usr/src/debug/openssh/9.9p2/platform.h /usr/src/debug/openssh/9.9p2/cipher-aesctr.h /usr/src/debug/openssh/9.9p2/cleanup.c /usr/src/debug/openssh/9.9p2/platform.c /usr/src/debug/openssh/9.9p2/ssh-agent.c /usr/src/debug/openssh/9.9p2/kexmlkem768x25519.c", added "/usr/src/debug/openssh/10.0p1/compat.c /usr/src/debug/openssh/10.0p1/atomicio.c /usr/src/debug/openssh/10.0p1/progressmeter.c /usr/src/debug/openssh/10.0p1/kexgex.c /usr/src/debug/openssh/10.0p1/packet.h /usr/src/debug/openssh/10.0p1/auth-shadow.c /usr/src/debug/openssh/10.0p1/compat.h /usr/src/debug/openssh/10.0p1/progressmeter.h /usr/src/debug/open
 ssh/10.0p1/atomicio.h /usr/src/debug/openssh/10.0p1/packet.c /usr/src/debug/openssh/10.0p1/hostfile.c /usr/src/debug/openssh/10.0p1/platform-misc.c /usr/src/debug/openssh/10.0p1/kexdh.c /usr/src/debug/openssh/10.0p1/sshd-session.c /usr/src/debug/openssh/10.0p1/hostfile.h /usr/src/debug/openssh/10.0p1/auth-rhosts.c /usr/src/debug/openssh/10.0p1/platform.c /usr/src/debug/openssh/10.0p1/kexgexc.c /usr/src/debug/openssh/10.0p1/platform.h /usr/src/debug/openssh/10.0p1/ssh-sk.h /usr/src/debug/openssh/10.0p1/hmac.c /usr/src/debug/openssh/10.0p1/mac.h /usr/src/debug/openssh/10.0p1/match.h /usr/src/debug/openssh/10.0p1/authfd.h /usr/src/debug/openssh/10.0p1/umac.c /usr/src/debug/openssh/10.0p1/mac.c /usr/src/debug/openssh/10.0p1/hmac.h /usr/src/debug/openssh/10.0p1/match.c /usr/src/debug/openssh/10.0p1/umac.h /usr/src/debug/openssh/10.0p1/sshbuf-getput-crypto.c /usr/src/debug/openssh/10.0p1/authfd.c /usr/src/debug/openssh/10.0p1/sshtty.c /usr/src/debug/openssh/10.0p1/krl.h /usr/src/debug/ope
 nssh/10.0p1/ssherr.c /usr/src/debug/openssh/10.0p1/readpass.c /usr/src/debug/openssh/10.0p1/krl.c /usr/src/debug/openssh/10.0p1/sshbuf-misc.c /usr/src/debug/openssh/10.0p1/ssherr.h /usr/src/debug/openssh/10.0p1/entropy.c /usr/src/debug/openssh/10.0p1/misc.c /usr/src/debug/openssh/10.0p1/entropy.h /usr/src/debug/openssh/10.0p1/misc.h /usr/src/debug/openssh/10.0p1/ssh-ed25519.c /usr/src/debug/openssh/10.0p1/sshbuf-io.c /usr/src/debug/openssh/10.0p1/sshd-auth.c /usr/src/debug/openssh/10.0p1/pkcs11.h /usr/src/debug/openssh/10.0p1/auth-pam.h /usr/src/debug/openssh/10.0p1/platform-tracing.c /usr/src/debug/openssh/10.0p1/ed25519.c /usr/src/debug/openssh/10.0p1/auth-pam.c /usr/src/debug/openssh/10.0p1/kex.h /usr/src/debug/openssh/10.0p1/cipher-chachapoly-libcrypto.c /usr/src/debug/openssh/10.0p1/mux.c /usr/src/debug/openssh/10.0p1/kex.c /usr/src/debug/openssh/10.0p1/dns.h /usr/src/debug/openssh/10.0p1/servconf.h /usr/src/debug/openssh/10.0p1/dns.c /usr/src/debug/openssh/10.0p1/cipher-chacha
 poly.h /usr/src/debug/openssh/10.0p1/servconf.c /usr/src/debug/openssh/10.0p1/nchan.c /usr/src/debug/openssh/10.0p1/monitor_wrap.h /usr/src/debug/openssh/10.0p1/ttymodes.h /usr/src/debug/openssh/10.0p1/uidswap.c /usr/src/debug/openssh/10.0p1/monitor_wrap.c /usr/src/debug/openssh/10.0p1/kexsntrup761x25519.c /usr/src/debug/openssh/10.0p1/kexmlkem768x25519.c /usr/src/debug/openssh/10.0p1/smult_curve25519_ref.c /usr/src/debug/openssh/10.0p1/ttymodes.c /usr/src/debug/openssh/10.0p1/uidswap.h /usr/src/debug/openssh/10.0p1/sshbuf.h /usr/src/debug/openssh/10.0p1/fatal.c /usr/src/debug/openssh/10.0p1/sftp-server.c /usr/src/debug/openssh/10.0p1/sftp-server-main.c /usr/src/debug/openssh/10.0p1/sshbuf.c /usr/src/debug/openssh/10.0p1/ssh.c /usr/src/debug/openssh/10.0p1/sftp-client.c /usr/src/debug/openssh/10.0p1/dh.h /usr/src/debug/openssh/10.0p1/auth2-hostbased.c /usr/src/debug/openssh/10.0p1/dh.c /usr/src/debug/openssh/10.0p1/sftp-client.h /usr/src/debug/openssh/10.0p1/bitmap.c /usr/src/debug/
 openssh/10.0p1/ssh-sk-client.c /usr/src/debug/openssh/10.0p1/bitmap.h /usr/src/debug/openssh/10.0p1/digest-openssl.c /usr/src/debug/openssh/10.0p1/poly1305.h /usr/src/debug/openssh/10.0p1/auth-options.c /usr/src/debug/openssh/10.0p1/sftp-realpath.c /usr/src/debug/openssh/10.0p1/poly1305.c /usr/src/debug/openssh/10.0p1/ssh-keyscan.c /usr/src/debug/openssh/10.0p1/ssh-keysign.c /usr/src/debug/openssh/10.0p1/auth-options.h /usr/src/debug/openssh/10.0p1/kexgen.c /usr/src/debug/openssh/10.0p1/ssh-pkcs11-client.c /usr/src/debug/openssh/10.0p1/sshlogin.h /usr/src/debug/openssh/10.0p1/sshsig.c /usr/src/debug/openssh/10.0p1/sftp.h /usr/src/debug/openssh/10.0p1/ssh-sandbox.h /usr/src/debug/openssh/10.0p1/monitor_fdpass.c /usr/src/debug/openssh/10.0p1/sshsig.h /usr/src/debug/openssh/10.0p1/sshlogin.c /usr/src/debug/openssh/10.0p1/monitor_fdpass.h /usr/src/debug/openssh/10.0p1/sftp.c /usr/src/debug/openssh/10.0p1/sshkey.c /usr/src/debug/openssh/10.0p1/cleanup.c /usr/src/debug/openssh/10.0p1/scp.
 c /usr/src/debug/openssh/10.0p1/sftp-usergroup.h /usr/src/debug/openssh/10.0p1/digest.h /usr/src/debug/openssh/10.0p1/sshkey.h /usr/src/debug/openssh/10.0p1/sftp-usergroup.c /usr/src/debug/openssh/10.0p1/session.h /usr/src/debug/openssh/10.0p1/monitor.c /usr/src/debug/openssh/10.0p1/ssh-rsa.c /usr/src/debug/openssh/10.0p1/addr.h /usr/src/debug/openssh/10.0p1/rijndael.h /usr/src/debug/openssh/10.0p1/addr.c /usr/src/debug/openssh/10.0p1/session.c /usr/src/debug/openssh/10.0p1/monitor.h /usr/src/debug/openssh/10.0p1/clientloop.h /usr/src/debug/openssh/10.0p1/cipher.h /usr/src/debug/openssh/10.0p1/auth2-methods.c /usr/src/debug/openssh/10.0p1/cipher.c /usr/src/debug/openssh/10.0p1/clientloop.c /usr/src/debug/openssh/10.0p1/sandbox-seccomp-filter.c /usr/src/debug/openssh/10.0p1/sshbuf-getput-basic.c /usr/src/debug/openssh/10.0p1/hash.c /usr/src/debug/openssh/10.0p1/sshd.c /usr/src/debug/openssh/10.0p1/ssh-add.c /usr/src/debug/openssh/10.0p1/addrmatch.c /usr/src/debug/openssh/10.0p1/auth2
 -none.c /usr/src/debug/openssh/10.0p1/kex-names.c /usr/src/debug/openssh/10.0p1/kexc25519.c /usr/src/debug/openssh/10.0p1/auth2-pubkeyfile.c /usr/src/debug/openssh/10.0p1/auth.c /usr/src/debug/openssh/10.0p1/serverloop.h /usr/src/debug/openssh/10.0p1/sshconnect2.c /usr/src/debug/openssh/10.0p1/kexgexs.c /usr/src/debug/openssh/10.0p1/auth.h /usr/src/debug/openssh/10.0p1/serverloop.c /usr/src/debug/openssh/10.0p1/ssh-agent.c /usr/src/debug/openssh/10.0p1/ssh-ecdsa.c /usr/src/debug/openssh/10.0p1/sftp-common.h /usr/src/debug/openssh/10.0p1/sftp-common.c /usr/src/debug/openssh/10.0p1/canohost.c /usr/src/debug/openssh/10.0p1/libcrux_mlkem768_sha3.h /usr/src/debug/openssh/10.0p1/canohost.h /usr/src/debug/openssh/10.0p1/moduli.c /usr/src/debug/openssh/10.0p1/auth2-passwd.c /usr/src/debug/openssh/10.0p1/groupaccess.c /usr/src/debug/openssh/10.0p1/groupaccess.h /usr/src/debug/openssh/10.0p1/srclimit.h /usr/src/debug/openssh/10.0p1/sshpty.c /usr/src/debug/openssh/10.0p1/srclimit.c /usr/src/de
 bug/openssh/10.0p1/sshpty.h /usr/src/debug/openssh/10.0p1/log.c /usr/src/debug/openssh/10.0p1/msg.c /usr/src/debug/openssh/10.0p1/ssh-keygen.c /usr/src/debug/openssh/10.0p1/auth2.c /usr/src/debug/openssh/10.0p1/kexecdh.c /usr/src/debug/openssh/10.0p1/platform-listen.c /usr/src/debug/openssh/10.0p1/ssh-pkcs11.c /usr/src/debug/openssh/10.0p1/sshconnect.c /usr/src/debug/openssh/10.0p1/ssh-pkcs11.h /usr/src/debug/openssh/10.0p1/sshconnect.h /usr/src/debug/openssh/10.0p1/log.h /usr/src/debug/openssh/10.0p1/msg.h /usr/src/debug/openssh/10.0p1/xmalloc.c /usr/src/debug/openssh/10.0p1/sftp-glob.c /usr/src/debug/openssh/10.0p1/dispatch.h /usr/src/debug/openssh/10.0p1/sntrup761.c /usr/src/debug/openssh/10.0p1/platform-pledge.c /usr/src/debug/openssh/10.0p1/xmalloc.h /usr/src/debug/openssh/10.0p1/auth2-chall.c /usr/src/debug/openssh/10.0p1/auth2-kbdint.c /usr/src/debug/openssh/10.0p1/dispatch.c /usr/src/debug/openssh/10.0p1/auth-passwd.c /usr/src/debug/openssh/10.0p1/loginrec.c /usr/src/debug/o
 penssh/10.0p1/loginrec.h /usr/src/debug/openssh/10.0p1/auth2-pubkey.c /usr/src/debug/openssh/10.0p1/ssh-sk-helper.c /usr/src/debug/openssh/10.0p1/channels.h /usr/src/debug/openssh/10.0p1/authfile.h /usr/src/debug/openssh/10.0p1/utf8.h /usr/src/debug/openssh/10.0p1/authfile.c /usr/src/debug/openssh/10.0p1/utf8.c /usr/src/debug/openssh/10.0p1/channels.c /usr/src/debug/openssh/10.0p1/ssh_api.h /usr/src/debug/openssh/10.0p1/readconf.c /usr/src/debug/openssh/10.0p1/cipher-aesctr.h /usr/src/debug/openssh/10.0p1/ssh_api.c /usr/src/debug/openssh/10.0p1/readconf.h /usr/src/debug/openssh/10.0p1/crypto_api.h /usr/src/debug/openssh/10.0p1/ssh-pkcs11-helper.c"
packages/core2-64-poky-linux/openssh/openssh-src: PV changed from "9.9p2" to "10.0p1"
packages/core2-64-poky-linux/openssh/openssh-src: PKGSIZE changed from 4257000 to 4302446 (+1%)
packages/core2-64-poky-linux/openssh/openssh-src: PKGV changed from 9.9p2 [default] to 10.0p1 [default]
packages/core2-64-poky-linux/openssh/openssh-ssh: PV changed from "9.9p2" to "10.0p1"
packages/core2-64-poky-linux/openssh/openssh-ssh: PKGV changed from 9.9p2 [default] to 10.0p1 [default]
packages/core2-64-poky-linux/openssh/openssh-sshd: PV changed from "9.9p2" to "10.0p1"
packages/core2-64-poky-linux/openssh/openssh-sshd: PKGSIZE changed from 2136237 to 2191191 (+3%)
packages/core2-64-poky-linux/openssh/openssh-sshd: PKGV changed from 9.9p2 [default] to 10.0p1 [default]
packages/core2-64-poky-linux/openssh/openssh-staticdev: PV changed from "9.9p2" to "10.0p1"
packages/core2-64-poky-linux/openssh/openssh-staticdev: PKGV changed from 9.9p2 [default] to 10.0p1 [default]
packages/core2-64-poky-linux/openssh/openssh: PV changed from "9.9p2" to "10.0p1"
packages/core2-64-poky-linux/openssh/openssh: PKGV changed from 9.9p2 [default] to 10.0p1 [default]

--===============5606359637051489371==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/openssh/openssh-dbg: PKGSIZE changed from 25502592 to 28321752 (+11%)
packages/core2-64-poky-linux/openssh/openssh-misc: PKGSIZE changed from 2268122 to 3266482 (+44%)
packages/core2-64-poky-linux/openssh/openssh-misc: RDEPENDS: added "libxcrypt (['>= 4.4.38']) libpam (['>= 1.7.0'])"
packages/core2-64-poky-linux/openssh/openssh-misc: FILELIST: added "/usr/libexec/sshd-auth"
packages/core2-64-poky-linux/openssh/openssh-ptest: FILELIST: added "/usr/lib/openssh/ptest/regress/misc/ssh-verify-attestation/ssh-verify-attestation.c /usr/lib/openssh/ptest/regress/misc/ssh-verify-attestation/Makefile /usr/lib/openssh/ptest/regress/sftp-resume.sh"

--===============5606359637051489371==--

