Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id C36FD77589
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Mar 2017 13:27:02 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Mar 2017 05:27:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,140,1486454400"; d="scan'208";a="1120923187"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.24.254])
	by fmsmga001.fm.intel.com with ESMTP; 10 Mar 2017 05:27:01 -0800
Message-ID: <1489152420.3099.7.camel@linux.intel.com>
From: Joshua Lock <joshua.g.lock@linux.intel.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Date: Fri, 10 Mar 2017 13:27:00 +0000
In-Reply-To: <1489089950.7785.374.camel@intel.com>
References: <20170308172417.15776-1-joshua.g.lock@intel.com>
	<20170308172417.15776-2-joshua.g.lock@intel.com>
	<1489089950.7785.374.camel@intel.com>
X-Mailer: Evolution 3.22.5 (3.22.5-1.fc25) 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/4] meta-selftest: add selftest-ed recipes
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
X-List-Received-Date: Fri, 10 Mar 2017 13:27:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2017-03-09 at 21:05 +0100, Patrick Ohly wrote:
> On Wed, 2017-03-08 at 17:24 +0000, Joshua Lock wrote:
> > The oe-selftest oescripts.TestScripts.test_cleanup_workdir was
> > using
> > gzip and the GPLv2 variant to test cleanup of the workdir. This
> > broke
> > with the removal of GPLv2 recipes from OE-Core.
> > 
> > Instead of relying on recipes in OE-Core remaining static we should
> > ensure that meta-selftest provides recipes required for the tests
> > to pass.
> > To that end we take a copy of the current GPLv2 and GPLv3 variants
> > of ed
> > and include them in meta-selftest as new recipes.
> > We chose ed over gzip as gzip has dependencies which would require
> > additional GPLv2 recipes to be included in meta-selftest.
> 
> Wouldn't the test become faster when using artificial recipes, i.e.
> something which doesn't really need sources? Such an artificial
> recipe
> can use a local file as its "source", for example.

Indeed, that would make the test faster. I took a shorter route for
this series in an attempt to unblock M3, however I realise that the
bitbake targets used in oe-selftest could do with a consistent review.

I've filed an enhancement request to that effect:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=11142

> Or did I misunderstand something and the selftest doesn't really
> build
> ed?

It does build ed, which is an improvement over building gzip but not as
fast as something artificial.

Thanks for the feedback,

Joshua

