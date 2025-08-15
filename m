Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F5F2CA0EED
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 13:07:11 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.11318.1755263214708443277
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Aug 2025 06:07:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=YYGKOgBo;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=oZHxINYV;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010198add73ea2-68b33d2d-5360-449c-9768-e4fe8808ec84-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1755263221;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=An19Dmb3i9qoKX9r7dNKGEr8ANOdCk/te8oEL92aTdc=;
	b=YYGKOgBoK6nXl+mot4+TBICytBqb9piWBduXNYtrXqmTUPTpU2oIKv/4X2XL2xOS
	nW3ZLKNpz/1Pc+b0maZl9SDHCGIz98zrieA2si1QZihR3awmuvZpYTteZc++PqMoj4o
	IKEQf//cIIrvFZLBKkwtyi18n8IlsVZa6B4p+HAM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1755263221;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=An19Dmb3i9qoKX9r7dNKGEr8ANOdCk/te8oEL92aTdc=;
	b=oZHxINYV3WYPDof/yxHEE4d1jejvSQ6a1P0JYcL0m+D5Vv7KC5t7eZkfBx+vjver
	WLJxmmAYP2CIcqOeKq75Hcfcldrcrwh8sv8ZC2Ndy0sXQ9JCbMjskul85PD5aeL9PFf
	+u/VN8VCKRIzZKzRiLvujeXAT6x2Syf7BsW+0GQk=
Content-Type: multipart/mixed; boundary="===============3552681700536288140=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] ovmf: upgrading to edk2-stable202505 FAILED
Message-ID: <01010198add73ea2-68b33d2d-5360-449c-9768-e4fe8808ec84-000000@us-west-2.amazonses.com>
Date: Fri, 15 Aug 2025 13:07:01 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.08.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Aug 2025 13:07:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221894

--===============3552681700536288140==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ovmf* to *edk2-stable202505* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe ovmf failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1941 entries from dependency cache.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-30d3ec7ab6c980e7fe25760be1834b680d5914ab"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:30d3ec7ab6c980e7fe25760be1834b680d5914ab"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 6951dfe7d59d144a3a980bd7eda699db2d8554ac
WARNING: Command 'git rebase 6951dfe7d59d144a3a980bd7eda699db2d8554ac' failed:
Auto-merging BaseTools/Conf/tools_def.template
CONFLICT (content): Merge conflict in BaseTools/Conf/tools_def.template

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool onto f4153a09f87cbb9c826d8fc12c74642bb2d879ea
INFO: Rebasing devtool onto 8c89224991adff88d53cd380f42a2baa36f91454
INFO: Rebasing devtool onto a26d85337dbdcd33c971f38eb3fa5150e75cea87
INFO: Rebasing devtool onto f4153a09f87cbb9c826d8fc12c74642bb2d879ea
INFO: Rebasing devtool onto abfc8ff81df4067f309032467785e06975678f0d
INFO: Rebasing devtool onto cfff805481bdea27f900c32698171286542b8d3c
INFO: Rebasing devtool onto 370b5944c046bab043dd8b133727b2135af7747a
INFO: Rebasing devtool onto e9ebfa7e77a6bee77df44e096b100e7131044059
INFO: Rebasing devtool onto 98ef964e1e9a0c39c7efb67143d3a13a819432e0
INFO: Rebasing devtool onto 1cc9cde3448cdd2e000886a26acf1caac2db7cf1
INFO: Rebasing devtool onto 86add13493e5c881d7e4ba77fb91c1f57752b3a4
INFO: Rebasing devtool onto 83d4e1ebef3588fae48b69a7352cc21801cb70bc
INFO: Using source tree as build directory since that would be the default for this recipe
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/ovmf
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/ovmf/ovmf_git.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============3552681700536288140==--

