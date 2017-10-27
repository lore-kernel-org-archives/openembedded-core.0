Return-Path: <daniela.plascencia@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 1DC526012A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Oct 2017 15:51:12 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Oct 2017 08:51:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,304,1505804400"; d="scan'208";a="328592011"
Received: from dplascen-mobl2.zpn.intel.com (HELO [10.219.128.121])
	([10.219.128.121])
	by fmsmga004.fm.intel.com with ESMTP; 27 Oct 2017 08:51:14 -0700
To: openembedded-core@lists.openembedded.org,
	Markus Lehtonen <markus.lehtonen@linux.intel.com>
References: <cover.1509094533.git.markus.lehtonen@linux.intel.com>
	<20171027103436.2784.58779@do.openembedded.org>
From: Daniela Plascencia <daniela.plascencia@linux.intel.com>
Message-ID: <9278e1eb-094a-6224-48d1-c1e92554a042@linux.intel.com>
Date: Fri, 27 Oct 2017 10:55:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20171027103436.2784.58779@do.openembedded.org>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIHN1cHBvcnQgcHJvZmlsZS1vcHRpbWl6ZWQgYnVpbGQgZm9yIFB5dGhvbg==?=
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
X-List-Received-Date: Fri, 27 Oct 2017 15:51:13 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Please, ignore the patchtest failure message. This is a bad check and 
the issue is being tracked.


On 10/27/2017 05:34 AM, Patchwork wrote:
> == Series Details ==
>
> Series: support profile-optimized build for Python
> Revision: 1
> URL   : https://patchwork.openembedded.org/series/9511/
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
> * Issue             LIC_FILES_CHKSUM changed on target python3-profile-opt but there was no explanation as to why in the commit message [test_lic_files_chksum_modified_not_mentioned]
>    Suggested fix    Provide a reason for LIC_FILES_CHKSUM change in commit message
>    Current checksum
>    New checksum     file://LICENSE;md5=b680ed99aa60d350c65a65914494207e
>
> * Issue             LIC_FILES_CHKSUM is missing in newly added recipe [test_lic_files_chksum_presence]
>    Suggested fix    Specify the variable LIC_FILES_CHKSUM in python-pgo-image
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


