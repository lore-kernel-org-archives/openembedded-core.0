Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id DA2457821C;
	Tue, 20 Jun 2017 09:30:45 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Jun 2017 02:30:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,364,1493708400"; d="scan'208";a="115253066"
Received: from m63som-mobl4.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.42.106])
	by orsmga005.jf.intel.com with ESMTP; 20 Jun 2017 02:30:44 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-architecture@lists.openembedded.org
Date: Tue, 20 Jun 2017 11:30:43 +0200
Message-ID: <1682970.JZPvjNPrtm@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
In-Reply-To: <491966d0-a64f-3f51-250c-3d08a8140dec@mentor.com>
References: <1497868738.24449.41.camel@linuxfoundation.org>
	<a34e53ad-edce-faf4-0d4f-f7621f05d57a@windriver.com>
	<491966d0-a64f-3f51-250c-3d08a8140dec@mentor.com>
MIME-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [Openembedded-architecture] OE-Core/Yocto Project's first CVE (CVE-2017-9731)
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
X-List-Received-Date: Tue, 20 Jun 2017 09:30:46 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday, 19 June 2017 5:31:10 PM CEST Sean Hudson wrote:
> On 2017-06-19 09:05 AM, Mark Hatle wrote:
> > It would be reasonable to write up a 'best practices' type document. 
> > Explaining that simply due to the nature of building many of these things
> > will be 'leaked' and where some of them are leaked through.  (Package
> > generation, compilation, etc for instance.)
> 
> That sounds reasonable, although, TBH, if someone is adding credentials
> to their SRC_URIs, I would expect that a best practice would be ignored.
>  Perhaps adding a detection routine that emitted a warning during
> parsing for credentials in the SRC_URI might be warranted?  Thoughts?

This might be useful yes. I think the stumbling block is that at the moment we
would have to have it off by default and then the user is almost certainly not
going to know to turn it on. Perhaps this is another thing that we might check 
in a "production" vs. "development" mode where the user can easily switch to
the former to enable a set of more stringent checks.

FWIW it's not quite the same thing but some of what you might want to do when
moving to production is described in this section of the manual (which, full
disclosure, I had a hand in writing):

  http://www.yoctoproject.org/docs/current/dev-manual/dev-manual.html#making-images-more-secure

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

