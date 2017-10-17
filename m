Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 2734F782C5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Oct 2017 17:44:07 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Oct 2017 10:44:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,391,1503385200"; d="scan'208";a="1231831406"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.134])
	by fmsmga002.fm.intel.com with SMTP; 17 Oct 2017 10:44:08 -0700
Date: Tue, 17 Oct 2017 12:53:57 -0500
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Message-Id: <20171017125357.29113803f44029838af18f7d@linux.intel.com>
In-Reply-To: <20171016141306.418e7a6502139ed4c2e180c3@linux.intel.com>
References: <20171016150045.25323-1-Randy.MacLeod@windriver.com>
	<20171016160029.2787.48040@do.openembedded.org>
	<4d40ce95-4159-5197-ebca-af1f30f25a6f@windriver.com>
	<20171016141306.418e7a6502139ed4c2e180c3@linux.intel.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yICJSRUFETUUucWVtdTogcWVtdXBwYzY0IGlzIG5vdCAuLi4iIGFuZCAxIG1vcmU=?=
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
X-List-Received-Date: Tue, 17 Oct 2017 17:44:08 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

> 
> > 
> > Also is there a list server for privately reviewing a patch by email?
> > I looked at setting up patchtest locally but got distracted when the
> > setup seemed to take more than a few minutes. Maybe I just need
> > to focus for longer...
> 
> on your current branch, just run the patchtest script located at scripts/contrib/, that would provide basically the same log as the one gotten from patchwork.

Randy,

just test the patchtest script under contrib and I see some exceptions coming from the execution which turn into failures and false positives. this script creates a virtual environment then clones repos and start testing patches starting from master to HEAD. This virtual environment is what is causing problems. I will fix it soon but for the time being a server is doing the test for you :)

Leo

> 
> > 
> > 
> > ../Randy
> > 
> > > 
> > > 
> > > If you believe any of these test results are incorrect, please reply to the
> > > mailing list (openembedded-core@lists.openembedded.org) raising your concerns.
> > > Otherwise we would appreciate you correcting the issues and submitting a new
> > > version of the patchset if applicable. Please ensure you add/increment the
> > > version number when sending the new version (i.e. [PATCH] -> [PATCH v2] ->
> > > [PATCH v3] -> ...).
> > > 
> > > ---
> > > Test framework: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
> > > Test suite:     http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe
> > > 
> > > 
> > 
> > 
> > -- 
> > # Randy MacLeod.  WR Linux
> > # Wind River an Intel Company
> > -- 
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 
> 
> -- 
> Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


-- 
Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

