Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FAF1C3ABA5
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 12:43:36 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.18037.1743511387671847570
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 05:43:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=S4iIZxqP;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=MLblFLey;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010195f160c23b-1922ca95-5ef9-4e67-9faf-5a79bdabf7d6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1743511405;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=R50saAwWxokM96C5j4irvUuZRGcg710zydoKh3Puakc=;
	b=S4iIZxqP8uSGUoXNaCJ7kcyZb+u3sHUuBbCRpazw18MEQRrHcP6eFtas3Iz8gy57
	X41Wftg3IfzNSlOHDnqHYu6cdWjyyJ/OVQpe6Kr2VL9tdOhfhJfn+FQyZEosgMafkZK
	rMkqGsKQHDtKpl/u3Q1KwdPni08VwniVXh8Hju+Y=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1743511405;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=R50saAwWxokM96C5j4irvUuZRGcg710zydoKh3Puakc=;
	b=MLblFLeyVOy7PQvNeCNZbUaFS3yu+E+W0Us2lBm8nRlL9ydLUfk6WTIe3ommYYMH
	b1sJwTDbZjCAwRNV12aSKu0W7yOF8sKuwzZYru+epMxR0XHOnUniHWshPpjXtXqSXHk
	y5fEoxtFJNHYel7fmUhgxUllarXcy5OCoPvJDk2c=
Content-Type: multipart/mixed; boundary="===============6761826573933014964=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libnotify: upgrading to 0.8.6 SUCCEEDED
Message-ID: <01010195f160c23b-1922ca95-5ef9-4e67-9faf-5a79bdabf7d6-000000@us-west-2.amazonses.com>
Date: Tue, 1 Apr 2025 12:43:25 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.04.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 12:43:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214090

--===============6761826573933014964==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libnotify* to *0.8.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libnotify-upgrade-0.8.4-0.8.6.patch
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
From 4ac564ea8f31f837a4b903002497f449292dfbf4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Apr 2025 10:50:26 +0000
Subject: [PATCH] libnotify: upgrade 0.8.4 -> 0.8.6

---
 .../libnotify/{libnotify_0.8.4.bb => libnotify_0.8.6.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/libnotify/{libnotify_0.8.4.bb => libnotify_0.8.6.bb} (93%)

diff --git a/meta/recipes-gnome/libnotify/libnotify_0.8.4.bb b/meta/recipes-gnome/libnotify/libnotify_0.8.6.bb
similarity index 93%
rename from meta/recipes-gnome/libnotify/libnotify_0.8.4.bb
rename to meta/recipes-gnome/libnotify/libnotify_0.8.6.bb
index 040df2ad5e..6ff7ee4be1 100644
--- a/meta/recipes-gnome/libnotify/libnotify_0.8.4.bb
+++ b/meta/recipes-gnome/libnotify/libnotify_0.8.6.bb
@@ -20,7 +20,7 @@ inherit gnomebase gi-docgen features_check gobject-introspection
 # depends on gtk+3 if tests are enabled
 ANY_OF_DISTRO_FEATURES = "${@bb.utils.contains('PACKAGECONFIG', 'tests', '${GTK3DISTROFEATURES}', '', d)}"
 
-SRC_URI[archive.sha256sum] = "8fa04d4ebdc155b0a239df88bd9f09e8f2739d5707a1390b427ab4985f83d25a"
+SRC_URI[archive.sha256sum] = "c5540aaefb60e1d63b1c587c05f2284ebe72ece7d0c0e5e4a778cfd5844b6b58"
 
 EXTRA_OEMESON = "-Dman=false"
 
-- 
2.47.1


--===============6761826573933014964==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libnotify-upgrade-0.8.4-0.8.6.patch"

RnJvbSA0YWM1NjRlYThmMzFmODM3YTRiOTAzMDAyNDk3ZjQ0OTI5MmRmYmY0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBBcHIgMjAyNSAxMDo1MDoyNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
Ym5vdGlmeTogdXBncmFkZSAwLjguNCAtPiAwLjguNgoKLS0tCiAuLi4vbGlibm90aWZ5L3tsaWJu
b3RpZnlfMC44LjQuYmIgPT4gbGlibm90aWZ5XzAuOC42LmJifSAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtZ25vbWUvbGlibm90aWZ5L3tsaWJub3RpZnlfMC44LjQuYmIgPT4gbGlibm90aWZ5XzAu
OC42LmJifSAoOTMlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1nbm9tZS9saWJub3RpZnkv
bGlibm90aWZ5XzAuOC40LmJiIGIvbWV0YS9yZWNpcGVzLWdub21lL2xpYm5vdGlmeS9saWJub3Rp
ZnlfMC44LjYuYmIKc2ltaWxhcml0eSBpbmRleCA5MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVz
LWdub21lL2xpYm5vdGlmeS9saWJub3RpZnlfMC44LjQuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBl
cy1nbm9tZS9saWJub3RpZnkvbGlibm90aWZ5XzAuOC42LmJiCmluZGV4IDA0MGRmMmFkNWUuLjZm
ZjdlZTRiZTEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1nbm9tZS9saWJub3RpZnkvbGlibm90
aWZ5XzAuOC40LmJiCisrKyBiL21ldGEvcmVjaXBlcy1nbm9tZS9saWJub3RpZnkvbGlibm90aWZ5
XzAuOC42LmJiCkBAIC0yMCw3ICsyMCw3IEBAIGluaGVyaXQgZ25vbWViYXNlIGdpLWRvY2dlbiBm
ZWF0dXJlc19jaGVjayBnb2JqZWN0LWludHJvc3BlY3Rpb24KICMgZGVwZW5kcyBvbiBndGsrMyBp
ZiB0ZXN0cyBhcmUgZW5hYmxlZAogQU5ZX09GX0RJU1RST19GRUFUVVJFUyA9ICIke0BiYi51dGls
cy5jb250YWlucygnUEFDS0FHRUNPTkZJRycsICd0ZXN0cycsICcke0dUSzNESVNUUk9GRUFUVVJF
U30nLCAnJywgZCl9IgogCi1TUkNfVVJJW2FyY2hpdmUuc2hhMjU2c3VtXSA9ICI4ZmEwNGQ0ZWJk
YzE1NWIwYTIzOWRmODhiZDlmMDllOGYyNzM5ZDU3MDdhMTM5MGI0MjdhYjQ5ODVmODNkMjVhIgor
U1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0gPSAiYzU1NDBhYWVmYjYwZTFkNjNiMWM1ODdjMDVm
MjI4NGViZTcyZWNlN2QwYzBlNWU0YTc3OGNmZDU4NDRiNmI1OCIKIAogRVhUUkFfT0VNRVNPTiA9
ICItRG1hbj1mYWxzZSIKIAotLSAKMi40Ny4xCgo=

--===============6761826573933014964==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libnotify: SRC_URI changed from "https://download.gnome.org/sources//libnotify/0.8/libnotify-0.8.4.tar.xz;name=archive" to "https://download.gnome.org/sources//libnotify/0.8/libnotify-0.8.6.tar.xz;name=archive"
packages/core2-64-poky-linux/libnotify: PKGV changed from 0.8.4 [default] to 0.8.6 [default]
packages/core2-64-poky-linux/libnotify: PV changed from "0.8.4" to "0.8.6"
packages/core2-64-poky-linux/libnotify/libnotify-dbg: PKGV changed from 0.8.4 [default] to 0.8.6 [default]
packages/core2-64-poky-linux/libnotify/libnotify-dbg: PKGSIZE changed from 159520 to 158976 (-0%)
packages/core2-64-poky-linux/libnotify/libnotify-dbg: PV changed from "0.8.4" to "0.8.6"
packages/core2-64-poky-linux/libnotify/libnotify-dev: PKGV changed from 0.8.4 [default] to 0.8.6 [default]
packages/core2-64-poky-linux/libnotify/libnotify-dev: PV changed from "0.8.4" to "0.8.6"
packages/core2-64-poky-linux/libnotify/libnotify-doc: PKGV changed from 0.8.4 [default] to 0.8.6 [default]
packages/core2-64-poky-linux/libnotify/libnotify-doc: PV changed from "0.8.4" to "0.8.6"
packages/core2-64-poky-linux/libnotify/libnotify-locale: PKGV changed from 0.8.4 [default] to 0.8.6 [default]
packages/core2-64-poky-linux/libnotify/libnotify-locale: PV changed from "0.8.4" to "0.8.6"
packages/core2-64-poky-linux/libnotify/libnotify-src: PKGV changed from 0.8.4 [default] to 0.8.6 [default]
packages/core2-64-poky-linux/libnotify/libnotify-src: PKGSIZE changed from 130214 to 130106 (-0%)
packages/core2-64-poky-linux/libnotify/libnotify-src: PV changed from "0.8.4" to "0.8.6"
packages/core2-64-poky-linux/libnotify/libnotify-staticdev: PKGV changed from 0.8.4 [default] to 0.8.6 [default]
packages/core2-64-poky-linux/libnotify/libnotify-staticdev: PV changed from "0.8.4" to "0.8.6"
packages/core2-64-poky-linux/libnotify/libnotify: PKGV changed from 0.8.4 [default] to 0.8.6 [default]
packages/core2-64-poky-linux/libnotify/libnotify: PV changed from "0.8.4" to "0.8.6"

--===============6761826573933014964==--

