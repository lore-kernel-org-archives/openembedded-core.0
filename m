Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD4D1C83010
	for <webhook@archiver.kernel.org>; Thu, 15 Sep 2022 14:18:43 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com
 (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web08.10728.1663251513106095709
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Sep 2022 07:18:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Iam4yFit;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31,
 mailfrom: 010101834183fc8d-8d7a0561-f9f7-4793-b971-f8862fc1ef4c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1663251512;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=+NPtAt2KUGBdsE8UFI0ALwrONz9Gd6rXIMSmnFtPr4U=;
	b=Iam4yFitnohblRDJR+24f+0IzPUR1JbBf6BXxJzv9bKSl9ZYPzPpdcE6ZEoke+rt
	sBDVEHaeUJ4jqfu1iHkAzcas9Rm6su460Z+oYTowJK0sPO7L4qxXxmHk39kb1zPdq3a
	/9xzK5fnqcBWBPVBDsWZMhDnpQbRjyrcKLyIqxw4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1663251512;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=+NPtAt2KUGBdsE8UFI0ALwrONz9Gd6rXIMSmnFtPr4U=;
	b=PvJM0R/d7x+E9jc7RM49JISbRCbkoGH+AQd0I1M12fZBwY9/NPOzwqeNlQRuoUSZ
	1sdKntlHdAYXLmPngmhHEkpxuR3uHdRyFD9urSOBv5Dbvn3GDFQB9wsM78bToZICpeQ
	jglxqd66+BWFqvunvzC9+HMzVfoayK3j0eK9uljs=
Content-Type: multipart/mixed; boundary="===============2750308070997826630=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ninja: upgrading to 1.11.1 SUCCEEDED
Message-ID: 
 <010101834183fc8d-8d7a0561-f9f7-4793-b971-f8862fc1ef4c-000000@us-west-2.amazonses.com>
Date: Thu, 15 Sep 2022 14:18:32 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.09.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Sep 2022 14:18:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170712

--===============2750308070997826630==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ninja* to *1.11.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ninja-upgrade-1.11.0-1.11.1.patch
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
--===============2750308070997826630==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/ninja: PV changed from "1.11.0" to "1.11.1"
packages/core2-32-poky-linux/ninja: PKGV changed from 1.11.0 [default] to 1.11.1 [default]
packages/core2-32-poky-linux/ninja/ninja-dbg: PKGSIZE changed from 6885756 to 6885768 (+0%)
packages/core2-32-poky-linux/ninja/ninja-dbg: PV changed from "1.11.0" to "1.11.1"
packages/core2-32-poky-linux/ninja/ninja-dbg: PKGV changed from 1.11.0 [default] to 1.11.1 [default]
packages/core2-32-poky-linux/ninja/ninja-dev: PV changed from "1.11.0" to "1.11.1"
packages/core2-32-poky-linux/ninja/ninja-dev: PKGV changed from 1.11.0 [default] to 1.11.1 [default]
packages/core2-32-poky-linux/ninja/ninja-doc: PV changed from "1.11.0" to "1.11.1"
packages/core2-32-poky-linux/ninja/ninja-doc: PKGV changed from 1.11.0 [default] to 1.11.1 [default]
packages/core2-32-poky-linux/ninja/ninja-locale: PV changed from "1.11.0" to "1.11.1"
packages/core2-32-poky-linux/ninja/ninja-locale: PKGV changed from 1.11.0 [default] to 1.11.1 [default]
packages/core2-32-poky-linux/ninja/ninja-src: PKGSIZE changed from 407189 to 407229 (+0%)
packages/core2-32-poky-linux/ninja/ninja-src: PV changed from "1.11.0" to "1.11.1"
packages/core2-32-poky-linux/ninja/ninja-src: PKGV changed from 1.11.0 [default] to 1.11.1 [default]
packages/core2-32-poky-linux/ninja/ninja-staticdev: PV changed from "1.11.0" to "1.11.1"
packages/core2-32-poky-linux/ninja/ninja-staticdev: PKGV changed from 1.11.0 [default] to 1.11.1 [default]
packages/core2-32-poky-linux/ninja/ninja: PV changed from "1.11.0" to "1.11.1"
packages/core2-32-poky-linux/ninja/ninja: PKGV changed from 1.11.0 [default] to 1.11.1 [default]

--===============2750308070997826630==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ninja-upgrade-1.11.0-1.11.1.patch"

RnJvbSA2OTJiNWUyNTdmZDRiMGQ2ODJlZDdhOTc2MTAzYzVkZWJhYWVmMzBmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgU2VwIDIwMjIgMDk6MDc6MzIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBu
aW5qYTogdXBncmFkZSAxLjExLjAgLT4gMS4xMS4xCgotLS0KIC4uLi9yZWNpcGVzLWRldnRvb2xz
L25pbmphL3tuaW5qYV8xLjExLjAuYmIgPT4gbmluamFfMS4xMS4xLmJifSB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1kZXZ0b29scy9uaW5qYS97bmluamFfMS4xMS4wLmJiID0+IG5pbmphXzEuMTEuMS5iYn0g
KDk0JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbmluamEvbmluamFfMS4x
MS4wLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL25pbmphL25pbmphXzEuMTEuMS5iYgpzaW1p
bGFyaXR5IGluZGV4IDk0JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvbmluamEv
bmluamFfMS4xMS4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvbmluamEvbmlu
amFfMS4xMS4xLmJiCmluZGV4IDRlYzM2MWNjMWEuLjI1NWY1ZWZiNzAgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9uaW5qYS9uaW5qYV8xLjExLjAuYmIKKysrIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL25pbmphL25pbmphXzEuMTEuMS5iYgpAQCAtNiw3ICs2LDcgQEAgTElDX0ZJ
TEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9YTgxNTg2YTY0YWQ0ZTQ3NmM3OTFjZGE3
ZTJmMmM1MmUiCiAKIERFUEVORFMgPSAicmUyYy1uYXRpdmUgbmluamEtbmF0aXZlIgogCi1TUkNS
RVYgPSAiNTFlZGVlYjA2M2E4MjY5MzU3M2RiNDM3ODJkOWUzNzMzYjI4NDBlNCIKK1NSQ1JFViA9
ICJhNTI0YmYzZjZiYWNkMWI0YWQ4NWQ3MTllZWQyNzM3ZDg1NjJmMjdhIgogCiBTUkNfVVJJID0g
ImdpdDovL2dpdGh1Yi5jb20vbmluamEtYnVpbGQvbmluamEuZ2l0O2JyYW5jaD1yZWxlYXNlO3By
b3RvY29sPWh0dHBzIgogVVBTVFJFQU1fQ0hFQ0tfR0lUVEFHUkVHRVggPSAidig/UDxwdmVyPi4q
KSIKLS0gCjIuMzEuMQoK

--===============2750308070997826630==--

