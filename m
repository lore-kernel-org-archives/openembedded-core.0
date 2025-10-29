Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92A70CCF9E9
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 09:47:26 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web01.3109.1761731238738092298
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Oct 2025 02:47:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=LipYToFa;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=HuMpGFVAH4ZgE/3N42vsMbCAxPf8Ovlj3gNIqCSMTac=; b=LipYToFa7tFz+pctWbt0UVPCX/
	plML5dnqHiKK4davw3PzM3WIYDamBWrBxbX8xk6XFvDMW0AHv77bmgY8YEsVqm+fVHqyrCV23QzuS
	bwIDajwLUlkuLhcsbbSQV500vKrqymW5vSLW2RIFbl71yZyuGgOqfIbNWsCkT0AQUiy/R9ig7lzR9
	xk180BFIt6W+2MEx1l+V1BK8AoUeLyVZPAxEsh67aWV86KyhEtt7t6mXUrVAkSKsHzpZbH8IUiAvl
	i1c4NTCAT/Opg+6mmmo9EZViVUr4qJillP/WHVCUAm6HbxtxWA/VdQ93PyBTi0Opnj350eK2DCKjs
	0id6xTtw==;
Received: from [147.129.179.166] (port=34286 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vE2lt-0000000FmRL-0fnR;
	Wed, 29 Oct 2025 05:47:17 -0400
Date: Wed, 29 Oct 2025 05:50:05 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Alexander Kanavin <alex.kanavin@gmail.com>
cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] what is the point of setting
 "do_fetch[number_threads]"
In-Reply-To: <CANNYZj8k7A_BuS=f_mEpSmoS7Hz8vQVujZ4sFGcqkpzKwVmjSg@mail.gmail.com>
Message-ID: <141ccb4b-3cf7-a867-a52a-47f89fae93cc@crashcourse.ca>
References: <13053c3e-d249-52a2-5186-3dd43fe8a97d@crashcourse.ca> <CANNYZj8k7A_BuS=f_mEpSmoS7Hz8vQVujZ4sFGcqkpzKwVmjSg@mail.gmail.com>
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
 <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 09:47:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225439

On Wed, 29 Oct 2025, Alexander Kanavin wrote:

> On Tue, 28 Oct 2025 at 22:27, Robert P. J. Day via
> lists.openembedded.org <rpjday=crashcourse.ca@lists.openembedded.org>
> wrote:
> > from here:
> >
> > https://docs.yoctoproject.org/dev-manual/new-recipe.html#limiting-the-number-of-parallel-connections
> >
> > if parallel connections are already limited, what is the value in
> > setting this? that should be explained in that section.
>
> I guess you mean BB_NUMBER_THREADS, which limits the overall amount of
> parrallel tasks bitbake runs. The do_fetch thing is specifically for
> limiting fetch tasks. This is useful in situations where the build
> machine can handle lots of tasks, but the (broken) network cannot, and
> so the network access has to be limited to something smaller.

  oh, i know it's for limiting solely fetch tasks, but if the (broken)
network can't handle concurrent fetch tasks, would it not be the
limiting factor, anyway?

rday

