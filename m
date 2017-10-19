Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id D9E0678336
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Oct 2017 20:24:52 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga104.jf.intel.com with ESMTP; 19 Oct 2017 13:24:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,403,1503385200"; d="scan'208";a="140159315"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.134])
	by orsmga004.jf.intel.com with SMTP; 19 Oct 2017 13:24:50 -0700
Date: Thu, 19 Oct 2017 15:34:43 -0500
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Message-Id: <20171019153443.568ef8ada34a79e099b3e76d@linux.intel.com>
In-Reply-To: <20171019201458.2783.51659@do.openembedded.org>
References: <cover.1508360667.git.alejandro.hernandez@linux.intel.com>
	<20171019201458.2783.51659@do.openembedded.org>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Cc: Patchwork <patchwork@patchwork.openembedded.org>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIFJlc3RydWN0dXJlIHB5dGhvbjIgYW5kIHB5dGhvbjMgcGFja2FnaW5nIHN5c3RlbSAocmV2Mik=?=
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
X-List-Received-Date: Thu, 19 Oct 2017 20:24:53 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 19 Oct 2017 20:14:58 -0000
Patchwork <patchwork@patchwork.openembedded.org> wrote:

> == Series Details ==
> 
> Series: Restructure python2 and python3 packaging system (rev2)
> Revision: 2
> URL   : https://patchwork.openembedded.org/series/8314/
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
> * Issue             Series cannot be parsed correctly due to malformed diff lines [test_mbox_format] 
>   Suggested fix    Create the series again using git-format-patch and ensure it can be applied using git am
>   Diff line         diff --git a/meta/recipes-devtools/python/python-native_2.7.13.bb b/meta/recipes-devtools/python/python-native_2.7.13.bb

Alex, please ignore this error. This is actually not a false-positive, is the long line patch issue that git-send-email truncates (thus malformat the patch itself) and it is what you indirectly trying to solve with your new approach. Just Ross needs to take it directly from poky-contrib.

Leo


> 
> 
> * Issue             Series does not apply on top of target branch [test_series_merge_on_head] 
>   Suggested fix    Rebase your series on top of targeted branch
>   Targeted branch  master (currently at 3b413a8057)
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
> Guidelines:     https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
> Test framework: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
> Test suite:     http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


-- 
Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

