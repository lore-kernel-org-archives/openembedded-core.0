Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76205C3DA4A
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 12:31:59 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.11046.1747312318678194312
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 May 2025 05:31:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=lYyAOVjR;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=EQiUspp2;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010196d3ee1672-e3806cac-9760-4def-a049-a9e1871c5d63-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1747312318;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=EMcmCl0yM3d8IXeyN0Ukt+5aJVSjWtq6pQTkUkp/5Jc=;
	b=lYyAOVjRWQXY/2HNjZLtYkPXjcsdNUoUcceeIyekjD+mNEhcOXDNKVSldK56SJ3E
	13KoFDvOdNj74lIi6nKC3DQy51/NLWgWggJsILihmWIv1xe0wjDhihMq8zwgtTzOlCv
	L2nCnR4gkHT7tDDLPScGp4jQZqET+9R0Ffo6+Cdk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1747312318;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=EMcmCl0yM3d8IXeyN0Ukt+5aJVSjWtq6pQTkUkp/5Jc=;
	b=EQiUspp2xwEtqzc5SF4+m2gU/sjvCJCI8UgBmTuG53u6WiY47g04BBFTWq9gS8QJ
	N+sT/bV8cw/+69et4yqAfrxF69CbbPIXNjr7CkAXkVDBfs5wuGwIwSY8Q1mYVbrQRdO
	SJYaWMaQ6a16JCfyMji1jYargClo2x2HcgJ3PXN0=
Content-Type: multipart/mixed; boundary="===============8976276263734159567=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: 
	=?utf-8?b?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aSA8emJvc3pvckBnbWFpbC5jb20+?=@yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] rpm-sequoia-crypto-policy: upgrading to
 56b301d43dd86b5d9082f8297984a5a7ec8fe2de FAILED
Message-ID: <01010196d3ee1672-e3806cac-9760-4def-a049-a9e1871c5d63-000000@us-west-2.amazonses.com>
Date: Thu, 15 May 2025 12:31:58 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 12:31:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216624

--===============8976276263734159567==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *rpm-sequoia-crypto-policy* to *56b301d43dd86b5d9082f8297984a5a7ec8fe2de* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade rpm-sequoia-crypto-policy -S 56b301d43dd86b5d9082f8297984a5a7ec8fe2de
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1916 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.12.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:54f5db8eeb9b13c7b6fb6dee6341e7a1b908f489"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
ERROR: Execution of 'git checkout 56b301d43dd86b5d9082f8297984a5a7ec8fe2de' failed with exit code 128:
fatal: unable to read tree (56b301d43dd86b5d9082f8297984a5a7ec8fe2de)



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8976276263734159567==--

