Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39C7BC2FC12
	for <webhook@archiver.kernel.org>; Sat, 15 Jul 2023 21:27:40 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.6021.1689456454372060342
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jul 2023 14:27:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=B+UdrTUi;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101895b73a782-1b106d8f-4688-44b1-b562-d48ad7b135c7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1689456453;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=PfGC4Ysb8azxggUvlhThugdl5q2XCGUjpusIqJyBmGM=;
	b=B+UdrTUiYKa8tC/eoiOqJm+1cp/rPmaza+qavXjy/HbgI/fCYG11QvRggFurw2qm
	3A3/vF6KPY+HrrfXYYDT7WxekH/W52Nlymjjpnqxn886pw4mQ/LHmoNuV94Os82SEdg
	U+Ad6g3atICVq4nfmefhdIviGiJjTas/4rXycuSM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1689456453;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=PfGC4Ysb8azxggUvlhThugdl5q2XCGUjpusIqJyBmGM=;
	b=mTsomc5+kL8+/4vLtX8v29Nuu2PKb0jTtED8kfOt11M1eZfqZ5DqV4OPtN7KPC4U
	3cdMk2f7MXkx69mQIkiglkRDOIioeuoMlpjeVDj9AlwZs1rkHjoSh6aZgn3gKEQab5j
	dHJcsxdY6iyeVDX3De53r8LN1aXxvNGYUCaqJ5ZQ=
Content-Type: multipart/mixed; boundary="===============6907320106768290823=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] btrfs-tools: upgrading to 6.3.2 SUCCEEDED
Message-ID: <010101895b73a782-1b106d8f-4688-44b1-b562-d48ad7b135c7-000000@us-west-2.amazonses.com>
Date: Sat, 15 Jul 2023 21:27:33 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.07.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jul 2023 21:27:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184330

--===============6907320106768290823==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *btrfs-tools* to *6.3.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-btrfs-tools-upgrade-6.3.1-6.3.2.patch
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
From 940a404791a461b94c836a08ccd07cb23daacc02 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Jul 2023 10:43:48 +0000
Subject: [PATCH] btrfs-tools: upgrade 6.3.1 -> 6.3.2

---
 .../btrfs-tools/{btrfs-tools_6.3.1.bb => btrfs-tools_6.3.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_6.3.1.bb => btrfs-tools_6.3.2.bb} (98%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.1.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.2.bb
similarity index 98%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.1.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.2.bb
index 0bdf48ded2..40af552c28 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.1.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.2.bb
@@ -18,7 +18,7 @@ DEPENDS = "util-linux zlib"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git;branch=master;protocol=https \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
            "
-SRCREV = "9d2c8c364a6b8df4b1a47ad384cd75fd4ba53e12"
+SRCREV = "d1d8fb4b599e76a3d6bc355df9e5787955104a72"
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= " \
-- 
2.39.2


--===============6907320106768290823==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dbg: PV changed from "6.3.1" to "6.3.2"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dbg: PKGSIZE changed from 21092772 to 21124064 (+0%)
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dbg: PKGV changed from 6.3.1 [default] to 6.3.2 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dev: PV changed from "6.3.1" to "6.3.2"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dev: PKGV changed from 6.3.1 [default] to 6.3.2 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-doc: PV changed from "6.3.1" to "6.3.2"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-doc: PKGV changed from 6.3.1 [default] to 6.3.2 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-locale: PV changed from "6.3.1" to "6.3.2"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-locale: PKGV changed from 6.3.1 [default] to 6.3.2 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-src: PV changed from "6.3.1" to "6.3.2"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-src: PKGSIZE changed from 3998178 to 3999113 (+0%)
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-src: PKGV changed from 6.3.1 [default] to 6.3.2 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-staticdev: PV changed from "6.3.1" to "6.3.2"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-staticdev: PKGV changed from 6.3.1 [default] to 6.3.2 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools: PV changed from "6.3.1" to "6.3.2"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools: PKGSIZE changed from 7012532 to 7024820 (+0%)
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools: PKGV changed from 6.3.1 [default] to 6.3.2 [default]
packages/core2-32-poky-linux/btrfs-tools: PV changed from "6.3.1" to "6.3.2"
packages/core2-32-poky-linux/btrfs-tools: PKGV changed from 6.3.1 [default] to 6.3.2 [default]
Changes to packages/core2-32-poky-linux/btrfs-tools (sysroot):
  /usr/lib/python3.11/site-packages/btrfsutil-6.3.1-py3.11.egg-info moved to /usr/lib/python3.11/site-packages/btrfsutil-6.3.2-py3.11.egg-info

--===============6907320106768290823==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/btrfs-tools (sysroot):
  /usr/lib/python3.11/site-packages/btrfsutil-6.3.1-py3.11.egg-info moved to /usr/lib/python3.11/site-packages/btrfsutil-6.3.2-py3.11.egg-info

--===============6907320106768290823==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-btrfs-tools-upgrade-6.3.1-6.3.2.patch"

RnJvbSA5NDBhNDA0NzkxYTQ2MWI5NGM4MzZhMDhjY2QwN2NiMjNkYWFjYzAyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgSnVsIDIwMjMgMTA6NDM6NDggKzAwMDAKU3ViamVjdDogW1BBVENIXSBi
dHJmcy10b29sczogdXBncmFkZSA2LjMuMSAtPiA2LjMuMgoKLS0tCiAuLi4vYnRyZnMtdG9vbHMv
e2J0cmZzLXRvb2xzXzYuMy4xLmJiID0+IGJ0cmZzLXRvb2xzXzYuMy4yLmJifSAgfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvYnRyZnMtdG9vbHMve2J0cmZzLXRvb2xzXzYuMy4xLmJiID0+IGJ0
cmZzLXRvb2xzXzYuMy4yLmJifSAoOTglKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9idHJmcy10b29scy9idHJmcy10b29sc182LjMuMS5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9idHJmcy10b29scy9idHJmcy10b29sc182LjMuMi5iYgpzaW1pbGFyaXR5IGluZGV4IDk4
JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvYnRyZnMtdG9vbHMvYnRyZnMtdG9v
bHNfNi4zLjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9idHJmcy10b29scy9i
dHJmcy10b29sc182LjMuMi5iYgppbmRleCAwYmRmNDhkZWQyLi40MGFmNTUyYzI4IDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYnRyZnMtdG9vbHMvYnRyZnMtdG9vbHNfNi4zLjEu
YmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2J0cmZzLXRvb2xzL2J0cmZzLXRvb2xzXzYu
My4yLmJiCkBAIC0xOCw3ICsxOCw3IEBAIERFUEVORFMgPSAidXRpbC1saW51eCB6bGliIgogU1JD
X1VSSSA9ICJnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQva2Rh
dmUvYnRyZnMtcHJvZ3MuZ2l0O2JyYW5jaD1tYXN0ZXI7cHJvdG9jb2w9aHR0cHMgXAogICAgICAg
ICAgICBmaWxlOi8vMDAwMS1BZGQtYS1wb3NzaWJpbGl0eS10by1zcGVjaWZ5LXdoZXJlLXB5dGhv
bi1tb2R1bGVzLWFyLnBhdGNoIFwKICAgICAgICAgICAgIgotU1JDUkVWID0gIjlkMmM4YzM2NGE2
YjhkZjRiMWE0N2FkMzg0Y2Q3NWZkNGJhNTNlMTIiCitTUkNSRVYgPSAiZDFkOGZiNGI1OTllNzZh
M2Q2YmMzNTVkZjllNTc4Nzk1NTEwNGE3MiIKIFMgPSAiJHtXT1JLRElSfS9naXQiCiAKIFBBQ0tB
R0VDT05GSUcgPz89ICIgXAotLSAKMi4zOS4yCgo=

--===============6907320106768290823==--

