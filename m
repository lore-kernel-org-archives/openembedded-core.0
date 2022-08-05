Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 176A6C32765
	for <webhook@archiver.kernel.org>; Fri,  5 Aug 2022 06:03:38 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com
 (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.4051.1659679407917235114
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 23:03:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=YYi9C+4r;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30,
 mailfrom: 010101826c9a00ce-65a86102-87e7-47ce-9a4f-eb81cd8aae5b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1659679408;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=B6rWcjBYghvruEhWgPvSWExX9neRc9ynB2qzcG/GsFM=;
	b=YYi9C+4rcFXbq1WVjE3l9c3DOqYI8kh8vOw8fiCq15kKP0bmu6pPIndwljGwxg3y
	7sxZpgUDk9qZv+NLAP+j35SE6XIx6ssIRQCC3J0nknp12SaQXpbikVQDcXRWFQNqaX9
	NhqgCjDsXsO+YHKx8B0hm5jZTjwsxZ2Ez3qCBV9w=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1659679408;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=B6rWcjBYghvruEhWgPvSWExX9neRc9ynB2qzcG/GsFM=;
	b=NfR4WEqkXGnVJ59rmjGZH3Y1G0U44bUbNi5QEy1TAyc5ml1f07WPCZi4W2XmMeQH
	HDjg6ecXbyzr3pYlXDtiYvjpujZwZx2IisRWVTLBLkfgtaFTK7UQyFF9+p0+KRCvfwf
	tUBg+lhfnkVlgTEaK8tBztDRYhYg0R2MurSdrCVs=
Content-Type: multipart/mixed; boundary="===============8508197026019041402=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] kexec-tools: upgrading to 2.0.25 SUCCEEDED
Message-ID: 
 <010101826c9a00ce-65a86102-87e7-47ce-9a4f-eb81cd8aae5b-000000@us-west-2.amazonses.com>
Date: Fri, 5 Aug 2022 06:03:28 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.08.05-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Aug 2022 06:03:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168908

--===============8508197026019041402==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *kexec-tools* to *2.0.25* has Succeeded.

Next steps:
    - apply the patch: git am 0001-kexec-tools-upgrade-2.0.24-2.0.25.patch
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
--===============8508197026019041402==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/kexec-tools/kdump: PV changed from "2.0.24" to "2.0.25"
packages/core2-32-poky-linux/kexec-tools/kdump: PKGV changed from 2.0.24 [default] to 2.0.25 [default]
packages/core2-32-poky-linux/kexec-tools/kexec-tools-dbg: PKGSIZE changed from 451688 to 451740 (+0%)
packages/core2-32-poky-linux/kexec-tools/kexec-tools-dbg: PV changed from "2.0.24" to "2.0.25"
packages/core2-32-poky-linux/kexec-tools/kexec-tools-dbg: PKGV changed from 2.0.24 [default] to 2.0.25 [default]
packages/core2-32-poky-linux/kexec-tools/kexec-tools-dev: PV changed from "2.0.24" to "2.0.25"
packages/core2-32-poky-linux/kexec-tools/kexec-tools-dev: PKGV changed from 2.0.24 [default] to 2.0.25 [default]
packages/core2-32-poky-linux/kexec-tools/kexec-tools-doc: PV changed from "2.0.24" to "2.0.25"
packages/core2-32-poky-linux/kexec-tools/kexec-tools-doc: PKGV changed from 2.0.24 [default] to 2.0.25 [default]
packages/core2-32-poky-linux/kexec-tools/kexec-tools-locale: PV changed from "2.0.24" to "2.0.25"
packages/core2-32-poky-linux/kexec-tools/kexec-tools-locale: PKGV changed from 2.0.24 [default] to 2.0.25 [default]
packages/core2-32-poky-linux/kexec-tools/kexec-tools-src: PKGSIZE changed from 684426 to 684966 (+0%)
packages/core2-32-poky-linux/kexec-tools/kexec-tools-src: PV changed from "2.0.24" to "2.0.25"
packages/core2-32-poky-linux/kexec-tools/kexec-tools-src: PKGV changed from 2.0.24 [default] to 2.0.25 [default]
packages/core2-32-poky-linux/kexec-tools/kexec-tools-staticdev: PV changed from "2.0.24" to "2.0.25"
packages/core2-32-poky-linux/kexec-tools/kexec-tools-staticdev: PKGV changed from 2.0.24 [default] to 2.0.25 [default]
packages/core2-32-poky-linux/kexec-tools/kexec-tools: PV changed from "2.0.24" to "2.0.25"
packages/core2-32-poky-linux/kexec-tools/kexec-tools: PKGV changed from 2.0.24 [default] to 2.0.25 [default]
packages/core2-32-poky-linux/kexec-tools/kexec: PV changed from "2.0.24" to "2.0.25"
packages/core2-32-poky-linux/kexec-tools/kexec: PKGV changed from 2.0.24 [default] to 2.0.25 [default]
packages/core2-32-poky-linux/kexec-tools: PV changed from "2.0.24" to "2.0.25"
packages/core2-32-poky-linux/kexec-tools: SRC_URI changed from "https://cdn.kernel.org/pub/linux/utils/kernel/kexec/kexec-tools-2.0.24.tar.gz file://kdump file://kdump.conf file://kdump.service file://0001-powerpc-change-the-memory-size-limit.patch file://0002-purgatory-Pass-r-directly-to-linker.patch file://0003-kexec-ARM-Fix-add_buffer_phys_virt-align-issue.patch file://0005-Disable-PIE-during-link.patch file://0001-arm64-kexec-disabled-check-if-kaslr-seed-dtb-propert.patch" to "https://cdn.kernel.org/pub/linux/utils/kernel/kexec/kexec-tools-2.0.25.tar.gz file://kdump file://kdump.conf file://kdump.service file://0001-powerpc-change-the-memory-size-limit.patch file://0002-purgatory-Pass-r-directly-to-linker.patch file://0003-kexec-ARM-Fix-add_buffer_phys_virt-align-issue.patch file://0005-Disable-PIE-during-link.patch file://0001-arm64-kexec-disabled-check-if-kaslr-seed-dtb-propert.patch"
packages/core2-32-poky-linux/kexec-tools: PKGV changed from 2.0.24 [default] to 2.0.25 [default]
packages/core2-32-poky-linux/kexec-tools/vmcore-dmesg: PV changed from "2.0.24" to "2.0.25"
packages/core2-32-poky-linux/kexec-tools/vmcore-dmesg: PKGV changed from 2.0.24 [default] to 2.0.25 [default]

--===============8508197026019041402==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-kexec-tools-upgrade-2.0.24-2.0.25.patch"

RnJvbSBmN2JhYmZlZDM4OTgwNmU2YWEyNTdmYzgxMTFjMDU3YjA5MGI2ZWI4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgNSBBdWcgMjAyMiAwMjozMzo1MiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGtl
eGVjLXRvb2xzOiB1cGdyYWRlIDIuMC4yNCAtPiAyLjAuMjUKCi0tLQogLi4uL2tleGVjL3trZXhl
Yy10b29sc18yLjAuMjQuYmIgPT4ga2V4ZWMtdG9vbHNfMi4wLjI1LmJifSAgICAgIHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWtlcm5lbC9rZXhlYy97a2V4ZWMtdG9vbHNfMi4wLjI0LmJiID0+IGtleGVjLXRv
b2xzXzIuMC4yNS5iYn0gKDk3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMta2VybmVsL2tl
eGVjL2tleGVjLXRvb2xzXzIuMC4yNC5iYiBiL21ldGEvcmVjaXBlcy1rZXJuZWwva2V4ZWMva2V4
ZWMtdG9vbHNfMi4wLjI1LmJiCnNpbWlsYXJpdHkgaW5kZXggOTclCnJlbmFtZSBmcm9tIG1ldGEv
cmVjaXBlcy1rZXJuZWwva2V4ZWMva2V4ZWMtdG9vbHNfMi4wLjI0LmJiCnJlbmFtZSB0byBtZXRh
L3JlY2lwZXMta2VybmVsL2tleGVjL2tleGVjLXRvb2xzXzIuMC4yNS5iYgppbmRleCBmZGFkNDBl
ZDZhLi45Nzg0NDA0Y2ZmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMta2VybmVsL2tleGVjL2tl
eGVjLXRvb2xzXzIuMC4yNC5iYgorKysgYi9tZXRhL3JlY2lwZXMta2VybmVsL2tleGVjL2tleGVj
LXRvb2xzXzIuMC4yNS5iYgpAQCAtMjAsNyArMjAsNyBAQCBTUkNfVVJJID0gIiR7S0VSTkVMT1JH
X01JUlJPUn0vbGludXgvdXRpbHMva2VybmVsL2tleGVjL2tleGVjLXRvb2xzLSR7UFZ9LnRhci5n
egogICAgICAgICAgICBmaWxlOi8vMDAwMS1hcm02NC1rZXhlYy1kaXNhYmxlZC1jaGVjay1pZi1r
YXNsci1zZWVkLWR0Yi1wcm9wZXJ0LnBhdGNoIFwKICAgICAgICAgICAgIgogCi1TUkNfVVJJW3No
YTI1NnN1bV0gPSAiMWZmOTEzNzMyN2FlYWMzYjJhYjkyMmE3MWJjNmViNDY1NTU3MWEwZmY3N2Mw
NzFjYjkyNzgzYTlhNTlkNGQyNiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI0ZWVhNmY4NjQxZWEz
ZTM0OTY1M2E1MmM3ZmQzM2JlMTEzMjMyMmE1ZjNkYzlmMWE2YWRlODg2MDE5NzY3MzIwIgogCiBp
bmhlcml0IGF1dG90b29scyB1cGRhdGUtcmMuZCBzeXN0ZW1kCiAKLS0gCjIuMzEuMQoK

--===============8508197026019041402==--

