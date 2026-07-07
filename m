Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BC1CC44503
	for <webhook@archiver.kernel.org>; Tue,  7 Jul 2026 05:50:05 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.167394.1783403394337120045
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 22:49:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=QNaJzSjk;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Ygyqg1YA;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019f3b203107-358ad985-2145-48b4-b69e-fc24d7414734-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1783403393;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=23ybDlMujFhY5aD1+o4avCf6iGdBJqoDNJXxxGESzcs=;
	b=QNaJzSjkhK67ETrCboIcWGAIQJI9iwBxfMla5zUkL1R2PDphqNDZdP4ssm8l99Md
	HId3Drtan1OErOn728pp3SuGkOETKewC4GvhyrTiGngp6xGFyEFT5/RlLdjKOi8AHn0
	eyOqYpWWE6cCATNYSJ/YcNGa6RJCMixpxGENr8d4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1783403393;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=23ybDlMujFhY5aD1+o4avCf6iGdBJqoDNJXxxGESzcs=;
	b=Ygyqg1YA0jvDR+Ihthtp9t5s8kAVXMUCsmUTvLvAfUrbpMnvJ4uCK/Nldli8zrte
	2iYj+b4Yf2L60dFf0sExD4Aa3pgAnvBv8SNz8vE+vAcjR4nPcudlus2KPq67ZeRthGD
	GgQCJMDB66+9hnE1cc4atx4NJm4M5q+BPpD2fWAc=
Content-Type: multipart/mixed; boundary="===============1402967003654465777=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] openssh: upgrading to 10.4p1 SUCCEEDED
Message-ID: <0101019f3b203107-358ad985-2145-48b4-b69e-fc24d7414734-000000@us-west-2.amazonses.com>
Date: Tue, 7 Jul 2026 05:49:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.07-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jul 2026 05:50:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240352

--===============1402967003654465777==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *openssh* to *10.4p1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-openssh-upgrade-10.3p1-10.4p1.patch
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
From 12343e45729a6b60f7c7345ac410ec6682d19f76 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 7 Jul 2026 05:23:05 +0000
Subject: [PATCH] openssh: upgrade 10.3p1 -> 10.4p1

---
 ...1-regress-banner.sh-log-input-and-output-files-on-erro.patch | 2 +-
 .../openssh/{openssh_10.3p1.bb => openssh_10.4p1.bb}            | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/openssh/{openssh_10.3p1.bb => openssh_10.4p1.bb} (99%)

diff --git a/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-input-and-output-files-on-erro.patch b/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-input-and-output-files-on-erro.patch
index f424288e37..3128aaefc7 100644
--- a/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-input-and-output-files-on-erro.patch
+++ b/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-input-and-output-files-on-erro.patch
@@ -1,4 +1,4 @@
-From 5cc897fe2effe549e1e280c2f606bce8b532b61e Mon Sep 17 00:00:00 2001
+From e27e91936310d2c865134a6f5a6bd99549233b4e Mon Sep 17 00:00:00 2001
 From: Mikko Rapeli <mikko.rapeli@linaro.org>
 Date: Mon, 11 Sep 2023 09:55:21 +0100
 Subject: [PATCH] regress/banner.sh: log input and output files on error
diff --git a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb b/meta/recipes-connectivity/openssh/openssh_10.4p1.bb
similarity index 99%
rename from meta/recipes-connectivity/openssh/openssh_10.3p1.bb
rename to meta/recipes-connectivity/openssh/openssh_10.4p1.bb
index a050475532..7d316eec76 100644
--- a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_10.4p1.bb
@@ -25,7 +25,7 @@ SRC_URI = "https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.ta
            file://sshd_check_keys \
            file://0001-regress-banner.sh-log-input-and-output-files-on-erro.patch \
            "
-SRC_URI[sha256sum] = "56682a36bb92dcf4b4f016fd8ec8e74059b79a8de25c15d670d731e7d18e45f4"
+SRC_URI[sha256sum] = "ef6026dd2aea8d56059638d5d3262902c892ceba9f88395835e0d06d3fb63238"
 
 CVE_STATUS[CVE-2007-2768] = "not-applicable-config: This CVE is specific to OpenSSH with the pam opie which we don't build/use here."
 
-- 
2.47.1


--===============1402967003654465777==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-openssh-upgrade-10.3p1-10.4p1.patch"

RnJvbSAxMjM0M2U0NTcyOWE2YjYwZjdjNzM0NWFjNDEwZWM2NjgyZDE5Zjc2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgNyBKdWwgMjAyNiAwNToyMzowNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG9w
ZW5zc2g6IHVwZ3JhZGUgMTAuM3AxIC0+IDEwLjRwMQoKLS0tCiAuLi4xLXJlZ3Jlc3MtYmFubmVy
LnNoLWxvZy1pbnB1dC1hbmQtb3V0cHV0LWZpbGVzLW9uLWVycm8ucGF0Y2ggfCAyICstCiAuLi4v
b3BlbnNzaC97b3BlbnNzaF8xMC4zcDEuYmIgPT4gb3BlbnNzaF8xMC40cDEuYmJ9ICAgICAgICAg
ICAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2gve29wZW5zc2hfMTAu
M3AxLmJiID0+IG9wZW5zc2hfMTAuNHAxLmJifSAoOTklKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzaC9vcGVuc3NoLzAwMDEtcmVncmVzcy1iYW5uZXIuc2gt
bG9nLWlucHV0LWFuZC1vdXRwdXQtZmlsZXMtb24tZXJyby5wYXRjaCBiL21ldGEvcmVjaXBlcy1j
b25uZWN0aXZpdHkvb3BlbnNzaC9vcGVuc3NoLzAwMDEtcmVncmVzcy1iYW5uZXIuc2gtbG9nLWlu
cHV0LWFuZC1vdXRwdXQtZmlsZXMtb24tZXJyby5wYXRjaAppbmRleCBmNDI0Mjg4ZTM3Li4zMTI4
YWFlZmM3IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2gvb3Bl
bnNzaC8wMDAxLXJlZ3Jlc3MtYmFubmVyLnNoLWxvZy1pbnB1dC1hbmQtb3V0cHV0LWZpbGVzLW9u
LWVycm8ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NoL29wZW5z
c2gvMDAwMS1yZWdyZXNzLWJhbm5lci5zaC1sb2ctaW5wdXQtYW5kLW91dHB1dC1maWxlcy1vbi1l
cnJvLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA1Y2M4OTdmZTJlZmZlNTQ5ZTFlMjgwYzJm
NjA2YmNlOGI1MzJiNjFlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBlMjdlOTE5MzYz
MTBkMmM4NjUxMzRhNmY1YTZiZDk5NTQ5MjMzYjRlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQog
RnJvbTogTWlra28gUmFwZWxpIDxtaWtrby5yYXBlbGlAbGluYXJvLm9yZz4KIERhdGU6IE1vbiwg
MTEgU2VwIDIwMjMgMDk6NTU6MjEgKzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0gcmVncmVzcy9iYW5u
ZXIuc2g6IGxvZyBpbnB1dCBhbmQgb3V0cHV0IGZpbGVzIG9uIGVycm9yCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2gvb3BlbnNzaF8xMC4zcDEuYmIgYi9tZXRh
L3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2gvb3BlbnNzaF8xMC40cDEuYmIKc2ltaWxhcml0
eSBpbmRleCA5OSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3No
L29wZW5zc2hfMTAuM3AxLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29w
ZW5zc2gvb3BlbnNzaF8xMC40cDEuYmIKaW5kZXggYTA1MDQ3NTUzMi4uN2QzMTZlZWM3NiAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NoL29wZW5zc2hfMTAuM3Ax
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzaC9vcGVuc3NoXzEwLjRw
MS5iYgpAQCAtMjUsNyArMjUsNyBAQCBTUkNfVVJJID0gImh0dHBzOi8vZnRwLm9wZW5ic2Qub3Jn
L3B1Yi9PcGVuQlNEL09wZW5TU0gvcG9ydGFibGUvb3BlbnNzaC0ke1BWfS50YQogICAgICAgICAg
ICBmaWxlOi8vc3NoZF9jaGVja19rZXlzIFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtcmVncmVz
cy1iYW5uZXIuc2gtbG9nLWlucHV0LWFuZC1vdXRwdXQtZmlsZXMtb24tZXJyby5wYXRjaCBcCiAg
ICAgICAgICAgICIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI1NjY4MmEzNmJiOTJkY2Y0YjRmMDE2
ZmQ4ZWM4ZTc0MDU5Yjc5YThkZTI1YzE1ZDY3MGQ3MzFlN2QxOGU0NWY0IgorU1JDX1VSSVtzaGEy
NTZzdW1dID0gImVmNjAyNmRkMmFlYThkNTYwNTk2MzhkNWQzMjYyOTAyYzg5MmNlYmE5Zjg4Mzk1
ODM1ZTBkMDZkM2ZiNjMyMzgiCiAKIENWRV9TVEFUVVNbQ1ZFLTIwMDctMjc2OF0gPSAibm90LWFw
cGxpY2FibGUtY29uZmlnOiBUaGlzIENWRSBpcyBzcGVjaWZpYyB0byBPcGVuU1NIIHdpdGggdGhl
IHBhbSBvcGllIHdoaWNoIHdlIGRvbid0IGJ1aWxkL3VzZSBoZXJlLiIKIAotLSAKMi40Ny4xCgo=

--===============1402967003654465777==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/openssh: PKGV changed from 10.3p1 [default] to 10.4p1 [default]
packages/x86-64-v3-poky-linux/openssh: PV changed from "10.3p1" to "10.4p1"
packages/x86-64-v3-poky-linux/openssh: SRC_URI changed from "https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-10.3p1.tar.gz file://sshd_config file://ssh_config file://init file://sshd file://sshd.service file://sshd.socket file://sshd@.service file://sshdgenkeys.service file://volatiles.99_sshd file://run-ptest file://sshd_check_keys file://0001-regress-banner.sh-log-input-and-output-files-on-erro.patch" to "https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-10.4p1.tar.gz file://sshd_config file://ssh_config file://init file://sshd file://sshd.service file://sshd.socket file://sshd@.service file://sshdgenkeys.service file://volatiles.99_sshd file://run-ptest file://sshd_check_keys file://0001-regress-banner.sh-log-input-and-output-files-on-erro.patch"
packages/x86-64-v3-poky-linux/openssh/openssh-dbg: PKGV changed from 10.3p1 [default] to 10.4p1 [default]
packages/x86-64-v3-poky-linux/openssh/openssh-dbg: PV changed from "10.3p1" to "10.4p1"
packages/x86-64-v3-poky-linux/openssh/openssh-dbg: PKGSIZE changed from 27513296 to 41197392 (+50%)
packages/x86-64-v3-poky-linux/openssh/openssh-dbg: FILELIST: added "/usr/lib/openssh/ptest/regress/unittests/crypto/.debug/test_crypto /usr/lib/openssh/ptest/regress/unittests/servconf/.debug/test_servconf"
packages/x86-64-v3-poky-linux/openssh/openssh-dev: PKGV changed from 10.3p1 [default] to 10.4p1 [default]
packages/x86-64-v3-poky-linux/openssh/openssh-dev: PV changed from "10.3p1" to "10.4p1"
packages/x86-64-v3-poky-linux/openssh/openssh-doc: PKGV changed from 10.3p1 [default] to 10.4p1 [default]
packages/x86-64-v3-poky-linux/openssh/openssh-doc: PV changed from "10.3p1" to "10.4p1"
packages/x86-64-v3-poky-linux/openssh/openssh-doc: PKGSIZE changed from 358277 to 360446 (+1%)
packages/x86-64-v3-poky-linux/openssh/openssh-keygen: PKGV changed from 10.3p1 [default] to 10.4p1 [default]
packages/x86-64-v3-poky-linux/openssh/openssh-keygen: PV changed from "10.3p1" to "10.4p1"
packages/x86-64-v3-poky-linux/openssh/openssh-keygen: PKGSIZE changed from 440512 to 592064 (+34%)
packages/x86-64-v3-poky-linux/openssh/openssh-locale: PKGV changed from 10.3p1 [default] to 10.4p1 [default]
packages/x86-64-v3-poky-linux/openssh/openssh-locale: PV changed from "10.3p1" to "10.4p1"
packages/x86-64-v3-poky-linux/openssh/openssh-misc: PKGV changed from 10.3p1 [default] to 10.4p1 [default]
packages/x86-64-v3-poky-linux/openssh/openssh-misc: PV changed from "10.3p1" to "10.4p1"
packages/x86-64-v3-poky-linux/openssh/openssh-misc: PKGSIZE changed from 1793237 to 2485461 (+39%)
packages/x86-64-v3-poky-linux/openssh/openssh-ptest: PKGV changed from 10.3p1 [default] to 10.4p1 [default]
packages/x86-64-v3-poky-linux/openssh/openssh-ptest: PV changed from "10.3p1" to "10.4p1"
packages/x86-64-v3-poky-linux/openssh/openssh-ptest: PKGSIZE changed from 6053215 to 8475073 (+40%)
packages/x86-64-v3-poky-linux/openssh/openssh-ptest: FILELIST: added "/usr/lib/openssh/ptest/regress/unittests/crypto/test_crypto /usr/lib/openssh/ptest/regress/unittests/sshkey/testdata/mldsa44_ed25519_1 /usr/lib/openssh/ptest/regress/unittests/crypto/test_ed25519.o /usr/lib/openssh/ptest/regress/unittests/crypto/testdata/draft-ietf-lamps-pq-composite-sigs.json /usr/lib/openssh/ptest/regress/unittests/sshkey/testdata/mldsa44_ed25519_2 /usr/lib/openssh/ptest/regress/unittests/sshsig/testdata/mldsa44-ed25519 /usr/lib/openssh/ptest/regress/unittests/sshkey/testdata/mldsa44_ed25519_1.pub /usr/lib/openssh/ptest/regress/unittests/sshkey/testdata/mldsa44_ed25519_1.fp.bb /usr/lib/openssh/ptest/regress/unittests/crypto/test_ed25519.c /usr/lib/openssh/ptest/regress/unittests/servconf/test_servconf /usr/lib/openssh/ptest/regress/unittests/crypto/tests.c /usr/lib/openssh/ptest/regress/unittests/sshkey/testdata/mldsa44_ed25519_2.pub /usr/lib/openssh/ptest/regress/unittests/crypto/test_mldsa_edds
 a.o /usr/lib/openssh/ptest/regress/unittests/crypto/test_mldsa_eddsa.c /usr/lib/openssh/ptest/regress/unittests/crypto/tests.o /usr/lib/openssh/ptest/regress/unittests/sshkey/testdata/mldsa44_ed25519_1-cert.pub /usr/lib/openssh/ptest/regress/unittests/sshkey/testdata/mldsa44_ed25519_1_pw /usr/lib/openssh/ptest/regress/unittests/crypto/test_mlkem.c /usr/lib/openssh/ptest/regress/unittests/sshkey/testdata/mldsa44_ed25519_2.fp.bb /usr/lib/openssh/ptest/regress/unittests/crypto/test_mlkem.o /usr/lib/openssh/ptest/regress/unittests/servconf/tests.c /usr/lib/openssh/ptest/regress/unittests/sshkey/testdata/mldsa44_ed25519_1-cert.fp /usr/lib/openssh/ptest/regress/unittests/sshsig/testdata/mldsa44-ed25519.pub /usr/lib/openssh/ptest/regress/unittests/sshsig/testdata/mldsa44-ed25519.sig /usr/lib/openssh/ptest/regress/unittests/servconf/tests.o /usr/lib/openssh/ptest/regress/unittests/crypto/test_mldsa.o /usr/lib/openssh/ptest/regress/unittests/crypto/test_mldsa.c /usr/lib/openssh/ptest/regress
 /unittests/sshkey/testdata/mldsa44_ed25519_1.fp /usr/lib/openssh/ptest/regress/unittests/sshkey/testdata/mldsa44_ed25519_2.fp /usr/lib/openssh/ptest/regress/unittests/servconf/Makefile /usr/lib/openssh/ptest/regress/unittests/crypto/Makefile /usr/lib/openssh/ptest/regress/unittests/crypto/testdata/nistkats-44.json"
packages/x86-64-v3-poky-linux/openssh/openssh-scp: PKGV changed from 10.3p1 [default] to 10.4p1 [default]
packages/x86-64-v3-poky-linux/openssh/openssh-scp: PV changed from "10.3p1" to "10.4p1"
packages/x86-64-v3-poky-linux/openssh/openssh-sftp-server: PKGV changed from 10.3p1 [default] to 10.4p1 [default]
packages/x86-64-v3-poky-linux/openssh/openssh-sftp-server: PV changed from "10.3p1" to "10.4p1"
packages/x86-64-v3-poky-linux/openssh/openssh-sftp: PKGV changed from 10.3p1 [default] to 10.4p1 [default]
packages/x86-64-v3-poky-linux/openssh/openssh-sftp: PV changed from "10.3p1" to "10.4p1"
packages/x86-64-v3-poky-linux/openssh/openssh-src: PKGV changed from 10.3p1 [default] to 10.4p1 [default]
packages/x86-64-v3-poky-linux/openssh/openssh-src: PV changed from "10.3p1" to "10.4p1"
packages/x86-64-v3-poky-linux/openssh/openssh-src: PKGSIZE changed from 4160479 to 4692018 (+13%)
packages/x86-64-v3-poky-linux/openssh/openssh-src: FILELIST: directory renamed /usr/src/debug/openssh/10.3p1/regress/unittests/sshbuf -> /usr/src/debug/openssh/10.4p1/regress/unittests/sshbuf, directory renamed /usr/src/debug/openssh/10.3p1/regress/unittests/conversion -> /usr/src/debug/openssh/10.4p1/regress/unittests/conversion, directory renamed /usr/src/debug/openssh/10.3p1/regress/unittests/hostkeys -> /usr/src/debug/openssh/10.4p1/regress/unittests/hostkeys, directory renamed /usr/src/debug/openssh/10.3p1/regress/unittests/match -> /usr/src/debug/openssh/10.4p1/regress/unittests/match, directory renamed /usr/src/debug/openssh/10.3p1/regress -> /usr/src/debug/openssh/10.4p1/regress, directory renamed /usr/src/debug/openssh/10.3p1/regress/unittests/sshsig -> /usr/src/debug/openssh/10.4p1/regress/unittests/sshsig, directory renamed /usr/src/debug/openssh/10.3p1/regress/unittests/sshkey -> /usr/src/debug/openssh/10.4p1/regress/unittests/sshkey, directory renamed /usr/src/debug/open
 ssh/10.3p1/regress/unittests/misc -> /usr/src/debug/openssh/10.4p1/regress/unittests/misc, directory renamed /usr/src/debug/openssh/10.3p1/regress/unittests/authopt -> /usr/src/debug/openssh/10.4p1/regress/unittests/authopt, directory renamed /usr/src/debug/openssh/10.3p1/regress/unittests/kex -> /usr/src/debug/openssh/10.4p1/regress/unittests/kex, directory renamed /usr/src/debug/openssh/10.3p1/regress/unittests/test_helper -> /usr/src/debug/openssh/10.4p1/regress/unittests/test_helper, directory renamed /usr/src/debug/openssh/10.3p1/regress/unittests/utf8 -> /usr/src/debug/openssh/10.4p1/regress/unittests/servconf, directory renamed /usr/src/debug/openssh/10.3p1/regress/unittests/bitmap -> /usr/src/debug/openssh/10.4p1/regress/unittests/bitmap, removed "/usr/src/debug/openssh/10.3p1/rijndael.h /usr/src/debug/openssh/10.3p1/ssh-ecdsa.c /usr/src/debug/openssh/10.3p1/ssh-agent.c /usr/src/debug/openssh/10.3p1/auth.c /usr/src/debug/openssh/10.3p1/kexecdh.c /usr/src/debug/openssh/10.3p1
 /openbsd-compat/strmode.c /usr/src/debug/openssh/10.3p1/auth.h /usr/src/debug/openssh/10.3p1/serverloop.c /usr/src/debug/openssh/10.3p1/sshkey.c /usr/src/debug/openssh/10.3p1/sftp-common.c /usr/src/debug/openssh/10.3p1/cipher-chachapoly.h /usr/src/debug/openssh/10.3p1/serverloop.h /usr/src/debug/openssh/10.3p1/sftp-glob.c /usr/src/debug/openssh/10.3p1/openbsd-compat/getopt_long.c /usr/src/debug/openssh/10.3p1/sftp-common.h /usr/src/debug/openssh/10.3p1/sntrup761.c /usr/src/debug/openssh/10.3p1/sshkey.h /usr/src/debug/openssh/10.3p1/auth-pam.h /usr/src/debug/openssh/10.3p1/openbsd-compat/bsd-getpeereid.c /usr/src/debug/openssh/10.3p1/addrmatch.c /usr/src/debug/openssh/10.3p1/auth-pam.c /usr/src/debug/openssh/10.3p1/kexdh.c /usr/src/debug/openssh/10.3p1/ssh-pkcs11.h /usr/src/debug/openssh/10.3p1/sshconnect.h /usr/src/debug/openssh/10.3p1/ssh-sk-helper.c /usr/src/debug/openssh/10.3p1/ssh-keygen.c /usr/src/debug/openssh/10.3p1/ssh-pkcs11.c /usr/src/debug/openssh/10.3p1/sshconnect.c /usr
 /src/debug/openssh/10.3p1/progressmeter.h /usr/src/debug/openssh/10.3p1/kex.c /usr/src/debug/openssh/10.3p1/mux.c /usr/src/debug/openssh/10.3p1/openbsd-compat/port-linux.h /usr/src/debug/openssh/10.3p1/monitor_fdpass.c /usr/src/debug/openssh/10.3p1/sftp-usergroup.h /usr/src/debug/openssh/10.3p1/sshbuf-getput-crypto.c /usr/src/debug/openssh/10.3p1/kex.h /usr/src/debug/openssh/10.3p1/openbsd-compat/blowfish.c /usr/src/debug/openssh/10.3p1/progressmeter.c /usr/src/debug/openssh/10.3p1/monitor_fdpass.h /usr/src/debug/openssh/10.3p1/openbsd-compat/port-linux.c /usr/src/debug/openssh/10.3p1/platform-listen.c /usr/src/debug/openssh/10.3p1/authfd.h /usr/src/debug/openssh/10.3p1/match.h /usr/src/debug/openssh/10.3p1/sftp-usergroup.c /usr/src/debug/openssh/10.3p1/sandbox-seccomp-filter.c /usr/src/debug/openssh/10.3p1/ssh-rsa.c /usr/src/debug/openssh/10.3p1/openbsd-compat/strtonum.c /usr/src/debug/openssh/10.3p1/authfd.c /usr/src/debug/openssh/10.3p1/match.c /usr/src/debug/openssh/10.3p1/openb
 sd-compat/xcrypt.c /usr/src/debug/openssh/10.3p1/auth2-methods.c /usr/src/debug/openssh/10.3p1/dispatch.c /usr/src/debug/openssh/10.3p1/platform.c /usr/src/debug/openssh/10.3p1/servconf.h /usr/src/debug/openssh/10.3p1/platform.h /usr/src/debug/openssh/10.3p1/scp.c /usr/src/debug/openssh/10.3p1/dispatch.h /usr/src/debug/openssh/10.3p1/servconf.c /usr/src/debug/openssh/10.3p1/nchan.c /usr/src/debug/openssh/10.3p1/openbsd-compat/openbsd-compat.h /usr/src/debug/openssh/10.3p1/kexc25519.c /usr/src/debug/openssh/10.3p1/kex-names.c /usr/src/debug/openssh/10.3p1/addr.h /usr/src/debug/openssh/10.3p1/ssh-ed25519.c /usr/src/debug/openssh/10.3p1/loginrec.h /usr/src/debug/openssh/10.3p1/sftp-realpath.c /usr/src/debug/openssh/10.3p1/ssh-pkcs11-client.c /usr/src/debug/openssh/10.3p1/sshlogin.c /usr/src/debug/openssh/10.3p1/addr.c /usr/src/debug/openssh/10.3p1/sshlogin.h /usr/src/debug/openssh/10.3p1/loginrec.c /usr/src/debug/openssh/10.3p1/readconf.h /usr/src/debug/openssh/10.3p1/digest.h /usr/src
 /debug/openssh/10.3p1/openbsd-compat/bcrypt_pbkdf.c /usr/src/debug/openssh/10.3p1/openbsd-compat/recallocarray.c /usr/src/debug/openssh/10.3p1/readconf.c /usr/src/debug/openssh/10.3p1/entropy.h /usr/src/debug/openssh/10.3p1/libcrux_mlkem768_sha3.h /usr/src/debug/openssh/10.3p1/entropy.c /usr/src/debug/openssh/10.3p1/auth-shadow.c /usr/src/debug/openssh/10.3p1/cipher-chachapoly-libcrypto.c /usr/src/debug/openssh/10.3p1/digest-openssl.c /usr/src/debug/openssh/10.3p1/openbsd-compat/freezero.c /usr/src/debug/openssh/10.3p1/openbsd-compat/getopt.h /usr/src/debug/openssh/10.3p1/fatal.c /usr/src/debug/openssh/10.3p1/sftp-server-main.c /usr/src/debug/openssh/10.3p1/ssh-sk.h /usr/src/debug/openssh/10.3p1/ssh_api.h /usr/src/debug/openssh/10.3p1/readpass.c /usr/src/debug/openssh/10.3p1/openbsd-compat/getrrsetbyname.h /usr/src/debug/openssh/10.3p1/ssh_api.c /usr/src/debug/openssh/10.3p1/sshbuf.c /usr/src/debug/openssh/10.3p1/openbsd-compat/getrrsetbyname.c /usr/src/debug/openssh/10.3p1/sshbuf.h
  /usr/src/debug/openssh/10.3p1/channels.h /usr/src/debug/openssh/10.3p1/sshsig.h /usr/src/debug/openssh/10.3p1/auth2-pubkeyfile.c /usr/src/debug/openssh/10.3p1/channels.c /usr/src/debug/openssh/10.3p1/sshsig.c /usr/src/debug/openssh/10.3p1/srclimit.h /usr/src/debug/openssh/10.3p1/log.c /usr/src/debug/openssh/10.3p1/msg.c /usr/src/debug/openssh/10.3p1/xmalloc.c /usr/src/debug/openssh/10.3p1/hmac.c /usr/src/debug/openssh/10.3p1/umac.c /usr/src/debug/openssh/10.3p1/log.h /usr/src/debug/openssh/10.3p1/msg.h /usr/src/debug/openssh/10.3p1/srclimit.c /usr/src/debug/openssh/10.3p1/xmalloc.h /usr/src/debug/openssh/10.3p1/hmac.h /usr/src/debug/openssh/10.3p1/auth-rhosts.c /usr/src/debug/openssh/10.3p1/umac.h /usr/src/debug/openssh/10.3p1/cipher-aesctr.h /usr/src/debug/openssh/10.3p1/packet.c /usr/src/debug/openssh/10.3p1/cipher.h /usr/src/debug/openssh/10.3p1/packet.h /usr/src/debug/openssh/10.3p1/cipher.c /usr/src/debug/openssh/10.3p1/misc-agent.c /usr/src/debug/openssh/10.3p1/ssherr-nolibcr
 ypto.c /usr/src/debug/openssh/10.3p1/kexgen.c /usr/src/debug/openssh/10.3p1/session.h /usr/src/debug/openssh/10.3p1/smult_curve25519_ref.c /usr/src/debug/openssh/10.3p1/session.c /usr/src/debug/openssh/10.3p1/ssh-sk-client.c /usr/src/debug/openssh/10.3p1/openbsd-compat/charclass.h /usr/src/debug/openssh/10.3p1/ttymodes.c /usr/src/debug/openssh/10.3p1/utf8.c /usr/src/debug/openssh/10.3p1/auth-options.h /usr/src/debug/openssh/10.3p1/monitor.h /usr/src/debug/openssh/10.3p1/sshbuf-io.c /usr/src/debug/openssh/10.3p1/sshd-auth.c /usr/src/debug/openssh/10.3p1/ttymodes.h /usr/src/debug/openssh/10.3p1/utf8.h /usr/src/debug/openssh/10.3p1/openbsd-compat/fmt_scaled.c /usr/src/debug/openssh/10.3p1/auth-options.c /usr/src/debug/openssh/10.3p1/monitor.c /usr/src/debug/openssh/10.3p1/sshpty.c /usr/src/debug/openssh/10.3p1/sshtty.c /usr/src/debug/openssh/10.3p1/kexgexc.c /usr/src/debug/openssh/10.3p1/mac.c /usr/src/debug/openssh/10.3p1/sshpty.h /usr/src/debug/openssh/10.3p1/mac.h /usr/src/debug/ope
 nssh/10.3p1/kexgexs.c /usr/src/debug/openssh/10.3p1/auth2.c /usr/src/debug/openssh/10.3p1/ssh-add.c /usr/src/debug/openssh/10.3p1/ssh.c /usr/src/debug/openssh/10.3p1/ssh-sandbox.h /usr/src/debug/openssh/10.3p1/pkcs11.h /usr/src/debug/openssh/10.3p1/auth-passwd.c /usr/src/debug/openssh/10.3p1/bitmap.c /usr/src/debug/openssh/10.3p1/openbsd-compat/setproctitle.c /usr/src/debug/openssh/10.3p1/dh.c /usr/src/debug/openssh/10.3p1/sftp-server.c /usr/src/debug/openssh/10.3p1/ssh-keyscan.c /usr/src/debug/openssh/10.3p1/ssh-keysign.c /usr/src/debug/openssh/10.3p1/sshbuf-misc.c /usr/src/debug/openssh/10.3p1/bitmap.h /usr/src/debug/openssh/10.3p1/dh.h /usr/src/debug/openssh/10.3p1/sftp.h /usr/src/debug/openssh/10.3p1/hostfile.h /usr/src/debug/openssh/10.3p1/platform-tracing.c /usr/src/debug/openssh/10.3p1/hostfile.c /usr/src/debug/openssh/10.3p1/sftp.c /usr/src/debug/openssh/10.3p1/openbsd-compat/bsd-closefrom.c /usr/src/debug/openssh/10.3p1/openbsd-compat/port-net.c /usr/src/debug/openssh/10.3p
 1/misc.h /usr/src/debug/openssh/10.3p1/sftp-client.h /usr/src/debug/openssh/10.3p1/misc.c /usr/src/debug/openssh/10.3p1/sftp-client.c /usr/src/debug/openssh/10.3p1/openbsd-compat/port-net.h /usr/src/debug/openssh/10.3p1/ssherr.h /usr/src/debug/openssh/10.3p1/authfile.h /usr/src/debug/openssh/10.3p1/openbsd-compat/openssl-compat.h /usr/src/debug/openssh/10.3p1/canohost.c /usr/src/debug/openssh/10.3p1/atomicio.c /usr/src/debug/openssh/10.3p1/openbsd-compat/pwcache.c /usr/src/debug/openssh/10.3p1/authfile.c /usr/src/debug/openssh/10.3p1/openbsd-compat/openssl-compat.c /usr/src/debug/openssh/10.3p1/cleanup.c /usr/src/debug/openssh/10.3p1/poly1305.h /usr/src/debug/openssh/10.3p1/auth2-none.c /usr/src/debug/openssh/10.3p1/atomicio.h /usr/src/debug/openssh/10.3p1/ed25519-openssl.c /usr/src/debug/openssh/10.3p1/canohost.h /usr/src/debug/openssh/10.3p1/poly1305.c /usr/src/debug/openssh/10.3p1/openbsd-compat/glob.c /usr/src/debug/openssh/10.3p1/ssh-pkcs11-helper.c /usr/src/debug/openssh/10.3p
 1/uidswap.c /usr/src/debug/openssh/10.3p1/openbsd-compat/glob.h /usr/src/debug/openssh/10.3p1/kexgex.c /usr/src/debug/openssh/10.3p1/uidswap.h /usr/src/debug/openssh/10.3p1/kexmlkem768x25519.c /usr/src/debug/openssh/10.3p1/kexsntrup761x25519.c /usr/src/debug/openssh/10.3p1/auth2-passwd.c /usr/src/debug/openssh/10.3p1/openbsd-compat/libressl-api-compat.c /usr/src/debug/openssh/10.3p1/ssherr-libcrypto.c /usr/src/debug/openssh/10.3p1/sshbuf-getput-basic.c /usr/src/debug/openssh/10.3p1/auth2-hostbased.c /usr/src/debug/openssh/10.3p1/openbsd-compat/base64.c /usr/src/debug/openssh/10.3p1/moduli.c /usr/src/debug/openssh/10.3p1/clientloop.c /usr/src/debug/openssh/10.3p1/krl.h /usr/src/debug/openssh/10.3p1/sshd-session.c /usr/src/debug/openssh/10.3p1/ssherr.c /usr/src/debug/openssh/10.3p1/openbsd-compat/mktemp.c /usr/src/debug/openssh/10.3p1/krl.c /usr/src/debug/openssh/10.3p1/clientloop.h /usr/src/debug/openssh/10.3p1/auth2-pubkey.c /usr/src/debug/openssh/10.3p1/auth2-chall.c /usr/src/debug
 /openssh/10.3p1/crypto_api.h /usr/src/debug/openssh/10.3p1/openbsd-compat/bsd-misc.h /usr/src/debug/openssh/10.3p1/openbsd-compat/vis.c /usr/src/debug/openssh/10.3p1/openbsd-compat/readpassphrase.h /usr/src/debug/openssh/10.3p1/sshconnect2.c /usr/src/debug/openssh/10.3p1/openbsd-compat/readpassphrase.c /usr/src/debug/openssh/10.3p1/openbsd-compat/blf.h /usr/src/debug/openssh/10.3p1/openbsd-compat/bsd-misc.c /usr/src/debug/openssh/10.3p1/openbsd-compat/vis.h /usr/src/debug/openssh/10.3p1/openbsd-compat/timingsafe_bcmp.c /usr/src/debug/openssh/10.3p1/platform-misc.c /usr/src/debug/openssh/10.3p1/auth2-kbdint.c /usr/src/debug/openssh/10.3p1/groupaccess.h /usr/src/debug/openssh/10.3p1/dns.c /usr/src/debug/openssh/10.3p1/monitor_wrap.c /usr/src/debug/openssh/10.3p1/monitor_wrap.h /usr/src/debug/openssh/10.3p1/dns.h /usr/src/debug/openssh/10.3p1/groupaccess.c /usr/src/debug/openssh/10.3p1/compat.c /usr/src/debug/openssh/10.3p1/platform-pledge.c /usr/src/debug/openssh/10.3p1/sshd.c /usr/sr
 c/debug/openssh/10.3p1/compat.h", added "/usr/src/debug/openssh/10.4p1/rijndael.h /usr/src/debug/openssh/10.4p1/ssh-ecdsa.c /usr/src/debug/openssh/10.4p1/ssh-agent.c /usr/src/debug/openssh/10.4p1/auth.c /usr/src/debug/openssh/10.4p1/regress/unittests/crypto/tests.c /usr/src/debug/openssh/10.4p1/kexecdh.c /usr/src/debug/openssh/10.4p1/openbsd-compat/strmode.c /usr/src/debug/openssh/10.4p1/auth.h /usr/src/debug/openssh/10.4p1/serverloop.c /usr/src/debug/openssh/10.4p1/sshkey.c /usr/src/debug/openssh/10.4p1/sftp-common.c /usr/src/debug/openssh/10.4p1/cipher-chachapoly.h /usr/src/debug/openssh/10.4p1/serverloop.h /usr/src/debug/openssh/10.4p1/sftp-glob.c /usr/src/debug/openssh/10.4p1/openbsd-compat/getopt_long.c /usr/src/debug/openssh/10.4p1/sftp-common.h /usr/src/debug/openssh/10.4p1/sntrup761.c /usr/src/debug/openssh/10.4p1/sshkey.h /usr/src/debug/openssh/10.4p1/auth-pam.h /usr/src/debug/openssh/10.4p1/openbsd-compat/bsd-getpeereid.c /usr/src/debug/openssh/10.4p1/addrmatch.c /usr/src/
 debug/openssh/10.4p1/ssh-mldsa-eddsa.c /usr/src/debug/openssh/10.4p1/auth-pam.c /usr/src/debug/openssh/10.4p1/kexdh.c /usr/src/debug/openssh/10.4p1/ssh-pkcs11.h /usr/src/debug/openssh/10.4p1/sshconnect.h /usr/src/debug/openssh/10.4p1/ssh-sk-helper.c /usr/src/debug/openssh/10.4p1/ssh-keygen.c /usr/src/debug/openssh/10.4p1/ssh-pkcs11.c /usr/src/debug/openssh/10.4p1/sshconnect.c /usr/src/debug/openssh/10.4p1/progressmeter.h /usr/src/debug/openssh/10.4p1/kex.c /usr/src/debug/openssh/10.4p1/mux.c /usr/src/debug/openssh/10.4p1/openbsd-compat/port-linux.h /usr/src/debug/openssh/10.4p1/monitor_fdpass.c /usr/src/debug/openssh/10.4p1/sftp-usergroup.h /usr/src/debug/openssh/10.4p1/sshbuf-getput-crypto.c /usr/src/debug/openssh/10.4p1/kex.h /usr/src/debug/openssh/10.4p1/openbsd-compat/blowfish.c /usr/src/debug/openssh/10.4p1/progressmeter.c /usr/src/debug/openssh/10.4p1/monitor_fdpass.h /usr/src/debug/openssh/10.4p1/openbsd-compat/port-linux.c /usr/src/debug/openssh/10.4p1/platform-listen.c /usr
 /src/debug/openssh/10.4p1/authfd.h /usr/src/debug/openssh/10.4p1/match.h /usr/src/debug/openssh/10.4p1/sftp-usergroup.c /usr/src/debug/openssh/10.4p1/sandbox-seccomp-filter.c /usr/src/debug/openssh/10.4p1/ssh-rsa.c /usr/src/debug/openssh/10.4p1/openbsd-compat/strtonum.c /usr/src/debug/openssh/10.4p1/authfd.c /usr/src/debug/openssh/10.4p1/match.c /usr/src/debug/openssh/10.4p1/openbsd-compat/xcrypt.c /usr/src/debug/openssh/10.4p1/auth2-methods.c /usr/src/debug/openssh/10.4p1/dispatch.c /usr/src/debug/openssh/10.4p1/platform.c /usr/src/debug/openssh/10.4p1/servconf.h /usr/src/debug/openssh/10.4p1/platform.h /usr/src/debug/openssh/10.4p1/scp.c /usr/src/debug/openssh/10.4p1/dispatch.h /usr/src/debug/openssh/10.4p1/servconf.c /usr/src/debug/openssh/10.4p1/nchan.c /usr/src/debug/openssh/10.4p1/openbsd-compat/openbsd-compat.h /usr/src/debug/openssh/10.4p1/kexc25519.c /usr/src/debug/openssh/10.4p1/kex-names.c /usr/src/debug/openssh/10.4p1/addr.h /usr/src/debug/openssh/10.4p1/ssh-ed25519.c /u
 sr/src/debug/openssh/10.4p1/loginrec.h /usr/src/debug/openssh/10.4p1/sftp-realpath.c /usr/src/debug/openssh/10.4p1/ssh-pkcs11-client.c /usr/src/debug/openssh/10.4p1/sshlogin.c /usr/src/debug/openssh/10.4p1/addr.c /usr/src/debug/openssh/10.4p1/sshlogin.h /usr/src/debug/openssh/10.4p1/loginrec.c /usr/src/debug/openssh/10.4p1/readconf.h /usr/src/debug/openssh/10.4p1/regress/unittests/crypto/test_mlkem.c /usr/src/debug/openssh/10.4p1/digest.h /usr/src/debug/openssh/10.4p1/openbsd-compat/bcrypt_pbkdf.c /usr/src/debug/openssh/10.4p1/openbsd-compat/recallocarray.c /usr/src/debug/openssh/10.4p1/readconf.c /usr/src/debug/openssh/10.4p1/entropy.h /usr/src/debug/openssh/10.4p1/entropy.c /usr/src/debug/openssh/10.4p1/auth-shadow.c /usr/src/debug/openssh/10.4p1/cipher-chachapoly-libcrypto.c /usr/src/debug/openssh/10.4p1/digest-openssl.c /usr/src/debug/openssh/10.4p1/openbsd-compat/freezero.c /usr/src/debug/openssh/10.4p1/openbsd-compat/getopt.h /usr/src/debug/openssh/10.4p1/fatal.c /usr/src/debu
 g/openssh/10.4p1/sftp-server-main.c /usr/src/debug/openssh/10.4p1/ssh-sk.h /usr/src/debug/openssh/10.4p1/ssh_api.h /usr/src/debug/openssh/10.4p1/readpass.c /usr/src/debug/openssh/10.4p1/openbsd-compat/getrrsetbyname.h /usr/src/debug/openssh/10.4p1/ssh_api.c /usr/src/debug/openssh/10.4p1/sshbuf.c /usr/src/debug/openssh/10.4p1/openbsd-compat/getrrsetbyname.c /usr/src/debug/openssh/10.4p1/sshbuf.h /usr/src/debug/openssh/10.4p1/channels.h /usr/src/debug/openssh/10.4p1/sshsig.h /usr/src/debug/openssh/10.4p1/auth2-pubkeyfile.c /usr/src/debug/openssh/10.4p1/libcrux-mlkem-mldsa.c /usr/src/debug/openssh/10.4p1/channels.c /usr/src/debug/openssh/10.4p1/sshsig.c /usr/src/debug/openssh/10.4p1/srclimit.h /usr/src/debug/openssh/10.4p1/log.c /usr/src/debug/openssh/10.4p1/msg.c /usr/src/debug/openssh/10.4p1/regress/unittests/crypto/test_mldsa_eddsa.c /usr/src/debug/openssh/10.4p1/xmalloc.c /usr/src/debug/openssh/10.4p1/hmac.c /usr/src/debug/openssh/10.4p1/umac.c /usr/src/debug/openssh/10.4p1/log.h /
 usr/src/debug/openssh/10.4p1/msg.h /usr/src/debug/openssh/10.4p1/srclimit.c /usr/src/debug/openssh/10.4p1/xmalloc.h /usr/src/debug/openssh/10.4p1/hmac.h /usr/src/debug/openssh/10.4p1/auth-rhosts.c /usr/src/debug/openssh/10.4p1/umac.h /usr/src/debug/openssh/10.4p1/cipher-aesctr.h /usr/src/debug/openssh/10.4p1/packet.c /usr/src/debug/openssh/10.4p1/cipher.h /usr/src/debug/openssh/10.4p1/packet.h /usr/src/debug/openssh/10.4p1/cipher.c /usr/src/debug/openssh/10.4p1/misc-agent.c /usr/src/debug/openssh/10.4p1/ssherr-nolibcrypto.c /usr/src/debug/openssh/10.4p1/kexgen.c /usr/src/debug/openssh/10.4p1/session.h /usr/src/debug/openssh/10.4p1/smult_curve25519_ref.c /usr/src/debug/openssh/10.4p1/libcrux_internal.h /usr/src/debug/openssh/10.4p1/session.c /usr/src/debug/openssh/10.4p1/ssh-sk-client.c /usr/src/debug/openssh/10.4p1/openbsd-compat/charclass.h /usr/src/debug/openssh/10.4p1/ttymodes.c /usr/src/debug/openssh/10.4p1/utf8.c /usr/src/debug/openssh/10.4p1/auth-options.h /usr/src/debug/opens
 sh/10.4p1/monitor.h /usr/src/debug/openssh/10.4p1/sshbuf-io.c /usr/src/debug/openssh/10.4p1/sshd-auth.c /usr/src/debug/openssh/10.4p1/ttymodes.h /usr/src/debug/openssh/10.4p1/utf8.h /usr/src/debug/openssh/10.4p1/openbsd-compat/fmt_scaled.c /usr/src/debug/openssh/10.4p1/auth-options.c /usr/src/debug/openssh/10.4p1/monitor.c /usr/src/debug/openssh/10.4p1/sshpty.c /usr/src/debug/openssh/10.4p1/regress/unittests/crypto/test_mldsa.c /usr/src/debug/openssh/10.4p1/sshtty.c /usr/src/debug/openssh/10.4p1/kexgexc.c /usr/src/debug/openssh/10.4p1/mac.c /usr/src/debug/openssh/10.4p1/sshpty.h /usr/src/debug/openssh/10.4p1/mac.h /usr/src/debug/openssh/10.4p1/kexgexs.c /usr/src/debug/openssh/10.4p1/auth2.c /usr/src/debug/openssh/10.4p1/ssh-add.c /usr/src/debug/openssh/10.4p1/ssh.c /usr/src/debug/openssh/10.4p1/ssh-sandbox.h /usr/src/debug/openssh/10.4p1/pkcs11.h /usr/src/debug/openssh/10.4p1/auth-passwd.c /usr/src/debug/openssh/10.4p1/bitmap.c /usr/src/debug/openssh/10.4p1/openbsd-compat/setproctit
 le.c /usr/src/debug/openssh/10.4p1/dh.c /usr/src/debug/openssh/10.4p1/sftp-server.c /usr/src/debug/openssh/10.4p1/ssh-keyscan.c /usr/src/debug/openssh/10.4p1/ssh-keysign.c /usr/src/debug/openssh/10.4p1/sshbuf-misc.c /usr/src/debug/openssh/10.4p1/bitmap.h /usr/src/debug/openssh/10.4p1/dh.h /usr/src/debug/openssh/10.4p1/sftp.h /usr/src/debug/openssh/10.4p1/hostfile.h /usr/src/debug/openssh/10.4p1/platform-tracing.c /usr/src/debug/openssh/10.4p1/hostfile.c /usr/src/debug/openssh/10.4p1/sftp.c /usr/src/debug/openssh/10.4p1/openbsd-compat/bsd-closefrom.c /usr/src/debug/openssh/10.4p1/openbsd-compat/port-net.c /usr/src/debug/openssh/10.4p1/misc.h /usr/src/debug/openssh/10.4p1/sftp-client.h /usr/src/debug/openssh/10.4p1/misc.c /usr/src/debug/openssh/10.4p1/sftp-client.c /usr/src/debug/openssh/10.4p1/openbsd-compat/port-net.h /usr/src/debug/openssh/10.4p1/ssherr.h /usr/src/debug/openssh/10.4p1/authfile.h /usr/src/debug/openssh/10.4p1/openbsd-compat/openssl-compat.h /usr/src/debug/openssh/10
 .4p1/canohost.c /usr/src/debug/openssh/10.4p1/atomicio.c /usr/src/debug/openssh/10.4p1/openbsd-compat/pwcache.c /usr/src/debug/openssh/10.4p1/authfile.c /usr/src/debug/openssh/10.4p1/openbsd-compat/openssl-compat.c /usr/src/debug/openssh/10.4p1/cleanup.c /usr/src/debug/openssh/10.4p1/poly1305.h /usr/src/debug/openssh/10.4p1/auth2-none.c /usr/src/debug/openssh/10.4p1/atomicio.h /usr/src/debug/openssh/10.4p1/ed25519-openssl.c /usr/src/debug/openssh/10.4p1/canohost.h /usr/src/debug/openssh/10.4p1/poly1305.c /usr/src/debug/openssh/10.4p1/openbsd-compat/glob.c /usr/src/debug/openssh/10.4p1/ssh-pkcs11-helper.c /usr/src/debug/openssh/10.4p1/uidswap.c /usr/src/debug/openssh/10.4p1/openbsd-compat/glob.h /usr/src/debug/openssh/10.4p1/kexgex.c /usr/src/debug/openssh/10.4p1/uidswap.h /usr/src/debug/openssh/10.4p1/kexmlkem768x25519.c /usr/src/debug/openssh/10.4p1/kexsntrup761x25519.c /usr/src/debug/openssh/10.4p1/auth2-passwd.c /usr/src/debug/openssh/10.4p1/ssherr-libcrypto.c /usr/src/debug/open
 ssh/10.4p1/sshbuf-getput-basic.c /usr/src/debug/openssh/10.4p1/auth2-hostbased.c /usr/src/debug/openssh/10.4p1/openbsd-compat/base64.c /usr/src/debug/openssh/10.4p1/moduli.c /usr/src/debug/openssh/10.4p1/regress/unittests/crypto/test_ed25519.c /usr/src/debug/openssh/10.4p1/clientloop.c /usr/src/debug/openssh/10.4p1/krl.h /usr/src/debug/openssh/10.4p1/regress/unittests/utf8/tests.c /usr/src/debug/openssh/10.4p1/sshd-session.c /usr/src/debug/openssh/10.4p1/ssherr.c /usr/src/debug/openssh/10.4p1/openbsd-compat/mktemp.c /usr/src/debug/openssh/10.4p1/krl.c /usr/src/debug/openssh/10.4p1/clientloop.h /usr/src/debug/openssh/10.4p1/auth2-pubkey.c /usr/src/debug/openssh/10.4p1/auth2-chall.c /usr/src/debug/openssh/10.4p1/crypto_api.h /usr/src/debug/openssh/10.4p1/openbsd-compat/bsd-misc.h /usr/src/debug/openssh/10.4p1/openbsd-compat/vis.c /usr/src/debug/openssh/10.4p1/openbsd-compat/readpassphrase.h /usr/src/debug/openssh/10.4p1/sshconnect2.c /usr/src/debug/openssh/10.4p1/openbsd-compat/readpa
 ssphrase.c /usr/src/debug/openssh/10.4p1/openbsd-compat/blf.h /usr/src/debug/openssh/10.4p1/openbsd-compat/bsd-misc.c /usr/src/debug/openssh/10.4p1/openbsd-compat/vis.h /usr/src/debug/openssh/10.4p1/openbsd-compat/timingsafe_bcmp.c /usr/src/debug/openssh/10.4p1/platform-misc.c /usr/src/debug/openssh/10.4p1/auth2-kbdint.c /usr/src/debug/openssh/10.4p1/groupaccess.h /usr/src/debug/openssh/10.4p1/dns.c /usr/src/debug/openssh/10.4p1/monitor_wrap.c /usr/src/debug/openssh/10.4p1/monitor_wrap.h /usr/src/debug/openssh/10.4p1/dns.h /usr/src/debug/openssh/10.4p1/groupaccess.c /usr/src/debug/openssh/10.4p1/compat.c /usr/src/debug/openssh/10.4p1/platform-pledge.c /usr/src/debug/openssh/10.4p1/sshd.c /usr/src/debug/openssh/10.4p1/compat.h"
packages/x86-64-v3-poky-linux/openssh/openssh-ssh: PKGV changed from 10.3p1 [default] to 10.4p1 [default]
packages/x86-64-v3-poky-linux/openssh/openssh-ssh: PV changed from "10.3p1" to "10.4p1"
packages/x86-64-v3-poky-linux/openssh/openssh-ssh: PKGSIZE changed from 925913 to 1016025 (+10%)
packages/x86-64-v3-poky-linux/openssh/openssh-sshd: PKGV changed from 10.3p1 [default] to 10.4p1 [default]
packages/x86-64-v3-poky-linux/openssh/openssh-sshd: PV changed from "10.3p1" to "10.4p1"
packages/x86-64-v3-poky-linux/openssh/openssh-sshd: PKGSIZE changed from 3168810 to 3486104 (+10%)
packages/x86-64-v3-poky-linux/openssh/openssh-staticdev: PKGV changed from 10.3p1 [default] to 10.4p1 [default]
packages/x86-64-v3-poky-linux/openssh/openssh-staticdev: PV changed from "10.3p1" to "10.4p1"
packages/x86-64-v3-poky-linux/openssh/openssh: PKGV changed from 10.3p1 [default] to 10.4p1 [default]
packages/x86-64-v3-poky-linux/openssh/openssh: PV changed from "10.3p1" to "10.4p1"

--===============1402967003654465777==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/openssh/openssh-dbg: PKGSIZE changed from 27513296 to 41197392 (+50%)
packages/x86-64-v3-poky-linux/openssh/openssh-keygen: PKGSIZE changed from 440512 to 592064 (+34%)
packages/x86-64-v3-poky-linux/openssh/openssh-misc: PKGSIZE changed from 1793237 to 2485461 (+39%)
packages/x86-64-v3-poky-linux/openssh/openssh-ptest: PKGSIZE changed from 6053215 to 8475073 (+40%)
packages/x86-64-v3-poky-linux/openssh/openssh-ptest: FILELIST: added "/usr/lib/openssh/ptest/regress/unittests/crypto/test_mldsa_eddsa.c /usr/lib/openssh/ptest/regress/unittests/sshsig/testdata/mldsa44-ed25519.sig /usr/lib/openssh/ptest/regress/unittests/crypto/test_mldsa_eddsa.o /usr/lib/openssh/ptest/regress/unittests/crypto/Makefile /usr/lib/openssh/ptest/regress/unittests/crypto/test_mlkem.c /usr/lib/openssh/ptest/regress/unittests/servconf/Makefile /usr/lib/openssh/ptest/regress/unittests/crypto/test_mlkem.o /usr/lib/openssh/ptest/regress/unittests/sshkey/testdata/mldsa44_ed25519_1_pw /usr/lib/openssh/ptest/regress/unittests/sshkey/testdata/mldsa44_ed25519_2.pub /usr/lib/openssh/ptest/regress/unittests/crypto/tests.o /usr/lib/openssh/ptest/regress/unittests/servconf/tests.c /usr/lib/openssh/ptest/regress/unittests/servconf/tests.o /usr/lib/openssh/ptest/regress/unittests/crypto/tests.c /usr/lib/openssh/ptest/regress/unittests/crypto/test_mldsa.o /usr/lib/openssh/ptest/regress/un
 ittests/servconf/test_servconf /usr/lib/openssh/ptest/regress/unittests/sshkey/testdata/mldsa44_ed25519_1.fp /usr/lib/openssh/ptest/regress/unittests/crypto/test_mldsa.c /usr/lib/openssh/ptest/regress/unittests/sshkey/testdata/mldsa44_ed25519_2.fp.bb /usr/lib/openssh/ptest/regress/unittests/sshkey/testdata/mldsa44_ed25519_1.pub /usr/lib/openssh/ptest/regress/unittests/sshkey/testdata/mldsa44_ed25519_1-cert.fp /usr/lib/openssh/ptest/regress/unittests/crypto/test_ed25519.c /usr/lib/openssh/ptest/regress/unittests/crypto/testdata/draft-ietf-lamps-pq-composite-sigs.json /usr/lib/openssh/ptest/regress/unittests/crypto/test_crypto /usr/lib/openssh/ptest/regress/unittests/sshkey/testdata/mldsa44_ed25519_1.fp.bb /usr/lib/openssh/ptest/regress/unittests/sshkey/testdata/mldsa44_ed25519_1-cert.pub /usr/lib/openssh/ptest/regress/unittests/crypto/test_ed25519.o /usr/lib/openssh/ptest/regress/unittests/sshkey/testdata/mldsa44_ed25519_1 /usr/lib/openssh/ptest/regress/unittests/sshkey/testdata/mlds
 a44_ed25519_2 /usr/lib/openssh/ptest/regress/unittests/crypto/testdata/nistkats-44.json /usr/lib/openssh/ptest/regress/unittests/sshsig/testdata/mldsa44-ed25519.pub /usr/lib/openssh/ptest/regress/unittests/sshkey/testdata/mldsa44_ed25519_2.fp /usr/lib/openssh/ptest/regress/unittests/sshsig/testdata/mldsa44-ed25519"
packages/x86-64-v3-poky-linux/openssh/openssh-src: PKGSIZE changed from 4160479 to 4692018 (+13%)
packages/x86-64-v3-poky-linux/openssh/openssh-sshd: PKGSIZE changed from 3168810 to 3486104 (+10%)

--===============1402967003654465777==--

