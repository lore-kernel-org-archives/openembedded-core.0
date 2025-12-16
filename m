Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 574EBD5C0DD
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:26 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17398.1765872136614573548
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=PWo6bjYS;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=WupBuKjC;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019b262e6ca0-949f1cac-29b8-47de-ac23-f37f2af85873-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872136;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=+2dX45NmKNRaCR3kNuTtbbm9D2SOwEtU50nBoCMtCkw=;
	b=PWo6bjYSE1LEPT02ap/xJarBVDRYtIuV7NA216a0FJTaonbh8K2EOt/K6vDCqjXc
	hU6VwhFqvVvpmwCr+199/V49cYqHUY1zJrW8euMjAi2QLNS0T7pUkBlIucw963uBljg
	OqnyR9grH0IeV2l/DV3BwcFbzeKjJldG84jxfbVk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872136;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=+2dX45NmKNRaCR3kNuTtbbm9D2SOwEtU50nBoCMtCkw=;
	b=WupBuKjC2WYMbU9AKbfdN0MNHcciQzRXq+PHcy4U3j15dX8sCr82P5F9jeIQtqUE
	afRpip3d2KNt8L87b58kWIziUTd92yAv4dEhDSwkQkXOlv2iV8M2ofbERVyh1CUga+R
	HCPACe1x4ioUBVLowVPHRoiW3uKsqPaAdpHpX1us=
Content-Type: multipart/mixed; boundary="===============1653246916916583735=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] iproute2: upgrading to 6.18.0 FAILED
Message-ID: <0101019b262e6ca0-949f1cac-29b8-47de-ac23-f37f2af85873-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:15 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227785

--===============1653246916916583735==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *iproute2* to *6.18.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-iproute2-upgrade-6.17.0-6.18.0.patch
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
From d92a2f4ef7a35e28b52994153cd15cb7edbff7da Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Dec 2025 22:03:27 +0000
Subject: [PATCH] iproute2: upgrade 6.17.0 -> 6.18.0

---
 ...nk.h-add-missing-include-for-htobe64.patch |  2 +-
 ...ridge-avoid-redefinition-of-in6_addr.patch | 34 -------------------
 ...{iproute2_6.17.0.bb => iproute2_6.18.0.bb} |  3 +-
 3 files changed, 2 insertions(+), 37 deletions(-)
 delete mode 100644 meta/recipes-connectivity/iproute2/iproute2/0002-lib-bridge-avoid-redefinition-of-in6_addr.patch
 rename meta/recipes-connectivity/iproute2/{iproute2_6.17.0.bb => iproute2_6.18.0.bb} (95%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2/0001-include-libnetlink.h-add-missing-include-for-htobe64.patch b/meta/recipes-connectivity/iproute2/iproute2/0001-include-libnetlink.h-add-missing-include-for-htobe64.patch
index c4dea39676..614cd00499 100644
--- a/meta/recipes-connectivity/iproute2/iproute2/0001-include-libnetlink.h-add-missing-include-for-htobe64.patch
+++ b/meta/recipes-connectivity/iproute2/iproute2/0001-include-libnetlink.h-add-missing-include-for-htobe64.patch
@@ -1,4 +1,4 @@
-From 9e427aa1c647f741b08a1f0c44483ea974c7fc61 Mon Sep 17 00:00:00 2001
+From 228a051a53a4e6b1ca2640932cb78a23e44454a8 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Sat, 24 Aug 2024 15:32:25 +0200
 Subject: [PATCH] include/libnetlink.h: add missing include for htobe64
diff --git a/meta/recipes-connectivity/iproute2/iproute2/0002-lib-bridge-avoid-redefinition-of-in6_addr.patch b/meta/recipes-connectivity/iproute2/iproute2/0002-lib-bridge-avoid-redefinition-of-in6_addr.patch
deleted file mode 100644
index 5315358024..0000000000
--- a/meta/recipes-connectivity/iproute2/iproute2/0002-lib-bridge-avoid-redefinition-of-in6_addr.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From ad944bd173cacc098f224e7db7248d7210821fca Mon Sep 17 00:00:00 2001
-From: Yureka <yureka@cyberchaos.dev>
-Date: Sun, 12 Oct 2025 14:39:47 +0200
-Subject: [PATCH] lib: bridge: avoid redefinition of in6_addr
-
-On musl libc, which does not use the kernel definitions of in6_addr, including
-the libc headers after the kernel (UAPI) headers would cause a redefinition
-error. The opposite order avoids the redefinition.
-
-Fixes: 9e89d5b94d749f37525cd8778311e1c9f28f172a
-Signed-off-by: Yureka <yureka@cyberchaos.dev>
-Signed-off-by: Stephen Hemminger <stephen@networkplumber.org>
-
-Upstream-Status: Backport [https://git.kernel.org/pub/scm/network/iproute2/iproute2.git/commit/?id=25b2834cc974729229afcd308f127995405f85c5]
-(cherry picked from commit 25b2834cc974729229afcd308f127995405f85c5)
-Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
----
- lib/bridge.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lib/bridge.c b/lib/bridge.c
-index 5386aa01..104f5858 100644
---- a/lib/bridge.c
-+++ b/lib/bridge.c
-@@ -2,8 +2,8 @@
- 
- #include <net/if.h>
- 
--#include "bridge.h"
- #include "utils.h"
-+#include "bridge.h"
- 
- void bridge_print_vlan_flags(__u16 flags)
- {
diff --git a/meta/recipes-connectivity/iproute2/iproute2_6.17.0.bb b/meta/recipes-connectivity/iproute2/iproute2_6.18.0.bb
similarity index 95%
rename from meta/recipes-connectivity/iproute2/iproute2_6.17.0.bb
rename to meta/recipes-connectivity/iproute2/iproute2_6.18.0.bb
index 8840e4ba89..60f93437e1 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_6.17.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_6.18.0.bb
@@ -13,10 +13,9 @@ DEPENDS = "flex-native bison-native libcap"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
            file://0001-include-libnetlink.h-add-missing-include-for-htobe64.patch \
-           file://0002-lib-bridge-avoid-redefinition-of-in6_addr.patch \
            "
 
-SRC_URI[sha256sum] = "9781e59410ab7dea8e9f79bb10ff1488e63d10fcbb70503b94426ba27a8e2dec"
+SRC_URI[sha256sum] = "6ba520e1975e4c50dc931eeae91ea37c198b8a173744885f8895b84325f9d456"
 
 inherit update-alternatives bash-completion pkgconfig
 
-- 
2.47.1


--===============1653246916916583735==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-iproute2-upgrade-6.17.0-6.18.0.patch"

RnJvbSBkOTJhMmY0ZWY3YTM1ZTI4YjUyOTk0MTUzY2QxNWNiN2VkYmZmN2RhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgRGVjIDIwMjUgMjI6MDM6MjcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBp
cHJvdXRlMjogdXBncmFkZSA2LjE3LjAgLT4gNi4xOC4wCgotLS0KIC4uLm5rLmgtYWRkLW1pc3Np
bmctaW5jbHVkZS1mb3ItaHRvYmU2NC5wYXRjaCB8ICAyICstCiAuLi5yaWRnZS1hdm9pZC1yZWRl
ZmluaXRpb24tb2YtaW42X2FkZHIucGF0Y2ggfCAzNCAtLS0tLS0tLS0tLS0tLS0tLS0tCiAuLi57
aXByb3V0ZTJfNi4xNy4wLmJiID0+IGlwcm91dGUyXzYuMTguMC5iYn0gfCAgMyArLQogMyBmaWxl
cyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDM3IGRlbGV0aW9ucygtKQogZGVsZXRlIG1vZGUg
MTAwNjQ0IG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvaXByb3V0ZTIvaXByb3V0ZTIvMDAwMi1s
aWItYnJpZGdlLWF2b2lkLXJlZGVmaW5pdGlvbi1vZi1pbjZfYWRkci5wYXRjaAogcmVuYW1lIG1l
dGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvaXByb3V0ZTIve2lwcm91dGUyXzYuMTcuMC5iYiA9PiBp
cHJvdXRlMl82LjE4LjAuYmJ9ICg5NSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5l
Y3Rpdml0eS9pcHJvdXRlMi9pcHJvdXRlMi8wMDAxLWluY2x1ZGUtbGlibmV0bGluay5oLWFkZC1t
aXNzaW5nLWluY2x1ZGUtZm9yLWh0b2JlNjQucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2
aXR5L2lwcm91dGUyL2lwcm91dGUyLzAwMDEtaW5jbHVkZS1saWJuZXRsaW5rLmgtYWRkLW1pc3Np
bmctaW5jbHVkZS1mb3ItaHRvYmU2NC5wYXRjaAppbmRleCBjNGRlYTM5Njc2Li42MTRjZDAwNDk5
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2lwcm91dGUyL2lwcm91dGUy
LzAwMDEtaW5jbHVkZS1saWJuZXRsaW5rLmgtYWRkLW1pc3NpbmctaW5jbHVkZS1mb3ItaHRvYmU2
NC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2lwcm91dGUyL2lwcm91dGUy
LzAwMDEtaW5jbHVkZS1saWJuZXRsaW5rLmgtYWRkLW1pc3NpbmctaW5jbHVkZS1mb3ItaHRvYmU2
NC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gOWU0MjdhYTFjNjQ3Zjc0MWIwOGExZjBjNDQ0
ODNlYTk3NGM3ZmM2MSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMjI4YTA1MWE1M2E0
ZTZiMWNhMjY0MDkzMmNiNzhhMjNlNDQ0NTRhOCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZy
b206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4QGxpbnV0cm9uaXguZGU+CiBEYXRlOiBTYXQsIDI0
IEF1ZyAyMDI0IDE1OjMyOjI1ICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hdIGluY2x1ZGUvbGlibmV0
bGluay5oOiBhZGQgbWlzc2luZyBpbmNsdWRlIGZvciBodG9iZTY0CmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtY29ubmVjdGl2aXR5L2lwcm91dGUyL2lwcm91dGUyLzAwMDItbGliLWJyaWRnZS1h
dm9pZC1yZWRlZmluaXRpb24tb2YtaW42X2FkZHIucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVj
dGl2aXR5L2lwcm91dGUyL2lwcm91dGUyLzAwMDItbGliLWJyaWRnZS1hdm9pZC1yZWRlZmluaXRp
b24tb2YtaW42X2FkZHIucGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDUzMTUz
NTgwMjQuLjAwMDAwMDAwMDAKLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9pcHJvdXRl
Mi9pcHJvdXRlMi8wMDAyLWxpYi1icmlkZ2UtYXZvaWQtcmVkZWZpbml0aW9uLW9mLWluNl9hZGRy
LnBhdGNoCisrKyAvZGV2L251bGwKQEAgLTEsMzQgKzAsMCBAQAotRnJvbSBhZDk0NGJkMTczY2Fj
YzA5OGYyMjRlN2RiNzI0OGQ3MjEwODIxZmNhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQotRnJv
bTogWXVyZWthIDx5dXJla2FAY3liZXJjaGFvcy5kZXY+Ci1EYXRlOiBTdW4sIDEyIE9jdCAyMDI1
IDE0OjM5OjQ3ICswMjAwCi1TdWJqZWN0OiBbUEFUQ0hdIGxpYjogYnJpZGdlOiBhdm9pZCByZWRl
ZmluaXRpb24gb2YgaW42X2FkZHIKLQotT24gbXVzbCBsaWJjLCB3aGljaCBkb2VzIG5vdCB1c2Ug
dGhlIGtlcm5lbCBkZWZpbml0aW9ucyBvZiBpbjZfYWRkciwgaW5jbHVkaW5nCi10aGUgbGliYyBo
ZWFkZXJzIGFmdGVyIHRoZSBrZXJuZWwgKFVBUEkpIGhlYWRlcnMgd291bGQgY2F1c2UgYSByZWRl
ZmluaXRpb24KLWVycm9yLiBUaGUgb3Bwb3NpdGUgb3JkZXIgYXZvaWRzIHRoZSByZWRlZmluaXRp
b24uCi0KLUZpeGVzOiA5ZTg5ZDViOTRkNzQ5ZjM3NTI1Y2Q4Nzc4MzExZTFjOWYyOGYxNzJhCi1T
aWduZWQtb2ZmLWJ5OiBZdXJla2EgPHl1cmVrYUBjeWJlcmNoYW9zLmRldj4KLVNpZ25lZC1vZmYt
Ynk6IFN0ZXBoZW4gSGVtbWluZ2VyIDxzdGVwaGVuQG5ldHdvcmtwbHVtYmVyLm9yZz4KLQotVXBz
dHJlYW0tU3RhdHVzOiBCYWNrcG9ydCBbaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL25l
dHdvcmsvaXByb3V0ZTIvaXByb3V0ZTIuZ2l0L2NvbW1pdC8/aWQ9MjViMjgzNGNjOTc0NzI5MjI5
YWZjZDMwOGYxMjc5OTU0MDVmODVjNV0KLShjaGVycnkgcGlja2VkIGZyb20gY29tbWl0IDI1YjI4
MzRjYzk3NDcyOTIyOWFmY2QzMDhmMTI3OTk1NDA1Zjg1YzUpCi1TaWduZWQtb2ZmLWJ5OiBBbmt1
ciBUeWFnaSA8YW5rdXIudHlhZ2k4NUBnbWFpbC5jb20+Ci0tLS0KLSBsaWIvYnJpZGdlLmMgfCAy
ICstCi0gMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCi0KLWRp
ZmYgLS1naXQgYS9saWIvYnJpZGdlLmMgYi9saWIvYnJpZGdlLmMKLWluZGV4IDUzODZhYTAxLi4x
MDRmNTg1OCAxMDA2NDQKLS0tLSBhL2xpYi9icmlkZ2UuYwotKysrIGIvbGliL2JyaWRnZS5jCi1A
QCAtMiw4ICsyLDggQEAKLSAKLSAjaW5jbHVkZSA8bmV0L2lmLmg+Ci0gCi0tI2luY2x1ZGUgImJy
aWRnZS5oIgotICNpbmNsdWRlICJ1dGlscy5oIgotKyNpbmNsdWRlICJicmlkZ2UuaCIKLSAKLSB2
b2lkIGJyaWRnZV9wcmludF92bGFuX2ZsYWdzKF9fdTE2IGZsYWdzKQotIHsKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvaXByb3V0ZTIvaXByb3V0ZTJfNi4xNy4wLmJiIGIv
bWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9pcHJvdXRlMi9pcHJvdXRlMl82LjE4LjAuYmIKc2lt
aWxhcml0eSBpbmRleCA5NSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9p
cHJvdXRlMi9pcHJvdXRlMl82LjE3LjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb25uZWN0
aXZpdHkvaXByb3V0ZTIvaXByb3V0ZTJfNi4xOC4wLmJiCmluZGV4IDg4NDBlNGJhODkuLjYwZjkz
NDM3ZTEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvaXByb3V0ZTIvaXBy
b3V0ZTJfNi4xNy4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvaXByb3V0ZTIv
aXByb3V0ZTJfNi4xOC4wLmJiCkBAIC0xMywxMCArMTMsOSBAQCBERVBFTkRTID0gImZsZXgtbmF0
aXZlIGJpc29uLW5hdGl2ZSBsaWJjYXAiCiAKIFNSQ19VUkkgPSAiJHtLRVJORUxPUkdfTUlSUk9S
fS9saW51eC91dGlscy9uZXQvJHtCUE59LyR7QlB9LnRhci54eiBcCiAgICAgICAgICAgIGZpbGU6
Ly8wMDAxLWluY2x1ZGUtbGlibmV0bGluay5oLWFkZC1taXNzaW5nLWluY2x1ZGUtZm9yLWh0b2Jl
NjQucGF0Y2ggXAotICAgICAgICAgICBmaWxlOi8vMDAwMi1saWItYnJpZGdlLWF2b2lkLXJlZGVm
aW5pdGlvbi1vZi1pbjZfYWRkci5wYXRjaCBcCiAgICAgICAgICAgICIKIAotU1JDX1VSSVtzaGEy
NTZzdW1dID0gIjk3ODFlNTk0MTBhYjdkZWE4ZTlmNzliYjEwZmYxNDg4ZTYzZDEwZmNiYjcwNTAz
Yjk0NDI2YmEyN2E4ZTJkZWMiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNmJhNTIwZTE5NzVlNGM1
MGRjOTMxZWVhZTkxZWEzN2MxOThiOGExNzM3NDQ4ODVmODg5NWI4NDMyNWY5ZDQ1NiIKIAogaW5o
ZXJpdCB1cGRhdGUtYWx0ZXJuYXRpdmVzIGJhc2gtY29tcGxldGlvbiBwa2djb25maWcKIAotLSAK
Mi40Ny4xCgo=

--===============1653246916916583735==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/iproute2/iproute2-bash-completion: PKGV changed from 6.17.0 [default] to 6.18.0 [default]
packages/x86-64-v3-poky-linux/iproute2/iproute2-bash-completion: PV changed from "6.17.0" to "6.18.0"
packages/x86-64-v3-poky-linux/iproute2/iproute2-bridge: PKGV changed from 6.17.0 [default] to 6.18.0 [default]
packages/x86-64-v3-poky-linux/iproute2/iproute2-bridge: PV changed from "6.17.0" to "6.18.0"
packages/x86-64-v3-poky-linux/iproute2/iproute2-dbg: PKGV changed from 6.17.0 [default] to 6.18.0 [default]
packages/x86-64-v3-poky-linux/iproute2/iproute2-dbg: PV changed from "6.17.0" to "6.18.0"
packages/x86-64-v3-poky-linux/iproute2/iproute2-dbg: PKGSIZE changed from 9154376 to 9162600 (+0%)
packages/x86-64-v3-poky-linux/iproute2/iproute2-dev: PKGV changed from 6.17.0 [default] to 6.18.0 [default]
packages/x86-64-v3-poky-linux/iproute2/iproute2-dev: PV changed from "6.17.0" to "6.18.0"
packages/x86-64-v3-poky-linux/iproute2/iproute2-devlink: PKGV changed from 6.17.0 [default] to 6.18.0 [default]
packages/x86-64-v3-poky-linux/iproute2/iproute2-devlink: PV changed from "6.17.0" to "6.18.0"
packages/x86-64-v3-poky-linux/iproute2/iproute2-doc: PKGV changed from 6.17.0 [default] to 6.18.0 [default]
packages/x86-64-v3-poky-linux/iproute2/iproute2-doc: PV changed from "6.17.0" to "6.18.0"
packages/x86-64-v3-poky-linux/iproute2/iproute2-genl: PKGV changed from 6.17.0 [default] to 6.18.0 [default]
packages/x86-64-v3-poky-linux/iproute2/iproute2-genl: PV changed from "6.17.0" to "6.18.0"
packages/x86-64-v3-poky-linux/iproute2/iproute2-ifstat: PKGV changed from 6.17.0 [default] to 6.18.0 [default]
packages/x86-64-v3-poky-linux/iproute2/iproute2-ifstat: PV changed from "6.17.0" to "6.18.0"
packages/x86-64-v3-poky-linux/iproute2/iproute2-ip: PKGV changed from 6.17.0 [default] to 6.18.0 [default]
packages/x86-64-v3-poky-linux/iproute2/iproute2-ip: PV changed from "6.17.0" to "6.18.0"
packages/x86-64-v3-poky-linux/iproute2/iproute2-ip: PKGSIZE changed from 727075 to 727107 (+0%)
packages/x86-64-v3-poky-linux/iproute2/iproute2-lnstat: PKGV changed from 6.17.0 [default] to 6.18.0 [default]
packages/x86-64-v3-poky-linux/iproute2/iproute2-lnstat: PV changed from "6.17.0" to "6.18.0"
packages/x86-64-v3-poky-linux/iproute2/iproute2-locale: PKGV changed from 6.17.0 [default] to 6.18.0 [default]
packages/x86-64-v3-poky-linux/iproute2/iproute2-locale: PV changed from "6.17.0" to "6.18.0"
packages/x86-64-v3-poky-linux/iproute2/iproute2-nstat: PKGV changed from 6.17.0 [default] to 6.18.0 [default]
packages/x86-64-v3-poky-linux/iproute2/iproute2-nstat: PV changed from "6.17.0" to "6.18.0"
packages/x86-64-v3-poky-linux/iproute2/iproute2-rdma: PKGV changed from 6.17.0 [default] to 6.18.0 [default]
packages/x86-64-v3-poky-linux/iproute2/iproute2-rdma: PV changed from "6.17.0" to "6.18.0"
packages/x86-64-v3-poky-linux/iproute2/iproute2-routel: PKGV changed from 6.17.0 [default] to 6.18.0 [default]
packages/x86-64-v3-poky-linux/iproute2/iproute2-routel: PV changed from "6.17.0" to "6.18.0"
packages/x86-64-v3-poky-linux/iproute2/iproute2-rtacct: PKGV changed from 6.17.0 [default] to 6.18.0 [default]
packages/x86-64-v3-poky-linux/iproute2/iproute2-rtacct: PV changed from "6.17.0" to "6.18.0"
packages/x86-64-v3-poky-linux/iproute2/iproute2-src: PKGV changed from 6.17.0 [default] to 6.18.0 [default]
packages/x86-64-v3-poky-linux/iproute2/iproute2-src: PV changed from "6.17.0" to "6.18.0"
packages/x86-64-v3-poky-linux/iproute2/iproute2-src: PKGSIZE changed from 3752671 to 3756934 (+0%)
packages/x86-64-v3-poky-linux/iproute2/iproute2-src: FILELIST: directory renamed /usr/src/debug/iproute2/6.17.0/bridge -> /usr/src/debug/iproute2/6.18.0/bridge, directory renamed /usr/src/debug/iproute2/6.17.0/include/uapi/linux/netfilter -> /usr/src/debug/iproute2/6.18.0/include/uapi/linux/netfilter, directory renamed /usr/src/debug/iproute2/6.17.0/tc -> /usr/src/debug/iproute2/6.18.0/tc, directory renamed /usr/src/debug/iproute2/6.17.0/devlink -> /usr/src/debug/iproute2/6.18.0/devlink, directory renamed /usr/src/debug/iproute2/6.17.0/genl -> /usr/src/debug/iproute2/6.18.0/genl, directory renamed /usr/src/debug/iproute2/6.17.0/include/uapi/asm-generic -> /usr/src/debug/iproute2/6.18.0/include/uapi/asm-generic, directory renamed /usr/src/debug/iproute2/6.17.0/tipc -> /usr/src/debug/iproute2/6.18.0/tipc, directory renamed /usr/src/debug/iproute2/6.17.0/include/uapi/linux -> /usr/src/debug/iproute2/6.18.0/include/uapi/linux, directory renamed /usr/src/debug/iproute2/6.17.0/include/uapi
 /linux/hdlc -> /usr/src/debug/iproute2/6.18.0/include/uapi/linux/hdlc, directory renamed /usr/src/debug/iproute2/6.17.0/include/uapi/linux/netfilter/ipset -> /usr/src/debug/iproute2/6.18.0/include/uapi/linux/netfilter/ipset, directory renamed /usr/src/debug/iproute2/6.17.0/include/uapi/linux/tc_ematch -> /usr/src/debug/iproute2/6.18.0/include/uapi/linux/tc_ematch, directory renamed /usr/src/debug/iproute2/6.17.0/include -> /usr/src/debug/iproute2/6.18.0/include, directory renamed /usr/src/debug/iproute2/6.17.0/ip -> /usr/src/debug/iproute2/6.18.0/ip, directory renamed /usr/src/debug/iproute2/6.17.0/include/uapi/linux/can -> /usr/src/debug/iproute2/6.18.0/include/uapi/linux/can, directory renamed /usr/src/debug/iproute2/6.17.0/misc -> /usr/src/debug/iproute2/6.18.0/misc, directory renamed /usr/src/debug/iproute2/6.17.0/include/uapi/linux/tc_act -> /usr/src/debug/iproute2/6.18.0/include/uapi/linux/tc_act, directory renamed /usr/src/debug/iproute2/6.17.0/lib -> /usr/src/debug/iproute2/
 6.18.0/lib
packages/x86-64-v3-poky-linux/iproute2/iproute2-ss: PKGV changed from 6.17.0 [default] to 6.18.0 [default]
packages/x86-64-v3-poky-linux/iproute2/iproute2-ss: PV changed from "6.17.0" to "6.18.0"
packages/x86-64-v3-poky-linux/iproute2/iproute2-staticdev: PKGV changed from 6.17.0 [default] to 6.18.0 [default]
packages/x86-64-v3-poky-linux/iproute2/iproute2-staticdev: PV changed from "6.17.0" to "6.18.0"
packages/x86-64-v3-poky-linux/iproute2/iproute2-tc: PKGV changed from 6.17.0 [default] to 6.18.0 [default]
packages/x86-64-v3-poky-linux/iproute2/iproute2-tc: PV changed from "6.17.0" to "6.18.0"
packages/x86-64-v3-poky-linux/iproute2/iproute2-tipc: PKGV changed from 6.17.0 [default] to 6.18.0 [default]
packages/x86-64-v3-poky-linux/iproute2/iproute2-tipc: PV changed from "6.17.0" to "6.18.0"
packages/x86-64-v3-poky-linux/iproute2/iproute2: PKGV changed from 6.17.0 [default] to 6.18.0 [default]
packages/x86-64-v3-poky-linux/iproute2/iproute2: PV changed from "6.17.0" to "6.18.0"
packages/x86-64-v3-poky-linux/iproute2: PKGV changed from 6.17.0 [default] to 6.18.0 [default]
packages/x86-64-v3-poky-linux/iproute2: PV changed from "6.17.0" to "6.18.0"
packages/x86-64-v3-poky-linux/iproute2: SRC_URI changed from "https://cdn.kernel.org/pub/linux/utils/net/iproute2/iproute2-6.17.0.tar.xz file://0001-include-libnetlink.h-add-missing-include-for-htobe64.patch file://0002-lib-bridge-avoid-redefinition-of-in6_addr.patch" to "https://cdn.kernel.org/pub/linux/utils/net/iproute2/iproute2-6.18.0.tar.xz file://0001-include-libnetlink.h-add-missing-include-for-htobe64.patch"

--===============1653246916916583735==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 949 .bb files complete (0 cached, 949 parsed). 1951 targets, 71 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-34bb9fd873a6a1274d9079dfefb3e67625eeae7e"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 = "tmp-auh-upgrades:34bb9fd873a6a1274d9079dfefb3e67625eeae7e"
meta-yocto-bsp       
meta-poky            = "master:b3b659263566c4d2f2813190e72d93f8598a4c47"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 452 Local 426 Mirrors 0 Missed 26 Current 250 (94% match, 96% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 251 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_package_qa_setscene)
NOTE: Running setscene task 261 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 262 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 287 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_package_qa_setscene)
NOTE: Running setscene task 305 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 306 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 317 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 325 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 330 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 342 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_create_spdx_setscene)
NOTE: Running setscene task 343 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_create_spdx_setscene)
NOTE: Running setscene task 344 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 345 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_create_spdx_setscene)
NOTE: Running setscene task 346 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_create_spdx_setscene)
NOTE: Running setscene task 349 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/iptables/iptables_1.8.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 352 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_create_spdx_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_package_qa_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_create_spdx_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe iptables-1.8.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 357 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_create_spdx_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 358 of 702 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 359 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 362 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.77.bb:do_create_spdx_setscene)
NOTE: Running setscene task 363 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.56.bb:do_create_spdx_setscene)
NOTE: Running setscene task 364 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 366 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_populate_sysroot_setscene)
NOTE: recipe fts-1.2.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 367 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_create_spdx_setscene)
NOTE: recipe json-c-0.18-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 368 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.46.bb:do_create_spdx_setscene)
NOTE: Running setscene task 369 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.17.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.13.9-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 370 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_packagedata_setscene)
NOTE: recipe python3-3.13.9-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 371 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.1.bb:do_create_spdx_setscene)
NOTE: recipe iptables-1.8.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libmnl-1.0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 376 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/iptables/iptables_1.8.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-2.77-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgpg-error-1.56-r0: task do_create_spdx_setscene: Started
NOTE: recipe file-5.46-r0: task do_create_spdx_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.17.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe e2fsprogs-native-1.47.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe sqlite3-3_3.51.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 377 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/iproute2/iproute2_6.18.0.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.77-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe iptables-1.8.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe nettle-3.10.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libgpg-error-1.56-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe file-5.46-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-3.13.9-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe e2fsprogs-native-1.47.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 383 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 384 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 385 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 386 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 387 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 389 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 390 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 391 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 392 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: recipe curl-8.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 394 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_packagedata_setscene)
NOTE: recipe libmnl-1.0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 395 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_15.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 396 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.45.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 398 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_create_spdx_setscene)
NOTE: recipe sqlite3-3_3.51.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 399 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_packagedata_setscene)
NOTE: recipe iptables-1.8.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 400 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: recipe iproute2-6.18.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe tzdata-2025b-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe coreutils-9.9-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe iproute2-6.18.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 401 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/iptables/iptables_1.8.11.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-2.45.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 402 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_create_spdx_setscene)
NOTE: recipe xz-5.8.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 403 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 405 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 408 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 409 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 418 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 419 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_packagedata_setscene)
NOTE: recipe iptables-1.8.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe tzdata-2025b-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 424 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe libmnl-1.0.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe iptables-1.8.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 433 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 436 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 437 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.1.bb:do_create_spdx_setscene)
NOTE: recipe binutils-2.45.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 442 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 444 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 449 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe coreutils-9.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libmnl-1.0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.4.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe elfutils-0.194-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.194-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 461 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 462 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 466 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: Running setscene task 467 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 469 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 471 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.2.bb:do_packagedata_setscene)
NOTE: recipe libmnl-1.0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.4.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 473 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 476 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 871 of 1953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/iptables/iptables_1.8.11.bb:do_fetch)
NOTE: Running task 872 of 1953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_fetch)
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 890 of 1953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/iproute2/iproute2_6.18.0.bb:do_fetch)
NOTE: recipe expat-2.7.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: Running task 907 of 1953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe elfutils-0.194-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe elfutils-0.194-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 482 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_package_setscene)
NOTE: recipe libmnl-1.0.5-r0: task do_fetch: Started
NOTE: recipe iptables-1.8.11-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe iproute2-6.18.0-r0: task do_fetch: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe iptables-1.8.11-r0: task do_fetch: Succeeded
NOTE: recipe python3-3.13.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe iproute2-6.18.0-r0: task do_fetch: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_fetch: Succeeded
NOTE: recipe expat-2.7.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 489 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 492 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: Running task 1075 of 1953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/iptables/iptables_1.8.11.bb:do_unpack)
NOTE: Running task 1076 of 1953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_unpack)
NOTE: Running task 1081 of 1953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/iproute2/iproute2_6.18.0.bb:do_unpack)
NOTE: Running task 1083 of 1953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1084 of 1953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe libmnl-1.0.5-r0: task do_unpack: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe iptables-1.8.11-r0: task do_unpack: Started
NOTE: recipe iproute2-6.18.0-r0: task do_unpack: Started
NOTE: recipe libmnl-1.0.5-r0: task do_unpack: Succeeded
NOTE: Running task 1085 of 1953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_patch)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 505 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1086 of 1953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe iproute2-6.18.0-r0: task do_unpack: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_patch: Started
NOTE: Running task 1087 of 1953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/iproute2/iproute2_6.18.0.bb:do_patch)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe iptables-1.8.11-r0: task do_unpack: Succeeded
NOTE: Running task 1088 of 1953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/iptables/iptables_1.8.11.bb:do_patch)
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1095 of 1953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_patch: Succeeded
NOTE: recipe iproute2-6.18.0-r0: task do_patch: Started
NOTE: recipe iptables-1.8.11-r0: task do_patch: Started
NOTE: recipe iptables-1.8.11-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe elfutils-0.194-r0: task do_package_setscene: Started
NOTE: recipe iproute2-6.18.0-r0: task do_patch: Succeeded
NOTE: Running task 1098 of 1953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/iproute2/iproute2_6.18.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1099 of 1953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/iproute2/iproute2_6.18.0.bb:do_populate_lic)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1100 of 1953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe iproute2-6.18.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe iproute2-6.18.0-r0: task do_populate_lic: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1101 of 1953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe iproute2-6.18.0-r0: task do_populate_lic: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/iproute2/iproute2_6.18.0.bb:do_populate_lic unihash changed to b642954b1410cf7cd4a7fb2b4761ee1641a003bfd054a5a3e41ee15345b536d3
NOTE: recipe iproute2-6.18.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/iproute2/iproute2_6.18.0.bb:do_deploy_source_date_epoch unihash changed to 48fa3d782f4cddab56a0c50e05e29420b5e6466be3cc9185c8f845d07f4aa17b
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe elfutils-0.194-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 513 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 514 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 515 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 516 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 517 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 518 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 519 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 520 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 521 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 522 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 523 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 524 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 525 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 526 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 527 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 528 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.51.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.51.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.194-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libarchive-3.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.194-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 529 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 531 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_recipe_qa_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 533 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_package_setscene)
NOTE: recipe sqlite3-3_3.51.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 537 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_recipe_qa_setscene)
NOTE: recipe libarchive-3.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 541 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.51.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 542 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.3.bb:do_package_setscene)
NOTE: Running setscene task 544 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.1.bb:do_recipe_qa_setscene)
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 546 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 548 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_recipe_qa_setscene)
NOTE: recipe json-c-0.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 550 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_recipe_qa_setscene)
NOTE: recipe libarchive-3.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe elfutils-0.194-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_package_setscene: Started
NOTE: recipe sqlite3-3_3.51.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libarchive-3.8.3-r0: task do_package_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe elfutils-0.194-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1104 of 1953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_fetch)
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.51.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libarchive-3.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe elfutils-0.194-r0: task do_fetch: Started
NOTE: recipe elfutils-0.194-r0: task do_fetch: Succeeded
NOTE: Running task 1142 of 1953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_unpack)
NOTE: recipe elfutils-0.194-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 551 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 552 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 553 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 554 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 555 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.46.bb:do_packagedata_setscene)
NOTE: Running setscene task 556 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 557 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 558 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 559 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.46.bb:do_populate_sysroot_setscene)
NOTE: recipe libarchive-3.8.3-r0: task do_package_setscene: Succeeded
NOTE: recipe curl-8.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 560 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.11.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 562 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 563 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe file-5.46-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.8.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1174 of 1953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 564 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_recipe_qa_setscene)
NOTE: recipe libarchive-3.8.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 566 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 567 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.15.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: Running setscene task 568 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: recipe curl-8.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 569 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.1.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.11.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 570 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_package_setscene)
NOTE: recipe gnutls-3.8.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-8.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 572 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 573 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcrypt-1.11.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 575 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_packagedata_setscene)
NOTE: recipe file-5.46-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libarchive-3.8.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 576 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 577 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.15.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 578 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 579 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 582 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 583 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.46.bb:do_recipe_qa_setscene)
NOTE: recipe lzlib-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_package_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 584 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.11.bb:do_package_setscene)
NOTE: Running setscene task 585 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-8.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 586 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 587 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.3.bb:do_recipe_qa_setscene)
NOTE: recipe file-5.46-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 591 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe lzlib-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 594 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe file-5.46-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 597 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.15.bb:do_recipe_qa_setscene)
NOTE: Running task 1190 of 1953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_fetch)
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 600 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe gnutls-3.8.11-r0: task do_package_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 602 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 604 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 606 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: recipe lzlib-1.15-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libarchive-3.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_fetch: Started
NOTE: Running task 1195 of 1953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.3.bb:do_fetch)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_fetch: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1196 of 1953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_unpack)
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 608 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libarchive-3.8.3-r0: task do_fetch: Started
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 611 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_unpack: Started
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libarchive-3.8.3-r0: task do_fetch: Succeeded
NOTE: Running task 1227 of 1953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.3.bb:do_unpack)
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_unpack: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe elfutils-0.194-r0: task do_unpack: Succeeded
NOTE: recipe libgcrypt-1.11.2-r0: task do_package_setscene: Succeeded
NOTE: recipe libarchive-3.8.3-r0: task do_unpack: Started
NOTE: Running setscene task 612 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.56.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 613 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 614 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.56.bb:do_packagedata_setscene)
NOTE: Running setscene task 615 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.77.bb:do_packagedata_setscene)
NOTE: Running setscene task 616 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.77.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-2.77-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.77-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgpg-error-1.56-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgpg-error-1.56-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 617 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_recipe_qa_setscene)
NOTE: recipe libarchive-3.8.3-r0: task do_unpack: Succeeded
NOTE: recipe libcap-2.77-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 619 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.56-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.77-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 620 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 622 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.77.bb:do_recipe_qa_setscene)
NOTE: recipe libgcrypt-1.11.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.56-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 624 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 626 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.56.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 627 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.77-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1245 of 1953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_fetch)
NOTE: recipe libpam-1.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgpg-error-1.56-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.77-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.2-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_fetch: Succeeded
NOTE: recipe libgpg-error-1.56-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1251 of 1953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_unpack)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 630 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe libgcrypt-1.11.2-r0: task do_unpack: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 633 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.2-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 1270 of 1953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 27a1287f03f8699e6a83b8e7203f6b85f617ccd1b7f11fa183cd486905f39fba
NOTE: recipe gnutls-3.8.11-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 634 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 635 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 636 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 637 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 638 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 639 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 640 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 641 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 642 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 643 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.11.bb:do_recipe_qa_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 645 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_package_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 647 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe nettle-3.10.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 648 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 650 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 652 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe gnutls-3.8.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 654 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 655 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 657 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_recipe_qa_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_package_setscene: Started
NOTE: recipe gnutls-3.8.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1272 of 1953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.11.bb:do_fetch)
NOTE: recipe libunistring-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnutls-3.8.11-r0: task do_fetch: Started
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 660 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe gnutls-3.8.11-r0: task do_fetch: Succeeded
NOTE: recipe libunistring-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1288 of 1953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.11.bb:do_unpack)
NOTE: recipe libunistring-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 663 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnutls-3.8.11-r0: task do_unpack: Started
NOTE: recipe libunistring-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 664 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 665 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 666 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 667 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 669 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 670 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libtasn1-4.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 672 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1300 of 1953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_fetch)
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gnutls-3.8.11-r0: task do_unpack: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_fetch: Started
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 674 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libtasn1-4.20.0-r0: task do_fetch: Succeeded
NOTE: Running task 1308 of 1953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_unpack)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_unpack: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 676 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 677 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-4.20.0-r0: task do_unpack: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 679 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb:do_packagedata_setscene)
NOTE: Running setscene task 680 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 681 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 685 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 687 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 688 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 691 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 692 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 695 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 698 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 700 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 702 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.17-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1704 of 1953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/iptables/iptables_1.8.11.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1705 of 1953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1869 of 1953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_collect_spdx_deps)
NOTE: Running task 1878 of 1953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_collect_spdx_deps)
NOTE: Running task 1888 of 1953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.3.bb:do_collect_spdx_deps)
NOTE: Running task 1893 of 1953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/iptables/iptables_1.8.11.bb:do_collect_spdx_deps)
NOTE: Running task 1894 of 1953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_collect_spdx_deps)
NOTE: recipe iptables-1.8.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmnl-1.0.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libarchive-3.8.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe iptables-1.8.11-r0: task do_collect_spdx_deps: Started
NOTE: recipe libmnl-1.0.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1916 of 1953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_create_spdx)
NOTE: recipe libgcrypt-1.11.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libarchive-3.8.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1917 of 1953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_create_spdx)
NOTE: recipe iptables-1.8.11-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1918 of 1953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.3.bb:do_create_spdx)
NOTE: recipe iptables-1.8.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1919 of 1953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_configure)
NOTE: Running task 1920 of 1953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/iptables/iptables_1.8.11.bb:do_configure)
NOTE: recipe libtasn1-4.20.0-r0: task do_create_spdx: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_create_spdx: Started
NOTE: recipe libarchive-3.8.3-r0: task do_create_spdx: Started
NOTE: recipe libmnl-1.0.5-r0: task do_configure: Started
NOTE: recipe iptables-1.8.11-r0: task do_configure: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 1921 of 1953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.11.bb:do_collect_spdx_deps)
NOTE: recipe libarchive-3.8.3-r0: task do_create_spdx: Succeeded
NOTE: recipe gnutls-3.8.11-r0: task do_collect_spdx_deps: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_create_spdx: Succeeded
NOTE: recipe gnutls-3.8.11-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1922 of 1953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.11.bb:do_create_spdx)
NOTE: recipe gnutls-3.8.11-r0: task do_create_spdx: Started
NOTE: recipe gnutls-3.8.11-r0: task do_create_spdx: Succeeded
NOTE: Running task 1923 of 1953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_collect_spdx_deps)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1924 of 1953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_create_spdx)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_create_spdx: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 1925 of 1953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_collect_spdx_deps)
NOTE: recipe elfutils-0.194-r0: task do_collect_spdx_deps: Started
NOTE: recipe elfutils-0.194-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1926 of 1953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_create_spdx)
NOTE: recipe elfutils-0.194-r0: task do_create_spdx: Started
NOTE: recipe elfutils-0.194-r0: task do_create_spdx: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_configure: Succeeded
NOTE: Running task 1927 of 1953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_compile)
NOTE: recipe libmnl-1.0.5-r0: task do_compile: Started
NOTE: recipe libmnl-1.0.5-r0: task do_compile: Succeeded
NOTE: Running task 1928 of 1953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_install)
NOTE: recipe iptables-1.8.11-r0: task do_configure: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_install: Started
NOTE: Running task 1929 of 1953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/iptables/iptables_1.8.11.bb:do_compile)
NOTE: recipe iptables-1.8.11-r0: task do_compile: Started
NOTE: recipe libmnl-1.0.5-r0: task do_install: Succeeded
NOTE: Running task 1930 of 1953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_package)
NOTE: recipe libmnl-1.0.5-r0: task do_package: Started
NOTE: recipe libmnl-1.0.5-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_package unihash changed to 91ec31d4dae8bf2ebd6fa4077e238a24faad89fcad0cb8cc1df78a54a848dec5
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_create_spdx became valid
NOTE: Running setscene task 696 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_create_spdx_setscene)
NOTE: recipe libmnl-1.0.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libmnl-1.0.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 702 of 702 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_packagedata_setscene)
NOTE: recipe libmnl-1.0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libmnl-1.0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe iptables-1.8.11-r0: task do_compile: Succeeded
NOTE: Running task 1934 of 1953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/iptables/iptables_1.8.11.bb:do_install)
NOTE: recipe iptables-1.8.11-r0: task do_install: Started
NOTE: recipe iptables-1.8.11-r0: task do_install: Succeeded
NOTE: Running task 1935 of 1953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/iptables/iptables_1.8.11.bb:do_package)
NOTE: Running task 1937 of 1953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/iproute2/iproute2_6.18.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe iptables-1.8.11-r0: task do_package: Started
NOTE: recipe iproute2-6.18.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe iproute2-6.18.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1938 of 1953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/iproute2/iproute2_6.18.0.bb:do_configure)
NOTE: recipe iproute2-6.18.0-r0: task do_configure: Started
NOTE: recipe iproute2-6.18.0-r0: task do_configure: Succeeded
NOTE: Running task 1939 of 1953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/iproute2/iproute2_6.18.0.bb:do_compile)
NOTE: recipe iproute2-6.18.0-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: make -j 16 -l 75 CC=arm-poky-linux-musleabi-gcc  -mthumb -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a15 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/iproute2/6.18.0/recipe-sysroot KERNEL_INCLUDE=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/iproute2/6.18.0/recipe-sysroot/usr/include DOCDIR=/usr/share/doc/iproute2 SUBDIRS=lib tc ip bridge misc genl devlink tipc SBINDIR=/sbin CONF_USR_DIR=/usr/lib/iproute2 LIBDIR=/usr/lib CCOPTS= -O2 -g -fcanon-prefix-map  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/iproute2/6.18.0/sources/iproute2-6.18.0=/usr/src/debug/iproute2/6.18.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleab
 i/iproute2/6.18.0/sources/iproute2-6.18.0=/usr/src/debug/iproute2/6.18.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/iproute2/6.18.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/iproute2/6.18.0/recipe-sysroot-native=  -pipe -Wno-error=incompatible-pointer-types
| 
| lib
|     CC       libgenl.o
|     CC       libnetlink.o
|     CC       mnl_utils.o
|     CC       utils.o
|     CC       utils_math.o
|     CC       rt_names.o
|     CC       ll_map.o
|     CC       ll_types.o
|     CC       ll_proto.o
|     CC       ll_addr.o
|     CC       inet_proto.o
|     CC       namespace.o
|     CC       json_writer.o
|     CC       json_print.o
|     CC       json_print_math.o
|     CC       names.o
| In file included from ll_types.c:20:
| ../include/uapi/linux/sockios.h:45:9: warning: 'SIOCGSTAMP' redefined
|    45 | #define SIOCGSTAMP      ((sizeof(struct timeval))  == 8 ? \
|       |         ^~~~~~~~~~
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/iproute2/6.18.0/recipe-sysroot/usr/include/sys/ioctl.h:10,
|                  from ll_types.c:12:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/iproute2/6.18.0/recipe-sysroot/usr/include/bits/ioctl.h:108:9: note: this is the location of the previous definition
|   108 | #define SIOCGSTAMP      _IOR(0x89, 6, char[16])
|       |         ^~~~~~~~~~
| ../include/uapi/linux/sockios.h:47:9: warning: 'SIOCGSTAMPNS' redefined
|    47 | #define SIOCGSTAMPNS    ((sizeof(struct timespec)) == 8 ? \
|       |         ^~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/iproute2/6.18.0/recipe-sysroot/usr/include/bits/ioctl.h:109:9: note: this is the location of the previous definition
|   109 | #define SIOCGSTAMPNS    _IOR(0x89, 7, char[16])
|       |         ^~~~~~~~~~~~
| In file included from ll_addr.c:20:
| ../include/uapi/linux/sockios.h:45:9: warning: 'SIOCGSTAMP' redefined
|    45 | #define SIOCGSTAMP      ((sizeof(struct timeval))  == 8 ? \
|       |         ^~~~~~~~~~
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/iproute2/6.18.0/recipe-sysroot/usr/include/sys/ioctl.h:10,
|                  from ll_addr.c:12:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/iproute2/6.18.0/recipe-sysroot/usr/include/bits/ioctl.h:108:9: note: this is the location of the previous definition
|   108 | #define SIOCGSTAMP      _IOR(0x89, 6, char[16])
|       |         ^~~~~~~~~~
| ../include/uapi/linux/sockios.h:47:9: warning: 'SIOCGSTAMPNS' redefined
|    47 | #define SIOCGSTAMPNS    ((sizeof(struct timespec)) == 8 ? \
|       |         ^~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/iproute2/6.18.0/recipe-sysroot/usr/include/bits/ioctl.h:109:9: note: this is the location of the previous definition
|   109 | #define SIOCGSTAMPNS    _IOR(0x89, 7, char[16])
|       |         ^~~~~~~~~~~~
| In file included from ll_proto.c:21:
| ../include/uapi/linux/sockios.h:45:9: warning: 'SIOCGSTAMP' redefined
|    45 | #define SIOCGSTAMP      ((sizeof(struct timeval))  == 8 ? \
|       |         ^~~~~~~~~~
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/iproute2/6.18.0/recipe-sysroot/usr/include/sys/ioctl.h:10,
|                  from ll_proto.c:13:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/iproute2/6.18.0/recipe-sysroot/usr/include/bits/ioctl.h:108:9: note: this is the location of the previous definition
|   108 | #define SIOCGSTAMP      _IOR(0x89, 6, char[16])
|       |         ^~~~~~~~~~
| ../include/uapi/linux/sockios.h:47:9: warning: 'SIOCGSTAMPNS' redefined
|    47 | #define SIOCGSTAMPNS    ((sizeof(struct timespec)) == 8 ? \
|       |         ^~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/iproute2/6.18.0/recipe-sysroot/usr/include/bits/ioctl.h:109:9: note: this is the location of the previous definition
|   109 | #define SIOCGSTAMPNS    _IOR(0x89, 7, char[16])
|       |         ^~~~~~~~~~~~
| utils_math.c: In function 'get_size':
| utils_math.c:136:20: error: 'UINT_MAX' undeclared (first use in this function)
|   136 |         if (sz64 > UINT_MAX)
|       |                    ^~~~~~~~
| utils_math.c:10:1: note: 'UINT_MAX' is defined in header '<limits.h>'; this is probably fixable by adding '#include <limits.h>'
|     9 | #include "utils.h"
|   +++ |+#include <limits.h>
|    10 |
| utils_math.c:136:20: note: each undeclared identifier is reported only once for each function it appears in
|   136 |         if (sz64 > UINT_MAX)
|       |                    ^~~~~~~~
| make[1]: *** [../config.mk:44: utils_math.o] Error 1
| make[1]: *** Waiting for unfinished jobs....
| utils.c: In function 'print_timestamp':
| utils.c:1287:38: warning: format '%ld' expects argument of type 'long int', but argument 4 has type 'suseconds_t' {aka 'long long int'} [-Wformat=]
|  1287 |                 fprintf(fp, "[%s.%06ld] ", tshort, tv.tv_usec);
|       |                                  ~~~~^             ~~~~~~~~~~
|       |                                      |               |
|       |                                      long int        suseconds_t {aka long long int}
|       |                                  %06lld
| utils.c:1292:46: warning: format '%ld' expects argument of type 'long int', but argument 4 has type 'suseconds_t' {aka 'long long int'} [-Wformat=]
|  1292 |                 fprintf(fp, "Timestamp: %s %ld usec\n",
|       |                                            ~~^
|       |                                              |
|       |                                              long int
|       |                                            %lld
|  1293 |                         tstr, tv.tv_usec);
|       |                               ~~~~~~~~~~
|       |                                 |
|       |                                 suseconds_t {aka long long int}
| make: *** [Makefile:81: all] Error 2
| ERROR: oe_runmake failed
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/iproute2/6.18.0/temp/run.do_compile.2252718:179 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/iproute2/6.18.0/temp/run.do_compile.2252718, line 179
| 	#2: die, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/iproute2/6.18.0/temp/run.do_compile.2252718, line 164
| 	#3: oe_runmake, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/iproute2/6.18.0/temp/run.do_compile.2252718, line 169
| 	#4: base_do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/iproute2/6.18.0/temp/run.do_compile.2252718, line 147
| 	#5: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/iproute2/6.18.0/temp/run.do_compile.2252718, line 141
| 	#6: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/iproute2/6.18.0/temp/run.do_compile.2252718, line 189
NOTE: recipe iproute2-6.18.0-r0: task do_compile: Failed
NOTE: recipe iptables-1.8.11-r0: task do_package: Succeeded
NOTE: Tasks Summary: Attempted 1939 tasks of which 1880 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251215220255.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251215220255.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/iproute2/iproute2_6.18.0.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/iproute2/6.18.0/temp/log.do_compile.2252718
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: iproute2-6.18.0-r0 do_compile: oe_runmake failed
ERROR: iproute2-6.18.0-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/iproute2/6.18.0/temp/run.do_compile.2252718' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/iproute2/6.18.0/temp/log.do_compile.2252718
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/iproute2/iproute2_6.18.0.bb:do_compile) failed with exit code '1'

--===============1653246916916583735==--

