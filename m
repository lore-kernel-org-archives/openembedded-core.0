Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C183CD98DF
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 16:32:07 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50437.1781195520236972115
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 09:32:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=nbqjvACE;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=le9jDxjs;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019eb786b6a5-d4d6d2d1-c988-4ecf-b336-b39f527e2ba7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781195519;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=B2lkA5xiElW3AtdyIbvWjg7lCsUfPia3fb7mBispN74=;
	b=nbqjvACE7ZdfXhri/wIWt29TZgaCKYyQsNBsguMeDqVTHtnL32OHHyOZfNpLTw1E
	m/KfCHlNGFRAq8PWuCAAXPPX+pLWByCUHYoiN7g4jppCOi/UYwVsnEti75bSg3sBYtE
	cYH/H1Hv0JRuma0NB2E3MQ4nAfyARdHzSkrDi47s=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781195519;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=B2lkA5xiElW3AtdyIbvWjg7lCsUfPia3fb7mBispN74=;
	b=le9jDxjsQiFgCnu1FGtdmZdljbMn/ixlLxgEo/e0SenbZZ2j6XT+VXIQ6aRdSFSf
	hj9tElPXtcnt/xIS7kyJP8efwxJQgPp8yQlnGIsZjWJU9KHY+5xubLvAaJ1TbSc/Y01
	SHJhZu/ODiyAPa9CyzCQEPWiqMe1duM8IbQ0clOI=
Content-Type: multipart/mixed; boundary="===============3005815576056576233=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] alsa-lib: upgrading to 1.2.16 SUCCEEDED
Message-ID: <0101019eb786b6a5-d4d6d2d1-c988-4ecf-b336-b39f527e2ba7-000000@us-west-2.amazonses.com>
Date: Thu, 11 Jun 2026 16:31:59 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.11-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 16:32:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238554

--===============3005815576056576233==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *alsa-lib* to *1.2.16* has Succeeded.

Next steps:
    - apply the patch: git am 0001-alsa-lib-upgrade-1.2.15.3-1.2.16.patch
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
From 352b73d08dd87ce9aa0db8eeb82db5f3bd24bf0e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 11 Jun 2026 13:34:59 +0000
Subject: [PATCH] alsa-lib: upgrade 1.2.15.3 -> 1.2.16

---
 .../alsa/alsa-lib/CVE-2026-25068.patch        | 34 -------------------
 ...lsa-lib_1.2.15.3.bb => alsa-lib_1.2.16.bb} |  3 +-
 2 files changed, 1 insertion(+), 36 deletions(-)
 delete mode 100644 meta/recipes-multimedia/alsa/alsa-lib/CVE-2026-25068.patch
 rename meta/recipes-multimedia/alsa/{alsa-lib_1.2.15.3.bb => alsa-lib_1.2.16.bb} (91%)

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
diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.2.16.bb
similarity index 91%
rename from meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb
rename to meta/recipes-multimedia/alsa/alsa-lib_1.2.16.bb
index 1ebb356925..25b2dcde17 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.2.16.bb
@@ -10,8 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7 \
                     "
 
 SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2"
-SRC_URI += "file://CVE-2026-25068.patch"
-SRC_URI[sha256sum] = "7b079d614d582cade7ab8db2364e65271d0877a37df8757ac4ac0c8970be861e"
+SRC_URI[sha256sum] = "122b1e3166d55fe19bcde656535d7a36f2ab10e66c72c6ad2f43f20ffded0a96"
 
 inherit autotools pkgconfig
 
-- 
2.47.1


--===============3005815576056576233==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/alsa-lib/alsa-conf: PV changed from "1.2.15.3" to "1.2.16"
packages/x86-64-v3-poky-linux/alsa-lib/alsa-conf: PKGV changed from 1.2.15.3 [default] to 1.2.16 [default]
packages/x86-64-v3-poky-linux/alsa-lib/alsa-lib-dbg: PKGSIZE changed from 4410376 to 4435368 (+1%)
packages/x86-64-v3-poky-linux/alsa-lib/alsa-lib-dbg: PV changed from "1.2.15.3" to "1.2.16"
packages/x86-64-v3-poky-linux/alsa-lib/alsa-lib-dbg: PKGV changed from 1.2.15.3 [default] to 1.2.16 [default]
packages/x86-64-v3-poky-linux/alsa-lib/alsa-lib-dev: PKGSIZE changed from 506634 to 506693 (+0%)
packages/x86-64-v3-poky-linux/alsa-lib/alsa-lib-dev: PV changed from "1.2.15.3" to "1.2.16"
packages/x86-64-v3-poky-linux/alsa-lib/alsa-lib-dev: PKGV changed from 1.2.15.3 [default] to 1.2.16 [default]
packages/x86-64-v3-poky-linux/alsa-lib/alsa-lib-doc: PV changed from "1.2.15.3" to "1.2.16"
packages/x86-64-v3-poky-linux/alsa-lib/alsa-lib-doc: PKGV changed from 1.2.15.3 [default] to 1.2.16 [default]
packages/x86-64-v3-poky-linux/alsa-lib/alsa-lib-locale: PV changed from "1.2.15.3" to "1.2.16"
packages/x86-64-v3-poky-linux/alsa-lib/alsa-lib-locale: PKGV changed from 1.2.15.3 [default] to 1.2.16 [default]
packages/x86-64-v3-poky-linux/alsa-lib/alsa-lib-src: PKGSIZE changed from 3601800 to 3621019 (+1%)
packages/x86-64-v3-poky-linux/alsa-lib/alsa-lib-src: PV changed from "1.2.15.3" to "1.2.16"
packages/x86-64-v3-poky-linux/alsa-lib/alsa-lib-src: FILELIST: directory renamed /usr/src/debug/alsa-lib/1.2.15.3/src/control -> /usr/src/debug/alsa-lib/1.2.16/src/control, directory renamed /usr/src/debug/alsa-lib/1.2.15.3/src/topology -> /usr/src/debug/alsa-lib/1.2.16/src/topology, directory renamed /usr/src/debug/alsa-lib/1.2.15.3/aserver -> /usr/src/debug/alsa-lib/1.2.16/aserver, directory renamed /usr/src/debug/alsa-lib/1.2.15.3/include -> /usr/src/debug/alsa-lib/1.2.16/include, directory renamed /usr/src/debug/alsa-lib/1.2.15.3/src -> /usr/src/debug/alsa-lib/1.2.16/src, directory renamed /usr/src/debug/alsa-lib/1.2.15.3/src/mixer -> /usr/src/debug/alsa-lib/1.2.16/src/mixer, directory renamed /usr/src/debug/alsa-lib/1.2.15.3/src/timer -> /usr/src/debug/alsa-lib/1.2.16/src/timer, directory renamed /usr/src/debug/alsa-lib/1.2.15.3/src/hwdep -> /usr/src/debug/alsa-lib/1.2.16/src/hwdep, directory renamed /usr/src/debug/alsa-lib/1.2.15.3/src/pcm -> /usr/src/debug/alsa-lib/1.2.16/src/
 pcm, directory renamed /usr/src/debug/alsa-lib/1.2.15.3/src/seq -> /usr/src/debug/alsa-lib/1.2.16/src/seq, directory renamed /usr/src/debug/alsa-lib/1.2.15.3/src/rawmidi -> /usr/src/debug/alsa-lib/1.2.16/src/rawmidi, directory renamed /usr/src/debug/alsa-lib/1.2.15.3/include/sound/uapi -> /usr/src/debug/alsa-lib/1.2.16/include/sound/uapi, removed "/usr/src/debug/alsa-lib/1.2.15.3/src/ucm/ucm_regex.c /usr/src/debug/alsa-lib/1.2.15.3/src/ucm/ucm_include.c /usr/src/debug/alsa-lib/1.2.15.3/src/ucm/utils.c /usr/src/debug/alsa-lib/1.2.15.3/src/ucm/ucm_subs.c /usr/src/debug/alsa-lib/1.2.15.3/src/ucm/ucm_cond.c /usr/src/debug/alsa-lib/1.2.15.3/src/ucm/ucm_local.h /usr/src/debug/alsa-lib/1.2.15.3/src/ucm/ucm_exec.c /usr/src/debug/alsa-lib/1.2.15.3/src/ucm/main.c /usr/src/debug/alsa-lib/1.2.15.3/src/ucm/parser.c", added "/usr/src/debug/alsa-lib/1.2.16/src/ucm/ucm_include.c /usr/src/debug/alsa-lib/1.2.16/src/ucm/main.c /usr/src/debug/alsa-lib/1.2.16/src/ucm/ucm_local.h /usr/src/debug/alsa-lib/
 1.2.16/src/ucm/utils.c /usr/src/debug/alsa-lib/1.2.16/src/ucm/ucm_subs.c /usr/src/debug/alsa-lib/1.2.16/src/ucm/ucm_repeat.c /usr/src/debug/alsa-lib/1.2.16/src/ucm/ucm_exec.c /usr/src/debug/alsa-lib/1.2.16/src/ucm/parser.c /usr/src/debug/alsa-lib/1.2.16/src/ucm/ucm_regex.c /usr/src/debug/alsa-lib/1.2.16/src/ucm/ucm_cond.c"
packages/x86-64-v3-poky-linux/alsa-lib/alsa-lib-src: PKGV changed from 1.2.15.3 [default] to 1.2.16 [default]
packages/x86-64-v3-poky-linux/alsa-lib/alsa-lib-staticdev: PV changed from "1.2.15.3" to "1.2.16"
packages/x86-64-v3-poky-linux/alsa-lib/alsa-lib-staticdev: PKGV changed from 1.2.15.3 [default] to 1.2.16 [default]
packages/x86-64-v3-poky-linux/alsa-lib/alsa-lib: PKGSIZE changed from 1215130 to 1227418 (+1%)
packages/x86-64-v3-poky-linux/alsa-lib/alsa-lib: PV changed from "1.2.15.3" to "1.2.16"
packages/x86-64-v3-poky-linux/alsa-lib/alsa-lib: PKGV changed from 1.2.15.3 [default] to 1.2.16 [default]
packages/x86-64-v3-poky-linux/alsa-lib/alsa-server: PV changed from "1.2.15.3" to "1.2.16"
packages/x86-64-v3-poky-linux/alsa-lib/alsa-server: PKGV changed from 1.2.15.3 [default] to 1.2.16 [default]
packages/x86-64-v3-poky-linux/alsa-lib: PV changed from "1.2.15.3" to "1.2.16"
packages/x86-64-v3-poky-linux/alsa-lib: SRC_URI changed from "https://www.alsa-project.org/files/pub/lib/alsa-lib-1.2.15.3.tar.bz2 file://CVE-2026-25068.patch" to "https://www.alsa-project.org/files/pub/lib/alsa-lib-1.2.16.tar.bz2"
packages/x86-64-v3-poky-linux/alsa-lib: PKGV changed from 1.2.15.3 [default] to 1.2.16 [default]
packages/x86-64-v3-poky-linux/alsa-lib/libatopology: PV changed from "1.2.15.3" to "1.2.16"
packages/x86-64-v3-poky-linux/alsa-lib/libatopology: PKGV changed from 1.2.15.3 [default] to 1.2.16 [default]

--===============3005815576056576233==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-alsa-lib-upgrade-1.2.15.3-1.2.16.patch"

RnJvbSAzNTJiNzNkMDhkZDg3Y2U5YWEwZGI4ZWViODJkYjVmM2JkMjRiZjBlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTEgSnVuIDIwMjYgMTM6MzQ6NTkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBh
bHNhLWxpYjogdXBncmFkZSAxLjIuMTUuMyAtPiAxLjIuMTYKCi0tLQogLi4uL2Fsc2EvYWxzYS1s
aWIvQ1ZFLTIwMjYtMjUwNjgucGF0Y2ggICAgICAgIHwgMzQgLS0tLS0tLS0tLS0tLS0tLS0tLQog
Li4ubHNhLWxpYl8xLjIuMTUuMy5iYiA9PiBhbHNhLWxpYl8xLjIuMTYuYmJ9IHwgIDMgKy0KIDIg
ZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDM2IGRlbGV0aW9ucygtKQogZGVsZXRlIG1v
ZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2Fsc2EvYWxzYS1saWIvQ1ZFLTIwMjYt
MjUwNjgucGF0Y2gKIHJlbmFtZSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9hbHNhL3thbHNhLWxp
Yl8xLjIuMTUuMy5iYiA9PiBhbHNhLWxpYl8xLjIuMTYuYmJ9ICg5MSUpCgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvYWxzYS9hbHNhLWxpYi9DVkUtMjAyNi0yNTA2OC5wYXRj
aCBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2Fsc2EvYWxzYS1saWIvQ1ZFLTIwMjYtMjUwNjgu
cGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDliYjI0YzI0ZTIuLjAwMDAwMDAw
MDAKLS0tIGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvYWxzYS9hbHNhLWxpYi9DVkUtMjAyNi0y
NTA2OC5wYXRjaAorKysgL2Rldi9udWxsCkBAIC0xLDM0ICswLDAgQEAKLUZyb20gNWY3ZmUzMzAw
MmQyZDk4ZDg0ZjcyZTM4MWVjMmNjY2MwZDVkM2Q0MCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
LUZyb206IEphcm9zbGF2IEt5c2VsYSA8cGVyZXhAcGVyZXguY3o+Ci1EYXRlOiBUaHUsIDI5IEph
biAyMDI2IDE2OjUxOjA5ICswMTAwCi1TdWJqZWN0OiBbUEFUQ0hdIHRvcG9sb2d5OiBkZWNvZGVy
IC0gYWRkIGJvdW5kYXJ5IGNoZWNrIGZvciBjaGFubmVsIG1peGVyCi0gY291bnQKLQotTWFsaWNp
b3VzIGJpbmFyeSB0b3BvbG9neSBmaWxlIG1heSBjYXVzZSBoZWFwIGNvcnJ1cHRpb24uCi0KLUNW
RTogQ1ZFLTIwMjYtMjUwNjgKLQotU2lnbmVkLW9mZi1ieTogSmFyb3NsYXYgS3lzZWxhIDxwZXJl
eEBwZXJleC5jej4KLQotVXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9ydCBbaHR0cHM6Ly9naXRodWIu
Y29tL2Fsc2EtcHJvamVjdC9hbHNhLWxpYi9jb21taXQvNWY3ZmUzMzAwMmQyZDk4ZDg0ZjcyZTM4
MWVjMmNjY2MwZDVkM2Q0MF0KLVNpZ25lZC1vZmYtYnk6IFBldGVyIE1hcmtvIDxwZXRlci5tYXJr
b0BzaWVtZW5zLmNvbT4KLS0tLQotIHNyYy90b3BvbG9neS9jdGwuYyB8IDUgKysrKysKLSAxIGZp
bGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCi0KLWRpZmYgLS1naXQgYS9zcmMvdG9wb2xvZ3kv
Y3RsLmMgYi9zcmMvdG9wb2xvZ3kvY3RsLmMKLWluZGV4IGEwYzI0NTE4Li4zMjJjNDYxYyAxMDA2
NDQKLS0tLSBhL3NyYy90b3BvbG9neS9jdGwuYwotKysrIGIvc3JjL3RvcG9sb2d5L2N0bC5jCi1A
QCAtMTI1MCw2ICsxMjUwLDExIEBAIGludCB0cGxnX2RlY29kZV9jb250cm9sX21peGVyMShzbmRf
dHBsZ190ICp0cGxnLAotIAlpZiAobWMtPm51bV9jaGFubmVscyA+IDApIHsKLSAJCW1hcCA9IHRw
bGdfY2FsbG9jKGhlYXAsIHNpemVvZigqbWFwKSk7Ci0gCQltYXAtPm51bV9jaGFubmVscyA9IG1j
LT5udW1fY2hhbm5lbHM7Ci0rCQlpZiAobWFwLT5udW1fY2hhbm5lbHMgPiBTTkRfVFBMR19NQVhf
Q0hBTiB8fAotKwkJICAgIG1hcC0+bnVtX2NoYW5uZWxzID4gU05EX1NPQ19UUExHX01BWF9DSEFO
KSB7Ci0rCQkJc25kX2Vycm9yKFRPUE9MT0dZLCAibWl4ZXI6IHVuZXhwZWN0ZWQgY2hhbm5lbCBj
b3VudCAlZCIsIG1hcC0+bnVtX2NoYW5uZWxzKTsKLSsJCQlyZXR1cm4gLUVJTlZBTDsKLSsJCX0K
LSAJCWZvciAoaSA9IDA7IGkgPCBtYXAtPm51bV9jaGFubmVsczsgaSsrKSB7Ci0gCQkJbWFwLT5j
aGFubmVsW2ldLnJlZyA9IG1jLT5jaGFubmVsW2ldLnJlZzsKLSAJCQltYXAtPmNoYW5uZWxbaV0u
c2hpZnQgPSBtYy0+Y2hhbm5lbFtpXS5zaGlmdDsKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1t
dWx0aW1lZGlhL2Fsc2EvYWxzYS1saWJfMS4yLjE1LjMuYmIgYi9tZXRhL3JlY2lwZXMtbXVsdGlt
ZWRpYS9hbHNhL2Fsc2EtbGliXzEuMi4xNi5iYgpzaW1pbGFyaXR5IGluZGV4IDkxJQpyZW5hbWUg
ZnJvbSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9hbHNhL2Fsc2EtbGliXzEuMi4xNS4zLmJiCnJl
bmFtZSB0byBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9hbHNhL2Fsc2EtbGliXzEuMi4xNi5iYgpp
bmRleCAxZWJiMzU2OTI1Li4yNWIyZGNkZTE3IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtbXVs
dGltZWRpYS9hbHNhL2Fsc2EtbGliXzEuMi4xNS4zLmJiCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0
aW1lZGlhL2Fsc2EvYWxzYS1saWJfMS4yLjE2LmJiCkBAIC0xMCw4ICsxMCw3IEBAIExJQ19GSUxF
U19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PWE5MTY0NjdiOTEwNzZlNjMxZGQ4ZWRiNzQy
NDc2OWM3IFwKICAgICAgICAgICAgICAgICAgICAgIgogCiBTUkNfVVJJID0gImh0dHBzOi8vd3d3
LmFsc2EtcHJvamVjdC5vcmcvZmlsZXMvcHViL2xpYi8ke0JQfS50YXIuYnoyIgotU1JDX1VSSSAr
PSAiZmlsZTovL0NWRS0yMDI2LTI1MDY4LnBhdGNoIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjdi
MDc5ZDYxNGQ1ODJjYWRlN2FiOGRiMjM2NGU2NTI3MWQwODc3YTM3ZGY4NzU3YWM0YWMwYzg5NzBi
ZTg2MWUiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMTIyYjFlMzE2NmQ1NWZlMTliY2RlNjU2NTM1
ZDdhMzZmMmFiMTBlNjZjNzJjNmFkMmY0M2YyMGZmZGVkMGE5NiIKIAogaW5oZXJpdCBhdXRvdG9v
bHMgcGtnY29uZmlnCiAKLS0gCjIuNDcuMQoK

--===============3005815576056576233==--

