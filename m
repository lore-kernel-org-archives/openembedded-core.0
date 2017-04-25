Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id AD8EA7770D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Apr 2017 15:58:22 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	25 Apr 2017 08:58:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,250,1488873600"; d="scan'208";a="93632752"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.119])
	by fmsmga005.fm.intel.com with ESMTP; 25 Apr 2017 08:58:22 -0700
Message-ID: <1493136369.1798.26.camel@linux.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Apr 2017 11:06:09 -0500
In-Reply-To: <20170420010154.26296.84391@do.openembedded.org>
References: <1492649254-29363-1-git-send-email-armccurdy@gmail.com>
	<20170420010154.26296.84391@do.openembedded.org>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIGJ1c3lib3g6IGZpeCB0eXBvIGluIENWRS0yMDE2LTIxNDdfMi5wYXRjaCBVcHN0cmVhbS1TdGF0dXMgdGFn?=
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
X-List-Received-Date: Tue, 25 Apr 2017 15:58:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2017-04-20 at 01:01 +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: busybox: fix typo in CVE-2016-2147_2.patch Upstream-Status tag
> Revision: 1
> URL   : https://patchwork.openembedded.org/series/6429/
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
> * Patch            busybox: fix typo in CVE-2016-2147_2.patch Upstream-Status tag
>  Issue             Missing or incorrectly formatted CVE tag in commit message [test_cve_presence_in_commit_message] 
>   Suggested fix    Include a "CVE-xxxx-xxxx" tag in the commit message

Andre,

there is no need to send a second revision due to the above patchtest
issue. The system detected the CVE on shortlog thus triggering the check
on the commit message, but for this case there is no need. Will fix
this.

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



