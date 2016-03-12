Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-vk0-f47.google.com (mail-vk0-f47.google.com
	[209.85.213.47])
	by mail.openembedded.org (Postfix) with ESMTP id 6F81E731EA
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Mar 2016 19:04:41 +0000 (UTC)
Received: by mail-vk0-f47.google.com with SMTP id k1so169378945vkb.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Mar 2016 11:04:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=EV6T+uhdJIZZ9o0KG/AyGGfiVYmakXFr0uBRL30dQA8=;
	b=OqdXmwi2JQeZtq26KwtDVs7E3ORsLPHZFGBpb53MXaqj+GKYPVOekLdU33/iqlLG6A
	7zHzYUREFilA0brmBNEFJhYnWgU3C87864pEZUc1jB7TdXP1iNt40AX866tFMtYQafML
	LSIagUhATGNJO5brdcP4AnNibDZu1Oj6Fr4knEWwAgDpgrUyT5vUKb1PHd7WeqUSukAk
	n+aulST9EjxbxNyVKHtlCOzFWH3GRKlpxgqllyPtx0bKRO+/0uEJrgmPXH1hjFSdyHG4
	wxxkKzSO77cEoLotkN6KbTrd+TuC29U2GGINLuGgAlzrdZaDSqRufYzVdEZs8wJg3Pz/
	Yjhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=EV6T+uhdJIZZ9o0KG/AyGGfiVYmakXFr0uBRL30dQA8=;
	b=WoK9+8gqYtBEZqwKcGOC/9Aq4JJQipcsH9ktgVZbIQhFCeKeuH9jbGz6n75iCOdZ3C
	Yxd/TT4VkSXzo8fcOyu3rARcH5HnI1HNABb71X/X5BA/CKn5o5nocqEAky+KfB8Pw8o0
	Xb69wuIYfrmTkIj9fyYI+5o6CpWz4E8H7W/EQL3jnNO8kcuOi78fN9DOP1KS39tW8pij
	4exM9/OEF9i5LLpfBrizBF/VtBzC9KF2BIxrphIBEqFuYMy7ldEHsuDypLno6amvJ+ZN
	UjFFb801Kr6VimCRBkhvLU+/WXYpN9fsIAFHYw6ETcwkHjuYpRvq7U8tCMjiz7ye5Phz
	DvpQ==
X-Gm-Message-State: AD7BkJIX71iLRYHW3cRdfQJmZHCAlOsY07rPEqPj6E473TRGasFT1vNX0rs/AcNH2Pa9SjZqNuaP3l1HsUtMMw==
MIME-Version: 1.0
X-Received: by 10.31.185.201 with SMTP id j192mr17873445vkf.21.1457809482628; 
	Sat, 12 Mar 2016 11:04:42 -0800 (PST)
Received: by 10.176.6.42 with HTTP; Sat, 12 Mar 2016 11:04:42 -0800 (PST)
In-Reply-To: <1457793803.2804.276.camel@linuxfoundation.org>
References: <1457721891-28398-1-git-send-email-bruce.ashfield@windriver.com>
	<1457793803.2804.276.camel@linuxfoundation.org>
Date: Sat, 12 Mar 2016 14:04:42 -0500
Message-ID: <CADkTA4NhD9nyZomt98hjWgbh7NcfU=YyLVpK6R1TeCFYU5-6vQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-yocto/4.1: usb backports for Apollo Lake/Broxton
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
X-List-Received-Date: Sat, 12 Mar 2016 19:04:44 -0000
Content-Type: multipart/alternative; boundary=001a11436c725cc486052ddeb8dd

--001a11436c725cc486052ddeb8dd
Content-Type: text/plain; charset=UTF-8

On Sat, Mar 12, 2016 at 9:43 AM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Fri, 2016-03-11 at 13:44 -0500, Bruce Ashfield wrote:
> > Importing a series of mainline backports to support USB on a couple
> > of
> > Intel platforms:
> >
> >    bbce8fe2cc42 usb: dwc3: pci: add support for Intel Broxton SOC
> >    e734e1d9f827 usb: dwc3: pci: Set enblslpm quirk for Synopsys
> > platforms
> >    1c6bb6694d50 usb: dwc3: Add dis_enblslpm_quirk
> >    1c6be99e56b8 usb: dwc3: pci: trivial: Formatting
> >    2f2b89764b97 usb: dwc3: pci: passing forward the ACPI companion
> >    ea4b3c72d976 usb: dwc3: core: convert to unified device property
> > interface
> >    dc670b52c69a usb: common: of_usb_get_dr_mode to usb_get_dr_mode
> >    586fc5174649 usb: dwc3: st: prepare the driver for generic
> > usb_get_dr_mode function
> >    0624bd9af7ef usb: common: of_usb_get_maximum_speed to
> > usb_get_maximum_speed
> >    e65bc5467e07 usb: dwc3: Add frame length adjustment quirk
> >    a90954c5d267 usb: musb: dsps: control musb speed based on dts
> > setting
> >    b48ff160a993 usb: renesas_usbhs: Allow an OTG PHY driver to
> > provide VBUS
> >    d1c59752195e usb: chipidea: set usb otg capabilities
> >    733eada2cdec usb: common: add API to update usb otg capabilities
> > by device tree
> >    7ab2108dd82b usb: dwc3: core: avoid NULL pointer dereference
> >    1aedb48b7dc9 usb: dwc3: add ULPI interface support
> >    07e42a29fb7e usb: dwc3: pci: add quirk for Baytrails
> >    065917252622 usb: dwc3: add hsphy_interface property
> >    b2bb32a363a3 usb: dwc3: setup phys earlier
> >    bf6bb0a6ebb5 usb: dwc3: soft reset to it's own function
> >    d481da949476 usb: dwc3: cache hwparams earlier
> >    9ac66262a201 usb: dwc3: store driver data earlier
> >    5f940588938c usb: dwc3: ULPI or UTMI+ select
> >    04fdce097f83 usb: dwc3: USB2 PHY register access bits
> >    b7209213cc05 usb: add bus type for USB ULPI
>
> I have a suspicion this breaks qemuppc:
>
>
> https://autobuilder.yoctoproject.org/main/builders/nightly-ppc-lsb/builds/683/steps/BuildImages/logs/stdio


Yup. With mainline backports, I have a shorter validation cycle, since they
really should
be safe.

I'll hunt up whatever is missing from the series and send another update.

Bruce


>
>
> Cheers,
>
> Richard
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a11436c725cc486052ddeb8dd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Sat, Mar 12, 2016 at 9:43 AM, Richard Purdie <span dir=3D"ltr">&lt;<=
a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">rich=
ard.purdie@linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><div class=3D"HOEnZb"><div class=3D"h5">On Fri, 2016-03-11 at=
 13:44 -0500, Bruce Ashfield wrote:<br>
&gt; Importing a series of mainline backports to support USB on a couple<br=
>
&gt; of<br>
&gt; Intel platforms:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 bbce8fe2cc42 usb: dwc3: pci: add support for Intel Broxto=
n SOC<br>
&gt;=C2=A0 =C2=A0 e734e1d9f827 usb: dwc3: pci: Set enblslpm quirk for Synop=
sys<br>
&gt; platforms<br>
&gt;=C2=A0 =C2=A0 1c6bb6694d50 usb: dwc3: Add dis_enblslpm_quirk<br>
&gt;=C2=A0 =C2=A0 1c6be99e56b8 usb: dwc3: pci: trivial: Formatting<br>
&gt;=C2=A0 =C2=A0 2f2b89764b97 usb: dwc3: pci: passing forward the ACPI com=
panion<br>
&gt;=C2=A0 =C2=A0 ea4b3c72d976 usb: dwc3: core: convert to unified device p=
roperty<br>
&gt; interface<br>
&gt;=C2=A0 =C2=A0 dc670b52c69a usb: common: of_usb_get_dr_mode to usb_get_d=
r_mode<br>
&gt;=C2=A0 =C2=A0 586fc5174649 usb: dwc3: st: prepare the driver for generi=
c<br>
&gt; usb_get_dr_mode function<br>
&gt;=C2=A0 =C2=A0 0624bd9af7ef usb: common: of_usb_get_maximum_speed to<br>
&gt; usb_get_maximum_speed<br>
&gt;=C2=A0 =C2=A0 e65bc5467e07 usb: dwc3: Add frame length adjustment quirk=
<br>
&gt;=C2=A0 =C2=A0 a90954c5d267 usb: musb: dsps: control musb speed based on=
 dts<br>
&gt; setting<br>
&gt;=C2=A0 =C2=A0 b48ff160a993 usb: renesas_usbhs: Allow an OTG PHY driver =
to<br>
&gt; provide VBUS<br>
&gt;=C2=A0 =C2=A0 d1c59752195e usb: chipidea: set usb otg capabilities<br>
&gt;=C2=A0 =C2=A0 733eada2cdec usb: common: add API to update usb otg capab=
ilities<br>
&gt; by device tree<br>
&gt;=C2=A0 =C2=A0 7ab2108dd82b usb: dwc3: core: avoid NULL pointer derefere=
nce<br>
&gt;=C2=A0 =C2=A0 1aedb48b7dc9 usb: dwc3: add ULPI interface support<br>
&gt;=C2=A0 =C2=A0 07e42a29fb7e usb: dwc3: pci: add quirk for Baytrails<br>
&gt;=C2=A0 =C2=A0 065917252622 usb: dwc3: add hsphy_interface property<br>
&gt;=C2=A0 =C2=A0 b2bb32a363a3 usb: dwc3: setup phys earlier<br>
&gt;=C2=A0 =C2=A0 bf6bb0a6ebb5 usb: dwc3: soft reset to it&#39;s own functi=
on<br>
&gt;=C2=A0 =C2=A0 d481da949476 usb: dwc3: cache hwparams earlier<br>
&gt;=C2=A0 =C2=A0 9ac66262a201 usb: dwc3: store driver data earlier<br>
&gt;=C2=A0 =C2=A0 5f940588938c usb: dwc3: ULPI or UTMI+ select<br>
&gt;=C2=A0 =C2=A0 04fdce097f83 usb: dwc3: USB2 PHY register access bits<br>
&gt;=C2=A0 =C2=A0 b7209213cc05 usb: add bus type for USB ULPI<br>
<br>
</div></div>I have a suspicion this breaks qemuppc:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/main/builders/nightly-ppc-l=
sb/builds/683/steps/BuildImages/logs/stdio" rel=3D"noreferrer" target=3D"_b=
lank">https://autobuilder.yoctoproject.org/main/builders/nightly-ppc-lsb/bu=
ilds/683/steps/BuildImages/logs/stdio</a></blockquote><div><br></div><div>Y=
up. With mainline backports, I have a shorter validation cycle, since they =
really should</div><div>be safe.</div><div><br></div><div>I&#39;ll hunt up =
whatever is missing from the series and send another update.</div><div><br>=
</div><div>Bruce</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
<br>
Cheers,<br>
<br>
Richard<br>
<div class=3D"HOEnZb"><div class=3D"h5">--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
<div class=3D"gmail_signature">&quot;Thou shalt not follow the NULL pointer=
, for chaos and madness await thee at its end&quot;</div>
</div></div>

--001a11436c725cc486052ddeb8dd--
