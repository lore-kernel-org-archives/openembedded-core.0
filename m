Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by mail.openembedded.org (Postfix) with ESMTP id 67FC27F8C2
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2019 16:42:50 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id y3so22650721ljj.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Nov 2019 08:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=ffu2O9EFF1CmiolbkWF8DWFyj8ENC6U9wdX28L0z+qs=;
	b=eLX87lDoYnHVGjAyJHotG95gnlv9oaXccvNbtBUzs5qxcwZ7TsCepWQBxGePfDyBrK
	73z+hZLZja5XseEz5hPKhpGoLIONGBQJJlziSdS7SO/UIpQtMC701EKzpZMPoUQP/EdC
	hKn4kaidZt1Q5qqntI7rYbui9NPrx7f07InSBW9/x0r/Yk7vV0/Gc3x60OGefBaGcAim
	gUbaueeqjzKXMaEjl1bUm+wukugmZARmL/BYAmwyu5yPBEXSWyc0HK0UDDUH3FxIVnK9
	VxogGUU1a/25iLF0oMesbhK7ZoEU/gFDDxlS2q4SzcVu2IWR/SgSBF+Ys0D1r0IHuEic
	+pBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=ffu2O9EFF1CmiolbkWF8DWFyj8ENC6U9wdX28L0z+qs=;
	b=Cu5UL3q1DKNC4L0jkwfVu00Iix0HYS5Z5Tm7Gn+1ruihWJhpg7DP2AZCyr6LAXYJ1A
	pVC33qWGzPU6DvTBJgpaPqDWCx53/Yxye785LtF9UnSxaR4wonOlMw3K3QrWbT9Fjffw
	gtpoMncwd7roK/0AtB6VJVZXoaawK79VJKQkWqasZ5h0RPIEV1SrJY+DOC1AUrmcF8/h
	RjLkN8UA7FXU33xUU0PB57tXySxPdnWyp3na7vXLH7U9mUUpwVy0WdxTLL7IXMGXvmPV
	hXTtM4ooqAe3mikgAALCyIslED22x82KEF5E/OXPgT9JuvGd2Bg6kRJb9Kd7HcHit6VG
	ZBOw==
X-Gm-Message-State: APjAAAXS385lgpXae5GXgyhUHiNb4yA9aqEPQbZqSTKjUYcJ48R0Cfu3
	jY9gHom5KdFMZL+Jp+HNdVz6BD0GkXs=
X-Google-Smtp-Source: APXvYqyBW1zwEJuZMVrmHwu/G4sfFVWF8OXri7b44rPuEgHBhU8kBeAKOm3ADfrof5tacM6/2wX8YQ==
X-Received: by 2002:a2e:7310:: with SMTP id o16mr21413336ljc.210.1572972170534;
	Tue, 05 Nov 2019 08:42:50 -0800 (PST)
Received: from [192.168.0.8] (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
	by smtp.gmail.com with ESMTPSA id
	k19sm10169587ljg.18.2019.11.05.08.42.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Nov 2019 08:42:49 -0800 (PST)
To: Ross Burton <ross.burton@intel.com>, Khem Raj <raj.khem@gmail.com>
References: <20191031172303.31664-1-open.source@oleksandr-kravchuk.com>
	<CAMKF1sraV5pEF9UanBy3Rj7mQKs33Ke2Sr_+28ewDrgaJZ43TQ@mail.gmail.com>
	<eeb0831a-bca5-55c8-2ee1-6586684d774b@intel.com>
	<CAMKF1sr7xPY4gctD88cP3U3-_h9RTa8eUQ6Vs2en-yeYEEc0=g@mail.gmail.com>
	<32625cc5-08bf-bb71-39f1-52e8021fe776@intel.com>
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Message-ID: <24326050-4c07-a0cf-a42a-93a98a544b02@oleksandr-kravchuk.com>
Date: Tue, 5 Nov 2019 17:42:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <32625cc5-08bf-bb71-39f1-52e8021fe776@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ell: update to 0.26
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
X-List-Received-Date: Tue, 05 Nov 2019 16:42:50 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 05/11/2019 16:42, Ross Burton wrote:
> On 05/11/2019 15:30, Khem Raj wrote:
>>
>>
>> On Tue, Nov 5, 2019 at 2:39 AM Ross Burton <ross.burton@intel.com
>> <mailto:ross.burton@intel.com>> wrote:
>>
>>     On 04/11/2019 23:25, Khem Raj wrote:
>>      > This has API changes that will break iwd
>>
>>     What version of iwd will break?  There's a 0.23 upgrade in flight
>> and a
>>     1.0 upgrade incoming right?
>>
>>
>> 1.0 is fine with this version all prior versions will break
>
> Elephant in the room: is iwd feature complete enough to replace
> wpa_supplicant?
>
> Ross
Depends on the use-case, I guess, but iwd has all the most widely used
features and project declares 1.0 to be stable version.

