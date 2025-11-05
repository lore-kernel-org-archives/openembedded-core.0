Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 865AECD3429
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:16:24 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2347.1762384575099218238
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:16:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=NZaXq4Z2;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=QfdqS6GJ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019a564e785f-bf2155ca-92c1-4ea3-ad8b-173f9639c8b0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1762384574;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=VFrd0dMGnS1cqilj6gRITamj9/t3MKs1Xc+Z0ZR2j08=;
	b=NZaXq4Z2xJ5biB/yyIUi1GiLkvCL7hINo8vS+qQRcLn1DnlsDTo7LcNYiN1m8+4O
	Zi8ajIwQtvut3x8mPcX2F8K3IPLPPfp+26Uw1tpvp3QUM6X0hfgwgizjc1Ps+y16/DP
	ob6l6YWnN4Pkzg0j06zy2fZmN4VHvbGUEXiaTy3U=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1762384574;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=VFrd0dMGnS1cqilj6gRITamj9/t3MKs1Xc+Z0ZR2j08=;
	b=QfdqS6GJ0Wgrz2XcN+qVbNl8l0krzh1NKfla25bUDK8/1yVkGAnWkUXKJ2kWKqMw
	HQZDMUM6vdesZcR6oXJg+czzks09N5VGUFO9nOKmmycjkBoJHA5/P99D9D8MLFcEZcT
	fA69aKZpckWwEjlxPKnqTXV+LQQKJfTs1ngy80nk=
Content-Type: multipart/mixed; boundary="===============2544321999302913539=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] openssh: upgrading to 10.2p1 SUCCEEDED
Message-ID: <0101019a564e785f-bf2155ca-92c1-4ea3-ad8b-173f9639c8b0-000000@us-west-2.amazonses.com>
Date: Wed, 5 Nov 2025 23:16:14 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.05-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 23:16:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225792

--===============2544321999302913539==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *openssh* to *10.2p1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-openssh-upgrade-10.1p1-10.2p1.patch
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
From ca114c86807a03d0497e8fb79b9697de922843fd Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 5 Nov 2025 14:40:25 +0000
Subject: [PATCH] openssh: upgrade 10.1p1 -> 10.2p1

---
 ...regress-banner.sh-log-input-and-output-files-on-erro.patch | 2 +-
 ...regress-test-exec-use-the-absolute-path-in-the-SSH-e.patch | 4 ++--
 .../openssh/{openssh_10.1p1.bb => openssh_10.2p1.bb}          | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-connectivity/openssh/{openssh_10.1p1.bb => openssh_10.2p1.bb} (99%)

diff --git a/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-input-and-output-files-on-erro.patch b/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-input-and-output-files-on-erro.patch
index f424288e37..609d93a63c 100644
--- a/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-input-and-output-files-on-erro.patch
+++ b/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-input-and-output-files-on-erro.patch
@@ -1,4 +1,4 @@
-From 5cc897fe2effe549e1e280c2f606bce8b532b61e Mon Sep 17 00:00:00 2001
+From ae88349411fc39c2efaf119c26c19d6123dd592c Mon Sep 17 00:00:00 2001
 From: Mikko Rapeli <mikko.rapeli@linaro.org>
 Date: Mon, 11 Sep 2023 09:55:21 +0100
 Subject: [PATCH] regress/banner.sh: log input and output files on error
diff --git a/meta/recipes-connectivity/openssh/openssh/0001-regress-test-exec-use-the-absolute-path-in-the-SSH-e.patch b/meta/recipes-connectivity/openssh/openssh/0001-regress-test-exec-use-the-absolute-path-in-the-SSH-e.patch
index 360b62af34..80d9b2bf59 100644
--- a/meta/recipes-connectivity/openssh/openssh/0001-regress-test-exec-use-the-absolute-path-in-the-SSH-e.patch
+++ b/meta/recipes-connectivity/openssh/openssh/0001-regress-test-exec-use-the-absolute-path-in-the-SSH-e.patch
@@ -1,4 +1,4 @@
-From 9dcccafe44ea17e972e7cddea205bbe9fe71d8d6 Mon Sep 17 00:00:00 2001
+From 103d3592f724861484d0199bcedce6f470207066 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <jose.quaresma@foundries.io>
 Date: Mon, 15 Jul 2024 18:43:08 +0100
 Subject: [PATCH] regress/test-exec: use the absolute path in the SSH env
@@ -18,7 +18,7 @@ Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
  1 file changed, 5 insertions(+)
 
 diff --git a/regress/test-exec.sh b/regress/test-exec.sh
-index 8a00c72..2891f27 100644
+index 34fb58f..0e94fe1 100644
 --- a/regress/test-exec.sh
 +++ b/regress/test-exec.sh
 @@ -179,6 +179,11 @@ if [ "x$TEST_SSH_OPENSSL" != "x" ]; then
diff --git a/meta/recipes-connectivity/openssh/openssh_10.1p1.bb b/meta/recipes-connectivity/openssh/openssh_10.2p1.bb
similarity index 99%
rename from meta/recipes-connectivity/openssh/openssh_10.1p1.bb
rename to meta/recipes-connectivity/openssh/openssh_10.2p1.bb
index 83b6183858..5b934d72aa 100644
--- a/meta/recipes-connectivity/openssh/openssh_10.1p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_10.2p1.bb
@@ -26,7 +26,7 @@ SRC_URI = "https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.ta
            file://0001-regress-banner.sh-log-input-and-output-files-on-erro.patch \
            file://0001-regress-test-exec-use-the-absolute-path-in-the-SSH-e.patch \
            "
-SRC_URI[sha256sum] = "b9fc7a2b82579467a6f2f43e4a81c8e1dfda614ddb4f9b255aafd7020bbf0758"
+SRC_URI[sha256sum] = "ccc42c0419937959263fa1dbd16dafc18c56b984c03562d2937ce56a60f798b2"
 
 CVE_STATUS[CVE-2007-2768] = "not-applicable-config: This CVE is specific to OpenSSH with the pam opie which we don't build/use here."
 
-- 
2.47.1


--===============2544321999302913539==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-openssh-upgrade-10.1p1-10.2p1.patch"

RnJvbSBjYTExNGM4NjgwN2EwM2QwNDk3ZThmYjc5Yjk2OTdkZTkyMjg0M2ZkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgNSBOb3YgMjAyNSAxNDo0MDoyNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG9w
ZW5zc2g6IHVwZ3JhZGUgMTAuMXAxIC0+IDEwLjJwMQoKLS0tCiAuLi5yZWdyZXNzLWJhbm5lci5z
aC1sb2ctaW5wdXQtYW5kLW91dHB1dC1maWxlcy1vbi1lcnJvLnBhdGNoIHwgMiArLQogLi4ucmVn
cmVzcy10ZXN0LWV4ZWMtdXNlLXRoZS1hYnNvbHV0ZS1wYXRoLWluLXRoZS1TU0gtZS5wYXRjaCB8
IDQgKystLQogLi4uL29wZW5zc2gve29wZW5zc2hfMTAuMXAxLmJiID0+IG9wZW5zc2hfMTAuMnAx
LmJifSAgICAgICAgICB8IDIgKy0KIDMgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0
IGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzaC97
b3BlbnNzaF8xMC4xcDEuYmIgPT4gb3BlbnNzaF8xMC4ycDEuYmJ9ICg5OSUpCgpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NoL29wZW5zc2gvMDAwMS1yZWdyZXNz
LWJhbm5lci5zaC1sb2ctaW5wdXQtYW5kLW91dHB1dC1maWxlcy1vbi1lcnJvLnBhdGNoIGIvbWV0
YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NoL29wZW5zc2gvMDAwMS1yZWdyZXNzLWJhbm5l
ci5zaC1sb2ctaW5wdXQtYW5kLW91dHB1dC1maWxlcy1vbi1lcnJvLnBhdGNoCmluZGV4IGY0MjQy
ODhlMzcuLjYwOWQ5M2E2M2MgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkv
b3BlbnNzaC9vcGVuc3NoLzAwMDEtcmVncmVzcy1iYW5uZXIuc2gtbG9nLWlucHV0LWFuZC1vdXRw
dXQtZmlsZXMtb24tZXJyby5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29w
ZW5zc2gvb3BlbnNzaC8wMDAxLXJlZ3Jlc3MtYmFubmVyLnNoLWxvZy1pbnB1dC1hbmQtb3V0cHV0
LWZpbGVzLW9uLWVycm8ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDVjYzg5N2ZlMmVmZmU1
NDllMWUyODBjMmY2MDZiY2U4YjUzMmI2MWUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9t
IGFlODgzNDk0MTFmYzM5YzJlZmFmMTE5YzI2YzE5ZDYxMjNkZDU5MmMgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCiBGcm9tOiBNaWtrbyBSYXBlbGkgPG1pa2tvLnJhcGVsaUBsaW5hcm8ub3JnPgog
RGF0ZTogTW9uLCAxMSBTZXAgMjAyMyAwOTo1NToyMSArMDEwMAogU3ViamVjdDogW1BBVENIXSBy
ZWdyZXNzL2Jhbm5lci5zaDogbG9nIGlucHV0IGFuZCBvdXRwdXQgZmlsZXMgb24gZXJyb3IKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzaC9vcGVuc3NoLzAwMDEt
cmVncmVzcy10ZXN0LWV4ZWMtdXNlLXRoZS1hYnNvbHV0ZS1wYXRoLWluLXRoZS1TU0gtZS5wYXRj
aCBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzaC9vcGVuc3NoLzAwMDEtcmVncmVz
cy10ZXN0LWV4ZWMtdXNlLXRoZS1hYnNvbHV0ZS1wYXRoLWluLXRoZS1TU0gtZS5wYXRjaAppbmRl
eCAzNjBiNjJhZjM0Li44MGQ5YjJiZjU5IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVj
dGl2aXR5L29wZW5zc2gvb3BlbnNzaC8wMDAxLXJlZ3Jlc3MtdGVzdC1leGVjLXVzZS10aGUtYWJz
b2x1dGUtcGF0aC1pbi10aGUtU1NILWUucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rp
dml0eS9vcGVuc3NoL29wZW5zc2gvMDAwMS1yZWdyZXNzLXRlc3QtZXhlYy11c2UtdGhlLWFic29s
dXRlLXBhdGgtaW4tdGhlLVNTSC1lLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA5ZGNjY2Fm
ZTQ0ZWExN2U5NzJlN2NkZGVhMjA1YmJlOWZlNzFkOGQ2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQorRnJvbSAxMDNkMzU5MmY3MjQ4NjE0ODRkMDE5OWJjZWRjZTZmNDcwMjA3MDY2IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQogRnJvbTogSm9zZSBRdWFyZXNtYSA8am9zZS5xdWFyZXNtYUBmb3Vu
ZHJpZXMuaW8+CiBEYXRlOiBNb24sIDE1IEp1bCAyMDI0IDE4OjQzOjA4ICswMTAwCiBTdWJqZWN0
OiBbUEFUQ0hdIHJlZ3Jlc3MvdGVzdC1leGVjOiB1c2UgdGhlIGFic29sdXRlIHBhdGggaW4gdGhl
IFNTSCBlbnYKQEAgLTE4LDcgKzE4LDcgQEAgU2lnbmVkLW9mZi1ieTogSm9zZSBRdWFyZXNtYSA8
am9zZS5xdWFyZXNtYUBmb3VuZHJpZXMuaW8+CiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9u
cygrKQogCiBkaWZmIC0tZ2l0IGEvcmVncmVzcy90ZXN0LWV4ZWMuc2ggYi9yZWdyZXNzL3Rlc3Qt
ZXhlYy5zaAotaW5kZXggOGEwMGM3Mi4uMjg5MWYyNyAxMDA2NDQKK2luZGV4IDM0ZmI1OGYuLjBl
OTRmZTEgMTAwNjQ0CiAtLS0gYS9yZWdyZXNzL3Rlc3QtZXhlYy5zaAogKysrIGIvcmVncmVzcy90
ZXN0LWV4ZWMuc2gKIEBAIC0xNzksNiArMTc5LDExIEBAIGlmIFsgIngkVEVTVF9TU0hfT1BFTlNT
TCIgIT0gIngiIF07IHRoZW4KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkv
b3BlbnNzaC9vcGVuc3NoXzEwLjFwMS5iYiBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3Bl
bnNzaC9vcGVuc3NoXzEwLjJwMS5iYgpzaW1pbGFyaXR5IGluZGV4IDk5JQpyZW5hbWUgZnJvbSBt
ZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2gvb3BlbnNzaF8xMC4xcDEuYmIKcmVuYW1l
IHRvIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzaC9vcGVuc3NoXzEwLjJwMS5iYgpp
bmRleCA4M2I2MTgzODU4Li41YjkzNGQ3MmFhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29u
bmVjdGl2aXR5L29wZW5zc2gvb3BlbnNzaF8xMC4xcDEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWNv
bm5lY3Rpdml0eS9vcGVuc3NoL29wZW5zc2hfMTAuMnAxLmJiCkBAIC0yNiw3ICsyNiw3IEBAIFNS
Q19VUkkgPSAiaHR0cHM6Ly9mdHAub3BlbmJzZC5vcmcvcHViL09wZW5CU0QvT3BlblNTSC9wb3J0
YWJsZS9vcGVuc3NoLSR7UFZ9LnRhCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLXJlZ3Jlc3MtYmFu
bmVyLnNoLWxvZy1pbnB1dC1hbmQtb3V0cHV0LWZpbGVzLW9uLWVycm8ucGF0Y2ggXAogICAgICAg
ICAgICBmaWxlOi8vMDAwMS1yZWdyZXNzLXRlc3QtZXhlYy11c2UtdGhlLWFic29sdXRlLXBhdGgt
aW4tdGhlLVNTSC1lLnBhdGNoIFwKICAgICAgICAgICAgIgotU1JDX1VSSVtzaGEyNTZzdW1dID0g
ImI5ZmM3YTJiODI1Nzk0NjdhNmYyZjQzZTRhODFjOGUxZGZkYTYxNGRkYjRmOWIyNTVhYWZkNzAy
MGJiZjA3NTgiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiY2NjNDJjMDQxOTkzNzk1OTI2M2ZhMWRi
ZDE2ZGFmYzE4YzU2Yjk4NGMwMzU2MmQyOTM3Y2U1NmE2MGY3OThiMiIKIAogQ1ZFX1NUQVRVU1tD
VkUtMjAwNy0yNzY4XSA9ICJub3QtYXBwbGljYWJsZS1jb25maWc6IFRoaXMgQ1ZFIGlzIHNwZWNp
ZmljIHRvIE9wZW5TU0ggd2l0aCB0aGUgcGFtIG9waWUgd2hpY2ggd2UgZG9uJ3QgYnVpbGQvdXNl
IGhlcmUuIgogCi0tIAoyLjQ3LjEKCg==

--===============2544321999302913539==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/openssh: SRC_URI changed from "https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-10.1p1.tar.gz file://sshd_config file://ssh_config file://init file://sshd file://sshd.service file://sshd.socket file://sshd@.service file://sshdgenkeys.service file://volatiles.99_sshd file://run-ptest file://sshd_check_keys file://0001-regress-banner.sh-log-input-and-output-files-on-erro.patch file://0001-regress-test-exec-use-the-absolute-path-in-the-SSH-e.patch" to "https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-10.2p1.tar.gz file://sshd_config file://ssh_config file://init file://sshd file://sshd.service file://sshd.socket file://sshd@.service file://sshdgenkeys.service file://volatiles.99_sshd file://run-ptest file://sshd_check_keys file://0001-regress-banner.sh-log-input-and-output-files-on-erro.patch file://0001-regress-test-exec-use-the-absolute-path-in-the-SSH-e.patch"
packages/x86-64-v3-poky-linux/openssh: PKGV changed from 10.1p1 [default] to 10.2p1 [default]
packages/x86-64-v3-poky-linux/openssh: PV changed from "10.1p1" to "10.2p1"
packages/x86-64-v3-poky-linux/openssh/openssh-dbg: PKGSIZE changed from 28646504 to 28706544 (+0%)
packages/x86-64-v3-poky-linux/openssh/openssh-dbg: PKGV changed from 10.1p1 [default] to 10.2p1 [default]
packages/x86-64-v3-poky-linux/openssh/openssh-dbg: PV changed from "10.1p1" to "10.2p1"
packages/x86-64-v3-poky-linux/openssh/openssh-dev: PKGV changed from 10.1p1 [default] to 10.2p1 [default]
packages/x86-64-v3-poky-linux/openssh/openssh-dev: PV changed from "10.1p1" to "10.2p1"
packages/x86-64-v3-poky-linux/openssh/openssh-doc: PKGV changed from 10.1p1 [default] to 10.2p1 [default]
packages/x86-64-v3-poky-linux/openssh/openssh-doc: PV changed from "10.1p1" to "10.2p1"
packages/x86-64-v3-poky-linux/openssh/openssh-keygen: PKGSIZE changed from 530624 to 547008 (+3%)
packages/x86-64-v3-poky-linux/openssh/openssh-keygen: PKGV changed from 10.1p1 [default] to 10.2p1 [default]
packages/x86-64-v3-poky-linux/openssh/openssh-keygen: PV changed from "10.1p1" to "10.2p1"
packages/x86-64-v3-poky-linux/openssh/openssh-locale: PKGV changed from 10.1p1 [default] to 10.2p1 [default]
packages/x86-64-v3-poky-linux/openssh/openssh-locale: PV changed from "10.1p1" to "10.2p1"
packages/x86-64-v3-poky-linux/openssh/openssh-misc: PKGV changed from 10.1p1 [default] to 10.2p1 [default]
packages/x86-64-v3-poky-linux/openssh/openssh-misc: PV changed from "10.1p1" to "10.2p1"
packages/x86-64-v3-poky-linux/openssh/openssh-ptest: PKGSIZE changed from 6306991 to 6307213 (+0%)
packages/x86-64-v3-poky-linux/openssh/openssh-ptest: PKGV changed from 10.1p1 [default] to 10.2p1 [default]
packages/x86-64-v3-poky-linux/openssh/openssh-ptest: PV changed from "10.1p1" to "10.2p1"
packages/x86-64-v3-poky-linux/openssh/openssh-scp: PKGV changed from 10.1p1 [default] to 10.2p1 [default]
packages/x86-64-v3-poky-linux/openssh/openssh-scp: PV changed from "10.1p1" to "10.2p1"
packages/x86-64-v3-poky-linux/openssh/openssh-sftp-server: PKGV changed from 10.1p1 [default] to 10.2p1 [default]
packages/x86-64-v3-poky-linux/openssh/openssh-sftp-server: PV changed from "10.1p1" to "10.2p1"
packages/x86-64-v3-poky-linux/openssh/openssh-sftp: PKGV changed from 10.1p1 [default] to 10.2p1 [default]
packages/x86-64-v3-poky-linux/openssh/openssh-sftp: PV changed from "10.1p1" to "10.2p1"
packages/x86-64-v3-poky-linux/openssh/openssh-src: PKGSIZE changed from 4356390 to 4357476 (+0%)
packages/x86-64-v3-poky-linux/openssh/openssh-src: PKGV changed from 10.1p1 [default] to 10.2p1 [default]
packages/x86-64-v3-poky-linux/openssh/openssh-src: PV changed from "10.1p1" to "10.2p1"
packages/x86-64-v3-poky-linux/openssh/openssh-ssh: PKGV changed from 10.1p1 [default] to 10.2p1 [default]
packages/x86-64-v3-poky-linux/openssh/openssh-ssh: PV changed from "10.1p1" to "10.2p1"
packages/x86-64-v3-poky-linux/openssh/openssh-sshd: PKGV changed from 10.1p1 [default] to 10.2p1 [default]
packages/x86-64-v3-poky-linux/openssh/openssh-sshd: PV changed from "10.1p1" to "10.2p1"
packages/x86-64-v3-poky-linux/openssh/openssh-staticdev: PKGV changed from 10.1p1 [default] to 10.2p1 [default]
packages/x86-64-v3-poky-linux/openssh/openssh-staticdev: PV changed from "10.1p1" to "10.2p1"
packages/x86-64-v3-poky-linux/openssh/openssh: PKGV changed from 10.1p1 [default] to 10.2p1 [default]
packages/x86-64-v3-poky-linux/openssh/openssh: PV changed from "10.1p1" to "10.2p1"

--===============2544321999302913539==--

