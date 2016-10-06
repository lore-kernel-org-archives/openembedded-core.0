Return-Path: <stephano.cetola@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 8A1DB71A03
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Oct 2016 03:26:32 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga105.fm.intel.com with ESMTP; 05 Oct 2016 20:26:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,451,1473145200"; d="scan'208";a="1061086656"
Received: from kchan14-mobl.amr.corp.intel.com ([10.254.28.46])
	by orsmga002.jf.intel.com with ESMTP; 05 Oct 2016 20:26:33 -0700
Date: Wed, 5 Oct 2016 20:26:33 -0700
From: Stephano Cetola <stephano.cetola@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20161006032633.GA3418@kchan14-mobl.amr.corp.intel.com>
References: <20161003233245.100337-1-stephano.cetola@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20161003233245.100337-1-stephano.cetola@linux.intel.com>
User-Agent: Mutt/1.7.0 (2016-08-17)
Cc: Paul Eggleton <paul.eggleton@intel.com>
Subject: Re: [PATCH V3] add function to check for git config user
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
X-List-Received-Date: Thu, 06 Oct 2016 03:26:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 10/03, Stephano Cetola wrote:
> Chnages since V2:
> moved functionality from sanity to utils
> utilize existing name / email variables 
> 
> Stephano Cetola (1):
>   utils.bbclass: add function to check for git config user
> 
>  meta/classes/buildhistory.bbclass | 15 ++++++---------
>  meta/classes/kernel-yocto.bbclass |  3 +++
>  meta/classes/utils.bbclass        | 10 ++++++++++
>  3 files changed, 19 insertions(+), 9 deletions(-)
> 
> -- 
> 2.10.0
> 
I spoke with Paul and we both agree that this is a good compromise for now.
Thoughts?

