Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot0-f180.google.com (mail-ot0-f180.google.com
	[74.125.82.180])
	by mail.openembedded.org (Postfix) with ESMTP id 158F16E672
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 May 2018 19:12:10 +0000 (UTC)
Received: by mail-ot0-f180.google.com with SMTP id 77-v6so14440932otd.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 May 2018 12:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=71DFYGdj1eMOVulSq29dqwnA7xhFgagev6r0ndPXyPc=;
	b=Xd/FVrqHqhGed+YIPEDPo6JTqUAfsuV2YMGB6RkKBupnqY/q832Ha5fasmJXAWTsk1
	RM9qGHZ2LWfGhmNwXHZ9GMwPlyCg8HIWhSgNbXPPvHekFYQlc+6xpNOTZ58v0NF4ZsJ2
	oJ054E4ErydSbJjLs2sQMyLdAFAJli69zbkSKlPOVqq0sNyhx8R7n+/RbyOAsazTOyza
	yzdxeLH1vtjswj/RieHRhNmzyphDjX31tQGJ6SwYn4jmNIYG4wam+hEirvxRHSxTBAEy
	ReXnYDxHlklnN7adw4ODY8doo2O0uzvvof39+hXbLcxBa/w1qeKYE1bTIQHfKnhFZNDa
	OvPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=71DFYGdj1eMOVulSq29dqwnA7xhFgagev6r0ndPXyPc=;
	b=Z22CQZ3McQkQv+Le6P0Hhq5lriN9kmfIA0pCfgcLvSNuvcOPCv5Pq5ZFrD7TSs9kFp
	B1R5K8wvJ7pbOx1h/r0ymPvlv9y+rhOYGGghMrX/Ht6qcEqj4dVvNj+zt6D47EsIn6R2
	UIaTQ7Y+BCIOrLqmO5KBgtbWj0brdeySVtlTDZR46rSaTxnCMeSh++QdBhV2c1XF5osq
	StAG+idGCLhxNbScCGhryJaUkH20f2ZsS1ERiLTP1yZOB+BUYULMxR65+vm7HNFzPOOb
	oLZfAeA0nXW9qcGaHt8S2UyAWI1fIdwm3OsePEKr04kncRGM80jbT39u9zrkJ0fMalGx
	5KAw==
X-Gm-Message-State: ALKqPweDQ2Ji2LqcaXB7MgTb5AQtlkZxc2BbI6+bewY+Qv//xcOltKMJ
	+Mt3tZAX489ZJ9/eZKFdzyY7Tqf3yxj+QVokqRc=
X-Google-Smtp-Source: ADUXVKKpbHostcs9llsjSgRGyPAli5ItGLyDr0hutaXNR9bV2/I15o4HzxeixOofG1INtH1G2sbtPKFvMDl6hhjtnFY=
X-Received: by 2002:a9d:55a5:: with SMTP id
	m34-v6mr2745211oth.358.1527534731847; 
	Mon, 28 May 2018 12:12:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:90cd:0:0:0:0:0 with HTTP; Mon, 28 May 2018 12:12:11
	-0700 (PDT)
In-Reply-To: <70B5B287-3F28-4055-9AEF-FF23C60FF6F9@gmail.com>
References: <613380E3-73CD-4A50-B8E3-337912D28A93@gmail.com>
	<44b3165e-42fa-6cfc-ca9b-cc11892db157@linux.intel.com>
	<70B5B287-3F28-4055-9AEF-FF23C60FF6F9@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 28 May 2018 22:12:11 +0300
Message-ID: <CANNYZj-oY9-oOTRfoJhB2zM7rZ9_3FMF6HQGirEVPsDe5C6fDQ@mail.gmail.com>
To: Jens Rehsack <rehsack@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] scripts/oe-init-bashrc: add more user-friendly oe-setup utility
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
X-List-Received-Date: Mon, 28 May 2018 19:12:11 -0000
Content-Type: text/plain; charset="UTF-8"

2018-05-28 21:41 GMT+03:00 Jens Rehsack <rehsack@gmail.com>:
> When I log into my build machine, I just do
>
> $ oe_builddir use ~/gpw-community-bsp/gpw-yocto-platform/
>
> and I'm in the right location and have all environment settings prepared to start a bitbake immediately.

oe-init-build-env does the same thing, how is this better?

> $ oe_builddir help
> oe_builddir <command> [argument]
> Available commands:
>     use         use specified build-dir, setup when local.conf and/or bblayers.conf are missing
>     setup       create default builddir
>     avail       list possible build-dir's
>     layers      list layers used in BSP
>     repos       list repositories used in BSP
>     prune       prune old builds
>     off         remove all settings from oe from shell environment
>
> Tells you, what could be expected (very short).
>
> It's all plain shell - so everyone can adopt it easily to local requirements. Further, it supports setting flags and tools within ''oe_builddir use''.

I'd say you should look at existing tools, specifically
oe-init-build-env and/or oe-setup-builddir, and add any desired
functionality to them.

Alex

