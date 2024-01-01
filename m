Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 706B1C47DD6
	for <webhook@archiver.kernel.org>; Mon,  1 Jan 2024 13:12:06 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.4602.1704114720488551337
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jan 2024 05:12:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Y+CgZCmG;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=HSZ6/DvJ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018cc5270c6f-cb5a392f-ac20-4145-9b21-08f340758fcf-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1704114720;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=RWCupuzmzAHBscUIhEOYaC06sTArHb9pu5Eu/dVnKRA=;
	b=Y+CgZCmGzQreuCe7AYlPGG00sg80qs0YC9SnaCo5oMcMZ5SoNGqVkY+Vb6lzhYze
	vr5FUfH1JVdH9u548Uiqb38sPNjRZmEf8/i4jNf1KPL4cOCgpwDI0kDxYRI+EbbeKn3
	fVB2HBAG2gDsSTzP1ZYQsskbcPHndkUwKNKAVfms=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1704114720;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=RWCupuzmzAHBscUIhEOYaC06sTArHb9pu5Eu/dVnKRA=;
	b=HSZ6/DvJZVLiDNdAcavBhozr+oQyn72MsjqjQiId/pX9jNtTDr26cB3ZxPuWNQxI
	m2nKz2UELJGFzzvsgRtJPcYlVSOdY6ELUzxHvHBgT/DJ2a2RuKsVT8xuvXJCvbX65er
	CJBeaEDVjXbfySoUjQANza18kAOyRW5onk6Xvens=
Content-Type: multipart/mixed; boundary="===============8077291177064399847=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gawk: upgrading to 5.3.0 SUCCEEDED
Message-ID: <0101018cc5270c6f-cb5a392f-ac20-4145-9b21-08f340758fcf-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jan 2024 13:11:59 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.01.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jan 2024 13:12:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193163

--===============8077291177064399847==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gawk* to *5.3.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gawk-upgrade-5.2.2-5.3.0.patch
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
From f282fddb70d6ba3be030556465fe7587d56e880c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jan 2024 08:39:58 +0000
Subject: [PATCH] gawk: upgrade 5.2.2 -> 5.3.0

---
 meta/recipes-extended/gawk/{gawk_5.2.2.bb => gawk_5.3.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/gawk/{gawk_5.2.2.bb => gawk_5.3.0.bb} (97%)

diff --git a/meta/recipes-extended/gawk/gawk_5.2.2.bb b/meta/recipes-extended/gawk/gawk_5.3.0.bb
similarity index 97%
rename from meta/recipes-extended/gawk/gawk_5.2.2.bb
rename to meta/recipes-extended/gawk/gawk_5.3.0.bb
index 3c18b6911a..3d652da6e5 100644
--- a/meta/recipes-extended/gawk/gawk_5.2.2.bb
+++ b/meta/recipes-extended/gawk/gawk_5.3.0.bb
@@ -19,7 +19,7 @@ SRC_URI = "${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz \
            file://run-ptest \
            "
 
-SRC_URI[sha256sum] = "945aef7ccff101f20b22a10802bc005e994ab2b8ea3e724cc1a197c62f41f650"
+SRC_URI[sha256sum] = "378f8864ec21cfceaa048f7e1869ac9b4597b449087caf1eb55e440d30273336"
 
 inherit autotools gettext texinfo update-alternatives
 
-- 
2.42.0


--===============8077291177064399847==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gawk-upgrade-5.2.2-5.3.0.patch"

RnJvbSBmMjgyZmRkYjcwZDZiYTNiZTAzMDU1NjQ2NWZlNzU4N2Q1NmU4ODBjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKYW4gMjAyNCAwODozOTo1OCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdh
d2s6IHVwZ3JhZGUgNS4yLjIgLT4gNS4zLjAKCi0tLQogbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2dh
d2sve2dhd2tfNS4yLjIuYmIgPT4gZ2F3a181LjMuMC5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZXh0
ZW5kZWQvZ2F3ay97Z2F3a181LjIuMi5iYiA9PiBnYXdrXzUuMy4wLmJifSAoOTclKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9nYXdrL2dhd2tfNS4yLjIuYmIgYi9tZXRhL3Jl
Y2lwZXMtZXh0ZW5kZWQvZ2F3ay9nYXdrXzUuMy4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTclCnJl
bmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9nYXdrL2dhd2tfNS4yLjIuYmIKcmVuYW1l
IHRvIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9nYXdrL2dhd2tfNS4zLjAuYmIKaW5kZXggM2MxOGI2
OTExYS4uM2Q2NTJkYTZlNSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2dhd2sv
Z2F3a181LjIuMi5iYgorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZ2F3ay9nYXdrXzUuMy4w
LmJiCkBAIC0xOSw3ICsxOSw3IEBAIFNSQ19VUkkgPSAiJHtHTlVfTUlSUk9SfS9nYXdrL2dhd2st
JHtQVn0udGFyLmd6IFwKICAgICAgICAgICAgZmlsZTovL3J1bi1wdGVzdCBcCiAgICAgICAgICAg
ICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjk0NWFlZjdjY2ZmMTAxZjIwYjIyYTEwODAyYmMw
MDVlOTk0YWIyYjhlYTNlNzI0Y2MxYTE5N2M2MmY0MWY2NTAiCitTUkNfVVJJW3NoYTI1NnN1bV0g
PSAiMzc4Zjg4NjRlYzIxY2ZjZWFhMDQ4ZjdlMTg2OWFjOWI0NTk3YjQ0OTA4N2NhZjFlYjU1ZTQ0
MGQzMDI3MzMzNiIKIAogaW5oZXJpdCBhdXRvdG9vbHMgZ2V0dGV4dCB0ZXhpbmZvIHVwZGF0ZS1h
bHRlcm5hdGl2ZXMKIAotLSAKMi40Mi4wCgo=

--===============8077291177064399847==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/gawk/gawk-ptest: FILELIST: added "/usr/lib/gawk/ptest/test/gensub4.ok /usr/lib/gawk/ptest/test/cmdlinefsbacknl2.ok /usr/lib/gawk/ptest/test/csv2.awk /usr/lib/gawk/ptest/test/csv1.awk /usr/lib/gawk/ptest/test/csv3.awk /usr/lib/gawk/ptest/test/lintplus2.awk /usr/lib/gawk/ptest/test/gsubnulli18n.ok /usr/lib/gawk/ptest/test/csv1.ok /usr/lib/gawk/ptest/test/cmdlinefsbacknl.sh /usr/lib/gawk/ptest/test/regexpbad.ok /usr/lib/gawk/ptest/test/lintplus2.ok /usr/lib/gawk/ptest/test/regexpbad.awk /usr/lib/gawk/ptest/test/mtchi18n2.awk /usr/lib/gawk/ptest/test/csvodd.awk /usr/lib/gawk/ptest/test/csvodd.in /usr/lib/gawk/ptest/test/lintplus3.awk /usr/lib/gawk/ptest/test/csv2.ok /usr/lib/gawk/ptest/test/csvodd.ok /usr/lib/gawk/ptest/test/unicode1.ok /usr/lib/gawk/ptest/test/unicode1.awk /usr/lib/gawk/ptest/test/lintplus3.ok /usr/lib/gawk/ptest/test/lintplus3.in /usr/lib/gawk/ptest/test/mtchi18n2.ok /usr/lib/gawk/ptest/test/cmdlinefsbacknl.ok /usr/lib/gawk/ptest/test/cmdli
 nefsbacknl2.sh /usr/lib/gawk/ptest/test/csv3.in /usr/lib/gawk/ptest/test/csv3.ok /usr/lib/gawk/ptest/test/gensub4.awk /usr/lib/gawk/ptest/test/gsubnulli18n.awk /usr/lib/gawk/ptest/test/csv1.in"
packages/core2-64-poky-linux/gawk/gawk: FILELIST: removed "/usr/bin/gawk-5.2.2", added "/usr/share/awk/tocsv.awk /usr/bin/gawk-5.3.0"
packages/core2-64-poky-linux/gawk: PACKAGES: added "gawk-locale-uk"
Changes to packages/core2-64-poky-linux/gawk (sysroot):
  /usr/share/awk/tocsv.awk was added

--===============8077291177064399847==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/gawk/gawk-dbg: PKGSIZE changed from 2538304 to 2552080 (+1%)
packages/core2-64-poky-linux/gawk/gawk-dbg: PKGV changed from 5.2.2 [default] to 5.3.0 [default]
packages/core2-64-poky-linux/gawk/gawk-dbg: PV changed from "5.2.2" to "5.3.0"
packages/core2-64-poky-linux/gawk/gawk-dev: PKGSIZE changed from 42070 to 42138 (+0%)
packages/core2-64-poky-linux/gawk/gawk-dev: PKGV changed from 5.2.2 [default] to 5.3.0 [default]
packages/core2-64-poky-linux/gawk/gawk-dev: PV changed from "5.2.2" to "5.3.0"
packages/core2-64-poky-linux/gawk/gawk-doc: PKGSIZE changed from 2338623 to 2352307 (+1%)
packages/core2-64-poky-linux/gawk/gawk-doc: PKGV changed from 5.2.2 [default] to 5.3.0 [default]
packages/core2-64-poky-linux/gawk/gawk-doc: PV changed from "5.2.2" to "5.3.0"
packages/core2-64-poky-linux/gawk/gawk-gawkbug: PKGV changed from 5.2.2 [default] to 5.3.0 [default]
packages/core2-64-poky-linux/gawk/gawk-gawkbug: PV changed from "5.2.2" to "5.3.0"
packages/core2-64-poky-linux/gawk/gawk-locale-bg: PKGSIZE changed from 124398 to 125283 (+1%)
packages/core2-64-poky-linux/gawk/gawk-locale-bg: PKGV changed from 5.2.2 [default] to 5.3.0 [default]
packages/core2-64-poky-linux/gawk/gawk-locale-bg: PV changed from "5.2.2" to "5.3.0"
packages/core2-64-poky-linux/gawk/gawk-locale-ca: PKGSIZE changed from 51283 to 51046 (-0%)
packages/core2-64-poky-linux/gawk/gawk-locale-ca: PKGV changed from 5.2.2 [default] to 5.3.0 [default]
packages/core2-64-poky-linux/gawk/gawk-locale-ca: PV changed from "5.2.2" to "5.3.0"
packages/core2-64-poky-linux/gawk/gawk-locale-da: PKGSIZE changed from 36122 to 36004 (-0%)
packages/core2-64-poky-linux/gawk/gawk-locale-da: PKGV changed from 5.2.2 [default] to 5.3.0 [default]
packages/core2-64-poky-linux/gawk/gawk-locale-da: PV changed from "5.2.2" to "5.3.0"
packages/core2-64-poky-linux/gawk/gawk-locale-de: PKGSIZE changed from 96121 to 96695 (+1%)
packages/core2-64-poky-linux/gawk/gawk-locale-de: PKGV changed from 5.2.2 [default] to 5.3.0 [default]
packages/core2-64-poky-linux/gawk/gawk-locale-de: PV changed from "5.2.2" to "5.3.0"
packages/core2-64-poky-linux/gawk/gawk-locale-es: PKGSIZE changed from 94596 to 95192 (+1%)
packages/core2-64-poky-linux/gawk/gawk-locale-es: PKGV changed from 5.2.2 [default] to 5.3.0 [default]
packages/core2-64-poky-linux/gawk/gawk-locale-es: PV changed from "5.2.2" to "5.3.0"
packages/core2-64-poky-linux/gawk/gawk-locale-fi: PKGSIZE changed from 56651 to 56396 (-0%)
packages/core2-64-poky-linux/gawk/gawk-locale-fi: PKGV changed from 5.2.2 [default] to 5.3.0 [default]
packages/core2-64-poky-linux/gawk/gawk-locale-fi: PV changed from "5.2.2" to "5.3.0"
packages/core2-64-poky-linux/gawk/gawk-locale-fr: PKGSIZE changed from 96365 to 96983 (+1%)
packages/core2-64-poky-linux/gawk/gawk-locale-fr: PKGV changed from 5.2.2 [default] to 5.3.0 [default]
packages/core2-64-poky-linux/gawk/gawk-locale-fr: PV changed from "5.2.2" to "5.3.0"
packages/core2-64-poky-linux/gawk/gawk-locale-id: PKGSIZE changed from 47269 to 47007 (-1%)
packages/core2-64-poky-linux/gawk/gawk-locale-id: PKGV changed from 5.2.2 [default] to 5.3.0 [default]
packages/core2-64-poky-linux/gawk/gawk-locale-id: PV changed from "5.2.2" to "5.3.0"
packages/core2-64-poky-linux/gawk/gawk-locale-it: PKGSIZE changed from 92033 to 92886 (+1%)
packages/core2-64-poky-linux/gawk/gawk-locale-it: PKGV changed from 5.2.2 [default] to 5.3.0 [default]
packages/core2-64-poky-linux/gawk/gawk-locale-it: PV changed from "5.2.2" to "5.3.0"
packages/core2-64-poky-linux/gawk/gawk-locale-ja: PKGSIZE changed from 36609 to 36469 (-0%)
packages/core2-64-poky-linux/gawk/gawk-locale-ja: PKGV changed from 5.2.2 [default] to 5.3.0 [default]
packages/core2-64-poky-linux/gawk/gawk-locale-ja: PV changed from "5.2.2" to "5.3.0"
packages/core2-64-poky-linux/gawk/gawk-locale-ko: PKGSIZE changed from 99705 to 100387 (+1%)
packages/core2-64-poky-linux/gawk/gawk-locale-ko: PKGV changed from 5.2.2 [default] to 5.3.0 [default]
packages/core2-64-poky-linux/gawk/gawk-locale-ko: PV changed from "5.2.2" to "5.3.0"
packages/core2-64-poky-linux/gawk/gawk-locale-ms: PKGV changed from 5.2.2 [default] to 5.3.0 [default]
packages/core2-64-poky-linux/gawk/gawk-locale-ms: PV changed from "5.2.2" to "5.3.0"
packages/core2-64-poky-linux/gawk/gawk-locale-nl: PKGSIZE changed from 68931 to 68681 (-0%)
packages/core2-64-poky-linux/gawk/gawk-locale-nl: PKGV changed from 5.2.2 [default] to 5.3.0 [default]
packages/core2-64-poky-linux/gawk/gawk-locale-nl: PV changed from "5.2.2" to "5.3.0"
packages/core2-64-poky-linux/gawk/gawk-locale-pl: PKGSIZE changed from 93988 to 94551 (+1%)
packages/core2-64-poky-linux/gawk/gawk-locale-pl: PKGV changed from 5.2.2 [default] to 5.3.0 [default]
packages/core2-64-poky-linux/gawk/gawk-locale-pl: PV changed from "5.2.2" to "5.3.0"
packages/core2-64-poky-linux/gawk/gawk-locale-pt-br: PKGSIZE changed from 86740 to 86494 (-0%)
packages/core2-64-poky-linux/gawk/gawk-locale-pt-br: PKGV changed from 5.2.2 [default] to 5.3.0 [default]
packages/core2-64-poky-linux/gawk/gawk-locale-pt-br: PV changed from "5.2.2" to "5.3.0"
packages/core2-64-poky-linux/gawk/gawk-locale-pt: PKGSIZE changed from 85495 to 85184 (-0%)
packages/core2-64-poky-linux/gawk/gawk-locale-pt: PKGV changed from 5.2.2 [default] to 5.3.0 [default]
packages/core2-64-poky-linux/gawk/gawk-locale-pt: PV changed from "5.2.2" to "5.3.0"
packages/core2-64-poky-linux/gawk/gawk-locale-ro: PKGSIZE changed from 97245 to 97548 (+0%)
packages/core2-64-poky-linux/gawk/gawk-locale-ro: PKGV changed from 5.2.2 [default] to 5.3.0 [default]
packages/core2-64-poky-linux/gawk/gawk-locale-ro: PV changed from "5.2.2" to "5.3.0"
packages/core2-64-poky-linux/gawk/gawk-locale-sr: PKGSIZE changed from 115587 to 116380 (+1%)
packages/core2-64-poky-linux/gawk/gawk-locale-sr: PKGV changed from 5.2.2 [default] to 5.3.0 [default]
packages/core2-64-poky-linux/gawk/gawk-locale-sr: PV changed from "5.2.2" to "5.3.0"
packages/core2-64-poky-linux/gawk/gawk-locale-sv: PKGSIZE changed from 91921 to 92545 (+1%)
packages/core2-64-poky-linux/gawk/gawk-locale-sv: PKGV changed from 5.2.2 [default] to 5.3.0 [default]
packages/core2-64-poky-linux/gawk/gawk-locale-sv: PV changed from "5.2.2" to "5.3.0"
packages/core2-64-poky-linux/gawk/gawk-locale-vi: PKGSIZE changed from 64194 to 63942 (-0%)
packages/core2-64-poky-linux/gawk/gawk-locale-vi: PKGV changed from 5.2.2 [default] to 5.3.0 [default]
packages/core2-64-poky-linux/gawk/gawk-locale-vi: PV changed from "5.2.2" to "5.3.0"
packages/core2-64-poky-linux/gawk/gawk-locale-zh-cn: PKGSIZE changed from 86163 to 86715 (+1%)
packages/core2-64-poky-linux/gawk/gawk-locale-zh-cn: PKGV changed from 5.2.2 [default] to 5.3.0 [default]
packages/core2-64-poky-linux/gawk/gawk-locale-zh-cn: PV changed from "5.2.2" to "5.3.0"
packages/core2-64-poky-linux/gawk/gawk-ptest: PKGSIZE changed from 1381652 to 1392505 (+1%)
packages/core2-64-poky-linux/gawk/gawk-ptest: PKGV changed from 5.2.2 [default] to 5.3.0 [default]
packages/core2-64-poky-linux/gawk/gawk-ptest: PV changed from "5.2.2" to "5.3.0"
packages/core2-64-poky-linux/gawk/gawk-ptest: FILELIST: added "/usr/lib/gawk/ptest/test/csv1.ok /usr/lib/gawk/ptest/test/csv2.ok /usr/lib/gawk/ptest/test/csv1.in /usr/lib/gawk/ptest/test/cmdlinefsbacknl2.sh /usr/lib/gawk/ptest/test/csvodd.ok /usr/lib/gawk/ptest/test/gensub4.ok /usr/lib/gawk/ptest/test/csv3.in /usr/lib/gawk/ptest/test/csv3.ok /usr/lib/gawk/ptest/test/csvodd.awk /usr/lib/gawk/ptest/test/csv1.awk /usr/lib/gawk/ptest/test/csv2.awk /usr/lib/gawk/ptest/test/csv3.awk /usr/lib/gawk/ptest/test/lintplus2.ok /usr/lib/gawk/ptest/test/cmdlinefsbacknl.sh /usr/lib/gawk/ptest/test/regexpbad.ok /usr/lib/gawk/ptest/test/gsubnulli18n.awk /usr/lib/gawk/ptest/test/lintplus3.awk /usr/lib/gawk/ptest/test/mtchi18n2.ok /usr/lib/gawk/ptest/test/unicode1.ok /usr/lib/gawk/ptest/test/mtchi18n2.awk /usr/lib/gawk/ptest/test/cmdlinefsbacknl2.ok /usr/lib/gawk/ptest/test/gensub4.awk /usr/lib/gawk/ptest/test/gsubnulli18n.ok /usr/lib/gawk/ptest/test/unicode1.awk /usr/lib/gawk/ptest/test/lintplus3.ok /u
 sr/lib/gawk/ptest/test/lintplus2.awk /usr/lib/gawk/ptest/test/regexpbad.awk /usr/lib/gawk/ptest/test/csvodd.in /usr/lib/gawk/ptest/test/lintplus3.in /usr/lib/gawk/ptest/test/cmdlinefsbacknl.ok"
packages/core2-64-poky-linux/gawk/gawk-src: PKGSIZE changed from 2367103 to 2379256 (+1%)
packages/core2-64-poky-linux/gawk/gawk-src: PKGV changed from 5.2.2 [default] to 5.3.0 [default]
packages/core2-64-poky-linux/gawk/gawk-src: PV changed from "5.2.2" to "5.3.0"
packages/core2-64-poky-linux/gawk/gawk-staticdev: PKGV changed from 5.2.2 [default] to 5.3.0 [default]
packages/core2-64-poky-linux/gawk/gawk-staticdev: PV changed from "5.2.2" to "5.3.0"
packages/core2-64-poky-linux/gawk/gawk: PKGSIZE changed from 928188 to 929024 (+0%)
packages/core2-64-poky-linux/gawk/gawk: PKGV changed from 5.2.2 [default] to 5.3.0 [default]
packages/core2-64-poky-linux/gawk/gawk: PV changed from "5.2.2" to "5.3.0"
packages/core2-64-poky-linux/gawk/gawk: FILELIST: removed "/usr/bin/gawk-5.2.2", added "/usr/share/awk/tocsv.awk /usr/bin/gawk-5.3.0"
packages/core2-64-poky-linux/gawk: PKGV changed from 5.2.2 [default] to 5.3.0 [default]
packages/core2-64-poky-linux/gawk: PV changed from "5.2.2" to "5.3.0"
packages/core2-64-poky-linux/gawk: PACKAGES: added "gawk-locale-uk"
packages/core2-64-poky-linux/gawk: SRC_URI changed from "https://ftp.gnu.org/gnu/gawk/gawk-5.2.2.tar.gz file://run-ptest" to "https://ftp.gnu.org/gnu/gawk/gawk-5.3.0.tar.gz file://run-ptest"
Changes to packages/core2-64-poky-linux/gawk (sysroot):
  /usr/share/awk/tocsv.awk was added

--===============8077291177064399847==--

