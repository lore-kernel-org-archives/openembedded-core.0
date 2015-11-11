Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 97B1877141
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Nov 2015 17:38:33 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 11 Nov 2015 09:38:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,276,1444719600"; d="scan'208";a="817375305"
Received: from ebrookes-mobl6.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.9.9])
	by orsmga001.jf.intel.com with ESMTP; 11 Nov 2015 09:38:31 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Nov 2015 17:38:29 +0000
Message-ID: <1721282.5zui7k1hQG@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.1.10-100.fc21.x86_64; KDE/4.14.11; x86_64; ;
	)
In-Reply-To: <1447262253.3559.249.camel@linuxfoundation.org>
References: <CAHiDW_Hx6Xi91=8rg3pD_B7F_+wfL2vMUbJTXYh6XGLzksBm7w@mail.gmail.com>
	<56420F4A.9030507@linux.intel.com>
	<1447262253.3559.249.camel@linuxfoundation.org>
MIME-Version: 1.0
Subject: Re: [RFC] Remove vala from oe-core
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
X-List-Received-Date: Wed, 11 Nov 2015 17:38:36 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 11 November 2015 09:17:33 Richard Purdie wrote:
> On Tue, 2015-11-10 at 17:37 +0200, Alexander Kanavin wrote:
> > On 11/10/2015 05:29 PM, Otavio Salvador wrote:
> > >> PACKAGECONFIG alone is not sufficient; to build the bindings properly,
> > >> the package also needs to inherit vala.bbclass:
> > >> 
> > >> https://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/tree/meta/class
> > >> es/vala.bbclass?h=akanavin/gobject-introspection-experimental> > 
> > > and this belong to meta-vala (or other). This reduces the core and
> > > this is something we really should to push for.
> > 
> > If this class is moved to meta-vala, how do you make packages in oe-core
> > inherit it, or otherwise do what it does?
> 
> Much as I dislike this, you could do something like:
> 
> inherit ${@base_contains('PACKAGECONFIG', 'vala', 'vala', '')}

Hmm, that's a bit yucky I have to agree. It also won't allow you to enable the 
PACKAGECONFIG value from a bbappend.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

