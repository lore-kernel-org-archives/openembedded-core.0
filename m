Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 99D8170016
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Dec 2017 15:50:34 +0000 (UTC)
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Dec 2017 07:50:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,368,1508828400"; 
   d="scan'208";a="592912"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.134])
	by orsmga008.jf.intel.com with ESMTP; 06 Dec 2017 07:50:34 -0800
Date: Wed, 6 Dec 2017 10:00:21 -0600
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: Patchwork <patchwork@patchwork.openembedded.org>
Message-ID: <20171206100021.3c757776@lsandov1-mobl2.zpn.intel.com>
In-Reply-To: <20171206150257.2785.75026@do.openembedded.org>
References: <20171206145928.5497-1-ross.burton@intel.com>
	<20171206150257.2785.75026@do.openembedded.org>
X-Mailer: Claws Mail 3.14.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yICJsaWJ4c2x0OiB1c2UgSFRUUCBpbnN0ZWFkIG9mIEYuLi4iIGFuZCAxIG1vcmU=?=
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
X-List-Received-Date: Wed, 06 Dec 2017 15:50:34 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 06 Dec 2017 15:02:57 -0000
Patchwork <patchwork@patchwork.openembedded.org> wrote:

> == Series Details ==
> 
> Series: "libxslt: use HTTP instead of F..." and 1 more
> Revision: 1
> URL   : https://patchwork.openembedded.org/series/10099/
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
> * Issue             SRC_URI changed but checksums are the same [test_src_uri_checksums_not_changed] 
>   Suggested fix    Include the SRC_URI's checksums changes into your patch


I believe we need to improve this check. checksums do not necessary change if URL changes.

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

