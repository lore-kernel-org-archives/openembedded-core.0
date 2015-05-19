Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F009865C7E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 May 2015 20:50:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t4JKo7WR005984
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 19 May 2015 13:50:07 -0700 (PDT)
Received: from [128.224.56.48] (128.224.56.48) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 19 May 2015 13:50:06 -0700
Message-ID: <555BA1FE.5000402@windriver.com>
Date: Tue, 19 May 2015 16:50:06 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Khem Raj
	<raj.khem@gmail.com>
References: <1431268136-6968-1-git-send-email-akuster808@gmail.com>	
	<CAMKF1spdFnLWipG86g52MGfTEohRkketU6qCj+cTQcJC-o2rCQ@mail.gmail.com>	
	<1431295383.30971.25.camel@linuxfoundation.org>	
	<1431414393.30971.109.camel@linuxfoundation.org>
	<1431686433.18723.22.camel@linuxfoundation.org>
In-Reply-To: <1431686433.18723.22.camel@linuxfoundation.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] rpm: fix build issue with gcc5
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
X-List-Received-Date: Tue, 19 May 2015 20:50:11 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 2015-05-15 06:40 AM, Richard Purdie wrote:
> On Tue, 2015-05-12 at 08:06 +0100, Richard Purdie wrote:
>> With the gcc patch I've posted applied:
>>
>> http://errors.yoctoproject.org/Errors/Search/?items=10&query=5fd0b7c163f4f3312bea9bd3246a6bd67a8da594&limit=100
>>
>> so down to 57 errors. There are a few themes:
>>
>> * linux-yocto 3.14 gcc5 issues
>> * meta-fsl-ppc and metafsl-arm gcc5 issues, particularly kernel
>> * poky-lsb issues with the security flags and gcc5
>> * x32 failed with a race of some kind in glibc, suspect transient
>> * gcc-target has a packaging issue which fails builds (have patch)
>>
>> The good news is that the various ppc issues are fixed including the rpm
>> one from this series.
>
> Latest run:
>
> http://errors.yoctoproject.org/Errors/Search/?items=10&query=a2fbb1b6b6e564b3f9d40550c0b408978f420039&limit=100
>
> with 37 errors.
>
> * linux-yocto 3.14 gcc5 issues

I had a look at the failures in more detail today, and I can have a
go at fixing the qemu* build failures tomorrow.

I have one patch from Armin, and will pick up some of the patches
that Khem referenced in his earlier email.

.. but for the reference BSPs, I simply don't have the cycles. Can
we just open bugzilla for the individual boards and get their
respective maintainers to have a look ?

If this is high priority, then getting it tracked in bugzilla
seems reasonable to me.

Bruce

> * meta-fsl-ppc and meta-fsl-arm gcc5 issues, particularly kernel
> * poky-lsb issues with the security flags and gcc5 (elfutils,
>    coreutils, iptables, openssl on edgerouter)
> * qemuarm doesn't boot
> * u-boot with beaglebone
>
> linux-yocto 3.14 is the next thing we need to clean up to have the most
> impact, qemuarm not booting is the most worrying.
>
> Cheers,
>
> Richard
>
>
>


