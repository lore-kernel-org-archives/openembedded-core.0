Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1C77E7490C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Jul 2018 14:37:48 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id d189-v6so4244596oib.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Jul 2018 07:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hWfZr0aqgq/aaF25bdWijlQxdrC416JXGsl1+Cdw3jQ=;
	b=sYUXs9sr7W442G5C6i0NcKNVqfahO33swrzxstz9mDb09xjqVTT6UzhAXZQlpdV52P
	FnYC/HXGsLEt+de6OB7S2bP5I/OJy+2IXBhgWNtf7Id1yKplmtvY4tbxvZ3DW5KcgyV5
	eE/Rqt2f2On8FvxLEvEhn+5U3lKC58bT1y5WjQ4eNGEQS05B8yXLxDzP+SQHLq4I+81C
	vmt0mbpyLBgb2eOVDyYFI10lqAQDc43Ow3W+Me4lQvegpn2z7c2QtE835UoQ6oW8KiPz
	WEISEPkUbq2RF0A+e7ux8vFofQboCB89379oIOVTGY6LF46EOTJYLU4saRF3HeRe4w6u
	RP0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hWfZr0aqgq/aaF25bdWijlQxdrC416JXGsl1+Cdw3jQ=;
	b=WgaXXixe+Lf70HmJXAI2/Ege/wc/yp0dZReRt10JmuXihqzTkxEGvUlZ/238yZHcOH
	XUmAUGI3U8dtRkEyR+v3s2bOx7hRjtSzbjDsYi0c359wCKEJbAfz7AWQhD17nuOLTOvz
	/0FJYw+9nkf8tDNJL7E0bM0OoGNhngwerGbDIzcw7eIAIBr2gr4ucJm52bCDIB2iZ0hB
	P36fYghtIJi07WGqp9TG51Y9NH8TkgjxaFXmFIB+M7edvV/NEFw+UhAnoI0blsJ4gn/R
	wqg1BJ02kmQ6NWKipq6sShU8zRTSjM0TIMznFhHd5uGO91qPAtZ9yHXwyftdCKW2M5q8
	T6qQ==
X-Gm-Message-State: APt69E2LwROhAQ1uQxL3DPBPrNRW80vaIcagI4e0xr7inwiaB24rKyZD
	/dSWspuxdhqBkcdMkj58WxvSkY1InL+Xj0tg3ijtJQ==
X-Google-Smtp-Source: AAOMgpcKr5ND+Tm2YrkAsWsZiejTiqKUQChOnQmR33shQ0mr2RuZI2J9aivr1GWK5x3S2AAV0YV6CJDpt7o+qfCJGFU=
X-Received: by 2002:aca:2808:: with SMTP id
	8-v6mr21954109oix.235.1530628669165; 
	Tue, 03 Jul 2018 07:37:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:434d:0:0:0:0:0 with HTTP;
	Tue, 3 Jul 2018 07:37:28 -0700 (PDT)
In-Reply-To: <CAF6bG8eak_Y2JtCadgfju7FvLr0mcG6oCFUuWrNhzLtDEe6Gyw@mail.gmail.com>
References: <20180601221436.27162-1-alistair.francis@wdc.com>
	<20180601221436.27162-2-alistair.francis@wdc.com>
	<CAJTo0Laocxug2iUZjAD8bLqDN4ho7GPO=_c2ZOQQmvSErOXyyQ@mail.gmail.com>
	<CAKmqyKN=5JzrFhK0aLvzuxHJFO4PmK_Km2JnynrqKjfovQAokw@mail.gmail.com>
	<19c52d27-6206-5b80-a41b-f3a106d8d7fd@linux.intel.com>
	<CAKmqyKO4STCUPJJE7+ZPwSMwGyoUAkcbTckSiByEipGMBDE-RQ@mail.gmail.com>
	<CAJTo0LboMpfRu6rOzXAP+5yzd5yokYp52Cai+cvWDKr_aMkkhg@mail.gmail.com>
	<CAKmqyKPEM707Y1aE6+1LUTJorB5o5f9e92y618gowu4ZN8B2Fg@mail.gmail.com>
	<CAF6bG8fqn0pgfU18pWWayb4LhZA=dZjwMqGPysPNXCaM8OOr2Q@mail.gmail.com>
	<CAF6bG8dJCN47J3Hw7RDJP6iWTA-wpB+Qd3EywJbqi1w8qZPuvw@mail.gmail.com>
	<CAF6bG8eak_Y2JtCadgfju7FvLr0mcG6oCFUuWrNhzLtDEe6Gyw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 3 Jul 2018 15:37:28 +0100
Message-ID: <CAJTo0Lb_z+qSa=_y9Zp0iqU_mAjJJVG0S0c=7RJX+hA1YDQN8Q@mail.gmail.com>
To: Marko Lindqvist <cazfi74@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] [meta] atk: Specify gettext-native dependency
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
X-List-Received-Date: Tue, 03 Jul 2018 14:37:48 -0000
Content-Type: text/plain; charset="UTF-8"

What was missing all along is that we're talking specifically about
atk-native here, which disables NLS explicitly.  As Meson doesn't yet
expose a way to turn off i18n we need to stop that.  For now, adding
USE_NLS=yes is a suitable workaround (and what glib already does).
Marko, can you send this patch?

Arguably, meson.bbclass could do this, but that would be forcing a
gettext dependency on everything using Meson.

Ross



On 1 July 2018 at 19:20, Marko Lindqvist <cazfi74@gmail.com> wrote:
>  3) Adding 'USE_NLS = "yes"' to atk recipe fixes the problem for me.
>
>
>  - ML
>
>
> On 1 July 2018 at 21:03, Marko Lindqvist <cazfi74@gmail.com> wrote:
>>  I think the problem is not with INHIBIT_DEFAULT_DEPS, but with
>> USE_NLS on the next couple of lines. With USE_NLS disabled, the
>> automatic dependency is gettext-minimal-native (not providing
>> xgettext, I think), and not gettext-native.
>>
>>  1) tmp-glibc/work/aarch64-oe-linux/atk/2.28.1-r0/recipe-sysroot-native/sysroot-providers/gettext-minimal-native
>> is there
>>  2) Adding gettext-minimal-native as atk dependency does not fix the
>> issue like adding gettext-native dependency does
>>
>>
>>  - ML
>>
>>
>> On 30 June 2018 at 21:43, Marko Lindqvist <cazfi74@gmail.com> wrote:
>>>  This error happens to me with both qemux86 and qemuarm64. Haven't
>>> tested any others yet.
>>>
>>>
>>>  - ML
>>>
>>> On 15 June 2018 at 20:40, Alistair Francis <alistair23@gmail.com> wrote:
>>>> On Mon, Jun 4, 2018 at 4:18 PM, Burton, Ross <ross.burton@intel.com> wrote:
>>>>> That implies that INHIBIT_DEFAULT_DEPS is also evaluating to true,
>>>>> which it shouldn't be in ATK.
>>>>>
>>>>> I'd definitely be checking if that is the case, and if you can
>>>>> replicate the failure with e.g. qemuarm.
>>>>
>>>> I can't replicate it with qemuarm and checking with bitbake -e I can't
>>>> see anywhere that the variable is set. Any ideas on what to try to
>>>> figure out how it is set?
>>>>
>>>> Alistair
>>>>
>>>>>
>>>>> Ross
>>>>>
>>>>> On 4 June 2018 at 19:46, Alistair Francis <alistair23@gmail.com> wrote:
>>>>>> On Mon, Jun 4, 2018 at 10:20 AM, Alexander Kanavin
>>>>>> <alexander.kanavin@linux.intel.com> wrote:
>>>>>>> On 06/04/2018 08:17 PM, Alistair Francis wrote:
>>>>>>>>
>>>>>>>> On Mon, Jun 4, 2018 at 3:06 AM, Burton, Ross <ross.burton@intel.com>
>>>>>>>> wrote:
>>>>>>>>>
>>>>>>>>> So why isn't the inherit gettext sufficient?
>>>>>>>>
>>>>>>>>
>>>>>>>> I'm not sure. Here is the error I see when compiling for RISC-V before
>>>>>>>> this patch:
>>>>>>>
>>>>>>>
>>>>>>> So is the error specific to risc-v? You should dig deeper in that direction
>>>>>>> then.
>>>>>>
>>>>>> Ok, it looks like the line: if d.getVar('INHIBIT_DEFAULT_DEPS') and
>>>>>> not oe.utils.inherits(d, 'cross-canadian'): is evaluating as true in
>>>>>> gettext.bbclass so we don't depend on gettext-native.
>>>>>>
>>>>>> Do I need to ensure cross-canadian is set for RISC-V builds then?
>>>>>>
>>>>>> Alistair
>>>>>>
>>>>>>>
>>>>>>> Alex
>>>> --
>>>> _______________________________________________
>>>> Openembedded-core mailing list
>>>> Openembedded-core@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

