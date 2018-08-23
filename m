Return-Path: <ryan.harkin@linaro.org>
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
	[209.85.167.42])
	by mail.openembedded.org (Postfix) with ESMTP id 50491794AB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2018 07:36:43 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id g9-v6so3353775lfh.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2018 00:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=WHBhgbG9NzVJIps8Kc5/XLtnK9cAphQaUuNddeBaZ9M=;
	b=F3l3vHHnx6+El2fcfWX2DjRbMsvZ24eSh9B8zTlmziqu7HauPjHqs5wfiZBLNdGhj5
	z1bZGRprIlFk6fWubqxhQW0hn3JMLd/m4KvKpsKEdZTlimzGdB83WLQn23VoTRC4nIXW
	ubf0L6FBPunB6SwvbgQV05UfeWvl1MHkeaQ4I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=WHBhgbG9NzVJIps8Kc5/XLtnK9cAphQaUuNddeBaZ9M=;
	b=DxuSh222CImHwDS8F0INcl2p0lGdeQzoqZqlUNb3PFUZ50AvU1qCUpQYTwLpD4qtpF
	DfR5/TNCGy/0h+yatoa9Va+fNhZjbovRLXhxk5Ump/MQdEtHqaVNmyHfShXgOSx3j3mG
	UIlwWpnOf5xivdLYAsUWvLy94DfqfUhQVYp4nNvqEDMRBaKHKqKvUMBBoT7CIIrxPIns
	XXiivrSHpPVX2JcD4VCq3lK09PEWEh58yE20O3sV7+H8X+owS0qbceieepklOlifhDnG
	xpkvIEr8MzY2Hi3WTy3Yu94LbmTVl6A+WgqQUzNXukI1p/TaOgXmQ6GPUgLgJ0siLZvT
	PPJw==
X-Gm-Message-State: AOUpUlGLpStf01KiLArTqpY+TvTcjkX3Euuz1OxpCoC0dI0s5EdQ3aY6
	Sbtvv411oVPOBw9+qKEBmVr/6mfe4jH+txxqQJ6+wA==
X-Google-Smtp-Source: AA+uWPwNoJeGdGIL3k4Jue06Yl171A5kUKl3WgxHnDSem6sCp+Sf+oiGALu8M5YbCoZBbWFVzqia4VasaPLVWsicuuM=
X-Received: by 2002:a19:d942:: with SMTP id
	q63-v6mr35959389lfg.39.1535009803794; 
	Thu, 23 Aug 2018 00:36:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab3:1bc7:0:0:0:0:0 with HTTP; Thu, 23 Aug 2018 00:36:43
	-0700 (PDT)
In-Reply-To: <CAJ86T=VyaXSYQG7ykznu2yNSNArSRTf7-T-RZqpNG39+dQ9=nw@mail.gmail.com>
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
	<CAJ86T=VyaXSYQG7ykznu2yNSNArSRTf7-T-RZqpNG39+dQ9=nw@mail.gmail.com>
From: Ryan Harkin <ryan.harkin@linaro.org>
Date: Thu, 23 Aug 2018 08:36:43 +0100
Message-ID: <CAD0U-hJ1jcOs0a-7ApiDMLRPoT6JbWCm7PqmFNn9U7xhc27ehw@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
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
X-List-Received-Date: Thu, 23 Aug 2018 07:36:44 -0000
Content-Type: multipart/alternative; boundary="0000000000001514c8057415522d"

--0000000000001514c8057415522d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 23 August 2018 at 08:34, Andre McCurdy <armccurdy@gmail.com> wrote:

> On Thu, Aug 23, 2018 at 12:17 AM, Ryan Harkin <ryan.harkin@linaro.org>
> wrote:
> > On 23 August 2018 at 08:06, Andre McCurdy <armccurdy@gmail.com> wrote:
> >> On Wed, Aug 22, 2018 at 11:12 PM, Ryan Harkin <ryan.harkin@linaro.org>
> >> wrote:
> >> > On 22 August 2018 at 23:55, Andre McCurdy <armccurdy@gmail.com>
> wrote:
> >> >> On Wed, Aug 22, 2018 at 2:56 PM, Ryan Harkin <ryan.harkin@linaro.or=
g
> >
> >> >> wrote:
> >> >> > On Wed, 22 Aug 2018, 21:42 Andre McCurdy, <armccurdy@gmail.com>
> >> >> > wrote:
> >> >> >> On Wed, Aug 22, 2018 at 1:10 PM, Ryan Harkin
> >> >> >> <ryan.harkin@linaro.org>
> >> >> >> wrote:
> >> >> >> > On Wed, 22 Aug 2018, 20:02 Martin Jansa, <
> martin.jansa@gmail.com>
> >> >> >> > wrote:
> >> >> >> >>
> >> >> >> >> Your 1st parameter is wrong, compare again with the example I
> >> >> >> >> gave
> >> >> >> >> you
> >> >> >> >> (don't include "brcm/" path in 1st param, because you want th=
e
> >> >> >> >> symlink
> >> >> >> >> to
> >> >> >> >> point to just brcmfmac43430-sdio.AP6212.txt like you did in t=
he
> >> >> >> >> version
> >> >> >> >> after cd).
> >> >> >> >
> >> >> >> > That doesn't work either. I tried it with the same result, but
> >> >> >> > didn't
> >> >> >> > send a
> >> >> >> > log of it. That works for you?
> >> >> >>
> >> >> >> Martin's example is correct so maybe check your tests again for
> >> >> >> typos.
> >> >> >> It it still doesn't work then please do send a log.
> >> >> >>
> >> >> >> The link will point to whatever you define via the first
> parameter,
> >> >> >> so
> >> >> >> if you changed the first parameter it shouldn't be possible to g=
et
> >> >> >> "the same result".
> >> >> >>
> >> >> >>   $ mkdir foo
> >> >> >>   $ ln -sf test_target foo/test1
> >> >> >>   $ ln -sf brcm/test_target foo/test2
> >> >> >>   $ ls -l foo
> >> >> >>
> >> >> >>   lrwxrwxrwx 1 andre andre 11 Aug 22 13:35 test1 -> test_target
> >> >> >>   lrwxrwxrwx 1 andre andre 16 Aug 22 13:35 test2 ->
> brcm/test_target
> >> >> >
> >> >> > Yes, that's essentially the same as what I'm getting.
> >> >> >
> >> >> > Now try "cat foo/test1" and what happens?
> >> >> >
> >> >> > There is no file called test_target in the foo directory. And
> neither
> >> >> > is
> >> >> > there a file called brcm/test_target in the foo directory.
> >> >>
> >> >> Correct. The above was just an example to show that you can * creat=
e
> >> >> symlinks * in the foo directory without cd'ing into the foo directo=
ry
> >> >> first.
> >> >>
> >> >> If you'd like the symlinks in the example to point to valid targets
> >> >> then you need to create the targets too, e.g.
> >> >>
> >> >>   $ mkdir -p foo/brcm
> >> >>   $ echo hello > foo/test_target
> >> >>   $ echo hello2 > foo/brcm/test_target
> >> >>
> >> >> But note that the process of creating a symlink is always the same,
> >> >> regardless of whether the symlink points to a valid target or not (=
so
> >> >> you can run these extra commands to create the targets before or
> after
> >> >> you create the symlinks).
> >> >
> >> > So that doesn't work for me how I expect it to work. I must be missi=
ng
> >> > something fundamental here.
> >> >
> >> > The recipe is trying to create a soft link from a file in the curren=
t
> >> > directory to a file in the sub-directory. On my system, your example
> >> > creates
> >> > links from a file in the sub-directory to the another file in the
> >> > sub-directory.
> >> >
> >> > So, to copy your example, but creating the file "test_target" from t=
he
> >> > start:
> >> >
> >> > $ mkdir -p /tmp/test
> >> > $ cd /tmp/test
> >> > $ mkdir foo
> >> > $ echo 1 > test_target
> >>
> >> Here you are creating "test_target" in the directory which contains
> >> foo, not inside foo. So a symlink inside foo pointing to "test_target"
> >> isn't going to work.
> >
> > Exactly my point! Martin asked me to do this:
> >
> >> ln -sf brcmfmac43430-sdio.AP6212.txt
> >> ${D}${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.txt
> >
> > Which is in essence what I'm doing above. It won't work. The file
> > "brcmfmac43430-sdio.AP6212.txt" doesn't exist in the current directory.
> > That's why there's a "cd" command in there.
>
> I think you're really still quite confused about something here...
>
> You don't need to have any file existing in the current directory (or
> anywhere else) in order to create a symlink. The symlink exists on
> it's own. Creating the file that the symlink points to is an entirely
> separate step.
>
> > I think, in hind sight, the problem is that there is no path specified
> for
> > the original file. Hence, the email I've just sent, suggests I could ma=
ke
> > this mod:
> >
> > -       ( cd ${D}${nonarch_base_libdir}/firmware/brcm/ ; ln -sf
> > brcmfmac43430-sdio.MUR1DX.txt brcmfmac43430-sdio.txt)
> > +      ( ln -sf
> > ${D}${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.MUR1DX.txt
> > ${D}${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.txt)
> >
> >
> >
> >>
> >>
> >> > $ ln -sf test_target foo/test1
> >> > $ ln -sf brcm/test_target foo/test2
> >> > $ ls -l foo
> >> > total 0
> >> > lrwxrwxrwx 1 ryan ryan 11 Aug 23 06:54 test1 -> test_target
> >> > lrwxrwxrwx 1 ryan ryan 16 Aug 23 06:54 test2 -> brcm/test_target
> >> > $ cat test_target
> >> > 1
> >> > $ cat foo/test1
> >> > cat: foo/test1: No such file or directory
> >> > $ cat foo/test2
> >> > cat: foo/test2: No such file or directory
> >>
> >> All as expected given that none of the symlink targets exist yet.
> >>
> >> > $ echo hello > foo/test_target
> >> > $ echo hello2 > foo/brcm/test_target
> >> > bash: foo/brcm/test_target: No such file or directory
> >>
> >> You can't create a file within the foo/brcm subdirectory without
> >> creating that subdirectory first. You've somehow missed that step -
> >> although it was in my example.
> >
> > Well, your example said:
> >
> >>  $ mkdir foo
> >>  $ ln -sf test_target foo/test1
> >>  $ ln -sf brcm/test_target foo/test2
> >>  $ ls -l foo
> >
> > ... and I was trying to show that it doesn't work. Although in fairness=
,
> you
> > did add the "mkdir -p foo/brcm" command in a later email. So I think
> we're
> > both arguing the same point and neither of us is making ourselves very
> > clear.
> >
> > So I don't think we need to continue down this track. Martin's original
> > suggestion won't work for the reasons we've both just discussed. If I a=
dd
> > the absolute paths to the source and target, it should be fine.
>
> If you make it down as far as the end of the previous email you'll
> find a simplified example of Martin's suggestion. Please try it. It
> does work.
>

I think you're right. As was Martin.

I was starting to respond to your previous email but I'll cut it short and
just say that I apologise for the confusion and distraction and I'll make
the mod Martin suggested and test it works.



> >
> >>
> >> > $ cat foo/test1
> >> > hello
> >> > $ cat foo/test2
> >> > cat: foo/test2: No such file or directory
> >> > $ cat test_target
> >> > 1
> >> > $ tree
> >> > .
> >> > =E2=94=9C=E2=94=80=E2=94=80 foo
> >> > =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 test1 -> test_target
> >> > =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 test2 -> brcm/test_target
> >> > =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 test_target
> >> > =E2=94=94=E2=94=80=E2=94=80 test_target
> >> >
> >> > 1 directory, 4 files
> >>
> >> No real mysteries here. Everything looks as expected given the
> >> comments above about how you creating the target files.
> >>
> >> > So, neither test1 nor test2 are linked to /tmp/test/test_target.
> >>
> >> As expected. For a symlink which is in the foo subdirectory, the
> >> target would have to be "../test_target" to correctly point to your
> >> /tmp/test/test_target file.
> >>
> >> > test1 is
> >> > linked to /tmp/test/foo/test_target
> >>
> >> Not exactly. The test1 symlink in foo just points to "test_target",
> >> there's no absolute path.
> >>
> >> ie if you renamed the foo directory to something else then the test1
> >> symlink would still point "test_target" and it would still be a valid
> >> link.
> >>
> >> > and test2 is linked to
> >> > /tmp/test/brcm/test_target, which doesn't exist.
> >>
> >> Again, test2 is a relative symlink, not absolute. The test2 symlink
> >> points to a target which doesn't exist due to a missing "mkdir -p
> >> foo/brcm" before you tried to create the target file.
> >>
> >> > AFAIK, when creating a softlink, you have to give it either an
> absolute
> >> > path, or a path relative to the link being created. The path cannot =
be
> >> > relative to the original file that you want to link to.
> >>
> >> The only real restriction when creating a symlink is that the
> >> directory which will contain the symlink must exist.
> >>
> >> If you want the symlink to point to something then it's up to you to
> >> arrange that the target exists and the symlink points to it correctly
> >> - but the symlink can still be created even if the target doesn't
> >> point to anything valid.
> >>
> >> > So, this will work:
> >> >
> >> > $cd /tmp/test
> >> > $ ln -sf ../test_target foo/test3
> >> > $ cat foo/test3
> >> > 1
> >> > $ cat /tmp/test/foo/test3
> >> > 1
> >> >
> >> > But that is a strange way to create the soft link, IMO.
> >>
> >> What's strange about it?
> >>
> >> > AFAICT, for the recipe, to get rid of the "cd", I'd have to specify =
an
> >> > absolute path to the original file:
> >> >
> >> > +do_install_append_bcm43430-nvram-mur1dx() {
> >> > +       ( ln -sf ${PWD}/brcmfmac43430-sdio.MUR1DX.txt
> >> > ${D}${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.txt)
> >> >
> >> > ... assuming PWD is available to the recipe. There will be a proper
> >> > Yocto
> >> > variable I can use, of course, but I can't think of it right now.
> >>
> >> That definitely doesn't look right...
> >>
> >> > Either way, Martin's example doesn't work for me. And adding the
> >> > absolute
> >> > path of the original file doesn't seem any neater or clearer than
> >> > following
> >> > the TI example from the do_install a few lines up in the recipe. But
> I'm
> >> > happy to do it either way, so long as it works.
> >>
> >> Martin's example is basically saying (correctly) that this sequence:
> >>
> >>   mkdir foo
> >>   echo hello > foo/target
> >>   cd foo
> >>   ln -sf target link
> >>   cd ..
> >>
> >> is equivalent to this one:
> >>
> >>   mkdir foo
> >>   echo hello > foo/target
> >>   ln -sf target foo/link
> >>
> >> Notice that the first parameter to ln (the thing you want the symlink
> >> to point to) is the same in both cases. ie it isn't affected by which
> >> directory you are in when you create the symlink.
>

--0000000000001514c8057415522d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On 23 August 2018 at 08:34, Andre McCurdy <span dir=3D"ltr">&lt;<a href=
=3D"mailto:armccurdy@gmail.com" target=3D"_blank">armccurdy@gmail.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><d=
iv class=3D"h5">On Thu, Aug 23, 2018 at 12:17 AM, Ryan Harkin &lt;<a href=
=3D"mailto:ryan.harkin@linaro.org">ryan.harkin@linaro.org</a>&gt; wrote:<br=
>
&gt; On 23 August 2018 at 08:06, Andre McCurdy &lt;<a href=3D"mailto:armccu=
rdy@gmail.com">armccurdy@gmail.com</a>&gt; wrote:<br>
&gt;&gt; On Wed, Aug 22, 2018 at 11:12 PM, Ryan Harkin &lt;<a href=3D"mailt=
o:ryan.harkin@linaro.org">ryan.harkin@linaro.org</a>&gt;<br>
&gt;&gt; wrote:<br>
&gt;&gt; &gt; On 22 August 2018 at 23:55, Andre McCurdy &lt;<a href=3D"mail=
to:armccurdy@gmail.com">armccurdy@gmail.com</a>&gt; wrote:<br>
&gt;&gt; &gt;&gt; On Wed, Aug 22, 2018 at 2:56 PM, Ryan Harkin &lt;<a href=
=3D"mailto:ryan.harkin@linaro.org">ryan.harkin@linaro.org</a>&gt;<br>
&gt;&gt; &gt;&gt; wrote:<br>
&gt;&gt; &gt;&gt; &gt; On Wed, 22 Aug 2018, 21:42 Andre McCurdy, &lt;<a hre=
f=3D"mailto:armccurdy@gmail.com">armccurdy@gmail.com</a>&gt;<br>
&gt;&gt; &gt;&gt; &gt; wrote:<br>
&gt;&gt; &gt;&gt; &gt;&gt; On Wed, Aug 22, 2018 at 1:10 PM, Ryan Harkin<br>
&gt;&gt; &gt;&gt; &gt;&gt; &lt;<a href=3D"mailto:ryan.harkin@linaro.org">ry=
an.harkin@linaro.org</a>&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; wrote:<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; On Wed, 22 Aug 2018, 20:02 Martin Jansa, &l=
t;<a href=3D"mailto:martin.jansa@gmail.com">martin.jansa@gmail.com</a>&gt;<=
br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; wrote:<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; Your 1st parameter is wrong, compare ag=
ain with the example I<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; gave<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; you<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; (don&#39;t include &quot;brcm/&quot; pa=
th in 1st param, because you want the<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; symlink<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; to<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; point to just brcmfmac43430-sdio.AP6212=
.txt like you did in the<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; version<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; after cd).<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; That doesn&#39;t work either. I tried it wi=
th the same result, but<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; didn&#39;t<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; send a<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; log of it. That works for you?<br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; Martin&#39;s example is correct so maybe check y=
our tests again for<br>
&gt;&gt; &gt;&gt; &gt;&gt; typos.<br>
&gt;&gt; &gt;&gt; &gt;&gt; It it still doesn&#39;t work then please do send=
 a log.<br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; The link will point to whatever you define via t=
he first parameter,<br>
&gt;&gt; &gt;&gt; &gt;&gt; so<br>
&gt;&gt; &gt;&gt; &gt;&gt; if you changed the first parameter it shouldn&#3=
9;t be possible to get<br>
&gt;&gt; &gt;&gt; &gt;&gt; &quot;the same result&quot;.<br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0$ mkdir foo<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0$ ln -sf test_target foo/test1<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0$ ln -sf brcm/test_target foo/test2<=
br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0$ ls -l foo<br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0lrwxrwxrwx 1 andre andre 11 Aug 22 1=
3:35 test1 -&gt; test_target<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0lrwxrwxrwx 1 andre andre 16 Aug 22 1=
3:35 test2 -&gt; brcm/test_target<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; Yes, that&#39;s essentially the same as what I&#39;m=
 getting.<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; Now try &quot;cat foo/test1&quot; and what happens?<=
br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; There is no file called test_target in the foo direc=
tory. And neither<br>
&gt;&gt; &gt;&gt; &gt; is<br>
&gt;&gt; &gt;&gt; &gt; there a file called brcm/test_target in the foo dire=
ctory.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Correct. The above was just an example to show that you c=
an * create<br>
&gt;&gt; &gt;&gt; symlinks * in the foo directory without cd&#39;ing into t=
he foo directory<br>
&gt;&gt; &gt;&gt; first.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; If you&#39;d like the symlinks in the example to point to=
 valid targets<br>
&gt;&gt; &gt;&gt; then you need to create the targets too, e.g.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0$ mkdir -p foo/brcm<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0$ echo hello &gt; foo/test_target<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0$ echo hello2 &gt; foo/brcm/test_target<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; But note that the process of creating a symlink is always=
 the same,<br>
&gt;&gt; &gt;&gt; regardless of whether the symlink points to a valid targe=
t or not (so<br>
&gt;&gt; &gt;&gt; you can run these extra commands to create the targets be=
fore or after<br>
&gt;&gt; &gt;&gt; you create the symlinks).<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; So that doesn&#39;t work for me how I expect it to work. I mu=
st be missing<br>
&gt;&gt; &gt; something fundamental here.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; The recipe is trying to create a soft link from a file in the=
 current<br>
&gt;&gt; &gt; directory to a file in the sub-directory. On my system, your =
example<br>
&gt;&gt; &gt; creates<br>
&gt;&gt; &gt; links from a file in the sub-directory to the another file in=
 the<br>
&gt;&gt; &gt; sub-directory.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; So, to copy your example, but creating the file &quot;test_ta=
rget&quot; from the<br>
&gt;&gt; &gt; start:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; $ mkdir -p /tmp/test<br>
&gt;&gt; &gt; $ cd /tmp/test<br>
&gt;&gt; &gt; $ mkdir foo<br>
&gt;&gt; &gt; $ echo 1 &gt; test_target<br>
&gt;&gt;<br>
&gt;&gt; Here you are creating &quot;test_target&quot; in the directory whi=
ch contains<br>
&gt;&gt; foo, not inside foo. So a symlink inside foo pointing to &quot;tes=
t_target&quot;<br>
&gt;&gt; isn&#39;t going to work.<br>
&gt;<br>
&gt; Exactly my point! Martin asked me to do this:<br>
&gt;<br>
&gt;&gt; ln -sf brcmfmac43430-sdio.AP6212.txt<br>
&gt;&gt; ${D}${nonarch_base_libdir}/<wbr>firmware/brcm/brcmfmac43430-<wbr>s=
dio.txt<br>
&gt;<br>
&gt; Which is in essence what I&#39;m doing above. It won&#39;t work. The f=
ile<br>
&gt; &quot;brcmfmac43430-sdio.AP6212.<wbr>txt&quot; doesn&#39;t exist in th=
e current directory.<br>
&gt; That&#39;s why there&#39;s a &quot;cd&quot; command in there.<br>
<br>
</div></div>I think you&#39;re really still quite confused about something =
here...<br>
<br>
You don&#39;t need to have any file existing in the current directory (or<b=
r>
anywhere else) in order to create a symlink. The symlink exists on<br>
it&#39;s own. Creating the file that the symlink points to is an entirely<b=
r>
separate step.<br>
<div><div class=3D"h5"><br>
&gt; I think, in hind sight, the problem is that there is no path specified=
 for<br>
&gt; the original file. Hence, the email I&#39;ve just sent, suggests I cou=
ld make<br>
&gt; this mod:<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0( cd ${D}${nonarch_base_libdir}/<wbr>firmw=
are/brcm/ ; ln -sf<br>
&gt; brcmfmac43430-sdio.MUR1DX.txt brcmfmac43430-sdio.txt)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 ( ln -sf<br>
&gt; ${D}${nonarch_base_libdir}/<wbr>firmware/brcm/brcmfmac43430-<wbr>sdio.=
MUR1DX.txt<br>
&gt; ${D}${nonarch_base_libdir}/<wbr>firmware/brcm/brcmfmac43430-<wbr>sdio.=
txt)<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; &gt; $ ln -sf test_target foo/test1<br>
&gt;&gt; &gt; $ ln -sf brcm/test_target foo/test2<br>
&gt;&gt; &gt; $ ls -l foo<br>
&gt;&gt; &gt; total 0<br>
&gt;&gt; &gt; lrwxrwxrwx 1 ryan ryan 11 Aug 23 06:54 test1 -&gt; test_targe=
t<br>
&gt;&gt; &gt; lrwxrwxrwx 1 ryan ryan 16 Aug 23 06:54 test2 -&gt; brcm/test_=
target<br>
&gt;&gt; &gt; $ cat test_target<br>
&gt;&gt; &gt; 1<br>
&gt;&gt; &gt; $ cat foo/test1<br>
&gt;&gt; &gt; cat: foo/test1: No such file or directory<br>
&gt;&gt; &gt; $ cat foo/test2<br>
&gt;&gt; &gt; cat: foo/test2: No such file or directory<br>
&gt;&gt;<br>
&gt;&gt; All as expected given that none of the symlink targets exist yet.<=
br>
&gt;&gt;<br>
&gt;&gt; &gt; $ echo hello &gt; foo/test_target<br>
&gt;&gt; &gt; $ echo hello2 &gt; foo/brcm/test_target<br>
&gt;&gt; &gt; bash: foo/brcm/test_target: No such file or directory<br>
&gt;&gt;<br>
&gt;&gt; You can&#39;t create a file within the foo/brcm subdirectory witho=
ut<br>
&gt;&gt; creating that subdirectory first. You&#39;ve somehow missed that s=
tep -<br>
&gt;&gt; although it was in my example.<br>
&gt;<br>
&gt; Well, your example said:<br>
&gt;<br>
&gt;&gt;=C2=A0 $ mkdir foo<br>
&gt;&gt;=C2=A0 $ ln -sf test_target foo/test1<br>
&gt;&gt;=C2=A0 $ ln -sf brcm/test_target foo/test2<br>
&gt;&gt;=C2=A0 $ ls -l foo<br>
&gt;<br>
&gt; ... and I was trying to show that it doesn&#39;t work. Although in fai=
rness, you<br>
&gt; did add the &quot;mkdir -p foo/brcm&quot; command in a later email. So=
 I think we&#39;re<br>
&gt; both arguing the same point and neither of us is making ourselves very=
<br>
&gt; clear.<br>
&gt;<br>
&gt; So I don&#39;t think we need to continue down this track. Martin&#39;s=
 original<br>
&gt; suggestion won&#39;t work for the reasons we&#39;ve both just discusse=
d. If I add<br>
&gt; the absolute paths to the source and target, it should be fine.<br>
<br>
</div></div>If you make it down as far as the end of the previous email you=
&#39;ll<br>
find a simplified example of Martin&#39;s suggestion. Please try it. It<br>
does work.<br></blockquote><div><br></div><div>I think you&#39;re right. As=
 was Martin.</div><div><br></div><div>I was starting to respond to your pre=
vious email but I&#39;ll cut it short and just say that I apologise for the=
 confusion and distraction and I&#39;ll make the mod Martin suggested and t=
est it works.</div><div><br></div><div><br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex">
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; &gt; $ cat foo/test1<br>
&gt;&gt; &gt; hello<br>
&gt;&gt; &gt; $ cat foo/test2<br>
&gt;&gt; &gt; cat: foo/test2: No such file or directory<br>
&gt;&gt; &gt; $ cat test_target<br>
&gt;&gt; &gt; 1<br>
&gt;&gt; &gt; $ tree<br>
&gt;&gt; &gt; .<br>
&gt;&gt; &gt; =E2=94=9C=E2=94=80=E2=94=80 foo<br>
&gt;&gt; &gt; =E2=94=82=C2=A0 =C2=A0=E2=94=9C=E2=94=80=E2=94=80 test1 -&gt;=
 test_target<br>
&gt;&gt; &gt; =E2=94=82=C2=A0 =C2=A0=E2=94=9C=E2=94=80=E2=94=80 test2 -&gt;=
 brcm/test_target<br>
&gt;&gt; &gt; =E2=94=82=C2=A0 =C2=A0=E2=94=94=E2=94=80=E2=94=80 test_target=
<br>
&gt;&gt; &gt; =E2=94=94=E2=94=80=E2=94=80 test_target<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; 1 directory, 4 files<br>
&gt;&gt;<br>
&gt;&gt; No real mysteries here. Everything looks as expected given the<br>
&gt;&gt; comments above about how you creating the target files.<br>
&gt;&gt;<br>
&gt;&gt; &gt; So, neither test1 nor test2 are linked to /tmp/test/test_targ=
et.<br>
&gt;&gt;<br>
&gt;&gt; As expected. For a symlink which is in the foo subdirectory, the<b=
r>
&gt;&gt; target would have to be &quot;../test_target&quot; to correctly po=
int to your<br>
&gt;&gt; /tmp/test/test_target file.<br>
&gt;&gt;<br>
&gt;&gt; &gt; test1 is<br>
&gt;&gt; &gt; linked to /tmp/test/foo/test_target<br>
&gt;&gt;<br>
&gt;&gt; Not exactly. The test1 symlink in foo just points to &quot;test_ta=
rget&quot;,<br>
&gt;&gt; there&#39;s no absolute path.<br>
&gt;&gt;<br>
&gt;&gt; ie if you renamed the foo directory to something else then the tes=
t1<br>
&gt;&gt; symlink would still point &quot;test_target&quot; and it would sti=
ll be a valid<br>
&gt;&gt; link.<br>
&gt;&gt;<br>
&gt;&gt; &gt; and test2 is linked to<br>
&gt;&gt; &gt; /tmp/test/brcm/test_target, which doesn&#39;t exist.<br>
&gt;&gt;<br>
&gt;&gt; Again, test2 is a relative symlink, not absolute. The test2 symlin=
k<br>
&gt;&gt; points to a target which doesn&#39;t exist due to a missing &quot;=
mkdir -p<br>
&gt;&gt; foo/brcm&quot; before you tried to create the target file.<br>
&gt;&gt;<br>
&gt;&gt; &gt; AFAIK, when creating a softlink, you have to give it either a=
n absolute<br>
&gt;&gt; &gt; path, or a path relative to the link being created. The path =
cannot be<br>
&gt;&gt; &gt; relative to the original file that you want to link to.<br>
&gt;&gt;<br>
&gt;&gt; The only real restriction when creating a symlink is that the<br>
&gt;&gt; directory which will contain the symlink must exist.<br>
&gt;&gt;<br>
&gt;&gt; If you want the symlink to point to something then it&#39;s up to =
you to<br>
&gt;&gt; arrange that the target exists and the symlink points to it correc=
tly<br>
&gt;&gt; - but the symlink can still be created even if the target doesn&#3=
9;t<br>
&gt;&gt; point to anything valid.<br>
&gt;&gt;<br>
&gt;&gt; &gt; So, this will work:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; $cd /tmp/test<br>
&gt;&gt; &gt; $ ln -sf ../test_target foo/test3<br>
&gt;&gt; &gt; $ cat foo/test3<br>
&gt;&gt; &gt; 1<br>
&gt;&gt; &gt; $ cat /tmp/test/foo/test3<br>
&gt;&gt; &gt; 1<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; But that is a strange way to create the soft link, IMO.<br>
&gt;&gt;<br>
&gt;&gt; What&#39;s strange about it?<br>
&gt;&gt;<br>
&gt;&gt; &gt; AFAICT, for the recipe, to get rid of the &quot;cd&quot;, I&#=
39;d have to specify an<br>
&gt;&gt; &gt; absolute path to the original file:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; +do_install_append_bcm43430-<wbr>nvram-mur1dx() {<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0( ln -sf ${PWD}/brcmfmac43430-sdi=
o.<wbr>MUR1DX.txt<br>
&gt;&gt; &gt; ${D}${nonarch_base_libdir}/<wbr>firmware/brcm/brcmfmac43430-<=
wbr>sdio.txt)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; ... assuming PWD is available to the recipe. There will be a =
proper<br>
&gt;&gt; &gt; Yocto<br>
&gt;&gt; &gt; variable I can use, of course, but I can&#39;t think of it ri=
ght now.<br>
&gt;&gt;<br>
&gt;&gt; That definitely doesn&#39;t look right...<br>
&gt;&gt;<br>
&gt;&gt; &gt; Either way, Martin&#39;s example doesn&#39;t work for me. And=
 adding the<br>
&gt;&gt; &gt; absolute<br>
&gt;&gt; &gt; path of the original file doesn&#39;t seem any neater or clea=
rer than<br>
&gt;&gt; &gt; following<br>
&gt;&gt; &gt; the TI example from the do_install a few lines up in the reci=
pe. But I&#39;m<br>
&gt;&gt; &gt; happy to do it either way, so long as it works.<br>
&gt;&gt;<br>
&gt;&gt; Martin&#39;s example is basically saying (correctly) that this seq=
uence:<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0mkdir foo<br>
&gt;&gt;=C2=A0 =C2=A0echo hello &gt; foo/target<br>
&gt;&gt;=C2=A0 =C2=A0cd foo<br>
&gt;&gt;=C2=A0 =C2=A0ln -sf target link<br>
&gt;&gt;=C2=A0 =C2=A0cd ..<br>
&gt;&gt;<br>
&gt;&gt; is equivalent to this one:<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0mkdir foo<br>
&gt;&gt;=C2=A0 =C2=A0echo hello &gt; foo/target<br>
&gt;&gt;=C2=A0 =C2=A0ln -sf target foo/link<br>
&gt;&gt;<br>
&gt;&gt; Notice that the first parameter to ln (the thing you want the syml=
ink<br>
&gt;&gt; to point to) is the same in both cases. ie it isn&#39;t affected b=
y which<br>
&gt;&gt; directory you are in when you create the symlink.<br>
</div></div></blockquote></div><br></div></div>

--0000000000001514c8057415522d--
