Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9A9DF71C86
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Apr 2017 14:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1491576573; x=1523112573;
	h=message-id:subject:from:to:cc:date:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=5bV9ZgNg5SAtr+KG+l3Z7AkpeDCFXIDJly4OzaQqOi0=;
	b=r62BT9SecUb4f7B24p1lM/atNB1FJuvG2xS1CcGc7TAGa+iA9PfBHURv
	xitY4djkPWphklhoKxymJW7PepQDVA==;
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 Apr 2017 07:49:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,165,1488873600"; d="scan'208";a="843310977"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.141])
	by FMSMGA003.fm.intel.com with ESMTP; 07 Apr 2017 07:49:31 -0700
Message-ID: <1491577075.31049.55.camel@linux.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 07 Apr 2017 09:57:55 -0500
In-Reply-To: <20170407103203.6645.61492@do.openembedded.org>
References: <1491560353-96797-1-git-send-email-wei.tee.ng@intel.com>
	<20170407103203.6645.61492@do.openembedded.org>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: wei.tee.ng@intel.com
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIFNldCBsaW51eC1maXJtd2FyZSB0byBjb3JyZWN0IGxpY2Vuc2U=?=
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
X-List-Received-Date: Fri, 07 Apr 2017 14:49:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2017-04-07 at 10:32 +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Set linux-firmware to correct license
> Revision: 1
> URL   : https://patchwork.openembedded.org/series/6226/
> State : failure
> 
> == Summary ==
> 
> 
> Thank you for submitting this patch series to OpenEmbedded Core. This is
> an automated response. Several tests have been executed on the proposed
> series by patchtest resulting in the following failures:
> 


patchtest is complaining because you are including this patch on your
series

[OE-core] [PATCH 1/4] bitbake: fetch2: Do not fail to create symbolic
links if they already exist

and it is already merged.

> 
> 
> * Issue             Series does not apply on top of target branch [test_series_merge_on_head] 
>   Suggested fix    Rebase your series on top of targeted branch
>   Targeted branch  master (currently at 901659a51c)
> 
> 
> 
> If you believe any of these test results are incorrect, please reply to the
> mailing list (openembedded-core@lists.openembedded.org) raising your concerns.
> Otherwise we would appreciate you correcting the issues and submitting a new
> version of the patchset if applicable. Please ensure you add/increment the
> version number when sending the new version (i.e. [PATCH] -> [PATCH v2] ->
> [PATCH v3] -> ...).
> 
> ---
> Test framework: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
> Test suite:     http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe
> 



