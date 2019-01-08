Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 8DB956BE3A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Jan 2019 19:15:50 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id e5so5604432qtr.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Jan 2019 11:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=NViyIwGYS5ylS1p9k/4ykV4+ZtGeqC9fxtCV6kRk38g=;
	b=eviEGQRy3sJNgjW54PkZ58b3iIIDfIvDZ4EWj2JI9qjji0exOmHR40+1pOVmdqb7zL
	M2WvGJbZabgCRpMA5Bqvgu2uqwUDGKM1CApLOYWTZBs4NamFFLjvUDxFGIo4pWa6gIxv
	nEdyZXull9MsD9d7rixzYP9wUuCnUGq6WfMs0jrYpB8/8dOMNLtCC8jRuN2S8X9D5/yS
	tPfa6sRL/FPx1wAEtk6DEMuvxomRHC28/3rVvsNxauWXK+AG8KOiWwufIx8NNmI/hfxp
	GCflZepMBP/IsiDw5x7hrS0YRM2yO+M5p6Cigo/lszJ9DbMHtTHjHyOerCFxN843ShNZ
	3Dyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=NViyIwGYS5ylS1p9k/4ykV4+ZtGeqC9fxtCV6kRk38g=;
	b=adSDLHmrZmVycd/l/anKZGrMX1Ifyaz8MpBWfIi5P0/6YUnKoMJGxYmBMmG1oJtqUl
	tbj1T3ge6329ANJGhHxZVAlKwQy1I4+HU11wSZCVk5ozCeQKqmiMGhoZ9lhFSI3wxvN7
	tQcDpU0G46NvjO7xtTh90dXXT1uQxJC1V3zrlmDG4R8KFdhw6nRgH4U8VsVZvnXlJy2r
	TpyqIAkgXpt5idp17szUilizktpWtaie2+DIVj5KzA3sWB1PG3jXE0We8kYkFZQfX61h
	7axJYZKBkmzTvWFaL1xbvx7P+3JiapQs7Kgon65rHsjmeXriXVSbfUdvDix4KFUm/DSw
	cP1A==
X-Gm-Message-State: AJcUukesadYtSKDtiPVoFhOKsNvwN7rjjII4eTojEWwaYgno505Z/3eB
	kjvlVpZK4I7WkDH1x/gJSHJf8T2GAYveUJjK+Ok=
X-Google-Smtp-Source: ALg8bN4ctdz0TweVieNKokj8k5iepwoyqiNMUYzmuq05IfYqTioud9dsm195NeykIXTwf7nxLd6YkdVaRpu8x9hCocc=
X-Received: by 2002:a0c:a144:: with SMTP id d62mr2998427qva.50.1546974950993; 
	Tue, 08 Jan 2019 11:15:50 -0800 (PST)
MIME-Version: 1.0
References: <cover.1546961583.git.alex.kanavin@gmail.com>
	<CAMKF1spfq3brB-L+YCWY7joFC41KshZZwLzQcha3wEO3otBiQw@mail.gmail.com>
	<CANNYZj_gZFZpJaLkSSeabMDkFAw2oO+vM80H_q6o9cBsKaeycg@mail.gmail.com>
In-Reply-To: <CANNYZj_gZFZpJaLkSSeabMDkFAw2oO+vM80H_q6o9cBsKaeycg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 8 Jan 2019 11:15:24 -0800
Message-ID: <CAMKF1sp8BCRZfmBbamqobM-CoqKMG5CoWevqTAM1c83GJb+gWA@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] Reimplement perl recipe using perl-cross and update perl to 5.28.1
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
X-List-Received-Date: Tue, 08 Jan 2019 19:15:50 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 8, 2019 at 10:56 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Tue, 8 Jan 2019 at 19:49, Khem Raj <raj.khem@gmail.com> wrote:
> > There were several recipes in extended layers such as
> > meta-openembedded which failed
> > in last attempt, have someone considered the failures that I reported
> > last time ?
> > maybe Richard can stage it in master-next and we can give it another shot.
>
> Are you sure you are not confusing this with an alternative attempt to
> upgrade perl by Jens Rehsack?

yes, I thought the problems were related to perl version rather

>
> I did test meta-oe, and identified one recipe (adduser) that needs
> adjustment. I'll post the patch as soon as this is merged. If you can
> test meta-oe once more against the latest version of my patches, I'd
> appreciate.
> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=akanavin/perl-sanity
>

thanks for doing so. I think meta-perl is another interesting layer
that you can try
if not yet tried.

> Alex

