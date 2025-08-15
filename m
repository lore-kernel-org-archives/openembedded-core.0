Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E42ECA0FEB
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 13:07:12 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.11320.1755263215402384407
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Aug 2025 06:07:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=1hT3/Ib+;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Vm3KPlCV;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010198add73db9-a670741e-09a6-4f81-a4da-ccec518ba0da-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1755263221;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=tqRgnCOd1u23UQda/nvS3KnpiBYQ/SdXvj6hyoMxyaI=;
	b=1hT3/Ib+jtQfCthu96WVV386TuoklkOXMDzQzFRr3Pa1NfTyDuAwp/mRbgrCA/Xi
	V2b1Vy8DEtqIO2i54JTXGTJ5xK5j4Fq7HIWxs3p5QzpUhAxaX70C7t9lA/5dYupuYNk
	bNEPZidZFJmnpEvirjsUglVH3mbqPdU+xXpcQfDU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1755263221;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=tqRgnCOd1u23UQda/nvS3KnpiBYQ/SdXvj6hyoMxyaI=;
	b=Vm3KPlCVUjiUfLICxFwSAYORyVWOc/fmuh2oSkqi6vVzKpSztahRzWEL7/V5Y0f/
	iJZF5cR4yZwZTBH3YBToIXRDYOHyyDMvXuhiKt3MB2rstsJDhEnJw/6qZEMMBHlcYU5
	BihxdSVavK4wcNcAHxj5UDFP6nJW/K5qMwLiA0mE=
Content-Type: multipart/mixed; boundary="===============0460420035371516451=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Changhyeok Bae <changhyeok.bae@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] connman: upgrading to 1.45 SUCCEEDED
Message-ID: <01010198add73db9-a670741e-09a6-4f81-a4da-ccec518ba0da-000000@us-west-2.amazonses.com>
Date: Fri, 15 Aug 2025 13:07:01 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.08.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Aug 2025 13:07:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221893

--===============0460420035371516451==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *connman* to *1.45* has Succeeded.

Next steps:
    - apply the patch: git am 0001-connman-upgrade-1.44-1.45.patch
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
From d43f788e3908eaca158a68c21c972992bbe363c3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Aug 2025 07:57:06 +0000
Subject: [PATCH] connman: upgrade 1.44 -> 1.45

---
 ...ve-musl-does-not-implement-res_ninit.patch |  2 +-
 .../connman/connman/CVE-2025-32366.patch      | 41 ----------------
 .../connman/connman/CVE-2025-32743.patch      | 48 -------------------
 .../{connman_1.44.bb => connman_1.45.bb}      |  4 +-
 4 files changed, 2 insertions(+), 93 deletions(-)
 delete mode 100644 meta/recipes-connectivity/connman/connman/CVE-2025-32366.patch
 delete mode 100644 meta/recipes-connectivity/connman/connman/CVE-2025-32743.patch
 rename meta/recipes-connectivity/connman/{connman_1.44.bb => connman_1.45.bb} (98%)

diff --git a/meta/recipes-connectivity/connman/connman/0002-resolve-musl-does-not-implement-res_ninit.patch b/meta/recipes-connectivity/connman/connman/0002-resolve-musl-does-not-implement-res_ninit.patch
index 2c612039ee..7961a395a8 100644
--- a/meta/recipes-connectivity/connman/connman/0002-resolve-musl-does-not-implement-res_ninit.patch
+++ b/meta/recipes-connectivity/connman/connman/0002-resolve-musl-does-not-implement-res_ninit.patch
@@ -1,4 +1,4 @@
-From 4e726a5aaa75d60fab6a56bc37dbec48be53ff79 Mon Sep 17 00:00:00 2001
+From d9f77701e767412d99f794bfda8ca25984c33d21 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 6 Apr 2015 23:02:21 -0700
 Subject: [PATCH] gweb/gresolv.c: make use of res_ninit optional and subject to
diff --git a/meta/recipes-connectivity/connman/connman/CVE-2025-32366.patch b/meta/recipes-connectivity/connman/connman/CVE-2025-32366.patch
deleted file mode 100644
index 62f07e707a..0000000000
--- a/meta/recipes-connectivity/connman/connman/CVE-2025-32366.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 8d3be0285f1d4667bfe85dba555c663eb3d704b4 Mon Sep 17 00:00:00 2001
-From: Yoonje Shin <ioerts@kookmin.ac.kr>
-Date: Mon, 12 May 2025 10:48:18 +0200
-Subject: [PATCH] dnsproxy: Address CVE-2025-32366 vulnerability
-
-In Connman parse_rr in dnsproxy.c has a memcpy length
-that depends on an RR RDLENGTH value (i.e., *rdlen=ntohs(rr->rdlen)
-and memcpy(response+offset,*end,*rdlen)). Here, rdlen may be larger
-than the amount of remaining packet data in the current state of
-parsing. As a result, values of stack memory locations may be sent
-over the network in a response.
-
-This patch adds a check to ensure that (*end + *rdlen) does not exceed
-the valid range. If the condition is violated, the function returns
--EINVAL.
-
-CVE: CVE-2025-32366
-
-Upstream-Status: Backport [https://git.kernel.org/pub/scm/network/connman/connman.git/commit/?id=8d3be0285f1d4667bfe85dba555c663eb3d704b4]
-
-Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
----
- src/dnsproxy.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/src/dnsproxy.c b/src/dnsproxy.c
-index 7ee26d9..1dd2f7f 100644
---- a/src/dnsproxy.c
-+++ b/src/dnsproxy.c
-@@ -998,6 +998,9 @@ static int parse_rr(const unsigned char *buf, const unsigned char *start,
-	if ((offset + *rdlen) > *response_size)
-		return -ENOBUFS;
-
-+	if ((*end + *rdlen) > max)
-+		return -EINVAL;
-+
-	memcpy(response + offset, *end, *rdlen);
-
-	*end += *rdlen;
---
-2.40.0
diff --git a/meta/recipes-connectivity/connman/connman/CVE-2025-32743.patch b/meta/recipes-connectivity/connman/connman/CVE-2025-32743.patch
deleted file mode 100644
index c114589679..0000000000
--- a/meta/recipes-connectivity/connman/connman/CVE-2025-32743.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From d90b911f6760959bdf1393c39fe8d1118315490f Mon Sep 17 00:00:00 2001
-From: Praveen Kumar <praveen.kumar@windriver.com>
-Date: Thu, 24 Apr 2025 11:39:29 +0000
-Subject: [PATCH] dnsproxy: Fix NULL/empty lookup causing potential crash
-
-In ConnMan through 1.44, the lookup string in ns_resolv in dnsproxy.c
-can be NULL or an empty string when the TC (Truncated) bit is set in
-a DNS response. This allows attackers to cause a denial of service
-(application crash) or possibly execute arbitrary code, because those
-lookup values lead to incorrect length calculations and incorrect
-memcpy operations.
-
-This patch includes a check to make sure loookup value is valid before
-using it. This helps avoid unexpected value when the input is empty or
-incorrect.
-
-Fixes: CVE-2025-32743
-
-CVE: CVE-2025-32743
-
-Upstream-Status: Backport [https://git.kernel.org/pub/scm/network/connman/connman.git/commit/?id=d90b911f6760959bdf1393c39fe8d1118315490f]
-
-Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
----
- src/dnsproxy.c | 7 ++++++-
- 1 file changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/src/dnsproxy.c b/src/dnsproxy.c
-index f28a5d7..7ee26d9 100644
---- a/src/dnsproxy.c
-+++ b/src/dnsproxy.c
-@@ -1685,8 +1685,13 @@ static int ns_resolv(struct server_data *server, struct request_data *req,
-				gpointer request, gpointer name)
- {
-	int sk = -1;
-+	int err;
-	const char *lookup = (const char *)name;
--	int err = ns_try_resolv_from_cache(req, request, lookup);
-+
-+	if (!lookup || strlen(lookup) == 0)
-+		return -EINVAL;
-+
-+	err = ns_try_resolv_from_cache(req, request, lookup);
-
-	if (err > 0)
-		/* cache hit */
---
-2.40.0
diff --git a/meta/recipes-connectivity/connman/connman_1.44.bb b/meta/recipes-connectivity/connman/connman_1.45.bb
similarity index 98%
rename from meta/recipes-connectivity/connman/connman_1.44.bb
rename to meta/recipes-connectivity/connman/connman_1.45.bb
index 1b0fbe438c..cfc6114712 100644
--- a/meta/recipes-connectivity/connman/connman_1.44.bb
+++ b/meta/recipes-connectivity/connman/connman_1.45.bb
@@ -21,11 +21,9 @@ DEPENDS  = "dbus glib-2.0"
 SRC_URI = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
            file://connman \
            file://0002-resolve-musl-does-not-implement-res_ninit.patch \
-           file://CVE-2025-32743.patch \
-           file://CVE-2025-32366.patch \
            "
 
-SRC_URI[sha256sum] = "2be2b00321632b775f9eff713acd04ef21e31fbf388f6ebf45512ff4289574ff"
+SRC_URI[sha256sum] = "77128cce80865455c4f106b5901a575e2dfdb35a7d2e2e2996f16e85cba10913"
 
 RRECOMMENDS:${PN} = "connman-conf"
 RCONFLICTS:${PN} = "networkmanager"
-- 
2.47.1


--===============0460420035371516451==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/connman/connman-client: PV changed from "1.44" to "1.45"
packages/core2-64-poky-linux/connman/connman-client: PKGV changed from 1.44 [default] to 1.45 [default]
packages/core2-64-poky-linux/connman/connman-dbg: PV changed from "1.44" to "1.45"
packages/core2-64-poky-linux/connman/connman-dbg: PKGSIZE changed from 6050776 to 6059808 (+0%)
packages/core2-64-poky-linux/connman/connman-dbg: PKGV changed from 1.44 [default] to 1.45 [default]
packages/core2-64-poky-linux/connman/connman-dev: PV changed from "1.44" to "1.45"
packages/core2-64-poky-linux/connman/connman-dev: PKGV changed from 1.44 [default] to 1.45 [default]
packages/core2-64-poky-linux/connman/connman-doc: PV changed from "1.44" to "1.45"
packages/core2-64-poky-linux/connman/connman-doc: PKGSIZE changed from 51945 to 51962 (+0%)
packages/core2-64-poky-linux/connman/connman-doc: PKGV changed from 1.44 [default] to 1.45 [default]
packages/core2-64-poky-linux/connman/connman-locale: PV changed from "1.44" to "1.45"
packages/core2-64-poky-linux/connman/connman-locale: PKGV changed from 1.44 [default] to 1.45 [default]
packages/core2-64-poky-linux/connman/connman-src: PV changed from "1.44" to "1.45"
packages/core2-64-poky-linux/connman/connman-src: PKGV changed from 1.44 [default] to 1.45 [default]
packages/core2-64-poky-linux/connman/connman-staticdev: PV changed from "1.44" to "1.45"
packages/core2-64-poky-linux/connman/connman-staticdev: PKGV changed from 1.44 [default] to 1.45 [default]
packages/core2-64-poky-linux/connman/connman-tests: PV changed from "1.44" to "1.45"
packages/core2-64-poky-linux/connman/connman-tests: PKGV changed from 1.44 [default] to 1.45 [default]
packages/core2-64-poky-linux/connman/connman-tools: PV changed from "1.44" to "1.45"
packages/core2-64-poky-linux/connman/connman-tools: PKGV changed from 1.44 [default] to 1.45 [default]
packages/core2-64-poky-linux/connman/connman-vpn: PV changed from "1.44" to "1.45"
packages/core2-64-poky-linux/connman/connman-vpn: PKGV changed from 1.44 [default] to 1.45 [default]
packages/core2-64-poky-linux/connman/connman-wait-online: PV changed from "1.44" to "1.45"
packages/core2-64-poky-linux/connman/connman-wait-online: PKGV changed from 1.44 [default] to 1.45 [default]
packages/core2-64-poky-linux/connman/connman: PV changed from "1.44" to "1.45"
packages/core2-64-poky-linux/connman/connman: PKGV changed from 1.44 [default] to 1.45 [default]
packages/core2-64-poky-linux/connman: SRC_URI changed from "https://cdn.kernel.org/pub/linux/network/connman/connman-1.44.tar.xz file://connman file://0002-resolve-musl-does-not-implement-res_ninit.patch file://CVE-2025-32743.patch file://CVE-2025-32366.patch" to "https://cdn.kernel.org/pub/linux/network/connman/connman-1.45.tar.xz file://connman file://0002-resolve-musl-does-not-implement-res_ninit.patch"
packages/core2-64-poky-linux/connman: PV changed from "1.44" to "1.45"
packages/core2-64-poky-linux/connman: PKGV changed from 1.44 [default] to 1.45 [default]

--===============0460420035371516451==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-connman-upgrade-1.44-1.45.patch"

RnJvbSBkNDNmNzg4ZTM5MDhlYWNhMTU4YTY4YzIxYzk3Mjk5MmJiZTM2M2MzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgQXVnIDIwMjUgMDc6NTc6MDYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBj
b25ubWFuOiB1cGdyYWRlIDEuNDQgLT4gMS40NQoKLS0tCiAuLi52ZS1tdXNsLWRvZXMtbm90LWlt
cGxlbWVudC1yZXNfbmluaXQucGF0Y2ggfCAgMiArLQogLi4uL2Nvbm5tYW4vY29ubm1hbi9DVkUt
MjAyNS0zMjM2Ni5wYXRjaCAgICAgIHwgNDEgLS0tLS0tLS0tLS0tLS0tLQogLi4uL2Nvbm5tYW4v
Y29ubm1hbi9DVkUtMjAyNS0zMjc0My5wYXRjaCAgICAgIHwgNDggLS0tLS0tLS0tLS0tLS0tLS0t
LQogLi4uL3tjb25ubWFuXzEuNDQuYmIgPT4gY29ubm1hbl8xLjQ1LmJifSAgICAgIHwgIDQgKy0K
IDQgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA5MyBkZWxldGlvbnMoLSkKIGRlbGV0
ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2Nvbm5tYW4vY29ubm1hbi9D
VkUtMjAyNS0zMjM2Ni5wYXRjaAogZGVsZXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1jb25u
ZWN0aXZpdHkvY29ubm1hbi9jb25ubWFuL0NWRS0yMDI1LTMyNzQzLnBhdGNoCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9jb25ubWFuL3tjb25ubWFuXzEuNDQuYmIgPT4gY29ubm1h
bl8xLjQ1LmJifSAoOTglKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkv
Y29ubm1hbi9jb25ubWFuLzAwMDItcmVzb2x2ZS1tdXNsLWRvZXMtbm90LWltcGxlbWVudC1yZXNf
bmluaXQucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2Nvbm5tYW4vY29ubm1hbi8w
MDAyLXJlc29sdmUtbXVzbC1kb2VzLW5vdC1pbXBsZW1lbnQtcmVzX25pbml0LnBhdGNoCmluZGV4
IDJjNjEyMDM5ZWUuLjc5NjFhMzk1YTggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0
aXZpdHkvY29ubm1hbi9jb25ubWFuLzAwMDItcmVzb2x2ZS1tdXNsLWRvZXMtbm90LWltcGxlbWVu
dC1yZXNfbmluaXQucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9jb25ubWFu
L2Nvbm5tYW4vMDAwMi1yZXNvbHZlLW11c2wtZG9lcy1ub3QtaW1wbGVtZW50LXJlc19uaW5pdC5w
YXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNGU3MjZhNWFhYTc1ZDYwZmFiNmE1NmJjMzdkYmVj
NDhiZTUzZmY3OSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZDlmNzc3MDFlNzY3NDEy
ZDk5Zjc5NGJmZGE4Y2EyNTk4NGMzM2QyMSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206
IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBEYXRlOiBNb24sIDYgQXByIDIwMTUgMjM6
MDI6MjEgLTA3MDAKIFN1YmplY3Q6IFtQQVRDSF0gZ3dlYi9ncmVzb2x2LmM6IG1ha2UgdXNlIG9m
IHJlc19uaW5pdCBvcHRpb25hbCBhbmQgc3ViamVjdCB0bwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWNvbm5lY3Rpdml0eS9jb25ubWFuL2Nvbm5tYW4vQ1ZFLTIwMjUtMzIzNjYucGF0Y2ggYi9t
ZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2Nvbm5tYW4vY29ubm1hbi9DVkUtMjAyNS0zMjM2Ni5w
YXRjaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggNjJmMDdlNzA3YS4uMDAwMDAwMDAw
MAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2Nvbm5tYW4vY29ubm1hbi9DVkUtMjAy
NS0zMjM2Ni5wYXRjaAorKysgL2Rldi9udWxsCkBAIC0xLDQxICswLDAgQEAKLUZyb20gOGQzYmUw
Mjg1ZjFkNDY2N2JmZTg1ZGJhNTU1YzY2M2ViM2Q3MDRiNCBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKLUZyb206IFlvb25qZSBTaGluIDxpb2VydHNAa29va21pbi5hYy5rcj4KLURhdGU6IE1vbiwg
MTIgTWF5IDIwMjUgMTA6NDg6MTggKzAyMDAKLVN1YmplY3Q6IFtQQVRDSF0gZG5zcHJveHk6IEFk
ZHJlc3MgQ1ZFLTIwMjUtMzIzNjYgdnVsbmVyYWJpbGl0eQotCi1JbiBDb25ubWFuIHBhcnNlX3Jy
IGluIGRuc3Byb3h5LmMgaGFzIGEgbWVtY3B5IGxlbmd0aAotdGhhdCBkZXBlbmRzIG9uIGFuIFJS
IFJETEVOR1RIIHZhbHVlIChpLmUuLCAqcmRsZW49bnRvaHMocnItPnJkbGVuKQotYW5kIG1lbWNw
eShyZXNwb25zZStvZmZzZXQsKmVuZCwqcmRsZW4pKS4gSGVyZSwgcmRsZW4gbWF5IGJlIGxhcmdl
cgotdGhhbiB0aGUgYW1vdW50IG9mIHJlbWFpbmluZyBwYWNrZXQgZGF0YSBpbiB0aGUgY3VycmVu
dCBzdGF0ZSBvZgotcGFyc2luZy4gQXMgYSByZXN1bHQsIHZhbHVlcyBvZiBzdGFjayBtZW1vcnkg
bG9jYXRpb25zIG1heSBiZSBzZW50Ci1vdmVyIHRoZSBuZXR3b3JrIGluIGEgcmVzcG9uc2UuCi0K
LVRoaXMgcGF0Y2ggYWRkcyBhIGNoZWNrIHRvIGVuc3VyZSB0aGF0ICgqZW5kICsgKnJkbGVuKSBk
b2VzIG5vdCBleGNlZWQKLXRoZSB2YWxpZCByYW5nZS4gSWYgdGhlIGNvbmRpdGlvbiBpcyB2aW9s
YXRlZCwgdGhlIGZ1bmN0aW9uIHJldHVybnMKLS1FSU5WQUwuCi0KLUNWRTogQ1ZFLTIwMjUtMzIz
NjYKLQotVXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9ydCBbaHR0cHM6Ly9naXQua2VybmVsLm9yZy9w
dWIvc2NtL25ldHdvcmsvY29ubm1hbi9jb25ubWFuLmdpdC9jb21taXQvP2lkPThkM2JlMDI4NWYx
ZDQ2NjdiZmU4NWRiYTU1NWM2NjNlYjNkNzA0YjRdCi0KLVNpZ25lZC1vZmYtYnk6IFByYXZlZW4g
S3VtYXIgPHByYXZlZW4ua3VtYXJAd2luZHJpdmVyLmNvbT4KLS0tLQotIHNyYy9kbnNwcm94eS5j
IHwgMyArKysKLSAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCi0KLWRpZmYgLS1naXQg
YS9zcmMvZG5zcHJveHkuYyBiL3NyYy9kbnNwcm94eS5jCi1pbmRleCA3ZWUyNmQ5Li4xZGQyZjdm
IDEwMDY0NAotLS0tIGEvc3JjL2Ruc3Byb3h5LmMKLSsrKyBiL3NyYy9kbnNwcm94eS5jCi1AQCAt
OTk4LDYgKzk5OCw5IEBAIHN0YXRpYyBpbnQgcGFyc2VfcnIoY29uc3QgdW5zaWduZWQgY2hhciAq
YnVmLCBjb25zdCB1bnNpZ25lZCBjaGFyICpzdGFydCwKLQlpZiAoKG9mZnNldCArICpyZGxlbikg
PiAqcmVzcG9uc2Vfc2l6ZSkKLQkJcmV0dXJuIC1FTk9CVUZTOwotCi0rCWlmICgoKmVuZCArICpy
ZGxlbikgPiBtYXgpCi0rCQlyZXR1cm4gLUVJTlZBTDsKLSsKLQltZW1jcHkocmVzcG9uc2UgKyBv
ZmZzZXQsICplbmQsICpyZGxlbik7Ci0KLQkqZW5kICs9ICpyZGxlbjsKLS0tCi0yLjQwLjAKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvY29ubm1hbi9jb25ubWFuL0NWRS0y
MDI1LTMyNzQzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9jb25ubWFuL2Nvbm5t
YW4vQ1ZFLTIwMjUtMzI3NDMucGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IGMx
MTQ1ODk2NzkuLjAwMDAwMDAwMDAKLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9jb25u
bWFuL2Nvbm5tYW4vQ1ZFLTIwMjUtMzI3NDMucGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSw0OCAr
MCwwIEBACi1Gcm9tIGQ5MGI5MTFmNjc2MDk1OWJkZjEzOTNjMzlmZThkMTExODMxNTQ5MGYgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCi1Gcm9tOiBQcmF2ZWVuIEt1bWFyIDxwcmF2ZWVuLmt1bWFy
QHdpbmRyaXZlci5jb20+Ci1EYXRlOiBUaHUsIDI0IEFwciAyMDI1IDExOjM5OjI5ICswMDAwCi1T
dWJqZWN0OiBbUEFUQ0hdIGRuc3Byb3h5OiBGaXggTlVMTC9lbXB0eSBsb29rdXAgY2F1c2luZyBw
b3RlbnRpYWwgY3Jhc2gKLQotSW4gQ29ubk1hbiB0aHJvdWdoIDEuNDQsIHRoZSBsb29rdXAgc3Ry
aW5nIGluIG5zX3Jlc29sdiBpbiBkbnNwcm94eS5jCi1jYW4gYmUgTlVMTCBvciBhbiBlbXB0eSBz
dHJpbmcgd2hlbiB0aGUgVEMgKFRydW5jYXRlZCkgYml0IGlzIHNldCBpbgotYSBETlMgcmVzcG9u
c2UuIFRoaXMgYWxsb3dzIGF0dGFja2VycyB0byBjYXVzZSBhIGRlbmlhbCBvZiBzZXJ2aWNlCi0o
YXBwbGljYXRpb24gY3Jhc2gpIG9yIHBvc3NpYmx5IGV4ZWN1dGUgYXJiaXRyYXJ5IGNvZGUsIGJl
Y2F1c2UgdGhvc2UKLWxvb2t1cCB2YWx1ZXMgbGVhZCB0byBpbmNvcnJlY3QgbGVuZ3RoIGNhbGN1
bGF0aW9ucyBhbmQgaW5jb3JyZWN0Ci1tZW1jcHkgb3BlcmF0aW9ucy4KLQotVGhpcyBwYXRjaCBp
bmNsdWRlcyBhIGNoZWNrIHRvIG1ha2Ugc3VyZSBsb29va3VwIHZhbHVlIGlzIHZhbGlkIGJlZm9y
ZQotdXNpbmcgaXQuIFRoaXMgaGVscHMgYXZvaWQgdW5leHBlY3RlZCB2YWx1ZSB3aGVuIHRoZSBp
bnB1dCBpcyBlbXB0eSBvcgotaW5jb3JyZWN0LgotCi1GaXhlczogQ1ZFLTIwMjUtMzI3NDMKLQot
Q1ZFOiBDVkUtMjAyNS0zMjc0MwotCi1VcHN0cmVhbS1TdGF0dXM6IEJhY2twb3J0IFtodHRwczov
L2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbmV0d29yay9jb25ubWFuL2Nvbm5tYW4uZ2l0L2NvbW1p
dC8/aWQ9ZDkwYjkxMWY2NzYwOTU5YmRmMTM5M2MzOWZlOGQxMTE4MzE1NDkwZl0KLQotU2lnbmVk
LW9mZi1ieTogUHJhdmVlbiBLdW1hciA8cHJhdmVlbi5rdW1hckB3aW5kcml2ZXIuY29tPgotLS0t
Ci0gc3JjL2Ruc3Byb3h5LmMgfCA3ICsrKysrKy0KLSAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pCi0KLWRpZmYgLS1naXQgYS9zcmMvZG5zcHJveHkuYyBiL3Ny
Yy9kbnNwcm94eS5jCi1pbmRleCBmMjhhNWQ3Li43ZWUyNmQ5IDEwMDY0NAotLS0tIGEvc3JjL2Ru
c3Byb3h5LmMKLSsrKyBiL3NyYy9kbnNwcm94eS5jCi1AQCAtMTY4NSw4ICsxNjg1LDEzIEBAIHN0
YXRpYyBpbnQgbnNfcmVzb2x2KHN0cnVjdCBzZXJ2ZXJfZGF0YSAqc2VydmVyLCBzdHJ1Y3QgcmVx
dWVzdF9kYXRhICpyZXEsCi0JCQkJZ3BvaW50ZXIgcmVxdWVzdCwgZ3BvaW50ZXIgbmFtZSkKLSB7
Ci0JaW50IHNrID0gLTE7Ci0rCWludCBlcnI7Ci0JY29uc3QgY2hhciAqbG9va3VwID0gKGNvbnN0
IGNoYXIgKiluYW1lOwotLQlpbnQgZXJyID0gbnNfdHJ5X3Jlc29sdl9mcm9tX2NhY2hlKHJlcSwg
cmVxdWVzdCwgbG9va3VwKTsKLSsKLSsJaWYgKCFsb29rdXAgfHwgc3RybGVuKGxvb2t1cCkgPT0g
MCkKLSsJCXJldHVybiAtRUlOVkFMOwotKwotKwllcnIgPSBuc190cnlfcmVzb2x2X2Zyb21fY2Fj
aGUocmVxLCByZXF1ZXN0LCBsb29rdXApOwotCi0JaWYgKGVyciA+IDApCi0JCS8qIGNhY2hlIGhp
dCAqLwotLS0KLTIuNDAuMApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9j
b25ubWFuL2Nvbm5tYW5fMS40NC5iYiBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvY29ubm1h
bi9jb25ubWFuXzEuNDUuYmIKc2ltaWxhcml0eSBpbmRleCA5OCUKcmVuYW1lIGZyb20gbWV0YS9y
ZWNpcGVzLWNvbm5lY3Rpdml0eS9jb25ubWFuL2Nvbm5tYW5fMS40NC5iYgpyZW5hbWUgdG8gbWV0
YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9jb25ubWFuL2Nvbm5tYW5fMS40NS5iYgppbmRleCAxYjBm
YmU0MzhjLi5jZmM2MTE0NzEyIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5
L2Nvbm5tYW4vY29ubm1hbl8xLjQ0LmJiCisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkv
Y29ubm1hbi9jb25ubWFuXzEuNDUuYmIKQEAgLTIxLDExICsyMSw5IEBAIERFUEVORFMgID0gImRi
dXMgZ2xpYi0yLjAiCiBTUkNfVVJJID0gIiR7S0VSTkVMT1JHX01JUlJPUn0vbGludXgvbmV0d29y
ay8ke0JQTn0vJHtCUH0udGFyLnh6IFwKICAgICAgICAgICAgZmlsZTovL2Nvbm5tYW4gXAogICAg
ICAgICAgICBmaWxlOi8vMDAwMi1yZXNvbHZlLW11c2wtZG9lcy1ub3QtaW1wbGVtZW50LXJlc19u
aW5pdC5wYXRjaCBcCi0gICAgICAgICAgIGZpbGU6Ly9DVkUtMjAyNS0zMjc0My5wYXRjaCBcCi0g
ICAgICAgICAgIGZpbGU6Ly9DVkUtMjAyNS0zMjM2Ni5wYXRjaCBcCiAgICAgICAgICAgICIKIAot
U1JDX1VSSVtzaGEyNTZzdW1dID0gIjJiZTJiMDAzMjE2MzJiNzc1ZjllZmY3MTNhY2QwNGVmMjFl
MzFmYmYzODhmNmViZjQ1NTEyZmY0Mjg5NTc0ZmYiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNzcx
MjhjY2U4MDg2NTQ1NWM0ZjEwNmI1OTAxYTU3NWUyZGZkYjM1YTdkMmUyZTI5OTZmMTZlODVjYmEx
MDkxMyIKIAogUlJFQ09NTUVORFM6JHtQTn0gPSAiY29ubm1hbi1jb25mIgogUkNPTkZMSUNUUzok
e1BOfSA9ICJuZXR3b3JrbWFuYWdlciIKLS0gCjIuNDcuMQoK

--===============0460420035371516451==--

