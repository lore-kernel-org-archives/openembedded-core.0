Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 2FEAC60721
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Mar 2019 18:23:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44SjM45R78z5m;
	Mon, 25 Mar 2019 19:23:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1553538225;
	bh=1FZY0sADK7hbW/AyAiTkTSlha5j2PiueUMoZlaCl0mM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QTiGPorqOFCSDYnj3gR/y2Emd2WUKcqVqeY5minXiAgibOA4bGSWq3+LRd/cgKeh9
	LOrXsZ5majnbB3E1azfD6ODHLpM+6JaXeHibMSHwlxP6h6PO0jZ285UfuipZWldRlJ
	UMCjoA+HzJsExRErJ2oEd/VN1X7/fM9qPAvNg1HKf4/AMf0qoj14Ze/NNgXl7itTge
	ovyunP+UysbDgd2KgDSzKMy6A0JYtyZiue8KJ5+mtfx3efMbs+Vy8Q0D91wJySaX/P
	wzc6l9uqrGAKGpdg/f1MK6JEHaSqGCMpOg8v+7PrDw8bUyPb5xYIUVeNXUXcRogUL4
	gvCBL9QeSuc2/Tytg0QM/SI1BwSXkfetvIuj+O6JzECicPRfQWblnTPWM/oWcFt8q+
	qI4YDfgXUXZZAO4g5Psm8xFBfsaeivB2Ci0KXu8HcEN+KJGeXA9fEtytCJyP+jMbrf
	iGp9XGMh9nbGDLX++lYX5F3ASJu1gh8p0YSfewmae/rRsZmk7XJRPeJgQ/ZRla2THA
	xBjR68Ro1QRJHreMOuDBNipG1IFjD4ejk+GEm5LjpW5poYauBQItl/GsY++Luq93H2
	i/NRguTZJy5ehDlLwE08+ON7nHKAC4fEQYA31ZiKd3qAGEUe7X7Y6snDTq8gSoHreL
	L8OlWhL6VfX59eUKtBxuHr60=
Date: Mon, 25 Mar 2019 20:23:42 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190325182342.GA7457@localhost>
References: <CALbNGRRm1QAgY2MHbTUA_Ly9L_Kt6ZzkR55jArkCE53G=ts8tA@mail.gmail.com>
	<CAMKF1sri_7L8sb95L5BjD3d2iMJq4PnqK+pD0XnTibUpwogpsQ@mail.gmail.com>
	<20190323211604.GA20793@localhost>
	<CAMKF1sq=pwuZ6YZKPT3YqCQP-BHfYmxg5rKSMbOn3pi6iNJLww@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sq=pwuZ6YZKPT3YqCQP-BHfYmxg5rKSMbOn3pi6iNJLww@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: musl thoughts
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
X-List-Received-Date: Mon, 25 Mar 2019 18:23:46 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Mar 25, 2019 at 10:44:28AM -0700, Khem Raj wrote:
> On Sat, Mar 23, 2019 at 2:16 PM Adrian Bunk <bunk@stusta.de> wrote:
>...
> > so that the workaround patches can be dropped from packages like NM?
> 
> I think the right approach is to fix the problem where it belongs, and
> generally making changes to headers
> is a long term approach but is right one until then live with
> temporary solutions.
>...

Many of the musl-specific header ordering restrictions could 
alternatively be resolved if there would be an #if defined(__MUSL__)
in the linux/libc-compat.h kernel header to reliably disable conflicting 
declarations in the kernel headers.

I wonder whether there is a better temporary solution by doing something
like that in OE instead of having workaround hacks in various packages
like NetworkManager.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


