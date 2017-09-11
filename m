Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f53.google.com (mail-it0-f53.google.com
	[209.85.214.53])
	by mail.openembedded.org (Postfix) with ESMTP id 1999178410
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 22:11:10 +0000 (UTC)
Received: by mail-it0-f53.google.com with SMTP id c195so23278788itb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 15:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BTkO4HvWWy8yWSzs7iGYVObKrk2o8sDcTnrLn/QsGWQ=;
	b=XKV1cir3Dx3NM6aTHPBh1wO43Pcnv2IQ4FK6c3/WniYPC08EiwOch+Vq1RaT0yB7m3
	38CFIW+QG6BeSScyulPf1A4tWBSaeZKyq01l70w/Zu65EZ2WaTiFvyR0S5xUXuVxbm4J
	9wkVKMZtzYZ9MpUqAzDGbAF2C8/PlctwSIW9+p6NIpPupfGTdc2AMLG3Lz361nGRDGdP
	dXKO/1K8kk46CDBpr7f+DNWswDT+BvXn5ksRJyspgZcnQZAgvx9dm9DDrf6yo4VR0UOU
	RNNpXmQnSo9Czxr7hdo5Sj1NurMs1KcOXehb/IERdmQmnn2KhL7vJJgodCg+tNIEOnrp
	WByg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BTkO4HvWWy8yWSzs7iGYVObKrk2o8sDcTnrLn/QsGWQ=;
	b=H6W9t6Vvvxov50vRP6QC7oSx1MiEIeB2NbtIjgmy6diKkNeJunc3JSkcb4DaP4NTNw
	IjmZbCU3t9PBRCHwG3QtOzVTpFMRd1KeezBVVZ4z85wBd8vQi81WGV9AzatDxpjMwPaD
	lnJlG8G9V/JXvT03rRg7Q+wBY4PKacu5f+JIeGtICIMtpCaBvga4OV3uei+VC1AnD7q1
	RKHWmm3axMljSMJiUfosLkQeBGmppF2zbjC7ywqhsvvwkLxCwgTJzGphbS0QzWpn5fAk
	7NtT6wioW67F5PYOBy75BGIN5fkRLw3S4o1C9/drfXNmb0P4JEivmf5ybt3mWHwVtBwz
	/aIQ==
X-Gm-Message-State: AHPjjUiGy06FxvNYmBfI1uqwGNr/XYBYfwaTwtOGTB3jBlI8UoxdLPoo
	h+wH5NGa8w4pmgJ++awJhHrnTRQpK6qm1ZAoMmk2fQ==
X-Google-Smtp-Source: AOwi7QA4eXxsbqHZKxtslULy2Y7D8rFyig8kXmdlmvSCzQMcno3rMibL19dpVoQhl/TbjbKnBbJ5kFT0kwD4nUpmQ3g=
X-Received: by 10.36.181.73 with SMTP id j9mr14959626iti.6.1505167872082; Mon,
	11 Sep 2017 15:11:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.19.68 with HTTP; Mon, 11 Sep 2017 15:10:51 -0700 (PDT)
In-Reply-To: <CA+chaQcHzfovU588PVbky_AOrmXgUrgu0qe7U+Uhe8Azh_VUVw@mail.gmail.com>
References: <20170911213326.3480-1-california.l.sullivan@intel.com>
	<CAJTo0LZgBgWL0c9ZaDRFvvKxfULKeDkvGOhAiczGWMXWNrL=Yg@mail.gmail.com>
	<CAP9ODKpmxcObf-re-298t_uLu2HNCnByi+ic_b8EEJDJ-227iQ@mail.gmail.com>
	<CAJTo0Lb42b-PT3_u-1vS-apadje4+ZYpP=8jB4q9oc2jmzjgPw@mail.gmail.com>
	<CAP9ODKqN7nj2esxkVR08jYSaRj-SrybTqbOYManDvC566no_qQ@mail.gmail.com>
	<CAJTo0LbQKuJhVBVTCh1ay2i95egZxbvfhLC=Cgh__OQRS01i+w@mail.gmail.com>
	<CA+chaQcHzfovU588PVbky_AOrmXgUrgu0qe7U+Uhe8Azh_VUVw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 11 Sep 2017 23:10:51 +0100
Message-ID: <CAJTo0LZ_FCc-VOn9f+Z=cMPioWav+TmC4z=AXDuDe_+NHW2ywg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Otavio Salvador <otavio@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] initramfs-framework: bump PR and fix install-efi and setup-live modules
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
X-List-Received-Date: Mon, 11 Sep 2017 22:11:11 -0000
Content-Type: multipart/alternative; boundary="f403045d9e42580b010558f1346d"

--f403045d9e42580b010558f1346d
Content-Type: text/plain; charset="UTF-8"

On 11 September 2017 at 23:09, Martin Jansa <martin.jansa@gmail.com> wrote:

> > Changing arch on a package resets the incrementing PR?  Isn't that a
> bug?
>
> Arch is part of the key in PR server database.
>
> It's not a bug, because when you have MACHINE_ARCH recipe then it's normal
> that different MACHINEs (with different bbappends in BSP layers) have
> different EXTENDPRAUTO, without the arch in the key, the EXTENDPRAUTO would
> be incremented in PR server database every time you change MACHINE
> variable. It's not ideal but better than the alternative.
>

Hm, true.   Edge case noted. :)

Ross

--f403045d9e42580b010558f1346d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 11 September 2017 at 23:09, Martin Jansa <span dir=3D"l=
tr">&lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.=
jansa@gmail.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div cl=
ass=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><span c=
lass=3D"">&gt;=C2=A0<span style=3D"font-size:12.8px">Changing arch on a pac=
kage resets the incrementing PR?=C2=A0 Isn&#39;t that a bug?</span><div><sp=
an style=3D"font-size:12.8px"><br></span></div></span><div><span style=3D"f=
ont-size:12.8px">Arch is part of the key in PR server database.</span></div=
><div><span style=3D"font-size:12.8px"><br></span></div><div><span style=3D=
"font-size:12.8px">It&#39;s not a bug, because when you have MACHINE_ARCH r=
ecipe then it&#39;s normal that different MACHINEs (with different bbappend=
s in BSP layers) have different EXTENDPRAUTO, without the arch in the key, =
the EXTENDPRAUTO would be incremented in PR server database every time you =
change MACHINE variable. It&#39;s not ideal but better than the alternative=
.</span></div></div></blockquote><div>=C2=A0</div><div>Hm, true. =C2=A0 Edg=
e case noted. :)</div><div><br></div><div>Ross</div></div></div></div>

--f403045d9e42580b010558f1346d--
