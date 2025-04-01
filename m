Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FA02C36018
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 12:43:12 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.18066.1743511391043823306
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 05:43:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=KTjtPbZM;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=eDy5rUd0;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010195f1608874-124c169b-6a4e-49ac-a5f6-8bb1521e2fe7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1743511390;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=M9+cmPJXexM3R4gZ759+LnPYbJiobbUL3yy5vS8ljOk=;
	b=KTjtPbZMsyw/z5vg/oA+iiZvpDTUwotSOMt8H79wQyojl3PNNN1T/gmtTHjizJR9
	H/wi4WaeNwuh9oRuV7plzCLKUEoPESdztXR5AbH5vKYL1fxA7SWNIai2u3oDyqwKHQg
	7cPP1qeinohSL5A3Y5pphsGB8OXsVHoVxuWUSzkY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1743511390;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=M9+cmPJXexM3R4gZ759+LnPYbJiobbUL3yy5vS8ljOk=;
	b=eDy5rUd00RzucyaRnlDM/g3H9ryV4qS0Ifw0+PgDyeW3I9LnVe/hBF9JA+5MVMUv
	rSMcJMCNQksPiJDHlD2vBuJvjcJcjF4sj5jHyXh4mnM9uHLK6Bz3cETZIAvUfaDu/DS
	paTpF+7DziGqpjtXZbzUssZl4L4+UCiM9RwTiKZ4=
Content-Type: multipart/mixed; boundary="===============2467134155001604412=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Changhyeok Bae <changhyeok.bae@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] connman: upgrading to 1.44 SUCCEEDED
Message-ID: <01010195f1608874-124c169b-6a4e-49ac-a5f6-8bb1521e2fe7-000000@us-west-2.amazonses.com>
Date: Tue, 1 Apr 2025 12:43:10 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.04.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 12:43:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214035

--===============2467134155001604412==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *connman* to *1.44* has Succeeded.

Next steps:
    - apply the patch: git am 0001-connman-upgrade-1.43-1.44.patch
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
From 9282e57e4587c0c0fbee724c1f736436a6104f3b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Apr 2025 06:58:58 +0000
Subject: [PATCH] connman: upgrade 1.43 -> 1.44

---
 ...stop-systemd-resolved-when-we-use-co.patch |  7 ++---
 ...visibility-to-default-for-debug-symb.patch | 12 +++------
 ...ve-musl-does-not-implement-res_ninit.patch |  5 +---
 .../connman/connman/no-version-scripts.patch  | 26 ++++++++++++++++---
 .../{connman_1.43.bb => connman_1.44.bb}      |  2 +-
 5 files changed, 31 insertions(+), 21 deletions(-)
 rename meta/recipes-connectivity/connman/{connman_1.43.bb => connman_1.44.bb} (84%)

diff --git a/meta/recipes-connectivity/connman/connman/0001-connman.service-stop-systemd-resolved-when-we-use-co.patch b/meta/recipes-connectivity/connman/connman/0001-connman.service-stop-systemd-resolved-when-we-use-co.patch
index 8e2e0bd02d..4597fe68fc 100644
--- a/meta/recipes-connectivity/connman/connman/0001-connman.service-stop-systemd-resolved-when-we-use-co.patch
+++ b/meta/recipes-connectivity/connman/connman/0001-connman.service-stop-systemd-resolved-when-we-use-co.patch
@@ -1,4 +1,4 @@
-From 9f70b94ebf18f52c115634642652830fa77f27a1 Mon Sep 17 00:00:00 2001
+From 19aff57e4da920d9ca972903582305b4efe81ef3 Mon Sep 17 00:00:00 2001
 From: "Maxin B. John" <maxin.john@intel.com>
 Date: Mon, 12 Jun 2017 16:52:39 +0300
 Subject: [PATCH] connman.service: stop systemd-resolved when we use connman
@@ -13,7 +13,7 @@ Signed-off-by: Maxin B. John <maxin.john@intel.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/src/connman.service.in b/src/connman.service.in
-index 9f5c10f..dab48bc 100644
+index 7376346..79e75d6 100644
 --- a/src/connman.service.in
 +++ b/src/connman.service.in
 @@ -6,6 +6,7 @@ RequiresMountsFor=@localstatedir@/lib/connman
@@ -24,6 +24,3 @@ index 9f5c10f..dab48bc 100644
  
  [Service]
  Type=dbus
--- 
-2.4.0
-
diff --git a/meta/recipes-connectivity/connman/connman/0001-plugin.h-Change-visibility-to-default-for-debug-symb.patch b/meta/recipes-connectivity/connman/connman/0001-plugin.h-Change-visibility-to-default-for-debug-symb.patch
index e6f03e632e..a68707b2fa 100644
--- a/meta/recipes-connectivity/connman/connman/0001-plugin.h-Change-visibility-to-default-for-debug-symb.patch
+++ b/meta/recipes-connectivity/connman/connman/0001-plugin.h-Change-visibility-to-default-for-debug-symb.patch
@@ -1,4 +1,4 @@
-From 4ddaf78dad5a9ee4a0658235f71b75132192123e Mon Sep 17 00:00:00 2001
+From c254226d4ebbd846c1f8169d70413a0d32d7ae77 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 7 Apr 2012 18:52:12 -0700
 Subject: [PATCH] plugin.h: Change visibility to default for debug symbols
@@ -8,14 +8,13 @@ have hidden visibility
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
-
 Upstream-Status: Pending
 ---
- include/plugin.h |    4 ++--
- 1 files changed, 2 insertions(+), 2 deletions(-)
+ include/plugin.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/include/plugin.h b/include/plugin.h
-index 692a4e5..a9361c3 100644
+index 8d2bb08..a12a6be 100644
 --- a/include/plugin.h
 +++ b/include/plugin.h
 @@ -89,9 +89,9 @@ struct connman_plugin_desc {
@@ -30,6 +29,3 @@ index 692a4e5..a9361c3 100644
  		extern struct connman_plugin_desc connman_plugin_desc \
  				__attribute__ ((visibility("default"))); \
  		struct connman_plugin_desc connman_plugin_desc = { \
--- 
-1.7.5.4
-
diff --git a/meta/recipes-connectivity/connman/connman/0002-resolve-musl-does-not-implement-res_ninit.patch b/meta/recipes-connectivity/connman/connman/0002-resolve-musl-does-not-implement-res_ninit.patch
index 9e2cc34995..2c612039ee 100644
--- a/meta/recipes-connectivity/connman/connman/0002-resolve-musl-does-not-implement-res_ninit.patch
+++ b/meta/recipes-connectivity/connman/connman/0002-resolve-musl-does-not-implement-res_ninit.patch
@@ -1,4 +1,4 @@
-From 60783f0d885c9a0db8b6f1d528786321e53f1512 Mon Sep 17 00:00:00 2001
+From 4e726a5aaa75d60fab6a56bc37dbec48be53ff79 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 6 Apr 2015 23:02:21 -0700
 Subject: [PATCH] gweb/gresolv.c: make use of res_ninit optional and subject to
@@ -83,6 +83,3 @@ index 8101d71..9f1477c 100644
  
  		if (!resolv->nameserver_list)
  			g_resolv_add_nameserver(resolv, "127.0.0.1", 53, 0);
--- 
-2.39.2
-
diff --git a/meta/recipes-connectivity/connman/connman/no-version-scripts.patch b/meta/recipes-connectivity/connman/connman/no-version-scripts.patch
index e96e38bcf9..3667a166f6 100644
--- a/meta/recipes-connectivity/connman/connman/no-version-scripts.patch
+++ b/meta/recipes-connectivity/connman/connman/no-version-scripts.patch
@@ -1,3 +1,8 @@
+From 67f37aafcc8ef5d2eb006387e7bec21f74518727 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Tue, 9 Aug 2016 12:12:02 +0100
+Subject: [PATCH] connman: disable version-scripts to fix crashes at startup
+
 With binutils 2.27 on at least MIPS, connmand will crash on startup.  This
 appears to be due to the symbol visibilty scripts hiding symbols that stdio
 looks up at runtime, resulting in it segfaulting.
@@ -12,16 +17,31 @@ remove the scripts to work around the problem until binutils is fixed.
 
 Upstream-Status: Inappropriate
 Signed-off-by: Ross Burton <ross.burton@intel.com>
+---
+ Makefile.am | 6 ++----
+ 1 file changed, 2 insertions(+), 4 deletions(-)
 
 diff --git a/Makefile.am b/Makefile.am
-index d70725c..76ae432 100644
+index 3dc3bb5..3be5ccb 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -132,2 +132 @@ src_connmand_LDADD = gdbus/libgdbus-internal.la $(builtin_libadd) \
+@@ -143,8 +143,7 @@ src_connmand_LDADD = gdbus/libgdbus-internal.la $(builtin_libadd) \
+ 			@GIO_LIBS@ @GLIB_LIBS@ @DBUS_LIBS@ @GNUTLS_LIBS@ \
+ 			-lresolv -ldl -lrt
+ 
 -src_connmand_LDFLAGS = -Wl,--export-dynamic \
 -				-Wl,--version-script=$(srcdir)/src/connman.ver
 +src_connmand_LDFLAGS = -Wl,--export-dynamic
-@@ -166,2 +165 @@ vpn_connman_vpnd_LDADD = gdbus/libgdbus-internal.la $(builtin_vpn_libadd) \
+ 
+ src_connmand_wait_online_SOURCES = src/connmand-wait-online.c
+ 
+@@ -187,8 +186,7 @@ vpn_connman_vpnd_LDADD = gdbus/libgdbus-internal.la $(builtin_vpn_libadd) \
+ 				@GIO_LIBS@ @GLIB_LIBS@ @DBUS_LIBS@ @GNUTLS_LIBS@ \
+ 				-lresolv -ldl
+ 
 -vpn_connman_vpnd_LDFLAGS = -Wl,--export-dynamic \
 -				-Wl,--version-script=$(srcdir)/vpn/vpn.ver
 +vpn_connman_vpnd_LDFLAGS = -Wl,--export-dynamic
+ endif
+ 
+ BUILT_SOURCES = $(local_headers) src/builtin.h $(service_files) \
diff --git a/meta/recipes-connectivity/connman/connman_1.43.bb b/meta/recipes-connectivity/connman/connman_1.44.bb
similarity index 84%
rename from meta/recipes-connectivity/connman/connman_1.43.bb
rename to meta/recipes-connectivity/connman/connman_1.44.bb
index 1100599490..396d8bc5ce 100644
--- a/meta/recipes-connectivity/connman/connman_1.43.bb
+++ b/meta/recipes-connectivity/connman/connman_1.44.bb
@@ -9,7 +9,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
            "
 
 
-SRC_URI[sha256sum] = "1257cebe327e7900b7e2b84c0fb330aa90815e455898cd2f941f4308ed2be3bc"
+SRC_URI[sha256sum] = "2be2b00321632b775f9eff713acd04ef21e31fbf388f6ebf45512ff4289574ff"
 
 RRECOMMENDS:${PN} = "connman-conf"
 RCONFLICTS:${PN} = "networkmanager"
-- 
2.47.1


--===============2467134155001604412==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-connman-upgrade-1.43-1.44.patch"

RnJvbSA5MjgyZTU3ZTQ1ODdjMGMwZmJlZTcyNGMxZjczNjQzNmE2MTA0ZjNiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBBcHIgMjAyNSAwNjo1ODo1OCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGNv
bm5tYW46IHVwZ3JhZGUgMS40MyAtPiAxLjQ0CgotLS0KIC4uLnN0b3Atc3lzdGVtZC1yZXNvbHZl
ZC13aGVuLXdlLXVzZS1jby5wYXRjaCB8ICA3ICsrLS0tCiAuLi52aXNpYmlsaXR5LXRvLWRlZmF1
bHQtZm9yLWRlYnVnLXN5bWIucGF0Y2ggfCAxMiArKystLS0tLS0KIC4uLnZlLW11c2wtZG9lcy1u
b3QtaW1wbGVtZW50LXJlc19uaW5pdC5wYXRjaCB8ICA1ICstLS0KIC4uLi9jb25ubWFuL2Nvbm5t
YW4vbm8tdmVyc2lvbi1zY3JpcHRzLnBhdGNoICB8IDI2ICsrKysrKysrKysrKysrKystLS0KIC4u
Li97Y29ubm1hbl8xLjQzLmJiID0+IGNvbm5tYW5fMS40NC5iYn0gICAgICB8ICAyICstCiA1IGZp
bGVzIGNoYW5nZWQsIDMxIGluc2VydGlvbnMoKyksIDIxIGRlbGV0aW9ucygtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvY29ubm1hbi97Y29ubm1hbl8xLjQzLmJiID0+IGNvbm5t
YW5fMS40NC5iYn0gKDg0JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5
L2Nvbm5tYW4vY29ubm1hbi8wMDAxLWNvbm5tYW4uc2VydmljZS1zdG9wLXN5c3RlbWQtcmVzb2x2
ZWQtd2hlbi13ZS11c2UtY28ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2Nvbm5t
YW4vY29ubm1hbi8wMDAxLWNvbm5tYW4uc2VydmljZS1zdG9wLXN5c3RlbWQtcmVzb2x2ZWQtd2hl
bi13ZS11c2UtY28ucGF0Y2gKaW5kZXggOGUyZTBiZDAyZC4uNDU5N2ZlNjhmYyAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9jb25ubWFuL2Nvbm5tYW4vMDAwMS1jb25ubWFu
LnNlcnZpY2Utc3RvcC1zeXN0ZW1kLXJlc29sdmVkLXdoZW4td2UtdXNlLWNvLnBhdGNoCisrKyBi
L21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvY29ubm1hbi9jb25ubWFuLzAwMDEtY29ubm1hbi5z
ZXJ2aWNlLXN0b3Atc3lzdGVtZC1yZXNvbHZlZC13aGVuLXdlLXVzZS1jby5wYXRjaApAQCAtMSw0
ICsxLDQgQEAKLUZyb20gOWY3MGI5NGViZjE4ZjUyYzExNTYzNDY0MjY1MjgzMGZhNzdmMjdhMSBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMTlhZmY1N2U0ZGE5MjBkOWNhOTcyOTAzNTgy
MzA1YjRlZmU4MWVmMyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206ICJNYXhpbiBCLiBK
b2huIiA8bWF4aW4uam9obkBpbnRlbC5jb20+CiBEYXRlOiBNb24sIDEyIEp1biAyMDE3IDE2OjUy
OjM5ICswMzAwCiBTdWJqZWN0OiBbUEFUQ0hdIGNvbm5tYW4uc2VydmljZTogc3RvcCBzeXN0ZW1k
LXJlc29sdmVkIHdoZW4gd2UgdXNlIGNvbm5tYW4KQEAgLTEzLDcgKzEzLDcgQEAgU2lnbmVkLW9m
Zi1ieTogTWF4aW4gQi4gSm9obiA8bWF4aW4uam9obkBpbnRlbC5jb20+CiAgMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspCiAKIGRpZmYgLS1naXQgYS9zcmMvY29ubm1hbi5zZXJ2aWNlLmlu
IGIvc3JjL2Nvbm5tYW4uc2VydmljZS5pbgotaW5kZXggOWY1YzEwZi4uZGFiNDhiYyAxMDA2NDQK
K2luZGV4IDczNzYzNDYuLjc5ZTc1ZDYgMTAwNjQ0CiAtLS0gYS9zcmMvY29ubm1hbi5zZXJ2aWNl
LmluCiArKysgYi9zcmMvY29ubm1hbi5zZXJ2aWNlLmluCiBAQCAtNiw2ICs2LDcgQEAgUmVxdWly
ZXNNb3VudHNGb3I9QGxvY2Fsc3RhdGVkaXJAL2xpYi9jb25ubWFuCkBAIC0yNCw2ICsyNCwzIEBA
IGluZGV4IDlmNWMxMGYuLmRhYjQ4YmMgMTAwNjQ0CiAgCiAgW1NlcnZpY2VdCiAgVHlwZT1kYnVz
Ci0tLSAKLTIuNC4wCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvY29u
bm1hbi9jb25ubWFuLzAwMDEtcGx1Z2luLmgtQ2hhbmdlLXZpc2liaWxpdHktdG8tZGVmYXVsdC1m
b3ItZGVidWctc3ltYi5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvY29ubm1hbi9j
b25ubWFuLzAwMDEtcGx1Z2luLmgtQ2hhbmdlLXZpc2liaWxpdHktdG8tZGVmYXVsdC1mb3ItZGVi
dWctc3ltYi5wYXRjaAppbmRleCBlNmYwM2U2MzJlLi5hNjg3MDdiMmZhIDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2Nvbm5tYW4vY29ubm1hbi8wMDAxLXBsdWdpbi5oLUNo
YW5nZS12aXNpYmlsaXR5LXRvLWRlZmF1bHQtZm9yLWRlYnVnLXN5bWIucGF0Y2gKKysrIGIvbWV0
YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9jb25ubWFuL2Nvbm5tYW4vMDAwMS1wbHVnaW4uaC1DaGFu
Z2UtdmlzaWJpbGl0eS10by1kZWZhdWx0LWZvci1kZWJ1Zy1zeW1iLnBhdGNoCkBAIC0xLDQgKzEs
NCBAQAotRnJvbSA0ZGRhZjc4ZGFkNWE5ZWU0YTA2NTgyMzVmNzFiNzUxMzIxOTIxMjNlIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBjMjU0MjI2ZDRlYmJkODQ2YzFmODE2OWQ3MDQxM2Ew
ZDMyZDdhZTc3IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2hlbSBSYWogPHJhai5r
aGVtQGdtYWlsLmNvbT4KIERhdGU6IFNhdCwgNyBBcHIgMjAxMiAxODo1MjoxMiAtMDcwMAogU3Vi
amVjdDogW1BBVENIXSBwbHVnaW4uaDogQ2hhbmdlIHZpc2liaWxpdHkgdG8gZGVmYXVsdCBmb3Ig
ZGVidWcgc3ltYm9scwpAQCAtOCwxNCArOCwxMyBAQCBoYXZlIGhpZGRlbiB2aXNpYmlsaXR5CiAK
IFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiAKLQogVXBzdHJl
YW0tU3RhdHVzOiBQZW5kaW5nCiAtLS0KLSBpbmNsdWRlL3BsdWdpbi5oIHwgICAgNCArKy0tCi0g
MSBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCisgaW5jbHVk
ZS9wbHVnaW4uaCB8IDQgKystLQorIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9pbmNsdWRlL3BsdWdpbi5oIGIvaW5jbHVkZS9w
bHVnaW4uaAotaW5kZXggNjkyYTRlNS4uYTkzNjFjMyAxMDA2NDQKK2luZGV4IDhkMmJiMDguLmEx
MmE2YmUgMTAwNjQ0CiAtLS0gYS9pbmNsdWRlL3BsdWdpbi5oCiArKysgYi9pbmNsdWRlL3BsdWdp
bi5oCiBAQCAtODksOSArODksOSBAQCBzdHJ1Y3QgY29ubm1hbl9wbHVnaW5fZGVzYyB7CkBAIC0z
MCw2ICsyOSwzIEBAIGluZGV4IDY5MmE0ZTUuLmE5MzYxYzMgMTAwNjQ0CiAgCQlleHRlcm4gc3Ry
dWN0IGNvbm5tYW5fcGx1Z2luX2Rlc2MgY29ubm1hbl9wbHVnaW5fZGVzYyBcCiAgCQkJCV9fYXR0
cmlidXRlX18gKCh2aXNpYmlsaXR5KCJkZWZhdWx0IikpKTsgXAogIAkJc3RydWN0IGNvbm5tYW5f
cGx1Z2luX2Rlc2MgY29ubm1hbl9wbHVnaW5fZGVzYyA9IHsgXAotLS0gCi0xLjcuNS40Ci0KZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvY29ubm1hbi9jb25ubWFuLzAwMDIt
cmVzb2x2ZS1tdXNsLWRvZXMtbm90LWltcGxlbWVudC1yZXNfbmluaXQucGF0Y2ggYi9tZXRhL3Jl
Y2lwZXMtY29ubmVjdGl2aXR5L2Nvbm5tYW4vY29ubm1hbi8wMDAyLXJlc29sdmUtbXVzbC1kb2Vz
LW5vdC1pbXBsZW1lbnQtcmVzX25pbml0LnBhdGNoCmluZGV4IDllMmNjMzQ5OTUuLjJjNjEyMDM5
ZWUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvY29ubm1hbi9jb25ubWFu
LzAwMDItcmVzb2x2ZS1tdXNsLWRvZXMtbm90LWltcGxlbWVudC1yZXNfbmluaXQucGF0Y2gKKysr
IGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9jb25ubWFuL2Nvbm5tYW4vMDAwMi1yZXNvbHZl
LW11c2wtZG9lcy1ub3QtaW1wbGVtZW50LXJlc19uaW5pdC5wYXRjaApAQCAtMSw0ICsxLDQgQEAK
LUZyb20gNjA3ODNmMGQ4ODVjOWEwZGI4YjZmMWQ1Mjg3ODYzMjFlNTNmMTUxMiBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKK0Zyb20gNGU3MjZhNWFhYTc1ZDYwZmFiNmE1NmJjMzdkYmVjNDhiZTUz
ZmY3OSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBn
bWFpbC5jb20+CiBEYXRlOiBNb24sIDYgQXByIDIwMTUgMjM6MDI6MjEgLTA3MDAKIFN1YmplY3Q6
IFtQQVRDSF0gZ3dlYi9ncmVzb2x2LmM6IG1ha2UgdXNlIG9mIHJlc19uaW5pdCBvcHRpb25hbCBh
bmQgc3ViamVjdCB0bwpAQCAtODMsNiArODMsMyBAQCBpbmRleCA4MTAxZDcxLi45ZjE0NzdjIDEw
MDY0NAogIAogIAkJaWYgKCFyZXNvbHYtPm5hbWVzZXJ2ZXJfbGlzdCkKICAJCQlnX3Jlc29sdl9h
ZGRfbmFtZXNlcnZlcihyZXNvbHYsICIxMjcuMC4wLjEiLCA1MywgMCk7Ci0tLSAKLTIuMzkuMgot
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2Nvbm5tYW4vY29ubm1hbi9u
by12ZXJzaW9uLXNjcmlwdHMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2Nvbm5t
YW4vY29ubm1hbi9uby12ZXJzaW9uLXNjcmlwdHMucGF0Y2gKaW5kZXggZTk2ZTM4YmNmOS4uMzY2
N2ExNjZmNiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9jb25ubWFuL2Nv
bm5tYW4vbm8tdmVyc2lvbi1zY3JpcHRzLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0
aXZpdHkvY29ubm1hbi9jb25ubWFuL25vLXZlcnNpb24tc2NyaXB0cy5wYXRjaApAQCAtMSwzICsx
LDggQEAKK0Zyb20gNjdmMzdhYWZjYzhlZjVkMmViMDA2Mzg3ZTdiZWMyMWY3NDUxODcyNyBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb206IFJvc3MgQnVydG9uIDxyb3NzLmJ1cnRvbkBpbnRl
bC5jb20+CitEYXRlOiBUdWUsIDkgQXVnIDIwMTYgMTI6MTI6MDIgKzAxMDAKK1N1YmplY3Q6IFtQ
QVRDSF0gY29ubm1hbjogZGlzYWJsZSB2ZXJzaW9uLXNjcmlwdHMgdG8gZml4IGNyYXNoZXMgYXQg
c3RhcnR1cAorCiBXaXRoIGJpbnV0aWxzIDIuMjcgb24gYXQgbGVhc3QgTUlQUywgY29ubm1hbmQg
d2lsbCBjcmFzaCBvbiBzdGFydHVwLiAgVGhpcwogYXBwZWFycyB0byBiZSBkdWUgdG8gdGhlIHN5
bWJvbCB2aXNpYmlsdHkgc2NyaXB0cyBoaWRpbmcgc3ltYm9scyB0aGF0IHN0ZGlvCiBsb29rcyB1
cCBhdCBydW50aW1lLCByZXN1bHRpbmcgaW4gaXQgc2VnZmF1bHRpbmcuCkBAIC0xMiwxNiArMTcs
MzEgQEAgcmVtb3ZlIHRoZSBzY3JpcHRzIHRvIHdvcmsgYXJvdW5kIHRoZSBwcm9ibGVtIHVudGls
IGJpbnV0aWxzIGlzIGZpeGVkLgogCiBVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUKIFNp
Z25lZC1vZmYtYnk6IFJvc3MgQnVydG9uIDxyb3NzLmJ1cnRvbkBpbnRlbC5jb20+CistLS0KKyBN
YWtlZmlsZS5hbSB8IDYgKystLS0tCisgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
NCBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL01ha2VmaWxlLmFtIGIvTWFrZWZpbGUuYW0K
LWluZGV4IGQ3MDcyNWMuLjc2YWU0MzIgMTAwNjQ0CitpbmRleCAzZGMzYmI1Li4zYmU1Y2NiIDEw
MDY0NAogLS0tIGEvTWFrZWZpbGUuYW0KICsrKyBiL01ha2VmaWxlLmFtCi1AQCAtMTMyLDIgKzEz
MiBAQCBzcmNfY29ubm1hbmRfTERBREQgPSBnZGJ1cy9saWJnZGJ1cy1pbnRlcm5hbC5sYSAkKGJ1
aWx0aW5fbGliYWRkKSBcCitAQCAtMTQzLDggKzE0Myw3IEBAIHNyY19jb25ubWFuZF9MREFERCA9
IGdkYnVzL2xpYmdkYnVzLWludGVybmFsLmxhICQoYnVpbHRpbl9saWJhZGQpIFwKKyAJCQlAR0lP
X0xJQlNAIEBHTElCX0xJQlNAIEBEQlVTX0xJQlNAIEBHTlVUTFNfTElCU0AgXAorIAkJCS1scmVz
b2x2IC1sZGwgLWxydAorIAogLXNyY19jb25ubWFuZF9MREZMQUdTID0gLVdsLC0tZXhwb3J0LWR5
bmFtaWMgXAogLQkJCQktV2wsLS12ZXJzaW9uLXNjcmlwdD0kKHNyY2Rpcikvc3JjL2Nvbm5tYW4u
dmVyCiArc3JjX2Nvbm5tYW5kX0xERkxBR1MgPSAtV2wsLS1leHBvcnQtZHluYW1pYwotQEAgLTE2
NiwyICsxNjUgQEAgdnBuX2Nvbm5tYW5fdnBuZF9MREFERCA9IGdkYnVzL2xpYmdkYnVzLWludGVy
bmFsLmxhICQoYnVpbHRpbl92cG5fbGliYWRkKSBcCisgCisgc3JjX2Nvbm5tYW5kX3dhaXRfb25s
aW5lX1NPVVJDRVMgPSBzcmMvY29ubm1hbmQtd2FpdC1vbmxpbmUuYworIAorQEAgLTE4Nyw4ICsx
ODYsNyBAQCB2cG5fY29ubm1hbl92cG5kX0xEQUREID0gZ2RidXMvbGliZ2RidXMtaW50ZXJuYWwu
bGEgJChidWlsdGluX3Zwbl9saWJhZGQpIFwKKyAJCQkJQEdJT19MSUJTQCBAR0xJQl9MSUJTQCBA
REJVU19MSUJTQCBAR05VVExTX0xJQlNAIFwKKyAJCQkJLWxyZXNvbHYgLWxkbAorIAogLXZwbl9j
b25ubWFuX3ZwbmRfTERGTEFHUyA9IC1XbCwtLWV4cG9ydC1keW5hbWljIFwKIC0JCQkJLVdsLC0t
dmVyc2lvbi1zY3JpcHQ9JChzcmNkaXIpL3Zwbi92cG4udmVyCiArdnBuX2Nvbm5tYW5fdnBuZF9M
REZMQUdTID0gLVdsLC0tZXhwb3J0LWR5bmFtaWMKKyBlbmRpZgorIAorIEJVSUxUX1NPVVJDRVMg
PSAkKGxvY2FsX2hlYWRlcnMpIHNyYy9idWlsdGluLmggJChzZXJ2aWNlX2ZpbGVzKSBcCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2Nvbm5tYW4vY29ubm1hbl8xLjQzLmJi
IGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9jb25ubWFuL2Nvbm5tYW5fMS40NC5iYgpzaW1p
bGFyaXR5IGluZGV4IDg0JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2Nv
bm5tYW4vY29ubm1hbl8xLjQzLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5
L2Nvbm5tYW4vY29ubm1hbl8xLjQ0LmJiCmluZGV4IDExMDA1OTk0OTAuLjM5NmQ4YmM1Y2UgMTAw
NjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvY29ubm1hbi9jb25ubWFuXzEuNDMu
YmIKKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9jb25ubWFuL2Nvbm5tYW5fMS40NC5i
YgpAQCAtOSw3ICs5LDcgQEAgU1JDX1VSSSA9ICIke0tFUk5FTE9SR19NSVJST1J9L2xpbnV4L25l
dHdvcmsvJHtCUE59LyR7QlB9LnRhci54eiBcCiAgICAgICAgICAgICIKIAogCi1TUkNfVVJJW3No
YTI1NnN1bV0gPSAiMTI1N2NlYmUzMjdlNzkwMGI3ZTJiODRjMGZiMzMwYWE5MDgxNWU0NTU4OThj
ZDJmOTQxZjQzMDhlZDJiZTNiYyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIyYmUyYjAwMzIxNjMy
Yjc3NWY5ZWZmNzEzYWNkMDRlZjIxZTMxZmJmMzg4ZjZlYmY0NTUxMmZmNDI4OTU3NGZmIgogCiBS
UkVDT01NRU5EUzoke1BOfSA9ICJjb25ubWFuLWNvbmYiCiBSQ09ORkxJQ1RTOiR7UE59ID0gIm5l
dHdvcmttYW5hZ2VyIgotLSAKMi40Ny4xCgo=

--===============2467134155001604412==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/connman/connman-client: PV changed from "1.43" to "1.44"
packages/core2-64-poky-linux/connman/connman-client: PKGV changed from 1.43 [default] to 1.44 [default]
packages/core2-64-poky-linux/connman/connman-dbg: PV changed from "1.43" to "1.44"
packages/core2-64-poky-linux/connman/connman-dbg: PKGV changed from 1.43 [default] to 1.44 [default]
packages/core2-64-poky-linux/connman/connman-dbg: PKGSIZE changed from 5988488 to 6023104 (+1%)
packages/core2-64-poky-linux/connman/connman-dev: PV changed from "1.43" to "1.44"
packages/core2-64-poky-linux/connman/connman-dev: PKGV changed from 1.43 [default] to 1.44 [default]
packages/core2-64-poky-linux/connman/connman-doc: PV changed from "1.43" to "1.44"
packages/core2-64-poky-linux/connman/connman-doc: PKGV changed from 1.43 [default] to 1.44 [default]
packages/core2-64-poky-linux/connman/connman-locale: PV changed from "1.43" to "1.44"
packages/core2-64-poky-linux/connman/connman-locale: PKGV changed from 1.43 [default] to 1.44 [default]
packages/core2-64-poky-linux/connman/connman-src: PV changed from "1.43" to "1.44"
packages/core2-64-poky-linux/connman/connman-src: PKGV changed from 1.43 [default] to 1.44 [default]
packages/core2-64-poky-linux/connman/connman-src: PKGSIZE changed from 2907373 to 2935297 (+1%)
packages/core2-64-poky-linux/connman/connman-staticdev: PV changed from "1.43" to "1.44"
packages/core2-64-poky-linux/connman/connman-staticdev: PKGV changed from 1.43 [default] to 1.44 [default]
packages/core2-64-poky-linux/connman/connman-tests: PV changed from "1.43" to "1.44"
packages/core2-64-poky-linux/connman/connman-tests: PKGV changed from 1.43 [default] to 1.44 [default]
packages/core2-64-poky-linux/connman/connman-tools: PV changed from "1.43" to "1.44"
packages/core2-64-poky-linux/connman/connman-tools: PKGV changed from 1.43 [default] to 1.44 [default]
packages/core2-64-poky-linux/connman/connman-vpn: PV changed from "1.43" to "1.44"
packages/core2-64-poky-linux/connman/connman-vpn: PKGV changed from 1.43 [default] to 1.44 [default]
packages/core2-64-poky-linux/connman/connman-wait-online: PV changed from "1.43" to "1.44"
packages/core2-64-poky-linux/connman/connman-wait-online: PKGV changed from 1.43 [default] to 1.44 [default]
packages/core2-64-poky-linux/connman/connman: PV changed from "1.43" to "1.44"
packages/core2-64-poky-linux/connman/connman: PKGV changed from 1.43 [default] to 1.44 [default]
packages/core2-64-poky-linux/connman/connman: PKGSIZE changed from 1077132 to 1081660 (+0%)
packages/core2-64-poky-linux/connman: SRC_URI changed from "https://cdn.kernel.org/pub/linux/network/connman/connman-1.43.tar.xz file://0001-plugin.h-Change-visibility-to-default-for-debug-symb.patch file://0001-connman.service-stop-systemd-resolved-when-we-use-co.patch file://connman file://no-version-scripts.patch file://0002-resolve-musl-does-not-implement-res_ninit.patch" to "https://cdn.kernel.org/pub/linux/network/connman/connman-1.44.tar.xz file://0001-plugin.h-Change-visibility-to-default-for-debug-symb.patch file://0001-connman.service-stop-systemd-resolved-when-we-use-co.patch file://connman file://no-version-scripts.patch file://0002-resolve-musl-does-not-implement-res_ninit.patch"
packages/core2-64-poky-linux/connman: PV changed from "1.43" to "1.44"
packages/core2-64-poky-linux/connman: PKGV changed from 1.43 [default] to 1.44 [default]

--===============2467134155001604412==--

