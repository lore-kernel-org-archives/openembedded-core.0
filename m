Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2DBCC25B0F
	for <webhook@archiver.kernel.org>; Mon,  1 Aug 2022 08:14:56 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com
 (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web08.22240.1659341691313591899
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Aug 2022 01:14:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=hDpD0ZHl;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31,
 mailfrom: 010101825878d536-ed53d2ea-2a07-4275-b459-632c263f8148-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1659341690;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=xBidSV5535vZgv2WNQo8X8iQViPlKxhTQt1+DIvCfmI=;
	b=hDpD0ZHlCmS3m/n/03RM3/kVJK3anXaEAdQvPa1ZBbLyGl2O54mzavnMdbjrHrIX
	IF7jlK11msxwdm3+sPsJthYIqyGBBa2O/z2dvNmmoxEZBAAE08loQuHBvbCMmNPSqB1
	s/TiQk0jtT1IQrwS9AQoyo4eAtdVvNQAROCIetLA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1659341690;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=xBidSV5535vZgv2WNQo8X8iQViPlKxhTQt1+DIvCfmI=;
	b=g20mhujgtB8Cr23BZLUFRpI41QvrilmhZCwJxJah+bhA1oyv9Glow4shwFzTtpr6
	79lW6enKa5HHBR77UoD24YdQve2IzMqSWZkKESuvxSxqzkqKq4Ca6L1/yLEBCJn9ZJO
	S/1YqXG3LgnMTnm4IvSWzuDCdtB4gbPFiToRU7sc=
Content-Type: multipart/mixed; boundary="===============0574866065931546196=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-jsonschema: upgrading to 4.9.0 FAILED
Message-ID: 
 <010101825878d536-ed53d2ea-2a07-4275-b459-632c263f8148-000000@us-west-2.amazonses.com>
Date: Mon, 1 Aug 2022 08:14:50 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.08.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Aug 2022 08:14:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168714

--===============0574866065931546196==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-jsonschema* to *4.9.0* has Failed(get_env).

Detailed error information:

Empty environment returned
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1659 entries from dependency cache.
Parsing recipes...
Summary: There was 1 WARNING message.
Summary: There were 3 ERROR messages, returning a non-zero exit code.



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0574866065931546196==--

