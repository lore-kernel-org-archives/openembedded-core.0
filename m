Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	by mail.openembedded.org (Postfix) with ESMTP id 08E2B7D00C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Apr 2019 15:54:18 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id y18so6684631lfe.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Apr 2019 08:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=XKSYNjyZGF4HCT0HRKsfq8UuFjF/L7m5xbHJSqVh0LA=;
	b=lp/IgR2vFkNgFxlQ4z030VLX9Hb3pPDzqhQVc7eZNbh4ooXjyV5l+cmb4EJYaO/A3Z
	U9i/gVJDwRmBSXcYmydAvRufs540QoUFTjGyJ3YNyE56SoYxHLqzjizbRsyHRuICUt5C
	ULH391tMDBWgUlMNB10+sB17ehCMg0XxS6DspgXxZtL51i4gMRDmP2wJaB/hOn3GjHXl
	8ubbVniU9zjyzJRgdFHYuzW8hCKK82guPzLABg6E9z9fRGLh3XTUavQ4Wh3tn5y97HGV
	jn8ASoN5DxZqSTT/onNh70DY/SHDtDtHGu5HJIk2A5rtdZLIX/KeYNkWNIa+RAcvpo/Y
	bpaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=XKSYNjyZGF4HCT0HRKsfq8UuFjF/L7m5xbHJSqVh0LA=;
	b=dDrEa34V9WfSQRe941rxmPzhDWhdIPP/8yOAe86ZUaAyMuQhr74h/9y5UMthWvTNZS
	bE+xjtuGpAW2Dfoonga0+ua9RdwyCiT7X4Qy99MPUf38sSGa0uAZVexoQDrePAIYEMHq
	Aqb7lNB9t8Qjbot1PHa2IVk199XzADf87ljXZk5RMdOMQdAtvkGaemH81V3nCz5weP8b
	YILikWDKsVfrrkM+neFfWUvjEmzkuCbL8fjq9WADWdZIjdZoubXWvqnk4fP+PiOxj4yo
	J8kY2chqgJq+NBqYJkPIHQEhEVLfkAV5KSelyl5OdyRZxjCi9+5vQecWIEWY3f4gaeLc
	lUuw==
X-Gm-Message-State: APjAAAWLE18dfe7y+9rpf34kev8MDvnXWPqPcaC7rkBdxRzKSS6yNeEE
	XKmDTc7CwD4cTZ4aBAK/3WazaIETELc=
X-Google-Smtp-Source: APXvYqzdwEONw+EvQuHFA7MjTLrsTu+QwST7tBTovwY6H94AA4EFr0ih2E0jvw/2hj/KS2MTdFP3gQ==
X-Received: by 2002:a19:c018:: with SMTP id q24mr11099965lff.38.1554134059390; 
	Mon, 01 Apr 2019 08:54:19 -0700 (PDT)
Received: from [192.168.0.8] (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	a29sm1997194lfi.19.2019.04.01.08.54.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 01 Apr 2019 08:54:18 -0700 (PDT)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <20190330224908.2108-1-open.source@oleksandr-kravchuk.com>
	<25e816bb8ab33d104be3feec92080bda3ee60f99.camel@linuxfoundation.org>
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Message-ID: <09ee1ada-c90a-c04d-5032-dcd94e7bb864@oleksandr-kravchuk.com>
Date: Mon, 1 Apr 2019 17:54:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <25e816bb8ab33d104be3feec92080bda3ee60f99.camel@linuxfoundation.org>
Subject: Re: [PATCH] ofono: update to 1.28
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
X-List-Received-Date: Mon, 01 Apr 2019 15:54:19 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 01/04/2019 16:13, Richard Purdie wrote:
> On Sat, 2019-03-30 at 23:49 +0100, Oleksandr Kravchuk wrote:
>> Deleted patch has been mainstremaed.
>>
>> Changelog:
>> ver 1.28:
>> - Fix issue with SIM initialization and Gemalto modems.
>>
>> ver 1.27:
>> - Add support for handling SIMCom based SIM800 modems.
>> - Add support for SIM lock state with xmm7xxx modems.
>> - Add support for coexistence feature with xmm7xxx modems.
>>
>> ver 1.26:
>> - Fix issue with AT callback handler and GPRS.
>> - Fix issue with handling EUTRAN SMS only states.
>> - Fix issue with handling MBIM strings on big endian.
>> - Fix issue with missing char and SMS national language.
>> - Fix issue with unsolicited notifications of +CGAUTH/+CGDCONT.
>> - Add support for setting "none" authentication method.
>> - Add support for SMS and phonebook with xmm7xxx modems.
>> - Add support for voice features and Gemalto modems.
>> - Add support for Bengali and Gujrati SMS alphabets.
>> - Add support for 8 additional languages for GSM 7 bit
>> - Add support for using internal Embedded Linux library.
>>
>> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com
>> ---
>>  meta/recipes-connectivity/ofono/ofono.inc     |  7 ++---
>>  .../ofono/ofono/use-python3.patch             | 27 ---------------
>> ----
>>  meta/recipes-connectivity/ofono/ofono_1.25.bb |  9 -------
>>  meta/recipes-connectivity/ofono/ofono_1.28.bb |  8 ++++++
>>  4 files changed, 12 insertions(+), 39 deletions(-)
>>  delete mode 100644 meta/recipes-connectivity/ofono/ofono/use-
>> python3.patch
>>  delete mode 100644 meta/recipes-connectivity/ofono/ofono_1.25.bb
>>  create mode 100644 meta/recipes-connectivity/ofono/ofono_1.28.bb
>>
>> diff --git a/meta/recipes-connectivity/ofono/ofono.inc
>> b/meta/recipes-connectivity/ofono/ofono.inc
>> index 0472414b19..37772121f8 100644
>> --- a/meta/recipes-connectivity/ofono/ofono.inc
>> +++ b/meta/recipes-connectivity/ofono/ofono.inc
>> @@ -1,13 +1,14 @@
>>  HOMEPAGE = "http://www.ofono.org"
>> -SUMMARY  = "open source telephony"
>> -DESCRIPTION = "oFono is a stack for mobile telephony devices on
>> Linux. oFono supports speaking to telephony devices through specific
>> drivers, or with generic AT commands."
>> +SUMMARY  = "Open Source Telephony"
>> +DESCRIPTION = "oFono is a stack for mobile telephony devices on
>> Linux. \
>> +oFono supports speaking to telephony devices through specific
>> drivers, or with generic AT commands."
>>  LICENSE  = "GPLv2"
>>  LIC_FILES_CHKSUM =
>> "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
>>                      file://src/ofono.h;beginline=1;endline=20;md5=3c
>> e17d5978ef3445def265b98899c2ee"
>>  
>>  inherit autotools pkgconfig update-rc.d systemd bluetooth gobject-
>> introspection-data
>>  
>> -DEPENDS  = "dbus glib-2.0 udev mobile-broadband-provider-info"
>> +DEPENDS  = "dbus glib-2.0 udev mobile-broadband-provider-info ell"
>
> ERROR: Nothing PROVIDES 'ell' (but /media/build1/poky/meta/recipes-
> connectivity/ofono/ofono_1.28.bb DEPENDS on or otherwise requires it)
>
> OE-Core doesn't contain ell?
>
> The new dependency isn't mentioned in the changelog?
>
> Cheers,
>
> Richard

Right, it's part of meta-openembedded. I did not think about this.

What does the project usually do in this kind of situations, ports
dependency to meta-oe or refuses package bump?


