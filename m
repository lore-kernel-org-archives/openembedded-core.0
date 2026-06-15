Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14541CD98DE
	for <webhook@archiver.kernel.org>; Mon, 15 Jun 2026 05:18:52 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.123036.1781500727074621235
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jun 2026 22:18:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=G0ftKv0i;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=I4AShUtM;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019ec9b7cc30-80683cb1-8a4d-4a19-af5e-620b97d2f1f0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781500726;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=+9bw3CLyoVNjsF6QzvNicMookJfAvEiSsypLLBCx1dc=;
	b=G0ftKv0iS/SOI6TWtKnX5VyFNY8HPR7Kh5dCDZcRrw64LyPdZsD63FaHhG0vOWNn
	+zq95IDIad9mH54bAD4VKnPy8igfbrOkLMyjspmVWuZ8jr3mLf0gr8hO9oakmc5vXTY
	IJqXuH1K/bqBTG8Qt6N1SVVtTY95hgmEmojXRpPA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781500726;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=+9bw3CLyoVNjsF6QzvNicMookJfAvEiSsypLLBCx1dc=;
	b=I4AShUtMLVdXVblfarG1RZCJyIBTp6NPX/9sZnv6+MmbbEPyvLW4aRmVW/QkA/R5
	MXdASvT4I+fuOeKfrPVOySUJ8m/rohef4m90IFMc0uFndnBJqAtYRBY3/uBujYTTUML
	zxBY/746KXbPGMzL8VOhqgrB3MXsFncCEgx5egwo=
Content-Type: multipart/mixed; boundary="===============1309379021571076600=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] alsa-lib: upgrading to 1.2.16.1 SUCCEEDED
Message-ID: <0101019ec9b7cc30-80683cb1-8a4d-4a19-af5e-620b97d2f1f0-000000@us-west-2.amazonses.com>
Date: Mon, 15 Jun 2026 05:18:46 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2026 05:18:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238807

--===============1309379021571076600==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *alsa-lib* to *1.2.16.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-alsa-lib-upgrade-1.2.15.3-1.2.16.1.patch
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
From 70220d7ce8f71876d7bb080433916250b0d02194 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Jun 2026 05:15:18 +0000
Subject: [PATCH] alsa-lib: upgrade 1.2.15.3 -> 1.2.16.1

---
 .../alsa/alsa-lib/CVE-2026-25068.patch        | 34 -------------------
 ...a-lib_1.2.15.3.bb => alsa-lib_1.2.16.1.bb} |  3 +-
 2 files changed, 1 insertion(+), 36 deletions(-)
 delete mode 100644 meta/recipes-multimedia/alsa/alsa-lib/CVE-2026-25068.patch
 rename meta/recipes-multimedia/alsa/{alsa-lib_1.2.15.3.bb => alsa-lib_1.2.16.1.bb} (91%)

diff --git a/meta/recipes-multimedia/alsa/alsa-lib/CVE-2026-25068.patch b/meta/recipes-multimedia/alsa/alsa-lib/CVE-2026-25068.patch
deleted file mode 100644
index 9bb24c24e2..0000000000
--- a/meta/recipes-multimedia/alsa/alsa-lib/CVE-2026-25068.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 5f7fe33002d2d98d84f72e381ec2cccc0d5d3d40 Mon Sep 17 00:00:00 2001
-From: Jaroslav Kysela <perex@perex.cz>
-Date: Thu, 29 Jan 2026 16:51:09 +0100
-Subject: [PATCH] topology: decoder - add boundary check for channel mixer
- count
-
-Malicious binary topology file may cause heap corruption.
-
-CVE: CVE-2026-25068
-
-Signed-off-by: Jaroslav Kysela <perex@perex.cz>
-
-Upstream-Status: Backport [https://github.com/alsa-project/alsa-lib/commit/5f7fe33002d2d98d84f72e381ec2cccc0d5d3d40]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- src/topology/ctl.c | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/src/topology/ctl.c b/src/topology/ctl.c
-index a0c24518..322c461c 100644
---- a/src/topology/ctl.c
-+++ b/src/topology/ctl.c
-@@ -1250,6 +1250,11 @@ int tplg_decode_control_mixer1(snd_tplg_t *tplg,
- 	if (mc->num_channels > 0) {
- 		map = tplg_calloc(heap, sizeof(*map));
- 		map->num_channels = mc->num_channels;
-+		if (map->num_channels > SND_TPLG_MAX_CHAN ||
-+		    map->num_channels > SND_SOC_TPLG_MAX_CHAN) {
-+			snd_error(TOPOLOGY, "mixer: unexpected channel count %d", map->num_channels);
-+			return -EINVAL;
-+		}
- 		for (i = 0; i < map->num_channels; i++) {
- 			map->channel[i].reg = mc->channel[i].reg;
- 			map->channel[i].shift = mc->channel[i].shift;
diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.2.16.1.bb
similarity index 91%
rename from meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb
rename to meta/recipes-multimedia/alsa/alsa-lib_1.2.16.1.bb
index 1ebb356925..0c81e3cb3b 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.2.16.1.bb
@@ -10,8 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7 \
                     "
 
 SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2"
-SRC_URI += "file://CVE-2026-25068.patch"
-SRC_URI[sha256sum] = "7b079d614d582cade7ab8db2364e65271d0877a37df8757ac4ac0c8970be861e"
+SRC_URI[sha256sum] = "f740db7f488255944ffd4428416ee3390a96742856916433df468c281436480e"
 
 inherit autotools pkgconfig
 
-- 
2.47.1


--===============1309379021571076600==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-alsa-lib-upgrade-1.2.15.3-1.2.16.1.patch"

RnJvbSA3MDIyMGQ3Y2U4ZjcxODc2ZDdiYjA4MDQzMzkxNjI1MGIwZDAyMTk0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgSnVuIDIwMjYgMDU6MTU6MTggKzAwMDAKU3ViamVjdDogW1BBVENIXSBh
bHNhLWxpYjogdXBncmFkZSAxLjIuMTUuMyAtPiAxLjIuMTYuMQoKLS0tCiAuLi4vYWxzYS9hbHNh
LWxpYi9DVkUtMjAyNi0yNTA2OC5wYXRjaCAgICAgICAgfCAzNCAtLS0tLS0tLS0tLS0tLS0tLS0t
CiAuLi5hLWxpYl8xLjIuMTUuMy5iYiA9PiBhbHNhLWxpYl8xLjIuMTYuMS5iYn0gfCAgMyArLQog
MiBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMzYgZGVsZXRpb25zKC0pCiBkZWxldGUg
bW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvYWxzYS9hbHNhLWxpYi9DVkUtMjAy
Ni0yNTA2OC5wYXRjaAogcmVuYW1lIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2Fsc2Eve2Fsc2Et
bGliXzEuMi4xNS4zLmJiID0+IGFsc2EtbGliXzEuMi4xNi4xLmJifSAoOTElKQoKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2Fsc2EvYWxzYS1saWIvQ1ZFLTIwMjYtMjUwNjgu
cGF0Y2ggYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9hbHNhL2Fsc2EtbGliL0NWRS0yMDI2LTI1
MDY4LnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCA5YmIyNGMyNGUyLi4wMDAw
MDAwMDAwCi0tLSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2Fsc2EvYWxzYS1saWIvQ1ZFLTIw
MjYtMjUwNjgucGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSwzNCArMCwwIEBACi1Gcm9tIDVmN2Zl
MzMwMDJkMmQ5OGQ4NGY3MmUzODFlYzJjY2NjMGQ1ZDNkNDAgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCi1Gcm9tOiBKYXJvc2xhdiBLeXNlbGEgPHBlcmV4QHBlcmV4LmN6PgotRGF0ZTogVGh1LCAy
OSBKYW4gMjAyNiAxNjo1MTowOSArMDEwMAotU3ViamVjdDogW1BBVENIXSB0b3BvbG9neTogZGVj
b2RlciAtIGFkZCBib3VuZGFyeSBjaGVjayBmb3IgY2hhbm5lbCBtaXhlcgotIGNvdW50Ci0KLU1h
bGljaW91cyBiaW5hcnkgdG9wb2xvZ3kgZmlsZSBtYXkgY2F1c2UgaGVhcCBjb3JydXB0aW9uLgot
Ci1DVkU6IENWRS0yMDI2LTI1MDY4Ci0KLVNpZ25lZC1vZmYtYnk6IEphcm9zbGF2IEt5c2VsYSA8
cGVyZXhAcGVyZXguY3o+Ci0KLVVwc3RyZWFtLVN0YXR1czogQmFja3BvcnQgW2h0dHBzOi8vZ2l0
aHViLmNvbS9hbHNhLXByb2plY3QvYWxzYS1saWIvY29tbWl0LzVmN2ZlMzMwMDJkMmQ5OGQ4NGY3
MmUzODFlYzJjY2NjMGQ1ZDNkNDBdCi1TaWduZWQtb2ZmLWJ5OiBQZXRlciBNYXJrbyA8cGV0ZXIu
bWFya29Ac2llbWVucy5jb20+Ci0tLS0KLSBzcmMvdG9wb2xvZ3kvY3RsLmMgfCA1ICsrKysrCi0g
MSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQotCi1kaWZmIC0tZ2l0IGEvc3JjL3RvcG9s
b2d5L2N0bC5jIGIvc3JjL3RvcG9sb2d5L2N0bC5jCi1pbmRleCBhMGMyNDUxOC4uMzIyYzQ2MWMg
MTAwNjQ0Ci0tLS0gYS9zcmMvdG9wb2xvZ3kvY3RsLmMKLSsrKyBiL3NyYy90b3BvbG9neS9jdGwu
YwotQEAgLTEyNTAsNiArMTI1MCwxMSBAQCBpbnQgdHBsZ19kZWNvZGVfY29udHJvbF9taXhlcjEo
c25kX3RwbGdfdCAqdHBsZywKLSAJaWYgKG1jLT5udW1fY2hhbm5lbHMgPiAwKSB7Ci0gCQltYXAg
PSB0cGxnX2NhbGxvYyhoZWFwLCBzaXplb2YoKm1hcCkpOwotIAkJbWFwLT5udW1fY2hhbm5lbHMg
PSBtYy0+bnVtX2NoYW5uZWxzOwotKwkJaWYgKG1hcC0+bnVtX2NoYW5uZWxzID4gU05EX1RQTEdf
TUFYX0NIQU4gfHwKLSsJCSAgICBtYXAtPm51bV9jaGFubmVscyA+IFNORF9TT0NfVFBMR19NQVhf
Q0hBTikgewotKwkJCXNuZF9lcnJvcihUT1BPTE9HWSwgIm1peGVyOiB1bmV4cGVjdGVkIGNoYW5u
ZWwgY291bnQgJWQiLCBtYXAtPm51bV9jaGFubmVscyk7Ci0rCQkJcmV0dXJuIC1FSU5WQUw7Ci0r
CQl9Ci0gCQlmb3IgKGkgPSAwOyBpIDwgbWFwLT5udW1fY2hhbm5lbHM7IGkrKykgewotIAkJCW1h
cC0+Y2hhbm5lbFtpXS5yZWcgPSBtYy0+Y2hhbm5lbFtpXS5yZWc7Ci0gCQkJbWFwLT5jaGFubmVs
W2ldLnNoaWZ0ID0gbWMtPmNoYW5uZWxbaV0uc2hpZnQ7CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtbXVsdGltZWRpYS9hbHNhL2Fsc2EtbGliXzEuMi4xNS4zLmJiIGIvbWV0YS9yZWNpcGVzLW11
bHRpbWVkaWEvYWxzYS9hbHNhLWxpYl8xLjIuMTYuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDkxJQpy
ZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9hbHNhL2Fsc2EtbGliXzEuMi4xNS4z
LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9hbHNhL2Fsc2EtbGliXzEuMi4x
Ni4xLmJiCmluZGV4IDFlYmIzNTY5MjUuLjBjODFlM2NiM2IgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1tdWx0aW1lZGlhL2Fsc2EvYWxzYS1saWJfMS4yLjE1LjMuYmIKKysrIGIvbWV0YS9yZWNp
cGVzLW11bHRpbWVkaWEvYWxzYS9hbHNhLWxpYl8xLjIuMTYuMS5iYgpAQCAtMTAsOCArMTAsNyBA
QCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT1hOTE2NDY3YjkxMDc2ZTYz
MWRkOGVkYjc0MjQ3NjljNyBcCiAgICAgICAgICAgICAgICAgICAgICIKIAogU1JDX1VSSSA9ICJo
dHRwczovL3d3dy5hbHNhLXByb2plY3Qub3JnL2ZpbGVzL3B1Yi9saWIvJHtCUH0udGFyLmJ6MiIK
LVNSQ19VUkkgKz0gImZpbGU6Ly9DVkUtMjAyNi0yNTA2OC5wYXRjaCIKLVNSQ19VUklbc2hhMjU2
c3VtXSA9ICI3YjA3OWQ2MTRkNTgyY2FkZTdhYjhkYjIzNjRlNjUyNzFkMDg3N2EzN2RmODc1N2Fj
NGFjMGM4OTcwYmU4NjFlIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImY3NDBkYjdmNDg4MjU1OTQ0
ZmZkNDQyODQxNmVlMzM5MGE5Njc0Mjg1NjkxNjQzM2RmNDY4YzI4MTQzNjQ4MGUiCiAKIGluaGVy
aXQgYXV0b3Rvb2xzIHBrZ2NvbmZpZwogCi0tIAoyLjQ3LjEKCg==

--===============1309379021571076600==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/alsa-lib/alsa-conf: PV changed from "1.2.15.3" to "1.2.16.1"
packages/x86-64-v3-poky-linux/alsa-lib/alsa-conf: PKGV changed from 1.2.15.3 [default] to 1.2.16.1 [default]
packages/x86-64-v3-poky-linux/alsa-lib/alsa-lib-dbg: PV changed from "1.2.15.3" to "1.2.16.1"
packages/x86-64-v3-poky-linux/alsa-lib/alsa-lib-dbg: PKGSIZE changed from 4410376 to 4436128 (+1%)
packages/x86-64-v3-poky-linux/alsa-lib/alsa-lib-dbg: PKGV changed from 1.2.15.3 [default] to 1.2.16.1 [default]
packages/x86-64-v3-poky-linux/alsa-lib/alsa-lib-dev: PV changed from "1.2.15.3" to "1.2.16.1"
packages/x86-64-v3-poky-linux/alsa-lib/alsa-lib-dev: PKGSIZE changed from 506634 to 506701 (+0%)
packages/x86-64-v3-poky-linux/alsa-lib/alsa-lib-dev: PKGV changed from 1.2.15.3 [default] to 1.2.16.1 [default]
packages/x86-64-v3-poky-linux/alsa-lib/alsa-lib-doc: PV changed from "1.2.15.3" to "1.2.16.1"
packages/x86-64-v3-poky-linux/alsa-lib/alsa-lib-doc: PKGV changed from 1.2.15.3 [default] to 1.2.16.1 [default]
packages/x86-64-v3-poky-linux/alsa-lib/alsa-lib-locale: PV changed from "1.2.15.3" to "1.2.16.1"
packages/x86-64-v3-poky-linux/alsa-lib/alsa-lib-locale: PKGV changed from 1.2.15.3 [default] to 1.2.16.1 [default]
packages/x86-64-v3-poky-linux/alsa-lib/alsa-lib-src: PV changed from "1.2.15.3" to "1.2.16.1"
packages/x86-64-v3-poky-linux/alsa-lib/alsa-lib-src: PKGSIZE changed from 3601800 to 3621363 (+1%)
packages/x86-64-v3-poky-linux/alsa-lib/alsa-lib-src: FILELIST: directory renamed /usr/src/debug/alsa-lib/1.2.15.3/src/control -> /usr/src/debug/alsa-lib/1.2.16.1/src/control, directory renamed /usr/src/debug/alsa-lib/1.2.15.3/src/mixer -> /usr/src/debug/alsa-lib/1.2.16.1/src/mixer, directory renamed /usr/src/debug/alsa-lib/1.2.15.3/src/seq -> /usr/src/debug/alsa-lib/1.2.16.1/src/seq, directory renamed /usr/src/debug/alsa-lib/1.2.15.3/src/hwdep -> /usr/src/debug/alsa-lib/1.2.16.1/src/hwdep, directory renamed /usr/src/debug/alsa-lib/1.2.15.3/src/timer -> /usr/src/debug/alsa-lib/1.2.16.1/src/timer, directory renamed /usr/src/debug/alsa-lib/1.2.15.3/src/rawmidi -> /usr/src/debug/alsa-lib/1.2.16.1/src/rawmidi, directory renamed /usr/src/debug/alsa-lib/1.2.15.3/include/sound/uapi -> /usr/src/debug/alsa-lib/1.2.16.1/include/sound/uapi, directory renamed /usr/src/debug/alsa-lib/1.2.15.3/include -> /usr/src/debug/alsa-lib/1.2.16.1/include, directory renamed /usr/src/debug/alsa-lib/1.2.15.3/sr
 c -> /usr/src/debug/alsa-lib/1.2.16.1/src, directory renamed /usr/src/debug/alsa-lib/1.2.15.3/src/topology -> /usr/src/debug/alsa-lib/1.2.16.1/src/topology, directory renamed /usr/src/debug/alsa-lib/1.2.15.3/src/pcm -> /usr/src/debug/alsa-lib/1.2.16.1/src/pcm, directory renamed /usr/src/debug/alsa-lib/1.2.15.3/aserver -> /usr/src/debug/alsa-lib/1.2.16.1/aserver, removed "/usr/src/debug/alsa-lib/1.2.15.3/src/ucm/ucm_cond.c /usr/src/debug/alsa-lib/1.2.15.3/src/ucm/ucm_subs.c /usr/src/debug/alsa-lib/1.2.15.3/src/ucm/utils.c /usr/src/debug/alsa-lib/1.2.15.3/src/ucm/parser.c /usr/src/debug/alsa-lib/1.2.15.3/src/ucm/main.c /usr/src/debug/alsa-lib/1.2.15.3/src/ucm/ucm_include.c /usr/src/debug/alsa-lib/1.2.15.3/src/ucm/ucm_exec.c /usr/src/debug/alsa-lib/1.2.15.3/src/ucm/ucm_regex.c /usr/src/debug/alsa-lib/1.2.15.3/src/ucm/ucm_local.h", added "/usr/src/debug/alsa-lib/1.2.16.1/src/ucm/ucm_cond.c /usr/src/debug/alsa-lib/1.2.16.1/src/ucm/ucm_subs.c /usr/src/debug/alsa-lib/1.2.16.1/src/ucm/utils
 .c /usr/src/debug/alsa-lib/1.2.16.1/src/ucm/parser.c /usr/src/debug/alsa-lib/1.2.16.1/src/ucm/main.c /usr/src/debug/alsa-lib/1.2.16.1/src/ucm/ucm_include.c /usr/src/debug/alsa-lib/1.2.16.1/src/ucm/ucm_repeat.c /usr/src/debug/alsa-lib/1.2.16.1/src/ucm/ucm_exec.c /usr/src/debug/alsa-lib/1.2.16.1/src/ucm/ucm_regex.c /usr/src/debug/alsa-lib/1.2.16.1/src/ucm/ucm_local.h"
packages/x86-64-v3-poky-linux/alsa-lib/alsa-lib-src: PKGV changed from 1.2.15.3 [default] to 1.2.16.1 [default]
packages/x86-64-v3-poky-linux/alsa-lib/alsa-lib-staticdev: PV changed from "1.2.15.3" to "1.2.16.1"
packages/x86-64-v3-poky-linux/alsa-lib/alsa-lib-staticdev: PKGV changed from 1.2.15.3 [default] to 1.2.16.1 [default]
packages/x86-64-v3-poky-linux/alsa-lib/alsa-lib: PV changed from "1.2.15.3" to "1.2.16.1"
packages/x86-64-v3-poky-linux/alsa-lib/alsa-lib: PKGSIZE changed from 1215130 to 1227418 (+1%)
packages/x86-64-v3-poky-linux/alsa-lib/alsa-lib: PKGV changed from 1.2.15.3 [default] to 1.2.16.1 [default]
packages/x86-64-v3-poky-linux/alsa-lib/alsa-server: PV changed from "1.2.15.3" to "1.2.16.1"
packages/x86-64-v3-poky-linux/alsa-lib/alsa-server: PKGV changed from 1.2.15.3 [default] to 1.2.16.1 [default]
packages/x86-64-v3-poky-linux/alsa-lib: SRC_URI changed from "https://www.alsa-project.org/files/pub/lib/alsa-lib-1.2.15.3.tar.bz2 file://CVE-2026-25068.patch" to "https://www.alsa-project.org/files/pub/lib/alsa-lib-1.2.16.1.tar.bz2"
packages/x86-64-v3-poky-linux/alsa-lib: PV changed from "1.2.15.3" to "1.2.16.1"
packages/x86-64-v3-poky-linux/alsa-lib: PKGV changed from 1.2.15.3 [default] to 1.2.16.1 [default]
packages/x86-64-v3-poky-linux/alsa-lib/libatopology: PV changed from "1.2.15.3" to "1.2.16.1"
packages/x86-64-v3-poky-linux/alsa-lib/libatopology: PKGV changed from 1.2.15.3 [default] to 1.2.16.1 [default]

--===============1309379021571076600==--

