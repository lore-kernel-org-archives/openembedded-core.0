Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1447865EF0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Apr 2014 03:33:26 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s3C3XOrj021903
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 11 Apr 2014 20:33:24 -0700 (PDT)
Received: from [128.224.162.226] (128.224.162.226) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.169.1;
	Fri, 11 Apr 2014 20:33:24 -0700
Message-ID: <5348B401.20908@windriver.com>
Date: Sat, 12 Apr 2014 11:33:21 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
References: <CAP9ODKoLt=HMhiGQZmQhDUUFm-efPavZRftR7A8Wf7gECw+Amw@mail.gmail.com>	<533F8B7C.8010409@windriver.com>	<5342BC44.2000708@intel.com>	<5344BADD.5090106@windriver.com>
	<CAP9ODKo=89kd-3fejPrsqrtgiRxzTkoX6-gNOasiZE2cF5Oj2A@mail.gmail.com>
In-Reply-To: <CAP9ODKo=89kd-3fejPrsqrtgiRxzTkoX6-gNOasiZE2cF5Oj2A@mail.gmail.com>
Cc: "meta-freescale@yoctoproject.org" <meta-freescale@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [dora][regression] mesa failed to build
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
X-List-Received-Date: Sat, 12 Apr 2014 03:33:28 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 04/11/2014 09:56 PM, Otavio Salvador wrote:
> Hello,
>
> On Wed, Apr 9, 2014 at 12:13 AM, Robert Yang <liezhi.yang@windriver.com> wrote:
>> On 04/07/2014 10:55 PM, Valentin Popa wrote:
>>> Indeed the build failure was introduced by that patch, which enters a
>>> logical
>>> conflict with the bbappend file for mesa.
>>> To remain compatible with the future releases I suggest to  not remove/add
>>> flags
>>> from/to EXTRA_OECONF explicitly, and make  use of what PACKAGECONFIG
>>> contains.
>>> The first part of the __anonymous function from the bbappend file can be
>>> simply
>>> replaced with:
>>>
>>> PACKAGECONFIG_remove = "egl"
>>>
>>> and the second part with:
>>>
>>> PROVIDES_remove = "virtual/libgles1 virtual/libgles2 virtual/egl"
>>> and
>>> PROVIDES_remove = "virtual/libgl" if mx6 is in SOC_FAMILY.
>>>
>>
>> Hi Otavio,
>>
>> Does Valentin's suggestions work for you, please?
>
> I am traveling and won't be able to test it.
>
> However I am quite surprise this didn't come out /before/ when the
> dora updates were in test in AB since meta-fsl-arm is tested in AB
> too. We need to figure /why/ this broke and for now I think we ought
> to revert this dora patch.
>
> This kind of change needs to be coordinated and raise a build break in
> an Yocto Project is unacceptable IMO.
>
> For me it is clear this didn't run in AB before merging. :(
>

I'm sorry about that, I had run it on my *local* AB before merging, but
the local AB is less powerful and doesn't include the meta-fsl-arm layer,
I'm fine to revert it, what's RP and valentin's opinion, please ?

// Robert







