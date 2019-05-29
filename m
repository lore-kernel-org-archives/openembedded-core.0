Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 84EC17E164
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 01:22:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x4T1LBSR029488
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 28 May 2019 18:21:49 -0700
Received: from [128.224.162.179] (128.224.162.179) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.439.0;
	Tue, 28 May 2019 18:21:42 -0700
To: Paul Barker <paul@betafive.co.uk>, Peter Kjellerstedt
	<peter.kjellerstedt@axis.com>, Khem Raj <raj.khem@gmail.com>
References: <20190523082558.3805-1-kai.kang@windriver.com>
	<20190523082558.3805-2-kai.kang@windriver.com>
	<36fa4c4d62d448588b54a0a4b0a5c92a@XBOX04.axis.com>
	<CAMKF1spu88QXmGms77KzQXVGYSw7dR=40G_Ldd37G0DC1pc68w@mail.gmail.com>
	<7977f33e2ada4c18a52446f9cb1511ed@XBOX04.axis.com>
	<e3af3be2-c739-fa69-720f-d08ddef76b28@windriver.com>
	<c052374a-28ec-74b9-a1c2-58329a937f5b@betafive.co.uk>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <af5526d5-8465-d38f-80c7-6962a9bfe722@windriver.com>
Date: Wed, 29 May 2019 09:20:30 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <c052374a-28ec-74b9-a1c2-58329a937f5b@betafive.co.uk>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 1/2] local.conf.sample: make systemd as default init manager
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
X-List-Received-Date: Wed, 29 May 2019 01:22:55 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2019/5/28 下午5:28, Paul Barker wrote:
>
>
> On 27/05/2019 02:49, Kang Kai wrote:
>> On 2019/5/25 上午3:23, Peter Kjellerstedt wrote:
>>>> -----Original Message-----
>>>> From: Khem Raj <raj.khem@gmail.com>
>>>> Sent: den 23 maj 2019 22:59
>>>> To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
>>>> Cc: kai.kang@windriver.com; 
>>>> openembedded-core@lists.openembedded.org; 
>>>> richard.purdie@linuxfoundation.org
>>>> Subject: Re: [OE-core] [PATCH v3 1/2] local.conf.sample: make 
>>>> systemd as default init manager
>>>>
>>>> On Thu, May 23, 2019 at 1:41 PM Peter Kjellerstedt 
>>>> <mailto:peter.kjellerstedt@axis.com> wrote:
>>>>> -----Original Message-----
>>>>> From: mailto:openembedded-core-bounces@lists.openembedded.org 
>>>>> <openembedded-
>>>>> mailto:core-bounces@lists.openembedded.org> On Behalf Of
>>>>> mailto:kai.kang@windriver.com
>>>>> Sent: den 23 maj 2019 10:26
>>>>> To: mailto:richard.purdie@linuxfoundation.org
>>>>> Cc: mailto:openembedded-core@lists.openembedded.org
>>>>> Subject: [OE-core] [PATCH v3 1/2] local.conf.sample: make systemd as
>>>>> default init manager
>>>>>
>>>>> From: Kai Kang <mailto:kai.kang@windriver.com>
>>>>>
>>>>> Move configurations from local.conf.sample.extended to 
>>>>> local.conf.sample
>>>>> to make systemd as default init manager for poky.
>>>> If we're going to change the default init manager to be systemd, 
>>>> wouldn't
>>>> it be more appropriate to change the real default values in 
>>>> bitbake.conf
>>>> and http://packagegroup-core-boot.bb? And then include an example in
>>>> local.conf.sample.extended to show how to configure sysvinit as init
>>>> manager?
>>>>
>>>> That would change it for Oe-core and other distributions as well which
>>>> is not the intention
>>> Ok, then I'd say the change belongs in poky.conf. Doing this kind of 
>>> changes
>>> in local.conf.sample seems very wrong to me. Why? Because if I have an
>>> existing build tree it will not be affected, but if I setup a new 
>>> tree with
>>> oe-init-build-env it will all of a sudden behave differently from 
>>> the old
>>> tree. In my mind, local.conf.sample should only be used for things 
>>> the user
>>> are likely to want to configure to adapt the build for his/her 
>>> environment,
>>> not to define the distribution (that's what poky.conf is for).
>>
>>
>> If put the settings to poky.conf, it is complicated to override the 
>> settings and hard for users to turn back to sysvinit when he/she wants.
>
> If you want to make this override-able you could do something like 
> this (forgive any mistakes or bad wrapping I'm just writing this in my 
> email client without testing):
>
> POKY_USE_SYSTEMD ?= "1"
> DISTRO_FEATURES_append = "${@bb.utils.conditional("POKY_USE_SYSTEMD", 
> "1", "systemd", "", d)}"
> ... etc ...
>
> That would allow someone to set `POKY_USE_SYSTEMD = "0"` in their 
> local.conf.
>
> There may be more elegant ways to do this as well, but we the default 
> can certainly be set in the distro config in a way that can be 
> overridden in local.conf.

OK. I'll move them to poky.conf.

Thanks.

Kai


>
> Thanks,
>

-- 
Kai Kang


