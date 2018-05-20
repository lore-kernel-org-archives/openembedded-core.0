Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id 300C66E5CB
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 May 2018 14:59:19 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id v24-v6so7280982plo.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 May 2018 07:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=qbZ8dnqZFjc+gxF2bVD0MeRHVuAvo58wVihG22d8CME=;
	b=GhOjv4P6QYvoqjpj/ByxNMUKaJl2My4X0xIjnKXhfzsRGDgjRuzZHpAANKeIedj58p
	0PsvhpUdJNxqHOT62jRAU5ZrjssDN6OiMHbU/D0fU78B6JvzOpLcl1ZycHrl27Tyf9uT
	eXWTsNEdRv+sH71s/PKOQmv/lh8gcoc5e8gHDsgCUL4kEEjPIRgSjT7VHLYMtpLcjR9q
	OV8WF+Un++xDyKYfJkvwoqtXX/zxkTQacYxGr9QGCbdMl/8gpfmk8R4WkIC0Qs/0Bu1+
	+KOPS3QW9Vy83qlnk+IR3+ayex28Aba8s2+CfC3EkAZh+2r75WMsugZR66oLQhEBTT2e
	2lTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=qbZ8dnqZFjc+gxF2bVD0MeRHVuAvo58wVihG22d8CME=;
	b=HUOQT7UfpQ5Bt4PJZteNZs4VQ5//hkjAWmukpMsaW76JbMn5JSbTJuhEc8iPfXFKWb
	kS7LTWmKu325CdbyjT4A2rCjoKImkS7LCbziFLxGV1x68beadGW2OgoSoVCloK9xRqaX
	J1KWG/asdF/rV5b13WqTu61zU06pzmyX8E6HR/0kTBFICvD7Lz/kErTVBkqufGMW5iJx
	RXjyYz4D2BUk+j9Mvy+PbloS0gtRuX7HkKq9v1RX+9hJvo9M0VYhjuNVjx7/MaShJ6XQ
	RkRwTqPdw8bix31tts5Q7AHsZUUIn5piboPbnHPt7t+ddXtSSH/9MlMuP2AA3vQZGnYH
	dS+A==
X-Gm-Message-State: ALKqPwchzvF26r2dr007PhXgxr9BuZIgF1IQUcd9csOKy68+xFJmCD/I
	ONxGfiUGF5lnEpOHzH1kXbvxEA==
X-Google-Smtp-Source: AB8JxZql53vEHPUIFcGnqUCDtbzNtF+P3PYaNlTs7NCiGjcs+4uIR4YJ/lTbePx1HT+dtcN6IJqIuQ==
X-Received: by 2002:a17:902:708a:: with SMTP id
	z10-v6mr16438595plk.283.1526828360850; 
	Sun, 20 May 2018 07:59:20 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1184:292e:9ff2:c3a4:d8d5?
	([2601:202:4000:1184:292e:9ff2:c3a4:d8d5])
	by smtp.gmail.com with ESMTPSA id
	o70-v6sm20967245pfo.49.2018.05.20.07.59.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 May 2018 07:59:20 -0700 (PDT)
To: Denys Dmytriyenko <denis@denix.org>, Khem Raj <raj.khem@gmail.com>
References: <20180519162102.GL19965@denix.org>
	<CAMKF1srt3AbRBgdBZp2ya-VkWm1K6r8eywFbqr3nMFe7EqNuFw@mail.gmail.com>
	<20180519193341.GM19965@denix.org>
	<CAMKF1sqfpZhKJKjFoouGhpRbZEfJBqXJxmqunepAx2weVsQEnA@mail.gmail.com>
	<20180520005742.GN19965@denix.org>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <e718c04f-fbe8-4235-aae7-1c2a335498b4@gmail.com>
Date: Sun, 20 May 2018 07:59:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180520005742.GN19965@denix.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: GCC 9 Drops Support For Older ARM Microarchitecture Versions
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
X-List-Received-Date: Sun, 20 May 2018 14:59:20 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 05/19/2018 05:57 PM, Denys Dmytriyenko wrote:
> On Sat, May 19, 2018 at 02:26:13PM -0700, Khem Raj wrote:
>> On Sat, May 19, 2018 at 12:33 PM, Denys Dmytriyenko <denis@denix.org> wrote:
>>> On Sat, May 19, 2018 at 11:07:55AM -0700, Khem Raj wrote:
>>>> On Sat, May 19, 2018 at 9:21 AM, Denys Dmytriyenko <denis@denix.org> wrote:
>>>>> https://www.phoronix.com/scan.php?page=news_item&px=GCC-9-Dropping-Older-ARM
>>>>>
>>>>> Particularly, ARMv5 and ARMv5E are being dropped (but T and TE variants
>>>>> remain)
>>>>>
>>>>> Are there any concerns from OE community perspective?
>>>> From yocto project perspctive qemuarm which is emulating arm926ejs
>>>> with default tune armv5te is used.
>>>> so we are right at the trailing edge and wont be affected. However, I
>>>> know there were OE users who had
>>>> devices using other armv5 or v4 variants
>>>>
>>>> I have been suggesting to switch qemuarm to use armv7 based board
>>>> emulator for few years now.
>>>> may be this is the time to make that call for next YP release.
>>> Valid point about qemuarm, but see below.
>>>
>>>
>>>>> At least for binutils we needed this patch even for armv5te:
>>>>> http://cgit.openembedded.org/openembedded-core/tree/meta/recipes-devtools/binutils/binutils/0007-Add-the-armv5e-architecture-to-binutils.patch
>>>>>
>>>> this patch technically required to support one of OEs available tune
>>>> values. namely armv5e, we should be able to drop it.
>>> $ grep conf/machine meta/conf/machine/qemuarm.conf
>>> require conf/machine/include/qemu.inc
>>> require conf/machine/include/tune-arm926ejs.inc
>>> #require conf/machine/include/tune-arm1136jf-s.inc
>>>
>>> $ MACHINE=qemuarm bitbake virtual/kernel -e|grep -E '^DEFAULTTUNE=|^ARMPKGSFX_THUMB=|^TUNE_PKGARCH=|^TUNE_CCARGS='
>>> ARMPKGSFX_THUMB=""
>>> DEFAULTTUNE="armv5te"
>>> TUNE_CCARGS=" -march=armv5e -marm"
>>> TUNE_PKGARCH="armv5e"
>>>
>>>
>>> I have already tried binutils w/o that patch for arm926ejs/armv5te machine and
>>> it fails, because as you can see above, -march=armv5e is being passed...
>> What happens if you drop setting TUNE_CCARGS and  TUNE_PKGARCH ?
> From OE-Core?
>
> http://cgit.openembedded.org/openembedded-core/tree/meta/conf/machine/include/arm/arch-armv5.inc#n5
> http://cgit.openembedded.org/openembedded-core/tree/meta/conf/machine/include/arm/arch-arm.inc#n11
>
> From the README:
> A small set of ARM specific variables have been defined to allow 
> TUNE_PKGARCH to be automatically defined.  Optimized tunings must NOT 
> change the definiton of TUNE_PKGARCH.  TUNE_PKGACH_tune-<tune> will be 
> ignored.  The format of the package arch is enforced by the TUNE_PKGARCH
> default.  The format must be of the form:
> <armversion>[t][e][hf][b][-vfp][-neon]

Maybe a bug is in order and then we might be able to add it to the 2.6
planning?

Maybe a QEMU strategy for OE going forward may also be a topic.

- armin


