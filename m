Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5C7BC64EC7
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 00:40:39 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web09.854.1667349632132217010
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 17:40:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=N/1svPMy;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018435c85763-d871df84-da8e-425a-bd55-cf66a3d3558b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1667349633;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=F+bn33PTmhJlR7TcVF73rOHvNz12MS+YOnulslOz4dM=;
	b=N/1svPMySa9pbNg5Np7EcufKEWLkXBZ3tlD58hWlMaRUJadr1by95ISfm4P1aETa
	IagoxIR4i1rngIOSQn0jPoohsJMmmcflnPOV0cQv3DxqI0pMtt4PvXLFWSf6EXzY8FS
	u/x2G7apgY+vyViowdIu4RL6mWEB0Htlx4IlUQuU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1667349633;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=F+bn33PTmhJlR7TcVF73rOHvNz12MS+YOnulslOz4dM=;
	b=FWrP94EPDefX4qGrFB9AsqOlOxjHdBPVerQvotH9FpC0qnrjBvci3Orsd4oIQFx0
	oT9amIeE5z6PIG9qJVG/Fw6PHB3TpJ3xqBcPTn3vBke7DA5Iwg9AOrE3N22x0q/x9jr
	M+El6DDIsaT73ALKWLA/fjaRRg76ElNdQqHn334I=
Content-Type: multipart/mixed; boundary="===============1272344180921407463=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-more-itertools: upgrading to 9.0.0 SUCCEEDED
Message-ID: <0101018435c85763-d871df84-da8e-425a-bd55-cf66a3d3558b-000000@us-west-2.amazonses.com>
Date: Wed, 2 Nov 2022 00:40:32 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.11.02-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 00:40:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172426

--===============1272344180921407463==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-more-itertools* to *9.0.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-more-itertools-upgrade-8.14.0-9.0.0.patch
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
--===============1272344180921407463==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-more-itertools: SRC_URI changed from "https://files.pythonhosted.org/packages/source/m/more-itertools/more-itertools-8.14.0.tar.gz file://run-ptest" to "https://files.pythonhosted.org/packages/source/m/more-itertools/more-itertools-9.0.0.tar.gz file://run-ptest"
packages/core2-32-poky-linux/python3-more-itertools: PKGV changed from 8.14.0 [default] to 9.0.0 [default]
packages/core2-32-poky-linux/python3-more-itertools: PV changed from "8.14.0" to "9.0.0"
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools-dbg: PKGV changed from 8.14.0 [default] to 9.0.0 [default]
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools-dbg: PV changed from "8.14.0" to "9.0.0"
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools-dev: PKGV changed from 8.14.0 [default] to 9.0.0 [default]
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools-dev: PV changed from "8.14.0" to "9.0.0"
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools-doc: PKGV changed from 8.14.0 [default] to 9.0.0 [default]
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools-doc: PV changed from "8.14.0" to "9.0.0"
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools-locale: PKGV changed from 8.14.0 [default] to 9.0.0 [default]
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools-locale: PV changed from "8.14.0" to "9.0.0"
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools-ptest: PKGSIZE changed from 202792 to 206716 (+2%)
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools-ptest: PKGV changed from 8.14.0 [default] to 9.0.0 [default]
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools-ptest: PV changed from "8.14.0" to "9.0.0"
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools-src: PKGV changed from 8.14.0 [default] to 9.0.0 [default]
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools-src: PV changed from "8.14.0" to "9.0.0"
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools-staticdev: PKGV changed from 8.14.0 [default] to 9.0.0 [default]
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools-staticdev: PV changed from "8.14.0" to "9.0.0"
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools: PKGSIZE changed from 412229 to 418143 (+1%)
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools: PKGV changed from 8.14.0 [default] to 9.0.0 [default]
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools: PV changed from "8.14.0" to "9.0.0"
Changes to packages/core2-32-poky-linux/python3-more-itertools (sysroot):
  /usr/lib/python3.11/site-packages/more_itertools-9.0.0.dist-info was added
  /usr/lib/python3.11/site-packages/more_itertools-9.0.0.dist-info/LICENSE was added
  /usr/lib/python3.11/site-packages/more_itertools-9.0.0.dist-info/METADATA was added
  /usr/lib/python3.11/site-packages/more_itertools-9.0.0.dist-info/RECORD was added
  /usr/lib/python3.11/site-packages/more_itertools-9.0.0.dist-info/WHEEL was added
  /usr/lib/python3.11/site-packages/more_itertools-8.14.0.dist-info was removed
  /usr/lib/python3.11/site-packages/more_itertools-8.14.0.dist-info/LICENSE was removed
  /usr/lib/python3.11/site-packages/more_itertools-8.14.0.dist-info/METADATA was removed
  /usr/lib/python3.11/site-packages/more_itertools-8.14.0.dist-info/RECORD was removed
  /usr/lib/python3.11/site-packages/more_itertools-8.14.0.dist-info/WHEEL was removed

--===============1272344180921407463==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-more-itertools (sysroot):
  /usr/lib/python3.11/site-packages/more_itertools-9.0.0.dist-info was added
  /usr/lib/python3.11/site-packages/more_itertools-9.0.0.dist-info/LICENSE was added
  /usr/lib/python3.11/site-packages/more_itertools-9.0.0.dist-info/METADATA was added
  /usr/lib/python3.11/site-packages/more_itertools-9.0.0.dist-info/RECORD was added
  /usr/lib/python3.11/site-packages/more_itertools-9.0.0.dist-info/WHEEL was added
  /usr/lib/python3.11/site-packages/more_itertools-8.14.0.dist-info was removed
  /usr/lib/python3.11/site-packages/more_itertools-8.14.0.dist-info/LICENSE was removed
  /usr/lib/python3.11/site-packages/more_itertools-8.14.0.dist-info/METADATA was removed
  /usr/lib/python3.11/site-packages/more_itertools-8.14.0.dist-info/RECORD was removed
  /usr/lib/python3.11/site-packages/more_itertools-8.14.0.dist-info/WHEEL was removed

--===============1272344180921407463==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-more-itertools-upgrade-8.14.0-9.0.0.patch"

RnJvbSA2YTc4NDA1ZmIwZGMyZDJlMTU5ODMzYTAyYjIyOWNkODI5YmVmZmU0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBOb3YgMjAyMiAxMDowODoyNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtbW9yZS1pdGVydG9vbHM6IHVwZ3JhZGUgOC4xNC4wIC0+IDkuMC4wCgotLS0KIC4uLm1v
cmUtaXRlcnRvb2xzXzguMTQuMC5iYiA9PiBweXRob24zLW1vcmUtaXRlcnRvb2xzXzkuMC4wLmJi
fSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtbW9yZS1pdGVydG9v
bHNfOC4xNC4wLmJiID0+IHB5dGhvbjMtbW9yZS1pdGVydG9vbHNfOS4wLjAuYmJ9ICg4NiUpCgpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1vcmUtaXRl
cnRvb2xzXzguMTQuMC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1t
b3JlLWl0ZXJ0b29sc185LjAuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDg2JQpyZW5hbWUgZnJvbSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbW9yZS1pdGVydG9vbHNfOC4xNC4w
LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbW9yZS1p
dGVydG9vbHNfOS4wLjAuYmIKaW5kZXggYzk1NWY5M2Q5Yi4uZmNlM2FlYTg5NyAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1vcmUtaXRlcnRvb2xzXzgu
MTQuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbW9yZS1p
dGVydG9vbHNfOS4wLjAuYmIKQEAgLTMsNyArMyw3IEBAIEhPTUVQQUdFID0gImh0dHBzOi8vZ2l0
aHViLmNvbS9lcmlrcm9zZS9tb3JlLWl0ZXJ0b29scyIKIExJQ0VOU0UgPSAiTUlUIgogTElDX0ZJ
TEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9MzM5NmVhMzBmOWQyMTM4OWQ3ODU3NzE5
ODE2ZjgzYjUiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJjMDk0NDNjZDNkNTQzOGI4ZGFmY2Nk
ODY3YTZiYzFjYjA4OTQzODllOTBjYjUzZDIyNzQ1NmIwYjBiY2NiNzUwIgorU1JDX1VSSVtzaGEy
NTZzdW1dID0gIjVhNjI1N2U0MDg3OGVmMDUyMGIxODAzOTkwZTNlMjIzMDNhNDFiNTcxNDAwNmMz
MmEzZmQ4MzA0YjI2ZWExYWIiCiAKIGluaGVyaXQgcHlwaSBweXRob25fZmxpdF9jb3JlIHB0ZXN0
CiAKLS0gCjIuMzEuMQoK

--===============1272344180921407463==--

