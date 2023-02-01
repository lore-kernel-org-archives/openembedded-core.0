Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF3EEC7619A
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 17:34:24 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.30016.1675272856899636354
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 09:34:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=HNrrgYfz;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101860e0b2233-62c10727-7e83-4d3d-85ef-97cbe505d4ee-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1675272856;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=WIeYCAOdJOhfkZ5R667+ztlypsZRJO1/E2M86wDLt1c=;
	b=HNrrgYfzRmYMO+ve6iLqgR2j+7JSH/UrCgc2s8X/cGv9Pla6srt2/wnlfxh9qY33
	eYfdDtKfXcQqTQ/7ZKNkda73yETxCAAYNNE/XtT9Npfdj/9UAvYLc7/jdAktv7yOIP9
	zUT+rMK33w74ext4wVp/MH5RR9kok6MbOyETMSFs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1675272856;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=WIeYCAOdJOhfkZ5R667+ztlypsZRJO1/E2M86wDLt1c=;
	b=ah9TeWG9h+FFqPp8vmNN+x9EF8vBwh27MF9SeSGLOi6/L4JJERX7ubkcj2/4KkTh
	Tl4c2vhbeLxA5cwyPY+w1yQksl9bFxbxD7IyqIhQ3jOQfl4TSaYFpcnVT/OLe4Cgnvj
	kJ/jnpBd0SlTExYh8Bp3QdJrQByhgARZbV9VlXz4=
Content-Type: multipart/mixed; boundary="===============6878594262644803732=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] stress-ng: upgrading to 0.15.03 SUCCEEDED
Message-ID: <010101860e0b2233-62c10727-7e83-4d3d-85ef-97cbe505d4ee-000000@us-west-2.amazonses.com>
Date: Wed, 1 Feb 2023 17:34:16 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.02.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 17:34:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176615

--===============6878594262644803732==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *stress-ng* to *0.15.03* has Succeeded.

Next steps:
    - apply the patch: git am 0001-stress-ng-upgrade-0.15.02-0.15.03.patch
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
--===============6878594262644803732==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/stress-ng: PV changed from "0.15.02" to "0.15.03"
packages/core2-32-poky-linux/stress-ng: PKGV changed from 0.15.02 [default] to 0.15.03 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng-bash-completion: PV changed from "0.15.02" to "0.15.03"
packages/core2-32-poky-linux/stress-ng/stress-ng-bash-completion: PKGV changed from 0.15.02 [default] to 0.15.03 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng-dbg: PV changed from "0.15.02" to "0.15.03"
packages/core2-32-poky-linux/stress-ng/stress-ng-dbg: PKGV changed from 0.15.02 [default] to 0.15.03 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng-dbg: PKGSIZE changed from 7262008 to 7266656 (+0%)
packages/core2-32-poky-linux/stress-ng/stress-ng-dev: PV changed from "0.15.02" to "0.15.03"
packages/core2-32-poky-linux/stress-ng/stress-ng-dev: PKGV changed from 0.15.02 [default] to 0.15.03 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng-doc: PV changed from "0.15.02" to "0.15.03"
packages/core2-32-poky-linux/stress-ng/stress-ng-doc: PKGV changed from 0.15.02 [default] to 0.15.03 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng-doc: PKGSIZE changed from 69677 to 69749 (+0%)
packages/core2-32-poky-linux/stress-ng/stress-ng-locale: PV changed from "0.15.02" to "0.15.03"
packages/core2-32-poky-linux/stress-ng/stress-ng-locale: PKGV changed from 0.15.02 [default] to 0.15.03 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng-src: PV changed from "0.15.02" to "0.15.03"
packages/core2-32-poky-linux/stress-ng/stress-ng-src: PKGV changed from 0.15.02 [default] to 0.15.03 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng-src: PKGSIZE changed from 4319804 to 4325271 (+0%)
packages/core2-32-poky-linux/stress-ng/stress-ng-staticdev: PV changed from "0.15.02" to "0.15.03"
packages/core2-32-poky-linux/stress-ng/stress-ng-staticdev: PKGV changed from 0.15.02 [default] to 0.15.03 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng: PV changed from "0.15.02" to "0.15.03"
packages/core2-32-poky-linux/stress-ng/stress-ng: PKGV changed from 0.15.02 [default] to 0.15.03 [default]

--===============6878594262644803732==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-stress-ng-upgrade-0.15.02-0.15.03.patch"

RnJvbSAyY2M1YTA0MzdjMmRmMmI0MTEzYzFlMmNiZjRhOGViYjFmZWUwYjIyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBGZWIgMjAyMyAxNDoyNTowNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHN0
cmVzcy1uZzogdXBncmFkZSAwLjE1LjAyIC0+IDAuMTUuMDMKCi0tLQogLi4uL3N0cmVzcy1uZy97
c3RyZXNzLW5nXzAuMTUuMDIuYmIgPT4gc3RyZXNzLW5nXzAuMTUuMDMuYmJ9ICAgIHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWV4dGVuZGVkL3N0cmVzcy1uZy97c3RyZXNzLW5nXzAuMTUuMDIuYmIgPT4gc3Ry
ZXNzLW5nXzAuMTUuMDMuYmJ9ICg5NSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVu
ZGVkL3N0cmVzcy1uZy9zdHJlc3MtbmdfMC4xNS4wMi5iYiBiL21ldGEvcmVjaXBlcy1leHRlbmRl
ZC9zdHJlc3Mtbmcvc3RyZXNzLW5nXzAuMTUuMDMuYmIKc2ltaWxhcml0eSBpbmRleCA5NSUKcmVu
YW1lIGZyb20gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3N0cmVzcy1uZy9zdHJlc3MtbmdfMC4xNS4w
Mi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3N0cmVzcy1uZy9zdHJlc3Mtbmdf
MC4xNS4wMy5iYgppbmRleCA3NTQwMGY1ODllLi4xM2E4YjQ5ZjcwIDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtZXh0ZW5kZWQvc3RyZXNzLW5nL3N0cmVzcy1uZ18wLjE1LjAyLmJiCisrKyBiL21l
dGEvcmVjaXBlcy1leHRlbmRlZC9zdHJlc3Mtbmcvc3RyZXNzLW5nXzAuMTUuMDMuYmIKQEAgLTgs
NyArOCw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PWIyMzRlZTRk
NjlmNWZjZTQ0ODZhODBmZGFmNGE0MjYzIgogU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL0Nv
bGluSWFuS2luZy9zdHJlc3MtbmcuZ2l0O3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYXN0ZXIgXAog
ICAgICAgICAgICBmaWxlOi8vMDAwMS10ZXN0LWZsb2F0LU1ha2UtdmFyaWFibGVzLWdsb2JhbC5w
YXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLVBhc3MtTERfR09MRC0xLXZpYS1tYWtlZmls
ZS10by1lbmFibGUtZ29sZC1saW5rZXIucGF0Y2giCi1TUkNSRVYgPSAiNDE2NGY2ODQyYzcxMmMy
ZDlhMTM2MTljM2M3MGZkMzVkOGQwMmNkYiIKK1NSQ1JFViA9ICJmM2JlMDQ0N2MxMGZkNTY1MmI0
YzM3NTNkNTZiY2FhYzEzZmQ4OTE3IgogUyA9ICIke1dPUktESVJ9L2dpdCIKIAogREVQRU5EUyA9
ICJjb3JldXRpbHMtbmF0aXZlIGxpYmJzZCIKLS0gCjIuMzcuMwoK

--===============6878594262644803732==--

