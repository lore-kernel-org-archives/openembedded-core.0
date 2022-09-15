Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9375C6FD39
	for <webhook@archiver.kernel.org>; Thu, 15 Sep 2022 14:18:43 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com
 (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web08.10727.1663251512970992320
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Sep 2022 07:18:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=VPwc+7c2;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192,
 mailfrom: 010101834183faf5-609d1cd7-4644-4b89-a13e-ef564a7731de-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1663251512;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=qGyy9L8CDRetzpNgooakb0PtA3vAU/0MM4uc6tXrikU=;
	b=VPwc+7c2Iz4D3tVhx4+ZbTKFLkY20cycHsSrzojq9egtzXKSqFUMVpji+JPBxxLO
	sRAqTe5A24UH3sE2rlCe13qwzmUGaUFGXXvQOhKGRPPPPgs7TrXNHIfZ7gjj8YxU0Ve
	5/kZ2mWRAsTzqcQCcVxCh4XBvPo8n4nPmnJfjynU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1663251512;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=qGyy9L8CDRetzpNgooakb0PtA3vAU/0MM4uc6tXrikU=;
	b=H1ScpNLlfUldYd0HctSBvYROp/EjhX8lSn1tnopn+LACjqfNypcuaA/tp0ynEbqF
	6ctgDWQ5f6n9JL2Z68oVU/S34CiHlW3bXDI5wrq5RIPR0WpWTz11yBBNKwt3lNxZ6mp
	/KpOM6sqt2YOxvqZxZlfu8NFRc6Dzq/amaSff6hE=
Content-Type: multipart/mixed; boundary="===============1520492941189480553=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libcomps: upgrading to 0.1.19 SUCCEEDED
Message-ID: 
 <010101834183faf5-609d1cd7-4644-4b89-a13e-ef564a7731de-000000@us-west-2.amazonses.com>
Date: Thu, 15 Sep 2022 14:18:32 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.09.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Sep 2022 14:18:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170711

--===============1520492941189480553==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libcomps* to *0.1.19* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libcomps-upgrade-0.1.18-0.1.19.patch
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
--===============1520492941189480553==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libcomps: PV changed from "0.1.18" to "0.1.19"
packages/core2-32-poky-linux/libcomps: PKGV changed from 0.1.18 [default] to 0.1.19 [default]
packages/core2-32-poky-linux/libcomps/libcomps-dbg: PV changed from "0.1.18" to "0.1.19"
packages/core2-32-poky-linux/libcomps/libcomps-dbg: PKGV changed from 0.1.18 [default] to 0.1.19 [default]
packages/core2-32-poky-linux/libcomps/libcomps-dev: PV changed from "0.1.18" to "0.1.19"
packages/core2-32-poky-linux/libcomps/libcomps-dev: PKGV changed from 0.1.18 [default] to 0.1.19 [default]
packages/core2-32-poky-linux/libcomps/libcomps-doc: PV changed from "0.1.18" to "0.1.19"
packages/core2-32-poky-linux/libcomps/libcomps-doc: PKGV changed from 0.1.18 [default] to 0.1.19 [default]
packages/core2-32-poky-linux/libcomps/libcomps-locale: PV changed from "0.1.18" to "0.1.19"
packages/core2-32-poky-linux/libcomps/libcomps-locale: PKGV changed from 0.1.18 [default] to 0.1.19 [default]
packages/core2-32-poky-linux/libcomps/libcomps-src: PV changed from "0.1.18" to "0.1.19"
packages/core2-32-poky-linux/libcomps/libcomps-src: PKGV changed from 0.1.18 [default] to 0.1.19 [default]
packages/core2-32-poky-linux/libcomps/libcomps-staticdev: PV changed from "0.1.18" to "0.1.19"
packages/core2-32-poky-linux/libcomps/libcomps-staticdev: PKGV changed from 0.1.18 [default] to 0.1.19 [default]
packages/core2-32-poky-linux/libcomps/libcomps: PV changed from "0.1.18" to "0.1.19"
packages/core2-32-poky-linux/libcomps/libcomps: PKGV changed from 0.1.18 [default] to 0.1.19 [default]

--===============1520492941189480553==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libcomps-upgrade-0.1.18-0.1.19.patch"

RnJvbSBkNDdjNTc5MDI3OGY5NGY2NDQ1OTM2NmU0NTQ4YjNhNmNiNjQzZDVjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgU2VwIDIwMjIgMDg6MzE6MzYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJjb21wczogdXBncmFkZSAwLjEuMTggLT4gMC4xLjE5CgotLS0KIC4uLi9saWJjb21wcy97bGli
Y29tcHNfMC4xLjE4LmJiID0+IGxpYmNvbXBzXzAuMS4xOS5iYn0gICAgICAgICB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1kZXZ0b29scy9saWJjb21wcy97bGliY29tcHNfMC4xLjE4LmJiID0+IGxpYmNvbXBz
XzAuMS4xOS5iYn0gKDk0JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGli
Y29tcHMvbGliY29tcHNfMC4xLjE4LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2xpYmNvbXBz
L2xpYmNvbXBzXzAuMS4xOS5iYgpzaW1pbGFyaXR5IGluZGV4IDk0JQpyZW5hbWUgZnJvbSBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvbGliY29tcHMvbGliY29tcHNfMC4xLjE4LmJiCnJlbmFtZSB0byBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGliY29tcHMvbGliY29tcHNfMC4xLjE5LmJiCmluZGV4IGRk
MGExZjhmOTUuLmZhMWZiYzhmMGQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9s
aWJjb21wcy9saWJjb21wc18wLjEuMTguYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2xp
YmNvbXBzL2xpYmNvbXBzXzAuMS4xOS5iYgpAQCAtOCw3ICs4LDcgQEAgU1JDX1VSSSA9ICJnaXQ6
Ly9naXRodWIuY29tL3JwbS1zb2Z0d2FyZS1tYW5hZ2VtZW50L2xpYmNvbXBzLmdpdDticmFuY2g9
bWFzdGVyO3AKICAgICAgICAgICAgZmlsZTovLzAwMDItRG8tbm90LXNldC1QWVRIT05fSU5TVEFM
TF9ESVItYnktcnVubmluZy1weXRob24ucGF0Y2ggXAogICAgICAgICAgICAiCiAKLVNSQ1JFViA9
ICJkZWU0YWUzN2Y3ODE4NzA5ODAyZGUyOGM0ZDE2ZmE4MjNiZDgzYWUyIgorU1JDUkVWID0gIjkz
MjJiZGNmMDY2MzBjYzA5NGYwOTRmOTQ0ZDdkMGUyY2I3OThiNzMiCiAKIFMgPSAiJHtXT1JLRElS
fS9naXQiCiAKLS0gCjIuMzEuMQoK

--===============1520492941189480553==--

