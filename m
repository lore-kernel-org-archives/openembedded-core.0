Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22011.1794806390813809322
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Nov 2026 21:19:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=BvKXwfyU;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=GNJKGV+G;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101a1e2cc1c14-54f380cd-a1ea-4c0d-b509-8bb9433e6fa6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1794806389;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=c2msfccsTTY1fcYWiaFUcnvfar2z2pqEPg+ENgiNyLk=;
	b=BvKXwfyUXP71CUvLbzr64+FB28ZKRy87ZQubzhGx7+rGBTiuczHr5N8lK7c3k8DC
	ROBk/lzK7LY4h5XCJn7iXD4DAZOMvxIcabebc/6aJDLfA3biE74q4oCRStmCcPfrTnc
	2KmOf3kWIuV7iZQeOqit3BRZ4kYXqy6cGL1NM5MI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1794806389;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=c2msfccsTTY1fcYWiaFUcnvfar2z2pqEPg+ENgiNyLk=;
	b=GNJKGV+G4TCUURySbk0W/ZpIGj3kq1lAsSNI5LLAdICxZzWrWYaLLhiQr2eu4MNO
	j25NP+Pr1ZW7zVFXslzmgygjq9R7ZAj+n3RBbWJXrDC2Q3Wn39oFKi/xv1Vdchj7Hey
	PKMFTaEcrx5JuKZXSfMJChdhcG8yzy366x7Ljg+c=
Content-Type: multipart/mixed; boundary="===============2856964607775959108=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Sai Sireesha T <saisireesha.t@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] sysstat: upgrading to 12.8.1 SUCCEEDED
Message-ID: <010101a1e2cc1c14-54f380cd-a1ea-4c0d-b509-8bb9433e6fa6-000000@us-west-2.amazonses.com>
Date: Mon, 16 Nov 2026 05:19:49 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.16-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 05:19:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250313

--===============2856964607775959108==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *sysstat* to *12.8.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-sysstat-upgrade-12.8.0-12.8.1.patch
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
From e88266d1c5e2c1ec6ead772e3b8b811501d0ea05 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 16 Nov 2026 05:19:43 +0000
Subject: [PATCH] sysstat: upgrade 12.8.0 -> 12.8.1

2026/11/15: Version 12.8.1 - Sebastien Godard (sysstat <at> orange.fr)
---
 .../0001-configure.in-remove-check-for-chkconfig.patch      | 6 +++---
 .../sysstat/{sysstat_12.8.0.bb => sysstat_12.8.1.bb}        | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/sysstat/{sysstat_12.8.0.bb => sysstat_12.8.1.bb} (98%)

diff --git a/meta/recipes-extended/sysstat/sysstat/0001-configure.in-remove-check-for-chkconfig.patch b/meta/recipes-extended/sysstat/sysstat/0001-configure.in-remove-check-for-chkconfig.patch
index 3bbf769929..5df7b34820 100644
--- a/meta/recipes-extended/sysstat/sysstat/0001-configure.in-remove-check-for-chkconfig.patch
+++ b/meta/recipes-extended/sysstat/sysstat/0001-configure.in-remove-check-for-chkconfig.patch
@@ -1,4 +1,4 @@
-From 7df414e3a4919d6bc68728ea593d00098ef1fc13 Mon Sep 17 00:00:00 2001
+From 7ed3d5d804f889cbd2ae089b507d0d2be6e1a61c Mon Sep 17 00:00:00 2001
 From: Wenlin Kang <wenlin.kang@windriver.com>
 Date: Tue, 5 Nov 2019 16:16:44 +0800
 Subject: [PATCH] configure.ac: remove check for chkconfig
@@ -13,10 +13,10 @@ Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 17507ea9..a08d717b 100644
+index 834ec262..d47e11e2 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -42,7 +42,8 @@ AC_SUBST(VER_JSON)
+@@ -44,7 +44,8 @@ AC_SUBST(VER_NDJSON)
  AC_SUBST(VER_XML)
  
  AC_PATH_PROG(PATH_CP, cp)
diff --git a/meta/recipes-extended/sysstat/sysstat_12.8.0.bb b/meta/recipes-extended/sysstat/sysstat_12.8.1.bb
similarity index 98%
rename from meta/recipes-extended/sysstat/sysstat_12.8.0.bb
rename to meta/recipes-extended/sysstat/sysstat_12.8.1.bb
index d5a9b48491..eabc87aa88 100644
--- a/meta/recipes-extended/sysstat/sysstat_12.8.0.bb
+++ b/meta/recipes-extended/sysstat/sysstat_12.8.1.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://github.com/sysstat/sysstat.git;protocol=https;branch=master;tag
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=a23a74b3f4caf9616230789d94217acb"
 
-SRCREV = "ffabe8175aa9a7aa056380c66ed3648e50c1967d"
+SRCREV = "a0929c04249a015a924399e87a3fd06045d81846"
 
 DEPENDS += "base-passwd xz-native"
 
-- 
2.47.1


--===============2856964607775959108==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="sysstat-changelog.txt"

2026/11/15: Version 12.8.1 - Sebastien Godard (sysstat <at> orange.fr)

--===============2856964607775959108==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-zh-tw: PKGSIZE changed from 5504 to 15205 (+176%)

--===============2856964607775959108==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/sysstat: PKGV changed from 12.8.0 [default] to 12.8.1 [default]
packages/x86-64-v3-poky-linux/sysstat: SRC_URI changed from "git://github.com/sysstat/sysstat.git;protocol=https;branch=master;tag=v12.8.0 file://99_sysstat file://sysstat.service file://0001-configure.in-remove-check-for-chkconfig.patch" to "git://github.com/sysstat/sysstat.git;protocol=https;branch=master;tag=v12.8.1 file://99_sysstat file://sysstat.service file://0001-configure.in-remove-check-for-chkconfig.patch"
packages/x86-64-v3-poky-linux/sysstat: PV changed from "12.8.0" to "12.8.1"
packages/x86-64-v3-poky-linux/sysstat/sysstat-dbg: PV changed from "12.8.0" to "12.8.1"
packages/x86-64-v3-poky-linux/sysstat/sysstat-dbg: PKGSIZE changed from 2842000 to 2870552 (+1%)
packages/x86-64-v3-poky-linux/sysstat/sysstat-dbg: PKGV changed from 12.8.0 [default] to 12.8.1 [default]
packages/x86-64-v3-poky-linux/sysstat/sysstat-dev: PV changed from "12.8.0" to "12.8.1"
packages/x86-64-v3-poky-linux/sysstat/sysstat-dev: PKGV changed from 12.8.0 [default] to 12.8.1 [default]
packages/x86-64-v3-poky-linux/sysstat/sysstat-doc: PV changed from "12.8.0" to "12.8.1"
packages/x86-64-v3-poky-linux/sysstat/sysstat-doc: PKGSIZE changed from 268643 to 271126 (+1%)
packages/x86-64-v3-poky-linux/sysstat/sysstat-doc: PKGV changed from 12.8.0 [default] to 12.8.1 [default]
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-af: PV changed from "12.8.0" to "12.8.1"
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-af: PKGV changed from 12.8.0 [default] to 12.8.1 [default]
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-be: PV changed from "12.8.0" to "12.8.1"
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-be: PKGV changed from 12.8.0 [default] to 12.8.1 [default]
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-cs: PV changed from "12.8.0" to "12.8.1"
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-cs: PKGV changed from 12.8.0 [default] to 12.8.1 [default]
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-da: PV changed from "12.8.0" to "12.8.1"
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-da: PKGV changed from 12.8.0 [default] to 12.8.1 [default]
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-de: PV changed from "12.8.0" to "12.8.1"
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-de: PKGSIZE changed from 16005 to 16232 (+1%)
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-de: PKGV changed from 12.8.0 [default] to 12.8.1 [default]
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-eo: PV changed from "12.8.0" to "12.8.1"
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-eo: PKGV changed from 12.8.0 [default] to 12.8.1 [default]
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-es: PV changed from "12.8.0" to "12.8.1"
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-es: PKGV changed from 12.8.0 [default] to 12.8.1 [default]
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-eu: PV changed from "12.8.0" to "12.8.1"
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-eu: PKGV changed from 12.8.0 [default] to 12.8.1 [default]
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-fi: PV changed from "12.8.0" to "12.8.1"
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-fi: PKGV changed from 12.8.0 [default] to 12.8.1 [default]
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-fr: PV changed from "12.8.0" to "12.8.1"
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-fr: PKGV changed from 12.8.0 [default] to 12.8.1 [default]
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-fur: PV changed from "12.8.0" to "12.8.1"
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-fur: PKGV changed from 12.8.0 [default] to 12.8.1 [default]
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-gl: PV changed from "12.8.0" to "12.8.1"
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-gl: PKGV changed from 12.8.0 [default] to 12.8.1 [default]
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-hr: PV changed from "12.8.0" to "12.8.1"
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-hr: PKGV changed from 12.8.0 [default] to 12.8.1 [default]
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-hu: PV changed from "12.8.0" to "12.8.1"
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-hu: PKGV changed from 12.8.0 [default] to 12.8.1 [default]
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-id: PV changed from "12.8.0" to "12.8.1"
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-id: PKGV changed from 12.8.0 [default] to 12.8.1 [default]
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-it: PV changed from "12.8.0" to "12.8.1"
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-it: PKGV changed from 12.8.0 [default] to 12.8.1 [default]
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-ja: PV changed from "12.8.0" to "12.8.1"
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-ja: PKGV changed from 12.8.0 [default] to 12.8.1 [default]
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-ka: PV changed from "12.8.0" to "12.8.1"
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-ka: PKGV changed from 12.8.0 [default] to 12.8.1 [default]
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-ko: PV changed from "12.8.0" to "12.8.1"
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-ko: PKGSIZE changed from 16208 to 16445 (+1%)
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-ko: PKGV changed from 12.8.0 [default] to 12.8.1 [default]
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-ky: PV changed from "12.8.0" to "12.8.1"
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-ky: PKGV changed from 12.8.0 [default] to 12.8.1 [default]
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-lv: PV changed from "12.8.0" to "12.8.1"
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-lv: PKGSIZE changed from 15989 to 16278 (+2%)
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-lv: PKGV changed from 12.8.0 [default] to 12.8.1 [default]
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-mt: PV changed from "12.8.0" to "12.8.1"
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-mt: PKGV changed from 12.8.0 [default] to 12.8.1 [default]
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-nb: PV changed from "12.8.0" to "12.8.1"
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-nb: PKGV changed from 12.8.0 [default] to 12.8.1 [default]
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-nl: PV changed from "12.8.0" to "12.8.1"
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-nl: PKGV changed from 12.8.0 [default] to 12.8.1 [default]
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-nn: PV changed from "12.8.0" to "12.8.1"
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-nn: PKGV changed from 12.8.0 [default] to 12.8.1 [default]
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-pl: PV changed from "12.8.0" to "12.8.1"
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-pl: PKGV changed from 12.8.0 [default] to 12.8.1 [default]
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-pt-br: PV changed from "12.8.0" to "12.8.1"
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-pt-br: PKGV changed from 12.8.0 [default] to 12.8.1 [default]
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-pt: PV changed from "12.8.0" to "12.8.1"
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-pt: PKGSIZE changed from 16367 to 16536 (+1%)
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-pt: PKGV changed from 12.8.0 [default] to 12.8.1 [default]
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-ro: PV changed from "12.8.0" to "12.8.1"
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-ro: PKGSIZE changed from 16755 to 16979 (+1%)
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-ro: PKGV changed from 12.8.0 [default] to 12.8.1 [default]
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-ru: PV changed from "12.8.0" to "12.8.1"
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-ru: PKGV changed from 12.8.0 [default] to 12.8.1 [default]
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-sk: PV changed from "12.8.0" to "12.8.1"
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-sk: PKGV changed from 12.8.0 [default] to 12.8.1 [default]
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-sr: PV changed from "12.8.0" to "12.8.1"
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-sr: PKGSIZE changed from 19185 to 19245 (+0%)
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-sr: PKGV changed from 12.8.0 [default] to 12.8.1 [default]
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-sv: PV changed from "12.8.0" to "12.8.1"
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-sv: PKGSIZE changed from 15649 to 15851 (+1%)
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-sv: PKGV changed from 12.8.0 [default] to 12.8.1 [default]
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-tr: PV changed from "12.8.0" to "12.8.1"
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-tr: PKGV changed from 12.8.0 [default] to 12.8.1 [default]
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-uk: PV changed from "12.8.0" to "12.8.1"
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-uk: PKGSIZE changed from 19949 to 20191 (+1%)
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-uk: PKGV changed from 12.8.0 [default] to 12.8.1 [default]
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-vi: PV changed from "12.8.0" to "12.8.1"
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-vi: PKGV changed from 12.8.0 [default] to 12.8.1 [default]
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-zh-cn: PV changed from "12.8.0" to "12.8.1"
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-zh-cn: PKGSIZE changed from 15221 to 15548 (+2%)
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-zh-cn: PKGV changed from 12.8.0 [default] to 12.8.1 [default]
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-zh-tw: PV changed from "12.8.0" to "12.8.1"
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-zh-tw: PKGSIZE changed from 5504 to 15205 (+176%)
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-zh-tw: PKGV changed from 12.8.0 [default] to 12.8.1 [default]
packages/x86-64-v3-poky-linux/sysstat/sysstat-src: PV changed from "12.8.0" to "12.8.1"
packages/x86-64-v3-poky-linux/sysstat/sysstat-src: PKGSIZE changed from 1986033 to 2004707 (+1%)
packages/x86-64-v3-poky-linux/sysstat/sysstat-src: FILELIST: directory renamed /usr/src/debug/sysstat/12.8.0 -> /usr/src/debug/sysstat/12.8.1
packages/x86-64-v3-poky-linux/sysstat/sysstat-src: PKGV changed from 12.8.0 [default] to 12.8.1 [default]
packages/x86-64-v3-poky-linux/sysstat/sysstat-staticdev: PV changed from "12.8.0" to "12.8.1"
packages/x86-64-v3-poky-linux/sysstat/sysstat-staticdev: PKGV changed from 12.8.0 [default] to 12.8.1 [default]
packages/x86-64-v3-poky-linux/sysstat/sysstat: PV changed from "12.8.0" to "12.8.1"
packages/x86-64-v3-poky-linux/sysstat/sysstat: PKGSIZE changed from 1087227 to 1103611 (+2%)
packages/x86-64-v3-poky-linux/sysstat/sysstat: PKGV changed from 12.8.0 [default] to 12.8.1 [default]

--===============2856964607775959108==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-sysstat-upgrade-12.8.0-12.8.1.patch"

RnJvbSBlODgyNjZkMWM1ZTJjMWVjNmVhZDc3MmUzYjhiODExNTAxZDBlYTA1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTYgTm92IDIwMjYgMDU6MTk6NDMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
eXNzdGF0OiB1cGdyYWRlIDEyLjguMCAtPiAxMi44LjEKCjIwMjYvMTEvMTU6IFZlcnNpb24gMTIu
OC4xIC0gU2ViYXN0aWVuIEdvZGFyZCAoc3lzc3RhdCA8YXQ+IG9yYW5nZS5mcikKLS0tCiAuLi4v
MDAwMS1jb25maWd1cmUuaW4tcmVtb3ZlLWNoZWNrLWZvci1jaGtjb25maWcucGF0Y2ggICAgICB8
IDYgKysrLS0tCiAuLi4vc3lzc3RhdC97c3lzc3RhdF8xMi44LjAuYmIgPT4gc3lzc3RhdF8xMi44
LjEuYmJ9ICAgICAgICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0
IGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9zeXNzdGF0L3tzeXNz
dGF0XzEyLjguMC5iYiA9PiBzeXNzdGF0XzEyLjguMS5iYn0gKDk4JSkKCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc3lzc3RhdC9zeXNzdGF0LzAwMDEtY29uZmlndXJlLmluLXJl
bW92ZS1jaGVjay1mb3ItY2hrY29uZmlnLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3N5
c3N0YXQvc3lzc3RhdC8wMDAxLWNvbmZpZ3VyZS5pbi1yZW1vdmUtY2hlY2stZm9yLWNoa2NvbmZp
Zy5wYXRjaAppbmRleCAzYmJmNzY5OTI5Li41ZGY3YjM0ODIwIDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZXh0ZW5kZWQvc3lzc3RhdC9zeXNzdGF0LzAwMDEtY29uZmlndXJlLmluLXJlbW92ZS1j
aGVjay1mb3ItY2hrY29uZmlnLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9zeXNz
dGF0L3N5c3N0YXQvMDAwMS1jb25maWd1cmUuaW4tcmVtb3ZlLWNoZWNrLWZvci1jaGtjb25maWcu
cGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDdkZjQxNGUzYTQ5MTlkNmJjNjg3MjhlYTU5M2Qw
MDA5OGVmMWZjMTMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDdlZDNkNWQ4MDRmODg5
Y2JkMmFlMDg5YjUwN2QwZDJiZTZlMWE2MWMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9t
OiBXZW5saW4gS2FuZyA8d2VubGluLmthbmdAd2luZHJpdmVyLmNvbT4KIERhdGU6IFR1ZSwgNSBO
b3YgMjAxOSAxNjoxNjo0NCArMDgwMAogU3ViamVjdDogW1BBVENIXSBjb25maWd1cmUuYWM6IHJl
bW92ZSBjaGVjayBmb3IgY2hrY29uZmlnCkBAIC0xMywxMCArMTMsMTAgQEAgU2lnbmVkLW9mZi1i
eTogV2VubGluIEthbmcgPHdlbmxpbi5rYW5nQHdpbmRyaXZlci5jb20+CiAgMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvY29uZmln
dXJlLmFjIGIvY29uZmlndXJlLmFjCi1pbmRleCAxNzUwN2VhOS4uYTA4ZDcxN2IgMTAwNjQ0Citp
bmRleCA4MzRlYzI2Mi4uZDQ3ZTExZTIgMTAwNjQ0CiAtLS0gYS9jb25maWd1cmUuYWMKICsrKyBi
L2NvbmZpZ3VyZS5hYwotQEAgLTQyLDcgKzQyLDggQEAgQUNfU1VCU1QoVkVSX0pTT04pCitAQCAt
NDQsNyArNDQsOCBAQCBBQ19TVUJTVChWRVJfTkRKU09OKQogIEFDX1NVQlNUKFZFUl9YTUwpCiAg
CiAgQUNfUEFUSF9QUk9HKFBBVEhfQ1AsIGNwKQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4
dGVuZGVkL3N5c3N0YXQvc3lzc3RhdF8xMi44LjAuYmIgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQv
c3lzc3RhdC9zeXNzdGF0XzEyLjguMS5iYgpzaW1pbGFyaXR5IGluZGV4IDk4JQpyZW5hbWUgZnJv
bSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc3lzc3RhdC9zeXNzdGF0XzEyLjguMC5iYgpyZW5hbWUg
dG8gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3N5c3N0YXQvc3lzc3RhdF8xMi44LjEuYmIKaW5kZXgg
ZDVhOWI0ODQ5MS4uZWFiYzg3YWE4OCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVk
L3N5c3N0YXQvc3lzc3RhdF8xMi44LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3N5
c3N0YXQvc3lzc3RhdF8xMi44LjEuYmIKQEAgLTEyLDcgKzEyLDcgQEAgU1JDX1VSSSA9ICJnaXQ6
Ly9naXRodWIuY29tL3N5c3N0YXQvc3lzc3RhdC5naXQ7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1h
c3Rlcjt0YWcKIAogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9YTIzYTc0
YjNmNGNhZjk2MTYyMzA3ODlkOTQyMTdhY2IiCiAKLVNSQ1JFViA9ICJmZmFiZTgxNzVhYTlhN2Fh
MDU2MzgwYzY2ZWQzNjQ4ZTUwYzE5NjdkIgorU1JDUkVWID0gImEwOTI5YzA0MjQ5YTAxNWE5MjQz
OTllODdhM2ZkMDYwNDVkODE4NDYiCiAKIERFUEVORFMgKz0gImJhc2UtcGFzc3dkIHh6LW5hdGl2
ZSIKIAotLSAKMi40Ny4xCgo=

--===============2856964607775959108==--
