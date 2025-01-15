Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3F3FC02189
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 10:26:07 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.17791.1736936761019841674
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jan 2025 02:26:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=BPDCStHP;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=qGmyi7gv;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010194697fbdff-3da0d1a4-f75f-4a06-8bab-3ec9ed7f4c66-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1736936767;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=qU3ZtX0SbDoQWxBwnda43+rN2PKkk/XIuodLepDmopg=;
	b=BPDCStHPC/VtD8mrddR+3GTCQY7JYdUBLotAFe6lkGhzBw0MBbssgnMl6JwyNkrx
	0azDWB+AlrC/1TWnJwhrm/q/Wf07VvkK4W0Yvxcu+ZsNmmPSw3xQYWN//kkQwYUy3LU
	IyWn+H/oU8ypY1c3fRDID4gw9cmo4oajMv4l6oxo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1736936767;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=qU3ZtX0SbDoQWxBwnda43+rN2PKkk/XIuodLepDmopg=;
	b=qGmyi7gv86+vwLQYhmI0T3ckINRQbTBGuelvyyJedouav0tl/XzRpcqHNoustr5k
	v1nnXsMHO8/m31g4DnosBp0cxvtKxVQ7fdwUrB6Ap76PssY6SmWTwsbBb9BZP43R4L1
	bB8rQZ4/i/TdKiQFUE5PyvxH6P9+6Y3NS7ucbHNA=
Content-Type: multipart/mixed; boundary="===============7460022694892583528=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] git: upgrading to 2.48.1 SUCCEEDED
Message-ID: <01010194697fbdff-3da0d1a4-f75f-4a06-8bab-3ec9ed7f4c66-000000@us-west-2.amazonses.com>
Date: Wed, 15 Jan 2025 10:26:06 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.01.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 10:26:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209835

--===============7460022694892583528==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *git* to *2.48.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-git-upgrade-2.47.1-2.48.1.patch
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
From 77dd84beb1db62b4b0846c7d5f072d913b7dacab Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Jan 2025 06:47:16 +0000
Subject: [PATCH] git: upgrade 2.47.1 -> 2.48.1

---
 ...mak.uname-do-not-force-RHEL-7-specific-build-.patch |  4 ++--
 meta/recipes-devtools/git/git/fixsort.patch            | 10 +++++-----
 .../git/{git_2.47.1.bb => git_2.48.1.bb}               |  2 +-
 3 files changed, 8 insertions(+), 8 deletions(-)
 rename meta/recipes-devtools/git/{git_2.47.1.bb => git_2.48.1.bb} (98%)

diff --git a/meta/recipes-devtools/git/git/0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch b/meta/recipes-devtools/git/git/0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch
index e5135928f0..486ba76a76 100644
--- a/meta/recipes-devtools/git/git/0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch
+++ b/meta/recipes-devtools/git/git/0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch
@@ -1,4 +1,4 @@
-From 348811a6f818408a31551d0830dcfe31c55d06a8 Mon Sep 17 00:00:00 2001
+From f1ce347b2029dc6ede429f2543b8cdccfc01b742 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Mon, 7 Feb 2022 10:13:15 +0100
 Subject: [PATCH] config.mak.uname: do not force RHEL-7 specific build settings
@@ -17,7 +17,7 @@ Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
  1 file changed, 4 deletions(-)
 
 diff --git a/config.mak.uname b/config.mak.uname
-index d511216..3144228 100644
+index b12d4e1..b5b8d82 100644
 --- a/config.mak.uname
 +++ b/config.mak.uname
 @@ -63,10 +63,6 @@ ifeq ($(uname_S),Linux)
diff --git a/meta/recipes-devtools/git/git/fixsort.patch b/meta/recipes-devtools/git/git/fixsort.patch
index d9a3672f1d..4ad671731a 100644
--- a/meta/recipes-devtools/git/git/fixsort.patch
+++ b/meta/recipes-devtools/git/git/fixsort.patch
@@ -1,7 +1,7 @@
-From 83ae059943d3efd824978a759bcfd894ce5085d4 Mon Sep 17 00:00:00 2001
+From 6232873303944b041324653aea7f479c03889401 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 17 Feb 2021 17:57:13 +0000
-Subject: [PATCH] [PATCH] generate-configlist.sh: Fix determinism issue
+Subject: [PATCH] generate-configlist.sh: Fix determinism issue
 
 Currently git binaries are not entirely reproducible, at least partly
 due to config-list.h differing in order depending on the system's
@@ -23,12 +23,12 @@ Upstream-Status: Submitted [https://public-inbox.org/git/f029a942dd3d50d85e60bd3
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/generate-configlist.sh b/generate-configlist.sh
-index 8692fe5..e67ccac 100755
+index 5794226..6b0b939 100755
 --- a/generate-configlist.sh
 +++ b/generate-configlist.sh
-@@ -9,7 +9,7 @@ static const char *config_name_list[] = {
+@@ -15,7 +15,7 @@ static const char *config_name_list[] = {
  EOF
- 	grep -h '^[a-zA-Z].*\..*::$' Documentation/*config.txt Documentation/config/*.txt |
+ 	grep -h '^[a-zA-Z].*\..*::$' "$SOURCE_DIR"/Documentation/*config.txt "$SOURCE_DIR"/Documentation/config/*.txt |
  	sed '/deprecated/d; s/::$//; s/,  */\n/g' |
 -	sort |
 +	LC_ALL=C sort |
diff --git a/meta/recipes-devtools/git/git_2.47.1.bb b/meta/recipes-devtools/git/git_2.48.1.bb
similarity index 98%
rename from meta/recipes-devtools/git/git_2.47.1.bb
rename to meta/recipes-devtools/git/git_2.48.1.bb
index 8b5bfecd6a..e0df23eb47 100644
--- a/meta/recipes-devtools/git/git_2.47.1.bb
+++ b/meta/recipes-devtools/git/git_2.48.1.bb
@@ -164,4 +164,4 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
-SRC_URI[tarball.sha256sum] = "f4c4e98667800585d218dfdf415eb72f73baa7abcac4569e2ce497970f8d6665"
+SRC_URI[tarball.sha256sum] = "51b4d03b1e311ba673591210f94f24a4c5781453e1eb188822e3d9cdc04c2212"
-- 
2.44.1


--===============7460022694892583528==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-git-upgrade-2.47.1-2.48.1.patch"

RnJvbSA3N2RkODRiZWIxZGI2MmI0YjA4NDZjN2Q1ZjA3MmQ5MTNiN2RhY2FiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgSmFuIDIwMjUgMDY6NDc6MTYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
aXQ6IHVwZ3JhZGUgMi40Ny4xIC0+IDIuNDguMQoKLS0tCiAuLi5tYWsudW5hbWUtZG8tbm90LWZv
cmNlLVJIRUwtNy1zcGVjaWZpYy1idWlsZC0ucGF0Y2ggfCAgNCArKy0tCiBtZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvZ2l0L2dpdC9maXhzb3J0LnBhdGNoICAgICAgICAgICAgfCAxMCArKysrKy0tLS0t
CiAuLi4vZ2l0L3tnaXRfMi40Ny4xLmJiID0+IGdpdF8yLjQ4LjEuYmJ9ICAgICAgICAgICAgICAg
fCAgMiArLQogMyBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dpdC97Z2l0XzIuNDcuMS5iYiA9PiBnaXRf
Mi40OC4xLmJifSAoOTglKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9naXQv
Z2l0LzAwMDEtY29uZmlnLm1hay51bmFtZS1kby1ub3QtZm9yY2UtUkhFTC03LXNwZWNpZmljLWJ1
aWxkLS5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9naXQvZ2l0LzAwMDEtY29uZmlnLm1h
ay51bmFtZS1kby1ub3QtZm9yY2UtUkhFTC03LXNwZWNpZmljLWJ1aWxkLS5wYXRjaAppbmRleCBl
NTEzNTkyOGYwLi40ODZiYTc2YTc2IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
Z2l0L2dpdC8wMDAxLWNvbmZpZy5tYWsudW5hbWUtZG8tbm90LWZvcmNlLVJIRUwtNy1zcGVjaWZp
Yy1idWlsZC0ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dpdC9naXQvMDAwMS1j
b25maWcubWFrLnVuYW1lLWRvLW5vdC1mb3JjZS1SSEVMLTctc3BlY2lmaWMtYnVpbGQtLnBhdGNo
CkBAIC0xLDQgKzEsNCBAQAotRnJvbSAzNDg4MTFhNmY4MTg0MDhhMzE1NTFkMDgzMGRjZmUzMWM1
NWQwNmE4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBmMWNlMzQ3YjIwMjlkYzZlZGU0
MjlmMjU0M2I4Y2RjY2ZjMDFiNzQyIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxl
eGFuZGVyIEthbmF2aW4gPGFsZXhAbGludXRyb25peC5kZT4KIERhdGU6IE1vbiwgNyBGZWIgMjAy
MiAxMDoxMzoxNSArMDEwMAogU3ViamVjdDogW1BBVENIXSBjb25maWcubWFrLnVuYW1lOiBkbyBu
b3QgZm9yY2UgUkhFTC03IHNwZWNpZmljIGJ1aWxkIHNldHRpbmdzCkBAIC0xNyw3ICsxNyw3IEBA
IFNpZ25lZC1vZmYtYnk6IFJvYmVydCBZYW5nIDxsaWV6aGkueWFuZ0B3aW5kcml2ZXIuY29tPgog
IDEgZmlsZSBjaGFuZ2VkLCA0IGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvY29uZmlnLm1h
ay51bmFtZSBiL2NvbmZpZy5tYWsudW5hbWUKLWluZGV4IGQ1MTEyMTYuLjMxNDQyMjggMTAwNjQ0
CitpbmRleCBiMTJkNGUxLi5iNWI4ZDgyIDEwMDY0NAogLS0tIGEvY29uZmlnLm1hay51bmFtZQog
KysrIGIvY29uZmlnLm1hay51bmFtZQogQEAgLTYzLDEwICs2Myw2IEBAIGlmZXEgKCQodW5hbWVf
UyksTGludXgpCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2l0L2dpdC9maXhz
b3J0LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dpdC9naXQvZml4c29ydC5wYXRjaApp
bmRleCBkOWEzNjcyZjFkLi40YWQ2NzE3MzFhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvZ2l0L2dpdC9maXhzb3J0LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9n
aXQvZ2l0L2ZpeHNvcnQucGF0Y2gKQEAgLTEsNyArMSw3IEBACi1Gcm9tIDgzYWUwNTk5NDNkM2Vm
ZDgyNDk3OGE3NTliY2ZkODk0Y2U1MDg1ZDQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9t
IDYyMzI4NzMzMDM5NDRiMDQxMzI0NjUzYWVhN2Y0NzljMDM4ODk0MDEgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCiBGcm9tOiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGludXhmb3Vu
ZGF0aW9uLm9yZz4KIERhdGU6IFdlZCwgMTcgRmViIDIwMjEgMTc6NTc6MTMgKzAwMDAKLVN1Ympl
Y3Q6IFtQQVRDSF0gW1BBVENIXSBnZW5lcmF0ZS1jb25maWdsaXN0LnNoOiBGaXggZGV0ZXJtaW5p
c20gaXNzdWUKK1N1YmplY3Q6IFtQQVRDSF0gZ2VuZXJhdGUtY29uZmlnbGlzdC5zaDogRml4IGRl
dGVybWluaXNtIGlzc3VlCiAKIEN1cnJlbnRseSBnaXQgYmluYXJpZXMgYXJlIG5vdCBlbnRpcmVs
eSByZXByb2R1Y2libGUsIGF0IGxlYXN0IHBhcnRseQogZHVlIHRvIGNvbmZpZy1saXN0LmggZGlm
ZmVyaW5nIGluIG9yZGVyIGRlcGVuZGluZyBvbiB0aGUgc3lzdGVtJ3MKQEAgLTIzLDEyICsyMywx
MiBAQCBVcHN0cmVhbS1TdGF0dXM6IFN1Ym1pdHRlZCBbaHR0cHM6Ly9wdWJsaWMtaW5ib3gub3Jn
L2dpdC9mMDI5YTk0MmRkM2Q1MGQ4NWU2MGJkMwogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvZ2VuZXJhdGUtY29uZmlnbGlzdC5z
aCBiL2dlbmVyYXRlLWNvbmZpZ2xpc3Quc2gKLWluZGV4IDg2OTJmZTUuLmU2N2NjYWMgMTAwNzU1
CitpbmRleCA1Nzk0MjI2Li42YjBiOTM5IDEwMDc1NQogLS0tIGEvZ2VuZXJhdGUtY29uZmlnbGlz
dC5zaAogKysrIGIvZ2VuZXJhdGUtY29uZmlnbGlzdC5zaAotQEAgLTksNyArOSw3IEBAIHN0YXRp
YyBjb25zdCBjaGFyICpjb25maWdfbmFtZV9saXN0W10gPSB7CitAQCAtMTUsNyArMTUsNyBAQCBz
dGF0aWMgY29uc3QgY2hhciAqY29uZmlnX25hbWVfbGlzdFtdID0gewogIEVPRgotIAlncmVwIC1o
ICdeW2EtekEtWl0uKlwuLio6OiQnIERvY3VtZW50YXRpb24vKmNvbmZpZy50eHQgRG9jdW1lbnRh
dGlvbi9jb25maWcvKi50eHQgfAorIAlncmVwIC1oICdeW2EtekEtWl0uKlwuLio6OiQnICIkU09V
UkNFX0RJUiIvRG9jdW1lbnRhdGlvbi8qY29uZmlnLnR4dCAiJFNPVVJDRV9ESVIiL0RvY3VtZW50
YXRpb24vY29uZmlnLyoudHh0IHwKICAJc2VkICcvZGVwcmVjYXRlZC9kOyBzLzo6JC8vOyBzLywg
ICovXG4vZycgfAogLQlzb3J0IHwKICsJTENfQUxMPUMgc29ydCB8CmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvZ2l0L2dpdF8yLjQ3LjEuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvZ2l0L2dpdF8yLjQ4LjEuYmIKc2ltaWxhcml0eSBpbmRleCA5OCUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLWRldnRvb2xzL2dpdC9naXRfMi40Ny4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvZ2l0L2dpdF8yLjQ4LjEuYmIKaW5kZXggOGI1YmZlY2Q2YS4uZTBkZjIzZWI0
NyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dpdC9naXRfMi40Ny4xLmJiCisr
KyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9naXQvZ2l0XzIuNDguMS5iYgpAQCAtMTY0LDQgKzE2
NCw0IEBAIEVYVFJBX09FQ09ORiArPSAiYWNfY3Zfc25wcmludGZfcmV0dXJuc19ib2d1cz1ubyBc
CiAgICAgICAgICAgICAgICAgICIKIEVYVFJBX09FTUFLRSArPSAiTk9fR0VUVEVYVD0xIgogCi1T
UkNfVVJJW3RhcmJhbGwuc2hhMjU2c3VtXSA9ICJmNGM0ZTk4NjY3ODAwNTg1ZDIxOGRmZGY0MTVl
YjcyZjczYmFhN2FiY2FjNDU2OWUyY2U0OTc5NzBmOGQ2NjY1IgorU1JDX1VSSVt0YXJiYWxsLnNo
YTI1NnN1bV0gPSAiNTFiNGQwM2IxZTMxMWJhNjczNTkxMjEwZjk0ZjI0YTRjNTc4MTQ1M2UxZWIx
ODg4MjJlM2Q5Y2RjMDRjMjIxMiIKLS0gCjIuNDQuMQoK

--===============7460022694892583528==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/git/git-bash-completion: PKGSIZE changed from 93627 to 93639 (+0%)
packages/core2-64-poky-linux/git/git-bash-completion: PKGV changed from 2.47.1 [default] to 2.48.1 [default]
packages/core2-64-poky-linux/git/git-bash-completion: PV changed from "2.47.1" to "2.48.1"
packages/core2-64-poky-linux/git/git-dbg: PKGSIZE changed from 92200088 to 92900664 (+1%)
packages/core2-64-poky-linux/git/git-dbg: PKGV changed from 2.47.1 [default] to 2.48.1 [default]
packages/core2-64-poky-linux/git/git-dbg: PV changed from "2.47.1" to "2.48.1"
packages/core2-64-poky-linux/git/git-dev: PKGV changed from 2.47.1 [default] to 2.48.1 [default]
packages/core2-64-poky-linux/git/git-dev: PV changed from "2.47.1" to "2.48.1"
packages/core2-64-poky-linux/git/git-doc: PKGV changed from 2.47.1 [default] to 2.48.1 [default]
packages/core2-64-poky-linux/git/git-doc: PV changed from "2.47.1" to "2.48.1"
packages/core2-64-poky-linux/git/git-locale: PKGV changed from 2.47.1 [default] to 2.48.1 [default]
packages/core2-64-poky-linux/git/git-locale: PV changed from "2.47.1" to "2.48.1"
packages/core2-64-poky-linux/git/git-perltools: PKGSIZE changed from 273650 to 273656 (+0%)
packages/core2-64-poky-linux/git/git-perltools: PKGV changed from 2.47.1 [default] to 2.48.1 [default]
packages/core2-64-poky-linux/git/git-perltools: PV changed from "2.47.1" to "2.48.1"
packages/core2-64-poky-linux/git/git-src: PKGSIZE changed from 9841580 to 9931301 (+1%)
packages/core2-64-poky-linux/git/git-src: PKGV changed from 2.47.1 [default] to 2.48.1 [default]
packages/core2-64-poky-linux/git/git-src: FILELIST: directory renamed /usr/src/debug/git/2.47.1/negotiator -> /usr/src/debug/git/2.48.1/negotiator, directory renamed /usr/src/debug/git/2.47.1/sha1dc -> /usr/src/debug/git/2.48.1/sha1dc, directory renamed /usr/src/debug/git/2.47.1/builtin -> /usr/src/debug/git/2.48.1/builtin, directory renamed /usr/src/debug/git/2.47.1/sha256/block -> /usr/src/debug/git/2.48.1/sha256/block, directory renamed /usr/src/debug/git/2.47.1/xdiff -> /usr/src/debug/git/2.48.1/xdiff, directory renamed /usr/src/debug/git/2.47.1/ewah -> /usr/src/debug/git/2.48.1/ewah, directory renamed /usr/src/debug/git/2.47.1 -> /usr/src/debug/git/2.48.1, directory renamed /usr/src/debug/git/2.47.1/refs -> /usr/src/debug/git/2.48.1/refs, directory renamed /usr/src/debug/git/2.47.1/compat/linux -> /usr/src/debug/git/2.48.1/compat/linux, directory renamed /usr/src/debug/git/2.47.1/compat -> /usr/src/debug/git/2.48.1/compat, directory renamed /usr/src/debug/git/2.47.1/trace2 -> /u
 sr/src/debug/git/2.48.1/trace2, removed "/usr/src/debug/git/2.47.1/reftable/pq.c /usr/src/debug/git/2.47.1/reftable/pq.h /usr/src/debug/git/2.47.1/reftable/reftable-merged.h /usr/src/debug/git/2.47.1/reftable/reftable-stack.h /usr/src/debug/git/2.47.1/reftable/reftable-error.h /usr/src/debug/git/2.47.1/reftable/merged.h /usr/src/debug/git/2.47.1/reftable/record.h /usr/src/debug/git/2.47.1/reftable/merged.c /usr/src/debug/git/2.47.1/reftable/record.c /usr/src/debug/git/2.47.1/reftable/reftable-iterator.h /usr/src/debug/git/2.47.1/reftable/iter.h /usr/src/debug/git/2.47.1/reftable/tree.h /usr/src/debug/git/2.47.1/reftable/tree.c /usr/src/debug/git/2.47.1/reftable/iter.c /usr/src/debug/git/2.47.1/reftable/block.c /usr/src/debug/git/2.47.1/reftable/error.c /usr/src/debug/git/2.47.1/reftable/stack.c /usr/src/debug/git/2.47.1/reftable/reftable-record.h /usr/src/debug/git/2.47.1/reftable/block.h /usr/src/debug/git/2.47.1/reftable/publicbasics.c /usr/src/debug/git/2.47.1/reftable/stack.h /u
 sr/src/debug/git/2.47.1/reftable/reader.c /usr/src/debug/git/2.47.1/reftable/writer.c /usr/src/debug/git/2.47.1/reftable/reader.h /usr/src/debug/git/2.47.1/reftable/writer.h /usr/src/debug/git/2.47.1/reftable/basics.h /usr/src/debug/git/2.47.1/reftable/basics.c /usr/src/debug/git/2.47.1/reftable/reftable-blocksource.h /usr/src/debug/git/2.47.1/reftable/reftable-reader.h /usr/src/debug/git/2.47.1/reftable/reftable-writer.h /usr/src/debug/git/2.47.1/reftable/blocksource.c /usr/src/debug/git/2.47.1/reftable/system.h", added "/usr/src/debug/git/2.48.1/reftable/pq.c /usr/src/debug/git/2.48.1/reftable/pq.h /usr/src/debug/git/2.48.1/reftable/reftable-merged.h /usr/src/debug/git/2.48.1/reftable/reftable-stack.h /usr/src/debug/git/2.48.1/reftable/reftable-error.h /usr/src/debug/git/2.48.1/reftable/merged.h /usr/src/debug/git/2.48.1/reftable/record.h /usr/src/debug/git/2.48.1/reftable/merged.c /usr/src/debug/git/2.48.1/reftable/record.c /usr/src/debug/git/2.48.1/reftable/reftable-iterator.h /
 usr/src/debug/git/2.48.1/reftable/iter.h /usr/src/debug/git/2.48.1/reftable/tree.h /usr/src/debug/git/2.48.1/reftable/tree.c /usr/src/debug/git/2.48.1/reftable/iter.c /usr/src/debug/git/2.48.1/reftable/block.c /usr/src/debug/git/2.48.1/reftable/error.c /usr/src/debug/git/2.48.1/reftable/reftable-basics.h /usr/src/debug/git/2.48.1/reftable/stack.c /usr/src/debug/git/2.48.1/reftable/reftable-record.h /usr/src/debug/git/2.48.1/reftable/block.h /usr/src/debug/git/2.48.1/reftable/stack.h /usr/src/debug/git/2.48.1/reftable/reader.c /usr/src/debug/git/2.48.1/reftable/writer.c /usr/src/debug/git/2.48.1/reftable/reader.h /usr/src/debug/git/2.48.1/reftable/writer.h /usr/src/debug/git/2.48.1/reftable/basics.h /usr/src/debug/git/2.48.1/reftable/basics.c /usr/src/debug/git/2.48.1/reftable/reftable-blocksource.h /usr/src/debug/git/2.48.1/reftable/reftable-reader.h /usr/src/debug/git/2.48.1/reftable/reftable-writer.h /usr/src/debug/git/2.48.1/reftable/system.c /usr/src/debug/git/2.48.1/reftable/bl
 ocksource.c /usr/src/debug/git/2.48.1/reftable/system.h"
packages/core2-64-poky-linux/git/git-src: PV changed from "2.47.1" to "2.48.1"
packages/core2-64-poky-linux/git/git-staticdev: PKGV changed from 2.47.1 [default] to 2.48.1 [default]
packages/core2-64-poky-linux/git/git-staticdev: PV changed from "2.47.1" to "2.48.1"
packages/core2-64-poky-linux/git/git-tk: PKGV changed from 2.47.1 [default] to 2.48.1 [default]
packages/core2-64-poky-linux/git/git-tk: PV changed from "2.47.1" to "2.48.1"
packages/core2-64-poky-linux/git/git: PKGSIZE changed from 24453653 to 24658717 (+1%)
packages/core2-64-poky-linux/git/git: PKGV changed from 2.47.1 [default] to 2.48.1 [default]
packages/core2-64-poky-linux/git/git: PV changed from "2.47.1" to "2.48.1"
packages/core2-64-poky-linux/git/gitweb: PKGSIZE changed from 313838 to 313956 (+0%)
packages/core2-64-poky-linux/git/gitweb: PKGV changed from 2.47.1 [default] to 2.48.1 [default]
packages/core2-64-poky-linux/git/gitweb: PV changed from "2.47.1" to "2.48.1"
packages/core2-64-poky-linux/git: SRC_URI changed from "https://cdn.kernel.org/pub/software/scm/git/git-2.47.1.tar.gz;name=tarball file://fixsort.patch file://0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch" to "https://cdn.kernel.org/pub/software/scm/git/git-2.48.1.tar.gz;name=tarball file://fixsort.patch file://0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch"
packages/core2-64-poky-linux/git: PKGV changed from 2.47.1 [default] to 2.48.1 [default]
packages/core2-64-poky-linux/git: PV changed from "2.47.1" to "2.48.1"
Changes to packages/core2-64-poky-linux/git (sysroot):
  /usr/share/git-core/templates/branches was removed

--===============7460022694892583528==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/git (sysroot):
  /usr/share/git-core/templates/branches was removed

--===============7460022694892583528==--

