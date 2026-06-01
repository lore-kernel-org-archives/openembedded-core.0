Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FFA2CD6E73
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 15:35:41 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1565.1780328135276847590
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 08:35:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Kl5w7UTv;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=mIEkHGOv;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019e83d377e6-2504e5c0-faa5-460b-bb5c-1d6f9de76c7d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1780328134;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=yctkuzx+KuaVuesqRmjFdx1pc0K6Ipl8KJXK86LKWCk=;
	b=Kl5w7UTvdupumBq7Y+UjwUOI8AVY+RXguY7AEOfXcl1OZfCmfn4uAAU+gcCjDx4V
	zqhCfFLeOsd1fDQA0YPZmI4PhNYBZ3kNE2NhTai9P4DknR/+GNGGqcGLdKw5a4cOMMx
	rUVfIpdV5HMIxGaZ/2pXDWZFJKhszQENqJWD2Q3I=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1780328134;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=yctkuzx+KuaVuesqRmjFdx1pc0K6Ipl8KJXK86LKWCk=;
	b=mIEkHGOvFxyJrFkDdWqLvIE1Bx//Pl+oCsg+NMBuuMNrU2nFGwTdvNBGd3nqAQae
	mg2Hnga0zyHrdjnjYBpplkU8/JYIn/dAxSvwdiSIWQGNVcpNjMGKLm/zwYWxFiUv4As
	z2LEmprWwyihL7hwc1mIXkyP+H0Q20DcCbio8Vgk=
Content-Type: multipart/mixed; boundary="===============9001515654557105931=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ttyrun: upgrading to 2.42.1 SUCCEEDED
Message-ID: <0101019e83d377e6-2504e5c0-faa5-460b-bb5c-1d6f9de76c7d-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jun 2026 15:35:34 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 15:35:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237866

--===============9001515654557105931==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ttyrun* to *2.42.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ttyrun-upgrade-2.42.0-2.42.1.patch
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
From 68dfd693c4f437509cf2b2fa0dcdf97ab6c10e7b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jun 2026 07:36:55 +0000
Subject: [PATCH] ttyrun: upgrade 2.42.0 -> 2.42.1

---
 meta/recipes-core/ttyrun/{ttyrun_2.42.0.bb => ttyrun_2.42.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ttyrun/{ttyrun_2.42.0.bb => ttyrun_2.42.1.bb} (94%)

diff --git a/meta/recipes-core/ttyrun/ttyrun_2.42.0.bb b/meta/recipes-core/ttyrun/ttyrun_2.42.1.bb
similarity index 94%
rename from meta/recipes-core/ttyrun/ttyrun_2.42.0.bb
rename to meta/recipes-core/ttyrun/ttyrun_2.42.1.bb
index 811a4da70a..c9dd4d564d 100644
--- a/meta/recipes-core/ttyrun/ttyrun_2.42.0.bb
+++ b/meta/recipes-core/ttyrun/ttyrun_2.42.1.bb
@@ -7,7 +7,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f5118f167b055bfd7c3450803f1847af"
 
 SRC_URI = "git://github.com/ibm-s390-linux/s390-tools;protocol=https;branch=master;tag=v${PV}"
-SRCREV = "997343f8417ab0af0ceb869e7a34b23cae3061e3"
+SRCREV = "77083b1cbbd463a25cf1a94fc026b5401575bc5e"
 
 CVE_PRODUCT = "s390-tools"
 
-- 
2.47.1


--===============9001515654557105931==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ttyrun-upgrade-2.42.0-2.42.1.patch"

RnJvbSA2OGRmZDY5M2M0ZjQzNzUwOWNmMmIyZmEwZGNkZjk3YWI2YzEwZTdiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKdW4gMjAyNiAwNzozNjo1NSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHR0
eXJ1bjogdXBncmFkZSAyLjQyLjAgLT4gMi40Mi4xCgotLS0KIG1ldGEvcmVjaXBlcy1jb3JlL3R0
eXJ1bi97dHR5cnVuXzIuNDIuMC5iYiA9PiB0dHlydW5fMi40Mi4xLmJifSB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1jb3JlL3R0eXJ1bi97dHR5cnVuXzIuNDIuMC5iYiA9PiB0dHlydW5fMi40Mi4xLmJifSAo
OTQlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL3R0eXJ1bi90dHlydW5fMi40Mi4w
LmJiIGIvbWV0YS9yZWNpcGVzLWNvcmUvdHR5cnVuL3R0eXJ1bl8yLjQyLjEuYmIKc2ltaWxhcml0
eSBpbmRleCA5NCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWNvcmUvdHR5cnVuL3R0eXJ1bl8y
LjQyLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb3JlL3R0eXJ1bi90dHlydW5fMi40Mi4x
LmJiCmluZGV4IDgxMWE0ZGE3MGEuLmM5ZGQ0ZDU2NGQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1jb3JlL3R0eXJ1bi90dHlydW5fMi40Mi4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL3R0
eXJ1bi90dHlydW5fMi40Mi4xLmJiCkBAIC03LDcgKzcsNyBAQCBMSUNFTlNFID0gIk1JVCIKIExJ
Q19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PWY1MTE4ZjE2N2IwNTViZmQ3YzM0
NTA4MDNmMTg0N2FmIgogCiBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vaWJtLXMzOTAtbGlu
dXgvczM5MC10b29scztwcm90b2NvbD1odHRwczticmFuY2g9bWFzdGVyO3RhZz12JHtQVn0iCi1T
UkNSRVYgPSAiOTk3MzQzZjg0MTdhYjBhZjBjZWI4NjllN2EzNGIyM2NhZTMwNjFlMyIKK1NSQ1JF
ViA9ICI3NzA4M2IxY2JiZDQ2M2EyNWNmMWE5NGZjMDI2YjU0MDE1NzViYzVlIgogCiBDVkVfUFJP
RFVDVCA9ICJzMzkwLXRvb2xzIgogCi0tIAoyLjQ3LjEKCg==

--===============9001515654557105931==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/ttyrun: SRC_URI changed from "git://github.com/ibm-s390-linux/s390-tools;protocol=https;branch=master;tag=v2.42.0" to "git://github.com/ibm-s390-linux/s390-tools;protocol=https;branch=master;tag=v2.42.1"
packages/x86-64-v3-poky-linux/ttyrun: PV changed from "2.42.0" to "2.42.1"
packages/x86-64-v3-poky-linux/ttyrun: PKGV changed from 2.42.0 [default] to 2.42.1 [default]
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-dbg: PV changed from "2.42.0" to "2.42.1"
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-dbg: PKGV changed from 2.42.0 [default] to 2.42.1 [default]
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-dev: PV changed from "2.42.0" to "2.42.1"
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-dev: PKGV changed from 2.42.0 [default] to 2.42.1 [default]
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-doc: PV changed from "2.42.0" to "2.42.1"
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-doc: PKGV changed from 2.42.0 [default] to 2.42.1 [default]
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-locale: PV changed from "2.42.0" to "2.42.1"
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-locale: PKGV changed from 2.42.0 [default] to 2.42.1 [default]
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-src: PV changed from "2.42.0" to "2.42.1"
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-src: FILELIST: directory renamed /usr/src/debug/ttyrun/2.42.0/iucvterm/src -> /usr/src/debug/ttyrun/2.42.1/iucvterm/src
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-src: PKGV changed from 2.42.0 [default] to 2.42.1 [default]
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-staticdev: PV changed from "2.42.0" to "2.42.1"
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-staticdev: PKGV changed from 2.42.0 [default] to 2.42.1 [default]
packages/x86-64-v3-poky-linux/ttyrun/ttyrun: PV changed from "2.42.0" to "2.42.1"
packages/x86-64-v3-poky-linux/ttyrun/ttyrun: PKGV changed from 2.42.0 [default] to 2.42.1 [default]

--===============9001515654557105931==--

