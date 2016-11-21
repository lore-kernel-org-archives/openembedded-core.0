Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3BAF260557
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Nov 2016 16:36:52 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id w194so24901156vkw.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Nov 2016 08:36:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=PHYK2MhY3fnz7unqi+T0UxdX15FgDXsPrN190IIYDgI=;
	b=XAFsBkUJH0wbofheWRJ/v1mQwlzY4herbfKmgNyeQASnSdo5YaaF601UKAj4nSlJ3v
	C3KRr/9be1WYDDOy7BgZEcqE5sPha3yzSc8vuVo95ItRombTkIKTjaobAPP7ObaOcmGq
	fL70MPQR0lmYXl1c67P8cqigtEDDet9OfF+Dg28xKmKeHA9rRRVZGohcfY0sc96Yv/X/
	MfS6ORlOBGAitR9YnqNyXDIAu6SB/fhqC/Ni90UQTxeV/tpwZhO8TTtPEhstX9sN09Fv
	BnkrjS4s78RCCaGg8aB03PJ2U+A1vH8z/WxuQNuJjB2aZ5VMxa6UNvui9Tt1Q2JPbch/
	xqzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=PHYK2MhY3fnz7unqi+T0UxdX15FgDXsPrN190IIYDgI=;
	b=gWhGx3MUyTdRqcC3b2Aq/547fc0gsCMJR4mUxw9DYul59y5gHCnhaBDJkiVcep9gVj
	oYQS0XoYWFbnS9P9UxlCoiSPbut5iIE7yJTUf26frgdACrgGlwP8ymBIq2aCReLdf1PG
	H7TFgTZjh6xeTLsCOo9KzvQpSImgrwzT1bCPIsEZj3+30tOdBkZNw+CwKlBpClRkAIb/
	2T0sY0q3RwanHVkaeVpHkZIhMu2K9baedibQBbPT6NcU/cu3Pt7sC7PSTQA0FIvwfNsO
	PlvA24wjZA43Lian7KhTr70ADdrnZPvbQihiwVPw7xAOyUSI4QWMR/C5gFbAlhksWlj2
	xcBg==
X-Gm-Message-State: AKaTC00GEUtp7ShqS3KBcroJLHQTEzkn0ZCE3uqPttqSXSKHJbdT3Smx7va2vVbGEMFJSGnyFU5euopTh5Lt+A==
X-Received: by 10.31.108.144 with SMTP id j16mr5657206vki.93.1479746213622;
	Mon, 21 Nov 2016 08:36:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.5.136 with HTTP; Mon, 21 Nov 2016 08:36:23 -0800 (PST)
In-Reply-To: <000601d243b5$e526ea00$af74be00$@neuf.fr>
References: <1479643823-11675-1-git-send-email-herve.jourdain@neuf.fr>
	<1479643823-11675-2-git-send-email-herve.jourdain@neuf.fr>
	<CAMKF1sq6KOibu2XqE4RDsP7_C-DkFBjp-7rBHmsFz--wjdcyMQ@mail.gmail.com>
	<000601d243b5$e526ea00$af74be00$@neuf.fr>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 21 Nov 2016 08:36:23 -0800
Message-ID: <CAMKF1spUNQ_tZkX_1GmxRq=LqCLSD8MhgBdZK1Ze39UYkEh4fg@mail.gmail.com>
To: Herve Jourdain <herve.jourdain@neuf.fr>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 1/3] arch-arm64.inc: include arch-armv7ve instead of arch-armv7a
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
X-List-Received-Date: Mon, 21 Nov 2016 16:36:53 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Nov 20, 2016 at 9:12 PM, Herve Jourdain <herve.jourdain@neuf.fr> wrote:
> Hi Khem,
>
> Do you want me to resubmit the patch with a better commit message?
> Or do you want to submit yours instead?
> I'm fine either way.

Dont worry I will submit the one in my tree and add your sign off. if
you test that out.

>
> Herve
>
> -----Original Message-----
> From: Khem Raj [mailto:raj.khem@gmail.com]
> Sent: dimanche 20 novembre 2016 20:35
> To: Herve Jourdain <herve.jourdain@neuf.fr>
> Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
> Subject: Re: [OE-core] [oe-core][PATCH v3 1/3] arch-arm64.inc: include arch-armv7ve instead of arch-armv7a
>
> On Sun, Nov 20, 2016 at 4:10 AM, Herve Jourdain <herve.jourdain@neuf.fr> wrote:
>> Signed-off-by: Herve Jourdain <herve.jourdain@neuf.fr>
>> ---
>>  meta/conf/machine/include/arm/arch-arm64.inc | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/conf/machine/include/arm/arch-arm64.inc b/meta/conf/machine/include/arm/arch-arm64.inc
>> index 9440698..9eeffac 100644
>> --- a/meta/conf/machine/include/arm/arch-arm64.inc
>> +++ b/meta/conf/machine/include/arm/arch-arm64.inc
>> @@ -1,6 +1,6 @@
>>  DEFAULTTUNE ?= "aarch64"
>>
>> -require conf/machine/include/arm/arch-armv7a.inc
>> +require conf/machine/include/arm/arch-armv7ve.inc
>
> This is ok. However a better commit message would be justified.
> I have similar patch see
>
> https://github.com/kraj/openembedded-core/commit/8ece89ac164062601d3418576d51434c69654e28
>
>>
>>  TUNEVALID[aarch64] = "Enable instructions for aarch64"
>>
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

