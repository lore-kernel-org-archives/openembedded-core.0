Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-vk0-f52.google.com (mail-vk0-f52.google.com
	[209.85.213.52])
	by mail.openembedded.org (Postfix) with ESMTP id 8E2CC70018
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Mar 2016 03:34:06 +0000 (UTC)
Received: by mail-vk0-f52.google.com with SMTP id e6so193975073vkh.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 20:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=BN2x5vUo2YalGpaP4NixhyVESdLXl5zGlFdOO4K+uFI=;
	b=viVoiuDMQVFEFuC4RoU//SgQkYqf9EocG1ZGNk+dHQIEyzja9PQJ5vKcEi8qH3Tkx0
	NwufPtWm3qzL/C43Dvg7LNSqbGkBXRbETD27xCLZmzQ3XOqQX6WUwpAp7WneNx5Cgm0C
	/tueSXBIk9wTm7ZtaqnQ2dyno7JRsxvwVD8b9cTwswIr8ZaQ0/YyPhdfiti/Efv19hPD
	jPk3RHKMIkqeE32I4QuTJNKofU3eykbFsZOyawwoJzaB0O2AoeppGO+iKhQIqVSLsft+
	yKH2Ss97al/PFkQdzJZZUO7CEcG9bmfkfH5JTEd237tXtkBUw1wLaNLdhcgyes71oirU
	BNDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=BN2x5vUo2YalGpaP4NixhyVESdLXl5zGlFdOO4K+uFI=;
	b=jg0XqVgLCKCWoJI4hw3UaaWEQ051BRSoWt1I/zwxxK0F+mXvAp0aqDnOTO/vxLCioy
	7yCYoGSEIb91ZrNpqf5I+N5bJFxbqwtz1JbP0K7YF/9xo/NbflyLUmUTxUU6aICZXVKn
	iPjGnkq5cMZrv+YpGR2YUwQ6oQWTp5ngSjVgaman3PxyBLd+E4Po+PWeR7Ef6OKEYsA1
	u43x76lNKDj05ehXHfvi/bycuW1Ks3V+8ybs14gv4DRqm1TkJD7ZJAe9EIBqUpV7oD2b
	TRo975QfKa3jITNG2Ue1CHLc/FujS/a43RuETreewo9BJ+8jSgdWgD5fWcPmp+m7sYYG
	XJWg==
X-Gm-Message-State: AD7BkJJXjvxyDo1K3Qz0Xgiv4u9AhUKzrPEZXCBEWoXluTDRLwqJq4qQuv0wSHts0baSeYigWKvJimGRsKIb+A==
MIME-Version: 1.0
X-Received: by 10.31.185.201 with SMTP id j192mr23686308vkf.21.1457926446772; 
	Sun, 13 Mar 2016 20:34:06 -0700 (PDT)
Received: by 10.176.6.42 with HTTP; Sun, 13 Mar 2016 20:34:06 -0700 (PDT)
In-Reply-To: <CADkTA4NhD9nyZomt98hjWgbh7NcfU=YyLVpK6R1TeCFYU5-6vQ@mail.gmail.com>
References: <1457721891-28398-1-git-send-email-bruce.ashfield@windriver.com>
	<1457793803.2804.276.camel@linuxfoundation.org>
	<CADkTA4NhD9nyZomt98hjWgbh7NcfU=YyLVpK6R1TeCFYU5-6vQ@mail.gmail.com>
Date: Sun, 13 Mar 2016 23:34:06 -0400
Message-ID: <CADkTA4MG2k-NO886q0uap1cvKSpT21X53BjKeS72j3DBUTec2Q@mail.gmail.com>
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
X-List-Received-Date: Mon, 14 Mar 2016 03:34:06 -0000
Content-Type: multipart/alternative; boundary=001a11436c72f7f789052df9f3c9

--001a11436c72f7f789052df9f3c9
Content-Type: text/plain; charset=UTF-8

On Sat, Mar 12, 2016 at 2:04 PM, Bruce Ashfield <bruce.ashfield@gmail.com>
wrote:

>
>
> On Sat, Mar 12, 2016 at 9:43 AM, Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
>
>> On Fri, 2016-03-11 at 13:44 -0500, Bruce Ashfield wrote:
>> > Importing a series of mainline backports to support USB on a couple
>> > of
>> > Intel platforms:
>> >
>> >    bbce8fe2cc42 usb: dwc3: pci: add support for Intel Broxton SOC
>> >    e734e1d9f827 usb: dwc3: pci: Set enblslpm quirk for Synopsys
>> > platforms
>> >    1c6bb6694d50 usb: dwc3: Add dis_enblslpm_quirk
>> >    1c6be99e56b8 usb: dwc3: pci: trivial: Formatting
>> >    2f2b89764b97 usb: dwc3: pci: passing forward the ACPI companion
>> >    ea4b3c72d976 usb: dwc3: core: convert to unified device property
>> > interface
>> >    dc670b52c69a usb: common: of_usb_get_dr_mode to usb_get_dr_mode
>> >    586fc5174649 usb: dwc3: st: prepare the driver for generic
>> > usb_get_dr_mode function
>> >    0624bd9af7ef usb: common: of_usb_get_maximum_speed to
>> > usb_get_maximum_speed
>> >    e65bc5467e07 usb: dwc3: Add frame length adjustment quirk
>> >    a90954c5d267 usb: musb: dsps: control musb speed based on dts
>> > setting
>> >    b48ff160a993 usb: renesas_usbhs: Allow an OTG PHY driver to
>> > provide VBUS
>> >    d1c59752195e usb: chipidea: set usb otg capabilities
>> >    733eada2cdec usb: common: add API to update usb otg capabilities
>> > by device tree
>> >    7ab2108dd82b usb: dwc3: core: avoid NULL pointer dereference
>> >    1aedb48b7dc9 usb: dwc3: add ULPI interface support
>> >    07e42a29fb7e usb: dwc3: pci: add quirk for Baytrails
>> >    065917252622 usb: dwc3: add hsphy_interface property
>> >    b2bb32a363a3 usb: dwc3: setup phys earlier
>> >    bf6bb0a6ebb5 usb: dwc3: soft reset to it's own function
>> >    d481da949476 usb: dwc3: cache hwparams earlier
>> >    9ac66262a201 usb: dwc3: store driver data earlier
>> >    5f940588938c usb: dwc3: ULPI or UTMI+ select
>> >    04fdce097f83 usb: dwc3: USB2 PHY register access bits
>> >    b7209213cc05 usb: add bus type for USB ULPI
>>
>> I have a suspicion this breaks qemuppc:
>>
>>
>> https://autobuilder.yoctoproject.org/main/builders/nightly-ppc-lsb/builds/683/steps/BuildImages/logs/stdio
>
>
> Yup. With mainline backports, I have a shorter validation cycle, since
> they really should
> be safe.
>
> I'll hunt up whatever is missing from the series and send another update.
>

I found the missing commit:  6a88bbe8e30d4beb2320b5a7452242a1fe7889c5

I added it to the patch, and just sent v2. qemuppc builds fine here with
this set of SRCREVs


Bruce



>
> Bruce
>
>
>>
>>
>> Cheers,
>>
>> Richard
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee
> at its end"
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a11436c72f7f789052df9f3c9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Sat, Mar 12, 2016 at 2:04 PM, Bruce Ashfield <span dir=3D"ltr">&lt;<=
a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield=
@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(20=
4,204,204);border-left-style:solid;padding-left:1ex"><div dir=3D"ltr"><br><=
div class=3D"gmail_extra"><br><div class=3D"gmail_quote"><div><div class=3D=
"h5">On Sat, Mar 12, 2016 at 9:43 AM, Richard Purdie <span dir=3D"ltr">&lt;=
<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">ric=
hard.purdie@linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;bo=
rder-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">=
<div><div>On Fri, 2016-03-11 at 13:44 -0500, Bruce Ashfield wrote:<br>
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
ilds/683/steps/BuildImages/logs/stdio</a></blockquote><div><br></div></div>=
</div><div>Yup. With mainline backports, I have a shorter validation cycle,=
 since they really should</div><div>be safe.</div><div><br></div><div>I&#39=
;ll hunt up whatever is missing from the series and send another update.</d=
iv></div></div></div></blockquote><div><br></div><div>I found the missing c=
ommit: =C2=A06a88bbe8e30d4beb2320b5a7452242a1fe7889c5</div><div><p class=3D=
"">I added it to the patch, and just sent v2. qemuppc builds fine here with=
 this set of SRCREVs</p><p class=3D""><br></p><p class=3D"">Bruce</p><p cla=
ss=3D"">=C2=A0<br></p></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,20=
4);border-left-style:solid;padding-left:1ex"><div dir=3D"ltr"><div class=3D=
"gmail_extra"><div class=3D"gmail_quote"><div><br></div><div>Bruce</div><sp=
an class=3D""><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204=
,204);border-left-style:solid;padding-left:1ex"><br>
<br>
Cheers,<br>
<br>
Richard<br>
<div><div>--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</div></div></blockquote></span></div><span class=3D""><font color=3D"#8888=
88"><br><br clear=3D"all"><div><br></div>-- <br><div>&quot;Thou shalt not f=
ollow the NULL pointer, for chaos and madness await thee at its end&quot;</=
div>
</font></span></div></div>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"gmail_signature">&quot;Thou shalt not follow the NULL pointer, for chao=
s and madness await thee at its end&quot;</div>
</div></div>

--001a11436c72f7f789052df9f3c9--
