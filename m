Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96127C369A1
	for <webhook@archiver.kernel.org>; Sat, 15 Mar 2025 14:18:31 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.10328.1742048293317838247
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Mar 2025 07:18:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=SQDhcRxh;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=JNifZS+9;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101959a2bac06-abac3bbb-596d-49c9-bf39-4693af16c6ff-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1742048308;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=hdPhg/SNUYEAiepLL9VF3hrtOgY+r5NcelsMjVvSTqs=;
	b=SQDhcRxhCgWOZ04DF9eIsL08dCuZruslPNTD2Z4fWfj1MFzqKlDsD4eOk5iLXOD5
	nAqvclN6Gb/ZvIKekeG2uQuSssRfiP77Iyzy/Ww085ookUgbtLnxNSscvIf19xpy4V9
	uARa8VTIetOEPaIqRkyhgo0jbCcXTO1Du8ZMMIcA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1742048308;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=hdPhg/SNUYEAiepLL9VF3hrtOgY+r5NcelsMjVvSTqs=;
	b=JNifZS+9zlZA+lPIGXS06TdArK1BwqYQEaja8SlanUq9e3eCYOz2K1sZl8A8K9YQ
	wX0R/XN8M/Ddm5Tdctd3wlFpxMQfLBvDYby17uv0Y1x3Lx5QaHVSnHj95NRuvlzFSNw
	z/t/N/cYQM/kC2PVWm3aC6Wo272njac5nKs54c5U=
Content-Type: multipart/mixed; boundary="===============0342668882244684650=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libxmlb: upgrading to 0.3.22 SUCCEEDED
Message-ID: <010101959a2bac06-abac3bbb-596d-49c9-bf39-4693af16c6ff-000000@us-west-2.amazonses.com>
Date: Sat, 15 Mar 2025 14:18:28 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.03.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Mar 2025 14:18:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212942

--===============0342668882244684650==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libxmlb* to *0.3.22* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libxmlb-upgrade-0.3.21-0.3.22.patch
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
From b04ac88742e4aaba02f292ca42b39bb8bd056444 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Mar 2025 11:52:06 +0000
Subject: [PATCH] libxmlb: upgrade 0.3.21 -> 0.3.22

---
 .../libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch | 6 +++---
 .../libxmlb/{libxmlb_0.3.21.bb => libxmlb_0.3.22.bb}        | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-gnome/libxmlb/{libxmlb_0.3.21.bb => libxmlb_0.3.22.bb} (93%)

diff --git a/meta/recipes-gnome/libxmlb/libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch b/meta/recipes-gnome/libxmlb/libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch
index e37c3245e0..7f130284c4 100644
--- a/meta/recipes-gnome/libxmlb/libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch
+++ b/meta/recipes-gnome/libxmlb/libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch
@@ -1,4 +1,4 @@
-From b2dc47ed498d69ecac05b68abddefc7ca65983c3 Mon Sep 17 00:00:00 2001
+From ad8dcd768b637e53b80f9fea37ba945731ffd16b Mon Sep 17 00:00:00 2001
 From: Markus Volk <f_l_k@t-online.de>
 Date: Sat, 16 Sep 2023 14:02:57 +0200
 Subject: [PATCH] xb-self-test.c: hardcode G_TEST_SRCDIR
@@ -18,10 +18,10 @@ Signed-off-by: Markus Volk <f_l_k@t-online.de>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/xb-self-test.c b/src/xb-self-test.c
-index baba19e..7da3b6f 100644
+index 76b2e12..c68c13a 100644
 --- a/src/xb-self-test.c
 +++ b/src/xb-self-test.c
-@@ -2882,7 +2882,7 @@ xb_speed_func(void)
+@@ -2912,7 +2912,7 @@ xb_speed_func(void)
  int
  main(int argc, char **argv)
  {
diff --git a/meta/recipes-gnome/libxmlb/libxmlb_0.3.21.bb b/meta/recipes-gnome/libxmlb/libxmlb_0.3.22.bb
similarity index 93%
rename from meta/recipes-gnome/libxmlb/libxmlb_0.3.21.bb
rename to meta/recipes-gnome/libxmlb/libxmlb_0.3.22.bb
index c78b5eeaea..1d6ad58b68 100644
--- a/meta/recipes-gnome/libxmlb/libxmlb_0.3.21.bb
+++ b/meta/recipes-gnome/libxmlb/libxmlb_0.3.22.bb
@@ -8,7 +8,7 @@ SRC_URI = " \
 	file://0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch \
 	file://run-ptest \
 "
-SRCREV = "4cff6ece25f47b8fb740881387e50a00df922c57"
+SRCREV = "addcce32a3bd6a09303f052bd59fb758621d30fb"
 S = "${WORKDIR}/git"
 
 DEPENDS = "glib-2.0 xz zstd"
-- 
2.44.1


--===============0342668882244684650==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libxmlb-upgrade-0.3.21-0.3.22.patch"

RnJvbSBiMDRhYzg4NzQyZTRhYWJhMDJmMjkyY2E0MmIzOWJiOGJkMDU2NDQ0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgTWFyIDIwMjUgMTE6NTI6MDYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJ4bWxiOiB1cGdyYWRlIDAuMy4yMSAtPiAwLjMuMjIKCi0tLQogLi4uL2xpYnhtbGIvMDAwMS14
Yi1zZWxmdGVzdC5jLWhhcmRjb2RlLUdfVEVTVF9TUkNESVIucGF0Y2ggfCA2ICsrKy0tLQogLi4u
L2xpYnhtbGIve2xpYnhtbGJfMC4zLjIxLmJiID0+IGxpYnhtbGJfMC4zLjIyLmJifSAgICAgICAg
fCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMtZ25vbWUvbGlieG1sYi97bGlieG1sYl8wLjMuMjEuYmIgPT4g
bGlieG1sYl8wLjMuMjIuYmJ9ICg5MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdub21l
L2xpYnhtbGIvbGlieG1sYi8wMDAxLXhiLXNlbGZ0ZXN0LmMtaGFyZGNvZGUtR19URVNUX1NSQ0RJ
Ui5wYXRjaCBiL21ldGEvcmVjaXBlcy1nbm9tZS9saWJ4bWxiL2xpYnhtbGIvMDAwMS14Yi1zZWxm
dGVzdC5jLWhhcmRjb2RlLUdfVEVTVF9TUkNESVIucGF0Y2gKaW5kZXggZTM3YzMyNDVlMC4uN2Yx
MzAyODRjNCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdub21lL2xpYnhtbGIvbGlieG1sYi8w
MDAxLXhiLXNlbGZ0ZXN0LmMtaGFyZGNvZGUtR19URVNUX1NSQ0RJUi5wYXRjaAorKysgYi9tZXRh
L3JlY2lwZXMtZ25vbWUvbGlieG1sYi9saWJ4bWxiLzAwMDEteGItc2VsZnRlc3QuYy1oYXJkY29k
ZS1HX1RFU1RfU1JDRElSLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBiMmRjNDdlZDQ5OGQ2
OWVjYWMwNWI2OGFiZGRlZmM3Y2E2NTk4M2MzIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJv
bSBhZDhkY2Q3NjhiNjM3ZTUzYjgwZjlmZWEzN2JhOTQ1NzMxZmZkMTZiIE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQogRnJvbTogTWFya3VzIFZvbGsgPGZfbF9rQHQtb25saW5lLmRlPgogRGF0ZTog
U2F0LCAxNiBTZXAgMjAyMyAxNDowMjo1NyArMDIwMAogU3ViamVjdDogW1BBVENIXSB4Yi1zZWxm
LXRlc3QuYzogaGFyZGNvZGUgR19URVNUX1NSQ0RJUgpAQCAtMTgsMTAgKzE4LDEwIEBAIFNpZ25l
ZC1vZmYtYnk6IE1hcmt1cyBWb2xrIDxmX2xfa0B0LW9ubGluZS5kZT4KICAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL3NyYy94Yi1z
ZWxmLXRlc3QuYyBiL3NyYy94Yi1zZWxmLXRlc3QuYwotaW5kZXggYmFiYTE5ZS4uN2RhM2I2ZiAx
MDA2NDQKK2luZGV4IDc2YjJlMTIuLmM2OGMxM2EgMTAwNjQ0CiAtLS0gYS9zcmMveGItc2VsZi10
ZXN0LmMKICsrKyBiL3NyYy94Yi1zZWxmLXRlc3QuYwotQEAgLTI4ODIsNyArMjg4Miw3IEBAIHhi
X3NwZWVkX2Z1bmModm9pZCkKK0BAIC0yOTEyLDcgKzI5MTIsNyBAQCB4Yl9zcGVlZF9mdW5jKHZv
aWQpCiAgaW50CiAgbWFpbihpbnQgYXJnYywgY2hhciAqKmFyZ3YpCiAgewpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWdub21lL2xpYnhtbGIvbGlieG1sYl8wLjMuMjEuYmIgYi9tZXRhL3JlY2lw
ZXMtZ25vbWUvbGlieG1sYi9saWJ4bWxiXzAuMy4yMi5iYgpzaW1pbGFyaXR5IGluZGV4IDkzJQpy
ZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ25vbWUvbGlieG1sYi9saWJ4bWxiXzAuMy4yMS5iYgpy
ZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdub21lL2xpYnhtbGIvbGlieG1sYl8wLjMuMjIuYmIKaW5k
ZXggYzc4YjVlZWFlYS4uMWQ2YWQ1OGI2OCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdub21l
L2xpYnhtbGIvbGlieG1sYl8wLjMuMjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdub21lL2xpYnht
bGIvbGlieG1sYl8wLjMuMjIuYmIKQEAgLTgsNyArOCw3IEBAIFNSQ19VUkkgPSAiIFwKIAlmaWxl
Oi8vMDAwMS14Yi1zZWxmdGVzdC5jLWhhcmRjb2RlLUdfVEVTVF9TUkNESVIucGF0Y2ggXAogCWZp
bGU6Ly9ydW4tcHRlc3QgXAogIgotU1JDUkVWID0gIjRjZmY2ZWNlMjVmNDdiOGZiNzQwODgxMzg3
ZTUwYTAwZGY5MjJjNTciCitTUkNSRVYgPSAiYWRkY2NlMzJhM2JkNmEwOTMwM2YwNTJiZDU5ZmI3
NTg2MjFkMzBmYiIKIFMgPSAiJHtXT1JLRElSfS9naXQiCiAKIERFUEVORFMgPSAiZ2xpYi0yLjAg
eHogenN0ZCIKLS0gCjIuNDQuMQoK

--===============0342668882244684650==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libxmlb: PKGV changed from 0.3.21 [default] to 0.3.22 [default]
packages/core2-64-poky-linux/libxmlb: PV changed from "0.3.21" to "0.3.22"
packages/core2-64-poky-linux/libxmlb/libxmlb-bin: PKGV changed from 0.3.21 [default] to 0.3.22 [default]
packages/core2-64-poky-linux/libxmlb/libxmlb-bin: PV changed from "0.3.21" to "0.3.22"
packages/core2-64-poky-linux/libxmlb/libxmlb-dbg: PKGSIZE changed from 1838432 to 1836744 (-0%)
packages/core2-64-poky-linux/libxmlb/libxmlb-dbg: PKGV changed from 0.3.21 [default] to 0.3.22 [default]
packages/core2-64-poky-linux/libxmlb/libxmlb-dbg: PV changed from "0.3.21" to "0.3.22"
packages/core2-64-poky-linux/libxmlb/libxmlb-dev: PKGSIZE changed from 355537 to 355536 (-0%)
packages/core2-64-poky-linux/libxmlb/libxmlb-dev: PKGV changed from 0.3.21 [default] to 0.3.22 [default]
packages/core2-64-poky-linux/libxmlb/libxmlb-dev: PV changed from "0.3.21" to "0.3.22"
packages/core2-64-poky-linux/libxmlb/libxmlb-doc: PKGV changed from 0.3.21 [default] to 0.3.22 [default]
packages/core2-64-poky-linux/libxmlb/libxmlb-doc: PV changed from "0.3.21" to "0.3.22"
packages/core2-64-poky-linux/libxmlb/libxmlb-locale: PKGV changed from 0.3.21 [default] to 0.3.22 [default]
packages/core2-64-poky-linux/libxmlb/libxmlb-locale: PV changed from "0.3.21" to "0.3.22"
packages/core2-64-poky-linux/libxmlb/libxmlb-ptest: PKGV changed from 0.3.21 [default] to 0.3.22 [default]
packages/core2-64-poky-linux/libxmlb/libxmlb-ptest: PV changed from "0.3.21" to "0.3.22"
packages/core2-64-poky-linux/libxmlb/libxmlb-src: PKGSIZE changed from 514942 to 518201 (+1%)
packages/core2-64-poky-linux/libxmlb/libxmlb-src: PKGV changed from 0.3.21 [default] to 0.3.22 [default]
packages/core2-64-poky-linux/libxmlb/libxmlb-src: FILELIST: removed "/usr/src/debug/libxmlb/0.3.21/src/xb-machine-private.h /usr/src/debug/libxmlb/0.3.21/src/xb-opcode-private.h /usr/src/debug/libxmlb/0.3.21/src/xb-value-bindings-private.h /usr/src/debug/libxmlb/0.3.21/src/xb-common-private.h /usr/src/debug/libxmlb/0.3.21/src/xb-builder-node.c /usr/src/debug/libxmlb/0.3.21/src/xb-builder-fixup.h /usr/src/debug/libxmlb/0.3.21/src/xb-builder-source-ctx.h /usr/src/debug/libxmlb/0.3.21/src/xb-builder.c /usr/src/debug/libxmlb/0.3.21/src/xb-node.c /usr/src/debug/libxmlb/0.3.21/src/xb-string.c /usr/src/debug/libxmlb/0.3.21/src/xb-builder.h /usr/src/debug/libxmlb/0.3.21/src/xb-builder-node.h /usr/src/debug/libxmlb/0.3.21/src/xb-builder-fixup.c /usr/src/debug/libxmlb/0.3.21/src/xb-string.h /usr/src/debug/libxmlb/0.3.21/src/xb-query-private.h /usr/src/debug/libxmlb/0.3.21/src/xb-node.h /usr/src/debug/libxmlb/0.3.21/src/xb-builder-source-ctx.c /usr/src/debug/libxmlb/0.3.21/src/xb-version.c /usr
 /src/debug/libxmlb/0.3.21/src/xb-silo-private.h /usr/src/debug/libxmlb/0.3.21/src/xb-version.h /usr/src/debug/libxmlb/0.3.21/src/xb-builder-fixup-private.h /usr/src/debug/libxmlb/0.3.21/src/xb-common.c /usr/src/debug/libxmlb/0.3.21/src/xb-node-silo.h /usr/src/debug/libxmlb/0.3.21/src/xb-silo-query.c /usr/src/debug/libxmlb/0.3.21/src/xb-stack-private.h /usr/src/debug/libxmlb/0.3.21/src/xb-stack.h /usr/src/debug/libxmlb/0.3.21/src/xb-builder-source-private.h /usr/src/debug/libxmlb/0.3.21/src/xb-query-context.h /usr/src/debug/libxmlb/0.3.21/src/xb-silo-query.h /usr/src/debug/libxmlb/0.3.21/src/xb-builder-source-ctx-private.h /usr/src/debug/libxmlb/0.3.21/src/xb-query-context.c /usr/src/debug/libxmlb/0.3.21/src/xb-stack.c /usr/src/debug/libxmlb/0.3.21/src/xb-builder-source.h /usr/src/debug/libxmlb/0.3.21/src/xb-lzma-decompressor.c /usr/src/debug/libxmlb/0.3.21/src/xb-silo-export-private.h /usr/src/debug/libxmlb/0.3.21/src/xb-lzma-decompressor.h /usr/src/debug/libxmlb/0.3.21/src/xb-build
 er-source.c /usr/src/debug/libxmlb/0.3.21/src/xb-node-private.h /usr/src/debug/libxmlb/0.3.21/src/xb-self-test.c /usr/src/debug/libxmlb/0.3.21/src/xb-query.c /usr/src/debug/libxmlb/0.3.21/src/xb-node-query.c /usr/src/debug/libxmlb/0.3.21/src/xb-silo-query-private.h /usr/src/debug/libxmlb/0.3.21/src/xb-value-bindings.c /usr/src/debug/libxmlb/0.3.21/src/xb-machine.h /usr/src/debug/libxmlb/0.3.21/src/xb-silo-export.c /usr/src/debug/libxmlb/0.3.21/src/xb-tool.c /usr/src/debug/libxmlb/0.3.21/src/xb-machine.c /usr/src/debug/libxmlb/0.3.21/src/xb-silo-export.h /usr/src/debug/libxmlb/0.3.21/src/xb-value-bindings.h /usr/src/debug/libxmlb/0.3.21/src/xb-node-query.h /usr/src/debug/libxmlb/0.3.21/src/xb-query.h /usr/src/debug/libxmlb/0.3.21/src/xb-silo.h /usr/src/debug/libxmlb/0.3.21/src/xb-opcode.h /usr/src/debug/libxmlb/0.3.21/src/xb-string-private.h /usr/src/debug/libxmlb/0.3.21/src/xb-zstd-decompressor.c /usr/src/debug/libxmlb/0.3.21/src/xb-silo-node.h /usr/src/debug/libxmlb/0.3.21/src/xb-b
 uilder-node-private.h /usr/src/debug/libxmlb/0.3.21/src/xb-opcode.c /usr/src/debug/libxmlb/0.3.21/src/xb-silo.c /usr/src/debug/libxmlb/0.3.21/src/xb-zstd-decompressor.h", added "/usr/src/debug/libxmlb/0.3.22/src/xb-machine-private.h /usr/src/debug/libxmlb/0.3.22/src/xb-opcode-private.h /usr/src/debug/libxmlb/0.3.22/src/xb-value-bindings-private.h /usr/src/debug/libxmlb/0.3.22/src/xb-common-private.h /usr/src/debug/libxmlb/0.3.22/src/xb-builder-node.c /usr/src/debug/libxmlb/0.3.22/src/xb-builder-fixup.h /usr/src/debug/libxmlb/0.3.22/src/xb-builder-source-ctx.h /usr/src/debug/libxmlb/0.3.22/src/xb-builder.c /usr/src/debug/libxmlb/0.3.22/src/xb-node.c /usr/src/debug/libxmlb/0.3.22/src/xb-string.c /usr/src/debug/libxmlb/0.3.22/src/xb-builder.h /usr/src/debug/libxmlb/0.3.22/src/xb-builder-node.h /usr/src/debug/libxmlb/0.3.22/src/xb-builder-fixup.c /usr/src/debug/libxmlb/0.3.22/src/xb-string.h /usr/src/debug/libxmlb/0.3.22/src/xb-query-private.h /usr/src/debug/libxmlb/0.3.22/src/xb-node.h
  /usr/src/debug/libxmlb/0.3.22/src/xb-builder-source-ctx.c /usr/src/debug/libxmlb/0.3.22/src/xb-version.c /usr/src/debug/libxmlb/0.3.22/src/xb-silo-private.h /usr/src/debug/libxmlb/0.3.22/src/xb-version.h /usr/src/debug/libxmlb/0.3.22/src/xb-builder-fixup-private.h /usr/src/debug/libxmlb/0.3.22/src/xb-common.c /usr/src/debug/libxmlb/0.3.22/src/xb-node-silo.h /usr/src/debug/libxmlb/0.3.22/src/xb-silo-query.c /usr/src/debug/libxmlb/0.3.22/src/xb-stack-private.h /usr/src/debug/libxmlb/0.3.22/src/xb-stack.h /usr/src/debug/libxmlb/0.3.22/src/xb-builder-source-private.h /usr/src/debug/libxmlb/0.3.22/src/xb-query-context.h /usr/src/debug/libxmlb/0.3.22/src/xb-silo-query.h /usr/src/debug/libxmlb/0.3.22/src/xb-builder-source-ctx-private.h /usr/src/debug/libxmlb/0.3.22/src/xb-query-context.c /usr/src/debug/libxmlb/0.3.22/src/xb-stack.c /usr/src/debug/libxmlb/0.3.22/src/xb-builder-source.h /usr/src/debug/libxmlb/0.3.22/src/xb-lzma-decompressor.c /usr/src/debug/libxmlb/0.3.22/src/xb-silo-export
 -private.h /usr/src/debug/libxmlb/0.3.22/src/xb-lzma-decompressor.h /usr/src/debug/libxmlb/0.3.22/src/xb-builder-source.c /usr/src/debug/libxmlb/0.3.22/src/xb-node-private.h /usr/src/debug/libxmlb/0.3.22/src/xb-self-test.c /usr/src/debug/libxmlb/0.3.22/src/xb-query.c /usr/src/debug/libxmlb/0.3.22/src/xb-node-query.c /usr/src/debug/libxmlb/0.3.22/src/xb-silo-query-private.h /usr/src/debug/libxmlb/0.3.22/src/xb-value-bindings.c /usr/src/debug/libxmlb/0.3.22/src/xb-machine.h /usr/src/debug/libxmlb/0.3.22/src/xb-silo-export.c /usr/src/debug/libxmlb/0.3.22/src/xb-tool.c /usr/src/debug/libxmlb/0.3.22/src/xb-machine.c /usr/src/debug/libxmlb/0.3.22/src/xb-silo-export.h /usr/src/debug/libxmlb/0.3.22/src/xb-value-bindings.h /usr/src/debug/libxmlb/0.3.22/src/xb-node-query.h /usr/src/debug/libxmlb/0.3.22/src/xb-silo-node.c /usr/src/debug/libxmlb/0.3.22/src/xb-query.h /usr/src/debug/libxmlb/0.3.22/src/xb-silo.h /usr/src/debug/libxmlb/0.3.22/src/xb-opcode.h /usr/src/debug/libxmlb/0.3.22/src/xb-st
 ring-private.h /usr/src/debug/libxmlb/0.3.22/src/xb-zstd-decompressor.c /usr/src/debug/libxmlb/0.3.22/src/xb-silo-node.h /usr/src/debug/libxmlb/0.3.22/src/xb-builder-node-private.h /usr/src/debug/libxmlb/0.3.22/src/xb-opcode.c /usr/src/debug/libxmlb/0.3.22/src/xb-silo.c /usr/src/debug/libxmlb/0.3.22/src/xb-zstd-decompressor.h"
packages/core2-64-poky-linux/libxmlb/libxmlb-src: PV changed from "0.3.21" to "0.3.22"
packages/core2-64-poky-linux/libxmlb/libxmlb-staticdev: PKGV changed from 0.3.21 [default] to 0.3.22 [default]
packages/core2-64-poky-linux/libxmlb/libxmlb-staticdev: PV changed from "0.3.21" to "0.3.22"
packages/core2-64-poky-linux/libxmlb/libxmlb: PKGV changed from 0.3.21 [default] to 0.3.22 [default]
packages/core2-64-poky-linux/libxmlb/libxmlb: PV changed from "0.3.21" to "0.3.22"

--===============0342668882244684650==--

