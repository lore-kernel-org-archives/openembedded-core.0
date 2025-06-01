Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1240C678DF
	for <webhook@archiver.kernel.org>; Sun,  1 Jun 2025 13:55:33 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.27775.1748786129144655672
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jun 2025 06:55:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=SwMR6myi;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=fywdY1yT;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101972bc6a6c2-cdc7d64a-b5b0-49b9-b595-96c886696b39-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1748786128;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=4ANL+lXIVu/Bab8/LCnc3pJRBTxcH+htLFgsR1Q3uo8=;
	b=SwMR6myi/yIVMLs8bXt/etqqupskRAUhZIxcApC3MxtxlLOEzQGPvyQZCYdSbFiy
	I6/DoSg9tntG5x/rGkVZmME18iiza6qaa7GnidQZTHYCIajlvOuzPxQNg/FapdLdqUT
	k1AS7ZaQZFHsl0mclHWEAvvrj5Ul83hXZwyzbX+c=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1748786128;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=4ANL+lXIVu/Bab8/LCnc3pJRBTxcH+htLFgsR1Q3uo8=;
	b=fywdY1yTGSth1uyTP1r23SMjLlH6vZoZ9wfNQDU+P6aML0j9k5/z5VKtomqGdsv+
	a/uwmISun6e72TahbDSQjMnIIOgA0HKX0S8VWvEml1baT3sHpATxn08HO/OEteQ+9y5
	BdLMEIp1GBKyFzkqOcI4KMXeSN8Fzhvt6blgBEbM=
Content-Type: multipart/mixed; boundary="===============4297663834179930102=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] libslirp: upgrading to 4.9.1 SUCCEEDED
Message-ID: <010101972bc6a6c2-cdc7d64a-b5b0-49b9-b595-96c886696b39-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jun 2025 13:55:28 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jun 2025 13:55:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217579

--===============4297663834179930102==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libslirp* to *4.9.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libslirp-upgrade-4.9.0-4.9.1.patch
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
From 091be50792c9c78d1fbd3e086cb4684080888b0a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Jun 2025 08:14:27 +0000
Subject: [PATCH] libslirp: upgrade 4.9.0 -> 4.9.1

---
 .../slirp/{libslirp_4.9.0.bb => libslirp_4.9.1.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/slirp/{libslirp_4.9.0.bb => libslirp_4.9.1.bb} (91%)

diff --git a/meta/recipes-connectivity/slirp/libslirp_4.9.0.bb b/meta/recipes-connectivity/slirp/libslirp_4.9.1.bb
similarity index 91%
rename from meta/recipes-connectivity/slirp/libslirp_4.9.0.bb
rename to meta/recipes-connectivity/slirp/libslirp_4.9.1.bb
index a159ed7c67..568bac389f 100644
--- a/meta/recipes-connectivity/slirp/libslirp_4.9.0.bb
+++ b/meta/recipes-connectivity/slirp/libslirp_4.9.1.bb
@@ -5,7 +5,7 @@ LICENSE = "BSD-3-Clause & MIT"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=bca0186b14e6b05e338e729f106db727"
 
 SRC_URI = "git://gitlab.freedesktop.org/slirp/libslirp.git;protocol=https;branch=master"
-SRCREV = "c32a8a1ccaae8490142e67e078336a95c5ffc956"
+SRCREV = "9c744e1e52aa0d9646ed91d789d588696292c21e"
 
 S = "${WORKDIR}/git"
 
-- 
2.47.1


--===============4297663834179930102==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libslirp-upgrade-4.9.0-4.9.1.patch"

RnJvbSAwOTFiZTUwNzkyYzljNzhkMWZiZDNlMDg2Y2I0Njg0MDgwODg4YjBhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBKdW4gMjAyNSAwODoxNDoyNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnNsaXJwOiB1cGdyYWRlIDQuOS4wIC0+IDQuOS4xCgotLS0KIC4uLi9zbGlycC97bGlic2xpcnBf
NC45LjAuYmIgPT4gbGlic2xpcnBfNC45LjEuYmJ9ICAgICAgICAgICAgICB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1jb25uZWN0aXZpdHkvc2xpcnAve2xpYnNsaXJwXzQuOS4wLmJiID0+IGxpYnNsaXJwXzQu
OS4xLmJifSAoOTElKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvc2xp
cnAvbGlic2xpcnBfNC45LjAuYmIgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L3NsaXJwL2xp
YnNsaXJwXzQuOS4xLmJiCnNpbWlsYXJpdHkgaW5kZXggOTElCnJlbmFtZSBmcm9tIG1ldGEvcmVj
aXBlcy1jb25uZWN0aXZpdHkvc2xpcnAvbGlic2xpcnBfNC45LjAuYmIKcmVuYW1lIHRvIG1ldGEv
cmVjaXBlcy1jb25uZWN0aXZpdHkvc2xpcnAvbGlic2xpcnBfNC45LjEuYmIKaW5kZXggYTE1OWVk
N2M2Ny4uNTY4YmFjMzg5ZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9z
bGlycC9saWJzbGlycF80LjkuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L3Ns
aXJwL2xpYnNsaXJwXzQuOS4xLmJiCkBAIC01LDcgKzUsNyBAQCBMSUNFTlNFID0gIkJTRC0zLUNs
YXVzZSAmIE1JVCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlSSUdIVDttZDU9YmNh
MDE4NmIxNGU2YjA1ZTMzOGU3MjlmMTA2ZGI3MjciCiAKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0bGFi
LmZyZWVkZXNrdG9wLm9yZy9zbGlycC9saWJzbGlycC5naXQ7cHJvdG9jb2w9aHR0cHM7YnJhbmNo
PW1hc3RlciIKLVNSQ1JFViA9ICJjMzJhOGExY2NhYWU4NDkwMTQyZTY3ZTA3ODMzNmE5NWM1ZmZj
OTU2IgorU1JDUkVWID0gIjljNzQ0ZTFlNTJhYTBkOTY0NmVkOTFkNzg5ZDU4ODY5NjI5MmMyMWUi
CiAKIFMgPSAiJHtXT1JLRElSfS9naXQiCiAKLS0gCjIuNDcuMQoK

--===============4297663834179930102==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libslirp: PV changed from "4.9.0" to "4.9.1"
packages/core2-64-poky-linux/libslirp: PKGV changed from 4.9.0 [default] to 4.9.1 [default]
packages/core2-64-poky-linux/libslirp/libslirp-dbg: PV changed from "4.9.0" to "4.9.1"
packages/core2-64-poky-linux/libslirp/libslirp-dbg: PKGSIZE changed from 554680 to 555184 (+0%)
packages/core2-64-poky-linux/libslirp/libslirp-dbg: PKGV changed from 4.9.0 [default] to 4.9.1 [default]
packages/core2-64-poky-linux/libslirp/libslirp-dev: PV changed from "4.9.0" to "4.9.1"
packages/core2-64-poky-linux/libslirp/libslirp-dev: PKGV changed from 4.9.0 [default] to 4.9.1 [default]
packages/core2-64-poky-linux/libslirp/libslirp-doc: PV changed from "4.9.0" to "4.9.1"
packages/core2-64-poky-linux/libslirp/libslirp-doc: PKGV changed from 4.9.0 [default] to 4.9.1 [default]
packages/core2-64-poky-linux/libslirp/libslirp-locale: PV changed from "4.9.0" to "4.9.1"
packages/core2-64-poky-linux/libslirp/libslirp-locale: PKGV changed from 4.9.0 [default] to 4.9.1 [default]
packages/core2-64-poky-linux/libslirp/libslirp-src: PV changed from "4.9.0" to "4.9.1"
packages/core2-64-poky-linux/libslirp/libslirp-src: PKGV changed from 4.9.0 [default] to 4.9.1 [default]
packages/core2-64-poky-linux/libslirp/libslirp-staticdev: PV changed from "4.9.0" to "4.9.1"
packages/core2-64-poky-linux/libslirp/libslirp-staticdev: PKGV changed from 4.9.0 [default] to 4.9.1 [default]
packages/core2-64-poky-linux/libslirp/libslirp: PV changed from "4.9.0" to "4.9.1"
packages/core2-64-poky-linux/libslirp/libslirp: PKGV changed from 4.9.0 [default] to 4.9.1 [default]

--===============4297663834179930102==--

