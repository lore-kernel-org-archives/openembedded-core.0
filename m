Return-Path: <paul.eggleton@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B525EC43334
	for <webhook@archiver.kernel.org>; Tue, 12 Jul 2022 20:25:41 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web11.14016.1657657532119647443
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jul 2022 13:25:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=bSqFfpxE;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182,
 mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id 87F39204DE83; Tue, 12 Jul 2022 13:25:31 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 87F39204DE83
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1657657531;
	bh=zxJboidesdhKNpwmpnPnZDLizNyJv0DSb8BwHFnAcQU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bSqFfpxEB40kNZ7LibTbfM10IeppHNxeWdvbNqvOHE6MDbzYNVeY1ejlFdWnekhIv
	 IL300NafPKLg9BPlMQMDquLD2/XlkkQZlXCxjGJ9vX3PqBC9Ns27OIj9+eGsi+j3Dt
	 X7v+imLfd/SGVqsBECYr4TKRUS0zTt49lC1tbxQo=
Date: Tue, 12 Jul 2022 13:25:31 -0700
From: Paul Eggleton <paul.eggleton@linux.microsoft.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 0/4] devtool fixes
Message-ID: 
 <20220712202531.GA15057@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
References: <cover.1657597513.git.paul.eggleton@linux.microsoft.com>
 <b6e4ab672382fd9866b9140a22b6632055827e69.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <b6e4ab672382fd9866b9140a22b6632055827e69.camel@linuxfoundation.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Jul 2022 20:25:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167940

On Tue, Jul 12, 2022 at 04:59:38PM +0100, Richard Purdie wrote:
> On Mon, 2022-07-11 at 21:06 -0700, Paul Eggleton wrote:
> > A few fixes for devtool, mostly relating to recipes that fetch from git
> > where S points to a subdirectory of the repo.
> > 
> > Note: I wasn't 100% sure if it was appropriate to be referencing WORKDIR
> > in patch.py; let me know if I should try to rework that.
> 
> It is probably ok. The code won't pick up on the variable usage from a
> hash perspective there but it would be referenced elsewhere anyway.
> 
> There was a failure which is probably from this series though:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/3817/steps/14/logs/stdio
> 
> 
> (I've not confirmed it was the series, I'm just guessing)

Hmm, yes, it probably is. I did run the tests but somehow I didn't see this
failure. I'll investigate further.

Paul

