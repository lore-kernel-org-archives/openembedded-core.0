Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id CB2D9618E6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2020 04:28:36 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id g6so728479plt.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2020 20:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=31lxQtagH1S9Hk+hIqcYyGesRYpXJgzADIZ8LkemCgA=;
	b=c2LjH/WgPyYtua5b1pRjycDcAShfiyuxPYVRR82ibSPe4D/wgnGU7nF1odOMHJFxCl
	bpaIdusmfva4/pFRu2/68ZIglmQ+7W/2GUHlJwo62pG6A7a7fTb3hB5G8zv8myGdVjdA
	IqNEuFMbyizmCTPUYAw0KcjRFfoAPUJyaeMisTrZW0El+R+Cx4aEp2kzH88Nh8OD2q1h
	Fc2aBOodl3LQ4G/dlMByZoEJRDVetKceBkxEf1GnhIO+jov4NqgRTEPTkB6Sko0O4fgs
	eN3/IPwvhcHfOZVO5BzBWgUgyxSEiShl3FYsojm0RxSXUWCifFUSb5WOsLGNf91JNwgZ
	SoIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=31lxQtagH1S9Hk+hIqcYyGesRYpXJgzADIZ8LkemCgA=;
	b=ppB2iVWqSY+YCpbBigQj8pNgxqFo7aRiB5aTBZvz0tL+Tj85MWgmNVOkHZIXqm4D83
	gj6Wfe7Y7za5FOiZcqugg8mUoib9QzS/3u8aNmGchZS2K9LoDTZnoqt9hFteobClfmrr
	4e5aLA1JiBGd6rwN3w/aSgMQWUgwiebqTXgUwfadsPaibbmBRWhga9ibzspAHuzclkJp
	gecR4M/ysAlFlm1bVKFSmsHhMfdi51k9PeehCViwRS/V53JeQ+m5xGbM32HDOgTTcks3
	SACYZXAJrGb4wF2d7Q3ehz1fT8320dbvVqqDf0mPFTdbXIuOi5UXQB6Xm1MBN1nyW2VB
	Wm7A==
X-Gm-Message-State: APjAAAXn8HvvsDS50zFZZrV/NZoxA6KTIit63VcV6wrWIiHxMDfn361A
	Bp7Alam9sf1NTG40L5bsWS8A/OdT9BU=
X-Google-Smtp-Source: APXvYqx4GQgD/jI52UlHjk4jXmxfUVmCoo4UIq1QRE4W2GNZOb7eEjpIU/OKFPC/6hcmx68l0BShsw==
X-Received: by 2002:a17:90a:fb41:: with SMTP id
	iq1mr2606852pjb.89.1582864117109; 
	Thu, 27 Feb 2020 20:28:37 -0800 (PST)
Received: from ?IPv6:2601:646:9200:4e0:98ae:deb2:aaad:7898?
	([2601:646:9200:4e0:98ae:deb2:aaad:7898])
	by smtp.gmail.com with ESMTPSA id
	f13sm9468956pfk.64.2020.02.27.20.28.36
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 27 Feb 2020 20:28:36 -0800 (PST)
To: Anuj Mittal <anuj.mittal@intel.com>,
	Tim Orling <timothy.t.orling@linux.intel.com>,
	openembedded-core@lists.openembedded.org
References: <20200227000603.14252-1-timothy.t.orling@linux.intel.com>
	<20200227000603.14252-4-timothy.t.orling@linux.intel.com>
	<2c3ea5cc-29e6-0ce6-f9b3-c720e835e363@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <7956231e-1523-6213-b757-633b75eb2eb2@gmail.com>
Date: Thu, 27 Feb 2020 20:28:35 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <2c3ea5cc-29e6-0ce6-f9b3-c720e835e363@intel.com>
Subject: Re: [PATCH 3/4] at-spi2-atk: upgrade 2.32.0 -> 2.34.1
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
X-List-Received-Date: Fri, 28 Feb 2020 04:28:36 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 2/27/20 7:54 PM, Anuj Mittal wrote:
> Hi Tim,
> 
> On 27-Feb-20 08:06 AM, Tim Orling wrote:
>> Release notes:
>> https://gitlab.gnome.org/GNOME/at-spi2-atk/-/raw/043b793de2161a0548835424f4d087ac90d1172d/NEWS 
>>
>>
>> License-Update: Changed to LGPL-2.1+
>>
>> Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
>> ---
>>   .../atk/{at-spi2-atk_2.32.0.bb => at-spi2-atk_2.34.1.bb}  | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>   rename meta/recipes-support/atk/{at-spi2-atk_2.32.0.bb => 
>> at-spi2-atk_2.34.1.bb} (66%)
> 
> This is failing on musl-qemu86:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/1623
> 
> ../at-spi2-atk-2.34.1/tests/atk_test_util.c:75:10: error: unknown field 
> ‘tv_sec’ specified in initializer
> ../at-spi2-atk-2.34.1/tests/atk_test_util.c:75:10: warning: excess 
> elements in struct initializer [enabled by default]
> ../at-spi2-atk-2.34.1/tests/atk_test_util.c:75:10: warning: (near 
> initialization for ‘timeout’) [enabled by default]
> ../at-spi2-atk-2.34.1/tests/atk_test_util.c:75:10: error: unknown field 
> ‘tv_nsec’ specified in initializer
> ../at-spi2-atk-2.34.1/tests/atk_test_util.c:75:10: warning: excess 
> elements in struct initializer [enabled by default]
> ../at-spi2-atk-2.34.1/tests/atk_test_util.c:75:10: warning: (near 
> initialization for ‘timeout’) [enabled by default]
> ../at-spi2-atk-2.34.1/tests/atk_test_util.c:75:19: error: storage size 
> of ‘timeout’ isn’t known
>     struct timespec timeout = { .tv_sec = 0, .tv_nsec = 10 * 1000000 };
>                     ^
> ../at-spi2-atk-2.34.1/tests/atk_test_util.c:90:5: warning: implicit 
> declaration of function ‘nanosleep’ [-Wimplicit-function-declaration]
>       nanosleep(&timeout, NULL);
>       ^
> ../at-spi2-atk-2.34.1/tests/atk_test_util.c: In function ‘terminate_app’:
> ../at-spi2-atk-2.34.1/tests/atk_test_util.c:108:10: error: variable 
> ‘timeout’ has initializer but incomplete type
>     struct timespec timeout = { .tv_sec = 0, .tv_nsec = 10 * 1000000 };
>            ^
> ../at-spi2-atk-2.34.1/tests/atk_test_util.c:108:10: error: unknown field 
> ‘tv_sec’ specified in initializer
> ../at-spi2-atk-2.34.1/tests/atk_test_util.c:108:10: warning: excess 
> elements in struct initializer [enabled by default]
> ../at-spi2-atk-2.34.1/tests/atk_test_util.c:108:10: warning: (near 
> initialization for ‘timeout’) [enabled by default]
> ../at-spi2-atk-2.34.1/tests/atk_test_util.c:108:10: error: unknown field 
> ‘tv_nsec’ specified in initializer
> ../at-spi2-atk-2.34.1/tests/atk_test_util.c:108:10: warning: excess 
> elements in struct initializer [enabled by default]
> ../at-spi2-atk-2.34.1/tests/atk_test_util.c:108:10: warning: (near 
> initialization for ‘timeout’) [enabled by default]
> ../at-spi2-atk-2.34.1/tests/atk_test_util.c:108:19: error: storage size 
> of ‘timeout’ isn’t known
>     struct timespec timeout = { .tv_sec = 0, .tv_nsec = 10 * 1000000 };
> 

yeah this is exposing a bug in use if time_t struct in this component. 
there are several patches done to address that, we will perhaps need one 
of these patches here.


