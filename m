Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6DCE174BF4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jun 2018 02:25:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w542PD34000133
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 3 Jun 2018 19:25:13 -0700 (PDT)
Received: from localhost.corp.ad.wrs.com (128.224.162.139) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Sun, 3 Jun 2018 19:25:12 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1527670923.git.liezhi.yang@windriver.com>
	<57ffc9737ad9e03150d3c5152871b7e163042358.1527670923.git.liezhi.yang@windriver.com>
	<60162dc4c3584cafc44abe0042e2be4502018ad9.camel@linuxfoundation.org>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <2dd3da1b-879e-85d1-68b8-0b7e14ac41ca@windriver.com>
Date: Mon, 4 Jun 2018 10:28:10 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <60162dc4c3584cafc44abe0042e2be4502018ad9.camel@linuxfoundation.org>
Subject: Re: [PATCH 03/16] lsof: fix LSOF_CCV in version.h
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
X-List-Received-Date: Mon, 04 Jun 2018 02:25:13 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 06/03/2018 11:52 PM, Richard Purdie wrote:
> On Wed, 2018-05-30 at 17:03 +0800, Robert Yang wrote:
>> From: Jian Liu <jian.liu@windriver.com>
>>
>> When using cross compiler to build the package "lsof" on a host,
>> the value of LSOF_CCV in version.h genegrated by the Makefile
>> is the version of the compiler on the host while it should be
>> the version of cross compiler.
>>
>> On Ubuntu host before fixed:
>>    #define LSOF_CCV        "4.6.3 (Ubuntu/Linaro 4.6.3-1ubuntu5) "
>>
>> After fixed:
>>    #define   LSOF_CCV        "4.9.1 (GCC) "
> 
> The above is good info but its not included in the patch header which
> this patch adds. Could you add it there please so that we can
> understand what the patch does and why in the future without having to
> trawl git history please.

Thanks, updated.

// Robert

> 
> Cheers,
> 
> Richard
> 
> 

