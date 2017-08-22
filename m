Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id C8B1978273
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Aug 2017 18:04:12 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Aug 2017 11:04:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,413,1498546800"; d="scan'208";a="1187005349"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 22 Aug 2017 11:04:12 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Trevor Woerner <twoerner@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <CAHUNapTr=oOvVTHvwxGJ2uPZB7Kbs4rBh9U8ZGzdNd0HuHi=1g@mail.gmail.com>
	<1503423645.32591.120.camel@linuxfoundation.org>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <96bce0e3-a699-4993-3748-a0fc19684ffa@linux.intel.com>
Date: Tue, 22 Aug 2017 21:01:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1503423645.32591.120.camel@linuxfoundation.org>
Cc: Alexander Kanavin <alexander.kanavin@intel.com>
Subject: Re: long (never ending?) do_install for adwaita-icon-theme
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
X-List-Received-Date: Tue, 22 Aug 2017 18:04:12 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08/22/2017 08:40 PM, Richard Purdie wrote:
>> Is anyone else seeing insanely long (never ending?) do_install times
>> for adwaita-icon-theme? The other day I manually killed a jenkins
>> jobs
>> still running after 3 days waiting for this recipe's do_install.
>>
>> This morning I started a job manually and it's currently stuck in
>>
>>      0: adwaita-icon-theme-3.24.0-r0 do_install - 9241s (pid 25320)
>>
>> I'm pretty sure it's not going to end without manual intervention.
>>
>> These aren't the first/only times I've seen this issue, they're just
>> the most recent. It doesn't happen often, but enough to be
>> noticeable.
> 
> I suspect it may be http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=231c9fe94d5b65bea345ffe9eb5e68b0db11cb07.
> 
> I've cc'd Alex, Ross and I have seen this very occasionally too.

Do you have any kind of logs for when it happens?

Alex

