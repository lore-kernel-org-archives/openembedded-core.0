Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 671FE6B25A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 21:16:31 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 20 Aug 2013 14:16:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,922,1367996400"; d="scan'208";a="383965131"
Received: from akagikob-mobl.ger.corp.intel.com (HELO helios.localnet)
	([10.252.122.209])
	by fmsmga001.fm.intel.com with ESMTP; 20 Aug 2013 14:16:30 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Marko Lindqvist <cazfi74@gmail.com>
Date: Tue, 20 Aug 2013 22:16:20 +0100
Message-ID: <1507505.mjujvFaXNS@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-27-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <CAF6bG8e=cCDyJGDNebVqaNSJ31PNYCUQ9xPNf_4p+mDVDUMbwA@mail.gmail.com>
References: <CAF6bG8cHBD0+5JQfuXNNY0odSU3gs=_Son6zT4RXuH8eBfj=Xg@mail.gmail.com>
	<11672169.pPNsTrMMam@helios>
	<CAF6bG8e=cCDyJGDNebVqaNSJ31PNYCUQ9xPNf_4p+mDVDUMbwA@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: qemu-native build regularly failing
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
X-List-Received-Date: Tue, 20 Aug 2013 21:16:32 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 20 August 2013 23:26:44 Marko Lindqvist wrote:
> On 20 August 2013 16:32, Paul Eggleton <paul.eggleton@linux.intel.com>
> wrote:
> > On Tuesday 20 August 2013 15:51:21 Marko Lindqvist wrote:
> >> Build of qemu-native regularly fails with:
> >> |   LINK  sh4-softmmu/qemu-system-sh4
> >> | 
> >> | /usr/lib/x86_64-linux-gnu/libXext.so.6: undefined reference to
> >> 
> >> `_XEatDataWords'
> >> 
> >> | collect2: error: ld returned 1 exit status
> >> 
> >> This might be some dependency missing, as building first some packets
> >> (+ more importantly their dependencies) that do not depend on qemu and
> >> only then qemu dependant image success.
> > 
> > Do you have something else causing libxext-native to be built by any
> > chance?
>
>  Yes, it seems to be difference between the tree where build fails and
> the one where build success that former has no libxext-native built.
> Further, I tested just building libxext-native before building
> qemu-native, and then the build succeded.

The problem is we want qemu-native to be buildable both on systems without X11 
and systems with X11, so the dependency has to be floating, and this is more or 
less acceptable for a native recipe - there's only a problem when libxext-
native needs to be built. I can't see a lot of value in building libxext-
native in any case - what is causing it to be built on your system?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

