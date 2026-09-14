Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77E2EC88E6D
	for <webhook@archiver.kernel.org>; Mon, 14 Sep 2026 05:40:46 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13726.1789364445399715302
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Sep 2026 22:40:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=V7AW+MRz;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=gXa+/P4t;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101a09e6e9e18-f7852bcb-4eb4-475c-8d5e-b0e2cc38571e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1789364444;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=l6Jb+yx4ztT1ZIXaelG5VKZPPUsFI2aFyI83nsMnzRU=;
	b=V7AW+MRz2qSNY7FZf/cTtfMaOdockzjA43RFmvvIUiinVUGtPX690DtdUP2eUFdH
	s4SzhWUKUqDkI3u0vt7r3ZIkVPdL2JE/TxsrjQLLnNI3mHHsVhNpUQfiLOXe/joQvPv
	t+Agoake9xHX56vkEYP/YqcKd+61lN+zE1YsXX0s=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1789364444;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=l6Jb+yx4ztT1ZIXaelG5VKZPPUsFI2aFyI83nsMnzRU=;
	b=gXa+/P4tmLLLFXu6Dt8dReWjlFLAQBk0D1vnBbbL8cB8G0VHSc7strEV/ytyRhOa
	iF2BWqbiBnzT/hT3nON4sZ2ZaIDL4BbMHroEssH/jFfl+bNr7kXTOV2qawVBKGx1UGB
	8U/tTVAHke1LsiZiH4TAkJ4lPE0JkClMY1f8wor4=
Content-Type: multipart/mixed; boundary="===============5759508149280262953=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] gcr: upgrading to 4.4.1 SUCCEEDED
Message-ID: <010101a09e6e9e18-f7852bcb-4eb4-475c-8d5e-b0e2cc38571e-000000@us-west-2.amazonses.com>
Date: Mon, 14 Sep 2026 05:40:44 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.14-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2026 05:40:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245756

--===============5759508149280262953==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gcr* to *4.4.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gcr-upgrade-4.4.0.1-4.4.1.patch
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
From cfb05a303468def05f2f04ceded22afc083fa063 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 14 Sep 2026 05:35:50 +0000
Subject: [PATCH] gcr: upgrade 4.4.0.1 -> 4.4.1

Source: NEWS

gcr 4.4.1:
- gcr: Support zero mtime
- gcr: Fix memory leak in GcrSystemPrompt call closure
- docs: Fix a method reference in gcr_prompt_set_choice_label()
- Updated translations
---
 meta/recipes-gnome/gcr/{gcr_4.4.0.1.bb => gcr_4.4.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gcr/{gcr_4.4.0.1.bb => gcr_4.4.1.bb} (95%)

diff --git a/meta/recipes-gnome/gcr/gcr_4.4.0.1.bb b/meta/recipes-gnome/gcr/gcr_4.4.1.bb
similarity index 95%
rename from meta/recipes-gnome/gcr/gcr_4.4.0.1.bb
rename to meta/recipes-gnome/gcr/gcr_4.4.1.bb
index 493c8c2a0d..93028d2497 100644
--- a/meta/recipes-gnome/gcr/gcr_4.4.0.1.bb
+++ b/meta/recipes-gnome/gcr/gcr_4.4.1.bb
@@ -16,7 +16,7 @@ GTKDOC_MESON_OPTION = "gtk_doc"
 inherit gnomebase gi-docgen vala gobject-introspection lib_package
 UPSTREAM_CHECK_REGEX = "gcr-(?P<pver>\d+\.\d+\.(?!9\d+)\d+(\.\d+)?)"
 
-SRC_URI[archive.sha256sum] = "0c3c341e49f9f4f2532a4884509804190a0c2663e6120360bb298c5d174a8098"
+SRC_URI[archive.sha256sum] = "c4442c15d4330f17a1f5194df08c576877af68412ab2521446a93bd5e24c931b"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('GI_DATA_ENABLED', 'True', 'vapi', '', d)}"
 PACKAGECONFIG[ssh_agent] = "-Dssh_agent=true,-Dssh_agent=false,libsecret"
-- 
2.47.1


--===============5759508149280262953==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/gcr/gcr-locale-eo: PKGSIZE changed from 10904 to 12170 (+12%)
packages/x86-64-v3-poky-linux/gcr/gcr-locale-it: PKGSIZE changed from 11597 to 12790 (+10%)
packages/x86-64-v3-poky-linux/gcr/gcr-locale-ja: PKGSIZE changed from 18070 to 12857 (-29%)
packages/x86-64-v3-poky-linux/gcr/gcr-locale-kk: PKGSIZE changed from 8781 to 15481 (+76%)
packages/x86-64-v3-poky-linux/gcr/gcr-locale-nb: PKGSIZE changed from 16831 to 12334 (-27%)
packages/x86-64-v3-poky-linux/gcr/gcr-locale-oc: PKGSIZE changed from 9706 to 12744 (+31%)
packages/x86-64-v3-poky-linux/gcr/gcr-locale-th: PKGSIZE changed from 22876 to 17485 (-24%)
packages/x86-64-v3-poky-linux/gcr/gcr-locale-ug: PKGSIZE changed from 19497 to 15652 (-20%)
packages/x86-64-v3-poky-linux/gcr/gcr: FILELIST: removed "/usr/lib/libgcr-4.so.4.4.0 /usr/lib/libgck-2.so.2.4.0", added "/usr/lib/libgcr-4.so.4.4.1 /usr/lib/libgck-2.so.2.4.1"
packages/x86-64-v3-poky-linux/gcr: PACKAGES: added "gcr-locale-lo gcr-locale-uz"
Changes to packages/x86-64-v3-poky-linux/gcr (sysroot):
  /usr/lib/libgck-2.so.2 changed symlink target from libgck-2.so.2.4.0 to libgck-2.so.2.4.1
  /usr/lib/libgcr-4.so.4 changed symlink target from libgcr-4.so.4.4.0 to libgcr-4.so.4.4.1
  /usr/lib/libgck-2.so.2.4.0 moved to /usr/lib/libgck-2.so.2.4.1
  /usr/lib/libgcr-4.so.4.4.0 moved to /usr/lib/libgcr-4.so.4.4.1

--===============5759508149280262953==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="gcr-changelog.txt"

Changelog for gcr: 4.4.0.1 -> 4.4.1
Source: NEWS

gcr 4.4.1:
- gcr: Support zero mtime
- gcr: Fix memory leak in GcrSystemPrompt call closure
- docs: Fix a method reference in gcr_prompt_set_choice_label()
- Updated translations

--===============5759508149280262953==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/gcr/gcr-bin: PKGV changed from 4.4.0.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/gcr/gcr-bin: PV changed from "4.4.0.1" to "4.4.1"
packages/x86-64-v3-poky-linux/gcr/gcr-dbg: PKGSIZE changed from 3009912 to 3009648 (-0%)
packages/x86-64-v3-poky-linux/gcr/gcr-dbg: PKGV changed from 4.4.0.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/gcr/gcr-dbg: FILELIST: removed "/usr/lib/.debug/libgck-2.so.2.4.0 /usr/lib/.debug/libgcr-4.so.4.4.0", added "/usr/lib/.debug/libgck-2.so.2.4.1 /usr/lib/.debug/libgcr-4.so.4.4.1"
packages/x86-64-v3-poky-linux/gcr/gcr-dbg: PV changed from "4.4.0.1" to "4.4.1"
packages/x86-64-v3-poky-linux/gcr/gcr-dev: PKGSIZE changed from 1256253 to 1256250 (-0%)
packages/x86-64-v3-poky-linux/gcr/gcr-dev: PKGV changed from 4.4.0.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/gcr/gcr-dev: PV changed from "4.4.0.1" to "4.4.1"
packages/x86-64-v3-poky-linux/gcr/gcr-doc: PKGV changed from 4.4.0.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/gcr/gcr-doc: PV changed from "4.4.0.1" to "4.4.1"
packages/x86-64-v3-poky-linux/gcr/gcr-locale-ab: PKGV changed from 4.4.0.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/gcr/gcr-locale-ab: PV changed from "4.4.0.1" to "4.4.1"
packages/x86-64-v3-poky-linux/gcr/gcr-locale-af: PKGV changed from 4.4.0.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/gcr/gcr-locale-af: PV changed from "4.4.0.1" to "4.4.1"
packages/x86-64-v3-poky-linux/gcr/gcr-locale-ar: PKGV changed from 4.4.0.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/gcr/gcr-locale-ar: PV changed from "4.4.0.1" to "4.4.1"
packages/x86-64-v3-poky-linux/gcr/gcr-locale-as: PKGV changed from 4.4.0.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/gcr/gcr-locale-as: PV changed from "4.4.0.1" to "4.4.1"
packages/x86-64-v3-poky-linux/gcr/gcr-locale-ast: PKGV changed from 4.4.0.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/gcr/gcr-locale-ast: PV changed from "4.4.0.1" to "4.4.1"
packages/x86-64-v3-poky-linux/gcr/gcr-locale-az: PKGV changed from 4.4.0.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/gcr/gcr-locale-az: PV changed from "4.4.0.1" to "4.4.1"
packages/x86-64-v3-poky-linux/gcr/gcr-locale-be+latin: PKGV changed from 4.4.0.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/gcr/gcr-locale-be+latin: PV changed from "4.4.0.1" to "4.4.1"
packages/x86-64-v3-poky-linux/gcr/gcr-locale-be: PKGSIZE changed from 14449 to 15595 (+8%)
packages/x86-64-v3-poky-linux/gcr/gcr-locale-be: PKGV changed from 4.4.0.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/gcr/gcr-locale-be: PV changed from "4.4.0.1" to "4.4.1"
packages/x86-64-v3-poky-linux/gcr/gcr-locale-bg: PKGV changed from 4.4.0.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/gcr/gcr-locale-bg: PV changed from "4.4.0.1" to "4.4.1"
packages/x86-64-v3-poky-linux/gcr/gcr-locale-bn-in: PKGV changed from 4.4.0.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/gcr/gcr-locale-bn-in: PV changed from "4.4.0.1" to "4.4.1"
packages/x86-64-v3-poky-linux/gcr/gcr-locale-bn: PKGV changed from 4.4.0.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/gcr/gcr-locale-bn: PV changed from "4.4.0.1" to "4.4.1"
packages/x86-64-v3-poky-linux/gcr/gcr-locale-bs: PKGV changed from 4.4.0.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/gcr/gcr-locale-bs: PV changed from "4.4.0.1" to "4.4.1"
packages/x86-64-v3-poky-linux/gcr/gcr-locale-ca+valencia: PKGV changed from 4.4.0.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/gcr/gcr-locale-ca+valencia: PV changed from "4.4.0.1" to "4.4.1"
packages/x86-64-v3-poky-linux/gcr/gcr-locale-ca: PKGV changed from 4.4.0.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/gcr/gcr-locale-ca: PV changed from "4.4.0.1" to "4.4.1"
packages/x86-64-v3-poky-linux/gcr/gcr-locale-ckb: PKGV changed from 4.4.0.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/gcr/gcr-locale-ckb: PV changed from "4.4.0.1" to "4.4.1"
packages/x86-64-v3-poky-linux/gcr/gcr-locale-cs: PKGV changed from 4.4.0.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/gcr/gcr-locale-cs: PV changed from "4.4.0.1" to "4.4.1"
packages/x86-64-v3-poky-linux/gcr/gcr-locale-cy: PKGV changed from 4.4.0.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/gcr/gcr-locale-cy: PV changed from "4.4.0.1" to "4.4.1"
packages/x86-64-v3-poky-linux/gcr/gcr-locale-da: PKGV changed from 4.4.0.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/gcr/gcr-locale-da: PV changed from "4.4.0.1" to "4.4.1"
packages/x86-64-v3-poky-linux/gcr/gcr-locale-de: PKGSIZE changed from 11902 to 12789 (+7%)
packages/x86-64-v3-poky-linux/gcr/gcr-locale-de: PKGV changed from 4.4.0.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/gcr/gcr-locale-de: PV changed from "4.4.0.1" to "4.4.1"
packages/x86-64-v3-poky-linux/gcr/gcr-locale-dz: PKGV changed from 4.4.0.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/gcr/gcr-locale-dz: PV changed from "4.4.0.1" to "4.4.1"
packages/x86-64-v3-poky-linux/gcr/gcr-locale-el: PKGSIZE changed from 14731 to 15769 (+7%)
packages/x86-64-v3-poky-linux/gcr/gcr-locale-el: PKGV changed from 4.4.0.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/gcr/gcr-locale-el: PV changed from "4.4.0.1" to "4.4.1"
packages/x86-64-v3-poky-linux/gcr/gcr-locale-en+shaw: PKGV changed from 4.4.0.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/gcr/gcr-locale-en+shaw: PV changed from "4.4.0.1" to "4.4.1"
packages/x86-64-v3-poky-linux/gcr/gcr-locale-en-ca: PKGV changed from 4.4.0.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/gcr/gcr-locale-en-ca: PV changed from "4.4.0.1" to "4.4.1"
packages/x86-64-v3-poky-linux/gcr/gcr-locale-en-gb: PKGV changed from 4.4.0.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/gcr/gcr-locale-en-gb: PV changed from "4.4.0.1" to "4.4.1"
packages/x86-64-v3-poky-linux/gcr/gcr-locale-eo: PKGSIZE changed from 10904 to 12170 (+12%)
packages/x86-64-v3-poky-linux/gcr/gcr-locale-eo: PKGV changed from 4.4.0.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/gcr/gcr-locale-eo: PV changed from "4.4.0.1" to "4.4.1"
packages/x86-64-v3-poky-linux/gcr/gcr-locale-es: PKGV changed from 4.4.0.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/gcr/gcr-locale-es: PV changed from "4.4.0.1" to "4.4.1"
packages/x86-64-v3-poky-linux/gcr/gcr-locale-et: PKGV changed from 4.4.0.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/gcr/gcr-locale-et: PV changed from "4.4.0.1" to "4.4.1"
packages/x86-64-v3-poky-linux/gcr/gcr-locale-eu: PKGV changed from 4.4.0.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/gcr/gcr-locale-eu: PV changed from "4.4.0.1" to "4.4.1"
packages/x86-64-v3-poky-linux/gcr/gcr-locale-fa: PKGV changed from 4.4.0.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/gcr/gcr-locale-fa: PV changed from "4.4.0.1" to "4.4.1"
packages/x86-64-v3-poky-linux/gcr/gcr-locale-fi: PKGV changed from 4.4.0.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/gcr/gcr-locale-fi: PV changed from "4.4.0.1" to "4.4.1"
packages/x86-64-v3-poky-linux/gcr/gcr-locale-fr: PKGV changed from 4.4.0.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/gcr/gcr-locale-fr: PV changed from "4.4.0.1" to "4.4.1"
packages/x86-64-v3-poky-linux/gcr/gcr-locale-fur: PKGSIZE changed from 11589 to 12501 (+8%)
packages/x86-64-v3-poky-linux/gcr/gcr-locale-fur: PKGV changed from 4.4.0.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/gcr/gcr-locale-fur: PV changed from "4.4.0.1" to "4.4.1"
packages/x86-64-v3-poky-linux/gcr/gcr-locale-ga: PKGV changed from 4.4.0.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/gcr/gcr-locale-ga: PV changed from "4.4.0.1" to "4.4.1"
packages/x86-64-v3-poky-linux/gcr/gcr-locale-gl: PKGV changed from 4.4.0.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/gcr/gcr-locale-gl: PV changed from "4.4.0.1" to "4.4.1"
packages/x86-64-v3-poky-linux/gcr/gcr-locale-gu: PKGV changed from 4.4.0.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/gcr/gcr-locale-gu: PV changed from "4.4.0.1" to "4.4.1"
packages/x86-64-v3-poky-linux/gcr/gcr-locale-he: PKGV changed from 4.4.0.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/gcr/gcr-locale-he: PV changed from "4.4.0.1" to "4.4.1"
packages/x86-64-v3-poky-linux/gcr/gcr-locale-hi: PKGV changed from 4.4.0.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/gcr/gcr-locale-hi: PV changed from "4.4.0.1" to "4.4.1"
packages/x86-64-v3-poky-linux/gcr/gcr-locale-hr: PKGV changed from 4.4.0.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/gcr/gcr-locale-hr: PV changed from "4.4.0.1" to "4.4.1"
packages/x86-64-v3-poky-linux/gcr/gcr-locale-hu: PKGV changed from 4.4.0.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/gcr/gcr-locale-hu: PV changed from "4.4.0.1" to "4.4.1"
packages/x86-64-v3-poky-linux/gcr/gcr-locale-id: PKGV changed from 4.4.0.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/gcr/gcr-locale-id: PV changed from "4.4.0.1" to "4.4.1"
packages/x86-64-v3-poky-linux/gcr/gcr-locale-ie: PKGV changed from 4.4.0.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/gcr/gcr-locale-ie: PV changed from "4.4.0.1" to "4.4.1"
packages/x86-64-v3-poky-linux/gcr/gcr-locale-is: PKGV changed from 4.4.0.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/gcr/gcr-locale-is: PV changed from "4.4.0.1" to "4.4.1"
packages/x86-64-v3-poky-linux/gcr/gcr-locale-it: PKGSIZE changed from 11597 to 12790 (+10%)
packages/x86-64-v3-poky-linux/gcr/gcr-locale-it: PKGV changed from 4.4.0.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/gcr/gcr-locale-it: PV changed from "4.4.0.1" to "4.4.1"
packages/x86-64-v3-poky-linux/gcr/gcr-locale-ja: PKGSIZE changed from 18070 to 12857 (-29%)
packages/x86-64-v3-poky-linux/gcr/gcr-locale-ja: PKGV changed from 4.4.0.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/gcr/gcr-locale-ja: PV changed from "4.4.0.1" to "4.4.1"
packages/x86-64-v3-poky-linux/gcr/gcr-locale-ka: PKGV changed from 4.4.0.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/gcr/gcr-locale-ka: PV changed from "4.4.0.1" to "4.4.1"
packages/x86-64-v3-poky-linux/gcr/gcr-locale-kab: PKGV changed from 4.4.0.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/gcr/gcr-locale-kab: PV changed from "4.4.0.1" to "4.4.1"
packages/x86-64-v3-poky-linux/gcr/gcr-locale-kk: PKGSIZE changed from 8781 to 15481 (+76%)
packages/x86-64-v3-poky-linux/gcr/gcr-locale-kk: PKGV changed from 4.4.0.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/gcr/gcr-locale-kk: PV changed from "4.4.0.1" to "4.4.1"
packages/x86-64-v3-poky-linux/gcr/gcr-locale-kn: PKGV changed from 4.4.0.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/gcr/gcr-locale-kn: PV changed from "4.4.0.1" to "4.4.1"
packages/x86-64-v3-poky-linux/gcr/gcr-locale-ko: PKGV changed from 4.4.0.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/gcr/gcr-locale-ko: PV changed from "4.4.0.1" to "4.4.1"
packages/x86-64-v3-poky-linux/gcr/gcr-locale-lt: PKGV changed from 4.4.0.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/gcr/gcr-locale-lt: PV changed from "4.4.0.1" to "4.4.1"
packages/x86-64-v3-poky-linux/gcr/gcr-locale-lv: PKGV changed from 4.4.0.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/gcr/gcr-locale-lv: PV changed from "4.4.0.1" to "4.4.1"
packages/x86-64-v3-poky-linux/gcr/gcr-locale-mai: PKGV changed from 4.4.0.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/gcr/gcr-locale-mai: PV changed from "4.4.0.1" to "4.4.1"
packages/x86-64-v3-poky-linux/gcr/gcr-locale-mg: PKGV changed from 4.4.0.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/gcr/gcr-locale-mg: PV changed from "4.4.0.1" to "4.4.1"
packages/x86-64-v3-poky-linux/gcr/gcr-locale-mk: PKGV changed from 4.4.0.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/gcr/gcr-locale-mk: PV changed from "4.4.0.1" to "4.4.1"
packages/x86-64-v3-poky-linux/gcr/gcr-locale-ml: PKGV changed from 4.4.0.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/gcr/gcr-locale-ml: PV changed from "4.4.0.1" to "4.4.1"
packages/x86-64-v3-poky-linux/gcr/gcr-locale-mn: PKGV changed from 4.4.0.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/gcr/gcr-locale-mn: PV changed from "4.4.0.1" to "4.4.1"
packages/x86-64-v3-poky-linux/gcr/gcr-locale-mr: PKGV changed from 4.4.0.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/gcr/gcr-locale-mr: PV changed from "4.4.0.1" to "4.4.1"
packages/x86-64-v3-poky-linux/gcr/gcr-locale-ms: PKGV changed from 4.4.0.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/gcr/gcr-locale-ms: PV changed from "4.4.0.1" to "4.4.1"
packages/x86-64-v3-poky-linux/gcr/gcr-locale-nb: PKGSIZE changed from 16831 to 12334 (-27%)
packages/x86-64-v3-poky-linux/gcr/gcr-locale-nb: PKGV changed from 4.4.0.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/gcr/gcr-locale-nb: PV changed from "4.4.0.1" to "4.4.1"
packages/x86-64-v3-poky-linux/gcr/gcr-locale-ne: PKGV changed from 4.4.0.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/gcr/gcr-locale-ne: PV changed from "4.4.0.1" to "4.4.1"
packages/x86-64-v3-poky-linux/gcr/gcr-locale-nl: PKGSIZE changed from 11645 to 12486 (+7%)
packages/x86-64-v3-poky-linux/gcr/gcr-locale-nl: PKGV changed from 4.4.0.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/gcr/gcr-locale-nl: PV changed from "4.4.0.1" to "4.4.1"
packages/x86-64-v3-poky-linux/gcr/gcr-locale-nn: PKGV changed from 4.4.0.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/gcr/gcr-locale-nn: PV changed from "4.4.0.1" to "4.4.1"
packages/x86-64-v3-poky-linux/gcr/gcr-locale-oc: PKGSIZE changed from 9706 to 12744 (+31%)
packages/x86-64-v3-poky-linux/gcr/gcr-locale-oc: PKGV changed from 4.4.0.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/gcr/gcr-locale-oc: PV changed from "4.4.0.1" to "4.4.1"
packages/x86-64-v3-poky-linux/gcr/gcr-locale-or: PKGV changed from 4.4.0.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/gcr/gcr-locale-or: PV changed from "4.4.0.1" to "4.4.1"
packages/x86-64-v3-poky-linux/gcr/gcr-locale-pa: PKGV changed from 4.4.0.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/gcr/gcr-locale-pa: PV changed from "4.4.0.1" to "4.4.1"
packages/x86-64-v3-poky-linux/gcr/gcr-locale-pl: PKGV changed from 4.4.0.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/gcr/gcr-locale-pl: PV changed from "4.4.0.1" to "4.4.1"
packages/x86-64-v3-poky-linux/gcr/gcr-locale-pt-br: PKGV changed from 4.4.0.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/gcr/gcr-locale-pt-br: PV changed from "4.4.0.1" to "4.4.1"
packages/x86-64-v3-poky-linux/gcr/gcr-locale-pt: PKGV changed from 4.4.0.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/gcr/gcr-locale-pt: PV changed from "4.4.0.1" to "4.4.1"
packages/x86-64-v3-poky-linux/gcr/gcr-locale-ro: PKGSIZE changed from 11720 to 12536 (+7%)
packages/x86-64-v3-poky-linux/gcr/gcr-locale-ro: PKGV changed from 4.4.0.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/gcr/gcr-locale-ro: PV changed from "4.4.0.1" to "4.4.1"
packages/x86-64-v3-poky-linux/gcr/gcr-locale-ru: PKGV changed from 4.4.0.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/gcr/gcr-locale-ru: PV changed from "4.4.0.1" to "4.4.1"
packages/x86-64-v3-poky-linux/gcr/gcr-locale-rw: PKGV changed from 4.4.0.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/gcr/gcr-locale-rw: PV changed from "4.4.0.1" to "4.4.1"
packages/x86-64-v3-poky-linux/gcr/gcr-locale-si: PKGV changed from 4.4.0.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/gcr/gcr-locale-si: PV changed from "4.4.0.1" to "4.4.1"
packages/x86-64-v3-poky-linux/gcr/gcr-locale-sk: PKGSIZE changed from 11805 to 12676 (+7%)
packages/x86-64-v3-poky-linux/gcr/gcr-locale-sk: PKGV changed from 4.4.0.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/gcr/gcr-locale-sk: PV changed from "4.4.0.1" to "4.4.1"
packages/x86-64-v3-poky-linux/gcr/gcr-locale-sl: PKGV changed from 4.4.0.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/gcr/gcr-locale-sl: PV changed from "4.4.0.1" to "4.4.1"
packages/x86-64-v3-poky-linux/gcr/gcr-locale-sq: PKGV changed from 4.4.0.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/gcr/gcr-locale-sq: PV changed from "4.4.0.1" to "4.4.1"
packages/x86-64-v3-poky-linux/gcr/gcr-locale-sr+latin: PKGSIZE changed from 11493 to 12352 (+7%)
packages/x86-64-v3-poky-linux/gcr/gcr-locale-sr+latin: PKGV changed from 4.4.0.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/gcr/gcr-locale-sr+latin: PV changed from "4.4.0.1" to "4.4.1"
packages/x86-64-v3-poky-linux/gcr/gcr-locale-sr: PKGSIZE changed from 14045 to 15127 (+8%)
packages/x86-64-v3-poky-linux/gcr/gcr-locale-sr: PKGV changed from 4.4.0.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/gcr/gcr-locale-sr: PV changed from "4.4.0.1" to "4.4.1"
packages/x86-64-v3-poky-linux/gcr/gcr-locale-sv: PKGV changed from 4.4.0.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/gcr/gcr-locale-sv: PV changed from "4.4.0.1" to "4.4.1"
packages/x86-64-v3-poky-linux/gcr/gcr-locale-ta: PKGV changed from 4.4.0.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/gcr/gcr-locale-ta: PV changed from "4.4.0.1" to "4.4.1"
packages/x86-64-v3-poky-linux/gcr/gcr-locale-te: PKGV changed from 4.4.0.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/gcr/gcr-locale-te: PV changed from "4.4.0.1" to "4.4.1"
packages/x86-64-v3-poky-linux/gcr/gcr-locale-tg: PKGV changed from 4.4.0.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/gcr/gcr-locale-tg: PV changed from "4.4.0.1" to "4.4.1"
packages/x86-64-v3-poky-linux/gcr/gcr-locale-th: PKGSIZE changed from 22876 to 17485 (-24%)
packages/x86-64-v3-poky-linux/gcr/gcr-locale-th: PKGV changed from 4.4.0.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/gcr/gcr-locale-th: PV changed from "4.4.0.1" to "4.4.1"
packages/x86-64-v3-poky-linux/gcr/gcr-locale-tr: PKGV changed from 4.4.0.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/gcr/gcr-locale-tr: PV changed from "4.4.0.1" to "4.4.1"
packages/x86-64-v3-poky-linux/gcr/gcr-locale-ug: PKGSIZE changed from 19497 to 15652 (-20%)
packages/x86-64-v3-poky-linux/gcr/gcr-locale-ug: PKGV changed from 4.4.0.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/gcr/gcr-locale-ug: PV changed from "4.4.0.1" to "4.4.1"
packages/x86-64-v3-poky-linux/gcr/gcr-locale-uk: PKGV changed from 4.4.0.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/gcr/gcr-locale-uk: PV changed from "4.4.0.1" to "4.4.1"
packages/x86-64-v3-poky-linux/gcr/gcr-locale-vi: PKGV changed from 4.4.0.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/gcr/gcr-locale-vi: PV changed from "4.4.0.1" to "4.4.1"
packages/x86-64-v3-poky-linux/gcr/gcr-locale-xh: PKGV changed from 4.4.0.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/gcr/gcr-locale-xh: PV changed from "4.4.0.1" to "4.4.1"
packages/x86-64-v3-poky-linux/gcr/gcr-locale-zh-cn: PKGV changed from 4.4.0.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/gcr/gcr-locale-zh-cn: PV changed from "4.4.0.1" to "4.4.1"
packages/x86-64-v3-poky-linux/gcr/gcr-locale-zh-hk: PKGV changed from 4.4.0.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/gcr/gcr-locale-zh-hk: PV changed from "4.4.0.1" to "4.4.1"
packages/x86-64-v3-poky-linux/gcr/gcr-locale-zh-tw: PKGV changed from 4.4.0.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/gcr/gcr-locale-zh-tw: PV changed from "4.4.0.1" to "4.4.1"
packages/x86-64-v3-poky-linux/gcr/gcr-src: PKGSIZE changed from 1936947 to 1936974 (+0%)
packages/x86-64-v3-poky-linux/gcr/gcr-src: PKGV changed from 4.4.0.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/gcr/gcr-src: FILELIST: directory renamed /usr/src/debug/gcr/4.4.0.1/egg -> /usr/src/debug/gcr/4.4.1/egg, directory renamed /usr/src/debug/gcr/4.4.0.1/gcr -> /usr/src/debug/gcr/4.4.1/gcr, directory renamed /usr/src/debug/gcr/4.4.0.1/gck -> /usr/src/debug/gcr/4.4.1/gck
packages/x86-64-v3-poky-linux/gcr/gcr-src: PV changed from "4.4.0.1" to "4.4.1"
packages/x86-64-v3-poky-linux/gcr/gcr-ssh-agent: PKGV changed from 4.4.0.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/gcr/gcr-ssh-agent: PV changed from "4.4.0.1" to "4.4.1"
packages/x86-64-v3-poky-linux/gcr/gcr-staticdev: PKGV changed from 4.4.0.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/gcr/gcr-staticdev: PV changed from "4.4.0.1" to "4.4.1"
packages/x86-64-v3-poky-linux/gcr/gcr: PKGV changed from 4.4.0.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/gcr/gcr: FILELIST: removed "/usr/lib/libgck-2.so.2.4.0 /usr/lib/libgcr-4.so.4.4.0", added "/usr/lib/libgck-2.so.2.4.1 /usr/lib/libgcr-4.so.4.4.1"
packages/x86-64-v3-poky-linux/gcr/gcr: PV changed from "4.4.0.1" to "4.4.1"
packages/x86-64-v3-poky-linux/gcr: PACKAGES: added "gcr-locale-uz gcr-locale-lo"
packages/x86-64-v3-poky-linux/gcr: SRC_URI changed from "https://download.gnome.org/sources//gcr/4.4/gcr-4.4.0.1.tar.xz;name=archive" to "https://download.gnome.org/sources//gcr/4.4/gcr-4.4.1.tar.xz;name=archive"
packages/x86-64-v3-poky-linux/gcr: PKGV changed from 4.4.0.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/gcr: PV changed from "4.4.0.1" to "4.4.1"
Changes to packages/x86-64-v3-poky-linux/gcr (sysroot):
  /usr/lib/libgck-2.so.2 changed symlink target from libgck-2.so.2.4.0 to libgck-2.so.2.4.1
  /usr/lib/libgcr-4.so.4 changed symlink target from libgcr-4.so.4.4.0 to libgcr-4.so.4.4.1
  /usr/lib/libgck-2.so.2.4.0 moved to /usr/lib/libgck-2.so.2.4.1
  /usr/lib/libgcr-4.so.4.4.0 moved to /usr/lib/libgcr-4.so.4.4.1

--===============5759508149280262953==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gcr-upgrade-4.4.0.1-4.4.1.patch"

RnJvbSBjZmIwNWEzMDM0NjhkZWYwNWYyZjA0Y2VkZWQyMmFmYzA4M2ZhMDYzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTQgU2VwIDIwMjYgMDU6MzU6NTAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
Y3I6IHVwZ3JhZGUgNC40LjAuMSAtPiA0LjQuMQoKU291cmNlOiBORVdTCgpnY3IgNC40LjE6Ci0g
Z2NyOiBTdXBwb3J0IHplcm8gbXRpbWUKLSBnY3I6IEZpeCBtZW1vcnkgbGVhayBpbiBHY3JTeXN0
ZW1Qcm9tcHQgY2FsbCBjbG9zdXJlCi0gZG9jczogRml4IGEgbWV0aG9kIHJlZmVyZW5jZSBpbiBn
Y3JfcHJvbXB0X3NldF9jaG9pY2VfbGFiZWwoKQotIFVwZGF0ZWQgdHJhbnNsYXRpb25zCi0tLQog
bWV0YS9yZWNpcGVzLWdub21lL2djci97Z2NyXzQuNC4wLjEuYmIgPT4gZ2NyXzQuNC4xLmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1nbm9tZS9nY3Ive2djcl80LjQuMC4xLmJiID0+IGdjcl80LjQuMS5i
Yn0gKDk1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ25vbWUvZ2NyL2djcl80LjQuMC4x
LmJiIGIvbWV0YS9yZWNpcGVzLWdub21lL2djci9nY3JfNC40LjEuYmIKc2ltaWxhcml0eSBpbmRl
eCA5NSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdub21lL2djci9nY3JfNC40LjAuMS5iYgpy
ZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdub21lL2djci9nY3JfNC40LjEuYmIKaW5kZXggNDkzYzhj
MmEwZC4uOTMwMjhkMjQ5NyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdub21lL2djci9nY3Jf
NC40LjAuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ25vbWUvZ2NyL2djcl80LjQuMS5iYgpAQCAt
MTYsNyArMTYsNyBAQCBHVEtET0NfTUVTT05fT1BUSU9OID0gImd0a19kb2MiCiBpbmhlcml0IGdu
b21lYmFzZSBnaS1kb2NnZW4gdmFsYSBnb2JqZWN0LWludHJvc3BlY3Rpb24gbGliX3BhY2thZ2UK
IFVQU1RSRUFNX0NIRUNLX1JFR0VYID0gImdjci0oP1A8cHZlcj5cZCtcLlxkK1wuKD8hOVxkKylc
ZCsoXC5cZCspPykiCiAKLVNSQ19VUklbYXJjaGl2ZS5zaGEyNTZzdW1dID0gIjBjM2MzNDFlNDlm
OWY0ZjI1MzJhNDg4NDUwOTgwNDE5MGEwYzI2NjNlNjEyMDM2MGJiMjk4YzVkMTc0YTgwOTgiCitT
UkNfVVJJW2FyY2hpdmUuc2hhMjU2c3VtXSA9ICJjNDQ0MmMxNWQ0MzMwZjE3YTFmNTE5NGRmMDhj
NTc2ODc3YWY2ODQxMmFiMjUyMTQ0NmE5M2JkNWUyNGM5MzFiIgogCiBQQUNLQUdFQ09ORklHID8/
PSAiJHtAYmIudXRpbHMuY29udGFpbnMoJ0dJX0RBVEFfRU5BQkxFRCcsICdUcnVlJywgJ3ZhcGkn
LCAnJywgZCl9IgogUEFDS0FHRUNPTkZJR1tzc2hfYWdlbnRdID0gIi1Ec3NoX2FnZW50PXRydWUs
LURzc2hfYWdlbnQ9ZmFsc2UsbGlic2VjcmV0IgotLSAKMi40Ny4xCgo=

--===============5759508149280262953==--

