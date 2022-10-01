Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67F39C38A2C
	for <webhook@archiver.kernel.org>; Sat,  1 Oct 2022 16:54:14 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com
 (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web12.421.1664643227615665943
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Oct 2022 09:53:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=PuIkkCDl;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192,
 mailfrom: 010101839477e413-4060ddec-7615-409e-a918-cb193facf01c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1664643228;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=7q86oKiKGJV6I2tMZr1nQQDxRkP81x7NDHD+G/qz+9Q=;
	b=PuIkkCDltoJgv4hR9tf39q8/eGkqOXYEeG1fY43EcJhhoBBg+mNYILHfyuQRdL2T
	fldmxHxsjWQUe69TFuU4JCEhe2MhT1hrQn9qHO8r1rXe5EiN8ProQCK29k2ti9nrYgL
	rAK2InqfdT4Bhvb8cPNJyQX+MJ/XgQT14ISLzrrk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1664643228;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=7q86oKiKGJV6I2tMZr1nQQDxRkP81x7NDHD+G/qz+9Q=;
	b=ElqQ+HMVVyesgPct9QS04kPyUsyFem3ET9fP97FUVk8WfMRRw/5lMd8mHMftEF7d
	9tMAOn5T8oZ2b4/5ROjLIDU1QfbxCIcxAOA50DfKHs3XbxQrGgSJQ9pUZQn6LlimOHO
	Cb9QeeHpLrhGwLmVliMYc672sTtcCioEHvvuvJWU=
Content-Type: multipart/mixed; boundary="===============3477351058420563977=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] lttng-ust: upgrading to 2.13.5 SUCCEEDED
Message-ID: 
 <010101839477e413-4060ddec-7615-409e-a918-cb193facf01c-000000@us-west-2.amazonses.com>
Date: Sat, 1 Oct 2022 16:53:48 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Oct 2022 16:54:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171304

--===============3477351058420563977==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *lttng-ust* to *2.13.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-lttng-ust-upgrade-2.13.4-2.13.5.patch
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
--===============3477351058420563977==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/lttng-ust: PKGV changed from 2.13.4 [default] to 2.13.5 [default]
packages/core2-32-poky-linux/lttng-ust: SRC_URI changed from "https://lttng.org/files/lttng-ust/lttng-ust-2.13.4.tar.bz2 file://0001-python-lttngust-Makefile.am-Add-install-lib-to-setup.patch file://0001-lttng-ust-common-link-with-liburcu-explicitly.patch file://0001-Makefile.am-update-rpath-link.patch" to "https://lttng.org/files/lttng-ust/lttng-ust-2.13.5.tar.bz2 file://0001-python-lttngust-Makefile.am-Add-install-lib-to-setup.patch file://0001-lttng-ust-common-link-with-liburcu-explicitly.patch file://0001-Makefile.am-update-rpath-link.patch"
packages/core2-32-poky-linux/lttng-ust: PV changed from "2.13.4" to "2.13.5"
packages/core2-32-poky-linux/lttng-ust/lttng-ust-bin: PKGV changed from 2.13.4 [default] to 2.13.5 [default]
packages/core2-32-poky-linux/lttng-ust/lttng-ust-bin: PV changed from "2.13.4" to "2.13.5"
packages/core2-32-poky-linux/lttng-ust/lttng-ust-dbg: PKGV changed from 2.13.4 [default] to 2.13.5 [default]
packages/core2-32-poky-linux/lttng-ust/lttng-ust-dbg: PKGSIZE changed from 3834772 to 3843380 (+0%)
packages/core2-32-poky-linux/lttng-ust/lttng-ust-dbg: PV changed from "2.13.4" to "2.13.5"
packages/core2-32-poky-linux/lttng-ust/lttng-ust-dev: PKGV changed from 2.13.4 [default] to 2.13.5 [default]
packages/core2-32-poky-linux/lttng-ust/lttng-ust-dev: PV changed from "2.13.4" to "2.13.5"
packages/core2-32-poky-linux/lttng-ust/lttng-ust-doc: PKGV changed from 2.13.4 [default] to 2.13.5 [default]
packages/core2-32-poky-linux/lttng-ust/lttng-ust-doc: PKGSIZE changed from 108117 to 108533 (+0%)
packages/core2-32-poky-linux/lttng-ust/lttng-ust-doc: PV changed from "2.13.4" to "2.13.5"
packages/core2-32-poky-linux/lttng-ust/lttng-ust-locale: PKGV changed from 2.13.4 [default] to 2.13.5 [default]
packages/core2-32-poky-linux/lttng-ust/lttng-ust-locale: PV changed from "2.13.4" to "2.13.5"
packages/core2-32-poky-linux/lttng-ust/lttng-ust-src: PKGV changed from 2.13.4 [default] to 2.13.5 [default]
packages/core2-32-poky-linux/lttng-ust/lttng-ust-src: PKGSIZE changed from 1517150 to 1525185 (+1%)
packages/core2-32-poky-linux/lttng-ust/lttng-ust-src: PV changed from "2.13.4" to "2.13.5"
packages/core2-32-poky-linux/lttng-ust/lttng-ust-staticdev: PKGV changed from 2.13.4 [default] to 2.13.5 [default]
packages/core2-32-poky-linux/lttng-ust/lttng-ust-staticdev: PV changed from "2.13.4" to "2.13.5"
packages/core2-32-poky-linux/lttng-ust/lttng-ust: PKGV changed from 2.13.4 [default] to 2.13.5 [default]
packages/core2-32-poky-linux/lttng-ust/lttng-ust: PKGSIZE changed from 1202430 to 1210622 (+1%)
packages/core2-32-poky-linux/lttng-ust/lttng-ust: PV changed from "2.13.4" to "2.13.5"

--===============3477351058420563977==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-lttng-ust-upgrade-2.13.4-2.13.5.patch"

RnJvbSBjMDRhN2I5OGRiNGQzZDczMGQyZDA4MzI1Y2JmZjY5YTAwMTQwZWY1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBPY3QgMjAyMiAxMzo1NDoxNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGx0
dG5nLXVzdDogdXBncmFkZSAyLjEzLjQgLT4gMi4xMy41CgotLS0KIC4uLi9sdHRuZy97bHR0bmct
dXN0XzIuMTMuNC5iYiA9PiBsdHRuZy11c3RfMi4xMy41LmJifSAgICAgICAgICB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1rZXJuZWwvbHR0bmcve2x0dG5nLXVzdF8yLjEzLjQuYmIgPT4gbHR0bmctdXN0XzIu
MTMuNS5iYn0gKDk1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMta2VybmVsL2x0dG5nL2x0
dG5nLXVzdF8yLjEzLjQuYmIgYi9tZXRhL3JlY2lwZXMta2VybmVsL2x0dG5nL2x0dG5nLXVzdF8y
LjEzLjUuYmIKc2ltaWxhcml0eSBpbmRleCA5NSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWtl
cm5lbC9sdHRuZy9sdHRuZy11c3RfMi4xMy40LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMta2Vy
bmVsL2x0dG5nL2x0dG5nLXVzdF8yLjEzLjUuYmIKaW5kZXggNTYyMDBhYzNlMS4uOTE2NDA4YmZm
MCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9sdHRuZy9sdHRuZy11c3RfMi4xMy40
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1rZXJuZWwvbHR0bmcvbHR0bmctdXN0XzIuMTMuNS5iYgpA
QCAtMzQsNyArMzQsNyBAQCBTUkNfVVJJID0gImh0dHBzOi8vbHR0bmcub3JnL2ZpbGVzL2x0dG5n
LXVzdC9sdHRuZy11c3QtJHtQVn0udGFyLmJ6MiBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLU1h
a2VmaWxlLmFtLXVwZGF0ZS1ycGF0aC1saW5rLnBhdGNoIFwKICAgICAgICAgICAgIgogCi1TUkNf
VVJJW3NoYTI1NnN1bV0gPSAiNjk4ZjgyZWM1ZGM1NmU5ODFjMGJiMDhjNDZlYmFiYWYzMWM2MGU4
NzdjMmUzNjViOWZkNmQzYTlmZmY4YjM5OCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJmMWQ3YmI0
OTg0YTNkYzVkYWNkM2I3YmNiNGMxMGMwNGIwNDFiMGVlY2Q3Y2JhMWZlZjNkOGY4NmFmZjAyYmQ2
IgogCiBDVkVfUFJPRFVDVCA9ICJ1c3QiCiAKLS0gCjIuMzEuMQoK

--===============3477351058420563977==--

