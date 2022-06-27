Return-Path: <seebs@seebs.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC546CCA473
	for <webhook@archiver.kernel.org>; Mon, 27 Jun 2022 14:11:08 +0000 (UTC)
Received: from mail.seebs.net (mail.seebs.net [162.213.38.76])
 by mx.groups.io with SMTP id smtpd.web08.42837.1656339065096371165
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jun 2022 07:11:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@seebs.net header.s=mail header.b=lXxCxlh3;
 spf=pass (domain: seebs.net, ip: 162.213.38.76, mailfrom: seebs@seebs.net)
Received: from seebsdell (unknown [24.196.59.174])
	by mail.seebs.net (Postfix) with ESMTPSA id D61B92E8951;
	Mon, 27 Jun 2022 09:11:03 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=seebs.net; s=mail;
	t=1656339064; bh=P2SBmxMB7KV0DM7XiOxZHCg0WuBNDBt57XIPYjCdOCY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=lXxCxlh3yvY7qgz3ydgSXIManNH/53eSK3r7RCSuagLA0bjZmsreEeNLizPlO3Aus
	 WKQ3ijR8JSZvWbwT7rjobfUHUOU0+YAzFvKBafPjKr9t08FGL8CWDVC5cXukx25qil
	 f2sZQwDfTWscqnel/vrQWppfkRTusep4fGSf3Ecgx9QcTxAJtaJAcoIk8g91Qt22RX
	 1YP464/otSzm0BvN8dHS580++wv8rth7LnYY/hDNYWjyUBxtWW1iv28+0U5ZhnvHj3
	 gbMLhYnxiD15oNnChr0r87zeK3yO2JfeizvjdP3Zors+FWiPdNznS3233RAjhDqdwZ
	 tJVQ6lNNmxkWw==
Date: Mon, 27 Jun 2022 09:11:01 -0500
From: Seebs <seebs@seebs.net>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: pseudo database integrity checking
Message-ID: <20220627091101.44f09689@seebsdell>
In-Reply-To: 
 <ced1bde4cd0d5ef021c13088ffe4fd522648811c.camel@linuxfoundation.org>
References: 
 <ced1bde4cd0d5ef021c13088ffe4fd522648811c.camel@linuxfoundation.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jun 2022 14:11:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167323

On Mon, 27 Jun 2022 14:52:39 +0100
Richard Purdie <richard.purdie@linuxfoundation.org> wrote:

> b) We could add a new command to run an integrity check on the DB to
> pseudo. If we do that, we would then be able to show the user a decent
> error and above the timeout issue. The question is where/when to
> trigger it and whether races could occur against the check (e.g. where
> multiple fakeroot tasks are running in parallel against the same
> WORKDIR).

I thought there was a function that did roughly this once at some point.

-s

