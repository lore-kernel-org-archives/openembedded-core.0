Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 927C5C67871
	for <webhook@archiver.kernel.org>; Sun,  1 Jan 2023 20:46:18 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.20187.1672605968412187663
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jan 2023 12:46:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=RlChUJDC;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101856f15a48a-878f13de-706e-4e1c-8c62-f73a5f765815-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1672605967;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=2dsunNNk6C6KSDGftBU/1bzRO7+Uj2RoGdfrsZeaEAw=;
	b=RlChUJDCAjMBKzjWQBpvMoGjE3j55hQd/+YILxGzbHgZfIFm639FJQHIENXZVPX9
	c+kyI1p88Wiry/CTHYshLJvnwmvK3iRRKscmIcnRbs2xhud+taUkT75vtQKrtHOvueN
	oydamf0pVZgG8F8csrO1/TnRtugWN8gor1+TQ14A=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1672605967;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=2dsunNNk6C6KSDGftBU/1bzRO7+Uj2RoGdfrsZeaEAw=;
	b=iUbLeipw2EoQN0uzKJSFxev33WyOdMGqr7O/0USef5MZ92sLx1kzFhhWrNhAwNbj
	Xcs13s9p4L7iFjPvTCKlf9LNusf9daebF56lTinn8eLQNdXW7ePF4shcw54BhMV5DaM
	v66a+w2CqJ06Z1caETi/82zDK7kTBzp8z1hkQObg=
Content-Type: multipart/mixed; boundary="===============7355128743874145594=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] logrotate: upgrading to 3.21.0 SUCCEEDED
Message-ID: <010101856f15a48a-878f13de-706e-4e1c-8c62-f73a5f765815-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jan 2023 20:46:07 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.01.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 20:46:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175289

--===============7355128743874145594==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *logrotate* to *3.21.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-logrotate-upgrade-3.20.1-3.21.0.patch
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
--===============7355128743874145594==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-logrotate-upgrade-3.20.1-3.21.0.patch"

RnJvbSA3YTI5OGQ0ZjYzZDM0NWU0NDAyMzkwNmVkNmZhNzY5MTQ4NzRjM2UxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBKYW4gMjAyMyAxMjowNjozNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxv
Z3JvdGF0ZTogdXBncmFkZSAzLjIwLjEgLT4gMy4yMS4wCgotLS0KIC4uLi9sb2dyb3RhdGUve2xv
Z3JvdGF0ZV8zLjIwLjEuYmIgPT4gbG9ncm90YXRlXzMuMjEuMC5iYn0gICAgICB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1leHRlbmRlZC9sb2dyb3RhdGUve2xvZ3JvdGF0ZV8zLjIwLjEuYmIgPT4gbG9ncm90
YXRlXzMuMjEuMC5iYn0gKDk3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQv
bG9ncm90YXRlL2xvZ3JvdGF0ZV8zLjIwLjEuYmIgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbG9n
cm90YXRlL2xvZ3JvdGF0ZV8zLjIxLjAuYmIKc2ltaWxhcml0eSBpbmRleCA5NyUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xvZ3JvdGF0ZS9sb2dyb3RhdGVfMy4yMC4xLmJiCnJl
bmFtZSB0byBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbG9ncm90YXRlL2xvZ3JvdGF0ZV8zLjIxLjAu
YmIKaW5kZXggMDM0YzM3YjQyOS4uNGU0ZWExMDYyOCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWV4dGVuZGVkL2xvZ3JvdGF0ZS9sb2dyb3RhdGVfMy4yMC4xLmJiCisrKyBiL21ldGEvcmVjaXBl
cy1leHRlbmRlZC9sb2dyb3RhdGUvbG9ncm90YXRlXzMuMjEuMC5iYgpAQCAtMTIsNyArMTIsNyBA
QCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT1iMjM0ZWU0ZDY5ZjVmY2U0
NDg2YTgwZmRhZjRhNDI2MyIKIAogU1JDX1VSSSA9ICIke0dJVEhVQl9CQVNFX1VSSX0vZG93bmxv
YWQvJHtQVn0vJHtCUH0udGFyLnh6IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNzQyZjZkNmUx
OGVjZWZmYTQ5YTRiYWNkOTMzNjg2ZDNlNDI5MzFjZmNjZmI2OTRkN2Y2MzY5YjcwNGU1ZDA5NCIK
K1NSQ19VUklbc2hhMjU2c3VtXSA9ICI4ZmExMjAxNWUzYjg0MTVjMTIxZmM5YzBjYTUzYWE4NzJm
N2IwNzAyZjU0M2FmZGE3ZTMyYjZjNDkwMGY2NTE2IgogCiAjIFRoZXNlIENWRXMgYXJlIGRlYmlh
biwgZ2VudG9vIG9yIFNVU0Ugc3BlY2lmaWMgb24gdGhlIHdheSBsb2dyb3RhdGUgd2FzIGluc3Rh
bGxlZC91c2VkCiBDVkVfQ0hFQ0tfSUdOT1JFICs9ICJDVkUtMjAxMS0xNTQ4IENWRS0yMDExLTE1
NDkgQ1ZFLTIwMTEtMTU1MCIKLS0gCjIuMzcuMwoK

--===============7355128743874145594==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/logrotate: PKGV changed from 3.20.1 [default] to 3.21.0 [default]
packages/core2-32-poky-linux/logrotate: PV changed from "3.20.1" to "3.21.0"
packages/core2-32-poky-linux/logrotate: SRC_URI changed from "https://github.com/logrotate/logrotate/releases//download/3.20.1/logrotate-3.20.1.tar.xz" to "https://github.com/logrotate/logrotate/releases//download/3.21.0/logrotate-3.21.0.tar.xz"
packages/core2-32-poky-linux/logrotate/logrotate-dbg: PV changed from "3.20.1" to "3.21.0"
packages/core2-32-poky-linux/logrotate/logrotate-dbg: PKGSIZE changed from 148940 to 150036 (+1%)
packages/core2-32-poky-linux/logrotate/logrotate-dbg: PKGV changed from 3.20.1 [default] to 3.21.0 [default]
packages/core2-32-poky-linux/logrotate/logrotate-dev: PV changed from "3.20.1" to "3.21.0"
packages/core2-32-poky-linux/logrotate/logrotate-dev: PKGV changed from 3.20.1 [default] to 3.21.0 [default]
packages/core2-32-poky-linux/logrotate/logrotate-doc: PV changed from "3.20.1" to "3.21.0"
packages/core2-32-poky-linux/logrotate/logrotate-doc: PKGSIZE changed from 28425 to 28716 (+1%)
packages/core2-32-poky-linux/logrotate/logrotate-doc: PKGV changed from 3.20.1 [default] to 3.21.0 [default]
packages/core2-32-poky-linux/logrotate/logrotate-locale: PV changed from "3.20.1" to "3.21.0"
packages/core2-32-poky-linux/logrotate/logrotate-locale: PKGV changed from 3.20.1 [default] to 3.21.0 [default]
packages/core2-32-poky-linux/logrotate/logrotate-src: PV changed from "3.20.1" to "3.21.0"
packages/core2-32-poky-linux/logrotate/logrotate-src: PKGSIZE changed from 188300 to 189968 (+1%)
packages/core2-32-poky-linux/logrotate/logrotate-src: PKGV changed from 3.20.1 [default] to 3.21.0 [default]
packages/core2-32-poky-linux/logrotate/logrotate-staticdev: PV changed from "3.20.1" to "3.21.0"
packages/core2-32-poky-linux/logrotate/logrotate-staticdev: PKGV changed from 3.20.1 [default] to 3.21.0 [default]
packages/core2-32-poky-linux/logrotate/logrotate: PV changed from "3.20.1" to "3.21.0"
packages/core2-32-poky-linux/logrotate/logrotate: PKGV changed from 3.20.1 [default] to 3.21.0 [default]

--===============7355128743874145594==--

