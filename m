Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 1352B782A4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Oct 2017 22:54:34 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga105.fm.intel.com with ESMTP; 19 Oct 2017 15:54:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,403,1503385200"; d="scan'208";a="1232912984"
Received: from thgoh-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.76.7])
	by fmsmga002.fm.intel.com with ESMTP; 19 Oct 2017 15:54:33 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Oct 2017 11:54:30 +1300
Message-ID: <1697666.EEGKqn63Ld@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
In-Reply-To: <c3b48865-6846-bb95-8a2e-01e6f646582e@linux.intel.com>
References: <20171017150506.17803-1-joshua.g.lock@intel.com>
	<CAJTo0LZp+kdkO3pMmqEiLUNj4i6eE_Jt08MQGFcPdUM1FZjFnA@mail.gmail.com>
	<c3b48865-6846-bb95-8a2e-01e6f646582e@linux.intel.com>
MIME-Version: 1.0
Subject: Re: [PATCH] devtool: ensure temp directory is created
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
X-List-Received-Date: Thu, 19 Oct 2017 22:54:35 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday, 18 October 2017 5:34:14 AM NZDT Joshua Lock wrote:
> 
> On 17/10/17 17:12, Burton, Ross wrote:
> > On 17 October 2017 at 17:02, Joshua Lock <joshua.g.lock@linux.intel.com 
> > <mailto:joshua.g.lock@linux.intel.com>> wrote:
> > 
> >     FWIW the failure has been observed on multiple host distros (Ubuntu
> >     16.04, Fedora 26, Tumbleweed) and I could replicate it very easily
> >     on my Fedora 26 host with an use of devtool modify -x.
> > 
> > 
> > If you can replicate it on demand how about using a tracing tool to 
> > figure out if a) the mkdir doesn't actually happen or b) something 
> > deletes the directory.
> 
> It seems it's not as easy to reproduce as I thought. I can't reproduce 
> it at all today on either of my two systems.
> 
> I will attempt to gather some logs next time we see it on the autobuilder.

Just to follow up on this thread, creating the temp directory doesn't fix the 
issue. I found and fixed the underlying problem yesterday, details on the bug:

  https://bugzilla.yoctoproject.org/show_bug.cgi?id=12185

I've sent a fix to the bitbake list.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

