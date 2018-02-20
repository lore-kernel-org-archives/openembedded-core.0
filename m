Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f193.google.com (mail-io0-f193.google.com
	[209.85.223.193])
	by mail.openembedded.org (Postfix) with ESMTP id 7568A6FEF5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Feb 2018 10:10:37 +0000 (UTC)
Received: by mail-io0-f193.google.com with SMTP id t126so14316863iof.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Feb 2018 02:10:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=rV+YJZ/ODjKBUekDrCOT+2dP1Iz8dylOcNsG34/VHm0=;
	b=T6R2DXtU3YLgolLspRdgWZQ+fgbYs6q41SsuVgkrluXc/H4VTzNYUraphDDqEZ4d3F
	OKPx3mj33XwvWQUhS4LKgzlfdXD2MHYxG0zsxGmz4dtUGsHPhoxCM3ei2Y24fxbT1Mw3
	At8Rg1Cs6j75TMz/wS2ZkIExfPFM+7+gf2wd7r8Tt8j+RwrypkqYTQKYLiq8vSt8mTeo
	iKvdIVsTm4eNau6ESLXU+yTN6uvPxowvlxIDNUpJJcn29fBf63xBhJ+TgrEEpl5Lc93i
	RbkLAVf+MXNH5EU+gBj9wTfzjxK7AxYLKAQgd2IPHifYClxwPjZajLmqKPY9ZbgxBRlC
	fACw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=rV+YJZ/ODjKBUekDrCOT+2dP1Iz8dylOcNsG34/VHm0=;
	b=ERWsnNtqc4AC82NPuT0PNrMxMta1/YDjlT/ik40oaA8vgQdE+lecnNnsV6drD3MhxZ
	b0wG2osVpd97yZ6L/6rIRZ9z/UJkcmiLuct9UvNcZnHDvdw6+2o/R8tkC183pgxHY7Ir
	FvX8ZDQ1uuJu84jsaE1iETsOWfE27LB7rTRsDqsOAiMNrM+yIEx0/ahU5Evk+lYcWqoA
	RsHHiuoEmgaX3wW9wUYnD+5yNB10UB/cglbyNBLWHSS7Ncq/UR3QomMBT31P2/K7CsOA
	fGagx9vL5ndqBi9vX1tjMS/vRtlFY9f+dV+kOUcMH+J0B31SNhfobXDtjAMntSWqRN3S
	4K4A==
X-Gm-Message-State: APf1xPBVoBEig0gYd+DSvyTPuDup7kPPZwqO3EabbFtJ3OTm0Bd10l6/
	B4m8uyv1/df2+GX8LtSvatWuEt3I
X-Google-Smtp-Source: AH8x2240Yix44SvFKHqBsKz43XcWzUuVuS6be3tOPBCbNoHnKD9jmFKS8a+zp5alSU8Gfd2rfKmuQQ==
X-Received: by 10.107.150.211 with SMTP id y202mr22951904iod.10.1519121438144; 
	Tue, 20 Feb 2018 02:10:38 -0800 (PST)
Received: from hermes.local ([2601:646:8880:466c:a565:c31b:dc80:af0d])
	by smtp.gmail.com with ESMTPSA id
	137sm22496056itl.32.2018.02.20.02.10.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 20 Feb 2018 02:10:37 -0800 (PST)
To: Denys Dmytriyenko <denis@denix.org>,
	Otavio Salvador <otavio.salvador@ossystems.com.br>
References: <1519084455-3915-1-git-send-email-denis@denix.org>
	<CAP9ODKq7YyqaapLxxOrPo6WoNf6dTFpxkvQh1pF+yqJQxGA7jQ@mail.gmail.com>
	<20180220012001.GZ2786@denix.org>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <8d340a29-2016-55fa-0fd2-9847e6f9e62b@gmail.com>
Date: Tue, 20 Feb 2018 02:10:35 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:59.0)
	Gecko/20100101 Thunderbird/59.0
MIME-Version: 1.0
In-Reply-To: <20180220012001.GZ2786@denix.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Denys Dmytriyenko <denys@ti.com>
Subject: Re: [PATCH] kernel.bbclass: explicitly depend on bison-native for deterministic builds
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
X-List-Received-Date: Tue, 20 Feb 2018 10:10:37 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 2/19/18 5:20 PM, Denys Dmytriyenko wrote:
> On Mon, Feb 19, 2018 at 09:36:22PM -0300, Otavio Salvador wrote:
>> On Mon, Feb 19, 2018 at 8:54 PM, Denys Dmytriyenko <denis@denix.org> wrote:
>>> From: Denys Dmytriyenko <denys@ti.com>
>>>
>>> Explicitly depend on bison-native for deterministic builds, as it is required
>>> for the build:
>>>
>>> |   HOSTCC  scripts/basic/fixdep
>>> |   GEN     ./Makefile
>>> |   HOSTCC  scripts/kconfig/conf.o
>>> |   YACC    scripts/kconfig/zconf.tab.c
>>> | /bin/sh: bison: command not found
>>> | scripts/Makefile.lib:217: recipe for target 'scripts/kconfig/zconf.tab.c' failed
>>>
>>> In most cases, this dependency comes indirectly via toolchain dependencies,
>>> specifically binutils-cross, which pulls bison-native. Different setups,
>>> such as with external toolchain, would expose this problem, since correct
>>> dependency is not marked explicitly.
>>>
>>> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>>> ---
>>> I'm seeing this now on 4.16-rc2 with external toolchain.
>>
>> I am not against the addition but in fact, it is because 4.16 stopped
>> of using pre-generated files and now requires bison to be available.
> 
> Ok, good, I was wondering why I didn't see it before 4.16...
> 
> 
>> I am unsure it ought to be on kernel.bbclass at this moment.
> 
> Why not? Because it's 4.16+ specific?
> 
> By default bison-native dependency gets added implicitly when built with the
> toolchain from oe-core, so this doesn't add any extra dependencies, only makes
> it explicit.
> 
it will be overcompensating for < 4.16 kernel recipes where this 
dependency is not needed. it might be a legit dependency for another 
component, that doesn't stage this package in kernel recipe-specific 
sysroot but this change will do that. So its not completely innocent 
change.

