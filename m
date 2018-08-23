Return-Path: <armccurdy@gmail.com>
Received: from mail-vk0-f46.google.com (mail-vk0-f46.google.com
	[209.85.213.46])
	by mail.openembedded.org (Postfix) with ESMTP id E3DFD792C5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2018 07:06:08 +0000 (UTC)
Received: by mail-vk0-f46.google.com with SMTP id e139-v6so2108528vkf.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2018 00:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=VsQwKqA1xC8zW3qO5X97PGu4ko3HW5BL06TOFi79Ti8=;
	b=U9XMJUzizDE7ywptJDXupOo7EdN4YZvSJ8lzdYZZcboVeqIeTyeW11iZTOCo+/tr1R
	PlTm+ZpGGBhtVtfheVhXeJSmD0UWFT6wGDo++mL3bpdkV/VxWvc765we2lnGtCnP6Brr
	b5UMc+0c6YtZE29x1dAisqcbA8oviGjs0KAMv181+ToOIpVb1J6zEXCSzVtna95mFvbi
	egSqQ+W9w60x+lxWebZLCeKTlwZWTfs0kaUqJ1tUQgeIwqJRIz6ocWRh1gGxdyQXD9ut
	d2qNUCO0OQeZwCgqiTXsMh3ZjlLiZCCsx9zkrhnyQaxBkLb4EuBR/4V0ICY0ihyRBVIs
	uceQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=VsQwKqA1xC8zW3qO5X97PGu4ko3HW5BL06TOFi79Ti8=;
	b=ifMl1B0+YlCAJrSe3gc+obHk6B7zxqptUbhYz8/VtSw+4BK8bxXx0zXWfi7JTs4I77
	wDtGPLqjOZ6fsU5s7ypldylUJJY0CebiOTsucHsvvxjMFeo8q4+3VNTuWHlNdrpBfrsM
	dagbX7pI1Ekj+2VlB9FkyMdn8O5cYg47udMbDejxA02+SYYWrJascHXSFMKr9Nqg/yOK
	TI/SKydtlvzM0HocBoNf42mt5v8q8UbAN/CcMp2yUFURtNloVbc019Mp57PsexpNS9tf
	/dPsPn9PXOj2G9ru++Ykub/KRt+WoIy8BqR/3ke575/QL2azMOdnisZOc5LygFbIInL8
	QNEA==
X-Gm-Message-State: APzg51AAAdpgrRqhfTvHHMzzmoncKSCvS1P1Lsu2l18y6UI3OjLXsHRq
	P09SqmzQwxWzGGSvWGD/7I4pb/IyACzlInGz100=
X-Google-Smtp-Source: ANB0VdahYunIxQzsIVYEfUBxiwZ2uK+AzPAzYZYZ07ZhV25xsrMtqMlrc3HCWG/6HbNdiqgd/7E7A1b2czIVQYUMEr4=
X-Received: by 2002:a1f:ff1d:: with SMTP id
	p29-v6mr1711483vki.22.1535007969675; 
	Thu, 23 Aug 2018 00:06:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:2a:0:0:0:0:0 with HTTP;
	Thu, 23 Aug 2018 00:06:08 -0700 (PDT)
In-Reply-To: <CAD0U-h+yMkaadysGDcmhZHSPY8tgbw_O8jquynJduChJjgypxA@mail.gmail.com>
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
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 23 Aug 2018 00:06:08 -0700
Message-ID: <CAJ86T=VzHK2Gv4T6sq6WQrqaTzdbDN2H4G4uenVtR3hdttGPaQ@mail.gmail.com>
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
X-List-Received-Date: Thu, 23 Aug 2018 07:06:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 22, 2018 at 11:12 PM, Ryan Harkin <ryan.harkin@linaro.org> wrot=
e:
> On 22 August 2018 at 23:55, Andre McCurdy <armccurdy@gmail.com> wrote:
>> On Wed, Aug 22, 2018 at 2:56 PM, Ryan Harkin <ryan.harkin@linaro.org>
>> wrote:
>> > On Wed, 22 Aug 2018, 21:42 Andre McCurdy, <armccurdy@gmail.com> wrote:
>> >> On Wed, Aug 22, 2018 at 1:10 PM, Ryan Harkin <ryan.harkin@linaro.org>
>> >> wrote:
>> >> > On Wed, 22 Aug 2018, 20:02 Martin Jansa, <martin.jansa@gmail.com>
>> >> > wrote:
>> >> >>
>> >> >> Your 1st parameter is wrong, compare again with the example I gave
>> >> >> you
>> >> >> (don't include "brcm/" path in 1st param, because you want the
>> >> >> symlink
>> >> >> to
>> >> >> point to just brcmfmac43430-sdio.AP6212.txt like you did in the
>> >> >> version
>> >> >> after cd).
>> >> >
>> >> > That doesn't work either. I tried it with the same result, but didn=
't
>> >> > send a
>> >> > log of it. That works for you?
>> >>
>> >> Martin's example is correct so maybe check your tests again for typos=
.
>> >> It it still doesn't work then please do send a log.
>> >>
>> >> The link will point to whatever you define via the first parameter, s=
o
>> >> if you changed the first parameter it shouldn't be possible to get
>> >> "the same result".
>> >>
>> >>   $ mkdir foo
>> >>   $ ln -sf test_target foo/test1
>> >>   $ ln -sf brcm/test_target foo/test2
>> >>   $ ls -l foo
>> >>
>> >>   lrwxrwxrwx 1 andre andre 11 Aug 22 13:35 test1 -> test_target
>> >>   lrwxrwxrwx 1 andre andre 16 Aug 22 13:35 test2 -> brcm/test_target
>> >
>> > Yes, that's essentially the same as what I'm getting.
>> >
>> > Now try "cat foo/test1" and what happens?
>> >
>> > There is no file called test_target in the foo directory. And neither =
is
>> > there a file called brcm/test_target in the foo directory.
>>
>> Correct. The above was just an example to show that you can * create
>> symlinks * in the foo directory without cd'ing into the foo directory
>> first.
>>
>> If you'd like the symlinks in the example to point to valid targets
>> then you need to create the targets too, e.g.
>>
>>   $ mkdir -p foo/brcm
>>   $ echo hello > foo/test_target
>>   $ echo hello2 > foo/brcm/test_target
>>
>> But note that the process of creating a symlink is always the same,
>> regardless of whether the symlink points to a valid target or not (so
>> you can run these extra commands to create the targets before or after
>> you create the symlinks).
>
> So that doesn't work for me how I expect it to work. I must be missing
> something fundamental here.
>
> The recipe is trying to create a soft link from a file in the current
> directory to a file in the sub-directory. On my system, your example crea=
tes
> links from a file in the sub-directory to the another file in the
> sub-directory.
>
> So, to copy your example, but creating the file "test_target" from the
> start:
>
> $ mkdir -p /tmp/test
> $ cd /tmp/test
> $ mkdir foo
> $ echo 1 > test_target

Here you are creating "test_target" in the directory which contains
foo, not inside foo. So a symlink inside foo pointing to "test_target"
isn't going to work.

> $ ln -sf test_target foo/test1
> $ ln -sf brcm/test_target foo/test2
> $ ls -l foo
> total 0
> lrwxrwxrwx 1 ryan ryan 11 Aug 23 06:54 test1 -> test_target
> lrwxrwxrwx 1 ryan ryan 16 Aug 23 06:54 test2 -> brcm/test_target
> $ cat test_target
> 1
> $ cat foo/test1
> cat: foo/test1: No such file or directory
> $ cat foo/test2
> cat: foo/test2: No such file or directory

All as expected given that none of the symlink targets exist yet.

> $ echo hello > foo/test_target
> $ echo hello2 > foo/brcm/test_target
> bash: foo/brcm/test_target: No such file or directory

You can't create a file within the foo/brcm subdirectory without
creating that subdirectory first. You've somehow missed that step -
although it was in my example.

> $ cat foo/test1
> hello
> $ cat foo/test2
> cat: foo/test2: No such file or directory
> $ cat test_target
> 1
> $ tree
> .
> =E2=94=9C=E2=94=80=E2=94=80 foo
> =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 test1 -> test_target
> =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 test2 -> brcm/test_target
> =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 test_target
> =E2=94=94=E2=94=80=E2=94=80 test_target
>
> 1 directory, 4 files

No real mysteries here. Everything looks as expected given the
comments above about how you creating the target files.

> So, neither test1 nor test2 are linked to /tmp/test/test_target.

As expected. For a symlink which is in the foo subdirectory, the
target would have to be "../test_target" to correctly point to your
/tmp/test/test_target file.

> test1 is
> linked to /tmp/test/foo/test_target

Not exactly. The test1 symlink in foo just points to "test_target",
there's no absolute path.

ie if you renamed the foo directory to something else then the test1
symlink would still point "test_target" and it would still be a valid
link.

> and test2 is linked to
> /tmp/test/brcm/test_target, which doesn't exist.

Again, test2 is a relative symlink, not absolute. The test2 symlink
points to a target which doesn't exist due to a missing "mkdir -p
foo/brcm" before you tried to create the target file.

> AFAIK, when creating a softlink, you have to give it either an absolute
> path, or a path relative to the link being created. The path cannot be
> relative to the original file that you want to link to.

The only real restriction when creating a symlink is that the
directory which will contain the symlink must exist.

If you want the symlink to point to something then it's up to you to
arrange that the target exists and the symlink points to it correctly
- but the symlink can still be created even if the target doesn't
point to anything valid.

> So, this will work:
>
> $cd /tmp/test
> $ ln -sf ../test_target foo/test3
> $ cat foo/test3
> 1
> $ cat /tmp/test/foo/test3
> 1
>
> But that is a strange way to create the soft link, IMO.

What's strange about it?

> AFAICT, for the recipe, to get rid of the "cd", I'd have to specify an
> absolute path to the original file:
>
> +do_install_append_bcm43430-nvram-mur1dx() {
> +       ( ln -sf ${PWD}/brcmfmac43430-sdio.MUR1DX.txt
> ${D}${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.txt)
>
> ... assuming PWD is available to the recipe. There will be a proper Yocto
> variable I can use, of course, but I can't think of it right now.

That definitely doesn't look right...

> Either way, Martin's example doesn't work for me. And adding the absolute
> path of the original file doesn't seem any neater or clearer than followi=
ng
> the TI example from the do_install a few lines up in the recipe. But I'm
> happy to do it either way, so long as it works.

Martin's example is basically saying (correctly) that this sequence:

  mkdir foo
  echo hello > foo/target
  cd foo
  ln -sf target link
  cd ..

is equivalent to this one:

  mkdir foo
  echo hello > foo/target
  ln -sf target foo/link

Notice that the first parameter to ln (the thing you want the symlink
to point to) is the same in both cases. ie it isn't affected by which
directory you are in when you create the symlink.

