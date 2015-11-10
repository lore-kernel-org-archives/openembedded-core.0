Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id B9236770B4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Nov 2015 14:50:10 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 10 Nov 2015 06:50:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,270,1444719600"; d="scan'208";a="832933489"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com) ([10.252.0.72])
	by fmsmga001.fm.intel.com with ESMTP; 10 Nov 2015 06:50:07 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Nov 2015 14:50:06 +0000
Message-ID: <3967262.YS5vrjTqP1@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.1.10-100.fc21.x86_64; KDE/4.14.11; x86_64; ;
	)
In-Reply-To: <5641FF6D.7000508@linux.intel.com>
References: <CAHiDW_Hx6Xi91=8rg3pD_B7F_+wfL2vMUbJTXYh6XGLzksBm7w@mail.gmail.com>
	<5641FF6D.7000508@linux.intel.com>
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
X-List-Received-Date: Tue, 10 Nov 2015 14:50:13 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 10 November 2015 16:30:05 Alexander Kanavin wrote:
> On 11/10/2015 04:22 PM, Jussi Kukkonen wrote:
> > There's currently no software built with vala in oe-core. That's not
> > great for vala (as it's not getting the automated testing that high
> > quality maintenance would require) and it's not great for oe-core (as
> > maintenance effort is better spent on components that _are_ used).
> > 
> > Based on the above there's a feature request** to remove vala from
> > oe-core. Please comment here or on the bug if you think this is an
> > inappropriate idea or have suggestions.
> 
> I have to say no. A lot of things in oe-core (libsoup for instance) come
> with an option to build vala bindings which in turn require native
> vapigen binary provided by vala package.

When considering whether something belongs in OE-Core, typically we apply the 
following criteria (not that this is really formalised, but based on our 
history):

1) Is it something that a reasonable majority of people need in an embedded 
context? 

2) If the answer to #1 is no, is it something that helps us test something 
else that is in OE-Core?

3) Does it have a reasonably minimal set of dependencies that are also 
required to be in OE-Core?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

