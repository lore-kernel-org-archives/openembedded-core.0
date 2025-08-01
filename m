Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD946CA0EDB
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 14:08:00 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.88636.1754057271655229901
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Aug 2025 07:07:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=otpBymgE;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=lNt7m178;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019865f5ffb7-40e96c88-1034-4a07-83ab-00e07086c5e2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1754057277;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=jOwU7F13BZSB16tRyNSglXjQk2t4JXyxz1jzGtKRGiE=;
	b=otpBymgE4+6550P12Qng968CA6cJgybDmtygUmjPHUYwakrqlwsBE0BlBdGv65Y4
	Hb7bwebHo4Tt9rt5gQgE4knKX6H/liqQW/fMQyV54ePckl9yNSAb50sa99T1ADD6VCC
	lIw7CjHLARnn6lLiwx8xTbWtESJCT9EvkdRxaEWY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1754057277;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=jOwU7F13BZSB16tRyNSglXjQk2t4JXyxz1jzGtKRGiE=;
	b=lNt7m178LQ6vFaShiw/XDXFmhgO4PeyoIGD235KF8fcxE0PtH7wxCFXoxU7tUyjg
	HNxm8TpjqtD4N8yu2z4Fbvhuv1aX1L7gGVJ/h6VKppyBsT5l4mXMSC92YvNYE7ylt/C
	55kAwwGrZ8J9rLg22xqrohKrxRaFfx2Gdc73HtQA=
Content-Type: multipart/mixed; boundary="===============2405613687060691452=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] man-pages: upgrading to 6.15 SUCCEEDED
Message-ID: <0101019865f5ffb7-40e96c88-1034-4a07-83ab-00e07086c5e2-000000@us-west-2.amazonses.com>
Date: Fri, 1 Aug 2025 14:07:57 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.08.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 14:08:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221297

--===============2405613687060691452==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *man-pages* to *6.15* has Succeeded.

Next steps:
    - apply the patch: git am 0001-man-pages-upgrade-6.14-6.15.patch
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
From 1cd841a3f7bf2229ffc4a58b35c461bd4da37177 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Aug 2025 10:35:23 +0000
Subject: [PATCH] man-pages: upgrade 6.14 -> 6.15

---
 .../{man-pages_6.14.bb => man-pages_6.15.bb}  | 37 ++++++++++++++++++-
 1 file changed, 35 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/man-pages/{man-pages_6.14.bb => man-pages_6.15.bb} (66%)

diff --git a/meta/recipes-extended/man-pages/man-pages_6.14.bb b/meta/recipes-extended/man-pages/man-pages_6.15.bb
similarity index 66%
rename from meta/recipes-extended/man-pages/man-pages_6.14.bb
rename to meta/recipes-extended/man-pages/man-pages_6.15.bb
index 92afff640d..e96aff5678 100644
--- a/meta/recipes-extended/man-pages/man-pages_6.14.bb
+++ b/meta/recipes-extended/man-pages/man-pages_6.15.bb
@@ -1,10 +1,43 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- README
+# +++ README
+# @@ -16,6 +16,10 @@
+#         a few pages in sections 5 and 8 for the timezone utilities.
+#  
+#  Files
+# +   AUTHORS
+# +       List of individuals and organizations that have contributed
+# +       content to the project.
+# +
+#     CONTRIBUTING
+#     CONTRIBUTING.d/*
+#         Instructions for reporting bugs and contributing.
+# @@ -50,7 +54,7 @@
+#         Configuration files for (linter) programs called by the build
+#         system.
+#  
+# -   man*/*
+# +   man/*
+#         Manual pages.
+#  
+#     scripts/*
+# 
+#
+
 SUMMARY = "Linux man-pages"
 DESCRIPTION = "The Linux man-pages project documents the Linux kernel and C library interfaces that are employed by user programs"
 SECTION = "console/utils"
 HOMEPAGE = "http://www.kernel.org/pub/linux/docs/man-pages"
 LICENSE = "GPL-2.0-or-later & GPL-2.0-only & GPL-1.0-or-later & BSD-2-Clause & BSD-3-Clause & BSD-4-Clause-UC & MIT"
 
-LIC_FILES_CHKSUM = "file://README;md5=72cff06b7954222c24d38bc2c41b234e \
+LIC_FILES_CHKSUM = "file://README;md5=c2d6fa1a74bdd79c25de6f4db7332294 \
                     file://LICENSES/BSD-2-Clause.txt;md5=9e16594a228301089d759b4f178db91f \
                     file://LICENSES/BSD-3-Clause.txt;md5=407426fcc1a243b7b2eff6e35c56aca9 \
                     file://LICENSES/BSD-4-Clause-UC.txt;md5=1da3cf8ad50cd8d5d1de3cfc53196d01 \
@@ -20,7 +53,7 @@ LIC_FILES_CHKSUM = "file://README;md5=72cff06b7954222c24d38bc2c41b234e \
 SRC_URI = "${KERNELORG_MIRROR}/linux/docs/${BPN}/${BP}.tar.gz \
            "
 
-SRC_URI[sha256sum] = "a298963d8baf37fa5ecd2b07c803e1f29ab0476add405a7e263e5c63baf43588"
+SRC_URI[sha256sum] = "f0ede747b98732cb6d5bd36e9ab54101ea7ae5f78a8b8d7289ced01c1a6ec937"
 
 inherit manpages lib_package
 
-- 
2.47.1


--===============2405613687060691452==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-man-pages-upgrade-6.14-6.15.patch"

RnJvbSAxY2Q4NDFhM2Y3YmYyMjI5ZmZjNGE1OGIzNWM0NjFiZDRkYTM3MTc3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBBdWcgMjAyNSAxMDozNToyMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG1h
bi1wYWdlczogdXBncmFkZSA2LjE0IC0+IDYuMTUKCi0tLQogLi4uL3ttYW4tcGFnZXNfNi4xNC5i
YiA9PiBtYW4tcGFnZXNfNi4xNS5iYn0gIHwgMzcgKysrKysrKysrKysrKysrKysrLQogMSBmaWxl
IGNoYW5nZWQsIDM1IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWV4dGVuZGVkL21hbi1wYWdlcy97bWFuLXBhZ2VzXzYuMTQuYmIgPT4gbWFuLXBhZ2Vz
XzYuMTUuYmJ9ICg2NiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL21hbi1w
YWdlcy9tYW4tcGFnZXNfNi4xNC5iYiBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9tYW4tcGFnZXMv
bWFuLXBhZ2VzXzYuMTUuYmIKc2ltaWxhcml0eSBpbmRleCA2NiUKcmVuYW1lIGZyb20gbWV0YS9y
ZWNpcGVzLWV4dGVuZGVkL21hbi1wYWdlcy9tYW4tcGFnZXNfNi4xNC5iYgpyZW5hbWUgdG8gbWV0
YS9yZWNpcGVzLWV4dGVuZGVkL21hbi1wYWdlcy9tYW4tcGFnZXNfNi4xNS5iYgppbmRleCA5MmFm
ZmY2NDBkLi5lOTZhZmY1Njc4IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbWFu
LXBhZ2VzL21hbi1wYWdlc182LjE0LmJiCisrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9tYW4t
cGFnZXMvbWFuLXBhZ2VzXzYuMTUuYmIKQEAgLTEsMTAgKzEsNDMgQEAKKyMgRklYTUU6IHRoZSBM
SUNfRklMRVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBkYXRlZCBieSAnZGV2dG9vbCB1cGdy
YWRlJy4KKyMgVGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBvbGQg
YW5kIHRoZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2UgdXBkYXRlIHRoZSBMSUNFTlNFIHZh
bHVlIGlmIG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hhbmdlcyBpbgorIyB0aGUgY29tbWl0
IG1lc3NhZ2UgdmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4KKyMgKGV4YW1wbGU6ICdMaWNlbnNl
LVVwZGF0ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykKKyMKKyMgVGhlIGNoYW5nZXM6Cisj
CisjIC0tLSBSRUFETUUKKyMgKysrIFJFQURNRQorIyBAQCAtMTYsNiArMTYsMTAgQEAKKyMgICAg
ICAgICBhIGZldyBwYWdlcyBpbiBzZWN0aW9ucyA1IGFuZCA4IGZvciB0aGUgdGltZXpvbmUgdXRp
bGl0aWVzLgorIyAgCisjICBGaWxlcworIyArICAgQVVUSE9SUworIyArICAgICAgIExpc3Qgb2Yg
aW5kaXZpZHVhbHMgYW5kIG9yZ2FuaXphdGlvbnMgdGhhdCBoYXZlIGNvbnRyaWJ1dGVkCisjICsg
ICAgICAgY29udGVudCB0byB0aGUgcHJvamVjdC4KKyMgKworIyAgICAgQ09OVFJJQlVUSU5HCisj
ICAgICBDT05UUklCVVRJTkcuZC8qCisjICAgICAgICAgSW5zdHJ1Y3Rpb25zIGZvciByZXBvcnRp
bmcgYnVncyBhbmQgY29udHJpYnV0aW5nLgorIyBAQCAtNTAsNyArNTQsNyBAQAorIyAgICAgICAg
IENvbmZpZ3VyYXRpb24gZmlsZXMgZm9yIChsaW50ZXIpIHByb2dyYW1zIGNhbGxlZCBieSB0aGUg
YnVpbGQKKyMgICAgICAgICBzeXN0ZW0uCisjICAKKyMgLSAgIG1hbiovKgorIyArICAgbWFuLyoK
KyMgICAgICAgICBNYW51YWwgcGFnZXMuCisjICAKKyMgICAgIHNjcmlwdHMvKgorIyAKKyMKKwog
U1VNTUFSWSA9ICJMaW51eCBtYW4tcGFnZXMiCiBERVNDUklQVElPTiA9ICJUaGUgTGludXggbWFu
LXBhZ2VzIHByb2plY3QgZG9jdW1lbnRzIHRoZSBMaW51eCBrZXJuZWwgYW5kIEMgbGlicmFyeSBp
bnRlcmZhY2VzIHRoYXQgYXJlIGVtcGxveWVkIGJ5IHVzZXIgcHJvZ3JhbXMiCiBTRUNUSU9OID0g
ImNvbnNvbGUvdXRpbHMiCiBIT01FUEFHRSA9ICJodHRwOi8vd3d3Lmtlcm5lbC5vcmcvcHViL2xp
bnV4L2RvY3MvbWFuLXBhZ2VzIgogTElDRU5TRSA9ICJHUEwtMi4wLW9yLWxhdGVyICYgR1BMLTIu
MC1vbmx5ICYgR1BMLTEuMC1vci1sYXRlciAmIEJTRC0yLUNsYXVzZSAmIEJTRC0zLUNsYXVzZSAm
IEJTRC00LUNsYXVzZS1VQyAmIE1JVCIKIAotTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vUkVB
RE1FO21kNT03MmNmZjA2Yjc5NTQyMjJjMjRkMzhiYzJjNDFiMjM0ZSBcCitMSUNfRklMRVNfQ0hL
U1VNID0gImZpbGU6Ly9SRUFETUU7bWQ1PWMyZDZmYTFhNzRiZGQ3OWMyNWRlNmY0ZGI3MzMyMjk0
IFwKICAgICAgICAgICAgICAgICAgICAgZmlsZTovL0xJQ0VOU0VTL0JTRC0yLUNsYXVzZS50eHQ7
bWQ1PTllMTY1OTRhMjI4MzAxMDg5ZDc1OWI0ZjE3OGRiOTFmIFwKICAgICAgICAgICAgICAgICAg
ICAgZmlsZTovL0xJQ0VOU0VTL0JTRC0zLUNsYXVzZS50eHQ7bWQ1PTQwNzQyNmZjYzFhMjQzYjdi
MmVmZjZlMzVjNTZhY2E5IFwKICAgICAgICAgICAgICAgICAgICAgZmlsZTovL0xJQ0VOU0VTL0JT
RC00LUNsYXVzZS1VQy50eHQ7bWQ1PTFkYTNjZjhhZDUwY2Q4ZDVkMWRlM2NmYzUzMTk2ZDAxIFwK
QEAgLTIwLDcgKzUzLDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vUkVBRE1FO21kNT03
MmNmZjA2Yjc5NTQyMjJjMjRkMzhiYzJjNDFiMjM0ZSBcCiBTUkNfVVJJID0gIiR7S0VSTkVMT1JH
X01JUlJPUn0vbGludXgvZG9jcy8ke0JQTn0vJHtCUH0udGFyLmd6IFwKICAgICAgICAgICAgIgog
Ci1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiYTI5ODk2M2Q4YmFmMzdmYTVlY2QyYjA3YzgwM2UxZjI5
YWIwNDc2YWRkNDA1YTdlMjYzZTVjNjNiYWY0MzU4OCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJm
MGVkZTc0N2I5ODczMmNiNmQ1YmQzNmU5YWI1NDEwMWVhN2FlNWY3OGE4YjhkNzI4OWNlZDAxYzFh
NmVjOTM3IgogCiBpbmhlcml0IG1hbnBhZ2VzIGxpYl9wYWNrYWdlCiAKLS0gCjIuNDcuMQoK

--===============2405613687060691452==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/man-pages: SRC_URI changed from "https://cdn.kernel.org/pub/linux/docs/man-pages/man-pages-6.14.tar.gz" to "https://cdn.kernel.org/pub/linux/docs/man-pages/man-pages-6.15.tar.gz"
packages/core2-64-poky-linux/man-pages: PV changed from "6.14" to "6.15"
packages/core2-64-poky-linux/man-pages: PKGV changed from 6.14 [default] to 6.15 [default]
packages/core2-64-poky-linux/man-pages/man-pages-bin: PKGSIZE changed from 2626 to 2606 (-1%)
packages/core2-64-poky-linux/man-pages/man-pages-bin: PV changed from "6.14" to "6.15"
packages/core2-64-poky-linux/man-pages/man-pages-bin: PKGV changed from 6.14 [default] to 6.15 [default]
packages/core2-64-poky-linux/man-pages/man-pages-dbg: PV changed from "6.14" to "6.15"
packages/core2-64-poky-linux/man-pages/man-pages-dbg: PKGV changed from 6.14 [default] to 6.15 [default]
packages/core2-64-poky-linux/man-pages/man-pages-dev: PV changed from "6.14" to "6.15"
packages/core2-64-poky-linux/man-pages/man-pages-dev: PKGV changed from 6.14 [default] to 6.15 [default]
packages/core2-64-poky-linux/man-pages/man-pages-doc: PV changed from "6.14" to "6.15"
packages/core2-64-poky-linux/man-pages/man-pages-doc: PKGV changed from 6.14 [default] to 6.15 [default]
packages/core2-64-poky-linux/man-pages/man-pages-locale: PV changed from "6.14" to "6.15"
packages/core2-64-poky-linux/man-pages/man-pages-locale: PKGV changed from 6.14 [default] to 6.15 [default]
packages/core2-64-poky-linux/man-pages/man-pages-src: PV changed from "6.14" to "6.15"
packages/core2-64-poky-linux/man-pages/man-pages-src: PKGV changed from 6.14 [default] to 6.15 [default]
packages/core2-64-poky-linux/man-pages/man-pages-staticdev: PV changed from "6.14" to "6.15"
packages/core2-64-poky-linux/man-pages/man-pages-staticdev: PKGV changed from 6.14 [default] to 6.15 [default]
packages/core2-64-poky-linux/man-pages/man-pages: PKGSIZE changed from 7519861 to 7549097 (+0%)
packages/core2-64-poky-linux/man-pages/man-pages: FILELIST: added "/usr/share/man/man2const/F_GET_RW_HINT.2const /usr/share/man/man2const/F_SET_RW_HINT.2const /usr/share/man/man2const/F_SETLEASE.2const /usr/share/man/man2const/FUTEX_LOCK_PI2.2const /usr/share/man/man3attr/gnu::aligned.3attr /usr/share/man/man2const/F_DUPFD.2const /usr/share/man/man2const/F_GETFD.2const /usr/share/man/man2const/F_GETFL.2const /usr/share/man/man2const/F_GETLK.2const /usr/share/man/man2const/FUTEX_UNLOCK_PI.2const /usr/share/man/man2const/F_SETFD.2const /usr/share/man/man2const/F_SETFL.2const /usr/share/man/man2const/F_SETLK.2const /usr/share/man/man2/cachestat.2 /usr/share/man/man2const/F_GETOWN.2const /usr/share/man/man2const/F_SETOWN.2const /usr/share/man/man3attr/gnu::format.3attr /usr/share/man/man2const/F_DUPFD_CLOEXEC.2const /usr/share/man/man2const/FUTEX_FD.2const /usr/share/man/man2const/F_GETPIPE_SZ.2const /usr/share/man/man2const/F_SETPIPE_SZ.2const /usr/share/man/man2const/FUTEX_WAIT_REQUEUE
 _PI.2const /usr/share/man/man2const/FUTEX_WAKE_OP.2const /usr/share/man/man2const/FUTEX_TRYLOCK_PI.2const /usr/share/man/man3attr/intro.3attr /usr/share/man/man2const/FUTEX_CMP_REQUEUE_PI.2const /usr/share/man/man2const/F_GETOWN_EX.2const /usr/share/man/man2const/F_OFD_GETLK.2const /usr/share/man/man2const/F_OFD_SETLK.2const /usr/share/man/man2const/F_ADD_SEALS.2const /usr/share/man/man2const/F_GET_SEALS.2const /usr/share/man/man2const/PR_FUTEX_HASH.2const /usr/share/man/man2const/FUTEX_WAKE.2const /usr/share/man/man2const/FUTEX_LOCK_PI.2const /usr/share/man/man2const/VT_GETCONSIZECSRPOS.2const /usr/share/man/man2const/F_NOTIFY.2const /usr/share/man/man2const/F_GET_FILE_RW_HINT.2const /usr/share/man/man2const/F_SET_FILE_RW_HINT.2const /usr/share/man/man2const/F_OFD_SETLKW.2const /usr/share/man/man2const/F_GETSIG.2const /usr/share/man/man2const/FUTEX_REQUEUE.2const /usr/share/man/man2/fcntl_locking.2 /usr/share/man/man2const/F_SETSIG.2const /usr/share/man/man2const/FUTEX_CMP_REQUEUE.
 2const /usr/share/man/man2const/FUTEX_WAKE_BITSET.2const /usr/share/man/man2const/FUTEX_WAIT.2const /usr/share/man/man2const/F_SETLKW.2const /usr/share/man/man2const/FUTEX_WAIT_BITSET.2const /usr/share/man/man2const/F_GETLEASE.2const /usr/share/man/man2const/F_SETOWN_EX.2const"
packages/core2-64-poky-linux/man-pages/man-pages: PV changed from "6.14" to "6.15"
packages/core2-64-poky-linux/man-pages/man-pages: PKGV changed from 6.14 [default] to 6.15 [default]

--===============2405613687060691452==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/man-pages/man-pages: FILELIST: added "/usr/share/man/man2const/F_SETLKW.2const /usr/share/man/man2const/F_SETOWN.2const /usr/share/man/man2const/FUTEX_WAIT.2const /usr/share/man/man2const/FUTEX_WAKE_OP.2const /usr/share/man/man2const/VT_GETCONSIZECSRPOS.2const /usr/share/man/man2const/F_GET_FILE_RW_HINT.2const /usr/share/man/man2const/F_SET_FILE_RW_HINT.2const /usr/share/man/man2const/FUTEX_LOCK_PI2.2const /usr/share/man/man3attr/gnu::aligned.3attr /usr/share/man/man2/cachestat.2 /usr/share/man/man2const/F_GETOWN_EX.2const /usr/share/man/man2const/F_SETOWN_EX.2const /usr/share/man/man3attr/gnu::format.3attr /usr/share/man/man2const/FUTEX_REQUEUE.2const /usr/share/man/man2/fcntl_locking.2 /usr/share/man/man2const/FUTEX_CMP_REQUEUE_PI.2const /usr/share/man/man2const/FUTEX_LOCK_PI.2const /usr/share/man/man2const/F_OFD_SETLKW.2const /usr/share/man/man2const/F_GETLEASE.2const /usr/share/man/man2const/F_SETLEASE.2const /usr/share/man/man2const/F_GET_RW_HINT.2co
 nst /usr/share/man/man2const/F_SET_RW_HINT.2const /usr/share/man/man2const/FUTEX_WAKE_BITSET.2const /usr/share/man/man2const/FUTEX_WAIT_BITSET.2const /usr/share/man/man2const/F_DUPFD_CLOEXEC.2const /usr/share/man/man2const/F_SETFL.2const /usr/share/man/man2const/F_DUPFD.2const /usr/share/man/man2const/F_GETFD.2const /usr/share/man/man2const/FUTEX_CMP_REQUEUE.2const /usr/share/man/man2const/F_GETFL.2const /usr/share/man/man2const/F_GETLK.2const /usr/share/man/man2const/F_SETFD.2const /usr/share/man/man2const/F_SETLK.2const /usr/share/man/man2const/F_NOTIFY.2const /usr/share/man/man2const/F_GETSIG.2const /usr/share/man/man2const/F_SETSIG.2const /usr/share/man/man3attr/intro.3attr /usr/share/man/man2const/PR_FUTEX_HASH.2const /usr/share/man/man2const/F_GETPIPE_SZ.2const /usr/share/man/man2const/F_SETPIPE_SZ.2const /usr/share/man/man2const/FUTEX_WAIT_REQUEUE_PI.2const /usr/share/man/man2const/FUTEX_FD.2const /usr/share/man/man2const/F_OFD_GETLK.2const /usr/share/man/man2const/FUTEX_WAKE
 .2const /usr/share/man/man2const/F_OFD_SETLK.2const /usr/share/man/man2const/FUTEX_TRYLOCK_PI.2const /usr/share/man/man2const/F_GETOWN.2const /usr/share/man/man2const/F_ADD_SEALS.2const /usr/share/man/man2const/F_GET_SEALS.2const /usr/share/man/man2const/FUTEX_UNLOCK_PI.2const"

--===============2405613687060691452==--

