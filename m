Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCA2ED5E13D
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:39 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17409.1765872158090865315
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=vDPl5T12;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=VoVvWN3k;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019b262ec68c-8a34e107-c9bd-4f4b-aaad-5f2080ddb305-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872158;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=It5AGVoFUi3o5DA/TUclNyvUSfwIcM7VysjTnaPpSpk=;
	b=vDPl5T12AsIvKH9HfqxPFgLZUIwJiNK5y0hBV6EEDdTet2CmOKVo0nmU7bBPbQV2
	DNjiHNHjEJwYbjxi/YjVgqOIWm3fHuasJr1RhLALWS9Sc1dvLlN+30/w4vxhETKVEU+
	AWdyppwl7Xbd4SP0zINQopwgiV745+41luVnQig0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872158;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=It5AGVoFUi3o5DA/TUclNyvUSfwIcM7VysjTnaPpSpk=;
	b=VoVvWN3kk3YUVjEhanYvEWNVOHbsEDst7y/zDbTpAXg9OBPCBIirJhi1SZKEWhIM
	FCQYOf46ZDl/qCT2sTpVeneihvoygDYatypFaiQpGDItvUKQmsbzAB2blbH0HRJbFOy
	h3w2G3OdTdVh54MZxk4GhJ36CNXvChX2+xFhs3us=
Content-Type: multipart/mixed; boundary="===============1095956813129497424=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] libva-utils: upgrading to 2.23.0 FAILED
Message-ID: <0101019b262ec68c-8a34e107-c9bd-4f4b-aaad-5f2080ddb305-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:38 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227865

--===============1095956813129497424==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libva-utils* to *2.23.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe libva-utils failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 949 .bb files complete (0 cached, 949 parsed). 1950 targets, 47 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-25acaeff52885f0cb7ab9672eba2f2f3b82e0135"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:25acaeff52885f0cb7ab9672eba2f2f3b82e0135"
meta-yocto-bsp       
meta-poky            = "master:b3b659263566c4d2f2813190e72d93f8598a4c47"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 5896b6779d36f83bf483aff62da8aae30ba8d664
WARNING: Command 'git rebase 5896b6779d36f83bf483aff62da8aae30ba8d664' failed:
Auto-merging configure.ac
Auto-merging meson.build
CONFLICT (content): Merge conflict in meson.build

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/libva-utils
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/libva-utils/libva-utils_2.23.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============1095956813129497424==--

