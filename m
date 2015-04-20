Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id E4F256E268
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Apr 2015 13:47:31 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 20 Apr 2015 06:47:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,609,1422950400"; d="scan'208";a="558792418"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com) ([10.252.5.75])
	by orsmga003.jf.intel.com with ESMTP; 20 Apr 2015 06:47:30 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Bryan Evenson <bevenson@melinkcorp.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Mon, 20 Apr 2015 14:47:29 +0100
Message-ID: <1527901.KFalgYf7mr@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.4 (Linux/3.18.9-200.fc21.x86_64; KDE/4.14.6; x86_64; ; )
In-Reply-To: <BN3PR0501MB10908E971F71B5725C73D9F7BBE00@BN3PR0501MB1090.namprd05.prod.outlook.com>
References: <BN3PR0501MB10904A52AD3FCD71C41C67B7BBE00@BN3PR0501MB1090.namprd05.prod.outlook.com>
	<2986665.4db1flKRAu@peggleto-mobl.ger.corp.intel.com>
	<BN3PR0501MB10908E971F71B5725C73D9F7BBE00@BN3PR0501MB1090.namprd05.prod.outlook.com>
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Clarification on backport and bugfix patch submittal process
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
X-List-Received-Date: Mon, 20 Apr 2015 13:47:36 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 20 April 2015 13:41:20 Bryan Evenson wrote:
> Paul,
> 
> > -----Original Message-----
> > From: Paul Eggleton [mailto:paul.eggleton@linux.intel.com]
> > Sent: Monday, April 20, 2015 9:18 AM
> > To: Bryan Evenson
> > Cc: openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core] Clarification on backport and bugfix patch
> > submittal
> > process
> > 
> > Hi Bryan,
> > 
> > On Monday 20 April 2015 12:42:33 Bryan Evenson wrote:
> > > Last week I had submitted two patches
> > > (1f994e81717502fd9d3c2f69772ae8556e6de4cb and
> > > 433ec67686d6991d2d5f43fd1af957968da1971c) related to problems I had
> > > been having on the dizzy branch and was happy to see they were
> > 
> > accepted.
> > 
> > > However, I only see the patches on the dizzy branch and I think these
> > > changes are suitable for backport for all supported branches since the
> > > problem was introduced (which I think was introduced in dora).  I
> > > think I had included [dizzy] as a tag in the subject for the patches
> > > since that was the branch I had been working with.
> > 
> > Is the patch also applicable to fido/master? Because at the moment it
> > seems
> > only to have been applied to dizzy.
> 
> Yes, in my opinion these two patches are suitable for dora up through
> master.

OK, so we really ought to have applied these to master first then. Richard, can 
you take care of that? The dizzy revs (which cherry-pick cleanly) are:

edeeee8432dc749b02e5e6eca0503229e394ebd3
3bdc098028732a4b22b1e65e5566b4cbe105fd41

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

