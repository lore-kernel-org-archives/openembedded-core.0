Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4934CC7EE25
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 15:55:32 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.12148.1678895726844298993
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 08:55:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=nu5YtjBt;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010186e5fbbe23-3f5b5185-170d-46ff-b5db-b8fde86eecfb-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1678895726;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=wSEWQmVbQRK6KBUUegYjqa+li3WlXhjazbxVocTQsB4=;
	b=nu5YtjBtpqFYy37KDvFt7Z5H7d1EH0a1vz/hZQNXMTP7gYRTdWGWMnnGKH2eWDGT
	3Jx9VAWjVWy0UztAaWK+v+lDETU2W/IrK6ZcCBys/TfYsTozgly6bFAvRGJ+emuTwPG
	5SusT3Nc88u/bcq1f5XnwTSy4BpDzmI+S102d7Z4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1678895726;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=wSEWQmVbQRK6KBUUegYjqa+li3WlXhjazbxVocTQsB4=;
	b=nCdckGANiwZRNCUmcLwlD70LPHryKQMjdQTrVLMkA7hMGyGRTw1GsFzHVLLqXcJB
	oQDCjeeEytN5r6ofca6DMS1xuTqWC7brwgj1x19HnaQu0ld4XCp2C4jgXhLZ4fa4sLa
	fYcfFcQnX9v6UsknKWBsmNuqBEBUM1pTolz0rSLI=
Content-Type: multipart/mixed; boundary="===============2814355746939151358=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] grep: upgrading to 3.9 SUCCEEDED
Message-ID: <01010186e5fbbe23-3f5b5185-170d-46ff-b5db-b8fde86eecfb-000000@us-west-2.amazonses.com>
Date: Wed, 15 Mar 2023 15:55:26 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.03.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 15:55:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178611

--===============2814355746939151358==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *grep* to *3.9* has Succeeded.

Next steps:
    - apply the patch: git am 0001-grep-upgrade-3.8-3.9.patch
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
--===============2814355746939151358==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/grep/grep-locale-hu: PKGSIZE changed from 12397 to 18582 (+50%)

--===============2814355746939151358==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-grep-upgrade-3.8-3.9.patch"

RnJvbSBhZjVjYTY2ZjQ2ZGI1N2VkYmYxODM4ODAyOWM2NTUxN2FkNmJkZmNmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTWFyIDIwMjMgMTA6MDI6NTQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
cmVwOiB1cGdyYWRlIDMuOCAtPiAzLjkKCi0tLQogbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2dyZXAv
e2dyZXBfMy44LmJiID0+IGdyZXBfMy45LmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9n
cmVwL3tncmVwXzMuOC5iYiA9PiBncmVwXzMuOS5iYn0gKDk0JSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZXh0ZW5kZWQvZ3JlcC9ncmVwXzMuOC5iYiBiL21ldGEvcmVjaXBlcy1leHRlbmRl
ZC9ncmVwL2dyZXBfMy45LmJiCnNpbWlsYXJpdHkgaW5kZXggOTQlCnJlbmFtZSBmcm9tIG1ldGEv
cmVjaXBlcy1leHRlbmRlZC9ncmVwL2dyZXBfMy44LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
ZXh0ZW5kZWQvZ3JlcC9ncmVwXzMuOS5iYgppbmRleCBiZTJjYWFhOTIwLi4zYzM5YTVmYjU2IDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZ3JlcC9ncmVwXzMuOC5iYgorKysgYi9t
ZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZ3JlcC9ncmVwXzMuOS5iYgpAQCAtOCw3ICs4LDcgQEAgTElD
X0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9MWViYmQzZTM0MjM3YWYyNmRhNWRj
MDhhNGU0NDA0NjQiCiAKIFNSQ19VUkkgPSAiJHtHTlVfTUlSUk9SfS9ncmVwL2dyZXAtJHtQVn0u
dGFyLnh6IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNDk4ZDdjYzFiNGZiMDgxOTA0ZDg3MzQz
ZmViYjczNDc1Y2Y3NzFlNDI0ZmI3ZTYxNDFhZmY2NjAxM2FiYzM4MiIKK1NSQ19VUklbc2hhMjU2
c3VtXSA9ICJhYmNkMTE0MDllZTIzZDRjYWYzNWZlYjQyMmU1M2JiYWM4NjcwMTRjZmVlZDMxM2Ji
NWY0ODhhY2ExNzBiNTk5IgogCiBpbmhlcml0IGF1dG90b29scyBnZXR0ZXh0IHRleGluZm8gcGtn
Y29uZmlnCiAKLS0gCjIuMzkuMgoK

--===============2814355746939151358==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/grep/grep-dbg: PKGV changed from 3.8 [default] to 3.9 [default]
packages/core2-32-poky-linux/grep/grep-dbg: PKGSIZE changed from 791672 to 798648 (+1%)
packages/core2-32-poky-linux/grep/grep-dbg: PV changed from "3.8" to "3.9"
packages/core2-32-poky-linux/grep/grep-dev: PKGV changed from 3.8 [default] to 3.9 [default]
packages/core2-32-poky-linux/grep/grep-dev: PV changed from "3.8" to "3.9"
packages/core2-32-poky-linux/grep/grep-doc: PKGV changed from 3.8 [default] to 3.9 [default]
packages/core2-32-poky-linux/grep/grep-doc: PKGSIZE changed from 169901 to 169836 (-0%)
packages/core2-32-poky-linux/grep/grep-doc: PV changed from "3.8" to "3.9"
packages/core2-32-poky-linux/grep/grep-locale-af: PKGV changed from 3.8 [default] to 3.9 [default]
packages/core2-32-poky-linux/grep/grep-locale-af: PV changed from "3.8" to "3.9"
packages/core2-32-poky-linux/grep/grep-locale-be: PKGV changed from 3.8 [default] to 3.9 [default]
packages/core2-32-poky-linux/grep/grep-locale-be: PKGSIZE changed from 23017 to 23295 (+1%)
packages/core2-32-poky-linux/grep/grep-locale-be: PV changed from "3.8" to "3.9"
packages/core2-32-poky-linux/grep/grep-locale-bg: PKGV changed from 3.8 [default] to 3.9 [default]
packages/core2-32-poky-linux/grep/grep-locale-bg: PKGSIZE changed from 23703 to 23919 (+1%)
packages/core2-32-poky-linux/grep/grep-locale-bg: PV changed from "3.8" to "3.9"
packages/core2-32-poky-linux/grep/grep-locale-ca: PKGV changed from 3.8 [default] to 3.9 [default]
packages/core2-32-poky-linux/grep/grep-locale-ca: PV changed from "3.8" to "3.9"
packages/core2-32-poky-linux/grep/grep-locale-cs: PKGV changed from 3.8 [default] to 3.9 [default]
packages/core2-32-poky-linux/grep/grep-locale-cs: PKGSIZE changed from 18684 to 18837 (+1%)
packages/core2-32-poky-linux/grep/grep-locale-cs: PV changed from "3.8" to "3.9"
packages/core2-32-poky-linux/grep/grep-locale-da: PKGV changed from 3.8 [default] to 3.9 [default]
packages/core2-32-poky-linux/grep/grep-locale-da: PKGSIZE changed from 15997 to 15797 (-1%)
packages/core2-32-poky-linux/grep/grep-locale-da: PV changed from "3.8" to "3.9"
packages/core2-32-poky-linux/grep/grep-locale-de: PKGV changed from 3.8 [default] to 3.9 [default]
packages/core2-32-poky-linux/grep/grep-locale-de: PKGSIZE changed from 19104 to 19241 (+1%)
packages/core2-32-poky-linux/grep/grep-locale-de: PV changed from "3.8" to "3.9"
packages/core2-32-poky-linux/grep/grep-locale-el: PKGV changed from 3.8 [default] to 3.9 [default]
packages/core2-32-poky-linux/grep/grep-locale-el: PV changed from "3.8" to "3.9"
packages/core2-32-poky-linux/grep/grep-locale-eo: PKGV changed from 3.8 [default] to 3.9 [default]
packages/core2-32-poky-linux/grep/grep-locale-eo: PKGSIZE changed from 16503 to 17420 (+6%)
packages/core2-32-poky-linux/grep/grep-locale-eo: PV changed from "3.8" to "3.9"
packages/core2-32-poky-linux/grep/grep-locale-es: PKGV changed from 3.8 [default] to 3.9 [default]
packages/core2-32-poky-linux/grep/grep-locale-es: PKGSIZE changed from 17302 to 17100 (-1%)
packages/core2-32-poky-linux/grep/grep-locale-es: PV changed from "3.8" to "3.9"
packages/core2-32-poky-linux/grep/grep-locale-et: PKGV changed from 3.8 [default] to 3.9 [default]
packages/core2-32-poky-linux/grep/grep-locale-et: PKGSIZE changed from 16855 to 16990 (+1%)
packages/core2-32-poky-linux/grep/grep-locale-et: PV changed from "3.8" to "3.9"
packages/core2-32-poky-linux/grep/grep-locale-eu: PKGV changed from 3.8 [default] to 3.9 [default]
packages/core2-32-poky-linux/grep/grep-locale-eu: PV changed from "3.8" to "3.9"
packages/core2-32-poky-linux/grep/grep-locale-fi: PKGV changed from 3.8 [default] to 3.9 [default]
packages/core2-32-poky-linux/grep/grep-locale-fi: PKGSIZE changed from 18039 to 17838 (-1%)
packages/core2-32-poky-linux/grep/grep-locale-fi: PV changed from "3.8" to "3.9"
packages/core2-32-poky-linux/grep/grep-locale-fr: PKGV changed from 3.8 [default] to 3.9 [default]
packages/core2-32-poky-linux/grep/grep-locale-fr: PKGSIZE changed from 18325 to 18120 (-1%)
packages/core2-32-poky-linux/grep/grep-locale-fr: PV changed from "3.8" to "3.9"
packages/core2-32-poky-linux/grep/grep-locale-ga: PKGV changed from 3.8 [default] to 3.9 [default]
packages/core2-32-poky-linux/grep/grep-locale-ga: PV changed from "3.8" to "3.9"
packages/core2-32-poky-linux/grep/grep-locale-gl: PKGV changed from 3.8 [default] to 3.9 [default]
packages/core2-32-poky-linux/grep/grep-locale-gl: PKGSIZE changed from 15881 to 15677 (-1%)
packages/core2-32-poky-linux/grep/grep-locale-gl: PV changed from "3.8" to "3.9"
packages/core2-32-poky-linux/grep/grep-locale-he: PKGV changed from 3.8 [default] to 3.9 [default]
packages/core2-32-poky-linux/grep/grep-locale-he: PV changed from "3.8" to "3.9"
packages/core2-32-poky-linux/grep/grep-locale-hr: PKGV changed from 3.8 [default] to 3.9 [default]
packages/core2-32-poky-linux/grep/grep-locale-hr: PKGSIZE changed from 18084 to 17885 (-1%)
packages/core2-32-poky-linux/grep/grep-locale-hr: PV changed from "3.8" to "3.9"
packages/core2-32-poky-linux/grep/grep-locale-hu: PKGV changed from 3.8 [default] to 3.9 [default]
packages/core2-32-poky-linux/grep/grep-locale-hu: PKGSIZE changed from 12397 to 18582 (+50%)
packages/core2-32-poky-linux/grep/grep-locale-hu: PV changed from "3.8" to "3.9"
packages/core2-32-poky-linux/grep/grep-locale-id: PKGV changed from 3.8 [default] to 3.9 [default]
packages/core2-32-poky-linux/grep/grep-locale-id: PKGSIZE changed from 17486 to 17658 (+1%)
packages/core2-32-poky-linux/grep/grep-locale-id: PV changed from "3.8" to "3.9"
packages/core2-32-poky-linux/grep/grep-locale-it: PKGV changed from 3.8 [default] to 3.9 [default]
packages/core2-32-poky-linux/grep/grep-locale-it: PKGSIZE changed from 16819 to 16614 (-1%)
packages/core2-32-poky-linux/grep/grep-locale-it: PV changed from "3.8" to "3.9"
packages/core2-32-poky-linux/grep/grep-locale-ja: PKGV changed from 3.8 [default] to 3.9 [default]
packages/core2-32-poky-linux/grep/grep-locale-ja: PV changed from "3.8" to "3.9"
packages/core2-32-poky-linux/grep/grep-locale-ka: PKGV changed from 3.8 [default] to 3.9 [default]
packages/core2-32-poky-linux/grep/grep-locale-ka: PKGSIZE changed from 26623 to 27371 (+3%)
packages/core2-32-poky-linux/grep/grep-locale-ka: PV changed from "3.8" to "3.9"
packages/core2-32-poky-linux/grep/grep-locale-ko: PKGV changed from 3.8 [default] to 3.9 [default]
packages/core2-32-poky-linux/grep/grep-locale-ko: PKGSIZE changed from 19266 to 19017 (-1%)
packages/core2-32-poky-linux/grep/grep-locale-ko: PV changed from "3.8" to "3.9"
packages/core2-32-poky-linux/grep/grep-locale-ky: PKGV changed from 3.8 [default] to 3.9 [default]
packages/core2-32-poky-linux/grep/grep-locale-ky: PV changed from "3.8" to "3.9"
packages/core2-32-poky-linux/grep/grep-locale-lt: PKGV changed from 3.8 [default] to 3.9 [default]
packages/core2-32-poky-linux/grep/grep-locale-lt: PV changed from "3.8" to "3.9"
packages/core2-32-poky-linux/grep/grep-locale-nb: PKGV changed from 3.8 [default] to 3.9 [default]
packages/core2-32-poky-linux/grep/grep-locale-nb: PKGSIZE changed from 17573 to 17716 (+1%)
packages/core2-32-poky-linux/grep/grep-locale-nb: PV changed from "3.8" to "3.9"
packages/core2-32-poky-linux/grep/grep-locale-nl: PKGV changed from 3.8 [default] to 3.9 [default]
packages/core2-32-poky-linux/grep/grep-locale-nl: PKGSIZE changed from 18526 to 18671 (+1%)
packages/core2-32-poky-linux/grep/grep-locale-nl: PV changed from "3.8" to "3.9"
packages/core2-32-poky-linux/grep/grep-locale-pa: PKGV changed from 3.8 [default] to 3.9 [default]
packages/core2-32-poky-linux/grep/grep-locale-pa: PV changed from "3.8" to "3.9"
packages/core2-32-poky-linux/grep/grep-locale-pl: PKGV changed from 3.8 [default] to 3.9 [default]
packages/core2-32-poky-linux/grep/grep-locale-pl: PKGSIZE changed from 18444 to 18229 (-1%)
packages/core2-32-poky-linux/grep/grep-locale-pl: PV changed from "3.8" to "3.9"
packages/core2-32-poky-linux/grep/grep-locale-pt-br: PKGV changed from 3.8 [default] to 3.9 [default]
packages/core2-32-poky-linux/grep/grep-locale-pt-br: PKGSIZE changed from 16200 to 16000 (-1%)
packages/core2-32-poky-linux/grep/grep-locale-pt-br: PV changed from "3.8" to "3.9"
packages/core2-32-poky-linux/grep/grep-locale-pt: PKGV changed from 3.8 [default] to 3.9 [default]
packages/core2-32-poky-linux/grep/grep-locale-pt: PKGSIZE changed from 16356 to 16154 (-1%)
packages/core2-32-poky-linux/grep/grep-locale-pt: PV changed from "3.8" to "3.9"
packages/core2-32-poky-linux/grep/grep-locale-ro: PKGV changed from 3.8 [default] to 3.9 [default]
packages/core2-32-poky-linux/grep/grep-locale-ro: PKGSIZE changed from 18539 to 18875 (+2%)
packages/core2-32-poky-linux/grep/grep-locale-ro: PV changed from "3.8" to "3.9"
packages/core2-32-poky-linux/grep/grep-locale-ru: PKGV changed from 3.8 [default] to 3.9 [default]
packages/core2-32-poky-linux/grep/grep-locale-ru: PKGSIZE changed from 23197 to 22956 (-1%)
packages/core2-32-poky-linux/grep/grep-locale-ru: PV changed from "3.8" to "3.9"
packages/core2-32-poky-linux/grep/grep-locale-sk: PKGV changed from 3.8 [default] to 3.9 [default]
packages/core2-32-poky-linux/grep/grep-locale-sk: PKGSIZE changed from 17986 to 17790 (-1%)
packages/core2-32-poky-linux/grep/grep-locale-sk: PV changed from "3.8" to "3.9"
packages/core2-32-poky-linux/grep/grep-locale-sl: PKGV changed from 3.8 [default] to 3.9 [default]
packages/core2-32-poky-linux/grep/grep-locale-sl: PV changed from "3.8" to "3.9"
packages/core2-32-poky-linux/grep/grep-locale-sr: PKGV changed from 3.8 [default] to 3.9 [default]
packages/core2-32-poky-linux/grep/grep-locale-sr: PKGSIZE changed from 20814 to 21977 (+6%)
packages/core2-32-poky-linux/grep/grep-locale-sr: PV changed from "3.8" to "3.9"
packages/core2-32-poky-linux/grep/grep-locale-sv: PKGV changed from 3.8 [default] to 3.9 [default]
packages/core2-32-poky-linux/grep/grep-locale-sv: PKGSIZE changed from 17433 to 17567 (+1%)
packages/core2-32-poky-linux/grep/grep-locale-sv: PV changed from "3.8" to "3.9"
packages/core2-32-poky-linux/grep/grep-locale-ta: PKGV changed from 3.8 [default] to 3.9 [default]
packages/core2-32-poky-linux/grep/grep-locale-ta: PKGSIZE changed from 25265 to 24998 (-1%)
packages/core2-32-poky-linux/grep/grep-locale-ta: PV changed from "3.8" to "3.9"
packages/core2-32-poky-linux/grep/grep-locale-th: PKGV changed from 3.8 [default] to 3.9 [default]
packages/core2-32-poky-linux/grep/grep-locale-th: PV changed from "3.8" to "3.9"
packages/core2-32-poky-linux/grep/grep-locale-tr: PKGV changed from 3.8 [default] to 3.9 [default]
packages/core2-32-poky-linux/grep/grep-locale-tr: PKGSIZE changed from 16953 to 17874 (+5%)
packages/core2-32-poky-linux/grep/grep-locale-tr: PV changed from "3.8" to "3.9"
packages/core2-32-poky-linux/grep/grep-locale-uk: PKGV changed from 3.8 [default] to 3.9 [default]
packages/core2-32-poky-linux/grep/grep-locale-uk: PKGSIZE changed from 23738 to 23944 (+1%)
packages/core2-32-poky-linux/grep/grep-locale-uk: PV changed from "3.8" to "3.9"
packages/core2-32-poky-linux/grep/grep-locale-vi: PKGV changed from 3.8 [default] to 3.9 [default]
packages/core2-32-poky-linux/grep/grep-locale-vi: PKGSIZE changed from 19176 to 18941 (-1%)
packages/core2-32-poky-linux/grep/grep-locale-vi: PV changed from "3.8" to "3.9"
packages/core2-32-poky-linux/grep/grep-locale-zh-cn: PKGV changed from 3.8 [default] to 3.9 [default]
packages/core2-32-poky-linux/grep/grep-locale-zh-cn: PKGSIZE changed from 17232 to 17361 (+1%)
packages/core2-32-poky-linux/grep/grep-locale-zh-cn: PV changed from "3.8" to "3.9"
packages/core2-32-poky-linux/grep/grep-locale-zh-tw: PKGV changed from 3.8 [default] to 3.9 [default]
packages/core2-32-poky-linux/grep/grep-locale-zh-tw: PKGSIZE changed from 16987 to 17114 (+1%)
packages/core2-32-poky-linux/grep/grep-locale-zh-tw: PV changed from "3.8" to "3.9"
packages/core2-32-poky-linux/grep/grep-src: PKGV changed from 3.8 [default] to 3.9 [default]
packages/core2-32-poky-linux/grep/grep-src: FILELIST: directory renamed /usr/src/debug/grep/3.8-r0/src -> /usr/src/debug/grep/3.9-r0/src, directory renamed /usr/src/debug/grep/3.8-r0/lib/malloc -> /usr/src/debug/grep/3.9-r0/lib/malloc, removed "/usr/src/debug/grep/3.8-r0/lib/ialloc.h /usr/src/debug/grep/3.8-r0/lib/stackvma.c /usr/src/debug/grep/3.8-r0/lib/xalloc.h /usr/src/debug/grep/3.8-r0/lib/opendirat.c /usr/src/debug/grep/3.8-r0/lib/stackvma.h /usr/src/debug/grep/3.8-r0/lib/unistd-safer.h /usr/src/debug/grep/3.8-r0/lib/opendirat.h /usr/src/debug/grep/3.8-r0/lib/hash.c /usr/src/debug/grep/3.8-r0/lib/memchr.c /usr/src/debug/grep/3.8-r0/lib/hash.h /usr/src/debug/grep/3.8-r0/lib/getopt1.c /usr/src/debug/grep/3.8-r0/lib/fnmatch.h /usr/src/debug/grep/3.8-r0/lib/closeout.h /usr/src/debug/grep/3.8-r0/lib/fcntl-safer.h /usr/src/debug/grep/3.8-r0/lib/closeout.c /usr/src/debug/grep/3.8-r0/lib/fnmatch.c /usr/src/debug/grep/3.8-r0/lib/fd-safer.c /usr/src/debug/grep/3.8-r0/lib/fts_.h /usr/src/
 debug/grep/3.8-r0/lib/setlocale_null.h /usr/src/debug/grep/3.8-r0/lib/regcomp.c /usr/src/debug/grep/3.8-r0/lib/setlocale_null.c /usr/src/debug/grep/3.8-r0/lib/safe-read.c /usr/src/debug/grep/3.8-r0/lib/exclude.h /usr/src/debug/grep/3.8-r0/lib/exclude.c /usr/src/debug/grep/3.8-r0/lib/colorize.h /usr/src/debug/grep/3.8-r0/lib/safe-read.h /usr/src/debug/grep/3.8-r0/lib/fcntl.h /usr/src/debug/grep/3.8-r0/lib/dup-safer.c /usr/src/debug/grep/3.8-r0/lib/idx.h /usr/src/debug/grep/3.8-r0/lib/fcntl.c /usr/src/debug/grep/3.8-r0/lib/xmalloc.c /usr/src/debug/grep/3.8-r0/lib/stdio.h /usr/src/debug/grep/3.8-r0/lib/argmatch.c /usr/src/debug/grep/3.8-r0/lib/argmatch.h /usr/src/debug/grep/3.8-r0/lib/error.h /usr/src/debug/grep/3.8-r0/lib/regexec.c /usr/src/debug/grep/3.8-r0/lib/dirent.h /usr/src/debug/grep/3.8-r0/lib/colorize-posix.c /usr/src/debug/grep/3.8-r0/lib/c-strcasecmp.c /usr/src/debug/grep/3.8-r0/lib/wchar.h /usr/src/debug/grep/3.8-r0/lib/c-strcaseeq.h /usr/src/debug/grep/3.8-r0/lib/getprogn
 ame.h /usr/src/debug/grep/3.8-r0/lib/i-ring.c /usr/src/debug/grep/3.8-r0/lib/getprogname.c /usr/src/debug/grep/3.8-r0/lib/i-ring.h /usr/src/debug/grep/3.8-r0/lib/c-ctype.h /usr/src/debug/grep/3.8-r0/lib/xstrtol.h /usr/src/debug/grep/3.8-r0/lib/localeinfo.h /usr/src/debug/grep/3.8-r0/lib/xstrtol.c /usr/src/debug/grep/3.8-r0/lib/localeinfo.c /usr/src/debug/grep/3.8-r0/lib/quotearg.c /usr/src/debug/grep/3.8-r0/lib/regex_internal.h /usr/src/debug/grep/3.8-r0/lib/quotearg.h /usr/src/debug/grep/3.8-r0/lib/regex_internal.c /usr/src/debug/grep/3.8-r0/lib/hard-locale.h /usr/src/debug/grep/3.8-r0/lib/localcharset.h /usr/src/debug/grep/3.8-r0/lib/basename-lgpl.h /usr/src/debug/grep/3.8-r0/lib/dfa.h /usr/src/debug/grep/3.8-r0/lib/fts-cycle.c /usr/src/debug/grep/3.8-r0/lib/hard-locale.c /usr/src/debug/grep/3.8-r0/lib/dfa.c /usr/src/debug/grep/3.8-r0/lib/mbrtowc.c /usr/src/debug/grep/3.8-r0/lib/basename-lgpl.c /usr/src/debug/grep/3.8-r0/lib/localcharset.c /usr/src/debug/grep/3.8-r0/lib/open-safer
 .c /usr/src/debug/grep/3.8-r0/lib/strnlen1.c /usr/src/debug/grep/3.8-r0/lib/fts.c /usr/src/debug/grep/3.8-r0/lib/strnlen1.h /usr/src/debug/grep/3.8-r0/lib/c-stack.h /usr/src/debug/grep/3.8-r0/lib/c-stack.c /usr/src/debug/grep/3.8-r0/lib/getopt-ext.h /usr/src/debug/grep/3.8-r0/lib/getopt-core.h /usr/src/debug/grep/3.8-r0/lib/getopt_int.h /usr/src/debug/grep/3.8-r0/lib/strstr.c /usr/src/debug/grep/3.8-r0/lib/dirname.h /usr/src/debug/grep/3.8-r0/lib/xbinary-io.h /usr/src/debug/grep/3.8-r0/lib/sigsegv.h /usr/src/debug/grep/3.8-r0/lib/sigsegv.c /usr/src/debug/grep/3.8-r0/lib/xalloc-die.c /usr/src/debug/grep/3.8-r0/lib/obstack.c /usr/src/debug/grep/3.8-r0/lib/mbchar.c /usr/src/debug/grep/3.8-r0/lib/stdlib.h /usr/src/debug/grep/3.8-r0/lib/mbchar.h /usr/src/debug/grep/3.8-r0/lib/obstack.h /usr/src/debug/grep/3.8-r0/lib/quote.h /usr/src/debug/grep/3.8-r0/lib/c-strcase.h /usr/src/debug/grep/3.8-r0/lib/str-two-way.h /usr/src/debug/grep/3.8-r0/lib/version-etc.c /usr/src/debug/grep/3.8-r0/lib/ge
 topt.c /usr/src/debug/grep/3.8-r0/lib/version-etc.h /usr/src/debug/grep/3.8-r0/lib/cycle-check.c /usr/src/debug/grep/3.8-r0/lib/close-stream.h /usr/src/debug/grep/3.8-r0/lib/close-stream.c /usr/src/debug/grep/3.8-r0/lib/cycle-check.h /usr/src/debug/grep/3.8-r0/lib/binary-io.h /usr/src/debug/grep/3.8-r0/lib/bitrotate.h /usr/src/debug/grep/3.8-r0/lib/mbscasecmp.c /usr/src/debug/grep/3.8-r0/lib/memchr2.c /usr/src/debug/grep/3.8-r0/lib/memchr2.h /usr/src/debug/grep/3.8-r0/lib/stripslash.c /usr/src/debug/grep/3.8-r0/lib/sys-limits.h /usr/src/debug/grep/3.8-r0/lib/mbrlen.c /usr/src/debug/grep/3.8-r0/lib/openat-safer.c /usr/src/debug/grep/3.8-r0/lib/fnmatch_loop.c /usr/src/debug/grep/3.8-r0/lib/regex.h /usr/src/debug/grep/3.8-r0/lib/version-etc-fsf.c /usr/src/debug/grep/3.8-r0/lib/exitfail.c /usr/src/debug/grep/3.8-r0/lib/exitfail.h /usr/src/debug/grep/3.8-r0/lib/mbuiter.h /usr/src/debug/grep/3.8-r0/lib/string.h /usr/src/debug/grep/3.8-r0/lib/dev-ino.h", added "/usr/src/debug/grep/3.9-r0/l
 ib/ialloc.h /usr/src/debug/grep/3.9-r0/lib/stackvma.c /usr/src/debug/grep/3.9-r0/lib/xalloc.h /usr/src/debug/grep/3.9-r0/lib/opendirat.c /usr/src/debug/grep/3.9-r0/lib/stackvma.h /usr/src/debug/grep/3.9-r0/lib/unistd-safer.h /usr/src/debug/grep/3.9-r0/lib/opendirat.h /usr/src/debug/grep/3.9-r0/lib/hash.c /usr/src/debug/grep/3.9-r0/lib/memchr.c /usr/src/debug/grep/3.9-r0/lib/hash.h /usr/src/debug/grep/3.9-r0/lib/getopt1.c /usr/src/debug/grep/3.9-r0/lib/fnmatch.h /usr/src/debug/grep/3.9-r0/lib/closeout.h /usr/src/debug/grep/3.9-r0/lib/fcntl-safer.h /usr/src/debug/grep/3.9-r0/lib/closeout.c /usr/src/debug/grep/3.9-r0/lib/fnmatch.c /usr/src/debug/grep/3.9-r0/lib/fd-safer.c /usr/src/debug/grep/3.9-r0/lib/fts_.h /usr/src/debug/grep/3.9-r0/lib/setlocale_null.h /usr/src/debug/grep/3.9-r0/lib/regcomp.c /usr/src/debug/grep/3.9-r0/lib/setlocale_null.c /usr/src/debug/grep/3.9-r0/lib/safe-read.c /usr/src/debug/grep/3.9-r0/lib/exclude.h /usr/src/debug/grep/3.9-r0/lib/exclude.c /usr/src/debug/grep
 /3.9-r0/lib/colorize.h /usr/src/debug/grep/3.9-r0/lib/safe-read.h /usr/src/debug/grep/3.9-r0/lib/fcntl.h /usr/src/debug/grep/3.9-r0/lib/dup-safer.c /usr/src/debug/grep/3.9-r0/lib/idx.h /usr/src/debug/grep/3.9-r0/lib/fcntl.c /usr/src/debug/grep/3.9-r0/lib/xmalloc.c /usr/src/debug/grep/3.9-r0/lib/stdio.h /usr/src/debug/grep/3.9-r0/lib/argmatch.c /usr/src/debug/grep/3.9-r0/lib/argmatch.h /usr/src/debug/grep/3.9-r0/lib/regexec.c /usr/src/debug/grep/3.9-r0/lib/dirent.h /usr/src/debug/grep/3.9-r0/lib/colorize-posix.c /usr/src/debug/grep/3.9-r0/lib/c-strcasecmp.c /usr/src/debug/grep/3.9-r0/lib/wchar.h /usr/src/debug/grep/3.9-r0/lib/c-strcaseeq.h /usr/src/debug/grep/3.9-r0/lib/i-ring.c /usr/src/debug/grep/3.9-r0/lib/getprogname.c /usr/src/debug/grep/3.9-r0/lib/i-ring.h /usr/src/debug/grep/3.9-r0/lib/c-ctype.h /usr/src/debug/grep/3.9-r0/lib/xstrtol.h /usr/src/debug/grep/3.9-r0/lib/localeinfo.h /usr/src/debug/grep/3.9-r0/lib/xstrtol.c /usr/src/debug/grep/3.9-r0/lib/localeinfo.c /usr/src/debug
 /grep/3.9-r0/lib/quotearg.c /usr/src/debug/grep/3.9-r0/lib/regex_internal.h /usr/src/debug/grep/3.9-r0/lib/quotearg.h /usr/src/debug/grep/3.9-r0/lib/regex_internal.c /usr/src/debug/grep/3.9-r0/lib/hard-locale.h /usr/src/debug/grep/3.9-r0/lib/localcharset.h /usr/src/debug/grep/3.9-r0/lib/basename-lgpl.h /usr/src/debug/grep/3.9-r0/lib/dfa.h /usr/src/debug/grep/3.9-r0/lib/fts-cycle.c /usr/src/debug/grep/3.9-r0/lib/hard-locale.c /usr/src/debug/grep/3.9-r0/lib/dfa.c /usr/src/debug/grep/3.9-r0/lib/mbrtowc.c /usr/src/debug/grep/3.9-r0/lib/basename-lgpl.c /usr/src/debug/grep/3.9-r0/lib/localcharset.c /usr/src/debug/grep/3.9-r0/lib/open-safer.c /usr/src/debug/grep/3.9-r0/lib/strnlen1.c /usr/src/debug/grep/3.9-r0/lib/fts.c /usr/src/debug/grep/3.9-r0/lib/strnlen1.h /usr/src/debug/grep/3.9-r0/lib/c-stack.h /usr/src/debug/grep/3.9-r0/lib/c-stack.c /usr/src/debug/grep/3.9-r0/lib/getopt-ext.h /usr/src/debug/grep/3.9-r0/lib/getopt-core.h /usr/src/debug/grep/3.9-r0/lib/getopt_int.h /usr/src/debug/gr
 ep/3.9-r0/lib/strstr.c /usr/src/debug/grep/3.9-r0/lib/dirname.h /usr/src/debug/grep/3.9-r0/lib/xbinary-io.h /usr/src/debug/grep/3.9-r0/lib/sigsegv.h /usr/src/debug/grep/3.9-r0/lib/sigsegv.c /usr/src/debug/grep/3.9-r0/lib/xalloc-die.c /usr/src/debug/grep/3.9-r0/lib/obstack.c /usr/src/debug/grep/3.9-r0/lib/mbchar.c /usr/src/debug/grep/3.9-r0/lib/stdlib.h /usr/src/debug/grep/3.9-r0/lib/mbchar.h /usr/src/debug/grep/3.9-r0/lib/obstack.h /usr/src/debug/grep/3.9-r0/lib/quote.h /usr/src/debug/grep/3.9-r0/lib/c-strcase.h /usr/src/debug/grep/3.9-r0/lib/str-two-way.h /usr/src/debug/grep/3.9-r0/lib/version-etc.c /usr/src/debug/grep/3.9-r0/lib/getopt.c /usr/src/debug/grep/3.9-r0/lib/version-etc.h /usr/src/debug/grep/3.9-r0/lib/cycle-check.c /usr/src/debug/grep/3.9-r0/lib/close-stream.h /usr/src/debug/grep/3.9-r0/lib/close-stream.c /usr/src/debug/grep/3.9-r0/lib/cycle-check.h /usr/src/debug/grep/3.9-r0/lib/binary-io.h /usr/src/debug/grep/3.9-r0/lib/bitrotate.h /usr/src/debug/grep/3.9-r0/lib/mbsca
 secmp.c /usr/src/debug/grep/3.9-r0/lib/memchr2.c /usr/src/debug/grep/3.9-r0/lib/memchr2.h /usr/src/debug/grep/3.9-r0/lib/stripslash.c /usr/src/debug/grep/3.9-r0/lib/sys-limits.h /usr/src/debug/grep/3.9-r0/lib/mbrlen.c /usr/src/debug/grep/3.9-r0/lib/openat-safer.c /usr/src/debug/grep/3.9-r0/lib/fnmatch_loop.c /usr/src/debug/grep/3.9-r0/lib/regex.h /usr/src/debug/grep/3.9-r0/lib/version-etc-fsf.c /usr/src/debug/grep/3.9-r0/lib/exitfail.c /usr/src/debug/grep/3.9-r0/lib/exitfail.h /usr/src/debug/grep/3.9-r0/lib/mbuiter.h /usr/src/debug/grep/3.9-r0/lib/string.h /usr/src/debug/grep/3.9-r0/lib/dev-ino.h"
packages/core2-32-poky-linux/grep/grep-src: PKGSIZE changed from 1879038 to 1886047 (+0%)
packages/core2-32-poky-linux/grep/grep-src: PV changed from "3.8" to "3.9"
packages/core2-32-poky-linux/grep/grep-staticdev: PKGV changed from 3.8 [default] to 3.9 [default]
packages/core2-32-poky-linux/grep/grep-staticdev: PV changed from "3.8" to "3.9"
packages/core2-32-poky-linux/grep/grep: PKGV changed from 3.8 [default] to 3.9 [default]
packages/core2-32-poky-linux/grep/grep: PV changed from "3.8" to "3.9"
packages/core2-32-poky-linux/grep: PKGV changed from 3.8 [default] to 3.9 [default]
packages/core2-32-poky-linux/grep: SRC_URI changed from "https://ftp.gnu.org/gnu/grep/grep-3.8.tar.xz" to "https://ftp.gnu.org/gnu/grep/grep-3.9.tar.xz"
packages/core2-32-poky-linux/grep: PV changed from "3.8" to "3.9"

--===============2814355746939151358==--

