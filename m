Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D6C397F3DC
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2019 13:40:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x86Derbr022662
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 6 Sep 2019 06:40:54 -0700 (PDT)
Received: from yow-masselst-lx1.localnet (128.224.60.192) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.468.0; Fri, 6 Sep 2019 06:40:53 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 6 Sep 2019 09:40:52 -0400
Message-ID: <2836292.ZHCZ8s5Y3I@yow-masselst-lx1>
Organization: Wind River
In-Reply-To: <8df1bb0c9e27121ec35c2e003fab2d498a09df1b.camel@linuxfoundation.org>
References: <20190822155616.35046-1-mark.asselstine@windriver.com>
	<c20767b7-a549-5075-20a0-ac115bbc1bbd@linuxfoundation.org>
	<8df1bb0c9e27121ec35c2e003fab2d498a09df1b.camel@linuxfoundation.org>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH][V2] sdkext: use simpler kernel module for devtool test
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
X-List-Received-Date: Fri, 06 Sep 2019 13:40:55 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday, September 6, 2019 6:56:26 A.M. EDT 
richard.purdie@linuxfoundation.org wrote:
> On Thu, 2019-09-05 at 17:10 -0700, Michael Halstead wrote:
> > On 9/5/19 2:27 PM, richard.purdie@linuxfoundation.org wrote:
> > > On Thu, 2019-09-05 at 13:54 -0400, Mark Asselstine wrote:
> > > > Richard, are you thinking we need to figure out the
> > > > git.yoctoproject.org repo
> > > > before we can move ahead with merging this?
> > > 
> > > I would like to fix that, yes. I could ask Michael for help but I
> > > do
> > > have access to sort it myself too.
> > > 
> > > I'm also trying to sort out a few other issues before -next can
> > > merge.
> > > 
> > > Since I'm failing to get to it,
> > > 
> > > Michael,
> > > 
> > > Could you clone:
> > > 
> > > https://github.com/masselstine/kernel-module-hello-world.git
> > > 
> > > onto git.yp.org as a new repo and give write access to it for Mark,
> > > myself, Bruce and Ross please?
> > 
> > This repo is ready at
> > git@push.yoctoproject.org:kernel-module-hello-world for the four of
> > you.
> > 
> > It is available read-only for anyone at,
> > 
> > git://git.yoctoproject.org/kernel-module-hello-world
> > 
> > and
> > 
> > https://git.yoctoproject.org/git/pokykernel-module-hello-world
> 
> Thanks Michael.
> 
> Mark: I tweaked your patch and its now merged (avoiding the typo
> above!)

Great, thanks Michael and RP for following through on this.

MarkA

> 
> Cheers,
> 
> Richard





