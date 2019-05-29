Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id D27CC7E309
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 23:02:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45DmSL3rmkz6Y;
	Thu, 30 May 2019 01:02:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1559170931;
	bh=QvDNtxjZt81MvkxSI/r1BVpxIlvux/2AQkjlit27TFs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RIRMrz9mAPuRbKU+PXBAAKWP5BW70g7B7y7zr5F1Svt15aTxtng0ZqywzmHWD8kOB
	QHQlnVZZLIeeZcwRQfd+nHlnI4fidRdBg7QHEvWPCYrIQi/H6qF5azrdRkx3L6TTIf
	vuMm1ID3MWYTq/tDbI8eY8k8L5Ip0R2OkBW06INHKAKf2E5+RqkLkzWqZEkAbgbPEX
	FeTSKWUcDxIdVnz38W5zKKWuYLJEA5v3i5WhyT2Z1PMimE5le8shB0GOFUiNeVHUae
	kr0FA/L/8oYkUc+QTtt6c4GlQcmyys6i34Je3S2L/x42IV8IkF6/w6/nDLqtUO1IVQ
	8iyDptTsGxv3oubS5IRksInzl1LuoNy4fgE/M77z65BtAL7VUvr1lJInplrw77wgU3
	cW3mej2qPEk8d+5riLkJgDZUz5vHXJLsnOXyk/Zo3xnhs8BmElIob/KIEnRoBJf14J
	P/X70mElbNXP1xlMVxFFXOQivuB4oq1khjlvOnxNlxtqotobeSA/e4uLgUcUNcjPWv
	IYp+PaRv8g8f3U9eaQ4pIZXyCThym3/rIEeOOgOQVEjP7q2OzAtl0UvB6LurZ1P4nu
	XavQpnzGGMxcXQhQOPA/lehoR7SwoYw8m8gwyoOV6IAQXUKiMKof13MBracPcQGIMb
	+nIkwjXHeJ/kHmjUPbDORbao=
Date: Thu, 30 May 2019 02:02:03 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Tom Rini <trini@konsulko.com>
Message-ID: <20190529230203.GB16075@localhost>
References: <20190529184328.28470-1-richard.purdie@linuxfoundation.org>
	<20190529184328.28470-2-richard.purdie@linuxfoundation.org>
	<4c62af9f-8bff-726e-db35-6f6ed7ebafc2@gmail.com>
	<8798dc0e5d91991953720388b601c9c5b3174c42.camel@linuxfoundation.org>
	<321f3cb8-a101-49ad-07c4-64fc82d2c7f8@gmail.com>
	<d5b41b11583c78cd16d6393736fafd8e733c48a9.camel@linuxfoundation.org>
	<20190529212556.GO20781@bill-the-cat>
	<4571b3c03fb83ee01492dd1891e410becb72b0e5.camel@linuxfoundation.org>
	<20190529221726.GA16075@localhost>
	<20190529222920.GP20781@bill-the-cat>
MIME-Version: 1.0
In-Reply-To: <20190529222920.GP20781@bill-the-cat>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] uninative: Switch from bz2 to xz
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
X-List-Received-Date: Wed, 29 May 2019 23:02:12 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, May 29, 2019 at 06:29:20PM -0400, Tom Rini wrote:
> On Thu, May 30, 2019 at 01:17:26AM +0300, Adrian Bunk wrote:
> > On Wed, May 29, 2019 at 10:29:31PM +0100, richard.purdie@linuxfoundation.org wrote:
> > > On Wed, 2019-05-29 at 17:25 -0400, Tom Rini wrote:
> > > > On Wed, May 29, 2019 at 09:50:22PM +0100, 
> > > > richard.purdie@linuxfoundation.org wrote:
> > > > > On Wed, 2019-05-29 at 13:39 -0700, akuster808 wrote:
> > > > > > On 5/29/19 12:26 PM, richard.purdie@linuxfoundation.org wrote:
> > > > > > > On Wed, 2019-05-29 at 12:21 -0700, akuster808 wrote:
> > > > > > > > On 5/29/19 11:43 AM, Richard Purdie wrote:
> > > > > > > > > (From OE-Core rev:
> > > > > > > > > 29fc9210b973be68de474e75068e4c72371afe5a)
> > > > > > > > > 
> > > > > > > > > Signed-off-by: Richard Purdie <
> > > > > > > > > richard.purdie@linuxfoundation.org>
> > > > > > > > With back port to warrior and Thud too?
> > > > > > > Yes, we'll need to do that if we bring fedora 30 workers online
> > > > > > > on
> > > > > > > the
> > > > > > > autobuilder.
> > > > > > I know the uninative update is required for FC30 but changing the
> > > > > > compression does not.
> > > > > > 
> > > > > > This question is about the compression extension question.
> > > > > > 
> > > > > > Does this mean YP will no longer be providing bz2 uninatives?
> > > > > 
> > > > > Correct, the patch should be straight forward to include with the
> > > > > upgrade.
> > > > 
> > > > Does that in turn mean we must have host xz-utils?
> > > 
> > > It will mean you need a tar which supports the -J option. The tests
> > > I've see so far suggest all our oldest supported distros do...
> > 
> > For thud tar >= 1.27 is required, -J was added in 1.22.
> > 
> > But Tom is asking about something different:
> > tar calls "xz -d" for decompression, which needs xz-utils installed.
> > 
> > https://www.yoctoproject.org/docs/2.6/ref-manual/ref-manual.html#required-packages-for-the-build-host 
> > documents that xz has to be installed, but looking at 
> > meta/conf/bitbake.conf it might be missing in HOSTTOOLS.
> 
> I think it's also missing in for example the crops containers.  So if
> we're going to backport it, I think maybe we should keep it bz2?  The
> size difference can't be that much.

The size difference is surprisingly high - a factor of 5 (sic).
But in practice the difference between 5 MB and 26 MB
shouldn't really matter.

> Tom

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


