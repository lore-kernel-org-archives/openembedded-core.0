Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C566CC3DA44
	for <webhook@archiver.kernel.org>; Sat,  1 Jul 2023 16:02:07 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.10767.1688227323365558540
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Jul 2023 09:02:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Bxv7oEaa;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018912309b8d-bba06169-dd7a-4393-b132-58a141d824e5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1688227322;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=MlhbiAVs4eU1OGhV2gOb6BG16UjYuimwN8JGAE7GAm0=;
	b=Bxv7oEaaYIVgJ7TLTZ+dtoPwfn9JzN6el7NFel19aDdrf3Nnl0e8uJE8e5rZXAHU
	t7NueGcXq2HlTUn3XZiznHWuWBmZ+vO62xb5jgXFWVxvyPs+vpzOX8CNl+ag+QSrMW+
	mnmrHT6sbxv06jDovKtPYBlfslsNAk9yCZFqzVH8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1688227322;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=MlhbiAVs4eU1OGhV2gOb6BG16UjYuimwN8JGAE7GAm0=;
	b=DPWwBDHsqt4Cx5ovfnd2/MWPtq0MIKdmkUOl2R7G5odqSsubTuI1EOY1QCMCOiC6
	ig+3X+WZ6daMtykMvCPts1vuQFrNg8Y+KAE7SJlRkv/HHa2ayRwPV561MjeGRholrGY
	3B4Xf8TW/cz0Ah/G0RS6gOiLhmF/Nxe0u2IkWmPE=
Content-Type: multipart/mixed; boundary="===============3556525081594350905=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] acpica: upgrading to 20230628 SUCCEEDED
Message-ID: <0101018912309b8d-bba06169-dd7a-4393-b132-58a141d824e5-000000@us-west-2.amazonses.com>
Date: Sat, 1 Jul 2023 16:02:02 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.07.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Jul 2023 16:02:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183731

--===============3556525081594350905==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *acpica* to *20230628* has Succeeded.

Next steps:
    - apply the patch: git am 0001-acpica-upgrade-20230331-20230628.patch
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
From f5e6db9ff249cd111a5b263bf6fdd7a3c0c55388 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Jul 2023 10:04:42 +0000
Subject: [PATCH] acpica: upgrade 20230331 -> 20230628

---
 .../acpica/{acpica_20230331.bb => acpica_20230628.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/acpica/{acpica_20230331.bb => acpica_20230628.bb} (94%)

diff --git a/meta/recipes-extended/acpica/acpica_20230331.bb b/meta/recipes-extended/acpica/acpica_20230628.bb
similarity index 94%
rename from meta/recipes-extended/acpica/acpica_20230331.bb
rename to meta/recipes-extended/acpica/acpica_20230628.bb
index 01b8833f50..06db99cef5 100644
--- a/meta/recipes-extended/acpica/acpica_20230331.bb
+++ b/meta/recipes-extended/acpica/acpica_20230628.bb
@@ -17,7 +17,7 @@ COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
 DEPENDS = "m4-native flex-native bison-native"
 
 SRC_URI = "https://acpica.org/sites/acpica/files/acpica-unix-${PV}.tar.gz"
-SRC_URI[sha256sum] = "0c5d695d605aaa61709f3c63f57a1a99b8902291723998446b0813b57ac310e2"
+SRC_URI[sha256sum] = "86876a745e3d224dcfd222ed3de465b47559e85811df2db9820ef09a9dff5cce"
 
 UPSTREAM_CHECK_URI = "https://acpica.org/downloads"
 
-- 
2.39.2


--===============3556525081594350905==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 896 .bb files complete (0 cached, 896 parsed). 1799 targets, 61 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.

Summary: There was 1 WARNING message.
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: Nothing PROVIDES 'acpica'
acpica was skipped: incompatible with host mips-poky-linux (not in COMPATIBLE_HOST)

--===============3556525081594350905==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-acpica-upgrade-20230331-20230628.patch"

RnJvbSBmNWU2ZGI5ZmYyNDljZDExMWE1YjI2M2JmNmZkZDdhM2MwYzU1Mzg4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBKdWwgMjAyMyAxMDowNDo0MiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGFj
cGljYTogdXBncmFkZSAyMDIzMDMzMSAtPiAyMDIzMDYyOAoKLS0tCiAuLi4vYWNwaWNhL3thY3Bp
Y2FfMjAyMzAzMzEuYmIgPT4gYWNwaWNhXzIwMjMwNjI4LmJifSAgICAgICAgICAgfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRh
L3JlY2lwZXMtZXh0ZW5kZWQvYWNwaWNhL3thY3BpY2FfMjAyMzAzMzEuYmIgPT4gYWNwaWNhXzIw
MjMwNjI4LmJifSAoOTQlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9hY3Bp
Y2EvYWNwaWNhXzIwMjMwMzMxLmJiIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2FjcGljYS9hY3Bp
Y2FfMjAyMzA2MjguYmIKc2ltaWxhcml0eSBpbmRleCA5NCUKcmVuYW1lIGZyb20gbWV0YS9yZWNp
cGVzLWV4dGVuZGVkL2FjcGljYS9hY3BpY2FfMjAyMzAzMzEuYmIKcmVuYW1lIHRvIG1ldGEvcmVj
aXBlcy1leHRlbmRlZC9hY3BpY2EvYWNwaWNhXzIwMjMwNjI4LmJiCmluZGV4IDAxYjg4MzNmNTAu
LjA2ZGI5OWNlZjUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9hY3BpY2EvYWNw
aWNhXzIwMjMwMzMxLmJiCisrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9hY3BpY2EvYWNwaWNh
XzIwMjMwNjI4LmJiCkBAIC0xNyw3ICsxNyw3IEBAIENPTVBBVElCTEVfSE9TVCA9ICIoaS44Nnx4
ODZfNjR8YXJtfGFhcmNoNjQpLiotbGludXgiCiBERVBFTkRTID0gIm00LW5hdGl2ZSBmbGV4LW5h
dGl2ZSBiaXNvbi1uYXRpdmUiCiAKIFNSQ19VUkkgPSAiaHR0cHM6Ly9hY3BpY2Eub3JnL3NpdGVz
L2FjcGljYS9maWxlcy9hY3BpY2EtdW5peC0ke1BWfS50YXIuZ3oiCi1TUkNfVVJJW3NoYTI1NnN1
bV0gPSAiMGM1ZDY5NWQ2MDVhYWE2MTcwOWYzYzYzZjU3YTFhOTliODkwMjI5MTcyMzk5ODQ0NmIw
ODEzYjU3YWMzMTBlMiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI4Njg3NmE3NDVlM2QyMjRkY2Zk
MjIyZWQzZGU0NjViNDc1NTllODU4MTFkZjJkYjk4MjBlZjA5YTlkZmY1Y2NlIgogCiBVUFNUUkVB
TV9DSEVDS19VUkkgPSAiaHR0cHM6Ly9hY3BpY2Eub3JnL2Rvd25sb2FkcyIKIAotLSAKMi4zOS4y
Cgo=

--===============3556525081594350905==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/acpica/acpica-dbg: PKGV changed from 20230331 [default] to 20230628 [default]
packages/core2-32-poky-linux/acpica/acpica-dbg: PKGSIZE changed from 8868372 to 8890928 (+0%)
packages/core2-32-poky-linux/acpica/acpica-dbg: PV changed from "20230331" to "20230628"
packages/core2-32-poky-linux/acpica/acpica-dev: PKGV changed from 20230331 [default] to 20230628 [default]
packages/core2-32-poky-linux/acpica/acpica-dev: PV changed from "20230331" to "20230628"
packages/core2-32-poky-linux/acpica/acpica-doc: PKGV changed from 20230331 [default] to 20230628 [default]
packages/core2-32-poky-linux/acpica/acpica-doc: PV changed from "20230331" to "20230628"
packages/core2-32-poky-linux/acpica/acpica-locale: PKGV changed from 20230331 [default] to 20230628 [default]
packages/core2-32-poky-linux/acpica/acpica-locale: PV changed from "20230331" to "20230628"
packages/core2-32-poky-linux/acpica/acpica-src: PKGV changed from 20230331 [default] to 20230628 [default]
packages/core2-32-poky-linux/acpica/acpica-src: PKGSIZE changed from 10435562 to 10457490 (+0%)
packages/core2-32-poky-linux/acpica/acpica-src: PV changed from "20230331" to "20230628"
packages/core2-32-poky-linux/acpica/acpica-staticdev: PKGV changed from 20230331 [default] to 20230628 [default]
packages/core2-32-poky-linux/acpica/acpica-staticdev: PV changed from "20230331" to "20230628"
packages/core2-32-poky-linux/acpica/acpica: PKGV changed from 20230331 [default] to 20230628 [default]
packages/core2-32-poky-linux/acpica/acpica: PKGSIZE changed from 2686332 to 2695516 (+0%)
packages/core2-32-poky-linux/acpica/acpica: PV changed from "20230331" to "20230628"
packages/core2-32-poky-linux/acpica: SRC_URI changed from "https://acpica.org/sites/acpica/files/acpica-unix-20230331.tar.gz" to "https://acpica.org/sites/acpica/files/acpica-unix-20230628.tar.gz"
packages/core2-32-poky-linux/acpica: PKGV changed from 20230331 [default] to 20230628 [default]
packages/core2-32-poky-linux/acpica: PV changed from "20230331" to "20230628"

--===============3556525081594350905==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 896 .bb files complete (0 cached, 896 parsed). 1799 targets, 67 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.

Summary: There was 1 WARNING message.
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: Nothing PROVIDES 'acpica'
acpica was skipped: incompatible with host powerpc-poky-linux (not in COMPATIBLE_HOST)

--===============3556525081594350905==--

