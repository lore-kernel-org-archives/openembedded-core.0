Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 71D2272FB7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2017 20:24:34 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Feb 2017 12:24:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,215,1484035200"; d="scan'208";a="1135671194"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.141])
	by fmsmga002.fm.intel.com with ESMTP; 27 Feb 2017 12:24:35 -0800
Message-ID: <1488227103.28256.31.camel@linux.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: Joe MacDonald <Joe_MacDonald@mentor.com>
Date: Mon, 27 Feb 2017 14:25:03 -0600
In-Reply-To: <20170227200624.GA1688@mentor.com>
References: <1487908800-18064-1-git-send-email-joe_macdonald@mentor.com>
	<20170227183329.9748.13885@do.openembedded.org>
	<20170227200624.GA1688@mentor.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIGRlcHJlY2F0ZWQuYmJjbGFzczogQWRkIGEgUE5ERVBSRUNBVEVEIHZhcmlhYmxlIGZvciByZWNpcGVzIChyZXYzKQ==?=
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
X-List-Received-Date: Mon, 27 Feb 2017 20:24:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2017-02-27 at 15:06 -0500, Joe MacDonald wrote:
> [✗ patchtest: failure for deprecated.bbclass: Add a PNDEPRECATED variable for recipes (rev3)] On 17.02.27 (Mon 18:33) Patchwork wrote:
> 
> > == Series Details ==
> > 
> > Series: deprecated.bbclass: Add a PNDEPRECATED variable for recipes (rev3)
> > Revision: 3
> > URL   : https://patchwork.openembedded.org/series/5489/
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
> >   Targeted branch  master (currently at 65cfc8aca3)
> 
> I had been out of date, but this time I'm reasonably confident v3 is
> still directly on top of master.
> 
> yocto-mainline> git config --local --get-regexp '^remote'
> remote.yocto.url git://git.yoctoproject.org/poky
> remote.yocto.projectname poky
> remote.yocto.fetch +refs/heads/*:refs/remotes/yocto/*
> yocto-mainline> git pull
> Already up-to-date.
> yocto-mainline> git status
> On branch master
> Your branch is ahead of 'yocto/master' by 1 commit.
>   (use "git push" to publish your local commits)
> 
> nothing to commit, working directory clean
> 
> Is patchtest having a bad day?

yes,  there were some issues with the cron job running patchtest but
that is now solved. The problem is that your patch is a documentation
patch, not a oe-core patch, so it does not apply into oe-core. Send it
to the correct list (yocto@yoctoproject.org) if necessary.





> 
> > If you believe any of these test results are incorrect, please reply to the
> > mailing list (openembedded-core@lists.openembedded.org) raising your concerns.
> > Otherwise we would appreciate you correcting the issues and submitting a new
> > version of the patchset if applicable. Please ensure you add/increment the
> > version number when sending the new version (i.e. [PATCH] -> [PATCH v2] ->
> > [PATCH v3] -> ...).
> > 
> > ---
> > Test framework: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
> > Test suite:     http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe
> > 
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



