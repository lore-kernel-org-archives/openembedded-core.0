Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 459FDC25B7B
	for <webhook@archiver.kernel.org>; Sat, 15 Jul 2023 21:27:39 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.6041.1689456456236073852
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jul 2023 14:27:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=MiyjFsNl;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101895b73afeb-3cce3eb4-3420-41a1-8f0e-0af0c8269a51-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1689456455;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=7pmslg2g8NzNlI0Q+93TPc5iD7+YBSoN2IdMPLH7Xk4=;
	b=MiyjFsNlzPgjfkHRu+ioWcV8W3HnC04ec8wHgucdyXQ68swyKaQIaZmYLcdamnFc
	iFCiUQq/ytqkPgOAaz4VcQyFJBmW8IOMNRUrNSwh35KGGPiMkTZC+M7wC8RRfRyZFa4
	ln97aa/CZjhRDQKBsX4IBCjV5SG+NMTUDvHyIUzY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1689456455;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=7pmslg2g8NzNlI0Q+93TPc5iD7+YBSoN2IdMPLH7Xk4=;
	b=bwp2Xsx7aqePNfPQ7oKdJhtVrvQ3GnVb36HAAPRVNYTkKI7LX01UcyxQ/Gi+Sl25
	0+jp+0ITy7j3+TXq4UHOWnJ0YgBs6ipiHZruob9rVMoPuFUXz6Srv9HonI7H2Q6pK9U
	aNfgtrLOy6M5yTdti767bbzrzvyryuOj7nnecJ9s=
Content-Type: multipart/mixed; boundary="===============8193173439635410577=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] spirv-headers: upgrading to 1.3.250.1 SUCCEEDED
Message-ID: <010101895b73afeb-3cce3eb4-3420-41a1-8f0e-0af0c8269a51-000000@us-west-2.amazonses.com>
Date: Sat, 15 Jul 2023 21:27:35 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.07.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jul 2023 21:27:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184372

--===============8193173439635410577==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *spirv-headers* to *1.3.250.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-spirv-headers-upgrade-1.3.250.0-1.3.250.1.patch
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

-- >8 --
From 49bbd6da6ffa84d0a7c8d5ff12662257336d352b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Jul 2023 18:26:24 +0000
Subject: [PATCH] spirv-headers: upgrade 1.3.250.0 -> 1.3.250.1

---
 .../{spirv-headers_1.3.250.0.bb => spirv-headers_1.3.250.1.bb}    | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-graphics/spir/{spirv-headers_1.3.250.0.bb => spirv-headers_1.3.250.1.bb} (100%)

diff --git a/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb b/meta/recipes-graphics/spir/spirv-headers_1.3.250.1.bb
similarity index 100%
rename from meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb
rename to meta/recipes-graphics/spir/spirv-headers_1.3.250.1.bb
-- 
2.39.2


--===============8193173439635410577==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/spirv-headers: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/spirv-headers: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/spirv-headers/spirv-headers-dbg: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/spirv-headers/spirv-headers-dbg: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/spirv-headers/spirv-headers-dev: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/spirv-headers/spirv-headers-dev: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/spirv-headers/spirv-headers-doc: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/spirv-headers/spirv-headers-doc: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/spirv-headers/spirv-headers-locale: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/spirv-headers/spirv-headers-locale: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/spirv-headers/spirv-headers-src: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/spirv-headers/spirv-headers-src: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/spirv-headers/spirv-headers-staticdev: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/spirv-headers/spirv-headers-staticdev: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/spirv-headers/spirv-headers: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/spirv-headers/spirv-headers: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]

--===============8193173439635410577==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-spirv-headers-upgrade-1.3.250.0-1.3.250.1.patch"

RnJvbSA0OWJiZDZkYTZmZmE4NGQwYTdjOGQ1ZmYxMjY2MjI1NzMzNmQzNTJiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgSnVsIDIwMjMgMTg6MjY6MjQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
cGlydi1oZWFkZXJzOiB1cGdyYWRlIDEuMy4yNTAuMCAtPiAxLjMuMjUwLjEKCi0tLQogLi4uL3tz
cGlydi1oZWFkZXJzXzEuMy4yNTAuMC5iYiA9PiBzcGlydi1oZWFkZXJzXzEuMy4yNTAuMS5iYn0g
ICAgfCAwCiAxIGZpbGUgY2hhbmdlZCwgMCBpbnNlcnRpb25zKCspLCAwIGRlbGV0aW9ucygtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9zcGlyL3tzcGlydi1oZWFkZXJzXzEuMy4yNTAu
MC5iYiA9PiBzcGlydi1oZWFkZXJzXzEuMy4yNTAuMS5iYn0gKDEwMCUpCgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NwaXIvc3BpcnYtaGVhZGVyc18xLjMuMjUwLjAuYmIgYi9t
ZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc3Bpci9zcGlydi1oZWFkZXJzXzEuMy4yNTAuMS5iYgpzaW1p
bGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NwaXIv
c3BpcnYtaGVhZGVyc18xLjMuMjUwLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGlj
cy9zcGlyL3NwaXJ2LWhlYWRlcnNfMS4zLjI1MC4xLmJiCi0tIAoyLjM5LjIKCg==

--===============8193173439635410577==--

