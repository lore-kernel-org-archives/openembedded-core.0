Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83BF6C48BF6
	for <webhook@archiver.kernel.org>; Sun,  3 Mar 2024 19:37:44 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.80465.1709494660933446225
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Mar 2024 11:37:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=KQs5Ul8r;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=djednz7XzMg3oG3oD/4CIWfYsfF2eiOcxjsqn5WopgM=; b=KQs5Ul8rhysY7IJLeUSOEI9R5Z
	mZ5BYoRWGE6Iyksn+prcHqGpBxwYsPJqAQb7rmGRdI4FZA2OPur+qt2y5nBL6zJajhxArksc5rRdY
	7sWjHs6aRYvnXt0KgKAhgOyqeYgcWHPvAtsEm7EihHGwJziWUcpxo+dxj7uXvyjNXrQkYh95f6uKZ
	5JFa9ptonfQWweqW46K08SRvll4B6eZxtPUnmKRv/OXLY0SA5P2wiEEKYS3wxlh1z8BiP0j/s2d4r
	B6iMIM8qraBsv5xUvGGX1UEhWFlKnrkgVk7qstn/Yp44qbljUWmbyr76l3wByVLv/eavuto2bGHmW
	b8zHtM6Q==;
Received: from [174.115.86.167] (port=55478 helo=fedora)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1rgreQ-003n6x-1V
	for openembedded-core@lists.openembedded.org;
	Sun, 03 Mar 2024 14:37:39 -0500
Date: Sun, 3 Mar 2024 14:37:28 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: does one need to "add" packages to ptest already under
 ${PTEST_PATH}?
Message-ID: <517bf782-21dc-e5bb-8117-157b6f4aec4@crashcourse.ca>
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
 <openembedded-core@lists.openembedded.org>; Sun, 03 Mar 2024 19:37:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196575


  apologies if i already asked this, i'm trying to juggle a dozen
things at once.

  here:

https://git.openembedded.org/openembedded-core/tree/meta/recipes-devtools/python/python3-cryptography_42.0.5.bb#n63

what is the point of adding to FILES:${PN}-ptest something that is
already under ${PTEST_PATH}? especially since the do_install_ptest()
function above it installs even more but doesn't add that stuff?

  obviously(?), it doesn't hurt, it's just puzzling. i can submit a
patch to delete the extraneous stuff for clarity.

rday

