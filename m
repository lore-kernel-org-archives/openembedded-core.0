Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 3B16E60125
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Nov 2017 06:09:05 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Nov 2017 22:09:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,471,1505804400"; d="scan'208";a="10862921"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 28 Nov 2017 22:09:06 -0800
To: Dan McGregor <danismostlikely@gmail.com>
References: <20171127183538.68275-1-danismostlikely@gmail.com>
	<b5ec6830-3185-054f-7354-d9caa66e692b@linux.intel.com>
	<CACS+7ZT=pyM3uD-LbBy437NT=nHAS7ONarmMp0E3TA-b40LFaQ@mail.gmail.com>
	<955afb0f-78b2-2de8-db0a-f301b62bc8ab@linux.intel.com>
	<CACS+7ZRKCjqB7Hp39Wv5GCLEV_qZsA=kh-okjLaGty0s8Cr96g@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <b02650d0-d612-b8ae-a088-38a929474432@linux.intel.com>
Date: Wed, 29 Nov 2017 08:09:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <CACS+7ZRKCjqB7Hp39Wv5GCLEV_qZsA=kh-okjLaGty0s8Cr96g@mail.gmail.com>
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
X-List-Received-Date: Wed, 29 Nov 2017 06:09:06 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/28/2017 06:54 PM, Dan McGregor wrote:
>> Can you dig a bit deeper and find out the root cause of the error message
>> you are getting without this patch please? Try also with a plain poky
>> checkout, and see if the issue disappears there.
> 
> Yeah, as I said above python3 distutils seems to be broken when
> multilib is enabled. I'll fix that and send a patch later today or
> tomorrow.

Just wondering, do you have this fix in your setup?

http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=3d29214b20433a506a3d59cdc08fc1a9be09a5a0

Alex

