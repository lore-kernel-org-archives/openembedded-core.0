Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E916C7EE2E
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 15:55:32 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.12308.1678895728269652846
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 08:55:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=aktNh9x1;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010186e5fbc3e3-d89196c8-9186-4f7a-84ed-ffa9b647c2bd-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1678895727;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=U2JbX6pW4j9Hvy/RQU1DNXEadP7jSE0jv1OOdQN74zk=;
	b=aktNh9x1ecde6yynb+WACem2r2Sv+EgNyjWLv2A0/ztXXo1npRvr1G+2deH0eRyQ
	N0tnSGCTZJSu5+btDQwl5Tvz1TaY/SVFjUw1PNInAUWEQYJYZ+DezrA21dQ1Cu4i5Q5
	YDdg2KT+XFamyjor/Vx9WhnywEEkWckiYv6FZSGA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1678895727;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=U2JbX6pW4j9Hvy/RQU1DNXEadP7jSE0jv1OOdQN74zk=;
	b=r1h60SltF1iVDahxXXLIYWx8nsVPgjMhNsBYLO1IOFf8xPuy7XKS/0WXSpTmziIX
	FoMqo4VloxpGyk9rSWQJn4t8KWITSM4sjxP3higfC5hM354XORaocUVZyn2s8o06x9G
	41PIcfFFFDZYnwrf3ueDUhhzMSN2oIrO2Zb5RgUY=
Content-Type: multipart/mixed; boundary="===============2260563297240097961=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-omx: upgrading to 1.22.1 SUCCEEDED
Message-ID: <01010186e5fbc3e3-d89196c8-9186-4f7a-84ed-ffa9b647c2bd-000000@us-west-2.amazonses.com>
Date: Wed, 15 Mar 2023 15:55:27 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.03.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 15:55:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178628

--===============2260563297240097961==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gstreamer1.0-omx* to *1.22.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-omx-upgrade-1.22.0-1.22.1.patch
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
--===============2260563297240097961==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-omx-upgrade-1.22.0-1.22.1.patch"

RnJvbSBiYzdjY2M0MTY0NjNmMjcxZjJjYjkwNTk2ZWU3MjM5MTBhNjU1ZTRiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTWFyIDIwMjMgMTM6NDk6MDggKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
c3RyZWFtZXIxLjAtb214OiB1cGdyYWRlIDEuMjIuMCAtPiAxLjIyLjEKCi0tLQogLi4uL3tnc3Ry
ZWFtZXIxLjAtb214XzEuMjIuMC5iYiA9PiBnc3RyZWFtZXIxLjAtb214XzEuMjIuMS5iYn0gIHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL3tnc3RyZWFtZXIxLjAtb214XzEu
MjIuMC5iYiA9PiBnc3RyZWFtZXIxLjAtb214XzEuMjIuMS5iYn0gKDk1JSkKCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLW9teF8xLjIy
LjAuYmIgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLW9t
eF8xLjIyLjEuYmIKc2ltaWxhcml0eSBpbmRleCA5NSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVz
LW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1vbXhfMS4yMi4wLmJiCnJlbmFtZSB0
byBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLW9teF8xLjIy
LjEuYmIKaW5kZXggZWQ0YzQ0NTgzZS4uM2FjODJmMGQ4YiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1vbXhfMS4yMi4wLmJiCisrKyBi
L21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtb214XzEuMjIu
MS5iYgpAQCAtMTAsNyArMTAsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5H
O21kNT00ZmJkNjUzODBjZGQyNTU5NTEwNzkwMDhiMzY0NTE2YyBcCiAKIFNSQ19VUkkgPSAiaHR0
cHM6Ly9nc3RyZWFtZXIuZnJlZWRlc2t0b3Aub3JnL3NyYy9nc3Qtb214L2dzdC1vbXgtJHtQVn0u
dGFyLnh6IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZGJjOTUxYTk5YWY1MzIzODBlNTk5YWE4
YWNkOWUxMzg1ZmRiMjk5YjQ2YjU4NjhjZDJiZTQyMzBhZDg4ODM0MSIKK1NSQ19VUklbc2hhMjU2
c3VtXSA9ICIyZDM3ZjYwY2QzM2U2OGRjZWYwYmNkMDliMmRkOGEwYjJlYjNhYjZkNmFjMTcyZGNh
NDZmNzBlYjAyNzU2Njg3IgogCiBTID0gIiR7V09SS0RJUn0vZ3N0LW9teC0ke1BWfSIKIAotLSAK
Mi4zOS4yCgo=

--===============2260563297240097961==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-dbg: PV changed from "1.22.0" to "1.22.1"
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-dbg: PKGV changed from 1.22.0 [default] to 1.22.1 [default]
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-dev: PV changed from "1.22.0" to "1.22.1"
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-dev: PKGV changed from 1.22.0 [default] to 1.22.1 [default]
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-doc: PV changed from "1.22.0" to "1.22.1"
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-doc: PKGV changed from 1.22.0 [default] to 1.22.1 [default]
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-locale: PV changed from "1.22.0" to "1.22.1"
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-locale: PKGV changed from 1.22.0 [default] to 1.22.1 [default]
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-src: PV changed from "1.22.0" to "1.22.1"
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-src: PKGV changed from 1.22.0 [default] to 1.22.1 [default]
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-staticdev: PV changed from "1.22.0" to "1.22.1"
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-staticdev: PKGV changed from 1.22.0 [default] to 1.22.1 [default]
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx: PV changed from "1.22.0" to "1.22.1"
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx: PKGV changed from 1.22.0 [default] to 1.22.1 [default]
packages/core2-32-poky-linux/gstreamer1.0-omx: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-1.22.0.tar.xz" to "https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-1.22.1.tar.xz"
packages/core2-32-poky-linux/gstreamer1.0-omx: PKGV changed from 1.22.0 [default] to 1.22.1 [default]
packages/core2-32-poky-linux/gstreamer1.0-omx: PV changed from "1.22.0" to "1.22.1"

--===============2260563297240097961==--

