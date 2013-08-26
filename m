Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 07C3760990
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Aug 2013 23:04:34 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 26 Aug 2013 16:04:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,962,1367996400"; d="scan'208";a="351938410"
Received: from unknown (HELO [10.255.14.139]) ([10.255.14.139])
	by azsmga001.ch.intel.com with ESMTP; 26 Aug 2013 16:04:34 -0700
Message-ID: <521BDF02.8010006@linux.intel.com>
Date: Mon, 26 Aug 2013 16:04:34 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130805 Thunderbird/17.0.8
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1377145501.git.raj.khem@gmail.com>
	<39306cf37bfb1b6ccf99c049498d6b4cf6c60976.1377145501.git.raj.khem@gmail.com>
	<5216888A.6050200@linux.intel.com>
	<DBCC9871-A9D3-438D-95B2-7F6797313633@gmail.com>
	<5217C7FA.7090703@linux.intel.com>
	<F8679751-F1B9-4AAD-A1EB-BDD909C90B3F@gmail.com>
	<7ED625B0-786B-4BCE-A043-D53C9A6F0162@gmail.com>
In-Reply-To: <7ED625B0-786B-4BCE-A043-D53C9A6F0162@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] kmod: Upgrade to version 14
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
X-List-Received-Date: Mon, 26 Aug 2013 23:04:36 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/26/2013 03:45 PM, Khem Raj wrote:
>
> On Aug 26, 2013, at 2:22 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
>>> Machine are CentOS 6.4, Debian 6.0.7, but it worked on my F19 and Ubuntu 12.04 machines!
>>
>>
>> I do not have access to Centos or debian to be able to reproduce this. If anyone has it please help in debugging it further. will try to offline try to poke around and see if I can get at something.
>>
>
> The reason I think is that _Static_assert is too new a feature for gcc shipped with these distros, it was introduced
> in c11 standards. So I have created a patch to define an equivalent for kmod-native and update the pull tree. However
> I have no way to test it out quickly. I have made sure that it does not break the build on Ubuntu 12.04+ give it a
> shot and let me know how it goes.
>

Yup, I have that capability and was actually working on a similar patch, 
you just beat me to it.


Probably need a little bit more of a commit message about removing the 
older patch due it's being a config option and adding the Static_assert 
work around.

Please update and resend the series.

Tested-by: Saul Wold <sgw@linux.intel.com>

Thanks
	Sau!


