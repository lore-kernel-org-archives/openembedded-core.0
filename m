Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAFF2C433EF
	for <webhook@archiver.kernel.org>; Wed,  2 Mar 2022 21:47:45 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com
 (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.3524.1646257664597001924
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Mar 2022 13:47:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=E6DPhVq8;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30,
 mailfrom: 0101017f4c9a6d33-3935dbe9-00f4-48cc-a40a-641da84ad808-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1646257663;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=2PsfyPZOfWf659SwdnSXvbgnouWhGrxP0a3t3gmFhNg=;
	b=E6DPhVq8/tyQM7vfjJOCC1JorS26NH9/zz8yEvoOXbe2I+PGJ54Wjug30yoM6WRS
	PyhiLBzbYKAs8NI9k6JQBoFjrk5ZzAvAUdGIBpt5bRiZ4zsb4YKbyjek95i1kAsxq3W
	Cn6mBDaq4B2xM8jCQVLrW+QCi/paJkl+IQJcspV4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1646257663;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=2PsfyPZOfWf659SwdnSXvbgnouWhGrxP0a3t3gmFhNg=;
	b=P3QyK6bbEv8PqGZFTyPoz3PlcPNaMwWcrK9ZsoZsicjljRmsy36O25F7B0ZSgMB0
	TN9p0mL0i1h7+JBK7zENAxUV6+htrnPM+Gim72qxAgU8qp1RMvhRMs9HPMvn/W033rL
	A5B0Tn00mZ+AKRa9crNKtwXjUvOdHYOAxdrNRHaE=
Content-Type: multipart/mixed; boundary="===============2082060689405769523=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: test email from AUH
Message-ID: 
 <0101017f4c9a6d33-3935dbe9-00f4-48cc-a40a-641da84ad808-000000@us-west-2.amazonses.com>
Date: Wed, 2 Mar 2022 21:47:43 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.03.02-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Mar 2022 21:47:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162625

--===============2082060689405769523==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

this is a test email
--===============2082060689405769523==--

