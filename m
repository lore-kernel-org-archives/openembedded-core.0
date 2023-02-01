Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EBD0C77B7D
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 17:34:25 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.30001.1675272854585881066
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 09:34:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=LETBDNsF;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101860e0b185b-d50ba17d-fe1f-4a9d-b2cd-8bc324f21665-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1675272853;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=VvAiftsM3YbJcacDjJINOBA1SgTVEt4fna2RFuddkdU=;
	b=LETBDNsF+IrO+LoxTAWjUPshKr9ueNDKv+b5mOZC8le9ZGFUz30NzEkginBfH1ud
	KtYoY59QBX2qttR0un6hiiBMtGmN0hF4pHfeOW45eN0Oq4VR/10HcsFnR46tCHzXO12
	Vau9YZJSF/mVTTrt4qQaX4BNoZU+dp2nohlcB0Uw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1675272853;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=VvAiftsM3YbJcacDjJINOBA1SgTVEt4fna2RFuddkdU=;
	b=EYhPw5pTY0wLX5wxuW3CuvtwaViMcGA2DVdVJS3h4QsqWg9u9VegLtMCkb1ud084
	dqcGrlnIOpu4CllmJw2m61+FIS9kFoOXbe2NYqItmdj1x03WYIVsXGU1AJFZWPHagGB
	Ja0Qmq1QIlexKqHswCwVjX+Bzpv7K5e67ytK2M/E=
Content-Type: multipart/mixed; boundary="===============1114841426619355557=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] btrfs-tools: upgrading to 6.1.3 SUCCEEDED
Message-ID: <010101860e0b185b-d50ba17d-fe1f-4a9d-b2cd-8bc324f21665-000000@us-west-2.amazonses.com>
Date: Wed, 1 Feb 2023 17:34:13 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.02.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 17:34:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176580

--===============1114841426619355557==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *btrfs-tools* to *6.1.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-btrfs-tools-upgrade-6.1.2-6.1.3.patch
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
--===============1114841426619355557==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-btrfs-tools-upgrade-6.1.2-6.1.3.patch"

RnJvbSA4OGI3Mjg0Y2JiOWNhMTkyOTliMjBjYjZmODA3ZDE1N2NiYzM3YjQyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBGZWIgMjAyMyAwODoxODowNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGJ0
cmZzLXRvb2xzOiB1cGdyYWRlIDYuMS4yIC0+IDYuMS4zCgotLS0KIC4uLi9idHJmcy10b29scy97
YnRyZnMtdG9vbHNfNi4xLjIuYmIgPT4gYnRyZnMtdG9vbHNfNi4xLjMuYmJ9ICB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1kZXZ0b29scy9idHJmcy10b29scy97YnRyZnMtdG9vbHNfNi4xLjIuYmIgPT4gYnRy
ZnMtdG9vbHNfNi4xLjMuYmJ9ICg5OCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2J0cmZzLXRvb2xzL2J0cmZzLXRvb2xzXzYuMS4yLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2J0cmZzLXRvb2xzL2J0cmZzLXRvb2xzXzYuMS4zLmJiCnNpbWlsYXJpdHkgaW5kZXggOTgl
CnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9idHJmcy10b29scy9idHJmcy10b29s
c182LjEuMi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2J0cmZzLXRvb2xzL2J0
cmZzLXRvb2xzXzYuMS4zLmJiCmluZGV4IGIxMGQ3ZWZkYjUuLmI0ZGZjNWIzZjMgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9idHJmcy10b29scy9idHJmcy10b29sc182LjEuMi5i
YgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYnRyZnMtdG9vbHMvYnRyZnMtdG9vbHNfNi4x
LjMuYmIKQEAgLTE5LDcgKzE5LDcgQEAgU1JDX1VSSSA9ICJnaXQ6Ly9naXQua2VybmVsLm9yZy9w
dWIvc2NtL2xpbnV4L2tlcm5lbC9naXQva2RhdmUvYnRyZnMtcHJvZ3MuZ2l0O2IKICAgICAgICAg
ICAgZmlsZTovLzAwMDEtQWRkLWEtcG9zc2liaWxpdHktdG8tc3BlY2lmeS13aGVyZS1weXRob24t
bW9kdWxlcy1hci5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLVVzZS1wcmVhZC1wd3Jp
dGUtZnRydW5jYXRlLXN0YXQtaW5zdGVhZC1vZi02NGJpdC1lcXUucGF0Y2ggXAogICAgICAgICAg
ICAiCi1TUkNSRVYgPSAiNjYwZDEwZDNmYjJlODc5MDlkMzc5YjBlYTNjNTI5MzQ1NDM0NTVjNyIK
K1NSQ1JFViA9ICI5MDhiNGI0NDUwMzIwZTMwZmRlZjY5M2YwOWI0MmY0ZWI5MzcwMmMzIgogUyA9
ICIke1dPUktESVJ9L2dpdCIKIAogUEFDS0FHRUNPTkZJRyA/Pz0gIiBcCi0tIAoyLjM3LjMKCg==

--===============1114841426619355557==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dbg: PKGSIZE changed from 17376468 to 17379772 (+0%)
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dbg: PKGV changed from 6.1.2 [default] to 6.1.3 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dbg: PV changed from "6.1.2" to "6.1.3"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dev: PKGV changed from 6.1.2 [default] to 6.1.3 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dev: PV changed from "6.1.2" to "6.1.3"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-doc: PKGV changed from 6.1.2 [default] to 6.1.3 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-doc: PV changed from "6.1.2" to "6.1.3"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-locale: PKGV changed from 6.1.2 [default] to 6.1.3 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-locale: PV changed from "6.1.2" to "6.1.3"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-src: PKGSIZE changed from 3738312 to 3740233 (+0%)
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-src: PKGV changed from 6.1.2 [default] to 6.1.3 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-src: PV changed from "6.1.2" to "6.1.3"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-staticdev: PKGV changed from 6.1.2 [default] to 6.1.3 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-staticdev: PV changed from "6.1.2" to "6.1.3"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools: PKGSIZE changed from 6148178 to 6156370 (+0%)
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools: PKGV changed from 6.1.2 [default] to 6.1.3 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools: PV changed from "6.1.2" to "6.1.3"
packages/core2-32-poky-linux/btrfs-tools: PKGV changed from 6.1.2 [default] to 6.1.3 [default]
packages/core2-32-poky-linux/btrfs-tools: PV changed from "6.1.2" to "6.1.3"
Changes to packages/core2-32-poky-linux/btrfs-tools (sysroot):
  /usr/lib/python3.11/site-packages/btrfsutil-6.1.2-py3.11.egg-info moved to /usr/lib/python3.11/site-packages/btrfsutil-6.1.3-py3.11.egg-info

--===============1114841426619355557==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/btrfs-tools (sysroot):
  /usr/lib/python3.11/site-packages/btrfsutil-6.1.2-py3.11.egg-info moved to /usr/lib/python3.11/site-packages/btrfsutil-6.1.3-py3.11.egg-info

--===============1114841426619355557==--

