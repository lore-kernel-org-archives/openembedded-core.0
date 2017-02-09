Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 2321160765
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Feb 2017 21:34:30 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga104.jf.intel.com with ESMTP; 09 Feb 2017 13:34:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,137,1484035200"; d="scan'208";a="223433925"
Received: from lsandov1-mobl2.zpn.intel.com (HELO [10.219.128.141])
	([10.219.128.141])
	by fmsmga004.fm.intel.com with ESMTP; 09 Feb 2017 13:34:30 -0800
To: openembedded-core@lists.openembedded.org,
	Jussi Kukkonen <jussi.kukkonen@intel.com>
References: <cover.1486668313.git.jussi.kukkonen@intel.com>
	<20170209195950.9311.78142@do.openembedded.org>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Message-ID: <17a51da2-5095-2262-bc91-7eb472c557f8@linux.intel.com>
Date: Thu, 9 Feb 2017 15:41:54 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <20170209195950.9311.78142@do.openembedded.org>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIEZpeCBjdmUtY2hlY2sgKGZvciByZWNpcGUgc3lzcm9vdHMp?=
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
X-List-Received-Date: Thu, 09 Feb 2017 21:34:31 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

This is a false positive, your series is fine.

The presence of CVE tags on the commit message area must only be done if 
the CVE tag is present on the commit subject, not the whole payload.


On 02/09/2017 01:59 PM, Patchwork wrote:
> == Series Details ==
>
> Series: Fix cve-check (for recipe sysroots)
> Revision: 1
> URL   : https://patchwork.openembedded.org/series/5241/
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
> * Patch            [3/3] cve-check-tool: Use CA cert bundle in correct sysroot
>   Issue             Missing or incorrectly formatted CVE tag in commit message [test_cve_presence_in_commit_message]
>    Suggested fix    Include a "CVE-xxxx-xxxx" tag in the commit message
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


