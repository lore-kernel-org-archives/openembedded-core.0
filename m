Return-Path: <matt@madison.systems>
Received: from mail-wr0-f181.google.com (mail-wr0-f181.google.com
	[209.85.128.181])
	by mail.openembedded.org (Postfix) with ESMTP id 08AB271E4B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Sep 2017 19:40:44 +0000 (UTC)
Received: by mail-wr0-f181.google.com with SMTP id 54so3702885wrz.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Sep 2017 12:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=50McfZ12V3NUS5d+ZmalStrfqe6rxEzNWZv5sPbB0OU=;
	b=Pmtst8/3se5jGyZvUxw1WSy1wWDUS8pkAKLYYttBHMLqFxENi0BUwFGi5s4UH3XzZN
	U5OuOAh0XhikfqIGDwPkZm8Du0SbVO/ygFHSupdjfQo93lKR2sbGKth0SXmdnaEqPgdm
	mrErcd1m+4socjtuhQuDkqqPRmOvPIkyBDos6EhvSy+FlZakL/851dtrXo0SNieq9evW
	OmAq8T5j66gkBEJHxm+XodTltrD826/mmQjO0bwZeo9HeaKmd612jS3vO41lfUD/QXlA
	2COBBIjk3sbMMxA/e6BIpu1vx06g0ZOV5p1GktsiGqrmxbsl7Fy+Blt9hce9IYEVVYPb
	iHZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=50McfZ12V3NUS5d+ZmalStrfqe6rxEzNWZv5sPbB0OU=;
	b=FktMhbbrM4F0LLcPZe0p2TbZ59b85z5ua04Q3ibDP8J0cNhiAzyRQKNrlzJhxkrhlX
	Ppjx3uDQx8UL/Dv4TSm+bRVA7thmXPUmAkQSgbEOLKRazAx4celeXY0aqMnDW99uypDq
	VS3MDqDGewBUuVAmmoWTSxMErU8tpd6us9CMgobu6xgOd7DzF7I6BnG2dpxf/VpOSCZm
	gRGqFNG+gNS1HqbwlWBvPylUgRN/NtdHTXsub5x0KmHlRQHd9TGHUbWyK0rDIRvNcxQO
	WKXdV+4RAoc7yx0xLIbAnWlAbayFJOjDGrs7e9ylJG7OXbBtG/vWvKGKC2oE3bNxeyAt
	zmyg==
X-Gm-Message-State: AHPjjUiKcCSKpIWBqVkFkZclFC5WQYeNAjBfoVfS/1FRYUtIGnwhlQWP
	1aWCozu23OL0K9YWi4EwN9b9RYDxL/5rO/cGMgPkxA==
X-Google-Smtp-Source: AOwi7QDxThAU5N9eTJ6O8tSjt6/IBb2H4RHCWjbgw7hW5U5z4bag1KZumYwhwMoG8v/kph7wuxltLRX6f6348Ksa75o=
X-Received: by 10.46.66.145 with SMTP id h17mr1064021ljf.140.1506541246068;
	Wed, 27 Sep 2017 12:40:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.225.68 with HTTP; Wed, 27 Sep 2017 12:40:45 -0700 (PDT)
In-Reply-To: <CAJTo0La_2V=rNTBx2LZaDm3YpeMzybh645q9vDEigSOMVw_O7Q@mail.gmail.com>
References: <1506513706-14213-1-git-send-email-matt@madison.systems>
	<CABcZAN=uMrwda=MGiKW9qPs_q7KLFR3V04KiSV-WCLwTPJ=XqQ@mail.gmail.com>
	<CAMKF1soU7--gaCF1E70Ufp_tPy3NDs8w3FhHQpo592E4Yo=9eg@mail.gmail.com>
	<CAJTo0La_2V=rNTBx2LZaDm3YpeMzybh645q9vDEigSOMVw_O7Q@mail.gmail.com>
From: Matt Madison <matt@madison.systems>
Date: Wed, 27 Sep 2017 12:40:45 -0700
Message-ID: <CAGgRHJqTcBLL8+d+Sveo05-5gafwy2L7Gj6rwC=dFZguzjQPHg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] goarch.bbclass: rework mips architecture checks
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
X-List-Received-Date: Wed, 27 Sep 2017 19:40:45 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 27, 2017 at 10:06 AM, Burton, Ross <ross.burton@intel.com> wrote:
> On 27 September 2017 at 17:33, Khem Raj <raj.khem@gmail.com> wrote:
>>
>>
>> On Wed, Sep 27, 2017 at 8:52 AM Christopher Larson <kergoth@gmail.com>
>> wrote:
>>>
>>> Another option is to use contains() for this. The signature generation
>>> code knows how to handle contains specially, only depending on the presence
>>> of the specified value in the list, rather than the entirety.
>>
>>
>> This approach seems better than anon python
>
>
> Yes, agreed.

I didn't know about the special handling for contains. I'll see if I
can rework the patch to
avoid the anonymous python, although it may be tricky since there's
some rewriting
involved to force mips32r2 -> mips32.

Thanks,
-Matt

>
> Ross

