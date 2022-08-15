Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E258C49EC6
	for <webhook@archiver.kernel.org>; Mon, 15 Aug 2022 18:57:03 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com
 (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web08.6464.1660589822547113064
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Aug 2022 11:57:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=e4iUGbTU;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193,
 mailfrom: 01010182a2ddcefc-1a5f60b0-a08f-4942-9b2e-ac84fe86878a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1660589821;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=aYr9vywVY/cTq+vxXeph+HS6KLDobAYYpWH3avICPfY=;
	b=e4iUGbTUzDjDru109elUnIYZG6Kuw37+YoJ1xM31G/JOozXyspQdm26Yul/IP6aV
	ovFnSEuDZ5x/BsORVtMacpJxmoK5Er9c55wf3He4abAEPPYMJiGMBI5dFQvysRk7krw
	pl5CZAncdb9/ICMrqkfzQ5m3DApk8YV7ivSO5a2k=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1660589821;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=aYr9vywVY/cTq+vxXeph+HS6KLDobAYYpWH3avICPfY=;
	b=cxIFIcjfxBumLgFGq+u8r4qz1wMmI3LSZKnXJELO0Y8mVGUqUQ+gahzF44Mt0g+l
	hilyUb+fqR/vSHwA9HZCN5YSruP4IirwO1ABRvuwwSyppR30sGvNnlP6Ytb6mFR80Z3
	CDvsyuiIbWeP99INkJ1Do/rzYPJup+4rz8Ql8tmU=
Content-Type: multipart/mixed; boundary="===============8923599788365400625=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] webkitgtk: upgrading to 2.36.6 SUCCEEDED
Message-ID: 
 <01010182a2ddcefc-1a5f60b0-a08f-4942-9b2e-ac84fe86878a-000000@us-west-2.amazonses.com>
Date: Mon, 15 Aug 2022 18:57:01 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.08.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Aug 2022 18:57:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169407

--===============8923599788365400625==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *webkitgtk* to *2.36.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-webkitgtk-upgrade-2.36.5-2.36.6.patch
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
--===============8923599788365400625==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/webkitgtk: PV changed from "2.36.5" to "2.36.6"
packages/core2-32-poky-linux/webkitgtk: PKGV changed from 2.36.5 [default] to 2.36.6 [default]
packages/core2-32-poky-linux/webkitgtk: SRC_URI changed from "https://www.webkitgtk.org/releases/webkitgtk-2.36.5.tar.xz file://0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch file://0001-Tweak-gtkdoc-settings-so-that-gtkdoc-generation-work.patch file://0001-Fix-build-without-opengl-or-es.patch file://reproducibility.patch file://0001-When-building-introspection-files-do-not-quote-CFLAG.patch" to "https://www.webkitgtk.org/releases/webkitgtk-2.36.6.tar.xz file://0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch file://0001-Tweak-gtkdoc-settings-so-that-gtkdoc-generation-work.patch file://0001-Fix-build-without-opengl-or-es.patch file://reproducibility.patch file://0001-When-building-introspection-files-do-not-quote-CFLAG.patch"
Changes to packages/core2-32-poky-linux/webkitgtk (sysroot):
  /usr/lib/libjavascriptcoregtk-4.0.so.18 changed symlink target from libjavascriptcoregtk-4.0.so.18.20.9 to libjavascriptcoregtk-4.0.so.18.20.10
  /usr/lib/libwebkit2gtk-4.0.so.37 changed symlink target from libwebkit2gtk-4.0.so.37.56.9 to libwebkit2gtk-4.0.so.37.56.10
  /usr/lib/libjavascriptcoregtk-4.0.so.18.20.10 was added
  /usr/lib/libwebkit2gtk-4.0.so.37.56.10 was added
  /usr/lib/libjavascriptcoregtk-4.0.so.18.20.9 was removed
  /usr/lib/libwebkit2gtk-4.0.so.37.56.9 was removed
packages/core2-32-poky-linux/webkitgtk/webkitgtk-dbg: PKGSIZE changed from 3335201396 to 3335249632 (+0%)
packages/core2-32-poky-linux/webkitgtk/webkitgtk-dbg: FILELIST: removed "/usr/lib/.debug/libjavascriptcoregtk-4.0.so.18.20.9 /usr/lib/.debug/libwebkit2gtk-4.0.so.37.56.9", added "/usr/lib/.debug/libjavascriptcoregtk-4.0.so.18.20.10 /usr/lib/.debug/libwebkit2gtk-4.0.so.37.56.10"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-dbg: PKGV changed from 2.36.5 [default] to 2.36.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-dbg: PV changed from "2.36.5" to "2.36.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-dev: PKGV changed from 2.36.5 [default] to 2.36.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-dev: PV changed from "2.36.5" to "2.36.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-doc: PKGV changed from 2.36.5 [default] to 2.36.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-doc: PV changed from "2.36.5" to "2.36.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-ar: PKGV changed from 2.36.5 [default] to 2.36.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-ar: PV changed from "2.36.5" to "2.36.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-as: PKGV changed from 2.36.5 [default] to 2.36.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-as: PV changed from "2.36.5" to "2.36.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-bg: PKGV changed from 2.36.5 [default] to 2.36.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-bg: PV changed from "2.36.5" to "2.36.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-ca: PKGV changed from 2.36.5 [default] to 2.36.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-ca: PV changed from "2.36.5" to "2.36.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-cs: PKGV changed from 2.36.5 [default] to 2.36.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-cs: PV changed from "2.36.5" to "2.36.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-da: PKGV changed from 2.36.5 [default] to 2.36.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-da: PV changed from "2.36.5" to "2.36.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-de: PKGV changed from 2.36.5 [default] to 2.36.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-de: PV changed from "2.36.5" to "2.36.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-el: PKGV changed from 2.36.5 [default] to 2.36.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-el: PV changed from "2.36.5" to "2.36.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-en-ca: PKGV changed from 2.36.5 [default] to 2.36.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-en-ca: PV changed from "2.36.5" to "2.36.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-en-gb: PKGV changed from 2.36.5 [default] to 2.36.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-en-gb: PV changed from "2.36.5" to "2.36.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-eo: PKGV changed from 2.36.5 [default] to 2.36.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-eo: PV changed from "2.36.5" to "2.36.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-es: PKGV changed from 2.36.5 [default] to 2.36.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-es: PV changed from "2.36.5" to "2.36.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-et: PKGV changed from 2.36.5 [default] to 2.36.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-et: PV changed from "2.36.5" to "2.36.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-eu: PKGV changed from 2.36.5 [default] to 2.36.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-eu: PV changed from "2.36.5" to "2.36.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-fi: PKGV changed from 2.36.5 [default] to 2.36.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-fi: PV changed from "2.36.5" to "2.36.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-fr: PKGV changed from 2.36.5 [default] to 2.36.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-fr: PV changed from "2.36.5" to "2.36.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-gl: PKGV changed from 2.36.5 [default] to 2.36.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-gl: PV changed from "2.36.5" to "2.36.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-gu: PKGV changed from 2.36.5 [default] to 2.36.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-gu: PV changed from "2.36.5" to "2.36.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-he: PKGV changed from 2.36.5 [default] to 2.36.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-he: PV changed from "2.36.5" to "2.36.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-hi: PKGV changed from 2.36.5 [default] to 2.36.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-hi: PV changed from "2.36.5" to "2.36.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-hr: PKGV changed from 2.36.5 [default] to 2.36.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-hr: PV changed from "2.36.5" to "2.36.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-hu: PKGV changed from 2.36.5 [default] to 2.36.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-hu: PV changed from "2.36.5" to "2.36.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-id: PKGV changed from 2.36.5 [default] to 2.36.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-id: PV changed from "2.36.5" to "2.36.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-it: PKGV changed from 2.36.5 [default] to 2.36.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-it: PV changed from "2.36.5" to "2.36.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-ja: PKGV changed from 2.36.5 [default] to 2.36.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-ja: PV changed from "2.36.5" to "2.36.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-kn: PKGV changed from 2.36.5 [default] to 2.36.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-kn: PV changed from "2.36.5" to "2.36.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-ko: PKGV changed from 2.36.5 [default] to 2.36.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-ko: PV changed from "2.36.5" to "2.36.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-lt: PKGV changed from 2.36.5 [default] to 2.36.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-lt: PV changed from "2.36.5" to "2.36.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-lv: PKGV changed from 2.36.5 [default] to 2.36.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-lv: PV changed from "2.36.5" to "2.36.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-ml: PKGV changed from 2.36.5 [default] to 2.36.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-ml: PV changed from "2.36.5" to "2.36.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-mr: PKGV changed from 2.36.5 [default] to 2.36.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-mr: PV changed from "2.36.5" to "2.36.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-nb: PKGV changed from 2.36.5 [default] to 2.36.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-nb: PV changed from "2.36.5" to "2.36.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-nl: PKGV changed from 2.36.5 [default] to 2.36.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-nl: PV changed from "2.36.5" to "2.36.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-or: PKGV changed from 2.36.5 [default] to 2.36.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-or: PV changed from "2.36.5" to "2.36.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-pa: PKGV changed from 2.36.5 [default] to 2.36.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-pa: PV changed from "2.36.5" to "2.36.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-pl: PKGV changed from 2.36.5 [default] to 2.36.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-pl: PV changed from "2.36.5" to "2.36.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-pt-br: PKGV changed from 2.36.5 [default] to 2.36.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-pt-br: PV changed from "2.36.5" to "2.36.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-pt: PKGV changed from 2.36.5 [default] to 2.36.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-pt: PV changed from "2.36.5" to "2.36.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-ro: PKGV changed from 2.36.5 [default] to 2.36.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-ro: PV changed from "2.36.5" to "2.36.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-ru: PKGV changed from 2.36.5 [default] to 2.36.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-ru: PV changed from "2.36.5" to "2.36.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-sl: PKGV changed from 2.36.5 [default] to 2.36.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-sl: PV changed from "2.36.5" to "2.36.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-sr+latin: PKGV changed from 2.36.5 [default] to 2.36.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-sr+latin: PV changed from "2.36.5" to "2.36.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-sr: PKGV changed from 2.36.5 [default] to 2.36.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-sr: PV changed from "2.36.5" to "2.36.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-sv: PKGV changed from 2.36.5 [default] to 2.36.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-sv: PV changed from "2.36.5" to "2.36.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-ta: PKGV changed from 2.36.5 [default] to 2.36.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-ta: PV changed from "2.36.5" to "2.36.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-te: PKGV changed from 2.36.5 [default] to 2.36.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-te: PV changed from "2.36.5" to "2.36.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-tr: PKGV changed from 2.36.5 [default] to 2.36.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-tr: PV changed from "2.36.5" to "2.36.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-uk: PKGV changed from 2.36.5 [default] to 2.36.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-uk: PV changed from "2.36.5" to "2.36.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-vi: PKGV changed from 2.36.5 [default] to 2.36.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-vi: PV changed from "2.36.5" to "2.36.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-zh-cn: PKGV changed from 2.36.5 [default] to 2.36.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-zh-cn: PV changed from "2.36.5" to "2.36.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-src: PKGSIZE changed from 144863157 to 144865761 (+0%)
packages/core2-32-poky-linux/webkitgtk/webkitgtk-src: PKGV changed from 2.36.5 [default] to 2.36.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-src: PV changed from "2.36.5" to "2.36.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-staticdev: PKGV changed from 2.36.5 [default] to 2.36.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-staticdev: PV changed from "2.36.5" to "2.36.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk: PKGSIZE changed from 78891947 to 78891953 (+0%)
packages/core2-32-poky-linux/webkitgtk/webkitgtk: FILELIST: removed "/usr/lib/libwebkit2gtk-4.0.so.37.56.9 /usr/lib/libjavascriptcoregtk-4.0.so.18.20.9", added "/usr/lib/libwebkit2gtk-4.0.so.37.56.10 /usr/lib/libjavascriptcoregtk-4.0.so.18.20.10"
packages/core2-32-poky-linux/webkitgtk/webkitgtk: PKGV changed from 2.36.5 [default] to 2.36.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk: PV changed from "2.36.5" to "2.36.6"
Changes to packages/x86_64-linux/gcc-cross-i686 (sysroot):
  /sysroot-providers/virtual_i686-poky-linux-g++ was added
  /sysroot-providers/virtual_i686-poky-linux-gcc was added
  /usr/bin/i686-poky-linux was added
  /usr/bin/i686-poky-linux/i686-poky-linux-c++ was added
  /usr/bin/i686-poky-linux/i686-poky-linux-cpp was added
  /usr/bin/i686-poky-linux/i686-poky-linux-g++ was added
  /usr/bin/i686-poky-linux/i686-poky-linux-gcc was added
  /usr/bin/i686-poky-linux/i686-poky-linux-gcc-12.1.0 was added
  /usr/bin/i686-poky-linux/i686-poky-linux-gcc-ar was added
  /usr/bin/i686-poky-linux/i686-poky-linux-gcc-nm was added
  /usr/bin/i686-poky-linux/i686-poky-linux-gcc-ranlib was added
  /usr/bin/i686-poky-linux/i686-poky-linux-gcov was added
  /usr/bin/i686-poky-linux/i686-poky-linux-gcov-dump was added
  /usr/bin/i686-poky-linux/i686-poky-linux-gcov-tool was added
  /usr/bin/i686-poky-linux/i686-poky-linux-lto-dump was added
  /usr/libexec/i686-poky-linux was added
  /usr/libexec/i686-poky-linux/gcc was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/ar was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/as was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/cc1 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/cc1plus was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/collect2 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/cpp was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/gcc was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/g++-mapper-server was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/i686-poky-linux-ar was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/i686-poky-linux-as was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/i686-poky-linux-cpp was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/i686-poky-linux-gcc was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/i686-poky-linux-ld.bfd was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/i686-poky-linux-ld was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/i686-poky-linux-ld.gold was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/i686-poky-linux-nm was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/i686-poky-linux-objcopy was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/i686-poky-linux-objdump was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/i686-poky-linux-ranlib was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/i686-poky-linux-strip was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/install-tools was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/install-tools/fixincl was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/install-tools/fixinc.sh was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/install-tools/mkheaders was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/install-tools/mkinstalldirs was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/ld.bfd was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/ld was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/ld.gold was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/libcc1plugin.so.0.0.0 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/libcc1plugin.so.0 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/libcc1plugin.so was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/libcc1.so.0.0.0 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/libcc1.so.0 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/libcc1.so was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/libcp1plugin.so.0.0.0 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/libcp1plugin.so.0 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/libcp1plugin.so was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/liblto_plugin.so was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/lto1 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/lto-wrapper was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/nm was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/objcopy was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/objdump was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/gengtype was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/ranlib was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/strip was added
  /usr/lib/i686-poky-linux was added
  /usr/lib/i686-poky-linux/bfd-plugins was added
  /usr/lib/i686-poky-linux/bfd-plugins/liblto_plugin.so was added
  /usr/lib/i686-poky-linux/gcc was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0 was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/adxintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/ammintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/amxbf16intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/amxint8intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/amxtileintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx2intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx5124fmapsintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx5124vnniwintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512bf16intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512bf16vlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512bitalgintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512bwintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512cdintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512dqintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512erintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512fintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512fp16intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512fp16vlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512ifmaintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512ifmavlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512pfintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512vbmi2intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512vbmi2vlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512vbmiintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512vbmivlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512vlbwintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512vldqintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512vlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512vnniintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512vnnivlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512vp2intersectintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512vp2intersectvlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512vpopcntdqintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512vpopcntdqvlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avxintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avxvnniintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/bmi2intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/bmiintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/bmmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/cet.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/cetintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/cldemoteintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/clflushoptintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/clwbintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/clzerointrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/cpuid.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/cross-stdarg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/emmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/enqcmdintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/f16cintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include-fixed was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include-fixed/limits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include-fixed/README was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include-fixed/syslimits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/float.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/fma4intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/fmaintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/fxsrintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/gfniintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/hresetintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/ia32intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/immintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/iso646.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/keylockerintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/lwpintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/lzcntintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/mm3dnow.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/mmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/mm_malloc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/movdirintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/mwaitintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/mwaitxintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/nmmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/pconfigintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/pkuintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/pmmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/popcntintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/prfchwintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/quadmath.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/quadmath_weak.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/rdseedintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/rtmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/serializeintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/sgxintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/shaintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/smmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/stdalign.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/stdarg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/stdatomic.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/stdbool.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/stddef.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/stdfix.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/stdint-gcc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/stdint.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/stdnoreturn.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/tbmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/tmmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/tsxldtrkintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/uintrintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/unwind.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/vaesintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/varargs.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/vpclmulqdqintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/waitpkgintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/wbnoinvdintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/wmmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/x86gprintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/x86intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/xmmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/xopintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/xsavecintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/xsaveintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/xsaveoptintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/xsavesintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/xtestintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/install-tools was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/install-tools/fixinc_list was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/install-tools/gsyslimits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/install-tools/include was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/install-tools/include/limits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/install-tools/include/README was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/install-tools/macro_list was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/install-tools/mkheaders.conf was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/gtype.state was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ada was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ada/gcc-interface was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ada/gcc-interface/ada-tree.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/addresses.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/alias.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/align.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/alloc-pool.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/all-tree.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ansidecl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/array-traits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/asan.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/attr-fnspec.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/attribs.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/auto-host.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/auto-profile.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/backend.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/basic-block.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/bb-reorder.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/b-header-vars was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/bitmap.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/builtin-attrs.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/builtins.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/builtins.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/builtin-types.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/bversion.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/calls.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ccmp.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/c-family was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/c-family/c-common.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/c-family/c-common.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/c-family/c-objc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/c-family/c-pragma.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/c-family/c-pretty-print.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/cfganal.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/cfgbuild.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/cfgcleanup.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/cfgexpand.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/cfg-flags.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/cfg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/cfghooks.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/cfgloop.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/cfgloopmanip.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/cfgrtl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/cgraph.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/cif-code.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/collect2-aix.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/collect2.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/collect-utils.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/color-macros.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/common was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/common/config was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/common/config/i386 was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/common/config/i386/i386-cpuinfo.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/conditions.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/config was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/configargs.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/config/dbxelf.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/config/elfos.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/config/glibc-stdint.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/config/gnu-user.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/config.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/config/i386 was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/config/i386/att.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/config/i386/gnu-user64.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/config/i386/gnu-user-common.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/config/i386/i386.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/config/i386/i386-isa.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/config/i386/i386-opts.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/config/i386/i386-protos.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/config/i386/linux64.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/config/i386/linux-common.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/config/i386/stringop.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/config/i386/unix.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/config/i386/x86-64.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/config/i386/x86-tune.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/config/initfini-array.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/config/linux-android.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/config/linux.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/config/linux-protos.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/config/vxworks-dummy.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/context.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/convert.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/coretypes.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/coroutine-builtins.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/coverage.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/cp was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/cp/cp-tree.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/cp/cp-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/cp/cxx-pretty-print.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/cp/name-lookup.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/cp/operators.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/cppbuiltin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/cppdefault.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/cpplib.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/cp/type-utils.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/cselib.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ctfc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/c-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/d was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/data-streamer.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/dbgcnt.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/dbgcnt.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/dbxout.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/dce.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ddg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/d/d-tree.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/debug.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/defaults.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/df.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/dfp.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/diagnostic-color.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/diagnostic-core.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/diagnostic.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/diagnostic-event-id.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/diagnostic.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/diagnostic-metadata.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/diagnostic-path.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/diagnostic-spec.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/diagnostic-url.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/digraph.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/dojump.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/dominance.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/domwalk.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/double-int.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/dump-context.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/dumpfile.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/dwarf2asm.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/dwarf2ctf.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/dwarf2out.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/edit-context.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/emit-rtl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/errors.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/escaped_string.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/et-forest.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/except.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/explow.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/expmed.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/expr.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/fibonacci_heap.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/file-find.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/filenames.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/file-prefix-map.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/fixed-value.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/flags.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/flag-types.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/fold-const-call.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/fold-const.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/function-abi.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/function.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gcc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gcc-plugin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gcc-rich-location.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gcc-symtab.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gcov-counter.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gcov-io.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gcse-common.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gcse.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/generic-match.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gengtype.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/genrtl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gensupport.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ggc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ggc-internal.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimple-array-bounds.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimple-builder.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimple.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimple-expr.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimple-fold.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimple.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimple-iterator.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimple-low.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimple-match.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimple-predicate-analysis.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimple-predict.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimple-pretty-print.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimple-range-cache.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimple-range-edge.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimple-range-fold.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimple-range-gori.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimple-range.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimple-range-path.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimple-range-trace.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimple-ssa-evrp-analyze.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimple-ssa.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimple-ssa-warn-access.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimple-ssa-warn-restrict.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimple-streamer.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimple-walk.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimplify.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimplify-me.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/glimits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gomp-constants.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/graphds.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/graph.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/graphite.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/graphviz.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gsstruct.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gstab.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gsyms.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gsyslimits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gtm-builtins.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gtype-desc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/hard-reg-set.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/hash-map.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/hash-map-traits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/hash-set.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/hashtab.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/hash-table.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/hash-traits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/highlev-plugin-common.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/hooks.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/hosthooks-def.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/hosthooks.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/hw-doloop.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/hwint.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ifcvt.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/inchash.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/incpath.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/input.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/insn-addr.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/insn-attr-common.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/insn-attr.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/insn-codes.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/insn-config.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/insn-constants.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/insn-flags.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/insn-modes.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/insn-modes-inline.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/insn-notes.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/internal-fn.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/internal-fn.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/intl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/int-vector-builder.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ipa-fnsummary.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ipa-icf-gimple.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ipa-icf.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ipa-inline.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ipa-modref.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ipa-modref-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ipa-param-manipulation.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ipa-predicate.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ipa-prop.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ipa-reference.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ipa-ref.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ipa-utils.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ira.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ira-int.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/is-a.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/iterator-utils.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/json.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/langhooks-def.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/langhooks.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/lcm.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/libfuncs.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/libiberty.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/limitx.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/limity.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/line-map.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/linux.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/loop-unroll.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/lower-subreg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/lra.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/lra-int.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/lto-compress.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/lto-section-names.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/lto-streamer.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/machmode.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/machmode.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/md5.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/memmodel.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/memory-block.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/mem-stats.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/mem-stats-traits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/mode-classes.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/mux-utils.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/objc was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/objc/objc-tree.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/obstack.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/obstack-utils.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/omp-builtins.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/omp-expand.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/omp-general.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/omp-low.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/omp-offload.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/omp-simd-clone.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/optabs.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/optabs.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/optabs-libfuncs.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/optabs-query.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/optabs-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/optinfo-emit-json.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/optinfo.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/options.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/opt-problem.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/opts-diagnostic.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/opts.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/opt-suggestions.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ordered-hash-map.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/output.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/passes.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/pass-instances.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/pass_manager.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/plugin-api.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/plugin.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/plugin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/plugin-version.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/pointer-query.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/poly-int.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/poly-int-types.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/predict.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/predict.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/prefix.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/pretty-print.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/print-rtl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/print-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/profile-count.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/profile.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/range.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/range-op.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/read-md.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/read-rtl-function.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/real.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/realmpfr.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/recog.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/regcprop.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/reg-notes.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/regrename.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/regset.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/regs.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/reload.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/resource.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/rtlanal.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/rtl.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/rtl-error.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/rtl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/rtlhash.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/rtlhooks-def.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/rtl-iter.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/rtl-ssa.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/rtx-vector-builder.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/run-rtl-passes.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/safe-ctype.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/sanitizer.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/sbitmap.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/sched-int.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/selftest-diagnostic.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/selftest.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/selftest-rtl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/sel-sched-dump.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/sel-sched.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/sel-sched-ir.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/sese.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/shortest-paths.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/shrink-wrap.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/signop.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/sparseset.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/spellcheck.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/spellcheck-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/splay-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/splay-tree-utils.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/sreal.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ssa.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ssa-iterators.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/stab.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/statistics.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/stmt.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/stor-layout.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/streamer-hooks.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/stringpool.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/substring-locations.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/symbol-summary.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/symtab-clones.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/symtab.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/symtab-thunks.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/sync-builtins.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/system.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/target.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/target-def.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/target-globals.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/target.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/target-hooks-macros.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/target-insns.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/targhooks.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/timevar.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/timevar.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tm.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tm_p.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tm-preds.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/toplev.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tracer.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/trans-mem.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-affine.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-cfgcleanup.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-cfg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-check.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-chrec.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-core.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-data-ref.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-dfa.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-diagnostic.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-dump.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-eh.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-hasher.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-hash-traits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-if-conv.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-inline.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-into-ssa.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-iterator.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-nested.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-object-size.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-outof-ssa.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-parloops.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-pass.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-phinodes.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-pretty-print.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-scalar-evolution.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-sra.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-ssa-address.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-ssa-alias-compare.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-ssa-alias.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-ssa-ccp.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-ssa-coalesce.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-ssa-dce.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-ssa-dom.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-ssa-dse.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-ssa.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-ssa-live.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-ssa-loop.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-ssa-loop-ivopts.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-ssa-loop-manip.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-ssa-loop-niter.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-ssa-math-opts.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-ssanames.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-ssa-operands.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-ssa-propagate.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-ssa-reassoc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-ssa-sccvn.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-ssa-scopedtables.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-ssa-strlen.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-ssa-ter.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-ssa-threadedge.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-ssa-threadupdate.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-stdarg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-streamer.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/treestruct.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-switch-conversion.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-vector-builder.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-vectorizer.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-vrp.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tristate.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tsan.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tsystem.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/typeclass.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/typed-splay-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ubsan.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/valtrack.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/value-pointer-equiv.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/value-prof.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/value-query.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/value-range-equiv.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/value-range.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/value-relation.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/varasm.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/vec.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/vec-perm-indices.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/vector-builder.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/version.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/vmsdbg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/vr-values.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/vtable-verify.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/wide-int-bitmask.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/wide-int.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/wide-int-print.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/xcoff.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/xcoffout.h was added
  /sysroot-providers/virtual_i686-poky-linux-musl-g++ was removed
  /sysroot-providers/virtual_i686-poky-linux-musl-gcc was removed
  /usr/bin/i686-poky-linux-musl was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-c++ was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-cpp was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-g++ was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcc was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcc-12.1.0 was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcc-ar was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcc-nm was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcc-ranlib was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcov was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcov-dump was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcov-tool was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-lto-dump was removed
  /usr/libexec/i686-poky-linux-musl was removed
  /usr/libexec/i686-poky-linux-musl/gcc was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/ar was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/as was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/cc1 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/cc1plus was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/collect2 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/cpp was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/gcc was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/g++-mapper-server was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/i686-poky-linux-musl-ar was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/i686-poky-linux-musl-as was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/i686-poky-linux-musl-cpp was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/i686-poky-linux-musl-gcc was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/i686-poky-linux-musl-ld.bfd was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/i686-poky-linux-musl-ld was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/i686-poky-linux-musl-ld.gold was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/i686-poky-linux-musl-nm was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/i686-poky-linux-musl-objcopy was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/i686-poky-linux-musl-objdump was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/i686-poky-linux-musl-ranlib was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/i686-poky-linux-musl-strip was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/install-tools was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/install-tools/fixincl was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/install-tools/fixinc.sh was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/install-tools/mkheaders was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/install-tools/mkinstalldirs was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/ld.bfd was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/ld was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/ld.gold was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/libcc1plugin.so.0.0.0 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/libcc1plugin.so.0 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/libcc1plugin.so was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/libcc1.so.0.0.0 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/libcc1.so.0 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/libcc1.so was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/libcp1plugin.so.0.0.0 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/libcp1plugin.so.0 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/libcp1plugin.so was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/liblto_plugin.so was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/lto1 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/lto-wrapper was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/nm was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/objcopy was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/objdump was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/gengtype was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/ranlib was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/strip was removed
  /usr/lib/i686-poky-linux-musl was removed
  /usr/lib/i686-poky-linux-musl/bfd-plugins was removed
  /usr/lib/i686-poky-linux-musl/bfd-plugins/liblto_plugin.so was removed
  /usr/lib/i686-poky-linux-musl/gcc was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0 was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/adxintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/ammintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/amxbf16intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/amxint8intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/amxtileintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx2intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx5124fmapsintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx5124vnniwintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512bf16intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512bf16vlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512bitalgintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512bwintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512cdintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512dqintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512erintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512fintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512fp16intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512fp16vlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512ifmaintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512ifmavlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512pfintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512vbmi2intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512vbmi2vlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512vbmiintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512vbmivlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512vlbwintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512vldqintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512vlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512vnniintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512vnnivlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512vp2intersectintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512vp2intersectvlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512vpopcntdqintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512vpopcntdqvlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avxintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avxvnniintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/bmi2intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/bmiintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/bmmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/cet.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/cetintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/cldemoteintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/clflushoptintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/clwbintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/clzerointrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/cpuid.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/cross-stdarg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/emmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/enqcmdintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/f16cintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include-fixed was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include-fixed/limits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include-fixed/README was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include-fixed/syslimits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/float.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/fma4intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/fmaintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/fxsrintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/gfniintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/hresetintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/ia32intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/immintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/iso646.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/keylockerintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/lwpintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/lzcntintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/mm3dnow.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/mmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/mm_malloc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/movdirintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/mwaitintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/mwaitxintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/nmmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/pconfigintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/pkuintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/pmmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/popcntintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/prfchwintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/quadmath.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/quadmath_weak.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/rdseedintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/rtmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/serializeintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/sgxintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/shaintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/smmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/stdalign.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/stdarg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/stdatomic.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/stdbool.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/stddef.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/stdfix.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/stdint-gcc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/stdint.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/stdnoreturn.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/tbmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/tmmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/tsxldtrkintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/uintrintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/unwind.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/vaesintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/varargs.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/vpclmulqdqintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/waitpkgintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/wbnoinvdintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/wmmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/x86gprintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/x86intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/xmmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/xopintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/xsavecintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/xsaveintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/xsaveoptintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/xsavesintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/xtestintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/install-tools was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/install-tools/fixinc_list was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/install-tools/gsyslimits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/install-tools/include was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/install-tools/include/limits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/install-tools/include/README was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/install-tools/macro_list was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/install-tools/mkheaders.conf was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/gtype.state was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ada was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ada/gcc-interface was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ada/gcc-interface/ada-tree.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/addresses.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/alias.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/align.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/alloc-pool.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/all-tree.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ansidecl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/array-traits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/asan.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/attr-fnspec.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/attribs.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/auto-host.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/auto-profile.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/backend.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/basic-block.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/bb-reorder.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/b-header-vars was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/bitmap.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/builtin-attrs.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/builtins.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/builtins.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/builtin-types.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/bversion.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/calls.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ccmp.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/c-family was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/c-family/c-common.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/c-family/c-common.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/c-family/c-objc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/c-family/c-pragma.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/c-family/c-pretty-print.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/cfganal.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/cfgbuild.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/cfgcleanup.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/cfgexpand.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/cfg-flags.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/cfg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/cfghooks.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/cfgloop.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/cfgloopmanip.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/cfgrtl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/cgraph.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/cif-code.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/collect2-aix.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/collect2.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/collect-utils.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/color-macros.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/common was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/common/config was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/common/config/i386 was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/common/config/i386/i386-cpuinfo.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/conditions.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/config was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/configargs.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/config/dbxelf.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/config/elfos.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/config/glibc-stdint.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/config/gnu-user.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/config.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/config/i386 was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/config/i386/att.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/config/i386/gnu-user64.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/config/i386/gnu-user-common.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/config/i386/i386.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/config/i386/i386-isa.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/config/i386/i386-opts.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/config/i386/i386-protos.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/config/i386/linux64.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/config/i386/linux-common.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/config/i386/stringop.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/config/i386/unix.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/config/i386/x86-64.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/config/i386/x86-tune.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/config/initfini-array.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/config/linux-android.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/config/linux.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/config/linux-protos.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/config/vxworks-dummy.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/context.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/convert.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/coretypes.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/coroutine-builtins.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/coverage.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/cp was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/cp/cp-tree.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/cp/cp-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/cp/cxx-pretty-print.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/cp/name-lookup.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/cp/operators.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/cppbuiltin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/cppdefault.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/cpplib.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/cp/type-utils.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/cselib.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ctfc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/c-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/d was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/data-streamer.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/dbgcnt.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/dbgcnt.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/dbxout.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/dce.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ddg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/d/d-tree.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/debug.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/defaults.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/df.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/dfp.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/diagnostic-color.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/diagnostic-core.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/diagnostic.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/diagnostic-event-id.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/diagnostic.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/diagnostic-metadata.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/diagnostic-path.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/diagnostic-spec.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/diagnostic-url.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/digraph.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/dojump.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/dominance.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/domwalk.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/double-int.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/dump-context.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/dumpfile.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/dwarf2asm.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/dwarf2ctf.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/dwarf2out.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/edit-context.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/emit-rtl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/errors.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/escaped_string.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/et-forest.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/except.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/explow.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/expmed.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/expr.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/fibonacci_heap.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/file-find.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/filenames.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/file-prefix-map.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/fixed-value.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/flags.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/flag-types.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/fold-const-call.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/fold-const.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/function-abi.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/function.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gcc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gcc-plugin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gcc-rich-location.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gcc-symtab.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gcov-counter.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gcov-io.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gcse-common.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gcse.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/generic-match.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gengtype.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/genrtl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gensupport.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ggc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ggc-internal.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimple-array-bounds.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimple-builder.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimple.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimple-expr.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimple-fold.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimple.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimple-iterator.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimple-low.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimple-match.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimple-predicate-analysis.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimple-predict.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimple-pretty-print.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimple-range-cache.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimple-range-edge.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimple-range-fold.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimple-range-gori.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimple-range.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimple-range-path.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimple-range-trace.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimple-ssa-evrp-analyze.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimple-ssa.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimple-ssa-warn-access.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimple-ssa-warn-restrict.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimple-streamer.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimple-walk.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimplify.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimplify-me.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/glimits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gomp-constants.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/graphds.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/graph.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/graphite.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/graphviz.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gsstruct.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gstab.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gsyms.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gsyslimits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gtm-builtins.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gtype-desc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/hard-reg-set.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/hash-map.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/hash-map-traits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/hash-set.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/hashtab.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/hash-table.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/hash-traits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/highlev-plugin-common.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/hooks.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/hosthooks-def.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/hosthooks.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/hw-doloop.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/hwint.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ifcvt.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/inchash.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/incpath.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/input.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/insn-addr.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/insn-attr-common.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/insn-attr.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/insn-codes.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/insn-config.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/insn-constants.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/insn-flags.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/insn-modes.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/insn-modes-inline.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/insn-notes.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/internal-fn.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/internal-fn.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/intl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/int-vector-builder.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ipa-fnsummary.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ipa-icf-gimple.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ipa-icf.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ipa-inline.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ipa-modref.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ipa-modref-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ipa-param-manipulation.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ipa-predicate.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ipa-prop.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ipa-reference.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ipa-ref.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ipa-utils.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ira.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ira-int.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/is-a.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/iterator-utils.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/json.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/langhooks-def.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/langhooks.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/lcm.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/libfuncs.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/libiberty.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/limitx.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/limity.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/line-map.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/linux.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/loop-unroll.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/lower-subreg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/lra.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/lra-int.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/lto-compress.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/lto-section-names.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/lto-streamer.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/machmode.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/machmode.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/md5.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/memmodel.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/memory-block.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/mem-stats.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/mem-stats-traits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/mode-classes.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/mux-utils.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/objc was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/objc/objc-tree.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/obstack.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/obstack-utils.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/omp-builtins.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/omp-expand.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/omp-general.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/omp-low.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/omp-offload.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/omp-simd-clone.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/optabs.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/optabs.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/optabs-libfuncs.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/optabs-query.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/optabs-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/optinfo-emit-json.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/optinfo.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/options.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/opt-problem.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/opts-diagnostic.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/opts.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/opt-suggestions.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ordered-hash-map.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/output.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/passes.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/pass-instances.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/pass_manager.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/plugin-api.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/plugin.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/plugin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/plugin-version.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/pointer-query.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/poly-int.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/poly-int-types.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/predict.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/predict.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/prefix.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/pretty-print.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/print-rtl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/print-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/profile-count.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/profile.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/range.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/range-op.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/read-md.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/read-rtl-function.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/real.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/realmpfr.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/recog.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/regcprop.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/reg-notes.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/regrename.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/regset.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/regs.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/reload.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/resource.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/rtlanal.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/rtl.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/rtl-error.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/rtl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/rtlhash.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/rtlhooks-def.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/rtl-iter.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/rtl-ssa.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/rtx-vector-builder.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/run-rtl-passes.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/safe-ctype.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/sanitizer.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/sbitmap.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/sched-int.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/selftest-diagnostic.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/selftest.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/selftest-rtl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/sel-sched-dump.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/sel-sched.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/sel-sched-ir.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/sese.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/shortest-paths.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/shrink-wrap.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/signop.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/sparseset.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/spellcheck.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/spellcheck-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/splay-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/splay-tree-utils.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/sreal.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ssa.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ssa-iterators.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/stab.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/statistics.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/stmt.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/stor-layout.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/streamer-hooks.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/stringpool.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/substring-locations.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/symbol-summary.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/symtab-clones.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/symtab.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/symtab-thunks.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/sync-builtins.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/system.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/target.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/target-def.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/target-globals.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/target.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/target-hooks-macros.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/target-insns.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/targhooks.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/timevar.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/timevar.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tm.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tm_p.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tm-preds.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/toplev.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tracer.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/trans-mem.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-affine.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-cfgcleanup.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-cfg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-check.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-chrec.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-core.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-data-ref.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-dfa.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-diagnostic.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-dump.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-eh.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-hasher.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-hash-traits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-if-conv.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-inline.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-into-ssa.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-iterator.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-nested.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-object-size.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-outof-ssa.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-parloops.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-pass.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-phinodes.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-pretty-print.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-scalar-evolution.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-sra.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-ssa-address.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-ssa-alias-compare.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-ssa-alias.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-ssa-ccp.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-ssa-coalesce.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-ssa-dce.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-ssa-dom.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-ssa-dse.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-ssa.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-ssa-live.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-ssa-loop.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-ssa-loop-ivopts.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-ssa-loop-manip.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-ssa-loop-niter.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-ssa-math-opts.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-ssanames.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-ssa-operands.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-ssa-propagate.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-ssa-reassoc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-ssa-sccvn.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-ssa-scopedtables.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-ssa-strlen.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-ssa-ter.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-ssa-threadedge.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-ssa-threadupdate.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-stdarg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-streamer.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/treestruct.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-switch-conversion.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-vector-builder.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-vectorizer.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-vrp.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tristate.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tsan.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tsystem.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/typeclass.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/typed-splay-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ubsan.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/valtrack.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/value-pointer-equiv.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/value-prof.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/value-query.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/value-range-equiv.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/value-range.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/value-relation.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/varasm.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/vec.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/vec-perm-indices.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/vector-builder.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/version.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/vmsdbg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/vr-values.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/vtable-verify.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/wide-int-bitmask.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/wide-int.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/wide-int-print.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/xcoff.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/xcoffout.h was removed

--===============8923599788365400625==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-webkitgtk-upgrade-2.36.5-2.36.6.patch"

RnJvbSBlZDk4NjJlYTc3ZTRkOGJlOTQ3YzUwOGIwMjM4MzU3MTdhNzE4OGVjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgQXVnIDIwMjIgMTg6MzE6NTIgKzAwMDAKU3ViamVjdDogW1BBVENIXSB3
ZWJraXRndGs6IHVwZ3JhZGUgMi4zNi41IC0+IDIuMzYuNgoKLS0tCiAuLi4vd2Via2l0L3t3ZWJr
aXRndGtfMi4zNi41LmJiID0+IHdlYmtpdGd0a18yLjM2LjYuYmJ9ICAgICAgICAgfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRh
L3JlY2lwZXMtc2F0by93ZWJraXQve3dlYmtpdGd0a18yLjM2LjUuYmIgPT4gd2Via2l0Z3RrXzIu
MzYuNi5iYn0gKDk4JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc2F0by93ZWJraXQvd2Vi
a2l0Z3RrXzIuMzYuNS5iYiBiL21ldGEvcmVjaXBlcy1zYXRvL3dlYmtpdC93ZWJraXRndGtfMi4z
Ni42LmJiCnNpbWlsYXJpdHkgaW5kZXggOTglCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1zYXRv
L3dlYmtpdC93ZWJraXRndGtfMi4zNi41LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc2F0by93
ZWJraXQvd2Via2l0Z3RrXzIuMzYuNi5iYgppbmRleCBiM2ZlMzU3MDEwLi4zN2I5NzdmOWJhIDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc2F0by93ZWJraXQvd2Via2l0Z3RrXzIuMzYuNS5iYgor
KysgYi9tZXRhL3JlY2lwZXMtc2F0by93ZWJraXQvd2Via2l0Z3RrXzIuMzYuNi5iYgpAQCAtMTcs
NyArMTcsNyBAQCBTUkNfVVJJID0gImh0dHBzOi8vd3d3LndlYmtpdGd0ay5vcmcvcmVsZWFzZXMv
JHtCUE59LSR7UFZ9LnRhci54eiBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLVdoZW4tYnVpbGRp
bmctaW50cm9zcGVjdGlvbi1maWxlcy1kby1ub3QtcXVvdGUtQ0ZMQUcucGF0Y2ggXAogICAgICAg
ICAgICAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJkNTUzMmZhODg0Yzk0M2RjNDhmMTkxMTQ3
M2RkNjYzYWJhNDA3YTNiMzVjYWE3YjA0YmFjMTQxOWI0MWU1OTA4IgorU1JDX1VSSVtzaGEyNTZz
dW1dID0gIjExOTNiYzgyMTk0NjMzNjc3NmYwZGZhNWUwZGNhNTY1MWYxZTU3MTU3ZWRhMTJkYTQ3
MjFkMjQ0MWYyNGE2MWEiCiAKIGluaGVyaXQgY21ha2UgcGtnY29uZmlnIGdvYmplY3QtaW50cm9z
cGVjdGlvbiBwZXJsbmF0aXZlIGZlYXR1cmVzX2NoZWNrIHVwc3RyZWFtLXZlcnNpb24taXMtZXZl
biBndGstZG9jCiAKLS0gCjIuMzEuMQoK

--===============8923599788365400625==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 884 .bb files complete (0 cached, 884 parsed). 1658 targets, 63 skipped, 0 masked, 0 errors.
Removing 2 recipes from the mips32r2 sysroot...done.
Removing 2 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-2695f9335279b47f8a91bf42762cef21d9ef1309"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:2695f9335279b47f8a91bf42762cef21d9ef1309"
workspace            = "master:21cfb871f7da604f1fab957d7747cb03b113b971"

Initialising tasks...done.
Sstate summary: Wanted 39 Local 28 Mirrors 0 Missed 11 Current 653 (71% match, 98% complete)
Removing 3 stale sstate objects for arch qemumips...done.
NOTE: Executing Tasks
NOTE: Running setscene task 660 of 692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 661 of 692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 666 of 692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 667 of 692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 670 of 692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 671 of 692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libwebp-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libwebp-1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.50.8-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.50.8-r0: task do_populate_sysroot_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/libwebp/1.2.3-r0/temp/log.do_packagedata_setscene.2407075
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/libjpeg-turbo/1_2.1.3-r0/temp/log.do_packagedata_setscene.2407074
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libwebp-1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pango-1.50.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1490 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/pango/1.50.8-r0/temp/log.do_packagedata_setscene.2407072
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.8.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 687 of 692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_package_setscene)
NOTE: Running setscene task 688 of 692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.8.bb:do_package_setscene)
NOTE: Running setscene task 689 of 692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.3.bb:do_package_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_package_setscene: Started
NOTE: recipe libwebp-1.2.3-r0: task do_package_setscene: Started
NOTE: recipe pango-1.50.8-r0: task do_package_setscene: Started
NOTE: Running task 2026 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb:do_fetch)
NOTE: Running task 2267 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm)
NOTE: recipe webkitgtk-2.36.6-r0: task do_fetch: Started
NOTE: recipe webkitgtk-2.36.6-r0: task do_fetch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_package_setscene: Succeeded
NOTE: recipe libwebp-1.2.3-r0: task do_package_setscene: Succeeded
NOTE: Running task 2288 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_packagedata)
NOTE: Running task 2292 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb:do_unpack)
NOTE: Running task 2300 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.3.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2301 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2302 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe shared-mime-info-2.2-r0: task do_package_write_rpm: Started
NOTE: recipe pango-1.50.8-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_packagedata: Started
NOTE: recipe webkitgtk-2.36.6-r0: task do_unpack: Started
NOTE: recipe libwebp-1.2.3-r0: task do_packagedata: Started
NOTE: Running task 2321 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.8.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe pango-1.50.8-r0: task do_packagedata: Started
NOTE: recipe libwebp-1.2.3-r0: task do_packagedata: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_packagedata: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to be4cb8cf09fe64e465949cb85d4e858a49af365a03b0f354f3f51eda5e853e74
NOTE: Running task 2358 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.50.8-r0: task do_packagedata: Succeeded
NOTE: recipe webkitgtk-2.36.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2361 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 849690b83bb9cf470e2829a23f6e2f8d310b3c0851d9d328dc000e65291266ec
NOTE: recipe webkitgtk-2.36.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe webkitgtk-2.36.6-r0: task do_unpack: Succeeded
NOTE: Running task 2374 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb:do_patch)
NOTE: recipe webkitgtk-2.36.6-r0: task do_patch: Started
NOTE: recipe webkitgtk-2.36.6-r0: task do_patch: Succeeded
NOTE: Running task 2375 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 2376 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb:do_generate_toolchain_file)
NOTE: Running task 2377 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb:do_populate_lic)
NOTE: recipe webkitgtk-2.36.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe webkitgtk-2.36.6-r0: task do_generate_toolchain_file: Started
NOTE: recipe webkitgtk-2.36.6-r0: task do_populate_lic: Started
NOTE: recipe webkitgtk-2.36.6-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe webkitgtk-2.36.6-r0: task do_populate_lic: Succeeded
NOTE: recipe webkitgtk-2.36.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb:do_populate_lic unihash changed to 6ec94dda021471146cd47c185d5902f030d9203d7a27193fd8926cd31e6319da
NOTE: Running task 2378 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb:do_configure)
NOTE: recipe webkitgtk-2.36.6-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe webkitgtk-2.36.6-r0: task do_configure: Succeeded
NOTE: Running task 2379 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb:do_compile)
NOTE: recipe webkitgtk-2.36.6-r0: task do_compile: Started
Bitbake still alive (no events for 600s). Active tasks:
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb:do_compile
Bitbake still alive (no events for 1200s). Active tasks:
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb:do_compile
NOTE: recipe webkitgtk-2.36.6-r0: task do_compile: Succeeded
NOTE: Running task 2380 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb:do_install)
NOTE: recipe webkitgtk-2.36.6-r0: task do_install: Started
NOTE: recipe webkitgtk-2.36.6-r0: task do_install: Succeeded
NOTE: Running task 2381 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb:do_package)
NOTE: Running task 2382 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb:do_populate_sysroot)
NOTE: recipe webkitgtk-2.36.6-r0: task do_package: Started
NOTE: recipe webkitgtk-2.36.6-r0: task do_populate_sysroot: Started
NOTE: recipe webkitgtk-2.36.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe webkitgtk-2.36.6-r0: task do_package: Succeeded
NOTE: Running task 2383 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb:do_packagedata)
NOTE: recipe webkitgtk-2.36.6-r0: task do_packagedata: Started
NOTE: recipe webkitgtk-2.36.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2384 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb:do_package_write_rpm)
NOTE: Running task 2385 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb:do_package_qa)
NOTE: recipe webkitgtk-2.36.6-r0: task do_package_write_rpm: Started
NOTE: recipe webkitgtk-2.36.6-r0: task do_package_qa: Started
NOTE: recipe webkitgtk-2.36.6-r0: task do_package_qa: Succeeded
NOTE: recipe webkitgtk-2.36.6-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2386 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb:do_build)
NOTE: Tasks Summary: Attempted 2386 tasks of which 2362 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 29 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: libjpeg-turbo-1_2.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package libjpeg-turbo-src went backwards which would break package feeds (from 1:2.1.4-r0 to 1:2.1.3-r0) [version-going-backwards]
ERROR: libwebp-1.2.3-r0 do_packagedata_setscene: QA Issue: Package version for package libwebp-src went backwards which would break package feeds (from 0:1.2.4-r0 to 0:1.2.3-r0) [version-going-backwards]
ERROR: libjpeg-turbo-1_2.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package libjpeg-turbo-dbg went backwards which would break package feeds (from 1:2.1.4-r0 to 1:2.1.3-r0) [version-going-backwards]
ERROR: libwebp-1.2.3-r0 do_packagedata_setscene: QA Issue: Package version for package libwebp-dbg went backwards which would break package feeds (from 0:1.2.4-r0 to 0:1.2.3-r0) [version-going-backwards]
ERROR: libjpeg-turbo-1_2.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package jpeg-tools went backwards which would break package feeds (from 1:2.1.4-r0 to 1:2.1.3-r0) [version-going-backwards]
ERROR: libwebp-1.2.3-r0 do_packagedata_setscene: QA Issue: Package version for package libwebp-gif2webp went backwards which would break package feeds (from 0:1.2.4-r0 to 0:1.2.3-r0) [version-going-backwards]
ERROR: libjpeg-turbo-1_2.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package libturbojpeg went backwards which would break package feeds (from 1:2.1.4-r0 to 1:2.1.3-r0) [version-going-backwards]
ERROR: pango-1.50.8-r0 do_packagedata_setscene: QA Issue: Package version for package pango-src went backwards which would break package feeds (from 0:1.50.9-r0 to 0:1.50.8-r0) [version-going-backwards]
ERROR: libwebp-1.2.3-r0 do_packagedata_setscene: QA Issue: Package version for package libwebp-staticdev went backwards which would break package feeds (from 0:1.2.4-r0 to 0:1.2.3-r0) [version-going-backwards]
ERROR: libjpeg-turbo-1_2.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package libjpeg-turbo-staticdev went backwards which would break package feeds (from 1:2.1.4-r0 to 1:2.1.3-r0) [version-going-backwards]
ERROR: libwebp-1.2.3-r0 do_packagedata_setscene: QA Issue: Package version for package libwebp-dev went backwards which would break package feeds (from 0:1.2.4-r0 to 0:1.2.3-r0) [version-going-backwards]
ERROR: pango-1.50.8-r0 do_packagedata_setscene: QA Issue: Package version for package pango-dbg went backwards which would break package feeds (from 0:1.50.9-r0 to 0:1.50.8-r0) [version-going-backwards]
ERROR: libjpeg-turbo-1_2.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package libjpeg-turbo-dev went backwards which would break package feeds (from 1:2.1.4-r0 to 1:2.1.3-r0) [version-going-backwards]
ERROR: libwebp-1.2.3-r0 do_packagedata_setscene: QA Issue: Package version for package libwebp-doc went backwards which would break package feeds (from 0:1.2.4-r0 to 0:1.2.3-r0) [version-going-backwards]
ERROR: libjpeg-turbo-1_2.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package libjpeg-turbo-doc went backwards which would break package feeds (from 1:2.1.4-r0 to 1:2.1.3-r0) [version-going-backwards]
ERROR: libwebp-1.2.3-r0 do_packagedata_setscene: QA Issue: Package version for package libwebp-locale went backwards which would break package feeds (from 0:1.2.4-r0 to 0:1.2.3-r0) [version-going-backwards]
ERROR: pango-1.50.8-r0 do_packagedata_setscene: QA Issue: Package version for package pango-ptest went backwards which would break package feeds (from 0:1.50.9-r0 to 0:1.50.8-r0) [version-going-backwards]
ERROR: libjpeg-turbo-1_2.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package libjpeg-turbo-locale went backwards which would break package feeds (from 1:2.1.4-r0 to 1:2.1.3-r0) [version-going-backwards]
ERROR: libwebp-1.2.3-r0 do_packagedata_setscene: QA Issue: Package version for package libwebp-bin went backwards which would break package feeds (from 0:1.2.4-r0 to 0:1.2.3-r0) [version-going-backwards]
ERROR: libwebp-1.2.3-r0 do_packagedata_setscene: QA Issue: Package version for package libwebp went backwards which would break package feeds (from 0:1.2.4-r0 to 0:1.2.3-r0) [version-going-backwards]
ERROR: libjpeg-turbo-1_2.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package libjpeg-turbo went backwards which would break package feeds (from 1:2.1.4-r0 to 1:2.1.3-r0) [version-going-backwards]
ERROR: libwebp-1.2.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: libjpeg-turbo-1_2.1.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: pango-1.50.8-r0 do_packagedata_setscene: QA Issue: Package version for package pango-staticdev went backwards which would break package feeds (from 0:1.50.9-r0 to 0:1.50.8-r0) [version-going-backwards]
ERROR: pango-1.50.8-r0 do_packagedata_setscene: QA Issue: Package version for package pango-dev went backwards which would break package feeds (from 0:1.50.9-r0 to 0:1.50.8-r0) [version-going-backwards]
ERROR: pango-1.50.8-r0 do_packagedata_setscene: QA Issue: Package version for package pango-doc went backwards which would break package feeds (from 0:1.50.9-r0 to 0:1.50.8-r0) [version-going-backwards]
ERROR: pango-1.50.8-r0 do_packagedata_setscene: QA Issue: Package version for package pango-locale went backwards which would break package feeds (from 0:1.50.9-r0 to 0:1.50.8-r0) [version-going-backwards]
ERROR: pango-1.50.8-r0 do_packagedata_setscene: QA Issue: Package version for package pango went backwards which would break package feeds (from 0:1.50.9-r0 to 0:1.50.8-r0) [version-going-backwards]
ERROR: pango-1.50.8-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8923599788365400625==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 884 .bb files complete (0 cached, 884 parsed). 1658 targets, 53 skipped, 0 masked, 0 errors.
Removing 2 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 2 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-2695f9335279b47f8a91bf42762cef21d9ef1309"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:2695f9335279b47f8a91bf42762cef21d9ef1309"
workspace            = "master:21cfb871f7da604f1fab957d7747cb03b113b971"

Initialising tasks...done.
Sstate summary: Wanted 38 Local 27 Mirrors 0 Missed 11 Current 664 (71% match, 98% complete)
Removing 3 stale sstate objects for arch qemuarm...done.
NOTE: Executing Tasks
NOTE: Running setscene task 672 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 673 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 678 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 679 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 682 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 683 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libwebp-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libwebp-1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.50.8-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.50.8-r0: task do_populate_sysroot_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/libjpeg-turbo/1_2.1.3-r0/temp/log.do_packagedata_setscene.2129007
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 697 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_package_setscene)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/libwebp/1.2.3-r0/temp/log.do_packagedata_setscene.2129008
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/pango/1.50.8-r0/temp/log.do_packagedata_setscene.2129005
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.8.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe libwebp-1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pango-1.50.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 698 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.8.bb:do_package_setscene)
NOTE: Running setscene task 699 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.3.bb:do_package_setscene)
NOTE: Running task 1501 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_package_setscene: Started
NOTE: recipe libwebp-1.2.3-r0: task do_package_setscene: Started
NOTE: recipe pango-1.50.8-r0: task do_package_setscene: Started
NOTE: Running task 2042 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb:do_fetch)
NOTE: Running task 2303 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm)
NOTE: recipe webkitgtk-2.36.6-r0: task do_fetch: Started
NOTE: recipe webkitgtk-2.36.6-r0: task do_fetch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_package_setscene: Succeeded
NOTE: recipe libwebp-1.2.3-r0: task do_package_setscene: Succeeded
NOTE: Running task 2323 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_packagedata)
NOTE: Running task 2327 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb:do_unpack)
NOTE: Running task 2335 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.3.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2337 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2338 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe pango-1.50.8-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2357 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.8.bb:do_packagedata)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_packagedata: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_package_write_rpm: Started
NOTE: recipe webkitgtk-2.36.6-r0: task do_unpack: Started
NOTE: recipe libwebp-1.2.3-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe pango-1.50.8-r0: task do_packagedata: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_packagedata: Succeeded
NOTE: recipe libwebp-1.2.3-r0: task do_packagedata: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to e532e40efa2a2b093967c5a7f8cc10f8129e9bdb256d587ed58d301784de348f
NOTE: Running task 2394 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.50.8-r0: task do_packagedata: Succeeded
NOTE: recipe webkitgtk-2.36.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2397 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 3735d35a9b9f7da5e0e62f4f1954a369d2e20430700596df4a230b148c894737
NOTE: recipe webkitgtk-2.36.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe webkitgtk-2.36.6-r0: task do_unpack: Succeeded
NOTE: Running task 2410 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb:do_patch)
NOTE: recipe webkitgtk-2.36.6-r0: task do_patch: Started
NOTE: recipe webkitgtk-2.36.6-r0: task do_patch: Succeeded
NOTE: Running task 2411 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 2412 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb:do_generate_toolchain_file)
NOTE: Running task 2413 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb:do_populate_lic)
NOTE: recipe webkitgtk-2.36.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe webkitgtk-2.36.6-r0: task do_generate_toolchain_file: Started
NOTE: recipe webkitgtk-2.36.6-r0: task do_populate_lic: Started
NOTE: recipe webkitgtk-2.36.6-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe webkitgtk-2.36.6-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb:do_populate_lic unihash changed to 6ec94dda021471146cd47c185d5902f030d9203d7a27193fd8926cd31e6319da
NOTE: recipe webkitgtk-2.36.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2414 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb:do_configure)
NOTE: recipe webkitgtk-2.36.6-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe webkitgtk-2.36.6-r0: task do_configure: Succeeded
NOTE: Running task 2415 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb:do_compile)
NOTE: recipe webkitgtk-2.36.6-r0: task do_compile: Started
Bitbake still alive (no events for 600s). Active tasks:
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb:do_compile
Bitbake still alive (no events for 1200s). Active tasks:
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb:do_compile
NOTE: recipe webkitgtk-2.36.6-r0: task do_compile: Succeeded
NOTE: Running task 2416 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb:do_install)
NOTE: recipe webkitgtk-2.36.6-r0: task do_install: Started
NOTE: recipe webkitgtk-2.36.6-r0: task do_install: Succeeded
NOTE: Running task 2417 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb:do_package)
NOTE: Running task 2418 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb:do_populate_sysroot)
NOTE: recipe webkitgtk-2.36.6-r0: task do_package: Started
NOTE: recipe webkitgtk-2.36.6-r0: task do_populate_sysroot: Started
NOTE: recipe webkitgtk-2.36.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe webkitgtk-2.36.6-r0: task do_package: Succeeded
NOTE: Running task 2419 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb:do_packagedata)
NOTE: recipe webkitgtk-2.36.6-r0: task do_packagedata: Started
NOTE: recipe webkitgtk-2.36.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2420 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb:do_package_write_rpm)
NOTE: Running task 2421 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb:do_package_qa)
NOTE: recipe webkitgtk-2.36.6-r0: task do_package_write_rpm: Started
NOTE: recipe webkitgtk-2.36.6-r0: task do_package_qa: Started
NOTE: recipe webkitgtk-2.36.6-r0: task do_package_qa: Succeeded
NOTE: recipe webkitgtk-2.36.6-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2422 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb:do_build)
NOTE: Tasks Summary: Attempted 2422 tasks of which 2398 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 29 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: libjpeg-turbo-1_2.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package libjpeg-turbo-src went backwards which would break package feeds (from 1:2.1.4-r0 to 1:2.1.3-r0) [version-going-backwards]
ERROR: libjpeg-turbo-1_2.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package libjpeg-turbo-dbg went backwards which would break package feeds (from 1:2.1.4-r0 to 1:2.1.3-r0) [version-going-backwards]
ERROR: libwebp-1.2.3-r0 do_packagedata_setscene: QA Issue: Package version for package libwebp-src went backwards which would break package feeds (from 0:1.2.4-r0 to 0:1.2.3-r0) [version-going-backwards]
ERROR: libjpeg-turbo-1_2.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package jpeg-tools went backwards which would break package feeds (from 1:2.1.4-r0 to 1:2.1.3-r0) [version-going-backwards]
ERROR: libwebp-1.2.3-r0 do_packagedata_setscene: QA Issue: Package version for package libwebp-dbg went backwards which would break package feeds (from 0:1.2.4-r0 to 0:1.2.3-r0) [version-going-backwards]
ERROR: pango-1.50.8-r0 do_packagedata_setscene: QA Issue: Package version for package pango-src went backwards which would break package feeds (from 0:1.50.9-r0 to 0:1.50.8-r0) [version-going-backwards]
ERROR: libjpeg-turbo-1_2.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package libturbojpeg went backwards which would break package feeds (from 1:2.1.4-r0 to 1:2.1.3-r0) [version-going-backwards]
ERROR: libwebp-1.2.3-r0 do_packagedata_setscene: QA Issue: Package version for package libwebp-gif2webp went backwards which would break package feeds (from 0:1.2.4-r0 to 0:1.2.3-r0) [version-going-backwards]
ERROR: pango-1.50.8-r0 do_packagedata_setscene: QA Issue: Package version for package pango-dbg went backwards which would break package feeds (from 0:1.50.9-r0 to 0:1.50.8-r0) [version-going-backwards]
ERROR: libjpeg-turbo-1_2.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package libjpeg-turbo-staticdev went backwards which would break package feeds (from 1:2.1.4-r0 to 1:2.1.3-r0) [version-going-backwards]
ERROR: libwebp-1.2.3-r0 do_packagedata_setscene: QA Issue: Package version for package libwebp-staticdev went backwards which would break package feeds (from 0:1.2.4-r0 to 0:1.2.3-r0) [version-going-backwards]
ERROR: pango-1.50.8-r0 do_packagedata_setscene: QA Issue: Package version for package pango-ptest went backwards which would break package feeds (from 0:1.50.9-r0 to 0:1.50.8-r0) [version-going-backwards]
ERROR: libjpeg-turbo-1_2.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package libjpeg-turbo-dev went backwards which would break package feeds (from 1:2.1.4-r0 to 1:2.1.3-r0) [version-going-backwards]
ERROR: libwebp-1.2.3-r0 do_packagedata_setscene: QA Issue: Package version for package libwebp-dev went backwards which would break package feeds (from 0:1.2.4-r0 to 0:1.2.3-r0) [version-going-backwards]
ERROR: pango-1.50.8-r0 do_packagedata_setscene: QA Issue: Package version for package pango-staticdev went backwards which would break package feeds (from 0:1.50.9-r0 to 0:1.50.8-r0) [version-going-backwards]
ERROR: libjpeg-turbo-1_2.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package libjpeg-turbo-doc went backwards which would break package feeds (from 1:2.1.4-r0 to 1:2.1.3-r0) [version-going-backwards]
ERROR: libwebp-1.2.3-r0 do_packagedata_setscene: QA Issue: Package version for package libwebp-doc went backwards which would break package feeds (from 0:1.2.4-r0 to 0:1.2.3-r0) [version-going-backwards]
ERROR: pango-1.50.8-r0 do_packagedata_setscene: QA Issue: Package version for package pango-dev went backwards which would break package feeds (from 0:1.50.9-r0 to 0:1.50.8-r0) [version-going-backwards]
ERROR: libjpeg-turbo-1_2.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package libjpeg-turbo-locale went backwards which would break package feeds (from 1:2.1.4-r0 to 1:2.1.3-r0) [version-going-backwards]
ERROR: libwebp-1.2.3-r0 do_packagedata_setscene: QA Issue: Package version for package libwebp-locale went backwards which would break package feeds (from 0:1.2.4-r0 to 0:1.2.3-r0) [version-going-backwards]
ERROR: pango-1.50.8-r0 do_packagedata_setscene: QA Issue: Package version for package pango-doc went backwards which would break package feeds (from 0:1.50.9-r0 to 0:1.50.8-r0) [version-going-backwards]
ERROR: libjpeg-turbo-1_2.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package libjpeg-turbo went backwards which would break package feeds (from 1:2.1.4-r0 to 1:2.1.3-r0) [version-going-backwards]
ERROR: libwebp-1.2.3-r0 do_packagedata_setscene: QA Issue: Package version for package libwebp-bin went backwards which would break package feeds (from 0:1.2.4-r0 to 0:1.2.3-r0) [version-going-backwards]
ERROR: libjpeg-turbo-1_2.1.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: pango-1.50.8-r0 do_packagedata_setscene: QA Issue: Package version for package pango-locale went backwards which would break package feeds (from 0:1.50.9-r0 to 0:1.50.8-r0) [version-going-backwards]
ERROR: libwebp-1.2.3-r0 do_packagedata_setscene: QA Issue: Package version for package libwebp went backwards which would break package feeds (from 0:1.2.4-r0 to 0:1.2.3-r0) [version-going-backwards]
ERROR: pango-1.50.8-r0 do_packagedata_setscene: QA Issue: Package version for package pango went backwards which would break package feeds (from 0:1.50.9-r0 to 0:1.50.8-r0) [version-going-backwards]
ERROR: libwebp-1.2.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: pango-1.50.8-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8923599788365400625==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 884 .bb files complete (0 cached, 884 parsed). 1659 targets, 49 skipped, 0 masked, 0 errors.
Removing 113 recipes from the core2-32 sysroot...done.
Removing 113 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-2695f9335279b47f8a91bf42762cef21d9ef1309"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:2695f9335279b47f8a91bf42762cef21d9ef1309"
workspace            = "master:21cfb871f7da604f1fab957d7747cb03b113b971"

Initialising tasks...done.
Sstate summary: Wanted 462 Local 451 Mirrors 0 Missed 11 Current 219 (97% match, 98% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 220 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.52.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 221 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 226 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.34.bb:do_packagedata_setscene)
NOTE: Running setscene task 227 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 228 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 229 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 230 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 231 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 234 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.34.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 235 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 236 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 237 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 238 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 239 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 241 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 242 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 243 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 244 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 245 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 246 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 247 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 248 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 249 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.35.bb:do_packagedata_setscene)
NOTE: Running setscene task 250 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.35.bb:do_populate_sysroot_setscene)
NOTE: Running task 935 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb:do_fetch)
NOTE: recipe base-passwd-3.5.52-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk+3-3.24.34-r0: task do_packagedata_setscene: Started
NOTE: recipe libnotify-0.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libsecret-0.20.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libwebp-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libnotify-0.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk+3-3.24.34-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libwebp-1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsecret-0.20.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_packagedata_setscene: Started
NOTE: recipe enchant2-2.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe enchant2-2.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtasn1-4.18.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxslt-1.1.35-r0: task do_packagedata_setscene: Started
NOTE: recipe webkitgtk-2.36.6-r0: task do_fetch: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxslt-1.1.35-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe webkitgtk-2.36.6-r0: task do_fetch: Succeeded
NOTE: Running task 992 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb:do_unpack)
NOTE: recipe base-passwd-3.5.52-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwebp/1.2.3-r0/temp/log.do_packagedata_setscene.266140
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 259 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.3.bb:do_package_setscene)
NOTE: recipe libnotify-0.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe enchant2-2.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnotify-0.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtasn1-4.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libwebp-1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe webkitgtk-2.36.6-r0: task do_unpack: Started
NOTE: recipe libxslt-1.1.35-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsecret-0.20.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtasn1-4.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe enchant2-2.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gtk+3-3.24.34-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxslt-1.1.35-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsecret-0.20.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 265 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 266 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 270 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 271 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 274 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 275 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 279 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 280 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 284 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 285 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_populate_sysroot_setscene)
NOTE: recipe vala-0.56.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vala-0.56.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libwpe-1.12.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libwpe-1.12.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe aspell-0.60.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe aspell-0.60.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 288 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_packagedata_setscene)
NOTE: Running setscene task 289 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 290 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 291 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 292 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 293 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 295 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 296 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 297 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 298 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 299 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 300 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libpsl-0.21.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk+3-3.24.34-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 302 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 303 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 305 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 306 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 307 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 308 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 309 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 310 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 311 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 312 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 313 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 314 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_populate_sysroot_setscene)
NOTE: recipe vala-0.56.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libwpe-1.12.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe orc-0.4.32-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxv-1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libxv-1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 317 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpsl-0.21.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.50.8-r0: task do_packagedata_setscene: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pango-1.50.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 320 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.65.bb:do_packagedata_setscene)
NOTE: Running setscene task 321 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.65.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 323 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 324 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_populate_sysroot_setscene)
NOTE: recipe orc-0.4.32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libwpe-1.12.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vala-0.56.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 326 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libpsl-0.21.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe aspell-0.60.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.65-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.65-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgpg-error-1.45-r0: task do_packagedata_setscene: Started
NOTE: recipe libxv-1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 338 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata_setscene)
NOTE: recipe libepoxy-1.5.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbcommon-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 342 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/pango/1.50.8-r0/temp/log.do_packagedata_setscene.272647
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.8.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 345 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.8.bb:do_package_setscene)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbcommon-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 351 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 352 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.65-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 354 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_packagedata_setscene)
NOTE: recipe pango-1.50.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.65-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 360 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 361 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libgpg-error-1.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe at-spi2-core-2.44.1-r0: task do_packagedata_setscene: Started
NOTE: recipe atk-2.38.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.36-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 363 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_populate_sysroot_setscene)
NOTE: recipe libgpg-error-1.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe atk-2.38.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe at-spi2-core-2.44.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.36-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libwebp-1.2.3-r0: task do_package_setscene: Started
NOTE: recipe pango-1.50.8-r0: task do_package_setscene: Started
NOTE: recipe atk-2.38.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe at-spi2-core-2.44.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.36-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.36-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 372 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 373 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 374 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 375 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot_setscene)
NOTE: recipe at-spi2-core-2.44.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 381 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 382 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 383 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 384 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libwebp-1.2.3-r0: task do_package_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.14.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.14.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe atk-2.38.0-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libjpeg-turbo/1_2.1.3-r0/temp/log.do_packagedata_setscene.278692
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 387 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_package_setscene)
NOTE: recipe pango-1.50.8-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 390 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 391 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 393 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 394 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 395 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 396 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 398 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_packagedata_setscene)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_package_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.14.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 402 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.52.bb:do_packagedata_setscene)
NOTE: Running setscene task 403 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 404 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.11.1.bb:do_packagedata_setscene)
NOTE: recipe harfbuzz-5.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-5.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxi-1_1.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 405 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_populate_sysroot_setscene)
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.5.52-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.11.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxi-1_1.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-5.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.14.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 408 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 410 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 411 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.11.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 413 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 414 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 415 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_71.1.bb:do_packagedata_setscene)
NOTE: recipe libxft-1_2.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe harfbuzz-5.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxft-1_2.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 418 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 419 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 423 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_71.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 424 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.5.52-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.11.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_package_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe icu-71.1-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-71.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1204 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe shared-mime-info-2.2-r0: task do_package_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Started
NOTE: Running setscene task 432 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 433 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 434 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 435 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.11.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.11.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 440 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 441 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 1211 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1216 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe icu-71.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe webkitgtk-2.36.6-r0: task do_unpack: Succeeded
NOTE: recipe fontconfig-2.14.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: Running task 1225 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb:do_patch)
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-2_22.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running setscene task 444 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 445 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 446 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 447 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe icu-71.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe webkitgtk-2.36.6-r0: task do_patch: Started
NOTE: recipe fontconfig-2.14.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.14.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 451 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_packagedata_setscene)
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_22.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 453 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata_setscene)
NOTE: recipe freetype-2.12.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Succeeded
NOTE: Running task 1239 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe freetype-2.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 458 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_22.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 461 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.112.bb:do_packagedata_setscene)
NOTE: Running setscene task 462 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 463 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 464 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 465 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 466 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_packagedata_setscene)
NOTE: recipe fontconfig-2.14.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_patch: Started
NOTE: Running setscene task 468 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 469 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.112-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_22.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 472 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.112.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 474 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 475 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 476 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 477 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 478 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.21.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_patch: Succeeded
NOTE: recipe freetype-2.12.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1263 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe libdrm-2.4.112-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.21.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 480 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe shared-mime-info-2.2-r0: task do_package_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_configure: Started
NOTE: Running setscene task 484 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 485 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 486 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 487 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libdrm-2.4.112-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 489 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.21.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 491 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 492 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_packagedata_setscene)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_configure: Succeeded
NOTE: recipe freetype-2.12.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.72.3-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 495 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1269 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe libdrm-2.4.112-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.72.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 498 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 499 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.9.14-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 500 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 503 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 505 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_compile: Started
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe webkitgtk-2.36.6-r0: task do_patch: Succeeded
NOTE: recipe expat-2.4.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_compile: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1304 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 1305 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb:do_generate_toolchain_file)
NOTE: Running task 1306 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb:do_populate_lic)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 510 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 511 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_packagedata_setscene)
NOTE: Running task 1307 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.9.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.9.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 515 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.6.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.72.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe webkitgtk-2.36.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe webkitgtk-2.36.6-r0: task do_populate_lic: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe webkitgtk-2.36.6-r0: task do_generate_toolchain_file: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.4.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 519 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 521 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_populate_sysroot_setscene)
NOTE: recipe webkitgtk-2.36.6-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.10.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.9.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 525 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 527 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_packagedata_setscene)
NOTE: recipe webkitgtk-2.36.6-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb:do_populate_lic unihash changed to 6ec94dda021471146cd47c185d5902f030d9203d7a27193fd8926cd31e6319da
NOTE: recipe webkitgtk-2.36.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libx11-1_1.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.72.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 530 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 531 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 532 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 533 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.10.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 535 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1346 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libx11-1_1.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 538 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 539 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: recipe python3-3.10.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 541 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 542 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 543 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 544 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 545 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 546 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 547 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.2.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 549 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 552 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 553 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.39.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.10.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 554 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 555 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 557 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 558 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 559 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 560 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 561 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 562 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 566 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.39.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 569 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 570 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 571 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 572 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.39.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 578 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 579 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 581 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 582 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 585 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.39.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 598 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 599 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata_setscene)
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 601 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_packagedata_setscene)
NOTE: Running setscene task 602 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 603 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 604 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 606 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 607 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 608 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 609 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 610 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 611 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2022.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 615 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 616 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot_setscene)
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2022.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2022.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 625 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 628 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2022.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 636 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 637 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 638 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 639 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.7.bb:do_populate_sysroot_setscene)
NOTE: recipe cracklib-2.9.7-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cracklib-2.9.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 644 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 645 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1468 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe zlib-1.2.12-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe zlib-1.2.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 650 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.1.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 652 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 5ddcd49de2bed44a88d1af86f77e157ee58fc43beebc24062c9d4b94e0ef08b5
NOTE: recipe gcc-runtime-12.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 654 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.1.bb:do_packagedata_setscene)
NOTE: recipe libgcc-12.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 656 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 658 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 659 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 662 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 663 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 664 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 666 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 667 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 675 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 678 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 679 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.38.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1936 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2120 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: Running task 2239 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.8.bb:do_packagedata)
NOTE: Running task 2293 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.3.bb:do_packagedata)
NOTE: Running task 2298 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_packagedata: Started
NOTE: recipe pango-1.50.8-r0: task do_packagedata: Started
NOTE: recipe libwebp-1.2.3-r0: task do_packagedata: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_package_write_rpm: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_packagedata: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to df85ca6206639b1a6965d10f8f76c14bed93d0acc0584260826bcbf214e7e341
NOTE: Running task 2335 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.50.8-r0: task do_packagedata: Succeeded
NOTE: recipe libwebp-1.2.3-r0: task do_packagedata: Succeeded
NOTE: recipe webkitgtk-2.36.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe webkitgtk-2.36.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2343 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb:do_configure)
NOTE: recipe webkitgtk-2.36.6-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe webkitgtk-2.36.6-r0: task do_configure: Succeeded
NOTE: Running task 2344 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb:do_compile)
NOTE: recipe webkitgtk-2.36.6-r0: task do_compile: Started
Bitbake still alive (no events for 600s). Active tasks:
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb:do_compile
Bitbake still alive (no events for 1200s). Active tasks:
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb:do_compile
NOTE: recipe webkitgtk-2.36.6-r0: task do_compile: Succeeded
NOTE: Running task 2345 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb:do_install)
NOTE: recipe webkitgtk-2.36.6-r0: task do_install: Started
NOTE: recipe webkitgtk-2.36.6-r0: task do_install: Succeeded
NOTE: Running task 2346 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb:do_package)
NOTE: Running task 2347 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb:do_populate_sysroot)
NOTE: recipe webkitgtk-2.36.6-r0: task do_package: Started
NOTE: recipe webkitgtk-2.36.6-r0: task do_populate_sysroot: Started
NOTE: recipe webkitgtk-2.36.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe webkitgtk-2.36.6-r0: task do_package: Succeeded
NOTE: Running task 2348 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb:do_packagedata)
NOTE: recipe webkitgtk-2.36.6-r0: task do_packagedata: Started
NOTE: recipe webkitgtk-2.36.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2349 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb:do_package_write_rpm)
NOTE: Running task 2350 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb:do_package_qa)
NOTE: recipe webkitgtk-2.36.6-r0: task do_package_write_rpm: Started
NOTE: recipe webkitgtk-2.36.6-r0: task do_package_qa: Started
NOTE: recipe webkitgtk-2.36.6-r0: task do_package_qa: Succeeded
NOTE: recipe webkitgtk-2.36.6-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2351 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb:do_build)
NOTE: Tasks Summary: Attempted 2351 tasks of which 2321 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: There was 1 WARNING message.
Summary: There were 29 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: libwebp-1.2.3-r0 do_packagedata_setscene: QA Issue: Package version for package libwebp-src went backwards which would break package feeds (from 0:1.2.4-r0 to 0:1.2.3-r0) [version-going-backwards]
ERROR: libwebp-1.2.3-r0 do_packagedata_setscene: QA Issue: Package version for package libwebp-dbg went backwards which would break package feeds (from 0:1.2.4-r0 to 0:1.2.3-r0) [version-going-backwards]
ERROR: libwebp-1.2.3-r0 do_packagedata_setscene: QA Issue: Package version for package libwebp-gif2webp went backwards which would break package feeds (from 0:1.2.4-r0 to 0:1.2.3-r0) [version-going-backwards]
ERROR: libwebp-1.2.3-r0 do_packagedata_setscene: QA Issue: Package version for package libwebp-staticdev went backwards which would break package feeds (from 0:1.2.4-r0 to 0:1.2.3-r0) [version-going-backwards]
ERROR: libwebp-1.2.3-r0 do_packagedata_setscene: QA Issue: Package version for package libwebp-dev went backwards which would break package feeds (from 0:1.2.4-r0 to 0:1.2.3-r0) [version-going-backwards]
ERROR: libwebp-1.2.3-r0 do_packagedata_setscene: QA Issue: Package version for package libwebp-doc went backwards which would break package feeds (from 0:1.2.4-r0 to 0:1.2.3-r0) [version-going-backwards]
ERROR: libwebp-1.2.3-r0 do_packagedata_setscene: QA Issue: Package version for package libwebp-locale went backwards which would break package feeds (from 0:1.2.4-r0 to 0:1.2.3-r0) [version-going-backwards]
ERROR: libwebp-1.2.3-r0 do_packagedata_setscene: QA Issue: Package version for package libwebp-bin went backwards which would break package feeds (from 0:1.2.4-r0 to 0:1.2.3-r0) [version-going-backwards]
ERROR: libwebp-1.2.3-r0 do_packagedata_setscene: QA Issue: Package version for package libwebp went backwards which would break package feeds (from 0:1.2.4-r0 to 0:1.2.3-r0) [version-going-backwards]
ERROR: libwebp-1.2.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: pango-1.50.8-r0 do_packagedata_setscene: QA Issue: Package version for package pango-src went backwards which would break package feeds (from 0:1.50.9-r0 to 0:1.50.8-r0) [version-going-backwards]
ERROR: pango-1.50.8-r0 do_packagedata_setscene: QA Issue: Package version for package pango-dbg went backwards which would break package feeds (from 0:1.50.9-r0 to 0:1.50.8-r0) [version-going-backwards]
ERROR: pango-1.50.8-r0 do_packagedata_setscene: QA Issue: Package version for package pango-ptest went backwards which would break package feeds (from 0:1.50.9-r0 to 0:1.50.8-r0) [version-going-backwards]
ERROR: pango-1.50.8-r0 do_packagedata_setscene: QA Issue: Package version for package pango-staticdev went backwards which would break package feeds (from 0:1.50.9-r0 to 0:1.50.8-r0) [version-going-backwards]
ERROR: pango-1.50.8-r0 do_packagedata_setscene: QA Issue: Package version for package pango-dev went backwards which would break package feeds (from 0:1.50.9-r0 to 0:1.50.8-r0) [version-going-backwards]
ERROR: pango-1.50.8-r0 do_packagedata_setscene: QA Issue: Package version for package pango-doc went backwards which would break package feeds (from 0:1.50.9-r0 to 0:1.50.8-r0) [version-going-backwards]
ERROR: pango-1.50.8-r0 do_packagedata_setscene: QA Issue: Package version for package pango-locale went backwards which would break package feeds (from 0:1.50.9-r0 to 0:1.50.8-r0) [version-going-backwards]
ERROR: pango-1.50.8-r0 do_packagedata_setscene: QA Issue: Package version for package pango went backwards which would break package feeds (from 0:1.50.9-r0 to 0:1.50.8-r0) [version-going-backwards]
ERROR: pango-1.50.8-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: libjpeg-turbo-1_2.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package libjpeg-turbo-src went backwards which would break package feeds (from 1:2.1.4-r0 to 1:2.1.3-r0) [version-going-backwards]
ERROR: libjpeg-turbo-1_2.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package libjpeg-turbo-dbg went backwards which would break package feeds (from 1:2.1.4-r0 to 1:2.1.3-r0) [version-going-backwards]
ERROR: libjpeg-turbo-1_2.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package jpeg-tools went backwards which would break package feeds (from 1:2.1.4-r0 to 1:2.1.3-r0) [version-going-backwards]
ERROR: libjpeg-turbo-1_2.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package libturbojpeg went backwards which would break package feeds (from 1:2.1.4-r0 to 1:2.1.3-r0) [version-going-backwards]
ERROR: libjpeg-turbo-1_2.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package libjpeg-turbo-staticdev went backwards which would break package feeds (from 1:2.1.4-r0 to 1:2.1.3-r0) [version-going-backwards]
ERROR: libjpeg-turbo-1_2.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package libjpeg-turbo-dev went backwards which would break package feeds (from 1:2.1.4-r0 to 1:2.1.3-r0) [version-going-backwards]
ERROR: libjpeg-turbo-1_2.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package libjpeg-turbo-doc went backwards which would break package feeds (from 1:2.1.4-r0 to 1:2.1.3-r0) [version-going-backwards]
ERROR: libjpeg-turbo-1_2.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package libjpeg-turbo-locale went backwards which would break package feeds (from 1:2.1.4-r0 to 1:2.1.3-r0) [version-going-backwards]
ERROR: libjpeg-turbo-1_2.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package libjpeg-turbo went backwards which would break package feeds (from 1:2.1.4-r0 to 1:2.1.3-r0) [version-going-backwards]
ERROR: libjpeg-turbo-1_2.1.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8923599788365400625==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1658 entries from dependency cache.
Parsing recipes...done.
Parsing of 884 .bb files complete (883 cached, 1 parsed). 1658 targets, 35 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-2695f9335279b47f8a91bf42762cef21d9ef1309"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:2695f9335279b47f8a91bf42762cef21d9ef1309"
workspace            = "master:21cfb871f7da604f1fab957d7747cb03b113b971"

Initialising tasks...done.
Sstate summary: Wanted 38 Local 27 Mirrors 0 Missed 11 Current 668 (71% match, 98% complete)
Removing 3 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 676 of 706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 677 of 706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 682 of 706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 683 of 706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 686 of 706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 687 of 706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libwebp-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libwebp-1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.50.8-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.50.8-r0: task do_populate_sysroot_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/libwebp/1.2.3-r0/temp/log.do_packagedata_setscene.1730772
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/libjpeg-turbo/1_2.1.3-r0/temp/log.do_packagedata_setscene.1730771
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 701 of 706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_package_setscene)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/pango/1.50.8-r0/temp/log.do_packagedata_setscene.1730769
NOTE: recipe libwebp-1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.8.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pango-1.50.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 702 of 706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.8.bb:do_package_setscene)
NOTE: Running setscene task 703 of 706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.3.bb:do_package_setscene)
NOTE: Running task 1501 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_package_setscene: Started
NOTE: recipe libwebp-1.2.3-r0: task do_package_setscene: Started
NOTE: recipe pango-1.50.8-r0: task do_package_setscene: Started
NOTE: Running task 2060 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb:do_fetch)
NOTE: Running task 2321 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm)
NOTE: recipe webkitgtk-2.36.6-r0: task do_fetch: Started
NOTE: recipe webkitgtk-2.36.6-r0: task do_fetch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_package_setscene: Succeeded
NOTE: recipe libwebp-1.2.3-r0: task do_package_setscene: Succeeded
NOTE: Running task 2340 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_packagedata)
NOTE: Running task 2345 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb:do_unpack)
NOTE: Running task 2353 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.3.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2355 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2356 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe pango-1.50.8-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2375 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.8.bb:do_packagedata)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_packagedata: Started
NOTE: recipe webkitgtk-2.36.6-r0: task do_unpack: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_package_write_rpm: Started
NOTE: recipe libwebp-1.2.3-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe pango-1.50.8-r0: task do_packagedata: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_packagedata: Succeeded
NOTE: recipe libwebp-1.2.3-r0: task do_packagedata: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 5365343150dc50fe952c72cd612e7110a0d055140b9d23d943a2001a2b504164
NOTE: Running task 2412 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.50.8-r0: task do_packagedata: Succeeded
NOTE: recipe webkitgtk-2.36.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2415 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to add29e5edd37b0b074b02dd77704cc94e10f7959a47bad8d44d87d7d4e611154
NOTE: recipe webkitgtk-2.36.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe webkitgtk-2.36.6-r0: task do_unpack: Succeeded
NOTE: Running task 2428 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb:do_patch)
NOTE: recipe webkitgtk-2.36.6-r0: task do_patch: Started
NOTE: recipe webkitgtk-2.36.6-r0: task do_patch: Succeeded
NOTE: Running task 2429 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 2430 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb:do_generate_toolchain_file)
NOTE: Running task 2431 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb:do_populate_lic)
NOTE: recipe webkitgtk-2.36.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe webkitgtk-2.36.6-r0: task do_populate_lic: Started
NOTE: recipe webkitgtk-2.36.6-r0: task do_generate_toolchain_file: Started
NOTE: recipe webkitgtk-2.36.6-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe webkitgtk-2.36.6-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb:do_populate_lic unihash changed to 6ec94dda021471146cd47c185d5902f030d9203d7a27193fd8926cd31e6319da
NOTE: recipe webkitgtk-2.36.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2432 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb:do_configure)
NOTE: recipe webkitgtk-2.36.6-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe webkitgtk-2.36.6-r0: task do_configure: Succeeded
NOTE: Running task 2433 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb:do_compile)
NOTE: recipe webkitgtk-2.36.6-r0: task do_compile: Started
Bitbake still alive (no events for 600s). Active tasks:
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb:do_compile
Bitbake still alive (no events for 1200s). Active tasks:
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb:do_compile
NOTE: recipe webkitgtk-2.36.6-r0: task do_compile: Succeeded
NOTE: Running task 2434 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb:do_install)
NOTE: recipe webkitgtk-2.36.6-r0: task do_install: Started
NOTE: recipe webkitgtk-2.36.6-r0: task do_install: Succeeded
NOTE: Running task 2435 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb:do_package)
NOTE: Running task 2436 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb:do_populate_sysroot)
NOTE: recipe webkitgtk-2.36.6-r0: task do_package: Started
NOTE: recipe webkitgtk-2.36.6-r0: task do_populate_sysroot: Started
NOTE: recipe webkitgtk-2.36.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe webkitgtk-2.36.6-r0: task do_package: Succeeded
NOTE: Running task 2437 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb:do_packagedata)
NOTE: recipe webkitgtk-2.36.6-r0: task do_packagedata: Started
NOTE: recipe webkitgtk-2.36.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2438 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb:do_package_write_rpm)
NOTE: Running task 2439 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb:do_package_qa)
NOTE: recipe webkitgtk-2.36.6-r0: task do_package_write_rpm: Started
NOTE: recipe webkitgtk-2.36.6-r0: task do_package_qa: Started
NOTE: recipe webkitgtk-2.36.6-r0: task do_package_qa: Succeeded
NOTE: recipe webkitgtk-2.36.6-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2440 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb:do_build)
NOTE: Tasks Summary: Attempted 2440 tasks of which 2416 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 29 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: libwebp-1.2.3-r0 do_packagedata_setscene: QA Issue: Package version for package libwebp-src went backwards which would break package feeds (from 0:1.2.4-r0 to 0:1.2.3-r0) [version-going-backwards]
ERROR: libjpeg-turbo-1_2.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package libjpeg-turbo-src went backwards which would break package feeds (from 1:2.1.4-r0 to 1:2.1.3-r0) [version-going-backwards]
ERROR: libwebp-1.2.3-r0 do_packagedata_setscene: QA Issue: Package version for package libwebp-dbg went backwards which would break package feeds (from 0:1.2.4-r0 to 0:1.2.3-r0) [version-going-backwards]
ERROR: libjpeg-turbo-1_2.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package libjpeg-turbo-dbg went backwards which would break package feeds (from 1:2.1.4-r0 to 1:2.1.3-r0) [version-going-backwards]
ERROR: pango-1.50.8-r0 do_packagedata_setscene: QA Issue: Package version for package pango-src went backwards which would break package feeds (from 0:1.50.9-r0 to 0:1.50.8-r0) [version-going-backwards]
ERROR: libwebp-1.2.3-r0 do_packagedata_setscene: QA Issue: Package version for package libwebp-gif2webp went backwards which would break package feeds (from 0:1.2.4-r0 to 0:1.2.3-r0) [version-going-backwards]
ERROR: libjpeg-turbo-1_2.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package jpeg-tools went backwards which would break package feeds (from 1:2.1.4-r0 to 1:2.1.3-r0) [version-going-backwards]
ERROR: libwebp-1.2.3-r0 do_packagedata_setscene: QA Issue: Package version for package libwebp-staticdev went backwards which would break package feeds (from 0:1.2.4-r0 to 0:1.2.3-r0) [version-going-backwards]
ERROR: libjpeg-turbo-1_2.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package libturbojpeg went backwards which would break package feeds (from 1:2.1.4-r0 to 1:2.1.3-r0) [version-going-backwards]
ERROR: pango-1.50.8-r0 do_packagedata_setscene: QA Issue: Package version for package pango-dbg went backwards which would break package feeds (from 0:1.50.9-r0 to 0:1.50.8-r0) [version-going-backwards]
ERROR: libwebp-1.2.3-r0 do_packagedata_setscene: QA Issue: Package version for package libwebp-dev went backwards which would break package feeds (from 0:1.2.4-r0 to 0:1.2.3-r0) [version-going-backwards]
ERROR: libjpeg-turbo-1_2.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package libjpeg-turbo-staticdev went backwards which would break package feeds (from 1:2.1.4-r0 to 1:2.1.3-r0) [version-going-backwards]
ERROR: pango-1.50.8-r0 do_packagedata_setscene: QA Issue: Package version for package pango-ptest went backwards which would break package feeds (from 0:1.50.9-r0 to 0:1.50.8-r0) [version-going-backwards]
ERROR: libwebp-1.2.3-r0 do_packagedata_setscene: QA Issue: Package version for package libwebp-doc went backwards which would break package feeds (from 0:1.2.4-r0 to 0:1.2.3-r0) [version-going-backwards]
ERROR: libjpeg-turbo-1_2.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package libjpeg-turbo-dev went backwards which would break package feeds (from 1:2.1.4-r0 to 1:2.1.3-r0) [version-going-backwards]
ERROR: pango-1.50.8-r0 do_packagedata_setscene: QA Issue: Package version for package pango-staticdev went backwards which would break package feeds (from 0:1.50.9-r0 to 0:1.50.8-r0) [version-going-backwards]
ERROR: libwebp-1.2.3-r0 do_packagedata_setscene: QA Issue: Package version for package libwebp-locale went backwards which would break package feeds (from 0:1.2.4-r0 to 0:1.2.3-r0) [version-going-backwards]
ERROR: libjpeg-turbo-1_2.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package libjpeg-turbo-doc went backwards which would break package feeds (from 1:2.1.4-r0 to 1:2.1.3-r0) [version-going-backwards]
ERROR: pango-1.50.8-r0 do_packagedata_setscene: QA Issue: Package version for package pango-dev went backwards which would break package feeds (from 0:1.50.9-r0 to 0:1.50.8-r0) [version-going-backwards]
ERROR: libwebp-1.2.3-r0 do_packagedata_setscene: QA Issue: Package version for package libwebp-bin went backwards which would break package feeds (from 0:1.2.4-r0 to 0:1.2.3-r0) [version-going-backwards]
ERROR: libjpeg-turbo-1_2.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package libjpeg-turbo-locale went backwards which would break package feeds (from 1:2.1.4-r0 to 1:2.1.3-r0) [version-going-backwards]
ERROR: pango-1.50.8-r0 do_packagedata_setscene: QA Issue: Package version for package pango-doc went backwards which would break package feeds (from 0:1.50.9-r0 to 0:1.50.8-r0) [version-going-backwards]
ERROR: libwebp-1.2.3-r0 do_packagedata_setscene: QA Issue: Package version for package libwebp went backwards which would break package feeds (from 0:1.2.4-r0 to 0:1.2.3-r0) [version-going-backwards]
ERROR: libjpeg-turbo-1_2.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package libjpeg-turbo went backwards which would break package feeds (from 1:2.1.4-r0 to 1:2.1.3-r0) [version-going-backwards]
ERROR: pango-1.50.8-r0 do_packagedata_setscene: QA Issue: Package version for package pango-locale went backwards which would break package feeds (from 0:1.50.9-r0 to 0:1.50.8-r0) [version-going-backwards]
ERROR: libwebp-1.2.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: libjpeg-turbo-1_2.1.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: pango-1.50.8-r0 do_packagedata_setscene: QA Issue: Package version for package pango went backwards which would break package feeds (from 0:1.50.9-r0 to 0:1.50.8-r0) [version-going-backwards]
ERROR: pango-1.50.8-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8923599788365400625==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/webkitgtk (sysroot):
  /usr/lib/libjavascriptcoregtk-4.0.so.18 changed symlink target from libjavascriptcoregtk-4.0.so.18.20.9 to libjavascriptcoregtk-4.0.so.18.20.10
  /usr/lib/libwebkit2gtk-4.0.so.37 changed symlink target from libwebkit2gtk-4.0.so.37.56.9 to libwebkit2gtk-4.0.so.37.56.10
  /usr/lib/libjavascriptcoregtk-4.0.so.18.20.10 was added
  /usr/lib/libwebkit2gtk-4.0.so.37.56.10 was added
  /usr/lib/libjavascriptcoregtk-4.0.so.18.20.9 was removed
  /usr/lib/libwebkit2gtk-4.0.so.37.56.9 was removed
packages/core2-32-poky-linux/webkitgtk/webkitgtk: FILELIST: removed "/usr/lib/libjavascriptcoregtk-4.0.so.18.20.9 /usr/lib/libwebkit2gtk-4.0.so.37.56.9", added "/usr/lib/libjavascriptcoregtk-4.0.so.18.20.10 /usr/lib/libwebkit2gtk-4.0.so.37.56.10"
Changes to packages/x86_64-linux/gcc-cross-i686 (sysroot):
  /sysroot-providers/virtual_i686-poky-linux-g++ was added
  /sysroot-providers/virtual_i686-poky-linux-gcc was added
  /usr/bin/i686-poky-linux was added
  /usr/bin/i686-poky-linux/i686-poky-linux-c++ was added
  /usr/bin/i686-poky-linux/i686-poky-linux-cpp was added
  /usr/bin/i686-poky-linux/i686-poky-linux-g++ was added
  /usr/bin/i686-poky-linux/i686-poky-linux-gcc was added
  /usr/bin/i686-poky-linux/i686-poky-linux-gcc-12.1.0 was added
  /usr/bin/i686-poky-linux/i686-poky-linux-gcc-ar was added
  /usr/bin/i686-poky-linux/i686-poky-linux-gcc-nm was added
  /usr/bin/i686-poky-linux/i686-poky-linux-gcc-ranlib was added
  /usr/bin/i686-poky-linux/i686-poky-linux-gcov was added
  /usr/bin/i686-poky-linux/i686-poky-linux-gcov-dump was added
  /usr/bin/i686-poky-linux/i686-poky-linux-gcov-tool was added
  /usr/bin/i686-poky-linux/i686-poky-linux-lto-dump was added
  /usr/libexec/i686-poky-linux was added
  /usr/libexec/i686-poky-linux/gcc was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/ar was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/as was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/cc1 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/cc1plus was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/collect2 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/cpp was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/gcc was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/g++-mapper-server was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/i686-poky-linux-ar was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/i686-poky-linux-as was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/i686-poky-linux-cpp was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/i686-poky-linux-gcc was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/i686-poky-linux-ld.bfd was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/i686-poky-linux-ld was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/i686-poky-linux-ld.gold was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/i686-poky-linux-nm was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/i686-poky-linux-objcopy was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/i686-poky-linux-objdump was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/i686-poky-linux-ranlib was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/i686-poky-linux-strip was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/install-tools was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/install-tools/fixincl was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/install-tools/fixinc.sh was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/install-tools/mkheaders was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/install-tools/mkinstalldirs was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/ld.bfd was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/ld was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/ld.gold was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/libcc1plugin.so.0.0.0 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/libcc1plugin.so.0 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/libcc1plugin.so was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/libcc1.so.0.0.0 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/libcc1.so.0 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/libcc1.so was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/libcp1plugin.so.0.0.0 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/libcp1plugin.so.0 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/libcp1plugin.so was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/liblto_plugin.so was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/lto1 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/lto-wrapper was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/nm was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/objcopy was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/objdump was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/gengtype was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/ranlib was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/strip was added
  /usr/lib/i686-poky-linux was added
  /usr/lib/i686-poky-linux/bfd-plugins was added
  /usr/lib/i686-poky-linux/bfd-plugins/liblto_plugin.so was added
  /usr/lib/i686-poky-linux/gcc was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0 was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/adxintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/ammintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/amxbf16intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/amxint8intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/amxtileintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx2intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx5124fmapsintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx5124vnniwintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512bf16intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512bf16vlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512bitalgintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512bwintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512cdintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512dqintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512erintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512fintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512fp16intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512fp16vlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512ifmaintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512ifmavlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512pfintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512vbmi2intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512vbmi2vlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512vbmiintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512vbmivlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512vlbwintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512vldqintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512vlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512vnniintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512vnnivlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512vp2intersectintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512vp2intersectvlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512vpopcntdqintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512vpopcntdqvlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avxintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avxvnniintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/bmi2intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/bmiintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/bmmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/cet.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/cetintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/cldemoteintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/clflushoptintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/clwbintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/clzerointrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/cpuid.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/cross-stdarg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/emmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/enqcmdintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/f16cintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include-fixed was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include-fixed/limits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include-fixed/README was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include-fixed/syslimits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/float.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/fma4intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/fmaintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/fxsrintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/gfniintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/hresetintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/ia32intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/immintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/iso646.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/keylockerintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/lwpintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/lzcntintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/mm3dnow.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/mmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/mm_malloc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/movdirintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/mwaitintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/mwaitxintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/nmmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/pconfigintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/pkuintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/pmmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/popcntintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/prfchwintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/quadmath.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/quadmath_weak.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/rdseedintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/rtmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/serializeintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/sgxintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/shaintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/smmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/stdalign.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/stdarg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/stdatomic.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/stdbool.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/stddef.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/stdfix.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/stdint-gcc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/stdint.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/stdnoreturn.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/tbmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/tmmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/tsxldtrkintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/uintrintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/unwind.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/vaesintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/varargs.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/vpclmulqdqintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/waitpkgintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/wbnoinvdintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/wmmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/x86gprintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/x86intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/xmmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/xopintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/xsavecintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/xsaveintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/xsaveoptintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/xsavesintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/xtestintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/install-tools was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/install-tools/fixinc_list was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/install-tools/gsyslimits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/install-tools/include was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/install-tools/include/limits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/install-tools/include/README was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/install-tools/macro_list was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/install-tools/mkheaders.conf was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/gtype.state was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ada was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ada/gcc-interface was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ada/gcc-interface/ada-tree.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/addresses.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/alias.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/align.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/alloc-pool.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/all-tree.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ansidecl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/array-traits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/asan.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/attr-fnspec.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/attribs.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/auto-host.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/auto-profile.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/backend.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/basic-block.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/bb-reorder.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/b-header-vars was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/bitmap.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/builtin-attrs.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/builtins.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/builtins.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/builtin-types.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/bversion.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/calls.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ccmp.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/c-family was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/c-family/c-common.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/c-family/c-common.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/c-family/c-objc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/c-family/c-pragma.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/c-family/c-pretty-print.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/cfganal.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/cfgbuild.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/cfgcleanup.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/cfgexpand.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/cfg-flags.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/cfg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/cfghooks.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/cfgloop.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/cfgloopmanip.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/cfgrtl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/cgraph.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/cif-code.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/collect2-aix.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/collect2.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/collect-utils.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/color-macros.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/common was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/common/config was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/common/config/i386 was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/common/config/i386/i386-cpuinfo.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/conditions.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/config was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/configargs.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/config/dbxelf.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/config/elfos.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/config/glibc-stdint.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/config/gnu-user.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/config.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/config/i386 was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/config/i386/att.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/config/i386/gnu-user64.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/config/i386/gnu-user-common.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/config/i386/i386.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/config/i386/i386-isa.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/config/i386/i386-opts.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/config/i386/i386-protos.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/config/i386/linux64.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/config/i386/linux-common.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/config/i386/stringop.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/config/i386/unix.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/config/i386/x86-64.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/config/i386/x86-tune.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/config/initfini-array.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/config/linux-android.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/config/linux.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/config/linux-protos.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/config/vxworks-dummy.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/context.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/convert.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/coretypes.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/coroutine-builtins.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/coverage.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/cp was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/cp/cp-tree.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/cp/cp-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/cp/cxx-pretty-print.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/cp/name-lookup.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/cp/operators.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/cppbuiltin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/cppdefault.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/cpplib.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/cp/type-utils.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/cselib.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ctfc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/c-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/d was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/data-streamer.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/dbgcnt.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/dbgcnt.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/dbxout.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/dce.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ddg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/d/d-tree.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/debug.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/defaults.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/df.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/dfp.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/diagnostic-color.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/diagnostic-core.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/diagnostic.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/diagnostic-event-id.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/diagnostic.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/diagnostic-metadata.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/diagnostic-path.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/diagnostic-spec.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/diagnostic-url.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/digraph.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/dojump.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/dominance.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/domwalk.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/double-int.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/dump-context.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/dumpfile.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/dwarf2asm.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/dwarf2ctf.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/dwarf2out.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/edit-context.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/emit-rtl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/errors.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/escaped_string.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/et-forest.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/except.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/explow.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/expmed.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/expr.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/fibonacci_heap.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/file-find.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/filenames.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/file-prefix-map.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/fixed-value.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/flags.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/flag-types.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/fold-const-call.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/fold-const.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/function-abi.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/function.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gcc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gcc-plugin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gcc-rich-location.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gcc-symtab.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gcov-counter.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gcov-io.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gcse-common.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gcse.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/generic-match.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gengtype.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/genrtl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gensupport.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ggc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ggc-internal.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimple-array-bounds.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimple-builder.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimple.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimple-expr.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimple-fold.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimple.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimple-iterator.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimple-low.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimple-match.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimple-predicate-analysis.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimple-predict.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimple-pretty-print.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimple-range-cache.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimple-range-edge.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimple-range-fold.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimple-range-gori.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimple-range.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimple-range-path.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimple-range-trace.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimple-ssa-evrp-analyze.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimple-ssa.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimple-ssa-warn-access.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimple-ssa-warn-restrict.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimple-streamer.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimple-walk.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimplify.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimplify-me.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/glimits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gomp-constants.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/graphds.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/graph.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/graphite.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/graphviz.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gsstruct.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gstab.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gsyms.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gsyslimits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gtm-builtins.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gtype-desc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/hard-reg-set.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/hash-map.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/hash-map-traits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/hash-set.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/hashtab.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/hash-table.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/hash-traits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/highlev-plugin-common.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/hooks.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/hosthooks-def.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/hosthooks.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/hw-doloop.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/hwint.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ifcvt.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/inchash.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/incpath.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/input.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/insn-addr.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/insn-attr-common.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/insn-attr.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/insn-codes.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/insn-config.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/insn-constants.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/insn-flags.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/insn-modes.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/insn-modes-inline.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/insn-notes.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/internal-fn.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/internal-fn.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/intl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/int-vector-builder.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ipa-fnsummary.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ipa-icf-gimple.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ipa-icf.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ipa-inline.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ipa-modref.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ipa-modref-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ipa-param-manipulation.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ipa-predicate.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ipa-prop.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ipa-reference.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ipa-ref.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ipa-utils.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ira.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ira-int.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/is-a.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/iterator-utils.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/json.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/langhooks-def.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/langhooks.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/lcm.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/libfuncs.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/libiberty.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/limitx.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/limity.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/line-map.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/linux.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/loop-unroll.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/lower-subreg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/lra.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/lra-int.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/lto-compress.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/lto-section-names.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/lto-streamer.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/machmode.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/machmode.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/md5.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/memmodel.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/memory-block.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/mem-stats.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/mem-stats-traits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/mode-classes.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/mux-utils.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/objc was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/objc/objc-tree.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/obstack.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/obstack-utils.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/omp-builtins.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/omp-expand.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/omp-general.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/omp-low.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/omp-offload.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/omp-simd-clone.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/optabs.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/optabs.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/optabs-libfuncs.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/optabs-query.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/optabs-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/optinfo-emit-json.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/optinfo.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/options.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/opt-problem.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/opts-diagnostic.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/opts.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/opt-suggestions.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ordered-hash-map.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/output.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/passes.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/pass-instances.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/pass_manager.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/plugin-api.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/plugin.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/plugin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/plugin-version.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/pointer-query.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/poly-int.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/poly-int-types.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/predict.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/predict.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/prefix.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/pretty-print.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/print-rtl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/print-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/profile-count.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/profile.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/range.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/range-op.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/read-md.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/read-rtl-function.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/real.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/realmpfr.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/recog.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/regcprop.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/reg-notes.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/regrename.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/regset.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/regs.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/reload.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/resource.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/rtlanal.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/rtl.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/rtl-error.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/rtl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/rtlhash.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/rtlhooks-def.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/rtl-iter.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/rtl-ssa.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/rtx-vector-builder.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/run-rtl-passes.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/safe-ctype.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/sanitizer.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/sbitmap.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/sched-int.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/selftest-diagnostic.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/selftest.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/selftest-rtl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/sel-sched-dump.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/sel-sched.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/sel-sched-ir.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/sese.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/shortest-paths.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/shrink-wrap.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/signop.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/sparseset.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/spellcheck.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/spellcheck-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/splay-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/splay-tree-utils.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/sreal.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ssa.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ssa-iterators.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/stab.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/statistics.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/stmt.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/stor-layout.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/streamer-hooks.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/stringpool.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/substring-locations.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/symbol-summary.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/symtab-clones.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/symtab.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/symtab-thunks.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/sync-builtins.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/system.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/target.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/target-def.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/target-globals.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/target.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/target-hooks-macros.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/target-insns.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/targhooks.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/timevar.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/timevar.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tm.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tm_p.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tm-preds.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/toplev.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tracer.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/trans-mem.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-affine.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-cfgcleanup.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-cfg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-check.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-chrec.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-core.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-data-ref.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-dfa.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-diagnostic.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-dump.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-eh.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-hasher.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-hash-traits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-if-conv.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-inline.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-into-ssa.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-iterator.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-nested.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-object-size.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-outof-ssa.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-parloops.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-pass.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-phinodes.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-pretty-print.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-scalar-evolution.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-sra.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-ssa-address.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-ssa-alias-compare.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-ssa-alias.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-ssa-ccp.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-ssa-coalesce.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-ssa-dce.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-ssa-dom.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-ssa-dse.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-ssa.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-ssa-live.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-ssa-loop.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-ssa-loop-ivopts.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-ssa-loop-manip.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-ssa-loop-niter.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-ssa-math-opts.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-ssanames.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-ssa-operands.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-ssa-propagate.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-ssa-reassoc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-ssa-sccvn.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-ssa-scopedtables.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-ssa-strlen.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-ssa-ter.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-ssa-threadedge.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-ssa-threadupdate.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-stdarg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-streamer.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/treestruct.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-switch-conversion.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-vector-builder.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-vectorizer.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-vrp.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tristate.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tsan.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tsystem.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/typeclass.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/typed-splay-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ubsan.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/valtrack.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/value-pointer-equiv.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/value-prof.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/value-query.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/value-range-equiv.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/value-range.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/value-relation.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/varasm.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/vec.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/vec-perm-indices.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/vector-builder.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/version.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/vmsdbg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/vr-values.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/vtable-verify.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/wide-int-bitmask.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/wide-int.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/wide-int-print.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/xcoff.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/xcoffout.h was added
  /sysroot-providers/virtual_i686-poky-linux-musl-g++ was removed
  /sysroot-providers/virtual_i686-poky-linux-musl-gcc was removed
  /usr/bin/i686-poky-linux-musl was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-c++ was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-cpp was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-g++ was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcc was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcc-12.1.0 was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcc-ar was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcc-nm was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcc-ranlib was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcov was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcov-dump was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcov-tool was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-lto-dump was removed
  /usr/libexec/i686-poky-linux-musl was removed
  /usr/libexec/i686-poky-linux-musl/gcc was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/ar was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/as was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/cc1 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/cc1plus was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/collect2 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/cpp was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/gcc was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/g++-mapper-server was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/i686-poky-linux-musl-ar was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/i686-poky-linux-musl-as was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/i686-poky-linux-musl-cpp was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/i686-poky-linux-musl-gcc was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/i686-poky-linux-musl-ld.bfd was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/i686-poky-linux-musl-ld was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/i686-poky-linux-musl-ld.gold was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/i686-poky-linux-musl-nm was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/i686-poky-linux-musl-objcopy was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/i686-poky-linux-musl-objdump was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/i686-poky-linux-musl-ranlib was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/i686-poky-linux-musl-strip was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/install-tools was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/install-tools/fixincl was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/install-tools/fixinc.sh was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/install-tools/mkheaders was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/install-tools/mkinstalldirs was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/ld.bfd was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/ld was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/ld.gold was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/libcc1plugin.so.0.0.0 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/libcc1plugin.so.0 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/libcc1plugin.so was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/libcc1.so.0.0.0 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/libcc1.so.0 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/libcc1.so was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/libcp1plugin.so.0.0.0 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/libcp1plugin.so.0 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/libcp1plugin.so was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/liblto_plugin.so was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/lto1 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/lto-wrapper was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/nm was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/objcopy was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/objdump was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/gengtype was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/ranlib was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/strip was removed
  /usr/lib/i686-poky-linux-musl was removed
  /usr/lib/i686-poky-linux-musl/bfd-plugins was removed
  /usr/lib/i686-poky-linux-musl/bfd-plugins/liblto_plugin.so was removed
  /usr/lib/i686-poky-linux-musl/gcc was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0 was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/adxintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/ammintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/amxbf16intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/amxint8intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/amxtileintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx2intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx5124fmapsintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx5124vnniwintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512bf16intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512bf16vlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512bitalgintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512bwintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512cdintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512dqintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512erintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512fintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512fp16intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512fp16vlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512ifmaintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512ifmavlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512pfintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512vbmi2intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512vbmi2vlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512vbmiintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512vbmivlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512vlbwintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512vldqintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512vlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512vnniintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512vnnivlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512vp2intersectintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512vp2intersectvlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512vpopcntdqintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512vpopcntdqvlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avxintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avxvnniintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/bmi2intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/bmiintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/bmmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/cet.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/cetintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/cldemoteintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/clflushoptintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/clwbintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/clzerointrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/cpuid.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/cross-stdarg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/emmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/enqcmdintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/f16cintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include-fixed was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include-fixed/limits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include-fixed/README was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include-fixed/syslimits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/float.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/fma4intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/fmaintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/fxsrintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/gfniintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/hresetintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/ia32intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/immintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/iso646.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/keylockerintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/lwpintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/lzcntintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/mm3dnow.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/mmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/mm_malloc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/movdirintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/mwaitintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/mwaitxintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/nmmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/pconfigintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/pkuintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/pmmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/popcntintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/prfchwintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/quadmath.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/quadmath_weak.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/rdseedintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/rtmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/serializeintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/sgxintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/shaintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/smmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/stdalign.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/stdarg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/stdatomic.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/stdbool.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/stddef.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/stdfix.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/stdint-gcc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/stdint.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/stdnoreturn.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/tbmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/tmmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/tsxldtrkintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/uintrintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/unwind.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/vaesintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/varargs.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/vpclmulqdqintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/waitpkgintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/wbnoinvdintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/wmmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/x86gprintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/x86intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/xmmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/xopintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/xsavecintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/xsaveintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/xsaveoptintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/xsavesintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/xtestintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/install-tools was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/install-tools/fixinc_list was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/install-tools/gsyslimits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/install-tools/include was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/install-tools/include/limits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/install-tools/include/README was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/install-tools/macro_list was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/install-tools/mkheaders.conf was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/gtype.state was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ada was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ada/gcc-interface was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ada/gcc-interface/ada-tree.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/addresses.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/alias.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/align.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/alloc-pool.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/all-tree.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ansidecl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/array-traits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/asan.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/attr-fnspec.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/attribs.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/auto-host.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/auto-profile.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/backend.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/basic-block.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/bb-reorder.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/b-header-vars was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/bitmap.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/builtin-attrs.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/builtins.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/builtins.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/builtin-types.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/bversion.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/calls.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ccmp.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/c-family was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/c-family/c-common.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/c-family/c-common.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/c-family/c-objc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/c-family/c-pragma.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/c-family/c-pretty-print.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/cfganal.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/cfgbuild.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/cfgcleanup.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/cfgexpand.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/cfg-flags.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/cfg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/cfghooks.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/cfgloop.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/cfgloopmanip.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/cfgrtl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/cgraph.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/cif-code.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/collect2-aix.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/collect2.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/collect-utils.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/color-macros.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/common was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/common/config was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/common/config/i386 was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/common/config/i386/i386-cpuinfo.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/conditions.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/config was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/configargs.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/config/dbxelf.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/config/elfos.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/config/glibc-stdint.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/config/gnu-user.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/config.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/config/i386 was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/config/i386/att.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/config/i386/gnu-user64.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/config/i386/gnu-user-common.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/config/i386/i386.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/config/i386/i386-isa.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/config/i386/i386-opts.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/config/i386/i386-protos.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/config/i386/linux64.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/config/i386/linux-common.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/config/i386/stringop.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/config/i386/unix.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/config/i386/x86-64.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/config/i386/x86-tune.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/config/initfini-array.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/config/linux-android.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/config/linux.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/config/linux-protos.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/config/vxworks-dummy.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/context.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/convert.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/coretypes.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/coroutine-builtins.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/coverage.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/cp was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/cp/cp-tree.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/cp/cp-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/cp/cxx-pretty-print.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/cp/name-lookup.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/cp/operators.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/cppbuiltin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/cppdefault.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/cpplib.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/cp/type-utils.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/cselib.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ctfc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/c-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/d was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/data-streamer.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/dbgcnt.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/dbgcnt.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/dbxout.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/dce.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ddg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/d/d-tree.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/debug.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/defaults.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/df.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/dfp.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/diagnostic-color.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/diagnostic-core.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/diagnostic.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/diagnostic-event-id.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/diagnostic.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/diagnostic-metadata.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/diagnostic-path.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/diagnostic-spec.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/diagnostic-url.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/digraph.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/dojump.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/dominance.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/domwalk.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/double-int.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/dump-context.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/dumpfile.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/dwarf2asm.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/dwarf2ctf.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/dwarf2out.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/edit-context.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/emit-rtl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/errors.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/escaped_string.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/et-forest.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/except.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/explow.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/expmed.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/expr.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/fibonacci_heap.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/file-find.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/filenames.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/file-prefix-map.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/fixed-value.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/flags.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/flag-types.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/fold-const-call.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/fold-const.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/function-abi.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/function.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gcc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gcc-plugin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gcc-rich-location.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gcc-symtab.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gcov-counter.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gcov-io.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gcse-common.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gcse.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/generic-match.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gengtype.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/genrtl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gensupport.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ggc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ggc-internal.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimple-array-bounds.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimple-builder.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimple.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimple-expr.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimple-fold.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimple.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimple-iterator.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimple-low.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimple-match.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimple-predicate-analysis.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimple-predict.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimple-pretty-print.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimple-range-cache.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimple-range-edge.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimple-range-fold.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimple-range-gori.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimple-range.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimple-range-path.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimple-range-trace.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimple-ssa-evrp-analyze.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimple-ssa.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimple-ssa-warn-access.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimple-ssa-warn-restrict.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimple-streamer.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimple-walk.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimplify.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimplify-me.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/glimits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gomp-constants.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/graphds.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/graph.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/graphite.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/graphviz.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gsstruct.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gstab.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gsyms.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gsyslimits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gtm-builtins.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gtype-desc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/hard-reg-set.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/hash-map.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/hash-map-traits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/hash-set.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/hashtab.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/hash-table.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/hash-traits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/highlev-plugin-common.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/hooks.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/hosthooks-def.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/hosthooks.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/hw-doloop.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/hwint.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ifcvt.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/inchash.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/incpath.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/input.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/insn-addr.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/insn-attr-common.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/insn-attr.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/insn-codes.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/insn-config.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/insn-constants.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/insn-flags.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/insn-modes.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/insn-modes-inline.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/insn-notes.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/internal-fn.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/internal-fn.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/intl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/int-vector-builder.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ipa-fnsummary.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ipa-icf-gimple.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ipa-icf.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ipa-inline.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ipa-modref.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ipa-modref-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ipa-param-manipulation.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ipa-predicate.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ipa-prop.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ipa-reference.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ipa-ref.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ipa-utils.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ira.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ira-int.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/is-a.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/iterator-utils.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/json.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/langhooks-def.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/langhooks.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/lcm.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/libfuncs.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/libiberty.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/limitx.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/limity.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/line-map.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/linux.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/loop-unroll.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/lower-subreg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/lra.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/lra-int.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/lto-compress.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/lto-section-names.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/lto-streamer.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/machmode.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/machmode.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/md5.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/memmodel.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/memory-block.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/mem-stats.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/mem-stats-traits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/mode-classes.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/mux-utils.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/objc was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/objc/objc-tree.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/obstack.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/obstack-utils.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/omp-builtins.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/omp-expand.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/omp-general.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/omp-low.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/omp-offload.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/omp-simd-clone.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/optabs.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/optabs.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/optabs-libfuncs.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/optabs-query.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/optabs-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/optinfo-emit-json.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/optinfo.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/options.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/opt-problem.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/opts-diagnostic.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/opts.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/opt-suggestions.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ordered-hash-map.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/output.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/passes.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/pass-instances.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/pass_manager.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/plugin-api.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/plugin.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/plugin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/plugin-version.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/pointer-query.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/poly-int.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/poly-int-types.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/predict.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/predict.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/prefix.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/pretty-print.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/print-rtl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/print-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/profile-count.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/profile.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/range.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/range-op.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/read-md.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/read-rtl-function.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/real.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/realmpfr.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/recog.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/regcprop.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/reg-notes.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/regrename.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/regset.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/regs.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/reload.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/resource.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/rtlanal.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/rtl.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/rtl-error.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/rtl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/rtlhash.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/rtlhooks-def.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/rtl-iter.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/rtl-ssa.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/rtx-vector-builder.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/run-rtl-passes.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/safe-ctype.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/sanitizer.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/sbitmap.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/sched-int.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/selftest-diagnostic.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/selftest.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/selftest-rtl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/sel-sched-dump.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/sel-sched.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/sel-sched-ir.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/sese.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/shortest-paths.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/shrink-wrap.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/signop.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/sparseset.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/spellcheck.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/spellcheck-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/splay-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/splay-tree-utils.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/sreal.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ssa.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ssa-iterators.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/stab.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/statistics.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/stmt.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/stor-layout.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/streamer-hooks.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/stringpool.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/substring-locations.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/symbol-summary.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/symtab-clones.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/symtab.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/symtab-thunks.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/sync-builtins.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/system.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/target.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/target-def.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/target-globals.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/target.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/target-hooks-macros.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/target-insns.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/targhooks.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/timevar.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/timevar.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tm.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tm_p.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tm-preds.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/toplev.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tracer.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/trans-mem.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-affine.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-cfgcleanup.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-cfg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-check.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-chrec.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-core.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-data-ref.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-dfa.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-diagnostic.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-dump.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-eh.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-hasher.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-hash-traits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-if-conv.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-inline.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-into-ssa.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-iterator.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-nested.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-object-size.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-outof-ssa.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-parloops.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-pass.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-phinodes.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-pretty-print.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-scalar-evolution.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-sra.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-ssa-address.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-ssa-alias-compare.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-ssa-alias.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-ssa-ccp.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-ssa-coalesce.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-ssa-dce.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-ssa-dom.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-ssa-dse.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-ssa.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-ssa-live.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-ssa-loop.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-ssa-loop-ivopts.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-ssa-loop-manip.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-ssa-loop-niter.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-ssa-math-opts.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-ssanames.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-ssa-operands.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-ssa-propagate.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-ssa-reassoc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-ssa-sccvn.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-ssa-scopedtables.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-ssa-strlen.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-ssa-ter.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-ssa-threadedge.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-ssa-threadupdate.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-stdarg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-streamer.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/treestruct.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-switch-conversion.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-vector-builder.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-vectorizer.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-vrp.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tristate.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tsan.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tsystem.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/typeclass.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/typed-splay-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ubsan.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/valtrack.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/value-pointer-equiv.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/value-prof.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/value-query.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/value-range-equiv.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/value-range.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/value-relation.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/varasm.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/vec.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/vec-perm-indices.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/vector-builder.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/version.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/vmsdbg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/vr-values.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/vtable-verify.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/wide-int-bitmask.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/wide-int.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/wide-int-print.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/xcoff.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/xcoffout.h was removed

--===============8923599788365400625==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 884 .bb files complete (0 cached, 884 parsed). 1658 targets, 70 skipped, 0 masked, 0 errors.
Removing 2 recipes from the ppc7400 sysroot...done.
Removing 2 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-2695f9335279b47f8a91bf42762cef21d9ef1309"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:2695f9335279b47f8a91bf42762cef21d9ef1309"
workspace            = "master:21cfb871f7da604f1fab957d7747cb03b113b971"

Initialising tasks...done.
Sstate summary: Wanted 39 Local 28 Mirrors 0 Missed 11 Current 663 (71% match, 98% complete)
Removing 3 stale sstate objects for arch qemuppc...done.
NOTE: Executing Tasks
NOTE: Running setscene task 670 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 671 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 676 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 677 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 680 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 681 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libwebp-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libwebp-1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.50.8-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.50.8-r0: task do_populate_sysroot_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/pango/1.50.8-r0/temp/log.do_packagedata_setscene.3104802
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/libwebp/1.2.3-r0/temp/log.do_packagedata_setscene.3104814
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.8.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 697 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.8.bb:do_package_setscene)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/libjpeg-turbo/1_2.1.3-r0/temp/log.do_packagedata_setscene.3104812
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libwebp-1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pango-1.50.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 698 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_package_setscene)
NOTE: Running setscene task 699 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.3.bb:do_package_setscene)
NOTE: Running task 1501 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_package_setscene: Started
NOTE: recipe libwebp-1.2.3-r0: task do_package_setscene: Started
NOTE: recipe pango-1.50.8-r0: task do_package_setscene: Started
NOTE: Running task 2042 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb:do_fetch)
NOTE: Running task 2304 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm)
NOTE: recipe webkitgtk-2.36.6-r0: task do_fetch: Started
NOTE: recipe webkitgtk-2.36.6-r0: task do_fetch: Succeeded
NOTE: Running task 2305 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb:do_unpack)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_package_setscene: Succeeded
NOTE: recipe libwebp-1.2.3-r0: task do_package_setscene: Succeeded
NOTE: Running task 2324 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_packagedata)
NOTE: Running task 2336 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.3.bb:do_packagedata)
NOTE: recipe webkitgtk-2.36.6-r0: task do_unpack: Started
NOTE: recipe pango-1.50.8-r0: task do_package_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_package_write_rpm: Started
NOTE: Setscene tasks completed
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_packagedata: Started
NOTE: Running task 2355 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.8.bb:do_packagedata)
NOTE: recipe libwebp-1.2.3-r0: task do_packagedata: Started
NOTE: Running task 2356 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2357 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe pango-1.50.8-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_packagedata: Succeeded
NOTE: recipe libwebp-1.2.3-r0: task do_packagedata: Succeeded
NOTE: recipe pango-1.50.8-r0: task do_packagedata: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 5edbb8b46d9798a7c2da5cdd4d6bba06e77b9812ef67d38c44fb2289b8d7e827
NOTE: Running task 2396 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe webkitgtk-2.36.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2397 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 9e143ea2acea23bbe72977bba2220a0c3768b659f22798a7511713ece28f8194
NOTE: recipe webkitgtk-2.36.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe webkitgtk-2.36.6-r0: task do_unpack: Succeeded
NOTE: Running task 2410 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb:do_patch)
NOTE: recipe webkitgtk-2.36.6-r0: task do_patch: Started
NOTE: recipe webkitgtk-2.36.6-r0: task do_patch: Succeeded
NOTE: Running task 2411 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 2412 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb:do_generate_toolchain_file)
NOTE: Running task 2413 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb:do_populate_lic)
NOTE: recipe webkitgtk-2.36.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe webkitgtk-2.36.6-r0: task do_populate_lic: Started
NOTE: recipe webkitgtk-2.36.6-r0: task do_generate_toolchain_file: Started
NOTE: recipe webkitgtk-2.36.6-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe webkitgtk-2.36.6-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb:do_populate_lic unihash changed to 6ec94dda021471146cd47c185d5902f030d9203d7a27193fd8926cd31e6319da
NOTE: recipe webkitgtk-2.36.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2414 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb:do_configure)
NOTE: recipe webkitgtk-2.36.6-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe webkitgtk-2.36.6-r0: task do_configure: Succeeded
NOTE: Running task 2415 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb:do_compile)
NOTE: recipe webkitgtk-2.36.6-r0: task do_compile: Started
Bitbake still alive (no events for 600s). Active tasks:
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb:do_compile
Bitbake still alive (no events for 1200s). Active tasks:
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb:do_compile
NOTE: recipe webkitgtk-2.36.6-r0: task do_compile: Succeeded
NOTE: Running task 2416 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb:do_install)
NOTE: recipe webkitgtk-2.36.6-r0: task do_install: Started
NOTE: recipe webkitgtk-2.36.6-r0: task do_install: Succeeded
NOTE: Running task 2417 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb:do_package)
NOTE: Running task 2418 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb:do_populate_sysroot)
NOTE: recipe webkitgtk-2.36.6-r0: task do_package: Started
NOTE: recipe webkitgtk-2.36.6-r0: task do_populate_sysroot: Started
NOTE: recipe webkitgtk-2.36.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe webkitgtk-2.36.6-r0: task do_package: Succeeded
NOTE: Running task 2419 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb:do_packagedata)
NOTE: recipe webkitgtk-2.36.6-r0: task do_packagedata: Started
NOTE: recipe webkitgtk-2.36.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2420 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb:do_package_write_rpm)
NOTE: Running task 2421 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb:do_package_qa)
NOTE: recipe webkitgtk-2.36.6-r0: task do_package_write_rpm: Started
NOTE: recipe webkitgtk-2.36.6-r0: task do_package_qa: Started
NOTE: recipe webkitgtk-2.36.6-r0: task do_package_qa: Succeeded
NOTE: recipe webkitgtk-2.36.6-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2422 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb:do_build)
NOTE: Tasks Summary: Attempted 2422 tasks of which 2398 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 5 seconds

Summary: There was 1 WARNING message.
Summary: There were 29 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: libwebp-1.2.3-r0 do_packagedata_setscene: QA Issue: Package version for package libwebp-src went backwards which would break package feeds (from 0:1.2.4-r0 to 0:1.2.3-r0) [version-going-backwards]
ERROR: libjpeg-turbo-1_2.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package libjpeg-turbo-src went backwards which would break package feeds (from 1:2.1.4-r0 to 1:2.1.3-r0) [version-going-backwards]
ERROR: pango-1.50.8-r0 do_packagedata_setscene: QA Issue: Package version for package pango-src went backwards which would break package feeds (from 0:1.50.9-r0 to 0:1.50.8-r0) [version-going-backwards]
ERROR: libwebp-1.2.3-r0 do_packagedata_setscene: QA Issue: Package version for package libwebp-dbg went backwards which would break package feeds (from 0:1.2.4-r0 to 0:1.2.3-r0) [version-going-backwards]
ERROR: libjpeg-turbo-1_2.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package libjpeg-turbo-dbg went backwards which would break package feeds (from 1:2.1.4-r0 to 1:2.1.3-r0) [version-going-backwards]
ERROR: pango-1.50.8-r0 do_packagedata_setscene: QA Issue: Package version for package pango-dbg went backwards which would break package feeds (from 0:1.50.9-r0 to 0:1.50.8-r0) [version-going-backwards]
ERROR: libwebp-1.2.3-r0 do_packagedata_setscene: QA Issue: Package version for package libwebp-gif2webp went backwards which would break package feeds (from 0:1.2.4-r0 to 0:1.2.3-r0) [version-going-backwards]
ERROR: libjpeg-turbo-1_2.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package jpeg-tools went backwards which would break package feeds (from 1:2.1.4-r0 to 1:2.1.3-r0) [version-going-backwards]
ERROR: pango-1.50.8-r0 do_packagedata_setscene: QA Issue: Package version for package pango-ptest went backwards which would break package feeds (from 0:1.50.9-r0 to 0:1.50.8-r0) [version-going-backwards]
ERROR: libwebp-1.2.3-r0 do_packagedata_setscene: QA Issue: Package version for package libwebp-staticdev went backwards which would break package feeds (from 0:1.2.4-r0 to 0:1.2.3-r0) [version-going-backwards]
ERROR: libjpeg-turbo-1_2.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package libturbojpeg went backwards which would break package feeds (from 1:2.1.4-r0 to 1:2.1.3-r0) [version-going-backwards]
ERROR: pango-1.50.8-r0 do_packagedata_setscene: QA Issue: Package version for package pango-staticdev went backwards which would break package feeds (from 0:1.50.9-r0 to 0:1.50.8-r0) [version-going-backwards]
ERROR: libwebp-1.2.3-r0 do_packagedata_setscene: QA Issue: Package version for package libwebp-dev went backwards which would break package feeds (from 0:1.2.4-r0 to 0:1.2.3-r0) [version-going-backwards]
ERROR: libjpeg-turbo-1_2.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package libjpeg-turbo-staticdev went backwards which would break package feeds (from 1:2.1.4-r0 to 1:2.1.3-r0) [version-going-backwards]
ERROR: pango-1.50.8-r0 do_packagedata_setscene: QA Issue: Package version for package pango-dev went backwards which would break package feeds (from 0:1.50.9-r0 to 0:1.50.8-r0) [version-going-backwards]
ERROR: libwebp-1.2.3-r0 do_packagedata_setscene: QA Issue: Package version for package libwebp-doc went backwards which would break package feeds (from 0:1.2.4-r0 to 0:1.2.3-r0) [version-going-backwards]
ERROR: pango-1.50.8-r0 do_packagedata_setscene: QA Issue: Package version for package pango-doc went backwards which would break package feeds (from 0:1.50.9-r0 to 0:1.50.8-r0) [version-going-backwards]
ERROR: libjpeg-turbo-1_2.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package libjpeg-turbo-dev went backwards which would break package feeds (from 1:2.1.4-r0 to 1:2.1.3-r0) [version-going-backwards]
ERROR: libwebp-1.2.3-r0 do_packagedata_setscene: QA Issue: Package version for package libwebp-locale went backwards which would break package feeds (from 0:1.2.4-r0 to 0:1.2.3-r0) [version-going-backwards]
ERROR: pango-1.50.8-r0 do_packagedata_setscene: QA Issue: Package version for package pango-locale went backwards which would break package feeds (from 0:1.50.9-r0 to 0:1.50.8-r0) [version-going-backwards]
ERROR: libjpeg-turbo-1_2.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package libjpeg-turbo-doc went backwards which would break package feeds (from 1:2.1.4-r0 to 1:2.1.3-r0) [version-going-backwards]
ERROR: libwebp-1.2.3-r0 do_packagedata_setscene: QA Issue: Package version for package libwebp-bin went backwards which would break package feeds (from 0:1.2.4-r0 to 0:1.2.3-r0) [version-going-backwards]
ERROR: pango-1.50.8-r0 do_packagedata_setscene: QA Issue: Package version for package pango went backwards which would break package feeds (from 0:1.50.9-r0 to 0:1.50.8-r0) [version-going-backwards]
ERROR: libjpeg-turbo-1_2.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package libjpeg-turbo-locale went backwards which would break package feeds (from 1:2.1.4-r0 to 1:2.1.3-r0) [version-going-backwards]
ERROR: libwebp-1.2.3-r0 do_packagedata_setscene: QA Issue: Package version for package libwebp went backwards which would break package feeds (from 0:1.2.4-r0 to 0:1.2.3-r0) [version-going-backwards]
ERROR: pango-1.50.8-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: libwebp-1.2.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: libjpeg-turbo-1_2.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package libjpeg-turbo went backwards which would break package feeds (from 1:2.1.4-r0 to 1:2.1.3-r0) [version-going-backwards]
ERROR: libjpeg-turbo-1_2.1.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8923599788365400625==--

