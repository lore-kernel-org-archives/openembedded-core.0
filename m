Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 926E778276
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Nov 2017 06:30:29 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Nov 2017 22:30:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,467,1505804400"; d="scan'208";a="10412733"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 27 Nov 2017 22:30:29 -0800
To: Dan McGregor <danismostlikely@gmail.com>
References: <20171127183538.68275-1-danismostlikely@gmail.com>
	<b5ec6830-3185-054f-7354-d9caa66e692b@linux.intel.com>
	<CACS+7ZT=pyM3uD-LbBy437NT=nHAS7ONarmMp0E3TA-b40LFaQ@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <955afb0f-78b2-2de8-db0a-f301b62bc8ab@linux.intel.com>
Date: Tue, 28 Nov 2017 08:30:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <CACS+7ZT=pyM3uD-LbBy437NT=nHAS7ONarmMp0E3TA-b40LFaQ@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bind: fix python3 dependencies
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
X-List-Received-Date: Tue, 28 Nov 2017 06:30:29 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/27/2017 10:24 PM, Dan McGregor wrote:
>> 2) why is native python3 needed, and host python3 is not enough.
> 
> Host python3 gives me the error above. Possibly my host's python3 is
> broken, but it's a Poky build appliance with multilib enabled.
> 
> I'll make it more explicit in my commit message.

Note that bind is built by yocto autobuilder many times a day, in 
multiple configurations (including multilib). And no one else has 
reported the issue. It does seem to me that the patch is working around 
a problem that is somehow specific to your setup, and is not a common 
issue.

Can you dig a bit deeper and find out the root cause of the error 
message you are getting without this patch please? Try also with a plain 
poky checkout, and see if the issue disappears there.


Alex

