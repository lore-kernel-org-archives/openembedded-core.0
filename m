Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 1218D60667
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 03:53:35 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 23 May 2016 20:53:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,359,1459839600"; d="scan'208";a="960930889"
Received: from jchang2-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.174.130])
	by orsmga001.jf.intel.com with ESMTP; 23 May 2016 20:53:34 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Tue, 24 May 2016 15:53:31 +1200
Message-ID: <1700462.EZHnc1sg49@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.4.9-300.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <5743CCB0.3030105@windriver.com>
References: <cover.1464060246.git.liezhi.yang@windriver.com>
	<1551285.Qn0PiMd4j4@peggleto-mobl.ger.corp.intel.com>
	<5743CCB0.3030105@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/6] remove unneeded python2 recipes
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
X-List-Received-Date: Tue, 24 May 2016 03:53:37 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tue, 24 May 2016 11:38:24 Robert Yang wrote:
> On 05/24/2016 11:34 AM, Paul Eggleton wrote:
> > On Mon, 23 May 2016 20:25:36 Robert Yang wrote:
> >> They were required by buildtools-tarball, now replaced by python3 ones.
> > 
> > It's not so much that they are required by buildtools-tarball, they are
> > required by various scripts that we have. When you say unneeded, I assume
> > only on the python3 branch? In master python-git very definitely is still
> > needed.
>
> I'm afraid no, my previous patch had been merged on master branch,
> so I think that python-git and others are not needed any more ?

I had missed that change; that puts us into a bit of an interesting situation. 
buildtools-tarball is provided in order to support bitbake builds on hosts 
that don't have the required tools, but the changes required to support python 
3 in the build system itself haven't been merged to master yet. So unless I'm 
missing something at the moment have a version of buildtools that doesn't 
actually support running the build system?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

