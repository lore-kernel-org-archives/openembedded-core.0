Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 281CFC021A8
	for <webhook@archiver.kernel.org>; Sat,  1 Feb 2025 13:21:13 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.42634.1738416054622171991
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Feb 2025 05:21:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=GLY8IvHj;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=ZMnRsdBd;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010194c1ac1b39-17be0ff7-a3fe-4a15-8fa9-eaa4d59d0080-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1738416069;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=mDD/VQ/HTUUdkQgswSS4SBnOk/rpz0PgYVJQdGDVwmI=;
	b=GLY8IvHjIHo9Mcdgq4zu3TcXfgoUjO+xHKhyzGGvpmEj4lf8awNIHQOmKvMSn7b4
	yfqMlKXPE6OvDxt6a1IfLoRQefym5U6WWrzLTXdlRWWFQCwvq/thiwgVUcVsoqtr3am
	j9ICzlZm7TI+Rr07CnniY6uLqfLMkVWq9e94GovU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1738416069;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=mDD/VQ/HTUUdkQgswSS4SBnOk/rpz0PgYVJQdGDVwmI=;
	b=ZMnRsdBdflCBEfuNti5ft9OdCVL0kU4cbdKC5ZOgLe/+ORMsVxk8HmGpb4nn1XK0
	WQlebjqUukafrfKWX+Em4r0HpjKq7LnoHHcJ1Ix7GRPQbGJRd+7zUFtjLo1FIKEINP9
	1+aL7sc+9nhTgVqKoahdhCYQun3wAIHEkXRsQy7w=
Content-Type: multipart/mixed; boundary="===============3370374508814209765=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-python: upgrading to 1.24.12 SUCCEEDED
Message-ID: <01010194c1ac1b39-17be0ff7-a3fe-4a15-8fa9-eaa4d59d0080-000000@us-west-2.amazonses.com>
Date: Sat, 1 Feb 2025 13:21:09 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.02.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Feb 2025 13:21:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210593

--===============3370374508814209765==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gstreamer1.0-python* to *1.24.12* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-python-upgrade-1.24.10-1.24.12.patch
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
From 94c0622ed2e4e457d73b0ed2995dcbb9ff5c2590 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Feb 2025 12:48:04 +0000
Subject: [PATCH] gstreamer1.0-python: upgrade 1.24.10 -> 1.24.12

---
 ...amer1.0-python_1.24.10.bb => gstreamer1.0-python_1.24.12.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.24.10.bb => gstreamer1.0-python_1.24.12.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.10.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.12.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.10.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.12.bb
index f682f093eb..f62cb159c2 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.10.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.12.bb
@@ -8,7 +8,7 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "135bcf8b6f1468bc31e5660409fe8ed38109f01dec44743514aa2fa6b3863309"
+SRC_URI[sha256sum] = "d679e2ca3e655a7328627c4670c324fc22f588d2cb8ecd2fa7a6a42df51132cc"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
 RDEPENDS:${PN} += "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
-- 
2.44.1


--===============3370374508814209765==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python-dbg: PKGV changed from 1.24.10 [default] to 1.24.12 [default]
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python-dbg: PV changed from "1.24.10" to "1.24.12"
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python-dev: PKGV changed from 1.24.10 [default] to 1.24.12 [default]
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python-dev: PV changed from "1.24.10" to "1.24.12"
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python-doc: PKGV changed from 1.24.10 [default] to 1.24.12 [default]
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python-doc: PV changed from "1.24.10" to "1.24.12"
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python-locale: PKGV changed from 1.24.10 [default] to 1.24.12 [default]
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python-locale: PV changed from "1.24.10" to "1.24.12"
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python-src: PKGV changed from 1.24.10 [default] to 1.24.12 [default]
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python-src: PV changed from "1.24.10" to "1.24.12"
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python-staticdev: PKGV changed from 1.24.10 [default] to 1.24.12 [default]
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python-staticdev: PV changed from "1.24.10" to "1.24.12"
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python: PKGV changed from 1.24.10 [default] to 1.24.12 [default]
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python: PV changed from "1.24.10" to "1.24.12"
packages/core2-64-poky-linux/gstreamer1.0-python: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-python/gst-python-1.24.10.tar.xz" to "https://gstreamer.freedesktop.org/src/gst-python/gst-python-1.24.12.tar.xz"
packages/core2-64-poky-linux/gstreamer1.0-python: PKGV changed from 1.24.10 [default] to 1.24.12 [default]
packages/core2-64-poky-linux/gstreamer1.0-python: PV changed from "1.24.10" to "1.24.12"

--===============3370374508814209765==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-python-upgrade-1.24.10-1.24.12.patch"

RnJvbSA5NGMwNjIyZWQyZTRlNDU3ZDczYjBlZDI5OTVkY2JiOWZmNWMyNTkwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBGZWIgMjAyNSAxMjo0ODowNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdz
dHJlYW1lcjEuMC1weXRob246IHVwZ3JhZGUgMS4yNC4xMCAtPiAxLjI0LjEyCgotLS0KIC4uLmFt
ZXIxLjAtcHl0aG9uXzEuMjQuMTAuYmIgPT4gZ3N0cmVhbWVyMS4wLXB5dGhvbl8xLjI0LjEyLmJi
fSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci97Z3N0cmVhbWVyMS4wLXB5
dGhvbl8xLjI0LjEwLmJiID0+IGdzdHJlYW1lcjEuMC1weXRob25fMS4yNC4xMi5iYn0gKDkxJSkK
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVy
MS4wLXB5dGhvbl8xLjI0LjEwLmJiIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVy
L2dzdHJlYW1lcjEuMC1weXRob25fMS4yNC4xMi5iYgpzaW1pbGFyaXR5IGluZGV4IDkxJQpyZW5h
bWUgZnJvbSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXB5
dGhvbl8xLjI0LjEwLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFt
ZXIvZ3N0cmVhbWVyMS4wLXB5dGhvbl8xLjI0LjEyLmJiCmluZGV4IGY2ODJmMDkzZWIuLmY2MmNi
MTU5YzIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3Ry
ZWFtZXIxLjAtcHl0aG9uXzEuMjQuMTAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEv
Z3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1weXRob25fMS4yNC4xMi5iYgpAQCAtOCw3ICs4LDcgQEAg
TElDRU5TRSA9ICJMR1BMLTIuMS1vci1sYXRlciIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTov
L0NPUFlJTkc7bWQ1PWMzNGRlYWU0ZTM5NWNhMDdlNzI1YWIwMDc2YTVmNzQwIgogCiBTUkNfVVJJ
ID0gImh0dHBzOi8vZ3N0cmVhbWVyLmZyZWVkZXNrdG9wLm9yZy9zcmMvJHtQTlJFQUx9LyR7UE5S
RUFMfS0ke1BWfS50YXIueHoiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMTM1YmNmOGI2ZjE0Njhi
YzMxZTU2NjA0MDlmZThlZDM4MTA5ZjAxZGVjNDQ3NDM1MTRhYTJmYTZiMzg2MzMwOSIKK1NSQ19V
Uklbc2hhMjU2c3VtXSA9ICJkNjc5ZTJjYTNlNjU1YTczMjg2MjdjNDY3MGMzMjRmYzIyZjU4OGQy
Y2I4ZWNkMmZhN2E2YTQyZGY1MTEzMmNjIgogCiBERVBFTkRTID0gImdzdHJlYW1lcjEuMCBnc3Ry
ZWFtZXIxLjAtcGx1Z2lucy1iYXNlIHB5dGhvbjMtcHlnb2JqZWN0IgogUkRFUEVORFM6JHtQTn0g
Kz0gImdzdHJlYW1lcjEuMCBnc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlIHB5dGhvbjMtcHlnb2Jq
ZWN0IgotLSAKMi40NC4xCgo=

--===============3370374508814209765==--

