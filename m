Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id A75016B369;
	Fri, 26 Jul 2013 14:11:45 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 26 Jul 2013 07:11:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,751,1367996400"; d="scan'208";a="352206203"
Received: from unknown (HELO helios.localnet) ([10.252.122.182])
	by orsmga001.jf.intel.com with ESMTP; 26 Jul 2013 07:11:18 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Jul 2013 15:11:17 +0100
Message-ID: <2462161.40E7azp51u@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-26-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <20130725202743.GB3280@jama>
References: <51F18346.2@windriver.com> <20130725202743.GB3280@jama>
MIME-Version: 1.0
Cc: koen@dominion.thruhere.net, "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: Add lua to oe-core.
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
X-List-Received-Date: Fri, 26 Jul 2013 14:11:46 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 25 July 2013 22:27:43 Martin Jansa wrote:
> On Thu, Jul 25, 2013 at 03:57:58PM -0400, Randy MacLeod wrote:
> > I've found that many projects use the lua scripting language.
> > I'd like to move it from meta-oe to oe-core:
> > 
> > http://cgit.openembedded.org/cgit.cgi/meta-openembedded/tree/meta-oe/recip
> > es-devtools/lua/lua5.1_5.1.5.bb?h=master
> > 
> > http://www.lua.org/about.html
> > 
> > lua-5.2.2 is current, see: http://www.lua.org/download.html
> > so we'd likely uprev and send that version.
> > 
> > rpm and lighttpd could (would?) optionally depend on lua.
> > 
> > oe-core.git $ grep -r lua * | egrep -v 'valuat|valuable|uargp|rpm'
> > 
> > meta/recipes-extended/lighttpd/lighttpd_1.4.32.bb:
> >               --without-lua \
> > 
> > Any comments pro or con before we do the uprev, testing and send
> > a commit?
> 
> 2 recipes which would optionally depend on it doesn't make it good
> "core" component IMHO.
> 
> But uprev, few PACKAGECONFIGs and more testing would be nice.

I concur with Martin, if we're only talking about optional dependencies this 
should just be a case of adding the PACKAGECONFIG options to the recipes in 
OE-Core (or whereever they happen to be), with lua remaining in meta-oe.

However I am aware that lua may be a hard dependency for upcoming versions of 
stuff we do have in OE-Core (I can't recall which). We'll have to cross that 
bridge when we come to it.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

