Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEB84C77B7A
	for <webhook@archiver.kernel.org>; Sat,  1 Apr 2023 21:29:01 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.32143.1680384536905017295
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Apr 2023 14:28:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=TXVQR83t;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101873eb92e30-efc647fa-7b32-42f9-812b-e90b3ba6119f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1680384536;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=qNIfRZzM2JqjTcXTCVdEBQy8CSPQYJu1q+2zcDFMqXU=;
	b=TXVQR83tjCK3M61WjeDt8galgNTRJB5HhYwpRpWxMAMPFTpzWBxc3FKUywiwFOiH
	5thpsdjV4QFKOFnJ/ZzZi3f8wUqB3VHm3G37gBXSoFWllFhrH6esJxPeBWNF+8o4EbA
	MjP6++7+NKMxOQjA0ixMR2BippkDEfWOVIi8KWOI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1680384536;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=qNIfRZzM2JqjTcXTCVdEBQy8CSPQYJu1q+2zcDFMqXU=;
	b=UXKgbIPqdB4LvjqUBrNNsXEZJlLeFKRXYDNUmsn3VoBDnJzCw6F8nSg8fzidNkyi
	PS8oxm1vI2fXzMNKeqDtEcTnGiSoaezJXJ9jQomN+8qncQfsSH9vEg35J9PJpkuMoLC
	ZLX3IVb9zMuhYULrh8LaKbn1Z9VLk13S2JEa76cE=
Content-Type: multipart/mixed; boundary="===============2021554739113138527=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-libav: upgrading to 1.22.1 SUCCEEDED
Message-ID: <010101873eb92e30-efc647fa-7b32-42f9-812b-e90b3ba6119f-000000@us-west-2.amazonses.com>
Date: Sat, 1 Apr 2023 21:28:56 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.04.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Apr 2023 21:29:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179558

--===============2021554739113138527==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gstreamer1.0-libav* to *1.22.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-libav-upgrade-1.22.0-1.22.1.patch
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
--===============2021554739113138527==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dbg: PKGV changed from 1.22.0 [default] to 1.22.1 [default]
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dbg: PV changed from "1.22.0" to "1.22.1"
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dbg: PKGSIZE changed from 731320 to 732276 (+0%)
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dev: PKGV changed from 1.22.0 [default] to 1.22.1 [default]
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dev: PV changed from "1.22.0" to "1.22.1"
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-doc: PKGV changed from 1.22.0 [default] to 1.22.1 [default]
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-doc: PV changed from "1.22.0" to "1.22.1"
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-locale: PKGV changed from 1.22.0 [default] to 1.22.1 [default]
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-locale: PV changed from "1.22.0" to "1.22.1"
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-src: PKGV changed from 1.22.0 [default] to 1.22.1 [default]
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-src: PV changed from "1.22.0" to "1.22.1"
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-src: PKGSIZE changed from 499125 to 499778 (+0%)
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-staticdev: PKGV changed from 1.22.0 [default] to 1.22.1 [default]
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-staticdev: PV changed from "1.22.0" to "1.22.1"
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav: PKGV changed from 1.22.0 [default] to 1.22.1 [default]
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav: PV changed from "1.22.0" to "1.22.1"
packages/core2-32-poky-linux/gstreamer1.0-libav: PKGV changed from 1.22.0 [default] to 1.22.1 [default]
packages/core2-32-poky-linux/gstreamer1.0-libav: PV changed from "1.22.0" to "1.22.1"
packages/core2-32-poky-linux/gstreamer1.0-libav: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.22.0.tar.xz" to "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.22.1.tar.xz"

--===============2021554739113138527==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-libav-upgrade-1.22.0-1.22.1.patch"

RnJvbSAzNmRhNDczMGJjODVjODI2ZTdiYTBjN2I1ZmUyY2NlZDk3YjBhYzUyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBBcHIgMjAyMyAxODo0OTozNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdz
dHJlYW1lcjEuMC1saWJhdjogdXBncmFkZSAxLjIyLjAgLT4gMS4yMi4xCgotLS0KIC4uLnN0cmVh
bWVyMS4wLWxpYmF2XzEuMjIuMC5iYiA9PiBnc3RyZWFtZXIxLjAtbGliYXZfMS4yMi4xLmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci97Z3N0cmVhbWVyMS4wLWxpYmF2
XzEuMjIuMC5iYiA9PiBnc3RyZWFtZXIxLjAtbGliYXZfMS4yMi4xLmJifSAoOTElKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtbGli
YXZfMS4yMi4wLmJiIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1l
cjEuMC1saWJhdl8xLjIyLjEuYmIKc2ltaWxhcml0eSBpbmRleCA5MSUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1saWJhdl8xLjIyLjAu
YmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIx
LjAtbGliYXZfMS4yMi4xLmJiCmluZGV4IDYyNWE1MmVhNTUuLjczZTEwNDJiOWQgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtbGliYXZf
MS4yMi4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFt
ZXIxLjAtbGliYXZfMS4yMi4xLmJiCkBAIC0xMiw3ICsxMiw3IEBAIExJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL0NPUFlJTkc7bWQ1PTY5MzMzZGFhMDQ0Y2I3N2U0ODZjYzM2MTI5ZjdhNzcwIFwK
ICAgICAgICAgICAgICAgICAgICAgIgogCiBTUkNfVVJJID0gImh0dHBzOi8vZ3N0cmVhbWVyLmZy
ZWVkZXNrdG9wLm9yZy9zcmMvZ3N0LWxpYmF2L2dzdC1saWJhdi0ke1BWfS50YXIueHoiCi1TUkNf
VVJJW3NoYTI1NnN1bV0gPSAiMGU0ODQwN2I0OTA1MjI3YTI2MDIxM2RiZGE4NGNiYTM4MTJmMDUz
MGZjN2E3NWI0MzgyOTEwMmVmODI4MTBmMSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJjOTU4ZTgy
NWRjM2FjM2I3YTQ4MWY4ZGI1MjY4MTMxYTFjZDcwMTMxMjM4NWMyZDgwM2RjNjNjOGU0NjBiNWZi
IgogCiBTID0gIiR7V09SS0RJUn0vZ3N0LWxpYmF2LSR7UFZ9IgogCi0tIAoyLjM5LjIKCg==

--===============2021554739113138527==--

