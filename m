Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id E6E5771A50
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2016 03:14:25 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga102.jf.intel.com with ESMTP; 29 Nov 2016 19:14:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,719,1473145200"; d="scan'208";a="37049505"
Received: from cloo7-mobl1.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.144.199])
	by orsmga005.jf.intel.com with ESMTP; 29 Nov 2016 19:14:20 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Jiajie Hu <jiajie.hu@intel.com>
Date: Wed, 30 Nov 2016 16:14:18 +1300
Message-ID: <2308824.mVoJsBOLKL@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.8.8-100.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <9313919.Y4CtTjI68L@peggleto-mobl.ger.corp.intel.com>
References: <1480388349-4206-1-git-send-email-jiajie.hu@intel.com>
	<1896562.UY4VSfhxnH@jiajiehu>
	<9313919.Y4CtTjI68L@peggleto-mobl.ger.corp.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] devtool: execute associated functions while preparing the source tree
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
X-List-Received-Date: Wed, 30 Nov 2016 03:14:26 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wed, 30 Nov 2016 14:39:12 Paul Eggleton wrote:
> On Wed, 30 Nov 2016 09:33:22 Jiajie Hu wrote:
> > On Wednesday, November 30, 2016 07:01:30 AM Paul Eggleton wrote:
> > > So this in itself looks reasonable in theory, but I have to warn you
> > > that when we switch to tinfoil2 [1] these commits are going to be done
> > > via the metadata instead, and beyond a possible hack that I'd really
> > > rather not think about it's going to be a bit difficult to intercept the
> > > prefuncs/postfuncs there. At least they will be executed though since
> > > with tinfoil2 we'll be going through a much more standard path to run
> > > the tasks.
> > > 
> > > [1] https://wiki.yoctoproject.org/wiki/Tinfoil2
> > 
> > Glad to know that my fix can be superseded by tinfoil2 APIs. Do you have
> > any estimation when the switch will happen?
> 
> The target is 2.3 milestone 1, which is in December. However there are still
> a lot of things to be fixed as I've noted on the wiki page I linked.
> 
> Thinking about it though it's possible I could split out this particular
> change and get it sent earlier - in fact that may be a good idea anyway.
> I'll look into that.

Actually, I spoke too soon. Whilst moving the creation of commits out to the 
metadata can be done separately (and is already implemented in a separate 
patch), it won't actually help on its own because it doesn't change how the 
tasks are executed. The bit we need is executing the tasks as they would be 
executed normally, and unfortunately that's not possible without the full 
tinfoil2 changeset.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

