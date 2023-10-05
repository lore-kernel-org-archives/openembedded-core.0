Return-Path: <mac@mcrowe.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DE65E93717
	for <webhook@archiver.kernel.org>; Thu,  5 Oct 2023 20:37:24 +0000 (UTC)
Received: from smarthost01b.sbp.mail.zen.net.uk (smarthost01b.sbp.mail.zen.net.uk [212.23.1.3])
 by mx.groups.io with SMTP id smtpd.web10.26689.1696538241473930191
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Oct 2023 13:37:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mcrowe.com header.s=20191005 header.b=BE5EjYFJ;
 spf=pass (domain: mcrowe.com, ip: 212.23.1.3, mailfrom: mac@mcrowe.com)
Received: from [88.97.37.36] (helo=deneb.mcrowe.com)
	by smarthost01b.sbp.mail.zen.net.uk with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.90_1)
	(envelope-from <mac@mcrowe.com>)
	id 1qoV5z-00074a-EB; Thu, 05 Oct 2023 20:37:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mcrowe.com;
	s=20191005; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description; bh=Oo1HsAYnuV6m1o+MXP+s/sLC06ouleAzVpHBdLs3GTU=; b=BE5Ej
	YFJ5d6xAD72GkmoxrXllzy+GowlnJUPMShxya+qOeaqcsR1CXOJJLoOWy/lpBTulXXVhAhz61TeyC
	+yPmMsER6PVgiTKjZZyKp58x1cPjq87xr4wLwifWPwPl1XxHs4Rcbivh1S4eocAzZKRaLRaygiCfg
	VB8K86sYabdSHpOdz3s3EWiWKZFGq0GL6V9kEs9rdr4IJJL56kxbG87TYsZZ7AdG+RZdl6ZSNSif3
	4kDm4FRjBI2T75nyv8zan5P2XTJyuOsft/K+CU9jokeg/WrwQsaUZ4imgxGSfivlDg4H/pW2iVYxI
	S1lMOCvrpHI0rU0uFvbfkvXkpXbNQ==;
Received: from mac by deneb.mcrowe.com with local (Exim 4.96)
	(envelope-from <mac@mcrowe.com>)
	id 1qoV5z-00A4fl-0W;
	Thu, 05 Oct 2023 21:37:19 +0100
Date: Thu, 5 Oct 2023 21:37:19 +0100
From: Mike Crowe <mac@mcrowe.com>
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [dunfell][PATCH] glibc: Fix CVE-2023-4911 "Looney
 Tunables"
Message-ID: <ZR8ef9iDFzIjySyP@mcrowe.com>
References: <20231005085407.2200644-1-mac@mcrowe.com>
 <CAOSpxdb-qBLkj8D9afpucuB5AYqB+xjcP18HpSrUCG2AQcvEQw@mail.gmail.com>
 <ZR8ECxFrS1JgOzfr@mcrowe.com>
 <CAOSpxdZauK+KPAzWMn5hFHepNuYRPN=4NzcrwiSm3OLUnWy5jg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOSpxdZauK+KPAzWMn5hFHepNuYRPN=4NzcrwiSm3OLUnWy5jg@mail.gmail.com>
X-Originating-smarthost01b-IP: [88.97.37.36]
Feedback-ID: 88.97.37.36
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Oct 2023 20:37:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188736

On Thursday 05 October 2023 at 09:25:44 -1000, Steve Sakoman wrote:
> Strange!  Nothing that should affect glibc.  I'm applying to the head
> of stable/dunfell-nut:
> 
> https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

All my fault.

I managed to lose my mail-sending wrapper in some recent configuration
setting cleanups and the patch went out via Microsoft's mail server which
seems to have corrupted the whitespace in the patch. I'll post v2 shortly
via a less broken mail server.

Sorry for the confusion.

Mike.

