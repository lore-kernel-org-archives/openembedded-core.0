Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BEF7C15500
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 14:25:15 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.8673.1698848706423047736
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 07:25:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=hsEphQHQ;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=hjIxrmH/;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.191, mailfrom: 0101018b8b460d5a-bb071fe6-c65a-443b-8608-33c986ea9232-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1698848706;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=Q7c5sVt6ima2vlCq18nFKo8sXnxJXMcJVJoDh9tFl8M=;
	b=hsEphQHQGOmzwNJmZ56uqDW0M06TAtP8RCzVp3z1w5FH3FSzCwwC0ge1hvUxNtEN
	wanfERlsq2x5UTaBu/aFaJqy0nU7ARAzYdtsAqFzLb6qS+DaycRClUKbNAcDpTMCxjX
	NwrOnRE4lEwXcMoER7hPpSKDoTKVFXXABMhAkOMA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1698848706;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=Q7c5sVt6ima2vlCq18nFKo8sXnxJXMcJVJoDh9tFl8M=;
	b=hjIxrmH/27LH1wtaNcg1VXRmjL3vBQPmaq/VShmZa84/pOoXlDUuTjNF+/UKzk/I
	jQ2QphVfbGyRqCACYQbd8mYELs8R9SaxHxSXm9IILZJxv5QAp25lyq2L9fJbS8VqYmO
	W5iZ4tGtIZHBX4212/TtO+btvyv62QDrMpBVY6Xg=
Content-Type: multipart/mixed; boundary="===============8767870113862066119=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] libxrandr: upgrading to 1.5.4 SUCCEEDED
Message-ID: <0101018b8b460d5a-bb071fe6-c65a-443b-8608-33c986ea9232-000000@us-west-2.amazonses.com>
Date: Wed, 1 Nov 2023 14:25:05 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 14:25:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190018

--===============8767870113862066119==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libxrandr* to *1.5.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libxrandr-upgrade-1.5.3-1.5.4.patch
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
From 532f9a8c1e31c4d73c9ab289a137cc68766dd767 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Nov 2023 13:23:57 +0000
Subject: [PATCH] libxrandr: upgrade 1.5.3 -> 1.5.4

---
 .../xorg-lib/{libxrandr_1.5.3.bb => libxrandr_1.5.4.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libxrandr_1.5.3.bb => libxrandr_1.5.4.bb} (87%)

diff --git a/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb b/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb
similarity index 87%
rename from meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb
rename to meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb
index 98572bd969..3e2825b916 100644
--- a/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb
+++ b/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb
@@ -19,4 +19,4 @@ XORG_PN = "libXrandr"
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[sha256sum] = "897639014a78e1497704d669c5dd5682d721931a4452c89a7ba62676064eb428"
+SRC_URI[sha256sum] = "1ad5b065375f4a85915aa60611cc6407c060492a214d7f9daf214be752c3b4d3"
-- 
2.39.2


--===============8767870113862066119==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libxrandr: PV changed from "1.5.3" to "1.5.4"
packages/core2-64-poky-linux/libxrandr: SRC_URI changed from "https://www.x.org/releases//individual/lib/libXrandr-1.5.3.tar.xz" to "https://www.x.org/releases//individual/lib/libXrandr-1.5.4.tar.xz"
packages/core2-64-poky-linux/libxrandr: PKGV changed from 1.5.3 [default] to 1.5.4 [default]
packages/core2-64-poky-linux/libxrandr/libxrandr-dbg: PV changed from "1.5.3" to "1.5.4"
packages/core2-64-poky-linux/libxrandr/libxrandr-dbg: PKGSIZE changed from 351216 to 351184 (-0%)
packages/core2-64-poky-linux/libxrandr/libxrandr-dbg: PKGV changed from 1.5.3 [default] to 1.5.4 [default]
packages/core2-64-poky-linux/libxrandr/libxrandr-dev: PV changed from "1.5.3" to "1.5.4"
packages/core2-64-poky-linux/libxrandr/libxrandr-dev: PKGV changed from 1.5.3 [default] to 1.5.4 [default]
packages/core2-64-poky-linux/libxrandr/libxrandr-doc: PV changed from "1.5.3" to "1.5.4"
packages/core2-64-poky-linux/libxrandr/libxrandr-doc: PKGV changed from 1.5.3 [default] to 1.5.4 [default]
packages/core2-64-poky-linux/libxrandr/libxrandr-locale: PV changed from "1.5.3" to "1.5.4"
packages/core2-64-poky-linux/libxrandr/libxrandr-locale: PKGV changed from 1.5.3 [default] to 1.5.4 [default]
packages/core2-64-poky-linux/libxrandr/libxrandr-src: PV changed from "1.5.3" to "1.5.4"
packages/core2-64-poky-linux/libxrandr/libxrandr-src: PKGSIZE changed from 116726 to 116731 (+0%)
packages/core2-64-poky-linux/libxrandr/libxrandr-src: PKGV changed from 1.5.3 [default] to 1.5.4 [default]
packages/core2-64-poky-linux/libxrandr/libxrandr-staticdev: PV changed from "1.5.3" to "1.5.4"
packages/core2-64-poky-linux/libxrandr/libxrandr-staticdev: PKGV changed from 1.5.3 [default] to 1.5.4 [default]
packages/core2-64-poky-linux/libxrandr/libxrandr: PV changed from "1.5.3" to "1.5.4"
packages/core2-64-poky-linux/libxrandr/libxrandr: PKGV changed from 1.5.3 [default] to 1.5.4 [default]

--===============8767870113862066119==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libxrandr-upgrade-1.5.3-1.5.4.patch"

RnJvbSA1MzJmOWE4YzFlMzFjNGQ3M2M5YWIyODlhMTM3Y2M2ODc2NmRkNzY3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBOb3YgMjAyMyAxMzoyMzo1NyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnhyYW5kcjogdXBncmFkZSAxLjUuMyAtPiAxLjUuNAoKLS0tCiAuLi4veG9yZy1saWIve2xpYnhy
YW5kcl8xLjUuMy5iYiA9PiBsaWJ4cmFuZHJfMS41LjQuYmJ9ICAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3MveG9yZy1saWIve2xpYnhyYW5kcl8xLjUuMy5iYiA9PiBsaWJ4cmFuZHJf
MS41LjQuYmJ9ICg4NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmct
bGliL2xpYnhyYW5kcl8xLjUuMy5iYiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxpYi9s
aWJ4cmFuZHJfMS41LjQuYmIKc2ltaWxhcml0eSBpbmRleCA4NyUKcmVuYW1lIGZyb20gbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL3hvcmctbGliL2xpYnhyYW5kcl8xLjUuMy5iYgpyZW5hbWUgdG8gbWV0
YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctbGliL2xpYnhyYW5kcl8xLjUuNC5iYgppbmRleCA5ODU3
MmJkOTY5Li4zZTI4MjViOTE2IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9y
Zy1saWIvbGlieHJhbmRyXzEuNS4zLmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3Jn
LWxpYi9saWJ4cmFuZHJfMS41LjQuYmIKQEAgLTE5LDQgKzE5LDQgQEAgWE9SR19QTiA9ICJsaWJY
cmFuZHIiCiAKIEJCQ0xBU1NFWFRFTkQgPSAibmF0aXZlIG5hdGl2ZXNkayIKIAotU1JDX1VSSVtz
aGEyNTZzdW1dID0gIjg5NzYzOTAxNGE3OGUxNDk3NzA0ZDY2OWM1ZGQ1NjgyZDcyMTkzMWE0NDUy
Yzg5YTdiYTYyNjc2MDY0ZWI0MjgiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMWFkNWIwNjUzNzVm
NGE4NTkxNWFhNjA2MTFjYzY0MDdjMDYwNDkyYTIxNGQ3ZjlkYWYyMTRiZTc1MmMzYjRkMyIKLS0g
CjIuMzkuMgoK

--===============8767870113862066119==--

