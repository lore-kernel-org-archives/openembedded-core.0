Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 3B97360119
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2016 14:38:34 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga105.fm.intel.com with ESMTP; 26 Sep 2016 07:38:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,400,1470726000"; d="scan'208";a="1056767439"
Received: from unknown (HELO [10.219.27.139]) ([10.219.27.139])
	by orsmga002.jf.intel.com with ESMTP; 26 Sep 2016 07:38:34 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	akuster808 <akuster808@gmail.com>, openembedded-core@lists.openembedded.org
References: <1474492215-39510-1-git-send-email-alejandro.hernandez@linux.intel.com>
	<a826406c-2bff-0e51-014c-81203e0ec06c@gmail.com>
	<1474641658.7207.371.camel@linuxfoundation.org>
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Message-ID: <d6ca61de-59d4-8efa-2d2a-bf17d0959818@linux.intel.com>
Date: Mon, 26 Sep 2016 09:38:36 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1474641658.7207.371.camel@linuxfoundation.org>
Cc: akuster@mvista.com
Subject: Re: [PATCH] [krogoth] Fixes several python3 dependencies
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
X-List-Received-Date: Mon, 26 Sep 2016 14:38:37 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Thanks Richard!


On 09/23/2016 09:40 AM, Richard Purdie wrote:
> On Thu, 2016-09-22 at 08:33 -0700, akuster808 wrote:
>> Alejandro,
>>
>>
>> On 09/21/2016 02:10 PM, Alejandro Hernandez wrote:
>>> This patch adds the packages python3-signal, python3-enum and
>>> python3-selectors,
>>> while it also fixes python3-subprocess, this fixes the installation
>>> of python3-modules
>> I can not get this to apply to my krogoth-next nor krogoth in Poky.
>> Can
>> you double check and let me know if I am doing something wrong or
>> need
>> any dependency changes?
>>
>> error pw is showing is:
>> fatal: patch fragment without header at line 29: @@ -89,6 +89,10 @@
>> SUMMARY_${PN}-email="Python email support"
> I've pulled this onto the branch since we have it as a high for krogoth
> (and merged the other queued krogoth patches, thanks!).
>
> Cheers,
>
> Richard
>
>


