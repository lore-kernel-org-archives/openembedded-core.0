Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 3741C6B7CD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 21:27:15 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 20 Aug 2013 14:27:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,922,1367996400"; d="scan'208";a="389369137"
Received: from akagikob-mobl.ger.corp.intel.com (HELO helios.localnet)
	([10.252.122.209])
	by fmsmga002.fm.intel.com with ESMTP; 20 Aug 2013 14:26:36 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Tue, 20 Aug 2013 22:26:35 +0100
Message-ID: <8150681.rZTrqf1BYP@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-27-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <CAP9ODKpJvBWZHhXAkdyx8H6bG4O4vDiV=yKYuomQ0=eOBK63aw@mail.gmail.com>
References: <CAF6bG8cHBD0+5JQfuXNNY0odSU3gs=_Son6zT4RXuH8eBfj=Xg@mail.gmail.com>
	<1507505.mjujvFaXNS@helios>
	<CAP9ODKpJvBWZHhXAkdyx8H6bG4O4vDiV=yKYuomQ0=eOBK63aw@mail.gmail.com>
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Tue, 20 Aug 2013 21:27:16 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 20 August 2013 18:24:55 Otavio Salvador wrote:
> On Tue, Aug 20, 2013 at 6:16 PM, Paul Eggleton
> <paul.eggleton@linux.intel.com> wrote:
> > On Tuesday 20 August 2013 23:26:44 Marko Lindqvist wrote:
> >> On 20 August 2013 16:32, Paul Eggleton <paul.eggleton@linux.intel.com>
> >> 
> >> wrote:
> >> > On Tuesday 20 August 2013 15:51:21 Marko Lindqvist wrote:
> >> >> Build of qemu-native regularly fails with:
> >> >> |   LINK  sh4-softmmu/qemu-system-sh4
> >> >> | 
> >> >> | /usr/lib/x86_64-linux-gnu/libXext.so.6: undefined reference to
> >> >> 
> >> >> `_XEatDataWords'
> >> >> 
> >> >> | collect2: error: ld returned 1 exit status
> >> >> 
> >> >> This might be some dependency missing, as building first some packets
> >> >> (+ more importantly their dependencies) that do not depend on qemu and
> >> >> only then qemu dependant image success.
> >> > 
> >> > Do you have something else causing libxext-native to be built by any
> >> > chance?
> >>  
> >>  Yes, it seems to be difference between the tree where build fails and
> >> 
> >> the one where build success that former has no libxext-native built.
> >> Further, I tested just building libxext-native before building
> >> qemu-native, and then the build succeded.
> > 
> > The problem is we want qemu-native to be buildable both on systems without
> > X11 and systems with X11, so the dependency has to be floating, and this
> > is more or less acceptable for a native recipe - there's only a problem
> > when libxext- native needs to be built. I can't see a lot of value in
> > building libxext- native in any case - what is causing it to be built on
> > your system?
>
> This floating dependency is  a problem; could it be patches to be x11
> / x11-less?

How would you propose to handle both use-cases?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

