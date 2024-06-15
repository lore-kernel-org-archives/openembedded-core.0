Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8029C52D1D
	for <webhook@archiver.kernel.org>; Sat, 15 Jun 2024 18:23:31 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.18371.1718475799150365592
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jun 2024 11:23:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=G9KeuCWP;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=EGTeC1iu;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101901d23b7c8-d2cd8b65-8fc4-466b-ab46-f6d56aa7eba5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1718475798;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=xm9mFbwl7glqQczAMnl9afQbOC8qDu9Mtk45NLlbxYY=;
	b=G9KeuCWPdr9GploxNwZYk8yqJMR1av+FJuj8hBsDyU8K/LB05biL++SDeZ1zf+Xl
	GiPqSKDntPW3vCDA61JxwSS+8m7X5At6O/9u8QtwSVxveehBJIJRnB3BB0ZlsY80r4W
	LRAe9iyU2M/t3GaKtag8HFXfpLKAqQZSux8IrcMk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1718475798;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=xm9mFbwl7glqQczAMnl9afQbOC8qDu9Mtk45NLlbxYY=;
	b=EGTeC1iu1kBsplqtrvjKOwaXnn2xV047AMluopBI4YAoheFhQ8nF6UGysv+BS6kI
	d7ytoX8TcuuszhQgmgqtr4acHLCo62kKyGLhrZZcRIXjDudZ3tIfboRtBu4QmxflIbl
	rNrx6nGzInhd999z8ljQSMs8RW/W9d8Fp9DZSYXc=
Content-Type: multipart/mixed; boundary="===============1923976061064168772=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] git: upgrading to 2.45.2 SUCCEEDED
Message-ID: <010101901d23b7c8-d2cd8b65-8fc4-466b-ab46-f6d56aa7eba5-000000@us-west-2.amazonses.com>
Date: Sat, 15 Jun 2024 18:23:18 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.06.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jun 2024 18:23:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200685

--===============1923976061064168772==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *git* to *2.45.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-git-upgrade-2.45.1-2.45.2.patch
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
From c58609c68f4d0fc7f8c4eb42ddeb7145daac12a8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Jun 2024 07:51:21 +0000
Subject: [PATCH] git: upgrade 2.45.1 -> 2.45.2

---
 ...-do-not-force-RHEL-7-specific-build-.patch |  3 +--
 meta/recipes-devtools/git/git/fixsort.patch   | 22 ++++++++++++-------
 .../git/{git_2.45.1.bb => git_2.45.2.bb}      |  2 +-
 3 files changed, 16 insertions(+), 11 deletions(-)
 rename meta/recipes-devtools/git/{git_2.45.1.bb => git_2.45.2.bb} (98%)

diff --git a/meta/recipes-devtools/git/git/0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch b/meta/recipes-devtools/git/git/0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch
index fc803c73c7..a2e7af8d11 100644
--- a/meta/recipes-devtools/git/git/0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch
+++ b/meta/recipes-devtools/git/git/0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch
@@ -1,4 +1,4 @@
-From c0c5241abdc113acbe6bcd960686cea414bce357 Mon Sep 17 00:00:00 2001
+From 857ec6ee02accdfefe734a6a7d38947eee526e58 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Mon, 7 Feb 2022 10:13:15 +0100
 Subject: [PATCH] config.mak.uname: do not force RHEL-7 specific build settings
@@ -12,7 +12,6 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
 Rebased for 2.45.1.
 
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
-
 ---
  config.mak.uname | 4 ----
  1 file changed, 4 deletions(-)
diff --git a/meta/recipes-devtools/git/git/fixsort.patch b/meta/recipes-devtools/git/git/fixsort.patch
index 07a487e8ca..c32745938b 100644
--- a/meta/recipes-devtools/git/git/fixsort.patch
+++ b/meta/recipes-devtools/git/git/fixsort.patch
@@ -1,13 +1,16 @@
-[PATCH] generate-configlist.sh: Fix determinism issue
+From 9afc8a28ab61d74e5029c799e4ab2c330fce7ea3 Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Wed, 17 Feb 2021 17:57:13 +0000
+Subject: [PATCH] [PATCH] generate-configlist.sh: Fix determinism issue
 
-Currently git binaries are not entirely reproducible, at least partly 
+Currently git binaries are not entirely reproducible, at least partly
 due to config-list.h differing in order depending on the system's
 locale settings. Under different locales, the entries:
 
 "sendemail.identity",
 "sendemail.<identity>.*",
 
-would differ in order for example and this leads to differences in 
+would differ in order for example and this leads to differences in
 the debug symbols for the binaries.
 
 This can be fixed by specifying the C locale for the sort in the
@@ -15,12 +18,15 @@ shell script generating the header.
 
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 Upstream-Status: Submitted [https://public-inbox.org/git/f029a942dd3d50d85e60bd37d8e454524987842f.camel@linuxfoundation.org/T/#u]
+---
+ generate-configlist.sh | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
-Index: git-2.30.0/generate-configlist.sh
-===================================================================
---- git-2.30.0.orig/generate-configlist.sh
-+++ git-2.30.0/generate-configlist.sh
-@@ -9,7 +9,7 @@ static const char *config_name_list[] =
+diff --git a/generate-configlist.sh b/generate-configlist.sh
+index 8692fe5..e67ccac 100755
+--- a/generate-configlist.sh
++++ b/generate-configlist.sh
+@@ -9,7 +9,7 @@ static const char *config_name_list[] = {
  EOF
  	grep -h '^[a-zA-Z].*\..*::$' Documentation/*config.txt Documentation/config/*.txt |
  	sed '/deprecated/d; s/::$//; s/,  */\n/g' |
diff --git a/meta/recipes-devtools/git/git_2.45.1.bb b/meta/recipes-devtools/git/git_2.45.2.bb
similarity index 98%
rename from meta/recipes-devtools/git/git_2.45.1.bb
rename to meta/recipes-devtools/git/git_2.45.2.bb
index d1b3e6ad40..6393c976e6 100644
--- a/meta/recipes-devtools/git/git_2.45.1.bb
+++ b/meta/recipes-devtools/git/git_2.45.2.bb
@@ -164,4 +164,4 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
-SRC_URI[tarball.sha256sum] = "10acb581993061e616be9c5674469335922025a666318e0748cb8306079fef24"
+SRC_URI[tarball.sha256sum] = "98b26090ed667099a3691b93698d1e213e1ded73d36a2fde7e9125fce28ba234"
-- 
2.44.0


--===============1923976061064168772==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-git-upgrade-2.45.1-2.45.2.patch"

RnJvbSBjNTg2MDljNjhmNGQwZmM3ZjhjNGViNDJkZGViNzE0NWRhYWMxMmE4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgSnVuIDIwMjQgMDc6NTE6MjEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
aXQ6IHVwZ3JhZGUgMi40NS4xIC0+IDIuNDUuMgoKLS0tCiAuLi4tZG8tbm90LWZvcmNlLVJIRUwt
Ny1zcGVjaWZpYy1idWlsZC0ucGF0Y2ggfCAgMyArLS0KIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9n
aXQvZ2l0L2ZpeHNvcnQucGF0Y2ggICB8IDIyICsrKysrKysrKysrKy0tLS0tLS0KIC4uLi9naXQv
e2dpdF8yLjQ1LjEuYmIgPT4gZ2l0XzIuNDUuMi5iYn0gICAgICB8ICAyICstCiAzIGZpbGVzIGNo
YW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1kZXZ0b29scy9naXQve2dpdF8yLjQ1LjEuYmIgPT4gZ2l0XzIuNDUuMi5iYn0gKDk4JSkK
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2l0L2dpdC8wMDAxLWNvbmZpZy5t
YWsudW5hbWUtZG8tbm90LWZvcmNlLVJIRUwtNy1zcGVjaWZpYy1idWlsZC0ucGF0Y2ggYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvZ2l0L2dpdC8wMDAxLWNvbmZpZy5tYWsudW5hbWUtZG8tbm90LWZv
cmNlLVJIRUwtNy1zcGVjaWZpYy1idWlsZC0ucGF0Y2gKaW5kZXggZmM4MDNjNzNjNy4uYTJlN2Fm
OGQxMSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dpdC9naXQvMDAwMS1jb25m
aWcubWFrLnVuYW1lLWRvLW5vdC1mb3JjZS1SSEVMLTctc3BlY2lmaWMtYnVpbGQtLnBhdGNoCisr
KyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9naXQvZ2l0LzAwMDEtY29uZmlnLm1hay51bmFtZS1k
by1ub3QtZm9yY2UtUkhFTC03LXNwZWNpZmljLWJ1aWxkLS5wYXRjaApAQCAtMSw0ICsxLDQgQEAK
LUZyb20gYzBjNTI0MWFiZGMxMTNhY2JlNmJjZDk2MDY4NmNlYTQxNGJjZTM1NyBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKK0Zyb20gODU3ZWM2ZWUwMmFjY2RmZWZlNzM0YTZhN2QzODk0N2VlZTUy
NmU1OCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxh
bGV4QGxpbnV0cm9uaXguZGU+CiBEYXRlOiBNb24sIDcgRmViIDIwMjIgMTA6MTM6MTUgKzAxMDAK
IFN1YmplY3Q6IFtQQVRDSF0gY29uZmlnLm1hay51bmFtZTogZG8gbm90IGZvcmNlIFJIRUwtNyBz
cGVjaWZpYyBidWlsZCBzZXR0aW5ncwpAQCAtMTIsNyArMTIsNiBAQCBTaWduZWQtb2ZmLWJ5OiBB
bGV4YW5kZXIgS2FuYXZpbiA8YWxleEBsaW51dHJvbml4LmRlPgogUmViYXNlZCBmb3IgMi40NS4x
LgogCiBTaWduZWQtb2ZmLWJ5OiBSb2JlcnQgWWFuZyA8bGllemhpLnlhbmdAd2luZHJpdmVyLmNv
bT4KLQogLS0tCiAgY29uZmlnLm1hay51bmFtZSB8IDQgLS0tLQogIDEgZmlsZSBjaGFuZ2VkLCA0
IGRlbGV0aW9ucygtKQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dpdC9naXQv
Zml4c29ydC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9naXQvZ2l0L2ZpeHNvcnQucGF0
Y2gKaW5kZXggMDdhNDg3ZThjYS4uYzMyNzQ1OTM4YiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2dpdC9naXQvZml4c29ydC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvZ2l0L2dpdC9maXhzb3J0LnBhdGNoCkBAIC0xLDEzICsxLDE2IEBACi1bUEFUQ0hdIGdlbmVy
YXRlLWNvbmZpZ2xpc3Quc2g6IEZpeCBkZXRlcm1pbmlzbSBpc3N1ZQorRnJvbSA5YWZjOGEyOGFi
NjFkNzRlNTAyOWM3OTllNGFiMmMzMzBmY2U3ZWEzIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQor
RnJvbTogUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+
CitEYXRlOiBXZWQsIDE3IEZlYiAyMDIxIDE3OjU3OjEzICswMDAwCitTdWJqZWN0OiBbUEFUQ0hd
IFtQQVRDSF0gZ2VuZXJhdGUtY29uZmlnbGlzdC5zaDogRml4IGRldGVybWluaXNtIGlzc3VlCiAK
LUN1cnJlbnRseSBnaXQgYmluYXJpZXMgYXJlIG5vdCBlbnRpcmVseSByZXByb2R1Y2libGUsIGF0
IGxlYXN0IHBhcnRseSAKK0N1cnJlbnRseSBnaXQgYmluYXJpZXMgYXJlIG5vdCBlbnRpcmVseSBy
ZXByb2R1Y2libGUsIGF0IGxlYXN0IHBhcnRseQogZHVlIHRvIGNvbmZpZy1saXN0LmggZGlmZmVy
aW5nIGluIG9yZGVyIGRlcGVuZGluZyBvbiB0aGUgc3lzdGVtJ3MKIGxvY2FsZSBzZXR0aW5ncy4g
VW5kZXIgZGlmZmVyZW50IGxvY2FsZXMsIHRoZSBlbnRyaWVzOgogCiAic2VuZGVtYWlsLmlkZW50
aXR5IiwKICJzZW5kZW1haWwuPGlkZW50aXR5Pi4qIiwKIAotd291bGQgZGlmZmVyIGluIG9yZGVy
IGZvciBleGFtcGxlIGFuZCB0aGlzIGxlYWRzIHRvIGRpZmZlcmVuY2VzIGluIAord291bGQgZGlm
ZmVyIGluIG9yZGVyIGZvciBleGFtcGxlIGFuZCB0aGlzIGxlYWRzIHRvIGRpZmZlcmVuY2VzIGlu
CiB0aGUgZGVidWcgc3ltYm9scyBmb3IgdGhlIGJpbmFyaWVzLgogCiBUaGlzIGNhbiBiZSBmaXhl
ZCBieSBzcGVjaWZ5aW5nIHRoZSBDIGxvY2FsZSBmb3IgdGhlIHNvcnQgaW4gdGhlCkBAIC0xNSwx
MiArMTgsMTUgQEAgc2hlbGwgc2NyaXB0IGdlbmVyYXRpbmcgdGhlIGhlYWRlci4KIAogU2lnbmVk
LW9mZi1ieTogUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5v
cmc+CiBVcHN0cmVhbS1TdGF0dXM6IFN1Ym1pdHRlZCBbaHR0cHM6Ly9wdWJsaWMtaW5ib3gub3Jn
L2dpdC9mMDI5YTk0MmRkM2Q1MGQ4NWU2MGJkMzdkOGU0NTQ1MjQ5ODc4NDJmLmNhbWVsQGxpbnV4
Zm91bmRhdGlvbi5vcmcvVC8jdV0KKy0tLQorIGdlbmVyYXRlLWNvbmZpZ2xpc3Quc2ggfCAyICst
CisgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKLUluZGV4
OiBnaXQtMi4zMC4wL2dlbmVyYXRlLWNvbmZpZ2xpc3Quc2gKLT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KLS0tLSBnaXQt
Mi4zMC4wLm9yaWcvZ2VuZXJhdGUtY29uZmlnbGlzdC5zaAotKysrIGdpdC0yLjMwLjAvZ2VuZXJh
dGUtY29uZmlnbGlzdC5zaAotQEAgLTksNyArOSw3IEBAIHN0YXRpYyBjb25zdCBjaGFyICpjb25m
aWdfbmFtZV9saXN0W10gPQorZGlmZiAtLWdpdCBhL2dlbmVyYXRlLWNvbmZpZ2xpc3Quc2ggYi9n
ZW5lcmF0ZS1jb25maWdsaXN0LnNoCitpbmRleCA4NjkyZmU1Li5lNjdjY2FjIDEwMDc1NQorLS0t
IGEvZ2VuZXJhdGUtY29uZmlnbGlzdC5zaAorKysrIGIvZ2VuZXJhdGUtY29uZmlnbGlzdC5zaAor
QEAgLTksNyArOSw3IEBAIHN0YXRpYyBjb25zdCBjaGFyICpjb25maWdfbmFtZV9saXN0W10gPSB7
CiAgRU9GCiAgCWdyZXAgLWggJ15bYS16QS1aXS4qXC4uKjo6JCcgRG9jdW1lbnRhdGlvbi8qY29u
ZmlnLnR4dCBEb2N1bWVudGF0aW9uL2NvbmZpZy8qLnR4dCB8CiAgCXNlZCAnL2RlcHJlY2F0ZWQv
ZDsgcy86OiQvLzsgcy8sICAqL1xuL2cnIHwKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9naXQvZ2l0XzIuNDUuMS5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9naXQvZ2l0XzIu
NDUuMi5iYgpzaW1pbGFyaXR5IGluZGV4IDk4JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2
dG9vbHMvZ2l0L2dpdF8yLjQ1LjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9n
aXQvZ2l0XzIuNDUuMi5iYgppbmRleCBkMWIzZTZhZDQwLi42MzkzYzk3NmU2IDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2l0L2dpdF8yLjQ1LjEuYmIKKysrIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2dpdC9naXRfMi40NS4yLmJiCkBAIC0xNjQsNCArMTY0LDQgQEAgRVhUUkFf
T0VDT05GICs9ICJhY19jdl9zbnByaW50Zl9yZXR1cm5zX2JvZ3VzPW5vIFwKICAgICAgICAgICAg
ICAgICAgIgogRVhUUkFfT0VNQUtFICs9ICJOT19HRVRURVhUPTEiCiAKLVNSQ19VUklbdGFyYmFs
bC5zaGEyNTZzdW1dID0gIjEwYWNiNTgxOTkzMDYxZTYxNmJlOWM1Njc0NDY5MzM1OTIyMDI1YTY2
NjMxOGUwNzQ4Y2I4MzA2MDc5ZmVmMjQiCitTUkNfVVJJW3RhcmJhbGwuc2hhMjU2c3VtXSA9ICI5
OGIyNjA5MGVkNjY3MDk5YTM2OTFiOTM2OThkMWUyMTNlMWRlZDczZDM2YTJmZGU3ZTkxMjVmY2Uy
OGJhMjM0IgotLSAKMi40NC4wCgo=

--===============1923976061064168772==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/git/git-bash-completion: PV changed from "2.45.1" to "2.45.2"
packages/core2-64-poky-linux/git/git-bash-completion: PKGV changed from 2.45.1 [default] to 2.45.2 [default]
packages/core2-64-poky-linux/git/git-dbg: PKGSIZE changed from 91515808 to 91471024 (-0%)
packages/core2-64-poky-linux/git/git-dbg: PV changed from "2.45.1" to "2.45.2"
packages/core2-64-poky-linux/git/git-dbg: PKGV changed from 2.45.1 [default] to 2.45.2 [default]
packages/core2-64-poky-linux/git/git-dev: PV changed from "2.45.1" to "2.45.2"
packages/core2-64-poky-linux/git/git-dev: PKGV changed from 2.45.1 [default] to 2.45.2 [default]
packages/core2-64-poky-linux/git/git-doc: PV changed from "2.45.1" to "2.45.2"
packages/core2-64-poky-linux/git/git-doc: PKGV changed from 2.45.1 [default] to 2.45.2 [default]
packages/core2-64-poky-linux/git/git-locale: PV changed from "2.45.1" to "2.45.2"
packages/core2-64-poky-linux/git/git-locale: PKGV changed from 2.45.1 [default] to 2.45.2 [default]
packages/core2-64-poky-linux/git/git-perltools: PV changed from "2.45.1" to "2.45.2"
packages/core2-64-poky-linux/git/git-perltools: PKGV changed from 2.45.1 [default] to 2.45.2 [default]
packages/core2-64-poky-linux/git/git-src: PKGSIZE changed from 9576655 to 9570574 (-0%)
packages/core2-64-poky-linux/git/git-src: PV changed from "2.45.1" to "2.45.2"
packages/core2-64-poky-linux/git/git-src: PKGV changed from 2.45.1 [default] to 2.45.2 [default]
packages/core2-64-poky-linux/git/git-staticdev: PV changed from "2.45.1" to "2.45.2"
packages/core2-64-poky-linux/git/git-staticdev: PKGV changed from 2.45.1 [default] to 2.45.2 [default]
packages/core2-64-poky-linux/git/git-tk: PV changed from "2.45.1" to "2.45.2"
packages/core2-64-poky-linux/git/git-tk: PKGV changed from 2.45.1 [default] to 2.45.2 [default]
packages/core2-64-poky-linux/git/git: PKGSIZE changed from 24243983 to 24216847 (-0%)
packages/core2-64-poky-linux/git/git: PV changed from "2.45.1" to "2.45.2"
packages/core2-64-poky-linux/git/git: PKGV changed from 2.45.1 [default] to 2.45.2 [default]
packages/core2-64-poky-linux/git/gitweb: PV changed from "2.45.1" to "2.45.2"
packages/core2-64-poky-linux/git/gitweb: PKGV changed from 2.45.1 [default] to 2.45.2 [default]
packages/core2-64-poky-linux/git: PV changed from "2.45.1" to "2.45.2"
packages/core2-64-poky-linux/git: SRC_URI changed from "https://cdn.kernel.org/pub/software/scm/git/git-2.45.1.tar.gz;name=tarball file://fixsort.patch file://0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch" to "https://cdn.kernel.org/pub/software/scm/git/git-2.45.2.tar.gz;name=tarball file://fixsort.patch file://0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch"
packages/core2-64-poky-linux/git: PKGV changed from 2.45.1 [default] to 2.45.2 [default]

--===============1923976061064168772==--

