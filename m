Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id B318A6B4F7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2014 14:24:05 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 25 Feb 2014 06:24:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,540,1389772800"; d="scan'208";a="481481007"
Received: from lbhoopat-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.232])
	by fmsmga001.fm.intel.com with ESMTP; 25 Feb 2014 06:23:34 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 25 Feb 2014 14:23:33 +0000
Message-ID: <1777337.ANJ31Rnhxt@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.2 (Linux/3.13.3-201.fc20.x86_64; KDE/4.12.2; x86_64; ; )
In-Reply-To: <C0069BB2-4391-42DA-AB55-E8BF14D57B32@dominion.thruhere.net>
References: <cover.1388269205.git.paul.eggleton@linux.intel.com>
	<19353110.0dHagEzKPJ@peggleto-mobl5.ger.corp.intel.com>
	<C0069BB2-4391-42DA-AB55-E8BF14D57B32@dominion.thruhere.net>
MIME-Version: 1.0
Cc: Saul Wold <saul.wold@intel.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/38] *-basic: rename to *-standardlinux
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
X-List-Received-Date: Tue, 25 Feb 2014 14:24:07 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 25 February 2014 13:13:24 Koen Kooi wrote:
> Op 24 feb. 2014, om 17:38 heeft Paul Eggleton 
<paul.eggleton@linux.intel.com> het volgende geschreven:
> > On Monday 30 December 2013 12:59:26 Paul Eggleton wrote:
> >> On Monday 30 December 2013 09:35:18 Robert Yang wrote:
> >>> I'm afraid that the standardlinux maybe a little confused with
> >>> linuxstdbase, bu I don't have any better idea about it.
> >> 
> >> You could be right. I've thought for a long time about renaming this and
> >> haven't been able to come up with anything better. On the other hand, in
> >> our current configuration we are actually using the basic/standardlinux
> >> packagegroup as part of our LSB images; although that might not be the
> >> right thing to continue doing - LSB probably ought to be independent.
> >> 
> >> FWIW, let's consider this particular patch as RFC, maybe someone else has
> >> a
> >> better idea of what to name it. I am very much convinced that "basic" is
> >> not the right name though.
> > 
> > So, has anyone got any better ideas for the name of core-image-basic and
> > packagegroup-core-basic?
> > 
> > The idea is that these are meant to contain things that you might have on
> > a
> > more traditional or full-featured Linux system. Somehow
> > "-traditionallinux"
> > doesn't really work either.
> 
> Who does it need to contain 'linux'? OE isn't linux specfic and neither are
> the package groups.

I'm fully open to alternatives, that's why I brought this up again...

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

