Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0B4FCDB47E
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 19:45:19 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.102697.1697399113073199657
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Oct 2023 12:45:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Fso0v3Co;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=lYG1aG7F;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.23, mailfrom: 0101018b34df01c7-2c25cbc3-7ef9-478b-98b9-48378989b689-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1697399112;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=8W3vqqouAGazdujvv/1nx4zDJczXVtSa6HNSxENiJRY=;
	b=Fso0v3CoWk9a18Yhub61JpWgylJBuLcFYdgTrKEkVJhiwyfQ7t7o1ntbJpuu2hl3
	W54omrNSTrXo3O5iwTO1KE3MpF+Rlu3Sjm2ZizLGFjqKDiMbl+DritNoXIp5ZxzMTdv
	HgEQF5D2Xsky6VIv7L3QZW2mm0F2HpL9pJw86m/I=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1697399112;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=8W3vqqouAGazdujvv/1nx4zDJczXVtSa6HNSxENiJRY=;
	b=lYG1aG7FHlmGYkwbkoepCoYwaNT1wRWgSbrI0vV8VqhIO4FMuFRj0Rb+S03ROTn1
	Bs4ZVc5uU//saBzB5HmzhDGyC0EyZLOvS2g+Em4CYJ0wh8N/YMf6QsEwbT5PpDNouXg
	ERKSCQWCTbHUdGwiYiuaD7iUFqezmji6lwDeQAJA=
Content-Type: multipart/mixed; boundary="===============1665634299540488590=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] dhcpcd: upgrading to 10.0.3 SUCCEEDED
Message-ID: <0101018b34df01c7-2c25cbc3-7ef9-478b-98b9-48378989b689-000000@us-west-2.amazonses.com>
Date: Sun, 15 Oct 2023 19:45:12 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.10.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Oct 2023 19:45:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189160

--===============1665634299540488590==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *dhcpcd* to *10.0.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-dhcpcd-upgrade-10.0.2-10.0.3.patch
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
From 33dae664cb108dc405845253d2e26491fe026b51 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Oct 2023 07:41:57 +0000
Subject: [PATCH] dhcpcd: upgrade 10.0.2 -> 10.0.3

---
 .../{dhcpcd_10.0.2.bb => dhcpcd_10.0.3.bb}    |  3 +-
 ...x-strlcpy-overflow-in-psp_ifname-239.patch | 33 -------------------
 2 files changed, 1 insertion(+), 35 deletions(-)
 rename meta/recipes-connectivity/dhcpcd/{dhcpcd_10.0.2.bb => dhcpcd_10.0.3.bb} (94%)
 delete mode 100644 meta/recipes-connectivity/dhcpcd/files/0001-privsep-fix-strlcpy-overflow-in-psp_ifname-239.patch

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.2.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.3.bb
similarity index 94%
rename from meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.2.bb
rename to meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.3.bb
index 0966edd1b8..cc0fb382df 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.2.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.3.bb
@@ -15,10 +15,9 @@ SRC_URI = "git://github.com/NetworkConfiguration/dhcpcd;protocol=https;branch=ma
            file://dhcpcd.service \
            file://dhcpcd@.service \
            file://0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch \
-           file://0001-privsep-fix-strlcpy-overflow-in-psp_ifname-239.patch \
            "
 
-SRCREV = "d2fbde99cf2d0072016af9dfe6a77032a5a9fc30"
+SRCREV = "45fb8fd8dd281d2228c7abaddff7877d27e67146"
 S = "${WORKDIR}/git"
 
 inherit pkgconfig autotools-brokensep systemd useradd
diff --git a/meta/recipes-connectivity/dhcpcd/files/0001-privsep-fix-strlcpy-overflow-in-psp_ifname-239.patch b/meta/recipes-connectivity/dhcpcd/files/0001-privsep-fix-strlcpy-overflow-in-psp_ifname-239.patch
deleted file mode 100644
index d4fb1737a6..0000000000
--- a/meta/recipes-connectivity/dhcpcd/files/0001-privsep-fix-strlcpy-overflow-in-psp_ifname-239.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 1bd8fc7d4b34f752a32709d277a897e5ad202d97 Mon Sep 17 00:00:00 2001
-From: Tobias Heider <tobhe@users.noreply.github.com>
-Date: Tue, 15 Aug 2023 18:06:48 +0200
-Subject: [PATCH] privsep: fix strlcpy overflow in psp_ifname (#239)
-
-When running our Ubuntu tests with libc6 and strlcpy overflow checks
-enabled we found that the wrong size is passed to strlcpy resulting
-in a crash because of an overflow.
-
-Upstream-Status: Backport
-[https://github.com/NetworkConfiguration/dhcpcd/commit/1bd8fc7d4b34f752a32709d277a897e5ad202d97]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- src/privsep.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/privsep.c b/src/privsep.c
-index b11c0351..cfe54742 100644
---- a/src/privsep.c
-+++ b/src/privsep.c
-@@ -1200,7 +1200,7 @@ ps_newprocess(struct dhcpcd_ctx *ctx, struct ps_id *psid)
- #endif
- 
- 	if (!(ctx->options & DHCPCD_MANAGER))
--		strlcpy(psp->psp_ifname, ctx->ifv[0], sizeof(psp->psp_name));
-+		strlcpy(psp->psp_ifname, ctx->ifv[0], sizeof(psp->psp_ifname));
- 	TAILQ_INSERT_TAIL(&ctx->ps_processes, psp, next);
- 	return psp;
- }
--- 
-2.25.1
-
-- 
2.39.2


--===============1665634299540488590==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/dhcpcd/dhcpcd-dbg: RRECOMMENDS: added "libcrypto-dbg"
packages/core2-32-poky-linux/dhcpcd/dhcpcd-dev: RRECOMMENDS: added "libcrypto-dev"
packages/core2-32-poky-linux/dhcpcd/dhcpcd: RDEPENDS: added "libcrypto (['>= 3.1.3'])"

--===============1665634299540488590==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-dhcpcd-upgrade-10.0.2-10.0.3.patch"

RnJvbSAzM2RhZTY2NGNiMTA4ZGM0MDU4NDUyNTNkMmUyNjQ5MWZlMDI2YjUxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgT2N0IDIwMjMgMDc6NDE6NTcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
aGNwY2Q6IHVwZ3JhZGUgMTAuMC4yIC0+IDEwLjAuMwoKLS0tCiAuLi4ve2RoY3BjZF8xMC4wLjIu
YmIgPT4gZGhjcGNkXzEwLjAuMy5iYn0gICAgfCAgMyArLQogLi4ueC1zdHJsY3B5LW92ZXJmbG93
LWluLXBzcF9pZm5hbWUtMjM5LnBhdGNoIHwgMzMgLS0tLS0tLS0tLS0tLS0tLS0tLQogMiBmaWxl
cyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMzUgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWNvbm5lY3Rpdml0eS9kaGNwY2Qve2RoY3BjZF8xMC4wLjIuYmIgPT4gZGhjcGNkXzEw
LjAuMy5iYn0gKDk0JSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtY29ubmVjdGl2
aXR5L2RoY3BjZC9maWxlcy8wMDAxLXByaXZzZXAtZml4LXN0cmxjcHktb3ZlcmZsb3ctaW4tcHNw
X2lmbmFtZS0yMzkucGF0Y2gKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5
L2RoY3BjZC9kaGNwY2RfMTAuMC4yLmJiIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9kaGNw
Y2QvZGhjcGNkXzEwLjAuMy5iYgpzaW1pbGFyaXR5IGluZGV4IDk0JQpyZW5hbWUgZnJvbSBtZXRh
L3JlY2lwZXMtY29ubmVjdGl2aXR5L2RoY3BjZC9kaGNwY2RfMTAuMC4yLmJiCnJlbmFtZSB0byBt
ZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2RoY3BjZC9kaGNwY2RfMTAuMC4zLmJiCmluZGV4IDA5
NjZlZGQxYjguLmNjMGZiMzgyZGYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZp
dHkvZGhjcGNkL2RoY3BjZF8xMC4wLjIuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0
eS9kaGNwY2QvZGhjcGNkXzEwLjAuMy5iYgpAQCAtMTUsMTAgKzE1LDkgQEAgU1JDX1VSSSA9ICJn
aXQ6Ly9naXRodWIuY29tL05ldHdvcmtDb25maWd1cmF0aW9uL2RoY3BjZDtwcm90b2NvbD1odHRw
czticmFuY2g9bWEKICAgICAgICAgICAgZmlsZTovL2RoY3BjZC5zZXJ2aWNlIFwKICAgICAgICAg
ICAgZmlsZTovL2RoY3BjZEAuc2VydmljZSBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLWRoY3Bj
ZC44LUZpeC1jb25mbGljdC1lcnJvci13aGVuLWVuYWJsZS1tdWx0aWxpYi5wYXRjaCBcCi0gICAg
ICAgICAgIGZpbGU6Ly8wMDAxLXByaXZzZXAtZml4LXN0cmxjcHktb3ZlcmZsb3ctaW4tcHNwX2lm
bmFtZS0yMzkucGF0Y2ggXAogICAgICAgICAgICAiCiAKLVNSQ1JFViA9ICJkMmZiZGU5OWNmMmQw
MDcyMDE2YWY5ZGZlNmE3NzAzMmE1YTlmYzMwIgorU1JDUkVWID0gIjQ1ZmI4ZmQ4ZGQyODFkMjIy
OGM3YWJhZGRmZjc4NzdkMjdlNjcxNDYiCiBTID0gIiR7V09SS0RJUn0vZ2l0IgogCiBpbmhlcml0
IHBrZ2NvbmZpZyBhdXRvdG9vbHMtYnJva2Vuc2VwIHN5c3RlbWQgdXNlcmFkZApkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9kaGNwY2QvZmlsZXMvMDAwMS1wcml2c2VwLWZp
eC1zdHJsY3B5LW92ZXJmbG93LWluLXBzcF9pZm5hbWUtMjM5LnBhdGNoIGIvbWV0YS9yZWNpcGVz
LWNvbm5lY3Rpdml0eS9kaGNwY2QvZmlsZXMvMDAwMS1wcml2c2VwLWZpeC1zdHJsY3B5LW92ZXJm
bG93LWluLXBzcF9pZm5hbWUtMjM5LnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRl
eCBkNGZiMTczN2E2Li4wMDAwMDAwMDAwCi0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkv
ZGhjcGNkL2ZpbGVzLzAwMDEtcHJpdnNlcC1maXgtc3RybGNweS1vdmVyZmxvdy1pbi1wc3BfaWZu
YW1lLTIzOS5wYXRjaAorKysgL2Rldi9udWxsCkBAIC0xLDMzICswLDAgQEAKLUZyb20gMWJkOGZj
N2Q0YjM0Zjc1MmEzMjcwOWQyNzdhODk3ZTVhZDIwMmQ5NyBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKLUZyb206IFRvYmlhcyBIZWlkZXIgPHRvYmhlQHVzZXJzLm5vcmVwbHkuZ2l0aHViLmNvbT4K
LURhdGU6IFR1ZSwgMTUgQXVnIDIwMjMgMTg6MDY6NDggKzAyMDAKLVN1YmplY3Q6IFtQQVRDSF0g
cHJpdnNlcDogZml4IHN0cmxjcHkgb3ZlcmZsb3cgaW4gcHNwX2lmbmFtZSAoIzIzOSkKLQotV2hl
biBydW5uaW5nIG91ciBVYnVudHUgdGVzdHMgd2l0aCBsaWJjNiBhbmQgc3RybGNweSBvdmVyZmxv
dyBjaGVja3MKLWVuYWJsZWQgd2UgZm91bmQgdGhhdCB0aGUgd3Jvbmcgc2l6ZSBpcyBwYXNzZWQg
dG8gc3RybGNweSByZXN1bHRpbmcKLWluIGEgY3Jhc2ggYmVjYXVzZSBvZiBhbiBvdmVyZmxvdy4K
LQotVXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9ydAotW2h0dHBzOi8vZ2l0aHViLmNvbS9OZXR3b3Jr
Q29uZmlndXJhdGlvbi9kaGNwY2QvY29tbWl0LzFiZDhmYzdkNGIzNGY3NTJhMzI3MDlkMjc3YTg5
N2U1YWQyMDJkOTddCi0KLVNpZ25lZC1vZmYtYnk6IFlpIFpoYW8gPHlpLnpoYW9Ad2luZHJpdmVy
LmNvbT4KLS0tLQotIHNyYy9wcml2c2VwLmMgfCAyICstCi0gMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCi0KLWRpZmYgLS1naXQgYS9zcmMvcHJpdnNlcC5jIGIv
c3JjL3ByaXZzZXAuYwotaW5kZXggYjExYzAzNTEuLmNmZTU0NzQyIDEwMDY0NAotLS0tIGEvc3Jj
L3ByaXZzZXAuYwotKysrIGIvc3JjL3ByaXZzZXAuYwotQEAgLTEyMDAsNyArMTIwMCw3IEBAIHBz
X25ld3Byb2Nlc3Moc3RydWN0IGRoY3BjZF9jdHggKmN0eCwgc3RydWN0IHBzX2lkICpwc2lkKQot
ICNlbmRpZgotIAotIAlpZiAoIShjdHgtPm9wdGlvbnMgJiBESENQQ0RfTUFOQUdFUikpCi0tCQlz
dHJsY3B5KHBzcC0+cHNwX2lmbmFtZSwgY3R4LT5pZnZbMF0sIHNpemVvZihwc3AtPnBzcF9uYW1l
KSk7Ci0rCQlzdHJsY3B5KHBzcC0+cHNwX2lmbmFtZSwgY3R4LT5pZnZbMF0sIHNpemVvZihwc3At
PnBzcF9pZm5hbWUpKTsKLSAJVEFJTFFfSU5TRVJUX1RBSUwoJmN0eC0+cHNfcHJvY2Vzc2VzLCBw
c3AsIG5leHQpOwotIAlyZXR1cm4gcHNwOwotIH0KLS0tIAotMi4yNS4xCi0KLS0gCjIuMzkuMgoK

--===============1665634299540488590==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/dhcpcd/dhcpcd-dbg: RRECOMMENDS: added "libcrypto-dbg"
packages/core2-32-poky-linux/dhcpcd/dhcpcd-dbg: PV changed from "10.0.2" to "10.0.3"
packages/core2-32-poky-linux/dhcpcd/dhcpcd-dbg: PKGSIZE changed from 1059108 to 1038644 (-2%)
packages/core2-32-poky-linux/dhcpcd/dhcpcd-dbg: PKGV changed from 10.0.2 [default] to 10.0.3 [default]
packages/core2-32-poky-linux/dhcpcd/dhcpcd-dev: RRECOMMENDS: added "libcrypto-dev"
packages/core2-32-poky-linux/dhcpcd/dhcpcd-dev: PV changed from "10.0.2" to "10.0.3"
packages/core2-32-poky-linux/dhcpcd/dhcpcd-dev: PKGV changed from 10.0.2 [default] to 10.0.3 [default]
packages/core2-32-poky-linux/dhcpcd/dhcpcd-doc: PV changed from "10.0.2" to "10.0.3"
packages/core2-32-poky-linux/dhcpcd/dhcpcd-doc: PKGSIZE changed from 64288 to 64522 (+0%)
packages/core2-32-poky-linux/dhcpcd/dhcpcd-doc: PKGV changed from 10.0.2 [default] to 10.0.3 [default]
packages/core2-32-poky-linux/dhcpcd/dhcpcd-locale: PV changed from "10.0.2" to "10.0.3"
packages/core2-32-poky-linux/dhcpcd/dhcpcd-locale: PKGV changed from 10.0.2 [default] to 10.0.3 [default]
packages/core2-32-poky-linux/dhcpcd/dhcpcd-src: FILELIST: directory renamed /usr/src/debug/dhcpcd/10.0.2-r0/compat -> /usr/src/debug/dhcpcd/10.0.3-r0/compat, directory renamed /usr/src/debug/dhcpcd/10.0.2-r0/src -> /usr/src/debug/dhcpcd/10.0.3-r0/src, directory renamed /usr/src/debug/dhcpcd/10.0.2-r0/src/dev -> /usr/src/debug/dhcpcd/10.0.3-r0/src/dev, removed "/usr/src/debug/dhcpcd/10.0.2-r0/compat/crypt/md5.h /usr/src/debug/dhcpcd/10.0.2-r0/compat/crypt/hmac.c /usr/src/debug/dhcpcd/10.0.2-r0/compat/crypt/md5.c /usr/src/debug/dhcpcd/10.0.2-r0/compat/crypt/hmac.h /usr/src/debug/dhcpcd/10.0.2-r0/compat/crypt/sha256.h /usr/src/debug/dhcpcd/10.0.2-r0/compat/crypt/sha256.c", added "/usr/src/debug/dhcpcd/10.0.3-r0/compat/crypt_openssl/sha256.c /usr/src/debug/dhcpcd/10.0.3-r0/compat/crypt_openssl/hmac.h /usr/src/debug/dhcpcd/10.0.3-r0/compat/crypt_openssl/hmac.c /usr/src/debug/dhcpcd/10.0.3-r0/compat/crypt_openssl/sha256.h"
packages/core2-32-poky-linux/dhcpcd/dhcpcd-src: PV changed from "10.0.2" to "10.0.3"
packages/core2-32-poky-linux/dhcpcd/dhcpcd-src: PKGSIZE changed from 1110811 to 1094606 (-1%)
packages/core2-32-poky-linux/dhcpcd/dhcpcd-src: PKGV changed from 10.0.2 [default] to 10.0.3 [default]
packages/core2-32-poky-linux/dhcpcd/dhcpcd-staticdev: PV changed from "10.0.2" to "10.0.3"
packages/core2-32-poky-linux/dhcpcd/dhcpcd-staticdev: PKGV changed from 10.0.2 [default] to 10.0.3 [default]
packages/core2-32-poky-linux/dhcpcd/dhcpcd: PV changed from "10.0.2" to "10.0.3"
packages/core2-32-poky-linux/dhcpcd/dhcpcd: PKGSIZE changed from 481048 to 472712 (-2%)
packages/core2-32-poky-linux/dhcpcd/dhcpcd: RDEPENDS: added "libcrypto (['>= 3.1.3'])"
packages/core2-32-poky-linux/dhcpcd/dhcpcd: PKGV changed from 10.0.2 [default] to 10.0.3 [default]
packages/core2-32-poky-linux/dhcpcd: SRC_URI changed from "git://github.com/NetworkConfiguration/dhcpcd;protocol=https;branch=master file://0001-remove-INCLUDEDIR-to-prevent-build-issues.patch file://0001-20-resolv.conf-improve-the-sitation-of-working-with-.patch file://dhcpcd.service file://dhcpcd@.service file://0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch file://0001-privsep-fix-strlcpy-overflow-in-psp_ifname-239.patch" to "git://github.com/NetworkConfiguration/dhcpcd;protocol=https;branch=master file://0001-remove-INCLUDEDIR-to-prevent-build-issues.patch file://0001-20-resolv.conf-improve-the-sitation-of-working-with-.patch file://dhcpcd.service file://dhcpcd@.service file://0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch"
packages/core2-32-poky-linux/dhcpcd: PV changed from "10.0.2" to "10.0.3"
packages/core2-32-poky-linux/dhcpcd: PKGV changed from 10.0.2 [default] to 10.0.3 [default]

--===============1665634299540488590==--

