Return-Path: <jonas@norrbonn.se>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id 8A21A7C592
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 19:58:09 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id n18-v6so15365909lji.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 11:58:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=norrbonn-se.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=ucOwmSizV7dV3cYL29YpCFbrctpixG0v8NZ+EJQCYs4=;
	b=1SKb8yxWmV5g7mPoet7k0q5FcCCY26rRX/CAXWVFTm4ymtO2Msqm/n1O1/uLP5M+Yq
	d3t4RVMdF5YIm4ba2f3IAsS5R8QYLBCzc6xK8H9M2Qz2HUeM1kIiqwVUOttBiDsDFCfF
	k1am+3I4e2pN28R1HcgTB5XiBv7T5SJu3uCE+GwSSDPhGqLFyj+5Y4xxPK0genxCYRgn
	lNmLtwJDrIX01sJMtgEBvnwBwvJXt42Pjvosx/g/mvEHMCvQ5LNoUj7hFIchqgr+3WcH
	bpsfjbCkxP793ZP9aiiDzL6dYbZ6PcOVV+2pUhDHWhLulSDTWaQWzsskQxMgUfuEAbTy
	lqMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ucOwmSizV7dV3cYL29YpCFbrctpixG0v8NZ+EJQCYs4=;
	b=m0KKmn/ceTM/849l4eXWVOBZRtRJcELlxXcKQkGGfAIb21kyJLaEIFAAu47ld190vr
	JYwlPnMeT2y1LhRC126CUCUHZV0HNAEy0pt/DusF06gFcWK+ZViMzgA/fhmoRz1ARXqY
	BoHokqtRD+pD+CsVNU+s8bs12kmH+utSuSDYN/evVbWVHIsbXqzSn0ylbzJGCk7ZfKlS
	gPzD0pvmo99pcYVqio4vhj+MCTtVPC1aqErFH/57NSsVb61LtHpzbw/6noL+pJrn6g3n
	tPBPUUWQ91JWqEpNb1/LiQ8gDt/9Y53QzmeV5BSHKmNvdm5fYmga6TkHNss1g52BluJi
	wisA==
X-Gm-Message-State: AJcUukczxSn0qbWmnyfhtvYba7N0WGJ/+ZTao2CxUhlUPwi6jqLMyFRx
	FHvJZ1l7Cpf6m7/adfz/vcdqPuCNj08=
X-Google-Smtp-Source: ALg8bN4X0UEMM6O2TC6hicYPzZ1tKs1w9ZWkDonZehX6ur5cs+RO1YiNWoU+pLPpNawwHXLC6xpF2g==
X-Received: by 2002:a2e:3e04:: with SMTP id
	l4-v6mr16335047lja.148.1548705489507; 
	Mon, 28 Jan 2019 11:58:09 -0800 (PST)
Received: from [192.168.1.169] (h-29-16.A159.priv.bahnhof.se. [79.136.29.16])
	by smtp.gmail.com with ESMTPSA id
	b20sm3094352lfj.61.2019.01.28.11.58.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Jan 2019 11:58:08 -0800 (PST)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <20190127093821.4803-1-jonas@norrbonn.se>
	<9649a5c523c4f0809c9f73a9c5326eead5ae12d5.camel@linuxfoundation.org>
	<c4b576fc-741a-0fac-efdd-738bf7e9c141@norrbonn.se>
	<c386e07d5c75dfb9040e78caa2e5c3089c525873.camel@linuxfoundation.org>
	<0f341f2157a9560145fd2184a9b84098372f5e6c.camel@linuxfoundation.org>
From: Jonas Bonn <jonas@norrbonn.se>
Message-ID: <f4ea0012-9826-124a-bb1b-fec5582b4a61@norrbonn.se>
Date: Mon, 28 Jan 2019 20:58:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <0f341f2157a9560145fd2184a9b84098372f5e6c.camel@linuxfoundation.org>
Subject: Re: [PATCH v3 0/5] systemd patches
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
X-List-Received-Date: Mon, 28 Jan 2019 19:58:09 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 28/01/2019 18:26, Richard Purdie wrote:
> On Mon, 2019-01-28 at 14:31 +0000, Richard Purdie wrote:
>> On Mon, 2019-01-28 at 15:26 +0100, Jonas Bonn wrote:
>>> Hi,
>>>
>>> On 28/01/2019 14:55, Richard Purdie wrote:
>>>> Unfortunately this series failed in testing:
>>>>
>>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/72/builds/226
>>>>
>>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/56/builds/167
>>>>
>>>> so it looks like it may need some tweaks before we can merge it.
>>>
>>> OK.  You'll have to bear with me here as I'm not familiar with
>>> looking at the buildbot output.  From what I can see, the failure
>>> is
>>> when it attempts to boot the image... is that correct?  In what way
>>> does it fail... where do I find that?
>>
>> Yes, these tests are trying to boot images under qemu. You can see
>> the
>> output from boot process and it looks like it starts an interactive
>> dialog with the user (or attempts to) for setup. The key piece in the
>> various logs would appear to be:
>>
>>   DEBUG: Last 25 lines of text:
>>>           Starting First Boot Wizard...
>>>           Starting Rebuild Hardware Database...
>>>           Starting Apply Kernel Variables...
>>>           Mounting NFSD configuration filesystem...
>>>
>>> Welcome to your new installation of Poky (Yocto Project Reference
>> Distro) 2.6+snapshot-20190126 (master)!
>>> Please configure a few basic system settings:
>>>
>>> -- Press any key to proceed --[[0;32m  OK  [0m] Started Journal
>> Service.
>>
>> (from
>> https://autobuilder.yoctoproject.org/typhoon/api/v2/logs/257192/raw)
>>
>>
>>> When I build locally this all runs fine.  So what should I be
>>> building locally in order to see a failure like buildbot sees?
>>
>> Add INHERIT += "testimage" to local.conf and then
>>
>> "bitbake core-image-sato -c testimage"
>>
>> You'll need a tun/tap device setup so that "runqemu <machine>
>> <imagename>"works.
> 
> FWIW testing narrowed it down to the machine id patch causing this.

Thanks.  The reason for the prompt is that systemd-firstboot runs; 
systemd detects whether it's a "first boot" based on the existence of 
the machine-id file.  Since the machine-id file is absent now (by 
design), this service runs.  The question is why systemd-firstboot is 
being included in the build at all given that it should have been 
configured out.  I'll poke at it when I get a moment.

/Jonas

> 
> Cheers,
> 
> Richard
> 

