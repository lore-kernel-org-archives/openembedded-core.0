Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30023E9A047
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 18:42:00 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1415.1771440097149094134
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Feb 2026 10:41:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=euo+/tYL;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=mBJcc/l0;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019c720ef9f3-9dc752f6-8d21-4281-8c8f-a327e92979a2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1771440110;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=mapXDR70AecKUZPp39tgMw/No31FTTgFnqDjsKxaD54=;
	b=euo+/tYL3FdNi2PNgO/pklxYeakkaM5VBXl2mlwCXvYnCmI60oSS8Ry8HBAawDNt
	U4nnJWCokRiBamyxSAJ5HjNYgODjqYYPUuEaEzYQeMpmiHMpLAxbhEc1DGRDiA0zeqj
	LVdBQleh9iJjhdBkHjI9FKxxZpmqmxG2DIz6fo18=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1771440110;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=mapXDR70AecKUZPp39tgMw/No31FTTgFnqDjsKxaD54=;
	b=mBJcc/l0zJ6A3U73D4lE+hLpynZH7wogp6BZ9SX5kaAFoaB3JIS1IJmXBl9jjg3A
	w17b238pt/GKcP4RPr8L+ZQgu+hq7kk67iu8sDI4gIjT0dUslRuNtP9DFLwvO2VrzNr
	HJoTj91eNXJzgjMpB3LjxaTVrnH+UMv8D1ZcR13g=
Content-Type: multipart/mixed; boundary="===============3189449389955097480=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libxmlb: upgrading to 0.3.25 SUCCEEDED
Message-ID: <0101019c720ef9f3-9dc752f6-8d21-4281-8c8f-a327e92979a2-000000@us-west-2.amazonses.com>
Date: Wed, 18 Feb 2026 18:41:50 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.18-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 18:42:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231380

--===============3189449389955097480==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libxmlb* to *0.3.25* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libxmlb-upgrade-0.3.24-0.3.25.patch
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
From 95b11c8e643b1eff009823556b42ddeb94fda2cc Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 18 Feb 2026 15:13:40 +0000
Subject: [PATCH] libxmlb: upgrade 0.3.24 -> 0.3.25

---
 .../libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch | 6 +++---
 .../libxmlb/{libxmlb_0.3.24.bb => libxmlb_0.3.25.bb}        | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-gnome/libxmlb/{libxmlb_0.3.24.bb => libxmlb_0.3.25.bb} (93%)

diff --git a/meta/recipes-gnome/libxmlb/libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch b/meta/recipes-gnome/libxmlb/libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch
index 1c46f6fc1e..50de068ffa 100644
--- a/meta/recipes-gnome/libxmlb/libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch
+++ b/meta/recipes-gnome/libxmlb/libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch
@@ -1,4 +1,4 @@
-From 2dbc50d49e2048f7227c406931a69f747e0eb12c Mon Sep 17 00:00:00 2001
+From 08284357a10d7cfdc0945f5f0c4de385d27d3576 Mon Sep 17 00:00:00 2001
 From: Markus Volk <f_l_k@t-online.de>
 Date: Sat, 16 Sep 2023 14:02:57 +0200
 Subject: [PATCH] xb-self-test.c: hardcode G_TEST_SRCDIR
@@ -18,10 +18,10 @@ Signed-off-by: Markus Volk <f_l_k@t-online.de>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/xb-self-test.c b/src/xb-self-test.c
-index 76b2e12..c68c13a 100644
+index 681fca8..3b14656 100644
 --- a/src/xb-self-test.c
 +++ b/src/xb-self-test.c
-@@ -2912,7 +2912,7 @@ xb_speed_func(void)
+@@ -2918,7 +2918,7 @@ xb_speed_func(void)
  int
  main(int argc, char **argv)
  {
diff --git a/meta/recipes-gnome/libxmlb/libxmlb_0.3.24.bb b/meta/recipes-gnome/libxmlb/libxmlb_0.3.25.bb
similarity index 93%
rename from meta/recipes-gnome/libxmlb/libxmlb_0.3.24.bb
rename to meta/recipes-gnome/libxmlb/libxmlb_0.3.25.bb
index 24eb62c98c..8687436052 100644
--- a/meta/recipes-gnome/libxmlb/libxmlb_0.3.24.bb
+++ b/meta/recipes-gnome/libxmlb/libxmlb_0.3.25.bb
@@ -8,7 +8,7 @@ SRC_URI = " \
 	file://0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch \
 	file://run-ptest \
 "
-SRCREV = "d004cca465e5c5af3ce02c02a15978ff02b510c3"
+SRCREV = "b31dec072f4428123db3866c18bf32bc5db04d35"
 
 DEPENDS = "glib-2.0 xz zstd"
 
-- 
2.47.1


--===============3189449389955097480==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libxmlb-upgrade-0.3.24-0.3.25.patch"

RnJvbSA5NWIxMWM4ZTY0M2IxZWZmMDA5ODIzNTU2YjQyZGRlYjk0ZmRhMmNjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTggRmViIDIwMjYgMTU6MTM6NDAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJ4bWxiOiB1cGdyYWRlIDAuMy4yNCAtPiAwLjMuMjUKCi0tLQogLi4uL2xpYnhtbGIvMDAwMS14
Yi1zZWxmdGVzdC5jLWhhcmRjb2RlLUdfVEVTVF9TUkNESVIucGF0Y2ggfCA2ICsrKy0tLQogLi4u
L2xpYnhtbGIve2xpYnhtbGJfMC4zLjI0LmJiID0+IGxpYnhtbGJfMC4zLjI1LmJifSAgICAgICAg
fCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMtZ25vbWUvbGlieG1sYi97bGlieG1sYl8wLjMuMjQuYmIgPT4g
bGlieG1sYl8wLjMuMjUuYmJ9ICg5MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdub21l
L2xpYnhtbGIvbGlieG1sYi8wMDAxLXhiLXNlbGZ0ZXN0LmMtaGFyZGNvZGUtR19URVNUX1NSQ0RJ
Ui5wYXRjaCBiL21ldGEvcmVjaXBlcy1nbm9tZS9saWJ4bWxiL2xpYnhtbGIvMDAwMS14Yi1zZWxm
dGVzdC5jLWhhcmRjb2RlLUdfVEVTVF9TUkNESVIucGF0Y2gKaW5kZXggMWM0NmY2ZmMxZS4uNTBk
ZTA2OGZmYSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdub21lL2xpYnhtbGIvbGlieG1sYi8w
MDAxLXhiLXNlbGZ0ZXN0LmMtaGFyZGNvZGUtR19URVNUX1NSQ0RJUi5wYXRjaAorKysgYi9tZXRh
L3JlY2lwZXMtZ25vbWUvbGlieG1sYi9saWJ4bWxiLzAwMDEteGItc2VsZnRlc3QuYy1oYXJkY29k
ZS1HX1RFU1RfU1JDRElSLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAyZGJjNTBkNDllMjA0
OGY3MjI3YzQwNjkzMWE2OWY3NDdlMGViMTJjIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJv
bSAwODI4NDM1N2ExMGQ3Y2ZkYzA5NDVmNWYwYzRkZTM4NWQyN2QzNTc2IE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQogRnJvbTogTWFya3VzIFZvbGsgPGZfbF9rQHQtb25saW5lLmRlPgogRGF0ZTog
U2F0LCAxNiBTZXAgMjAyMyAxNDowMjo1NyArMDIwMAogU3ViamVjdDogW1BBVENIXSB4Yi1zZWxm
LXRlc3QuYzogaGFyZGNvZGUgR19URVNUX1NSQ0RJUgpAQCAtMTgsMTAgKzE4LDEwIEBAIFNpZ25l
ZC1vZmYtYnk6IE1hcmt1cyBWb2xrIDxmX2xfa0B0LW9ubGluZS5kZT4KICAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL3NyYy94Yi1z
ZWxmLXRlc3QuYyBiL3NyYy94Yi1zZWxmLXRlc3QuYwotaW5kZXggNzZiMmUxMi4uYzY4YzEzYSAx
MDA2NDQKK2luZGV4IDY4MWZjYTguLjNiMTQ2NTYgMTAwNjQ0CiAtLS0gYS9zcmMveGItc2VsZi10
ZXN0LmMKICsrKyBiL3NyYy94Yi1zZWxmLXRlc3QuYwotQEAgLTI5MTIsNyArMjkxMiw3IEBAIHhi
X3NwZWVkX2Z1bmModm9pZCkKK0BAIC0yOTE4LDcgKzI5MTgsNyBAQCB4Yl9zcGVlZF9mdW5jKHZv
aWQpCiAgaW50CiAgbWFpbihpbnQgYXJnYywgY2hhciAqKmFyZ3YpCiAgewpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWdub21lL2xpYnhtbGIvbGlieG1sYl8wLjMuMjQuYmIgYi9tZXRhL3JlY2lw
ZXMtZ25vbWUvbGlieG1sYi9saWJ4bWxiXzAuMy4yNS5iYgpzaW1pbGFyaXR5IGluZGV4IDkzJQpy
ZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ25vbWUvbGlieG1sYi9saWJ4bWxiXzAuMy4yNC5iYgpy
ZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdub21lL2xpYnhtbGIvbGlieG1sYl8wLjMuMjUuYmIKaW5k
ZXggMjRlYjYyYzk4Yy4uODY4NzQzNjA1MiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdub21l
L2xpYnhtbGIvbGlieG1sYl8wLjMuMjQuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdub21lL2xpYnht
bGIvbGlieG1sYl8wLjMuMjUuYmIKQEAgLTgsNyArOCw3IEBAIFNSQ19VUkkgPSAiIFwKIAlmaWxl
Oi8vMDAwMS14Yi1zZWxmdGVzdC5jLWhhcmRjb2RlLUdfVEVTVF9TUkNESVIucGF0Y2ggXAogCWZp
bGU6Ly9ydW4tcHRlc3QgXAogIgotU1JDUkVWID0gImQwMDRjY2E0NjVlNWM1YWYzY2UwMmMwMmEx
NTk3OGZmMDJiNTEwYzMiCitTUkNSRVYgPSAiYjMxZGVjMDcyZjQ0MjgxMjNkYjM4NjZjMThiZjMy
YmM1ZGIwNGQzNSIKIAogREVQRU5EUyA9ICJnbGliLTIuMCB4eiB6c3RkIgogCi0tIAoyLjQ3LjEK
Cg==

--===============3189449389955097480==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libxmlb: PV changed from "0.3.24" to "0.3.25"
packages/x86-64-v3-poky-linux/libxmlb: PKGV changed from 0.3.24 [default] to 0.3.25 [default]
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-bin: PV changed from "0.3.24" to "0.3.25"
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-bin: PKGV changed from 0.3.24 [default] to 0.3.25 [default]
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-dbg: PV changed from "0.3.24" to "0.3.25"
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-dbg: PKGV changed from 0.3.24 [default] to 0.3.25 [default]
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-dbg: PKGSIZE changed from 1830704 to 1831696 (+0%)
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-dev: PV changed from "0.3.24" to "0.3.25"
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-dev: PKGV changed from 0.3.24 [default] to 0.3.25 [default]
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-doc: PV changed from "0.3.24" to "0.3.25"
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-doc: PKGV changed from 0.3.24 [default] to 0.3.25 [default]
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-locale: PV changed from "0.3.24" to "0.3.25"
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-locale: PKGV changed from 0.3.24 [default] to 0.3.25 [default]
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-ptest: PV changed from "0.3.24" to "0.3.25"
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-ptest: PKGV changed from 0.3.24 [default] to 0.3.25 [default]
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-src: PV changed from "0.3.24" to "0.3.25"
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-src: PKGV changed from 0.3.24 [default] to 0.3.25 [default]
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-src: PKGSIZE changed from 518337 to 519007 (+0%)
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-src: FILELIST: directory renamed /usr/src/debug/libxmlb/0.3.24/src -> /usr/src/debug/libxmlb/0.3.25/src
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-staticdev: PV changed from "0.3.24" to "0.3.25"
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-staticdev: PKGV changed from 0.3.24 [default] to 0.3.25 [default]
packages/x86-64-v3-poky-linux/libxmlb/libxmlb: PV changed from "0.3.24" to "0.3.25"
packages/x86-64-v3-poky-linux/libxmlb/libxmlb: PKGV changed from 0.3.24 [default] to 0.3.25 [default]
packages/x86-64-v3-poky-linux/libxmlb/libxmlb: PKGSIZE changed from 195404 to 199500 (+2%)

--===============3189449389955097480==--

