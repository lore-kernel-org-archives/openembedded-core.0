Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 36C44719A4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Aug 2017 15:38:32 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Aug 2017 08:38:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,373,1498546800"; d="scan'208";a="1003457570"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.134])
	by orsmga003.jf.intel.com with ESMTP; 14 Aug 2017 08:38:33 -0700
Message-ID: <1502725638.28941.11.camel@linux.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Aug 2017 10:47:18 -0500
In-Reply-To: <20170814070103.2380.69088@do.openembedded.org>
References: <20170814060201.110742-1-jose.alarcon@ge.com>
	<20170814070103.2380.69088@do.openembedded.org>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIGxpYngxMTogQWRkIHBhdGNoIHRvIGZpeCBoYW5naW5nIGlzc3VlIGluIF9YUmVwbHk=?=
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
X-List-Received-Date: Mon, 14 Aug 2017 15:38:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2017-08-14 at 07:01 +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: libx11: Add patch to fix hanging issue in _XReply
> Revision: 1
> URL   : https://patchwork.openembedded.org/series/8209/
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
>   Targeted branch  master (currently at 5a25ed1071)

master currently has libx11_1.6.5 and this path is based of 1.6.4 so you
may need to check if issue is present on latest version.


> 
> * Patch            [meta-oe] libx11: Add patch to fix hanging issue in _XReply
>  Issue             Patch is missing Signed-off-by [test_signed_off_by_presence] 
>   Suggested fix    Sign off the patch (either manually or with "git commit --amend -s")


> 
> * Patch            [meta-oe] libx11: Add patch to fix hanging issue in _XReply
>  Issue             Series sent to the wrong mailing list [test_target_mailing_list] 
>   Suggested fix    Check the project's README (meta-oe) and send the patch to the indicated list
> 

if some layer is included in the commit shortlog, patchtest will
indicate that patch went into the wrong mailing list. So remove the
meta-oe string on your next revision.

Leo

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



