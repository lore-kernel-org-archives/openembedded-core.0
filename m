Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12193C77B76
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 17:34:25 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.30352.1675272853925881843
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 09:34:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=GKDmpoZc;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101860e0b1dfc-23a4774f-585e-4a9c-81b3-890be8463a3c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1675272855;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=71dNBhQI/zxiZE5BPFVslmbogb0boK+8Rcf78q9rmG8=;
	b=GKDmpoZcxd4TFhcGLB8yRDmk3LPZwZ+R8cHwMSWX1wcmEeZTra3aCuqha2MOyYap
	AQxnnoD6BSkghFolwDdtHyA/BNd3qzbveX0ISzVY9uIaaxE2n9diftJDvoxKTdOPP/k
	fYGO4Sgba2xtUmA6JfBsr23CYTB+0VZw7y1aRmx8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1675272855;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=71dNBhQI/zxiZE5BPFVslmbogb0boK+8Rcf78q9rmG8=;
	b=C2mE5eBxB4wj3KeP3LBnwUFNcqaSvNw2P2gwZOEnChCqpwVcCwvzR+p2i31Y7roj
	Ih6qWqOc2dW/zIt7V2YDGh6SqZ6S+Sfw/xwksNSR6G1WDhRXCgdXGeV0Dk551m/aQFa
	j8Jk/PcA/xSqjEdHhfNuM7YMHvnZMNErgiDBKWfE=
Content-Type: multipart/mixed; boundary="===============2715803440336563410=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-requests: upgrading to 2.28.2 SUCCEEDED
Message-ID: <010101860e0b1dfc-23a4774f-585e-4a9c-81b3-890be8463a3c-000000@us-west-2.amazonses.com>
Date: Wed, 1 Feb 2023 17:34:15 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.02.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 17:34:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176598

--===============2715803440336563410==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-requests* to *2.28.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-requests-upgrade-2.28.1-2.28.2.patch
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
--===============2715803440336563410==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-requests-upgrade-2.28.1-2.28.2.patch"

RnJvbSBjNmM3M2EwOTI2ZWUxMjgzZTkyNTY0ZTBlZjVhNjYwMzliNGNhMzYzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBGZWIgMjAyMyAxMjo1NjozMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcmVxdWVzdHM6IHVwZ3JhZGUgMi4yOC4xIC0+IDIuMjguMgoKLS0tCiAuLi4ve3B5dGhv
bjMtcmVxdWVzdHNfMi4yOC4xLmJiID0+IHB5dGhvbjMtcmVxdWVzdHNfMi4yOC4yLmJifSAgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXJlcXVlc3RzXzIuMjguMS5i
YiA9PiBweXRob24zLXJlcXVlc3RzXzIuMjguMi5iYn0gKDg3JSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcmVxdWVzdHNfMi4yOC4xLmJiIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXJlcXVlc3RzXzIuMjguMi5iYgpzaW1p
bGFyaXR5IGluZGV4IDg3JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtcmVxdWVzdHNfMi4yOC4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtcmVxdWVzdHNfMi4yOC4yLmJiCmluZGV4IDhkZTA4ZDI2MjAuLjJm
Mzk3ZGRhYWQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1yZXF1ZXN0c18yLjI4LjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLXJlcXVlc3RzXzIuMjguMi5iYgpAQCAtMyw3ICszLDcgQEAgSE9NRVBBR0UgPSAiaHR0
cDovL3B5dGhvbi1yZXF1ZXN0cy5vcmciCiBMSUNFTlNFID0gIkFwYWNoZS0yLjAiCiBMSUNfRklM
RVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT0zNDQwMGI2ODA3MmQ3MTBmZWNkMGEyOTQw
YTBkMTY1OCIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjdjNTU5OWIxMDJmZWRkYWE2NjFjODI2
YzU2YWI0ZmVlMjhiZmQxN2Y1YWJjYTFlYmJlM2U3ZjE5ZDdjOTc5ODMiCitTUkNfVVJJW3NoYTI1
NnN1bV0gPSAiOThiMWIyNzgyZTNjNmM0OTA0OTM4Yjg0YzBlYjkzMjcyMTA2OWRmZGI5MTM0MzEz
YmVmZjdjODNjMmRmMjRiZiIKIAogaW5oZXJpdCBweXBpIHNldHVwdG9vbHMzCiAKLS0gCjIuMzcu
MwoK

--===============2715803440336563410==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-requests: SRC_URI changed from "https://files.pythonhosted.org/packages/source/r/requests/requests-2.28.1.tar.gz" to "https://files.pythonhosted.org/packages/source/r/requests/requests-2.28.2.tar.gz"
packages/core2-32-poky-linux/python3-requests: PV changed from "2.28.1" to "2.28.2"
packages/core2-32-poky-linux/python3-requests: PKGV changed from 2.28.1 [default] to 2.28.2 [default]
packages/core2-32-poky-linux/python3-requests/python3-requests-dbg: PV changed from "2.28.1" to "2.28.2"
packages/core2-32-poky-linux/python3-requests/python3-requests-dbg: PKGV changed from 2.28.1 [default] to 2.28.2 [default]
packages/core2-32-poky-linux/python3-requests/python3-requests-dev: PV changed from "2.28.1" to "2.28.2"
packages/core2-32-poky-linux/python3-requests/python3-requests-dev: PKGV changed from 2.28.1 [default] to 2.28.2 [default]
packages/core2-32-poky-linux/python3-requests/python3-requests-doc: PV changed from "2.28.1" to "2.28.2"
packages/core2-32-poky-linux/python3-requests/python3-requests-doc: PKGV changed from 2.28.1 [default] to 2.28.2 [default]
packages/core2-32-poky-linux/python3-requests/python3-requests-locale: PV changed from "2.28.1" to "2.28.2"
packages/core2-32-poky-linux/python3-requests/python3-requests-locale: PKGV changed from 2.28.1 [default] to 2.28.2 [default]
packages/core2-32-poky-linux/python3-requests/python3-requests-src: PV changed from "2.28.1" to "2.28.2"
packages/core2-32-poky-linux/python3-requests/python3-requests-src: PKGV changed from 2.28.1 [default] to 2.28.2 [default]
packages/core2-32-poky-linux/python3-requests/python3-requests-staticdev: PV changed from "2.28.1" to "2.28.2"
packages/core2-32-poky-linux/python3-requests/python3-requests-staticdev: PKGV changed from 2.28.1 [default] to 2.28.2 [default]
packages/core2-32-poky-linux/python3-requests/python3-requests: PV changed from "2.28.1" to "2.28.2"
packages/core2-32-poky-linux/python3-requests/python3-requests: PKGV changed from 2.28.1 [default] to 2.28.2 [default]
packages/core2-32-poky-linux/python3-requests/python3-requests: PKGSIZE changed from 418573 to 418565 (-0%)
Changes to packages/core2-32-poky-linux/python3-requests (sysroot):
  /usr/lib/python3.11/site-packages/requests-2.28.1.dist-info moved to /usr/lib/python3.11/site-packages/requests-2.28.2.dist-info

--===============2715803440336563410==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-requests (sysroot):
  /usr/lib/python3.11/site-packages/requests-2.28.1.dist-info moved to /usr/lib/python3.11/site-packages/requests-2.28.2.dist-info

--===============2715803440336563410==--

