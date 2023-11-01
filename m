Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66BAEC07D59
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 14:25:13 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.8649.1698848703575674379
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 07:25:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=dpHY/2g4;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Yn7HfI7i;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.29, mailfrom: 0101018b8b460aeb-b4c4a521-b17c-4947-9838-a0bcea410b6b-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1698848705;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=81NEzQtR1m3L0GF1831+l86Fv6p1vD4B7wDheuL2Dj8=;
	b=dpHY/2g4fSaAl4aWKEAOmKCGcxqCvqyAWuJUQao+mNSmCuAVwyymGJHOFa1C6Ye6
	AsVCr3ODmj2K6uWvIIu62m83+aY0ElRWSft0JzbpnQxWtoPPV0ZDq9CyadCVJ9AUDPy
	JQTg9+dAqXvAKiqggo4FR+UmpeLoUEmm6WRykrMg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1698848705;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=81NEzQtR1m3L0GF1831+l86Fv6p1vD4B7wDheuL2Dj8=;
	b=Yn7HfI7ikDsaO7GzVn3PcoczFKL/DYs2nt5WhlpUTrCUS6hEB8QjDGJv6W9zVc2U
	lhzkPrcreSQY2jKOXPng4W2mNTedCo+KaAnbppGscr4kmx23fspjz3SOTDCPidRNREd
	WsVF6/GZkVe9onnW/RIT48mVG0MIU62ckLNwaDIw=
Content-Type: multipart/mixed; boundary="===============7640228787793806055=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libnotify: upgrading to 0.8.3 SUCCEEDED
Message-ID: <0101018b8b460aeb-b4c4a521-b17c-4947-9838-a0bcea410b6b-000000@us-west-2.amazonses.com>
Date: Wed, 1 Nov 2023 14:25:05 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 14:25:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189996

--===============7640228787793806055==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libnotify* to *0.8.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libnotify-upgrade-0.8.2-0.8.3.patch
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
From 45da8a0e89ecd99bd6d71a1a031ba31b7798d192 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Nov 2023 12:13:50 +0000
Subject: [PATCH] libnotify: upgrade 0.8.2 -> 0.8.3

---
 .../libnotify/{libnotify_0.8.2.bb => libnotify_0.8.3.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/libnotify/{libnotify_0.8.2.bb => libnotify_0.8.3.bb} (93%)

diff --git a/meta/recipes-gnome/libnotify/libnotify_0.8.2.bb b/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb
similarity index 93%
rename from meta/recipes-gnome/libnotify/libnotify_0.8.2.bb
rename to meta/recipes-gnome/libnotify/libnotify_0.8.3.bb
index 6888c33d14..02c48c21df 100644
--- a/meta/recipes-gnome/libnotify/libnotify_0.8.2.bb
+++ b/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb
@@ -21,7 +21,7 @@ inherit gnomebase gi-docgen features_check gobject-introspection
 # depends on gtk+3 if tests are enabled
 ANY_OF_DISTRO_FEATURES = "${@bb.utils.contains('PACKAGECONFIG', 'tests', '${GTK3DISTROFEATURES}', '', d)}"
 
-SRC_URI[archive.sha256sum] = "c5f4ed3d1f86e5b118c76415aacb861873ed3e6f0c6b3181b828cf584fc5c616"
+SRC_URI[archive.sha256sum] = "ee8f3ef946156ad3406fdf45feedbdcd932dbd211ab4f16f75eba4f36fb2f6c0"
 
 EXTRA_OEMESON = "-Dman=false"
 
-- 
2.39.2


--===============7640228787793806055==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libnotify-upgrade-0.8.2-0.8.3.patch"

RnJvbSA0NWRhOGEwZTg5ZWNkOTliZDZkNzFhMWEwMzFiYTMxYjc3OThkMTkyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBOb3YgMjAyMyAxMjoxMzo1MCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
Ym5vdGlmeTogdXBncmFkZSAwLjguMiAtPiAwLjguMwoKLS0tCiAuLi4vbGlibm90aWZ5L3tsaWJu
b3RpZnlfMC44LjIuYmIgPT4gbGlibm90aWZ5XzAuOC4zLmJifSAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtZ25vbWUvbGlibm90aWZ5L3tsaWJub3RpZnlfMC44LjIuYmIgPT4gbGlibm90aWZ5XzAu
OC4zLmJifSAoOTMlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1nbm9tZS9saWJub3RpZnkv
bGlibm90aWZ5XzAuOC4yLmJiIGIvbWV0YS9yZWNpcGVzLWdub21lL2xpYm5vdGlmeS9saWJub3Rp
ZnlfMC44LjMuYmIKc2ltaWxhcml0eSBpbmRleCA5MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVz
LWdub21lL2xpYm5vdGlmeS9saWJub3RpZnlfMC44LjIuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBl
cy1nbm9tZS9saWJub3RpZnkvbGlibm90aWZ5XzAuOC4zLmJiCmluZGV4IDY4ODhjMzNkMTQuLjAy
YzQ4YzIxZGYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1nbm9tZS9saWJub3RpZnkvbGlibm90
aWZ5XzAuOC4yLmJiCisrKyBiL21ldGEvcmVjaXBlcy1nbm9tZS9saWJub3RpZnkvbGlibm90aWZ5
XzAuOC4zLmJiCkBAIC0yMSw3ICsyMSw3IEBAIGluaGVyaXQgZ25vbWViYXNlIGdpLWRvY2dlbiBm
ZWF0dXJlc19jaGVjayBnb2JqZWN0LWludHJvc3BlY3Rpb24KICMgZGVwZW5kcyBvbiBndGsrMyBp
ZiB0ZXN0cyBhcmUgZW5hYmxlZAogQU5ZX09GX0RJU1RST19GRUFUVVJFUyA9ICIke0BiYi51dGls
cy5jb250YWlucygnUEFDS0FHRUNPTkZJRycsICd0ZXN0cycsICcke0dUSzNESVNUUk9GRUFUVVJF
U30nLCAnJywgZCl9IgogCi1TUkNfVVJJW2FyY2hpdmUuc2hhMjU2c3VtXSA9ICJjNWY0ZWQzZDFm
ODZlNWIxMThjNzY0MTVhYWNiODYxODczZWQzZTZmMGM2YjMxODFiODI4Y2Y1ODRmYzVjNjE2Igor
U1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0gPSAiZWU4ZjNlZjk0NjE1NmFkMzQwNmZkZjQ1ZmVl
ZGJkY2Q5MzJkYmQyMTFhYjRmMTZmNzVlYmE0ZjM2ZmIyZjZjMCIKIAogRVhUUkFfT0VNRVNPTiA9
ICItRG1hbj1mYWxzZSIKIAotLSAKMi4zOS4yCgo=

--===============7640228787793806055==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libnotify: SRC_URI changed from "https://download.gnome.org/sources//libnotify/0.8/libnotify-0.8.2.tar.xz;name=archive" to "https://download.gnome.org/sources//libnotify/0.8/libnotify-0.8.3.tar.xz;name=archive"
packages/core2-64-poky-linux/libnotify: PKGV changed from 0.8.2 [default] to 0.8.3 [default]
packages/core2-64-poky-linux/libnotify: PV changed from "0.8.2" to "0.8.3"
packages/core2-64-poky-linux/libnotify/libnotify-dbg: PKGV changed from 0.8.2 [default] to 0.8.3 [default]
packages/core2-64-poky-linux/libnotify/libnotify-dbg: PKGSIZE changed from 146752 to 146944 (+0%)
packages/core2-64-poky-linux/libnotify/libnotify-dbg: PV changed from "0.8.2" to "0.8.3"
packages/core2-64-poky-linux/libnotify/libnotify-dev: PKGV changed from 0.8.2 [default] to 0.8.3 [default]
packages/core2-64-poky-linux/libnotify/libnotify-dev: PV changed from "0.8.2" to "0.8.3"
packages/core2-64-poky-linux/libnotify/libnotify-doc: PKGV changed from 0.8.2 [default] to 0.8.3 [default]
packages/core2-64-poky-linux/libnotify/libnotify-doc: PV changed from "0.8.2" to "0.8.3"
packages/core2-64-poky-linux/libnotify/libnotify-locale: PKGV changed from 0.8.2 [default] to 0.8.3 [default]
packages/core2-64-poky-linux/libnotify/libnotify-locale: PV changed from "0.8.2" to "0.8.3"
packages/core2-64-poky-linux/libnotify/libnotify-src: PKGV changed from 0.8.2 [default] to 0.8.3 [default]
packages/core2-64-poky-linux/libnotify/libnotify-src: PKGSIZE changed from 125695 to 125478 (-0%)
packages/core2-64-poky-linux/libnotify/libnotify-src: PV changed from "0.8.2" to "0.8.3"
packages/core2-64-poky-linux/libnotify/libnotify-staticdev: PKGV changed from 0.8.2 [default] to 0.8.3 [default]
packages/core2-64-poky-linux/libnotify/libnotify-staticdev: PV changed from "0.8.2" to "0.8.3"
packages/core2-64-poky-linux/libnotify/libnotify: PKGV changed from 0.8.2 [default] to 0.8.3 [default]
packages/core2-64-poky-linux/libnotify/libnotify: PV changed from "0.8.2" to "0.8.3"

--===============7640228787793806055==--

