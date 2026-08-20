Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C58BAC5DF8F
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 07:23:07 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1808.1787210578811973670
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2026 00:22:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=TGTRLOz2;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=UjgLPjwA;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101a01e0d3754-af455f8f-9f84-4dd1-a5f0-a412bf390045-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1787210577;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=qIpxZKQOYenDL/pF8FzctTlyZFI21SvY+zq6VejU3Hw=;
	b=TGTRLOz2p8l06tgtHhYKeeY+BVYjhJhydcNkJrHk6+JMBlzT3BiD8yxoD4C0ZW8T
	jRIr7nmqQavS+QB2EEMyJ0Ucx1bbfC6NbwXV5jZw1ra3i4OrWK5E3U+z0vbwZQSdo9l
	jMdtr/MvTxdY5tPiY2AYwFrxfnDE7Wvt55XO0MC4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1787210577;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=qIpxZKQOYenDL/pF8FzctTlyZFI21SvY+zq6VejU3Hw=;
	b=UjgLPjwA45twXsh5XF098EkVQZdetv0+TEZuPFtekBm3XMnS7/54pkZy/fPAh8d7
	Av6614Qj/iiNtK0GTWRWcYoiVTZrlapQn18dEwIdjJgjrsKBgkwc+nAxYJnRJBIeFKA
	eqNBWpZAXmsYcmZFjiDBml1LXBSYTjB+g5E31p2g=
Content-Type: multipart/mixed; boundary="===============2612846833139598646=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>, Khem Raj <raj.khem@gmail.com>, 
	Khem Raj <raj.khem@gmail.com>, Khem Raj <raj.khem@gmail.com>, 
	Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH]
 go-cross-x86-64-v3,go-cross-canadian-x86-64,go,go-runtime,go-crosssdk-x86_64-pokysdk-linux:
 upgrading to 1.27.0,1.27.0,1.27.0,1.27.0,1.27.0 FAILED
Message-ID: <010101a01e0d3754-af455f8f-9f84-4dd1-a5f0-a412bf390045-000000@us-west-2.amazonses.com>
Date: Thu, 20 Aug 2026 07:22:57 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.20-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 07:23:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243808

--===============2612846833139598646==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *go-cross-x86-64-v3,go-cross-canadian-x86-64,go,go-runtime,go-crosssdk-x86_64-pokysdk-linux* to *1.27.0,1.27.0,1.27.0,1.27.0,1.27.0* has Failed(get_env).

Detailed error information:

Empty environment returned
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (05:04:58.766006)
NOTE: Reconnecting to bitbake server...
NOTE: Previous bitbake instance shutting down?, waiting to retry... (05:04:58.766856)
NOTE: Directory listing: ['command-2-cmds.log', 'conf', 'oe-time-dd-test.dat', 'command-1-plain-cmds.log', 'bitbake-cookerdaemon.log', 'tmp', 'README', 'buildhistory', 'command-2-write-config.log', 'cache', 'command-1-write-config.log', 'init-build-env', 'upgrade-helper', 'downloads']
NOTE: Retrying server connection (#2)... (05:04:58.876833)
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 955 .bb files complete (0 cached, 955 parsed). 1984 targets, 58 skipped, 0 masked, 0 errors.
Removing 6 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 6 recipes from the qemuarm sysroot...done.

Summary: There was 1 ERROR message, returning a non-zero exit code.



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============2612846833139598646==--

