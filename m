Return-Path: <armccurdy@gmail.com>
Received: from mail-vk0-f45.google.com (mail-vk0-f45.google.com
	[209.85.213.45])
	by mail.openembedded.org (Postfix) with ESMTP id 15D91792C5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2018 07:19:37 +0000 (UTC)
Received: by mail-vk0-f45.google.com with SMTP id 125-v6so2114394vke.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2018 00:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=/jOI5gwT/5UbrXbYK9DzCoIFHPzazU1JcNDVYCbCxjo=;
	b=FFXn78RB3TXCJQV7ckx2RM6yn8gGXz/eCZRUIs/Fo1apGoiXoeYDvG1g0Gxrd6R3+g
	yKzFcpXq/W62CLg0rKdGqLZJkiwHcic0/fs2WYAYS3XowLn+Kotgub7SWnWEdAugwWiK
	MpfVrs1w8Rx71h2S764Zn3qIz5STRB9UQvxSBzVKfaNt5+7CuRskQrdGPnXCYG8gH/s0
	HxYDQiXT6doP67bmg65X/j2aySG32V9nVly0N9pjda3UwQOIoNqkPWEiFPC5GvF3dKUn
	1+v9TT1f5qktKWD54gf+xtFJeR5NeSBVq3Ob7s5+5HMD/ddx/eIMDn1z+8au+h4jjXv+
	XMPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=/jOI5gwT/5UbrXbYK9DzCoIFHPzazU1JcNDVYCbCxjo=;
	b=NntN0hHXBa720FAgw8zWq9V+mpmxsglC3XqONdiuUrLsH1c+dj7WME7Da52Y2H0aJL
	MUCWsXpchGPT3G59lAB9mDy2EREbNomQma4bsupyEhGQbNNQ2wWGen0mVfkANhDej+/T
	/k01wE+XHJWHlo2af0O8J8xOxca0dnOuusB2sjiABLm3P2REWEjLYpeXd6EPcsrMMUQo
	wADOF041s8U35quNpGdMe58Btd/hsE+2m3P618w92HYgHaDTMi4J89FHWrvOg7GXhoyI
	oJPEameQoWeCNG7R16DVdXXQZPuJU/mpchifvNs56pirj6ZQGxMzKSH4dd7T9eIDBreZ
	w56g==
X-Gm-Message-State: APzg51AljMyEJIFQe5AV6C9RfH+3JtBN+pqk7idQF4XISKBazaMWHT6O
	ldFoLHQBmGEqTJ7Q+C5oKDPSElvNPJclpVowxac=
X-Google-Smtp-Source: ANB0VdZ48T7bNP8amaEzchY9Xr+Y3qFYzf+Vm3SxhCifw8KDvprHG289bUjSJGiJeQLRmsrZ5Vml6kRvHkFjVjFr41w=
X-Received: by 2002:a1f:8b88:: with SMTP id
	n130-v6mr11222809vkd.83.1535008778934; 
	Thu, 23 Aug 2018 00:19:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:2a:0:0:0:0:0 with HTTP;
	Thu, 23 Aug 2018 00:19:38 -0700 (PDT)
In-Reply-To: <CAD0U-h+N6qwLToTqg0ZOSPfk3wK4-416bFNrf80hcgWbxNYuVw@mail.gmail.com>
References: <1534955436-729-1-git-send-email-ryan.harkin@linaro.org>
	<1534955436-729-4-git-send-email-ryan.harkin@linaro.org>
	<CA+chaQd0noT0sABT2ucXZOx6QvWhoQqQeqzWXO_nm89-5ZeREA@mail.gmail.com>
	<CAD0U-hLEPce-+gJcBcqQHFPkiHr1CPBEvaM6s1f1VTkEzpNnfQ@mail.gmail.com>
	<CA+chaQezPDFAP1L0NYCaoFDjPfriUt3_wh9QKTaa0ZwWBHtKYQ@mail.gmail.com>
	<CAD0U-hJHddn43O0WVxDqUft74RoHxfCQBb9XV-pG+GYqNU0iVQ@mail.gmail.com>
	<CA+chaQc2EUcz+PHi=BT5RrMQsCqegytxgLd6gzpH-PUYvt59Mw@mail.gmail.com>
	<CAD0U-hL6Mvxf+NYVJS64ygh+bMR2RMxwa=okW6g+yOGb-Xb7mA@mail.gmail.com>
	<CAJ86T=UOiE+m=3__e13YpRex22Z9h1ennqyCxQMRDdSWMiFZTw@mail.gmail.com>
	<CAD0U-hJ5Ef8+zV6fumw921=67hwS5yyqaDWWJGVm4D4rFyrYHQ@mail.gmail.com>
	<CAJ86T=WjSNkzHpD0a-CxwmV1JfG7ksfezspi+5LvkdvJHdTcFw@mail.gmail.com>
	<CAD0U-h+yMkaadysGDcmhZHSPY8tgbw_O8jquynJduChJjgypxA@mail.gmail.com>
	<ef756a97-310a-63a9-1a3b-be0bb6634769@geanix.com>
	<CAD0U-h+N6qwLToTqg0ZOSPfk3wK4-416bFNrf80hcgWbxNYuVw@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 23 Aug 2018 00:19:38 -0700
Message-ID: <CAJ86T=W6=_0BvTh3EYdVN7JLENrBksFdhQrXK1ALKtJ=N9Ojnw@mail.gmail.com>
To: Ryan Harkin <ryan.harkin@linaro.org>
Cc: daiane.angolini@nxp.com, Koen Kooi <koen.kooi@linaro.org>,
	Patch Tracking <patches@linaro.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC 3/3] linux-firmware: MACHINEOVERRIDES for BCM43430 NVRAM
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
X-List-Received-Date: Thu, 23 Aug 2018 07:19:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 23, 2018 at 12:08 AM, Ryan Harkin <ryan.harkin@linaro.org> wrot=
e:
> On 23 August 2018 at 07:39, Martin Hundeb=C3=B8ll <martin@geanix.com> wro=
te:
>>
>> May I suggest using the '-r, --relative' flag from 'ln':
>>
>>        -r, --relative
>>               create symbolic links relative to link location
>>
>> My life felt considerably better after discovering that feature :)
>
> Thanks Martin Hundeb=C3=B8ll! Yes, that works for me.
>
> So, Martin Jansa, I could make this change:
>
> -       ( cd ${D}${nonarch_base_libdir}/firmware/brcm/ ; ln -sf
> brcmfmac43430-sdio.MUR1DX.txt brcmfmac43430-sdio.txt)
> +      ( ln -sfr
> ${D}${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.MUR1DX.txt
> ${D}${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.txt)

This is kind of crazy - you are giving an absolute path and then
asking ln to convert it into a relative path for you... but the
conversion process is trivial: just remove the entire path! You don't
need to ask ln to do that for you.

> Of course, if I'm not going to "cd" into the firmware repo, I'll have to =
use
> absolute paths on both sides of the "ln" command anyway. So I could drop =
the
> 'r' param and it should still work. Eg:
>
> -       ( cd ${D}${nonarch_base_libdir}/firmware/brcm/ ; ln -sf
> brcmfmac43430-sdio.MUR1DX.txt brcmfmac43430-sdio.txt)
> +      ( ln -sf
> ${D}${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.MUR1DX.txt
> ${D}${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.txt)

This will create a symlink which points to the target using an
absolute path. ie it's not equivalent to the other examples given so
far.

> I'm still not sure this is any neater, though, as it involves using the p=
ath
> twice. Is there a maintainer here who has a preference?
>
> FWIW, the TI line that I copied was added by Koen Kooi, who I've added to
> the CC:
>
> 8c7adb6  2011-10-09  linux-firmware: update, merge in OE classic updates,
> fix p..       [Koen Kooi]

If you mean this line:

  ( cd ${D}/lib/firmware ; ln -sf ti-connectivity/* . )

then it's doing something quite different to what you're now trying to
do. It's creating multiple symlinks, not one.

>>
>> // Martin
>>
>> On 23/08/2018 08.12, Ryan Harkin wrote:
>>>
>>>
>>>
>>> On 22 August 2018 at 23:55, Andre McCurdy <armccurdy@gmail.com
>>> <mailto:armccurdy@gmail.com>> wrote:
>>>
>>>     On Wed, Aug 22, 2018 at 2:56 PM, Ryan Harkin <ryan.harkin@linaro.or=
g
>>>     <mailto:ryan.harkin@linaro.org>> wrote:
>>>      > On Wed, 22 Aug 2018, 21:42 Andre McCurdy, <armccurdy@gmail.com
>>>     <mailto:armccurdy@gmail.com>> wrote:
>>>      >> On Wed, Aug 22, 2018 at 1:10 PM, Ryan Harkin
>>>     <ryan.harkin@linaro.org <mailto:ryan.harkin@linaro.org>>
>>>      >> wrote:
>>>      >> > On Wed, 22 Aug 2018, 20:02 Martin Jansa,
>>>     <martin.jansa@gmail.com <mailto:martin.jansa@gmail.com>> wrote:
>>>      >> >>
>>>      >> >> Your 1st parameter is wrong, compare again with the example =
I
>>>     gave you
>>>      >> >> (don't include "brcm/" path in 1st param, because you want
>>>     the symlink
>>>      >> >> to
>>>      >> >> point to just brcmfmac43430-sdio.AP6212.txt like you did in
>>>     the version
>>>      >> >> after cd).
>>>      >> >
>>>      >> > That doesn't work either. I tried it with the same result, bu=
t
>>>     didn't
>>>      >> > send a
>>>      >> > log of it. That works for you?
>>>      >>
>>>      >> Martin's example is correct so maybe check your tests again for
>>>     typos.
>>>      >> It it still doesn't work then please do send a log.
>>>      >>
>>>      >> The link will point to whatever you define via the first
>>>     parameter, so
>>>      >> if you changed the first parameter it shouldn't be possible to
>>> get
>>>      >> "the same result".
>>>      >>
>>>      >>   $ mkdir foo
>>>      >>   $ ln -sf test_target foo/test1
>>>      >>   $ ln -sf brcm/test_target foo/test2
>>>      >>   $ ls -l foo
>>>      >>
>>>      >>   lrwxrwxrwx 1 andre andre 11 Aug 22 13:35 test1 -> test_target
>>>      >>   lrwxrwxrwx 1 andre andre 16 Aug 22 13:35 test2 ->
>>> brcm/test_target
>>>      >
>>>      > Yes, that's essentially the same as what I'm getting.
>>>      >
>>>      > Now try "cat foo/test1" and what happens?
>>>      >
>>>      > There is no file called test_target in the foo directory. And
>>>     neither is
>>>      > there a file called brcm/test_target in the foo directory.
>>>
>>>     Correct. The above was just an example to show that you can * creat=
e
>>>     symlinks * in the foo directory without cd'ing into the foo directo=
ry
>>>     first.
>>>
>>>     If you'd like the symlinks in the example to point to valid targets
>>>     then you need to create the targets too, e.g.
>>>
>>>        $ mkdir -p foo/brcm
>>>        $ echo hello > foo/test_target
>>>        $ echo hello2 > foo/brcm/test_target
>>>
>>>     But note that the process of creating a symlink is always the same,
>>>     regardless of whether the symlink points to a valid target or not (=
so
>>>     you can run these extra commands to create the targets before or
>>> after
>>>     you create the symlinks).
>>>
>>>
>>> So that doesn't work for me how I expect it to work. I must be missing
>>> something fundamental here.
>>>
>>> The recipe is trying to create a soft link from a file in the current
>>> directory to a file in the sub-directory. On my system, your example cr=
eates
>>> links from a file in the sub-directory to the another file in the
>>> sub-directory.
>>>
>>> So, to copy your example, but creating the file "test_target" from the
>>> start:
>>>
>>> $ mkdir -p /tmp/test
>>> $ cd /tmp/test
>>> $ mkdir foo
>>> $ echo 1 > test_target
>>> $ ln -sf test_target foo/test1
>>> $ ln -sf brcm/test_target foo/test2
>>> $ ls -l foo
>>> total 0
>>> lrwxrwxrwx 1 ryan ryan 11 Aug 23 06:54 test1 -> test_target
>>> lrwxrwxrwx 1 ryan ryan 16 Aug 23 06:54 test2 -> brcm/test_target
>>> $ cat test_target
>>> 1
>>> $ cat foo/test1
>>> cat: foo/test1: No such file or directory
>>> $ cat foo/test2
>>> cat: foo/test2: No such file or directory
>>> $ echo hello > foo/test_target
>>> $ echo hello2 > foo/brcm/test_target
>>> bash: foo/brcm/test_target: No such file or directory
>>> $ cat foo/test1
>>> hello
>>> $ cat foo/test2
>>> cat: foo/test2: No such file or directory
>>> $ cat test_target
>>> 1
>>> $ tree
>>> .
>>> =E2=94=9C=E2=94=80=E2=94=80 foo
>>> =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 test1 -> test_target
>>> =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 test2 -> brcm/test_target
>>> =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 test_target
>>> =E2=94=94=E2=94=80=E2=94=80 test_target
>>>
>>> 1 directory, 4 files
>>>
>>> So, neither test1 nor test2 are linked to /tmp/test/test_target. test1 =
is
>>> linked to /tmp/test/foo/test_target and test2 is linked to
>>> /tmp/test/brcm/test_target, which doesn't exist.
>>>
>>> AFAIK, when creating a softlink, you have to give it either an absolute
>>> path, or a path relative to the link being created. The path cannot be
>>> relative to the original file that you want to link to.
>>>
>>> So, this will work:
>>>
>>> $cd /tmp/test
>>> $ ln -sf ../test_target foo/test3
>>> $ cat foo/test3
>>> 1
>>> $ cat /tmp/test/foo/test3
>>> 1
>>>
>>> But that is a strange way to create the soft link, IMO.
>>>
>>> AFAICT, for the recipe, to get rid of the "cd", I'd have to specify an
>>> absolute path to the original file:
>>>
>>> +do_install_append_bcm43430-nvram-mur1dx() {
>>> +       ( ln -sf ${PWD}/brcmfmac43430-sdio.MUR1DX.txt
>>> ${D}${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.txt)
>>>
>>> ... assuming PWD is available to the recipe. There will be a proper Yoc=
to
>>> variable I can use, of course, but I can't think of it right now.
>>>
>>> Either way, Martin's example doesn't work for me. And adding the absolu=
te
>>> path of the original file doesn't seem any neater or clearer than follo=
wing
>>> the TI example from the do_install a few lines up in the recipe. But I'=
m
>>> happy to do it either way, so long as it works.
>>>
>>
>> --
>> Kind regards,
>> Martin Hundeb=C3=B8ll
>> Embedded Linux Consultant
>>
>> +45 61 65 54 61
>> martin@geanix.com
>>
>> Geanix IVS
>> https://geanix.com
>> DK39600706
>
>

