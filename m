Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id CDF4B605FF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jun 2016 03:17:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u5F3Heai009439
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 14 Jun 2016 20:17:40 -0700
Received: from [128.224.162.229] (128.224.162.229) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Tue, 14 Jun 2016 20:17:39 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>, "Maxin B. John"
	<maxin.john@intel.com>
References: <cover.1465697985.git.Qi.Chen@windriver.com>
	<c7d3b5b5d732304a31a843147fd123eda27a4794.1465697985.git.Qi.Chen@windriver.com>
	<20160614043843.GA22248@mbabyjoh-desk.ger.corp.intel.com>
	<575FD133.1030008@windriver.com>
	<1465905814.13979.208.camel@linuxfoundation.org>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <5760C8D0.3090800@windriver.com>
Date: Wed, 15 Jun 2016 11:17:36 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.2
MIME-Version: 1.0
In-Reply-To: <1465905814.13979.208.camel@linuxfoundation.org>
X-Originating-IP: [128.224.162.229]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/9] gzip: upgrade to 1.8
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
X-List-Received-Date: Wed, 15 Jun 2016 03:17:44 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 06/14/2016 08:03 PM, Richard Purdie wrote:
> On Tue, 2016-06-14 at 17:41 +0800, ChenQi wrote:
>> On 06/14/2016 12:38 PM, Maxin B. John wrote:
>>> Hi,
>>>
>>> On Sun, Jun 12, 2016 at 10:21:02AM +0800, Chen Qi wrote:
>>>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>>> ---
>>>>    meta/recipes-extended/gzip/{gzip_1.6.bb => gzip_1.8.bb} | 0
>>>>    1 file changed, 0 insertions(+), 0 deletions(-)
>>>>    rename meta/recipes-extended/gzip/{gzip_1.6.bb => gzip_1.8.bb}
>>>> (100%)
>>>>
>>>> diff --git a/meta/recipes-extended/gzip/gzip_1.6.bb
>>>> b/meta/recipes-extended/gzip/gzip_1.8.bb
>>>> similarity index 100%
>>>> rename from meta/recipes-extended/gzip/gzip_1.6.bb
>>>> rename to meta/recipes-extended/gzip/gzip_1.8.bb
>>>> -- 
>>>> 1.9.1
>>> gzip-1.8 build failed on qemux86 - musl:
>>> http://errors.yoctoproject.org/Errors/Details/69401/
>>>
>>> Best Regards,
>>> Maxin
>>>
>> Thanks.
>> I'll look into it.
> I've updated the patch in -next to deal with this, and the
> PREFERRED_VERSION warning it introduced too...
>
> Cheers,
>
> Richard
>

Thanks a lot for that.

Best Regards,
Chen Qi

