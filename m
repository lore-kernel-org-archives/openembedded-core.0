Return-Path: <jpewhacker@gmail.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4494A7FD68
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 22:10:34 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id n11so4588482iom.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 14:10:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:subject:to:cc:references:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=bRFPLV3RO6l37NfZ3Fx8nNhyjetufsD/EPdEzRwgcUE=;
	b=AxwdW14Z3jsBlsejKNMA6mS1HLGN80LpLdOu5lLbMlV7ju9tV4xZbE6pTFzBESAm1I
	pG80hoZfyuu/G5cqfbHXeQ5lFIacZhCBfxEoon4wYW3FIX4ltpGis/ZqkUfb36yA8f6p
	QkBRlHsM/wzudp2xktbb/J4nsryg4l7jr+7cGQekB2tN0S6uKM1JimtYpp2R/+nHL6Cb
	MozHAVjbPbNpCfMfbSKgrmb9dqPrpHlKPIV4WWi/gLXT0oplhWq8n0yvLjYK4djgFHnn
	ObBeqzPuxlVS0HL/UTlUhrL2r+TSxuY8Ad/3sGnd73BIdOVbYkGw64hnMXS4ZP7AJAcL
	HxPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:subject:to:cc:references:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=bRFPLV3RO6l37NfZ3Fx8nNhyjetufsD/EPdEzRwgcUE=;
	b=EcL8vHw0bzLTtVA3Z8eUuk5z1XQUBu+RRyN4iVqjbaZuxhbbijKjNPdtGzRta2zk4Y
	Z2/00EtomP+fzSfbF2y+LnOcTcT/lCIuoL8s1T5Ywo3+DjCLNIxJq94DlXlbK2oMi1nM
	xzmnpSJNJxJ1y41+9IAd89DcHfT97xe7Xk8CH99k6lVXcuVMz4AhjG/ZGj6HG77xc+yF
	+KLyqok59A/Ib4I3rUR+36iqWrijmoZn6FS80encS+bt4AMdIovJuusepHGDvxqtxYPl
	a9CCsTPiGXwaxbDEVIQisnwft1i4dy7UvoPYIrw3Hq9oZGqxiTXAn+bCc0gNZTArYC83
	5A1g==
X-Gm-Message-State: APjAAAUuM/3+WcICERIBvMa26ODDt5V+725qjusCT+2gfuu0LT7939P4
	zjSCFD3GPmuievOXKV/uEcM=
X-Google-Smtp-Source: APXvYqyMpX6joCZgra3/CevElflK16SedPdy0iB4wZBU1/Am/GnS0ul/VGXcUL9h085Qsi9EmMBf0g==
X-Received: by 2002:a5e:9814:: with SMTP id s20mr597539ioj.96.1579817435293;
	Thu, 23 Jan 2020 14:10:35 -0800 (PST)
Received: from [10.30.196.43] ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id e13sm719765iol.16.2020.01.23.14.10.34
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 23 Jan 2020 14:10:34 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: Denys Dmytriyenko <denis@denix.org>,
	Bruce Ashfield <bruce.ashfield@gmail.com>
References: <1579813185-1950-1-git-send-email-denis@denix.org>
	<CADkTA4OUcmx2wFVf9NAR8D7c_3n+303YFR3gwAWv08KgT_o+ww@mail.gmail.com>
	<20200123220536.GE4735@denix.org>
Message-ID: <4e8ae0a5-bf21-9f91-6e04-c1f733f14905@gmail.com>
Date: Thu, 23 Jan 2020 16:10:33 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20200123220536.GE4735@denix.org>
Cc: Jon Mason <jdmason@gmail.com>, Denys Dmytriyenko <denys@ti.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] arm-trusted-firmware: add upstream version 2.2
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
X-List-Received-Date: Thu, 23 Jan 2020 22:10:34 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 1/23/20 4:05 PM, Denys Dmytriyenko wrote:
> On Thu, Jan 23, 2020 at 04:43:23PM -0500, Bruce Ashfield wrote:
>> On Thu, Jan 23, 2020 at 4:00 PM Denys Dmytriyenko <denis@denix.org> wrote:
>>> From: Denys Dmytriyenko <denys@ti.com>
>>>
>>> Many BSPs require ARM Trusted Firmware (also known as Trusted Firmware-A).
>>> To avoid duplicating efforts of adding very similar recipes to BSP layers,
>>> add an upstream reference implementation to openembedded-core, which can be
>>> customized by BSPs, if needed.
>> Isn't this one of the things that Jon Mason is trying to
>> standardize/support in meta-arm ?
>>
>> http://git.yoctoproject.org/cgit/cgit.cgi/meta-arm/tree/meta-arm/recipes-bsp/trusted-firmware-a
> Ah, interesting, somehow I totally missed that one! :)
>
> What triggered this submission is that we have our own variant in meta-ti and
> Joshua Watt was adding a very similar one to meta-rockchip:
> https://lists.yoctoproject.org/g/yocto/topic/70054501#48116

FWIW, variants of this recipe crop up in pretty much every ARM-based BSP 
layer (e.g. 
https://github.com/alistair23/meta-pine64/blob/master/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_2.1.bb); 
it seems common enough that a base recipe that each BSP layer can 
bbappend to suite their needs seems like it would be useful?

>
>
>> What's the delta between the two ?
> Hmm, that one uses older 2.1 version. Other than that, I'll need to test to
> see if it's as adaptable and expandable as our more simplistic variants...
>

