Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0B5BD607AC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 May 2018 02:17:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w4N2HMgb013816
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 May 2018 19:17:22 -0700 (PDT)
Received: from [128.224.162.173] (128.224.162.173) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Tue, 22 May 2018 19:17:22 -0700
To: Randy MacLeod <randy.macleod@windriver.com>,
	<openembedded-core@lists.openembedded.org>
References: <20180511062300.98691-1-mingli.yu@windriver.com>
	<c8207ee0-1df1-e31e-941a-f4a250e882a4@windriver.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <5B04CE83.2070505@windriver.com>
Date: Wed, 23 May 2018 10:14:27 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <c8207ee0-1df1-e31e-941a-f4a250e882a4@windriver.com>
X-Originating-IP: [128.224.162.173]
Subject: Re: [PATCH] boost: add contract lib
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
X-List-Received-Date: Wed, 23 May 2018 02:17:23 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2018年05月16日 12:37, Randy MacLeod wrote:
> On 2018-05-11 02:23 AM, mingli.yu@windriver.com wrote:
>> From: Mingli Yu <mingli.yu@windriver.com>
>>
>> Add the contract lib which implements contract
>> programming (a.k.a., Design by Contract or DbC) [1]
>> for the C++ programming language.
>
> Please clean up the long log.
> You should write something like:
>
>     Add the contract lib which implements contract programming
>     (a.k.a., Design by Contract) for the C++ programming language.
>
> I don't know what the [1] was about.
> Ah, it's a reference from this documentation:
>    https://www.boost.org/doc/libs/develop/libs/contract/doc/html/index.html
>
> For anyone reading, but not following links:
>
> [1] Design by Contract (DbC) is a registered trademark of the Eiffel
> Software company and it was first introduced by the Eiffel programming
> language (see [Meyer97]).

Good catch!
Thanks Randy! I will update the commit message altogether with some 
other changes next time as it has been already merged.

Thanks,

>
>
> ../Randy
>
>>
>> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>> ---
>>   meta/recipes-support/boost/boost.inc | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/recipes-support/boost/boost.inc
>> b/meta/recipes-support/boost/boost.inc
>> index b447897a0c..6984bee777 100644
>> --- a/meta/recipes-support/boost/boost.inc
>> +++ b/meta/recipes-support/boost/boost.inc
>> @@ -9,6 +9,7 @@ BOOST_LIBS = "\
>>       atomic \
>>       chrono \
>>       container \
>> +    contract \
>>       date_time \
>>       exception \
>>       filesystem \
>>
>
>

