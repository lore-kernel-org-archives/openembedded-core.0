Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD22FD5C0E8
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:26 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17185.1765872136819420817
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=QCWkkpnY;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=hy9SU3z7;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019b262e6fd5-27cf290b-3bd8-4d9f-a07c-fc0fad645db6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872136;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=pYmADNcN1koArp0amOCA2tm98/Mim7S5Twe/uBhx9V0=;
	b=QCWkkpnYya7uYekNlbq6LbZBJxwzcbKZap0ZGSxk4McOVvah0ewS4gseyJUb0TyB
	WTWXbQKfmQZ6i05ATDp+Oo9bRd0XCW27qx1Fxa+nxUlW2+bgsdozADQrNbhGnBWNHE1
	tEU64+qWvqZQ+oJTDjImHPgpxPBxxs6+o8sK+Xko=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872136;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=pYmADNcN1koArp0amOCA2tm98/Mim7S5Twe/uBhx9V0=;
	b=hy9SU3z7zARX9Yva4MX650bhGVDlwkQvieKkCyeFv0EQqpO586Vb8B6vGeFdejzv
	pYmdoHBBoEuxFqB6H731mtsxBXzRCim759fOQqE4Kyq25bKEYZU//LomLaFazlCXukQ
	HFyCbp1s5pHJqkcAB6xbawvU0bJyV4XyRVZjOtzc=
Content-Type: multipart/mixed; boundary="===============3222396752358070895=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] ovmf: upgrading to edk2-stable202511 FAILED
Message-ID: <0101019b262e6fd5-27cf290b-3bd8-4d9f-a07c-fc0fad645db6-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:16 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227786

--===============3222396752358070895==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ovmf* to *edk2-stable202511* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe ovmf failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 949 .bb files complete (0 cached, 949 parsed). 1950 targets, 47 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-0e27aee98c29ce693c815391fb7a89d66de1fde1"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:0e27aee98c29ce693c815391fb7a89d66de1fde1"
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
INFO: Rebasing devtool onto 46548b1adac82211d8d11da12dd914f41e7aa775
WARNING: Command 'git rebase 46548b1adac82211d8d11da12dd914f41e7aa775' failed:
Auto-merging BaseTools/Conf/tools_def.template
CONFLICT (content): Merge conflict in BaseTools/Conf/tools_def.template

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool onto e230f474b87134e8c6c85b630084c612057f253e
INFO: Rebasing devtool onto 8c89224991adff88d53cd380f42a2baa36f91454
INFO: Rebasing devtool onto aea7aaf2abb04789f5868cbabec406ea43aa84bf
INFO: Rebasing devtool onto e230f474b87134e8c6c85b630084c612057f253e
INFO: Rebasing devtool onto 4ef89209a239c1aea328cf13c05a2807e5c146d1
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
--===============3222396752358070895==--

