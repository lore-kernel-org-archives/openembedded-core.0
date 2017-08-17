Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 41A007848A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Aug 2017 23:35:35 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Aug 2017 16:35:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,390,1498546800"; d="scan'208";a="141050355"
Received: from donghoon-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.137.112])
	by fmsmga005.fm.intel.com with ESMTP; 17 Aug 2017 16:35:34 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Aug 2017 11:35:31 +1200
Message-ID: <1665213.qXU8RZhDBk@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
In-Reply-To: <1502359239.18633.274.camel@linuxfoundation.org>
References: <1501715385-17089-1-git-send-email-mark.d.horn@intel.com>
	<1502359239.18633.274.camel@linuxfoundation.org>
MIME-Version: 1.0
Cc: Mark D Horn <mark.d.horn@intel.com>
Subject: Re: [PATCH] recipetool: create: allow handers to set license
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
X-List-Received-Date: Thu, 17 Aug 2017 23:35:36 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday, 10 August 2017 10:00:39 PM NZST Richard Purdie wrote:
> On Wed, 2017-08-02 at 16:09 -0700, Mark D Horn wrote:
> > Recipetool plugins set through register_recipe_handlers were not able
> > to impact the license type via setting extravalues['LICENSE']. This
> > is
> > due to caching the license variables in create_recipe before the
> > handlers
> > have been executed.
> > 
> > This change moves the call to handle_license_vars well after the
> > registered plugins (and extravalue functions) have been called.
> > 
> > Signed-off-by: Mark D Horn <mark.d.horn@intel.com>
> > ---
> >  scripts/lib/recipetool/create.py | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> I'm afraid this leads to oe-selftest regressions and issues in devtool:
>...

FYI Mark and I have discussed this offline and I have a reworked change for 
which the tests pass - I just need to sort out where some of the other devtool 
patches are and I will send it out.

Cheers,
Paul


-- 

Paul Eggleton
Intel Open Source Technology Centre

