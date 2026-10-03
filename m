Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 729E3CA5FE9
	for <webhook@archiver.kernel.org>; Sat,  3 Oct 2026 06:22:39 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1162.1791008549415116971
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Oct 2026 23:22:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=qShK5WlT;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=vIRSbpTP;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101a1006da66a-55e8e5cc-ac12-418d-b251-ebfa5a2759a9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1791008548;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=qfS4UNH30PHP+GpGlhkDWQYXRjyUNwl+tX4gxxpbDcw=;
	b=qShK5WlTSggX8/xlXY1wYWXiA4oZBROcsKIknKKJJ0KtkxJQyzSByH4htcgZ1DQU
	CfGpKiBJwP2FzRPNwYhfg0+h9w8zxL10X4grjohscQJvUCG6YJVhGWCHDRF8TFWueoL
	bxz3+a2XpcQsL+9YJO8UvveeQ/MywEN1Z7Gg6tB0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1791008548;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=qfS4UNH30PHP+GpGlhkDWQYXRjyUNwl+tX4gxxpbDcw=;
	b=vIRSbpTPn7hihi9WK70oFCbSAA4HdK2Jk8EvxXXBnQkO0K/T+pu1fRoFLKSWoERV
	nIt1XKXvZXndF4KKYLgRyddld95s4sCk3GBtuS9yG0qwprAs+1yeJdV4H986sY+d6Nn
	hI7JSZWZLFC9vFDAot6LzcfwQ2h4tXKBZnw7Negc=
Content-Type: multipart/mixed; boundary="===============4515357125033025200=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hiago De Franco <hfranco@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] hwdata: upgrading to 0.412 SUCCEEDED
Message-ID: <010101a1006da66a-55e8e5cc-ac12-418d-b251-ebfa5a2759a9-000000@us-west-2.amazonses.com>
Date: Sat, 3 Oct 2026 06:22:28 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.03-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 Oct 2026 06:22:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247144

--===============4515357125033025200==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *hwdata* to *0.412* has Succeeded.

Next steps:
    - apply the patch: git am 0001-hwdata-upgrade-0.411-0.412.patch
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
From 2075151373e758f85d13cc54f92ac72f0b134eb6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 3 Oct 2026 06:22:21 +0000
Subject: [PATCH] hwdata: upgrade 0.411 -> 0.412

Update pci
---
 .../recipes-support/hwdata/{hwdata_0.411.bb => hwdata_0.412.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/hwdata/{hwdata_0.411.bb => hwdata_0.412.bb} (93%)

diff --git a/meta/recipes-support/hwdata/hwdata_0.411.bb b/meta/recipes-support/hwdata/hwdata_0.412.bb
similarity index 93%
rename from meta/recipes-support/hwdata/hwdata_0.411.bb
rename to meta/recipes-support/hwdata/hwdata_0.412.bb
index b83c11f09d..c59654e138 100644
--- a/meta/recipes-support/hwdata/hwdata_0.411.bb
+++ b/meta/recipes-support/hwdata/hwdata_0.412.bb
@@ -8,7 +8,7 @@ LICENSE = "GPL-2.0-or-later OR X11"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1556547711e8246992b999edd9445a57"
 
 SRC_URI = "git://github.com/vcrhonek/${BPN}.git;branch=master;protocol=https;tag=v${PV}"
-SRCREV = "7fc63d411377e40aab66bfbf77dce6a439c3fe87"
+SRCREV = "816a9490ffcdad1929e0e53f79c500e1aeadd492"
 
 inherit allarch
 
-- 
2.47.1


--===============4515357125033025200==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="hwdata-changelog.txt"

Update pci

--===============4515357125033025200==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/hwdata/hwdata-dbg: PV changed from "0.411" to "0.412"
packages/all-poky-linux/hwdata/hwdata-dbg: PKGV changed from 0.411 [default] to 0.412 [default]
packages/all-poky-linux/hwdata/hwdata-dev: PV changed from "0.411" to "0.412"
packages/all-poky-linux/hwdata/hwdata-dev: PKGV changed from 0.411 [default] to 0.412 [default]
packages/all-poky-linux/hwdata/hwdata-doc: PV changed from "0.411" to "0.412"
packages/all-poky-linux/hwdata/hwdata-doc: PKGV changed from 0.411 [default] to 0.412 [default]
packages/all-poky-linux/hwdata/hwdata-locale: PV changed from "0.411" to "0.412"
packages/all-poky-linux/hwdata/hwdata-locale: PKGV changed from 0.411 [default] to 0.412 [default]
packages/all-poky-linux/hwdata/hwdata-src: PV changed from "0.411" to "0.412"
packages/all-poky-linux/hwdata/hwdata-src: PKGV changed from 0.411 [default] to 0.412 [default]
packages/all-poky-linux/hwdata/hwdata-staticdev: PV changed from "0.411" to "0.412"
packages/all-poky-linux/hwdata/hwdata-staticdev: PKGV changed from 0.411 [default] to 0.412 [default]
packages/all-poky-linux/hwdata/hwdata: PKGSIZE changed from 10556262 to 10566303 (+0%)
packages/all-poky-linux/hwdata/hwdata: PV changed from "0.411" to "0.412"
packages/all-poky-linux/hwdata/hwdata: PKGV changed from 0.411 [default] to 0.412 [default]
packages/all-poky-linux/hwdata: SRC_URI changed from "git://github.com/vcrhonek/hwdata.git;branch=master;protocol=https;tag=v0.411" to "git://github.com/vcrhonek/hwdata.git;branch=master;protocol=https;tag=v0.412"
packages/all-poky-linux/hwdata: PV changed from "0.411" to "0.412"
packages/all-poky-linux/hwdata: PKGV changed from 0.411 [default] to 0.412 [default]

--===============4515357125033025200==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-hwdata-upgrade-0.411-0.412.patch"

RnJvbSAyMDc1MTUxMzczZTc1OGY4NWQxM2NjNTRmOTJhYzcyZjBiMTM0ZWI2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMyBPY3QgMjAyNiAwNjoyMjoyMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGh3
ZGF0YTogdXBncmFkZSAwLjQxMSAtPiAwLjQxMgoKVXBkYXRlIHBjaQotLS0KIC4uLi9yZWNpcGVz
LXN1cHBvcnQvaHdkYXRhL3tod2RhdGFfMC40MTEuYmIgPT4gaHdkYXRhXzAuNDEyLmJifSB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1l
IG1ldGEvcmVjaXBlcy1zdXBwb3J0L2h3ZGF0YS97aHdkYXRhXzAuNDExLmJiID0+IGh3ZGF0YV8w
LjQxMi5iYn0gKDkzJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9od2RhdGEv
aHdkYXRhXzAuNDExLmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvaHdkYXRhL2h3ZGF0YV8wLjQx
Mi5iYgpzaW1pbGFyaXR5IGluZGV4IDkzJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtc3VwcG9y
dC9od2RhdGEvaHdkYXRhXzAuNDExLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc3VwcG9ydC9o
d2RhdGEvaHdkYXRhXzAuNDEyLmJiCmluZGV4IGI4M2MxMWYwOWQuLmM1OTY1NGUxMzggMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2h3ZGF0YS9od2RhdGFfMC40MTEuYmIKKysrIGIv
bWV0YS9yZWNpcGVzLXN1cHBvcnQvaHdkYXRhL2h3ZGF0YV8wLjQxMi5iYgpAQCAtOCw3ICs4LDcg
QEAgTElDRU5TRSA9ICJHUEwtMi4wLW9yLWxhdGVyIE9SIFgxMSIKIExJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTE1NTY1NDc3MTFlODI0Njk5MmI5OTllZGQ5NDQ1YTU3Igog
CiBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vdmNyaG9uZWsvJHtCUE59LmdpdDticmFuY2g9
bWFzdGVyO3Byb3RvY29sPWh0dHBzO3RhZz12JHtQVn0iCi1TUkNSRVYgPSAiN2ZjNjNkNDExMzc3
ZTQwYWFiNjZiZmJmNzdkY2U2YTQzOWMzZmU4NyIKK1NSQ1JFViA9ICI4MTZhOTQ5MGZmY2RhZDE5
MjllMGU1M2Y3OWM1MDBlMWFlYWRkNDkyIgogCiBpbmhlcml0IGFsbGFyY2gKIAotLSAKMi40Ny4x
Cgo=

--===============4515357125033025200==--

