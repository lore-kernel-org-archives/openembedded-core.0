Return-Path: <sumit.garg@linaro.org>
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by mail.openembedded.org (Postfix) with ESMTP id E97787F7A3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 12:49:17 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id r14so18266139lfm.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 04:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=CKHuTg5kiW7hFBxHJrfbTbcqOQPz65FELd2hQ56F9Kw=;
	b=joAI9VEeLz8U7ZwRDnw2zKyd/SfYGITPWC3w/FLnplqofYLMr1AL57vExnMs3dmHYG
	wFbNV4sIEIkgG+Fu9Ggn6GzD5FcWPoHHqVZmvSzpNOeLY1qjGiOMzinJMfPgmkvaYOaB
	o3Ls6gkKOSKY151s07wdnhklFGI01x2ralVE6APMYG9fmxSxlNSIZ2utEULFlTNGFGo3
	ngkfmpHtZXdxi8XZp6XEbCw0F7aXC6LvBhUKLYYTTLCWa2pyuZkWLvwbA3ilpILr/5Mh
	KUtQn1jXuO3XpIwK+KCXnTOVih8aIsm5beru8+ia/4qXSji3lYePWNxICBuoZGsrdUnk
	I3Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=CKHuTg5kiW7hFBxHJrfbTbcqOQPz65FELd2hQ56F9Kw=;
	b=LXC/7QBghiKoFpEwL9uKBSDtHtf45n9C7szlwlx2x8XWTReUgcfpDvh0FVpFsl/6wc
	LH7ORT5diMeOQJ0+prf1t4+BQamqQBIAocbtXVomr2iVKgsS+qAe5CvvC/Pl2mzioqTm
	dLQ0ibKpXEVwYvV7biXN5yC9mqFYT3FhrIfW5NFjihMzZU40HISNeYAK/8uXbu2dlo0Z
	H1tM+D60XHdHDU+fyCm+be9vGeqqwEEwFCi0B6FFdg3COa257yr+wQayac0fI2Gphz8v
	qn4GskbpRcB1VBhlZaQToW0uUf1mUAxM0XkqIhjnGrUCjDWNvbUULe2czSA4RpotUlfZ
	q5+g==
X-Gm-Message-State: APjAAAXFiZUjzEQic11JO7jp0ZZfx9IUs22liqjqr3c9wXCTflfEzLoh
	E7lcxbtcWnhbUMW/2rUVKFoD3fRTT32i8go6FfoLJQ==
X-Google-Smtp-Source: APXvYqygH5O+03IYzOs4HgrRPctmmUiz5x8333OaVyR1MYbOuP9OtLHzoCgmEtJa7QFje6PT6LI4lLd/yLqieHRCqOQ=
X-Received: by 2002:a19:cb46:: with SMTP id b67mr5476309lfg.40.1579265358536; 
	Fri, 17 Jan 2020 04:49:18 -0800 (PST)
MIME-Version: 1.0
References: <1579244354-13596-1-git-send-email-sumit.garg@linaro.org>
	<b21d1a39c0c1e5585e72586ca806967bae37decf.camel@linuxfoundation.org>
	<CAFA6WYOm4a8_mqyNA+zkFHPznN10SyKb4atiCtmS=qabZzyM+A@mail.gmail.com>
	<CANNYZj9tcgw0KZeqZRQdL5etBdAEPP+S29S4YWkE94jhVQbLNw@mail.gmail.com>
In-Reply-To: <CANNYZj9tcgw0KZeqZRQdL5etBdAEPP+S29S4YWkE94jhVQbLNw@mail.gmail.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Fri, 17 Jan 2020 18:19:07 +0530
Message-ID: <CAFA6WYO-fHRo4e7aYr5V8QkNus6hB9=ZWjQ7snRRPEijU5oa6Q@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] core: recipes: fix some native tools dependencies
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
X-List-Received-Date: Fri, 17 Jan 2020 12:49:19 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, 17 Jan 2020 at 17:35, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> On Fri, 17 Jan 2020 at 12:55, Sumit Garg <sumit.garg@linaro.org> wrote:
>>
>> But looking at this failure again it seems like "autopoint" is
>> provided by gettext rather than autotools. So yes, I think you are
>> right and "xz-native" dependency should go in
>> meta/classes/gettext.bbclass instead as follows:
>>
>> diff --git a/meta/classes/gettext.bbclass b/meta/classes/gettext.bbclass
>> index be2ef3b311..443c9c4cb0 100644
>> --- a/meta/classes/gettext.bbclass
>> +++ b/meta/classes/gettext.bbclass
>> @@ -2,8 +2,8 @@ def gettext_dependencies(d):
>>      if d.getVar('INHIBIT_DEFAULT_DEPS') and not oe.utils.inherits(d,
>> 'cross-canadian'):
>>          return ""
>>      if d.getVar('USE_NLS') == 'no':
>> -        return "gettext-minimal-native"
>> -    return "gettext-native"
>> +        return "gettext-minimal-native xz-native"
>> +    return "gettext-native xz-native"
>
>
> I don't believe this is right either, at least not for the master branch. Autopoint is specifically excluded for all autotools-based recipes; psmisc used to be an exception to that, but no longer is with the latest master branch and latest gettext.
>

How would you like to handle it on stable branches for recipes (like
psmisc) which depends on autopoint?

-Sumit

> Alex

