Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72D54C88CB5
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 14:45:19 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.24032.1677681913958111116
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Mar 2023 06:45:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=P7s8ZhK2;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101869da26f46-d204ffeb-1db5-46a1-8cfe-06b8bcabe646-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1677681913;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=K1buV4BPu+123i3yPUuVy7jPLWFvg44wpKe8RL9rzhQ=;
	b=P7s8ZhK2eEorqGT2Ugn4D7Avc8xMC4jwx4liHAyI973dNsJuuv6galQ0Z4irjxqo
	NHO1yrPidXHm2XvF63u9QmId4y4J2b25od2m+OWqrIQMamN0W2LvWJPcjspQa0UOAtj
	lGzxaPncz8dZHK3d/9T0NE7nSKiTv9obm+I8n1OE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1677681913;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=K1buV4BPu+123i3yPUuVy7jPLWFvg44wpKe8RL9rzhQ=;
	b=UA6Fpl3wz30GYzre9fAdq0U9/oXziTzDdyVX7qKz2L9k9P40I2+uWiRXC/i3UL6G
	ObPw3GBaq5CkLkShmYYcBiCIzOEoI0Osky8asWBuuVbJqZKftaPXpoAhln/jgS/rGZY
	DuQQ2nzSwSxzp9OoNpcsl+BWKyOgg7v/NoeHEQc4=
Content-Type: multipart/mixed; boundary="===============6099225205552315044=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-more-itertools: upgrading to 9.1.0 SUCCEEDED
Message-ID: <010101869da26f46-d204ffeb-1db5-46a1-8cfe-06b8bcabe646-000000@us-west-2.amazonses.com>
Date: Wed, 1 Mar 2023 14:45:13 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.03.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Mar 2023 14:45:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177895

--===============6099225205552315044==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-more-itertools* to *9.1.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-more-itertools-upgrade-9.0.0-9.1.0.patch
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
--===============6099225205552315044==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-more-itertools: SRC_URI changed from "https://files.pythonhosted.org/packages/source/m/more-itertools/more-itertools-9.0.0.tar.gz file://run-ptest" to "https://files.pythonhosted.org/packages/source/m/more-itertools/more-itertools-9.1.0.tar.gz file://run-ptest"
packages/core2-32-poky-linux/python3-more-itertools: PKGV changed from 9.0.0 [default] to 9.1.0 [default]
packages/core2-32-poky-linux/python3-more-itertools: PV changed from "9.0.0" to "9.1.0"
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools-dbg: PKGV changed from 9.0.0 [default] to 9.1.0 [default]
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools-dbg: PV changed from "9.0.0" to "9.1.0"
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools-dev: PKGV changed from 9.0.0 [default] to 9.1.0 [default]
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools-dev: PV changed from "9.0.0" to "9.1.0"
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools-doc: PKGV changed from 9.0.0 [default] to 9.1.0 [default]
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools-doc: PV changed from "9.0.0" to "9.1.0"
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools-locale: PKGV changed from 9.0.0 [default] to 9.1.0 [default]
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools-locale: PV changed from "9.0.0" to "9.1.0"
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools-ptest: PKGV changed from 9.0.0 [default] to 9.1.0 [default]
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools-ptest: PKGSIZE changed from 206716 to 211583 (+2%)
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools-ptest: PV changed from "9.0.0" to "9.1.0"
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools-src: PKGV changed from 9.0.0 [default] to 9.1.0 [default]
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools-src: PV changed from "9.0.0" to "9.1.0"
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools-staticdev: PKGV changed from 9.0.0 [default] to 9.1.0 [default]
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools-staticdev: PV changed from "9.0.0" to "9.1.0"
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools: PKGV changed from 9.0.0 [default] to 9.1.0 [default]
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools: PKGSIZE changed from 417148 to 427809 (+3%)
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools: PV changed from "9.0.0" to "9.1.0"
Changes to packages/core2-32-poky-linux/python3-more-itertools (sysroot):
  /usr/lib/python3.11/site-packages/more_itertools-9.0.0.dist-info moved to /usr/lib/python3.11/site-packages/more_itertools-9.1.0.dist-info
Changes to packages/x86_64-linux/python3-more-itertools-native (sysroot):
  /usr/lib/python3.11/site-packages/more_itertools-9.0.0.dist-info moved to /usr/lib/python3.11/site-packages/more_itertools-9.1.0.dist-info

--===============6099225205552315044==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-more-itertools-upgrade-9.0.0-9.1.0.patch"

RnJvbSA3MGMzMmIzODg0YjMxYjhlZGNiZjBiYzE1NjQ2NzI5MWJhNjRmZDY2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBNYXIgMjAyMyAwODoyNTo1MyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtbW9yZS1pdGVydG9vbHM6IHVwZ3JhZGUgOS4wLjAgLT4gOS4xLjAKCi0tLQogLi4uLW1v
cmUtaXRlcnRvb2xzXzkuMC4wLmJiID0+IHB5dGhvbjMtbW9yZS1pdGVydG9vbHNfOS4xLjAuYmJ9
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1tb3JlLWl0ZXJ0b29s
c185LjAuMC5iYiA9PiBweXRob24zLW1vcmUtaXRlcnRvb2xzXzkuMS4wLmJifSAoODYlKQoKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1tb3JlLWl0ZXJ0
b29sc185LjAuMC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1tb3Jl
LWl0ZXJ0b29sc185LjEuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDg2JQpyZW5hbWUgZnJvbSBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbW9yZS1pdGVydG9vbHNfOS4wLjAuYmIK
cmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1tb3JlLWl0ZXJ0
b29sc185LjEuMC5iYgppbmRleCBmY2UzYWVhODk3Li43NjAyMzUwNzk1IDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbW9yZS1pdGVydG9vbHNfOS4wLjAu
YmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1vcmUtaXRlcnRv
b2xzXzkuMS4wLmJiCkBAIC0zLDcgKzMsNyBAQCBIT01FUEFHRSA9ICJodHRwczovL2dpdGh1Yi5j
b20vZXJpa3Jvc2UvbW9yZS1pdGVydG9vbHMiCiBMSUNFTlNFID0gIk1JVCIKIExJQ19GSUxFU19D
SEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTMzOTZlYTMwZjlkMjEzODlkNzg1NzcxOTgxNmY4
M2I1IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNWE2MjU3ZTQwODc4ZWYwNTIwYjE4MDM5OTBl
M2UyMjMwM2E0MWI1NzE0MDA2YzMyYTNmZDgzMDRiMjZlYTFhYiIKK1NSQ19VUklbc2hhMjU2c3Vt
XSA9ICJjYWJhYTM0MWFkMDM4OWVhODNjMTdhOTQ1NjZhNTNhZTRjOWQwNzM0OTg2MWVjYjE0ZGM2
ZDAzNDVjZjlhYzVkIgogCiBpbmhlcml0IHB5cGkgcHl0aG9uX2ZsaXRfY29yZSBwdGVzdAogCi0t
IAoyLjM5LjIKCg==

--===============6099225205552315044==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-more-itertools (sysroot):
  /usr/lib/python3.11/site-packages/more_itertools-9.0.0.dist-info moved to /usr/lib/python3.11/site-packages/more_itertools-9.1.0.dist-info
Changes to packages/x86_64-linux/python3-more-itertools-native (sysroot):
  /usr/lib/python3.11/site-packages/more_itertools-9.0.0.dist-info moved to /usr/lib/python3.11/site-packages/more_itertools-9.1.0.dist-info

--===============6099225205552315044==--

