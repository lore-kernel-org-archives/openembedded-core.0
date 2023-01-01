Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73236C678D6
	for <webhook@archiver.kernel.org>; Sun,  1 Jan 2023 20:46:18 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.20663.1672605966778140874
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jan 2023 12:46:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=hFzvqZXh;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101856f15a708-f64bc933-570f-43ae-947a-8592b4cfda53-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1672605968;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=3KceeU2SwXTOXOMzzxeBDbRrUwQXu2CxJiQrIMvnDY4=;
	b=hFzvqZXh2HoB8SQBrsU1lIzg/4iU69jScMSmgiDRjadKtF53eJF7CCrJGe9uGxly
	PQxfXQ1iy/bLtnaXRWerBila2AoalJ97VPyiWYw86jezOi3Miu50hkhbhgI+X86iUTA
	+eZPV0I74lp0dUKXhOG69YFyTrgPHdbwQjOkxQXw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1672605968;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=3KceeU2SwXTOXOMzzxeBDbRrUwQXu2CxJiQrIMvnDY4=;
	b=D/L6JWhIRNvynqlZDEGVJgHujwDqkQzo730XZFul2seHP2PTSX1+7gBiMim1zWC8
	gD5398F1eMJdZwF+m89Mfti66XZEML6DCNqQKRpFmdPle1kazylhJww/THef8aGC6MS
	XH4IAA3APVl/i5ZRu/Gza4hCyOd7zH1BGX+YKTIU=
Content-Type: multipart/mixed; boundary="===============2446484913006950857=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] kexec-tools: upgrading to 2.0.26 SUCCEEDED
Message-ID: <010101856f15a708-f64bc933-570f-43ae-947a-8592b4cfda53-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jan 2023 20:46:08 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.01.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 20:46:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175291

--===============2446484913006950857==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *kexec-tools* to *2.0.26* has Succeeded.

Next steps:
    - apply the patch: git am 0001-kexec-tools-upgrade-2.0.25-2.0.26.patch
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
--===============2446484913006950857==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-kexec-tools-upgrade-2.0.25-2.0.26.patch"

RnJvbSBiYTE0NzVmNGJlMzg3OTIwYzY1MWU3NjQ3MWUyZjA4NzVkMzMyN2FiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBKYW4gMjAyMyAxNToxOTozNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGtl
eGVjLXRvb2xzOiB1cGdyYWRlIDIuMC4yNSAtPiAyLjAuMjYKCi0tLQogLi4uL2tleGVjL3trZXhl
Yy10b29sc18yLjAuMjUuYmIgPT4ga2V4ZWMtdG9vbHNfMi4wLjI2LmJifSAgICAgIHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWtlcm5lbC9rZXhlYy97a2V4ZWMtdG9vbHNfMi4wLjI1LmJiID0+IGtleGVjLXRv
b2xzXzIuMC4yNi5iYn0gKDk3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMta2VybmVsL2tl
eGVjL2tleGVjLXRvb2xzXzIuMC4yNS5iYiBiL21ldGEvcmVjaXBlcy1rZXJuZWwva2V4ZWMva2V4
ZWMtdG9vbHNfMi4wLjI2LmJiCnNpbWlsYXJpdHkgaW5kZXggOTclCnJlbmFtZSBmcm9tIG1ldGEv
cmVjaXBlcy1rZXJuZWwva2V4ZWMva2V4ZWMtdG9vbHNfMi4wLjI1LmJiCnJlbmFtZSB0byBtZXRh
L3JlY2lwZXMta2VybmVsL2tleGVjL2tleGVjLXRvb2xzXzIuMC4yNi5iYgppbmRleCA5Nzg0NDA0
Y2ZmLi5iYzgzYWZiNWI2IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMta2VybmVsL2tleGVjL2tl
eGVjLXRvb2xzXzIuMC4yNS5iYgorKysgYi9tZXRhL3JlY2lwZXMta2VybmVsL2tleGVjL2tleGVj
LXRvb2xzXzIuMC4yNi5iYgpAQCAtMjAsNyArMjAsNyBAQCBTUkNfVVJJID0gIiR7S0VSTkVMT1JH
X01JUlJPUn0vbGludXgvdXRpbHMva2VybmVsL2tleGVjL2tleGVjLXRvb2xzLSR7UFZ9LnRhci5n
egogICAgICAgICAgICBmaWxlOi8vMDAwMS1hcm02NC1rZXhlYy1kaXNhYmxlZC1jaGVjay1pZi1r
YXNsci1zZWVkLWR0Yi1wcm9wZXJ0LnBhdGNoIFwKICAgICAgICAgICAgIgogCi1TUkNfVVJJW3No
YTI1NnN1bV0gPSAiNGVlYTZmODY0MWVhM2UzNDk2NTNhNTJjN2ZkMzNiZTExMzIzMjJhNWYzZGM5
ZjFhNmFkZTg4NjAxOTc2NzMyMCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI4OWJkZDk0MTU0MmM2
NGZlYzE2MzExODU4ZGYzMDRlZDNhMzkwOGMxYTYwODc0ZDY5ZGY1ZDliZjE2MTFlMDYyIgogCiBp
bmhlcml0IGF1dG90b29scyB1cGRhdGUtcmMuZCBzeXN0ZW1kCiAKLS0gCjIuMzcuMwoK

--===============2446484913006950857==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/kexec-tools/kdump: PV changed from "2.0.25" to "2.0.26"
packages/core2-32-poky-linux/kexec-tools/kdump: PKGV changed from 2.0.25 [default] to 2.0.26 [default]
packages/core2-32-poky-linux/kexec-tools/kexec-tools-dbg: PKGSIZE changed from 452612 to 452484 (-0%)
packages/core2-32-poky-linux/kexec-tools/kexec-tools-dbg: PV changed from "2.0.25" to "2.0.26"
packages/core2-32-poky-linux/kexec-tools/kexec-tools-dbg: PKGV changed from 2.0.25 [default] to 2.0.26 [default]
packages/core2-32-poky-linux/kexec-tools/kexec-tools-dev: PV changed from "2.0.25" to "2.0.26"
packages/core2-32-poky-linux/kexec-tools/kexec-tools-dev: PKGV changed from 2.0.25 [default] to 2.0.26 [default]
packages/core2-32-poky-linux/kexec-tools/kexec-tools-doc: PV changed from "2.0.25" to "2.0.26"
packages/core2-32-poky-linux/kexec-tools/kexec-tools-doc: PKGV changed from 2.0.25 [default] to 2.0.26 [default]
packages/core2-32-poky-linux/kexec-tools/kexec-tools-locale: PV changed from "2.0.25" to "2.0.26"
packages/core2-32-poky-linux/kexec-tools/kexec-tools-locale: PKGV changed from 2.0.25 [default] to 2.0.26 [default]
packages/core2-32-poky-linux/kexec-tools/kexec-tools-src: PKGSIZE changed from 684966 to 685247 (+0%)
packages/core2-32-poky-linux/kexec-tools/kexec-tools-src: PV changed from "2.0.25" to "2.0.26"
packages/core2-32-poky-linux/kexec-tools/kexec-tools-src: PKGV changed from 2.0.25 [default] to 2.0.26 [default]
packages/core2-32-poky-linux/kexec-tools/kexec-tools-staticdev: PV changed from "2.0.25" to "2.0.26"
packages/core2-32-poky-linux/kexec-tools/kexec-tools-staticdev: PKGV changed from 2.0.25 [default] to 2.0.26 [default]
packages/core2-32-poky-linux/kexec-tools/kexec-tools: PV changed from "2.0.25" to "2.0.26"
packages/core2-32-poky-linux/kexec-tools/kexec-tools: PKGV changed from 2.0.25 [default] to 2.0.26 [default]
packages/core2-32-poky-linux/kexec-tools/kexec: PV changed from "2.0.25" to "2.0.26"
packages/core2-32-poky-linux/kexec-tools/kexec: PKGV changed from 2.0.25 [default] to 2.0.26 [default]
packages/core2-32-poky-linux/kexec-tools: PV changed from "2.0.25" to "2.0.26"
packages/core2-32-poky-linux/kexec-tools: SRC_URI changed from "https://cdn.kernel.org/pub/linux/utils/kernel/kexec/kexec-tools-2.0.25.tar.gz file://kdump file://kdump.conf file://kdump.service file://0001-powerpc-change-the-memory-size-limit.patch file://0002-purgatory-Pass-r-directly-to-linker.patch file://0003-kexec-ARM-Fix-add_buffer_phys_virt-align-issue.patch file://0005-Disable-PIE-during-link.patch file://0001-arm64-kexec-disabled-check-if-kaslr-seed-dtb-propert.patch" to "https://cdn.kernel.org/pub/linux/utils/kernel/kexec/kexec-tools-2.0.26.tar.gz file://kdump file://kdump.conf file://kdump.service file://0001-powerpc-change-the-memory-size-limit.patch file://0002-purgatory-Pass-r-directly-to-linker.patch file://0003-kexec-ARM-Fix-add_buffer_phys_virt-align-issue.patch file://0005-Disable-PIE-during-link.patch file://0001-arm64-kexec-disabled-check-if-kaslr-seed-dtb-propert.patch"
packages/core2-32-poky-linux/kexec-tools: PKGV changed from 2.0.25 [default] to 2.0.26 [default]
packages/core2-32-poky-linux/kexec-tools/vmcore-dmesg: PV changed from "2.0.25" to "2.0.26"
packages/core2-32-poky-linux/kexec-tools/vmcore-dmesg: PKGV changed from 2.0.25 [default] to 2.0.26 [default]

--===============2446484913006950857==--

