Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 144DB71425;
	Fri,  5 Sep 2014 09:11:54 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 05 Sep 2014 02:11:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="381825983"
Received: from sydealwi-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.158])
	by FMSMGA003.fm.intel.com with ESMTP; 05 Sep 2014 02:07:09 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 05 Sep 2014 10:11:53 +0100
Message-ID: <7503608.dirsGt1W6p@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.13.3 (Linux/3.15.10-201.fc20.x86_64; KDE/4.13.3; x86_64; ;
	)
In-Reply-To: <CAJTo0LaRETJdKG-bL+40YtGrVjs4MLVLiydybSUj5ALa2tyxUQ@mail.gmail.com>
References: <CAJTo0LaRETJdKG-bL+40YtGrVjs4MLVLiydybSUj5ALa2tyxUQ@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] Style issue for recipes
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
X-List-Received-Date: Fri, 05 Sep 2014 09:11:57 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 04 September 2014 15:12:02 Burton, Ross wrote:
> Quick question of style for the community to bikeshed on:  in the
> general case should recipes be split into foo_1.2.bb and foo.inc, or
> should they only split to bb/inc if there are multiple versions and
> generally there should just be foo_1.2.bb.
> 
> Specifically I'm looking at the libunwind patch for oe-core (moving
> from meta-oe) which adds libunwind_1.1.bb and libunwind.inc.
> Personally I feel that splitting them up complicates packaging and
> should only be done if there's actually multiple versions being used.

I think the conclusion we've come to is let's not have inc files just for the 
sake of having them; if we need to add them to share common functionality we 
will, but as time goes on it may be appropriate to factor some of them out. 
(Having said that I think it would cause more harm than good to go on a huge 
spree and merge a load of them away, at least at this point.)

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

