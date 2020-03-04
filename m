Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f66.google.com (mail-ua1-f66.google.com
	[209.85.222.66])
	by mail.openembedded.org (Postfix) with ESMTP id 73E0C61855
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Mar 2020 10:13:59 +0000 (UTC)
Received: by mail-ua1-f66.google.com with SMTP id a33so444703uad.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Mar 2020 02:14:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Tha7WEdTMI69ZbHKRWYxMsCAhCuLccjUkq+5MSYBxM0=;
	b=iRuyBeb5Sbzb8MMwl3Aqa5TTFLjebCrYE4MaGpF7di7dIYGBeealr51Z4cDyl40cSF
	UUOaGAVLI42kyz++GRWDk22KZVjpdb9L1QFBi4fpEeiSDM/uKv9yGBvwlrNcZlJLeO1k
	5i0kPCR46pYgrYZqDzBYU9q1WxnxpJjszGUmYxoFsza5k394sHA/4aZbx0kHWk2Jjlrv
	8Buj6oERjvQMHoFwwigc0agwsQWr8bpR3iJMGEcYo55H7nhv1I2+VlQsbs38zWH3VzIR
	dF6X7lU2oQKNPYYAy3UfP9z+Ql5EQKqzQFSt3AmObhtkVyA6p65AW/eBTZNnZzrRHfDJ
	3tcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Tha7WEdTMI69ZbHKRWYxMsCAhCuLccjUkq+5MSYBxM0=;
	b=VssOiTqA4iWQ53o64OYLhBKvjUsASGoKvsDGKyYa3lcwEj8RyOc9z/xpfuPxS7C56O
	FWt9uKgase8CEU197huvQYo7o6WVvhU1EfJZY0g/D07cr8xaTOhfklxJ5H/L587Ru6kw
	lERPItdUoq3GavC29HNLKH0Zru5mR4gPPKVEOX7t48TeCNi/UVq9ILfnLalLzWyLWjHV
	PTVcuRgyjA851aMQx3EhjltUKkc2DJn4YvA0/B4A2h60sNWomksZRpQM6z0A9dofD22C
	uVwgbjkjJJq46gcTXVb42mnqKUNst41vP8ePk0NR263NyEQFuD145l9YFKGmMaF4o89f
	Yd2Q==
X-Gm-Message-State: ANhLgQ0jMGI2UifmxCdQtkQ++12PldjO2mETZzzViQarYh09On4PCd0v
	rGSeIMnoKONU+ZC0P4TBZJL7HOw4SY88jBxZPrtXVQ==
X-Google-Smtp-Source: ADFU+vvabhztgeiwIL2quCRdcYynwchop0bix0XWIx8/8RhfUBeDdeGKhQWuyQsh2H+OoyM5sPbMJ22ohk0PklyP0qw=
X-Received: by 2002:ab0:7802:: with SMTP id x2mr1037435uaq.100.1583316840379; 
	Wed, 04 Mar 2020 02:14:00 -0800 (PST)
MIME-Version: 1.0
References: <20200129090738.1398-1-alex.kanavin@gmail.com>
	<20200129090738.1398-9-alex.kanavin@gmail.com>
	<2588ab8f2899ec2b139a9ce3619ae6ed06648ba3.camel@andred.net>
In-Reply-To: <2588ab8f2899ec2b139a9ce3619ae6ed06648ba3.camel@andred.net>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 4 Mar 2020 11:13:48 +0100
Message-ID: <CANNYZj-PGHaA1RnUpFpBaWnM6h9+2VTz946TAC28mndApqfC8g@mail.gmail.com>
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: linux-firmware broken (was: Re: [PATCH 09/24] linux-firmware: upgrade to latest revision)
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
X-List-Received-Date: Wed, 04 Mar 2020 10:13:59 -0000
Content-Type: multipart/alternative; boundary="000000000000d6781d05a004adab"

--000000000000d6781d05a004adab
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Patch sent :)

Alex

On Wed, 4 Mar 2020 at 10:17, Andr=C3=A9 Draszik <git@andred.net> wrote:

> On Wed, 2020-01-29 at 10:07 +0100, Alexander Kanavin wrote:
> > License-Update: Copyright years, file lists
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>
> This recipe update has broken linux-firmware for various devices I think.
>
> It appears that since upstream's 20191022 release, linux-firmware is not
> meant to be installed via simple copying anymore  (as this recipe still
> does in do_install()), but instead you're meant to use their
> copy-firmware.sh script.
>
> In particular, all the symlinks that used to be part of the upstream git
> are missing now, because copy-firmware extracts them on the fly from the
> WHENCE file, they're not part of the git repository anymore. Without thos=
e
> various kernel drivers will fail to load their firmware...
>
>
> Cheers,
> Andre'
>
>
> > ---
> >  ...ux-firmware_20190815.bb =3D> linux-firmware_20200117.bb} | 8 +++++-=
--
> >  1 file changed, 5 insertions(+), 3 deletions(-)
> >  rename meta/recipes-kernel/linux-firmware/{linux-firmware_20190815.bb
> =3D> linux-firmware_20200117.bb} (99%)
> >
> > diff --git a/meta/recipes-kernel/linux-firmware/
> linux-firmware_20190815.bb b/meta/recipes-kernel/linux-firmware/linux-
> > firmware_20200117.bb
> > similarity index 99%
> > rename from meta/recipes-kernel/linux-firmware/
> linux-firmware_20190815.bb
> > rename to meta/recipes-kernel/linux-firmware/linux-firmware_20200117.bb
> > index d83000b64f0..8111c410161 100644
> > --- a/meta/recipes-kernel/linux-firmware/linux-firmware_20190815.bb
> > +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20200117.bb
> > @@ -66,7 +66,7 @@ LICENSE =3D "\
> >  LIC_FILES_CHKSUM =3D
> "file://LICENCE.Abilis;md5=3Db5ee3f410780e56711ad48eadc22b8bc \
> >
> file://LICENCE.adsp_sst;md5=3D615c45b91a5a4a9fe046d6ab9a2df728 \
> >
> file://LICENCE.agere;md5=3Daf0133de6b4a9b2522defd5f188afd31 \
> > -
> file://LICENSE.amdgpu;md5=3Dab515ef6495ab5c5a3b08ab2db62df11 \
> > +
> file://LICENSE.amdgpu;md5=3Dd357524f5099e2a3db3c1838921c593f \
> >
> file://LICENSE.amd-ucode;md5=3D3c5399dc9148d7f0e1f41e34b69cf14f \
> >
> file://LICENSE.amlogic_vdec;md5=3Ddc44f59bf64a81643e500ad3f39a468a \
> >
> file://LICENCE.atheros_firmware;md5=3D30a14c7823beedac9fa39c64fdd01a13 \
> > @@ -88,6 +88,7 @@ LIC_FILES_CHKSUM =3D
> "file://LICENCE.Abilis;md5=3Db5ee3f410780e56711ad48eadc22b8bc \
> >
> file://LICENCE.i2400m;md5=3D14b901969e23c41881327c0d9e4b7d36 \
> >
> file://LICENSE.i915;md5=3D2b0b2e0d20984affd4490ba2cba02570 \
> >
> file://LICENCE.ibt_firmware;md5=3Dfdbee1ddfe0fb7ab0b2fcd6b454a366b \
> > +
> file://LICENSE.ice;md5=3D742ab4850f2670792940e6d15c974b2f \
> >
> file://LICENCE.IntcSST2;md5=3D9e7d8bea77612d7cc7d9e9b54b623062 \
> >
> file://LICENCE.it913x;md5=3D1fbf727bfb6a949810c4dbfa7e6ce4f8 \
> >
> file://LICENCE.iwlwifi_firmware;md5=3D3fd842911ea93c29cd32679aa23e1c88 \
> > @@ -98,6 +99,7 @@ LIC_FILES_CHKSUM =3D
> "file://LICENCE.Abilis;md5=3Db5ee3f410780e56711ad48eadc22b8bc \
> >
> file://LICENCE.myri10ge_firmware;md5=3D42e32fb89f6b959ca222e25ac8df8fed \
> >
> file://LICENCE.Netronome;md5=3D4add08f2577086d44447996503cddf5f \
> >
> file://LICENCE.nvidia;md5=3D4428a922ed3ba2ceec95f076a488ce07 \
> > +
> file://LICENCE.NXP;md5=3D58bb8ba632cd729b9ba6183bc6aed36f \
> >
> file://LICENCE.OLPC;md5=3D5b917f9d8c061991be4f6f5f108719cd \
> >
> file://LICENCE.open-ath9k-htc-firmware;md5=3D1b33c9f4d17bc4d457bdb2372704=
6837
> \
> >
> file://LICENCE.phanfw;md5=3D954dcec0e051f9409812b561ea743bfa \
> > @@ -123,7 +125,7 @@ LIC_FILES_CHKSUM =3D
> "file://LICENCE.Abilis;md5=3Db5ee3f410780e56711ad48eadc22b8bc \
> >
> file://LICENCE.xc4000;md5=3D0ff51d2dc49fce04814c9155081092f0 \
> >
> file://LICENCE.xc5000;md5=3D1e170c13175323c32c7f4d0998d53f66 \
> >
> file://LICENCE.xc5000c;md5=3D12b02efa3049db65d524aeb418dd87ca \
> > -                    file://WHENCE;md5=3D37a01e379219d1e06dbccfa90a8fc0=
ad \
> > +                    file://WHENCE;md5=3Dcdcd9f664a404c681bb745bcac6253=
a3 \
> >                      "
> >
> >  # These are not common licenses, set NO_GENERIC_LICENSE for them
> > @@ -192,7 +194,7 @@ NO_GENERIC_LICENSE[WHENCE] =3D "WHENCE"
> >
> >  PE =3D "1"
> >
> > -SRCREV =3D "07b925b450bfb4cf3e141c612ec5b104658cd020"
> > +SRCREV =3D "9c340bd1bdabf53808a9178a7be98c5f2ad599a7"
> >
> >  SRC_URI =3D "git://
> git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git"
> >
> > --
> > 2.25.0
> >
>
>

--000000000000d6781d05a004adab
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Patch sent :)</div><div><br></div><div>Alex<br></div>=
</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
On Wed, 4 Mar 2020 at 10:17, Andr=C3=A9 Draszik &lt;<a href=3D"mailto:git@a=
ndred.net">git@andred.net</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">On Wed, 2020-01-29 at 10:07 +0100, Alexander Kanav=
in wrote:<br>
&gt; License-Update: Copyright years, file lists<br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gm=
ail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
<br>
This recipe update has broken linux-firmware for various devices I think.<b=
r>
<br>
It appears that since upstream&#39;s 20191022 release, linux-firmware is no=
t<br>
meant to be installed via simple copying anymore=C2=A0 (as this recipe stil=
l<br>
does in do_install()), but instead you&#39;re meant to use their<br>
copy-firmware.sh script.<br>
<br>
In particular, all the symlinks that used to be part of the upstream git<br=
>
are missing now, because copy-firmware extracts them on the fly from the<br=
>
WHENCE file, they&#39;re not part of the git repository anymore. Without th=
ose<br>
various kernel drivers will fail to load their firmware...<br>
<br>
<br>
Cheers,<br>
Andre&#39;<br>
<br>
<br>
&gt; ---<br>
&gt;=C2=A0 ...<a href=3D"http://ux-firmware_20190815.bb" rel=3D"noreferrer"=
 target=3D"_blank">ux-firmware_20190815.bb</a> =3D&gt; <a href=3D"http://li=
nux-firmware_20200117.bb" rel=3D"noreferrer" target=3D"_blank">linux-firmwa=
re_20200117.bb</a>} | 8 +++++---<br>
&gt;=C2=A0 1 file changed, 5 insertions(+), 3 deletions(-)<br>
&gt;=C2=A0 rename meta/recipes-kernel/linux-firmware/{<a href=3D"http://lin=
ux-firmware_20190815.bb" rel=3D"noreferrer" target=3D"_blank">linux-firmwar=
e_20190815.bb</a> =3D&gt; <a href=3D"http://linux-firmware_20200117.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-firmware_20200117.bb</a>} (99%)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-kernel/linux-firmware/<a href=3D"http://linu=
x-firmware_20190815.bb" rel=3D"noreferrer" target=3D"_blank">linux-firmware=
_20190815.bb</a> b/meta/recipes-kernel/linux-firmware/linux-<br>
&gt; <a href=3D"http://firmware_20200117.bb" rel=3D"noreferrer" target=3D"_=
blank">firmware_20200117.bb</a><br>
&gt; similarity index 99%<br>
&gt; rename from meta/recipes-kernel/linux-firmware/<a href=3D"http://linux=
-firmware_20190815.bb" rel=3D"noreferrer" target=3D"_blank">linux-firmware_=
20190815.bb</a><br>
&gt; rename to meta/recipes-kernel/linux-firmware/<a href=3D"http://linux-f=
irmware_20200117.bb" rel=3D"noreferrer" target=3D"_blank">linux-firmware_20=
200117.bb</a><br>
&gt; index d83000b64f0..8111c410161 100644<br>
&gt; --- a/meta/recipes-kernel/linux-firmware/<a href=3D"http://linux-firmw=
are_20190815.bb" rel=3D"noreferrer" target=3D"_blank">linux-firmware_201908=
15.bb</a><br>
&gt; +++ b/meta/recipes-kernel/linux-firmware/<a href=3D"http://linux-firmw=
are_20200117.bb" rel=3D"noreferrer" target=3D"_blank">linux-firmware_202001=
17.bb</a><br>
&gt; @@ -66,7 +66,7 @@ LICENSE =3D &quot;\<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://LICENCE.Abilis;md5=3Db5ee3f410=
780e56711ad48eadc22b8bc \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 file://LICENCE.adsp_sst;md5=3D615c45b91a5a4a9fe046d6ab9a2df728 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 file://LICENCE.agere;md5=3Daf0133de6b4a9b2522defd5f188afd31 \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 file://LICENSE.amdgpu;md5=3Dab515ef6495ab5c5a3b08ab2db62df11 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 file://LICENSE.amdgpu;md5=3Dd357524f5099e2a3db3c1838921c593f \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 file://LICENSE.amd-ucode;md5=3D3c5399dc9148d7f0e1f41e34b69cf14f \<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 file://LICENSE.amlogic_vdec;md5=3Ddc44f59bf64a81643e500ad3f39a468a \=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 file://LICENCE.atheros_firmware;md5=3D30a14c7823beedac9fa39c64fdd01a=
13 \<br>
&gt; @@ -88,6 +88,7 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENCE.Abilis;md5=
=3Db5ee3f410780e56711ad48eadc22b8bc \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 file://LICENCE.i2400m;md5=3D14b901969e23c41881327c0d9e4b7d36 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 file://LICENSE.i915;md5=3D2b0b2e0d20984affd4490ba2cba02570 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 file://LICENCE.ibt_firmware;md5=3Dfdbee1ddfe0fb7ab0b2fcd6b454a366b \=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 file://LICENSE.ice;md5=3D742ab4850f2670792940e6d15c974b2f \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 file://LICENCE.IntcSST2;md5=3D9e7d8bea77612d7cc7d9e9b54b623062 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 file://LICENCE.it913x;md5=3D1fbf727bfb6a949810c4dbfa7e6ce4f8 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 file://LICENCE.iwlwifi_firmware;md5=3D3fd842911ea93c29cd32679aa23e1c=
88 \<br>
&gt; @@ -98,6 +99,7 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENCE.Abilis;md5=
=3Db5ee3f410780e56711ad48eadc22b8bc \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 file://LICENCE.myri10ge_firmware;md5=3D42e32fb89f6b959ca222e25ac8df8=
fed \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 file://LICENCE.Netronome;md5=3D4add08f2577086d44447996503cddf5f \<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 file://LICENCE.nvidia;md5=3D4428a922ed3ba2ceec95f076a488ce07 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 file://LICENCE.NXP;md5=3D58bb8ba632cd729b9ba6183bc6aed36f \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 file://LICENCE.OLPC;md5=3D5b917f9d8c061991be4f6f5f108719cd \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 file://LICENCE.open-ath9k-htc-firmware;md5=3D1b33c9f4d17bc4d457bdb23=
727046837 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 file://LICENCE.phanfw;md5=3D954dcec0e051f9409812b561ea743bfa \<br>
&gt; @@ -123,7 +125,7 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENCE.Abilis;m=
d5=3Db5ee3f410780e56711ad48eadc22b8bc \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 file://LICENCE.xc4000;md5=3D0ff51d2dc49fce04814c9155081092f0 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 file://LICENCE.xc5000;md5=3D1e170c13175323c32c7f4d0998d53f66 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 file://LICENCE.xc5000c;md5=3D12b02efa3049db65d524aeb418dd87ca \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 file://WHENCE;md5=3D37a01e379219d1e06dbccfa90a8fc0ad \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 file://WHENCE;md5=3Dcdcd9f664a404c681bb745bcac6253a3 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # These are not common licenses, set NO_GENERIC_LICENSE for them=
<br>
&gt; @@ -192,7 +194,7 @@ NO_GENERIC_LICENSE[WHENCE] =3D &quot;WHENCE&quot;<=
br>
&gt;=C2=A0 <br>
&gt;=C2=A0 PE =3D &quot;1&quot;<br>
&gt;=C2=A0 <br>
&gt; -SRCREV =3D &quot;07b925b450bfb4cf3e141c612ec5b104658cd020&quot;<br>
&gt; +SRCREV =3D &quot;9c340bd1bdabf53808a9178a7be98c5f2ad599a7&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://git.kernel.org/pub/scm=
/linux/kernel/git/firmware/linux-firmware.git" rel=3D"noreferrer" target=3D=
"_blank">git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.gi=
t</a>&quot;<br>
&gt;=C2=A0 <br>
&gt; -- <br>
&gt; 2.25.0<br>
&gt; <br>
<br>
</blockquote></div>

--000000000000d6781d05a004adab--
