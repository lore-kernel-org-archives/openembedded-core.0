Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qt0-f181.google.com (mail-qt0-f181.google.com
	[209.85.216.181])
	by mail.openembedded.org (Postfix) with ESMTP id CE98C77527
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 May 2017 02:40:48 +0000 (UTC)
Received: by mail-qt0-f181.google.com with SMTP id f55so170678428qta.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 May 2017 19:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=QEtisT95TedOQuZJw4sAhV8b2QUpVDfJiYapm1wpX0I=;
	b=TohseChq2l3pYw4yk6V7X2vIgrOnE5dVjdE1TK7aPMT8lWhdUi2Soow4vOouVToxVo
	iz25pQ17zAlAP+8ddvO2keoWVlgY8uS0SQcgXoWi7y73neMiLH7ApIB1V2xWZ8ki4Vmu
	xUq7S3q3f4b0vP/ZpGFRN9F3tclTWtBHh8k4yA6ZlYZp6nA45jM8wCuCt3jom19S0WYo
	mRwWoZT1qnrERFbUEObA8sohRgdsWIBe66I0bSDYIR9Osrfv2CFhyiOk6XlC18bEFA8p
	Ez3WpEz7vecoXxUnmJbYwD2Y3CoZTkIhjCVk20up2lWeAtYbd6OanN7GDYcXb69lp+V3
	LIoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=QEtisT95TedOQuZJw4sAhV8b2QUpVDfJiYapm1wpX0I=;
	b=sztgmv2Y38f2CERKTXxwaZPrDZrWK957FQZiyooEn2R7bL2oTSqxibBmFi5aDIsQkq
	+Pu3YUu4XvYsLOU1ajdSU/aIRNG4borhUMOEHFTee66mJvdFBFNaTpHDc5O07DpICT+/
	konoa4Sr1Lo1+h876VY1KeJ4YSLsPlq8wRt4hAEcGegXHzjfO6ktIKugSbbfDTcYqo8J
	zyuai+muAYrxjoTb4RWzVzrEZsIgZr+aBgFiaIEKsx8C78/ds7PQnGa/UokRl47sy7pt
	DYKfkwnDdks6kAcNkcuY9LclasRVXISO5WBZDZZ3rJpYfdMC4VKqAlBenqU0VGE9z9Na
	FkPw==
X-Gm-Message-State: AODbwcBUZBFYJzngeJeMLhJxGepib49R4jAC10Oszz8uAGqiCETB5OcO
	5GMAZ5vyPWW17AKo3cFt+0x1e3jbWg==
X-Received: by 10.200.34.60 with SMTP id o57mr38079399qto.41.1495680049543;
	Wed, 24 May 2017 19:40:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.182.109 with HTTP; Wed, 24 May 2017 19:40:49 -0700 (PDT)
In-Reply-To: <CADkTA4NZ2E7TPb7-Awd4d_ZsWCB8Zz2Xv06VzUOnbWY5VFAUpw@mail.gmail.com>
References: <20170522050042.42403-1-raj.khem@gmail.com>
	<20170522050042.42403-11-raj.khem@gmail.com>
	<CADkTA4M-3HipxJL7GnE9FJkK1hKJQ9EOjJpvUpyom8WNgbcGnw@mail.gmail.com>
	<CAMKF1sqBtBGzB_o_eM5SYhG+mS=kNqspYQDEu4dOe=FT70HSqA@mail.gmail.com>
	<CADkTA4NZ2E7TPb7-Awd4d_ZsWCB8Zz2Xv06VzUOnbWY5VFAUpw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 24 May 2017 22:40:49 -0400
Message-ID: <CADkTA4OFuN3c1QoevxzQuUT5zNSxmMPxooWwKLhu2aeF_vbb-w@mail.gmail.com>
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
X-List-Received-Date: Thu, 25 May 2017 02:40:49 -0000
Content-Type: multipart/alternative; boundary="001a113c40ac0cffc0055050268c"

--001a113c40ac0cffc0055050268c
Content-Type: text/plain; charset="UTF-8"

On Tue, May 23, 2017 at 3:36 PM, Bruce Ashfield <bruce.ashfield@gmail.com>
wrote:

>
>
> On Mon, May 22, 2017 at 1:06 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
>> >> +SRC_URI += "file://drm.cfg"
>> >
>> >
>> >
>> > If anything gets added to the default configurations, they need to go
>> into
>> > the kernel-cache
>> > and then be included by the relevant kernel types there.
>> >
>> > If you want, I can take care of switching things to that format.
>> >
>>
>> yes please.
>>
>
> Will do. I'll make it available to all active kernel versions + future
> ones.
>

As it turns out, we already have a similar fragment for vmware guests:

cfg/vmware-guest.cfg

--------------------

CONFIG_VMWARE_BALLOON=m

CONFIG_VMWARE_PVSCSI=y

CONFIG_VMWARE_VMCI=m

CONFIG_VSOCKETS=m

CONFIG_VMWARE_VMCI_VSOCKETS=m

CONFIG_VMXNET3=y

CONFIG_DRM_VMWGFX=m

CONFIG_DRM_VMWGFX_FBCON=y

CONFIG_FUSION=y

CONFIG_FUSION_SPI=y

CONFIG_FUSION_FC=y

CONFIG_FUSION_SAS=y

CONFIG_FUSION_MAX_SGE=128

CONFIG_FUSION_CTL=y

CONFIG_FUSION_LAN=y

CONFIG_FUSION_LOGGING=y

CONFIG_SCSI_MPT2SAS=y

CONFIG_SCSI_MPT2SAS_MAX_SGE=128

CONFIG_SCSI_MPT2SAS_LOGGING=y

CONFIG_SCSI_MPT3SAS=y

CONFIG_SCSI_MPT3SAS_MAX_SGE=128

CONFIG_SCSI_MPT3SAS_LOGGING=y
-------------

To stay consistent with that naming, I'll call this virtual-box-guest.cfg,
and it can be enabled
via KERNEL_FEATURES when needed.

I'm hesitant to globally enable it, since we don't need those modules on
all linux-yocto
kernels, just ones that are going to run on virtual box.

I could enable them for qemux86*, since those already have virtio configs
enabled by
default and these have a similar goal.

Thoughts ? I'd like to make sure that sounds reasonable, before spending
the time to
make the changes and test.

Bruce


> Cheers,
>
> Bruce
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

--001a113c40ac0cffc0055050268c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, May 23, 2017 at 3:36 PM, Bruce Ashfield <span dir=3D"ltr">&lt;<=
a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield=
@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div dir=3D"ltr"><br><div class=3D"gmail_extra"><div><div class=
=3D"gmail-h5"><br><div class=3D"gmail_quote">On Mon, May 22, 2017 at 1:06 P=
M, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wrote:<br><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex"><span>&gt;&gt; +SRC_URI +=3D &quot;file:/=
/drm.cfg&quot;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; If anything gets added to the default configurations, they need to go =
into<br>
&gt; the kernel-cache<br>
&gt; and then be included by the relevant kernel types there.<br>
&gt;<br>
&gt; If you want, I can take care of switching things to that format.<br>
&gt;<br>
<br>
</span>yes please.<br>
</blockquote></div><div class=3D"gmail_extra"><br></div></div></div><div cl=
ass=3D"gmail_extra">Will do. I&#39;ll make it available to all active kerne=
l versions + future ones.</div></div></div></blockquote><div><br></div><div=
>As it turns out, we already have a similar fragment for vmware guests:</di=
v><div><br></div><div>cfg/vmware-guest.cfg<br></div><div><br></div><div>---=
-----------------</div><div>







<p class=3D"gmail-p1"><span class=3D"gmail-s1">CONFIG_VMWARE_BALLOON=3D</sp=
an><span class=3D"gmail-s2">m</span></p><p class=3D"gmail-p1"><span class=
=3D"gmail-s1">CONFIG_VMWARE_PVSCSI=3D</span><span class=3D"gmail-s2">y</spa=
n><br></p>
<p class=3D"gmail-p1"><span class=3D"gmail-s1">CONFIG_VMWARE_VMCI=3D</span>=
<span class=3D"gmail-s2">m</span></p>
<p class=3D"gmail-p1"><span class=3D"gmail-s1">CONFIG_VSOCKETS=3D</span><sp=
an class=3D"gmail-s2">m</span></p>
<p class=3D"gmail-p1"><span class=3D"gmail-s1">CONFIG_VMWARE_VMCI_VSOCKETS=
=3D</span><span class=3D"gmail-s2">m</span></p>
<p class=3D"gmail-p1"><span class=3D"gmail-s1">CONFIG_VMXNET3=3D</span><spa=
n class=3D"gmail-s2">y</span></p>
<p class=3D"gmail-p1"><span class=3D"gmail-s1">CONFIG_DRM_VMWGFX=3D</span><=
span class=3D"gmail-s2">m</span></p>
<p class=3D"gmail-p1"><span class=3D"gmail-s1">CONFIG_DRM_VMWGFX_FBCON=3D</=
span><span class=3D"gmail-s2">y</span></p>
<p class=3D"gmail-p1"><span class=3D"gmail-s1">CONFIG_FUSION=3D</span><span=
 class=3D"gmail-s2">y</span></p>
<p class=3D"gmail-p1"><span class=3D"gmail-s1">CONFIG_FUSION_SPI=3D</span><=
span class=3D"gmail-s2">y</span></p>
<p class=3D"gmail-p1"><span class=3D"gmail-s1">CONFIG_FUSION_FC=3D</span><s=
pan class=3D"gmail-s2">y</span></p>
<p class=3D"gmail-p1"><span class=3D"gmail-s1">CONFIG_FUSION_SAS=3D</span><=
span class=3D"gmail-s2">y</span></p>
<p class=3D"gmail-p1"><span class=3D"gmail-s1">CONFIG_FUSION_MAX_SGE=3D</sp=
an><span class=3D"gmail-s2">128</span></p>
<p class=3D"gmail-p1"><span class=3D"gmail-s1">CONFIG_FUSION_CTL=3D</span><=
span class=3D"gmail-s2">y</span></p>
<p class=3D"gmail-p1"><span class=3D"gmail-s1">CONFIG_FUSION_LAN=3D</span><=
span class=3D"gmail-s2">y</span></p>
<p class=3D"gmail-p1"><span class=3D"gmail-s1">CONFIG_FUSION_LOGGING=3D</sp=
an><span class=3D"gmail-s2">y</span></p>
<p class=3D"gmail-p1"><span class=3D"gmail-s1">CONFIG_SCSI_MPT2SAS=3D</span=
><span class=3D"gmail-s2">y</span></p>
<p class=3D"gmail-p1"><span class=3D"gmail-s1">CONFIG_SCSI_MPT2SAS_MAX_SGE=
=3D</span><span class=3D"gmail-s2">128</span></p>
<p class=3D"gmail-p1"><span class=3D"gmail-s1">CONFIG_SCSI_MPT2SAS_LOGGING=
=3D</span><span class=3D"gmail-s2">y</span></p>
<p class=3D"gmail-p1"><span class=3D"gmail-s1">CONFIG_SCSI_MPT3SAS=3D</span=
><span class=3D"gmail-s2">y</span></p>
<p class=3D"gmail-p1"><span class=3D"gmail-s1">CONFIG_SCSI_MPT3SAS_MAX_SGE=
=3D</span><span class=3D"gmail-s2">128</span></p>
<p class=3D"gmail-p1"><span class=3D"gmail-s1">CONFIG_SCSI_MPT3SAS_LOGGING=
=3D</span><span class=3D"gmail-s2">y</span></p></div><div>-------------=C2=
=A0<br></div><div><br></div><div>To stay consistent with that naming, I&#39=
;ll call this virtual-box-guest.cfg, and it can be enabled</div><div>via KE=
RNEL_FEATURES when needed.=C2=A0</div><div><br></div><div>I&#39;m hesitant =
to globally enable it, since we don&#39;t need those modules on all linux-y=
octo</div><div>kernels, just ones that are going to run on virtual box.=C2=
=A0</div><div><br></div><div>I could enable them for qemux86*, since those =
already have virtio configs enabled by</div><div>default and these have a s=
imilar goal.</div><div><br></div><div>Thoughts ? I&#39;d like to make sure =
that sounds reasonable, before spending the time to=C2=A0</div><div>make th=
e changes and test.</div><div><br></div><div>Bruce</div><div><br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=
=3D"gmail_extra"><div class=3D"gmail_extra"><br></div><div class=3D"gmail_e=
xtra">Cheers,</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail=
_extra">Bruce</div><span class=3D"gmail-"><br><br clear=3D"all"><div><br></=
div>-- <br><div class=3D"gmail-m_-5351939124826968667gmail_signature">&quot=
;Thou shalt not follow the NULL pointer, for chaos and madness await thee a=
t its end&quot;</div>
</span></div></div>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"gmail_signature">&quot;Thou shalt not follow the NULL pointer, for chao=
s and madness await thee at its end&quot;</div>
</div></div>

--001a113c40ac0cffc0055050268c--
