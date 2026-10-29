Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5565.1793252421265247498
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2026 22:40:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=tRHY+CTn;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=zB36uMU9;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101a1862c6a48-ca49f9f7-cf76-40fb-a0a0-83469eb4e155-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1793252420;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=uPoTccxqErTb4jbxBmtLIM/Z+AMv6kNJJSi/qJsGA6Q=;
	b=tRHY+CTnWnG7OJ93S4TMZEmHQm2Y5NfXCyWquwIPR6IRzjcSFRdVqdFMpPwQU85E
	KSGijBE/GPTR3NDsEC3wusjku91dmTRiS+0BLdJ/nc6IBwIiGqpG/ivMJ1wqjJL0MTw
	Sz/qLs2yiaJRzoTdtHnhtkFxlb5h2Ic+Bh0NBkUQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1793252420;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=uPoTccxqErTb4jbxBmtLIM/Z+AMv6kNJJSi/qJsGA6Q=;
	b=zB36uMU993som9Hugp3rf08M1DSH9v96Hd9eygzgOYxAYobexOcK/5CD2Lde0BFK
	J4tQL8/ZL5ylM0BQ8sqmYfgioSozWfOHjszisRVhg8+kbDxvAJNiZiCWxGNpayjLsld
	ohLOti1bF9w9s+C36yvw3S9VuQ82kZpNXdqLR2sY=
Content-Type: multipart/mixed; boundary="===============3657324326015665174=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] aspell: upgrading to 0.60.8.3 SUCCEEDED
Message-ID: <010101a1862c6a48-ca49f9f7-cf76-40fb-a0a0-83469eb4e155-000000@us-west-2.amazonses.com>
Date: Thu, 29 Oct 2026 05:40:20 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.29-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 05:40:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248895

--===============3657324326015665174==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *aspell* to *0.60.8.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-aspell-upgrade-0.60.8.2-0.60.8.3.patch
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
From 60aa6f0dc1712dd1e57740670a77e8c44d00e882 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 29 Oct 2026 05:40:13 +0000
Subject: [PATCH] aspell: upgrade 0.60.8.2 -> 0.60.8.3

---
 .../aspell/{aspell_0.60.8.2.bb => aspell_0.60.8.3.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/aspell/{aspell_0.60.8.2.bb => aspell_0.60.8.3.bb} (93%)

diff --git a/meta/recipes-support/aspell/aspell_0.60.8.2.bb b/meta/recipes-support/aspell/aspell_0.60.8.3.bb
similarity index 93%
rename from meta/recipes-support/aspell/aspell_0.60.8.2.bb
rename to meta/recipes-support/aspell/aspell_0.60.8.3.bb
index 60d3376678..d97958d83b 100644
--- a/meta/recipes-support/aspell/aspell_0.60.8.2.bb
+++ b/meta/recipes-support/aspell/aspell_0.60.8.3.bb
@@ -14,7 +14,7 @@ LICENSE = "LGPL-2.0-only OR LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 
 SRC_URI = "${GNU_MIRROR}/aspell/aspell-${PV}.tar.gz"
-SRC_URI[sha256sum] = "57fe4863eae6048f72245a8575b44b718fb85ca14b9f8c0afc41b254dfd76919"
+SRC_URI[sha256sum] = "0534eae11132405120d11e46bf595bd5dd189bc124ba77a5dd6aae861b48a162"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[curses] = "--enable-curses,--disable-curses,ncurses"
-- 
2.47.1


--===============3657324326015665174==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/aspell/aspell-dbg: PKGSIZE changed from 9590968 to 9620192 (+0%)
packages/x86-64-v3-poky-linux/aspell/aspell-dbg: PV changed from "0.60.8.2" to "0.60.8.3"
packages/x86-64-v3-poky-linux/aspell/aspell-dbg: PKGV changed from 0.60.8.2 [default] to 0.60.8.3 [default]
packages/x86-64-v3-poky-linux/aspell/aspell-dev: PKGSIZE changed from 37210 to 37211 (+0%)
packages/x86-64-v3-poky-linux/aspell/aspell-dev: PV changed from "0.60.8.2" to "0.60.8.3"
packages/x86-64-v3-poky-linux/aspell/aspell-dev: PKGV changed from 0.60.8.2 [default] to 0.60.8.3 [default]
packages/x86-64-v3-poky-linux/aspell/aspell-doc: PKGSIZE changed from 347257 to 347808 (+0%)
packages/x86-64-v3-poky-linux/aspell/aspell-doc: PV changed from "0.60.8.2" to "0.60.8.3"
packages/x86-64-v3-poky-linux/aspell/aspell-doc: PKGV changed from 0.60.8.2 [default] to 0.60.8.3 [default]
packages/x86-64-v3-poky-linux/aspell/aspell-locale-ast: PV changed from "0.60.8.2" to "0.60.8.3"
packages/x86-64-v3-poky-linux/aspell/aspell-locale-ast: PKGV changed from 0.60.8.2 [default] to 0.60.8.3 [default]
packages/x86-64-v3-poky-linux/aspell/aspell-locale-be: PV changed from "0.60.8.2" to "0.60.8.3"
packages/x86-64-v3-poky-linux/aspell/aspell-locale-be: PKGV changed from 0.60.8.2 [default] to 0.60.8.3 [default]
packages/x86-64-v3-poky-linux/aspell/aspell-locale-ca: PV changed from "0.60.8.2" to "0.60.8.3"
packages/x86-64-v3-poky-linux/aspell/aspell-locale-ca: PKGV changed from 0.60.8.2 [default] to 0.60.8.3 [default]
packages/x86-64-v3-poky-linux/aspell/aspell-locale-cs: PV changed from "0.60.8.2" to "0.60.8.3"
packages/x86-64-v3-poky-linux/aspell/aspell-locale-cs: PKGV changed from 0.60.8.2 [default] to 0.60.8.3 [default]
packages/x86-64-v3-poky-linux/aspell/aspell-locale-da: PV changed from "0.60.8.2" to "0.60.8.3"
packages/x86-64-v3-poky-linux/aspell/aspell-locale-da: PKGV changed from 0.60.8.2 [default] to 0.60.8.3 [default]
packages/x86-64-v3-poky-linux/aspell/aspell-locale-de: PKGSIZE changed from 32736 to 32943 (+1%)
packages/x86-64-v3-poky-linux/aspell/aspell-locale-de: PV changed from "0.60.8.2" to "0.60.8.3"
packages/x86-64-v3-poky-linux/aspell/aspell-locale-de: PKGV changed from 0.60.8.2 [default] to 0.60.8.3 [default]
packages/x86-64-v3-poky-linux/aspell/aspell-locale-en-gb: PV changed from "0.60.8.2" to "0.60.8.3"
packages/x86-64-v3-poky-linux/aspell/aspell-locale-en-gb: PKGV changed from 0.60.8.2 [default] to 0.60.8.3 [default]
packages/x86-64-v3-poky-linux/aspell/aspell-locale-eo: PV changed from "0.60.8.2" to "0.60.8.3"
packages/x86-64-v3-poky-linux/aspell/aspell-locale-eo: PKGV changed from 0.60.8.2 [default] to 0.60.8.3 [default]
packages/x86-64-v3-poky-linux/aspell/aspell-locale-es: PV changed from "0.60.8.2" to "0.60.8.3"
packages/x86-64-v3-poky-linux/aspell/aspell-locale-es: PKGV changed from 0.60.8.2 [default] to 0.60.8.3 [default]
packages/x86-64-v3-poky-linux/aspell/aspell-locale-fi: PV changed from "0.60.8.2" to "0.60.8.3"
packages/x86-64-v3-poky-linux/aspell/aspell-locale-fi: PKGV changed from 0.60.8.2 [default] to 0.60.8.3 [default]
packages/x86-64-v3-poky-linux/aspell/aspell-locale-fr: PKGSIZE changed from 32807 to 33026 (+1%)
packages/x86-64-v3-poky-linux/aspell/aspell-locale-fr: PV changed from "0.60.8.2" to "0.60.8.3"
packages/x86-64-v3-poky-linux/aspell/aspell-locale-fr: PKGV changed from 0.60.8.2 [default] to 0.60.8.3 [default]
packages/x86-64-v3-poky-linux/aspell/aspell-locale-fur: PV changed from "0.60.8.2" to "0.60.8.3"
packages/x86-64-v3-poky-linux/aspell/aspell-locale-fur: PKGV changed from 0.60.8.2 [default] to 0.60.8.3 [default]
packages/x86-64-v3-poky-linux/aspell/aspell-locale-ga: PV changed from "0.60.8.2" to "0.60.8.3"
packages/x86-64-v3-poky-linux/aspell/aspell-locale-ga: PKGV changed from 0.60.8.2 [default] to 0.60.8.3 [default]
packages/x86-64-v3-poky-linux/aspell/aspell-locale-hr: PKGSIZE changed from 31800 to 31983 (+1%)
packages/x86-64-v3-poky-linux/aspell/aspell-locale-hr: PV changed from "0.60.8.2" to "0.60.8.3"
packages/x86-64-v3-poky-linux/aspell/aspell-locale-hr: PKGV changed from 0.60.8.2 [default] to 0.60.8.3 [default]
packages/x86-64-v3-poky-linux/aspell/aspell-locale-hu: PV changed from "0.60.8.2" to "0.60.8.3"
packages/x86-64-v3-poky-linux/aspell/aspell-locale-hu: PKGV changed from 0.60.8.2 [default] to 0.60.8.3 [default]
packages/x86-64-v3-poky-linux/aspell/aspell-locale-id: PKGSIZE changed from 31716 to 31884 (+1%)
packages/x86-64-v3-poky-linux/aspell/aspell-locale-id: PV changed from "0.60.8.2" to "0.60.8.3"
packages/x86-64-v3-poky-linux/aspell/aspell-locale-id: PKGV changed from 0.60.8.2 [default] to 0.60.8.3 [default]
packages/x86-64-v3-poky-linux/aspell/aspell-locale-it: PV changed from "0.60.8.2" to "0.60.8.3"
packages/x86-64-v3-poky-linux/aspell/aspell-locale-it: PKGV changed from 0.60.8.2 [default] to 0.60.8.3 [default]
packages/x86-64-v3-poky-linux/aspell/aspell-locale-ja: PKGSIZE changed from 34747 to 35003 (+1%)
packages/x86-64-v3-poky-linux/aspell/aspell-locale-ja: PV changed from "0.60.8.2" to "0.60.8.3"
packages/x86-64-v3-poky-linux/aspell/aspell-locale-ja: PKGV changed from 0.60.8.2 [default] to 0.60.8.3 [default]
packages/x86-64-v3-poky-linux/aspell/aspell-locale-ka: PV changed from "0.60.8.2" to "0.60.8.3"
packages/x86-64-v3-poky-linux/aspell/aspell-locale-ka: PKGV changed from 0.60.8.2 [default] to 0.60.8.3 [default]
packages/x86-64-v3-poky-linux/aspell/aspell-locale-mn: PV changed from "0.60.8.2" to "0.60.8.3"
packages/x86-64-v3-poky-linux/aspell/aspell-locale-mn: PKGV changed from 0.60.8.2 [default] to 0.60.8.3 [default]
packages/x86-64-v3-poky-linux/aspell/aspell-locale-ms: PV changed from "0.60.8.2" to "0.60.8.3"
packages/x86-64-v3-poky-linux/aspell/aspell-locale-ms: PKGV changed from 0.60.8.2 [default] to 0.60.8.3 [default]
packages/x86-64-v3-poky-linux/aspell/aspell-locale-nl: PKGSIZE changed from 32209 to 32415 (+1%)
packages/x86-64-v3-poky-linux/aspell/aspell-locale-nl: PV changed from "0.60.8.2" to "0.60.8.3"
packages/x86-64-v3-poky-linux/aspell/aspell-locale-nl: PKGV changed from 0.60.8.2 [default] to 0.60.8.3 [default]
packages/x86-64-v3-poky-linux/aspell/aspell-locale-pl: PKGSIZE changed from 31418 to 31609 (+1%)
packages/x86-64-v3-poky-linux/aspell/aspell-locale-pl: PV changed from "0.60.8.2" to "0.60.8.3"
packages/x86-64-v3-poky-linux/aspell/aspell-locale-pl: PKGV changed from 0.60.8.2 [default] to 0.60.8.3 [default]
packages/x86-64-v3-poky-linux/aspell/aspell-locale-pt-br: PKGSIZE changed from 31998 to 32204 (+1%)
packages/x86-64-v3-poky-linux/aspell/aspell-locale-pt-br: PV changed from "0.60.8.2" to "0.60.8.3"
packages/x86-64-v3-poky-linux/aspell/aspell-locale-pt-br: PKGV changed from 0.60.8.2 [default] to 0.60.8.3 [default]
packages/x86-64-v3-poky-linux/aspell/aspell-locale-pt: PKGSIZE changed from 31852 to 32035 (+1%)
packages/x86-64-v3-poky-linux/aspell/aspell-locale-pt: PV changed from "0.60.8.2" to "0.60.8.3"
packages/x86-64-v3-poky-linux/aspell/aspell-locale-pt: PKGV changed from 0.60.8.2 [default] to 0.60.8.3 [default]
packages/x86-64-v3-poky-linux/aspell/aspell-locale-ro: PKGSIZE changed from 33852 to 34051 (+1%)
packages/x86-64-v3-poky-linux/aspell/aspell-locale-ro: PV changed from "0.60.8.2" to "0.60.8.3"
packages/x86-64-v3-poky-linux/aspell/aspell-locale-ro: PKGV changed from 0.60.8.2 [default] to 0.60.8.3 [default]
packages/x86-64-v3-poky-linux/aspell/aspell-locale-ru: PV changed from "0.60.8.2" to "0.60.8.3"
packages/x86-64-v3-poky-linux/aspell/aspell-locale-ru: PKGV changed from 0.60.8.2 [default] to 0.60.8.3 [default]
packages/x86-64-v3-poky-linux/aspell/aspell-locale-rw: PV changed from "0.60.8.2" to "0.60.8.3"
packages/x86-64-v3-poky-linux/aspell/aspell-locale-rw: PKGV changed from 0.60.8.2 [default] to 0.60.8.3 [default]
packages/x86-64-v3-poky-linux/aspell/aspell-locale-sk: PV changed from "0.60.8.2" to "0.60.8.3"
packages/x86-64-v3-poky-linux/aspell/aspell-locale-sk: PKGV changed from 0.60.8.2 [default] to 0.60.8.3 [default]
packages/x86-64-v3-poky-linux/aspell/aspell-locale-sl: PKGSIZE changed from 30957 to 31234 (+1%)
packages/x86-64-v3-poky-linux/aspell/aspell-locale-sl: PV changed from "0.60.8.2" to "0.60.8.3"
packages/x86-64-v3-poky-linux/aspell/aspell-locale-sl: PKGV changed from 0.60.8.2 [default] to 0.60.8.3 [default]
packages/x86-64-v3-poky-linux/aspell/aspell-locale-sq: PKGSIZE changed from 29903 to 30570 (+2%)
packages/x86-64-v3-poky-linux/aspell/aspell-locale-sq: PV changed from "0.60.8.2" to "0.60.8.3"
packages/x86-64-v3-poky-linux/aspell/aspell-locale-sq: PKGV changed from 0.60.8.2 [default] to 0.60.8.3 [default]
packages/x86-64-v3-poky-linux/aspell/aspell-locale-sr: PV changed from "0.60.8.2" to "0.60.8.3"
packages/x86-64-v3-poky-linux/aspell/aspell-locale-sr: PKGV changed from 0.60.8.2 [default] to 0.60.8.3 [default]
packages/x86-64-v3-poky-linux/aspell/aspell-locale-sv: PV changed from "0.60.8.2" to "0.60.8.3"
packages/x86-64-v3-poky-linux/aspell/aspell-locale-sv: PKGV changed from 0.60.8.2 [default] to 0.60.8.3 [default]
packages/x86-64-v3-poky-linux/aspell/aspell-locale-tg: PV changed from "0.60.8.2" to "0.60.8.3"
packages/x86-64-v3-poky-linux/aspell/aspell-locale-tg: PKGV changed from 0.60.8.2 [default] to 0.60.8.3 [default]
packages/x86-64-v3-poky-linux/aspell/aspell-locale-uk: PKGSIZE changed from 39600 to 39892 (+1%)
packages/x86-64-v3-poky-linux/aspell/aspell-locale-uk: PV changed from "0.60.8.2" to "0.60.8.3"
packages/x86-64-v3-poky-linux/aspell/aspell-locale-uk: PKGV changed from 0.60.8.2 [default] to 0.60.8.3 [default]
packages/x86-64-v3-poky-linux/aspell/aspell-locale-vi: PV changed from "0.60.8.2" to "0.60.8.3"
packages/x86-64-v3-poky-linux/aspell/aspell-locale-vi: PKGV changed from 0.60.8.2 [default] to 0.60.8.3 [default]
packages/x86-64-v3-poky-linux/aspell/aspell-locale-wa: PV changed from "0.60.8.2" to "0.60.8.3"
packages/x86-64-v3-poky-linux/aspell/aspell-locale-wa: PKGV changed from 0.60.8.2 [default] to 0.60.8.3 [default]
packages/x86-64-v3-poky-linux/aspell/aspell-locale-zh-cn: PV changed from "0.60.8.2" to "0.60.8.3"
packages/x86-64-v3-poky-linux/aspell/aspell-locale-zh-cn: PKGV changed from 0.60.8.2 [default] to 0.60.8.3 [default]
packages/x86-64-v3-poky-linux/aspell/aspell-src: PKGSIZE changed from 974876 to 976757 (+0%)
packages/x86-64-v3-poky-linux/aspell/aspell-src: PV changed from "0.60.8.2" to "0.60.8.3"
packages/x86-64-v3-poky-linux/aspell/aspell-src: FILELIST: directory renamed /usr/src/debug/aspell/0.60.8.2/interfaces/cc -> /usr/src/debug/aspell/0.60.8.3/interfaces/cc, directory renamed /usr/src/debug/aspell/0.60.8.2/prog -> /usr/src/debug/aspell/0.60.8.3/prog, directory renamed /usr/src/debug/aspell/0.60.8.2/gen -> /usr/src/debug/aspell/0.60.8.3/gen, directory renamed /usr/src/debug/aspell/0.60.8.2/lib -> /usr/src/debug/aspell/0.60.8.3/lib, directory renamed /usr/src/debug/aspell/0.60.8.2/modules/speller/default -> /usr/src/debug/aspell/0.60.8.3/modules/speller/default, directory renamed /usr/src/debug/aspell/0.60.8.2/modules/tokenizer -> /usr/src/debug/aspell/0.60.8.3/modules/tokenizer, directory renamed /usr/src/debug/aspell/0.60.8.2/common -> /usr/src/debug/aspell/0.60.8.3/common, directory renamed /usr/src/debug/aspell/0.60.8.2/modules/filter -> /usr/src/debug/aspell/0.60.8.3/modules/filter
packages/x86-64-v3-poky-linux/aspell/aspell-src: PKGV changed from 0.60.8.2 [default] to 0.60.8.3 [default]
packages/x86-64-v3-poky-linux/aspell/aspell-staticdev: PV changed from "0.60.8.2" to "0.60.8.3"
packages/x86-64-v3-poky-linux/aspell/aspell-staticdev: PKGV changed from 0.60.8.2 [default] to 0.60.8.3 [default]
packages/x86-64-v3-poky-linux/aspell/aspell-utils: PV changed from "0.60.8.2" to "0.60.8.3"
packages/x86-64-v3-poky-linux/aspell/aspell-utils: PKGV changed from 0.60.8.2 [default] to 0.60.8.3 [default]
packages/x86-64-v3-poky-linux/aspell/aspell: PKGSIZE changed from 158080 to 153984 (-3%)
packages/x86-64-v3-poky-linux/aspell/aspell: PV changed from "0.60.8.2" to "0.60.8.3"
packages/x86-64-v3-poky-linux/aspell/aspell: PKGV changed from 0.60.8.2 [default] to 0.60.8.3 [default]
packages/x86-64-v3-poky-linux/aspell: PV changed from "0.60.8.2" to "0.60.8.3"
packages/x86-64-v3-poky-linux/aspell: SRC_URI changed from "https://ftpmirror.gnu.org//aspell/aspell-0.60.8.2.tar.gz" to "https://ftpmirror.gnu.org//aspell/aspell-0.60.8.3.tar.gz"
packages/x86-64-v3-poky-linux/aspell: PACKAGES: added "aspell-locale-ar aspell-locale-zh-tw"
packages/x86-64-v3-poky-linux/aspell: PKGV changed from 0.60.8.2 [default] to 0.60.8.3 [default]
packages/x86-64-v3-poky-linux/aspell/libaspell: PV changed from "0.60.8.2" to "0.60.8.3"
packages/x86-64-v3-poky-linux/aspell/libaspell: PKGV changed from 0.60.8.2 [default] to 0.60.8.3 [default]
packages/x86-64-v3-poky-linux/aspell/libpspell: PV changed from "0.60.8.2" to "0.60.8.3"
packages/x86-64-v3-poky-linux/aspell/libpspell: PKGV changed from 0.60.8.2 [default] to 0.60.8.3 [default]

--===============3657324326015665174==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-aspell-upgrade-0.60.8.2-0.60.8.3.patch"

RnJvbSA2MGFhNmYwZGMxNzEyZGQxZTU3NzQwNjcwYTc3ZThjNDRkMDBlODgyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMjkgT2N0IDIwMjYgMDU6NDA6MTMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBh
c3BlbGw6IHVwZ3JhZGUgMC42MC44LjIgLT4gMC42MC44LjMKCi0tLQogLi4uL2FzcGVsbC97YXNw
ZWxsXzAuNjAuOC4yLmJiID0+IGFzcGVsbF8wLjYwLjguMy5iYn0gICAgICAgICAgIHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0
YS9yZWNpcGVzLXN1cHBvcnQvYXNwZWxsL3thc3BlbGxfMC42MC44LjIuYmIgPT4gYXNwZWxsXzAu
NjAuOC4zLmJifSAoOTMlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2FzcGVs
bC9hc3BlbGxfMC42MC44LjIuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9hc3BlbGwvYXNwZWxs
XzAuNjAuOC4zLmJiCnNpbWlsYXJpdHkgaW5kZXggOTMlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBl
cy1zdXBwb3J0L2FzcGVsbC9hc3BlbGxfMC42MC44LjIuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBl
cy1zdXBwb3J0L2FzcGVsbC9hc3BlbGxfMC42MC44LjMuYmIKaW5kZXggNjBkMzM3NjY3OC4uZDk3
OTU4ZDgzYiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvYXNwZWxsL2FzcGVsbF8w
LjYwLjguMi5iYgorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9hc3BlbGwvYXNwZWxsXzAuNjAu
OC4zLmJiCkBAIC0xNCw3ICsxNCw3IEBAIExJQ0VOU0UgPSAiTEdQTC0yLjAtb25seSBPUiBMR1BM
LTIuMS1vbmx5IgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9N2ZiYzMz
ODMwOWFjMzhmZWZjZDY0YjA0YmI5MDNlMzQiCiAKIFNSQ19VUkkgPSAiJHtHTlVfTUlSUk9SfS9h
c3BlbGwvYXNwZWxsLSR7UFZ9LnRhci5neiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI1N2ZlNDg2
M2VhZTYwNDhmNzIyNDVhODU3NWI0NGI3MThmYjg1Y2ExNGI5ZjhjMGFmYzQxYjI1NGRmZDc2OTE5
IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjA1MzRlYWUxMTEzMjQwNTEyMGQxMWU0NmJmNTk1YmQ1
ZGQxODliYzEyNGJhNzdhNWRkNmFhZTg2MWI0OGExNjIiCiAKIFBBQ0tBR0VDT05GSUcgPz89ICIi
CiBQQUNLQUdFQ09ORklHW2N1cnNlc10gPSAiLS1lbmFibGUtY3Vyc2VzLC0tZGlzYWJsZS1jdXJz
ZXMsbmN1cnNlcyIKLS0gCjIuNDcuMQoK

--===============3657324326015665174==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/aspell: PACKAGES: added "aspell-locale-ar aspell-locale-zh-tw"

--===============3657324326015665174==--
