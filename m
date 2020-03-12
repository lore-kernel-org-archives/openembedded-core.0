Return-Path: <jpuhlman@mvista.com>
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
	[209.85.167.195])
	by mail.openembedded.org (Postfix) with ESMTP id 7C68B61C57
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2020 14:36:45 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id y71so5663094oia.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2020 07:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=Ysv+OxWj2j+IlwWbrATip/W5wMHqZZvrCa15t9/9TKI=;
	b=Jlw2AzfvvkIgYXrAjLkl58Xkf2FuPBROMRjNwqjQNrDgtGCwvnvWiGOrHJBZppRqxK
	cBQadO8NQH/4bcEhnaEq43e0yC5CF3muHHlAzmH1MGFwBv/HV+Uzlv4fOUzybQWek1vC
	17TO0SA+tSh4gsZv6PV/6tWh3hLkRJ8YUkuh+VM4vhHH24w6qdQA5sdoAeVpVoD3+WPC
	Y6VgOc0i3geVZU6MVvf6p9FAFJLkySksUqnDTeEAfkkseaC8e4UEMPDvLWDdwOhQ0+hj
	ygQPJJliAxUYELjGmvU2Gnr3kjKXhLm1DM5GOZrzzzmwzRRUSMs3tDt8aEnbRxqIjPAb
	yn9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=Ysv+OxWj2j+IlwWbrATip/W5wMHqZZvrCa15t9/9TKI=;
	b=LgIeyxyax8zgMbSuG5k+B0pCwqNtzIyYjZuUeCP4de10M/AlU+px5NnhV1MBe31+io
	9SOxJIIW/2g8Nh5S/DL2liCvGHRcaGZdHUBhK5CQ96mytjzswUq7BcDMIMYErGyIMvKU
	axHwD+ouGlhI98TzgswOogNpV4XeqnYqS981XpEE70uGYQljTI3ogw6td8EVAJM3WVPM
	mOvxn15m93IOSfXH2HcNKhDb6qTnsOYcfX+FDWfhqbHLjKBaxqXjvn3iTPtX8ihv/hQ9
	D/NFuZgkGvr53CHnxmwM+2+nkC35N82wPtt+bVKHY+lwMcjAPn13jF5tOgHtV4LB+vw1
	heLw==
X-Gm-Message-State: ANhLgQ3vAnVFQvu6o4nx2nEAU9fUGQpaO0JpJ7uyK2a4voy/h+Gk1YPJ
	+IKfyEJWR2GsppGF2n+TSAsreSysA9I=
X-Google-Smtp-Source: ADFU+vuKwCxYAoVrUP/VNsEd8Q3VFFepWFYkFJbGouNXptznqO4kU9kUhg1MZgcV7raLbdRreQJVqw==
X-Received: by 2002:aca:3544:: with SMTP id c65mr2696589oia.160.1584023806143; 
	Thu, 12 Mar 2020 07:36:46 -0700 (PDT)
Received: from ?IPv6:2600:1700:4c90:60a0:5566:b07f:3f47:4a0e?
	([2600:1700:4c90:60a0:5566:b07f:3f47:4a0e])
	by smtp.gmail.com with ESMTPSA id
	n8sm18332694otl.11.2020.03.12.07.36.45
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 12 Mar 2020 07:36:45 -0700 (PDT)
To: Jonathan Rajotte-Julien <jonathan.rajotte-julien@efficios.com>
References: <20200311222249.29880-1-jpuhlman@mvista.com>
	<20200312142524.GB30953@joraj-alpa>
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
Message-ID: <8c0b99cd-8a2e-c4f0-8be1-a91b0fbf9699@mvista.com>
Date: Thu, 12 Mar 2020 07:36:42 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200312142524.GB30953@joraj-alpa>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] babletrace2: make manpages multilib identical
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
X-List-Received-Date: Thu, 12 Mar 2020 14:36:46 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Maybe. They may want it to be altered depending on their preference for 
how to express the system libdir. I have
pushed similar to other projects and gotten a mixed bag of responses.

I haven't tried to push it yet, but its in my queue.

On 3/12/2020 7:25 AM, Jonathan Rajotte-Julien wrote:
> Hi
>
> Is this something upstream (lttng-dev mailing list) should be interested in?
>
> Cheers
>
> On Wed, Mar 11, 2020 at 03:22:48PM -0700, Jeremy A. Puhlman wrote:
>> From: Jeremy Puhlman <jpuhlman@mvista.com>
>>
>> Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
>> ---
>>   .../0001-Make-manpages-multilib-identical.patch    | 28 ++++++++++++++++++++++
>>   meta/recipes-kernel/lttng/babeltrace2_2.0.1.bb     |  1 +
>>   2 files changed, 29 insertions(+)
>>   create mode 100644 meta/recipes-kernel/lttng/babeltrace2/0001-Make-manpages-multilib-identical.patch
>>
>> diff --git a/meta/recipes-kernel/lttng/babeltrace2/0001-Make-manpages-multilib-identical.patch b/meta/recipes-kernel/lttng/babeltrace2/0001-Make-manpages-multilib-identical.patch
>> new file mode 100644
>> index 0000000000..2401b176e6
>> --- /dev/null
>> +++ b/meta/recipes-kernel/lttng/babeltrace2/0001-Make-manpages-multilib-identical.patch
>> @@ -0,0 +1,28 @@
>> +From 56986190e4b0c10945ce6aaa7ca10d6bd8a26a39 Mon Sep 17 00:00:00 2001
>> +From: Jeremy Puhlman <jpuhlman@mvista.com>
>> +Date: Mon, 9 Mar 2020 21:10:35 +0000
>> +Subject: [PATCH] Make manpages multilib identical
>> +
>> +Upstream-Status: Pending
>> +Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
>> +---
>> + doc/man/asciidoc-attrs.conf.in | 4 ++--
>> + 1 file changed, 2 insertions(+), 2 deletions(-)
>> +
>> +diff --git a/doc/man/asciidoc-attrs.conf.in b/doc/man/asciidoc-attrs.conf.in
>> +index ad1183f1..e11c7031 100644
>> +--- a/doc/man/asciidoc-attrs.conf.in
>> ++++ b/doc/man/asciidoc-attrs.conf.in
>> +@@ -1,7 +1,7 @@
>> + [attributes]
>> + # default values
>> +-system_plugin_path="@LIBDIR@/babeltrace2/plugins"
>> +-system_plugin_provider_path="@LIBDIR@/babeltrace2/plugin-providers"
>> ++system_plugin_path="@prefix@/lib*/babeltrace2/plugins"
>> ++system_plugin_provider_path="@prefix@/lib*/babeltrace2/plugin-providers"
>> + babeltrace_version="@PACKAGE_VERSION@"
>> + enable_debug_info="@ENABLE_DEBUG_INFO_VAL@"
>> + defrdport=5344
>> +--
>> +2.24.1
>> +
>> diff --git a/meta/recipes-kernel/lttng/babeltrace2_2.0.1.bb b/meta/recipes-kernel/lttng/babeltrace2_2.0.1.bb
>> index 16953d6807..61bc7f5e6b 100644
>> --- a/meta/recipes-kernel/lttng/babeltrace2_2.0.1.bb
>> +++ b/meta/recipes-kernel/lttng/babeltrace2_2.0.1.bb
>> @@ -10,6 +10,7 @@ DEPENDS = "glib-2.0 util-linux popt bison-native flex-native"
>>   SRC_URI = "git://git.linuxfoundation.org/diamon/babeltrace.git;branch=stable-2.0 \
>>   	   file://run-ptest \
>>   	   file://0001-tests-do-not-run-test-applications-from-.libs.patch \
>> +           file://0001-Make-manpages-multilib-identical.patch \
>>   	  "
>>   SRCREV = "06df58f89ee51b1a2c6a2c187ec3f15691633910"
>>   UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>2(\.\d+)+)$"
>> -- 
>> 2.13.3
>>
>> -- 
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

-- 
Jeremy A. Puhlman
jpuhlman@mvista.com


