Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFAF1CD4F27
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:16:49 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2363.1762384580621705410
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:16:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=W75q/LFg;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=jX4jYjK1;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019a564edbfc-2d9cd3de-17de-49ab-8336-af9b871cb4a7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1762384600;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ZbpBoBjTc7x5QAelSXQvQByWpk38fkoY3fccF0QP33Y=;
	b=W75q/LFgwlaxd3anZqFmQ6bmiJAIPiX60QPYjdMHF0xHEHoal47CvtNnHUpPDQ/G
	935sCZiCilz65+j2U0ooJnuBgj9OC89qApWmvo3ly7oebOc4g/55T4jcHR0aTzbtUBK
	Pjbq3g+XrMv5XXkMRuRGlH5oKCT5xCdCWelArjkU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1762384600;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ZbpBoBjTc7x5QAelSXQvQByWpk38fkoY3fccF0QP33Y=;
	b=jX4jYjK1QIf7klxZGmd/rUZW0Ma5BFXNIJ+sKlX1Q3diy1QQm2kwcI9kHz+UlaIm
	QLHAHKrK4TYGtbbxR/3sc2IvjWML14N1ghJ+8EhNs/dpQ33Nxq5FBVU8oWgvFLEsEoG
	Q2nxVtqfrkXbmE3VeI0S1eZ1WYIwBHuO9USwz2h0=
Content-Type: multipart/mixed; boundary="===============5269793138477647809=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-samples: upgrading to
 8e966ebfad343112286ed705eca6be4472dd85df FAILED
Message-ID: <0101019a564edbfc-2d9cd3de-17de-49ab-8336-af9b871cb4a7-000000@us-west-2.amazonses.com>
Date: Wed, 5 Nov 2025 23:16:40 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.05-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 23:16:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225888

--===============5269793138477647809==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *vulkan-samples* to *8e966ebfad343112286ed705eca6be4472dd85df* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade vulkan-samples -S 8e966ebfad343112286ed705eca6be4472dd85df
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1945 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-21867a3c92f5d63de9649ff3a6aa71e76dd03812"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:21867a3c92f5d63de9649ff3a6aa71e76dd03812"
meta-yocto-bsp       
meta-poky            = "master:66ea31cee15309af07afeee8dec8a6fe1d92d28e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 8e966ebfad343112286ed705eca6be4472dd85df
WARNING: Command 'git rebase 8e966ebfad343112286ed705eca6be4472dd85df' failed:
CONFLICT (modify/delete): third_party/glslang deleted in HEAD and modified in 6e47a37a (Add changes from do_patch).  Version 6e47a37a (Add changes from do_patch) of third_party/glslang left in tree.

ERROR: Execution of 'git checkout devtool' failed with exit code 1:
error: you need to resolve your current index first
third_party/glslang: needs merge



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5269793138477647809==--

