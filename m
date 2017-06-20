Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 342286006E;
	Tue, 20 Jun 2017 13:43:44 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Jun 2017 06:43:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,364,1493708400"; d="scan'208";a="101561427"
Received: from m63som-mobl4.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.42.106])
	by orsmga002.jf.intel.com with ESMTP; 20 Jun 2017 06:43:44 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Sean Hudson <sean_hudson@mentor.com>
Date: Tue, 20 Jun 2017 15:43:43 +0200
Message-ID: <1575495.V1rrF4XNpq@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
In-Reply-To: <4358098a-6b7b-c5ae-66b2-da2beb052595@mentor.com>
References: <1497868738.24449.41.camel@linuxfoundation.org>
	<1682970.JZPvjNPrtm@peggleto-mobl.ger.corp.intel.com>
	<4358098a-6b7b-c5ae-66b2-da2beb052595@mentor.com>
MIME-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>,
	openembedded-architecture@lists.openembedded.org
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
X-List-Received-Date: Tue, 20 Jun 2017 13:43:45 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday, 20 June 2017 3:27:15 PM CEST you wrote:
> On 2017-06-20 04:30 AM, Paul Eggleton wrote:
> > On Monday, 19 June 2017 5:31:10 PM CEST Sean Hudson wrote:
> >> On 2017-06-19 09:05 AM, Mark Hatle wrote:
> >>> It would be reasonable to write up a 'best practices' type document. 
> >>> Explaining that simply due to the nature of building many of these
> >>> things will be 'leaked' and where some of them are leaked through.
> >>> (Package generation, compilation, etc for instance.)
> >>
> >> That sounds reasonable, although, TBH, if someone is adding credentials
> >> to their SRC_URIs, I would expect that a best practice would be ignored.
> >>  Perhaps adding a detection routine that emitted a warning during
> >> parsing for credentials in the SRC_URI might be warranted?  Thoughts?
> > 
> > This might be useful yes. I think the stumbling block is that at the
> > moment we would have to have it off by default and then the user is almost
> > certainly not going to know to turn it on. Perhaps this is another thing 
> > that we might check in a "production" vs. "development" mode where the
> > user can easily switch to the former to enable a set of more stringent 
> > checks.
> 
> I'm not sure I follow.  What would prevent us from turning on a warning
> that detected credentials in a SRC_URI by default?  Even with Richard's
> change to prevent the information from propagating into the .ipk, it
> seems useful to notify the user.  Personally, I'd like to know if one of
> the recipes I'm using has such information in it regardless of whether
> I'm generating a development or a production image.

You might, sure, but if you're in an environment where during development your 
source is on a server requiring such credentials then it's going to be a bit 
annoying to keep seeing that warning.

Anyway, there's certainly no harm in adding such a check, whether it's on by 
default or not is a separate issue.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

