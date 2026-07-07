Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 061A0C44506
	for <webhook@archiver.kernel.org>; Tue,  7 Jul 2026 05:50:05 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.167393.1783403394067245227
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 22:49:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=NyRpJ+Rz;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=vBUBiKf0;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019f3b203dbb-4269ac51-0060-4537-84a0-188c5c83ce34-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1783403396;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=kRDA/bnA7cdNaSdqcWnFk6sTp44vPwHS8zlDV/ZOfq4=;
	b=NyRpJ+RzZNHy6jC/Ro6wQDWOHhxSPt0TiVww2odOmeDsSTPAm0XWV2KIUYRqRLcw
	Y4uHWBvz3IZfwHJahXml/dsB5JX1+Fb2suiH8vnz7xMCEptrhts91VModQEJZEusIEj
	XgnflgO8rPrAfO2e9UUy6H5TfjhI2mfBJlxxMRzc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1783403396;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=kRDA/bnA7cdNaSdqcWnFk6sTp44vPwHS8zlDV/ZOfq4=;
	b=vBUBiKf0DvtQOIo7qtW05mgdfMCJl8MIegQC1VRZ99UKP8aZUUlYEdaW/DDIxwFP
	MyklXw06XLE1EG74TJ2Ts9kpgEtcLIQA7X0J9n4dl7NXWHWqJSeJW6Dr0ItG1R9bQU+
	OtimSwd+LUPCh6nnkG59E4XvjT7h7qwkrvBO+cd0=
Content-Type: multipart/mixed; boundary="===============8913119665459618418=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] repo: upgrading to 2.65 SUCCEEDED
Message-ID: <0101019f3b203dbb-4269ac51-0060-4537-84a0-188c5c83ce34-000000@us-west-2.amazonses.com>
Date: Tue, 7 Jul 2026 05:49:56 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.07-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jul 2026 05:50:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240354

--===============8913119665459618418==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *repo* to *2.65* has Succeeded.

Next steps:
    - apply the patch: git am 0001-repo-upgrade-2.64-2.65.patch
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
From 05970058baef65afe43c9edddc4232c965acc4c8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 7 Jul 2026 05:49:49 +0000
Subject: [PATCH] repo: upgrade 2.64 -> 2.65

---
 meta/recipes-devtools/repo/{repo_2.64.bb => repo_2.65.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/repo/{repo_2.64.bb => repo_2.65.bb} (94%)

diff --git a/meta/recipes-devtools/repo/repo_2.64.bb b/meta/recipes-devtools/repo/repo_2.65.bb
similarity index 94%
rename from meta/recipes-devtools/repo/repo_2.64.bb
rename to meta/recipes-devtools/repo/repo_2.65.bb
index 8cbf223571..2a235b7ec5 100644
--- a/meta/recipes-devtools/repo/repo_2.64.bb
+++ b/meta/recipes-devtools/repo/repo_2.65.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main;tag=v${PV} \
            "
-SRCREV = "2d54384a5e59fddd0626ec091cc0ad11511d834e"
+SRCREV = "35bbf701d04de5c6a71937279bc3d16f6ce36808"
 
 MIRRORS += "git://gerrit.googlesource.com/git-repo.git git://github.com/GerritCodeReview/git-repo.git"
 
-- 
2.47.1


--===============8913119665459618418==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-repo-upgrade-2.64-2.65.patch"

RnJvbSAwNTk3MDA1OGJhZWY2NWFmZTQzYzllZGRkYzQyMzJjOTY1YWNjNGM4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgNyBKdWwgMjAyNiAwNTo0OTo0OSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHJl
cG86IHVwZ3JhZGUgMi42NCAtPiAyLjY1CgotLS0KIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9yZXBv
L3tyZXBvXzIuNjQuYmIgPT4gcmVwb18yLjY1LmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29s
cy9yZXBvL3tyZXBvXzIuNjQuYmIgPT4gcmVwb18yLjY1LmJifSAoOTQlKQoKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9yZXBvL3JlcG9fMi42NC5iYiBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9yZXBvL3JlcG9fMi42NS5iYgpzaW1pbGFyaXR5IGluZGV4IDk0JQpyZW5hbWUgZnJv
bSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcmVwby9yZXBvXzIuNjQuYmIKcmVuYW1lIHRvIG1ldGEv
cmVjaXBlcy1kZXZ0b29scy9yZXBvL3JlcG9fMi42NS5iYgppbmRleCA4Y2JmMjIzNTcxLi4yYTIz
NWI3ZWM1IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcmVwby9yZXBvXzIuNjQu
YmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JlcG8vcmVwb18yLjY1LmJiCkBAIC0xMSw3
ICsxMSw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTNiODNlZjk2
Mzg3ZjE0NjU1ZmM4NTRkZGMzYzZiZDU3IgogCiBTUkNfVVJJID0gImdpdDovL2dlcnJpdC5nb29n
bGVzb3VyY2UuY29tL2dpdC1yZXBvLmdpdDtwcm90b2NvbD1odHRwczticmFuY2g9bWFpbjt0YWc9
diR7UFZ9IFwKICAgICAgICAgICAgIgotU1JDUkVWID0gIjJkNTQzODRhNWU1OWZkZGQwNjI2ZWMw
OTFjYzBhZDExNTExZDgzNGUiCitTUkNSRVYgPSAiMzViYmY3MDFkMDRkZTVjNmE3MTkzNzI3OWJj
M2QxNmY2Y2UzNjgwOCIKIAogTUlSUk9SUyArPSAiZ2l0Oi8vZ2Vycml0Lmdvb2dsZXNvdXJjZS5j
b20vZ2l0LXJlcG8uZ2l0IGdpdDovL2dpdGh1Yi5jb20vR2Vycml0Q29kZVJldmlldy9naXQtcmVw
by5naXQiCiAKLS0gCjIuNDcuMQoK

--===============8913119665459618418==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/repo: SRC_URI changed from "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main;tag=v2.64" to "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main;tag=v2.65"
packages/x86-64-v3-poky-linux/repo: PV changed from "2.64" to "2.65"
packages/x86-64-v3-poky-linux/repo: PKGV changed from 2.64 [default] to 2.65 [default]
packages/x86-64-v3-poky-linux/repo/repo-dbg: PV changed from "2.64" to "2.65"
packages/x86-64-v3-poky-linux/repo/repo-dbg: PKGV changed from 2.64 [default] to 2.65 [default]
packages/x86-64-v3-poky-linux/repo/repo-dev: PV changed from "2.64" to "2.65"
packages/x86-64-v3-poky-linux/repo/repo-dev: PKGV changed from 2.64 [default] to 2.65 [default]
packages/x86-64-v3-poky-linux/repo/repo-doc: PV changed from "2.64" to "2.65"
packages/x86-64-v3-poky-linux/repo/repo-doc: PKGV changed from 2.64 [default] to 2.65 [default]
packages/x86-64-v3-poky-linux/repo/repo-locale: PV changed from "2.64" to "2.65"
packages/x86-64-v3-poky-linux/repo/repo-locale: PKGV changed from 2.64 [default] to 2.65 [default]
packages/x86-64-v3-poky-linux/repo/repo-src: PV changed from "2.64" to "2.65"
packages/x86-64-v3-poky-linux/repo/repo-src: PKGV changed from 2.64 [default] to 2.65 [default]
packages/x86-64-v3-poky-linux/repo/repo-staticdev: PV changed from "2.64" to "2.65"
packages/x86-64-v3-poky-linux/repo/repo-staticdev: PKGV changed from 2.64 [default] to 2.65 [default]
packages/x86-64-v3-poky-linux/repo/repo: PV changed from "2.64" to "2.65"
packages/x86-64-v3-poky-linux/repo/repo: PKGV changed from 2.64 [default] to 2.65 [default]
packages/x86-64-v3-poky-linux/repo/repo: PKGSIZE changed from 44984 to 45914 (+2%)

--===============8913119665459618418==--

