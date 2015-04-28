Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 5DB42736BA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 12:03:20 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 28 Apr 2015 05:03:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,663,1422950400"; d="scan'208";a="720403126"
Received: from pkcletus-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.20.230])
	by orsmga002.jf.intel.com with ESMTP; 28 Apr 2015 05:03:10 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 28 Apr 2015 13:03:08 +0100
Message-ID: <2552285.n91QhEyKuk@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.4 (Linux/3.18.9-200.fc21.x86_64; KDE/4.14.6; x86_64; ; )
In-Reply-To: <CAJTo0LYrLFF-qvYrA2zFZV+KgKu5cv3ZL53h0GC_km+oXvcutg@mail.gmail.com>
References: <cover.1429781137.git.jackie.huang@windriver.com>
	<92ce281f37748218692be482b3393e81b4b817ec.1429781137.git.jackie.huang@windriver.com>
	<CAJTo0LYrLFF-qvYrA2zFZV+KgKu5cv3ZL53h0GC_km+oXvcutg@mail.gmail.com>
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] license.bbclass: allow copying license not in common licenses
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
X-List-Received-Date: Tue, 28 Apr 2015 12:03:21 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 28 April 2015 12:48:50 Burton, Ross wrote:
> On 23 April 2015 at 10:38, <jackie.huang@windriver.com> wrote:
> > Some package like linux-firmware has many licenses that aren't in any
> > way common, and new ones will be added from time to time, in order to
> > avoid adding bunch of such common license files that are only applicable
> > to a specific package, NO_GENERIC_LIC is added to allow copying license
> 
> > not in common licenses, it should be used in the recipe as:
> Why can't linux-firmware just put those licenses into a directory alongside
> the recipe and do something like LICENSE_PATH += "${THISDIR}/licenses"?

I'd rather not have to extract those licenses and potentially have them drift 
from the ones fetched from the source; besides, that gives us almost no benefit 
over not doing this change at all.

This is about (a) acknowledging that linux-firmware is a bit special with 
regard to licensing compared to other recipes and (b) keeping the additional 
maintenance required to a minimum.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

