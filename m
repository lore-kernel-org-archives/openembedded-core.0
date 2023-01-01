Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C7D0C71150
	for <webhook@archiver.kernel.org>; Sun,  1 Jan 2023 20:46:19 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.20668.1672605967397458402
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jan 2023 12:46:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=ESFLFygD;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101856f15a19d-d59481f0-2b04-4ee9-a520-4b76c420afea-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1672605966;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=IuoLm02xViTIeY8hvh0d7g2/YTWiAQrCtQfw8IcJwTM=;
	b=ESFLFygDhVNmcExq8qhWenDW2eKnNtrzgPWu6Bap5jqFPSkMmc+jrMxt0yFMgINi
	2t1h2bRmU10LreCU66eCkeqG7d0NdzSkRhs+eN3QqvnEeoyyqOByKFvk2Ns44n4MyNB
	mb55qVqRXbhj2AjnkWu3osF/FMllsbhMjPm/p8iQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1672605966;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=IuoLm02xViTIeY8hvh0d7g2/YTWiAQrCtQfw8IcJwTM=;
	b=IFhyO71YxsBVbf9V/McyhCCW1yZUH0TxSUGTpJ+Bo0HVpnOvxq6gAg4mmxW1qo4w
	99o9SmId6A8FwbNRvqIWNRFm1oFegx6qDZ9tE2yAo9IRia3K+RQXsZowd6Bui2thdu6
	g5bE+aNsZ4VXjOjFP9yDGvcKX3V7/jyZK9fXQYIk=
Content-Type: multipart/mixed; boundary="===============4818199164504826254=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pytz: upgrading to 2022.7 SUCCEEDED
Message-ID: <010101856f15a19d-d59481f0-2b04-4ee9-a520-4b76c420afea-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jan 2023 20:46:06 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.01.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 20:46:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175262

--===============4818199164504826254==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pytz* to *2022.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pytz-upgrade-2022.6-2022.7.patch
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
--===============4818199164504826254==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-pytz/python3-pytz: FILELIST: directory renamed /usr/lib/python3.11/site-packages/pytz-2022.6.dist-info -> /usr/lib/python3.11/site-packages/pytz-2022.7.dist-info, added "/usr/lib/python3.11/site-packages/pytz/zoneinfo/America/Ciudad_Juarez"
Changes to packages/core2-32-poky-linux/python3-pytz (sysroot):
  /usr/lib/python3.11/site-packages/pytz-2022.6.dist-info moved to /usr/lib/python3.11/site-packages/pytz-2022.7.dist-info
  /usr/lib/python3.11/site-packages/pytz/zoneinfo/America/Ciudad_Juarez was added

--===============4818199164504826254==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-pytz: PV changed from "2022.6" to "2022.7"
packages/core2-32-poky-linux/python3-pytz: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pytz/pytz-2022.6.tar.gz file://run-ptest" to "https://files.pythonhosted.org/packages/source/p/pytz/pytz-2022.7.tar.gz file://run-ptest"
packages/core2-32-poky-linux/python3-pytz: PKGV changed from 2022.6 [default] to 2022.7 [default]
packages/core2-32-poky-linux/python3-pytz/python3-pytz-dbg: PV changed from "2022.6" to "2022.7"
packages/core2-32-poky-linux/python3-pytz/python3-pytz-dbg: PKGV changed from 2022.6 [default] to 2022.7 [default]
packages/core2-32-poky-linux/python3-pytz/python3-pytz-dev: PV changed from "2022.6" to "2022.7"
packages/core2-32-poky-linux/python3-pytz/python3-pytz-dev: PKGV changed from 2022.6 [default] to 2022.7 [default]
packages/core2-32-poky-linux/python3-pytz/python3-pytz-doc: PV changed from "2022.6" to "2022.7"
packages/core2-32-poky-linux/python3-pytz/python3-pytz-doc: PKGV changed from 2022.6 [default] to 2022.7 [default]
packages/core2-32-poky-linux/python3-pytz/python3-pytz-locale: PV changed from "2022.6" to "2022.7"
packages/core2-32-poky-linux/python3-pytz/python3-pytz-locale: PKGV changed from 2022.6 [default] to 2022.7 [default]
packages/core2-32-poky-linux/python3-pytz/python3-pytz-ptest: PV changed from "2022.6" to "2022.7"
packages/core2-32-poky-linux/python3-pytz/python3-pytz-ptest: PKGV changed from 2022.6 [default] to 2022.7 [default]
packages/core2-32-poky-linux/python3-pytz/python3-pytz-ptest: PKGSIZE changed from 59021 to 59131 (+0%)
packages/core2-32-poky-linux/python3-pytz/python3-pytz-src: PV changed from "2022.6" to "2022.7"
packages/core2-32-poky-linux/python3-pytz/python3-pytz-src: PKGV changed from 2022.6 [default] to 2022.7 [default]
packages/core2-32-poky-linux/python3-pytz/python3-pytz-staticdev: PV changed from "2022.6" to "2022.7"
packages/core2-32-poky-linux/python3-pytz/python3-pytz-staticdev: PKGV changed from 2022.6 [default] to 2022.7 [default]
packages/core2-32-poky-linux/python3-pytz/python3-pytz: PV changed from "2022.6" to "2022.7"
packages/core2-32-poky-linux/python3-pytz/python3-pytz: FILELIST: directory renamed /usr/lib/python3.11/site-packages/pytz-2022.6.dist-info -> /usr/lib/python3.11/site-packages/pytz-2022.7.dist-info, added "/usr/lib/python3.11/site-packages/pytz/zoneinfo/America/Ciudad_Juarez"
packages/core2-32-poky-linux/python3-pytz/python3-pytz: PKGV changed from 2022.6 [default] to 2022.7 [default]
packages/core2-32-poky-linux/python3-pytz/python3-pytz: PKGSIZE changed from 1059616 to 1062320 (+0%)
Changes to packages/core2-32-poky-linux/python3-pytz (sysroot):
  /usr/lib/python3.11/site-packages/pytz-2022.6.dist-info moved to /usr/lib/python3.11/site-packages/pytz-2022.7.dist-info
  /usr/lib/python3.11/site-packages/pytz/zoneinfo/America/Ciudad_Juarez was added

--===============4818199164504826254==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pytz-upgrade-2022.6-2022.7.patch"

RnJvbSAyYWFiZjg0ZjcwNzAwNmUyYTY0NjI4ZGVlYzhjMzQ1YjQyNmM0MDdhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBKYW4gMjAyMyAxMDoyNjo1MCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcHl0ejogdXBncmFkZSAyMDIyLjYgLT4gMjAyMi43CgotLS0KIC4uLi9weXRob24ve3B5
dGhvbjMtcHl0el8yMDIyLjYuYmIgPT4gcHl0aG9uMy1weXR6XzIwMjIuNy5iYn0gICB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcHl0el8yMDIyLjYuYmIgPT4gcHl0
aG9uMy1weXR6XzIwMjIuNy5iYn0gKDg5JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHl0el8yMDIyLjYuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtcHl0el8yMDIyLjcuYmIKc2ltaWxhcml0eSBpbmRleCA4OSUKcmVu
YW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5dHpfMjAyMi42
LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHl0el8y
MDIyLjcuYmIKaW5kZXggOTYzMWY1OTI4OC4uYTZhNjljOGI1OSAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5dHpfMjAyMi42LmJiCisrKyBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weXR6XzIwMjIuNy5iYgpAQCAtNSw3ICs1
LDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRS50eHQ7bWQ1PTFhNjdmYzQ2
YzFiNTk2Y2NlNWQyMTIwOWJiZTc1OTk5IgogCiBpbmhlcml0IHB5cGkgc2V0dXB0b29sczMgcHRl
c3QKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImU4OTUxMjQwNmI3OTNjYTM5ZjU5NzFiYzk5OWNj
NTM4Y2UxMjVjMGU1MWMyNzk0MWJlZjQ1NjhiNDYwMDk1ZTIiCitTUkNfVVJJW3NoYTI1NnN1bV0g
PSAiN2NjZmFlN2I0YjJjMDY3NDY0YTY3MzNjNjI2MTY3M2ZkYjhmZDFiZTkwNTQ2MDM5NmI5N2Ew
NzNlOWZhNjgzYSIKIAogUkRFUEVORFM6JHtQTn06Y2xhc3MtdGFyZ2V0ICs9ICJcCiAgICAgJHtQ
WVRIT05fUE59LWRhdGV0aW1lIFwKLS0gCjIuMzcuMwoK

--===============4818199164504826254==--

