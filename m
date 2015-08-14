Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 3A1816E268
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Aug 2015 14:56:28 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 14 Aug 2015 07:56:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,678,1432623600"; d="scan'208";a="783736673"
Received: from apaulaux-mobl.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.4.160])
	by fmsmga002.fm.intel.com with ESMTP; 14 Aug 2015 07:56:27 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Date: Fri, 14 Aug 2015 15:56:26 +0100
Message-ID: <2022011.zuQSkpBHkd@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.1.3-100.fc21.x86_64; KDE/4.14.9; x86_64; ; )
In-Reply-To: <1439563928.28153.65.camel@intel.com>
References: <cover.1439281753.git.patrick.ohly@intel.com>
	<CAJTo0La2Q-jeFBRND7pYoWW5HQByu7pgEcOzexqJw1FSe2fQiA@mail.gmail.com>
	<1439563928.28153.65.camel@intel.com>
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] tar-replacement-native: avoid race condition with host tar
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
X-List-Received-Date: Fri, 14 Aug 2015 14:56:37 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 14 August 2015 16:52:08 Patrick Ohly wrote:
> On Fri, 2015-08-14 at 12:03 +0100, Burton, Ross wrote:
> > On 14 August 2015 at 12:01, Paul Eggleton
> > 
> > <paul.eggleton@linux.intel.com> wrote:
> >         Or install the buildtools perhaps.
> > 
> > Yes, I had that in my head but someone failed to write it down.
> > There's a fair chance that a host with a sufficiently old tar also
> > needs other updates, and that's when buildtools is used (which
> > includes tar).
> 
> The hosts we talk about (Debian 7, CentOS 6) work fine for normal usage
> without having to install buildtools.

Really? You must have added *something* on top of CentOS 6 because last I 
checked its git, tar and python versions supplied out of the box were way too 
old to even get the build to start.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

