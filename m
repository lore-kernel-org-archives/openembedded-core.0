Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FDDCC88CBA
	for <webhook@archiver.kernel.org>; Sat,  1 Apr 2023 21:29:03 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.32120.1680384534420010403
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Apr 2023 14:28:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=bRnl2o1v;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101873eb9257f-19031104-a213-4b47-89f6-7ed40bf8a67e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1680384534;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=xiAyJzPrrwIV3bhyzt/7Wrt3pWjJ2ymXzjdQ5HnaulY=;
	b=bRnl2o1vVcb5VWzER3IRCdkU7LTgdveBlt7I2XJHA942RDeax4AUQDsUhXQva6K0
	/xIUJ3eTHdkY9J4cTBlgK6XWA44WawWrbmXUaFa1ecNvcazVU6F1tNUrYeZ7EnyOur+
	DBt8z38LOUGSwPiyOzNSPnwluu/22lEbvIhFyB9s=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1680384534;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=xiAyJzPrrwIV3bhyzt/7Wrt3pWjJ2ymXzjdQ5HnaulY=;
	b=kmfXWGGzS/e62RqXSzSfhLqc77wdU4v5AvcV8BUAbfEFQb/HuSaRnDbn1xiE9jwE
	wzmupFtGliD87GagJfTfya8NI5Yysy3fNwtg+Sxz2cp5PZIS7mQyPhe+ynuURnf2hUM
	63dARRMz+/c4Nx22JvVeOM58l5+60ATxlJpXpjB4=
Content-Type: multipart/mixed; boundary="===============7173507753290518620=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-installer: upgrading to 0.7.0 SUCCEEDED
Message-ID: <010101873eb9257f-19031104-a213-4b47-89f6-7ed40bf8a67e-000000@us-west-2.amazonses.com>
Date: Sat, 1 Apr 2023 21:28:53 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.04.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Apr 2023 21:29:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179489

--===============7173507753290518620==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-installer* to *0.7.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-installer-upgrade-0.6.0-0.7.0.patch
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
--===============7173507753290518620==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-installer: SRC_URI changed from "https://files.pythonhosted.org/packages/source/i/installer/installer-0.6.0.tar.gz;downloadfilename=installer-0.6.0.tar.gz file://interpreter.patch" to "https://files.pythonhosted.org/packages/source/i/installer/installer-0.7.0.tar.gz;downloadfilename=installer-0.7.0.tar.gz file://interpreter.patch"
packages/core2-32-poky-linux/python3-installer: PKGV changed from 0.6.0 [default] to 0.7.0 [default]
packages/core2-32-poky-linux/python3-installer: PV changed from "0.6.0" to "0.7.0"
packages/core2-32-poky-linux/python3-installer/python3-installer-dbg: PV changed from "0.6.0" to "0.7.0"
packages/core2-32-poky-linux/python3-installer/python3-installer-dbg: PKGV changed from 0.6.0 [default] to 0.7.0 [default]
packages/core2-32-poky-linux/python3-installer/python3-installer-dev: PV changed from "0.6.0" to "0.7.0"
packages/core2-32-poky-linux/python3-installer/python3-installer-dev: PKGV changed from 0.6.0 [default] to 0.7.0 [default]
packages/core2-32-poky-linux/python3-installer/python3-installer-doc: PV changed from "0.6.0" to "0.7.0"
packages/core2-32-poky-linux/python3-installer/python3-installer-doc: PKGV changed from 0.6.0 [default] to 0.7.0 [default]
packages/core2-32-poky-linux/python3-installer/python3-installer-locale: PV changed from "0.6.0" to "0.7.0"
packages/core2-32-poky-linux/python3-installer/python3-installer-locale: PKGV changed from 0.6.0 [default] to 0.7.0 [default]
packages/core2-32-poky-linux/python3-installer/python3-installer-src: PV changed from "0.6.0" to "0.7.0"
packages/core2-32-poky-linux/python3-installer/python3-installer-src: PKGV changed from 0.6.0 [default] to 0.7.0 [default]
packages/core2-32-poky-linux/python3-installer/python3-installer-staticdev: PV changed from "0.6.0" to "0.7.0"
packages/core2-32-poky-linux/python3-installer/python3-installer-staticdev: PKGV changed from 0.6.0 [default] to 0.7.0 [default]
packages/core2-32-poky-linux/python3-installer/python3-installer: PKGSIZE changed from 1012071 to 1026409 (+1%)
packages/core2-32-poky-linux/python3-installer/python3-installer: PV changed from "0.6.0" to "0.7.0"
packages/core2-32-poky-linux/python3-installer/python3-installer: PKGV changed from 0.6.0 [default] to 0.7.0 [default]
Changes to packages/core2-32-poky-linux/python3-installer (sysroot):
  /usr/lib/python3.11/site-packages/installer-0.6.0.dist-info moved to /usr/lib/python3.11/site-packages/installer-0.7.0.dist-info
Changes to packages/x86_64-linux/python3-installer-native (sysroot):
  /usr/lib/python3.11/site-packages/installer-0.6.0.dist-info moved to /usr/lib/python3.11/site-packages/installer-0.7.0.dist-info

--===============7173507753290518620==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-installer-upgrade-0.6.0-0.7.0.patch"

RnJvbSBjOGY0NjQ1NjVjMThkZTI3NjJlMzFiOWE3MjgzMmEyOTZmMGY0NjI4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBBcHIgMjAyMyAwOToyMjo0MCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtaW5zdGFsbGVyOiB1cGdyYWRlIDAuNi4wIC0+IDAuNy4wCgotLS0KIC4uLi97cHl0aG9u
My1pbnN0YWxsZXJfMC42LjAuYmIgPT4gcHl0aG9uMy1pbnN0YWxsZXJfMC43LjAuYmJ9ICB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1l
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtaW5zdGFsbGVyXzAuNi4wLmJi
ID0+IHB5dGhvbjMtaW5zdGFsbGVyXzAuNy4wLmJifSAoODklKQoKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1pbnN0YWxsZXJfMC42LjAuYmIgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaW5zdGFsbGVyXzAuNy4wLmJiCnNpbWls
YXJpdHkgaW5kZXggODklCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1pbnN0YWxsZXJfMC42LjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1pbnN0YWxsZXJfMC43LjAuYmIKaW5kZXggYTIxMzBhNDUwNy4uZDdm
MWU3OWE1YyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LWluc3RhbGxlcl8wLjYuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtaW5zdGFsbGVyXzAuNy4wLmJiCkBAIC04LDcgKzgsNyBAQCBMSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9MSUNFTlNFO21kNT01MDM4NjQxYWVjN2E3NzQ1MWUzMWRhODI4ZWJmYWUwMCIK
IAogU1JDX1VSSSArPSAiZmlsZTovL2ludGVycHJldGVyLnBhdGNoIgogCi1TUkNfVVJJW3NoYTI1
NnN1bV0gPSAiZjNiZDM2Y2QyNjFiNDQwYTg4YTExOTBiMWJlY2NhMDU3OGZlZTkwYjRiNjJkZWNj
Nzk2OTMyZmRkNWFlODgzOSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJhMjZkM2UzMTE2Mjg5YmIw
ODIxNmUwZDBmN2Q5MjVmY2VmMGIwMTk0ZWVkZmEwYzk0NGJjYWFhMTA2YzRiNjMxIgogCiBpbmhl
cml0IHB5cGkgcHl0aG9uX2ZsaXRfY29yZQogCi0tIAoyLjM5LjIKCg==

--===============7173507753290518620==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-installer (sysroot):
  /usr/lib/python3.11/site-packages/installer-0.6.0.dist-info moved to /usr/lib/python3.11/site-packages/installer-0.7.0.dist-info
Changes to packages/x86_64-linux/python3-installer-native (sysroot):
  /usr/lib/python3.11/site-packages/installer-0.6.0.dist-info moved to /usr/lib/python3.11/site-packages/installer-0.7.0.dist-info

--===============7173507753290518620==--

