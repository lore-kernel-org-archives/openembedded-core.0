Return-Path: <ryan.harkin@linaro.org>
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
	[209.85.167.47])
	by mail.openembedded.org (Postfix) with ESMTP id 17314792C5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2018 07:17:44 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id x26-v6so1225167lfi.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2018 00:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=m3fh+awegwq/pVqhOGogVCDFH0BRS0hIIA0GzKcvBZA=;
	b=HvVn063x0SaSTf0UDlZ+1GVEtZemc5Nxww8irVkQzrGD5BREuWkNu2o1vq0T9pfEle
	QRr8zpNXUdAc8VZ4ZOJYyBDK2w0wMqz9FblcwZNRyCn58hWieOXQG2/KVrAiRUkR7HRm
	bTIhr/4ZFGxl6cYtAnMG5DJPBTnvBSvI+L62Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=m3fh+awegwq/pVqhOGogVCDFH0BRS0hIIA0GzKcvBZA=;
	b=TAFLZYoX2d/Ope8kD2i5cNUhuUWIqpDqu2RsrjhK2XZNkhjZWHTIRzM1hvDxNlHiNF
	exMRNI/4YTt/D3ZuL3REMhmme9cDIXjkxAybWhoqYGV9tAAZYq1ERu4KHa9ge641PQg9
	2Kqofyy3919+YqQMDm4KPMke6uIahLEIwjCPpE4QizF3dVxFN3idGvj/UKFNvlQA5Jaz
	efDH3Aa4zZISUheco3rNjj/pXJwe8iBPjp904icgPMjErZYLVRXXPLHP0MrC/+o/XXsV
	XNjAlbmsZm3vcBCISP+HWsajQOVE10DLHT6awSNsjtR526dmVLBoPV1QevIvkkjqbE0n
	NcQA==
X-Gm-Message-State: AOUpUlH/ZQrDC8tQtuidQkGzkJ1dgZecmKjt0H0gwiKv5ebuHm7iWC5H
	4yVp1an6qbSgitG+4qKcraE11khHT3oeLfH4sNZN2g==
X-Google-Smtp-Source: AA+uWPy7dWADOJR0X1SBRvoTQpzktXS26EOGAASYJTSe03FLrC2HShSyHoGAaQ4Yf07Y69z5mGpun4UnvH4GSCwKHhU=
X-Received: by 2002:a19:7411:: with SMTP id
	v17-v6mr11530953lfe.49.1535008665640; 
	Thu, 23 Aug 2018 00:17:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab3:1bc7:0:0:0:0:0 with HTTP; Thu, 23 Aug 2018 00:17:44
	-0700 (PDT)
In-Reply-To: <CAJ86T=VzHK2Gv4T6sq6WQrqaTzdbDN2H4G4uenVtR3hdttGPaQ@mail.gmail.com>
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
From: Ryan Harkin <ryan.harkin@linaro.org>
Date: Thu, 23 Aug 2018 08:17:44 +0100
Message-ID: <CAD0U-h+j4c+bf-WR3AyL9-6NuP76aND7S2bG-+QRQCHWLV6TGA@mail.gmail.com>
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
X-List-Received-Date: Thu, 23 Aug 2018 07:17:45 -0000
Content-Type: multipart/alternative; boundary="0000000000003e391b0574150e96"

--0000000000003e391b0574150e96
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 23 August 2018 at 08:06, Andre McCurdy <armccurdy@gmail.com> wrote:
>
> On Wed, Aug 22, 2018 at 11:12 PM, Ryan Harkin <ryan.harkin@linaro.org>
wrote:
> > On 22 August 2018 at 23:55, Andre McCurdy <armccurdy@gmail.com> wrote:
> >> On Wed, Aug 22, 2018 at 2:56 PM, Ryan Harkin <ryan.harkin@linaro.org>
> >> wrote:
> >> > On Wed, 22 Aug 2018, 21:42 Andre McCurdy, <armccurdy@gmail.com>
wrote:
> >> >> On Wed, Aug 22, 2018 at 1:10 PM, Ryan Harkin <ryan.harkin@linaro.or=
g
>
> >> >> wrote:
> >> >> > On Wed, 22 Aug 2018, 20:02 Martin Jansa, <martin.jansa@gmail.com>
> >> >> > wrote:
> >> >> >>
> >> >> >> Your 1st parameter is wrong, compare again with the example I
gave
> >> >> >> you
> >> >> >> (don't include "brcm/" path in 1st param, because you want the
> >> >> >> symlink
> >> >> >> to
> >> >> >> point to just brcmfmac43430-sdio.AP6212.txt like you did in the
> >> >> >> version
> >> >> >> after cd).
> >> >> >
> >> >> > That doesn't work either. I tried it with the same result, but
didn't
> >> >> > send a
> >> >> > log of it. That works for you?
> >> >>
> >> >> Martin's example is correct so maybe check your tests again for
typos.
> >> >> It it still doesn't work then please do send a log.
> >> >>
> >> >> The link will point to whatever you define via the first parameter,
so
> >> >> if you changed the first parameter it shouldn't be possible to get
> >> >> "the same result".
> >> >>
> >> >>   $ mkdir foo
> >> >>   $ ln -sf test_target foo/test1
> >> >>   $ ln -sf brcm/test_target foo/test2
> >> >>   $ ls -l foo
> >> >>
> >> >>   lrwxrwxrwx 1 andre andre 11 Aug 22 13:35 test1 -> test_target
> >> >>   lrwxrwxrwx 1 andre andre 16 Aug 22 13:35 test2 -> brcm/test_targe=
t
> >> >
> >> > Yes, that's essentially the same as what I'm getting.
> >> >
> >> > Now try "cat foo/test1" and what happens?
> >> >
> >> > There is no file called test_target in the foo directory. And
neither is
> >> > there a file called brcm/test_target in the foo directory.
> >>
> >> Correct. The above was just an example to show that you can * create
> >> symlinks * in the foo directory without cd'ing into the foo directory
> >> first.
> >>
> >> If you'd like the symlinks in the example to point to valid targets
> >> then you need to create the targets too, e.g.
> >>
> >>   $ mkdir -p foo/brcm
> >>   $ echo hello > foo/test_target
> >>   $ echo hello2 > foo/brcm/test_target
> >>
> >> But note that the process of creating a symlink is always the same,
> >> regardless of whether the symlink points to a valid target or not (so
> >> you can run these extra commands to create the targets before or after
> >> you create the symlinks).
> >
> > So that doesn't work for me how I expect it to work. I must be missing
> > something fundamental here.
> >
> > The recipe is trying to create a soft link from a file in the current
> > directory to a file in the sub-directory. On my system, your example
creates
> > links from a file in the sub-directory to the another file in the
> > sub-directory.
> >
> > So, to copy your example, but creating the file "test_target" from the
> > start:
> >
> > $ mkdir -p /tmp/test
> > $ cd /tmp/test
> > $ mkdir foo
> > $ echo 1 > test_target
>
> Here you are creating "test_target" in the directory which contains
> foo, not inside foo. So a symlink inside foo pointing to "test_target"
> isn't going to work.

Exactly my point! Martin asked me to do this:

> ln -sf brcmfmac43430-sdio.AP6212.txt
${D}${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.txt

Which is in essence what I'm doing above. It won't work. The file
"brcmfmac43430-sdio.AP6212.txt" doesn't exist in the current directory.
That's why there's a "cd" command in there.

I think, in hind sight, the problem is that there is no path specified for
the original file. Hence, the email I've just sent, suggests I could make
this mod:

-       ( cd ${D}${nonarch_base_libdir}/firmware/brcm/ ; ln -sf
brcmfmac43430-sdio.MUR1DX.txt brcmfmac43430-sdio.txt)
+      ( ln -sf
${D}${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.MUR1DX.txt
${D}${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.txt)



>
>
> > $ ln -sf test_target foo/test1
> > $ ln -sf brcm/test_target foo/test2
> > $ ls -l foo
> > total 0
> > lrwxrwxrwx 1 ryan ryan 11 Aug 23 06:54 test1 -> test_target
> > lrwxrwxrwx 1 ryan ryan 16 Aug 23 06:54 test2 -> brcm/test_target
> > $ cat test_target
> > 1
> > $ cat foo/test1
> > cat: foo/test1: No such file or directory
> > $ cat foo/test2
> > cat: foo/test2: No such file or directory
>
> All as expected given that none of the symlink targets exist yet.
>
> > $ echo hello > foo/test_target
> > $ echo hello2 > foo/brcm/test_target
> > bash: foo/brcm/test_target: No such file or directory
>
> You can't create a file within the foo/brcm subdirectory without
> creating that subdirectory first. You've somehow missed that step -
> although it was in my example.

Well, your example said:

>  $ mkdir foo
>  $ ln -sf test_target foo/test1
>  $ ln -sf brcm/test_target foo/test2
>  $ ls -l foo

... and I was trying to show that it doesn't work. Although in fairness,
you did add the "mkdir -p foo/brcm" command in a later email. So I think
we're both arguing the same point and neither of us is making ourselves
very clear.

So I don't think we need to continue down this track. Martin's original
suggestion won't work for the reasons we've both just discussed. If I add
the absolute paths to the source and target, it should be fine.


>
> > $ cat foo/test1
> > hello
> > $ cat foo/test2
> > cat: foo/test2: No such file or directory
> > $ cat test_target
> > 1
> > $ tree
> > .
> > =E2=94=9C=E2=94=80=E2=94=80 foo
> > =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 test1 -> test_target
> > =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 test2 -> brcm/test_target
> > =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 test_target
> > =E2=94=94=E2=94=80=E2=94=80 test_target
> >
> > 1 directory, 4 files
>
> No real mysteries here. Everything looks as expected given the
> comments above about how you creating the target files.
>
> > So, neither test1 nor test2 are linked to /tmp/test/test_target.
>
> As expected. For a symlink which is in the foo subdirectory, the
> target would have to be "../test_target" to correctly point to your
> /tmp/test/test_target file.
>
> > test1 is
> > linked to /tmp/test/foo/test_target
>
> Not exactly. The test1 symlink in foo just points to "test_target",
> there's no absolute path.
>
> ie if you renamed the foo directory to something else then the test1
> symlink would still point "test_target" and it would still be a valid
> link.
>
> > and test2 is linked to
> > /tmp/test/brcm/test_target, which doesn't exist.
>
> Again, test2 is a relative symlink, not absolute. The test2 symlink
> points to a target which doesn't exist due to a missing "mkdir -p
> foo/brcm" before you tried to create the target file.
>
> > AFAIK, when creating a softlink, you have to give it either an absolute
> > path, or a path relative to the link being created. The path cannot be
> > relative to the original file that you want to link to.
>
> The only real restriction when creating a symlink is that the
> directory which will contain the symlink must exist.
>
> If you want the symlink to point to something then it's up to you to
> arrange that the target exists and the symlink points to it correctly
> - but the symlink can still be created even if the target doesn't
> point to anything valid.
>
> > So, this will work:
> >
> > $cd /tmp/test
> > $ ln -sf ../test_target foo/test3
> > $ cat foo/test3
> > 1
> > $ cat /tmp/test/foo/test3
> > 1
> >
> > But that is a strange way to create the soft link, IMO.
>
> What's strange about it?
>
> > AFAICT, for the recipe, to get rid of the "cd", I'd have to specify an
> > absolute path to the original file:
> >
> > +do_install_append_bcm43430-nvram-mur1dx() {
> > +       ( ln -sf ${PWD}/brcmfmac43430-sdio.MUR1DX.txt
> > ${D}${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.txt)
> >
> > ... assuming PWD is available to the recipe. There will be a proper
Yocto
> > variable I can use, of course, but I can't think of it right now.
>
> That definitely doesn't look right...
>
> > Either way, Martin's example doesn't work for me. And adding the
absolute
> > path of the original file doesn't seem any neater or clearer than
following
> > the TI example from the do_install a few lines up in the recipe. But I'=
m
> > happy to do it either way, so long as it works.
>
> Martin's example is basically saying (correctly) that this sequence:
>
>   mkdir foo
>   echo hello > foo/target
>   cd foo
>   ln -sf target link
>   cd ..
>
> is equivalent to this one:
>
>   mkdir foo
>   echo hello > foo/target
>   ln -sf target foo/link
>
> Notice that the first parameter to ln (the thing you want the symlink
> to point to) is the same in both cases. ie it isn't affected by which
> directory you are in when you create the symlink.

--0000000000003e391b0574150e96
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>On 23 August 2018 at 08:06, Andre McCurdy &lt;<a h=
ref=3D"mailto:armccurdy@gmail.com">armccurdy@gmail.com</a>&gt; wrote:<br>&g=
t;<br>&gt; On Wed, Aug 22, 2018 at 11:12 PM, Ryan Harkin &lt;<a href=3D"mai=
lto:ryan.harkin@linaro.org">ryan.harkin@linaro.org</a>&gt; wrote:<br>&gt; &=
gt; On 22 August 2018 at 23:55, Andre McCurdy &lt;<a href=3D"mailto:armccur=
dy@gmail.com">armccurdy@gmail.com</a>&gt; wrote:<br>&gt; &gt;&gt; On Wed, A=
ug 22, 2018 at 2:56 PM, Ryan Harkin &lt;<a href=3D"mailto:ryan.harkin@linar=
o.org">ryan.harkin@linaro.org</a>&gt;<br>&gt; &gt;&gt; wrote:<br>&gt; &gt;&=
gt; &gt; On Wed, 22 Aug 2018, 21:42 Andre McCurdy, &lt;<a href=3D"mailto:ar=
mccurdy@gmail.com">armccurdy@gmail.com</a>&gt; wrote:<br>&gt; &gt;&gt; &gt;=
&gt; On Wed, Aug 22, 2018 at 1:10 PM, Ryan Harkin &lt;<a href=3D"mailto:rya=
n.harkin@linaro.org">ryan.harkin@linaro.org</a>&gt;<br>&gt; &gt;&gt; &gt;&g=
t; wrote:<br>&gt; &gt;&gt; &gt;&gt; &gt; On Wed, 22 Aug 2018, 20:02 Martin =
Jansa, &lt;<a href=3D"mailto:martin.jansa@gmail.com">martin.jansa@gmail.com=
</a>&gt;<br>&gt; &gt;&gt; &gt;&gt; &gt; wrote:<br>&gt; &gt;&gt; &gt;&gt; &g=
t;&gt;<br>&gt; &gt;&gt; &gt;&gt; &gt;&gt; Your 1st parameter is wrong, comp=
are again with the example I gave<br>&gt; &gt;&gt; &gt;&gt; &gt;&gt; you<br=
>&gt; &gt;&gt; &gt;&gt; &gt;&gt; (don&#39;t include &quot;brcm/&quot; path =
in 1st param, because you want the<br>&gt; &gt;&gt; &gt;&gt; &gt;&gt; symli=
nk<br>&gt; &gt;&gt; &gt;&gt; &gt;&gt; to<br>&gt; &gt;&gt; &gt;&gt; &gt;&gt;=
 point to just brcmfmac43430-sdio.AP6212.txt like you did in the<br>&gt; &g=
t;&gt; &gt;&gt; &gt;&gt; version<br>&gt; &gt;&gt; &gt;&gt; &gt;&gt; after c=
d).<br>&gt; &gt;&gt; &gt;&gt; &gt;<br>&gt; &gt;&gt; &gt;&gt; &gt; That does=
n&#39;t work either. I tried it with the same result, but didn&#39;t<br>&gt=
; &gt;&gt; &gt;&gt; &gt; send a<br>&gt; &gt;&gt; &gt;&gt; &gt; log of it. T=
hat works for you?<br>&gt; &gt;&gt; &gt;&gt;<br>&gt; &gt;&gt; &gt;&gt; Mart=
in&#39;s example is correct so maybe check your tests again for typos.<br>&=
gt; &gt;&gt; &gt;&gt; It it still doesn&#39;t work then please do send a lo=
g.<br>&gt; &gt;&gt; &gt;&gt;<br>&gt; &gt;&gt; &gt;&gt; The link will point =
to whatever you define via the first parameter, so<br>&gt; &gt;&gt; &gt;&gt=
; if you changed the first parameter it shouldn&#39;t be possible to get<br=
>&gt; &gt;&gt; &gt;&gt; &quot;the same result&quot;.<br>&gt; &gt;&gt; &gt;&=
gt;<br>&gt; &gt;&gt; &gt;&gt; =C2=A0 $ mkdir foo<br>&gt; &gt;&gt; &gt;&gt; =
=C2=A0 $ ln -sf test_target foo/test1<br>&gt; &gt;&gt; &gt;&gt; =C2=A0 $ ln=
 -sf brcm/test_target foo/test2<br>&gt; &gt;&gt; &gt;&gt; =C2=A0 $ ls -l fo=
o<br>&gt; &gt;&gt; &gt;&gt;<br>&gt; &gt;&gt; &gt;&gt; =C2=A0 lrwxrwxrwx 1 a=
ndre andre 11 Aug 22 13:35 test1 -&gt; test_target<br>&gt; &gt;&gt; &gt;&gt=
; =C2=A0 lrwxrwxrwx 1 andre andre 16 Aug 22 13:35 test2 -&gt; brcm/test_tar=
get<br>&gt; &gt;&gt; &gt;<br>&gt; &gt;&gt; &gt; Yes, that&#39;s essentially=
 the same as what I&#39;m getting.<br>&gt; &gt;&gt; &gt;<br>&gt; &gt;&gt; &=
gt; Now try &quot;cat foo/test1&quot; and what happens?<br>&gt; &gt;&gt; &g=
t;<br>&gt; &gt;&gt; &gt; There is no file called test_target in the foo dir=
ectory. And neither is<br>&gt; &gt;&gt; &gt; there a file called brcm/test_=
target in the foo directory.<br>&gt; &gt;&gt;<br>&gt; &gt;&gt; Correct. The=
 above was just an example to show that you can * create<br>&gt; &gt;&gt; s=
ymlinks * in the foo directory without cd&#39;ing into the foo directory<br=
>&gt; &gt;&gt; first.<br>&gt; &gt;&gt;<br>&gt; &gt;&gt; If you&#39;d like t=
he symlinks in the example to point to valid targets<br>&gt; &gt;&gt; then =
you need to create the targets too, e.g.<br>&gt; &gt;&gt;<br>&gt; &gt;&gt; =
=C2=A0 $ mkdir -p foo/brcm<br>&gt; &gt;&gt; =C2=A0 $ echo hello &gt; foo/te=
st_target<br>&gt; &gt;&gt; =C2=A0 $ echo hello2 &gt; foo/brcm/test_target<b=
r>&gt; &gt;&gt;<br>&gt; &gt;&gt; But note that the process of creating a sy=
mlink is always the same,<br>&gt; &gt;&gt; regardless of whether the symlin=
k points to a valid target or not (so<br>&gt; &gt;&gt; you can run these ex=
tra commands to create the targets before or after<br>&gt; &gt;&gt; you cre=
ate the symlinks).<br>&gt; &gt;<br>&gt; &gt; So that doesn&#39;t work for m=
e how I expect it to work. I must be missing<br>&gt; &gt; something fundame=
ntal here.<br>&gt; &gt;<br>&gt; &gt; The recipe is trying to create a soft =
link from a file in the current<br>&gt; &gt; directory to a file in the sub=
-directory. On my system, your example creates<br>&gt; &gt; links from a fi=
le in the sub-directory to the another file in the<br>&gt; &gt; sub-directo=
ry.<br>&gt; &gt;<br>&gt; &gt; So, to copy your example, but creating the fi=
le &quot;test_target&quot; from the<br>&gt; &gt; start:<br>&gt; &gt;<br>&gt=
; &gt; $ mkdir -p /tmp/test<br>&gt; &gt; $ cd /tmp/test<br>&gt; &gt; $ mkdi=
r foo<br>&gt; &gt; $ echo 1 &gt; test_target<br>&gt;<br>&gt; Here you are c=
reating &quot;test_target&quot; in the directory which contains<br>&gt; foo=
, not inside foo. So a symlink inside foo pointing to &quot;test_target&quo=
t;<br>&gt; isn&#39;t going to work.<br><br>Exactly my point! Martin asked m=
e to do this:<br><br>&gt; ln -sf brcmfmac43430-sdio.AP6212.txt ${D}${nonarc=
h_base_libdir}/firmware/brcm/brcmfmac43430-sdio.txt<br><br>Which is in esse=
nce what I&#39;m doing above. It won&#39;t work. The file &quot;brcmfmac434=
30-sdio.AP6212.txt&quot; doesn&#39;t exist in the current directory. That&#=
39;s why there&#39;s a &quot;cd&quot; command in there.<br><br>I think, in =
hind sight, the problem is that there is no path specified for the original=
 file. Hence, the email I&#39;ve just sent, suggests I could make this mod:=
<br><br>- =C2=A0 =C2=A0 =C2=A0 ( cd ${D}${nonarch_base_libdir}/firmware/brc=
m/ ; ln -sf brcmfmac43430-sdio.MUR1DX.txt brcmfmac43430-sdio.txt)<br>+ =C2=
=A0 =C2=A0 =C2=A0( ln -sf ${D}${nonarch_base_libdir}/firmware/brcm/brcmfmac=
43430-sdio.MUR1DX.txt ${D}${nonarch_base_libdir}/firmware/brcm/brcmfmac4343=
0-sdio.txt)<br><br><br>=C2=A0<br>&gt;<br>&gt;<br>&gt; &gt; $ ln -sf test_ta=
rget foo/test1<br>&gt; &gt; $ ln -sf brcm/test_target foo/test2<br>&gt; &gt=
; $ ls -l foo<br>&gt; &gt; total 0<br>&gt; &gt; lrwxrwxrwx 1 ryan ryan 11 A=
ug 23 06:54 test1 -&gt; test_target<br>&gt; &gt; lrwxrwxrwx 1 ryan ryan 16 =
Aug 23 06:54 test2 -&gt; brcm/test_target<br>&gt; &gt; $ cat test_target<br=
>&gt; &gt; 1<br>&gt; &gt; $ cat foo/test1<br>&gt; &gt; cat: foo/test1: No s=
uch file or directory<br>&gt; &gt; $ cat foo/test2<br>&gt; &gt; cat: foo/te=
st2: No such file or directory<br>&gt;<br>&gt; All as expected given that n=
one of the symlink targets exist yet.<br>&gt;<br>&gt; &gt; $ echo hello &gt=
; foo/test_target<br>&gt; &gt; $ echo hello2 &gt; foo/brcm/test_target<br>&=
gt; &gt; bash: foo/brcm/test_target: No such file or directory<br>&gt;<br>&=
gt; You can&#39;t create a file within the foo/brcm subdirectory without<br=
>&gt; creating that subdirectory first. You&#39;ve somehow missed that step=
 -<br>&gt; although it was in my example.<br><br>Well, your example said:<b=
r><br>&gt; =C2=A0$ mkdir foo<br>&gt; =C2=A0$ ln -sf test_target foo/test1<b=
r>&gt; =C2=A0$ ln -sf brcm/test_target foo/test2<br>&gt; =C2=A0$ ls -l foo<=
br><br>... and I was trying to show that it doesn&#39;t work. Although in f=
airness, you did add the &quot;mkdir -p foo/brcm&quot; command<span style=
=3D"font-size:small;text-decoration-style:initial;text-decoration-color:ini=
tial;float:none;display:inline">=C2=A0in a later email. So I think we&#39;r=
e both arguing the same point and neither of us is making ourselves very cl=
ear.</span><div><br></div><div>So I don&#39;t think we need to continue dow=
n this track. Martin&#39;s original suggestion won&#39;t work for the reaso=
ns we&#39;ve both just discussed. If I add the absolute paths to the source=
 and target, it should be fine.<br><br><br>&gt;<br>&gt; &gt; $ cat foo/test=
1<br>&gt; &gt; hello<br>&gt; &gt; $ cat foo/test2<br>&gt; &gt; cat: foo/tes=
t2: No such file or directory<br>&gt; &gt; $ cat test_target<br>&gt; &gt; 1=
<br>&gt; &gt; $ tree<br>&gt; &gt; .<br>&gt; &gt; =E2=94=9C=E2=94=80=E2=94=
=80 foo<br>&gt; &gt; =E2=94=82 =C2=A0 =E2=94=9C=E2=94=80=E2=94=80 test1 -&g=
t; test_target<br>&gt; &gt; =E2=94=82 =C2=A0 =E2=94=9C=E2=94=80=E2=94=80 te=
st2 -&gt; brcm/test_target<br>&gt; &gt; =E2=94=82 =C2=A0 =E2=94=94=E2=94=80=
=E2=94=80 test_target<br>&gt; &gt; =E2=94=94=E2=94=80=E2=94=80 test_target<=
br>&gt; &gt;<br>&gt; &gt; 1 directory, 4 files<br>&gt;<br>&gt; No real myst=
eries here. Everything looks as expected given the<br>&gt; comments above a=
bout how you creating the target files.<br>&gt;<br>&gt; &gt; So, neither te=
st1 nor test2 are linked to /tmp/test/test_target.<br>&gt;<br>&gt; As expec=
ted. For a symlink which is in the foo subdirectory, the<br>&gt; target wou=
ld have to be &quot;../test_target&quot; to correctly point to your<br>&gt;=
 /tmp/test/test_target file.<br>&gt;<br>&gt; &gt; test1 is<br>&gt; &gt; lin=
ked to /tmp/test/foo/test_target<br>&gt;<br>&gt; Not exactly. The test1 sym=
link in foo just points to &quot;test_target&quot;,<br>&gt; there&#39;s no =
absolute path.<br>&gt;<br>&gt; ie if you renamed the foo directory to somet=
hing else then the test1<br>&gt; symlink would still point &quot;test_targe=
t&quot; and it would still be a valid<br>&gt; link.<br>&gt;<br>&gt; &gt; an=
d test2 is linked to<br>&gt; &gt; /tmp/test/brcm/test_target, which doesn&#=
39;t exist.<br>&gt;<br>&gt; Again, test2 is a relative symlink, not absolut=
e. The test2 symlink<br>&gt; points to a target which doesn&#39;t exist due=
 to a missing &quot;mkdir -p<br>&gt; foo/brcm&quot; before you tried to cre=
ate the target file.<br>&gt;<br>&gt; &gt; AFAIK, when creating a softlink, =
you have to give it either an absolute<br>&gt; &gt; path, or a path relativ=
e to the link being created. The path cannot be<br>&gt; &gt; relative to th=
e original file that you want to link to.<br>&gt;<br>&gt; The only real res=
triction when creating a symlink is that the<br>&gt; directory which will c=
ontain the symlink must exist.<br>&gt;<br>&gt; If you want the symlink to p=
oint to something then it&#39;s up to you to<br>&gt; arrange that the targe=
t exists and the symlink points to it correctly<br>&gt; - but the symlink c=
an still be created even if the target doesn&#39;t<br>&gt; point to anythin=
g valid.<br>&gt;<br>&gt; &gt; So, this will work:<br>&gt; &gt;<br>&gt; &gt;=
 $cd /tmp/test<br>&gt; &gt; $ ln -sf ../test_target foo/test3<br>&gt; &gt; =
$ cat foo/test3<br>&gt; &gt; 1<br>&gt; &gt; $ cat /tmp/test/foo/test3<br>&g=
t; &gt; 1<br>&gt; &gt;<br>&gt; &gt; But that is a strange way to create the=
 soft link, IMO.<br>&gt;<br>&gt; What&#39;s strange about it?<br>&gt;<br>&g=
t; &gt; AFAICT, for the recipe, to get rid of the &quot;cd&quot;, I&#39;d h=
ave to specify an<br>&gt; &gt; absolute path to the original file:<br>&gt; =
&gt;<br>&gt; &gt; +do_install_append_bcm43430-nvram-mur1dx() {<br>&gt; &gt;=
 + =C2=A0 =C2=A0 =C2=A0 ( ln -sf ${PWD}/brcmfmac43430-sdio.MUR1DX.txt<br>&g=
t; &gt; ${D}${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.txt)<br=
>&gt; &gt;<br>&gt; &gt; ... assuming PWD is available to the recipe. There =
will be a proper Yocto<br>&gt; &gt; variable I can use, of course, but I ca=
n&#39;t think of it right now.<br>&gt;<br>&gt; That definitely doesn&#39;t =
look right...<br>&gt;<br>&gt; &gt; Either way, Martin&#39;s example doesn&#=
39;t work for me. And adding the absolute<br>&gt; &gt; path of the original=
 file doesn&#39;t seem any neater or clearer than following<br>&gt; &gt; th=
e TI example from the do_install a few lines up in the recipe. But I&#39;m<=
br>&gt; &gt; happy to do it either way, so long as it works.<br>&gt;<br>&gt=
; Martin&#39;s example is basically saying (correctly) that this sequence:<=
br>&gt;<br>&gt; =C2=A0 mkdir foo<br>&gt; =C2=A0 echo hello &gt; foo/target<=
br>&gt; =C2=A0 cd foo<br>&gt; =C2=A0 ln -sf target link<br>&gt; =C2=A0 cd .=
.<br>&gt;<br>&gt; is equivalent to this one:<br>&gt;<br>&gt; =C2=A0 mkdir f=
oo<br>&gt; =C2=A0 echo hello &gt; foo/target<br>&gt; =C2=A0 ln -sf target f=
oo/link<br>&gt;<br>&gt; Notice that the first parameter to ln (the thing yo=
u want the symlink<br>&gt; to point to) is the same in both cases. ie it is=
n&#39;t affected by which<br>&gt; directory you are in when you create the =
symlink.<br></div></div>

--0000000000003e391b0574150e96--
