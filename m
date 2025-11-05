Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C04CECD37B8
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:16:47 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2345.1762384574473537591
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:16:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=rGjH3PBE;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=nDp6LdPA;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019a564eed29-4ab8b71d-795f-4c16-a83f-3c1228c7b370-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1762384604;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=PM0+tcBXFx7buEXrzVQBt3KXb+p1BUx45dyVFuak3/4=;
	b=rGjH3PBErFG65IE1nNqcmTyW/kEnq2Ht1+HQ5jAvcTSTmTM7rBE/svumtJ2ePF1u
	1IqNoq2+DqeQ7ibWwla3wLIVpXmgSxvgdRUSkMGjgg/ODtcrnHFZy1hLtNFboBuao2v
	1mFE0au9Bh33FlbYNUu4DGd15rx4iAgOOxjjXe8o=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1762384604;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=PM0+tcBXFx7buEXrzVQBt3KXb+p1BUx45dyVFuak3/4=;
	b=nDp6LdPAKYjoC50FEzj+tU7MtPnGjPvWf7ruFQ6SdiDAs0utxO4HEfBGZ8NIanWd
	KX5trVHl76PV/ebrB8BDN81Y1nnfML4p6+zqaTsi7sreIitPJHYHCK+/CFs9UlYioD6
	2cBF2hvkeG0hZGNhBm3Nup4IaqvLJ/tQ4mIXI1SY=
Content-Type: multipart/mixed; boundary="===============7751672162899494924=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] bash-completion: upgrading to 2.17.0 SUCCEEDED
Message-ID: <0101019a564eed29-4ab8b71d-795f-4c16-a83f-3c1228c7b370-000000@us-west-2.amazonses.com>
Date: Wed, 5 Nov 2025 23:16:44 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.05-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 23:16:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225912

--===============7751672162899494924==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *bash-completion* to *2.17.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-bash-completion-upgrade-2.16.0-2.17.0.patch
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
From b26c08a9ba386bb127f41cd3aa7adba6903a514b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 5 Nov 2025 22:12:09 +0000
Subject: [PATCH] bash-completion: upgrade 2.16.0 -> 2.17.0

---
 .../{bash-completion_2.16.0.bb => bash-completion_2.17.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/bash-completion/{bash-completion_2.16.0.bb => bash-completion_2.17.0.bb} (92%)

diff --git a/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb b/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb
similarity index 92%
rename from meta/recipes-support/bash-completion/bash-completion_2.16.0.bb
rename to meta/recipes-support/bash-completion/bash-completion_2.17.0.bb
index d1a8f5e0cc..843b5b831d 100644
--- a/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb
+++ b/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb
@@ -14,7 +14,7 @@ SECTION = "console/utils"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "3369bd5e418a75fb990863925aed5b420398acebb320ec4c0306b3eae23f107a"
+SRC_URI[sha256sum] = "dd9d825e496435fb3beba3ae7bea9f77e821e894667d07431d1d4c8c570b9e58"
 GITHUB_BASE_URI = "https://github.com/scop/bash-completion/releases"
 
 PARALLEL_MAKE = ""
-- 
2.47.1


--===============7751672162899494924==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/bash-completion/bash-completion-extra: FILELIST: removed "/usr/share/bash-completion/completions/secret-tool", added "/usr/share/bash-completion/completions/_trash-list /usr/share/bash-completion/completions/_trash-empty /usr/share/bash-completion/completions/_shtab /usr/share/bash-completion/completions/_trash /usr/share/bash-completion/completions/fsnotifywait /usr/share/bash-completion/completions/_trash-restore /usr/share/bash-completion/completions/_tldr /usr/share/bash-completion/completions/_glab /usr/share/bash-completion/completions/cksum /usr/share/bash-completion/completions/_bombadil /usr/share/bash-completion/completions/brave-browser /usr/share/bash-completion/completions/_diffoci /usr/share/bash-completion/completions/brave /usr/share/bash-completion/completions/_asdf /usr/share/bash-completion/completions/fsnotifywatch /usr/share/bash-completion/completions/_glances /usr/share/bash-completion/completions/tmux /usr/share/bash-completion/co
 mpletions/_mado /usr/share/bash-completion/completions/_gomarklint /usr/share/bash-completion/completions/free /usr/share/bash-completion/completions/nload /usr/share/bash-completion/completions/_secret-tool /usr/share/bash-completion/completions/_trash-put"

--===============7751672162899494924==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/bash-completion/bash-completion-dbg: PV changed from "2.16.0" to "2.17.0"
packages/x86-64-v3-poky-linux/bash-completion/bash-completion-dbg: PKGV changed from 2.16.0 [default] to 2.17.0 [default]
packages/x86-64-v3-poky-linux/bash-completion/bash-completion-dev: PV changed from "2.16.0" to "2.17.0"
packages/x86-64-v3-poky-linux/bash-completion/bash-completion-dev: PKGV changed from 2.16.0 [default] to 2.17.0 [default]
packages/x86-64-v3-poky-linux/bash-completion/bash-completion-doc: PV changed from "2.16.0" to "2.17.0"
packages/x86-64-v3-poky-linux/bash-completion/bash-completion-doc: PKGV changed from 2.16.0 [default] to 2.17.0 [default]
packages/x86-64-v3-poky-linux/bash-completion/bash-completion-extra: PV changed from "2.16.0" to "2.17.0"
packages/x86-64-v3-poky-linux/bash-completion/bash-completion-extra: PKGSIZE changed from 894224 to 917819 (+3%)
packages/x86-64-v3-poky-linux/bash-completion/bash-completion-extra: FILELIST: removed "/usr/share/bash-completion/completions/secret-tool", added "/usr/share/bash-completion/completions/nload /usr/share/bash-completion/completions/_mado /usr/share/bash-completion/completions/brave /usr/share/bash-completion/completions/_glances /usr/share/bash-completion/completions/_shtab /usr/share/bash-completion/completions/_trash-list /usr/share/bash-completion/completions/fsnotifywait /usr/share/bash-completion/completions/cksum /usr/share/bash-completion/completions/free /usr/share/bash-completion/completions/_trash-restore /usr/share/bash-completion/completions/_diffoci /usr/share/bash-completion/completions/tmux /usr/share/bash-completion/completions/_glab /usr/share/bash-completion/completions/fsnotifywatch /usr/share/bash-completion/completions/_asdf /usr/share/bash-completion/completions/_trash-put /usr/share/bash-completion/completions/_secret-tool /usr/share/bash-completion/completions
 /_gomarklint /usr/share/bash-completion/completions/_trash /usr/share/bash-completion/completions/brave-browser /usr/share/bash-completion/completions/_bombadil /usr/share/bash-completion/completions/_trash-empty /usr/share/bash-completion/completions/_tldr"
packages/x86-64-v3-poky-linux/bash-completion/bash-completion-extra: PKGV changed from 2.16.0 [default] to 2.17.0 [default]
packages/x86-64-v3-poky-linux/bash-completion/bash-completion-locale: PV changed from "2.16.0" to "2.17.0"
packages/x86-64-v3-poky-linux/bash-completion/bash-completion-locale: PKGV changed from 2.16.0 [default] to 2.17.0 [default]
packages/x86-64-v3-poky-linux/bash-completion/bash-completion-src: PV changed from "2.16.0" to "2.17.0"
packages/x86-64-v3-poky-linux/bash-completion/bash-completion-src: PKGV changed from 2.16.0 [default] to 2.17.0 [default]
packages/x86-64-v3-poky-linux/bash-completion/bash-completion-staticdev: PV changed from "2.16.0" to "2.17.0"
packages/x86-64-v3-poky-linux/bash-completion/bash-completion-staticdev: PKGV changed from 2.16.0 [default] to 2.17.0 [default]
packages/x86-64-v3-poky-linux/bash-completion/bash-completion: PV changed from "2.16.0" to "2.17.0"
packages/x86-64-v3-poky-linux/bash-completion/bash-completion: PKGSIZE changed from 145588 to 150458 (+3%)
packages/x86-64-v3-poky-linux/bash-completion/bash-completion: PKGV changed from 2.16.0 [default] to 2.17.0 [default]
packages/x86-64-v3-poky-linux/bash-completion: PV changed from "2.16.0" to "2.17.0"
packages/x86-64-v3-poky-linux/bash-completion: SRC_URI changed from "https://github.com/scop/bash-completion/releases/download/2.16.0/bash-completion-2.16.0.tar.xz" to "https://github.com/scop/bash-completion/releases/download/2.17.0/bash-completion-2.17.0.tar.xz"
packages/x86-64-v3-poky-linux/bash-completion: PKGV changed from 2.16.0 [default] to 2.17.0 [default]

--===============7751672162899494924==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-bash-completion-upgrade-2.16.0-2.17.0.patch"

RnJvbSBiMjZjMDhhOWJhMzg2YmIxMjdmNDFjZDNhYTdhZGJhNjkwM2E1MTRiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgNSBOb3YgMjAyNSAyMjoxMjowOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGJh
c2gtY29tcGxldGlvbjogdXBncmFkZSAyLjE2LjAgLT4gMi4xNy4wCgotLS0KIC4uLi97YmFzaC1j
b21wbGV0aW9uXzIuMTYuMC5iYiA9PiBiYXNoLWNvbXBsZXRpb25fMi4xNy4wLmJifSAgICB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1l
IG1ldGEvcmVjaXBlcy1zdXBwb3J0L2Jhc2gtY29tcGxldGlvbi97YmFzaC1jb21wbGV0aW9uXzIu
MTYuMC5iYiA9PiBiYXNoLWNvbXBsZXRpb25fMi4xNy4wLmJifSAoOTIlKQoKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1zdXBwb3J0L2Jhc2gtY29tcGxldGlvbi9iYXNoLWNvbXBsZXRpb25fMi4x
Ni4wLmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvYmFzaC1jb21wbGV0aW9uL2Jhc2gtY29tcGxl
dGlvbl8yLjE3LjAuYmIKc2ltaWxhcml0eSBpbmRleCA5MiUKcmVuYW1lIGZyb20gbWV0YS9yZWNp
cGVzLXN1cHBvcnQvYmFzaC1jb21wbGV0aW9uL2Jhc2gtY29tcGxldGlvbl8yLjE2LjAuYmIKcmVu
YW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2Jhc2gtY29tcGxldGlvbi9iYXNoLWNvbXBsZXRp
b25fMi4xNy4wLmJiCmluZGV4IGQxYThmNWUwY2MuLjg0M2I1YjgzMWQgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1zdXBwb3J0L2Jhc2gtY29tcGxldGlvbi9iYXNoLWNvbXBsZXRpb25fMi4xNi4w
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2Jhc2gtY29tcGxldGlvbi9iYXNoLWNvbXBs
ZXRpb25fMi4xNy4wLmJiCkBAIC0xNCw3ICsxNCw3IEBAIFNFQ1RJT04gPSAiY29uc29sZS91dGls
cyIKIAogU1JDX1VSSSA9ICIke0dJVEhVQl9CQVNFX1VSSX0vZG93bmxvYWQvJHtQVn0vJHtCUE59
LSR7UFZ9LnRhci54eiIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjMzNjliZDVlNDE4YTc1ZmI5
OTA4NjM5MjVhZWQ1YjQyMDM5OGFjZWJiMzIwZWM0YzAzMDZiM2VhZTIzZjEwN2EiCitTUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiZGQ5ZDgyNWU0OTY0MzVmYjNiZWJhM2FlN2JlYTlmNzdlODIxZTg5NDY2
N2QwNzQzMWQxZDRjOGM1NzBiOWU1OCIKIEdJVEhVQl9CQVNFX1VSSSA9ICJodHRwczovL2dpdGh1
Yi5jb20vc2NvcC9iYXNoLWNvbXBsZXRpb24vcmVsZWFzZXMiCiAKIFBBUkFMTEVMX01BS0UgPSAi
IgotLSAKMi40Ny4xCgo=

--===============7751672162899494924==--

