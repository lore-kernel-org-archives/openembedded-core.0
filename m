Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2432AC71144
	for <webhook@archiver.kernel.org>; Sun,  1 Jan 2023 20:46:19 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.20182.1672605967480073083
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jan 2023 12:46:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=eBaL7RI6;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101856f15a1fc-fab930f4-1c33-4861-b98d-557935273c2e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1672605967;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=gT9xc5SwEjsB3JwzxVFFSiZQCevgEi7lTwxvOJPAms4=;
	b=eBaL7RI6UksR6wbXxDircNLjgyErE62sRClQeO1eAuYvRpRZ16ZILoM2WfmiyRCu
	cGbvLWKUiwMgIOPGHL2NEFqWqt7NJ1VWi4Q88UY1ZhHpSCrKtQVr4ao37Sirn0Q8dxZ
	Yobx60xV8Rum+vUWGxpmmYh9ZzubJw1SskISPkTU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1672605967;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=gT9xc5SwEjsB3JwzxVFFSiZQCevgEi7lTwxvOJPAms4=;
	b=ay/pmq7k+FXha2X8wNUltNOhDhZm+yEt01bqbvcZ51xlsjluNnLKt1XdDE4xq12G
	FXRkNZ42aVDpJqW/wlZnBnNl7lZcFSYAPE5jyBR9/cp/bn2y6Sj/2wQzOggOIhzsUj7
	s4tQzF1ZipThN9R1eMNprlHljo3yFG9YbfjL7KvI=
Content-Type: multipart/mixed; boundary="===============5601387397916705417=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-setuptools-scm: upgrading to 7.1.0 SUCCEEDED
Message-ID: <010101856f15a1fc-fab930f4-1c33-4861-b98d-557935273c2e-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jan 2023 20:46:06 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.01.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 20:46:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175266

--===============5601387397916705417==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-setuptools-scm* to *7.1.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-setuptools-scm-upgrade-7.0.5-7.1.0.patch
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
--===============5601387397916705417==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-setuptools-scm (sysroot):
  /usr/lib/python3.11/site-packages/setuptools_scm-7.0.5.dist-info moved to /usr/lib/python3.11/site-packages/setuptools_scm-7.1.0.dist-info

--===============5601387397916705417==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-setuptools-scm: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/setuptools_scm/setuptools_scm-7.0.5.tar.gz" to "https://files.pythonhosted.org/packages/source/s/setuptools_scm/setuptools_scm-7.1.0.tar.gz"
packages/core2-32-poky-linux/python3-setuptools-scm: PV changed from "7.0.5" to "7.1.0"
packages/core2-32-poky-linux/python3-setuptools-scm: PKGV changed from 7.0.5 [default] to 7.1.0 [default]
packages/core2-32-poky-linux/python3-setuptools-scm/python3-setuptools-scm-dbg: PV changed from "7.0.5" to "7.1.0"
packages/core2-32-poky-linux/python3-setuptools-scm/python3-setuptools-scm-dbg: PKGV changed from 7.0.5 [default] to 7.1.0 [default]
packages/core2-32-poky-linux/python3-setuptools-scm/python3-setuptools-scm-dev: PV changed from "7.0.5" to "7.1.0"
packages/core2-32-poky-linux/python3-setuptools-scm/python3-setuptools-scm-dev: PKGV changed from 7.0.5 [default] to 7.1.0 [default]
packages/core2-32-poky-linux/python3-setuptools-scm/python3-setuptools-scm-doc: PV changed from "7.0.5" to "7.1.0"
packages/core2-32-poky-linux/python3-setuptools-scm/python3-setuptools-scm-doc: PKGV changed from 7.0.5 [default] to 7.1.0 [default]
packages/core2-32-poky-linux/python3-setuptools-scm/python3-setuptools-scm-locale: PV changed from "7.0.5" to "7.1.0"
packages/core2-32-poky-linux/python3-setuptools-scm/python3-setuptools-scm-locale: PKGV changed from 7.0.5 [default] to 7.1.0 [default]
packages/core2-32-poky-linux/python3-setuptools-scm/python3-setuptools-scm-src: PV changed from "7.0.5" to "7.1.0"
packages/core2-32-poky-linux/python3-setuptools-scm/python3-setuptools-scm-src: PKGV changed from 7.0.5 [default] to 7.1.0 [default]
packages/core2-32-poky-linux/python3-setuptools-scm/python3-setuptools-scm-staticdev: PV changed from "7.0.5" to "7.1.0"
packages/core2-32-poky-linux/python3-setuptools-scm/python3-setuptools-scm-staticdev: PKGV changed from 7.0.5 [default] to 7.1.0 [default]
packages/core2-32-poky-linux/python3-setuptools-scm/python3-setuptools-scm: PKGSIZE changed from 243838 to 249239 (+2%)
packages/core2-32-poky-linux/python3-setuptools-scm/python3-setuptools-scm: PV changed from "7.0.5" to "7.1.0"
packages/core2-32-poky-linux/python3-setuptools-scm/python3-setuptools-scm: PKGV changed from 7.0.5 [default] to 7.1.0 [default]
Changes to packages/core2-32-poky-linux/python3-setuptools-scm (sysroot):
  /usr/lib/python3.11/site-packages/setuptools_scm-7.0.5.dist-info moved to /usr/lib/python3.11/site-packages/setuptools_scm-7.1.0.dist-info

--===============5601387397916705417==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-setuptools-scm-upgrade-7.0.5-7.1.0.patch"

RnJvbSBmNjNlNGQ1YTZkODM0MzIzNGRiYWI2ZTU5NDUxYWUxZDM0OTA4MjNiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBKYW4gMjAyMyAxMDozMDo1NiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtc2V0dXB0b29scy1zY206IHVwZ3JhZGUgNy4wLjUgLT4gNy4xLjAKCi0tLQogLi4uLXNl
dHVwdG9vbHMtc2NtXzcuMC41LmJiID0+IHB5dGhvbjMtc2V0dXB0b29scy1zY21fNy4xLjAuYmJ9
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1zZXR1cHRvb2xzLXNj
bV83LjAuNS5iYiA9PiBweXRob24zLXNldHVwdG9vbHMtc2NtXzcuMS4wLmJifSAoOTElKQoKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xz
LXNjbV83LjAuNS5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1
cHRvb2xzLXNjbV83LjEuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDkxJQpyZW5hbWUgZnJvbSBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0b29scy1zY21fNy4wLjUuYmIK
cmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xz
LXNjbV83LjEuMC5iYgppbmRleCBhMWU3MTlmNTRiLi43OTYxZmY3MTk4IDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0b29scy1zY21fNy4wLjUu
YmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVwdG9vbHMt
c2NtXzcuMS4wLmJiCkBAIC00LDcgKzQsNyBAQCBERVNDUklQVElPTiA9ICJzZXR1cHRvb2xzX3Nj
bSBoYW5kbGVzIG1hbmFnaW5nIHlvdXIgUHl0aG9uIHBhY2thZ2UgdmVyc2lvbnMgaW4gUwogTElD
RU5TRSA9ICJNSVQiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9QS0ctSU5GTztiZWdpbmxp
bmU9ODtlbmRsaW5lPTg7bWQ1PTgyMjcxODAxMjY3OTdhMDE0OGY5NGY0ODNmM2UxNDg5IgogCi1T
UkNfVVJJW3NoYTI1NnN1bV0gPSAiMDMxZTEzYWY3NzFkNmY4OTJiOTQxYWRiNmVhMDQ1NDViYmY5
MWViYzVjZTY4Yzc4YWFmM2ZmZjZlMWZiNDg0NCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI2YzUw
ODM0NWE3NzFhYWQ3ZDU2ZWJmZjBlNzA2MjhiZjJiMGVjNzU3Mzc2MmJlOTk2MDIxNDczMGRlMjc4
ZjI3IgogCiBQWVBJX1BBQ0tBR0UgPSAic2V0dXB0b29sc19zY20iCiBpbmhlcml0IHB5cGkgcHl0
aG9uX3NldHVwdG9vbHNfYnVpbGRfbWV0YQotLSAKMi4zNy4zCgo=

--===============5601387397916705417==--

