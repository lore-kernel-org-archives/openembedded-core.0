Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8B39C60616
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 06:03:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u0863os4001996
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 7 Jan 2016 22:03:50 -0800 (PST)
Received: from [128.224.162.155] (128.224.162.155) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 7 Jan 2016 22:03:50 -0800
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1452152689.git.liezhi.yang@windriver.com>
	<40d0365cec15c63a1f77e9aa43fb4022f62e0f66.1452152689.git.liezhi.yang@windriver.com>
	<1452164226.7598.108.camel@linuxfoundation.org>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <568F5144.5000601@windriver.com>
Date: Fri, 8 Jan 2016 14:03:48 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <1452164226.7598.108.camel@linuxfoundation.org>
Subject: Re: [PATCH 2/3] run-postinsts: can't be allarch
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
X-List-Received-Date: Fri, 08 Jan 2016 06:03:53 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 01/07/2016 06:57 PM, Richard Purdie wrote:
> On Wed, 2016-01-06 at 23:45 -0800, Robert Yang wrote:
>> The dependencies chain:
>> run-postinsts -> update-rc.d.bbclass -> initscripts -> update
>> -alternatives.
>>
>> The update-alternatives is provided by opkg-utils which is not
>> allarch.
>>
>> This caused a problem:
>> $ bitbake lib32-core-image-minimal
>>
>> Both lib32-opkg-utils and opkg-utils would be built, but opkg-utils
>> shouldn't, this patch can fix the problem.
>>
>> [YOCTO #8879]
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   .../run-postinsts/run-postinsts_1.0.bb             |    2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> Removing allarch isn't the correct way to fix this, we need to figure
> out what is going wrong and fix multilib.

Thanks, I will try to fix it from multilib.

// Robert

>
> Cheers,
>
> Richard
>

