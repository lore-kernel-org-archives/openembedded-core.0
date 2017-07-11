Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 91AB977DBE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 16:05:24 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga104.jf.intel.com with ESMTP; 11 Jul 2017 09:05:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,347,1496127600"; d="scan'208";a="1194059299"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.119])
	by fmsmga002.fm.intel.com with ESMTP; 11 Jul 2017 09:05:23 -0700
Message-ID: <1499789703.5349.20.camel@linux.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: Denys Dmytriyenko <denis@denix.org>
Date: Tue, 11 Jul 2017 11:15:03 -0500
In-Reply-To: <20170711153521.GG26405@denix.org>
References: <3656d37e-dbf1-5664-a175-d4863c80ebd6@deshawresearch.com>
	<20170710213119.2381.49390@do.openembedded.org>
	<2753237e-e5ce-54e8-5a45-2dea9fed8899@deshawresearch.com>
	<20170711153521.GG26405@denix.org>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIGdldHRleHQ6IEVuYWJsZSBnZW5lcmF0aW9uIG9mIGxpYmFzcHJpbnRmIGluIGdldHRleHQgMC4xOQ==?=
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
X-List-Received-Date: Tue, 11 Jul 2017 16:05:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2017-07-11 at 11:35 -0400, Denys Dmytriyenko wrote:
> Your patch is simply corrupted - please use git to send it, not a regular MUA.

Lev,

I just tried locally and patch can not be merged on top of master's
HEAD.

One easy way to try is using patchwork's git plugin and from the command
line:


> git pw mbox 7657 | git apply --check --verbose
Checking patch meta/recipes-core/gettext/gettext_0.19.8.1.bb...
error: while searching for:

 EXTRA_OECONF += "--without-lispdir \
                  --disable-csharp \
                 --disable-libasprintf \
                  --disable-java \
                  --disable-native-java \
                  --disable-openmp \

So, as the message suggests, update your master and rebase your branch
against the latter.


> 
> On Tue, Jul 11, 2017 at 11:10:11AM -0400, Lev Iserovich wrote:
> > Can anyone help me with undestanding this - I'm confused by this
> > patchwork failure.
> > The patch applies just fine on top of master - my patch was based on
> > top of the commit with the hash referenced by patchwork below.
> > 
> > Thanks,
> > 
> > Lev Iserovich
> > 
> > On 07/10/2017 05:31 PM, Patchwork wrote:
> > >== Series Details ==
> > >
> > >Series: gettext: Enable generation of libasprintf in gettext 0.19
> > >Revision: 1
> > >URL   : https://patchwork.openembedded.org/series/7657/
> > >State : failure
> > >
> > >== Summary ==
> > >
> > >
> > >Thank you for submitting this patch series to OpenEmbedded Core. This is
> > >an automated response. Several tests have been executed on the proposed
> > >series by patchtest resulting in the following failures:
> > >
> > >
> > >
> > >* Issue             Series does not apply on top of target branch [test_series_merge_on_head]
> > >   Suggested fix    Rebase your series on top of targeted branch
> > >   Targeted branch  master (currently at 7dd5dfc4d5)
> > >
> > >
> > >
> > >If you believe any of these test results are incorrect, please reply to the
> > >mailing list (openembedded-core@lists.openembedded.org) raising your concerns.
> > >Otherwise we would appreciate you correcting the issues and submitting a new
> > >version of the patchset if applicable. Please ensure you add/increment the
> > >version number when sending the new version (i.e. [PATCH] -> [PATCH v2] ->
> > >[PATCH v3] -> ...).
> > >
> > >---
> > >Test framework: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
> > >Test suite:     http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe
> > >
> > 
> > -- 
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core



