Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id CFC0A7F7A6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2019 16:30:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47HWXH4Wk3z44;
	Tue, 19 Nov 2019 17:30:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1574181040;
	bh=IfHIIOmk842en1Kn48zmL8bpK5rRk1hPxZyjIpJ9ObQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LaivYRjQ5sw6PYWE2lF12fCam5WO+NepblVBYcV0D7LUKDhPH9d05eFPF7eDr3DDo
	T2qhhqDY1hYObuRQzhOQjIxYhTZZTlnS13BqM4C+/eaSx/9v7B2wNmpdiDJ7xdCU/I
	nAv8fczOLQHw0QKu7YpKTfr+fnvhFpC7SMfur64j+VhLHUlrrof0xnjC34wb9AdXxj
	0JHV4NtpdxGnCePUDjUltDfpzszxEBTCe8ZzIi5RMq7NwtuuSdKiTo2QPf2sT4m8+E
	Zzt6baP3iNQqU+P701WaifH+1sbSBR0ZsOnsBfNaOe22v3mLnxz5P3XWYnzTQhQ7BU
	raP05RV0Ubmkzyz+6z/Xn9gpHtajWSeqU8zqQ6Lua/W4GzO1UVtSTJdVW/2meSZmbA
	8qQW0KGBGPmTDH/i6u9rif2Z7z/PjMDKb0gehd9bj8A1W1JQ+zzx+HcBwBzCew1N1g
	5EoPBRN6M+U+aZRDn2NGQAi47QS9oA+36nILVFxeQm85ZLEt7RB4RQV8eZeXQFjHYD
	H5gEc81vuLHRnkPZvWh9FAN05+tdf19kToWQin2llyt/DJdbRD7t6YQiLKXLwpPKpt
	SNVOibQhVHna3pur/oJIimSiU0dP2UL88KQ74RwFz/LcUqsRWYmPgiOPnenaq9eSId
	Ku7JOxnw1buyTe4GozQJbfNk=
Date: Tue, 19 Nov 2019 18:30:36 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20191119163036.GA4044@localhost>
References: <CAMKF1sp5SWYgoOj7Ujy5GMEEcuuATkuD45q7k7+LSc2SSkTVNg@mail.gmail.com>
	<20191118210500.GA4741@localhost>
	<CAMKF1spsipv7AbxJfmwHMU5dPtPDm-8VBxeQGWhEGUxJFG4WUw@mail.gmail.com>
	<20191118220613.GA7568@localhost>
	<CAMKF1sq3hnUuM7rcCbEhfbTmUtGbpMVVZkq8mFo24FKGG=kFYA@mail.gmail.com>
	<20191118225500.GB7568@localhost>
	<CAMKF1squJq7mLJJBhf_+EQbBTHb1c8R1g449e6Uo2v=MtNk2XQ@mail.gmail.com>
	<CANx9H-D0Bve0QUDd3pERWV7xOvTfjro5+=FuaAJUxYz+tp3X5w@mail.gmail.com>
	<CANNYZj_2+0+6Suq0Gu74t+QDhx3mdb6FZsr2mwy8WhtNk493ug@mail.gmail.com>
	<CAMKF1spXYo2-Qor9YpPs13+EgCpxLq+f7Bc69YUXPmHwEJRdAw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1spXYo2-Qor9YpPs13+EgCpxLq+f7Bc69YUXPmHwEJRdAw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/13] python: update to 2.7.17
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
X-List-Received-Date: Tue, 19 Nov 2019 16:30:41 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Nov 19, 2019 at 07:49:15AM -0800, Khem Raj wrote:
> On Tue, Nov 19, 2019 at 3:30 AM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > On Tue, 19 Nov 2019 at 08:58, Tim Orling <ticotimo@gmail.com> wrote:
> >>
> >>
> >> I have the beginnings of scripts to generate a meta-python2 layer. Someone with a vested interest in keeping python2 supported will need to step up to maintain it. After bitbake and Oe-core moved to python3, my use of python2 has gone to near zero.
> >>
> >> I intend to move all python2 recipes from meta-python to the new layer. meta-python will become python3 only in 3.1 release timeframe. The bb files and inc files will also be merged, simplifying AUH and devtool usage.
> >>
> >> Attempts to send python2 patches to meta-python after that shift will be nacked.
> >
> >
> > Thanks! There is however a missing part: how close is meta-oe to being py2-free? Oe-core is very close (u-boot is the last holdout as noted), but I am not sure that we can simply take out py2, and not have half of meta-oe fail. For instance (random example) mozjs, a fairly important component, still pulls it in, together with a few 3rd party libraries: https://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-extended/mozjs/mozjs_60.5.2.bb
> >
> > It's tempting to force the transition by breaking things, but it also antagonizes users.
> 
> Its for how python2 should be organised after it retires and
> suggestion is to move it to an independent layer rather than
> meta-openembedded repo,
> wether, layers under meta-openembedded will depend on it is a separate issue

You want meta-oe to have a LAYERDEPENDS on a new python2 layer that is 
not in meta-openembedded?

cu
Adrian

