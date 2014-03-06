Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 99D746DC27
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Mar 2014 10:27:26 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 06 Mar 2014 02:23:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,599,1389772800"; d="scan'208";a="495066660"
Received: from lbhoopat-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.174])
	by orsmga002.jf.intel.com with ESMTP; 06 Mar 2014 02:27:25 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 06 Mar 2014 10:27:24 +0000
Message-ID: <2288928.xThRbmMvUj@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.3 (Linux/3.13.5-200.fc20.x86_64; KDE/4.12.3; x86_64; ; )
In-Reply-To: <20140306013131.GE26981@jama>
References: <20140306013131.GE26981@jama>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: error-report-web django-nvd3 version
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
X-List-Received-Date: Thu, 06 Mar 2014 10:27:30 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Martin,

On Thursday 06 March 2014 02:31:31 Martin Jansa wrote:
> can you be more specific about django-nvd3 version required by
> error-report-web?
> http://git.yoctoproject.org/cgit/cgit.cgi/error-report-web/tree/README
> 
> with 0.6.* it was complaining about missing kw_args param in load_chart
> calls, older versions were complaining about other changes.

I'm not sure of the original version, but FWIW I did make a fix for this
problem with 0.6 in the layer index the other day that might be useful
as a reference:

http://git.yoctoproject.org/cgit/cgit.cgi/layerindex-web/commit/?id=5aa533b678a2a60f989e4686e0880e24761a9aca

As you can see I found I needed to update the d3/nvd3 js files at the same
time.

> I'm testing it (currently without graphs) in order to extend it to collect
> some build metrics and statistics from our builds (like every jenkins build
> and very local developer build will upload back description of HW, build
> times and other metrics so we can better evaluate icecc, sstate reuse ratio
> etc).
> 
> If something like that would be useful for upstream I can eventually
> contribute it back.

Seems reasonable to me, as long as it doesn't get in the way of handling
error reports.

> I've also updated the .bbclass to read all "configuration" from bb data
> and to upload the report after every build (sort of like tinderbox,
> oestats bbclass worked), that way is easier for us to globally enable it
> for all builds in our distro config without any interaction from
> developers.

As long as this is an option and not on by default (and ideally make it
a trinary switch so you can decide to send just errors automatically)
this should be OK also. Showing some kind of notification that it's doing
it would be a good thing as well I think.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

