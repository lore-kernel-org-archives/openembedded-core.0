Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 979C17D2AD;
	Wed,  3 Apr 2019 09:34:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44Z19x5z2Jz4b;
	Wed,  3 Apr 2019 11:34:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1554284054;
	bh=IVui8djscj7ciaJ/1vrzh9QB+az2mKJeoguW5l2WLtk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OXzGaoZKfeS0lobTZRXwrtVokaEvsC8Tlvm4mD+la1NvulziI9+2ax0ckF3cWBSRs
	nMa7Mz3595E5EwDtGWvZd0CtOvnCE2WWTocq6zLQMAAzjgaardXU+3Fv0zu2LafTyS
	jyZRItVRP9MVLFNgafKAUFTm0lU3OU7qVpo0LqIf37HccGBK61YuqgKVz3tSzYUqkj
	UDC7CpYB1n74VY8jXaG0ODbflhIZUrVCQHzpA2jr8LNBcyPTHfyZqPLMgCYga/TisJ
	8N001Rm5eWyCyq45YmdTczjYxDIW5XMryIhaTgzZFuROjL1B7AZUr+G5njT4NLMSaT
	JBj7Loz0pO9N4SZWRMKbaTMDmZYyyQUboMPA3wiogkBUq0UymhmTiMh/HliUcnwhh2
	e2pcZahUJJ/ScAAEFX9WKI2ssmsvHBudooOap0rp/1AZ3oi/Qc1O+oyU3JmwJYSFKr
	xS1utM4slZijCrCJipsXOfxg9iJiDZ5ejwfRTtq2e7gdPCViyAsXrUHJHoDs6kBUSD
	bF+zLQ2/3PicJyvd31+b7+wM1OHVqsg2Vqi85Llq26nGt6O7abU8SwZHgh7wuKPhvr
	A6gKsTJQbpQNvUDzqttJKQdyDkCVM5sb63YUckopRC8mGgfS++qtG1yku/mUCik3ez
	d56iA30K8ZGnullzXJaAEbVU=
Date: Wed, 3 Apr 2019 12:34:11 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Tom Rini <trini@konsulko.com>
Message-ID: <20190403093411.GA8376@localhost>
References: <854544cb-aab1-1a9d-9e98-0f39663ca621@gmail.com>
	<b08083fc2f63f6324a652706f8343a0b8defe209.camel@linuxfoundation.org>
	<a1416fe3-04fb-1d37-eaef-05b9a838254e@gmail.com>
	<20190402065121.GA31468@localhost>
	<20190402194614.GY4664@bill-the-cat>
MIME-Version: 1.0
In-Reply-To: <20190402194614.GY4664@bill-the-cat>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Git commit process question.
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
X-List-Received-Date: Wed, 03 Apr 2019 09:34:15 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Apr 02, 2019 at 03:46:14PM -0400, Tom Rini wrote:
> On Tue, Apr 02, 2019 at 09:51:21AM +0300, Adrian Bunk wrote:
> > On Mon, Apr 01, 2019 at 04:20:41PM -0700, akuster808 wrote:
> > > 
> > > 
> > > On 4/1/19 4:02 PM, Richard Purdie wrote:
> > > > On Mon, 2019-04-01 at 15:33 -0700, akuster808 wrote:
> > > >> Hello,
> > > >>
> > > >> I have noticed a large number of git commits with no header
> > > >> information being accepted.
> > > > Can you be more specific about what "no header information" means? You
> > > > mean a shortlog and no full log message?
> > > Commits with just a "subject" and signoff. No additional information
> > > 
> > > We tend to reference back to how the kernel does things.
> > > 
> > > https://www.kernel.org/doc/html/latest/process/submitting-patches.html
> > > These two sections in particular.
> > > 
> > > 
> > >     2) Describe your changes
> > > 
> > > Describe your problem. Whether your patch is a one-line bug fix or 5000
> > > lines of a new feature, there must be an underlying problem that
> > > motivated you to do this work. Convince the reviewer that there is a
> > > problem worth fixing and that it makes sense for them to read past the
> > > first paragraph.
> > >...
> > 
> > The kernel does not have "upgrade foo to the latest upstream version" commits.
> > 
> > With the Automatic Upgrade Helper this is a semi-automatic task, and 
> > most of the time there is no specific motivation other than upgrading
> > to the latest upstream version.
> 
> But since that's just filling in a template the body can also be a
> template perhaps with useful AUH data (run at ... by ... ?) ?

That would be more trivial than useful.

And so far noone has stated any actual problem that would be solved
by adding such a new requirement.

> Tom

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


