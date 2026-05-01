Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20C82CD343E
	for <webhook@archiver.kernel.org>; Fri,  1 May 2026 14:25:40 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15710.1777645532874758684
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 May 2026 07:25:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=ppgYpfxF;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=R//bkD8d;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019de3ee3495-3d274668-a6d3-4ca2-919a-ce241d18757d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1777645532;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=vFVnjsqzSyadWtqAORWfpADGLhgovZXsBoM3Mjz3LVY=;
	b=ppgYpfxFjGvu1ujbIETQWBdaRY2qBpZ6r/M/rJig5n50CCV+Kgi2RW70DJ8BRnOp
	jb15rXAioofQ2DlpQiMnswbmRtUL65bSfKyhAFpuPsstxqV+tDVwxz5zgqbqj9ypkeM
	aaeskrRVnbEx81HiFfMjLDGm+T8K8rlfLY4ntOEU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1777645532;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=vFVnjsqzSyadWtqAORWfpADGLhgovZXsBoM3Mjz3LVY=;
	b=R//bkD8dW7OK3Z4oWsD5dqpTV8sDq+Djy4KCeGVsPrcsl0ztt5Q/JhuCR9u+dXvd
	HbWMOruHqg4dEqRmCOx1ezT4B2JWwc6n8za/+ZqnKWFsCL7XOAmVHNwgpoar5tHcd2f
	lCE8CFJHMcDApZNnmx36+arQroR5TAapv3VJezfk=
Content-Type: multipart/mixed; boundary="===============6016687861473993075=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] libxpm: upgrading to 3.5.19 SUCCEEDED
Message-ID: <0101019de3ee3495-3d274668-a6d3-4ca2-919a-ce241d18757d-000000@us-west-2.amazonses.com>
Date: Fri, 1 May 2026 14:25:32 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 May 2026 14:25:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236207

--===============6016687861473993075==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libxpm* to *3.5.19* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libxpm-upgrade-3.5.18-3.5.19.patch
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
From 7400fd26d3c72c349995565e006a99b54134d99b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 May 2026 06:25:55 +0000
Subject: [PATCH] libxpm: upgrade 3.5.18 -> 3.5.19

---
 .../xorg-lib/{libxpm_3.5.18.bb => libxpm_3.5.19.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libxpm_3.5.18.bb => libxpm_3.5.19.bb} (88%)

diff --git a/meta/recipes-graphics/xorg-lib/libxpm_3.5.18.bb b/meta/recipes-graphics/xorg-lib/libxpm_3.5.19.bb
similarity index 88%
rename from meta/recipes-graphics/xorg-lib/libxpm_3.5.18.bb
rename to meta/recipes-graphics/xorg-lib/libxpm_3.5.19.bb
index 94bf28232e..32e052fd42 100644
--- a/meta/recipes-graphics/xorg-lib/libxpm_3.5.18.bb
+++ b/meta/recipes-graphics/xorg-lib/libxpm_3.5.19.bb
@@ -22,6 +22,6 @@ PACKAGES =+ "sxpm cxpm"
 FILES:cxpm = "${bindir}/cxpm"
 FILES:sxpm = "${bindir}/sxpm"
 
-SRC_URI[sha256sum] = "b4ed79bfc718000edee837d551c35286f0b84576db0ce07bbbebe60a4affa1e4"
+SRC_URI[sha256sum] = "ad3576d689221a39dc728f0e0dc02ca7bb6a0d724c9a77fd1bfa1e9af83be900"
 
 BBCLASSEXTEND = "native"
-- 
2.47.1


--===============6016687861473993075==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libxpm-upgrade-3.5.18-3.5.19.patch"

RnJvbSA3NDAwZmQyNmQzYzcyYzM0OTk5NTU2NWUwMDZhOTliNTQxMzRkOTliIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBNYXkgMjAyNiAwNjoyNTo1NSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnhwbTogdXBncmFkZSAzLjUuMTggLT4gMy41LjE5CgotLS0KIC4uLi94b3JnLWxpYi97bGlieHBt
XzMuNS4xOC5iYiA9PiBsaWJ4cG1fMy41LjE5LmJifSAgICAgICAgICAgICB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1ncmFwaGljcy94b3JnLWxpYi97bGlieHBtXzMuNS4xOC5iYiA9PiBsaWJ4cG1fMy41LjE5
LmJifSAoODglKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxpYi9s
aWJ4cG1fMy41LjE4LmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctbGliL2xpYnhwbV8z
LjUuMTkuYmIKc2ltaWxhcml0eSBpbmRleCA4OCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdy
YXBoaWNzL3hvcmctbGliL2xpYnhwbV8zLjUuMTguYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1n
cmFwaGljcy94b3JnLWxpYi9saWJ4cG1fMy41LjE5LmJiCmluZGV4IDk0YmYyODIzMmUuLjMyZTA1
MmZkNDIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxpYi9saWJ4cG1f
My41LjE4LmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxpYi9saWJ4cG1fMy41
LjE5LmJiCkBAIC0yMiw2ICsyMiw2IEBAIFBBQ0tBR0VTID0rICJzeHBtIGN4cG0iCiBGSUxFUzpj
eHBtID0gIiR7YmluZGlyfS9jeHBtIgogRklMRVM6c3hwbSA9ICIke2JpbmRpcn0vc3hwbSIKIAot
U1JDX1VSSVtzaGEyNTZzdW1dID0gImI0ZWQ3OWJmYzcxODAwMGVkZWU4MzdkNTUxYzM1Mjg2ZjBi
ODQ1NzZkYjBjZTA3YmJiZWJlNjBhNGFmZmExZTQiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYWQz
NTc2ZDY4OTIyMWEzOWRjNzI4ZjBlMGRjMDJjYTdiYjZhMGQ3MjRjOWE3N2ZkMWJmYTFlOWFmODNi
ZTkwMCIKIAogQkJDTEFTU0VYVEVORCA9ICJuYXRpdmUiCi0tIAoyLjQ3LjEKCg==

--===============6016687861473993075==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libxpm/cxpm: PKGV changed from 3.5.18 [default] to 3.5.19 [default]
packages/x86-64-v3-poky-linux/libxpm/cxpm: PV changed from "3.5.18" to "3.5.19"
packages/x86-64-v3-poky-linux/libxpm: SRC_URI changed from "https://www.x.org/releases//individual/lib/libXpm-3.5.18.tar.xz" to "https://www.x.org/releases//individual/lib/libXpm-3.5.19.tar.xz"
packages/x86-64-v3-poky-linux/libxpm: PKGV changed from 3.5.18 [default] to 3.5.19 [default]
packages/x86-64-v3-poky-linux/libxpm: PV changed from "3.5.18" to "3.5.19"
packages/x86-64-v3-poky-linux/libxpm/libxpm-dbg: PKGSIZE changed from 395928 to 396472 (+0%)
packages/x86-64-v3-poky-linux/libxpm/libxpm-dbg: PKGV changed from 3.5.18 [default] to 3.5.19 [default]
packages/x86-64-v3-poky-linux/libxpm/libxpm-dbg: PV changed from "3.5.18" to "3.5.19"
packages/x86-64-v3-poky-linux/libxpm/libxpm-dev: PKGV changed from 3.5.18 [default] to 3.5.19 [default]
packages/x86-64-v3-poky-linux/libxpm/libxpm-dev: PV changed from "3.5.18" to "3.5.19"
packages/x86-64-v3-poky-linux/libxpm/libxpm-doc: PKGV changed from 3.5.18 [default] to 3.5.19 [default]
packages/x86-64-v3-poky-linux/libxpm/libxpm-doc: PV changed from "3.5.18" to "3.5.19"
packages/x86-64-v3-poky-linux/libxpm/libxpm-locale: PKGV changed from 3.5.18 [default] to 3.5.19 [default]
packages/x86-64-v3-poky-linux/libxpm/libxpm-locale: PV changed from "3.5.18" to "3.5.19"
packages/x86-64-v3-poky-linux/libxpm/libxpm-src: PKGSIZE changed from 285586 to 285905 (+0%)
packages/x86-64-v3-poky-linux/libxpm/libxpm-src: PKGV changed from 3.5.18 [default] to 3.5.19 [default]
packages/x86-64-v3-poky-linux/libxpm/libxpm-src: FILELIST: directory renamed /usr/src/debug/libxpm/3.5.18/src -> /usr/src/debug/libxpm/3.5.19/src, directory renamed /usr/src/debug/libxpm/3.5.18/include/X11 -> /usr/src/debug/libxpm/3.5.19/include/X11, directory renamed /usr/src/debug/libxpm/3.5.18/cxpm -> /usr/src/debug/libxpm/3.5.19/cxpm, directory renamed /usr/src/debug/libxpm/3.5.18/sxpm -> /usr/src/debug/libxpm/3.5.19/sxpm
packages/x86-64-v3-poky-linux/libxpm/libxpm-src: PV changed from "3.5.18" to "3.5.19"
packages/x86-64-v3-poky-linux/libxpm/libxpm-staticdev: PKGV changed from 3.5.18 [default] to 3.5.19 [default]
packages/x86-64-v3-poky-linux/libxpm/libxpm-staticdev: PV changed from "3.5.18" to "3.5.19"
packages/x86-64-v3-poky-linux/libxpm/libxpm: PKGV changed from 3.5.18 [default] to 3.5.19 [default]
packages/x86-64-v3-poky-linux/libxpm/libxpm: PV changed from "3.5.18" to "3.5.19"
packages/x86-64-v3-poky-linux/libxpm/sxpm: PKGV changed from 3.5.18 [default] to 3.5.19 [default]
packages/x86-64-v3-poky-linux/libxpm/sxpm: PV changed from "3.5.18" to "3.5.19"

--===============6016687861473993075==--

