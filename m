Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 30D1C71AC2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Oct 2016 01:02:00 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 24 Oct 2016 18:02:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,544,1473145200"; d="scan'208";a="1058568726"
Received: from sloi-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.184.176])
	by fmsmga001.fm.intel.com with ESMTP; 24 Oct 2016 18:01:58 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Tue, 25 Oct 2016 14:01:56 +1300
Message-ID: <6316863.bmAQCNbjp6@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.7.8-100.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <alpine.LFD.2.20.1610221323110.8746@localhost.localdomain>
References: <alpine.LFD.2.20.1610221156210.31588@localhost.localdomain>
	<68D800E1-2594-4E8B-AB8E-6B9C758FD3CF@gmail.com>
	<alpine.LFD.2.20.1610221323110.8746@localhost.localdomain>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: basic bitbake commands to create an SDK?
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
X-List-Received-Date: Tue, 25 Oct 2016 01:02:01 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Sat, 22 Oct 2016 13:24:58 Robert P. J. Day wrote:
> On Sat, 22 Oct 2016, Khem Raj wrote:
> > generally meta-toolchain is prior art. You want to use image
> > specific SDKs so -cpopulate_sdk <image> is fine. In this case it
> > will include the needed dev headers/libs in your SDK for that given
> > image automatically it can be any image
> 
>   yet another dumb question while my build is cranking away ... am i
> correct in assuming that i can generate the SDKs for multiple images
> (same architecture of course) in the same build directory, and the
> resulting generated artifacts will be distinguishable? that is, they
> won't step on each other?

Yes, that will work just fine.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

