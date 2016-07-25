Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id CC94D606D0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jul 2016 20:33:44 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 25 Jul 2016 13:33:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,420,1464678000"; d="scan'208";a="1002283666"
Received: from kleong8-mobl2.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.151.203])
	by orsmga001.jf.intel.com with ESMTP; 25 Jul 2016 13:33:44 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 26 Jul 2016 08:33:40 +1200
Message-ID: <2357580.smmtpJgC3U@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.6.4-201.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <CAJTo0LY0eNa94dkMuLow_hSh2_V=thCxGAVexfEf3v4fpXrgDA@mail.gmail.com>
References: <cover.1469190931.git.paul.eggleton@linux.intel.com>
	<1789904.LeABdRZOVU@peggleto-mobl.ger.corp.intel.com>
	<CAJTo0LY0eNa94dkMuLow_hSh2_V=thCxGAVexfEf3v4fpXrgDA@mail.gmail.com>
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
X-List-Received-Date: Mon, 25 Jul 2016 20:33:46 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Mon, 25 Jul 2016 17:39:42 Burton, Ross wrote:
> On 24 July 2016 at 22:42, Paul Eggleton <paul.eggleton@linux.intel.com>
> wrote:
> > Just noticed something that looks odd - why do all these paths have a
> > literal TOPDIR at the start? Is that normal?
> 
> The error reporting tool use to replace TOPDIR with " " but that got
> confusing as it looked like either whitespace was being added, or the
> sysroot was missing in various places.  It now replaces the paths with
> TOPDIR or WORKDIR to hide these personal paths in the logs for both privacy
> and to let errors.yp have a better chance of finding matching logs.

Yep that makes sense. For the autobuilder it's a minor inconvenience but you 
can just click through and find the real log so no big deal.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

