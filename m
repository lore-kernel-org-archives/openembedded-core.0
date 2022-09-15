Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5B67C6FA89
	for <webhook@archiver.kernel.org>; Thu, 15 Sep 2022 14:18:42 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com
 (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web09.10892.1663251512514775690
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Sep 2022 07:18:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=WDmHU2G0;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193,
 mailfrom: 010101834183f895-95789d1e-2a78-42fd-9379-35f70d8373de-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1663251511;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=9Efr5M/W2m8EbAAlJ9te+CrPiRfYgbLTwWPaFUyEYSA=;
	b=WDmHU2G0ZX1rECCJ57Ou6mMDluIbYkYIsDMhKGq0JSa4Iej6mNOK0l7I+KwGyWP0
	D6K03JpliM21ZvcOnqmmk9VkIdK6IEkauWtXxBdRvnhNKbxiz89zbxVVUfhFqqUGYvO
	FuLgK1ZpOk5EIJ+Av/eeV7hLMxZrJH90U1SP4heQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1663251511;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=9Efr5M/W2m8EbAAlJ9te+CrPiRfYgbLTwWPaFUyEYSA=;
	b=OdGhJAt9xqm61w7QjKH/oX0cv+arrO8ADnq3ny3KGVg4Cie9cXDlhbzZ2aactrmv
	WLWjvnf7TzUS33GGPo/+8mnlI/L/WocmVGQdJeQx2YY9bZYNpo/Hb1GvWjfrtRwr2Q5
	n4ZqaIGwL3Y90cHscrSIUtv/wrAqyL89oS+vqjms=
Content-Type: multipart/mixed; boundary="===============0063656448415054889=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] btrfs-tools: upgrading to 5.19.1 SUCCEEDED
Message-ID: 
 <010101834183f895-95789d1e-2a78-42fd-9379-35f70d8373de-000000@us-west-2.amazonses.com>
Date: Thu, 15 Sep 2022 14:18:31 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.09.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Sep 2022 14:18:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170702

--===============0063656448415054889==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *btrfs-tools* to *5.19.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-btrfs-tools-upgrade-5.19-5.19.1.patch
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
--===============0063656448415054889==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/btrfs-tools (sysroot):
  /usr/lib/python3.10/site-packages/btrfsutil-5.19.1-py3.10.egg-info was added
  /usr/lib/python3.10/site-packages/btrfsutil-5.19.1-py3.10.egg-info/dependency_links.txt was added
  /usr/lib/python3.10/site-packages/btrfsutil-5.19.1-py3.10.egg-info/PKG-INFO was added
  /usr/lib/python3.10/site-packages/btrfsutil-5.19.1-py3.10.egg-info/SOURCES.txt was added
  /usr/lib/python3.10/site-packages/btrfsutil-5.19.1-py3.10.egg-info/top_level.txt was added
  /usr/lib/python3.10/site-packages/btrfsutil-5.19-py3.10.egg-info was removed
  /usr/lib/python3.10/site-packages/btrfsutil-5.19-py3.10.egg-info/dependency_links.txt was removed
  /usr/lib/python3.10/site-packages/btrfsutil-5.19-py3.10.egg-info/PKG-INFO was removed
  /usr/lib/python3.10/site-packages/btrfsutil-5.19-py3.10.egg-info/SOURCES.txt was removed
  /usr/lib/python3.10/site-packages/btrfsutil-5.19-py3.10.egg-info/top_level.txt was removed

--===============0063656448415054889==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dbg: PV changed from "5.19" to "5.19.1"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dbg: PKGV changed from 5.19 [default] to 5.19.1 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dbg: PKGSIZE changed from 17301028 to 17362820 (+0%)
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dev: PV changed from "5.19" to "5.19.1"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dev: PKGV changed from 5.19 [default] to 5.19.1 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dev: PKGSIZE changed from 208433 to 208437 (+0%)
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-doc: PV changed from "5.19" to "5.19.1"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-doc: PKGV changed from 5.19 [default] to 5.19.1 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-locale: PV changed from "5.19" to "5.19.1"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-locale: PKGV changed from 5.19 [default] to 5.19.1 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-src: PV changed from "5.19" to "5.19.1"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-src: PKGV changed from 5.19 [default] to 5.19.1 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-src: PKGSIZE changed from 3628027 to 3643216 (+0%)
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-staticdev: PV changed from "5.19" to "5.19.1"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-staticdev: PKGV changed from 5.19 [default] to 5.19.1 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools: PV changed from "5.19" to "5.19.1"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools: PKGV changed from 5.19 [default] to 5.19.1 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools: PKGSIZE changed from 6098401 to 6127331 (+0%)
packages/core2-32-poky-linux/btrfs-tools: PV changed from "5.19" to "5.19.1"
packages/core2-32-poky-linux/btrfs-tools: PKGV changed from 5.19 [default] to 5.19.1 [default]
Changes to packages/core2-32-poky-linux/btrfs-tools (sysroot):
  /usr/lib/python3.10/site-packages/btrfsutil-5.19.1-py3.10.egg-info was added
  /usr/lib/python3.10/site-packages/btrfsutil-5.19.1-py3.10.egg-info/dependency_links.txt was added
  /usr/lib/python3.10/site-packages/btrfsutil-5.19.1-py3.10.egg-info/PKG-INFO was added
  /usr/lib/python3.10/site-packages/btrfsutil-5.19.1-py3.10.egg-info/SOURCES.txt was added
  /usr/lib/python3.10/site-packages/btrfsutil-5.19.1-py3.10.egg-info/top_level.txt was added
  /usr/lib/python3.10/site-packages/btrfsutil-5.19-py3.10.egg-info was removed
  /usr/lib/python3.10/site-packages/btrfsutil-5.19-py3.10.egg-info/dependency_links.txt was removed
  /usr/lib/python3.10/site-packages/btrfsutil-5.19-py3.10.egg-info/PKG-INFO was removed
  /usr/lib/python3.10/site-packages/btrfsutil-5.19-py3.10.egg-info/SOURCES.txt was removed
  /usr/lib/python3.10/site-packages/btrfsutil-5.19-py3.10.egg-info/top_level.txt was removed

--===============0063656448415054889==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-btrfs-tools-upgrade-5.19-5.19.1.patch"

RnJvbSA3NDQ4MmM1MmE1YmNiMDQ3OTk2NWJkNGZlMzkyN2ZjN2U0MmM0MDlmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgU2VwIDIwMjIgMDc6MDc6NTkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBi
dHJmcy10b29sczogdXBncmFkZSA1LjE5IC0+IDUuMTkuMQoKLS0tCiAuLi4vYnRyZnMtdG9vbHMv
e2J0cmZzLXRvb2xzXzUuMTkuYmIgPT4gYnRyZnMtdG9vbHNfNS4xOS4xLmJifSAgfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvYnRyZnMtdG9vbHMve2J0cmZzLXRvb2xzXzUuMTkuYmIgPT4gYnRy
ZnMtdG9vbHNfNS4xOS4xLmJifSAoOTglKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9idHJmcy10b29scy9idHJmcy10b29sc181LjE5LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2J0cmZzLXRvb2xzL2J0cmZzLXRvb2xzXzUuMTkuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDk4
JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvYnRyZnMtdG9vbHMvYnRyZnMtdG9v
bHNfNS4xOS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2J0cmZzLXRvb2xzL2J0
cmZzLXRvb2xzXzUuMTkuMS5iYgppbmRleCA0ZjExNmE4NWFjLi5kYjgwMjZlMGYwIDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYnRyZnMtdG9vbHMvYnRyZnMtdG9vbHNfNS4xOS5i
YgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYnRyZnMtdG9vbHMvYnRyZnMtdG9vbHNfNS4x
OS4xLmJiCkBAIC0xOCw3ICsxOCw3IEBAIERFUEVORFMgPSAidXRpbC1saW51eCB6bGliIgogU1JD
X1VSSSA9ICJnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQva2Rh
dmUvYnRyZnMtcHJvZ3MuZ2l0O2JyYW5jaD1tYXN0ZXIgXAogICAgICAgICAgICBmaWxlOi8vMDAw
MS1BZGQtYS1wb3NzaWJpbGl0eS10by1zcGVjaWZ5LXdoZXJlLXB5dGhvbi1tb2R1bGVzLWFyLnBh
dGNoIFwKICAgICAgICAgICAgIgotU1JDUkVWID0gIjk2YjgzYjE2MTU4ZjNiODcwMzcwODU3NjFi
ZjIxMmU5NTg0NzM3NjciCitTUkNSRVYgPSAiZTFkOWRhYjMyNmUwNDM2OTZlNjY0OGFiYTRjY2Y5
MDg3NGQxZDNkMSIKIFMgPSAiJHtXT1JLRElSfS9naXQiCiAKIFBBQ0tBR0VDT05GSUcgPz89ICIg
XAotLSAKMi4zMS4xCgo=

--===============0063656448415054889==--

