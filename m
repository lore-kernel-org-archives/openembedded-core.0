Return-Path: <alistair23@gmail.com>
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
	[209.85.208.179])
	by mail.openembedded.org (Postfix) with ESMTP id AC4C46B8AC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2019 21:38:34 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id j19so18529111ljg.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2019 13:38:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=SEVJTkxadi8qYOXDVzu7ID5IFzCE93fm3xmMxklZb6E=;
	b=sc42gjaKBJovY7qxdBiH1lqdqlE9VpdkzIP4tvmmFUXKAsDoszELoEVAqFQzE4omE4
	zpqptvogrFkv8DBzOKxPKLVzWzNIO8euaW9RjgF8mLSlnPDMngXpPYISyVzAep5gYVk3
	klB7ojAsj4EDH1S2E95jU+BQW2a2dArHOf54pYyxzEWnRe7/fOCtPmxx5sSjOgZFZJCh
	lD65yTiKY6gJSk+K8Wem0mJUCTXqPJeVzCh63LFdBD9CoiRX4uisPw/G1xOb/t6PewHC
	h0eyk9eAeCdWCfG4vTGQ8tqBMoT8MP9tBW9fqu2UPso6iBLXUvdZBGLpTh4Mq96cgUxF
	p7nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=SEVJTkxadi8qYOXDVzu7ID5IFzCE93fm3xmMxklZb6E=;
	b=oAhb/ytPvtTlOvnvgTke1REZuijIBWIbwqXPhtgaol9SPNL2f5MBKff0xm1hqQmSdF
	daBB0gRr2OkZZU+qW375EAxs2PHvIfUPpBjFG0Ukn6g4rgNagaY7mN30Wfbu1dANJtec
	ZoSNLCwURQouDt7C4PKExWh7OcuWzOqp0mfrzm7VmxRiIha/BGMfp6s80csAE6AKkENj
	Mfu4etGsfLnDGS3CVhcM//rl4ID85oa7ys3h8VukK6IyRuN19TAKAGsH/3j33MqtsnyX
	6i5GNXs5UgWnc0Sd8MIOrpKs0xbBqglLaHWArCqR01a/QU2VQfd0RnOACQ9KtpHsPYS+
	HsVw==
X-Gm-Message-State: APjAAAUu3PaKuqeaPYvDFqnLM0pslmX94YB3n98h8tN7q9JyilItewmF
	OtoP8UE+3IEAYfgEcRRrSbcTGiYP/CTg0txhKtY=
X-Google-Smtp-Source: APXvYqxSvU/KKW1qBUR26G1X+od2MunhOdc994UtdlzF9V/pMw4IA42Yqd9d+m0sMbPsEmJb8Xe63mK6t+9Dpvl9xXA=
X-Received: by 2002:a2e:8803:: with SMTP id x3mr598132ljh.27.1551389915129;
	Thu, 28 Feb 2019 13:38:35 -0800 (PST)
MIME-Version: 1.0
References: <20190228213251.31036-1-alistair.francis@wdc.com>
	<CAMKF1soe6Dev6HKeg=HoYV5bogwgLMEkze9AT1+YfZWL7W3C5A@mail.gmail.com>
In-Reply-To: <CAMKF1soe6Dev6HKeg=HoYV5bogwgLMEkze9AT1+YfZWL7W3C5A@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 28 Feb 2019 13:37:38 -0800
Message-ID: <CAKmqyKMTQSCk1trkKaqM0uxxMPifSnFoyc84yQp7+c8MR5Zi6w@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qemu-native: Add missing fdt PACKAGECONFIG
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
X-List-Received-Date: Thu, 28 Feb 2019 21:38:35 -0000
Content-Type: text/plain; charset="UTF-8"

I'm happy to append it, but it isn't appended for qemu-system-native
or just qemu recipes so it seems strange to append this one.

Alistair

On Thu, Feb 28, 2019 at 1:36 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> I think it should be appended
>
> On Thu, Feb 28, 2019 at 1:33 PM Alistair Francis <Alistair.Francis@wdc.com> wrote:
>>
>> This is required to fix this build failure:
>>
>> qemu-3.1.0/hw/core/loader-fit.c:30:10: fatal error: libfdt.h: No such file or directory
>>  #include <libfdt.h>
>>           ^~~~~~~~~~
>> compilation terminated.
>>
>> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>> ---
>>  meta/recipes-devtools/qemu/qemu-native_3.1.0.bb | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-devtools/qemu/qemu-native_3.1.0.bb b/meta/recipes-devtools/qemu/qemu-native_3.1.0.bb
>> index c8acff8e19..0b6a7f8b6e 100644
>> --- a/meta/recipes-devtools/qemu/qemu-native_3.1.0.bb
>> +++ b/meta/recipes-devtools/qemu/qemu-native_3.1.0.bb
>> @@ -6,4 +6,4 @@ require qemu-native.inc
>>
>>  EXTRA_OECONF_append = " --target-list=${@get_qemu_usermode_target_list(d)} --disable-tools --disable-blobs --disable-guest-agent"
>>
>> -PACKAGECONFIG ??= ""
>> +PACKAGECONFIG ??= "fdt"
>> --
>> 2.20.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

