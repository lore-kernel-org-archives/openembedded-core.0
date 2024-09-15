Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F9CBC3ABA5
	for <webhook@archiver.kernel.org>; Sun, 15 Sep 2024 14:34:22 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.115390.1726410840508509944
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Sep 2024 07:34:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=h6eitnAg;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=QrOwURQ5;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010191f61ad6dd-56114058-775a-4f8a-856b-ad775447fc44-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1726410839;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=aDgN0p+s3LaNqIauMkQD2JSlLmjzbSkGlp9SbHXTg6s=;
	b=h6eitnAgV3xZFgtmL0LtvDjfZM7NBdJZGjKjFLw8quSQ/BAOMwxHYF9M8lkY980Z
	dkAJyyNyaJZ0PpADjkxMcxubr11iawC2DQwUCMC834G2ajufp7ayhooPeXm1/laS/u/
	2R9VYXKmTStf2bct6f6+JAuOrJ0qYujC/WeeEIPo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1726410839;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=aDgN0p+s3LaNqIauMkQD2JSlLmjzbSkGlp9SbHXTg6s=;
	b=QrOwURQ5SRh90WcqcTAc7+gAasxtCg+5UuJjYCUA7YCldEhBKI5PY58LtI90Y9ko
	GLU7ZfjNQa5z4U/tExuvnQrtwwfsOgsw0VE//p0W2BXDzRSnr604EBXf/Tz+8Oxhz2j
	eZiIaZ/qTrOZZ/IG25hDQzq+OMpr5pM7rXT1G1UY=
Content-Type: multipart/mixed; boundary="===============0315294648271856508=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] git: upgrading to 2.46.1 SUCCEEDED
Message-ID: <01010191f61ad6dd-56114058-775a-4f8a-856b-ad775447fc44-000000@us-west-2.amazonses.com>
Date: Sun, 15 Sep 2024 14:33:59 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.09.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Sep 2024 14:34:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204518

--===============0315294648271856508==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *git* to *2.46.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-git-upgrade-2.46.0-2.46.1.patch
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
From 40b49883d4dd5566e0c6d2d77bb954679400670d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Sep 2024 08:00:02 +0000
Subject: [PATCH] git: upgrade 2.46.0 -> 2.46.1

---
 ...config.mak.uname-do-not-force-RHEL-7-specific-build-.patch | 2 +-
 meta/recipes-devtools/git/git/fixsort.patch                   | 4 ++--
 meta/recipes-devtools/git/{git_2.46.0.bb => git_2.46.1.bb}    | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/git/{git_2.46.0.bb => git_2.46.1.bb} (98%)

diff --git a/meta/recipes-devtools/git/git/0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch b/meta/recipes-devtools/git/git/0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch
index 3f0bc4aaa1..5d3044404b 100644
--- a/meta/recipes-devtools/git/git/0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch
+++ b/meta/recipes-devtools/git/git/0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch
@@ -1,4 +1,4 @@
-From be83596773e42b88ba1104f044a139f35d90a7f5 Mon Sep 17 00:00:00 2001
+From b157b5a4cecc7f7057dc55321881327c585c3cc3 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Mon, 7 Feb 2022 10:13:15 +0100
 Subject: [PATCH] config.mak.uname: do not force RHEL-7 specific build settings
diff --git a/meta/recipes-devtools/git/git/fixsort.patch b/meta/recipes-devtools/git/git/fixsort.patch
index d9a3672f1d..53c3f38318 100644
--- a/meta/recipes-devtools/git/git/fixsort.patch
+++ b/meta/recipes-devtools/git/git/fixsort.patch
@@ -1,7 +1,7 @@
-From 83ae059943d3efd824978a759bcfd894ce5085d4 Mon Sep 17 00:00:00 2001
+From 9b7a726d63dc0eb08b075a82c9fc841e787a5c76 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 17 Feb 2021 17:57:13 +0000
-Subject: [PATCH] [PATCH] generate-configlist.sh: Fix determinism issue
+Subject: [PATCH] generate-configlist.sh: Fix determinism issue
 
 Currently git binaries are not entirely reproducible, at least partly
 due to config-list.h differing in order depending on the system's
diff --git a/meta/recipes-devtools/git/git_2.46.0.bb b/meta/recipes-devtools/git/git_2.46.1.bb
similarity index 98%
rename from meta/recipes-devtools/git/git_2.46.0.bb
rename to meta/recipes-devtools/git/git_2.46.1.bb
index 7c6beb5b5c..d301c474f2 100644
--- a/meta/recipes-devtools/git/git_2.46.0.bb
+++ b/meta/recipes-devtools/git/git_2.46.1.bb
@@ -164,4 +164,4 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
-SRC_URI[tarball.sha256sum] = "b138811e16838f669a2516e40f09d50500e1c7fc541b5ab50ce84b98585e5230"
+SRC_URI[tarball.sha256sum] = "b0a4d1ad50e820edd84c0d1b609c29349d4ae2681ed458914ea759aafcd4bf21"
-- 
2.44.0


--===============0315294648271856508==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/git/git-bash-completion: PKGV changed from 2.46.0 [default] to 2.46.1 [default]
packages/core2-64-poky-linux/git/git-bash-completion: PV changed from "2.46.0" to "2.46.1"
packages/core2-64-poky-linux/git/git-dbg: PKGV changed from 2.46.0 [default] to 2.46.1 [default]
packages/core2-64-poky-linux/git/git-dbg: PV changed from "2.46.0" to "2.46.1"
packages/core2-64-poky-linux/git/git-dbg: PKGSIZE changed from 90969592 to 90986152 (+0%)
packages/core2-64-poky-linux/git/git-dev: PKGV changed from 2.46.0 [default] to 2.46.1 [default]
packages/core2-64-poky-linux/git/git-dev: PV changed from "2.46.0" to "2.46.1"
packages/core2-64-poky-linux/git/git-doc: PKGV changed from 2.46.0 [default] to 2.46.1 [default]
packages/core2-64-poky-linux/git/git-doc: PV changed from "2.46.0" to "2.46.1"
packages/core2-64-poky-linux/git/git-locale: PKGV changed from 2.46.0 [default] to 2.46.1 [default]
packages/core2-64-poky-linux/git/git-locale: PV changed from "2.46.0" to "2.46.1"
packages/core2-64-poky-linux/git/git-perltools: PKGV changed from 2.46.0 [default] to 2.46.1 [default]
packages/core2-64-poky-linux/git/git-perltools: PV changed from "2.46.0" to "2.46.1"
packages/core2-64-poky-linux/git/git-src: PKGV changed from 2.46.0 [default] to 2.46.1 [default]
packages/core2-64-poky-linux/git/git-src: PV changed from "2.46.0" to "2.46.1"
packages/core2-64-poky-linux/git/git-src: PKGSIZE changed from 9743853 to 9750878 (+0%)
packages/core2-64-poky-linux/git/git-staticdev: PKGV changed from 2.46.0 [default] to 2.46.1 [default]
packages/core2-64-poky-linux/git/git-staticdev: PV changed from "2.46.0" to "2.46.1"
packages/core2-64-poky-linux/git/git-tk: PKGV changed from 2.46.0 [default] to 2.46.1 [default]
packages/core2-64-poky-linux/git/git-tk: PV changed from "2.46.0" to "2.46.1"
packages/core2-64-poky-linux/git/git: PKGV changed from 2.46.0 [default] to 2.46.1 [default]
packages/core2-64-poky-linux/git/git: PV changed from "2.46.0" to "2.46.1"
packages/core2-64-poky-linux/git/git: PKGSIZE changed from 24270896 to 24274992 (+0%)
packages/core2-64-poky-linux/git/gitweb: PKGV changed from 2.46.0 [default] to 2.46.1 [default]
packages/core2-64-poky-linux/git/gitweb: PV changed from "2.46.0" to "2.46.1"
packages/core2-64-poky-linux/git: PKGV changed from 2.46.0 [default] to 2.46.1 [default]
packages/core2-64-poky-linux/git: PV changed from "2.46.0" to "2.46.1"
packages/core2-64-poky-linux/git: SRC_URI changed from "https://cdn.kernel.org/pub/software/scm/git/git-2.46.0.tar.gz;name=tarball file://fixsort.patch file://0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch" to "https://cdn.kernel.org/pub/software/scm/git/git-2.46.1.tar.gz;name=tarball file://fixsort.patch file://0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch"

--===============0315294648271856508==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-git-upgrade-2.46.0-2.46.1.patch"

RnJvbSA0MGI0OTg4M2Q0ZGQ1NTY2ZTBjNmQyZDc3YmI5NTQ2Nzk0MDA2NzBkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgU2VwIDIwMjQgMDg6MDA6MDIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
aXQ6IHVwZ3JhZGUgMi40Ni4wIC0+IDIuNDYuMQoKLS0tCiAuLi5jb25maWcubWFrLnVuYW1lLWRv
LW5vdC1mb3JjZS1SSEVMLTctc3BlY2lmaWMtYnVpbGQtLnBhdGNoIHwgMiArLQogbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2dpdC9naXQvZml4c29ydC5wYXRjaCAgICAgICAgICAgICAgICAgICB8IDQg
KystLQogbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dpdC97Z2l0XzIuNDYuMC5iYiA9PiBnaXRfMi40
Ni4xLmJifSAgICB8IDIgKy0KIDMgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRl
bGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9naXQve2dpdF8yLjQ2LjAu
YmIgPT4gZ2l0XzIuNDYuMS5iYn0gKDk4JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvZ2l0L2dpdC8wMDAxLWNvbmZpZy5tYWsudW5hbWUtZG8tbm90LWZvcmNlLVJIRUwtNy1z
cGVjaWZpYy1idWlsZC0ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2l0L2dpdC8wMDAx
LWNvbmZpZy5tYWsudW5hbWUtZG8tbm90LWZvcmNlLVJIRUwtNy1zcGVjaWZpYy1idWlsZC0ucGF0
Y2gKaW5kZXggM2YwYmM0YWFhMS4uNWQzMDQ0NDA0YiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2dpdC9naXQvMDAwMS1jb25maWcubWFrLnVuYW1lLWRvLW5vdC1mb3JjZS1SSEVM
LTctc3BlY2lmaWMtYnVpbGQtLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9naXQv
Z2l0LzAwMDEtY29uZmlnLm1hay51bmFtZS1kby1ub3QtZm9yY2UtUkhFTC03LXNwZWNpZmljLWJ1
aWxkLS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gYmU4MzU5Njc3M2U0MmI4OGJhMTEwNGYw
NDRhMTM5ZjM1ZDkwYTdmNSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYjE1N2I1YTRj
ZWNjN2Y3MDU3ZGM1NTMyMTg4MTMyN2M1ODVjM2NjMyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
IEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4QGxpbnV0cm9uaXguZGU+CiBEYXRlOiBNb24s
IDcgRmViIDIwMjIgMTA6MTM6MTUgKzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0gY29uZmlnLm1hay51
bmFtZTogZG8gbm90IGZvcmNlIFJIRUwtNyBzcGVjaWZpYyBidWlsZCBzZXR0aW5ncwpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dpdC9naXQvZml4c29ydC5wYXRjaCBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9naXQvZ2l0L2ZpeHNvcnQucGF0Y2gKaW5kZXggZDlhMzY3MmYxZC4u
NTNjM2YzODMxOCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dpdC9naXQvZml4
c29ydC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2l0L2dpdC9maXhzb3J0LnBh
dGNoCkBAIC0xLDcgKzEsNyBAQAotRnJvbSA4M2FlMDU5OTQzZDNlZmQ4MjQ5NzhhNzU5YmNmZDg5
NGNlNTA4NWQ0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA5YjdhNzI2ZDYzZGMwZWIw
OGIwNzVhODJjOWZjODQxZTc4N2E1Yzc2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTog
UmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+CiBEYXRl
OiBXZWQsIDE3IEZlYiAyMDIxIDE3OjU3OjEzICswMDAwCi1TdWJqZWN0OiBbUEFUQ0hdIFtQQVRD
SF0gZ2VuZXJhdGUtY29uZmlnbGlzdC5zaDogRml4IGRldGVybWluaXNtIGlzc3VlCitTdWJqZWN0
OiBbUEFUQ0hdIGdlbmVyYXRlLWNvbmZpZ2xpc3Quc2g6IEZpeCBkZXRlcm1pbmlzbSBpc3N1ZQog
CiBDdXJyZW50bHkgZ2l0IGJpbmFyaWVzIGFyZSBub3QgZW50aXJlbHkgcmVwcm9kdWNpYmxlLCBh
dCBsZWFzdCBwYXJ0bHkKIGR1ZSB0byBjb25maWctbGlzdC5oIGRpZmZlcmluZyBpbiBvcmRlciBk
ZXBlbmRpbmcgb24gdGhlIHN5c3RlbSdzCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvZ2l0L2dpdF8yLjQ2LjAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2l0L2dpdF8yLjQ2
LjEuYmIKc2ltaWxhcml0eSBpbmRleCA5OCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2dpdC9naXRfMi40Ni4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2l0
L2dpdF8yLjQ2LjEuYmIKaW5kZXggN2M2YmViNWI1Yy4uZDMwMWM0NzRmMiAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL2dpdC9naXRfMi40Ni4wLmJiCisrKyBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9naXQvZ2l0XzIuNDYuMS5iYgpAQCAtMTY0LDQgKzE2NCw0IEBAIEVYVFJBX09F
Q09ORiArPSAiYWNfY3Zfc25wcmludGZfcmV0dXJuc19ib2d1cz1ubyBcCiAgICAgICAgICAgICAg
ICAgICIKIEVYVFJBX09FTUFLRSArPSAiTk9fR0VUVEVYVD0xIgogCi1TUkNfVVJJW3RhcmJhbGwu
c2hhMjU2c3VtXSA9ICJiMTM4ODExZTE2ODM4ZjY2OWEyNTE2ZTQwZjA5ZDUwNTAwZTFjN2ZjNTQx
YjVhYjUwY2U4NGI5ODU4NWU1MjMwIgorU1JDX1VSSVt0YXJiYWxsLnNoYTI1NnN1bV0gPSAiYjBh
NGQxYWQ1MGU4MjBlZGQ4NGMwZDFiNjA5YzI5MzQ5ZDRhZTI2ODFlZDQ1ODkxNGVhNzU5YWFmY2Q0
YmYyMSIKLS0gCjIuNDQuMAoK

--===============0315294648271856508==--

