Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f179.google.com (mail-ve0-f179.google.com
	[209.85.128.179])
	by mail.openembedded.org (Postfix) with ESMTP id ABF186B25A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2013 10:22:03 +0000 (UTC)
Received: by mail-ve0-f179.google.com with SMTP id c13so155611vea.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2013 03:22:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=8vgeM18IGjd/SW/LpWEOxxLFPZgqQ5KwXHDfbuMIDNM=;
	b=OdslNl1Sk54pwcboEHiislYuJOfN3Au8EA8LM1hFCwI2zNvyMv7z4ZNipLmprYnnl+
	6tacERLoiLgkzTQzjWvZSwafvbS+4w4Ewv/8/FHkJsIQaM8JqYR5mJu30NDMbQHCdv/A
	NpJtwcR8+cIJy05T+hm9Pbd/enm2Mo52v2h+6quE3wAeL/MZIz+aLQN5iMKDbEnXhFSI
	A8Kp84xuJuJN4GucGRfiHi3wrfqqXvGCaP1BQuIv307NsUgdJt5k8Z5mesQrcYhsNvc/
	UDBKSkLHV76ymCGZSKwCVkSCaZv5fgewdqKZK7G5D6LcQgtAcyuS5pHoNJdWaDbA7IkT
	9hGA==
X-Gm-Message-State: ALoCoQmhTcvr7APT1F3OOrKiqPgq3BR6cwKobchui2oGNC3cmOVRoiwSGoGqwc5S+12xsYU8/Q56
X-Received: by 10.52.36.204 with SMTP id s12mr44909vdj.36.1377080523920; Wed,
	21 Aug 2013 03:22:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Wed, 21 Aug 2013 03:21:43 -0700 (PDT)
In-Reply-To: <CAOMwXhOLPoK994vd7aNnPKhutKfzriLSsg4XCPP6oCGO98jD9g@mail.gmail.com>
References: <CAOMwXhNaMEvSfi-J=EPOXfSAfjWUJeq8pGAGE3_5Hix1Sw9mKg@mail.gmail.com>
	<520E17F6.4030500@communistcode.co.uk>
	<CAOMwXhMD5FE2jK-R+5SCYRCtpS0S_Nk-6HhbsiUJt9i63-kHUQ@mail.gmail.com>
	<52147D02.10106@communistcode.co.uk>
	<CAJTo0Lap8PHE-=d_S7M7gEOzaXud3EqWgkbzU+5VQH7vUeVw7g@mail.gmail.com>
	<CAOMwXhOLPoK994vd7aNnPKhutKfzriLSsg4XCPP6oCGO98jD9g@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 21 Aug 2013 11:21:43 +0100
Message-ID: <CAJTo0LYraeUno84Hof7PPiJ3d9_eydwRTjB1D7VjojoZNPOZYQ@mail.gmail.com>
To: Laszlo Papp <lpapp@kde.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Why is "bitbake core-image-minimal" building gtk docs?
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
X-List-Received-Date: Wed, 21 Aug 2013 10:22:05 -0000
Content-Type: multipart/alternative; boundary=20cf307c9ddc74ab6304e4728b73

--20cf307c9ddc74ab6304e4728b73
Content-Type: text/plain; charset=UTF-8

On 21 August 2013 11:16, Laszlo Papp <lpapp@kde.org> wrote:

> Having had an inconvenient debugging session this morning with the help of
> you, ndec, and so forth on IRC, I would propose to get rid of this gtk doc
> stub, at least how it is now. It is completely breaking projects causing
> regressions compared to denzil. We are pretty much blocked by it altogether
> now. Here is the other thread for details:
> https://lists.yoctoproject.org/pipermail/poky/2013-August/009184.html
>
> IMHO, there should be a way for end users to get rid of the blocker issue
> and regression. So, how about making this optional?
>

We used to patch each recipe individually and it wasn't pleasant.
 gtk-doc-stub is just the first place you're hitting problems with putting
DL_DIR inside a git repository, removing it will cause something else to
break.

Ross

--20cf307c9ddc74ab6304e4728b73
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 21 August 2013 11:16, Laszlo Papp <span dir=3D"ltr">&lt=
;<a href=3D"mailto:lpapp@kde.org" target=3D"_blank">lpapp@kde.org</a>&gt;</=
span> wrote:<br><div class=3D"gmail_extra"><div class=3D"gmail_quote"><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex">

<div dir=3D"ltr">Having had an inconvenient debugging session this morning =
with the help of you, ndec, and so forth on IRC, I would propose to get rid=
 of this gtk doc stub, at least how it is now. It is completely breaking pr=
ojects causing regressions compared to denzil. We are pretty much blocked b=
y it altogether now. Here is the other thread for details:=C2=A0<a href=3D"=
https://lists.yoctoproject.org/pipermail/poky/2013-August/009184.html" targ=
et=3D"_blank">https://lists.yoctoproject.org/pipermail/poky/2013-August/009=
184.html</a><div>


<br></div><div>IMHO, there should be a way for end users to get rid of the =
blocker issue and regression. So, how about making this optional?</div></di=
v></blockquote><div>=C2=A0</div><div>We used to patch each recipe individua=
lly and it wasn&#39;t pleasant. =C2=A0gtk-doc-stub is just the first place =
you&#39;re hitting problems with putting DL_DIR inside a git repository, re=
moving it will cause something else to break.</div>

<div><br></div><div>Ross</div></div></div></div>

--20cf307c9ddc74ab6304e4728b73--
