Return-Path: <walters@verbum.org>
Received: from out5-smtp.messagingengine.com (unknown [66.111.4.29])
	by mail.openembedded.org (Postfix) with ESMTP id BC95960173
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 May 2014 20:54:52 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.mail.srv.osa [10.202.2.41])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id 6DCB021881
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 May 2014 16:54:53 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
	by compute1.internal (MEProxy); Fri, 09 May 2014 16:54:53 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=date:from:subject:to:cc:message-id
	:in-reply-to:references:mime-version:content-type; s=smtpout;
	bh=axSlemk4v6H4AeikYAfmZrUUaEs=; b=MUU9HTAMELxoh5Nr4vmCHhE5rGhR
	4hZsJmYudhNzWof8yrAHSTEUEjSPPuzpEhWJLGhkcAgv+y9JzQ3Ue9CCUiUtJk9m
	qnL4Lba9aH1pIY5N26n+6/CmhRDHhpteuuczxC1oRPpypTInTHyPf9Rg+96tlNH4
	rPh9J/kpUpUIV9Q=
X-Sasl-enc: kBiXfaxpwz9Oxdfex8nKRVYQ3yRghwTgo1ZBHqnLj08P 1399668893
Received: from [192.168.1.4] (unknown [66.31.18.51])
	by mail.messagingengine.com (Postfix) with ESMTPA id B90DEC0000C;
	Fri,  9 May 2014 16:54:52 -0400 (EDT)
Date: Fri, 09 May 2014 20:50:51 +0000
From: Colin Walters <walters@verbum.org>
To: Mark Hatle <mark.hatle@windriver.com>
Message-Id: <1399668891.22845.1@mail.messagingengine.com>
In-Reply-To: <536D3C0F.1040605@windriver.com>
References: <1399591490-13000-1-git-send-email-mark.hatle@windriver.com>
	<CAJTo0LZ75OkvT+yNkbczmqVT1=xSCu1PZainWDyWXAy8Frro+Q@mail.gmail.com>
	<536CF0E6.9060800@windriver.com>
	<1399664736.22845.0@mail.messagingengine.com>
	<536D3C0F.1040605@windriver.com>
X-Mailer: geary/0.6.0
MIME-Version: 1.0
X-OriginalDate: Fri, 09 May 2014 20:50:51 -0004
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base-files: Add /run/lock as a standard directory
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 09 May 2014 20:54:53 -0000
Content-Type: text/plain; charset=utf-8; format=flowed

On Fri, May 9, 2014 at 4:35 PM, Mark Hatle <mark.hatle@windriver.com> 
wrote:
> 
> Certain system configurations may require parts of the /run 
> filesystem to not always be on tmpfs.  (Some situations where you 
> have a lot of disk, but limited ram for instance..  using tmpfs will 
> potentially put your system into a low memory state, or you might not 
> have enough tmpfs to run the system properly.)

I understand not doing /tmp-on-tmpfs, but /run?  Fix the parts of 
userspace that are allocating significant memory there.

And if you're really not mounting /run as tmpfs, I hope you're ensuring 
it's emptied immediately after mounting.

>  /run is one of the directories that needs to be investigated.  Is 
> there actually anything there that may be desirable to persist from 
> one boot to the next?

No.  It not being persistent is part of the API contract.
http://lwn.net/Articles/436012/


