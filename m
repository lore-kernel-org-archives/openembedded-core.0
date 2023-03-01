Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DD40C7EE45
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 14:45:18 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.24032.1677681915777755617
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Mar 2023 06:45:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=mi0WUSDH;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101869da273c3-bccad85a-252c-4ad3-bd0a-eb2677a0f9f7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1677681914;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=aJyRHDe7vkst0T3W+o9aVONB6/WkTmxA40LO2jqFqQ8=;
	b=mi0WUSDH6J95J+Xm4b6n4uBsL1iLUdgdIz3LAfkh36Wl+NWxEiaKyt4Lal23Rd6T
	nFzg1VHDh/xRmytfHBpqsguy6bpV/NJI7vqfUlGMrMd44mAHiSjKbbfT8tD/0+W2sK8
	7eNcWOEM1jE9EecOu7w690/S1SSg+gZLMdT2VkFM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1677681914;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=aJyRHDe7vkst0T3W+o9aVONB6/WkTmxA40LO2jqFqQ8=;
	b=ceBM2nMV0s0WdOPbRJkKHoSZij2HW2kdC7JwcGSeGHFSQ1kLkLum7Zfr4vqP38qv
	3FQrfMcjbi0fh43XmqCGuVhsmgGbNOYPOA5y8elY8or4xAwvBB13AoCTg/GzhmYa2r2
	XCUrljlpnAP9mSUbWKa6kgZudn3JO+MlFo3NoDMo=
Content-Type: multipart/mixed; boundary="===============7032745499109773122=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] font-util: upgrading to 1.4.0 SUCCEEDED
Message-ID: <010101869da273c3-bccad85a-252c-4ad3-bd0a-eb2677a0f9f7-000000@us-west-2.amazonses.com>
Date: Wed, 1 Mar 2023 14:45:14 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.03.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Mar 2023 14:45:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177926

--===============7032745499109773122==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *font-util* to *1.4.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-font-util-upgrade-1.3.3-1.4.0.patch
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
--===============7032745499109773122==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-font-util-upgrade-1.3.3-1.4.0.patch"

RnJvbSAzNmVhYmUyMTg4MGZiMTIwNGMwYWFmMjBlYjg1ODBiYzYyZDg2N2U5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBNYXIgMjAyMyAxMzo1NToyOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGZv
bnQtdXRpbDogdXBncmFkZSAxLjMuMyAtPiAxLjQuMAoKLS0tCiAuLi4veG9yZy1mb250L3tmb250
LXV0aWxfMS4zLjMuYmIgPT4gZm9udC11dGlsXzEuNC4wLmJifSAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3MveG9yZy1mb250L3tmb250LXV0aWxfMS4zLjMuYmIgPT4gZm9udC11dGls
XzEuNC4wLmJifSAoODklKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3Jn
LWZvbnQvZm9udC11dGlsXzEuMy4zLmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctZm9u
dC9mb250LXV0aWxfMS40LjAuYmIKc2ltaWxhcml0eSBpbmRleCA4OSUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctZm9udC9mb250LXV0aWxfMS4zLjMuYmIKcmVuYW1lIHRv
IG1ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWZvbnQvZm9udC11dGlsXzEuNC4wLmJiCmluZGV4
IDY0YzcwNTc3MGQuLmRiODIxMDRhZmUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGlj
cy94b3JnLWZvbnQvZm9udC11dGlsXzEuMy4zLmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGlj
cy94b3JnLWZvbnQvZm9udC11dGlsXzEuNC4wLmJiCkBAIC0xNiw3ICsxNiw3IEBAIFJERVBFTkRT
OiR7UE59OmNsYXNzLW5hdGl2ZSA9ICIiCiAKIEJCQ0xBU1NFWFRFTkQgPSAibmF0aXZlIgogCi1T
UkNfVVJJW3NoYTI1NnN1bV0gPSAiZTc5MWM4OTA3NzljNDAwNTZhYjYzYWFlZDVlMDMxYmI2ZTI4
OTBhOTg0MThjYTA5YzUzNGU2MjYxYTJlZWJkMiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI5Zjcy
NGJmOTQwMTI4YzdlMzlmNzI1MmJkOTYxY2QzOGNmYWMyMzU5ZGUyMTAwYThiZWQ2OTZiZjQwZDQw
ZjdkIgogCiBTWVNST09UX0RJUlNfSUdOT1JFOnJlbW92ZSA9ICIke2RhdGFkaXJ9L2ZvbnRzIgog
Ci0tIAoyLjM5LjIKCg==

--===============7032745499109773122==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/font-util/font-util-dbg: PV changed from "1.3.3" to "1.4.0"
packages/core2-32-poky-linux/font-util/font-util-dbg: PKGV changed from 1.3.3 [default] to 1.4.0 [default]
packages/core2-32-poky-linux/font-util/font-util-dev: PV changed from "1.3.3" to "1.4.0"
packages/core2-32-poky-linux/font-util/font-util-dev: PKGSIZE changed from 14377 to 14736 (+2%)
packages/core2-32-poky-linux/font-util/font-util-dev: PKGV changed from 1.3.3 [default] to 1.4.0 [default]
packages/core2-32-poky-linux/font-util/font-util-doc: PV changed from "1.3.3" to "1.4.0"
packages/core2-32-poky-linux/font-util/font-util-doc: PKGV changed from 1.3.3 [default] to 1.4.0 [default]
packages/core2-32-poky-linux/font-util/font-util-locale: PV changed from "1.3.3" to "1.4.0"
packages/core2-32-poky-linux/font-util/font-util-locale: PKGV changed from 1.3.3 [default] to 1.4.0 [default]
packages/core2-32-poky-linux/font-util/font-util-src: PV changed from "1.3.3" to "1.4.0"
packages/core2-32-poky-linux/font-util/font-util-src: PKGV changed from 1.3.3 [default] to 1.4.0 [default]
packages/core2-32-poky-linux/font-util/font-util-staticdev: PV changed from "1.3.3" to "1.4.0"
packages/core2-32-poky-linux/font-util/font-util-staticdev: PKGV changed from 1.3.3 [default] to 1.4.0 [default]
packages/core2-32-poky-linux/font-util/font-util: PV changed from "1.3.3" to "1.4.0"
packages/core2-32-poky-linux/font-util/font-util: PKGV changed from 1.3.3 [default] to 1.4.0 [default]
packages/core2-32-poky-linux/font-util: PV changed from "1.3.3" to "1.4.0"
packages/core2-32-poky-linux/font-util: PKGV changed from 1.3.3 [default] to 1.4.0 [default]
packages/core2-32-poky-linux/font-util: SRC_URI changed from "https://www.x.org/releases//individual/font/font-util-1.3.3.tar.xz" to "https://www.x.org/releases//individual/font/font-util-1.4.0.tar.xz"

--===============7032745499109773122==--

