Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2006EFA0C5E
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 14:04:37 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19813.1776261873951630950
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 07:04:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=sUAlhMuU;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=J1uQ7pCV;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019d91753e91-f7599efe-cef1-4317-8170-5f39a2b27e98-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1776261873;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=/Jt8xro4qAANaZ5H7lTutHPbEqo88lMunuhTvVc/7I8=;
	b=sUAlhMuU2JlTNofxIRfFao+zVYyMiAy2oVfYFERG+W8o8JetjEuZCYAiI06XpSwq
	6F6ezytGVNFGODMUfHkU8mPANe5F96gb+r+0urGQu77EodUt87WfYb0vvZxB68l4sM2
	xtc826/MH9i1nN+n6bStYKGKUysKYSd4yuPfP/vE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1776261873;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=/Jt8xro4qAANaZ5H7lTutHPbEqo88lMunuhTvVc/7I8=;
	b=J1uQ7pCVEOZwbtJrGuXfuIqweNLq51Ug0mcjcLXAovGeERa7reAwOy6VBsfp0UIU
	TJnqGz5T2z3oOHcKp48uKupCyKdwMliCRhQ4raq8hpkYzqpm+b7XifOn6iHvhKU51H5
	rgYinNPdeic8t8VeLI/T10GUoHj/3kds9THD/1OA=
Content-Type: multipart/mixed; boundary="===============1052265376803707122=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] openssh: upgrading to 10.3p1 SUCCEEDED
Message-ID: <0101019d91753e91-f7599efe-cef1-4317-8170-5f39a2b27e98-000000@us-west-2.amazonses.com>
Date: Wed, 15 Apr 2026 14:04:33 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 14:04:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235217

--===============1052265376803707122==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *openssh* to *10.3p1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-openssh-upgrade-10.2p1-10.3p1.patch
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
From 66a3b88030e73641d4a40ce2eff15f4e73d528c4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Apr 2026 06:36:25 +0000
Subject: [PATCH] openssh: upgrade 10.2p1 -> 10.3p1

---
 ...1-regress-banner.sh-log-input-and-output-files-on-erro.patch | 2 +-
 .../openssh/{openssh_10.2p1.bb => openssh_10.3p1.bb}            | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/openssh/{openssh_10.2p1.bb => openssh_10.3p1.bb} (99%)

diff --git a/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-input-and-output-files-on-erro.patch b/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-input-and-output-files-on-erro.patch
index f424288e37..e344c3b60f 100644
--- a/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-input-and-output-files-on-erro.patch
+++ b/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-input-and-output-files-on-erro.patch
@@ -1,4 +1,4 @@
-From 5cc897fe2effe549e1e280c2f606bce8b532b61e Mon Sep 17 00:00:00 2001
+From fa13753f8592600e35028115ec38f62affb9a565 Mon Sep 17 00:00:00 2001
 From: Mikko Rapeli <mikko.rapeli@linaro.org>
 Date: Mon, 11 Sep 2023 09:55:21 +0100
 Subject: [PATCH] regress/banner.sh: log input and output files on error
diff --git a/meta/recipes-connectivity/openssh/openssh_10.2p1.bb b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
similarity index 99%
rename from meta/recipes-connectivity/openssh/openssh_10.2p1.bb
rename to meta/recipes-connectivity/openssh/openssh_10.3p1.bb
index 96cb09acc0..a050475532 100644
--- a/meta/recipes-connectivity/openssh/openssh_10.2p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
@@ -25,7 +25,7 @@ SRC_URI = "https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.ta
            file://sshd_check_keys \
            file://0001-regress-banner.sh-log-input-and-output-files-on-erro.patch \
            "
-SRC_URI[sha256sum] = "ccc42c0419937959263fa1dbd16dafc18c56b984c03562d2937ce56a60f798b2"
+SRC_URI[sha256sum] = "56682a36bb92dcf4b4f016fd8ec8e74059b79a8de25c15d670d731e7d18e45f4"
 
 CVE_STATUS[CVE-2007-2768] = "not-applicable-config: This CVE is specific to OpenSSH with the pam opie which we don't build/use here."
 
-- 
2.47.1


--===============1052265376803707122==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/openssh/openssh-keygen: PKGSIZE changed from 547008 to 424128 (-22%)
packages/x86-64-v3-poky-linux/openssh/openssh-misc: PKGSIZE changed from 2325717 to 1719509 (-26%)
packages/x86-64-v3-poky-linux/openssh/openssh-ptest: FILELIST: added "/usr/lib/openssh/ptest/regress/proxyjump.sh /usr/lib/openssh/ptest/regress/ssh-tty.sh /usr/lib/openssh/ptest/regress/kbdint.sh /usr/lib/openssh/ptest/regress/ssh-pkcs11.sh /usr/lib/openssh/ptest/regress/gss-auth.sh"

--===============1052265376803707122==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-openssh-upgrade-10.2p1-10.3p1.patch"

RnJvbSA2NmEzYjg4MDMwZTczNjQxZDRhNDBjZTJlZmYxNWY0ZTczZDUyOGM0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgQXByIDIwMjYgMDY6MzY6MjUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBv
cGVuc3NoOiB1cGdyYWRlIDEwLjJwMSAtPiAxMC4zcDEKCi0tLQogLi4uMS1yZWdyZXNzLWJhbm5l
ci5zaC1sb2ctaW5wdXQtYW5kLW91dHB1dC1maWxlcy1vbi1lcnJvLnBhdGNoIHwgMiArLQogLi4u
L29wZW5zc2gve29wZW5zc2hfMTAuMnAxLmJiID0+IG9wZW5zc2hfMTAuM3AxLmJifSAgICAgICAg
ICAgIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NoL3tvcGVuc3NoXzEw
LjJwMS5iYiA9PiBvcGVuc3NoXzEwLjNwMS5iYn0gKDk5JSkKCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2gvb3BlbnNzaC8wMDAxLXJlZ3Jlc3MtYmFubmVyLnNo
LWxvZy1pbnB1dC1hbmQtb3V0cHV0LWZpbGVzLW9uLWVycm8ucGF0Y2ggYi9tZXRhL3JlY2lwZXMt
Y29ubmVjdGl2aXR5L29wZW5zc2gvb3BlbnNzaC8wMDAxLXJlZ3Jlc3MtYmFubmVyLnNoLWxvZy1p
bnB1dC1hbmQtb3V0cHV0LWZpbGVzLW9uLWVycm8ucGF0Y2gKaW5kZXggZjQyNDI4OGUzNy4uZTM0
NGMzYjYwZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NoL29w
ZW5zc2gvMDAwMS1yZWdyZXNzLWJhbm5lci5zaC1sb2ctaW5wdXQtYW5kLW91dHB1dC1maWxlcy1v
bi1lcnJvLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzaC9vcGVu
c3NoLzAwMDEtcmVncmVzcy1iYW5uZXIuc2gtbG9nLWlucHV0LWFuZC1vdXRwdXQtZmlsZXMtb24t
ZXJyby5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNWNjODk3ZmUyZWZmZTU0OWUxZTI4MGMy
ZjYwNmJjZThiNTMyYjYxZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZmExMzc1M2Y4
NTkyNjAwZTM1MDI4MTE1ZWMzOGY2MmFmZmI5YTU2NSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
IEZyb206IE1pa2tvIFJhcGVsaSA8bWlra28ucmFwZWxpQGxpbmFyby5vcmc+CiBEYXRlOiBNb24s
IDExIFNlcCAyMDIzIDA5OjU1OjIxICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIHJlZ3Jlc3MvYmFu
bmVyLnNoOiBsb2cgaW5wdXQgYW5kIG91dHB1dCBmaWxlcyBvbiBlcnJvcgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NoL29wZW5zc2hfMTAuMnAxLmJiIGIvbWV0
YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NoL29wZW5zc2hfMTAuM3AxLmJiCnNpbWlsYXJp
dHkgaW5kZXggOTklCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNz
aC9vcGVuc3NoXzEwLjJwMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9v
cGVuc3NoL29wZW5zc2hfMTAuM3AxLmJiCmluZGV4IDk2Y2IwOWFjYzAuLmEwNTA0NzU1MzIgMTAw
NjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzaC9vcGVuc3NoXzEwLjJw
MS5iYgorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2gvb3BlbnNzaF8xMC4z
cDEuYmIKQEAgLTI1LDcgKzI1LDcgQEAgU1JDX1VSSSA9ICJodHRwczovL2Z0cC5vcGVuYnNkLm9y
Zy9wdWIvT3BlbkJTRC9PcGVuU1NIL3BvcnRhYmxlL29wZW5zc2gtJHtQVn0udGEKICAgICAgICAg
ICAgZmlsZTovL3NzaGRfY2hlY2tfa2V5cyBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLXJlZ3Jl
c3MtYmFubmVyLnNoLWxvZy1pbnB1dC1hbmQtb3V0cHV0LWZpbGVzLW9uLWVycm8ucGF0Y2ggXAog
ICAgICAgICAgICAiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiY2NjNDJjMDQxOTkzNzk1OTI2M2Zh
MWRiZDE2ZGFmYzE4YzU2Yjk4NGMwMzU2MmQyOTM3Y2U1NmE2MGY3OThiMiIKK1NSQ19VUklbc2hh
MjU2c3VtXSA9ICI1NjY4MmEzNmJiOTJkY2Y0YjRmMDE2ZmQ4ZWM4ZTc0MDU5Yjc5YThkZTI1YzE1
ZDY3MGQ3MzFlN2QxOGU0NWY0IgogCiBDVkVfU1RBVFVTW0NWRS0yMDA3LTI3NjhdID0gIm5vdC1h
cHBsaWNhYmxlLWNvbmZpZzogVGhpcyBDVkUgaXMgc3BlY2lmaWMgdG8gT3BlblNTSCB3aXRoIHRo
ZSBwYW0gb3BpZSB3aGljaCB3ZSBkb24ndCBidWlsZC91c2UgaGVyZS4iCiAKLS0gCjIuNDcuMQoK

--===============1052265376803707122==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/openssh: SRC_URI changed from "https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-10.2p1.tar.gz file://sshd_config file://ssh_config file://init file://sshd file://sshd.service file://sshd.socket file://sshd@.service file://sshdgenkeys.service file://volatiles.99_sshd file://run-ptest file://sshd_check_keys file://0001-regress-banner.sh-log-input-and-output-files-on-erro.patch" to "https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-10.3p1.tar.gz file://sshd_config file://ssh_config file://init file://sshd file://sshd.service file://sshd.socket file://sshd@.service file://sshdgenkeys.service file://volatiles.99_sshd file://run-ptest file://sshd_check_keys file://0001-regress-banner.sh-log-input-and-output-files-on-erro.patch"
packages/x86-64-v3-poky-linux/openssh: PKGV changed from 10.2p1 [default] to 10.3p1 [default]
packages/x86-64-v3-poky-linux/openssh: PV changed from "10.2p1" to "10.3p1"
packages/x86-64-v3-poky-linux/openssh/openssh-dbg: PKGV changed from 10.2p1 [default] to 10.3p1 [default]
packages/x86-64-v3-poky-linux/openssh/openssh-dbg: PKGSIZE changed from 28717128 to 27056816 (-6%)
packages/x86-64-v3-poky-linux/openssh/openssh-dbg: PV changed from "10.2p1" to "10.3p1"
packages/x86-64-v3-poky-linux/openssh/openssh-dev: PKGV changed from 10.2p1 [default] to 10.3p1 [default]
packages/x86-64-v3-poky-linux/openssh/openssh-dev: PV changed from "10.2p1" to "10.3p1"
packages/x86-64-v3-poky-linux/openssh/openssh-doc: PKGV changed from 10.2p1 [default] to 10.3p1 [default]
packages/x86-64-v3-poky-linux/openssh/openssh-doc: PKGSIZE changed from 355152 to 358277 (+1%)
packages/x86-64-v3-poky-linux/openssh/openssh-doc: PV changed from "10.2p1" to "10.3p1"
packages/x86-64-v3-poky-linux/openssh/openssh-keygen: PKGV changed from 10.2p1 [default] to 10.3p1 [default]
packages/x86-64-v3-poky-linux/openssh/openssh-keygen: PKGSIZE changed from 547008 to 424128 (-22%)
packages/x86-64-v3-poky-linux/openssh/openssh-keygen: PV changed from "10.2p1" to "10.3p1"
packages/x86-64-v3-poky-linux/openssh/openssh-locale: PKGV changed from 10.2p1 [default] to 10.3p1 [default]
packages/x86-64-v3-poky-linux/openssh/openssh-locale: PV changed from "10.2p1" to "10.3p1"
packages/x86-64-v3-poky-linux/openssh/openssh-misc: PKGV changed from 10.2p1 [default] to 10.3p1 [default]
packages/x86-64-v3-poky-linux/openssh/openssh-misc: PKGSIZE changed from 2325717 to 1719509 (-26%)
packages/x86-64-v3-poky-linux/openssh/openssh-misc: PV changed from "10.2p1" to "10.3p1"
packages/x86-64-v3-poky-linux/openssh/openssh-ptest: FILELIST: added "/usr/lib/openssh/ptest/regress/gss-auth.sh /usr/lib/openssh/ptest/regress/proxyjump.sh /usr/lib/openssh/ptest/regress/ssh-tty.sh /usr/lib/openssh/ptest/regress/kbdint.sh /usr/lib/openssh/ptest/regress/ssh-pkcs11.sh"
packages/x86-64-v3-poky-linux/openssh/openssh-ptest: PKGV changed from 10.2p1 [default] to 10.3p1 [default]
packages/x86-64-v3-poky-linux/openssh/openssh-ptest: PKGSIZE changed from 6307546 to 5845543 (-7%)
packages/x86-64-v3-poky-linux/openssh/openssh-ptest: PV changed from "10.2p1" to "10.3p1"
packages/x86-64-v3-poky-linux/openssh/openssh-scp: PKGV changed from 10.2p1 [default] to 10.3p1 [default]
packages/x86-64-v3-poky-linux/openssh/openssh-scp: PKGSIZE changed from 223672 to 227768 (+2%)
packages/x86-64-v3-poky-linux/openssh/openssh-scp: PV changed from "10.2p1" to "10.3p1"
packages/x86-64-v3-poky-linux/openssh/openssh-sftp-server: PKGV changed from 10.2p1 [default] to 10.3p1 [default]
packages/x86-64-v3-poky-linux/openssh/openssh-sftp-server: PV changed from "10.2p1" to "10.3p1"
packages/x86-64-v3-poky-linux/openssh/openssh-sftp: PKGV changed from 10.2p1 [default] to 10.3p1 [default]
packages/x86-64-v3-poky-linux/openssh/openssh-sftp: PV changed from "10.2p1" to "10.3p1"
packages/x86-64-v3-poky-linux/openssh/openssh-src: FILELIST: directory renamed /usr/src/debug/openssh/10.2p1/regress/unittests/hostkeys -> /usr/src/debug/openssh/10.3p1/regress/unittests/hostkeys, directory renamed /usr/src/debug/openssh/10.2p1/regress/unittests/bitmap -> /usr/src/debug/openssh/10.3p1/regress/unittests/bitmap, directory renamed /usr/src/debug/openssh/10.2p1/openbsd-compat -> /usr/src/debug/openssh/10.3p1/openbsd-compat, directory renamed /usr/src/debug/openssh/10.2p1/regress/unittests/match -> /usr/src/debug/openssh/10.3p1/regress/unittests/match, directory renamed /usr/src/debug/openssh/10.2p1/regress/unittests/misc -> /usr/src/debug/openssh/10.3p1/regress/unittests/misc, directory renamed /usr/src/debug/openssh/10.2p1/regress/unittests/sshkey -> /usr/src/debug/openssh/10.3p1/regress/unittests/sshkey, directory renamed /usr/src/debug/openssh/10.2p1/regress/unittests/test_helper -> /usr/src/debug/openssh/10.3p1/regress/unittests/test_helper, directory renamed /usr/sr
 c/debug/openssh/10.2p1/regress/unittests/conversion -> /usr/src/debug/openssh/10.3p1/regress/unittests/conversion, directory renamed /usr/src/debug/openssh/10.2p1/regress -> /usr/src/debug/openssh/10.3p1/regress, directory renamed /usr/src/debug/openssh/10.2p1/regress/unittests/sshsig -> /usr/src/debug/openssh/10.3p1/regress/unittests/sshsig, directory renamed /usr/src/debug/openssh/10.2p1/regress/unittests/kex -> /usr/src/debug/openssh/10.3p1/regress/unittests/kex, directory renamed /usr/src/debug/openssh/10.2p1/regress/unittests/authopt -> /usr/src/debug/openssh/10.3p1/regress/unittests/authopt, directory renamed /usr/src/debug/openssh/10.2p1/regress/unittests/utf8 -> /usr/src/debug/openssh/10.3p1/regress/unittests/utf8, directory renamed /usr/src/debug/openssh/10.2p1/regress/unittests/sshbuf -> /usr/src/debug/openssh/10.3p1/regress/unittests/sshbuf, removed "/usr/src/debug/openssh/10.2p1/ssh-sandbox.h /usr/src/debug/openssh/10.2p1/poly1305.c /usr/src/debug/openssh/10.2p1/digest-o
 penssl.c /usr/src/debug/openssh/10.2p1/auth2.c /usr/src/debug/openssh/10.2p1/auth2-chall.c /usr/src/debug/openssh/10.2p1/poly1305.h /usr/src/debug/openssh/10.2p1/sshtty.c /usr/src/debug/openssh/10.2p1/sshpty.c /usr/src/debug/openssh/10.2p1/compat.c /usr/src/debug/openssh/10.2p1/auth-passwd.c /usr/src/debug/openssh/10.2p1/compat.h /usr/src/debug/openssh/10.2p1/sshpty.h /usr/src/debug/openssh/10.2p1/monitor_fdpass.h /usr/src/debug/openssh/10.2p1/srclimit.c /usr/src/debug/openssh/10.2p1/uidswap.h /usr/src/debug/openssh/10.2p1/monitor_fdpass.c /usr/src/debug/openssh/10.2p1/auth-shadow.c /usr/src/debug/openssh/10.2p1/misc-agent.c /usr/src/debug/openssh/10.2p1/auth2-pubkeyfile.c /usr/src/debug/openssh/10.2p1/uidswap.c /usr/src/debug/openssh/10.2p1/srclimit.h /usr/src/debug/openssh/10.2p1/dh.h /usr/src/debug/openssh/10.2p1/match.h /usr/src/debug/openssh/10.2p1/digest.h /usr/src/debug/openssh/10.2p1/ssh-sk.h /usr/src/debug/openssh/10.2p1/dh.c /usr/src/debug/openssh/10.2p1/clientloop.c /usr/
 src/debug/openssh/10.2p1/bitmap.c /usr/src/debug/openssh/10.2p1/match.c /usr/src/debug/openssh/10.2p1/auth2-kbdint.c /usr/src/debug/openssh/10.2p1/sshkey.h /usr/src/debug/openssh/10.2p1/bitmap.h /usr/src/debug/openssh/10.2p1/clientloop.h /usr/src/debug/openssh/10.2p1/sshbuf-getput-crypto.c /usr/src/debug/openssh/10.2p1/sshkey.c /usr/src/debug/openssh/10.2p1/sshbuf.c /usr/src/debug/openssh/10.2p1/kexgex.c /usr/src/debug/openssh/10.2p1/readconf.h /usr/src/debug/openssh/10.2p1/readconf.c /usr/src/debug/openssh/10.2p1/sshbuf.h /usr/src/debug/openssh/10.2p1/log.h /usr/src/debug/openssh/10.2p1/auth.c /usr/src/debug/openssh/10.2p1/cipher.c /usr/src/debug/openssh/10.2p1/cleanup.c /usr/src/debug/openssh/10.2p1/fatal.c /usr/src/debug/openssh/10.2p1/kexsntrup761x25519.c /usr/src/debug/openssh/10.2p1/msg.h /usr/src/debug/openssh/10.2p1/platform-tracing.c /usr/src/debug/openssh/10.2p1/cipher.h /usr/src/debug/openssh/10.2p1/auth.h /usr/src/debug/openssh/10.2p1/kexdh.c /usr/src/debug/openssh/10.2p
 1/libcrux_mlkem768_sha3.h /usr/src/debug/openssh/10.2p1/log.c /usr/src/debug/openssh/10.2p1/msg.c /usr/src/debug/openssh/10.2p1/sshd.c /usr/src/debug/openssh/10.2p1/xmalloc.h /usr/src/debug/openssh/10.2p1/monitor.c /usr/src/debug/openssh/10.2p1/sftp-common.h /usr/src/debug/openssh/10.2p1/pkcs11.h /usr/src/debug/openssh/10.2p1/kexecdh.c /usr/src/debug/openssh/10.2p1/sftp-common.c /usr/src/debug/openssh/10.2p1/monitor.h /usr/src/debug/openssh/10.2p1/xmalloc.c /usr/src/debug/openssh/10.2p1/sshbuf-getput-basic.c /usr/src/debug/openssh/10.2p1/servconf.h /usr/src/debug/openssh/10.2p1/kexgexc.c /usr/src/debug/openssh/10.2p1/servconf.c /usr/src/debug/openssh/10.2p1/kexgen.c /usr/src/debug/openssh/10.2p1/hostfile.h /usr/src/debug/openssh/10.2p1/cipher-chachapoly.h /usr/src/debug/openssh/10.2p1/hostfile.c /usr/src/debug/openssh/10.2p1/entropy.h /usr/src/debug/openssh/10.2p1/sftp-client.c /usr/src/debug/openssh/10.2p1/entropy.c /usr/src/debug/openssh/10.2p1/smult_curve25519_ref.c /usr/src/debu
 g/openssh/10.2p1/rijndael.h /usr/src/debug/openssh/10.2p1/sftp-client.h /usr/src/debug/openssh/10.2p1/ed25519.c /usr/src/debug/openssh/10.2p1/moduli.c /usr/src/debug/openssh/10.2p1/kexgexs.c /usr/src/debug/openssh/10.2p1/sftp-server-main.c /usr/src/debug/openssh/10.2p1/sftp-realpath.c /usr/src/debug/openssh/10.2p1/krl.c /usr/src/debug/openssh/10.2p1/atomicio.h /usr/src/debug/openssh/10.2p1/ssh-pkcs11.h /usr/src/debug/openssh/10.2p1/sshconnect.h /usr/src/debug/openssh/10.2p1/atomicio.c /usr/src/debug/openssh/10.2p1/krl.h /usr/src/debug/openssh/10.2p1/ssh-keygen.c /usr/src/debug/openssh/10.2p1/ssh-pkcs11.c /usr/src/debug/openssh/10.2p1/sshconnect.c /usr/src/debug/openssh/10.2p1/auth-rhosts.c /usr/src/debug/openssh/10.2p1/sftp-usergroup.c /usr/src/debug/openssh/10.2p1/progressmeter.h /usr/src/debug/openssh/10.2p1/sftp-usergroup.h /usr/src/debug/openssh/10.2p1/progressmeter.c /usr/src/debug/openssh/10.2p1/ssh-pkcs11-client.c /usr/src/debug/openssh/10.2p1/sshbuf-io.c /usr/src/debug/opens
 sh/10.2p1/sshd-auth.c /usr/src/debug/openssh/10.2p1/hmac.h /usr/src/debug/openssh/10.2p1/umac.h /usr/src/debug/openssh/10.2p1/hmac.c /usr/src/debug/openssh/10.2p1/auth2-passwd.c /usr/src/debug/openssh/10.2p1/umac.c /usr/src/debug/openssh/10.2p1/kexmlkem768x25519.c /usr/src/debug/openssh/10.2p1/auth2-none.c /usr/src/debug/openssh/10.2p1/auth-options.h /usr/src/debug/openssh/10.2p1/ssherr.h /usr/src/debug/openssh/10.2p1/auth-options.c /usr/src/debug/openssh/10.2p1/cipher-chachapoly-libcrypto.c /usr/src/debug/openssh/10.2p1/misc.h /usr/src/debug/openssh/10.2p1/ssh-add.c /usr/src/debug/openssh/10.2p1/ssherr.c /usr/src/debug/openssh/10.2p1/nchan.c /usr/src/debug/openssh/10.2p1/loginrec.c /usr/src/debug/openssh/10.2p1/misc.c /usr/src/debug/openssh/10.2p1/loginrec.h /usr/src/debug/openssh/10.2p1/dispatch.c /usr/src/debug/openssh/10.2p1/dns.c /usr/src/debug/openssh/10.2p1/addr.h /usr/src/debug/openssh/10.2p1/ssh_api.h /usr/src/debug/openssh/10.2p1/dns.h /usr/src/debug/openssh/10.2p1/dispatc
 h.h /usr/src/debug/openssh/10.2p1/sshbuf-misc.c /usr/src/debug/openssh/10.2p1/scp.c /usr/src/debug/openssh/10.2p1/ssh_api.c /usr/src/debug/openssh/10.2p1/addr.c /usr/src/debug/openssh/10.2p1/sshlogin.h /usr/src/debug/openssh/10.2p1/sandbox-seccomp-filter.c /usr/src/debug/openssh/10.2p1/sshsig.h /usr/src/debug/openssh/10.2p1/sshlogin.c /usr/src/debug/openssh/10.2p1/sshsig.c /usr/src/debug/openssh/10.2p1/cipher-aesctr.h /usr/src/debug/openssh/10.2p1/platform.h /usr/src/debug/openssh/10.2p1/platform.c /usr/src/debug/openssh/10.2p1/ssh-keyscan.c /usr/src/debug/openssh/10.2p1/ssh-keysign.c /usr/src/debug/openssh/10.2p1/sftp-server.c /usr/src/debug/openssh/10.2p1/canohost.h /usr/src/debug/openssh/10.2p1/canohost.c /usr/src/debug/openssh/10.2p1/utf8.h /usr/src/debug/openssh/10.2p1/sftp.h /usr/src/debug/openssh/10.2p1/sftp.c /usr/src/debug/openssh/10.2p1/ssh-sk-helper.c /usr/src/debug/openssh/10.2p1/utf8.c /usr/src/debug/openssh/10.2p1/monitor_wrap.h /usr/src/debug/openssh/10.2p1/crypto_api
 .h /usr/src/debug/openssh/10.2p1/hash.c /usr/src/debug/openssh/10.2p1/auth2-methods.c /usr/src/debug/openssh/10.2p1/monitor_wrap.c /usr/src/debug/openssh/10.2p1/session.h /usr/src/debug/openssh/10.2p1/authfile.c /usr/src/debug/openssh/10.2p1/session.c /usr/src/debug/openssh/10.2p1/authfile.h /usr/src/debug/openssh/10.2p1/addrmatch.c /usr/src/debug/openssh/10.2p1/authfd.h /usr/src/debug/openssh/10.2p1/serverloop.c /usr/src/debug/openssh/10.2p1/serverloop.h /usr/src/debug/openssh/10.2p1/authfd.c /usr/src/debug/openssh/10.2p1/auth2-pubkey.c /usr/src/debug/openssh/10.2p1/mac.c /usr/src/debug/openssh/10.2p1/mac.h /usr/src/debug/openssh/10.2p1/platform-misc.c /usr/src/debug/openssh/10.2p1/groupaccess.c /usr/src/debug/openssh/10.2p1/platform-listen.c /usr/src/debug/openssh/10.2p1/kex-names.c /usr/src/debug/openssh/10.2p1/kexc25519.c /usr/src/debug/openssh/10.2p1/ssh-ed25519.c /usr/src/debug/openssh/10.2p1/ssh.c /usr/src/debug/openssh/10.2p1/groupaccess.h /usr/src/debug/openssh/10.2p1/packe
 t.h /usr/src/debug/openssh/10.2p1/packet.c /usr/src/debug/openssh/10.2p1/sshconnect2.c /usr/src/debug/openssh/10.2p1/sftp-glob.c /usr/src/debug/openssh/10.2p1/auth-pam.h /usr/src/debug/openssh/10.2p1/sntrup761.c /usr/src/debug/openssh/10.2p1/readpass.c /usr/src/debug/openssh/10.2p1/auth2-hostbased.c /usr/src/debug/openssh/10.2p1/auth-pam.c /usr/src/debug/openssh/10.2p1/platform-pledge.c /usr/src/debug/openssh/10.2p1/ssh-pkcs11-helper.c /usr/src/debug/openssh/10.2p1/channels.c /usr/src/debug/openssh/10.2p1/ssh-sk-client.c /usr/src/debug/openssh/10.2p1/ssh-agent.c /usr/src/debug/openssh/10.2p1/ssh-ecdsa.c /usr/src/debug/openssh/10.2p1/kex.c /usr/src/debug/openssh/10.2p1/mux.c /usr/src/debug/openssh/10.2p1/ssh-rsa.c /usr/src/debug/openssh/10.2p1/sshd-session.c /usr/src/debug/openssh/10.2p1/ttymodes.c /usr/src/debug/openssh/10.2p1/channels.h /usr/src/debug/openssh/10.2p1/ttymodes.h /usr/src/debug/openssh/10.2p1/kex.h", added "/usr/src/debug/openssh/10.3p1/ssh-sandbox.h /usr/src/debug/op
 enssh/10.3p1/poly1305.c /usr/src/debug/openssh/10.3p1/digest-openssl.c /usr/src/debug/openssh/10.3p1/auth2.c /usr/src/debug/openssh/10.3p1/auth2-chall.c /usr/src/debug/openssh/10.3p1/poly1305.h /usr/src/debug/openssh/10.3p1/sshtty.c /usr/src/debug/openssh/10.3p1/sshpty.c /usr/src/debug/openssh/10.3p1/compat.c /usr/src/debug/openssh/10.3p1/auth-passwd.c /usr/src/debug/openssh/10.3p1/compat.h /usr/src/debug/openssh/10.3p1/sshpty.h /usr/src/debug/openssh/10.3p1/monitor_fdpass.h /usr/src/debug/openssh/10.3p1/srclimit.c /usr/src/debug/openssh/10.3p1/uidswap.h /usr/src/debug/openssh/10.3p1/monitor_fdpass.c /usr/src/debug/openssh/10.3p1/auth-shadow.c /usr/src/debug/openssh/10.3p1/misc-agent.c /usr/src/debug/openssh/10.3p1/auth2-pubkeyfile.c /usr/src/debug/openssh/10.3p1/uidswap.c /usr/src/debug/openssh/10.3p1/srclimit.h /usr/src/debug/openssh/10.3p1/dh.h /usr/src/debug/openssh/10.3p1/match.h /usr/src/debug/openssh/10.3p1/digest.h /usr/src/debug/openssh/10.3p1/ssh-sk.h /usr/src/debug/openss
 h/10.3p1/dh.c /usr/src/debug/openssh/10.3p1/clientloop.c /usr/src/debug/openssh/10.3p1/bitmap.c /usr/src/debug/openssh/10.3p1/match.c /usr/src/debug/openssh/10.3p1/auth2-kbdint.c /usr/src/debug/openssh/10.3p1/sshkey.h /usr/src/debug/openssh/10.3p1/bitmap.h /usr/src/debug/openssh/10.3p1/clientloop.h /usr/src/debug/openssh/10.3p1/sshbuf-getput-crypto.c /usr/src/debug/openssh/10.3p1/sshkey.c /usr/src/debug/openssh/10.3p1/sshbuf.c /usr/src/debug/openssh/10.3p1/kexgex.c /usr/src/debug/openssh/10.3p1/readconf.h /usr/src/debug/openssh/10.3p1/readconf.c /usr/src/debug/openssh/10.3p1/ssherr-libcrypto.c /usr/src/debug/openssh/10.3p1/sshbuf.h /usr/src/debug/openssh/10.3p1/log.h /usr/src/debug/openssh/10.3p1/auth.c /usr/src/debug/openssh/10.3p1/cipher.c /usr/src/debug/openssh/10.3p1/cleanup.c /usr/src/debug/openssh/10.3p1/fatal.c /usr/src/debug/openssh/10.3p1/kexsntrup761x25519.c /usr/src/debug/openssh/10.3p1/msg.h /usr/src/debug/openssh/10.3p1/platform-tracing.c /usr/src/debug/openssh/10.3p1/c
 ipher.h /usr/src/debug/openssh/10.3p1/auth.h /usr/src/debug/openssh/10.3p1/kexdh.c /usr/src/debug/openssh/10.3p1/libcrux_mlkem768_sha3.h /usr/src/debug/openssh/10.3p1/log.c /usr/src/debug/openssh/10.3p1/msg.c /usr/src/debug/openssh/10.3p1/sshd.c /usr/src/debug/openssh/10.3p1/xmalloc.h /usr/src/debug/openssh/10.3p1/monitor.c /usr/src/debug/openssh/10.3p1/sftp-common.h /usr/src/debug/openssh/10.3p1/pkcs11.h /usr/src/debug/openssh/10.3p1/kexecdh.c /usr/src/debug/openssh/10.3p1/sftp-common.c /usr/src/debug/openssh/10.3p1/monitor.h /usr/src/debug/openssh/10.3p1/xmalloc.c /usr/src/debug/openssh/10.3p1/sshbuf-getput-basic.c /usr/src/debug/openssh/10.3p1/servconf.h /usr/src/debug/openssh/10.3p1/kexgexc.c /usr/src/debug/openssh/10.3p1/servconf.c /usr/src/debug/openssh/10.3p1/kexgen.c /usr/src/debug/openssh/10.3p1/hostfile.h /usr/src/debug/openssh/10.3p1/cipher-chachapoly.h /usr/src/debug/openssh/10.3p1/hostfile.c /usr/src/debug/openssh/10.3p1/entropy.h /usr/src/debug/openssh/10.3p1/sftp-clie
 nt.c /usr/src/debug/openssh/10.3p1/entropy.c /usr/src/debug/openssh/10.3p1/smult_curve25519_ref.c /usr/src/debug/openssh/10.3p1/rijndael.h /usr/src/debug/openssh/10.3p1/sftp-client.h /usr/src/debug/openssh/10.3p1/moduli.c /usr/src/debug/openssh/10.3p1/kexgexs.c /usr/src/debug/openssh/10.3p1/sftp-server-main.c /usr/src/debug/openssh/10.3p1/sftp-realpath.c /usr/src/debug/openssh/10.3p1/krl.c /usr/src/debug/openssh/10.3p1/atomicio.h /usr/src/debug/openssh/10.3p1/ssh-pkcs11.h /usr/src/debug/openssh/10.3p1/sshconnect.h /usr/src/debug/openssh/10.3p1/atomicio.c /usr/src/debug/openssh/10.3p1/krl.h /usr/src/debug/openssh/10.3p1/ssh-keygen.c /usr/src/debug/openssh/10.3p1/ssh-pkcs11.c /usr/src/debug/openssh/10.3p1/sshconnect.c /usr/src/debug/openssh/10.3p1/auth-rhosts.c /usr/src/debug/openssh/10.3p1/sftp-usergroup.c /usr/src/debug/openssh/10.3p1/progressmeter.h /usr/src/debug/openssh/10.3p1/sftp-usergroup.h /usr/src/debug/openssh/10.3p1/ed25519-openssl.c /usr/src/debug/openssh/10.3p1/progressm
 eter.c /usr/src/debug/openssh/10.3p1/ssh-pkcs11-client.c /usr/src/debug/openssh/10.3p1/sshbuf-io.c /usr/src/debug/openssh/10.3p1/sshd-auth.c /usr/src/debug/openssh/10.3p1/hmac.h /usr/src/debug/openssh/10.3p1/umac.h /usr/src/debug/openssh/10.3p1/hmac.c /usr/src/debug/openssh/10.3p1/auth2-passwd.c /usr/src/debug/openssh/10.3p1/umac.c /usr/src/debug/openssh/10.3p1/kexmlkem768x25519.c /usr/src/debug/openssh/10.3p1/auth2-none.c /usr/src/debug/openssh/10.3p1/auth-options.h /usr/src/debug/openssh/10.3p1/ssherr.h /usr/src/debug/openssh/10.3p1/auth-options.c /usr/src/debug/openssh/10.3p1/cipher-chachapoly-libcrypto.c /usr/src/debug/openssh/10.3p1/misc.h /usr/src/debug/openssh/10.3p1/ssh-add.c /usr/src/debug/openssh/10.3p1/ssherr.c /usr/src/debug/openssh/10.3p1/nchan.c /usr/src/debug/openssh/10.3p1/loginrec.c /usr/src/debug/openssh/10.3p1/misc.c /usr/src/debug/openssh/10.3p1/loginrec.h /usr/src/debug/openssh/10.3p1/dispatch.c /usr/src/debug/openssh/10.3p1/dns.c /usr/src/debug/openssh/10.3p1/a
 ddr.h /usr/src/debug/openssh/10.3p1/ssh_api.h /usr/src/debug/openssh/10.3p1/dns.h /usr/src/debug/openssh/10.3p1/dispatch.h /usr/src/debug/openssh/10.3p1/sshbuf-misc.c /usr/src/debug/openssh/10.3p1/scp.c /usr/src/debug/openssh/10.3p1/ssh_api.c /usr/src/debug/openssh/10.3p1/addr.c /usr/src/debug/openssh/10.3p1/sshlogin.h /usr/src/debug/openssh/10.3p1/sandbox-seccomp-filter.c /usr/src/debug/openssh/10.3p1/sshsig.h /usr/src/debug/openssh/10.3p1/sshlogin.c /usr/src/debug/openssh/10.3p1/sshsig.c /usr/src/debug/openssh/10.3p1/cipher-aesctr.h /usr/src/debug/openssh/10.3p1/platform.h /usr/src/debug/openssh/10.3p1/platform.c /usr/src/debug/openssh/10.3p1/ssh-keyscan.c /usr/src/debug/openssh/10.3p1/ssh-keysign.c /usr/src/debug/openssh/10.3p1/sftp-server.c /usr/src/debug/openssh/10.3p1/canohost.h /usr/src/debug/openssh/10.3p1/canohost.c /usr/src/debug/openssh/10.3p1/utf8.h /usr/src/debug/openssh/10.3p1/sftp.h /usr/src/debug/openssh/10.3p1/sftp.c /usr/src/debug/openssh/10.3p1/ssh-sk-helper.c /us
 r/src/debug/openssh/10.3p1/utf8.c /usr/src/debug/openssh/10.3p1/monitor_wrap.h /usr/src/debug/openssh/10.3p1/crypto_api.h /usr/src/debug/openssh/10.3p1/auth2-methods.c /usr/src/debug/openssh/10.3p1/monitor_wrap.c /usr/src/debug/openssh/10.3p1/session.h /usr/src/debug/openssh/10.3p1/authfile.c /usr/src/debug/openssh/10.3p1/session.c /usr/src/debug/openssh/10.3p1/authfile.h /usr/src/debug/openssh/10.3p1/addrmatch.c /usr/src/debug/openssh/10.3p1/authfd.h /usr/src/debug/openssh/10.3p1/serverloop.c /usr/src/debug/openssh/10.3p1/serverloop.h /usr/src/debug/openssh/10.3p1/authfd.c /usr/src/debug/openssh/10.3p1/auth2-pubkey.c /usr/src/debug/openssh/10.3p1/mac.c /usr/src/debug/openssh/10.3p1/mac.h /usr/src/debug/openssh/10.3p1/platform-misc.c /usr/src/debug/openssh/10.3p1/groupaccess.c /usr/src/debug/openssh/10.3p1/platform-listen.c /usr/src/debug/openssh/10.3p1/kex-names.c /usr/src/debug/openssh/10.3p1/kexc25519.c /usr/src/debug/openssh/10.3p1/ssh-ed25519.c /usr/src/debug/openssh/10.3p1/ssh
 .c /usr/src/debug/openssh/10.3p1/ssherr-nolibcrypto.c /usr/src/debug/openssh/10.3p1/groupaccess.h /usr/src/debug/openssh/10.3p1/packet.h /usr/src/debug/openssh/10.3p1/packet.c /usr/src/debug/openssh/10.3p1/sshconnect2.c /usr/src/debug/openssh/10.3p1/sftp-glob.c /usr/src/debug/openssh/10.3p1/auth-pam.h /usr/src/debug/openssh/10.3p1/sntrup761.c /usr/src/debug/openssh/10.3p1/readpass.c /usr/src/debug/openssh/10.3p1/auth2-hostbased.c /usr/src/debug/openssh/10.3p1/auth-pam.c /usr/src/debug/openssh/10.3p1/platform-pledge.c /usr/src/debug/openssh/10.3p1/ssh-pkcs11-helper.c /usr/src/debug/openssh/10.3p1/channels.c /usr/src/debug/openssh/10.3p1/ssh-sk-client.c /usr/src/debug/openssh/10.3p1/ssh-agent.c /usr/src/debug/openssh/10.3p1/ssh-ecdsa.c /usr/src/debug/openssh/10.3p1/kex.c /usr/src/debug/openssh/10.3p1/mux.c /usr/src/debug/openssh/10.3p1/ssh-rsa.c /usr/src/debug/openssh/10.3p1/sshd-session.c /usr/src/debug/openssh/10.3p1/ttymodes.c /usr/src/debug/openssh/10.3p1/channels.h /usr/src/debug
 /openssh/10.3p1/ttymodes.h /usr/src/debug/openssh/10.3p1/kex.h"
packages/x86-64-v3-poky-linux/openssh/openssh-src: PKGV changed from 10.2p1 [default] to 10.3p1 [default]
packages/x86-64-v3-poky-linux/openssh/openssh-src: PKGSIZE changed from 4357476 to 4160479 (-5%)
packages/x86-64-v3-poky-linux/openssh/openssh-src: PV changed from "10.2p1" to "10.3p1"
packages/x86-64-v3-poky-linux/openssh/openssh-ssh: PKGV changed from 10.2p1 [default] to 10.3p1 [default]
packages/x86-64-v3-poky-linux/openssh/openssh-ssh: PKGSIZE changed from 987353 to 897241 (-9%)
packages/x86-64-v3-poky-linux/openssh/openssh-ssh: PV changed from "10.2p1" to "10.3p1"
packages/x86-64-v3-poky-linux/openssh/openssh-sshd: PKGV changed from 10.2p1 [default] to 10.3p1 [default]
packages/x86-64-v3-poky-linux/openssh/openssh-sshd: PKGSIZE changed from 3258345 to 3086890 (-5%)
packages/x86-64-v3-poky-linux/openssh/openssh-sshd: PV changed from "10.2p1" to "10.3p1"
packages/x86-64-v3-poky-linux/openssh/openssh-staticdev: PKGV changed from 10.2p1 [default] to 10.3p1 [default]
packages/x86-64-v3-poky-linux/openssh/openssh-staticdev: PV changed from "10.2p1" to "10.3p1"
packages/x86-64-v3-poky-linux/openssh/openssh: PKGV changed from 10.2p1 [default] to 10.3p1 [default]
packages/x86-64-v3-poky-linux/openssh/openssh: PV changed from "10.2p1" to "10.3p1"

--===============1052265376803707122==--

