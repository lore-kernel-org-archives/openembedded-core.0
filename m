Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id A394D78350
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Aug 2017 15:21:30 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Aug 2017 08:21:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,373,1498546800"; d="scan'208";a="1003452709"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.134])
	by orsmga003.jf.intel.com with ESMTP; 14 Aug 2017 08:21:28 -0700
Message-ID: <1502724614.28941.8.camel@linux.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Aug 2017 10:30:14 -0500
In-Reply-To: <20170811223123.2381.83800@do.openembedded.org>
References: <1502489889-13867-1-git-send-email-hello@oleksandr-kravchuk.com>
	<20170811223123.2381.83800@do.openembedded.org>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIGN1cmw6IHVwZ3JhZGV0byA3LjU0LjA=?=
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
X-List-Received-Date: Mon, 14 Aug 2017 15:21:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2017-08-11 at 22:31 +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: curl: upgradeto 7.54.0
> Revision: 1
> URL   : https://patchwork.openembedded.org/series/8196/
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
>   Targeted branch  master (currently at df7f5221a5)

current curl version is 7.54.1 so what you are trying to do is not an
upgrade.

> 
> * Patch            [meta-oe] curl: upgradeto 7.54.0
>  Issue             Series sent to the wrong mailing list [test_target_mailing_list] 
>   Suggested fix    Check the project's README (meta-oe) and send the patch to the indicated list
> 

This message is a bit misleading so let me explain what went wrong:
patchest looks in the commit shortlog for meta-* strings and if matched
it suggests to look into the proper README. But in this case, there is
no need to include the meta-oe tag because patch is targeted to oe-core.

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



