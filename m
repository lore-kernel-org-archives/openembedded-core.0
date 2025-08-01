Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 473D3C88CB9
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 14:07:49 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.88622.1754057265119283479
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Aug 2025 07:07:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=uHsP+dPP;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Y/rcBAWj;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019865f5da7e-0eed396f-bf72-431f-8442-cff7ab60fe34-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1754057267;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Ki7GzBGj3AZAzSOlrETzoQJYTreTOd84PkGx0+nh0lw=;
	b=uHsP+dPPo7xmaJOgGjUw32pbbS6iggGInkelzqg2s7sL9oTH+d8jg+E7e7iB19q7
	AsLh1KkkrWBaTODQMwNNA76HNs8GhIUJDucNvH0pV9WAWb6tymTCYdk9OUMK7ggiZmV
	DsBnEZ8EsHbQ7LbBZPUni1Cscby/h8pn1KEX+wfg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1754057267;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Ki7GzBGj3AZAzSOlrETzoQJYTreTOd84PkGx0+nh0lw=;
	b=Y/rcBAWjey/oYPW5212uAYfYOiLtUstThnGMSpoz5pZmFAyI5cTNMo7NNNQtdIHE
	RVj8k5sKeyWPyopey8OZusWmljWAtmWL3+MwQgPrsXO2DP2az0Blqiw+pn/BtjMTBHn
	59120xGz92i+X4wKflhI1XkuaWGOvEPoc/IzTIDk=
Content-Type: multipart/mixed; boundary="===============0052277982903206378=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Changhyeok Bae <changhyeok.bae@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] connman: upgrading to 1.45 SUCCEEDED
Message-ID: <0101019865f5da7e-0eed396f-bf72-431f-8442-cff7ab60fe34-000000@us-west-2.amazonses.com>
Date: Fri, 1 Aug 2025 14:07:47 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.08.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 14:07:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221258

--===============0052277982903206378==
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
From 475c5843c58fa700da3e3fca2cb3655fc2e469eb Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Aug 2025 08:29:19 +0000
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
index 2c612039ee..01399dbab8 100644
--- a/meta/recipes-connectivity/connman/connman/0002-resolve-musl-does-not-implement-res_ninit.patch
+++ b/meta/recipes-connectivity/connman/connman/0002-resolve-musl-does-not-implement-res_ninit.patch
@@ -1,4 +1,4 @@
-From 4e726a5aaa75d60fab6a56bc37dbec48be53ff79 Mon Sep 17 00:00:00 2001
+From 0ebbd2716facbef0cfb5e0666903bbbd2e800104 Mon Sep 17 00:00:00 2001
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


--===============0052277982903206378==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-connman-upgrade-1.44-1.45.patch"

RnJvbSA0NzVjNTg0M2M1OGZhNzAwZGEzZTNmY2EyY2IzNjU1ZmMyZTQ2OWViIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBBdWcgMjAyNSAwODoyOToxOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGNv
bm5tYW46IHVwZ3JhZGUgMS40NCAtPiAxLjQ1CgotLS0KIC4uLnZlLW11c2wtZG9lcy1ub3QtaW1w
bGVtZW50LXJlc19uaW5pdC5wYXRjaCB8ICAyICstCiAuLi4vY29ubm1hbi9jb25ubWFuL0NWRS0y
MDI1LTMyMzY2LnBhdGNoICAgICAgfCA0MSAtLS0tLS0tLS0tLS0tLS0tCiAuLi4vY29ubm1hbi9j
b25ubWFuL0NWRS0yMDI1LTMyNzQzLnBhdGNoICAgICAgfCA0OCAtLS0tLS0tLS0tLS0tLS0tLS0t
CiAuLi4ve2Nvbm5tYW5fMS40NC5iYiA9PiBjb25ubWFuXzEuNDUuYmJ9ICAgICAgfCAgNCArLQog
NCBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDkzIGRlbGV0aW9ucygtKQogZGVsZXRl
IG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvY29ubm1hbi9jb25ubWFuL0NW
RS0yMDI1LTMyMzY2LnBhdGNoCiBkZWxldGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWNvbm5l
Y3Rpdml0eS9jb25ubWFuL2Nvbm5tYW4vQ1ZFLTIwMjUtMzI3NDMucGF0Y2gKIHJlbmFtZSBtZXRh
L3JlY2lwZXMtY29ubmVjdGl2aXR5L2Nvbm5tYW4ve2Nvbm5tYW5fMS40NC5iYiA9PiBjb25ubWFu
XzEuNDUuYmJ9ICg5OCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9j
b25ubWFuL2Nvbm5tYW4vMDAwMi1yZXNvbHZlLW11c2wtZG9lcy1ub3QtaW1wbGVtZW50LXJlc19u
aW5pdC5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvY29ubm1hbi9jb25ubWFuLzAw
MDItcmVzb2x2ZS1tdXNsLWRvZXMtbm90LWltcGxlbWVudC1yZXNfbmluaXQucGF0Y2gKaW5kZXgg
MmM2MTIwMzllZS4uMDEzOTlkYmFiOCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rp
dml0eS9jb25ubWFuL2Nvbm5tYW4vMDAwMi1yZXNvbHZlLW11c2wtZG9lcy1ub3QtaW1wbGVtZW50
LXJlc19uaW5pdC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2Nvbm5tYW4v
Y29ubm1hbi8wMDAyLXJlc29sdmUtbXVzbC1kb2VzLW5vdC1pbXBsZW1lbnQtcmVzX25pbml0LnBh
dGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA0ZTcyNmE1YWFhNzVkNjBmYWI2YTU2YmMzN2RiZWM0
OGJlNTNmZjc5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAwZWJiZDI3MTZmYWNiZWYw
Y2ZiNWUwNjY2OTAzYmJiZDJlODAwMTA0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTog
S2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KIERhdGU6IE1vbiwgNiBBcHIgMjAxNSAyMzow
MjoyMSAtMDcwMAogU3ViamVjdDogW1BBVENIXSBnd2ViL2dyZXNvbHYuYzogbWFrZSB1c2Ugb2Yg
cmVzX25pbml0IG9wdGlvbmFsIGFuZCBzdWJqZWN0IHRvCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtY29ubmVjdGl2aXR5L2Nvbm5tYW4vY29ubm1hbi9DVkUtMjAyNS0zMjM2Ni5wYXRjaCBiL21l
dGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvY29ubm1hbi9jb25ubWFuL0NWRS0yMDI1LTMyMzY2LnBh
dGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCA2MmYwN2U3MDdhLi4wMDAwMDAwMDAw
Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvY29ubm1hbi9jb25ubWFuL0NWRS0yMDI1
LTMyMzY2LnBhdGNoCisrKyAvZGV2L251bGwKQEAgLTEsNDEgKzAsMCBAQAotRnJvbSA4ZDNiZTAy
ODVmMWQ0NjY3YmZlODVkYmE1NTVjNjYzZWIzZDcwNGI0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQotRnJvbTogWW9vbmplIFNoaW4gPGlvZXJ0c0Brb29rbWluLmFjLmtyPgotRGF0ZTogTW9uLCAx
MiBNYXkgMjAyNSAxMDo0ODoxOCArMDIwMAotU3ViamVjdDogW1BBVENIXSBkbnNwcm94eTogQWRk
cmVzcyBDVkUtMjAyNS0zMjM2NiB2dWxuZXJhYmlsaXR5Ci0KLUluIENvbm5tYW4gcGFyc2VfcnIg
aW4gZG5zcHJveHkuYyBoYXMgYSBtZW1jcHkgbGVuZ3RoCi10aGF0IGRlcGVuZHMgb24gYW4gUlIg
UkRMRU5HVEggdmFsdWUgKGkuZS4sICpyZGxlbj1udG9ocyhyci0+cmRsZW4pCi1hbmQgbWVtY3B5
KHJlc3BvbnNlK29mZnNldCwqZW5kLCpyZGxlbikpLiBIZXJlLCByZGxlbiBtYXkgYmUgbGFyZ2Vy
Ci10aGFuIHRoZSBhbW91bnQgb2YgcmVtYWluaW5nIHBhY2tldCBkYXRhIGluIHRoZSBjdXJyZW50
IHN0YXRlIG9mCi1wYXJzaW5nLiBBcyBhIHJlc3VsdCwgdmFsdWVzIG9mIHN0YWNrIG1lbW9yeSBs
b2NhdGlvbnMgbWF5IGJlIHNlbnQKLW92ZXIgdGhlIG5ldHdvcmsgaW4gYSByZXNwb25zZS4KLQot
VGhpcyBwYXRjaCBhZGRzIGEgY2hlY2sgdG8gZW5zdXJlIHRoYXQgKCplbmQgKyAqcmRsZW4pIGRv
ZXMgbm90IGV4Y2VlZAotdGhlIHZhbGlkIHJhbmdlLiBJZiB0aGUgY29uZGl0aW9uIGlzIHZpb2xh
dGVkLCB0aGUgZnVuY3Rpb24gcmV0dXJucwotLUVJTlZBTC4KLQotQ1ZFOiBDVkUtMjAyNS0zMjM2
NgotCi1VcHN0cmVhbS1TdGF0dXM6IEJhY2twb3J0IFtodHRwczovL2dpdC5rZXJuZWwub3JnL3B1
Yi9zY20vbmV0d29yay9jb25ubWFuL2Nvbm5tYW4uZ2l0L2NvbW1pdC8/aWQ9OGQzYmUwMjg1ZjFk
NDY2N2JmZTg1ZGJhNTU1YzY2M2ViM2Q3MDRiNF0KLQotU2lnbmVkLW9mZi1ieTogUHJhdmVlbiBL
dW1hciA8cHJhdmVlbi5rdW1hckB3aW5kcml2ZXIuY29tPgotLS0tCi0gc3JjL2Ruc3Byb3h5LmMg
fCAzICsrKwotIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKLQotZGlmZiAtLWdpdCBh
L3NyYy9kbnNwcm94eS5jIGIvc3JjL2Ruc3Byb3h5LmMKLWluZGV4IDdlZTI2ZDkuLjFkZDJmN2Yg
MTAwNjQ0Ci0tLS0gYS9zcmMvZG5zcHJveHkuYwotKysrIGIvc3JjL2Ruc3Byb3h5LmMKLUBAIC05
OTgsNiArOTk4LDkgQEAgc3RhdGljIGludCBwYXJzZV9ycihjb25zdCB1bnNpZ25lZCBjaGFyICpi
dWYsIGNvbnN0IHVuc2lnbmVkIGNoYXIgKnN0YXJ0LAotCWlmICgob2Zmc2V0ICsgKnJkbGVuKSA+
ICpyZXNwb25zZV9zaXplKQotCQlyZXR1cm4gLUVOT0JVRlM7Ci0KLSsJaWYgKCgqZW5kICsgKnJk
bGVuKSA+IG1heCkKLSsJCXJldHVybiAtRUlOVkFMOwotKwotCW1lbWNweShyZXNwb25zZSArIG9m
ZnNldCwgKmVuZCwgKnJkbGVuKTsKLQotCSplbmQgKz0gKnJkbGVuOwotLS0KLTIuNDAuMApkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9jb25ubWFuL2Nvbm5tYW4vQ1ZFLTIw
MjUtMzI3NDMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2Nvbm5tYW4vY29ubm1h
bi9DVkUtMjAyNS0zMjc0My5wYXRjaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggYzEx
NDU4OTY3OS4uMDAwMDAwMDAwMAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2Nvbm5t
YW4vY29ubm1hbi9DVkUtMjAyNS0zMjc0My5wYXRjaAorKysgL2Rldi9udWxsCkBAIC0xLDQ4ICsw
LDAgQEAKLUZyb20gZDkwYjkxMWY2NzYwOTU5YmRmMTM5M2MzOWZlOGQxMTE4MzE1NDkwZiBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IFByYXZlZW4gS3VtYXIgPHByYXZlZW4ua3VtYXJA
d2luZHJpdmVyLmNvbT4KLURhdGU6IFRodSwgMjQgQXByIDIwMjUgMTE6Mzk6MjkgKzAwMDAKLVN1
YmplY3Q6IFtQQVRDSF0gZG5zcHJveHk6IEZpeCBOVUxML2VtcHR5IGxvb2t1cCBjYXVzaW5nIHBv
dGVudGlhbCBjcmFzaAotCi1JbiBDb25uTWFuIHRocm91Z2ggMS40NCwgdGhlIGxvb2t1cCBzdHJp
bmcgaW4gbnNfcmVzb2x2IGluIGRuc3Byb3h5LmMKLWNhbiBiZSBOVUxMIG9yIGFuIGVtcHR5IHN0
cmluZyB3aGVuIHRoZSBUQyAoVHJ1bmNhdGVkKSBiaXQgaXMgc2V0IGluCi1hIEROUyByZXNwb25z
ZS4gVGhpcyBhbGxvd3MgYXR0YWNrZXJzIHRvIGNhdXNlIGEgZGVuaWFsIG9mIHNlcnZpY2UKLShh
cHBsaWNhdGlvbiBjcmFzaCkgb3IgcG9zc2libHkgZXhlY3V0ZSBhcmJpdHJhcnkgY29kZSwgYmVj
YXVzZSB0aG9zZQotbG9va3VwIHZhbHVlcyBsZWFkIHRvIGluY29ycmVjdCBsZW5ndGggY2FsY3Vs
YXRpb25zIGFuZCBpbmNvcnJlY3QKLW1lbWNweSBvcGVyYXRpb25zLgotCi1UaGlzIHBhdGNoIGlu
Y2x1ZGVzIGEgY2hlY2sgdG8gbWFrZSBzdXJlIGxvb29rdXAgdmFsdWUgaXMgdmFsaWQgYmVmb3Jl
Ci11c2luZyBpdC4gVGhpcyBoZWxwcyBhdm9pZCB1bmV4cGVjdGVkIHZhbHVlIHdoZW4gdGhlIGlu
cHV0IGlzIGVtcHR5IG9yCi1pbmNvcnJlY3QuCi0KLUZpeGVzOiBDVkUtMjAyNS0zMjc0MwotCi1D
VkU6IENWRS0yMDI1LTMyNzQzCi0KLVVwc3RyZWFtLVN0YXR1czogQmFja3BvcnQgW2h0dHBzOi8v
Z2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9uZXR3b3JrL2Nvbm5tYW4vY29ubm1hbi5naXQvY29tbWl0
Lz9pZD1kOTBiOTExZjY3NjA5NTliZGYxMzkzYzM5ZmU4ZDExMTgzMTU0OTBmXQotCi1TaWduZWQt
b2ZmLWJ5OiBQcmF2ZWVuIEt1bWFyIDxwcmF2ZWVuLmt1bWFyQHdpbmRyaXZlci5jb20+Ci0tLS0K
LSBzcmMvZG5zcHJveHkuYyB8IDcgKysrKysrLQotIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlv
bnMoKyksIDEgZGVsZXRpb24oLSkKLQotZGlmZiAtLWdpdCBhL3NyYy9kbnNwcm94eS5jIGIvc3Jj
L2Ruc3Byb3h5LmMKLWluZGV4IGYyOGE1ZDcuLjdlZTI2ZDkgMTAwNjQ0Ci0tLS0gYS9zcmMvZG5z
cHJveHkuYwotKysrIGIvc3JjL2Ruc3Byb3h5LmMKLUBAIC0xNjg1LDggKzE2ODUsMTMgQEAgc3Rh
dGljIGludCBuc19yZXNvbHYoc3RydWN0IHNlcnZlcl9kYXRhICpzZXJ2ZXIsIHN0cnVjdCByZXF1
ZXN0X2RhdGEgKnJlcSwKLQkJCQlncG9pbnRlciByZXF1ZXN0LCBncG9pbnRlciBuYW1lKQotIHsK
LQlpbnQgc2sgPSAtMTsKLSsJaW50IGVycjsKLQljb25zdCBjaGFyICpsb29rdXAgPSAoY29uc3Qg
Y2hhciAqKW5hbWU7Ci0tCWludCBlcnIgPSBuc190cnlfcmVzb2x2X2Zyb21fY2FjaGUocmVxLCBy
ZXF1ZXN0LCBsb29rdXApOwotKwotKwlpZiAoIWxvb2t1cCB8fCBzdHJsZW4obG9va3VwKSA9PSAw
KQotKwkJcmV0dXJuIC1FSU5WQUw7Ci0rCi0rCWVyciA9IG5zX3RyeV9yZXNvbHZfZnJvbV9jYWNo
ZShyZXEsIHJlcXVlc3QsIGxvb2t1cCk7Ci0KLQlpZiAoZXJyID4gMCkKLQkJLyogY2FjaGUgaGl0
ICovCi0tLQotMi40MC4wCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2Nv
bm5tYW4vY29ubm1hbl8xLjQ0LmJiIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9jb25ubWFu
L2Nvbm5tYW5fMS40NS5iYgpzaW1pbGFyaXR5IGluZGV4IDk4JQpyZW5hbWUgZnJvbSBtZXRhL3Jl
Y2lwZXMtY29ubmVjdGl2aXR5L2Nvbm5tYW4vY29ubm1hbl8xLjQ0LmJiCnJlbmFtZSB0byBtZXRh
L3JlY2lwZXMtY29ubmVjdGl2aXR5L2Nvbm5tYW4vY29ubm1hbl8xLjQ1LmJiCmluZGV4IDFiMGZi
ZTQzOGMuLmNmYzYxMTQ3MTIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkv
Y29ubm1hbi9jb25ubWFuXzEuNDQuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9j
b25ubWFuL2Nvbm5tYW5fMS40NS5iYgpAQCAtMjEsMTEgKzIxLDkgQEAgREVQRU5EUyAgPSAiZGJ1
cyBnbGliLTIuMCIKIFNSQ19VUkkgPSAiJHtLRVJORUxPUkdfTUlSUk9SfS9saW51eC9uZXR3b3Jr
LyR7QlBOfS8ke0JQfS50YXIueHogXAogICAgICAgICAgICBmaWxlOi8vY29ubm1hbiBcCiAgICAg
ICAgICAgIGZpbGU6Ly8wMDAyLXJlc29sdmUtbXVzbC1kb2VzLW5vdC1pbXBsZW1lbnQtcmVzX25p
bml0LnBhdGNoIFwKLSAgICAgICAgICAgZmlsZTovL0NWRS0yMDI1LTMyNzQzLnBhdGNoIFwKLSAg
ICAgICAgICAgZmlsZTovL0NWRS0yMDI1LTMyMzY2LnBhdGNoIFwKICAgICAgICAgICAgIgogCi1T
UkNfVVJJW3NoYTI1NnN1bV0gPSAiMmJlMmIwMDMyMTYzMmI3NzVmOWVmZjcxM2FjZDA0ZWYyMWUz
MWZiZjM4OGY2ZWJmNDU1MTJmZjQyODk1NzRmZiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI3NzEy
OGNjZTgwODY1NDU1YzRmMTA2YjU5MDFhNTc1ZTJkZmRiMzVhN2QyZTJlMjk5NmYxNmU4NWNiYTEw
OTEzIgogCiBSUkVDT01NRU5EUzoke1BOfSA9ICJjb25ubWFuLWNvbmYiCiBSQ09ORkxJQ1RTOiR7
UE59ID0gIm5ldHdvcmttYW5hZ2VyIgotLSAKMi40Ny4xCgo=

--===============0052277982903206378==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/connman/connman-client: PKGV changed from 1.44 [default] to 1.45 [default]
packages/core2-64-poky-linux/connman/connman-client: PV changed from "1.44" to "1.45"
packages/core2-64-poky-linux/connman/connman-dbg: PKGV changed from 1.44 [default] to 1.45 [default]
packages/core2-64-poky-linux/connman/connman-dbg: PV changed from "1.44" to "1.45"
packages/core2-64-poky-linux/connman/connman-dbg: PKGSIZE changed from 6010096 to 6019088 (+0%)
packages/core2-64-poky-linux/connman/connman-dev: PKGV changed from 1.44 [default] to 1.45 [default]
packages/core2-64-poky-linux/connman/connman-dev: PV changed from "1.44" to "1.45"
packages/core2-64-poky-linux/connman/connman-doc: PKGV changed from 1.44 [default] to 1.45 [default]
packages/core2-64-poky-linux/connman/connman-doc: PV changed from "1.44" to "1.45"
packages/core2-64-poky-linux/connman/connman-doc: PKGSIZE changed from 51945 to 51962 (+0%)
packages/core2-64-poky-linux/connman/connman-locale: PKGV changed from 1.44 [default] to 1.45 [default]
packages/core2-64-poky-linux/connman/connman-locale: PV changed from "1.44" to "1.45"
packages/core2-64-poky-linux/connman/connman-src: PKGV changed from 1.44 [default] to 1.45 [default]
packages/core2-64-poky-linux/connman/connman-src: PV changed from "1.44" to "1.45"
packages/core2-64-poky-linux/connman/connman-staticdev: PKGV changed from 1.44 [default] to 1.45 [default]
packages/core2-64-poky-linux/connman/connman-staticdev: PV changed from "1.44" to "1.45"
packages/core2-64-poky-linux/connman/connman-tests: PKGV changed from 1.44 [default] to 1.45 [default]
packages/core2-64-poky-linux/connman/connman-tests: PV changed from "1.44" to "1.45"
packages/core2-64-poky-linux/connman/connman-tools: PKGV changed from 1.44 [default] to 1.45 [default]
packages/core2-64-poky-linux/connman/connman-tools: PV changed from "1.44" to "1.45"
packages/core2-64-poky-linux/connman/connman-vpn: PKGV changed from 1.44 [default] to 1.45 [default]
packages/core2-64-poky-linux/connman/connman-vpn: PV changed from "1.44" to "1.45"
packages/core2-64-poky-linux/connman/connman-wait-online: PKGV changed from 1.44 [default] to 1.45 [default]
packages/core2-64-poky-linux/connman/connman-wait-online: PV changed from "1.44" to "1.45"
packages/core2-64-poky-linux/connman/connman: PKGV changed from 1.44 [default] to 1.45 [default]
packages/core2-64-poky-linux/connman/connman: PV changed from "1.44" to "1.45"
packages/core2-64-poky-linux/connman: PKGV changed from 1.44 [default] to 1.45 [default]
packages/core2-64-poky-linux/connman: SRC_URI changed from "https://cdn.kernel.org/pub/linux/network/connman/connman-1.44.tar.xz file://connman file://0002-resolve-musl-does-not-implement-res_ninit.patch file://CVE-2025-32743.patch file://CVE-2025-32366.patch" to "https://cdn.kernel.org/pub/linux/network/connman/connman-1.45.tar.xz file://connman file://0002-resolve-musl-does-not-implement-res_ninit.patch"
packages/core2-64-poky-linux/connman: PV changed from "1.44" to "1.45"

--===============0052277982903206378==--

