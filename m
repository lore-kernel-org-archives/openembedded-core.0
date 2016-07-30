Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 8EAB260746
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Jul 2016 10:01:11 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP; 30 Jul 2016 03:01:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,444,1464678000"; d="scan'208";a="741844351"
Received: from yewhoech-mobl3.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.144.9])
	by FMSMGA003.fm.intel.com with ESMTP; 30 Jul 2016 03:01:09 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Sat, 30 Jul 2016 22:01:07 +1200
Message-ID: <1764674.1vv8fsSaHh@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.6.4-201.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <1469777173.9142.50.camel@linuxfoundation.org>
References: <cover.1469190931.git.paul.eggleton@linux.intel.com>
	<1948585.XiSYCAuUde@peggleto-mobl.ger.corp.intel.com>
	<1469777173.9142.50.camel@linuxfoundation.org>
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/8] Extensible SDK improvements
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
X-List-Received-Date: Sat, 30 Jul 2016 10:01:14 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Fri, 29 Jul 2016 08:26:13 Richard Purdie wrote:
> On Mon, 2016-07-25 at 19:42 +1200, Paul Eggleton wrote:
> > On Sat, 23 Jul 2016 13:11:39 Paul Eggleton wrote:
> > > On Fri, 22 Jul 2016 23:31:38 Burton, Ross wrote:
> > > > On 22 July 2016 at 13:38, Paul Eggleton <
> > > > paul.eggleton@linux.intel.com>
> > > > 
> > > > wrote:
> > > > > Some fixes and enhancements centered around how the toolchain
> > > > > is
> > > > > incorporated in the eSDK, as well as a couple of tweaks for
> > > > > buildhistory
> > > > > that I found we needed during development.
> > > > 
> > > > This is happening in mut, could your branch be responsible:
> > > > 
> > > > http://errors.yoctoproject.org/Errors/Details/73022/
> > > > 
> > > > Ross (who will look further when its not 23:30 on Friday!)
> > > 
> > > Hmm, it will be, but I can't tell immediately from the error
> > > message what
> > > could be wrong...
> > 
> > Ah, I believe this is bash vs. dash. Fix incoming, just need to test
> > it.
> 
> Thanks for that fix. I think but am not 100% sure that this patchset
> may have also caused:
> 
> https://autobuilder.yoctoproject.org/main/builders/nightly-oecore/build
> s/865
> 
> which happens only on OE-Core testing :/.

I'm a 100% sure it's *exposed* the issue, but I can't say what would be 
causing the error itself. I'll investigate on Monday.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

