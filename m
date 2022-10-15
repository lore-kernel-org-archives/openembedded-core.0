Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F0C6C6787C
	for <webhook@archiver.kernel.org>; Sat, 15 Oct 2022 22:03:21 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web12.24531.1665871392234762595
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Oct 2022 15:03:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=RuL8Brrd;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010183ddac2dc5-14725011-3e99-4cd1-b11d-c98c57cf4a33-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1665871392;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ckw8YZ3i6KqQNhi2FToIhL7Kw1pbnvAdY6s4L3Lkclo=;
	b=RuL8BrrdlCvX9FFHO/W5oWoB4PWYzjyPPTgat6+iq3a0VVC2rZqiSEUOPqORMlyi
	av8QEo3r4c7N152SoU/kPGz4hrwHbAupcSkqFsFrLjuJ8iLsI8zzitU6nbiZAq8ZrKY
	0Kgx9kO/TUcX4M371weAAS6wgbqx3wlKcBX7L70I=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1665871392;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ckw8YZ3i6KqQNhi2FToIhL7Kw1pbnvAdY6s4L3Lkclo=;
	b=YzmcEW0bI4Iwq7Mir7RA5CgplU1hUPkgWYl4oaukB0qe+IQJkq4qL9PYbcLI4UKA
	lb1NXDidsfcOpgSK0Nhtj8UREehcReeSvghVP7fBZ6Y2bSmNofOw/HmrCYxGDcNInAI
	Bzp07VE40nPYwjDYCYsv1N7VRNh9dBdMqCIGpUcY=
Content-Type: multipart/mixed; boundary="===============1289016606506547477=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] init-system-helpers: upgrading to 1.65.2 SUCCEEDED
Message-ID: <01010183ddac2dc5-14725011-3e99-4cd1-b11d-c98c57cf4a33-000000@us-west-2.amazonses.com>
Date: Sat, 15 Oct 2022 22:03:12 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Oct 2022 22:03:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171746

--===============1289016606506547477==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *init-system-helpers* to *1.65.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-init-system-helpers-upgrade-1.64-1.65.2.patch
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
--===============1289016606506547477==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-init-system-helpers-upgrade-1.64-1.65.2.patch"

RnJvbSA1YzI5MDI2YmMxMzAxYmYwNTFiNGY0YmFkN2Q0N2UwYjcyNjQ5YWE4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgT2N0IDIwMjIgMDc6Mjg6NDEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBp
bml0LXN5c3RlbS1oZWxwZXJzOiB1cGdyYWRlIDEuNjQgLT4gMS42NS4yCgotLS0KIC4uLm5pdC1z
eXN0ZW0taGVscGVyc18xLjY0LmJiID0+IGluaXQtc3lzdGVtLWhlbHBlcnNfMS42NS4yLmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1jb3JlL2luaXRzY3JpcHRzL3tpbml0LXN5c3RlbS1oZWxwZXJzXzEu
NjQuYmIgPT4gaW5pdC1zeXN0ZW0taGVscGVyc18xLjY1LjIuYmJ9ICg5NiUpCgpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWNvcmUvaW5pdHNjcmlwdHMvaW5pdC1zeXN0ZW0taGVscGVyc18xLjY0
LmJiIGIvbWV0YS9yZWNpcGVzLWNvcmUvaW5pdHNjcmlwdHMvaW5pdC1zeXN0ZW0taGVscGVyc18x
LjY1LjIuYmIKc2ltaWxhcml0eSBpbmRleCA5NiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWNv
cmUvaW5pdHNjcmlwdHMvaW5pdC1zeXN0ZW0taGVscGVyc18xLjY0LmJiCnJlbmFtZSB0byBtZXRh
L3JlY2lwZXMtY29yZS9pbml0c2NyaXB0cy9pbml0LXN5c3RlbS1oZWxwZXJzXzEuNjUuMi5iYgpp
bmRleCA2NjNkNjBjNmUwLi4xZmMyM2FjYjc0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29y
ZS9pbml0c2NyaXB0cy9pbml0LXN5c3RlbS1oZWxwZXJzXzEuNjQuYmIKKysrIGIvbWV0YS9yZWNp
cGVzLWNvcmUvaW5pdHNjcmlwdHMvaW5pdC1zeXN0ZW0taGVscGVyc18xLjY1LjIuYmIKQEAgLTE2
LDcgKzE2LDcgQEAgU0VDVElPTiA9ICJiYXNlIgogTElDRU5TRSA9ICJCU0QtMy1DbGF1c2UgJiBH
UEwtMi4wLW9ubHkiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9kZWJpYW4vY29weXJpZ2h0
O21kNT1jNGVjMjBhYTE1OGZhOWRlMjZlZTFhY2NmNzhkY2FhZSIKIAotU1JDUkVWID0gImM0NDA4
OTMwNTE0MDZjMTFmMGEzMTUwNTg5Mzk2NTdkNTkzN2JlNGYiCitTUkNSRVYgPSAiMmY0NDZiNjlk
YjcyOGIyYmRhNjgyNzBhOWI4MWRlODgxMDJlMWZkZCIKIFNSQ19VUkkgPSAiZ2l0Oi8vc2Fsc2Eu
ZGViaWFuLm9yZy9kZWJpYW4vaW5pdC1zeXN0ZW0taGVscGVycy5naXQ7cHJvdG9jb2w9aHR0cHM7
YnJhbmNoPW1hc3RlciIKIFVQU1RSRUFNX0NIRUNLX0dJVFRBR1JFR0VYID0gIig/UDxwdmVyPihc
ZCsoXC5cZCspKykpKD8hX2V4cCkiCiAKLS0gCjIuMzEuMQoK

--===============1289016606506547477==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/init-system-helpers/init-system-helpers-dbg: PV changed from "1.64" to "1.65.2"
packages/core2-32-poky-linux/init-system-helpers/init-system-helpers-dbg: PKGV changed from 1.64 [default] to 1.65.2 [default]
packages/core2-32-poky-linux/init-system-helpers/init-system-helpers-dev: PV changed from "1.64" to "1.65.2"
packages/core2-32-poky-linux/init-system-helpers/init-system-helpers-dev: PKGV changed from 1.64 [default] to 1.65.2 [default]
packages/core2-32-poky-linux/init-system-helpers/init-system-helpers-doc: PV changed from "1.64" to "1.65.2"
packages/core2-32-poky-linux/init-system-helpers/init-system-helpers-doc: PKGV changed from 1.64 [default] to 1.65.2 [default]
packages/core2-32-poky-linux/init-system-helpers/init-system-helpers-invoke-rc.d: PV changed from "1.64" to "1.65.2"
packages/core2-32-poky-linux/init-system-helpers/init-system-helpers-invoke-rc.d: PKGV changed from 1.64 [default] to 1.65.2 [default]
packages/core2-32-poky-linux/init-system-helpers/init-system-helpers-locale: PV changed from "1.64" to "1.65.2"
packages/core2-32-poky-linux/init-system-helpers/init-system-helpers-locale: PKGV changed from 1.64 [default] to 1.65.2 [default]
packages/core2-32-poky-linux/init-system-helpers/init-system-helpers-service: PV changed from "1.64" to "1.65.2"
packages/core2-32-poky-linux/init-system-helpers/init-system-helpers-service: PKGV changed from 1.64 [default] to 1.65.2 [default]
packages/core2-32-poky-linux/init-system-helpers/init-system-helpers-src: PV changed from "1.64" to "1.65.2"
packages/core2-32-poky-linux/init-system-helpers/init-system-helpers-src: PKGV changed from 1.64 [default] to 1.65.2 [default]
packages/core2-32-poky-linux/init-system-helpers/init-system-helpers-staticdev: PV changed from "1.64" to "1.65.2"
packages/core2-32-poky-linux/init-system-helpers/init-system-helpers-staticdev: PKGV changed from 1.64 [default] to 1.65.2 [default]
packages/core2-32-poky-linux/init-system-helpers/init-system-helpers: PV changed from "1.64" to "1.65.2"
packages/core2-32-poky-linux/init-system-helpers/init-system-helpers: PKGV changed from 1.64 [default] to 1.65.2 [default]
packages/core2-32-poky-linux/init-system-helpers: PV changed from "1.64" to "1.65.2"
packages/core2-32-poky-linux/init-system-helpers: PKGV changed from 1.64 [default] to 1.65.2 [default]

--===============1289016606506547477==--

