Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id 216266093F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2018 05:05:25 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Sep 2018 22:05:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,392,1531810800"; d="scan'208";a="91336554"
Received: from booi2-mobl.gar.corp.intel.com (HELO localhost.localdomain)
	([10.255.173.85])
	by fmsmga001.fm.intel.com with ESMTP; 18 Sep 2018 22:05:10 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Vignesh Rajendran (RBEI/ECF3)" <Vignesh.Rajendran@in.bosch.com>
Date: Wed, 19 Sep 2018 17:05:07 +1200
Message-ID: <14928737.NSOVLV5pqe@localhost.localdomain>
Organization: Intel Corporation
In-Reply-To: <1b7867b1caee42cd88a5a94088106daf@in.bosch.com>
References: <1b7867b1caee42cd88a5a94088106daf@in.bosch.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: patch submission feedback
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
X-List-Received-Date: Wed, 19 Sep 2018 05:05:26 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday, 19 September 2018 4:38:28 PM NZST Vignesh Rajendran (RBEI/ECF3) 
wrote:
> I have submitted a patch some months before and waiting for feedback after
> some discussion.
> https://patchwork.openembedded.org/patch/150819/
> 
> But after some long wait, there was no response from anyone.
> I personally feel there should be some support and motivation to
> contributors.

You are right, my sincere apologies for not being more communicative regarding 
your patch. This is a bug I would like to see fixed, and I will aim to do 
better in future.

However, taking a look at the original patch, my concerns are still the same - 
I don't think package.bbclass should have references to EXTERNALSRC added to 
it. My suggestion would be to try to generalise the solution - have 
package.bbclass detect the underlying problem, or look for S being outside of 
WORKDIR, or something similar.

Thanks
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre



