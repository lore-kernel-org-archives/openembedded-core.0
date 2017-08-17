Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2004F782B4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Aug 2017 19:15:23 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Aug 2017 12:15:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,389,1498546800"; d="scan'208";a="1206908656"
Received: from lbandamx-mobl.amr.corp.intel.com (HELO [10.252.248.59])
	([10.252.248.59])
	by fmsmga002.fm.intel.com with ESMTP; 17 Aug 2017 12:15:24 -0700
To: openembedded-core@lists.openembedded.org
References: <cover.1502989095.git.alejandro.hernandez@linux.intel.com>
	<20170817173502.2382.32182@do.openembedded.org>
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Message-ID: <d4cf8e9e-d991-7548-04c3-d19bd583b281@linux.intel.com>
Date: Thu, 17 Aug 2017 14:15:23 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.0
MIME-Version: 1.0
In-Reply-To: <20170817173502.2382.32182@do.openembedded.org>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIFJlc3RydWN0dXJlIHB5dGhvbjIgYW5kIHB5dGhvbjMgcGFja2FnaW5nIHN5c3RlbQ==?=
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
X-List-Received-Date: Thu, 17 Aug 2017 19:15:24 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

The failure is expected, since this patch modifies(removes) the python 
manifest,

and one of the things that I wanted to fix was exactly this, that 
submitting a patch to

the manifest shouldnt cause an issue, after this patch is applied this 
will no longer happen.


As for the series not applying, the patch does apply, the contrib branch 
hsalejandro/python_autopack_final

is baes on the latest master.


Regards,


Alejandro



On 08/17/2017 12:35 PM, Patchwork wrote:
> == Series Details ==
>
> Series: Restructure python2 and python3 packaging system
> Revision: 1
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
>    Suggested fix    Create the series again using git-format-patch and ensure it can be applied using git am
>    Diff line         diff --git a/meta/recipes-devtools/python/python-native_2.7.13.bb b/meta/recipes-devtools/python/python-native_2.7.13.bb
>
>
> * Issue             Series does not apply on top of target branch [test_series_merge_on_head]
>    Suggested fix    Rebase your series on top of targeted branch
>    Targeted branch  master (currently at eca501aeb4)
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


