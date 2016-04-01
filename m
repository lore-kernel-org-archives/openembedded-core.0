Return-Path: <elizabeth.flanagan@intel.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 593C973259
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Apr 2016 09:53:14 +0000 (UTC)
Received: by mail-io0-f175.google.com with SMTP id a129so137616476ioe.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Apr 2016 02:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=1qzTe8VtiNa2gh6QQOLV8MMJ+HZvU7lFJT8VyYslEjU=;
	b=qP2/wecSt89DRJFjDnosaXXGFPi9ACSioQSYjRZdVh/RbUpiustXDQt1ZRkYgWSuvx
	IG6mJpWS1R0fcxyWuYyiq51VJclXUgsEz9OQxwu5SNB61bt8gZcpn+gFZIL6qrdhi1FW
	6Ge6PfLeCJTxPgCOdcd3Ra1ERbRSjx2sWb9KSILi3xVHhnS7e/3/8X7sFyvLLFs99qOl
	VygoaPr4h77fDA6s3ALYD5NleFHWgfTu4b5G4isTvQlTV8Lf8xrCXEX2t9TJZ2ukL+kg
	XvS0wuaOAHjLlHULEGnQL1F2zbsfiKfXQl58dJYO2vb+LTfeVhdUhzNAI0xLPHD4auKT
	Fgig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=1qzTe8VtiNa2gh6QQOLV8MMJ+HZvU7lFJT8VyYslEjU=;
	b=e5x1tsTl5A2ROtr8/9+bZVocB8DBBYiu2DQ1XlLtASfcmnREEVGVhOlfQpelJIsare
	Os+nYd3IsAOyFTExp3i6ait7Tlpkt0R3fS/XjDrtMgDn2fx+WQrKUntTnkEkg45H1uRx
	01PcFmYiZHazWSWw8B2jf0EQNZnMI1/JIs8bUXGsmjZxT6+I4310PKkGsl5KMA2EfoeU
	3zzpS/n0y2usb5SzylyrEgHWOtW1cOATjyi9SBeO1JZKG34YBBcGAk63Ck9RiUDmCBTc
	cFn/QopkJlRg4uykp5kFcb0rAxRZ7MVNi2eahourqybbF4s2alBQz2J3duqjDlgPDKkV
	eejw==
X-Gm-Message-State: AD7BkJKsIk27KQx0IvFrkAW35y1PIH7e8tmwWr1YXy7cd0tB+kubQTACYl4MoLjLJ8EsJtWxQcMS0brPsUQITWil
X-Received: by 10.107.129.206 with SMTP id l75mr5797968ioi.141.1459504395627; 
	Fri, 01 Apr 2016 02:53:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.201.136 with HTTP; Fri, 1 Apr 2016 02:52:36 -0700 (PDT)
In-Reply-To: <DB3PR04MB068475EDA1351AFAD9CD7EC7EE9A0@DB3PR04MB0684.eurprd04.prod.outlook.com>
References: <1459501616-4775-1-git-send-email-ross.burton@intel.com>
	<DB3PR04MB068475EDA1351AFAD9CD7EC7EE9A0@DB3PR04MB0684.eurprd04.prod.outlook.com>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
Date: Fri, 1 Apr 2016 10:52:36 +0100
Message-ID: <CAPhnLPDtAfuQRy0PrXO=KuEVfd8sWRvpO4A4Nh0jf7wAyXyJwQ@mail.gmail.com>
To: Zhenhua Luo <zhenhua.luo@nxp.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] meta: remove obsolete architectures
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
X-List-Received-Date: Fri, 01 Apr 2016 09:53:15 -0000
Content-Type: text/plain; charset=UTF-8

On 1 April 2016 at 10:43, Zhenhua Luo <zhenhua.luo@nxp.com> wrote:
> Hi Ross,
>
>> -----Original Message-----
>> From: openembedded-core-bounces@lists.openembedded.org
>> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
>> Of Ross Burton
>> Sent: Friday, April 01, 2016 5:07 PM
>> To: openembedded-core@lists.openembedded.org
>> Subject: [OE-core] [PATCH] meta: remove obsolete architectures
>>
>> Remove ancient and obsolete architectures from openembedded-core,
>> they've no
>> real users and are causing complications that can be now removed.

I don't see a layerversion bump here so we'll need that as well.

I've a patch ready to pull them from the autobuilder once this makes master.

-b

>>
>> Signed-off-by: Ross Burton <ross.burton@intel.com>
>> ---
>>  meta/classes/cmake.bbclass                         |   4 -
>>  meta/classes/insane.bbclass                        |  30 ---
>>  meta/classes/libc-package.bbclass                  |   7 -
>>  meta/classes/qemu.bbclass                          |  12 -
>>  meta/classes/siteinfo.bbclass                      |  26 --
>>  meta/conf/bitbake.conf                             |   7 -
>>  meta/conf/machine/include/mips/README              |  36 ---
>>  meta/conf/machine/include/mips/arch-mips.inc       | 102 --------
>>  meta/conf/machine/include/powerpc/README           |  17 --
>>  meta/conf/machine/include/powerpc/arch-powerpc.inc |  34 ---
>>  .../machine/include/powerpc/arch-powerpc64.inc     |  14 --
>>  meta/conf/machine/include/sh/README                |  11 -
>>  meta/conf/machine/include/sh/arch-sh.inc           |   9 -
>>  meta/conf/machine/include/tune-mips32.inc          |  25 --
>>  meta/conf/machine/include/tune-mips32r2.inc        |  17 --
>>  meta/conf/machine/include/tune-mips64.inc          |   3 -
>>  meta/conf/machine/include/tune-octeon.inc          |  32 ---
>>  meta/conf/machine/include/tune-power5.inc          |  21 --
>>  meta/conf/machine/include/tune-power6.inc          |  21 --
>>  meta/conf/machine/include/tune-power7.inc          |  21 --
>>  meta/conf/machine/include/tune-ppc476.inc          |  14 --
>>  meta/conf/machine/include/tune-ppc603e.inc         |  14 --
>>  meta/conf/machine/include/tune-ppc7400.inc         |  14 --
>>  meta/conf/machine/include/tune-ppce300c2.inc       |  11 -
>>  meta/conf/machine/include/tune-ppce300c3.inc       |  23 --
>>  meta/conf/machine/include/tune-ppce500.inc         |  20 --
>>  meta/conf/machine/include/tune-ppce500mc.inc       |  14 --
>>  meta/conf/machine/include/tune-ppce500v2.inc       |  20 --
>>  meta/conf/machine/include/tune-ppce5500.inc        |  20 --
>>  meta/conf/machine/include/tune-ppce6500.inc        |  21 --
> [Luo Zhenhua-B19537] the ppce500mc, ppce500v2, ppce5500 and ppce6500 are used by NXP QorIQ PPC targets. So the removal of related stuffs will break the build for those targets in meta-fsl-ppc layer.
>
>
> Best Regards,
>
> Zhenhua
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
Elizabeth Flanagan
Yocto Project
Build and Release

