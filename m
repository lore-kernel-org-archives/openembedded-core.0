Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3D6BE7E738
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2019 05:56:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x5C5ugHJ025421
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 11 Jun 2019 22:56:42 -0700 (PDT)
Received: from [128.224.162.148] (128.224.162.148) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Tue, 11 Jun 2019 22:56:41 -0700
To: Adrian Bunk <bunk@stusta.de>
References: <cover.1560305170.git.Qi.Chen@windriver.com>
	<6c141cf1421c58dd5fed46481b94c82143628bab.1560305170.git.Qi.Chen@windriver.com>
	<20190612054305.GB12642@localhost>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <0570e0e6-1f00-d011-6700-7c4bf3380c6a@windriver.com>
Date: Wed, 12 Jun 2019 14:08:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20190612054305.GB12642@localhost>
X-Originating-IP: [128.224.162.148]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] util-linux: upgrade to 2.33.2
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
X-List-Received-Date: Wed, 12 Jun 2019 05:56:43 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 06/12/2019 01:43 PM, Adrian Bunk wrote:
> On Wed, Jun 12, 2019 at 10:06:33AM +0800, Chen Qi wrote:
>> The license files' names are changed, but the contents remain the
>> same.
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   meta/recipes-core/util-linux/util-linux.inc              | 16 ++++++++--------
>>   .../{util-linux_2.32.1.bb => util-linux_2.33.2.bb}       |  4 ++--
>>   2 files changed, 10 insertions(+), 10 deletions(-)
>>   rename meta/recipes-core/util-linux/{util-linux_2.32.1.bb => util-linux_2.33.2.bb} (72%)
>>
>> diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
>> index 7b9b4d2..eaaf408 100644
>> --- a/meta/recipes-core/util-linux/util-linux.inc
>> +++ b/meta/recipes-core/util-linux/util-linux.inc
>> @@ -8,15 +8,15 @@ SECTION = "base"
>>   
>>   LICENSE = "GPLv2+ & LGPLv2.1+ & BSD"
>> ...
>> -                    file://Documentation/licenses/COPYING.UCB;md5=263860f8968d8bafa5392cab74285262 \
>> ...
>> +                    file://Documentation/licenses/COPYING.BSD-4-Clause-UC;md5=263860f8968d8bafa5392cab74285262 \
>> ...
> Doesn't this mean that LICENSE is (and already was before) wrong?
>
> meta/files/common-licenses/BSD is the 3 clause BSD licence,
> but this is the 4 clause licence (with the advertising clause).
>
> cu
> Adrian
>
Thanks. I've changed this in V2.

Best Regards,

Chen Qi


