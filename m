Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id D026E719A1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Oct 2016 21:21:52 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga103.fm.intel.com with ESMTP; 18 Oct 2016 14:21:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,511,1473145200"; d="scan'208";a="181193844"
Received: from yuan-mobl3.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.158.98])
	by fmsmga004.fm.intel.com with ESMTP; 18 Oct 2016 14:21:51 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Randy MacLeod <randy.macleod@windriver.com>
Date: Wed, 19 Oct 2016 10:21:49 +1300
Message-ID: <1570516.F2oa9eZtAN@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.7.7-100.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <0464acab-69a2-715d-5a3d-61e3961e8ccb@windriver.com>
References: <cover.1476469708.git.jussi.kukkonen@intel.com>
	<0464acab-69a2-715d-5a3d-61e3961e8ccb@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] Re-add piglit to sdk images
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
X-List-Received-Date: Tue, 18 Oct 2016 21:21:53 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tue, 18 Oct 2016 11:13:11 Randy MacLeod wrote:
> On 2016-10-14 02:31 PM, Jussi Kukkonen wrote:
> > Piglit was removed because the current version was making sdk
> > images too large. This patchset reduces the installed size by 1.5GB
> > and adds piglit back to core-tools-testapps.
> > 
> > Running piglit still requires the same amount of space so in practice
> > this is useful for installed images only.
> > 
> > Q: Do I need to declare a runtime dependency that typically comes
> > from busybox (tar)?
> 
> Yes, because some people try to eliminate busybox from their image.

How would one express such a dependency though, given that it could come from 
tar or busybox? "Virtual" runtime dependencies aren't allowed except through 
our somewhat awkward VIRTUAL-RUNTIME convention, but that probably isn't 
warranted here.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

