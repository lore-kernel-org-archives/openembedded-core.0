Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 67E3565CBC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Nov 2015 15:09:39 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 10 Nov 2015 07:09:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,270,1444719600"; d="scan'208";a="847030590"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com) ([10.252.0.72])
	by orsmga002.jf.intel.com with ESMTP; 10 Nov 2015 07:09:24 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Date: Tue, 10 Nov 2015 15:09:22 +0000
Message-ID: <1482143.Xah07ao4VT@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.1.10-100.fc21.x86_64; KDE/4.14.11; x86_64; ;
	)
In-Reply-To: <564207E6.9090409@linux.intel.com>
References: <CAHiDW_Hx6Xi91=8rg3pD_B7F_+wfL2vMUbJTXYh6XGLzksBm7w@mail.gmail.com>
	<3967262.YS5vrjTqP1@peggleto-mobl.ger.corp.intel.com>
	<564207E6.9090409@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Tue, 10 Nov 2015 15:09:42 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 10 November 2015 17:06:14 Alexander Kanavin wrote:
> On 11/10/2015 04:50 PM, Paul Eggleton wrote:
> > When considering whether something belongs in OE-Core, typically we apply
> > the following criteria (not that this is really formalised, but based on
> > our history):
> > 
> > 1) Is it something that a reasonable majority of people need in an
> > embedded context?
> 
> I should clarify: there might be Vala software out there that someone
> would want to run in an embedded context. And that software might
> require Vala bindings for libraries that are in oe-core. If we don't
> provide those bindings, then either the layer that adds vala recipe also
> has to patch all of our oe-core recipes, 

That's what we have PACKAGECONFIG for.

> or (worse!) the person who
> needs something vala-based also has to ad-hoc-patch the dependency
> recipes of that.

There shouldn't be any patching needed at all. If we were to remove this from 
OE-Core, it still does not preclude us having the appropriate PACKAGECONFIG 
options to enable it.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

