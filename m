Return-Path: <ryan.harkin@linaro.org>
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
	[209.85.208.178])
	by mail.openembedded.org (Postfix) with ESMTP id 9DEBD78FCE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 21:52:15 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id v9-v6so2573433ljk.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 14:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=jFKWj+sm0K6t4Qt9N19MvEyqzCygzHOD3YxJAff+G+E=;
	b=hhjQyAT12Q5g8XJTzI4uaafBwjsAX692xKpJIv4BcuXYrczEl4tOKw21c8/lOXHXUq
	TWoBRxZXmu3R0JytOBPceD3mRCAPL+6/owDiP1YPWMVqK+ns9P1TvGa/Bg/3HoSnuEPH
	DG7Fa5Eyh9vnpVQd0hukNsh5+2Oz0F4opeLeE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=jFKWj+sm0K6t4Qt9N19MvEyqzCygzHOD3YxJAff+G+E=;
	b=OlgPYBTigGTRF2UI3YTUGkw1Khzy/46yaz04QTDYwM9fHVqX6bVqs29jgg7OUnd2Km
	kmHiwHkionuRhHcNj7GxJKn0dOJUy7q3qKrbA+zIbxi79QHIWrGBerUOp7L1w+3rrEKy
	xjIHmkwJzwPn6baW2zLle5VxWcEN4vEUMqFsPDz0oqSuKDYGvtaR4IAK2qmS6u5CeSeq
	cKSb9vW0CrZc0PxXlnyKPIQ/2/6p7+dDf5rUGhgABTYBVeQPA4X7LPJA/xFAAEf3FHFn
	vmUMHjv8lpQ/8FKEl7k0+C7bwgAm6yvXasu7tLEHTcfVarGD6bzrxvcmS9rnZ9SmGbrM
	ROOA==
X-Gm-Message-State: AOUpUlGbyE9KxndwlxmGR/TZ5Dz54CZJUj8cBPa/fvhcPZKiGoDDDwR6
	Xm23YypAcTFxD24V1mJjMgmJBtuF2UShRysJtYYWZg==
X-Google-Smtp-Source: AA+uWPz3e0ivFsOzZQ6SaOK6ufB/Gbakc53tAVpQx5JPhlOmFdULv7X6J6aNSuBCSM+CzLasfzUWj7YdqGl2u1uC0Js=
X-Received: by 2002:a2e:9f4d:: with SMTP id
	v13-v6mr37188347ljk.42.1534974736042; 
	Wed, 22 Aug 2018 14:52:16 -0700 (PDT)
MIME-Version: 1.0
References: <1534955436-729-1-git-send-email-ryan.harkin@linaro.org>
	<1534955436-729-4-git-send-email-ryan.harkin@linaro.org>
	<CA+chaQd0noT0sABT2ucXZOx6QvWhoQqQeqzWXO_nm89-5ZeREA@mail.gmail.com>
	<CAD0U-hLEPce-+gJcBcqQHFPkiHr1CPBEvaM6s1f1VTkEzpNnfQ@mail.gmail.com>
	<CA+chaQezPDFAP1L0NYCaoFDjPfriUt3_wh9QKTaa0ZwWBHtKYQ@mail.gmail.com>
	<CAD0U-hJHddn43O0WVxDqUft74RoHxfCQBb9XV-pG+GYqNU0iVQ@mail.gmail.com>
	<CA+chaQc2EUcz+PHi=BT5RrMQsCqegytxgLd6gzpH-PUYvt59Mw@mail.gmail.com>
	<CAD0U-hL6Mvxf+NYVJS64ygh+bMR2RMxwa=okW6g+yOGb-Xb7mA@mail.gmail.com>
	<CAMKF1sp3t1VrPrrwfoLgMNpxRXW2PmcrkQgNXxn4d2GShfu-xQ@mail.gmail.com>
In-Reply-To: <CAMKF1sp3t1VrPrrwfoLgMNpxRXW2PmcrkQgNXxn4d2GShfu-xQ@mail.gmail.com>
From: Ryan Harkin <ryan.harkin@linaro.org>
Date: Wed, 22 Aug 2018 22:52:04 +0100
Message-ID: <CAD0U-h+1Schw5QT3HVcLWrG-y=pKT55G4GnDSMUbX7fL3MegEw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	daiane.angolini@nxp.com, patches@linaro.org
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
X-List-Received-Date: Wed, 22 Aug 2018 21:52:16 -0000
Content-Type: multipart/alternative; boundary="000000000000e1a1ba05740d2719"

--000000000000e1a1ba05740d2719
Content-Type: text/plain; charset="UTF-8"

On Wed, 22 Aug 2018, 21:36 Khem Raj, <raj.khem@gmail.com> wrote:

> I wonder how it work with meta-raspverrypi now that it has its own
> packing for firmware
>

Sorry Them, I don't understand your question.


On Wed, Aug 22, 2018 at 1:10 PM Ryan Harkin <ryan.harkin@linaro.org> wrote:
> >
> >
> >
> > On Wed, 22 Aug 2018, 20:02 Martin Jansa, <martin.jansa@gmail.com> wrote:
> >>
> >> Your 1st parameter is wrong, compare again with the example I gave you
> (don't include "brcm/" path in 1st param, because you want the symlink to
> point to just brcmfmac43430-sdio.AP6212.txt like you did in the version
> after cd).
> >
> >
> > That doesn't work either. I tried it with the same result, but didn't
> send a log of it. That works for you?
> >
> >
> >> On Wed, Aug 22, 2018 at 7:11 PM Ryan Harkin <ryan.harkin@linaro.org>
> wrote:
> >>>
> >>> This is curious!
> >>>
> >>> On 22 August 2018 at 17:56, Martin Jansa <martin.jansa@gmail.com>
> wrote:
> >>>>
> >>>> cd ${D}${nonarch_base_libdir}/firmware/brcm/ ; ln -sf
> brcmfmac43430-sdio.AP6212.txt brcmfmac43430-sdio.txt
> >>>>
> >>>> is the same as
> >>>>
> >>>> ln -sf brcmfmac43430-sdio.AP6212.txt
> ${D}${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.txt
> >>>
> >>>
> >>> On my system, this is what happens when I'm in the root of the
> linux-firmware repo:
> >>>
> >>> $ ls -al brcm/*.txt
> >>> -rw-rw-r-- 1 ryan ryan 875 Aug 22 18:08
> brcm/brcmfmac43430-sdio.AP6212.txt
> >>> -rw-rw-r-- 1 ryan ryan 831 Aug 21 14:48
> brcm/brcmfmac43430-sdio.MUR1DX.txt
> >>>
> >>> $ ln -sf brcm/brcmfmac43430-sdio.AP6212.txt brcm/brcmfmac43430-sdio.txt
> >>>
> >>> $ ls -al brcm/*.txt
> >>> -rw-rw-r-- 1 ryan ryan 875 Aug 22 18:08
> brcm/brcmfmac43430-sdio.AP6212.txt
> >>> -rw-rw-r-- 1 ryan ryan 831 Aug 21 14:48
> brcm/brcmfmac43430-sdio.MUR1DX.txt
> >>> lrwxrwxrwx 1 ryan ryan  34 Aug 22 18:08 brcm/brcmfmac43430-sdio.txt ->
> brcm/brcmfmac43430-sdio.AP6212.txt
> >>>
> >>> And the file is not valid.
> >>>
> >>> $ cat brcm/brcmfmac43430-sdio.txt
> >>> cat: brcm/brcmfmac43430-sdio.txt: No such file or directory
> >>>
> >>> So perhaps I'm doing something wrong. I tried your suggestion
> originally and it didn't work for me. Maybe I made a typo or something?
> >>>
> >>>
> >>>>
> >>>> On Wed, Aug 22, 2018 at 6:47 PM Ryan Harkin <ryan.harkin@linaro.org>
> wrote:
> >>>>>
> >>>>>
> >>>>>
> >>>>> On 22 August 2018 at 17:41, Martin Jansa <martin.jansa@gmail.com>
> wrote:
> >>>>>>
> >>>>>> The "cd ${D}${nonarch_base_libdir}/firmware/brcm/" doesn't seem to
> be needed, just include the path in 2nd ln parameter.
> >>>>>
> >>>>>
> >>>>> I don't think that works, or at least, it doesn't work for me, so I
> may be doing something wrong. I'm also copying the example used in the
> do_install() a few lines up as I figured that would be the preferred style
> for this recipe.
> >>>>>
> >>>>>>
> >>>>>> On Wed, Aug 22, 2018 at 6:30 PM Ryan Harkin <ryan.harkin@linaro.org>
> wrote:
> >>>>>>>
> >>>>>>> The Linux kernel currently expects a single NVRAM file for BCM43430
> >>>>>>> named brcmfmac43430-sdio.txt.
> >>>>>>>
> >>>>>>> Allow the machine to specify an override to link its module
> specific
> >>>>>>> NVRAM to the filename expected by the kernel.
> >>>>>>>
> >>>>>>> Signed-off-by: Ryan Harkin <ryan.harkin@linaro.org>
> >>>>>>> ---
> >>>>>>>  meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 12
> ++++++++++++
> >>>>>>>  1 file changed, 12 insertions(+)
> >>>>>>>
> >>>>>>> diff --git a/meta/recipes-kernel/linux-firmware/
> linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/
> linux-firmware_git.bb
> >>>>>>> index 8c54f28..b647abc 100644
> >>>>>>> --- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
> >>>>>>> +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
> >>>>>>> @@ -226,6 +226,18 @@ do_install() {
> >>>>>>>         ( cd ${D}${nonarch_base_libdir}/firmware ; ln -sf
> ti-connectivity/* . )
> >>>>>>>  }
> >>>>>>>
> >>>>>>> +# Adding bcm43430-nvram-{module type} to MACHINEOVERRIDES will
> create a
> >>>>>>> +# softlink for the module specific NVRAM file to the filename
> expected
> >>>>>>> +# by the Linux kernel
> >>>>>>> +FILES_${PN}-bcm43430-nvram_append_bcm43430-nvram-mur1dx = "
> ${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.txt"
> >>>>>>> +do_install_append_bcm43430-nvram-mur1dx() {
> >>>>>>> +       ( cd ${D}${nonarch_base_libdir}/firmware/brcm/ ; ln -sf
> brcmfmac43430-sdio.MUR1DX.txt brcmfmac43430-sdio.txt)
> >>>>>>> +}
> >>>>>>> +FILES_${PN}-bcm43430-nvram_append_bcm43430-nvram-ap6212 =
> "${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.txt"
> >>>>>>> +do_install_append_bcm43430-nvram-ap6212() {
> >>>>>>> +       ( cd ${D}${nonarch_base_libdir}/firmware/brcm/ ; ln -sf
> brcmfmac43430-sdio.AP6212.txt brcmfmac43430-sdio.txt)
> >>>>>>> +}
> >>>>>>> +
> >>>>>>>
> >>>>>>>  PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
> >>>>>>>               ${PN}-mt7601u-license ${PN}-mt7601u \
> >>>>>>> --
> >>>>>>> 2.7.4
> >>>>>>>
> >>>>>
> >>>
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000e1a1ba05740d2719
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">=
On Wed, 22 Aug 2018, 21:36 Khem Raj, &lt;<a href=3D"mailto:raj.khem@gmail.c=
om">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">I wonder how it work with meta-raspverrypi now that it has its own<br>
packing for firmware<br></blockquote></div></div><div dir=3D"auto"><br></di=
v><div dir=3D"auto">Sorry Them, I don&#39;t understand your question.</div>=
<div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=3D"auto"><=
div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
On Wed, Aug 22, 2018 at 1:10 PM Ryan Harkin &lt;<a href=3D"mailto:ryan.hark=
in@linaro.org" target=3D"_blank" rel=3D"noreferrer">ryan.harkin@linaro.org<=
/a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On Wed, 22 Aug 2018, 20:02 Martin Jansa, &lt;<a href=3D"mailto:martin.=
jansa@gmail.com" target=3D"_blank" rel=3D"noreferrer">martin.jansa@gmail.co=
m</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; Your 1st parameter is wrong, compare again with the example I gave=
 you (don&#39;t include &quot;brcm/&quot; path in 1st param, because you wa=
nt the symlink to point to just brcmfmac43430-sdio.AP6212.txt like you did =
in the version after cd).<br>
&gt;<br>
&gt;<br>
&gt; That doesn&#39;t work either. I tried it with the same result, but did=
n&#39;t send a log of it. That works for you?<br>
&gt;<br>
&gt;<br>
&gt;&gt; On Wed, Aug 22, 2018 at 7:11 PM Ryan Harkin &lt;<a href=3D"mailto:=
ryan.harkin@linaro.org" target=3D"_blank" rel=3D"noreferrer">ryan.harkin@li=
naro.org</a>&gt; wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; This is curious!<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On 22 August 2018 at 17:56, Martin Jansa &lt;<a href=3D"mailto=
:martin.jansa@gmail.com" target=3D"_blank" rel=3D"noreferrer">martin.jansa@=
gmail.com</a>&gt; wrote:<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; cd ${D}${nonarch_base_libdir}/firmware/brcm/ ; ln -sf brcm=
fmac43430-sdio.AP6212.txt brcmfmac43430-sdio.txt<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; is the same as<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; ln -sf brcmfmac43430-sdio.AP6212.txt ${D}${nonarch_base_li=
bdir}/firmware/brcm/brcmfmac43430-sdio.txt<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On my system, this is what happens when I&#39;m in the root of=
 the linux-firmware repo:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; $ ls -al brcm/*.txt<br>
&gt;&gt;&gt; -rw-rw-r-- 1 ryan ryan 875 Aug 22 18:08 brcm/brcmfmac43430-sdi=
o.AP6212.txt<br>
&gt;&gt;&gt; -rw-rw-r-- 1 ryan ryan 831 Aug 21 14:48 brcm/brcmfmac43430-sdi=
o.MUR1DX.txt<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; $ ln -sf brcm/brcmfmac43430-sdio.AP6212.txt brcm/brcmfmac43430=
-sdio.txt<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; $ ls -al brcm/*.txt<br>
&gt;&gt;&gt; -rw-rw-r-- 1 ryan ryan 875 Aug 22 18:08 brcm/brcmfmac43430-sdi=
o.AP6212.txt<br>
&gt;&gt;&gt; -rw-rw-r-- 1 ryan ryan 831 Aug 21 14:48 brcm/brcmfmac43430-sdi=
o.MUR1DX.txt<br>
&gt;&gt;&gt; lrwxrwxrwx 1 ryan ryan=C2=A0 34 Aug 22 18:08 brcm/brcmfmac4343=
0-sdio.txt -&gt; brcm/brcmfmac43430-sdio.AP6212.txt<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; And the file is not valid.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; $ cat brcm/brcmfmac43430-sdio.txt<br>
&gt;&gt;&gt; cat: brcm/brcmfmac43430-sdio.txt: No such file or directory<br=
>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; So perhaps I&#39;m doing something wrong. I tried your suggest=
ion originally and it didn&#39;t work for me. Maybe I made a typo or someth=
ing?<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; On Wed, Aug 22, 2018 at 6:47 PM Ryan Harkin &lt;<a href=3D=
"mailto:ryan.harkin@linaro.org" target=3D"_blank" rel=3D"noreferrer">ryan.h=
arkin@linaro.org</a>&gt; wrote:<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; On 22 August 2018 at 17:41, Martin Jansa &lt;<a href=
=3D"mailto:martin.jansa@gmail.com" target=3D"_blank" rel=3D"noreferrer">mar=
tin.jansa@gmail.com</a>&gt; wrote:<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; The &quot;cd ${D}${nonarch_base_libdir}/firmware/b=
rcm/&quot; doesn&#39;t seem to be needed, just include the path in 2nd ln p=
arameter.<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; I don&#39;t think that works, or at least, it doesn&#3=
9;t work for me, so I may be doing something wrong. I&#39;m also copying th=
e example used in the do_install() a few lines up as I figured that would b=
e the preferred style for this recipe.<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; On Wed, Aug 22, 2018 at 6:30 PM Ryan Harkin &lt;<a=
 href=3D"mailto:ryan.harkin@linaro.org" target=3D"_blank" rel=3D"noreferrer=
">ryan.harkin@linaro.org</a>&gt; wrote:<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; The Linux kernel currently expects a single NV=
RAM file for BCM43430<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; named brcmfmac43430-sdio.txt.<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; Allow the machine to specify an override to li=
nk its module specific<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; NVRAM to the filename expected by the kernel.<=
br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; Signed-off-by: Ryan Harkin &lt;<a href=3D"mail=
to:ryan.harkin@linaro.org" target=3D"_blank" rel=3D"noreferrer">ryan.harkin=
@linaro.org</a>&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 meta/recipes-kernel/linux-firmware/<a hr=
ef=3D"http://linux-firmware_git.bb" rel=3D"noreferrer noreferrer" target=3D=
"_blank">linux-firmware_git.bb</a> | 12 ++++++++++++<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 1 file changed, 12 insertions(+)<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; diff --git a/meta/recipes-kernel/linux-firmwar=
e/<a href=3D"http://linux-firmware_git.bb" rel=3D"noreferrer noreferrer" ta=
rget=3D"_blank">linux-firmware_git.bb</a> b/meta/recipes-kernel/linux-firmw=
are/<a href=3D"http://linux-firmware_git.bb" rel=3D"noreferrer noreferrer" =
target=3D"_blank">linux-firmware_git.bb</a><br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; index 8c54f28..b647abc 100644<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; --- a/meta/recipes-kernel/linux-firmware/<a hr=
ef=3D"http://linux-firmware_git.bb" rel=3D"noreferrer noreferrer" target=3D=
"_blank">linux-firmware_git.bb</a><br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +++ b/meta/recipes-kernel/linux-firmware/<a hr=
ef=3D"http://linux-firmware_git.bb" rel=3D"noreferrer noreferrer" target=3D=
"_blank">linux-firmware_git.bb</a><br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; @@ -226,6 +226,18 @@ do_install() {<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0( cd ${D}${no=
narch_base_libdir}/firmware ; ln -sf ti-connectivity/* . )<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 }<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +# Adding bcm43430-nvram-{module type} to MACH=
INEOVERRIDES will create a<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +# softlink for the module specific NVRAM file=
 to the filename expected<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +# by the Linux kernel<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +FILES_${PN}-bcm43430-nvram_append_bcm43430-nv=
ram-mur1dx =3D &quot; ${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sd=
io.txt&quot;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +do_install_append_bcm43430-nvram-mur1dx() {<b=
r>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0( cd ${D}${nonarch=
_base_libdir}/firmware/brcm/ ; ln -sf brcmfmac43430-sdio.MUR1DX.txt brcmfma=
c43430-sdio.txt)<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +}<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +FILES_${PN}-bcm43430-nvram_append_bcm43430-nv=
ram-ap6212 =3D &quot;${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdi=
o.txt&quot;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +do_install_append_bcm43430-nvram-ap6212() {<b=
r>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0( cd ${D}${nonarch=
_base_libdir}/firmware/brcm/ ; ln -sf brcmfmac43430-sdio.AP6212.txt brcmfma=
c43430-sdio.txt)<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +}<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 PACKAGES =3D+ &quot;${PN}-ralink-license=
 ${PN}-ralink \<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0${PN}-mt7601u-license ${PN}-mt7601u \<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; --<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; 2.7.4<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"=
_blank" rel=3D"noreferrer">Openembedded-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer noreferrer" target=3D"_blank">http://lists.openemb=
edded.org/mailman/listinfo/openembedded-core</a><br>
</blockquote></div></div></div>

--000000000000e1a1ba05740d2719--
