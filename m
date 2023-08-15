Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF7E1C2FC2E
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 07:54:10 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.129636.1692086041123541997
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Aug 2023 00:54:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=FsIDOQn6;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=mdIxT8Ub;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010189f82ff65d-ca7f4e75-bf7b-441f-be3b-eb2afd224cae-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1692086040;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=2f6H35wgAhw+FyqpC2dsB+rsAousK/ZmOueUqZC4ssg=;
	b=FsIDOQn60VCmQSiQ1AlODT67nLDxWTzLbZ4mj7U6zWMZH6CDcjOA7no1Kl1v+/XF
	BdP34N6Ntc4Oxyf1FuMjSpt8kBRzZsRm3sn13pAn+3wgrwejPz23Bjmn0OrSEsqpTAr
	rM7Lw8Qhym0NvjfFCx5b/4wbWYXPeL8QKl+uF8/8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1692086040;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=2f6H35wgAhw+FyqpC2dsB+rsAousK/ZmOueUqZC4ssg=;
	b=mdIxT8Ubmr7az1SJiW6IowNY16n3p0J4kBgqo8nHkrTMephTfgnqTcBqty2fzRqF
	H5m/1gKFajQRzEituDm3yZkci0ff6JAszYdYhu/0waE2KxQnk+nrsYk8Q/gwgaR4l21
	cA9fNBE1WYr9R9wvSVk1IGHctZHLkikmhPQDsoyE=
Content-Type: multipart/mixed; boundary="===============2790341911959271364=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] dhcpcd: upgrading to 10.0.2 FAILED
Message-ID: <01010189f82ff65d-ca7f4e75-bf7b-441f-be3b-eb2afd224cae-000000@us-west-2.amazonses.com>
Date: Tue, 15 Aug 2023 07:54:00 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 07:54:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185946

--===============2790341911959271364==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *dhcpcd* to *10.0.2* has Failed(get_env).

Detailed error information:

Empty environment returned
Loading cache...done.
Loaded 1805 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies
NOTE: Runtime target 'udev' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['udev']

Summary: There were 3 ERROR messages, returning a non-zero exit code.



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============2790341911959271364==--

