Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 355B1784B2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Aug 2017 18:44:54 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Aug 2017 11:44:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,393,1498546800"; d="scan'208";a="1184367435"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 18 Aug 2017 11:44:54 -0700
To: Mark Hatle <mark.hatle@windriver.com>,
	Martin Jansa <martin.jansa@gmail.com>, Khem Raj <raj.khem@gmail.com>
References: <CA+chaQc_oKOja+s54Ku-sCQqxdrqi8d16Dkj2=dJHofYnOR1xA@mail.gmail.com>
	<1502969638.13978.209.camel@linuxfoundation.org>
	<CA+chaQcZKA=x1_O88h=Akjh=Cr2Rtt_8GqgRrm61fuLnT_myRw@mail.gmail.com>
	<d2851cd0-1a15-f5aa-1e9b-dda654978178@linux.intel.com>
	<CAMKF1sryybJQXYvkQVbSEciBhYY1s7Xc-k+qhFJSRbbRxi1DJQ@mail.gmail.com>
	<fe1575c3-4e74-1a5d-b48e-86c6908b2e63@linux.intel.com>
	<CAMKF1soQw0VVy0RKe4w-qsCwPh_OTgatYLrx6mPpapBGooy-Ew@mail.gmail.com>
	<CA+chaQcQNkYbnSpVzA5xceo=CTpWDnKd8n3WaZM6zbUOe5m_XA@mail.gmail.com>
	<de4a91fe-0dc0-208e-1b2e-3e0e897fdd12@windriver.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <3082288d-055f-50a4-c81e-6483d324d706@linux.intel.com>
Date: Fri, 18 Aug 2017 21:41:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <de4a91fe-0dc0-208e-1b2e-3e0e897fdd12@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: openssl10 unusable for many components
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
X-List-Received-Date: Fri, 18 Aug 2017 18:44:55 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08/18/2017 08:56 PM, Mark Hatle wrote:
>> Even with that patch to rename openssl10 back to openssl we still need to solve
>> the openssl-native which wasn't reverted back to 1.0.
>>
>> Upstream nodejs isn't going to be openssl-1.1 for a bit longer as explained:
>> https://github.com/nodejs/node/pull/14761
> 
> I wanted to pull out a specific comment from the above link that shows one of
> the reasons why OpenSSL 1.1 support is delayed by many:
> 
> 7 days ago: shigeki commented:
>> We're also waiting for FIPS support of 1.1.x. They are now working on it as https://www.openssl.org/blog/blog/2017/07/25/fips/.> ...
> 
> Until the OpenSSL 1.1.x FIPS work is further along, a lot of projects (and major
> distributions) are going to wait to deploy it.

What I don't understand is why node even cares about FIPS? FIPS 
compliance is needed to win software supplier contracts with one certain 
government; I haven't seen any other reasons.

Another point is that getting FIPS done will take a very long time, 
possibly two years or more, and this work is just starting now with no 
clear funding or completion date (see the openssl blog link). Meanwhile, 
all major desktop linux distros have 1.1 by default already; seems to me 
that they don't care.

Alex

