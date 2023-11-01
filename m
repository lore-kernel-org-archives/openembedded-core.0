Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 405FFC001DD
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 14:25:27 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.8647.1698848703568689614
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 07:25:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Qf/Z2WxP;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=l7PVPIMg;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.192, mailfrom: 0101018b8b4603f0-45d58891-d96f-4d2a-a695-e58ea246d827-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1698848721;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=LoBZvxhfC3gRjzUId0MMn81Z+jjR1EHe7MX23DneIzw=;
	b=Qf/Z2WxPLX/tkVH+ihgP0Dx8bm+Y/Lc5L5HtzUxjZmFc5coVrfhXJtTZk8GZ65R3
	2OZF1j/qb71JBigewfOzaOMW5CLsjLPuV3smMx/2CTn5e5Wjttwdh/ChtRJ2jh/6BkL
	yANUAO5FwymFLrY60KyXsvCRd5UZcfGl2zNz97FU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1698848721;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=LoBZvxhfC3gRjzUId0MMn81Z+jjR1EHe7MX23DneIzw=;
	b=l7PVPIMgIdpOSNF9Ze8QnxBL0PEp+eFVPKQgXu0eDWhemxxUwdZS4pPnh0a+QYxy
	olLIJRlZEwUr1GegBiihWmIVDbmMMPjh38SguRRnxSUAMrk4ywcOOb8LQgnovMbAgil
	eZdtfjVLlqlpA6so3ubSA8chLP7ji+j8A6ms5TDY=
Content-Type: multipart/mixed; boundary="===============8503662023878567480=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-gitdb: upgrading to 4.0.11 SUCCEEDED
Message-ID: <0101018b8b4603f0-45d58891-d96f-4d2a-a695-e58ea246d827-000000@us-west-2.amazonses.com>
Date: Wed, 1 Nov 2023 14:25:03 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 14:25:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190039

--===============8503662023878567480==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-gitdb* to *4.0.11* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-gitdb-upgrade-4.0.10-4.0.11.patch
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
From f042dd6bd13434168e307f81170d5ad52a3c1f91 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Nov 2023 08:49:29 +0000
Subject: [PATCH] python3-gitdb: upgrade 4.0.10 -> 4.0.11

---
 .../python/{python3-gitdb_4.0.10.bb => python3-gitdb_4.0.11.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-gitdb_4.0.10.bb => python3-gitdb_4.0.11.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-gitdb_4.0.10.bb b/meta/recipes-devtools/python/python3-gitdb_4.0.11.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-gitdb_4.0.10.bb
rename to meta/recipes-devtools/python/python3-gitdb_4.0.11.bb
index 3a430c30f0..25e1a2df7e 100644
--- a/meta/recipes-devtools/python/python3-gitdb_4.0.10.bb
+++ b/meta/recipes-devtools/python/python3-gitdb_4.0.11.bb
@@ -10,7 +10,7 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = "gitdb"
 
-SRC_URI[sha256sum] = "6eb990b69df4e15bad899ea868dc46572c3f75339735663b81de79b06f17eb9a"
+SRC_URI[sha256sum] = "bf5421126136d6d0af55bc1e7c1af1c397a34f5b7bd79e776cd3e89785c2b04b"
 
 RDEPENDS:${PN} += "python3-compression \
                    python3-crypt \
-- 
2.39.2


--===============8503662023878567480==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-gitdb-upgrade-4.0.10-4.0.11.patch"

RnJvbSBmMDQyZGQ2YmQxMzQzNDE2OGUzMDdmODExNzBkNWFkNTJhM2MxZjkxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBOb3YgMjAyMyAwODo0OToyOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtZ2l0ZGI6IHVwZ3JhZGUgNC4wLjEwIC0+IDQuMC4xMQoKLS0tCiAuLi4vcHl0aG9uL3tw
eXRob24zLWdpdGRiXzQuMC4xMC5iYiA9PiBweXRob24zLWdpdGRiXzQuMC4xMS5iYn0gfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWdpdGRiXzQuMC4xMC5iYiA9PiBw
eXRob24zLWdpdGRiXzQuMC4xMS5iYn0gKDg2JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtZ2l0ZGJfNC4wLjEwLmJiIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLWdpdGRiXzQuMC4xMS5iYgpzaW1pbGFyaXR5IGluZGV4IDg2
JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtZ2l0ZGJf
NC4wLjEwLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
Z2l0ZGJfNC4wLjExLmJiCmluZGV4IDNhNDMwYzMwZjAuLjI1ZTFhMmRmN2UgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1naXRkYl80LjAuMTAuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWdpdGRiXzQuMC4xMS5iYgpA
QCAtMTAsNyArMTAsNyBAQCBpbmhlcml0IHB5cGkgc2V0dXB0b29sczMKIAogUFlQSV9QQUNLQUdF
ID0gImdpdGRiIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNmViOTkwYjY5ZGY0ZTE1YmFkODk5
ZWE4NjhkYzQ2NTcyYzNmNzUzMzk3MzU2NjNiODFkZTc5YjA2ZjE3ZWI5YSIKK1NSQ19VUklbc2hh
MjU2c3VtXSA9ICJiZjU0MjExMjYxMzZkNmQwYWY1NWJjMWU3YzFhZjFjMzk3YTM0ZjViN2JkNzll
Nzc2Y2QzZTg5Nzg1YzJiMDRiIgogCiBSREVQRU5EUzoke1BOfSArPSAicHl0aG9uMy1jb21wcmVz
c2lvbiBcCiAgICAgICAgICAgICAgICAgICAgcHl0aG9uMy1jcnlwdCBcCi0tIAoyLjM5LjIKCg==

--===============8503662023878567480==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-gitdb: SRC_URI changed from "https://files.pythonhosted.org/packages/source/g/gitdb/gitdb-4.0.10.tar.gz;downloadfilename=gitdb-4.0.10.tar.gz" to "https://files.pythonhosted.org/packages/source/g/gitdb/gitdb-4.0.11.tar.gz;downloadfilename=gitdb-4.0.11.tar.gz"
packages/core2-64-poky-linux/python3-gitdb: PV changed from "4.0.10" to "4.0.11"
packages/core2-64-poky-linux/python3-gitdb: PKGV changed from 4.0.10 [default] to 4.0.11 [default]
packages/core2-64-poky-linux/python3-gitdb/python3-gitdb-dbg: PV changed from "4.0.10" to "4.0.11"
packages/core2-64-poky-linux/python3-gitdb/python3-gitdb-dbg: PKGV changed from 4.0.10 [default] to 4.0.11 [default]
packages/core2-64-poky-linux/python3-gitdb/python3-gitdb-dev: PV changed from "4.0.10" to "4.0.11"
packages/core2-64-poky-linux/python3-gitdb/python3-gitdb-dev: PKGV changed from 4.0.10 [default] to 4.0.11 [default]
packages/core2-64-poky-linux/python3-gitdb/python3-gitdb-doc: PV changed from "4.0.10" to "4.0.11"
packages/core2-64-poky-linux/python3-gitdb/python3-gitdb-doc: PKGV changed from 4.0.10 [default] to 4.0.11 [default]
packages/core2-64-poky-linux/python3-gitdb/python3-gitdb-locale: PV changed from "4.0.10" to "4.0.11"
packages/core2-64-poky-linux/python3-gitdb/python3-gitdb-locale: PKGV changed from 4.0.10 [default] to 4.0.11 [default]
packages/core2-64-poky-linux/python3-gitdb/python3-gitdb-src: PV changed from "4.0.10" to "4.0.11"
packages/core2-64-poky-linux/python3-gitdb/python3-gitdb-src: PKGV changed from 4.0.10 [default] to 4.0.11 [default]
packages/core2-64-poky-linux/python3-gitdb/python3-gitdb-staticdev: PV changed from "4.0.10" to "4.0.11"
packages/core2-64-poky-linux/python3-gitdb/python3-gitdb-staticdev: PKGV changed from 4.0.10 [default] to 4.0.11 [default]
packages/core2-64-poky-linux/python3-gitdb/python3-gitdb: PV changed from "4.0.10" to "4.0.11"
packages/core2-64-poky-linux/python3-gitdb/python3-gitdb: PKGV changed from 4.0.10 [default] to 4.0.11 [default]
packages/core2-64-poky-linux/python3-gitdb/python3-gitdb: PKGSIZE changed from 406991 to 407178 (+0%)
Changes to packages/core2-64-poky-linux/python3-gitdb (sysroot):
  /usr/lib/python3.11/site-packages/gitdb-4.0.10.dist-info moved to /usr/lib/python3.11/site-packages/gitdb-4.0.11.dist-info

--===============8503662023878567480==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-gitdb (sysroot):
  /usr/lib/python3.11/site-packages/gitdb-4.0.10.dist-info moved to /usr/lib/python3.11/site-packages/gitdb-4.0.11.dist-info

--===============8503662023878567480==--

