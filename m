Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5404.1793687205587793305
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2026 22:26:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=HoavL/3L;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=bUTxILfC;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101a1a016b326-1fb9aa43-b8be-483a-ad75-d4c696988f4d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1793687204;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=q0Q7JukAoUl5Nal1AEe2bJr5bvTUmMnZgGOMii3ahXA=;
	b=HoavL/3LLx3FJP7eEFYiK4djlZue/+GesHuJIQ8Rkc5tA2C4GBPBcYxEWN12a2Go
	MkWtoqTX1CRysoVeHgxqKRbi/O5R+chl1LL0317Tw2seBwjJC4Ld6FTiikp84/999Se
	w6Ws2rZJmTgSHEz3ffTc6f5d5WXckrN993esSIus=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1793687204;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=q0Q7JukAoUl5Nal1AEe2bJr5bvTUmMnZgGOMii3ahXA=;
	b=bUTxILfCOUTPonh85gfoI4fa221CUxiLEM32G78S7rvyVzaf1jDqUeBXG1O5AAFY
	LFUjFP5EkboplEf0RD2VtieBq5f8JpPPvOmxrVh/t8FtnNDwoDWwce15cmtxYXunZj9
	VOkWOR/COeoTHlWSaD3EsjSLm32/AiADIu7KDRHY=
Content-Type: multipart/mixed; boundary="===============9199844102465102582=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hiago De Franco <hfranco@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] hwdata: upgrading to 0.412 SUCCEEDED
Message-ID: <010101a1a016b326-1fb9aa43-b8be-483a-ad75-d4c696988f4d-000000@us-west-2.amazonses.com>
Date: Tue, 3 Nov 2026 06:26:44 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.03-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2026 06:26:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249243

--===============9199844102465102582==
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
From 6b7e0bba686620e6a8913b5ad6e04f286c37767c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 3 Nov 2026 06:23:23 +0000
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


--===============9199844102465102582==
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
packages/all-poky-linux/hwdata/hwdata: PV changed from "0.411" to "0.412"
packages/all-poky-linux/hwdata/hwdata: PKGSIZE changed from 10556262 to 10566303 (+0%)
packages/all-poky-linux/hwdata/hwdata: PKGV changed from 0.411 [default] to 0.412 [default]
packages/all-poky-linux/hwdata: PV changed from "0.411" to "0.412"
packages/all-poky-linux/hwdata: PKGV changed from 0.411 [default] to 0.412 [default]
packages/all-poky-linux/hwdata: SRC_URI changed from "git://github.com/vcrhonek/hwdata.git;branch=master;protocol=https;tag=v0.411" to "git://github.com/vcrhonek/hwdata.git;branch=master;protocol=https;tag=v0.412"

--===============9199844102465102582==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-hwdata-upgrade-0.411-0.412.patch"

RnJvbSA2YjdlMGJiYTY4NjYyMGU2YTg5MTNiNWFkNmUwNGYyODZjMzc3NjdjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMyBOb3YgMjAyNiAwNjoyMzoyMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGh3
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

--===============9199844102465102582==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="hwdata-changelog.txt"

Update pci

--===============9199844102465102582==--
