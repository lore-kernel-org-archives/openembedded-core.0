Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 1F39671E1B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 18:53:52 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 13 Dec 2016 10:53:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,342,1477983600"; d="scan'208";a="17624826"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga002.jf.intel.com with ESMTP; 13 Dec 2016 10:53:52 -0800
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.38])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 24A4E6A4006;
	Tue, 13 Dec 2016 10:53:03 -0800 (PST)
Date: Tue, 13 Dec 2016 20:53:17 +0200
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Maciej =?utf-8?B?Qm9yesSZY2tp?= <maciej.borzecki@rndity.com>
Message-ID: <20161213185317.GA6550@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <cover.1479970230.git.maciej.borzecki@rndity.com>
	<CAD4b0_LMUu4=kTEon3nk+_8-1+nG+zQsph9yPB-SNabahhKsbQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAD4b0_LMUu4=kTEon3nk+_8-1+nG+zQsph9yPB-SNabahhKsbQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Maciej Borzecki <maciek.borzecki@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v5 0/6] wic: bugfixes & --fixed-size support, tests, oe-selftest: minor fixes
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
X-List-Received-Date: Tue, 13 Dec 2016 18:53:53 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, Dec 13, 2016 at 09:07:30AM +0100, Maciej Borzęcki wrote:
> On Thu, Nov 24, 2016 at 8:08 AM, Maciej Borzecki
> <maciej.borzecki@rndity.com> wrote:
> > v5 of a patch series previously posted here [1].
> >
> > Changes since v4:
> >
> > * dropped `wic: selftest: do not repeat core-image-minimal` & rebased
> >   dependant patches
> >
> > * minor formatting fix in `wic: selftest: add tests for --fixed-size
> >   partition flags`
> >
> > [1]. http://lists.openembedded.org/pipermail/openembedded-core/2016-November/129103.html
> >
> > Maciej Borzecki (6):
> >   oe-selftest: enforce en_US.UTF-8 locale
> >   oeqa/utils/commands.py: allow use of binaries from native sysroot
> >   wic: add --fixed-size wks option
> >   wic: selftest: avoid COMPATIBLE_HOST issues
> >   wic: selftest: do not assume bzImage kernel image
> >   wic: selftest: add tests for --fixed-size partition flags
> >
> >  meta/lib/oeqa/selftest/wic.py          | 123 +++++++++++++++++++++++++++++++--
> >  meta/lib/oeqa/utils/commands.py        |   9 ++-
> >  scripts/lib/wic/help.py                |  14 +++-
> >  scripts/lib/wic/imager/direct.py       |   2 +-
> >  scripts/lib/wic/ksparser.py            |  41 +++++++++--
> >  scripts/lib/wic/partition.py           |  88 ++++++++++++++---------
> >  scripts/lib/wic/utils/partitionedfs.py |   2 +-
> >  scripts/oe-selftest                    |   3 +
> >  8 files changed, 234 insertions(+), 48 deletions(-)
> 
> Is there any additional action needed from me at this point? A rebase
> or a resend perhaps?
> 

Rebase&resend would be nice as at lest one patch from this patchset is already accepted.

--
Regards,
Ed

