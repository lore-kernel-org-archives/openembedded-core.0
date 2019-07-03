Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by mail.openembedded.org (Postfix) with ESMTP id A563C7E18C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jul 2019 16:48:42 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id 16so3162982ljv.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Jul 2019 09:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=irRsnegpga4DGEnVFd948zzSOfJw6I/at6MmGXB9AUM=;
	b=HC0wBG4zNy2bK3kYY01lLmDI1RWtFNteF71pFW0e7bgBC6qV+IJ4gvtRXeSJEe9iSB
	XZdE9vb4jhTtX0z+qT+OIL3gDhIAp2cREc+hz0y9GD3C7YqrJ9AbrJxtC1p6KtycH7w1
	aKafgglrhdqZ5r2LP3UtA+FTzMJYbpUGLwm4kONJd0MXNtYUnfMfpJRqcrp9FefXMY86
	o344wA5MDcbcze4xDMsTk/OGD4EGZ8gbD91iJcvhYAmirUi1C/GI/M39ATbg7FDtiLa+
	ezMKUgJz3YGQLsVchUY3tRKEPOzpHVBey+brltVEX7FghTufhzehYgnG7PLqmaKtTHdq
	M15g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=irRsnegpga4DGEnVFd948zzSOfJw6I/at6MmGXB9AUM=;
	b=C4H+deTjy8iforyuYu9Te1Zdnyo10y4fYi7YvFKLv8VmESHOghvJFd/OzZISBuaPKn
	wPsjS410hJP/2BmRxwm21d7odqSUSQczAaflt3LTTYSv8mLMRJe82+nV8ViGnybJI+SA
	pZo6j7G6AI4AQeShppM1xHaW7On/zywcSR+lESlgcsslPbzXofmseHTsWWuLZopkj/tW
	WjHrKiiaqJD+csw4q9+hBHLDGS+xsLygwM7Ey2cGbpJ7T9SEkgTBPNTXcmhNpy8iMxoU
	PrMbw8roecnegvgFRfn2tepGs0xdnreN9IhIHZk26v60DetAo//mquw4pwZtHD8EYtRU
	Rvlw==
X-Gm-Message-State: APjAAAX699y4pVo+NaY1lXNBsGQxkO+jmNFNVPEmKKJWIabFojvjdXTK
	1GZw4cLxRVwYafBvGooK9SXdxWVlTa0=
X-Google-Smtp-Source: APXvYqwyi65KXP8V9oVqMH5P4bsRgcmxXoF41SrA8S2QhG0hDmGHDrOsf1FQ6P+mquns2TiSL7uuaQ==
X-Received: by 2002:a2e:4794:: with SMTP id
	u142mr22041902lja.222.1562172522702; 
	Wed, 03 Jul 2019 09:48:42 -0700 (PDT)
Received: from [192.168.0.8] (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id 25sm573461ljn.62.2019.07.03.09.48.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Jul 2019 09:48:42 -0700 (PDT)
To: Adrian Bunk <bunk@stusta.de>
References: <20190702202909.3501-1-open.source@oleksandr-kravchuk.com>
	<20190703163516.GA13618@localhost>
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Message-ID: <c88c1a77-4380-1012-e61e-beb99cbdb9db@oleksandr-kravchuk.com>
Date: Wed, 3 Jul 2019 18:48:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190703163516.GA13618@localhost>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3] ifupdown: update to 0.8.22
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
X-List-Received-Date: Wed, 03 Jul 2019 16:48:42 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Sure. Technically, package is musl incompatible/not ready.

This trivial patch allows us to build ifupdown with musl.

On 03/07/2019 18:35, Adrian Bunk wrote:
> On Tue, Jul 02, 2019 at 10:29:09PM +0200, Oleksandr Kravchuk wrote:
>> ...
>> ++#if !defined(FNM_EXTMATCH)
>> ++#define FNM_EXTMATCH 0
>> ++#endif
>> ...
> This fixes the musl build, but the code will misbehave on musl.
>
> cu
> Adrian
>

