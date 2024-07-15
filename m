Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B9C1C3DA65
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 19:19:13 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.1382.1721071149225354608
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jul 2024 12:19:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=dZzRoAj3;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=abxjYmqL;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010190b7d59e29-96a03fb5-5aed-4df5-b91d-593d62430c20-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1721071148;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Qt0pe5GcSjvLvEK5cKG1k9U8Ei6EQGwuWCYraMPHOOw=;
	b=dZzRoAj3r4qWEZJ2K0HdMxbqsBYfVYCTBPBy6tw8jKotObs16zW6hnBxP5B+7fn4
	zbb+7c+2Wchq/DME0z6gcZo6kL4y30wq7q/7R+uIFaqu/vN2hlGPkPXhvOWZl4CBvL0
	m+jJpvGvUGg0RiaIqvdA4y4m5lK0HU29FZSOvRc0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1721071148;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Qt0pe5GcSjvLvEK5cKG1k9U8Ei6EQGwuWCYraMPHOOw=;
	b=abxjYmqLEDXj6vVe5TIedzkJmX9t4dobd2/Hre0pgRxPhZVeHP+OMp2ydcv+wrjz
	ckcc85VfDqMZEJG7Y9kFrVZgN/L+5MYQYF3nYEuRFpd3C8V9M4HsZROxnawQ5lCXe7m
	y2OYBiDRWDDp7GDEtcF2fpNptfFmbYkYerW2ulW0=
Content-Type: multipart/mixed; boundary="===============6325936002931666413=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gdbm: upgrading to 1.24 SUCCEEDED
Message-ID: <01010190b7d59e29-96a03fb5-5aed-4df5-b91d-593d62430c20-000000@us-west-2.amazonses.com>
Date: Mon, 15 Jul 2024 19:19:08 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.07.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 19:19:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202056

--===============6325936002931666413==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gdbm* to *1.24* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gdbm-upgrade-1.23-1.24.patch
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
From 12dfab3f407b54ecb3225a94fa7870076bbe191d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Jul 2024 18:21:42 +0000
Subject: [PATCH] gdbm: upgrade 1.23 -> 1.24

---
 meta/recipes-support/gdbm/files/ptest.patch          | 12 ++++--------
 .../gdbm/{gdbm_1.23.bb => gdbm_1.24.bb}              |  2 +-
 2 files changed, 5 insertions(+), 9 deletions(-)
 rename meta/recipes-support/gdbm/{gdbm_1.23.bb => gdbm_1.24.bb} (94%)

diff --git a/meta/recipes-support/gdbm/files/ptest.patch b/meta/recipes-support/gdbm/files/ptest.patch
index 25fb6bb2f4..4acdf2e294 100644
--- a/meta/recipes-support/gdbm/files/ptest.patch
+++ b/meta/recipes-support/gdbm/files/ptest.patch
@@ -1,4 +1,4 @@
-From 8bea84a598b51a7ac7e50aa8f0f20857a9b6b07b Mon Sep 17 00:00:00 2001
+From b0505e4e8a27074153b0799e017c71828fb240e4 Mon Sep 17 00:00:00 2001
 From: Josep Puigdemont <josep.puigdemont@enea.com>
 Date: Sun, 4 May 2014 16:02:07 +0200
 Subject: [PATCH] Add install-ptest rules.
@@ -6,14 +6,13 @@ Subject: [PATCH] Add install-ptest rules.
 Signed-off-by: Josep Puigdemont <josep.puigdemont@enea.com>
 Signed-off-by: Maxin B. John <maxin.john@enea.com>
 Upstream-Status: Pending
-
 ---
  Makefile.am       |  5 +++++
  tests/Makefile.am | 12 ++++++++++++
  2 files changed, 17 insertions(+)
 
 diff --git a/Makefile.am b/Makefile.am
-index 59e2643..5f3ceb0 100644
+index d0b46ea..6c57b11 100644
 --- a/Makefile.am
 +++ b/Makefile.am
 @@ -64,3 +64,8 @@ ChangeLog:
@@ -26,10 +25,10 @@ index 59e2643..5f3ceb0 100644
 +		$(MAKE) -C $$subdir DESTDIR=$(DESTDIR)/$$subdir $@; \
 +	done
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index fac6826..5dc2091 100644
+index eb071ac..9d14fe8 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
-@@ -143,3 +143,15 @@ d_creat_ce_LDADD = ../src/libgdbm.la ../compat/libgdbm_compat.la
+@@ -145,3 +145,15 @@ d_creat_ce_LDADD = ../src/libgdbm.la ../compat/libgdbm_compat.la
  t_wordwrap_LDADD = ../tools/libgdbmapp.a
  
  SUBDIRS = gdbmtool
@@ -45,6 +44,3 @@ index fac6826..5dc2091 100644
 +			$(INSTALL_PROGRAM) $$file $(DESTDIR) ; \
 +		fi \
 +	done
--- 
-2.25.1
-
diff --git a/meta/recipes-support/gdbm/gdbm_1.23.bb b/meta/recipes-support/gdbm/gdbm_1.24.bb
similarity index 94%
rename from meta/recipes-support/gdbm/gdbm_1.23.bb
rename to meta/recipes-support/gdbm/gdbm_1.24.bb
index a08079741d..88f9fa47cf 100644
--- a/meta/recipes-support/gdbm/gdbm_1.23.bb
+++ b/meta/recipes-support/gdbm/gdbm_1.24.bb
@@ -13,7 +13,7 @@ SRC_URI = "${GNU_MIRROR}/gdbm/gdbm-${PV}.tar.gz \
            file://ptest.patch \
           "
 
-SRC_URI[sha256sum] = "74b1081d21fff13ae4bd7c16e5d6e504a4c26f7cde1dca0d963a484174bbcacd"
+SRC_URI[sha256sum] = "695e9827fdf763513f133910bc7e6cfdb9187943a4fec943e57449723d2b8dbf"
 
 inherit autotools gettext texinfo lib_package ptest
 
-- 
2.44.0


--===============6325936002931666413==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-gdbm-upgrade-1.23-1.24.patch"

RnJvbSAxMmRmYWIzZjQwN2I1NGVjYjMyMjVhOTRmYTc4NzAwNzZiYmUxOTFkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgSnVsIDIwMjQgMTg6MjE6NDIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
ZGJtOiB1cGdyYWRlIDEuMjMgLT4gMS4yNAoKLS0tCiBtZXRhL3JlY2lwZXMtc3VwcG9ydC9nZGJt
L2ZpbGVzL3B0ZXN0LnBhdGNoICAgICAgICAgIHwgMTIgKysrKy0tLS0tLS0tCiAuLi4vZ2RibS97
Z2RibV8xLjIzLmJiID0+IGdkYm1fMS4yNC5iYn0gICAgICAgICAgICAgIHwgIDIgKy0KIDIgZmls
ZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1zdXBwb3J0L2dkYm0ve2dkYm1fMS4yMy5iYiA9PiBnZGJtXzEuMjQuYmJ9ICg5NCUp
CgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ2RibS9maWxlcy9wdGVzdC5wYXRj
aCBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dkYm0vZmlsZXMvcHRlc3QucGF0Y2gKaW5kZXggMjVm
YjZiYjJmNC4uNGFjZGYyZTI5NCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ2Ri
bS9maWxlcy9wdGVzdC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9nZGJtL2ZpbGVz
L3B0ZXN0LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA4YmVhODRhNTk4YjUxYTdhYzdlNTBh
YThmMGYyMDg1N2E5YjZiMDdiIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBiMDUwNWU0
ZThhMjcwNzQxNTNiMDc5OWUwMTdjNzE4MjhmYjI0MGU0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQogRnJvbTogSm9zZXAgUHVpZ2RlbW9udCA8am9zZXAucHVpZ2RlbW9udEBlbmVhLmNvbT4KIERh
dGU6IFN1biwgNCBNYXkgMjAxNCAxNjowMjowNyArMDIwMAogU3ViamVjdDogW1BBVENIXSBBZGQg
aW5zdGFsbC1wdGVzdCBydWxlcy4KQEAgLTYsMTQgKzYsMTMgQEAgU3ViamVjdDogW1BBVENIXSBB
ZGQgaW5zdGFsbC1wdGVzdCBydWxlcy4KIFNpZ25lZC1vZmYtYnk6IEpvc2VwIFB1aWdkZW1vbnQg
PGpvc2VwLnB1aWdkZW1vbnRAZW5lYS5jb20+CiBTaWduZWQtb2ZmLWJ5OiBNYXhpbiBCLiBKb2hu
IDxtYXhpbi5qb2huQGVuZWEuY29tPgogVXBzdHJlYW0tU3RhdHVzOiBQZW5kaW5nCi0KIC0tLQog
IE1ha2VmaWxlLmFtICAgICAgIHwgIDUgKysrKysKICB0ZXN0cy9NYWtlZmlsZS5hbSB8IDEyICsr
KysrKysrKysrKwogIDIgZmlsZXMgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKQogCiBkaWZmIC0t
Z2l0IGEvTWFrZWZpbGUuYW0gYi9NYWtlZmlsZS5hbQotaW5kZXggNTllMjY0My4uNWYzY2ViMCAx
MDA2NDQKK2luZGV4IGQwYjQ2ZWEuLjZjNTdiMTEgMTAwNjQ0CiAtLS0gYS9NYWtlZmlsZS5hbQog
KysrIGIvTWFrZWZpbGUuYW0KIEBAIC02NCwzICs2NCw4IEBAIENoYW5nZUxvZzoKQEAgLTI2LDEw
ICsyNSwxMCBAQCBpbmRleCA1OWUyNjQzLi41ZjNjZWIwIDEwMDY0NAogKwkJJChNQUtFKSAtQyAk
JHN1YmRpciBERVNURElSPSQoREVTVERJUikvJCRzdWJkaXIgJEA7IFwKICsJZG9uZQogZGlmZiAt
LWdpdCBhL3Rlc3RzL01ha2VmaWxlLmFtIGIvdGVzdHMvTWFrZWZpbGUuYW0KLWluZGV4IGZhYzY4
MjYuLjVkYzIwOTEgMTAwNjQ0CitpbmRleCBlYjA3MWFjLi45ZDE0ZmU4IDEwMDY0NAogLS0tIGEv
dGVzdHMvTWFrZWZpbGUuYW0KICsrKyBiL3Rlc3RzL01ha2VmaWxlLmFtCi1AQCAtMTQzLDMgKzE0
MywxNSBAQCBkX2NyZWF0X2NlX0xEQUREID0gLi4vc3JjL2xpYmdkYm0ubGEgLi4vY29tcGF0L2xp
YmdkYm1fY29tcGF0LmxhCitAQCAtMTQ1LDMgKzE0NSwxNSBAQCBkX2NyZWF0X2NlX0xEQUREID0g
Li4vc3JjL2xpYmdkYm0ubGEgLi4vY29tcGF0L2xpYmdkYm1fY29tcGF0LmxhCiAgdF93b3Jkd3Jh
cF9MREFERCA9IC4uL3Rvb2xzL2xpYmdkYm1hcHAuYQogIAogIFNVQkRJUlMgPSBnZGJtdG9vbApA
QCAtNDUsNiArNDQsMyBAQCBpbmRleCBmYWM2ODI2Li41ZGMyMDkxIDEwMDY0NAogKwkJCSQoSU5T
VEFMTF9QUk9HUkFNKSAkJGZpbGUgJChERVNURElSKSA7IFwKICsJCWZpIFwKICsJZG9uZQotLS0g
Ci0yLjI1LjEKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ2RibS9nZGJtXzEu
MjMuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9nZGJtL2dkYm1fMS4yNC5iYgpzaW1pbGFyaXR5
IGluZGV4IDk0JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtc3VwcG9ydC9nZGJtL2dkYm1fMS4y
My5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ2RibS9nZGJtXzEuMjQuYmIKaW5k
ZXggYTA4MDc5NzQxZC4uODhmOWZhNDdjZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBv
cnQvZ2RibS9nZGJtXzEuMjMuYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ2RibS9nZGJt
XzEuMjQuYmIKQEAgLTEzLDcgKzEzLDcgQEAgU1JDX1VSSSA9ICIke0dOVV9NSVJST1J9L2dkYm0v
Z2RibS0ke1BWfS50YXIuZ3ogXAogICAgICAgICAgICBmaWxlOi8vcHRlc3QucGF0Y2ggXAogICAg
ICAgICAgICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjc0YjEwODFkMjFmZmYxM2FlNGJkN2Mx
NmU1ZDZlNTA0YTRjMjZmN2NkZTFkY2EwZDk2M2E0ODQxNzRiYmNhY2QiCitTUkNfVVJJW3NoYTI1
NnN1bV0gPSAiNjk1ZTk4MjdmZGY3NjM1MTNmMTMzOTEwYmM3ZTZjZmRiOTE4Nzk0M2E0ZmVjOTQz
ZTU3NDQ5NzIzZDJiOGRiZiIKIAogaW5oZXJpdCBhdXRvdG9vbHMgZ2V0dGV4dCB0ZXhpbmZvIGxp
Yl9wYWNrYWdlIHB0ZXN0CiAKLS0gCjIuNDQuMAoK

--===============6325936002931666413==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/gdbm/gdbm-locale-de: PKGSIZE changed from 15277 to 23647 (+55%)
packages/core2-64-poky-linux/gdbm/gdbm-locale-es: PKGSIZE changed from 12179 to 23345 (+92%)
packages/core2-64-poky-linux/gdbm/gdbm-locale-fr: PKGSIZE changed from 20389 to 24363 (+19%)
packages/core2-64-poky-linux/gdbm/gdbm-locale-pl: PKGSIZE changed from 19418 to 23403 (+21%)
packages/core2-64-poky-linux/gdbm/gdbm-locale-ru: PKGSIZE changed from 24671 to 28995 (+18%)
packages/core2-64-poky-linux/gdbm/gdbm-locale-sr: PKGSIZE changed from 24744 to 28781 (+16%)
packages/core2-64-poky-linux/gdbm/gdbm-locale-sv: PKGSIZE changed from 14879 to 22524 (+51%)
packages/core2-64-poky-linux/gdbm/gdbm-locale-uk: PKGSIZE changed from 25847 to 30517 (+18%)
packages/core2-64-poky-linux/gdbm/gdbm-ptest: FILELIST: added "/usr/lib/gdbm/ptest/tests/t_dumpload"
packages/core2-64-poky-linux/gdbm: PACKAGES: added "gdbm-locale-ro gdbm-locale-ka"

--===============6325936002931666413==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/gdbm/gdbm-bin: PKGSIZE changed from 212680 to 211656 (-0%)
packages/core2-64-poky-linux/gdbm/gdbm-bin: PKGV changed from 1.23 [default] to 1.24 [default]
packages/core2-64-poky-linux/gdbm/gdbm-bin: PV changed from "1.23" to "1.24"
packages/core2-64-poky-linux/gdbm/gdbm-compat: PKGV changed from 1.23 [default] to 1.24 [default]
packages/core2-64-poky-linux/gdbm/gdbm-compat: PV changed from "1.23" to "1.24"
packages/core2-64-poky-linux/gdbm/gdbm-dbg: PKGSIZE changed from 1152512 to 1183304 (+3%)
packages/core2-64-poky-linux/gdbm/gdbm-dbg: FILELIST: added "/usr/lib/gdbm/ptest/tests/.debug/t_dumpload"
packages/core2-64-poky-linux/gdbm/gdbm-dbg: PKGV changed from 1.23 [default] to 1.24 [default]
packages/core2-64-poky-linux/gdbm/gdbm-dbg: PV changed from "1.23" to "1.24"
packages/core2-64-poky-linux/gdbm/gdbm-dev: PKGSIZE changed from 16084 to 16231 (+1%)
packages/core2-64-poky-linux/gdbm/gdbm-dev: PKGV changed from 1.23 [default] to 1.24 [default]
packages/core2-64-poky-linux/gdbm/gdbm-dev: PV changed from "1.23" to "1.24"
packages/core2-64-poky-linux/gdbm/gdbm-doc: PKGSIZE changed from 261400 to 263751 (+1%)
packages/core2-64-poky-linux/gdbm/gdbm-doc: PKGV changed from 1.23 [default] to 1.24 [default]
packages/core2-64-poky-linux/gdbm/gdbm-doc: PV changed from "1.23" to "1.24"
packages/core2-64-poky-linux/gdbm/gdbm-locale-da: PKGSIZE changed from 11717 to 11528 (-2%)
packages/core2-64-poky-linux/gdbm/gdbm-locale-da: PKGV changed from 1.23 [default] to 1.24 [default]
packages/core2-64-poky-linux/gdbm/gdbm-locale-da: PV changed from "1.23" to "1.24"
packages/core2-64-poky-linux/gdbm/gdbm-locale-de: PKGSIZE changed from 15277 to 23647 (+55%)
packages/core2-64-poky-linux/gdbm/gdbm-locale-de: PKGV changed from 1.23 [default] to 1.24 [default]
packages/core2-64-poky-linux/gdbm/gdbm-locale-de: PV changed from "1.23" to "1.24"
packages/core2-64-poky-linux/gdbm/gdbm-locale-eo: PKGSIZE changed from 14901 to 14714 (-1%)
packages/core2-64-poky-linux/gdbm/gdbm-locale-eo: PKGV changed from 1.23 [default] to 1.24 [default]
packages/core2-64-poky-linux/gdbm/gdbm-locale-eo: PV changed from "1.23" to "1.24"
packages/core2-64-poky-linux/gdbm/gdbm-locale-es: PKGSIZE changed from 12179 to 23345 (+92%)
packages/core2-64-poky-linux/gdbm/gdbm-locale-es: PKGV changed from 1.23 [default] to 1.24 [default]
packages/core2-64-poky-linux/gdbm/gdbm-locale-es: PV changed from "1.23" to "1.24"
packages/core2-64-poky-linux/gdbm/gdbm-locale-fi: PKGSIZE changed from 10139 to 9916 (-2%)
packages/core2-64-poky-linux/gdbm/gdbm-locale-fi: PKGV changed from 1.23 [default] to 1.24 [default]
packages/core2-64-poky-linux/gdbm/gdbm-locale-fi: PV changed from "1.23" to "1.24"
packages/core2-64-poky-linux/gdbm/gdbm-locale-fr: PKGSIZE changed from 20389 to 24363 (+19%)
packages/core2-64-poky-linux/gdbm/gdbm-locale-fr: PKGV changed from 1.23 [default] to 1.24 [default]
packages/core2-64-poky-linux/gdbm/gdbm-locale-fr: PV changed from "1.23" to "1.24"
packages/core2-64-poky-linux/gdbm/gdbm-locale-ja: PKGSIZE changed from 4234 to 4193 (-1%)
packages/core2-64-poky-linux/gdbm/gdbm-locale-ja: PKGV changed from 1.23 [default] to 1.24 [default]
packages/core2-64-poky-linux/gdbm/gdbm-locale-ja: PV changed from "1.23" to "1.24"
packages/core2-64-poky-linux/gdbm/gdbm-locale-pl: PKGSIZE changed from 19418 to 23403 (+21%)
packages/core2-64-poky-linux/gdbm/gdbm-locale-pl: PKGV changed from 1.23 [default] to 1.24 [default]
packages/core2-64-poky-linux/gdbm/gdbm-locale-pl: PV changed from "1.23" to "1.24"
packages/core2-64-poky-linux/gdbm/gdbm-locale-pt-br: PKGSIZE changed from 19584 to 19392 (-1%)
packages/core2-64-poky-linux/gdbm/gdbm-locale-pt-br: PKGV changed from 1.23 [default] to 1.24 [default]
packages/core2-64-poky-linux/gdbm/gdbm-locale-pt-br: PV changed from "1.23" to "1.24"
packages/core2-64-poky-linux/gdbm/gdbm-locale-ru: PKGSIZE changed from 24671 to 28995 (+18%)
packages/core2-64-poky-linux/gdbm/gdbm-locale-ru: PKGV changed from 1.23 [default] to 1.24 [default]
packages/core2-64-poky-linux/gdbm/gdbm-locale-ru: PV changed from "1.23" to "1.24"
packages/core2-64-poky-linux/gdbm/gdbm-locale-sr: PKGSIZE changed from 24744 to 28781 (+16%)
packages/core2-64-poky-linux/gdbm/gdbm-locale-sr: PKGV changed from 1.23 [default] to 1.24 [default]
packages/core2-64-poky-linux/gdbm/gdbm-locale-sr: PV changed from "1.23" to "1.24"
packages/core2-64-poky-linux/gdbm/gdbm-locale-sv: PKGSIZE changed from 14879 to 22524 (+51%)
packages/core2-64-poky-linux/gdbm/gdbm-locale-sv: PKGV changed from 1.23 [default] to 1.24 [default]
packages/core2-64-poky-linux/gdbm/gdbm-locale-sv: PV changed from "1.23" to "1.24"
packages/core2-64-poky-linux/gdbm/gdbm-locale-uk: PKGSIZE changed from 25847 to 30517 (+18%)
packages/core2-64-poky-linux/gdbm/gdbm-locale-uk: PKGV changed from 1.23 [default] to 1.24 [default]
packages/core2-64-poky-linux/gdbm/gdbm-locale-uk: PV changed from "1.23" to "1.24"
packages/core2-64-poky-linux/gdbm/gdbm-locale-vi: PKGSIZE changed from 14487 to 14288 (-1%)
packages/core2-64-poky-linux/gdbm/gdbm-locale-vi: PKGV changed from 1.23 [default] to 1.24 [default]
packages/core2-64-poky-linux/gdbm/gdbm-locale-vi: PV changed from "1.23" to "1.24"
packages/core2-64-poky-linux/gdbm/gdbm-ptest: PKGSIZE changed from 398389 to 417721 (+5%)
packages/core2-64-poky-linux/gdbm/gdbm-ptest: FILELIST: added "/usr/lib/gdbm/ptest/tests/t_dumpload"
packages/core2-64-poky-linux/gdbm/gdbm-ptest: PKGV changed from 1.23 [default] to 1.24 [default]
packages/core2-64-poky-linux/gdbm/gdbm-ptest: PV changed from "1.23" to "1.24"
packages/core2-64-poky-linux/gdbm/gdbm-src: PKGSIZE changed from 669479 to 679469 (+1%)
packages/core2-64-poky-linux/gdbm/gdbm-src: FILELIST: directory renamed /usr/src/debug/gdbm/1.23/compat -> /usr/src/debug/gdbm/1.24/compat, directory renamed /usr/src/debug/gdbm/1.23/src -> /usr/src/debug/gdbm/1.24/src, directory renamed /usr/src/debug/gdbm/1.23/tools -> /usr/src/debug/gdbm/1.24/tools, removed "/usr/src/debug/gdbm/1.23/tests/fdop.c /usr/src/debug/gdbm/1.23/tests/gtver.c /usr/src/debug/gdbm/1.23/tests/dtload.c /usr/src/debug/gdbm/1.23/tests/gtload.c /usr/src/debug/gdbm/1.23/tests/num2word.c /usr/src/debug/gdbm/1.23/tests/dtfetch.c /usr/src/debug/gdbm/1.23/tests/gtfetch.c /usr/src/debug/gdbm/1.23/tests/closerr.c /usr/src/debug/gdbm/1.23/tests/gtrecover.c /usr/src/debug/gdbm/1.23/tests/g_reorg_ce.c /usr/src/debug/gdbm/1.23/tests/g_open_ce.c /usr/src/debug/gdbm/1.23/tests/t_wordwrap.c /usr/src/debug/gdbm/1.23/tests/progname.h /usr/src/debug/gdbm/1.23/tests/gtconv.c /usr/src/debug/gdbm/1.23/tests/dtdump.c /usr/src/debug/gdbm/1.23/tests/gtdump.c /usr/src/debug/gdbm/1.23/te
 sts/gtopt.c /usr/src/debug/gdbm/1.23/tests/dtdel.c /usr/src/debug/gdbm/1.23/tests/gtdel.c /usr/src/debug/gdbm/1.23/tests/gtcacheopt.c /usr/src/debug/gdbm/1.23/tests/d_creat_ce.c", added "/usr/src/debug/gdbm/1.24/tests/fdop.c /usr/src/debug/gdbm/1.24/tests/gtver.c /usr/src/debug/gdbm/1.24/tests/dtload.c /usr/src/debug/gdbm/1.24/tests/gtload.c /usr/src/debug/gdbm/1.24/tests/num2word.c /usr/src/debug/gdbm/1.24/tests/dtfetch.c /usr/src/debug/gdbm/1.24/tests/gtfetch.c /usr/src/debug/gdbm/1.24/tests/closerr.c /usr/src/debug/gdbm/1.24/tests/gtrecover.c /usr/src/debug/gdbm/1.24/tests/g_reorg_ce.c /usr/src/debug/gdbm/1.24/tests/g_open_ce.c /usr/src/debug/gdbm/1.24/tests/t_wordwrap.c /usr/src/debug/gdbm/1.24/tests/progname.h /usr/src/debug/gdbm/1.24/tests/gtconv.c /usr/src/debug/gdbm/1.24/tests/dtdump.c /usr/src/debug/gdbm/1.24/tests/gtdump.c /usr/src/debug/gdbm/1.24/tests/gtopt.c /usr/src/debug/gdbm/1.24/tests/dtdel.c /usr/src/debug/gdbm/1.24/tests/gtdel.c /usr/src/debug/gdbm/1.24/tests/t_du
 mpload.c /usr/src/debug/gdbm/1.24/tests/gtcacheopt.c /usr/src/debug/gdbm/1.24/tests/d_creat_ce.c"
packages/core2-64-poky-linux/gdbm/gdbm-src: PKGV changed from 1.23 [default] to 1.24 [default]
packages/core2-64-poky-linux/gdbm/gdbm-src: PV changed from "1.23" to "1.24"
packages/core2-64-poky-linux/gdbm/gdbm-staticdev: PKGV changed from 1.23 [default] to 1.24 [default]
packages/core2-64-poky-linux/gdbm/gdbm-staticdev: PV changed from "1.23" to "1.24"
packages/core2-64-poky-linux/gdbm/gdbm: PKGV changed from 1.23 [default] to 1.24 [default]
packages/core2-64-poky-linux/gdbm/gdbm: PV changed from "1.23" to "1.24"
packages/core2-64-poky-linux/gdbm: SRC_URI changed from "https://ftp.gnu.org/gnu/gdbm/gdbm-1.23.tar.gz file://run-ptest file://ptest.patch" to "https://ftp.gnu.org/gnu/gdbm/gdbm-1.24.tar.gz file://run-ptest file://ptest.patch"
packages/core2-64-poky-linux/gdbm: PACKAGES: added "gdbm-locale-ka gdbm-locale-ro"
packages/core2-64-poky-linux/gdbm: PKGV changed from 1.23 [default] to 1.24 [default]
packages/core2-64-poky-linux/gdbm: PV changed from "1.23" to "1.24"
packages/core2-64-poky-linux/perl/perl-dbg: PKGSIZE changed from 25349736 to 25349784 (+0%)

--===============6325936002931666413==--

