Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 43CAD6AC24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Apr 2015 13:18:04 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 20 Apr 2015 06:18:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,609,1422950400"; d="scan'208";a="697949525"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com) ([10.252.5.75])
	by fmsmga001.fm.intel.com with ESMTP; 20 Apr 2015 06:18:05 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Bryan Evenson <bevenson@melinkcorp.com>
Date: Mon, 20 Apr 2015 14:18:04 +0100
Message-ID: <2986665.4db1flKRAu@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.4 (Linux/3.18.9-200.fc21.x86_64; KDE/4.14.6; x86_64; ; )
In-Reply-To: <BN3PR0501MB10904A52AD3FCD71C41C67B7BBE00@BN3PR0501MB1090.namprd05.prod.outlook.com>
References: <BN3PR0501MB10904A52AD3FCD71C41C67B7BBE00@BN3PR0501MB1090.namprd05.prod.outlook.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Mon, 20 Apr 2015 13:18:05 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Bryan,

On Monday 20 April 2015 12:42:33 Bryan Evenson wrote:
> Last week I had submitted two patches
> (1f994e81717502fd9d3c2f69772ae8556e6de4cb and
> 433ec67686d6991d2d5f43fd1af957968da1971c) related to problems I had been
> having on the dizzy branch and was happy to see they were accepted. 
> However, I only see the patches on the dizzy branch and I think these
> changes are suitable for backport for all supported branches since the
> problem was introduced (which I think was introduced in dora).  I think I
> had included [dizzy] as a tag in the subject for the patches since that was
> the branch I had been working with.

Is the patch also applicable to fido/master? Because at the moment it seems 
only to have been applied to dizzy.
 
> I can see that there are cases in which a patch only applies to a particular
> branch (e.g. package version changes in the next branch, patch no longer
> applies) and there are cases in which the patch is applicable for master
> all the way back to a particular branch.  What is the suggested way of
> indicating the difference when submitting patches?

In general the policies we use for maintaining the stable branch should be 
documented here:

  https://wiki.yoctoproject.org/wiki/Stable_branch_maintenance

I would say if there is any specificity to the issue the patch fixes, 
particularly if it only applies to one of the stable branches, it should 
probably be noted in the commit message.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

