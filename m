Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 466676FEFA
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 May 2016 20:53:43 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga103.jf.intel.com with ESMTP; 09 May 2016 13:53:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,601,1455004800"; d="scan'208";a="100072149"
Received: from hlim7-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.171.117])
	by fmsmga004.fm.intel.com with ESMTP; 09 May 2016 13:53:41 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 10 May 2016 08:53:39 +1200
Message-ID: <3267336.bjdYRHqI9p@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.4.8-300.fc23.x86_64; KDE/4.14.18; x86_64; ;
	)
In-Reply-To: <CADkTA4MmTBTg+Wp-Cwp4eRNzbpp+Sp=5B1Yf4Lc_qUrDwsaaNA@mail.gmail.com>
References: <cover.1462768634.git.paul.eggleton@linux.intel.com>
	<85ffd927c7834f4111ae1740b8aad5a9c444b7aa.1462768634.git.paul.eggleton@linux.intel.com>
	<CADkTA4MmTBTg+Wp-Cwp4eRNzbpp+Sp=5B1Yf4Lc_qUrDwsaaNA@mail.gmail.com>
MIME-Version: 1.0
Cc: Tom Zanussi <tom.zanussi@intel.com>,
	Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 1/6] classes/kernel-check: add a class to check kernel config options
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
X-List-Received-Date: Mon, 09 May 2016 20:53:43 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Mon, 09 May 2016 07:59:43 Bruce Ashfield wrote:
> On Mon, May 9, 2016 at 12:43 AM, Paul Eggleton <
> paul.eggleton@linux.intel.com> wrote:
> > Some user-space software has specific requirements about the kernel
> > configuration options selected. This class allows a recipe to explicitly
> > state the kernel configuration options it needs (through a
> > REQUIRED_KERNEL_OPTIONS variable). This is a space separated list, where
> > 
> > each item is one of:
> >   (a) an option name (e.g. CONFIG_FHANDLE, in which case CONFIG_FHANDLE
> >   
> >       must be set to y or m to match)
> >   
> >   (b) optionname=value (e.g. CONFIG_FHANDLE=y, in which case
> >   
> >       CONFIG_FHANDLE must be set to y). If the specified value is n,
> >       it will also match if the option is not present.
> >   
> >   (c) optionname1|optionname2|... (e.g.
> >   
> >       CONFIG_EXT2_FS|CONFIG_EXT4_USE_FOR_EXT23, meaning that either
> >       CONFIG_EXT2_FS or CONFIG_EXT4_USE_FOR_EXT23 must be set to y or
> >       m to match).
> 
> This duplicates code that is already in the kconf_check routines, which
> I've already made generic (and added dependency information) for the 2.2
> release ... so call me confused that I've never heard about this until now 
> :(

I guess I didn't look hard enough, I'll have to take a look at that. This is 
why the series is RFC (and I included you on CC ;)

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

