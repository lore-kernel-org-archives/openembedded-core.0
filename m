Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94F19C3527E
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:25:53 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com
 (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.11825.1650052686786288844
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Apr 2022 12:58:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=bhuU/noI;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30,
 mailfrom: 010101802ecde12f-4f9e79c7-df43-409a-af74-1479d6ef054c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1650052686;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=v0XHGEskFblouYcQQuuJTYle37CCLfhuytPWHEgOLaI=;
	b=bhuU/noIsMZbAjnwJKsko3OGx3MLHY8c/GkZxnJd5p2H7VS0GcD3gUJkPUUaL2D1
	FlYyLlPiAQe0qZa7qh/7D+x9AejNSMNKfzjAVI4wa0NpIsHooOYCFVkFKym1v3yIvOf
	nIs/weIzYsoRkNg+gDCK7errnu3PmaZeynAO0yN0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1650052686;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=v0XHGEskFblouYcQQuuJTYle37CCLfhuytPWHEgOLaI=;
	b=LtY+zyfnLVYFTpf1Nl4td3q6kpJEZBEeruc9jL2PuC+9A54Hb+sDznezyu87CuQd
	9scRhDla+6t6CzQleBDtNEPt3wajjjQmgMu/VyjrAFIhKJV1rV0r/mdM/HdCN3atmbC
	jihLFg98DYyeX4J5zBB5ifvg/ZhFwu6m+XWJ9vmc=
Content-Type: multipart/mixed; boundary="===============5698068664099793186=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] git: upgrading to 2.35.3 SUCCEEDED
Message-ID: 
 <010101802ecde12f-4f9e79c7-df43-409a-af74-1479d6ef054c-000000@us-west-2.amazonses.com>
Date: Fri, 15 Apr 2022 19:58:06 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.04.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:25:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164439

--===============5698068664099793186==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *git* to *2.35.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-git-upgrade-2.35.1-2.35.3.patch
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
--===============5698068664099793186==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-git-upgrade-2.35.1-2.35.3.patch"

From fda046dfda3b5c8727b5b992f46b88f9fc27cbac Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Apr 2022 07:56:41 +0000
Subject: [PATCH] git: upgrade 2.35.1 -> 2.35.3

---
 meta/recipes-devtools/git/{git_2.35.1.bb => git_2.35.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/git/{git_2.35.1.bb => git_2.35.3.bb} (98%)

diff --git a/meta/recipes-devtools/git/git_2.35.1.bb b/meta/recipes-devtools/git/git_2.35.3.bb
similarity index 98%
rename from meta/recipes-devtools/git/git_2.35.1.bb
rename to meta/recipes-devtools/git/git_2.35.3.bb
index e39142128b..d152297f7a 100644
--- a/meta/recipes-devtools/git/git_2.35.1.bb
+++ b/meta/recipes-devtools/git/git_2.35.3.bb
@@ -156,4 +156,4 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
-SRC_URI[tarball.sha256sum] = "9845a37dd01f9faaa7d8aa2078399d3aea91b43819a5efea6e2877b0af09bd43"
+SRC_URI[tarball.sha256sum] = "cad708072d5c0b390c71651f5edb44143f00b357766973470bf9adebc0944c03"
-- 
2.27.0


--===============5698068664099793186==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/git/git-bash-completion: PV changed from "2.35.1" to "2.35.3"
packages/core2-32-poky-linux/git/git-bash-completion: PKGV changed from 2.35.1 [default] to 2.35.3 [default]
packages/core2-32-poky-linux/git/git-dbg: PV changed from "2.35.1" to "2.35.3"
packages/core2-32-poky-linux/git/git-dbg: PKGV changed from 2.35.1 [default] to 2.35.3 [default]
packages/core2-32-poky-linux/git/git-dbg: PKGSIZE changed from 66183704 to 66205680 (+0%)
packages/core2-32-poky-linux/git/git-dev: PV changed from "2.35.1" to "2.35.3"
packages/core2-32-poky-linux/git/git-dev: PKGV changed from 2.35.1 [default] to 2.35.3 [default]
packages/core2-32-poky-linux/git/git-doc: PV changed from "2.35.1" to "2.35.3"
packages/core2-32-poky-linux/git/git-doc: PKGV changed from 2.35.1 [default] to 2.35.3 [default]
packages/core2-32-poky-linux/git/git-locale: PV changed from "2.35.1" to "2.35.3"
packages/core2-32-poky-linux/git/git-locale: PKGV changed from 2.35.1 [default] to 2.35.3 [default]
packages/core2-32-poky-linux/git/git-perltools: PV changed from "2.35.1" to "2.35.3"
packages/core2-32-poky-linux/git/git-perltools: PKGV changed from 2.35.1 [default] to 2.35.3 [default]
packages/core2-32-poky-linux/git/git-src: PV changed from "2.35.1" to "2.35.3"
packages/core2-32-poky-linux/git/git-src: PKGV changed from 2.35.1 [default] to 2.35.3 [default]
packages/core2-32-poky-linux/git/git-src: PKGSIZE changed from 8469255 to 8471082 (+0%)
packages/core2-32-poky-linux/git/git-staticdev: PV changed from "2.35.1" to "2.35.3"
packages/core2-32-poky-linux/git/git-staticdev: PKGV changed from 2.35.1 [default] to 2.35.3 [default]
packages/core2-32-poky-linux/git/git-tk: PV changed from "2.35.1" to "2.35.3"
packages/core2-32-poky-linux/git/git-tk: PKGV changed from 2.35.1 [default] to 2.35.3 [default]
packages/core2-32-poky-linux/git/git: PV changed from "2.35.1" to "2.35.3"
packages/core2-32-poky-linux/git/git: PKGV changed from 2.35.1 [default] to 2.35.3 [default]
packages/core2-32-poky-linux/git/gitweb: PV changed from "2.35.1" to "2.35.3"
packages/core2-32-poky-linux/git/gitweb: PKGV changed from 2.35.1 [default] to 2.35.3 [default]
packages/core2-32-poky-linux/git: PV changed from "2.35.1" to "2.35.3"
packages/core2-32-poky-linux/git: SRC_URI changed from "https://cdn.kernel.org/pub/software/scm/git/git-2.35.1.tar.gz;name=tarball file://fixsort.patch file://0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch" to "https://cdn.kernel.org/pub/software/scm/git/git-2.35.3.tar.gz;name=tarball file://fixsort.patch file://0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch"
packages/core2-32-poky-linux/git: PKGV changed from 2.35.1 [default] to 2.35.3 [default]

--===============5698068664099793186==--

