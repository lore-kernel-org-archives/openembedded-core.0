Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.466.1793944896943825213
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 22:01:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=tEjKLYks;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=1PvwzFoE;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101a1af72c13e-146c4f19-41bf-41a6-89cb-a32fe7a05481-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1793944896;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=B9BsfDOuJKeEmrWUmqNnRzuY65+00yhNCvedABONYfg=;
	b=tEjKLYksy9T9RkgKzy5ZQozTDkTBKFANNhUlTlAbffLeyAeZ/R80UG1/Or/WM0xp
	A5USzmCwbRBQaOCb7umeP66XVTkjFEAymruRQj/xMyhmpWyilmRxtBW7wpQm+k4l4FA
	FiXEQ7zou6Svfhi4pRKYez3W7ALuTlLUP54kytA4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1793944896;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=B9BsfDOuJKeEmrWUmqNnRzuY65+00yhNCvedABONYfg=;
	b=1PvwzFoEk/9KQTzNrf18hjT/U7PVi/2iciO4HOSwXKlWkrsqTVd7nkD0MWqtc/OV
	N4xckKfOvneqnQtx5SwXCY+0D7yTaGjtiacl1On9tbdpEGvacXPY6kyMngxwBYVs3UW
	NZmjbtGDS9ksjJVbIYhXFqU6NCjMfFnchSd7E9/w=
Content-Type: multipart/mixed; boundary="===============1233460416065510089=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] openssh: upgrading to 10.6p2 SUCCEEDED
Message-ID: <010101a1af72c13e-146c4f19-41bf-41a6-89cb-a32fe7a05481-000000@us-west-2.amazonses.com>
Date: Fri, 6 Nov 2026 06:01:35 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.06-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 06:01:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249586

--===============1233460416065510089==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *openssh* to *10.6p2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-openssh-upgrade-10.6p1-10.6p2.patch
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
From f953e7a1024b95018dfc959ff93e7a616da1f160 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 6 Nov 2026 05:18:55 +0000
Subject: [PATCH] openssh: upgrade 10.6p1 -> 10.6p2

---
 ...1-regress-banner.sh-log-input-and-output-files-on-erro.patch | 2 +-
 .../openssh/{openssh_10.6p1.bb => openssh_10.6p2.bb}            | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/openssh/{openssh_10.6p1.bb => openssh_10.6p2.bb} (99%)

diff --git a/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-input-and-output-files-on-erro.patch b/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-input-and-output-files-on-erro.patch
index 902ac7411a..46bd7e8d3c 100644
--- a/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-input-and-output-files-on-erro.patch
+++ b/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-input-and-output-files-on-erro.patch
@@ -1,4 +1,4 @@
-From bea215955125b39c802d2a255cd08dff4fa6298e Mon Sep 17 00:00:00 2001
+From 715dcbdc4724618a4224a4ee78bdf9bef0cd26f4 Mon Sep 17 00:00:00 2001
 From: Mikko Rapeli <mikko.rapeli@linaro.org>
 Date: Mon, 11 Sep 2023 09:55:21 +0100
 Subject: [PATCH] regress/banner.sh: log input and output files on error
diff --git a/meta/recipes-connectivity/openssh/openssh_10.6p1.bb b/meta/recipes-connectivity/openssh/openssh_10.6p2.bb
similarity index 99%
rename from meta/recipes-connectivity/openssh/openssh_10.6p1.bb
rename to meta/recipes-connectivity/openssh/openssh_10.6p2.bb
index bad22b879c..24a9102949 100644
--- a/meta/recipes-connectivity/openssh/openssh_10.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_10.6p2.bb
@@ -25,7 +25,7 @@ SRC_URI = "https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.ta
            file://sshd_check_keys \
            file://0001-regress-banner.sh-log-input-and-output-files-on-erro.patch \
            "
-SRC_URI[sha256sum] = "a9dc9565dffe8640f64d863cd29a32bc4a3dbdec0566a7fc44c5d6ee767d5f39"
+SRC_URI[sha256sum] = "9ae44872090cf2f06b3cf9ff147e7f16f309671340763ed2f99248398ae29d5b"
 
 CVE_STATUS[CVE-2007-2768] = "not-applicable-config: This CVE is specific to OpenSSH with the pam opie which we don't build/use here."
 
-- 
2.47.1


--===============1233460416065510089==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/openssh: PV changed from "10.6p1" to "10.6p2"
packages/x86-64-v3-poky-linux/openssh: SRC_URI changed from "https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-10.6p1.tar.gz file://sshd_config file://ssh_config file://init file://sshd file://sshd.service file://sshd.socket file://sshd@.service file://sshdgenkeys.service file://volatiles.99_sshd file://run-ptest file://sshd_check_keys file://0001-regress-banner.sh-log-input-and-output-files-on-erro.patch" to "https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-10.6p2.tar.gz file://sshd_config file://ssh_config file://init file://sshd file://sshd.service file://sshd.socket file://sshd@.service file://sshdgenkeys.service file://volatiles.99_sshd file://run-ptest file://sshd_check_keys file://0001-regress-banner.sh-log-input-and-output-files-on-erro.patch"
packages/x86-64-v3-poky-linux/openssh: PKGV changed from 10.6p1 [default] to 10.6p2 [default]
packages/x86-64-v3-poky-linux/openssh/openssh-dbg: PV changed from "10.6p1" to "10.6p2"
packages/x86-64-v3-poky-linux/openssh/openssh-dbg: PKGSIZE changed from 41417456 to 41412480 (-0%)
packages/x86-64-v3-poky-linux/openssh/openssh-dbg: PKGV changed from 10.6p1 [default] to 10.6p2 [default]
packages/x86-64-v3-poky-linux/openssh/openssh-dev: PV changed from "10.6p1" to "10.6p2"
packages/x86-64-v3-poky-linux/openssh/openssh-dev: PKGV changed from 10.6p1 [default] to 10.6p2 [default]
packages/x86-64-v3-poky-linux/openssh/openssh-doc: PV changed from "10.6p1" to "10.6p2"
packages/x86-64-v3-poky-linux/openssh/openssh-doc: PKGV changed from 10.6p1 [default] to 10.6p2 [default]
packages/x86-64-v3-poky-linux/openssh/openssh-keygen: PV changed from "10.6p1" to "10.6p2"
packages/x86-64-v3-poky-linux/openssh/openssh-keygen: PKGV changed from 10.6p1 [default] to 10.6p2 [default]
packages/x86-64-v3-poky-linux/openssh/openssh-locale: PV changed from "10.6p1" to "10.6p2"
packages/x86-64-v3-poky-linux/openssh/openssh-locale: PKGV changed from 10.6p1 [default] to 10.6p2 [default]
packages/x86-64-v3-poky-linux/openssh/openssh-misc: PV changed from "10.6p1" to "10.6p2"
packages/x86-64-v3-poky-linux/openssh/openssh-misc: PKGV changed from 10.6p1 [default] to 10.6p2 [default]
packages/x86-64-v3-poky-linux/openssh/openssh-ptest: PV changed from "10.6p1" to "10.6p2"
packages/x86-64-v3-poky-linux/openssh/openssh-ptest: PKGSIZE changed from 8499590 to 8499582 (-0%)
packages/x86-64-v3-poky-linux/openssh/openssh-ptest: PKGV changed from 10.6p1 [default] to 10.6p2 [default]
packages/x86-64-v3-poky-linux/openssh/openssh-scp: PV changed from "10.6p1" to "10.6p2"
packages/x86-64-v3-poky-linux/openssh/openssh-scp: PKGV changed from 10.6p1 [default] to 10.6p2 [default]
packages/x86-64-v3-poky-linux/openssh/openssh-sftp-server: PV changed from "10.6p1" to "10.6p2"
packages/x86-64-v3-poky-linux/openssh/openssh-sftp-server: PKGV changed from 10.6p1 [default] to 10.6p2 [default]
packages/x86-64-v3-poky-linux/openssh/openssh-sftp: PV changed from "10.6p1" to "10.6p2"
packages/x86-64-v3-poky-linux/openssh/openssh-sftp: PKGV changed from 10.6p1 [default] to 10.6p2 [default]
packages/x86-64-v3-poky-linux/openssh/openssh-src: PV changed from "10.6p1" to "10.6p2"
packages/x86-64-v3-poky-linux/openssh/openssh-src: PKGSIZE changed from 4856148 to 4856694 (+0%)
packages/x86-64-v3-poky-linux/openssh/openssh-src: FILELIST: directory renamed /usr/src/debug/openssh/10.6p1/regress/unittests/conversion -> /usr/src/debug/openssh/10.6p2/regress/unittests/conversion, directory renamed /usr/src/debug/openssh/10.6p1/regress/unittests/kex -> /usr/src/debug/openssh/10.6p2/regress/unittests/kex, directory renamed /usr/src/debug/openssh/10.6p1/regress/unittests/servconf -> /usr/src/debug/openssh/10.6p2/regress/unittests/servconf, directory renamed /usr/src/debug/openssh/10.6p1/openbsd-compat -> /usr/src/debug/openssh/10.6p2/openbsd-compat, directory renamed /usr/src/debug/openssh/10.6p1/regress/unittests/test_helper -> /usr/src/debug/openssh/10.6p2/regress/unittests/test_helper, directory renamed /usr/src/debug/openssh/10.6p1/regress/unittests/utf8 -> /usr/src/debug/openssh/10.6p2/regress/unittests/utf8, directory renamed /usr/src/debug/openssh/10.6p1/regress -> /usr/src/debug/openssh/10.6p2/regress, directory renamed /usr/src/debug/openssh/10.6p1/regress
 /unittests/sshkey -> /usr/src/debug/openssh/10.6p2/regress/unittests/sshkey, directory renamed /usr/src/debug/openssh/10.6p1/regress/unittests/authopt -> /usr/src/debug/openssh/10.6p2/regress/unittests/authopt, directory renamed /usr/src/debug/openssh/10.6p1/regress/unittests/hostkeys -> /usr/src/debug/openssh/10.6p2/regress/unittests/hostkeys, directory renamed /usr/src/debug/openssh/10.6p1/regress/unittests/sshbuf -> /usr/src/debug/openssh/10.6p2/regress/unittests/sshbuf, directory renamed /usr/src/debug/openssh/10.6p1/regress/unittests/crypto -> /usr/src/debug/openssh/10.6p2/regress/unittests/crypto, directory renamed /usr/src/debug/openssh/10.6p1/regress/unittests/match -> /usr/src/debug/openssh/10.6p2/regress/unittests/match, directory renamed /usr/src/debug/openssh/10.6p1/regress/unittests/bitmap -> /usr/src/debug/openssh/10.6p2/regress/unittests/bitmap, directory renamed /usr/src/debug/openssh/10.6p1/regress/unittests/sshsig -> /usr/src/debug/openssh/10.6p2/regress/unittests/
 sshsig, directory renamed /usr/src/debug/openssh/10.6p1/regress/unittests/misc -> /usr/src/debug/openssh/10.6p2/regress/unittests/misc, directory renamed /usr/src/debug/openssh/10.6p1 -> /usr/src/debug/openssh/10.6p2
packages/x86-64-v3-poky-linux/openssh/openssh-src: PKGV changed from 10.6p1 [default] to 10.6p2 [default]
packages/x86-64-v3-poky-linux/openssh/openssh-ssh: PV changed from "10.6p1" to "10.6p2"
packages/x86-64-v3-poky-linux/openssh/openssh-ssh: PKGSIZE changed from 1020121 to 1024217 (+0%)
packages/x86-64-v3-poky-linux/openssh/openssh-ssh: PKGV changed from 10.6p1 [default] to 10.6p2 [default]
packages/x86-64-v3-poky-linux/openssh/openssh-sshd: PV changed from "10.6p1" to "10.6p2"
packages/x86-64-v3-poky-linux/openssh/openssh-sshd: PKGV changed from 10.6p1 [default] to 10.6p2 [default]
packages/x86-64-v3-poky-linux/openssh/openssh-staticdev: PV changed from "10.6p1" to "10.6p2"
packages/x86-64-v3-poky-linux/openssh/openssh-staticdev: PKGV changed from 10.6p1 [default] to 10.6p2 [default]
packages/x86-64-v3-poky-linux/openssh/openssh: PV changed from "10.6p1" to "10.6p2"
packages/x86-64-v3-poky-linux/openssh/openssh: PKGV changed from 10.6p1 [default] to 10.6p2 [default]

--===============1233460416065510089==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-openssh-upgrade-10.6p1-10.6p2.patch"

RnJvbSBmOTUzZTdhMTAyNGI5NTAxOGRmYzk1OWZmOTNlN2E2MTZkYTFmMTYwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgNiBOb3YgMjAyNiAwNToxODo1NSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG9w
ZW5zc2g6IHVwZ3JhZGUgMTAuNnAxIC0+IDEwLjZwMgoKLS0tCiAuLi4xLXJlZ3Jlc3MtYmFubmVy
LnNoLWxvZy1pbnB1dC1hbmQtb3V0cHV0LWZpbGVzLW9uLWVycm8ucGF0Y2ggfCAyICstCiAuLi4v
b3BlbnNzaC97b3BlbnNzaF8xMC42cDEuYmIgPT4gb3BlbnNzaF8xMC42cDIuYmJ9ICAgICAgICAg
ICAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2gve29wZW5zc2hfMTAu
NnAxLmJiID0+IG9wZW5zc2hfMTAuNnAyLmJifSAoOTklKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzaC9vcGVuc3NoLzAwMDEtcmVncmVzcy1iYW5uZXIuc2gt
bG9nLWlucHV0LWFuZC1vdXRwdXQtZmlsZXMtb24tZXJyby5wYXRjaCBiL21ldGEvcmVjaXBlcy1j
b25uZWN0aXZpdHkvb3BlbnNzaC9vcGVuc3NoLzAwMDEtcmVncmVzcy1iYW5uZXIuc2gtbG9nLWlu
cHV0LWFuZC1vdXRwdXQtZmlsZXMtb24tZXJyby5wYXRjaAppbmRleCA5MDJhYzc0MTFhLi40NmJk
N2U4ZDNjIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2gvb3Bl
bnNzaC8wMDAxLXJlZ3Jlc3MtYmFubmVyLnNoLWxvZy1pbnB1dC1hbmQtb3V0cHV0LWZpbGVzLW9u
LWVycm8ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NoL29wZW5z
c2gvMDAwMS1yZWdyZXNzLWJhbm5lci5zaC1sb2ctaW5wdXQtYW5kLW91dHB1dC1maWxlcy1vbi1l
cnJvLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBiZWEyMTU5NTUxMjViMzljODAyZDJhMjU1
Y2QwOGRmZjRmYTYyOThlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA3MTVkY2JkYzQ3
MjQ2MThhNDIyNGE0ZWU3OGJkZjliZWYwY2QyNmY0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQog
RnJvbTogTWlra28gUmFwZWxpIDxtaWtrby5yYXBlbGlAbGluYXJvLm9yZz4KIERhdGU6IE1vbiwg
MTEgU2VwIDIwMjMgMDk6NTU6MjEgKzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0gcmVncmVzcy9iYW5u
ZXIuc2g6IGxvZyBpbnB1dCBhbmQgb3V0cHV0IGZpbGVzIG9uIGVycm9yCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2gvb3BlbnNzaF8xMC42cDEuYmIgYi9tZXRh
L3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2gvb3BlbnNzaF8xMC42cDIuYmIKc2ltaWxhcml0
eSBpbmRleCA5OSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3No
L29wZW5zc2hfMTAuNnAxLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29w
ZW5zc2gvb3BlbnNzaF8xMC42cDIuYmIKaW5kZXggYmFkMjJiODc5Yy4uMjRhOTEwMjk0OSAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NoL29wZW5zc2hfMTAuNnAx
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzaC9vcGVuc3NoXzEwLjZw
Mi5iYgpAQCAtMjUsNyArMjUsNyBAQCBTUkNfVVJJID0gImh0dHBzOi8vZnRwLm9wZW5ic2Qub3Jn
L3B1Yi9PcGVuQlNEL09wZW5TU0gvcG9ydGFibGUvb3BlbnNzaC0ke1BWfS50YQogICAgICAgICAg
ICBmaWxlOi8vc3NoZF9jaGVja19rZXlzIFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtcmVncmVz
cy1iYW5uZXIuc2gtbG9nLWlucHV0LWFuZC1vdXRwdXQtZmlsZXMtb24tZXJyby5wYXRjaCBcCiAg
ICAgICAgICAgICIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJhOWRjOTU2NWRmZmU4NjQwZjY0ZDg2
M2NkMjlhMzJiYzRhM2RiZGVjMDU2NmE3ZmM0NGM1ZDZlZTc2N2Q1ZjM5IgorU1JDX1VSSVtzaGEy
NTZzdW1dID0gIjlhZTQ0ODcyMDkwY2YyZjA2YjNjZjlmZjE0N2U3ZjE2ZjMwOTY3MTM0MDc2M2Vk
MmY5OTI0ODM5OGFlMjlkNWIiCiAKIENWRV9TVEFUVVNbQ1ZFLTIwMDctMjc2OF0gPSAibm90LWFw
cGxpY2FibGUtY29uZmlnOiBUaGlzIENWRSBpcyBzcGVjaWZpYyB0byBPcGVuU1NIIHdpdGggdGhl
IHBhbSBvcGllIHdoaWNoIHdlIGRvbid0IGJ1aWxkL3VzZSBoZXJlLiIKIAotLSAKMi40Ny4xCgo=

--===============1233460416065510089==--
