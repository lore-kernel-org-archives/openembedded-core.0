Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 02D6B6C483
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Nov 2018 19:35:17 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Nov 2018 11:35:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,295,1539673200"; d="scan'208";a="278912435"
Received: from vsiribox-mobl2.gar.corp.intel.com (HELO localhost.localdomain)
	([10.255.174.172])
	by orsmga005.jf.intel.com with ESMTP; 29 Nov 2018 11:35:16 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Fri, 30 Nov 2018 08:35:12 +1300
Message-ID: <5939456.jcG4z1hedJ@localhost.localdomain>
Organization: Intel Corporation
In-Reply-To: <70743b99abf1bf4f41da716a698433013ea92780.camel@linuxfoundation.org>
References: <20181128215407.13237-1-paul.eggleton@linux.intel.com>
	<20181129092115.28502-1-paul.eggleton@linux.intel.com>
	<70743b99abf1bf4f41da716a698433013ea92780.camel@linuxfoundation.org>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3 4/4] oe-selftest: add some tests for recipeutils module
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
X-List-Received-Date: Thu, 29 Nov 2018 19:35:18 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday, 30 November 2018 3:06:32 AM NZDT Richard Purdie wrote:
> On Thu, 2018-11-29 at 22:21 +1300, Paul Eggleton wrote:
> > Add some tests for functions in meta/lib/oe/recipeutils.py, in
> > particular for a few issues I've just fixed. I haven't added tests
> > for
> > all of the functions - some of them are already being tested via
> > devtool
> > in any case.
> 
> Hate to say it but this still isn't working:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/28/steps/7/logs/step2d
> 
> probably due to it not working with the -j option :/

Right, so it seems that COREBASE isn't pointing where I'd expect it to 
here - instead of the copy of the core metadata that's made for the test, it's
pointing to the original layer. Is that a bug?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre



