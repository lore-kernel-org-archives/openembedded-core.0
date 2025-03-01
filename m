Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C64C9C3600E
	for <webhook@archiver.kernel.org>; Sat,  1 Mar 2025 11:25:39 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.7177.1740828333112516609
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Mar 2025 03:25:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Dkd97mdw;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=N4FHC5pf;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010195517451af-3a35b3e1-1511-4c8a-899c-582bb49252d7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1740828332;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=RxWohBW2lEU3PIngnkTypoCV3zrxp0m9kE9WlQrgvbE=;
	b=Dkd97mdwBzZDl4F+lAN2kKoY2Z6g2fWoO9sIMKkJX6E+6n6p5HgL0WHzjsLc11iG
	6Ps7+eZ/wk6xb90pn+inWlYjYM/x982K49y/OZozc9C2NuLms2pjdA0XF+cSh1eNvv9
	h2PTc6sTkp5u0NyN956i3ipTbHW14orjZ59t2kG4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1740828332;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=RxWohBW2lEU3PIngnkTypoCV3zrxp0m9kE9WlQrgvbE=;
	b=N4FHC5pfBFGso1lm4jAjLy67fx9dskIgKNTHsk/jut6IXcUN/II7aQEoOwa3fJtv
	EeG+S8EKlUmQ9CsxKn62puN+luGjYrXo1vV3UewH1tz6P2+0VpUYUUmLN/1/Q9L6GiA
	cr5ehAWKMoAbAihTHeKAYOO+Q9NM1MTgqhDJZmcc=
Content-Type: multipart/mixed; boundary="===============0563637120763451214=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libnotify: upgrading to 0.8.4 SUCCEEDED
Message-ID: <01010195517451af-3a35b3e1-1511-4c8a-899c-582bb49252d7-000000@us-west-2.amazonses.com>
Date: Sat, 1 Mar 2025 11:25:32 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.03.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Mar 2025 11:25:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212149

--===============0563637120763451214==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libnotify* to *0.8.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libnotify-upgrade-0.8.3-0.8.4.patch
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
From fc9be0473aaf2db63484379930adf278ba66d96c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Mar 2025 09:31:06 +0000
Subject: [PATCH] libnotify: upgrade 0.8.3 -> 0.8.4

---
 .../libnotify/{libnotify_0.8.3.bb => libnotify_0.8.4.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/libnotify/{libnotify_0.8.3.bb => libnotify_0.8.4.bb} (93%)

diff --git a/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb b/meta/recipes-gnome/libnotify/libnotify_0.8.4.bb
similarity index 93%
rename from meta/recipes-gnome/libnotify/libnotify_0.8.3.bb
rename to meta/recipes-gnome/libnotify/libnotify_0.8.4.bb
index 1e606b84b2..040df2ad5e 100644
--- a/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb
+++ b/meta/recipes-gnome/libnotify/libnotify_0.8.4.bb
@@ -20,7 +20,7 @@ inherit gnomebase gi-docgen features_check gobject-introspection
 # depends on gtk+3 if tests are enabled
 ANY_OF_DISTRO_FEATURES = "${@bb.utils.contains('PACKAGECONFIG', 'tests', '${GTK3DISTROFEATURES}', '', d)}"
 
-SRC_URI[archive.sha256sum] = "ee8f3ef946156ad3406fdf45feedbdcd932dbd211ab4f16f75eba4f36fb2f6c0"
+SRC_URI[archive.sha256sum] = "8fa04d4ebdc155b0a239df88bd9f09e8f2739d5707a1390b427ab4985f83d25a"
 
 EXTRA_OEMESON = "-Dman=false"
 
-- 
2.44.1


--===============0563637120763451214==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libnotify: PV changed from "0.8.3" to "0.8.4"
packages/core2-64-poky-linux/libnotify: PKGV changed from 0.8.3 [default] to 0.8.4 [default]
packages/core2-64-poky-linux/libnotify: SRC_URI changed from "https://download.gnome.org/sources//libnotify/0.8/libnotify-0.8.3.tar.xz;name=archive" to "https://download.gnome.org/sources//libnotify/0.8/libnotify-0.8.4.tar.xz;name=archive"
packages/core2-64-poky-linux/libnotify/libnotify-dbg: PV changed from "0.8.3" to "0.8.4"
packages/core2-64-poky-linux/libnotify/libnotify-dbg: PKGSIZE changed from 151280 to 159184 (+5%)
packages/core2-64-poky-linux/libnotify/libnotify-dbg: PKGV changed from 0.8.3 [default] to 0.8.4 [default]
packages/core2-64-poky-linux/libnotify/libnotify-dev: PV changed from "0.8.3" to "0.8.4"
packages/core2-64-poky-linux/libnotify/libnotify-dev: PKGSIZE changed from 70116 to 70767 (+1%)
packages/core2-64-poky-linux/libnotify/libnotify-dev: PKGV changed from 0.8.3 [default] to 0.8.4 [default]
packages/core2-64-poky-linux/libnotify/libnotify-doc: PV changed from "0.8.3" to "0.8.4"
packages/core2-64-poky-linux/libnotify/libnotify-doc: PKGV changed from 0.8.3 [default] to 0.8.4 [default]
packages/core2-64-poky-linux/libnotify/libnotify-locale: PV changed from "0.8.3" to "0.8.4"
packages/core2-64-poky-linux/libnotify/libnotify-locale: PKGV changed from 0.8.3 [default] to 0.8.4 [default]
packages/core2-64-poky-linux/libnotify/libnotify-src: PV changed from "0.8.3" to "0.8.4"
packages/core2-64-poky-linux/libnotify/libnotify-src: PKGSIZE changed from 125486 to 130214 (+4%)
packages/core2-64-poky-linux/libnotify/libnotify-src: PKGV changed from 0.8.3 [default] to 0.8.4 [default]
packages/core2-64-poky-linux/libnotify/libnotify-staticdev: PV changed from "0.8.3" to "0.8.4"
packages/core2-64-poky-linux/libnotify/libnotify-staticdev: PKGV changed from 0.8.3 [default] to 0.8.4 [default]
packages/core2-64-poky-linux/libnotify/libnotify: PV changed from "0.8.3" to "0.8.4"
packages/core2-64-poky-linux/libnotify/libnotify: PKGSIZE changed from 83142 to 83342 (+0%)
packages/core2-64-poky-linux/libnotify/libnotify: PKGV changed from 0.8.3 [default] to 0.8.4 [default]

--===============0563637120763451214==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libnotify-upgrade-0.8.3-0.8.4.patch"

RnJvbSBmYzliZTA0NzNhYWYyZGI2MzQ4NDM3OTkzMGFkZjI3OGJhNjZkOTZjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBNYXIgMjAyNSAwOTozMTowNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
Ym5vdGlmeTogdXBncmFkZSAwLjguMyAtPiAwLjguNAoKLS0tCiAuLi4vbGlibm90aWZ5L3tsaWJu
b3RpZnlfMC44LjMuYmIgPT4gbGlibm90aWZ5XzAuOC40LmJifSAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtZ25vbWUvbGlibm90aWZ5L3tsaWJub3RpZnlfMC44LjMuYmIgPT4gbGlibm90aWZ5XzAu
OC40LmJifSAoOTMlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1nbm9tZS9saWJub3RpZnkv
bGlibm90aWZ5XzAuOC4zLmJiIGIvbWV0YS9yZWNpcGVzLWdub21lL2xpYm5vdGlmeS9saWJub3Rp
ZnlfMC44LjQuYmIKc2ltaWxhcml0eSBpbmRleCA5MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVz
LWdub21lL2xpYm5vdGlmeS9saWJub3RpZnlfMC44LjMuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBl
cy1nbm9tZS9saWJub3RpZnkvbGlibm90aWZ5XzAuOC40LmJiCmluZGV4IDFlNjA2Yjg0YjIuLjA0
MGRmMmFkNWUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1nbm9tZS9saWJub3RpZnkvbGlibm90
aWZ5XzAuOC4zLmJiCisrKyBiL21ldGEvcmVjaXBlcy1nbm9tZS9saWJub3RpZnkvbGlibm90aWZ5
XzAuOC40LmJiCkBAIC0yMCw3ICsyMCw3IEBAIGluaGVyaXQgZ25vbWViYXNlIGdpLWRvY2dlbiBm
ZWF0dXJlc19jaGVjayBnb2JqZWN0LWludHJvc3BlY3Rpb24KICMgZGVwZW5kcyBvbiBndGsrMyBp
ZiB0ZXN0cyBhcmUgZW5hYmxlZAogQU5ZX09GX0RJU1RST19GRUFUVVJFUyA9ICIke0BiYi51dGls
cy5jb250YWlucygnUEFDS0FHRUNPTkZJRycsICd0ZXN0cycsICcke0dUSzNESVNUUk9GRUFUVVJF
U30nLCAnJywgZCl9IgogCi1TUkNfVVJJW2FyY2hpdmUuc2hhMjU2c3VtXSA9ICJlZThmM2VmOTQ2
MTU2YWQzNDA2ZmRmNDVmZWVkYmRjZDkzMmRiZDIxMWFiNGYxNmY3NWViYTRmMzZmYjJmNmMwIgor
U1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0gPSAiOGZhMDRkNGViZGMxNTViMGEyMzlkZjg4YmQ5
ZjA5ZThmMjczOWQ1NzA3YTEzOTBiNDI3YWI0OTg1ZjgzZDI1YSIKIAogRVhUUkFfT0VNRVNPTiA9
ICItRG1hbj1mYWxzZSIKIAotLSAKMi40NC4xCgo=

--===============0563637120763451214==--

