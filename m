Return-Path: <anuj.mittal@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id F1EC8618B8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2020 23:42:51 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Feb 2020 15:42:52 -0800
X-IronPort-AV: E=Sophos;i="5.70,493,1574150400"; d="scan'208";a="232045458"
Received: from anmitta2-mobl.gar.corp.intel.com (HELO [10.255.173.208])
	([10.255.173.208])
	by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
	27 Feb 2020 15:42:50 -0800
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	bruce.ashfield@gmail.com
References: <20200224200202.61426-1-bruce.ashfield@gmail.com>
	<beec08fcb1f0b492dced91217f2fdd598228f87a.camel@linuxfoundation.org>
From: Anuj Mittal <anuj.mittal@intel.com>
Message-ID: <1a0c08fc-2643-2d32-86f2-77ed17ea05e9@intel.com>
Date: Fri, 28 Feb 2020 07:42:48 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <beec08fcb1f0b492dced91217f2fdd598228f87a.camel@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] linux-yocto/5.2: update to v5.2.32
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
X-List-Received-Date: Thu, 27 Feb 2020 23:42:53 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 26-Feb-20 12:47 PM, Richard Purdie wrote:
> On Mon, 2020-02-24 at 15:02 -0500, bruce.ashfield@gmail.com wrote:
>> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>>
>> Updating linux-yocto/5.2 to the latest korg -stable release that
>> comprises
>> the following commits:
> 
> This was included in testing on the autobuilder and we saw:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/60/builds/1612
> https://autobuilder.yoctoproject.org/typhoon/#/builders/102/builds/315
> https://autobuilder.yoctoproject.org/typhoon/#/builders/74/builds/1616
> 
> and I'm not sure if they're from this?
> 

I had picked this for zeus as well and didn't get this error on 
autobuilder. The builds failing above are building v5.4 by default. So 
it doesn't look like it's related.

I am not sure what could be causing this problem though ...

Thanks,

Anuj

