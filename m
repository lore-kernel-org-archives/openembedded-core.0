Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84EFEC00A5A
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 14:25:11 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.8677.1698848707011174156
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 07:25:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=UTKrKFtZ;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=PXiUOWVV;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.191, mailfrom: 0101018b8b460f53-40ec934a-5b89-45c1-9267-aa60da9096bb-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1698848706;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=BShlbuQACHQaNEa89Vj/yiNCGUtURJPUOK+5zmOK0Pk=;
	b=UTKrKFtZ3yzZRLhbeZI0THZakfCYg2AFXFfphGMDoTaqaRbXlEUvGsdjrA8WG6qi
	LxLusHWYBTYggED1CBSe/tTJcQzx3kujE+8g7qetwUmx4kuS89lp1HKJin8M1EN8LZ/
	y4yjBSBBBMnx1XWmeJRlLWQqX42qoUhKS2/dmtnI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1698848706;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=BShlbuQACHQaNEa89Vj/yiNCGUtURJPUOK+5zmOK0Pk=;
	b=PXiUOWVVPXozg8Js+Uyv7I8qlqohyQZ7kV50CDRTxtgAqVVe4980HndFWKu2kskT
	uadjf3eMwttSWHKyIFpXaqTeccoDzZ4HHcU7LeWJjlJItKLwvcmlUh1oDPOsKPMZY8X
	+GWAQgwyLgu744O8zrcCqOFeQAjZ4xLms8ptmEfs=
Content-Type: multipart/mixed; boundary="===============7561566161322616741=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] nghttp2: upgrading to 1.58.0 SUCCEEDED
Message-ID: <0101018b8b460f53-40ec934a-5b89-45c1-9267-aa60da9096bb-000000@us-west-2.amazonses.com>
Date: Wed, 1 Nov 2023 14:25:06 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 14:25:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190036

--===============7561566161322616741==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *nghttp2* to *1.58.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-nghttp2-upgrade-1.57.0-1.58.0.patch
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
From 16118c515a43580512d5f338f56501c258b522dd Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Nov 2023 14:16:59 +0000
Subject: [PATCH] nghttp2: upgrade 1.57.0 -> 1.58.0

---
 .../nghttp2/{nghttp2_1.57.0.bb => nghttp2_1.58.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/nghttp2/{nghttp2_1.57.0.bb => nghttp2_1.58.0.bb} (91%)

diff --git a/meta/recipes-support/nghttp2/nghttp2_1.57.0.bb b/meta/recipes-support/nghttp2/nghttp2_1.58.0.bb
similarity index 91%
rename from meta/recipes-support/nghttp2/nghttp2_1.57.0.bb
rename to meta/recipes-support/nghttp2/nghttp2_1.58.0.bb
index 0cf1e3e34c..7b2ff4b778 100644
--- a/meta/recipes-support/nghttp2/nghttp2_1.57.0.bb
+++ b/meta/recipes-support/nghttp2/nghttp2_1.58.0.bb
@@ -8,7 +8,7 @@ SRC_URI = "\
     ${GITHUB_BASE_URI}/download/v${PV}/nghttp2-${PV}.tar.xz \
     file://0001-fetch-ocsp-response-use-python3.patch \
 "
-SRC_URI[sha256sum] = "9210b0113109f43be526ac5835d58a701411821a4d39e155c40d67c40f47a958"
+SRC_URI[sha256sum] = "4a68a3040da92fd9872c056d0f6b0cd60de8410de10b578f8ade9ecc14d297e0"
 
 inherit cmake manpages python3native github-releases
 PACKAGECONFIG[manpages] = ""
-- 
2.39.2


--===============7561566161322616741==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/nghttp2: SRC_URI changed from "https://github.com/nghttp2/nghttp2/releases//download/v1.57.0/nghttp2-1.57.0.tar.xz file://0001-fetch-ocsp-response-use-python3.patch" to "https://github.com/nghttp2/nghttp2/releases//download/v1.58.0/nghttp2-1.58.0.tar.xz file://0001-fetch-ocsp-response-use-python3.patch"
packages/core2-64-poky-linux/nghttp2: PKGV changed from 1.57.0 [default] to 1.58.0 [default]
packages/core2-64-poky-linux/nghttp2: PV changed from "1.57.0" to "1.58.0"
packages/core2-64-poky-linux/nghttp2/libnghttp2: FILELIST: removed "/usr/lib/libnghttp2.so.14.25.0", added "/usr/lib/libnghttp2.so.14.25.1"
packages/core2-64-poky-linux/nghttp2/libnghttp2: PKGV changed from 1.57.0 [default] to 1.58.0 [default]
packages/core2-64-poky-linux/nghttp2/libnghttp2: PV changed from "1.57.0" to "1.58.0"
packages/core2-64-poky-linux/nghttp2/nghttp2-dbg: FILELIST: removed "/usr/lib/.debug/libnghttp2.so.14.25.0", added "/usr/lib/.debug/libnghttp2.so.14.25.1"
packages/core2-64-poky-linux/nghttp2/nghttp2-dbg: PKGV changed from 1.57.0 [default] to 1.58.0 [default]
packages/core2-64-poky-linux/nghttp2/nghttp2-dbg: PV changed from "1.57.0" to "1.58.0"
packages/core2-64-poky-linux/nghttp2/nghttp2-dev: PKGV changed from 1.57.0 [default] to 1.58.0 [default]
packages/core2-64-poky-linux/nghttp2/nghttp2-dev: PV changed from "1.57.0" to "1.58.0"
packages/core2-64-poky-linux/nghttp2/nghttp2-doc: PKGSIZE changed from 174430 to 174307 (-0%)
packages/core2-64-poky-linux/nghttp2/nghttp2-doc: PKGV changed from 1.57.0 [default] to 1.58.0 [default]
packages/core2-64-poky-linux/nghttp2/nghttp2-doc: PV changed from "1.57.0" to "1.58.0"
packages/core2-64-poky-linux/nghttp2/nghttp2-locale: PKGV changed from 1.57.0 [default] to 1.58.0 [default]
packages/core2-64-poky-linux/nghttp2/nghttp2-locale: PV changed from "1.57.0" to "1.58.0"
packages/core2-64-poky-linux/nghttp2/nghttp2-proxy: PKGV changed from 1.57.0 [default] to 1.58.0 [default]
packages/core2-64-poky-linux/nghttp2/nghttp2-proxy: PV changed from "1.57.0" to "1.58.0"
packages/core2-64-poky-linux/nghttp2/nghttp2-src: PKGSIZE changed from 1029395 to 1029569 (+0%)
packages/core2-64-poky-linux/nghttp2/nghttp2-src: PKGV changed from 1.57.0 [default] to 1.58.0 [default]
packages/core2-64-poky-linux/nghttp2/nghttp2-src: PV changed from "1.57.0" to "1.58.0"
packages/core2-64-poky-linux/nghttp2/nghttp2-staticdev: PKGV changed from 1.57.0 [default] to 1.58.0 [default]
packages/core2-64-poky-linux/nghttp2/nghttp2-staticdev: PV changed from "1.57.0" to "1.58.0"
packages/core2-64-poky-linux/nghttp2/nghttp2: PKGV changed from 1.57.0 [default] to 1.58.0 [default]
packages/core2-64-poky-linux/nghttp2/nghttp2: PV changed from "1.57.0" to "1.58.0"
Changes to packages/core2-64-poky-linux/nghttp2 (sysroot):
  /usr/lib/libnghttp2.so.14 changed symlink target from libnghttp2.so.14.25.0 to libnghttp2.so.14.25.1
  /usr/lib/libnghttp2.so.14.25.0 moved to /usr/lib/libnghttp2.so.14.25.1

--===============7561566161322616741==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/nghttp2/libnghttp2: FILELIST: removed "/usr/lib/libnghttp2.so.14.25.0", added "/usr/lib/libnghttp2.so.14.25.1"
Changes to packages/core2-64-poky-linux/nghttp2 (sysroot):
  /usr/lib/libnghttp2.so.14 changed symlink target from libnghttp2.so.14.25.0 to libnghttp2.so.14.25.1
  /usr/lib/libnghttp2.so.14.25.0 moved to /usr/lib/libnghttp2.so.14.25.1

--===============7561566161322616741==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-nghttp2-upgrade-1.57.0-1.58.0.patch"

RnJvbSAxNjExOGM1MTVhNDM1ODA1MTJkNWYzMzhmNTY1MDFjMjU4YjUyMmRkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBOb3YgMjAyMyAxNDoxNjo1OSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG5n
aHR0cDI6IHVwZ3JhZGUgMS41Ny4wIC0+IDEuNTguMAoKLS0tCiAuLi4vbmdodHRwMi97bmdodHRw
Ml8xLjU3LjAuYmIgPT4gbmdodHRwMl8xLjU4LjAuYmJ9ICAgICAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9uZ2h0dHAyL3tuZ2h0dHAyXzEuNTcuMC5iYiA9PiBuZ2h0dHAyXzEuNTgu
MC5iYn0gKDkxJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9uZ2h0dHAyL25n
aHR0cDJfMS41Ny4wLmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbmdodHRwMi9uZ2h0dHAyXzEu
NTguMC5iYgpzaW1pbGFyaXR5IGluZGV4IDkxJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtc3Vw
cG9ydC9uZ2h0dHAyL25naHR0cDJfMS41Ny4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc3Vw
cG9ydC9uZ2h0dHAyL25naHR0cDJfMS41OC4wLmJiCmluZGV4IDBjZjFlM2UzNGMuLjdiMmZmNGI3
NzggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L25naHR0cDIvbmdodHRwMl8xLjU3
LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbmdodHRwMi9uZ2h0dHAyXzEuNTguMC5i
YgpAQCAtOCw3ICs4LDcgQEAgU1JDX1VSSSA9ICJcCiAgICAgJHtHSVRIVUJfQkFTRV9VUkl9L2Rv
d25sb2FkL3Yke1BWfS9uZ2h0dHAyLSR7UFZ9LnRhci54eiBcCiAgICAgZmlsZTovLzAwMDEtZmV0
Y2gtb2NzcC1yZXNwb25zZS11c2UtcHl0aG9uMy5wYXRjaCBcCiAiCi1TUkNfVVJJW3NoYTI1NnN1
bV0gPSAiOTIxMGIwMTEzMTA5ZjQzYmU1MjZhYzU4MzVkNThhNzAxNDExODIxYTRkMzllMTU1YzQw
ZDY3YzQwZjQ3YTk1OCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI0YTY4YTMwNDBkYTkyZmQ5ODcy
YzA1NmQwZjZiMGNkNjBkZTg0MTBkZTEwYjU3OGY4YWRlOWVjYzE0ZDI5N2UwIgogCiBpbmhlcml0
IGNtYWtlIG1hbnBhZ2VzIHB5dGhvbjNuYXRpdmUgZ2l0aHViLXJlbGVhc2VzCiBQQUNLQUdFQ09O
RklHW21hbnBhZ2VzXSA9ICIiCi0tIAoyLjM5LjIKCg==

--===============7561566161322616741==--

