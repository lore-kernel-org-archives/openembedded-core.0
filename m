Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 12DF377794
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jul 2017 17:23:03 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Jul 2017 10:23:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,318,1496127600"; d="scan'208";a="108009128"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.119])
	by orsmga002.jf.intel.com with ESMTP; 06 Jul 2017 10:23:04 -0700
Message-ID: <1499362356.24688.21.camel@linux.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Date: Thu, 06 Jul 2017 12:32:36 -0500
In-Reply-To: <CAP9ODKqjoFomAmUjRpvAQEZmsFDmc9REmBaSrJbBxQx5Oq1XJQ@mail.gmail.com>
References: <20170705213627.23967-1-otavio@ossystems.com.br>
	<20170705220122.2382.70322@do.openembedded.org>
	<CAP9ODKqjoFomAmUjRpvAQEZmsFDmc9REmBaSrJbBxQx5Oq1XJQ@mail.gmail.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIG1lc2E6IGV0bmF2aXY6IGZpeCBzaGFkZXIgbWlzY29tcGlsYXRpb24gd2l0aCBtb3JlIHRoYW4gMTYgbGFiZWxz?=
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
X-List-Received-Date: Thu, 06 Jul 2017 17:23:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2017-07-06 at 14:01 -0300, Otavio Salvador wrote:
> On Wed, Jul 5, 2017 at 7:01 PM, Patchwork
> <patchwork@patchwork.openembedded.org> wrote:
> > == Series Details ==
> >
> > Series: mesa: etnaviv: fix shader miscompilation with more than 16 labels
> > Revision: 1
> > URL   : https://patchwork.openembedded.org/series/7589/
> > State : failure
> >
> > == Summary ==
> >
> >
> > Thank you for submitting this patch series to OpenEmbedded Core. This is
> > an automated response. Several tests have been executed on the proposed
> > series by patchtest resulting in the following failures:
> >
> >
> >
> > * Issue             Series does not apply on top of target branch [test_series_merge_on_head]
> >   Suggested fix    Rebase your series on top of targeted branch
> >   Targeted branch  master (currently at de79149545)
> 
> Checking the commit it has tried to apply it was indeed going to fail.
> As I mentioned on the commit itself it required the upgrade which has
> been merged on master. Just triggering the test again should work just
> fine.

patchtest is pretty stupid, it just tries to merge on current master's
HEAD (not to other stable branches even if patch specifies it).
patchtest executes every half an hour, so unless you send another series
revision to the ML (which I believe there is no need for the reason you
mentioned) it will be retested.

Leo

> 
> -- 
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750



