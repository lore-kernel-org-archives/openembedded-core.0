Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C853ACD8C92
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 15:35:45 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1569.1780328137833093025
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 08:35:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=RtU6LymX;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=b8zxqYTc;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019e83d39876-acde18cd-7461-4fd0-ab47-0c6b4eb6282f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1780328143;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=jsOxp4LdTf6G8l7W6OP5iO1Fs0v7gDLV7ZkDPh3hu34=;
	b=RtU6LymXUAeyejOzuthh8TUtlIeMkoGBLoOADu1MhseE9siMkdywYSxsfKrqvgKu
	yWa+YdBNnTpceQ4icg/D9buEvn+1q5/Ff1Bt6ErTkNW25ZTMKFgXX200YVHxSI/mPXe
	iC7s0haXatWQgED8Lam5SRNgGXWO2dlVgEaY8DJA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1780328143;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=jsOxp4LdTf6G8l7W6OP5iO1Fs0v7gDLV7ZkDPh3hu34=;
	b=b8zxqYTcou3d+/usAKhBWpGaeiQdtqKj2EUnppkZ89BWdBCg02PxbzJ99xUUOcCN
	Z4Ar03J2MrvV1UIVHfNgway1JdM7VDoH8fGZ7Ysh3+E0j9RTM4goYiANaC1jQU2mAVX
	oDpSlGMZdzQLz/fCf+NBAIfd4DSjVqABYZOE0b4k=
Content-Type: multipart/mixed; boundary="===============5519155240178641650=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] repo: upgrading to 2.64 SUCCEEDED
Message-ID: <0101019e83d39876-acde18cd-7461-4fd0-ab47-0c6b4eb6282f-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jun 2026 15:35:43 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 15:35:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237895

--===============5519155240178641650==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *repo* to *2.64* has Succeeded.

Next steps:
    - apply the patch: git am 0001-repo-upgrade-2.63-2.64.patch
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
From 5fc107bcdf59df4af954437e43e519a36a0cd43c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jun 2026 09:52:00 +0000
Subject: [PATCH] repo: upgrade 2.63 -> 2.64

---
 meta/recipes-devtools/repo/{repo_2.63.bb => repo_2.64.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/repo/{repo_2.63.bb => repo_2.64.bb} (94%)

diff --git a/meta/recipes-devtools/repo/repo_2.63.bb b/meta/recipes-devtools/repo/repo_2.64.bb
similarity index 94%
rename from meta/recipes-devtools/repo/repo_2.63.bb
rename to meta/recipes-devtools/repo/repo_2.64.bb
index c3cb5a88a9..8cbf223571 100644
--- a/meta/recipes-devtools/repo/repo_2.63.bb
+++ b/meta/recipes-devtools/repo/repo_2.64.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main;tag=v${PV} \
            "
-SRCREV = "baa281d99e59dbf1447524e6fd95b384cadbc06e"
+SRCREV = "2d54384a5e59fddd0626ec091cc0ad11511d834e"
 
 MIRRORS += "git://gerrit.googlesource.com/git-repo.git git://github.com/GerritCodeReview/git-repo.git"
 
-- 
2.47.1


--===============5519155240178641650==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-repo-upgrade-2.63-2.64.patch"

RnJvbSA1ZmMxMDdiY2RmNTlkZjRhZjk1NDQzN2U0M2U1MTlhMzZhMGNkNDNjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKdW4gMjAyNiAwOTo1MjowMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHJl
cG86IHVwZ3JhZGUgMi42MyAtPiAyLjY0CgotLS0KIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9yZXBv
L3tyZXBvXzIuNjMuYmIgPT4gcmVwb18yLjY0LmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29s
cy9yZXBvL3tyZXBvXzIuNjMuYmIgPT4gcmVwb18yLjY0LmJifSAoOTQlKQoKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9yZXBvL3JlcG9fMi42My5iYiBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9yZXBvL3JlcG9fMi42NC5iYgpzaW1pbGFyaXR5IGluZGV4IDk0JQpyZW5hbWUgZnJv
bSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcmVwby9yZXBvXzIuNjMuYmIKcmVuYW1lIHRvIG1ldGEv
cmVjaXBlcy1kZXZ0b29scy9yZXBvL3JlcG9fMi42NC5iYgppbmRleCBjM2NiNWE4OGE5Li44Y2Jm
MjIzNTcxIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcmVwby9yZXBvXzIuNjMu
YmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JlcG8vcmVwb18yLjY0LmJiCkBAIC0xMSw3
ICsxMSw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTNiODNlZjk2
Mzg3ZjE0NjU1ZmM4NTRkZGMzYzZiZDU3IgogCiBTUkNfVVJJID0gImdpdDovL2dlcnJpdC5nb29n
bGVzb3VyY2UuY29tL2dpdC1yZXBvLmdpdDtwcm90b2NvbD1odHRwczticmFuY2g9bWFpbjt0YWc9
diR7UFZ9IFwKICAgICAgICAgICAgIgotU1JDUkVWID0gImJhYTI4MWQ5OWU1OWRiZjE0NDc1MjRl
NmZkOTViMzg0Y2FkYmMwNmUiCitTUkNSRVYgPSAiMmQ1NDM4NGE1ZTU5ZmRkZDA2MjZlYzA5MWNj
MGFkMTE1MTFkODM0ZSIKIAogTUlSUk9SUyArPSAiZ2l0Oi8vZ2Vycml0Lmdvb2dsZXNvdXJjZS5j
b20vZ2l0LXJlcG8uZ2l0IGdpdDovL2dpdGh1Yi5jb20vR2Vycml0Q29kZVJldmlldy9naXQtcmVw
by5naXQiCiAKLS0gCjIuNDcuMQoK

--===============5519155240178641650==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/repo: PV changed from "2.63" to "2.64"
packages/x86-64-v3-poky-linux/repo: PKGV changed from 2.63 [default] to 2.64 [default]
packages/x86-64-v3-poky-linux/repo: SRC_URI changed from "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main;tag=v2.63" to "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main;tag=v2.64"
packages/x86-64-v3-poky-linux/repo/repo-dbg: PV changed from "2.63" to "2.64"
packages/x86-64-v3-poky-linux/repo/repo-dbg: PKGV changed from 2.63 [default] to 2.64 [default]
packages/x86-64-v3-poky-linux/repo/repo-dev: PV changed from "2.63" to "2.64"
packages/x86-64-v3-poky-linux/repo/repo-dev: PKGV changed from 2.63 [default] to 2.64 [default]
packages/x86-64-v3-poky-linux/repo/repo-doc: PV changed from "2.63" to "2.64"
packages/x86-64-v3-poky-linux/repo/repo-doc: PKGV changed from 2.63 [default] to 2.64 [default]
packages/x86-64-v3-poky-linux/repo/repo-locale: PV changed from "2.63" to "2.64"
packages/x86-64-v3-poky-linux/repo/repo-locale: PKGV changed from 2.63 [default] to 2.64 [default]
packages/x86-64-v3-poky-linux/repo/repo-src: PV changed from "2.63" to "2.64"
packages/x86-64-v3-poky-linux/repo/repo-src: PKGV changed from 2.63 [default] to 2.64 [default]
packages/x86-64-v3-poky-linux/repo/repo-staticdev: PV changed from "2.63" to "2.64"
packages/x86-64-v3-poky-linux/repo/repo-staticdev: PKGV changed from 2.63 [default] to 2.64 [default]
packages/x86-64-v3-poky-linux/repo/repo: PV changed from "2.63" to "2.64"
packages/x86-64-v3-poky-linux/repo/repo: PKGV changed from 2.63 [default] to 2.64 [default]

--===============5519155240178641650==--

