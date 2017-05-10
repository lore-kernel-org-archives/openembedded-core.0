Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 5AABF6FFD7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 May 2017 20:15:47 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga105.fm.intel.com with ESMTP; 10 May 2017 13:15:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,320,1491289200"; d="scan'208";a="855297505"
Received: from hklau-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.134.82])
	by FMSMGA003.fm.intel.com with ESMTP; 10 May 2017 13:15:45 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Date: Thu, 11 May 2017 08:15:43 +1200
Message-ID: <4437292.ZnTzh3sVdu@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
In-Reply-To: <242ad7f7-4e04-7cac-fd3d-6fabd9b43c65@linux.intel.com>
References: <1494240698452.53619@mentor.com>
	<2037301.7Ncc1v2UnL@peggleto-mobl.ger.corp.intel.com>
	<242ad7f7-4e04-7cac-fd3d-6fabd9b43c65@linux.intel.com>
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: GUI based images
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
X-List-Received-Date: Wed, 10 May 2017 20:15:49 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday, 10 May 2017 11:09:59 PM NZST Alexander Kanavin wrote:
> On 05/10/2017 01:55 PM, Paul Eggleton wrote:
> > I make no secret of it - I am a Qt supporter. I'm willing to be convinced
> > that's not the right answer, though, if there are solid arguments.
> > However, if you'll excuse my paraphrasing, "it's not in OE-Core and can't
> > be, therefore we should just ignore it" isn't a case against it, it's a
> > logistical issue. We could easily get past that by bringing meta-qt5 into
> > poky as we do with OE-Core, or even just adding it to the build
> > configuration as needed.
> 
> That's not what I'm saying. I'm saying that for people who want a 
> 'reference UI for real products' and have no problem with Qt, we should 
> officially endorse meta-b2qt.
> 
> Seriosuly. They have a wayland compositor, and an app launcher, and a 
> set of embedded-specific demos, and it's written and tested by 
> specialists with an explicit target of making it easy to make products. 
> And it's open source with optional commercial support. In that light, 
> there is no sense whatsoever in solving the same problem in oe-core, poorly.

If that works then great! By all means let's test it and endorse it. At the 
moment we barely even acknowledge it's existence - it's not even in the layer 
index (though that is generally up to the layer maintainer, we can certainly 
encourage them to submit it.)

> > If we keep Sato effectively on life support as we have done up until now,
> > then it'll never get solved, and in the mean time we are presenting
> > something that is frankly woefully outdated which we have to maintain
> > entirely by ourselves.
> 
> Sato is not a reference UI, and has no pretensions of being that. It's 
> strictly an engineering UI, which is a different thing, and it's very 
> useful in that capacity.

You and I might understand that, but someone coming to the project fresh 
won't, mainly because we've never officially stated that anywhere. The only 
mention of anything like it is in fact the opposite - in the development 
manual we state "The Yocto Project ... also features the Sato reference User 
Interface, which is optimized for stylus-driven, low-resolution screens.". 
Granted, that statement is probably as old as Sato itself, but I think it 
speaks to how organised our messaging is on this topic.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

