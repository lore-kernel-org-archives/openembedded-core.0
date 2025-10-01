Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8591ACCA472
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 13:32:12 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.17915.1759325529020407690
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Oct 2025 06:32:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=zoqD5aIc;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=aALvjwh7;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101999ff91e95-f362a240-2934-40af-abc2-b3420a0a5a3e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1759325528;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Eggug8SKD1QcapHWvFagzLkKYUNs35SxiRZ3eEvfhxQ=;
	b=zoqD5aIcg9LpL2q/dTwdKxROHjYiL723dpptMuEvAYChVQ9SmjNng4IYppAPtAF7
	t6flPs293FWa48Yqudb7yUfeHHcp63yvPIvu4vZMpkiVasNfBmca39QJxptcfi5npu2
	9Y84wUIngROHeAoYJYly7e2TLu4o41zux9tlUq5k=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1759325528;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Eggug8SKD1QcapHWvFagzLkKYUNs35SxiRZ3eEvfhxQ=;
	b=aALvjwh75QSlCHoKFfRl3+eis8urT/G00Jiu2YKYbez66e8lym4tzDANPwOHWqrx
	/06QK9vqMT4QQA+okBMvkYVdZlGuxjLXKbRJ6Sh/Zv7z8JTDUWim6VLdpNaaYFkKBw/
	RjDrkJ77FvuGQkrTnFOpu1RACAIRV7Rg9BCKjCOE=
Content-Type: multipart/mixed; boundary="===============3532816187575442834=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>, 
	Viswanath Kraleti <quic_vkraleti@quicinc.com>, 
	Chen Qi <Qi.Chen@windriver.com>, Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH]
 systemd-boot,systemd-boot-native,systemd-systemctl-native,systemd: upgrading
 to 258,258,258,258 FAILED
Message-ID: <010101999ff91e95-f362a240-2934-40af-abc2-b3420a0a5a3e-000000@us-west-2.amazonses.com>
Date: Wed, 1 Oct 2025 13:32:07 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.10.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Oct 2025 13:32:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224210

--===============3532816187575442834==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *systemd-boot,systemd-boot-native,systemd-systemctl-native,systemd* to *258,258,258,258* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe systemd-boot failed.
NOTE: Reconnecting to bitbake server...
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 944 .bb files complete (0 cached, 944 parsed). 1939 targets, 43 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-702c515a7568b10bb208635d1d747b529e810690"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:702c515a7568b10bb208635d1d747b529e810690"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
INFO: Creating workspace layer in /srv/pokybuild/yocto-worker/auh/build/build/workspace
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 781d9d0789379d1ea1f2ecefb804d41e9c8b6c38
WARNING: Command 'git rebase 781d9d0789379d1ea1f2ecefb804d41e9c8b6c38' failed:
Auto-merging mkosi/mkosi.conf.d/arch/mkosi.conf
Auto-merging mkosi/mkosi.conf.d/centos-fedora/mkosi.conf
Auto-merging mkosi/mkosi.conf.d/debian-ubuntu/mkosi.conf
Auto-merging mkosi/mkosi.conf.d/opensuse/mkosi.conf
CONFLICT (content): Merge conflict in mkosi/mkosi.conf.d/opensuse/mkosi.conf

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/systemd-boot
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/systemd-boot/systemd-boot_258.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============3532816187575442834==--

