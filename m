Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AED51CEDD93
	for <webhook@archiver.kernel.org>; Sat, 15 Nov 2025 16:39:17 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11951.1763224737567327213
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Nov 2025 08:39:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=LvRguIrK;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=oT2ObsxI;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019a88628dde-e88c5276-91fe-4352-9887-8b2140d910af-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1763224751;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=qyHTWfmS6MA0t3s2UF6djSopr9Cenup2EMoafAJGVQE=;
	b=LvRguIrKBj8hfI6vRSchwWD2FfWQNE0FjqPHgceXLAihNmxnX9UwiZaOOoM6/5VZ
	zValFVoVX8sAkuKLaZAMnewtlVelLPEDDWIJ9WzEzolzy7WZlMpIl/GTBEIzfp2Z/JT
	VyTDxBdtHm1bAtc/2gYVtBupjqOHusPuydheudQM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1763224751;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=qyHTWfmS6MA0t3s2UF6djSopr9Cenup2EMoafAJGVQE=;
	b=oT2ObsxIUcKmhUMfu5thYQ1HN1kLLPJ4/IEgV9W3iWNec3HwpMQjTRR7k7cu7+lq
	tixs7yx9zGSqVgcavWgOVllqNqi2Wr4pXZHKlzXHdq5qpitdSthjQuKYI3PrE6xjUnR
	DfnzvMbU2mkV0Xxlo/WdphmHEFcypU2YyIudC7Ag=
Content-Type: multipart/mixed; boundary="===============4862634862630015031=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] bash-completion: upgrading to 2.17.0 SUCCEEDED
Message-ID: <0101019a88628dde-e88c5276-91fe-4352-9887-8b2140d910af-000000@us-west-2.amazonses.com>
Date: Sat, 15 Nov 2025 16:39:11 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Nov 2025 16:39:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226444

--===============4862634862630015031==
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
From 6156e69e1011424882db6abdabadfbe29035fb77 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Nov 2025 15:49:12 +0000
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


--===============4862634862630015031==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-bash-completion-upgrade-2.16.0-2.17.0.patch"

RnJvbSA2MTU2ZTY5ZTEwMTE0MjQ4ODJkYjZhYmRhYmFkZmJlMjkwMzVmYjc3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgTm92IDIwMjUgMTU6NDk6MTIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBi
YXNoLWNvbXBsZXRpb246IHVwZ3JhZGUgMi4xNi4wIC0+IDIuMTcuMAoKLS0tCiAuLi4ve2Jhc2gt
Y29tcGxldGlvbl8yLjE2LjAuYmIgPT4gYmFzaC1jb21wbGV0aW9uXzIuMTcuMC5iYn0gICAgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtc3VwcG9ydC9iYXNoLWNvbXBsZXRpb24ve2Jhc2gtY29tcGxldGlvbl8y
LjE2LjAuYmIgPT4gYmFzaC1jb21wbGV0aW9uXzIuMTcuMC5iYn0gKDkyJSkKCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9iYXNoLWNvbXBsZXRpb24vYmFzaC1jb21wbGV0aW9uXzIu
MTYuMC5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2Jhc2gtY29tcGxldGlvbi9iYXNoLWNvbXBs
ZXRpb25fMi4xNy4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTIlCnJlbmFtZSBmcm9tIG1ldGEvcmVj
aXBlcy1zdXBwb3J0L2Jhc2gtY29tcGxldGlvbi9iYXNoLWNvbXBsZXRpb25fMi4xNi4wLmJiCnJl
bmFtZSB0byBtZXRhL3JlY2lwZXMtc3VwcG9ydC9iYXNoLWNvbXBsZXRpb24vYmFzaC1jb21wbGV0
aW9uXzIuMTcuMC5iYgppbmRleCBkMWE4ZjVlMGNjLi44NDNiNWI4MzFkIDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtc3VwcG9ydC9iYXNoLWNvbXBsZXRpb24vYmFzaC1jb21wbGV0aW9uXzIuMTYu
MC5iYgorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9iYXNoLWNvbXBsZXRpb24vYmFzaC1jb21w
bGV0aW9uXzIuMTcuMC5iYgpAQCAtMTQsNyArMTQsNyBAQCBTRUNUSU9OID0gImNvbnNvbGUvdXRp
bHMiCiAKIFNSQ19VUkkgPSAiJHtHSVRIVUJfQkFTRV9VUkl9L2Rvd25sb2FkLyR7UFZ9LyR7QlBO
fS0ke1BWfS50YXIueHoiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIzMzY5YmQ1ZTQxOGE3NWZi
OTkwODYzOTI1YWVkNWI0MjAzOThhY2ViYjMyMGVjNGMwMzA2YjNlYWUyM2YxMDdhIgorU1JDX1VS
SVtzaGEyNTZzdW1dID0gImRkOWQ4MjVlNDk2NDM1ZmIzYmViYTNhZTdiZWE5Zjc3ZTgyMWU4OTQ2
NjdkMDc0MzFkMWQ0YzhjNTcwYjllNTgiCiBHSVRIVUJfQkFTRV9VUkkgPSAiaHR0cHM6Ly9naXRo
dWIuY29tL3Njb3AvYmFzaC1jb21wbGV0aW9uL3JlbGVhc2VzIgogCiBQQVJBTExFTF9NQUtFID0g
IiIKLS0gCjIuNDcuMQoK

--===============4862634862630015031==
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
packages/x86-64-v3-poky-linux/bash-completion/bash-completion-extra: PKGV changed from 2.16.0 [default] to 2.17.0 [default]
packages/x86-64-v3-poky-linux/bash-completion/bash-completion-extra: FILELIST: removed "/usr/share/bash-completion/completions/secret-tool", added "/usr/share/bash-completion/completions/_shtab /usr/share/bash-completion/completions/_bombadil /usr/share/bash-completion/completions/_trash-put /usr/share/bash-completion/completions/brave-browser /usr/share/bash-completion/completions/_trash-empty /usr/share/bash-completion/completions/fsnotifywait /usr/share/bash-completion/completions/_mado /usr/share/bash-completion/completions/tmux /usr/share/bash-completion/completions/_trash /usr/share/bash-completion/completions/cksum /usr/share/bash-completion/completions/_glab /usr/share/bash-completion/completions/_gomarklint /usr/share/bash-completion/completions/_asdf /usr/share/bash-completion/completions/_trash-list /usr/share/bash-completion/completions/_secret-tool /usr/share/bash-completion/completions/free /usr/share/bash-completion/completions/_trash-restore /usr/share/bash-completion
 /completions/_tldr /usr/share/bash-completion/completions/nload /usr/share/bash-completion/completions/_glances /usr/share/bash-completion/completions/_diffoci /usr/share/bash-completion/completions/fsnotifywatch /usr/share/bash-completion/completions/brave"
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

--===============4862634862630015031==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/bash-completion/bash-completion-extra: FILELIST: removed "/usr/share/bash-completion/completions/secret-tool", added "/usr/share/bash-completion/completions/_trash /usr/share/bash-completion/completions/tmux /usr/share/bash-completion/completions/_trash-empty /usr/share/bash-completion/completions/brave-browser /usr/share/bash-completion/completions/_trash-put /usr/share/bash-completion/completions/_gomarklint /usr/share/bash-completion/completions/nload /usr/share/bash-completion/completions/_mado /usr/share/bash-completion/completions/fsnotifywatch /usr/share/bash-completion/completions/_glab /usr/share/bash-completion/completions/_asdf /usr/share/bash-completion/completions/_secret-tool /usr/share/bash-completion/completions/_glances /usr/share/bash-completion/completions/_bombadil /usr/share/bash-completion/completions/cksum /usr/share/bash-completion/completions/free /usr/share/bash-completion/completions/_trash-list /usr/share/bash-completion/compl
 etions/_tldr /usr/share/bash-completion/completions/fsnotifywait /usr/share/bash-completion/completions/_shtab /usr/share/bash-completion/completions/_diffoci /usr/share/bash-completion/completions/brave /usr/share/bash-completion/completions/_trash-restore"

--===============4862634862630015031==--

