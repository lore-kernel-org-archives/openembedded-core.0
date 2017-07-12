Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 4155178152
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 20:56:12 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga105.jf.intel.com with ESMTP; 12 Jul 2017 13:56:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,351,1496127600"; d="scan'208";a="107502536"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.119])
	by orsmga004.jf.intel.com with ESMTP; 12 Jul 2017 13:56:13 -0700
Message-ID: <1499893555.5349.62.camel@linux.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Jul 2017 16:05:55 -0500
In-Reply-To: <20170712200120.2381.91363@do.openembedded.org>
References: <cover.1499887935.git.anibal.limon@linux.intel.com>
	<20170712200120.2381.91363@do.openembedded.org>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIG9lcWEgY29yZSBhbmQgb2Utc2VsZnRlc3QgdGhyZWFkZWQgZW5hYmxlbWVudCAocmV2Mik=?=
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
X-List-Received-Date: Wed, 12 Jul 2017 20:56:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2017-07-12 at 20:01 +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: oeqa core and oe-selftest threaded enablement (rev2)
> Revision: 2
> URL   : https://patchwork.openembedded.org/series/7694/
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
>   Targeted branch  master (currently at b1c4661742)

Just dig into it and found the following: the above issue raised by
patchtest is due to the below one. The safest is to rebase against
oe-core, not poky and send the patch or patches to the correct ML.

Leo


> 
> * Issue             Series sent to the wrong mailing list or some patches from the series correspond to different mailing lists [test_target_mailing_list] 
>   Suggested fix    Send the series again to the correct mailing list (ML)
>   Suggested ML     poky@yoctoproject.org [http://git.yoctoproject.org/cgit/cgit.cgi/poky/]
>   Patch's path:    meta-yocto-bsp/lib/oeqa/selftest/cases/systemd_boot.py
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



