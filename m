Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 3726760291
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Oct 2017 08:52:36 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Oct 2017 01:52:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,319,1505804400"; d="scan'208";a="169431359"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga006.fm.intel.com with ESMTP; 30 Oct 2017 01:52:36 -0700
To: akuster808 <akuster808@gmail.com>, Philip Balister <philip@balister.org>, 
	Fan Xin <fan.xin@jp.fujitsu.com>, openembedded-core@lists.openembedded.org,
	Michael Halstead <michael@yoctoproject.org>
References: <1509069613-5005-1-git-send-email-fan.xin@jp.fujitsu.com>
	<59d43cd3-d34e-ac77-5016-34d1dd3f35f5@balister.org>
	<c4abcba1-5cee-7437-bae3-daf0500e7e1e@gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <b2c6368d-420d-aa51-b824-36637cfbbd1e@linux.intel.com>
Date: Mon, 30 Oct 2017 10:52:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <c4abcba1-5cee-7437-bae3-daf0500e7e1e@gmail.com>
Subject: Re: [PATCH] curl: update to 7.56.1
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
X-List-Received-Date: Mon, 30 Oct 2017 08:52:37 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10/29/2017 05:28 PM, akuster808 wrote:
>>> 2. Delete the following patchs which have been applied in curl 7.56.1
>>> 	CVE-2017-1000099.patch
>>> 	CVE-2017-1000100.patch
>>> 	CVE-2017-1000101.patch
>>> 3. Delete the do_install_append() due to the curl/curlbuild.h have been removed.
>> Can you also update the commit message to show the CVE entries in a
>> standard format? We are trying to collect commits that resolve CVE's on
>> the yocto-security list.
>>
>> https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Example:_CVE_patch_header
> How does that work on patches that go removed?
> 
>> For this mentioning the CVE without the .patch might help. cc'ing
>> Michael in case he his suggesting to help the hook.
> What is the point of indicating CVE's being removed?

Indeed; I actually misunderstood the above request, and thought it's for 
newly fixed CVEs. But referencing CVEs that were already fixed before 
the commit, and remain fixed after the commit serves no purpose.

Alex

