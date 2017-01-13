Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 1987560069
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2017 00:36:29 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 12 Jan 2017 16:36:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,220,1477983600"; d="scan'208";a="29766987"
Received: from hhteoh-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.157.122])
	by orsmga002.jf.intel.com with ESMTP; 12 Jan 2017 16:36:27 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Mark Hatle <mark.hatle@windriver.com>
Date: Fri, 13 Jan 2017 13:36:26 +1300
Message-ID: <1595933.P5cmfVrMqa@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.8.13-100.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <704d3ba6-03aa-e4b6-7a94-76b247c0efce@windriver.com>
References: <1484249086-36492-1-git-send-email-juro.bystricky@intel.com>
	<1484257321.4367.238.camel@linuxfoundation.org>
	<704d3ba6-03aa-e4b6-7a94-76b247c0efce@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] sanity.bbclass: Improved error message
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
X-List-Received-Date: Fri, 13 Jan 2017 00:36:32 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thu, 12 Jan 2017 16:04:09 Mark Hatle wrote:
> On 1/12/17 3:42 PM, Richard Purdie wrote:
> > On Thu, 2017-01-12 at 11:24 -0800, Juro Bystricky wrote:
> >> When a non-existing MACHINE is specified, sanity check issues
> >> 
> >> the following message:
> >>     Please set a valid MACHINE in your local.conf or environment
> >> 
> >> However, MACHINE can also be set in multiconfig .conf file(s).
> >> Hence we may have several different MACHINE settings within one
> >> (multiconfig) build, so the present error message is fairly
> >> ambiguous.
> >> 
> >> This patch remedies this by explicitly naming the offending MACHINE
> >> and
> >> adding conf/multiconfig/*.conf to the list of places where this
> >> erroneous
> >> MACHINE definition could have originated.
> >> 
> >>     Invalid MACHINE=xyz. Please set a valid MACHINE in your
> >> 
> >> local.conf, conf/multiconfig/*.conf or environment
> > 
> > Can we change this to:
> > 
> > "MACHINE=xyz is invalid. Please set a valid MACHINE in your local.conf,
> > environment or other configuration file."
> 
> I commented elsewhere as well -- but is there any way to see where MACHINE
> was actually set and display that -- or is it limited to 'bitbake -e'
> usage?

You need to have history enabled in the datastore to be able to retrieve that, 
and we don't during normal mode for performance over the entire run. It's 
possible we could enable it reparse the configuration when errors like this 
occur to get it though - it probably wouldn't take too long, but I don't know 
if there are other practical barriers.

Cheers,
Paul
-- 

Paul Eggleton
Intel Open Source Technology Centre

