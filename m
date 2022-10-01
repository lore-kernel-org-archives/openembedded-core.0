Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91F72C48BE6
	for <webhook@archiver.kernel.org>; Sat,  1 Oct 2022 16:53:53 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com
 (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.481.1664643226986642411
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Oct 2022 09:53:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=AKaRg5IS;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191,
 mailfrom: 010101839477da04-77f34158-bfca-4b88-a1a4-451ffa4ad62c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1664643226;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=uhr757DTphDDnge25sNriLVO05NliJFSyevMSmErwhE=;
	b=AKaRg5ISkGi5sCwwC/xeSePT21KwF6iAhaAyTaViq/+OfV7siPHxiLxWHQU7fb9Z
	nqjH0Fbx9FtDBsFY3rCeCHajz/zw1pbnUQA1ZZo3wMcE0OtPeyH3IeA4nheor9ftRZ4
	Z+bSK5pBYrPxZuezfbL1xe1W7FurA5b15xtE8DGU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1664643226;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=uhr757DTphDDnge25sNriLVO05NliJFSyevMSmErwhE=;
	b=Ivz5FBkv1cNOI/RQeDpv+reiRoeSrQu4d2TEJLbDKYFYf3Q9n2ld9ELh8wP0s7Ps
	mux6mSAM/3WV7wREwU/U/R5nRylr5LG+au+/GXjXOiYNk/U3TWaZoUXf9TfjnR1gUtG
	qobwxrzIzCWEbs6GJHChRHWNXx6r/4oHoKkPWqAk=
Content-Type: multipart/mixed; boundary="===============7809337816053279517=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] mmc-utils: upgrading to
 dfc3b6ecda84d21418fb4408b39c5c71db4c6458 SUCCEEDED
Message-ID: 
 <010101839477da04-77f34158-bfca-4b88-a1a4-451ffa4ad62c-000000@us-west-2.amazonses.com>
Date: Sat, 1 Oct 2022 16:53:46 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Oct 2022 16:53:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171269

--===============7809337816053279517==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *mmc-utils* to *dfc3b6ecda84d21418fb4408b39c5c71db4c6458* has Succeeded.

Next steps:
    - apply the patch: git am 0001-mmc-utils-upgrade-to-latest-revision.patch
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
--===============7809337816053279517==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/mmc-utils/mmc-utils-dbg: PKGV changed from 0.1+git0+d7b343fd26 to 0.1+git0+dfc3b6ecda
packages/core2-32-poky-linux/mmc-utils/mmc-utils-dev: PKGV changed from 0.1+git0+d7b343fd26 to 0.1+git0+dfc3b6ecda
packages/core2-32-poky-linux/mmc-utils/mmc-utils-doc: PKGV changed from 0.1+git0+d7b343fd26 to 0.1+git0+dfc3b6ecda
packages/core2-32-poky-linux/mmc-utils/mmc-utils-locale: PKGV changed from 0.1+git0+d7b343fd26 to 0.1+git0+dfc3b6ecda
packages/core2-32-poky-linux/mmc-utils/mmc-utils-src: PKGV changed from 0.1+git0+d7b343fd26 to 0.1+git0+dfc3b6ecda
packages/core2-32-poky-linux/mmc-utils/mmc-utils-staticdev: PKGV changed from 0.1+git0+d7b343fd26 to 0.1+git0+dfc3b6ecda
packages/core2-32-poky-linux/mmc-utils/mmc-utils: PKGV changed from 0.1+git0+d7b343fd26 to 0.1+git0+dfc3b6ecda

--===============7809337816053279517==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/mmc-utils: PKGV changed from 0.1+gitAUTOINC+d7b343fd26 [default] to 0.1+gitAUTOINC+dfc3b6ecda [default]
packages/core2-32-poky-linux/mmc-utils: PV changed from "0.1+gitAUTOINC+d7b343fd26" to "0.1+gitAUTOINC+dfc3b6ecda"
packages/core2-32-poky-linux/mmc-utils/mmc-utils-dbg: PKGSIZE changed from 229664 to 229088 (-0%)
packages/core2-32-poky-linux/mmc-utils/mmc-utils-dbg: PKGV changed from 0.1+git0+d7b343fd26 to 0.1+git0+dfc3b6ecda
packages/core2-32-poky-linux/mmc-utils/mmc-utils-dbg: PV changed from "0.1+gitAUTOINC+d7b343fd26" to "0.1+gitAUTOINC+dfc3b6ecda"
packages/core2-32-poky-linux/mmc-utils/mmc-utils-dev: PKGV changed from 0.1+git0+d7b343fd26 to 0.1+git0+dfc3b6ecda
packages/core2-32-poky-linux/mmc-utils/mmc-utils-dev: PV changed from "0.1+gitAUTOINC+d7b343fd26" to "0.1+gitAUTOINC+dfc3b6ecda"
packages/core2-32-poky-linux/mmc-utils/mmc-utils-doc: PKGV changed from 0.1+git0+d7b343fd26 to 0.1+git0+dfc3b6ecda
packages/core2-32-poky-linux/mmc-utils/mmc-utils-doc: PV changed from "0.1+gitAUTOINC+d7b343fd26" to "0.1+gitAUTOINC+dfc3b6ecda"
packages/core2-32-poky-linux/mmc-utils/mmc-utils-locale: PKGV changed from 0.1+git0+d7b343fd26 to 0.1+git0+dfc3b6ecda
packages/core2-32-poky-linux/mmc-utils/mmc-utils-locale: PV changed from "0.1+gitAUTOINC+d7b343fd26" to "0.1+gitAUTOINC+dfc3b6ecda"
packages/core2-32-poky-linux/mmc-utils/mmc-utils-src: PKGSIZE changed from 210197 to 210191 (-0%)
packages/core2-32-poky-linux/mmc-utils/mmc-utils-src: PKGV changed from 0.1+git0+d7b343fd26 to 0.1+git0+dfc3b6ecda
packages/core2-32-poky-linux/mmc-utils/mmc-utils-src: PV changed from "0.1+gitAUTOINC+d7b343fd26" to "0.1+gitAUTOINC+dfc3b6ecda"
packages/core2-32-poky-linux/mmc-utils/mmc-utils-staticdev: PKGV changed from 0.1+git0+d7b343fd26 to 0.1+git0+dfc3b6ecda
packages/core2-32-poky-linux/mmc-utils/mmc-utils-staticdev: PV changed from "0.1+gitAUTOINC+d7b343fd26" to "0.1+gitAUTOINC+dfc3b6ecda"
packages/core2-32-poky-linux/mmc-utils/mmc-utils: PKGV changed from 0.1+git0+d7b343fd26 to 0.1+git0+dfc3b6ecda
packages/core2-32-poky-linux/mmc-utils/mmc-utils: PV changed from "0.1+gitAUTOINC+d7b343fd26" to "0.1+gitAUTOINC+dfc3b6ecda"

--===============7809337816053279517==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-mmc-utils-upgrade-to-latest-revision.patch"

RnJvbSA4MzA2ZDE2NjRjZjFmMzljMjk3MzdiMzJlZjcwNzZmMDgzNTFlYjYyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBPY3QgMjAyMiAwNzozOToyNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG1t
Yy11dGlsczogdXBncmFkZSB0byBsYXRlc3QgcmV2aXNpb24KCi0tLQogbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL21tYy9tbWMtdXRpbHNfZ2l0LmJiIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL21tYy9tbWMtdXRpbHNfZ2l0LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL21tYy9tbWMt
dXRpbHNfZ2l0LmJiCmluZGV4IDBiYjk0YWI5M2EuLmQ2ODU0NmYwMTUgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9tbWMvbW1jLXV0aWxzX2dpdC5iYgorKysgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvbW1jL21tYy11dGlsc19naXQuYmIKQEAgLTUsNyArNSw3IEBAIExJQ0VOU0Ug
PSAiR1BMLTIuMC1vbmx5IgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vbW1jLmM7YmVnaW5s
aW5lPTE7ZW5kbGluZT0yMDttZDU9ZmFlMzI3OTJlMjBmNGQyN2FkZTFjNWE3NjJkMTZiN2QiCiAK
IFNSQ0JSQU5DSCA/PSAibWFzdGVyIgotU1JDUkVWID0gImQ3YjM0M2ZkMjYyODgwOTk0ZjA0MWNl
MjMzNTQ0MmU3YmQxMDcxZjUiCitTUkNSRVYgPSAiZGZjM2I2ZWNkYTg0ZDIxNDE4ZmI0NDA4YjM5
YzVjNzFkYjRjNjQ1OCIKIAogUFYgPSAiMC4xK2dpdCR7U1JDUFZ9IgogCi0tIAoyLjMxLjEKCg==

--===============7809337816053279517==--

