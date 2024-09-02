Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 686E6CD13CF
	for <webhook@archiver.kernel.org>; Mon,  2 Sep 2024 10:39:28 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.35806.1725273561252571619
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Sep 2024 03:39:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=yROG/xmO;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=pklR3TwY5xclpTN4mbqCr7mxeK4grkUnAnJQlqrWsw0=; b=yROG/xmOrEld720e+HFqGh0Jbd
	FSTMcsWgtPNHG7FojGkGEKrh/iL2ZKDFRspBUOyPgzssHplZ5pvqdAnLnREkeYYGjZt2mtHb4XJLS
	hD0RblMgzzwgTxcI5Kp43TLSWJPVpFIPiQaODvqaDqUUK5niZEN/Yn3gaFpzmmsjifNSIKJkGbg3o
	qGvJ8botcLwxy9Mn74/ezH01AdHx0HR0H+Iv0JHn7/lpEQ3VUSsGvjHzYLW06iAkYYwdFUNFhSckl
	cCtuLT8m6/6lztl8vqre7JhO+1eW04uzJEZV1jShXd3hoqcyK8nd3mqXBKXO/IcLgZXtpOqnSQU2d
	yGTHDWXQ==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:43406 helo=fedora)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1sl4Sr-00000009hpB-4Bw3
	for openembedded-core@lists.openembedded.org;
	Mon, 02 Sep 2024 06:39:19 -0400
Date: Mon, 2 Sep 2024 06:39:11 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: why does EXTRA_IMAGE_FEATURES += "ptest-pkgs" not install *all*
 ptest pkgs?
Message-ID: <5557141e-86f6-1a86-2069-9f566e766385@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Sep 2024 10:39:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204088


  i'm sure i've overlooked something silly, but in building a
qemuarm64 image to demo ptest to some colleagues, poky by default sets
the "ptest" DISTRO_FEATURES setting so all of the corresponding ptest
packages are *built*, but when adding:

  EXTRA_IMAGE_FEATURES += "ptest-pkgs"

only *some* of the ptest packages are added to the image. eg: while
bzip2-ptest is built, it is not added to the image, as are a number of
other ptest packages. if i *explicitly* add that package, then it gets
included.

  is there some obvious reason that a number of ptest packages are not
included in the resulting image, despite them being built?

rday

