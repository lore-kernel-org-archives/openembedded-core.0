Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C507C54FA2
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 14:37:13 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.14632.1700059031615431696
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 06:37:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=XJODJJiJ;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=MSOISavP;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018bd36a25f4-f7944c17-f40b-4243-b668-acaa3f58a6a0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1700059031;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=vSJlK4DpYPwu0cuJWD0qdD+F6YbbV9HGE7SqFPkDfRU=;
	b=XJODJJiJI9TJzBTEpJ9xqyF7VNd3AqYTZYG5bf3DkRPSDcGdDd4K9l8G+cLAGUUU
	9y3ItjRqO/BvSQSJOvl2bvajj8uT3lkUfUlOfF0pzSzEwAVpDFWeMsGXx1zjfsB5hKg
	CL2H+qpKs2K/64XugeNIh0YVXD5SVDQ7Nv3MHqCM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1700059031;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=vSJlK4DpYPwu0cuJWD0qdD+F6YbbV9HGE7SqFPkDfRU=;
	b=MSOISavPiCOZrqnwdqiJZfA7Z+PW3BEzpiBlcKDhNbxtjTKy+cAfSg3/ktnnKVnf
	FsF1Vn7EftpJvjlC4X/vPYO+IOE7x8H6LgJNNdNCwiiho6MqRdrn0xihewQX5gQ1byO
	j2KtTscY2VxA+2Kw6sFEsTCaUI2ko9kp9pihVMiw=
Content-Type: multipart/mixed; boundary="===============6094605267386553663=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gawk: upgrading to 5.3.0 SUCCEEDED
Message-ID: <0101018bd36a25f4-f7944c17-f40b-4243-b668-acaa3f58a6a0-000000@us-west-2.amazonses.com>
Date: Wed, 15 Nov 2023 14:37:11 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 14:37:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190667

--===============6094605267386553663==
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
From 066ebd65aea5004f200785e231fe81b6d2359f48 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Nov 2023 08:59:29 +0000
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
2.39.2


--===============6094605267386553663==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/gawk/gawk-dbg: PKGSIZE changed from 2538704 to 2552464 (+1%)
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
packages/core2-64-poky-linux/gawk/gawk-ptest: FILELIST: added "/usr/lib/gawk/ptest/test/cmdlinefsbacknl.ok /usr/lib/gawk/ptest/test/gensub4.awk /usr/lib/gawk/ptest/test/regexpbad.ok /usr/lib/gawk/ptest/test/mtchi18n2.awk /usr/lib/gawk/ptest/test/gensub4.ok /usr/lib/gawk/ptest/test/csvodd.awk /usr/lib/gawk/ptest/test/mtchi18n2.ok /usr/lib/gawk/ptest/test/csv1.in /usr/lib/gawk/ptest/test/gsubnulli18n.awk /usr/lib/gawk/ptest/test/cmdlinefsbacknl.sh /usr/lib/gawk/ptest/test/cmdlinefsbacknl2.ok /usr/lib/gawk/ptest/test/lintplus3.in /usr/lib/gawk/ptest/test/csv1.awk /usr/lib/gawk/ptest/test/csv2.awk /usr/lib/gawk/ptest/test/csv3.awk /usr/lib/gawk/ptest/test/lintplus2.awk /usr/lib/gawk/ptest/test/lintplus3.ok /usr/lib/gawk/ptest/test/cmdlinefsbacknl2.sh /usr/lib/gawk/ptest/test/csv2.ok /usr/lib/gawk/ptest/test/gsubnulli18n.ok /usr/lib/gawk/ptest/test/csvodd.in /usr/lib/gawk/ptest/test/csv3.in /usr/lib/gawk/ptest/test/csv3.ok /usr/lib/gawk/ptest/test/regexpbad.awk /usr/lib/gawk/ptest/test/cs
 vodd.ok /usr/lib/gawk/ptest/test/lintplus3.awk /usr/lib/gawk/ptest/test/unicode1.awk /usr/lib/gawk/ptest/test/csv1.ok /usr/lib/gawk/ptest/test/lintplus2.ok /usr/lib/gawk/ptest/test/unicode1.ok"
packages/core2-64-poky-linux/gawk/gawk-ptest: PKGV changed from 5.2.2 [default] to 5.3.0 [default]
packages/core2-64-poky-linux/gawk/gawk-ptest: PV changed from "5.2.2" to "5.3.0"
packages/core2-64-poky-linux/gawk/gawk-src: PKGSIZE changed from 2367103 to 2379256 (+1%)
packages/core2-64-poky-linux/gawk/gawk-src: PKGV changed from 5.2.2 [default] to 5.3.0 [default]
packages/core2-64-poky-linux/gawk/gawk-src: PV changed from "5.2.2" to "5.3.0"
packages/core2-64-poky-linux/gawk/gawk-staticdev: PKGV changed from 5.2.2 [default] to 5.3.0 [default]
packages/core2-64-poky-linux/gawk/gawk-staticdev: PV changed from "5.2.2" to "5.3.0"
packages/core2-64-poky-linux/gawk/gawk: PKGSIZE changed from 928188 to 929024 (+0%)
packages/core2-64-poky-linux/gawk/gawk: FILELIST: removed "/usr/bin/gawk-5.2.2", added "/usr/bin/gawk-5.3.0 /usr/share/awk/tocsv.awk"
packages/core2-64-poky-linux/gawk/gawk: PKGV changed from 5.2.2 [default] to 5.3.0 [default]
packages/core2-64-poky-linux/gawk/gawk: PV changed from "5.2.2" to "5.3.0"
packages/core2-64-poky-linux/gawk: SRC_URI changed from "https://ftp.gnu.org/gnu/gawk/gawk-5.2.2.tar.gz file://run-ptest" to "https://ftp.gnu.org/gnu/gawk/gawk-5.3.0.tar.gz file://run-ptest"
packages/core2-64-poky-linux/gawk: PACKAGES: added "gawk-locale-uk"
packages/core2-64-poky-linux/gawk: PKGV changed from 5.2.2 [default] to 5.3.0 [default]
packages/core2-64-poky-linux/gawk: PV changed from "5.2.2" to "5.3.0"
Changes to packages/core2-64-poky-linux/gawk (sysroot):
  /usr/share/awk/tocsv.awk was added

--===============6094605267386553663==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/gawk/gawk-ptest: FILELIST: added "/usr/lib/gawk/ptest/test/cmdlinefsbacknl.ok /usr/lib/gawk/ptest/test/csv1.ok /usr/lib/gawk/ptest/test/cmdlinefsbacknl2.ok /usr/lib/gawk/ptest/test/lintplus2.ok /usr/lib/gawk/ptest/test/gsubnulli18n.awk /usr/lib/gawk/ptest/test/csvodd.awk /usr/lib/gawk/ptest/test/mtchi18n2.ok /usr/lib/gawk/ptest/test/gensub4.awk /usr/lib/gawk/ptest/test/csv2.ok /usr/lib/gawk/ptest/test/unicode1.awk /usr/lib/gawk/ptest/test/gensub4.ok /usr/lib/gawk/ptest/test/regexpbad.awk /usr/lib/gawk/ptest/test/csv1.in /usr/lib/gawk/ptest/test/lintplus3.ok /usr/lib/gawk/ptest/test/csvodd.ok /usr/lib/gawk/ptest/test/cmdlinefsbacknl.sh /usr/lib/gawk/ptest/test/csvodd.in /usr/lib/gawk/ptest/test/lintplus2.awk /usr/lib/gawk/ptest/test/unicode1.ok /usr/lib/gawk/ptest/test/csv1.awk /usr/lib/gawk/ptest/test/csv2.awk /usr/lib/gawk/ptest/test/regexpbad.ok /usr/lib/gawk/ptest/test/csv3.awk /usr/lib/gawk/ptest/test/gsubnulli18n.ok /usr/lib/gawk/ptest/test/lintplus3
 .awk /usr/lib/gawk/ptest/test/cmdlinefsbacknl2.sh /usr/lib/gawk/ptest/test/mtchi18n2.awk /usr/lib/gawk/ptest/test/csv3.in /usr/lib/gawk/ptest/test/csv3.ok /usr/lib/gawk/ptest/test/lintplus3.in"
packages/core2-64-poky-linux/gawk/gawk: FILELIST: removed "/usr/bin/gawk-5.2.2", added "/usr/share/awk/tocsv.awk /usr/bin/gawk-5.3.0"
packages/core2-64-poky-linux/gawk: PACKAGES: added "gawk-locale-uk"
Changes to packages/core2-64-poky-linux/gawk (sysroot):
  /usr/share/awk/tocsv.awk was added

--===============6094605267386553663==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gawk-upgrade-5.2.2-5.3.0.patch"

RnJvbSAwNjZlYmQ2NWFlYTUwMDRmMjAwNzg1ZTIzMWZlODFiNmQyMzU5ZjQ4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTm92IDIwMjMgMDg6NTk6MjkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
YXdrOiB1cGdyYWRlIDUuMi4yIC0+IDUuMy4wCgotLS0KIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9n
YXdrL3tnYXdrXzUuMi4yLmJiID0+IGdhd2tfNS4zLjAuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWV4
dGVuZGVkL2dhd2sve2dhd2tfNS4yLjIuYmIgPT4gZ2F3a181LjMuMC5iYn0gKDk3JSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZ2F3ay9nYXdrXzUuMi4yLmJiIGIvbWV0YS9y
ZWNpcGVzLWV4dGVuZGVkL2dhd2svZ2F3a181LjMuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDk3JQpy
ZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZ2F3ay9nYXdrXzUuMi4yLmJiCnJlbmFt
ZSB0byBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZ2F3ay9nYXdrXzUuMy4wLmJiCmluZGV4IDNjMThi
NjkxMWEuLjNkNjUyZGE2ZTUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9nYXdr
L2dhd2tfNS4yLjIuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2dhd2svZ2F3a181LjMu
MC5iYgpAQCAtMTksNyArMTksNyBAQCBTUkNfVVJJID0gIiR7R05VX01JUlJPUn0vZ2F3ay9nYXdr
LSR7UFZ9LnRhci5neiBcCiAgICAgICAgICAgIGZpbGU6Ly9ydW4tcHRlc3QgXAogICAgICAgICAg
ICAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI5NDVhZWY3Y2NmZjEwMWYyMGIyMmExMDgwMmJj
MDA1ZTk5NGFiMmI4ZWEzZTcyNGNjMWExOTdjNjJmNDFmNjUwIgorU1JDX1VSSVtzaGEyNTZzdW1d
ID0gIjM3OGY4ODY0ZWMyMWNmY2VhYTA0OGY3ZTE4NjlhYzliNDU5N2I0NDkwODdjYWYxZWI1NWU0
NDBkMzAyNzMzMzYiCiAKIGluaGVyaXQgYXV0b3Rvb2xzIGdldHRleHQgdGV4aW5mbyB1cGRhdGUt
YWx0ZXJuYXRpdmVzCiAKLS0gCjIuMzkuMgoK

--===============6094605267386553663==--

