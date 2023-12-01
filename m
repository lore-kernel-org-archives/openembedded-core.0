Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02042C25B07
	for <webhook@archiver.kernel.org>; Fri,  1 Dec 2023 13:14:59 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.22197.1701436491940841212
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Dec 2023 05:14:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=CenMBcHD;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=WvnNul0Z;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018c25848381-a19380b9-7535-4997-afc6-53c099545f13-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1701436490;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=9GjuWgPDiQN2nMpdFmQ5DFTM1/IYAB0FDuvajHSJwfE=;
	b=CenMBcHD4rlw5/SlgH5TpQ0a38YUmlEyylxOa4I7RhJbV6rFHOZwKOSimLKpkJaG
	tSiDpgiqJFX1qt5K+3wX71Ag3Eu2v5ixG5rK5LbcIIvT43cvuDilaimjAfi0j6WfaKt
	0E1wpIAavObbRUty4AbJVkRxXTlkXE6nSc3BI/7g=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1701436490;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=9GjuWgPDiQN2nMpdFmQ5DFTM1/IYAB0FDuvajHSJwfE=;
	b=WvnNul0ZJ68KbHK5HkbyLjoGcNdtrW81SgVQBhoaQiBs1oiUYgsbBZ8MLcmfVAom
	0Il/wv67VEjjm8hPN3DI821HH3SAKMO5+n2Zr7+bBXv61ZVZ+7JqVclZaZY88L/U1ZP
	GEeFyKqltql0U1geKa8zTyG87fMAnl9Wiwyrza3A=
Content-Type: multipart/mixed; boundary="===============4945636717760216770=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] btrfs-tools: upgrading to 6.6.2 SUCCEEDED
Message-ID: <0101018c25848381-a19380b9-7535-4997-afc6-53c099545f13-000000@us-west-2.amazonses.com>
Date: Fri, 1 Dec 2023 13:14:50 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.12.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Dec 2023 13:14:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191597

--===============4945636717760216770==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *btrfs-tools* to *6.6.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-btrfs-tools-upgrade-6.5.3-6.6.2.patch
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
From 68c77f6462ddda9193deb4675541f13d8ead92f8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Dec 2023 06:38:52 +0000
Subject: [PATCH] btrfs-tools: upgrade 6.5.3 -> 6.6.2

---
 .../btrfs-tools/{btrfs-tools_6.5.3.bb => btrfs-tools_6.6.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_6.5.3.bb => btrfs-tools_6.6.2.bb} (98%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.5.3.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.6.2.bb
similarity index 98%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_6.5.3.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_6.6.2.bb
index 873d5e7a14..43146a12dc 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.5.3.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.6.2.bb
@@ -18,7 +18,7 @@ DEPENDS = "util-linux zlib"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git;branch=master;protocol=https \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
            "
-SRCREV = "a45c360b64660477c726e192d9e92ceb73a50f80"
+SRCREV = "afa23d4e279ad24027269d6ca5309f894e6daa87"
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= " \
-- 
2.39.2


--===============4945636717760216770==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-dbg: PKGV changed from 6.5.3 [default] to 6.6.2 [default]
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-dbg: PV changed from "6.5.3" to "6.6.2"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-dbg: PKGSIZE changed from 24925904 to 24970432 (+0%)
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-dev: PKGV changed from 6.5.3 [default] to 6.6.2 [default]
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-dev: PV changed from "6.5.3" to "6.6.2"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-doc: PKGV changed from 6.5.3 [default] to 6.6.2 [default]
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-doc: PV changed from "6.5.3" to "6.6.2"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-locale: PKGV changed from 6.5.3 [default] to 6.6.2 [default]
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-locale: PV changed from "6.5.3" to "6.6.2"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-src: PKGV changed from 6.5.3 [default] to 6.6.2 [default]
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-src: PV changed from "6.5.3" to "6.6.2"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-src: PKGSIZE changed from 4123002 to 4130095 (+0%)
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-staticdev: PKGV changed from 6.5.3 [default] to 6.6.2 [default]
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-staticdev: PV changed from "6.5.3" to "6.6.2"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools: PKGV changed from 6.5.3 [default] to 6.6.2 [default]
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools: PV changed from "6.5.3" to "6.6.2"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools: PKGSIZE changed from 5751116 to 5771596 (+0%)
packages/core2-64-poky-linux/btrfs-tools: PKGV changed from 6.5.3 [default] to 6.6.2 [default]
packages/core2-64-poky-linux/btrfs-tools: PV changed from "6.5.3" to "6.6.2"
Changes to packages/core2-64-poky-linux/btrfs-tools (sysroot):
  /usr/lib/python3.11/site-packages/btrfsutil-6.5.3-py3.11.egg-info moved to /usr/lib/python3.11/site-packages/btrfsutil-6.6.2-py3.11.egg-info

--===============4945636717760216770==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/btrfs-tools (sysroot):
  /usr/lib/python3.11/site-packages/btrfsutil-6.5.3-py3.11.egg-info moved to /usr/lib/python3.11/site-packages/btrfsutil-6.6.2-py3.11.egg-info

--===============4945636717760216770==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-btrfs-tools-upgrade-6.5.3-6.6.2.patch"

RnJvbSA2OGM3N2Y2NDYyZGRkYTkxOTNkZWI0Njc1NTQxZjEzZDhlYWQ5MmY4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBEZWMgMjAyMyAwNjozODo1MiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGJ0
cmZzLXRvb2xzOiB1cGdyYWRlIDYuNS4zIC0+IDYuNi4yCgotLS0KIC4uLi9idHJmcy10b29scy97
YnRyZnMtdG9vbHNfNi41LjMuYmIgPT4gYnRyZnMtdG9vbHNfNi42LjIuYmJ9ICB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1kZXZ0b29scy9idHJmcy10b29scy97YnRyZnMtdG9vbHNfNi41LjMuYmIgPT4gYnRy
ZnMtdG9vbHNfNi42LjIuYmJ9ICg5OCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2J0cmZzLXRvb2xzL2J0cmZzLXRvb2xzXzYuNS4zLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2J0cmZzLXRvb2xzL2J0cmZzLXRvb2xzXzYuNi4yLmJiCnNpbWlsYXJpdHkgaW5kZXggOTgl
CnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9idHJmcy10b29scy9idHJmcy10b29s
c182LjUuMy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2J0cmZzLXRvb2xzL2J0
cmZzLXRvb2xzXzYuNi4yLmJiCmluZGV4IDg3M2Q1ZTdhMTQuLjQzMTQ2YTEyZGMgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9idHJmcy10b29scy9idHJmcy10b29sc182LjUuMy5i
YgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYnRyZnMtdG9vbHMvYnRyZnMtdG9vbHNfNi42
LjIuYmIKQEAgLTE4LDcgKzE4LDcgQEAgREVQRU5EUyA9ICJ1dGlsLWxpbnV4IHpsaWIiCiBTUkNf
VVJJID0gImdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9rZGF2
ZS9idHJmcy1wcm9ncy5naXQ7YnJhbmNoPW1hc3Rlcjtwcm90b2NvbD1odHRwcyBcCiAgICAgICAg
ICAgIGZpbGU6Ly8wMDAxLUFkZC1hLXBvc3NpYmlsaXR5LXRvLXNwZWNpZnktd2hlcmUtcHl0aG9u
LW1vZHVsZXMtYXIucGF0Y2ggXAogICAgICAgICAgICAiCi1TUkNSRVYgPSAiYTQ1YzM2MGI2NDY2
MDQ3N2M3MjZlMTkyZDllOTJjZWI3M2E1MGY4MCIKK1NSQ1JFViA9ICJhZmEyM2Q0ZTI3OWFkMjQw
MjcyNjlkNmNhNTMwOWY4OTRlNmRhYTg3IgogUyA9ICIke1dPUktESVJ9L2dpdCIKIAogUEFDS0FH
RUNPTkZJRyA/Pz0gIiBcCi0tIAoyLjM5LjIKCg==

--===============4945636717760216770==--

