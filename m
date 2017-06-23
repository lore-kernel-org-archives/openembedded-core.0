Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 22152780C3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jun 2017 14:12:12 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga105.jf.intel.com with ESMTP; 23 Jun 2017 07:12:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,378,1493708400"; d="scan'208";a="277859526"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.119])
	by fmsmga004.fm.intel.com with ESMTP; 23 Jun 2017 07:12:13 -0700
Message-ID: <1498227686.31575.82.camel@linux.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Jun 2017 09:21:26 -0500
In-Reply-To: <20170623020139.1039.77332@do.openembedded.org>
References: <1498182968-27962-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<20170623020139.1039.77332@do.openembedded.org>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIChtb3J0eSkgcnBtOiBGaXggdGhlIEJ1ZyBvZiBTUlBNIFN0cmluZyBlcnJvciAocmV2Mik=?=
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
X-List-Received-Date: Fri, 23 Jun 2017 14:12:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2017-06-23 at 02:01 +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: (morty) rpm: Fix the Bug of SRPM String error (rev2)
> Revision: 2
> URL   : https://patchwork.openembedded.org/series/7416/
> State : failure
> 
> == Summary ==
> 
> 
> Thank you for submitting this patch series to OpenEmbedded Core. This is
> an automated response. Several tests have been executed on the proposed
> series by patchtest resulting in the following failures:
> 
> 
> 
> * Issue             Series does not apply on top of target branch [test_series_merge_on_head] 
>   Suggested fix    Rebase your series on top of targeted branch
>   Targeted branch  master (currently at 7c36b4316a)


For the moment, incoming patches are tested based on master, so
non-master patches may fail when apply/am to master. So this is a false
positive result. I will fix it.

Leo

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



