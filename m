Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0B1F67E6AC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2019 21:57:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x7LLu2sw019051
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 21 Aug 2019 14:56:38 -0700
Received: from yow-masselst-lx1.localnet (128.224.60.192) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.468.0; Wed, 21 Aug 2019 14:56:25 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Wed, 21 Aug 2019 17:56:24 -0400
Message-ID: <1770290.OrdOT5LAS6@yow-masselst-lx1>
Organization: Wind River
In-Reply-To: <e6423f026434414f58509f3acec443d1cd681dfa.camel@linuxfoundation.org>
References: <20190820175239.19769-1-mark.asselstine@windriver.com>
	<e6423f026434414f58509f3acec443d1cd681dfa.camel@linuxfoundation.org>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] sdkext: use simpler kernel module for devtool test
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
X-List-Received-Date: Wed, 21 Aug 2019 21:57:04 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday, August 21, 2019 4:57:40 P.M. EDT Richard Purdie wrote:
> On Tue, 2019-08-20 at 13:52 -0400, Mark Asselstine wrote:
> > The current devtool test for the building of an out-of-tree kernel
> > module uses something which requires several "high order" kconfigs to
> > be set. This results in the test failing, not for expected reasons,
> > but rather because it depends on specific kernel configuration.
> > 
> > You will get error messages such as
> > 
> >   ERROR: "video_ioctl2"
> >   [.../1.0-r5/testsdkext/workspace/sources/v4l2loopback-
> > 
> > driver/v4l2loopback.ko]
> > 
> >   undefined!
> >   ERROR: "video_unregister_device"
> >   [.../1.0-r5/testsdkext/workspace/sources/v4l2loopback-
> > 
> > driver/v4l2loopback.ko]
> > 
> >   undefined!
> > 
> > Using a simpler hello-world kernel module example will only require
> > that CONFIG_MODULE is enabled, thus avoiding a false positive.
> > 
> > Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> > ---
> > 
> > Richard, it is unclear if I need to match this change in
> > meta/lib/oeqa/manual/crops.json.
> 
> Those are manual tests for crops. They probably do also need this
> change as it would make them more reliable if/as anyone every automates
> them, or runs them manually.

I will affect the change there then too in the V2.

> 
> >  Please let me know and I
> > 
> > send a V2 which does this. I am not fond of pointing at
> > my own github but it was the best option to ensure it will
> > exist and not be messed with.
> 
> The best option may be to put that repo onto git.yoctoproject.org?

Not sure I get a vote but as far as the content goes I have no issue with it 
being elsewhere, like git.yoctoproject.org.

Mark

> 
> Cheers,
> 
> Richard





