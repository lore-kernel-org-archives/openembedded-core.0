Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC932D5E14B
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:50 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17178.1765872128910473755
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=X9+U9H8U;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=ljlTOGCg;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019b262ee9b9-5fe2fb69-8ca8-40b1-9844-8ba459efdb16-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872167;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=5L+cORqR4eyw9dUm4NeMXFwNjhX3h90MK4mDegLAHPQ=;
	b=X9+U9H8UCUsxTJXMkvI28n7EsIrJqf+oy0jij96FRWX0kP/CbD3GOR4CE2KzbI7D
	mU940/dJ/5ot2Q+di4BFqGlsIsHSZ9oJvExNdaScIpOFWz9U9kB30/Mv4zVcmnBIIkD
	qpM5TC+nh0/qUSEsorTEAeophDu0rWQub4ugEvxU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872167;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=5L+cORqR4eyw9dUm4NeMXFwNjhX3h90MK4mDegLAHPQ=;
	b=ljlTOGCgmihtaqsWKfyvfQpZYYjp96v8j0o7CKNy5UaRoGmNoBs0mQMyrlQ3ZgAl
	RXOctK7mO53Pt6RqVWph2VvBy98nxnBaCxLABZrcgy6Opj2F19+t76HhAcZ47Fi3KMo
	Xlazwt7K2dXBcZtc2fdO0z5dqWQzNdrYDFGb60k4=
Content-Type: multipart/mixed; boundary="===============1560343349713231691=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] bash-completion: upgrading to 2.17.0 SUCCEEDED
Message-ID: <0101019b262ee9b9-5fe2fb69-8ca8-40b1-9844-8ba459efdb16-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:47 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227908

--===============1560343349713231691==
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
From 33df202ba49f7a8e7e133ef43d40b254d300fd7a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 16 Dec 2025 06:40:43 +0000
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


--===============1560343349713231691==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-bash-completion-upgrade-2.16.0-2.17.0.patch"

RnJvbSAzM2RmMjAyYmE0OWY3YThlN2UxMzNlZjQzZDQwYjI1NGQzMDBmZDdhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTYgRGVjIDIwMjUgMDY6NDA6NDMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBi
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

--===============1560343349713231691==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/bash-completion/bash-completion-extra: FILELIST: removed "/usr/share/bash-completion/completions/secret-tool", added "/usr/share/bash-completion/completions/brave-browser /usr/share/bash-completion/completions/brave /usr/share/bash-completion/completions/_diffoci /usr/share/bash-completion/completions/_trash-list /usr/share/bash-completion/completions/fsnotifywait /usr/share/bash-completion/completions/_bombadil /usr/share/bash-completion/completions/free /usr/share/bash-completion/completions/_tldr /usr/share/bash-completion/completions/_trash-put /usr/share/bash-completion/completions/_gomarklint /usr/share/bash-completion/completions/fsnotifywatch /usr/share/bash-completion/completions/_mado /usr/share/bash-completion/completions/cksum /usr/share/bash-completion/completions/_trash /usr/share/bash-completion/completions/_shtab /usr/share/bash-completion/completions/tmux /usr/share/bash-completion/completions/_asdf /usr/share/bash-completion/completions
 /_glances /usr/share/bash-completion/completions/nload /usr/share/bash-completion/completions/_glab /usr/share/bash-completion/completions/_trash-restore /usr/share/bash-completion/completions/_secret-tool /usr/share/bash-completion/completions/_trash-empty"

--===============1560343349713231691==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/bash-completion/bash-completion-dbg: PKGV changed from 2.16.0 [default] to 2.17.0 [default]
packages/x86-64-v3-poky-linux/bash-completion/bash-completion-dbg: PV changed from "2.16.0" to "2.17.0"
packages/x86-64-v3-poky-linux/bash-completion/bash-completion-dev: PKGV changed from 2.16.0 [default] to 2.17.0 [default]
packages/x86-64-v3-poky-linux/bash-completion/bash-completion-dev: PV changed from "2.16.0" to "2.17.0"
packages/x86-64-v3-poky-linux/bash-completion/bash-completion-doc: PKGV changed from 2.16.0 [default] to 2.17.0 [default]
packages/x86-64-v3-poky-linux/bash-completion/bash-completion-doc: PV changed from "2.16.0" to "2.17.0"
packages/x86-64-v3-poky-linux/bash-completion/bash-completion-extra: PKGSIZE changed from 894224 to 917819 (+3%)
packages/x86-64-v3-poky-linux/bash-completion/bash-completion-extra: FILELIST: removed "/usr/share/bash-completion/completions/secret-tool", added "/usr/share/bash-completion/completions/_trash-empty /usr/share/bash-completion/completions/_trash-put /usr/share/bash-completion/completions/_trash /usr/share/bash-completion/completions/free /usr/share/bash-completion/completions/_trash-list /usr/share/bash-completion/completions/_glances /usr/share/bash-completion/completions/_tldr /usr/share/bash-completion/completions/fsnotifywait /usr/share/bash-completion/completions/tmux /usr/share/bash-completion/completions/_secret-tool /usr/share/bash-completion/completions/fsnotifywatch /usr/share/bash-completion/completions/brave-browser /usr/share/bash-completion/completions/brave /usr/share/bash-completion/completions/_asdf /usr/share/bash-completion/completions/_trash-restore /usr/share/bash-completion/completions/nload /usr/share/bash-completion/completions/_diffoci /usr/share/bash-complet
 ion/completions/_gomarklint /usr/share/bash-completion/completions/_mado /usr/share/bash-completion/completions/_shtab /usr/share/bash-completion/completions/_glab /usr/share/bash-completion/completions/_bombadil /usr/share/bash-completion/completions/cksum"
packages/x86-64-v3-poky-linux/bash-completion/bash-completion-extra: PKGV changed from 2.16.0 [default] to 2.17.0 [default]
packages/x86-64-v3-poky-linux/bash-completion/bash-completion-extra: PV changed from "2.16.0" to "2.17.0"
packages/x86-64-v3-poky-linux/bash-completion/bash-completion-locale: PKGV changed from 2.16.0 [default] to 2.17.0 [default]
packages/x86-64-v3-poky-linux/bash-completion/bash-completion-locale: PV changed from "2.16.0" to "2.17.0"
packages/x86-64-v3-poky-linux/bash-completion/bash-completion-src: PKGV changed from 2.16.0 [default] to 2.17.0 [default]
packages/x86-64-v3-poky-linux/bash-completion/bash-completion-src: PV changed from "2.16.0" to "2.17.0"
packages/x86-64-v3-poky-linux/bash-completion/bash-completion-staticdev: PKGV changed from 2.16.0 [default] to 2.17.0 [default]
packages/x86-64-v3-poky-linux/bash-completion/bash-completion-staticdev: PV changed from "2.16.0" to "2.17.0"
packages/x86-64-v3-poky-linux/bash-completion/bash-completion: PKGSIZE changed from 145588 to 150458 (+3%)
packages/x86-64-v3-poky-linux/bash-completion/bash-completion: PKGV changed from 2.16.0 [default] to 2.17.0 [default]
packages/x86-64-v3-poky-linux/bash-completion/bash-completion: PV changed from "2.16.0" to "2.17.0"
packages/x86-64-v3-poky-linux/bash-completion: SRC_URI changed from "https://github.com/scop/bash-completion/releases/download/2.16.0/bash-completion-2.16.0.tar.xz" to "https://github.com/scop/bash-completion/releases/download/2.17.0/bash-completion-2.17.0.tar.xz"
packages/x86-64-v3-poky-linux/bash-completion: PKGV changed from 2.16.0 [default] to 2.17.0 [default]
packages/x86-64-v3-poky-linux/bash-completion: PV changed from "2.16.0" to "2.17.0"

--===============1560343349713231691==--

