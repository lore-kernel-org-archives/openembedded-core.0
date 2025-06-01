Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20252C7115A
	for <webhook@archiver.kernel.org>; Sun,  1 Jun 2025 13:55:45 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.27800.1748786140825598559
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jun 2025 06:55:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=UmLoXLXo;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=A+nCKaqk;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101972bc6d4f0-02340d3d-c653-4fb2-acdb-9cedf3436f6e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1748786140;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Kt5DCJmnaInzsrqZnx9vWThX39fJsZDuvkAjUK4sE3s=;
	b=UmLoXLXoYQuX8GrhfoXg2CcY/uVlauj/o3LTvJ4QkmTjalLHecBz4E/CKDo1DsdK
	owjcdNIkeKnIDSxD/lqDNKN+C4HUY+q8oG2YMEYXwFxK/jaoynRjfDZ6Vv0JD/BE/1y
	9re08rnYjz+Sko6wyM+upO1ZrS7lHwKnknN4Yq0o=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1748786140;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Kt5DCJmnaInzsrqZnx9vWThX39fJsZDuvkAjUK4sE3s=;
	b=A+nCKaqkJKwX+x8vbN7du/uK9Mg4R9fZd+Nam8cUyu5FAIB+d3VVWZPujDlHt+OQ
	K0Xt6lDLEeKusALzfBIWn11J745DVBqKsCYYf3LW/KdQFY50gudfv4fQlMJkz60NhYO
	BMPQzQqIepXYs02V2ggY3x4i3YxgdkjezVh8XkE4=
Content-Type: multipart/mixed; boundary="===============2129933653507264784=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] repo: upgrading to 2.55 SUCCEEDED
Message-ID: <010101972bc6d4f0-02340d3d-c653-4fb2-acdb-9cedf3436f6e-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jun 2025 13:55:40 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jun 2025 13:55:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217619

--===============2129933653507264784==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *repo* to *2.55* has Succeeded.

Next steps:
    - apply the patch: git am 0001-repo-upgrade-2.54-2.55.patch
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
From 279a5599836e15da6fcb4891d07fdb1439d40391 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Jun 2025 10:16:13 +0000
Subject: [PATCH] repo: upgrade 2.54 -> 2.55

---
 meta/recipes-devtools/repo/{repo_2.54.bb => repo_2.55.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/repo/{repo_2.54.bb => repo_2.55.bb} (94%)

diff --git a/meta/recipes-devtools/repo/repo_2.54.bb b/meta/recipes-devtools/repo/repo_2.55.bb
similarity index 94%
rename from meta/recipes-devtools/repo/repo_2.54.bb
rename to meta/recipes-devtools/repo/repo_2.55.bb
index 07ee583172..5fea49abb3 100644
--- a/meta/recipes-devtools/repo/repo_2.54.bb
+++ b/meta/recipes-devtools/repo/repo_2.55.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main;tag=v${PV} \
            "
-SRCREV = "97dc5c1bd9527c2abe2183b16a4b7ef037dc34a7"
+SRCREV = "08815ad3eb245872700201e03c47cb504d1dc3f9"
 
 MIRRORS += "git://gerrit.googlesource.com/git-repo.git git://github.com/GerritCodeReview/git-repo.git"
 
-- 
2.47.1


--===============2129933653507264784==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/repo: SRC_URI changed from "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main;tag=v2.54" to "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main;tag=v2.55"
packages/core2-64-poky-linux/repo: PKGV changed from 2.54 [default] to 2.55 [default]
packages/core2-64-poky-linux/repo: PV changed from "2.54" to "2.55"
packages/core2-64-poky-linux/repo/repo-dbg: PKGV changed from 2.54 [default] to 2.55 [default]
packages/core2-64-poky-linux/repo/repo-dbg: PV changed from "2.54" to "2.55"
packages/core2-64-poky-linux/repo/repo-dev: PKGV changed from 2.54 [default] to 2.55 [default]
packages/core2-64-poky-linux/repo/repo-dev: PV changed from "2.54" to "2.55"
packages/core2-64-poky-linux/repo/repo-doc: PKGV changed from 2.54 [default] to 2.55 [default]
packages/core2-64-poky-linux/repo/repo-doc: PV changed from "2.54" to "2.55"
packages/core2-64-poky-linux/repo/repo-locale: PKGV changed from 2.54 [default] to 2.55 [default]
packages/core2-64-poky-linux/repo/repo-locale: PV changed from "2.54" to "2.55"
packages/core2-64-poky-linux/repo/repo-src: PKGV changed from 2.54 [default] to 2.55 [default]
packages/core2-64-poky-linux/repo/repo-src: PV changed from "2.54" to "2.55"
packages/core2-64-poky-linux/repo/repo-staticdev: PKGV changed from 2.54 [default] to 2.55 [default]
packages/core2-64-poky-linux/repo/repo-staticdev: PV changed from "2.54" to "2.55"
packages/core2-64-poky-linux/repo/repo: PKGV changed from 2.54 [default] to 2.55 [default]
packages/core2-64-poky-linux/repo/repo: PV changed from "2.54" to "2.55"

--===============2129933653507264784==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-repo-upgrade-2.54-2.55.patch"

RnJvbSAyNzlhNTU5OTgzNmUxNWRhNmZjYjQ4OTFkMDdmZGIxNDM5ZDQwMzkxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBKdW4gMjAyNSAxMDoxNjoxMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHJl
cG86IHVwZ3JhZGUgMi41NCAtPiAyLjU1CgotLS0KIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9yZXBv
L3tyZXBvXzIuNTQuYmIgPT4gcmVwb18yLjU1LmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29s
cy9yZXBvL3tyZXBvXzIuNTQuYmIgPT4gcmVwb18yLjU1LmJifSAoOTQlKQoKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9yZXBvL3JlcG9fMi41NC5iYiBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9yZXBvL3JlcG9fMi41NS5iYgpzaW1pbGFyaXR5IGluZGV4IDk0JQpyZW5hbWUgZnJv
bSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcmVwby9yZXBvXzIuNTQuYmIKcmVuYW1lIHRvIG1ldGEv
cmVjaXBlcy1kZXZ0b29scy9yZXBvL3JlcG9fMi41NS5iYgppbmRleCAwN2VlNTgzMTcyLi41ZmVh
NDlhYmIzIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcmVwby9yZXBvXzIuNTQu
YmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JlcG8vcmVwb18yLjU1LmJiCkBAIC0xMSw3
ICsxMSw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTNiODNlZjk2
Mzg3ZjE0NjU1ZmM4NTRkZGMzYzZiZDU3IgogCiBTUkNfVVJJID0gImdpdDovL2dlcnJpdC5nb29n
bGVzb3VyY2UuY29tL2dpdC1yZXBvLmdpdDtwcm90b2NvbD1odHRwczticmFuY2g9bWFpbjt0YWc9
diR7UFZ9IFwKICAgICAgICAgICAgIgotU1JDUkVWID0gIjk3ZGM1YzFiZDk1MjdjMmFiZTIxODNi
MTZhNGI3ZWYwMzdkYzM0YTciCitTUkNSRVYgPSAiMDg4MTVhZDNlYjI0NTg3MjcwMDIwMWUwM2M0
N2NiNTA0ZDFkYzNmOSIKIAogTUlSUk9SUyArPSAiZ2l0Oi8vZ2Vycml0Lmdvb2dsZXNvdXJjZS5j
b20vZ2l0LXJlcG8uZ2l0IGdpdDovL2dpdGh1Yi5jb20vR2Vycml0Q29kZVJldmlldy9naXQtcmVw
by5naXQiCiAKLS0gCjIuNDcuMQoK

--===============2129933653507264784==--

