Return-Path: <lrannou@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 605BDC636D4
	for <webhook@archiver.kernel.org>; Thu,  2 Feb 2023 13:58:26 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.14963.1675346301491161358
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Feb 2023 05:58:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20210112.gappssmtp.com header.s=20210112 header.b=c1lW1GnI;
 spf=pass (domain: baylibre.com, ip: 209.85.221.43, mailfrom: lrannou@baylibre.com)
Received: by mail-wr1-f43.google.com with SMTP id t7so1792461wrp.5
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Feb 2023 05:58:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EnzZ+aWhyI0j2CWPD04KY0UsuRfGMLzM3aj42PqvhGw=;
        b=c1lW1GnIPSrM7t6IwuYrPKrBy54LxwkmjjOm4l/UAFRHetntntx59h+PEjIIPN/mOn
         Rl1l2VoLfdCNAWbxlvAmJmtadx/WrnLcSX9+O3xuXfE7L/hugXB8RD2YDnAIRBnCWdEr
         R6GRCjuSQPZTKnvcWjS59hzKt9OXvPw+kRLjxWiGcxzeDWWvM2K22nu/iawa4OszCErT
         ElMYUOaHHg1XMrkeTQlYemAP/EOHOFXBJqkxxF5lyyQyVWwvHd1lYxwcf/C1umfgsVvR
         f/k554eNisA3qq+ooC7NQKzBfmTepd8atASErojDfI1i78aS1U0yDnxFI09Tgx2x7C2y
         pSFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EnzZ+aWhyI0j2CWPD04KY0UsuRfGMLzM3aj42PqvhGw=;
        b=OwPqJJzRIoz7Lvfo/wQ/6Ruy9TQW/D8hBZ+g/31WDx8BwXHYXudfl/dTD3yH4ZLLKZ
         gfRxjgwqVvnUhUyyj9HcxPzNBSPjuw9l93cdJInH9ia979mRnIj/Tlvekz2yl2EqpDH0
         aNH4GBcTbh/SIx5PEMTn8MH2QfWVjLyLZ6ji67wieKezRyG5UTTpOUy7fJWaUiOzppor
         2OZtdfBYZN5ld6cCBMuQUOHTV2RFbGw1NmgegRFjiSb0GRANrpHPpI9c6z/ZlQw+74DC
         ji9ZBAglQiTjXtC2ktAZp8y9Gowu2StITVhqol1hzlRgqYz6jjp9icQWoLGxD54dFAAL
         EYiQ==
X-Gm-Message-State: AO0yUKUQ4TsnrvWIqoF75QWgJcV0MPCfyCADsfcjdRRuEpnTRpa6tCnM
	O+wzDIzDzPzQYBzvWjy/xswhag==
X-Google-Smtp-Source: AK7set8GqDX1GrVzgb6FUFYKXH9l8bnKrimqrtkHt4ey/itbXlZgZ72/Mxel5LgydktwBv31DTTUuA==
X-Received: by 2002:adf:e5c9:0:b0:2bf:ae1e:1080 with SMTP id a9-20020adfe5c9000000b002bfae1e1080mr5843727wrn.21.1675346299390;
        Thu, 02 Feb 2023 05:58:19 -0800 (PST)
Received: from ?IPV6:2001:912:1ac0:700::635? ([2001:912:1ac0:700::635])
        by smtp.gmail.com with ESMTPSA id x13-20020adfdccd000000b002bbddb89c71sm19915588wrm.67.2023.02.02.05.58.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 05:58:18 -0800 (PST)
Message-ID: <52b723c5-e5b4-54b8-7cbf-f50649a0b746@baylibre.com>
Date: Thu, 2 Feb 2023 14:58:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [OE-core] [PATCH v2] oeqa/selftest/locales: Create selftest for
 locales generation
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
Cc: "khilman@baylibre.com" <khilman@baylibre.com>
References: <20230127153344.2868589-1-lrannou@baylibre.com>
 <b3320afb6afb6508d5f4d0f3ceb75e87e97ed450.camel@linuxfoundation.org>
 <92bff1e0-aa88-c713-049f-51f074569a55@baylibre.com>
 <913abc23f1ba2691f7c676b182b1ec0303e5d30d.camel@linuxfoundation.org>
 <1749af1e-dce3-ec14-32a1-fe5a50848f25@baylibre.com>
 <845d6037af51cb2ba78a6d139f5a27301a0a77a0.camel@linuxfoundation.org>
From: Louis Rannou <lrannou@baylibre.com>
In-Reply-To: <845d6037af51cb2ba78a6d139f5a27301a0a77a0.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Feb 2023 13:58:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176698


On 02/02/2023 11:53, Richard Purdie wrote:
> On Thu, 2023-02-02 at 11:41 +0100, Louis Rannou wrote:
>> On 01/02/2023 18:57, Richard Purdie wrote:
>>> On Wed, 2023-02-01 at 16:02 +0100, Louis Rannou wrote:
>>>
>>>
>>> I was able to take a quick look at this. The locale generation on
>>> target is broken, it throws errors upon boot. I was able to make it
>>> work with this patch:
>>>
>>> diff --git a/meta/recipes-core/glibc/glibc-locale.inc b/meta/recipes-core/glibc/glibc-locale.inc
>>> index 7f70b3ca4f..c39007b573 100644
>>> --- a/meta/recipes-core/glibc/glibc-locale.inc
>>> +++ b/meta/recipes-core/glibc/glibc-locale.inc
>>> @@ -60,7 +60,7 @@ DESCRIPTION:localedef = "glibc: compile locale definition files"
>>>    # FILES:glibc-gconv will not be automatically extended in multilib.
>>>    # Explicitly add ${MLPREFIX} for FILES:glibc-gconv.
>>>    FILES:${MLPREFIX}glibc-gconv = "${libdir}/gconv/*"
>>> -FILES:localedef = "${bindir}/localedef"
>>> +FILES:localedef = "${bindir}/localedef ${libdir}/locale"
>>>    
>>>    LOCALETREESRC = "${COMPONENTS_DIR}/${PACKAGE_ARCH}/glibc-stash-locale"
>>>    
>>> @@ -87,6 +87,7 @@ do_install() {
>>>           find ${D}${libdir} -type d -empty -delete
>>>           copy_locale_files ${datadir}/locale 0644
>>>           install -m 0644 ${LOCALETREESRC}/SUPPORTED ${WORKDIR}/SUPPORTED
>>> +       install -d ${D}${libdir}/locale
>>>    }
>>>    
>>>    inherit libc-package
>>>
>>> could you see if the same test will now work with that patch applied?
>>> I'm happy to have the basic test but if we can fix this and stop it
>>> regressing that would be even better.
>>
>> The patch does not change the result. I have actually nothing in the
>> image/usr/lib/locale directory.
> 
> Testing locally, if I don't have the patch and "runqemu core-image-
> minimal snapshot kvm", I see errors about locale generation failing
> during first boot as the directory isn't present.
> 
> If I add the patch and then boot the image, I see the locale generation
> happening at first boot. If I then run the locale commands, I can see
> the locales present.

I wonder which package do that, because this is not something I see on 
my qemu. I run a kirkstone qemuarm on poky. Perhaps I need something 
more recent.

> 
>> I am not sure to understand... If I add to my image the packages
>> glibc-localedata-fr-fr and glibc-charmap-utf-8, then I have something in
>> /usr/share/i18n/locales and /usr/share/i18n/charmaps, and then I can
>> generate the locales with `localedef -c -i fr_FR -f UTF-8 fr_FR`
>>
>> In the end, I believe this is correct that I have nothing in
>> {libdir}/locale, but perhaps the settings IMAGE_LINGUAS (or
>> GLIBC_GENERATE_LOCALES ?) should specify a rdepend to the locale/charmap
>> packages, so the locales would exist in the image, but would not be
>> generated at build.
> 
> The locale generation can happen at build time or it can happen at
> first boot on the final target. For the second test case, the locales
> will only appear during the boot process.
> 
> I've merged your patch with the first test case, thanks! I did tweak
> the comment message to match that it is just one test so far. Thanks
> for getting us that far, it is great to be adding tests around this.

Thank you ! It's cool if I can help more on this. As soon as I can 
reproduce what you have.

Regards
Louis

