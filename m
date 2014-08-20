Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7BACB601A8;
	Wed, 20 Aug 2014 10:35:58 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7KAZwg2008274
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 20 Aug 2014 03:35:58 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 20 Aug 2014 03:35:57 -0700
Message-ID: <53F47A0A.4090802@windriver.com>
Date: Wed, 20 Aug 2014 18:35:54 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20140815172255.043D8505EB@opal.openembedded.org>	
	<53F45EA1.6000900@windriver.com> <1408530106.1669.76.camel@ted>
In-Reply-To: <1408530106.1669.76.camel@ted>
Cc: openembedded-core@lists.openembedded.org,
	openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Peter A. Bigot : gcc: update compiler architecture to match gcc-runtime ( armv6, armv7a)
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
X-List-Received-Date: Wed, 20 Aug 2014 10:36:00 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 08/20/2014 06:21 PM, Richard Purdie wrote:
> On Wed, 2014-08-20 at 16:38 +0800, Hongxu Jia wrote:
>> Hi Peter,
>>
>> The commit caused building gcc-crosssdk-initial-x86_64 failed.
>> ...
>> Unknown CPU given in --with-arch=armv7-a.
>> ...
>>
>> While crosssdk, TARGET_ARCH = "${SDK_ARCH}" (set in crosssdk.bbclass)
>> so the values of '--target=x86_64-wrlinuxsdk-linux --with-arch=armv7-a'
>> triggered the above failure.
>>
>> How about override for the 'target/cross' and not for 'crosssdk' ?
> This was fixed with:
>
> http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=7095d8da4b3e1a6bc475f1cb5e6d7fedb2a76901

It works, thanks

//Hongxu

> Cheers,
>
> Richard
>


