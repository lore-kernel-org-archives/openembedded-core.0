Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id A8B677017D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Nov 2017 20:18:52 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Nov 2017 12:18:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,448,1505804400"; d="scan'208";a="177427265"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.134])
	by orsmga005.jf.intel.com with ESMTP; 24 Nov 2017 12:18:52 -0800
Date: Fri, 24 Nov 2017 14:28:16 -0600
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: Patchwork <patchwork@patchwork.openembedded.org>
Message-ID: <20171124142816.251f7376@lsandov1-mobl2.zpn.intel.com>
In-Reply-To: <20171124200408.2786.66234@do.openembedded.org>
References: <1511552846-1887-1-git-send-email-andrey.konovalov@linaro.org>
	<20171124200408.2786.66234@do.openembedded.org>
X-Mailer: Claws Mail 3.14.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIHdlc3RvbjogYWRkIHBhdGNoIHRvIHNldCBwaXRjaCBjb3JyZWN0bHkgZm9yIHN1YnNhbXBsZWQgdGV4dHVyZXM=?=
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
X-List-Received-Date: Fri, 24 Nov 2017 20:18:52 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 24 Nov 2017 20:04:08 -0000
Patchwork <patchwork@patchwork.openembedded.org> wrote:

> == Series Details ==
> 
> Series: weston: add patch to set pitch correctly for subsampled textures
> Revision: 1
> URL   : https://patchwork.openembedded.org/series/9949/
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
> * Issue             New patch path missing in SRC_URI [test_src_uri_path_not_updated] 
>   Suggested fix    Add the patch path to the recipe's SRC_URI
>   New patch(es)    weston-gl-renderer-Set-pitch-correctly-for-subsampled-textures.patch

I believe this is a false-positive from the system of a check that was just added [1]

I will revert it until fix it.

[1]
http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe/commit/?id=49201c19cfe4cadd127b112d2858d5b28db49c20

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

