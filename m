Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F98FC46467
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:25:53 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com
 (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web12.11582.1650052686607942023
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Apr 2022 12:58:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=pan++rmn;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30,
 mailfrom: 010101802ecddf3a-552a414b-4dc9-4c8d-8ace-6e7d3ab42d38-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1650052685;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=nOpg6vx4HbJzX03HQ8MQ3Wi3s3+Wizr83LMBmx+jcGk=;
	b=pan++rmnZW0SAOmnEsDI4CnvYXiqeRT2Z4z2iTLgbUf+6QknB0ZBDUNqJGRzwK8P
	GqBA4MDRMLGom4Qcoybb8+WvOk2EpQtxynrtamJPpUhMp6TGg/9hcF96B9hWpFcT5kB
	C+gFNKKRtiZ/OgyegcNeiLWtTVomcGVF1d5hAC2E=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1650052685;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=nOpg6vx4HbJzX03HQ8MQ3Wi3s3+Wizr83LMBmx+jcGk=;
	b=TQyffof/qBetqrLTWhuERwHQvJqL4OZlZV5of/LEU+zPbS7gag2hjqZQXpFDKEwm
	+LqN6otswblxDdnD53w0vKj11/VbEZAUmiD/Y0r98FJ5YNU4EJMWF13AKqGuJluCjJ3
	RytPBIha2+HqrmL0tR7zS5qXYVfbY91TwYo6dNDA=
Content-Type: multipart/mixed; boundary="===============8878444214555570206=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] sysvinit: upgrading to 3.03 SUCCEEDED
Message-ID: 
 <010101802ecddf3a-552a414b-4dc9-4c8d-8ace-6e7d3ab42d38-000000@us-west-2.amazonses.com>
Date: Fri, 15 Apr 2022 19:58:05 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.04.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:25:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164436

--===============8878444214555570206==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *sysvinit* to *3.03* has Succeeded.

Next steps:
    - apply the patch: git am 0001-sysvinit-upgrade-3.01-3.03.patch
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
--===============8878444214555570206==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-sysvinit-upgrade-3.01-3.03.patch"

From 7d8c3e307511068e1918f4e65bb1bb11130ad6c9 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Apr 2022 06:40:29 +0000
Subject: [PATCH] sysvinit: upgrade 3.01 -> 3.03

---
 .../sysvinit/sysvinit/pidof-add-m-option.patch         | 10 +++++-----
 .../sysvinit/{sysvinit_3.01.bb => sysvinit_3.03.bb}    |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-core/sysvinit/{sysvinit_3.01.bb => sysvinit_3.03.bb} (98%)

diff --git a/meta/recipes-core/sysvinit/sysvinit/pidof-add-m-option.patch b/meta/recipes-core/sysvinit/sysvinit/pidof-add-m-option.patch
index 4386e6f832..06282d3187 100644
--- a/meta/recipes-core/sysvinit/sysvinit/pidof-add-m-option.patch
+++ b/meta/recipes-core/sysvinit/sysvinit/pidof-add-m-option.patch
@@ -1,4 +1,4 @@
-From 96fb53ef2ccd2580cf0aa565ef1629cb05eae50a Mon Sep 17 00:00:00 2001
+From 114b77a6f699012573051ed00bee132cc62fed3e Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Wed, 24 Jul 2013 17:07:22 +0800
 Subject: [PATCH] pidof: add -m option
@@ -21,10 +21,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  2 files changed, 65 insertions(+), 3 deletions(-)
 
 diff --git a/man/pidof.8 b/man/pidof.8
-index 84ed1e4..ac184da 100644
+index 6866cb3..a87d878 100644
 --- a/man/pidof.8
 +++ b/man/pidof.8
-@@ -25,6 +25,7 @@ pidof -- find the process ID of a running program.
+@@ -25,6 +25,7 @@ pidof - find the process ID of a running program
  .RB [ \-n ]
  .RB [ \-x ]
  .RB [ \-z ]
@@ -32,9 +32,9 @@ index 84ed1e4..ac184da 100644
  .RB [ \-o
  .IR omitpid[,omitpid...] ]
  .RB [ \-o
-@@ -79,6 +80,11 @@ is shown. The default separator is a space.
+@@ -77,6 +78,11 @@ is shown. The default separator is a space.
  Tells \fIpidof\fP to omit processes with that process id. The special
- pid \fB%PPID\fP can be used to name the parent process of the \fIpidof\fP
+ pid \fB%PPID\fP can be used to name the parent process of the \fBpidof\fP
  program, in other words the calling shell or shell script.
 +.IP -m
 +When used with -o, will also omit any processes that have the same
diff --git a/meta/recipes-core/sysvinit/sysvinit_3.01.bb b/meta/recipes-core/sysvinit/sysvinit_3.03.bb
similarity index 98%
rename from meta/recipes-core/sysvinit/sysvinit_3.01.bb
rename to meta/recipes-core/sysvinit/sysvinit_3.03.bb
index 844f5f0175..f6547f237a 100644
--- a/meta/recipes-core/sysvinit/sysvinit_3.01.bb
+++ b/meta/recipes-core/sysvinit/sysvinit_3.03.bb
@@ -21,7 +21,7 @@ SRC_URI = "${SAVANNAH_GNU_MIRROR}/sysvinit/sysvinit-${PV}.tar.xz \
            file://bootlogd.init \
            file://01_bootlogd \
            "
-SRC_URI[sha256sum] = "68b11a4772cdacce5fb65a4cbead324a2ce3999d138b4ff61dc2d59e57ef5793"
+SRC_URI[sha256sum] = "a80418c80828558da9e29208ebbe22d91903d047fd5babdd3cd0eb1fea32d6f0"
 
 S = "${WORKDIR}/sysvinit-${PV}"
 
-- 
2.27.0


--===============8878444214555570206==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/sysvinit: SRC_URI changed from "https://download.savannah.gnu.org/releases/sysvinit/sysvinit-3.01.tar.xz file://install.patch file://crypt-lib.patch file://pidof-add-m-option.patch file://realpath.patch file://0001-include-sys-sysmacros.h-for-major-minor-defines-in-g.patch file://rcS-default file://rc file://rcS file://bootlogd.init file://01_bootlogd" to "https://download.savannah.gnu.org/releases/sysvinit/sysvinit-3.03.tar.xz file://install.patch file://crypt-lib.patch file://pidof-add-m-option.patch file://realpath.patch file://0001-include-sys-sysmacros.h-for-major-minor-defines-in-g.patch file://rcS-default file://rc file://rcS file://bootlogd.init file://01_bootlogd"
packages/core2-32-poky-linux/sysvinit: PKGV changed from 3.01 [default] to 3.03 [default]
packages/core2-32-poky-linux/sysvinit: PV changed from "3.01" to "3.03"
packages/core2-32-poky-linux/sysvinit/sysvinit-dbg: PKGSIZE changed from 487324 to 492116 (+1%)
packages/core2-32-poky-linux/sysvinit/sysvinit-dbg: PKGV changed from 3.01 [default] to 3.03 [default]
packages/core2-32-poky-linux/sysvinit/sysvinit-dbg: PV changed from "3.01" to "3.03"
packages/core2-32-poky-linux/sysvinit/sysvinit-dev: PKGV changed from 3.01 [default] to 3.03 [default]
packages/core2-32-poky-linux/sysvinit/sysvinit-dev: PV changed from "3.01" to "3.03"
packages/core2-32-poky-linux/sysvinit/sysvinit-doc: PKGSIZE changed from 76140 to 78061 (+3%)
packages/core2-32-poky-linux/sysvinit/sysvinit-doc: PKGV changed from 3.01 [default] to 3.03 [default]
packages/core2-32-poky-linux/sysvinit/sysvinit-doc: PV changed from "3.01" to "3.03"
packages/core2-32-poky-linux/sysvinit/sysvinit-locale: PKGV changed from 3.01 [default] to 3.03 [default]
packages/core2-32-poky-linux/sysvinit/sysvinit-locale: PV changed from "3.01" to "3.03"
packages/core2-32-poky-linux/sysvinit/sysvinit-pidof: PKGV changed from 3.01 [default] to 3.03 [default]
packages/core2-32-poky-linux/sysvinit/sysvinit-pidof: PV changed from "3.01" to "3.03"
packages/core2-32-poky-linux/sysvinit/sysvinit-src: PKGSIZE changed from 267051 to 267960 (+0%)
packages/core2-32-poky-linux/sysvinit/sysvinit-src: PKGV changed from 3.01 [default] to 3.03 [default]
packages/core2-32-poky-linux/sysvinit/sysvinit-src: PV changed from "3.01" to "3.03"
packages/core2-32-poky-linux/sysvinit/sysvinit-staticdev: PKGV changed from 3.01 [default] to 3.03 [default]
packages/core2-32-poky-linux/sysvinit/sysvinit-staticdev: PV changed from "3.01" to "3.03"
packages/core2-32-poky-linux/sysvinit/sysvinit-sulogin: PKGV changed from 3.01 [default] to 3.03 [default]
packages/core2-32-poky-linux/sysvinit/sysvinit-sulogin: PV changed from "3.01" to "3.03"
packages/core2-32-poky-linux/sysvinit/sysvinit: PKGV changed from 3.01 [default] to 3.03 [default]
packages/core2-32-poky-linux/sysvinit/sysvinit: PV changed from "3.01" to "3.03"

--===============8878444214555570206==--

