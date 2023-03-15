Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21BD4C77B7B
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 15:55:32 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.12154.1678895727435057282
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 08:55:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=j8S3Ed/R;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010186e5fbc033-88636106-27e0-4313-962a-972a04e095e9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1678895726;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=1ThjxOD0aTc2T1btwVplXZAP5Y5Bdagocz6m7Zkuj/4=;
	b=j8S3Ed/R2UxJhQnffBqGyaxaQD/Ec6ojy5R5XNlA3fz3Di8S6tcgQkhGdiAdTYMJ
	Zh0doUXQ0RxMp0907YN8XrmQAJcw1+7DVT29KN6n1XDvjua8jDKm2mE/t40A6GlxDzG
	k45KbyFBy9Pz/cEVCcjNKHJ1JGw6JPQAy1dC1xTc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1678895726;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=1ThjxOD0aTc2T1btwVplXZAP5Y5Bdagocz6m7Zkuj/4=;
	b=ODRpw93RQ8bVnVUrcr2vIvtduZeu+20HBN3D82cHDScwkxn3K5VRS24QB001lSkj
	GkYVaPR0ZXekt35bXaSMIdA122x8hznpr8NCcl97E0pwYlRGeA1vOQSmD7hZaAqQBkl
	Y5B/QB5T9dlW8nNVpu/ms6IYYBD+V2620p7A9deQ=
Content-Type: multipart/mixed; boundary="===============0486907775264785921=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libsdl2: upgrading to 2.26.4 SUCCEEDED
Message-ID: <01010186e5fbc033-88636106-27e0-4313-962a-972a04e095e9-000000@us-west-2.amazonses.com>
Date: Wed, 15 Mar 2023 15:55:26 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.03.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 15:55:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178619

--===============0486907775264785921==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libsdl2* to *2.26.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libsdl2-upgrade-2.26.3-2.26.4.patch
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
--===============0486907775264785921==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libsdl2/libsdl2: FILELIST: removed "/usr/lib/libSDL2-2.0.so.0.2600.3", added "/usr/lib/libSDL2-2.0.so.0.2600.4"
Changes to packages/core2-32-poky-linux/libsdl2 (sysroot):
  /usr/lib/libSDL2-2.0.so.0 changed symlink target from libSDL2-2.0.so.0.2600.3 to libSDL2-2.0.so.0.2600.4
  /usr/lib/libSDL2-2.0.so.0.2600.3 moved to /usr/lib/libSDL2-2.0.so.0.2600.4

--===============0486907775264785921==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libsdl2-upgrade-2.26.3-2.26.4.patch"

RnJvbSBkYTA4ODU1ZTgyMDYxZjllZTA5ZjExNzM1OGExZTM3MzU4ODNlY2Y5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTWFyIDIwMjMgMTE6NDQ6NDYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJzZGwyOiB1cGdyYWRlIDIuMjYuMyAtPiAyLjI2LjQKCi0tLQogLi4uL2xpYnNkbDIve2xpYnNk
bDJfMi4yNi4zLmJiID0+IGxpYnNkbDJfMi4yNi40LmJifSAgICAgICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL2xpYnNkbDIve2xpYnNkbDJfMi4yNi4zLmJiID0+IGxpYnNkbDJfMi4y
Ni40LmJifSAoOTclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9saWJzZGwy
L2xpYnNkbDJfMi4yNi4zLmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2xpYnNkbDIvbGlic2Rs
Ml8yLjI2LjQuYmIKc2ltaWxhcml0eSBpbmRleCA5NyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL2xpYnNkbDIvbGlic2RsMl8yLjI2LjMuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBl
cy1ncmFwaGljcy9saWJzZGwyL2xpYnNkbDJfMi4yNi40LmJiCmluZGV4IDE1MDU0ZTFlYTkuLjc3
NWE2OTkyMjUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9saWJzZGwyL2xpYnNk
bDJfMi4yNi4zLmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9saWJzZGwyL2xpYnNkbDJf
Mi4yNi40LmJiCkBAIC0yNSw3ICsyNSw3IEBAIFNSQ19VUkkgPSAiaHR0cDovL3d3dy5saWJzZGwu
b3JnL3JlbGVhc2UvU0RMMi0ke1BWfS50YXIuZ3oiCiAKIFMgPSAiJHtXT1JLRElSfS9TREwyLSR7
UFZ9IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiYzY2MTIwNWE1NTNiN2QyNTI0MjVmNGI3NTFm
ZjEzMjA5ZTVlMDIwYjg3NmJiZmExNTk4NDk0YWY2MTc5MDA1NyIKK1NSQ19VUklbc2hhMjU2c3Vt
XSA9ICIxYTBmNjg2NDk4ZmI3NjhhZDlmM2Y4MGIzOTAzN2E3ZDAwNmVhYzA5M2FhZDM5Y2I0ZWJj
YzgzMmE4ODg3MjMxIgogCiBpbmhlcml0IGNtYWtlIGxpYl9wYWNrYWdlIGJpbmNvbmZpZy1kaXNh
YmxlZCBwa2djb25maWcgdXBzdHJlYW0tdmVyc2lvbi1pcy1ldmVuCiAKLS0gCjIuMzkuMgoK

--===============0486907775264785921==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libsdl2: PKGV changed from 2.26.3 [default] to 2.26.4 [default]
packages/core2-32-poky-linux/libsdl2: SRC_URI changed from "http://www.libsdl.org/release/SDL2-2.26.3.tar.gz" to "http://www.libsdl.org/release/SDL2-2.26.4.tar.gz"
packages/core2-32-poky-linux/libsdl2: PV changed from "2.26.3" to "2.26.4"
packages/core2-32-poky-linux/libsdl2/libsdl2-bin: PKGV changed from 2.26.3 [default] to 2.26.4 [default]
packages/core2-32-poky-linux/libsdl2/libsdl2-bin: PV changed from "2.26.3" to "2.26.4"
packages/core2-32-poky-linux/libsdl2/libsdl2-dbg: PKGV changed from 2.26.3 [default] to 2.26.4 [default]
packages/core2-32-poky-linux/libsdl2/libsdl2-dbg: FILELIST: removed "/usr/lib/.debug/libSDL2-2.0.so.0.2600.3", added "/usr/lib/.debug/libSDL2-2.0.so.0.2600.4"
packages/core2-32-poky-linux/libsdl2/libsdl2-dbg: PV changed from "2.26.3" to "2.26.4"
packages/core2-32-poky-linux/libsdl2/libsdl2-dbg: PKGSIZE changed from 6183536 to 6183524 (-0%)
packages/core2-32-poky-linux/libsdl2/libsdl2-dev: PKGV changed from 2.26.3 [default] to 2.26.4 [default]
packages/core2-32-poky-linux/libsdl2/libsdl2-dev: PV changed from "2.26.3" to "2.26.4"
packages/core2-32-poky-linux/libsdl2/libsdl2-doc: PKGV changed from 2.26.3 [default] to 2.26.4 [default]
packages/core2-32-poky-linux/libsdl2/libsdl2-doc: PV changed from "2.26.3" to "2.26.4"
packages/core2-32-poky-linux/libsdl2/libsdl2-locale: PKGV changed from 2.26.3 [default] to 2.26.4 [default]
packages/core2-32-poky-linux/libsdl2/libsdl2-locale: PV changed from "2.26.3" to "2.26.4"
packages/core2-32-poky-linux/libsdl2/libsdl2-src: PKGV changed from 2.26.3 [default] to 2.26.4 [default]
packages/core2-32-poky-linux/libsdl2/libsdl2-src: PV changed from "2.26.3" to "2.26.4"
packages/core2-32-poky-linux/libsdl2/libsdl2-src: PKGSIZE changed from 10022397 to 10022441 (+0%)
packages/core2-32-poky-linux/libsdl2/libsdl2-staticdev: PKGV changed from 2.26.3 [default] to 2.26.4 [default]
packages/core2-32-poky-linux/libsdl2/libsdl2-staticdev: PV changed from "2.26.3" to "2.26.4"
packages/core2-32-poky-linux/libsdl2/libsdl2-staticdev: PKGSIZE changed from 9130874 to 9130710 (-0%)
packages/core2-32-poky-linux/libsdl2/libsdl2: PKGV changed from 2.26.3 [default] to 2.26.4 [default]
packages/core2-32-poky-linux/libsdl2/libsdl2: FILELIST: removed "/usr/lib/libSDL2-2.0.so.0.2600.3", added "/usr/lib/libSDL2-2.0.so.0.2600.4"
packages/core2-32-poky-linux/libsdl2/libsdl2: PV changed from "2.26.3" to "2.26.4"
Changes to packages/core2-32-poky-linux/libsdl2 (sysroot):
  /usr/lib/libSDL2-2.0.so.0 changed symlink target from libSDL2-2.0.so.0.2600.3 to libSDL2-2.0.so.0.2600.4
  /usr/lib/libSDL2-2.0.so.0.2600.3 moved to /usr/lib/libSDL2-2.0.so.0.2600.4

--===============0486907775264785921==--

