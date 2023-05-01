Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BD09CA9EA3
	for <webhook@archiver.kernel.org>; Mon,  1 May 2023 21:26:03 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.107443.1682976354279011030
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 May 2023 14:25:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=apDXjv9O;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010187d9352d86-227bc48c-7f5e-4373-80e1-908f7790b097-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1682976353;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=XnI9kZ8YzqemTslruUk5eRa/rvdHA752w5LYbtcwYdI=;
	b=apDXjv9OipE3UPEszsSLGtuNaLzvpe4TqtphrPgI/LG9ze0JaRO4CZATT6rA+9ar
	JGTWaeJicYBPoOjoSyAlkrzzyGgy7+DGjZupX6NiISgXcOFFFv2VRZLyX9fDLjaRwBs
	GyjM3Op+5VNt/Zbgie1sAh5LFc0uDd+pUIowgcEM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1682976353;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=XnI9kZ8YzqemTslruUk5eRa/rvdHA752w5LYbtcwYdI=;
	b=IKdBSfVxKf32+HhNGLXkE7hpuh7Cw/ASs4RvL98gaBdbVy45pypaAxrlZwnupjsM
	UFI6oxhR3KlJ8IEv+ZzQ2sZaxPly9Ob6QIEeDUQDcorE9kQ2HakTGMbM/3h+RKoSo3K
	lhr5AM13Z4yAH3QHdfnTJZlfnGHSXFpIO0eTpX58=
Content-Type: multipart/mixed; boundary="===============7673228496269822174=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-python: upgrading to 1.22.2 SUCCEEDED
Message-ID: <01010187d9352d86-227bc48c-7f5e-4373-80e1-908f7790b097-000000@us-west-2.amazonses.com>
Date: Mon, 1 May 2023 21:25:53 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 May 2023 21:26:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180693

--===============7673228496269822174==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gstreamer1.0-python* to *1.22.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-python-upgrade-1.22.0-1.22.2.patch
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
--===============7673228496269822174==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/gstreamer1.0-python/gstreamer1.0-python-dbg: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-python/gstreamer1.0-python-dbg: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-python/gstreamer1.0-python-dev: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-python/gstreamer1.0-python-dev: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-python/gstreamer1.0-python-doc: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-python/gstreamer1.0-python-doc: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-python/gstreamer1.0-python-locale: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-python/gstreamer1.0-python-locale: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-python/gstreamer1.0-python-src: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-python/gstreamer1.0-python-src: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-python/gstreamer1.0-python-staticdev: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-python/gstreamer1.0-python-staticdev: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-python/gstreamer1.0-python: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-python/gstreamer1.0-python: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-python: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-python: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-python/gst-python-1.22.0.tar.xz" to "https://gstreamer.freedesktop.org/src/gst-python/gst-python-1.22.2.tar.xz"
packages/core2-32-poky-linux/gstreamer1.0-python: PV changed from "1.22.0" to "1.22.2"

--===============7673228496269822174==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-python-upgrade-1.22.0-1.22.2.patch"

RnJvbSA2NmI0NzNlZjA2ZTVkOWRkMDVmMjFlZjY2NTM5NjlmYTE2ZWYyYjJhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBNYXkgMjAyMyAyMDoyNToxOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdz
dHJlYW1lcjEuMC1weXRob246IHVwZ3JhZGUgMS4yMi4wIC0+IDEuMjIuMgoKLS0tCiAuLi5yZWFt
ZXIxLjAtcHl0aG9uXzEuMjIuMC5iYiA9PiBnc3RyZWFtZXIxLjAtcHl0aG9uXzEuMjIuMi5iYn0g
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIve2dzdHJlYW1lcjEuMC1weXRo
b25fMS4yMi4wLmJiID0+IGdzdHJlYW1lcjEuMC1weXRob25fMS4yMi4yLmJifSAoOTAlKQoKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAt
cHl0aG9uXzEuMjIuMC5iYiBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3Ry
ZWFtZXIxLjAtcHl0aG9uXzEuMjIuMi5iYgpzaW1pbGFyaXR5IGluZGV4IDkwJQpyZW5hbWUgZnJv
bSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXB5dGhvbl8x
LjIyLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3Ry
ZWFtZXIxLjAtcHl0aG9uXzEuMjIuMi5iYgppbmRleCBjNDQ3ZjJjYmU4Li41MmQ5ODdlZWU1IDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4w
LXB5dGhvbl8xLjIyLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVy
L2dzdHJlYW1lcjEuMC1weXRob25fMS4yMi4yLmJiCkBAIC04LDcgKzgsNyBAQCBMSUNFTlNFID0g
IkxHUEwtMi4xLW9yLWxhdGVyIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORztt
ZDU9YzM0ZGVhZTRlMzk1Y2EwN2U3MjVhYjAwNzZhNWY3NDAiCiAKIFNSQ19VUkkgPSAiaHR0cHM6
Ly9nc3RyZWFtZXIuZnJlZWRlc2t0b3Aub3JnL3NyYy8ke1BOUkVBTH0vJHtQTlJFQUx9LSR7UFZ9
LnRhci54eiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI2YzYzYWQzNjRjYTQ2MTdlYjJjYmIzOTc1
YWIyNmM2Njc2MGViM2M3YTZhZGY1YmU2OWY5OWMxMWUyMWVmM2E1IgorU1JDX1VSSVtzaGEyNTZz
dW1dID0gImJlZjJiM2Q4MmNlNGJlNDZiNzc1YjFiYjU2MzA1YzEwMDNlZTAxYjUzNWE1M2E4MmY5
ZmU4OTI0OTcyMTUzYWQiCiAKIERFUEVORFMgPSAiZ3N0cmVhbWVyMS4wIGdzdHJlYW1lcjEuMC1w
bHVnaW5zLWJhc2UgcHl0aG9uMy1weWdvYmplY3QiCiBSREVQRU5EUzoke1BOfSArPSAiZ3N0cmVh
bWVyMS4wIGdzdHJlYW1lcjEuMC1wbHVnaW5zLWJhc2UgcHl0aG9uMy1weWdvYmplY3QiCi0tIAoy
LjM5LjIKCg==

--===============7673228496269822174==--

