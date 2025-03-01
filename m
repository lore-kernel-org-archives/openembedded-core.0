Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEA4DC28B22
	for <webhook@archiver.kernel.org>; Sat,  1 Mar 2025 11:25:27 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.7048.1740828319010136327
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Mar 2025 03:25:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=dzv0zdN/;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=dqs+oQSB;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101955174237b-1ac3d2c7-096c-478c-8527-cb02d3be7d78-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1740828320;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=PDOeghvwlLcKrs9Wrs5kqZ66fN72xUpgbBiCl8sb8rI=;
	b=dzv0zdN/KI/NTxQxjbsqPJPCnNxeSKszfw6Fgvtet8zBr8sNoBahMjKFPHKPC/Wd
	8ThVdp5+baQZWvMydZPn0oZQVosjQesDIs5dRs0h6ZjTdFshBx66y8P1V+lww57h9Ll
	UZbSMxmpJYNmNfft2EdVi3ZNakrkBI7KDj5cbtVg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1740828320;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=PDOeghvwlLcKrs9Wrs5kqZ66fN72xUpgbBiCl8sb8rI=;
	b=dqs+oQSBwXFV5eL2BMKoQTETqlHOrea71bq7X5n1LqnuPlOdL7bwBX2hpC8UnD8+
	UOSsA6/jcc1s0pE9u+3FySmITLtM0vTGcKHWkXKEbJL85u7JOS4Lm9/XE+Y3WIXWyUN
	vTbe1smRDmZJiSNYqVQHmopz1vO9TR/ObR4A5MKY=
Content-Type: multipart/mixed; boundary="===============6413435308333954248=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] openssh: upgrading to 9.9p2 SUCCEEDED
Message-ID: <010101955174237b-1ac3d2c7-096c-478c-8527-cb02d3be7d78-000000@us-west-2.amazonses.com>
Date: Sat, 1 Mar 2025 11:25:20 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.03.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Mar 2025 11:25:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212108

--===============6413435308333954248==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *openssh* to *9.9p2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-openssh-upgrade-9.9p1-9.9p2.patch
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
From 27b6b51e78978b249f673814f7d6d11521dc5d82 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Mar 2025 06:55:23 +0000
Subject: [PATCH] openssh: upgrade 9.9p1 -> 9.9p2

---
 ...regress-banner.sh-log-input-and-output-files-on-erro.patch | 2 +-
 ...regress-test-exec-use-the-absolute-path-in-the-SSH-e.patch | 4 ++--
 .../openssh/{openssh_9.9p1.bb => openssh_9.9p2.bb}            | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-connectivity/openssh/{openssh_9.9p1.bb => openssh_9.9p2.bb} (99%)

diff --git a/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-input-and-output-files-on-erro.patch b/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-input-and-output-files-on-erro.patch
index f424288e37..7f3ca31112 100644
--- a/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-input-and-output-files-on-erro.patch
+++ b/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-input-and-output-files-on-erro.patch
@@ -1,4 +1,4 @@
-From 5cc897fe2effe549e1e280c2f606bce8b532b61e Mon Sep 17 00:00:00 2001
+From 0ab56e46904c9703b1320fb29a05ab3270aa6132 Mon Sep 17 00:00:00 2001
 From: Mikko Rapeli <mikko.rapeli@linaro.org>
 Date: Mon, 11 Sep 2023 09:55:21 +0100
 Subject: [PATCH] regress/banner.sh: log input and output files on error
diff --git a/meta/recipes-connectivity/openssh/openssh/0001-regress-test-exec-use-the-absolute-path-in-the-SSH-e.patch b/meta/recipes-connectivity/openssh/openssh/0001-regress-test-exec-use-the-absolute-path-in-the-SSH-e.patch
index b90cd2e69d..076ab1384b 100644
--- a/meta/recipes-connectivity/openssh/openssh/0001-regress-test-exec-use-the-absolute-path-in-the-SSH-e.patch
+++ b/meta/recipes-connectivity/openssh/openssh/0001-regress-test-exec-use-the-absolute-path-in-the-SSH-e.patch
@@ -1,4 +1,4 @@
-From fb762172fb678fe29327b667f8fe7380962a4540 Mon Sep 17 00:00:00 2001
+From 6d232c6ef427ff61b8a52071eb45c1a217508266 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <jose.quaresma@foundries.io>
 Date: Mon, 15 Jul 2024 18:43:08 +0100
 Subject: [PATCH] regress/test-exec: use the absolute path in the SSH env
@@ -18,7 +18,7 @@ Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
  1 file changed, 5 insertions(+)
 
 diff --git a/regress/test-exec.sh b/regress/test-exec.sh
-index 7afc2807..175f554b 100644
+index 7afc280..175f554 100644
 --- a/regress/test-exec.sh
 +++ b/regress/test-exec.sh
 @@ -175,6 +175,11 @@ if [ "x$TEST_SSH_OPENSSL" != "x" ]; then
diff --git a/meta/recipes-connectivity/openssh/openssh_9.9p1.bb b/meta/recipes-connectivity/openssh/openssh_9.9p2.bb
similarity index 99%
rename from meta/recipes-connectivity/openssh/openssh_9.9p1.bb
rename to meta/recipes-connectivity/openssh/openssh_9.9p2.bb
index cb47ae7c07..5191725796 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.9p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.9p2.bb
@@ -26,7 +26,7 @@ SRC_URI = "https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.ta
            file://0001-regress-banner.sh-log-input-and-output-files-on-erro.patch \
            file://0001-regress-test-exec-use-the-absolute-path-in-the-SSH-e.patch \
            "
-SRC_URI[sha256sum] = "b343fbcdbff87f15b1986e6e15d6d4fc9a7d36066be6b7fb507087ba8f966c02"
+SRC_URI[sha256sum] = "91aadb603e08cc285eddf965e1199d02585fa94d994d6cae5b41e1721e215673"
 
 CVE_STATUS[CVE-2007-2768] = "not-applicable-config: This CVE is specific to OpenSSH with the pam opie which we don't build/use here."
 
-- 
2.44.1


--===============6413435308333954248==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/openssh: SRC_URI changed from "https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-9.9p1.tar.gz file://sshd_config file://ssh_config file://init file://sshd file://sshd.service file://sshd.socket file://sshd@.service file://sshdgenkeys.service file://volatiles.99_sshd file://run-ptest file://sshd_check_keys file://0001-regress-banner.sh-log-input-and-output-files-on-erro.patch file://0001-regress-test-exec-use-the-absolute-path-in-the-SSH-e.patch" to "https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-9.9p2.tar.gz file://sshd_config file://ssh_config file://init file://sshd file://sshd.service file://sshd.socket file://sshd@.service file://sshdgenkeys.service file://volatiles.99_sshd file://run-ptest file://sshd_check_keys file://0001-regress-banner.sh-log-input-and-output-files-on-erro.patch file://0001-regress-test-exec-use-the-absolute-path-in-the-SSH-e.patch"
packages/core2-64-poky-linux/openssh: PV changed from "9.9p1" to "9.9p2"
packages/core2-64-poky-linux/openssh: PKGV changed from 9.9p1 [default] to 9.9p2 [default]
packages/core2-64-poky-linux/openssh/openssh-dbg: PV changed from "9.9p1" to "9.9p2"
packages/core2-64-poky-linux/openssh/openssh-dbg: PKGV changed from 9.9p1 [default] to 9.9p2 [default]
packages/core2-64-poky-linux/openssh/openssh-dbg: PKGSIZE changed from 25472256 to 25508376 (+0%)
packages/core2-64-poky-linux/openssh/openssh-dev: PV changed from "9.9p1" to "9.9p2"
packages/core2-64-poky-linux/openssh/openssh-dev: PKGV changed from 9.9p1 [default] to 9.9p2 [default]
packages/core2-64-poky-linux/openssh/openssh-doc: PV changed from "9.9p1" to "9.9p2"
packages/core2-64-poky-linux/openssh/openssh-doc: PKGV changed from 9.9p1 [default] to 9.9p2 [default]
packages/core2-64-poky-linux/openssh/openssh-keygen: PV changed from "9.9p1" to "9.9p2"
packages/core2-64-poky-linux/openssh/openssh-keygen: PKGV changed from 9.9p1 [default] to 9.9p2 [default]
packages/core2-64-poky-linux/openssh/openssh-locale: PV changed from "9.9p1" to "9.9p2"
packages/core2-64-poky-linux/openssh/openssh-locale: PKGV changed from 9.9p1 [default] to 9.9p2 [default]
packages/core2-64-poky-linux/openssh/openssh-misc: PV changed from "9.9p1" to "9.9p2"
packages/core2-64-poky-linux/openssh/openssh-misc: PKGV changed from 9.9p1 [default] to 9.9p2 [default]
packages/core2-64-poky-linux/openssh/openssh-ptest: PV changed from "9.9p1" to "9.9p2"
packages/core2-64-poky-linux/openssh/openssh-ptest: PKGV changed from 9.9p1 [default] to 9.9p2 [default]
packages/core2-64-poky-linux/openssh/openssh-ptest: PKGSIZE changed from 5912993 to 5925202 (+0%)
packages/core2-64-poky-linux/openssh/openssh-scp: PV changed from "9.9p1" to "9.9p2"
packages/core2-64-poky-linux/openssh/openssh-scp: PKGV changed from 9.9p1 [default] to 9.9p2 [default]
packages/core2-64-poky-linux/openssh/openssh-scp: PKGSIZE changed from 223672 to 227768 (+2%)
packages/core2-64-poky-linux/openssh/openssh-sftp-server: PV changed from "9.9p1" to "9.9p2"
packages/core2-64-poky-linux/openssh/openssh-sftp-server: PKGV changed from 9.9p1 [default] to 9.9p2 [default]
packages/core2-64-poky-linux/openssh/openssh-sftp: PV changed from "9.9p1" to "9.9p2"
packages/core2-64-poky-linux/openssh/openssh-sftp: PKGV changed from 9.9p1 [default] to 9.9p2 [default]
packages/core2-64-poky-linux/openssh/openssh-src: PV changed from "9.9p1" to "9.9p2"
packages/core2-64-poky-linux/openssh/openssh-src: PKGV changed from 9.9p1 [default] to 9.9p2 [default]
packages/core2-64-poky-linux/openssh/openssh-src: PKGSIZE changed from 4254524 to 4257000 (+0%)
packages/core2-64-poky-linux/openssh/openssh-ssh: PV changed from "9.9p1" to "9.9p2"
packages/core2-64-poky-linux/openssh/openssh-ssh: PKGV changed from 9.9p1 [default] to 9.9p2 [default]
packages/core2-64-poky-linux/openssh/openssh-sshd: PV changed from "9.9p1" to "9.9p2"
packages/core2-64-poky-linux/openssh/openssh-sshd: PKGV changed from 9.9p1 [default] to 9.9p2 [default]
packages/core2-64-poky-linux/openssh/openssh-sshd: PKGSIZE changed from 2132107 to 2136203 (+0%)
packages/core2-64-poky-linux/openssh/openssh-staticdev: PV changed from "9.9p1" to "9.9p2"
packages/core2-64-poky-linux/openssh/openssh-staticdev: PKGV changed from 9.9p1 [default] to 9.9p2 [default]
packages/core2-64-poky-linux/openssh/openssh: PV changed from "9.9p1" to "9.9p2"
packages/core2-64-poky-linux/openssh/openssh: PKGV changed from 9.9p1 [default] to 9.9p2 [default]

--===============6413435308333954248==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-openssh-upgrade-9.9p1-9.9p2.patch"

RnJvbSAyN2I2YjUxZTc4OTc4YjI0OWY2NzM4MTRmN2Q2ZDExNTIxZGM1ZDgyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBNYXIgMjAyNSAwNjo1NToyMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG9w
ZW5zc2g6IHVwZ3JhZGUgOS45cDEgLT4gOS45cDIKCi0tLQogLi4ucmVncmVzcy1iYW5uZXIuc2gt
bG9nLWlucHV0LWFuZC1vdXRwdXQtZmlsZXMtb24tZXJyby5wYXRjaCB8IDIgKy0KIC4uLnJlZ3Jl
c3MtdGVzdC1leGVjLXVzZS10aGUtYWJzb2x1dGUtcGF0aC1pbi10aGUtU1NILWUucGF0Y2ggfCA0
ICsrLS0KIC4uLi9vcGVuc3NoL3tvcGVuc3NoXzkuOXAxLmJiID0+IG9wZW5zc2hfOS45cDIuYmJ9
ICAgICAgICAgICAgfCAyICstCiAzIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBk
ZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2gve29w
ZW5zc2hfOS45cDEuYmIgPT4gb3BlbnNzaF85LjlwMi5iYn0gKDk5JSkKCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2gvb3BlbnNzaC8wMDAxLXJlZ3Jlc3MtYmFu
bmVyLnNoLWxvZy1pbnB1dC1hbmQtb3V0cHV0LWZpbGVzLW9uLWVycm8ucGF0Y2ggYi9tZXRhL3Jl
Y2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2gvb3BlbnNzaC8wMDAxLXJlZ3Jlc3MtYmFubmVyLnNo
LWxvZy1pbnB1dC1hbmQtb3V0cHV0LWZpbGVzLW9uLWVycm8ucGF0Y2gKaW5kZXggZjQyNDI4OGUz
Ny4uN2YzY2EzMTExMiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVu
c3NoL29wZW5zc2gvMDAwMS1yZWdyZXNzLWJhbm5lci5zaC1sb2ctaW5wdXQtYW5kLW91dHB1dC1m
aWxlcy1vbi1lcnJvLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNz
aC9vcGVuc3NoLzAwMDEtcmVncmVzcy1iYW5uZXIuc2gtbG9nLWlucHV0LWFuZC1vdXRwdXQtZmls
ZXMtb24tZXJyby5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNWNjODk3ZmUyZWZmZTU0OWUx
ZTI4MGMyZjYwNmJjZThiNTMyYjYxZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMGFi
NTZlNDY5MDRjOTcwM2IxMzIwZmIyOWEwNWFiMzI3MGFhNjEzMiBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKIEZyb206IE1pa2tvIFJhcGVsaSA8bWlra28ucmFwZWxpQGxpbmFyby5vcmc+CiBEYXRl
OiBNb24sIDExIFNlcCAyMDIzIDA5OjU1OjIxICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIHJlZ3Jl
c3MvYmFubmVyLnNoOiBsb2cgaW5wdXQgYW5kIG91dHB1dCBmaWxlcyBvbiBlcnJvcgpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NoL29wZW5zc2gvMDAwMS1yZWdy
ZXNzLXRlc3QtZXhlYy11c2UtdGhlLWFic29sdXRlLXBhdGgtaW4tdGhlLVNTSC1lLnBhdGNoIGIv
bWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NoL29wZW5zc2gvMDAwMS1yZWdyZXNzLXRl
c3QtZXhlYy11c2UtdGhlLWFic29sdXRlLXBhdGgtaW4tdGhlLVNTSC1lLnBhdGNoCmluZGV4IGI5
MGNkMmU2OWQuLjA3NmFiMTM4NGIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZp
dHkvb3BlbnNzaC9vcGVuc3NoLzAwMDEtcmVncmVzcy10ZXN0LWV4ZWMtdXNlLXRoZS1hYnNvbHV0
ZS1wYXRoLWluLXRoZS1TU0gtZS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5
L29wZW5zc2gvb3BlbnNzaC8wMDAxLXJlZ3Jlc3MtdGVzdC1leGVjLXVzZS10aGUtYWJzb2x1dGUt
cGF0aC1pbi10aGUtU1NILWUucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGZiNzYyMTcyZmI2
NzhmZTI5MzI3YjY2N2Y4ZmU3MzgwOTYyYTQ1NDAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitG
cm9tIDZkMjMyYzZlZjQyN2ZmNjFiOGE1MjA3MWViNDVjMWEyMTc1MDgyNjYgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCiBGcm9tOiBKb3NlIFF1YXJlc21hIDxqb3NlLnF1YXJlc21hQGZvdW5kcmll
cy5pbz4KIERhdGU6IE1vbiwgMTUgSnVsIDIwMjQgMTg6NDM6MDggKzAxMDAKIFN1YmplY3Q6IFtQ
QVRDSF0gcmVncmVzcy90ZXN0LWV4ZWM6IHVzZSB0aGUgYWJzb2x1dGUgcGF0aCBpbiB0aGUgU1NI
IGVudgpAQCAtMTgsNyArMTgsNyBAQCBTaWduZWQtb2ZmLWJ5OiBKb3NlIFF1YXJlc21hIDxqb3Nl
LnF1YXJlc21hQGZvdW5kcmllcy5pbz4KICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCsp
CiAKIGRpZmYgLS1naXQgYS9yZWdyZXNzL3Rlc3QtZXhlYy5zaCBiL3JlZ3Jlc3MvdGVzdC1leGVj
LnNoCi1pbmRleCA3YWZjMjgwNy4uMTc1ZjU1NGIgMTAwNjQ0CitpbmRleCA3YWZjMjgwLi4xNzVm
NTU0IDEwMDY0NAogLS0tIGEvcmVncmVzcy90ZXN0LWV4ZWMuc2gKICsrKyBiL3JlZ3Jlc3MvdGVz
dC1leGVjLnNoCiBAQCAtMTc1LDYgKzE3NSwxMSBAQCBpZiBbICJ4JFRFU1RfU1NIX09QRU5TU0wi
ICE9ICJ4IiBdOyB0aGVuCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29w
ZW5zc2gvb3BlbnNzaF85LjlwMS5iYiBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNz
aC9vcGVuc3NoXzkuOXAyLmJiCnNpbWlsYXJpdHkgaW5kZXggOTklCnJlbmFtZSBmcm9tIG1ldGEv
cmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzaC9vcGVuc3NoXzkuOXAxLmJiCnJlbmFtZSB0byBt
ZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2gvb3BlbnNzaF85LjlwMi5iYgppbmRleCBj
YjQ3YWU3YzA3Li41MTkxNzI1Nzk2IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2
aXR5L29wZW5zc2gvb3BlbnNzaF85LjlwMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2
aXR5L29wZW5zc2gvb3BlbnNzaF85LjlwMi5iYgpAQCAtMjYsNyArMjYsNyBAQCBTUkNfVVJJID0g
Imh0dHBzOi8vZnRwLm9wZW5ic2Qub3JnL3B1Yi9PcGVuQlNEL09wZW5TU0gvcG9ydGFibGUvb3Bl
bnNzaC0ke1BWfS50YQogICAgICAgICAgICBmaWxlOi8vMDAwMS1yZWdyZXNzLWJhbm5lci5zaC1s
b2ctaW5wdXQtYW5kLW91dHB1dC1maWxlcy1vbi1lcnJvLnBhdGNoIFwKICAgICAgICAgICAgZmls
ZTovLzAwMDEtcmVncmVzcy10ZXN0LWV4ZWMtdXNlLXRoZS1hYnNvbHV0ZS1wYXRoLWluLXRoZS1T
U0gtZS5wYXRjaCBcCiAgICAgICAgICAgICIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJiMzQzZmJj
ZGJmZjg3ZjE1YjE5ODZlNmUxNWQ2ZDRmYzlhN2QzNjA2NmJlNmI3ZmI1MDcwODdiYThmOTY2YzAy
IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjkxYWFkYjYwM2UwOGNjMjg1ZWRkZjk2NWUxMTk5ZDAy
NTg1ZmE5NGQ5OTRkNmNhZTViNDFlMTcyMWUyMTU2NzMiCiAKIENWRV9TVEFUVVNbQ1ZFLTIwMDct
Mjc2OF0gPSAibm90LWFwcGxpY2FibGUtY29uZmlnOiBUaGlzIENWRSBpcyBzcGVjaWZpYyB0byBP
cGVuU1NIIHdpdGggdGhlIHBhbSBvcGllIHdoaWNoIHdlIGRvbid0IGJ1aWxkL3VzZSBoZXJlLiIK
IAotLSAKMi40NC4xCgo=

--===============6413435308333954248==--

