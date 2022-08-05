Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35FD8C3276E
	for <webhook@archiver.kernel.org>; Fri,  5 Aug 2022 06:03:38 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com
 (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web12.3949.1659679408763091031
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 23:03:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=D423Il6i;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33,
 mailfrom: 010101826c99fed6-a40ac192-de75-4b24-826a-5cb710b4b845-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1659679408;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ocAhZwfdxuiY1UkaAGbkEQHAToEFQWV5X4It0JYtQYQ=;
	b=D423Il6ixKhQzTfZYIsYGKdn/oPGnMdjvkKnWum6PupdJYhhgkjsjydwTUb1eBjZ
	J+AlSV+aCpiF8BoKYtHqdrD1swU7dlSqYuOUxXQcS8lIuD2ygWhWZTH8/L6QLfTwLlG
	WPXgbRwTkrHzgWCkQOEmx/tpyRbYdd8/Nbgw+NlU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1659679408;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ocAhZwfdxuiY1UkaAGbkEQHAToEFQWV5X4It0JYtQYQ=;
	b=OIhawWom8f+Z5IGGXieYt2Uaik1VfyC6UQ+vc5lDWmp2DsmTSdOrydEFZS0CIgTK
	x0jxyGgJ16ch3xFTo1lJJdJNqzZLc7sKz9DojaC0OxIX45XkgwF/UzwZStrWP21EX7L
	0gw8Doe3Kjs1aUE1BMiYtELOFQEvKZYZt7DcSfJk=
Content-Type: multipart/mixed; boundary="===============0526286626880083638=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Randy MacLeod <Randy.MacLeod@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] rust-llvm: upgrading to 1.62.1 SUCCEEDED
Message-ID: 
 <010101826c99fed6-a40ac192-de75-4b24-826a-5cb710b4b845-000000@us-west-2.amazonses.com>
Date: Fri, 5 Aug 2022 06:03:27 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.08.05-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Aug 2022 06:03:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168901

--===============0526286626880083638==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *rust-llvm* to *1.62.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-rust-llvm-upgrade-1.62.0-1.62.1.patch
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
--===============0526286626880083638==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-rust-llvm-upgrade-1.62.0-1.62.1.patch"

RnJvbSBkMWU2ZjUyN2JkMTcxMjllMjhjM2YyNTBlMDJiYjI4MDA1ZGE1ZDVhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgNSBBdWcgMjAyMiAwMDoyMzozNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHJ1
c3QtbGx2bTogdXBncmFkZSAxLjYyLjAgLT4gMS42Mi4xCgotLS0KIC4uLi9ydXN0L3tydXN0LWxs
dm1fMS42Mi4wLmJiID0+IHJ1c3QtbGx2bV8xLjYyLjEuYmJ9ICAgICAgICAgICB8IDAKIG1ldGEv
cmVjaXBlcy1kZXZ0b29scy9ydXN0L3J1c3Qtc291cmNlLmluYyAgICAgICAgICAgICAgICAgICAg
ICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVzdC97cnVzdC1sbHZtXzEuNjIuMC5iYiA9
PiBydXN0LWxsdm1fMS42Mi4xLmJifSAoMTAwJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcnVzdC9ydXN0LWxsdm1fMS42Mi4wLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3J1c3QvcnVzdC1sbHZtXzEuNjIuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1c3QvcnVzdC1sbHZtXzEuNjIuMC5iYgpyZW5hbWUg
dG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1c3QvcnVzdC1sbHZtXzEuNjIuMS5iYgpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1c3QvcnVzdC1zb3VyY2UuaW5jIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3J1c3QvcnVzdC1zb3VyY2UuaW5jCmluZGV4IGZkYTI2NTM0ZTguLjA4
OTYwMjBiNmEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydXN0L3J1c3Qtc291
cmNlLmluYworKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVzdC9ydXN0LXNvdXJjZS5pbmMK
QEAgLTEsNSArMSw1IEBACiBTUkNfVVJJICs9ICJodHRwczovL3N0YXRpYy5ydXN0LWxhbmcub3Jn
L2Rpc3QvcnVzdGMtJHtQVn0tc3JjLnRhci54ejtuYW1lPXJ1c3QiCi1TUkNfVVJJW3J1c3Quc2hh
MjU2c3VtXSA9ICI2YzAwZWYxMTVjODk0YzI2NDVlNjBiNTA0OWE0ZjVkYWNmMWRjMGM5OTNmMzA3
NGY3YWU0ZmRmNGM3NTVkZDVlIgorU1JDX1VSSVtydXN0LnNoYTI1NnN1bV0gPSAiMDIwNjZhOTNj
MmY2NTk2Y2MwNDZhODk3ZDU3MTZjODZlMzYwN2MxY2QwZjU0ZGI5YTg2N2FlOGM4MjY1MDcyZSIK
IAogUlVTVFNSQyA9ICIke1dPUktESVJ9L3J1c3RjLSR7UFZ9LXNyYyIKIAotLSAKMi4zMS4xCgo=

--===============0526286626880083638==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/rust-llvm: SRC_URI changed from "https://static.rust-lang.org/dist/rustc-1.62.0-src.tar.xz;name=rust file://0002-llvm-allow-env-override-of-exe-path.patch;striplevel=2 file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 file://0003-llvm-fix-include-benchmarks.patch;striplevel=2" to "https://static.rust-lang.org/dist/rustc-1.62.1-src.tar.xz;name=rust file://0002-llvm-allow-env-override-of-exe-path.patch;striplevel=2 file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 file://0003-llvm-fix-include-benchmarks.patch;striplevel=2"
packages/core2-32-poky-linux/rust-llvm: PV changed from "1.62.0" to "1.62.1"
packages/core2-32-poky-linux/rust-llvm: PKGV changed from 1.62.0 [default] to 1.62.1 [default]
packages/core2-32-poky-linux/rust-llvm/rust-llvm-bugpointpasses: PV changed from "1.62.0" to "1.62.1"
packages/core2-32-poky-linux/rust-llvm/rust-llvm-bugpointpasses: PKGV changed from 1.62.0 [default] to 1.62.1 [default]
packages/core2-32-poky-linux/rust-llvm/rust-llvm-dbg: PV changed from "1.62.0" to "1.62.1"
packages/core2-32-poky-linux/rust-llvm/rust-llvm-dbg: PKGV changed from 1.62.0 [default] to 1.62.1 [default]
packages/core2-32-poky-linux/rust-llvm/rust-llvm-dev: PV changed from "1.62.0" to "1.62.1"
packages/core2-32-poky-linux/rust-llvm/rust-llvm-dev: PKGV changed from 1.62.0 [default] to 1.62.1 [default]
packages/core2-32-poky-linux/rust-llvm/rust-llvm-doc: PV changed from "1.62.0" to "1.62.1"
packages/core2-32-poky-linux/rust-llvm/rust-llvm-doc: PKGV changed from 1.62.0 [default] to 1.62.1 [default]
packages/core2-32-poky-linux/rust-llvm/rust-llvm-liblto: PV changed from "1.62.0" to "1.62.1"
packages/core2-32-poky-linux/rust-llvm/rust-llvm-liblto: PKGV changed from 1.62.0 [default] to 1.62.1 [default]
packages/core2-32-poky-linux/rust-llvm/rust-llvm-llvmhello: PV changed from "1.62.0" to "1.62.1"
packages/core2-32-poky-linux/rust-llvm/rust-llvm-llvmhello: PKGV changed from 1.62.0 [default] to 1.62.1 [default]
packages/core2-32-poky-linux/rust-llvm/rust-llvm-locale: PV changed from "1.62.0" to "1.62.1"
packages/core2-32-poky-linux/rust-llvm/rust-llvm-locale: PKGV changed from 1.62.0 [default] to 1.62.1 [default]
packages/core2-32-poky-linux/rust-llvm/rust-llvm-src: PV changed from "1.62.0" to "1.62.1"
packages/core2-32-poky-linux/rust-llvm/rust-llvm-src: PKGV changed from 1.62.0 [default] to 1.62.1 [default]
packages/core2-32-poky-linux/rust-llvm/rust-llvm-staticdev: PV changed from "1.62.0" to "1.62.1"
packages/core2-32-poky-linux/rust-llvm/rust-llvm-staticdev: PKGV changed from 1.62.0 [default] to 1.62.1 [default]
packages/core2-32-poky-linux/rust-llvm/rust-llvm: PV changed from "1.62.0" to "1.62.1"
packages/core2-32-poky-linux/rust-llvm/rust-llvm: PKGV changed from 1.62.0 [default] to 1.62.1 [default]

--===============0526286626880083638==--

