Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5BA1C6FA8A
	for <webhook@archiver.kernel.org>; Thu, 15 Sep 2022 14:18:42 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com
 (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web08.10725.1663251512687298215
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Sep 2022 07:18:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=bAG3weiz;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33,
 mailfrom: 010101834183f82c-582675e6-2de5-4ddd-9260-604686e65cb5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1663251511;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=nV3slNl8q6zOEiTSojN1le+6NxpjEU1Hk9RcwpVYYdI=;
	b=bAG3weizSj+JdMr5aRxWdt07fpudbxOtOjpLZVWN8QXq3g2xiorJgw83VErcf4RH
	jsmIxsXbKnFoCM0aYO+rermpBrJkfKBYdwEL7ePaRy/WU6oc2WMTdNzwYlAxOG8IrkM
	wVJEqkjzIA3xIW4og6hedcrbnwNuWOko7HwlKyTg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1663251511;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=nV3slNl8q6zOEiTSojN1le+6NxpjEU1Hk9RcwpVYYdI=;
	b=GySj2LigaiAAZng3dKy2M2Yv8rFlzQuNkT4KplsPdnLBVipfzf1AjmIsO6PDvOY9
	H+UHW+VVmScUmouY2jCsn4/OtBqumHZQcOdwLZNqkYGFDzDVPrCwiAM+xZFwsE0TMe+
	D1uZUqdtKjiPdYPNuGZt7Qudfx2tQ6JBubr6OnK0=
Content-Type: multipart/mixed; boundary="===============3312660516802883576=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] init-system-helpers: upgrading to 1.65. SUCCEEDED
Message-ID: 
 <010101834183f82c-582675e6-2de5-4ddd-9260-604686e65cb5-000000@us-west-2.amazonses.com>
Date: Thu, 15 Sep 2022 14:18:31 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.09.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Sep 2022 14:18:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170706

--===============3312660516802883576==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *init-system-helpers* to *1.65.* has Succeeded.

Next steps:
    - apply the patch: git am 0001-init-system-helpers-upgrade-1.64-1.65.patch
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
--===============3312660516802883576==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/init-system-helpers/init-system-helpers-dbg: PKGV changed from 1.64 [default] to 1.65. [default]
packages/core2-32-poky-linux/init-system-helpers/init-system-helpers-dbg: PV changed from "1.64" to "1.65."
packages/core2-32-poky-linux/init-system-helpers/init-system-helpers-dev: PKGV changed from 1.64 [default] to 1.65. [default]
packages/core2-32-poky-linux/init-system-helpers/init-system-helpers-dev: PV changed from "1.64" to "1.65."
packages/core2-32-poky-linux/init-system-helpers/init-system-helpers-doc: PKGV changed from 1.64 [default] to 1.65. [default]
packages/core2-32-poky-linux/init-system-helpers/init-system-helpers-doc: PV changed from "1.64" to "1.65."
packages/core2-32-poky-linux/init-system-helpers/init-system-helpers-invoke-rc.d: PKGV changed from 1.64 [default] to 1.65. [default]
packages/core2-32-poky-linux/init-system-helpers/init-system-helpers-invoke-rc.d: PV changed from "1.64" to "1.65."
packages/core2-32-poky-linux/init-system-helpers/init-system-helpers-locale: PKGV changed from 1.64 [default] to 1.65. [default]
packages/core2-32-poky-linux/init-system-helpers/init-system-helpers-locale: PV changed from "1.64" to "1.65."
packages/core2-32-poky-linux/init-system-helpers/init-system-helpers-service: PKGV changed from 1.64 [default] to 1.65. [default]
packages/core2-32-poky-linux/init-system-helpers/init-system-helpers-service: PV changed from "1.64" to "1.65."
packages/core2-32-poky-linux/init-system-helpers/init-system-helpers-src: PKGV changed from 1.64 [default] to 1.65. [default]
packages/core2-32-poky-linux/init-system-helpers/init-system-helpers-src: PV changed from "1.64" to "1.65."
packages/core2-32-poky-linux/init-system-helpers/init-system-helpers-staticdev: PKGV changed from 1.64 [default] to 1.65. [default]
packages/core2-32-poky-linux/init-system-helpers/init-system-helpers-staticdev: PV changed from "1.64" to "1.65."
packages/core2-32-poky-linux/init-system-helpers/init-system-helpers: PKGV changed from 1.64 [default] to 1.65. [default]
packages/core2-32-poky-linux/init-system-helpers/init-system-helpers: PV changed from "1.64" to "1.65."
packages/core2-32-poky-linux/init-system-helpers: PKGV changed from 1.64 [default] to 1.65. [default]
packages/core2-32-poky-linux/init-system-helpers: PV changed from "1.64" to "1.65."

--===============3312660516802883576==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-init-system-helpers-upgrade-1.64-1.65.patch"

RnJvbSAwY2UzNzYzZWJkZjgxMzQzZGY2ZDRjNmU1OGVlZDkyNGUxNGZkMzkyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgU2VwIDIwMjIgMDY6NDk6MTAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBp
bml0LXN5c3RlbS1oZWxwZXJzOiB1cGdyYWRlIDEuNjQgLT4gMS42NS4KCi0tLQogLi4uaW5pdC1z
eXN0ZW0taGVscGVyc18xLjY0LmJiID0+IGluaXQtc3lzdGVtLWhlbHBlcnNfMS42NS4uYmJ9IHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWNvcmUvaW5pdHNjcmlwdHMve2luaXQtc3lzdGVtLWhlbHBlcnNfMS42
NC5iYiA9PiBpbml0LXN5c3RlbS1oZWxwZXJzXzEuNjUuLmJifSAoOTYlKQoKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1jb3JlL2luaXRzY3JpcHRzL2luaXQtc3lzdGVtLWhlbHBlcnNfMS42NC5i
YiBiL21ldGEvcmVjaXBlcy1jb3JlL2luaXRzY3JpcHRzL2luaXQtc3lzdGVtLWhlbHBlcnNfMS42
NS4uYmIKc2ltaWxhcml0eSBpbmRleCA5NiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWNvcmUv
aW5pdHNjcmlwdHMvaW5pdC1zeXN0ZW0taGVscGVyc18xLjY0LmJiCnJlbmFtZSB0byBtZXRhL3Jl
Y2lwZXMtY29yZS9pbml0c2NyaXB0cy9pbml0LXN5c3RlbS1oZWxwZXJzXzEuNjUuLmJiCmluZGV4
IDIyZGRkNjg0MGYuLmM1MDk0OGY0OTQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2lu
aXRzY3JpcHRzL2luaXQtc3lzdGVtLWhlbHBlcnNfMS42NC5iYgorKysgYi9tZXRhL3JlY2lwZXMt
Y29yZS9pbml0c2NyaXB0cy9pbml0LXN5c3RlbS1oZWxwZXJzXzEuNjUuLmJiCkBAIC0xNiw3ICsx
Niw3IEBAIFNFQ1RJT04gPSAiYmFzZSIKIExJQ0VOU0UgPSAiQlNELTMtQ2xhdXNlICYgR1BMLTIu
MC1vbmx5IgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vZGViaWFuL2NvcHlyaWdodDttZDU9
YzRlYzIwYWExNThmYTlkZTI2ZWUxYWNjZjc4ZGNhYWUiCiAKLVNSQ1JFViA9ICJjNDQwODkzMDUx
NDA2YzExZjBhMzE1MDU4OTM5NjU3ZDU5MzdiZTRmIgorU1JDUkVWID0gImVmZjZjMjczNTI1MTQ2
MjJmYjFjMzA5OGNkZjljZWJiOTdjMmRiNjkiCiBTUkNfVVJJID0gImdpdDovL3NhbHNhLmRlYmlh
bi5vcmcvZGViaWFuL2luaXQtc3lzdGVtLWhlbHBlcnMuZ2l0O3Byb3RvY29sPWh0dHBzO2JyYW5j
aD1tYXN0ZXIiCiAKIFMgPSAiJHtXT1JLRElSfS9naXQiCi0tIAoyLjMxLjEKCg==

--===============3312660516802883576==--

