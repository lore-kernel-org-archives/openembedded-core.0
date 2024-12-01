Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27213E6689A
	for <webhook@archiver.kernel.org>; Sun,  1 Dec 2024 10:06:10 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.148759.1733047554007778549
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Dec 2024 02:06:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=VNvvfBIn;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=3CI/1u09;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019381af44b1-4f3bdaac-f214-4a31-b0f4-743d65f07343-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1733047567;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=qnB1Uuu5NWE0RyF7mJKawO+M67ZWKMdLhRjvg87Mo8c=;
	b=VNvvfBInqjCBIE7NHcXd6w5ItLYbgYRKxEXeKZyevktJff6axCG9hzzmOizEagir
	Wp9TdSri/+aYKKDluQ9E3f2lB1hxDxm1wovKnBVRCoM7v1qRwpVD5WTGpy9ThdxfhXP
	gfByrhO3QKXAgWeIDicDfBQ+T8NuAwIJyJpGvnHw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1733047567;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=qnB1Uuu5NWE0RyF7mJKawO+M67ZWKMdLhRjvg87Mo8c=;
	b=3CI/1u091Etb6Wuk857NvoizKbF9iu4ylEpjCEIC/1b3ZP5IyJB9vUjqFBatNChv
	xs5sq0u8TjuxaIHxecUn19yUhmQu4SS1Cr1glD954AXxmQZfyIm+Zxx6RdN/T9b8IRv
	0DwTBHlxuzb7ci0UP30C5B0s/8cjhqDJ/+8lTT+Q=
Content-Type: multipart/mixed; boundary="===============4279933550672859720=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] bash-completion: upgrading to 2.15.0 SUCCEEDED
Message-ID: <0101019381af44b1-4f3bdaac-f214-4a31-b0f4-743d65f07343-000000@us-west-2.amazonses.com>
Date: Sun, 1 Dec 2024 10:06:07 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.12.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Dec 2024 10:06:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208100

--===============4279933550672859720==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *bash-completion* to *2.15.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-bash-completion-upgrade-2.14.0-2.15.0.patch
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
From 2f2afc7d60f7afa1e4e2b443e5b62cd8727d65cc Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Dec 2024 09:16:39 +0000
Subject: [PATCH] bash-completion: upgrade 2.14.0 -> 2.15.0

---
 .../{bash-completion_2.14.0.bb => bash-completion_2.15.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/bash-completion/{bash-completion_2.14.0.bb => bash-completion_2.15.0.bb} (92%)

diff --git a/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb b/meta/recipes-support/bash-completion/bash-completion_2.15.0.bb
similarity index 92%
rename from meta/recipes-support/bash-completion/bash-completion_2.14.0.bb
rename to meta/recipes-support/bash-completion/bash-completion_2.15.0.bb
index 06c81beaa0..709443c067 100644
--- a/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb
+++ b/meta/recipes-support/bash-completion/bash-completion_2.15.0.bb
@@ -14,7 +14,7 @@ SECTION = "console/utils"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "5c7494f968280832d6adb5aa19f745a56f1a79df311e59338c5efa6f7285e168"
+SRC_URI[sha256sum] = "976a62ee6226970283cda85ecb9c7a4a88f62574c0a6f9e856126976decf1a06"
 GITHUB_BASE_URI = "https://github.com/scop/bash-completion/releases"
 
 PARALLEL_MAKE = ""
-- 
2.44.1


--===============4279933550672859720==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-bash-completion-upgrade-2.14.0-2.15.0.patch"

RnJvbSAyZjJhZmM3ZDYwZjdhZmExZTRlMmI0NDNlNWI2MmNkODcyN2Q2NWNjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBEZWMgMjAyNCAwOToxNjozOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGJh
c2gtY29tcGxldGlvbjogdXBncmFkZSAyLjE0LjAgLT4gMi4xNS4wCgotLS0KIC4uLi97YmFzaC1j
b21wbGV0aW9uXzIuMTQuMC5iYiA9PiBiYXNoLWNvbXBsZXRpb25fMi4xNS4wLmJifSAgICB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1l
IG1ldGEvcmVjaXBlcy1zdXBwb3J0L2Jhc2gtY29tcGxldGlvbi97YmFzaC1jb21wbGV0aW9uXzIu
MTQuMC5iYiA9PiBiYXNoLWNvbXBsZXRpb25fMi4xNS4wLmJifSAoOTIlKQoKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1zdXBwb3J0L2Jhc2gtY29tcGxldGlvbi9iYXNoLWNvbXBsZXRpb25fMi4x
NC4wLmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvYmFzaC1jb21wbGV0aW9uL2Jhc2gtY29tcGxl
dGlvbl8yLjE1LjAuYmIKc2ltaWxhcml0eSBpbmRleCA5MiUKcmVuYW1lIGZyb20gbWV0YS9yZWNp
cGVzLXN1cHBvcnQvYmFzaC1jb21wbGV0aW9uL2Jhc2gtY29tcGxldGlvbl8yLjE0LjAuYmIKcmVu
YW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2Jhc2gtY29tcGxldGlvbi9iYXNoLWNvbXBsZXRp
b25fMi4xNS4wLmJiCmluZGV4IDA2YzgxYmVhYTAuLjcwOTQ0M2MwNjcgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1zdXBwb3J0L2Jhc2gtY29tcGxldGlvbi9iYXNoLWNvbXBsZXRpb25fMi4xNC4w
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2Jhc2gtY29tcGxldGlvbi9iYXNoLWNvbXBs
ZXRpb25fMi4xNS4wLmJiCkBAIC0xNCw3ICsxNCw3IEBAIFNFQ1RJT04gPSAiY29uc29sZS91dGls
cyIKIAogU1JDX1VSSSA9ICIke0dJVEhVQl9CQVNFX1VSSX0vZG93bmxvYWQvJHtQVn0vJHtCUE59
LSR7UFZ9LnRhci54eiIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjVjNzQ5NGY5NjgyODA4MzJk
NmFkYjVhYTE5Zjc0NWE1NmYxYTc5ZGYzMTFlNTkzMzhjNWVmYTZmNzI4NWUxNjgiCitTUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiOTc2YTYyZWU2MjI2OTcwMjgzY2RhODVlY2I5YzdhNGE4OGY2MjU3NGMw
YTZmOWU4NTYxMjY5NzZkZWNmMWEwNiIKIEdJVEhVQl9CQVNFX1VSSSA9ICJodHRwczovL2dpdGh1
Yi5jb20vc2NvcC9iYXNoLWNvbXBsZXRpb24vcmVsZWFzZXMiCiAKIFBBUkFMTEVMX01BS0UgPSAi
IgotLSAKMi40NC4xCgo=

--===============4279933550672859720==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/bash-completion/bash-completion-extra: FILELIST: removed "/usr/share/bash-completion/completions/pkg_deinstall /usr/share/bash-completion/completions/rmmod /usr/share/bash-completion/completions/pkgutil /usr/share/bash-completion/completions/portinstall /usr/share/bash-completion/completions/modinfo /usr/share/bash-completion/completions/insmod.static /usr/share/bash-completion/completions/pkg_delete /usr/share/bash-completion/completions/freebsd-update /usr/share/bash-completion/completions/kldload /usr/share/bash-completion/completions/modprobe /usr/share/bash-completion/completions/portupgrade /usr/share/bash-completion/completions/pkg_info /usr/share/bash-completion/completions/insmod /usr/share/bash-completion/completions/kldunload /usr/share/bash-completion/completions/portsnap", added "/usr/share/bash-completion/completions/_nerdctl /usr/share/bash-completion/completions/_sops /usr/share/bash-completion/completions/pyvenv-3.13 /usr/share/bash-compl
 etion/completions/_uv /usr/share/bash-completion/completions/_uvx /usr/share/bash-completion/completions/_kata-runtime /usr/share/bash-completion/completions/fprintd-list /usr/share/bash-completion/completions/set /usr/share/bash-completion/completions/fprintd-enroll /usr/share/bash-completion/completions/_insmod /usr/share/bash-completion/completions/slabtop /usr/share/bash-completion/completions/_mtr /usr/share/bash-completion/completions/_insmod.static /usr/share/bash-completion/completions/fprintd-delete /usr/share/bash-completion/completions/fprintd-verify /usr/share/bash-completion/completions/python3.13 /usr/share/bash-completion/completions/_todoist /usr/share/bash-completion/completions/_ngrok /usr/share/bash-completion/completions/_rmmod /usr/share/bash-completion/completions/_modprobe /usr/share/bash-completion/completions/_modinfo"

--===============4279933550672859720==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/bash-completion/bash-completion-dbg: PV changed from "2.14.0" to "2.15.0"
packages/core2-64-poky-linux/bash-completion/bash-completion-dbg: PKGV changed from 2.14.0 [default] to 2.15.0 [default]
packages/core2-64-poky-linux/bash-completion/bash-completion-dev: PV changed from "2.14.0" to "2.15.0"
packages/core2-64-poky-linux/bash-completion/bash-completion-dev: PKGV changed from 2.14.0 [default] to 2.15.0 [default]
packages/core2-64-poky-linux/bash-completion/bash-completion-doc: PV changed from "2.14.0" to "2.15.0"
packages/core2-64-poky-linux/bash-completion/bash-completion-doc: PKGV changed from 2.14.0 [default] to 2.15.0 [default]
packages/core2-64-poky-linux/bash-completion/bash-completion-extra: PKGSIZE changed from 884853 to 884736 (-0%)
packages/core2-64-poky-linux/bash-completion/bash-completion-extra: PV changed from "2.14.0" to "2.15.0"
packages/core2-64-poky-linux/bash-completion/bash-completion-extra: FILELIST: removed "/usr/share/bash-completion/completions/modinfo /usr/share/bash-completion/completions/modprobe /usr/share/bash-completion/completions/pkgutil /usr/share/bash-completion/completions/freebsd-update /usr/share/bash-completion/completions/portinstall /usr/share/bash-completion/completions/portupgrade /usr/share/bash-completion/completions/portsnap /usr/share/bash-completion/completions/kldunload /usr/share/bash-completion/completions/kldload /usr/share/bash-completion/completions/insmod.static /usr/share/bash-completion/completions/pkg_info /usr/share/bash-completion/completions/rmmod /usr/share/bash-completion/completions/pkg_deinstall /usr/share/bash-completion/completions/pkg_delete /usr/share/bash-completion/completions/insmod", added "/usr/share/bash-completion/completions/_modprobe /usr/share/bash-completion/completions/_sops /usr/share/bash-completion/completions/fprintd-list /usr/share/bash-com
 pletion/completions/_modinfo /usr/share/bash-completion/completions/fprintd-delete /usr/share/bash-completion/completions/slabtop /usr/share/bash-completion/completions/python3.13 /usr/share/bash-completion/completions/_todoist /usr/share/bash-completion/completions/fprintd-enroll /usr/share/bash-completion/completions/set /usr/share/bash-completion/completions/fprintd-verify /usr/share/bash-completion/completions/_nerdctl /usr/share/bash-completion/completions/pyvenv-3.13 /usr/share/bash-completion/completions/_insmod /usr/share/bash-completion/completions/_mtr /usr/share/bash-completion/completions/_insmod.static /usr/share/bash-completion/completions/_uv /usr/share/bash-completion/completions/_ngrok /usr/share/bash-completion/completions/_rmmod /usr/share/bash-completion/completions/_kata-runtime /usr/share/bash-completion/completions/_uvx"
packages/core2-64-poky-linux/bash-completion/bash-completion-extra: PKGV changed from 2.14.0 [default] to 2.15.0 [default]
packages/core2-64-poky-linux/bash-completion/bash-completion-locale: PV changed from "2.14.0" to "2.15.0"
packages/core2-64-poky-linux/bash-completion/bash-completion-locale: PKGV changed from 2.14.0 [default] to 2.15.0 [default]
packages/core2-64-poky-linux/bash-completion/bash-completion-src: PV changed from "2.14.0" to "2.15.0"
packages/core2-64-poky-linux/bash-completion/bash-completion-src: PKGV changed from 2.14.0 [default] to 2.15.0 [default]
packages/core2-64-poky-linux/bash-completion/bash-completion-staticdev: PV changed from "2.14.0" to "2.15.0"
packages/core2-64-poky-linux/bash-completion/bash-completion-staticdev: PKGV changed from 2.14.0 [default] to 2.15.0 [default]
packages/core2-64-poky-linux/bash-completion/bash-completion: PKGSIZE changed from 140997 to 145373 (+3%)
packages/core2-64-poky-linux/bash-completion/bash-completion: PV changed from "2.14.0" to "2.15.0"
packages/core2-64-poky-linux/bash-completion/bash-completion: PKGV changed from 2.14.0 [default] to 2.15.0 [default]
packages/core2-64-poky-linux/bash-completion: SRC_URI changed from "https://github.com/scop/bash-completion/releases/download/2.14.0/bash-completion-2.14.0.tar.xz" to "https://github.com/scop/bash-completion/releases/download/2.15.0/bash-completion-2.15.0.tar.xz"
packages/core2-64-poky-linux/bash-completion: PV changed from "2.14.0" to "2.15.0"
packages/core2-64-poky-linux/bash-completion: PKGV changed from 2.14.0 [default] to 2.15.0 [default]

--===============4279933550672859720==--

