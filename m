Received: from mailrelay1-2.pub.mailoutpod1-cph3.one.com (mailrelay1-2.pub.mailoutpod1-cph3.one.com [46.30.212.0])
 by mx.groups.io with SMTP id smtpd.web12.7626.1625584322339955416
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jul 2021 08:12:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@berginkonsult.se header.s=20191106 header.b=O9bpLxBs;
 spf=none, err=permanent DNS error (domain: berginkonsult.se, ip: 46.30.212.0, mailfrom: peter@berginkonsult.se)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=berginkonsult.se; s=20191106;
	h=content-transfer-encoding:content-type:in-reply-to:mime-version:date:
	 message-id:references:cc:to:from:subject:from;
	bh=NFN7b4WDgz6en/aSUqDNixNdzy/p+e5TNj9HsrZEW7I=;
	b=O9bpLxBsc20CzLzvEh8WRHyuDMo+zF+tUUUCTHSX8IBd2uDqq1Tjjq7AY3DCzfMa193HIa2fPraN4
	 nswKsR+gsb9SE0Dl1CDbNDYvS292r5eTi0jvMH+P2odIyzyIqNUewC1WAfvHRAtmkzbucppnVaLsYb
	 YQW+sRtZotuLJuCdRyfmK6s7ipXBMeOvjVzVarS/lCim22Nx5B2OMANE/uRxyUBkOPHByKhQGmq/fv
	 LV6bv04D7RIWburEnnaPFAz/tCJiBpTmZ/zo5+2r5fx+EP07G1pUV/uscY2XazduWmpWKwdrmObGyq
	 Syxlyqap3ylR1k2AA0jsQkdG7ZvegnQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=berginkonsult.se; s=rsa1;
	h=content-transfer-encoding:content-type:in-reply-to:mime-version:date:
	 message-id:references:cc:to:from:subject:from;
	bh=NFN7b4WDgz6en/aSUqDNixNdzy/p+e5TNj9HsrZEW7I=;
	b=D4/vHfABOYAqkeLZRAR+y8YXhgM/ghjt0sj+TL5+VHm+slfePOSYtFwnD658hEB5DSsmyqMmM1Heg
	 d87T5pqBPoSkuNkuEOw1OXpRbs5USvm2Z7JbFLtJDY/u2hqmgHEMGZqnP5TThAPS+8TvaLX/YcHoEq
	 Vdm6zpq9NEMMde+mF+cgg8asEDFvsr5IUQsQZt08hqJ8m7wTyYoJTLhgvUWS4V4GeYWDfJPFQM/XA7
	 361bPs09vHwtY1ZQePve/SYM5Vu4EN5Npe2Ii+e12yqB3RubXODnuzGRAM3+b2vd/9a3DBAp1lPaYE
	 XOoIjbHqNl0GVw5d4pwTViwcCIQfh0Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=berginkonsult.se; s=ed1;
	h=content-transfer-encoding:content-type:in-reply-to:mime-version:date:
	 message-id:references:cc:to:from:subject:from;
	bh=NFN7b4WDgz6en/aSUqDNixNdzy/p+e5TNj9HsrZEW7I=;
	b=bGVmTSXRZmkEWLWquwScNg2f0l7ua9/tv+Ct4POUWXX8Rx517oxRxGD0xAIlXdMRvVHyHef6/MwL5
	 A0KkXqzBQ==
X-HalOne-Cookie: d0a8fb692031a5c939e7965839feb712f758b9ed
X-HalOne-ID: 82231e48-de6c-11eb-925e-d0431ea8a283
Received: from [192.168.100.145] (ua-85-227-233-29.bbcust.telenor.se [85.227.233.29])
	by mailrelay1.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
	id 82231e48-de6c-11eb-925e-d0431ea8a283;
	Tue, 06 Jul 2021 15:11:59 +0000 (UTC)
Subject: Re: [OE-core] [PATCH] Revert "libubootenv: inherit uboot-config"
From: "Peter Bergin" <peter@berginkonsult.se>
To: Anuj Mittal <anuj.mittal@intel.com>,
 "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Cc: "otavio@ossystems.com.br" <otavio@ossystems.com.br>,
 "liu.ming50@gmail.com" <liu.ming50@gmail.com>
References: <20210702115900.19417-1-peter@berginkonsult.se>
 <bc5cdd46cfb003f45c1ed7762ee140c0f4f5cca5.camel@intel.com>
 <775af313-1b19-146e-b0f3-113d5af0a992@berginkonsult.se>
 <a3f45eab0d82dea6f34936d821d902b79c43abbd.camel@linuxfoundation.org>
 <0e446811e98bcb4833cdc0c7f5dd40fcd8f07a43.camel@intel.com>
 <d83ff556-cab9-3616-f4ad-506e8675eda5@berginkonsult.se>
Message-ID: <db03a0b4-d292-4db8-694e-56b3fa1c99cc@berginkonsult.se>
Date: Tue, 6 Jul 2021 17:11:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <d83ff556-cab9-3616-f4ad-506e8675eda5@berginkonsult.se>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi again,

sorry for the noise but did some investigations and was able to 
reproduce....

On 2021-07-06 15:42, Peter Bergin wrote:
> Hi,
>
> On 2021-07-06 04:44, Anuj Mittal wrote:
>> Hi Peter,
>>
>> On Sun, 2021-07-04 at 10:21 +0100, Richard Purdie wrote:
>>> On Sun, 2021-07-04 at 10:59 +0200, Peter Bergin wrote:
>>>> On 2021-07-03 16:55, Mittal, Anuj wrote:
>>>>> On Fri, 2021-07-02 at 13:59 +0200, Peter Bergin wrote:
>>>>>> This reverts commit 10aa1291979fb90bed1beb49be4d406ed0e1e4d5.
>>>>>>
>>>>>> As there is no build dependency between libubootenv and the
>>>>>> configuration
>>>>>> of u-boot there is no reason to check for UBOOT_CONFIG or
>>>>>> UBOOT_MACHINE
>>>>>> by adding the class uboot-config. Revert this in order to
>>>>>> remove
>>>>>> useless
>>>>>> workaround in bsp layer (meta-freescale).
>>>>> This was added to address failures in world builds:
>>>>>
>>>>> https://lists.openembedded.org/g/openembedded-core/message/141757
>>>>>
>>>>> If this is not required, then I think we'd need to address those
>>>>> failures.
>>>> Thanks for the pointer about the reason for this patch. I searched
>>>> a bit
>>>> but could not find it.
>>>>
>>>> Can you please help me define 'world builds'?
>>> "bitbake world"
>>>
>>> i.e. build everything
>>>
>>>> By reading the mail thread my thoughts are that the obvious thing
>>>> is
>>>> that the build has a bad configuration as u-boot is skipped. This
>>>> should
>>>> be the thing to solve.
>>> Not every MACHINE will support u-boot or have a configuration for it.
>> Do you have a fix for this? This patch was applied and now the world
>> builds for MACHINEs not supporting u-boot are failing. Do you mind if I
>> send a revert of your patch?
>>
>
> I don't mind but I think it is the wrong thing to do, at least without 
> analyzing the failing builds and get to the root of the problem.
>
> My view on this, correct me if I'm wrong here. If you just want to 
> build libubootenv you should be able to do it for any machine, with or 
> without u-boot support as there is no build dependency between 
> libubootenv and u-boot. If you have libubootenv in your image there 
> will be a RRECOMMENDS to u-boot-env and in that case you must have 
> NO_RECOMMENDATION=0 or a valid u-boot configuration. If the world 
> build is failing I guess there is a configuration for a target without 
> u-boot that includes libubootenv in an image. Or what is the exact 
> failure? Can you send a reference with a log to the failing build?
>
> /Peter
>
>
>
     $ bitbake libubootenv
     Loading cache: 100% 
|######################################################################################################| 
     Time: 0:00:00
     Loaded 3462 entries from dependency cache.
     NOTE: Resolving any missing task queue dependencies
     ERROR: Nothing RPROVIDES 'u-boot-default-env' (but 
meta/recipes-bsp/u-boot/libubootenv_0.3.1.bb RDEPENDS on or otherwise 
requires it)
     NOTE: Runtime target 'u-boot-default-env' is unbuildable, removing...
     Missing or unbuildable dependency chain was: ['u-boot-default-env']
     ERROR: Required build target 'libubootenv' has no buildable providers.
     Missing or unbuildable dependency chain was: ['libubootenv', 
'u-boot-default-env']

     Summary: There was 1 WARNING message shown.
     Summary: There were 2 ERROR messages shown, returning a non-zero 
exit code.

The setup above was to use a machine from (meta-intel) with grub as 
bootloader.

Then I can correct my earlier statement and a new wisdom that run-time 
dependecies are scanned already in the early phases. Apparently it is 
not possible to build libubootenv due to RRECOMMENDS to 
u-boot-default-env. The build for a 'non-u-boot config' will fail if we 
add 'inherit uboot-config' and it will fail without. What is the 
difference for a 'world' build?

/Peter


