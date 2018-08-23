Return-Path: <armccurdy@gmail.com>
Received: from mail-vk0-f48.google.com (mail-vk0-f48.google.com
	[209.85.213.48])
	by mail.openembedded.org (Postfix) with ESMTP id 0B3A2794AB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2018 07:34:31 +0000 (UTC)
Received: by mail-vk0-f48.google.com with SMTP id e139-v6so2139003vkf.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2018 00:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=iRSCwJq6kn6NEuy1nHdcEFR0c+xkeeZaIcQ+UIVgZxk=;
	b=j5a8vR6IkuDnUSW+2x83ZAx7I8tcsLUZ+bW6MXBAHV+mkWhI8EFpkPUHqmYO+qA9dp
	sh9EMOFfBm5nHrArMRfyG65ynWAULwCmwWdHxihX1bwzhOM9Sr3W4dHTN9gltCHoetav
	ba1Yq2in6yYfzgcLtWVZfLoup6lDszHoVvNHm+HDDN2W3bGPYYpi4EtNH6+qURfbwIJK
	2LQfTZz9FQi5PJ0IRR00gHrBZkWChonHOBIWG4jxoypXdMM6nkL/qoX+JySluNwS8XRA
	yYY2vOM3QVuOS7KoPOWrnItIVl/vuzsu5pJBSBAGYlYKczGzKw3+OAV9DWa9UbQcFOBO
	f5ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=iRSCwJq6kn6NEuy1nHdcEFR0c+xkeeZaIcQ+UIVgZxk=;
	b=p+OILC1KOvEWs31JySUZoEF88tZE1GkDynpz48QjCQXgttQn1fM8KUUBgEBDGbQ4de
	DCpNHjmGLJpoN+nyrCZiBnrSj5Wq2Lvo7IRAEXKKNrC4IuuxRN8dWk5O5GJQLNmY87sM
	0dib4M0lIAFANwjNs97HrVoeK0E1YwSxITAfJKLlyNsnS3cvKrj0kw4Od2jf3+AadC9d
	kDiigV8i1HdhRk17Zv0PnjeEYLjmFsOqOoPIXd/4YoZ92rP3BcnZeV4DDRZ+oiEaxra9
	fbxyq0EtHbkyuxRzSnA+Ndvvc+/23rFug1vdkKB/Xtt7IgYCRMcU8dYUdtdUEoksRRMc
	qMLA==
X-Gm-Message-State: AOUpUlFoy0UA9UhknE0S5YIl/5culvj0+QelKnmPnF8fdvS0uqUjGTiz
	HVp/yH0SVOrTpYL7D7kQPgP+MzRr04iVZFbh+50=
X-Google-Smtp-Source: AA+uWPwBxP9peZAOs2ZVLV3VAbMZas5szjySEr2LitewnPtBcKoxRbwPOhb4sJ52UjeBd0y4qVUpGjg+bSPQH6yvpOY=
X-Received: by 2002:a1f:c252:: with SMTP id
	s79-v6mr38064232vkf.127.1535009672075; 
	Thu, 23 Aug 2018 00:34:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:2a:0:0:0:0:0 with HTTP;
	Thu, 23 Aug 2018 00:34:31 -0700 (PDT)
In-Reply-To: <CAD0U-h+j4c+bf-WR3AyL9-6NuP76aND7S2bG-+QRQCHWLV6TGA@mail.gmail.com>
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
	<CAJ86T=VzHK2Gv4T6sq6WQrqaTzdbDN2H4G4uenVtR3hdttGPaQ@mail.gmail.com>
	<CAD0U-h+j4c+bf-WR3AyL9-6NuP76aND7S2bG-+QRQCHWLV6TGA@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 23 Aug 2018 00:34:31 -0700
Message-ID: <CAJ86T=VyaXSYQG7ykznu2yNSNArSRTf7-T-RZqpNG39+dQ9=nw@mail.gmail.com>
To: Ryan Harkin <ryan.harkin@linaro.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	daiane.angolini@nxp.com, Patch Tracking <patches@linaro.org>
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
X-List-Received-Date: Thu, 23 Aug 2018 07:34:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 23, 2018 at 12:17 AM, Ryan Harkin <ryan.harkin@linaro.org> wrot=
e:
> On 23 August 2018 at 08:06, Andre McCurdy <armccurdy@gmail.com> wrote:
>> On Wed, Aug 22, 2018 at 11:12 PM, Ryan Harkin <ryan.harkin@linaro.org>
>> wrote:
>> > On 22 August 2018 at 23:55, Andre McCurdy <armccurdy@gmail.com> wrote:
>> >> On Wed, Aug 22, 2018 at 2:56 PM, Ryan Harkin <ryan.harkin@linaro.org>
>> >> wrote:
>> >> > On Wed, 22 Aug 2018, 21:42 Andre McCurdy, <armccurdy@gmail.com>
>> >> > wrote:
>> >> >> On Wed, Aug 22, 2018 at 1:10 PM, Ryan Harkin
>> >> >> <ryan.harkin@linaro.org>
>> >> >> wrote:
>> >> >> > On Wed, 22 Aug 2018, 20:02 Martin Jansa, <martin.jansa@gmail.com=
>
>> >> >> > wrote:
>> >> >> >>
>> >> >> >> Your 1st parameter is wrong, compare again with the example I
>> >> >> >> gave
>> >> >> >> you
>> >> >> >> (don't include "brcm/" path in 1st param, because you want the
>> >> >> >> symlink
>> >> >> >> to
>> >> >> >> point to just brcmfmac43430-sdio.AP6212.txt like you did in the
>> >> >> >> version
>> >> >> >> after cd).
>> >> >> >
>> >> >> > That doesn't work either. I tried it with the same result, but
>> >> >> > didn't
>> >> >> > send a
>> >> >> > log of it. That works for you?
>> >> >>
>> >> >> Martin's example is correct so maybe check your tests again for
>> >> >> typos.
>> >> >> It it still doesn't work then please do send a log.
>> >> >>
>> >> >> The link will point to whatever you define via the first parameter=
,
>> >> >> so
>> >> >> if you changed the first parameter it shouldn't be possible to get
>> >> >> "the same result".
>> >> >>
>> >> >>   $ mkdir foo
>> >> >>   $ ln -sf test_target foo/test1
>> >> >>   $ ln -sf brcm/test_target foo/test2
>> >> >>   $ ls -l foo
>> >> >>
>> >> >>   lrwxrwxrwx 1 andre andre 11 Aug 22 13:35 test1 -> test_target
>> >> >>   lrwxrwxrwx 1 andre andre 16 Aug 22 13:35 test2 -> brcm/test_targ=
et
>> >> >
>> >> > Yes, that's essentially the same as what I'm getting.
>> >> >
>> >> > Now try "cat foo/test1" and what happens?
>> >> >
>> >> > There is no file called test_target in the foo directory. And neith=
er
>> >> > is
>> >> > there a file called brcm/test_target in the foo directory.
>> >>
>> >> Correct. The above was just an example to show that you can * create
>> >> symlinks * in the foo directory without cd'ing into the foo directory
>> >> first.
>> >>
>> >> If you'd like the symlinks in the example to point to valid targets
>> >> then you need to create the targets too, e.g.
>> >>
>> >>   $ mkdir -p foo/brcm
>> >>   $ echo hello > foo/test_target
>> >>   $ echo hello2 > foo/brcm/test_target
>> >>
>> >> But note that the process of creating a symlink is always the same,
>> >> regardless of whether the symlink points to a valid target or not (so
>> >> you can run these extra commands to create the targets before or afte=
r
>> >> you create the symlinks).
>> >
>> > So that doesn't work for me how I expect it to work. I must be missing
>> > something fundamental here.
>> >
>> > The recipe is trying to create a soft link from a file in the current
>> > directory to a file in the sub-directory. On my system, your example
>> > creates
>> > links from a file in the sub-directory to the another file in the
>> > sub-directory.
>> >
>> > So, to copy your example, but creating the file "test_target" from the
>> > start:
>> >
>> > $ mkdir -p /tmp/test
>> > $ cd /tmp/test
>> > $ mkdir foo
>> > $ echo 1 > test_target
>>
>> Here you are creating "test_target" in the directory which contains
>> foo, not inside foo. So a symlink inside foo pointing to "test_target"
>> isn't going to work.
>
> Exactly my point! Martin asked me to do this:
>
>> ln -sf brcmfmac43430-sdio.AP6212.txt
>> ${D}${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.txt
>
> Which is in essence what I'm doing above. It won't work. The file
> "brcmfmac43430-sdio.AP6212.txt" doesn't exist in the current directory.
> That's why there's a "cd" command in there.

I think you're really still quite confused about something here...

You don't need to have any file existing in the current directory (or
anywhere else) in order to create a symlink. The symlink exists on
it's own. Creating the file that the symlink points to is an entirely
separate step.

> I think, in hind sight, the problem is that there is no path specified fo=
r
> the original file. Hence, the email I've just sent, suggests I could make
> this mod:
>
> -       ( cd ${D}${nonarch_base_libdir}/firmware/brcm/ ; ln -sf
> brcmfmac43430-sdio.MUR1DX.txt brcmfmac43430-sdio.txt)
> +      ( ln -sf
> ${D}${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.MUR1DX.txt
> ${D}${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.txt)
>
>
>
>>
>>
>> > $ ln -sf test_target foo/test1
>> > $ ln -sf brcm/test_target foo/test2
>> > $ ls -l foo
>> > total 0
>> > lrwxrwxrwx 1 ryan ryan 11 Aug 23 06:54 test1 -> test_target
>> > lrwxrwxrwx 1 ryan ryan 16 Aug 23 06:54 test2 -> brcm/test_target
>> > $ cat test_target
>> > 1
>> > $ cat foo/test1
>> > cat: foo/test1: No such file or directory
>> > $ cat foo/test2
>> > cat: foo/test2: No such file or directory
>>
>> All as expected given that none of the symlink targets exist yet.
>>
>> > $ echo hello > foo/test_target
>> > $ echo hello2 > foo/brcm/test_target
>> > bash: foo/brcm/test_target: No such file or directory
>>
>> You can't create a file within the foo/brcm subdirectory without
>> creating that subdirectory first. You've somehow missed that step -
>> although it was in my example.
>
> Well, your example said:
>
>>  $ mkdir foo
>>  $ ln -sf test_target foo/test1
>>  $ ln -sf brcm/test_target foo/test2
>>  $ ls -l foo
>
> ... and I was trying to show that it doesn't work. Although in fairness, =
you
> did add the "mkdir -p foo/brcm" command in a later email. So I think we'r=
e
> both arguing the same point and neither of us is making ourselves very
> clear.
>
> So I don't think we need to continue down this track. Martin's original
> suggestion won't work for the reasons we've both just discussed. If I add
> the absolute paths to the source and target, it should be fine.

If you make it down as far as the end of the previous email you'll
find a simplified example of Martin's suggestion. Please try it. It
does work.

>
>>
>> > $ cat foo/test1
>> > hello
>> > $ cat foo/test2
>> > cat: foo/test2: No such file or directory
>> > $ cat test_target
>> > 1
>> > $ tree
>> > .
>> > =E2=94=9C=E2=94=80=E2=94=80 foo
>> > =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 test1 -> test_target
>> > =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 test2 -> brcm/test_target
>> > =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 test_target
>> > =E2=94=94=E2=94=80=E2=94=80 test_target
>> >
>> > 1 directory, 4 files
>>
>> No real mysteries here. Everything looks as expected given the
>> comments above about how you creating the target files.
>>
>> > So, neither test1 nor test2 are linked to /tmp/test/test_target.
>>
>> As expected. For a symlink which is in the foo subdirectory, the
>> target would have to be "../test_target" to correctly point to your
>> /tmp/test/test_target file.
>>
>> > test1 is
>> > linked to /tmp/test/foo/test_target
>>
>> Not exactly. The test1 symlink in foo just points to "test_target",
>> there's no absolute path.
>>
>> ie if you renamed the foo directory to something else then the test1
>> symlink would still point "test_target" and it would still be a valid
>> link.
>>
>> > and test2 is linked to
>> > /tmp/test/brcm/test_target, which doesn't exist.
>>
>> Again, test2 is a relative symlink, not absolute. The test2 symlink
>> points to a target which doesn't exist due to a missing "mkdir -p
>> foo/brcm" before you tried to create the target file.
>>
>> > AFAIK, when creating a softlink, you have to give it either an absolut=
e
>> > path, or a path relative to the link being created. The path cannot be
>> > relative to the original file that you want to link to.
>>
>> The only real restriction when creating a symlink is that the
>> directory which will contain the symlink must exist.
>>
>> If you want the symlink to point to something then it's up to you to
>> arrange that the target exists and the symlink points to it correctly
>> - but the symlink can still be created even if the target doesn't
>> point to anything valid.
>>
>> > So, this will work:
>> >
>> > $cd /tmp/test
>> > $ ln -sf ../test_target foo/test3
>> > $ cat foo/test3
>> > 1
>> > $ cat /tmp/test/foo/test3
>> > 1
>> >
>> > But that is a strange way to create the soft link, IMO.
>>
>> What's strange about it?
>>
>> > AFAICT, for the recipe, to get rid of the "cd", I'd have to specify an
>> > absolute path to the original file:
>> >
>> > +do_install_append_bcm43430-nvram-mur1dx() {
>> > +       ( ln -sf ${PWD}/brcmfmac43430-sdio.MUR1DX.txt
>> > ${D}${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.txt)
>> >
>> > ... assuming PWD is available to the recipe. There will be a proper
>> > Yocto
>> > variable I can use, of course, but I can't think of it right now.
>>
>> That definitely doesn't look right...
>>
>> > Either way, Martin's example doesn't work for me. And adding the
>> > absolute
>> > path of the original file doesn't seem any neater or clearer than
>> > following
>> > the TI example from the do_install a few lines up in the recipe. But I=
'm
>> > happy to do it either way, so long as it works.
>>
>> Martin's example is basically saying (correctly) that this sequence:
>>
>>   mkdir foo
>>   echo hello > foo/target
>>   cd foo
>>   ln -sf target link
>>   cd ..
>>
>> is equivalent to this one:
>>
>>   mkdir foo
>>   echo hello > foo/target
>>   ln -sf target foo/link
>>
>> Notice that the first parameter to ln (the thing you want the symlink
>> to point to) is the same in both cases. ie it isn't affected by which
>> directory you are in when you create the symlink.

