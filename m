Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk0-f176.google.com (mail-qk0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id 1A9597810B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 May 2017 12:01:43 +0000 (UTC)
Received: by mail-qk0-f176.google.com with SMTP id y201so175015884qka.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 May 2017 05:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=4jVy3KUO3Wm1HTFybhrV8V170gg9TJOeoU5vBJytAOU=;
	b=tYKMkGvSTjXBKEpzPCb110z4mVKwc6Ji1kZMetFPS4Gj4093EzLTGnAILNLtbhp2/R
	5V0HxSHUzsbUkqsx1t4ZCbW28mA1bemtx8ivaI47Wmaok4bo8CkTfm+ZwDKeZiehECpl
	adEmPdKuxk7WGhcx7rINz720KcZ25TvTHimxUMAJQo2GQFUaXBM+sZ8RpeYrYc8fG/WJ
	lyAw7Pe5Zec2ca8Z6Oo2/tMmD0fUcKqtDPzaJFxNPd+ZqDTOzA3Roz7TOHO71Radkaht
	Z2dd2T11T8P5O4+9Ji/uf+CmQyCDpY9WC8stMFPqAZ33rHJSHQSSLUZlVLOl4eolbPX7
	yGqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=4jVy3KUO3Wm1HTFybhrV8V170gg9TJOeoU5vBJytAOU=;
	b=c9j6GqXNBR6nou/CLyiF1Wks33Cm+Whel2B3PKghiR8DgqLPmUm0u7yuRideY3F77u
	CZEInMxtolv/Xs9LkWL0nCw70i2cSKRJ9jcMFuMP3EwtL9nUU/73LDRiD1USpJdHZLzy
	L2mDP2f+JRP4zoGI6VXny185Z83pU69Zzwm6pmS8MHjgpXNCfT9dsBvLWbVxd0e7IeuY
	ViwpULfNkc3tEfCFxwbnsyV7Z1l3Pkv8Po99leZ338sQRwM4rsnxylvO5LycxuxUp20e
	HaroNpByRJGqj5flasK+7QIAOFnvNyWQGyK65nWXcAtn5ctkdIWy6a2/woJUJqIbxei7
	4MaA==
X-Gm-Message-State: AODbwcDApOn85oVdQdLXigJYZ7nDDqpl/qIEhD35ioYPRPfLe2FTBlks
	/W0f57eQJWyZJhCxU2kf60IjxlJ1Jg==
X-Received: by 10.55.118.199 with SMTP id r190mr36371880qkc.43.1495713704744; 
	Thu, 25 May 2017 05:01:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.182.109 with HTTP; Thu, 25 May 2017 05:01:44 -0700 (PDT)
In-Reply-To: <CAMKF1sqnqBr9wZwnHoozcE1swutjaRQyuEnLFMh0p6THcGybtg@mail.gmail.com>
References: <20170522050042.42403-1-raj.khem@gmail.com>
	<20170522050042.42403-11-raj.khem@gmail.com>
	<CADkTA4M-3HipxJL7GnE9FJkK1hKJQ9EOjJpvUpyom8WNgbcGnw@mail.gmail.com>
	<CAMKF1sqBtBGzB_o_eM5SYhG+mS=kNqspYQDEu4dOe=FT70HSqA@mail.gmail.com>
	<CADkTA4NZ2E7TPb7-Awd4d_ZsWCB8Zz2Xv06VzUOnbWY5VFAUpw@mail.gmail.com>
	<CADkTA4OFuN3c1QoevxzQuUT5zNSxmMPxooWwKLhu2aeF_vbb-w@mail.gmail.com>
	<CAMKF1sqnqBr9wZwnHoozcE1swutjaRQyuEnLFMh0p6THcGybtg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 25 May 2017 08:01:44 -0400
Message-ID: <CADkTA4MQnsXSOuRswaJqo0=oNVF1OZKRinhnvp22jPCyS4dCiA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 11/15] linux-yocto: Enable drm by default
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
X-List-Received-Date: Thu, 25 May 2017 12:01:45 -0000
Content-Type: multipart/alternative; boundary="94eb2c05e3640e9d08055057fc0c"

--94eb2c05e3640e9d08055057fc0c
Content-Type: text/plain; charset="UTF-8"

On Wed, May 24, 2017 at 10:46 PM, Khem Raj <raj.khem@gmail.com> wrote:

> On Wed, May 24, 2017 at 7:40 PM, Bruce Ashfield
> <bruce.ashfield@gmail.com> wrote:
> >
> >
> > On Tue, May 23, 2017 at 3:36 PM, Bruce Ashfield <
> bruce.ashfield@gmail.com>
> > wrote:
> >>
> >>
> >>
> >> On Mon, May 22, 2017 at 1:06 PM, Khem Raj <raj.khem@gmail.com> wrote:
> >>>
> >>> >> +SRC_URI += "file://drm.cfg"
> >>> >
> >>> >
> >>> >
> >>> > If anything gets added to the default configurations, they need to go
> >>> > into
> >>> > the kernel-cache
> >>> > and then be included by the relevant kernel types there.
> >>> >
> >>> > If you want, I can take care of switching things to that format.
> >>> >
> >>>
> >>> yes please.
> >>
> >>
> >> Will do. I'll make it available to all active kernel versions + future
> >> ones.
> >
> >
> > As it turns out, we already have a similar fragment for vmware guests:
> >
> > cfg/vmware-guest.cfg
> >
> > --------------------
> >
> > CONFIG_VMWARE_BALLOON=m
> >
> > CONFIG_VMWARE_PVSCSI=y
> >
> > CONFIG_VMWARE_VMCI=m
> >
> > CONFIG_VSOCKETS=m
> >
> > CONFIG_VMWARE_VMCI_VSOCKETS=m
> >
> > CONFIG_VMXNET3=y
> >
> > CONFIG_DRM_VMWGFX=m
> >
> > CONFIG_DRM_VMWGFX_FBCON=y
> >
> > CONFIG_FUSION=y
> >
> > CONFIG_FUSION_SPI=y
> >
> > CONFIG_FUSION_FC=y
> >
> > CONFIG_FUSION_SAS=y
> >
> > CONFIG_FUSION_MAX_SGE=128
> >
> > CONFIG_FUSION_CTL=y
> >
> > CONFIG_FUSION_LAN=y
> >
> > CONFIG_FUSION_LOGGING=y
> >
> > CONFIG_SCSI_MPT2SAS=y
> >
> > CONFIG_SCSI_MPT2SAS_MAX_SGE=128
> >
> > CONFIG_SCSI_MPT2SAS_LOGGING=y
> >
> > CONFIG_SCSI_MPT3SAS=y
> >
> > CONFIG_SCSI_MPT3SAS_MAX_SGE=128
> >
> > CONFIG_SCSI_MPT3SAS_LOGGING=y
> >
> > -------------
> >
> > To stay consistent with that naming, I'll call this
> virtual-box-guest.cfg,
> > and it can be enabled
> > via KERNEL_FEATURES when needed.
> >
> > I'm hesitant to globally enable it, since we don't need those modules on
> all
> > linux-yocto
> > kernels, just ones that are going to run on virtual box.
> >
> > I could enable them for qemux86*, since those already have virtio configs
> > enabled by
> > default and these have a similar goal.
> >
> > Thoughts ? I'd like to make sure that sounds reasonable, before spending
> the
> > time to
> > make the changes and test.
> >
>
> I would suggest to enable them by default since these are modules they
> dont impact the size of kernel itself. Then we can use recommends to
> choose them in machine configs.
>

We've never done that before, there's hundreds of modules we could turn on
just in case, but instead only enable them for machines that can actually
use
them.

Many users use the meta package for modules and expect the build to be as
minimal as possible.

So I'm balancing both those use cases.

I'll complete the fragment and we can enable it in a second commit to keep
the
options open.

Bruce


>
> > Bruce
> >
> >>
> >> Cheers,
> >>
> >> Bruce
> >>
> >>
> >>
> >> --
> >> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee
> >> at its end"
> >
> >
> >
> >
> > --
> > "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at
> > its end"
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--94eb2c05e3640e9d08055057fc0c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Wed, May 24, 2017 at 10:46 PM, Khem Raj <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">On Wed, May 24, 2017 at 7=
:40 PM, Bruce Ashfield<br>
<div><div class=3D"h5">&lt;<a href=3D"mailto:bruce.ashfield@gmail.com">bruc=
e.ashfield@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt; On Tue, May 23, 2017 at 3:36 PM, Bruce Ashfield &lt;<a href=3D"mailto:=
bruce.ashfield@gmail.com">bruce.ashfield@gmail.com</a>&gt;<br>
&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; On Mon, May 22, 2017 at 1:06 PM, Khem Raj &lt;<a href=3D"mailto:ra=
j.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; &gt;&gt; +SRC_URI +=3D &quot;file://drm.cfg&quot;<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; If anything gets added to the default configurations, the=
y need to go<br>
&gt;&gt;&gt; &gt; into<br>
&gt;&gt;&gt; &gt; the kernel-cache<br>
&gt;&gt;&gt; &gt; and then be included by the relevant kernel types there.<=
br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; If you want, I can take care of switching things to that =
format.<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; yes please.<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Will do. I&#39;ll make it available to all active kernel versions =
+ future<br>
&gt;&gt; ones.<br>
&gt;<br>
&gt;<br>
&gt; As it turns out, we already have a similar fragment for vmware guests:=
<br>
&gt;<br>
&gt; cfg/vmware-guest.cfg<br>
&gt;<br>
&gt; --------------------<br>
&gt;<br>
&gt; CONFIG_VMWARE_BALLOON=3Dm<br>
&gt;<br>
&gt; CONFIG_VMWARE_PVSCSI=3Dy<br>
&gt;<br>
&gt; CONFIG_VMWARE_VMCI=3Dm<br>
&gt;<br>
&gt; CONFIG_VSOCKETS=3Dm<br>
&gt;<br>
&gt; CONFIG_VMWARE_VMCI_VSOCKETS=3Dm<br>
&gt;<br>
&gt; CONFIG_VMXNET3=3Dy<br>
&gt;<br>
&gt; CONFIG_DRM_VMWGFX=3Dm<br>
&gt;<br>
&gt; CONFIG_DRM_VMWGFX_FBCON=3Dy<br>
&gt;<br>
&gt; CONFIG_FUSION=3Dy<br>
&gt;<br>
&gt; CONFIG_FUSION_SPI=3Dy<br>
&gt;<br>
&gt; CONFIG_FUSION_FC=3Dy<br>
&gt;<br>
&gt; CONFIG_FUSION_SAS=3Dy<br>
&gt;<br>
&gt; CONFIG_FUSION_MAX_SGE=3D128<br>
&gt;<br>
&gt; CONFIG_FUSION_CTL=3Dy<br>
&gt;<br>
&gt; CONFIG_FUSION_LAN=3Dy<br>
&gt;<br>
&gt; CONFIG_FUSION_LOGGING=3Dy<br>
&gt;<br>
&gt; CONFIG_SCSI_MPT2SAS=3Dy<br>
&gt;<br>
&gt; CONFIG_SCSI_MPT2SAS_MAX_SGE=3D<wbr>128<br>
&gt;<br>
&gt; CONFIG_SCSI_MPT2SAS_LOGGING=3Dy<br>
&gt;<br>
&gt; CONFIG_SCSI_MPT3SAS=3Dy<br>
&gt;<br>
&gt; CONFIG_SCSI_MPT3SAS_MAX_SGE=3D<wbr>128<br>
&gt;<br>
&gt; CONFIG_SCSI_MPT3SAS_LOGGING=3Dy<br>
&gt;<br>
&gt; -------------<br>
&gt;<br>
&gt; To stay consistent with that naming, I&#39;ll call this virtual-box-gu=
est.cfg,<br>
&gt; and it can be enabled<br>
&gt; via KERNEL_FEATURES when needed.<br>
&gt;<br>
&gt; I&#39;m hesitant to globally enable it, since we don&#39;t need those =
modules on all<br>
&gt; linux-yocto<br>
&gt; kernels, just ones that are going to run on virtual box.<br>
&gt;<br>
&gt; I could enable them for qemux86*, since those already have virtio conf=
igs<br>
&gt; enabled by<br>
&gt; default and these have a similar goal.<br>
&gt;<br>
&gt; Thoughts ? I&#39;d like to make sure that sounds reasonable, before sp=
ending the<br>
&gt; time to<br>
&gt; make the changes and test.<br>
&gt;<br>
<br>
</div></div>I would suggest to enable them by default since these are modul=
es they<br>
dont impact the size of kernel itself. Then we can use recommends to<br>
choose them in machine configs.<br></blockquote><div><br></div><div>We&#39;=
ve never done that before, there&#39;s hundreds of modules we could turn on=
=C2=A0</div><div>just in case, but instead only enable them for machines th=
at can actually use</div><div>them.</div><div><br></div><div>Many users use=
 the meta package for modules and expect the build to be as</div><div>minim=
al as possible.</div><div><br></div><div>So I&#39;m balancing both those us=
e cases.</div><div><br></div><div>I&#39;ll complete the fragment and we can=
 enable it in a second commit to keep the</div><div>options open.</div><div=
><br></div><div>Bruce</div><div>=C2=A0</div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt; Bruce<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; Cheers,<br>
&gt;&gt;<br>
&gt;&gt; Bruce<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; &quot;Thou shalt not follow the NULL pointer, for chaos and madnes=
s await thee<br>
&gt;&gt; at its end&quot;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; &quot;Thou shalt not follow the NULL pointer, for chaos and madness aw=
ait thee at<br>
&gt; its end&quot;<br>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
<div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Tho=
u shalt not follow the NULL pointer, for chaos and madness await thee at it=
s end&quot;</div>
</div></div>

--94eb2c05e3640e9d08055057fc0c--
