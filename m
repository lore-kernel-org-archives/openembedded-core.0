Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id C35F0730BE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 16:01:06 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga103.fm.intel.com with ESMTP; 23 Jan 2017 08:01:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,274,1477983600"; d="scan'208";a="56249728"
Received: from lsandov1-mobl2.zpn.intel.com (HELO [10.219.128.142])
	([10.219.128.142])
	by orsmga005.jf.intel.com with ESMTP; 23 Jan 2017 08:01:05 -0800
To: David Vincent <freesilicon@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <20170123145508.9252-1-freesilicon@gmail.com>
	<20170123152336.23276.57694@do.openembedded.org>
	<4532053.H3eoubo94G@crde-port-20.cahors.local>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Message-ID: <7663fdf5-3dce-1147-e3f5-5460986d72c2@linux.intel.com>
Date: Mon, 23 Jan 2017 10:08:04 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <4532053.H3eoubo94G@crde-port-20.cahors.local>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIG9wZW5zc2g6IE1ha2Ugc3NoZC1jb25maWcgYSBwYWNrYWdl?=
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
X-List-Received-Date: Mon, 23 Jan 2017 16:01:06 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

David, This is what I get from the command line

oe-core$ git pw mbox 4904 | git apply --check
error: documentation/ref-manual/ref-variables.xml: No such file or directory

Meaning that you have a patch on your series that is targeted for the 
documentation folder, which is not part of the oe-core project. The 
latter need to be sent to:

documentation:
     Git repository: http://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/
     Mailing list: yocto@yoctoproject.org


On 01/23/2017 09:45 AM, David Vincent wrote:
> On lundi 23 janvier 2017 15:23:36 CET Patchwork wrote:
>> == Series Details ==
>>
>> Series: openssh: Make sshd-config a package
>> Revision: 1
>> URL   : https://patchwork.openembedded.org/series/4904/
>> State : failure
>>
>> == Summary ==
>>
>>
>> Thank you for submitting this patch series to OpenEmbedded Core. This is
>> an automated response. Several tests have been executed on the proposed
>> series by patchtest resulting in the following failures:
>>
>>
>>
>> * Issue             Series does not apply on top of target branch
>> [test_series_merge_on_head] Suggested fix    Rebase your series on top of
>> targeted branch
>>    Targeted branch  master (currently at 842ad404b3)
>>
>>
>>
>> If you believe any of these test results are incorrect, please reply to the
>> mailing list (openembedded-core@lists.openembedded.org) raising your
>> concerns. Otherwise we would appreciate you correcting the issues and
>> submitting a new version of the patchset if applicable. Please ensure you
>> add/increment the version number when sending the new version (i.e. [PATCH]
>> -> [PATCH v2] -> [PATCH v3] -> ...).
>>
>> ---
>> Test framework: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
>> Test suite:     http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe
> This result seems to be an error since I rebased my patches on top of current
> HEAD before submitting it. I just checked again to see if some other patches
> were left behind but my branch is currently up-to-date.
>
> David
>


