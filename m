Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 24BBA6FF93
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jan 2016 03:21:03 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 25 Jan 2016 19:21:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,347,1449561600"; d="scan'208";a="901123136"
Received: from wkhoh-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.149.195])
	by fmsmga002.fm.intel.com with ESMTP; 25 Jan 2016 19:21:03 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Tue, 26 Jan 2016 16:21 +1300
Message-ID: <3155839.Pu1rtcj5m9@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.3.3-301.fc23.x86_64; KDE/4.14.16; x86_64; ;
	)
In-Reply-To: <63210057.xvudzCYbSC@peggleto-mobl.ger.corp.intel.com>
References: <cover.1453776397.git.paul.eggleton@linux.intel.com>
	<7904F7D3-27C7-4A18-8A7E-2D201E9F048A@gmail.com>
	<63210057.xvudzCYbSC@peggleto-mobl.ger.corp.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/5] devtool: add configure-help subcommand
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
X-List-Received-Date: Tue, 26 Jan 2016 03:21:05 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tue, 26 Jan 2016 16:17:39 Paul Eggleton wrote:
> Hi Khem,
> 
> On Mon, 25 Jan 2016 22:14:09 Khem Raj wrote:
> > > On Jan 25, 2016, at 9:53 PM, Paul Eggleton
> > > <paul.eggleton@linux.intel.com>
> > > wrote:
> > > 
> > > When you need to set EXTRA_OECONF for a recipe, you need to know what
> > > options the configure script actually supports; the configure script
> > > however is only accessible from within a devshell and (at least in the
> > > case of autotooled software fetched from an SCM repository) may not
> > > actually exist until do_configure has run. Thus, provide a "devtool
> > > configure-help" subcommand that runs the configure script for a recipe
> > > with --help and shows you the output through a pager (e.g. less),
> > > prefaced by a header describing the current options being specified.
> > > 
> > > There is basic support for autotools, cmake and bare configure scripts.
> > > The cmake support is a little hacky since cmake doesn't really have a
> > > concise help option that lists user-defined knobs (without actually
> > > running through the configure process), however that being a design
> > > feature of cmake there's not much I can think of to do about that at
> > > the moment.
> > 
> > this option is autotools specific. We need to convey this precisely. may
> > be
> > involve autotools in the option name or something
> 
> Whilst not all non-autoconf configure scripts provide a --help option, some
> do. ffmpeg/libav is one example (and one where you really do need to see
> the output since there are a lot of options...)

I meant to add, even if configure --help doesn't work (or there is no configure 
script at all) the header this subcommand prints will work with any recipe 
provided that do_configure is actually implemented and contains some actual 
commands as opposed to calls to some other function.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

