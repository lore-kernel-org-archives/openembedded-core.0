Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE126F531E8
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 14:04:36 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19814.1776261874154191723
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 07:04:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=R8bzoFJx;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=kunmwGVt;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019d91753eca-a218ba6a-97d3-4cb0-87f2-7f29fec51918-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1776261873;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=dIF19IQ9mlklb/UUoPxjdCUZ/NI7EIjVUD2n5potXCQ=;
	b=R8bzoFJxDbFH27zTiR+WWSqoYHVi3koWB/we/74jw2/aApbHAJwgpa90twClvQx/
	0YMRN9JJdHVC6Fpvw2nVOEsqgY5kH8+gn/wK+c6ftSG+cfVpTxWdb/Nd4rwwwpHLEx3
	EGDbuOFWwSVnDF39E6XzueAf5d7a2iDp8n+8291Y=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1776261873;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=dIF19IQ9mlklb/UUoPxjdCUZ/NI7EIjVUD2n5potXCQ=;
	b=kunmwGVtQaw8esBZyNGmKNXTHKlaqeNP+tRfm/q/Bua/gSaLoon/REKiwDb/XXPz
	xOevu09SuPG4Kh5EV44kTOVFrUVEF1AfjXrWh+HcHpBdS+wKYCtpjcBpzj4TvgsY0sr
	0IZ4Ih2gVcTQDVkXVK0vGCrrcKH8bz08xKrb+YIA=
Content-Type: multipart/mixed; boundary="===============5983725530072124324=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] resolvconf: upgrading to 1.95 SUCCEEDED
Message-ID: <0101019d91753eca-a218ba6a-97d3-4cb0-87f2-7f29fec51918-000000@us-west-2.amazonses.com>
Date: Wed, 15 Apr 2026 14:04:33 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 14:04:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235219

--===============5983725530072124324==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *resolvconf* to *1.95* has Succeeded.

Next steps:
    - apply the patch: git am 0001-resolvconf-upgrade-1.94-1.95.patch
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
From 9dcdcf66ef2ad7cacae38f56763bbfcadf497690 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Apr 2026 06:51:04 +0000
Subject: [PATCH] resolvconf: upgrade 1.94 -> 1.95

---
 .../0001-avoid-using-m-option-for-readlink.patch           | 7 ++-----
 .../resolvconf/{resolvconf_1.94.bb => resolvconf_1.95.bb}  | 2 +-
 2 files changed, 3 insertions(+), 6 deletions(-)
 rename meta/recipes-connectivity/resolvconf/{resolvconf_1.94.bb => resolvconf_1.95.bb} (98%)

diff --git a/meta/recipes-connectivity/resolvconf/resolvconf/0001-avoid-using-m-option-for-readlink.patch b/meta/recipes-connectivity/resolvconf/resolvconf/0001-avoid-using-m-option-for-readlink.patch
index ab32f26754..0f5dd02db7 100644
--- a/meta/recipes-connectivity/resolvconf/resolvconf/0001-avoid-using-m-option-for-readlink.patch
+++ b/meta/recipes-connectivity/resolvconf/resolvconf/0001-avoid-using-m-option-for-readlink.patch
@@ -1,4 +1,4 @@
-From 6bf2bb136a0b3961339369bc08e58b661fba0edb Mon Sep 17 00:00:00 2001
+From e7eab605a553ce5082fba5335e28cdb5a8435527 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Thu, 17 Nov 2022 17:26:30 +0800
 Subject: [PATCH] avoid using -m option for readlink
@@ -20,7 +20,7 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/etc/resolvconf/update.d/libc b/etc/resolvconf/update.d/libc
-index 1c4f6bc..f75d22c 100755
+index a0c15d4..6339544 100755
 --- a/etc/resolvconf/update.d/libc
 +++ b/etc/resolvconf/update.d/libc
 @@ -57,7 +57,7 @@ fi
@@ -32,6 +32,3 @@ index 1c4f6bc..f75d22c 100755
  }
  
  if ! resolv_conf_is_symlinked_to_dynamic_file ; then
--- 
-2.17.1
-
diff --git a/meta/recipes-connectivity/resolvconf/resolvconf_1.94.bb b/meta/recipes-connectivity/resolvconf/resolvconf_1.95.bb
similarity index 98%
rename from meta/recipes-connectivity/resolvconf/resolvconf_1.94.bb
rename to meta/recipes-connectivity/resolvconf/resolvconf_1.95.bb
index b2c85f9593..1ef29f9c2e 100644
--- a/meta/recipes-connectivity/resolvconf/resolvconf_1.94.bb
+++ b/meta/recipes-connectivity/resolvconf/resolvconf_1.95.bb
@@ -15,7 +15,7 @@ SRC_URI = "git://salsa.debian.org/debian/resolvconf.git;protocol=https;branch=un
            file://0001-avoid-using-m-option-for-readlink.patch \
            "
 
-SRCREV = "505c258d1efb287ffdbf132531a86437d2bf0513"
+SRCREV = "64fa1448880edd272540e0347aa25f87ecd14dac"
 
 # the package is taken from snapshots.debian.org; that source is static and goes stale
 # so we check the latest upstream from a directory that does get updated
-- 
2.47.1


--===============5983725530072124324==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/resolvconf/resolvconf-doc: FILELIST: directory renamed /usr/share/doc/resolvconf-1.94 -> /usr/share/doc/resolvconf-1.95

--===============5983725530072124324==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-resolvconf-upgrade-1.94-1.95.patch"

RnJvbSA5ZGNkY2Y2NmVmMmFkN2NhY2FlMzhmNTY3NjNiYmZjYWRmNDk3NjkwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgQXByIDIwMjYgMDY6NTE6MDQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBy
ZXNvbHZjb25mOiB1cGdyYWRlIDEuOTQgLT4gMS45NQoKLS0tCiAuLi4vMDAwMS1hdm9pZC11c2lu
Zy1tLW9wdGlvbi1mb3ItcmVhZGxpbmsucGF0Y2ggICAgICAgICAgIHwgNyArKy0tLS0tCiAuLi4v
cmVzb2x2Y29uZi97cmVzb2x2Y29uZl8xLjk0LmJiID0+IHJlc29sdmNvbmZfMS45NS5iYn0gIHwg
MiArLQogMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9yZXNvbHZjb25mL3tyZXNvbHZjb25mXzEu
OTQuYmIgPT4gcmVzb2x2Y29uZl8xLjk1LmJifSAoOTglKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1jb25uZWN0aXZpdHkvcmVzb2x2Y29uZi9yZXNvbHZjb25mLzAwMDEtYXZvaWQtdXNpbmct
bS1vcHRpb24tZm9yLXJlYWRsaW5rLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9y
ZXNvbHZjb25mL3Jlc29sdmNvbmYvMDAwMS1hdm9pZC11c2luZy1tLW9wdGlvbi1mb3ItcmVhZGxp
bmsucGF0Y2gKaW5kZXggYWIzMmYyNjc1NC4uMGY1ZGQwMmRiNyAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWNvbm5lY3Rpdml0eS9yZXNvbHZjb25mL3Jlc29sdmNvbmYvMDAwMS1hdm9pZC11c2lu
Zy1tLW9wdGlvbi1mb3ItcmVhZGxpbmsucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rp
dml0eS9yZXNvbHZjb25mL3Jlc29sdmNvbmYvMDAwMS1hdm9pZC11c2luZy1tLW9wdGlvbi1mb3It
cmVhZGxpbmsucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDZiZjJiYjEzNmEwYjM5NjEzMzkz
NjliYzA4ZTU4YjY2MWZiYTBlZGIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGU3ZWFi
NjA1YTU1M2NlNTA4MmZiYTUzMzVlMjhjZGI1YTg0MzU1MjcgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCiBGcm9tOiBDaGVuIFFpIDxRaS5DaGVuQHdpbmRyaXZlci5jb20+CiBEYXRlOiBUaHUsIDE3
IE5vdiAyMDIyIDE3OjI2OjMwICswODAwCiBTdWJqZWN0OiBbUEFUQ0hdIGF2b2lkIHVzaW5nIC1t
IG9wdGlvbiBmb3IgcmVhZGxpbmsKQEAgLTIwLDcgKzIwLDcgQEAgU2lnbmVkLW9mZi1ieTogQ2hl
biBRaSA8UWkuQ2hlbkB3aW5kcml2ZXIuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvZXRjL3Jlc29sdmNvbmYvdXBkYXRl
LmQvbGliYyBiL2V0Yy9yZXNvbHZjb25mL3VwZGF0ZS5kL2xpYmMKLWluZGV4IDFjNGY2YmMuLmY3
NWQyMmMgMTAwNzU1CitpbmRleCBhMGMxNWQ0Li42MzM5NTQ0IDEwMDc1NQogLS0tIGEvZXRjL3Jl
c29sdmNvbmYvdXBkYXRlLmQvbGliYwogKysrIGIvZXRjL3Jlc29sdmNvbmYvdXBkYXRlLmQvbGli
YwogQEAgLTU3LDcgKzU3LDcgQEAgZmkKQEAgLTMyLDYgKzMyLDMgQEAgaW5kZXggMWM0ZjZiYy4u
Zjc1ZDIyYyAxMDA3NTUKICB9CiAgCiAgaWYgISByZXNvbHZfY29uZl9pc19zeW1saW5rZWRfdG9f
ZHluYW1pY19maWxlIDsgdGhlbgotLS0gCi0yLjE3LjEKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWNvbm5lY3Rpdml0eS9yZXNvbHZjb25mL3Jlc29sdmNvbmZfMS45NC5iYiBiL21ldGEvcmVj
aXBlcy1jb25uZWN0aXZpdHkvcmVzb2x2Y29uZi9yZXNvbHZjb25mXzEuOTUuYmIKc2ltaWxhcml0
eSBpbmRleCA5OCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9yZXNvbHZj
b25mL3Jlc29sdmNvbmZfMS45NC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0
eS9yZXNvbHZjb25mL3Jlc29sdmNvbmZfMS45NS5iYgppbmRleCBiMmM4NWY5NTkzLi4xZWYyOWY5
YzJlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L3Jlc29sdmNvbmYvcmVz
b2x2Y29uZl8xLjk0LmJiCisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvcmVzb2x2Y29u
Zi9yZXNvbHZjb25mXzEuOTUuYmIKQEAgLTE1LDcgKzE1LDcgQEAgU1JDX1VSSSA9ICJnaXQ6Ly9z
YWxzYS5kZWJpYW4ub3JnL2RlYmlhbi9yZXNvbHZjb25mLmdpdDtwcm90b2NvbD1odHRwczticmFu
Y2g9dW4KICAgICAgICAgICAgZmlsZTovLzAwMDEtYXZvaWQtdXNpbmctbS1vcHRpb24tZm9yLXJl
YWRsaW5rLnBhdGNoIFwKICAgICAgICAgICAgIgogCi1TUkNSRVYgPSAiNTA1YzI1OGQxZWZiMjg3
ZmZkYmYxMzI1MzFhODY0MzdkMmJmMDUxMyIKK1NSQ1JFViA9ICI2NGZhMTQ0ODg4MGVkZDI3MjU0
MGUwMzQ3YWEyNWY4N2VjZDE0ZGFjIgogCiAjIHRoZSBwYWNrYWdlIGlzIHRha2VuIGZyb20gc25h
cHNob3RzLmRlYmlhbi5vcmc7IHRoYXQgc291cmNlIGlzIHN0YXRpYyBhbmQgZ29lcyBzdGFsZQog
IyBzbyB3ZSBjaGVjayB0aGUgbGF0ZXN0IHVwc3RyZWFtIGZyb20gYSBkaXJlY3RvcnkgdGhhdCBk
b2VzIGdldCB1cGRhdGVkCi0tIAoyLjQ3LjEKCg==

--===============5983725530072124324==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/resolvconf: PV changed from "1.94" to "1.95"
packages/x86-64-v3-poky-linux/resolvconf: PKGV changed from 1.94 [default] to 1.95 [default]
packages/x86-64-v3-poky-linux/resolvconf/resolvconf-dbg: PV changed from "1.94" to "1.95"
packages/x86-64-v3-poky-linux/resolvconf/resolvconf-dbg: PKGV changed from 1.94 [default] to 1.95 [default]
packages/x86-64-v3-poky-linux/resolvconf/resolvconf-dev: PV changed from "1.94" to "1.95"
packages/x86-64-v3-poky-linux/resolvconf/resolvconf-dev: PKGV changed from 1.94 [default] to 1.95 [default]
packages/x86-64-v3-poky-linux/resolvconf/resolvconf-doc: PV changed from "1.94" to "1.95"
packages/x86-64-v3-poky-linux/resolvconf/resolvconf-doc: PKGV changed from 1.94 [default] to 1.95 [default]
packages/x86-64-v3-poky-linux/resolvconf/resolvconf-doc: FILELIST: directory renamed /usr/share/doc/resolvconf-1.94 -> /usr/share/doc/resolvconf-1.95
packages/x86-64-v3-poky-linux/resolvconf/resolvconf-locale: PV changed from "1.94" to "1.95"
packages/x86-64-v3-poky-linux/resolvconf/resolvconf-locale: PKGV changed from 1.94 [default] to 1.95 [default]
packages/x86-64-v3-poky-linux/resolvconf/resolvconf-src: PV changed from "1.94" to "1.95"
packages/x86-64-v3-poky-linux/resolvconf/resolvconf-src: PKGV changed from 1.94 [default] to 1.95 [default]
packages/x86-64-v3-poky-linux/resolvconf/resolvconf-staticdev: PV changed from "1.94" to "1.95"
packages/x86-64-v3-poky-linux/resolvconf/resolvconf-staticdev: PKGV changed from 1.94 [default] to 1.95 [default]
packages/x86-64-v3-poky-linux/resolvconf/resolvconf: PV changed from "1.94" to "1.95"
packages/x86-64-v3-poky-linux/resolvconf/resolvconf: PKGV changed from 1.94 [default] to 1.95 [default]
packages/x86-64-v3-poky-linux/resolvconf/resolvconf: PKGSIZE changed from 15979 to 16094 (+1%)

--===============5983725530072124324==--

