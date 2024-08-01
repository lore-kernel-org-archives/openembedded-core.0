Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A071C5474D
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 18:27:13 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.75500.1722536830652338405
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Aug 2024 11:27:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=j1K9sMzx;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=CwA6hiVI;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101910f322484-c9708cf4-65fc-416a-b5dc-207394b18d56-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1722536830;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=LXJq6vp5gIUvchAVA885/8twFHeu1/KiG+kHDxYWrvM=;
	b=j1K9sMzxRw0TT4XdEPDenamrUfrDJ2BRj+hjmu0mLlXhPRUpLBWgbecW4y0euW/a
	8QDoB+HEQDYY1T28ob0dNE2qi8k/pSh3/kX8XiwoZrA2upkaVjhL5UKn27zpvgtihuq
	E6BlV11h4xx+h0Jyh/F1PjHd0O5M+IVHDW1m32sM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1722536830;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=LXJq6vp5gIUvchAVA885/8twFHeu1/KiG+kHDxYWrvM=;
	b=CwA6hiVITU7NMCKAzZbjoq6sNevS5iKtm+dS5FD7TuVNklnZkcaxLjJMkSD0GFIi
	Uy1uCBwjOmsV03maTMGPViln/p/qehNxeXsOSGDznS5c4h6H9Kd8YPKoT7kh58pgo/j
	g0/dP+w+Qp8InB4VOaKkxYtX8PoQNXHV4ZBlWd40=
Content-Type: multipart/mixed; boundary="===============4294749600670006518=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] asciidoc: upgrading to 10.2.1 SUCCEEDED
Message-ID: <010101910f322484-c9708cf4-65fc-416a-b5dc-207394b18d56-000000@us-west-2.amazonses.com>
Date: Thu, 1 Aug 2024 18:27:10 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 18:27:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202824

--===============4294749600670006518==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *asciidoc* to *10.2.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-asciidoc-upgrade-10.2.0-10.2.1.patch
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
From 56d4976aef3250e7d559aa334e9c1e4c73f7d0d8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Aug 2024 11:36:34 +0000
Subject: [PATCH] asciidoc: upgrade 10.2.0 -> 10.2.1

---
 .../asciidoc/{asciidoc_10.2.0.bb => asciidoc_10.2.1.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/asciidoc/{asciidoc_10.2.0.bb => asciidoc_10.2.1.bb} (94%)

diff --git a/meta/recipes-extended/asciidoc/asciidoc_10.2.0.bb b/meta/recipes-extended/asciidoc/asciidoc_10.2.1.bb
similarity index 94%
rename from meta/recipes-extended/asciidoc/asciidoc_10.2.0.bb
rename to meta/recipes-extended/asciidoc/asciidoc_10.2.1.bb
index e112eb513d..1065acdb8e 100644
--- a/meta/recipes-extended/asciidoc/asciidoc_10.2.0.bb
+++ b/meta/recipes-extended/asciidoc/asciidoc_10.2.1.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=aaee33adce0fc7cc40fee23f82f7f101 \
                     "
 
 SRC_URI = "git://github.com/asciidoc/asciidoc-py;protocol=https;branch=main"
-SRCREV = "545b79b8d7dae70d12bf0657359bdd36de0c5c26"
+SRCREV = "21e33efe96ba9a51d99d1150691dae750afd6ed1"
 
 DEPENDS = "libxml2-native libxslt-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
 
-- 
2.44.0


--===============4294749600670006518==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/asciidoc (sysroot):
  /usr/lib/python3.12/site-packages/asciidoc-10.2.0.dist-info moved to /usr/lib/python3.12/site-packages/asciidoc-10.2.1.dist-info

--===============4294749600670006518==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-asciidoc-upgrade-10.2.0-10.2.1.patch"

RnJvbSA1NmQ0OTc2YWVmMzI1MGU3ZDU1OWFhMzM0ZTljMWU0YzczZjdkMGQ4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBBdWcgMjAyNCAxMTozNjozNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGFz
Y2lpZG9jOiB1cGdyYWRlIDEwLjIuMCAtPiAxMC4yLjEKCi0tLQogLi4uL2FzY2lpZG9jL3thc2Np
aWRvY18xMC4yLjAuYmIgPT4gYXNjaWlkb2NfMTAuMi4xLmJifSAgICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWV4dGVuZGVkL2FzY2lpZG9jL3thc2NpaWRvY18xMC4yLjAuYmIgPT4gYXNjaWlkb2Nf
MTAuMi4xLmJifSAoOTQlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9hc2Np
aWRvYy9hc2NpaWRvY18xMC4yLjAuYmIgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvYXNjaWlkb2Mv
YXNjaWlkb2NfMTAuMi4xLmJiCnNpbWlsYXJpdHkgaW5kZXggOTQlCnJlbmFtZSBmcm9tIG1ldGEv
cmVjaXBlcy1leHRlbmRlZC9hc2NpaWRvYy9hc2NpaWRvY18xMC4yLjAuYmIKcmVuYW1lIHRvIG1l
dGEvcmVjaXBlcy1leHRlbmRlZC9hc2NpaWRvYy9hc2NpaWRvY18xMC4yLjEuYmIKaW5kZXggZTEx
MmViNTEzZC4uMTA2NWFjZGI4ZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2Fz
Y2lpZG9jL2FzY2lpZG9jXzEwLjIuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvYXNj
aWlkb2MvYXNjaWlkb2NfMTAuMi4xLmJiCkBAIC0xMCw3ICsxMCw3IEBAIExJQ19GSUxFU19DSEtT
VU0gPSAiZmlsZTovL0NPUFlSSUdIVDttZDU9YWFlZTMzYWRjZTBmYzdjYzQwZmVlMjNmODJmN2Yx
MDEgXAogICAgICAgICAgICAgICAgICAgICAiCiAKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNv
bS9hc2NpaWRvYy9hc2NpaWRvYy1weTtwcm90b2NvbD1odHRwczticmFuY2g9bWFpbiIKLVNSQ1JF
ViA9ICI1NDViNzliOGQ3ZGFlNzBkMTJiZjA2NTczNTliZGQzNmRlMGM1YzI2IgorU1JDUkVWID0g
IjIxZTMzZWZlOTZiYTlhNTFkOTlkMTE1MDY5MWRhZTc1MGFmZDZlZDEiCiAKIERFUEVORFMgPSAi
bGlieG1sMi1uYXRpdmUgbGlieHNsdC1uYXRpdmUgZG9jYm9vay14bWwtZHRkNC1uYXRpdmUgZG9j
Ym9vay14c2wtc3R5bGVzaGVldHMtbmF0aXZlIgogCi0tIAoyLjQ0LjAKCg==

--===============4294749600670006518==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/asciidoc/asciidoc-dbg: PV changed from "10.2.0" to "10.2.1"
packages/core2-64-poky-linux/asciidoc/asciidoc-dbg: PKGV changed from 10.2.0 [default] to 10.2.1 [default]
packages/core2-64-poky-linux/asciidoc/asciidoc-dev: PV changed from "10.2.0" to "10.2.1"
packages/core2-64-poky-linux/asciidoc/asciidoc-dev: PKGV changed from 10.2.0 [default] to 10.2.1 [default]
packages/core2-64-poky-linux/asciidoc/asciidoc-doc: PV changed from "10.2.0" to "10.2.1"
packages/core2-64-poky-linux/asciidoc/asciidoc-doc: PKGV changed from 10.2.0 [default] to 10.2.1 [default]
packages/core2-64-poky-linux/asciidoc/asciidoc-locale: PV changed from "10.2.0" to "10.2.1"
packages/core2-64-poky-linux/asciidoc/asciidoc-locale: PKGV changed from 10.2.0 [default] to 10.2.1 [default]
packages/core2-64-poky-linux/asciidoc/asciidoc-src: PV changed from "10.2.0" to "10.2.1"
packages/core2-64-poky-linux/asciidoc/asciidoc-src: PKGV changed from 10.2.0 [default] to 10.2.1 [default]
packages/core2-64-poky-linux/asciidoc/asciidoc-staticdev: PV changed from "10.2.0" to "10.2.1"
packages/core2-64-poky-linux/asciidoc/asciidoc-staticdev: PKGV changed from 10.2.0 [default] to 10.2.1 [default]
packages/core2-64-poky-linux/asciidoc/asciidoc: PV changed from "10.2.0" to "10.2.1"
packages/core2-64-poky-linux/asciidoc/asciidoc: PKGSIZE changed from 1271883 to 1271886 (+0%)
packages/core2-64-poky-linux/asciidoc/asciidoc: PKGV changed from 10.2.0 [default] to 10.2.1 [default]
packages/core2-64-poky-linux/asciidoc: PV changed from "10.2.0" to "10.2.1"
packages/core2-64-poky-linux/asciidoc: PKGV changed from 10.2.0 [default] to 10.2.1 [default]
Changes to packages/core2-64-poky-linux/asciidoc (sysroot):
  /usr/lib/python3.12/site-packages/asciidoc-10.2.0.dist-info moved to /usr/lib/python3.12/site-packages/asciidoc-10.2.1.dist-info

--===============4294749600670006518==--

