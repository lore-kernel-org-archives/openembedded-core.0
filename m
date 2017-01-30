Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 17138731DB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2017 14:59:47 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga103.jf.intel.com with ESMTP; 30 Jan 2017 06:59:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,311,1477983600"; d="scan'208";a="59805984"
Received: from lsandov1-mobl2.zpn.intel.com (HELO [10.219.128.141])
	([10.219.128.141])
	by fmsmga006.fm.intel.com with ESMTP; 30 Jan 2017 06:59:47 -0800
To: openembedded-core@lists.openembedded.org
References: <cover.1485505680.git.anders@chargestorm.se>
	<20170127092329.4462.45493@do.openembedded.org>
	<20170127094032.zpdy3uaohktwcgqk@ad.chargestorm.se>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Message-ID: <04ba7ca8-b4ad-9ccb-656d-654da5c710b4@linux.intel.com>
Date: Mon, 30 Jan 2017 09:06:56 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <20170127094032.zpdy3uaohktwcgqk@ad.chargestorm.se>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIFB5dGhvbjMgcGFja2FnaW5nIGZpeGVz?=
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
X-List-Received-Date: Mon, 30 Jan 2017 14:59:49 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 01/27/2017 03:40 AM, Anders Darander wrote:
> Hi,
>
> * Patchwork <patchwork@patchwork.openembedded.org> [170127 10:23]:
>
>> Series: Python3 packaging fixes
>> Revision: 1
>> URL   : https://patchwork.openembedded.org/series/5024/
>> State : failure
>> * Issue             Series does not apply on top of target branch [test_series_merge_on_head]
>>    Suggested fix    Rebase your series on top of targeted branch
>>    Targeted branch  master (currently at a99cca0e8e)
> This is likely due to issues with the email-patches. One of the patches,
> 0003, has a line > 998 characters (one line in the patch context, ie not
> modified by me).

Anders, I do not think the problem is the patch format because git-am 
does not complain at this stage. This is what I am getting when either 
git-am or git-apply

git pw mbox 5024 | git am
Applying: python-3-manifest: fix adding imp to importlib
Applying: python3-manifest: move htlm.py to python3-html
Applying: python-3-manifest: add argparse to RDEPENDS for netclient
error: patch failed: 
meta/recipes-devtools/python/python-3.5-manifest.inc:154
error: meta/recipes-devtools/python/python-3.5-manifest.inc: patch does 
not apply
Patch failed at 0003 python-3-manifest: add argparse to RDEPENDS for 
netclient
The copy of the patch that failed is found in:
    /home/lsandov1/repos/openembedded-core/.git/rebase-apply/patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".
lsandov1@lsandov1-mobl2:~/repos/openembedded-core$ git am --abort

lsandov1@lsandov1-mobl2:~/repos/openembedded-core$ git pw mbox 5024 | 
git apply --check
error: patch failed: 
meta/recipes-devtools/python/python-3.5-manifest.inc:154
error: meta/recipes-devtools/python/python-3.5-manifest.inc: patch does 
not apply
error: patch failed: 
meta/recipes-devtools/python/python-3.5-manifest.inc:119
error: meta/recipes-devtools/python/python-3.5-manifest.inc: patch does 
not apply

Meaning that you may need to fix merge failures for the manifest.inc file.

In the other hand, bad formatted patches have their own (patch) test, 
and the report does not include it.


> Retrieving the patch series from the branch at github should work, as
> it's based on the current master, a99cca0e8e.
>
> Cheers,
> Anders
>


