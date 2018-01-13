Return-Path: <kergoth@gmail.com>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id CF06E606A8
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Jan 2018 03:46:05 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id s139so4759395vkb.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jan 2018 19:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=bHgVBgWxi3jrZ7OVtrD32pXdKMfaoOYrukQeosPs3Fo=;
	b=ugh1TPrsU1C7yMMxvWULFbQtUUXpZaQLneo26OVAdZ3CY0HqoST+CulF93HF0WT1eL
	RVxjfwqv9s/QcyTJ3J/5PUCKqXKlpJlLBo17VvVcKW1QHCqWzxrNAeaHh/uI7SqPdSsz
	RF+9sxjJufmGYhAgyhycq6yv6rTMMXSlmhU50dxvnvb5BLc7w5AgheQbSeq95K44zC1s
	dZqV2rgeCk5aKBrwYBti/lsLtWv4/rXYltAnWt88rGI2G6HI6s99UVF/oZYDmc1G4XCk
	UdMfoSyJfbHfAZ2JgKfRWFeLRjk3cN4mau9NTJ8AgSNIAkBheeWyUnJMnhbqq0KMgiE5
	ZfQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=bHgVBgWxi3jrZ7OVtrD32pXdKMfaoOYrukQeosPs3Fo=;
	b=rUrMyvTWjJ46PZSN1RCm6lC6PPfTlDENNfurF4sc+oyYp/Q/TRXD1mDRKQFHYYAzCZ
	aDtFwymrWgUYNF1h0dVGo5qTqmSGz80GquDHEyrkbyQ2zAZV+iDqt52jLDdi4+NgAkze
	bdcfWXTIzM95w5N/dJ5tJinSJYjh45rCpYqZd6K0zRPL6D9EoMF2g4tvS4K4pkeCP1Ia
	QBQyAxey/FxgLkA1CaTU4y+QVULXdpA66Y8Y7UwoW1CSDf4q+j5UErLQ6w05NNp44QhG
	bVAcLHZUdbBQ5a5xP2l+sKIrFl/cUgEXfs7/q+Evo9qPfqz35YD1X+Rn/DVnanf2HDKh
	ZKUQ==
X-Gm-Message-State: AKwxytdpsDKjY3nFhQtiyz8jV/jJDVhEYs97xdrsHDLSWqYT0nDMX67Z
	+aJIF1Z10cZinsxd74o0AhIqf4tBLHoTZ/z0k/A=
X-Google-Smtp-Source: ACJfBovrJBXxXg8ZB4rDU9cgJ+AweB59wFxTDWunE/hxiEnfYW94tIF9FPeCf4izZkNM0bNSDyPaBN1KcgJsZikRAqY=
X-Received: by 10.31.153.76 with SMTP id b73mr24984995vke.53.1515815166653;
	Fri, 12 Jan 2018 19:46:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.55.142 with HTTP; Fri, 12 Jan 2018 19:45:46 -0800 (PST)
In-Reply-To: <20180112130644.21313-1-alex.stewart@ni.com>
References: <20180112130644.21313-1-alex.stewart@ni.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Fri, 12 Jan 2018 20:45:46 -0700
Message-ID: <CABcZANms2fcX1rmeY_vGsCmMcxhicCKEtDs0mOaX8uCt=8fgLA@mail.gmail.com>
To: Alex Stewart <alex.stewart@ni.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] recipes-core: move hwclock.sh to util-linux
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
X-List-Received-Date: Sat, 13 Jan 2018 03:46:06 -0000
Content-Type: multipart/alternative; boundary="001a1140f6168dba2b0562a03807"

--001a1140f6168dba2b0562a03807
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 12, 2018 at 6:06 AM, Alex Stewart <alex.stewart@ni.com> wrote:

> * Move the hwclock.sh initscript from the busybox recipe to util-linux.
>   This script is generally useful for distros that get their hwclock
>   implementation from sources other than busybox and we follow debian's
>   example by providing it in util-linux.
>
> :busybox/*
> * Remove the busybox-hwclock package, as it no longer has a purpose.
> * If busybox is configured to include hwclock, the busybox package will
>   RDEPEND on util-linux-hwclock-init.
>
> :util-linux/*
> * Provide the hwclock.sh script in util-linux-hwclock-init, which can be
>   pulled by any packages that depend on its functionality.
> * util-linux-hwclock RDEPENDS on util-linux-hwclock-init for its
>   initscript.
>
> Signed-off-by: Alex Stewart <alex.stewart@ni.com>
> Acked-by: Haris Okanovic <haris.okanovic@ni.com>
> Acked-by: Adrian Ratiu <adrian.ratiu@ni.com>
> Acked-by: Ken Sharp <ken.sharp@ni.com>
> Natinst-ReviewBoard-ID: 214983, 215755
>

Just a note that this will slow down the build for targets that wouldn=E2=
=80=99t
otherwise build the util-linux recipe.
--=20
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--001a1140f6168dba2b0562a03807
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On Fri, Jan 12, 2018 at 6:06 AM, Alex Stewart <span dir=3D=
"ltr">&lt;<a href=3D"mailto:alex.stewart@ni.com" target=3D"_blank">alex.ste=
wart@ni.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">* Move the hwclock.sh inits=
cript from the busybox recipe to util-linux.<br>
=C2=A0 This script is generally useful for distros that get their hwclock<b=
r>
=C2=A0 implementation from sources other than busybox and we follow debian&=
#39;s<br>
=C2=A0 example by providing it in util-linux.<br>
<br>
:busybox/*<br>
* Remove the busybox-hwclock package, as it no longer has a purpose.<br>
* If busybox is configured to include hwclock, the busybox package will<br>
=C2=A0 RDEPEND on util-linux-hwclock-init.<br>
<br>
:util-linux/*<br>
* Provide the hwclock.sh script in util-linux-hwclock-init, which can be<br=
>
=C2=A0 pulled by any packages that depend on its functionality.<br>
* util-linux-hwclock RDEPENDS on util-linux-hwclock-init for its<br>
=C2=A0 initscript.<br>
<br>
Signed-off-by: Alex Stewart &lt;<a href=3D"mailto:alex.stewart@ni.com">alex=
.stewart@ni.com</a>&gt;<br>
Acked-by: Haris Okanovic &lt;<a href=3D"mailto:haris.okanovic@ni.com">haris=
.okanovic@ni.com</a>&gt;<br>
Acked-by: Adrian Ratiu &lt;<a href=3D"mailto:adrian.ratiu@ni.com">adrian.ra=
tiu@ni.com</a>&gt;<br>
Acked-by: Ken Sharp &lt;<a href=3D"mailto:ken.sharp@ni.com">ken.sharp@ni.co=
m</a>&gt;<br>
Natinst-ReviewBoard-ID: 214983, 215755<br></blockquote><div><br></div><div>=
Just a note that this will slow down the build for targets that wouldn=E2=
=80=99t otherwise build the util-linux recipe.</div></div>-- <br><div class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><d=
iv><div dir=3D"ltr">Christopher Larson<br>kergoth at gmail dot com<br>Found=
er - BitBake, OpenEmbedded, OpenZaurus<br>Senior Software Engineer, Mentor =
Graphics</div></div></div></div>
</div></div>

--001a1140f6168dba2b0562a03807--
