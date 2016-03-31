Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 127A86012C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2016 19:12:55 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga104.fm.intel.com with ESMTP; 31 Mar 2016 12:12:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,423,1455004800"; d="scan'208";a="775661965"
Received: from tdharmal-mobl2.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.166.149])
	by orsmga003.jf.intel.com with ESMTP; 31 Mar 2016 12:12:55 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 01 Apr 2016 08:12:51 +1300
Message-ID: <1801805.7zcOOyCWFu@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.4.6-300.fc23.x86_64; KDE/4.14.18; x86_64; ;
	)
In-Reply-To: <CADkTA4OHSayhSfAz8z4=Z6f9x4f7MrmZGZExQWUPZuUUXn-aEQ@mail.gmail.com>
References: <cover.1459413941.git.paul.eggleton@linux.intel.com>
	<e821fe90eb5b650d5e43b3465ce4eaffee766a5d.1459413941.git.paul.eggleton@linux.intel.com>
	<CADkTA4OHSayhSfAz8z4=Z6f9x4f7MrmZGZExQWUPZuUUXn-aEQ@mail.gmail.com>
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] linux-yocto: add patch in existing SRC_URI value rather than using _append
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
X-List-Received-Date: Thu, 31 Mar 2016 19:12:57 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thu, 31 Mar 2016 08:05:31 Bruce Ashfield wrote:
> On Thu, Mar 31, 2016 at 4:47 AM, Paul Eggleton <
> 
> paul.eggleton@linux.intel.com> wrote:
> > Of course SRC_URI_append works just fine for building here, but it does
> > introduce two problems:
> > 
> > 1) It's not really very tidy and you could look at the SRC_URI value and
> > 
> >    miss the fact that there's a patch appended at the end.
> > 
> > 2) devtool update-recipe will end up duplicating the appended item
> > 
> >    (covered under [YOCTO #9360]).
> > 
> > Given the above it seems reasonable to squash the appended value into
> > the main SRC_URI value.
> 
> This is only temporary, which is why it's an _append, and I'm about to get
> rid of the need for this patch completely
> since upstream has finally produced a 7 patch series to fix the regression.
> 
> So I'd rather not churn this, and leave it as-is for another few days.

OK, that's fine - as long as we don't release with this in it I'll be happy.

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

