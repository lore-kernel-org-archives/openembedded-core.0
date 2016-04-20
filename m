Return-Path: <ygl@koumoul.net>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3EEED601F6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Apr 2016 13:36:39 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id l6so13815758wml.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Apr 2016 06:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=koumoul.net; s=dkim;
	h=sender:reply-to:subject:references:to:from:organization:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=B4SnqObRh61IdtDWTWZwFQfppa7+ZcFEIYUx2U6bGeQ=;
	b=bQzpyyQ0BvewpKavnMoja9KaKLLLsqf+Scay+6WDwqPJCKToYimyRR+U6nifYOMQNx
	X7RoivlGbK7Jtnf7HV5zUVoKxt2NQbKxEin42ErZUkFiGq26ekXlEFN0qa1u61inU/Yq
	HE6jES39NL8X6fDJUM/j34JcpIZGXo/xUbsFc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=iot-bzh.20150623.gappssmtp.com; s=20150623;
	h=sender:reply-to:subject:references:to:from:organization:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=B4SnqObRh61IdtDWTWZwFQfppa7+ZcFEIYUx2U6bGeQ=;
	b=DssUWbsvod0IzQOU1xx+/cwPJepCk8VBTLikDfC/wf2MrTY0aEWUyb+G4FwZ0weqXZ
	DnUb0a3YDs+JlNQaWY3x014X+k0gTNvJstmjAi/lXLAynuzjFqmxiFD0yOoPMc7DYSCW
	84fow3iW4rMBPO4U35SazrNeH9zR2CU4e8RDoeRP0U8n3BLpil04Gy0dz2duAa3h01jW
	3GpVI9Pydyf/Yr1khnpnuXkv85vPEuaAfmcqC7yx6wJfp9+RbXavCSHtQaUmzVKho8RR
	0DBMWQZ5vZfuMg1K5VWJ5Qgieq3odznhpU32q3RsGYdbpBSXsu9SStr0jPMvM8SzuP6Q
	Nbcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:reply-to:subject:references:to:from
	:organization:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding;
	bh=B4SnqObRh61IdtDWTWZwFQfppa7+ZcFEIYUx2U6bGeQ=;
	b=TjF0SiYEgDjJjuRtYPELloomT6rZdHkJiQODiEL3l+asF+lcHpJpLvT2rPTM7Am0Mq
	YwOiC8R2FihAguTIRPyjJtuBMGeywN95kuRsJoGACELuUkGQKnbcEgpt9AufcLDKHkYz
	Q7JExvvMppWdCq8jzBm1a96R7f3CTWDBEVVRZCXnrfuPhdOmSpxHCoBQKqUU1aiw0p5Q
	99pYyO7rsD/C+HIKZKMaORpJd6Gsjc6oUxO04qUjAdMU0Gmczpd+b/AXxU19QbXhW/hO
	UX+2Lu+sxSgZA3h+4AESb0NyhSsSQDmUkfWnbzS7sq+nXZJ01BffcbGqkxOoRH47JvTC
	0P1w==
X-Gm-Message-State: AOPr4FWC0dtcS4ZtQX6Puc+iogKRlgqqaCaHEmgmHXYPNL1aj6l0Y7j7LgBRfiVJCf7dNg==
X-Received: by 10.28.53.193 with SMTP id c184mr12904227wma.93.1461159400049;
	Wed, 20 Apr 2016 06:36:40 -0700 (PDT)
Received: from [10.20.105.60] (pat35-3-82-245-140-164.fbx.proxad.net.
	[82.245.140.164])
	by smtp.gmail.com with ESMTPSA id s10sm5726076wjp.3.2016.04.20.06.36.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 20 Apr 2016 06:36:39 -0700 (PDT)
Sender: "Yannick Gicquel [ IoT.bzh ]" <ygl@koumoul.net>
Reply-To: yannick.gicquel@iot.bzh
References: <1461070003-12494-1-git-send-email-yannick.gicquel@iot.bzh>
	<1461070003-12494-2-git-send-email-yannick.gicquel@iot.bzh>
	<571640FF.4040000@opendreambox.org> <57173D88.5040102@iot.bzh>
	<20160420083737.GD3520@ad.chargestorm.se>
To: openembedded-core@lists.openembedded.org, anders@chargestorm.se
From: Yannick GICQUEL <yannick.gicquel@iot.bzh>
Organization: IOT.bzh
Message-ID: <571785ED.9020407@iot.bzh>
Date: Wed, 20 Apr 2016 15:36:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <20160420083737.GD3520@ad.chargestorm.se>
Subject: Re: [RFC PATCH 1/4] u-boot: basic support of device tree blob reassembly
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
X-List-Received-Date: Wed, 20 Apr 2016 13:36:41 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit



Le 20/04/2016 10:37, Anders Darander a écrit :
> Just a comment on task ordering. Not sure that it really matters
> though...
>
> * Yannick GICQUEL <yannick.gicquel@iot.bzh> [160420 10:28]:
>> Le 19/04/2016 16:30, Andreas Oberritter a écrit :
>>> Hello Yannick,
>> Hi Andreas,
>>> On 19.04.2016 14:46, Yannick Gicquel wrote:
>>>> +addtask assemble_dtb after do_deploy before do_install
>>> The task do_deploy executes after do_install. Does it really work this
>>> way? I think bitbake should try to detect this and error out.
>> I confirm do_deploy is executed before do_install.
>> It looks like it is schedule this way by the last line of the file:
>> addtask deploy before do_build after do_compile
> Well, if task do_deploy is scheduled before do_install, that's just by
> luck.
>
> The following line adds do_install:
>
> addtask install after do_compile
>
> Thus, the ordering between do_install and do_deploy isn't fixed. It
> could be random, it could be based on alphabetical sorting, or the order
> the tasks are added. However, it could easily change...

Thanks for the precision.
I understand that ordering is not fixed as both tasks depends on do_compile.

I am on the way to send a v2 and the tasks are now sequenced as below :
    u-boot:do_deploy -> virtual/kernel:do_assemble_fitimage -> 
u-boot:do_install

Best regards,

>
> Cheers,
> Anders
>
>> (I attached the log.task_order for reference - FYI, behavior is the same on
>> jethro or today's master branch)


