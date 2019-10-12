Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 1EF307F63C
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Oct 2019 10:12:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46r0xT74ndz4Q;
	Sat, 12 Oct 2019 12:12:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1570875150;
	bh=L8AyW9Y4QNgYWSNOyMFUFAD4FqnXBAFakmyT95ckjSs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bgL19RV/C1pQ4UlzJyUH7+Y8IVlkXWGLSocs3ZqWRw6f6E3T4wZq+Kb0vT5XT1Oam
	726pz7GIe2RehWD56JeAQZVjTNdvW/7/OtDtJm/Af3iKd3OIrnBAwWOGSD9H/kkqEU
	qmbyyWAdipyi56QFXNE64H7kGHSmzlflLT6rK3jUMtFnpVQrolT3tcDZkq0LSTPqe2
	36nWBUX0EGaqlJPz8iAupL/8NT14YV+056r0cinlgokmv4B6UJmZu70gjK8xZRFPNr
	w2YQ4AjLZz998tI0tmxue8fXA8btZtZhNvPQ2Odea58xOQ3wZQl+YQK6/erieK5ykN
	t+w0D2ZWu/zH0v4kbRSL7EpgQjjNcXwnZfMlVPQdBu247nV6lD94D4V2WNoMseq1BE
	PT71ExaGYNbvAGCQXcRahElsOdaOQI86k3pK2Qr2S8gs4DS8HOiQlyUHCRu87D+CCP
	MKvEY6nF6/vtYHKj+gULlK3E5PyYQCKPsNP61H09mGmUC96XBAj7m9DFA9aby5wrBk
	/oymAX5ScJrArptLREmfryceUH6htJfP1OKTpLaOxoDZevY5nkBGYphm9H3ZvthXD4
	yhrnuacQ3YJqTy2JaCTSBgFgWDC6mETBTQe3JVe9YtFkieh+FhKfdgXy1zm9RK7ViL
	DqIEeya6PcPzrJZXosydBI6U=
Date: Sat, 12 Oct 2019 13:12:27 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Message-ID: <20191012101227.GA14610@localhost>
References: <20191011114754.91740-1-alex.kanavin@gmail.com>
	<20191011114754.91740-10-alex.kanavin@gmail.com>
	<60257c1a-0225-dd3d-af04-bddad416de07@gmail.com>
	<CANNYZj_K=oGF9qnYW-j2s2f_oxit8JH_mGWVL11EqOCeaQby2A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANNYZj_K=oGF9qnYW-j2s2f_oxit8JH_mGWVL11EqOCeaQby2A@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 10/19] gtk-doc: upgrade 1.31 -> 1.32
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
X-List-Received-Date: Sat, 12 Oct 2019 10:12:32 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Oct 11, 2019 at 09:39:07PM +0200, Alexander Kanavin wrote:
> On Fri, 11 Oct 2019 at 21:30, akuster808 <akuster808@gmail.com> wrote:
> 
> > > --- a/meta/recipes-gnome/gtk-doc/files/pkg-config-native.patch
> > > +++ b/meta/recipes-gnome/gtk-doc/files/pkg-config-native.patch
> > > @@ -1,4 +1,4 @@
> > > -From 9537a7998a220b698b26d926a111bb400ff1ce01 Mon Sep 17 00:00:00 2001
> > > +From 657310f3842c84d28f6b77e8ad4d9b93472ca5da Mon Sep 17 00:00:00 2001
> > >  From: Ross Burton <ross.burton@intel.com>
> > >  Date: Mon, 5 Sep 2016 22:25:44 +0100
> >
> > Why did the patch change?
> 
> rebasing patches with 'devtool upgrade' can do this. I usually don't trim
> such non-changes as they're obvious and harmless.

They can be a pain when cherry-picking changes for backporting.

> Alex

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


