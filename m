Return-Path: <armccurdy@gmail.com>
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com
	[209.85.221.179])
	by mail.openembedded.org (Postfix) with ESMTP id D89BE610BA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 22:11:44 +0000 (UTC)
Received: by mail-vk1-f179.google.com with SMTP id p191so17378vkf.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 14:11:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=qCaNWPpGAGL1CuZk7gXuXeisntFUwZ6Bxh8Hgs/k3OI=;
	b=lncy7zbg9415zaoDB7NASGWbnwcPhonGaX052lhxj0cgIQgLgSDd5LJjQ36S0SfDlf
	eUVX+Y2S7tpXQOJLYWCyoTzLukyFprXdqpBB1XBzEmGHXhcSVQhvmyjRNR19VHUlR+db
	A92zxnGcNQaEuUs69ZNhozdzBsyghXMseugUUddCfonnvlTcG5PhsEft99Agc5MrmZ8V
	yFXgeB90/3mtCXJE6cX8RUfmKC2QOhSAI/qFIO5fzrNdHck2VNFVE5yQjQj2U8SrMMPO
	2VrLlrXxEyRpFGNrBOZUVLDV7tTGLNs5FzN1ctdOn9daJhkJkg71oaqjghe5/1QVDtDR
	g+xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=qCaNWPpGAGL1CuZk7gXuXeisntFUwZ6Bxh8Hgs/k3OI=;
	b=U1+uDlSutDYixCNMeN26BOdzg0MH3JdcdShV2GIdAuHuJHamPXsouYEYH53aj2XzxZ
	F3yJqTIrsVl2zeYGtUbh10uHoKO9taEsy8wljhdpsrsXtZENskQPwNnT/5HkKpsJZj/t
	hf2zLRoLggo6sPvozJu1g9GXdXreVV+0E7Fj5ZBOiJKeNY80Bj93+9D7PlIwJzePMqAY
	R838FXyxGcLRVQIjClnwhyjgM06CjyuzI/NDEYCrHCMyXvWhtEo/2T1nVqE7PBLAJQtu
	LN8GG5mGABoogEshY3/K9y/eexd5tTlC+h3p3cACZ44xAKJhv/nBQTLJ+DxViN3IBNmZ
	VsNQ==
X-Gm-Message-State: APjAAAX9Q67iuTsjpEw1kv7FUNFCmKl+4mm1Q8IDj3rjymI3inirU8Pt
	Jz1zyErA+RqCwGp1Y+LYEFx5chN4xoLUpmmIvvA=
X-Google-Smtp-Source: APXvYqwwtiiVaj0MUsgbQ75dY2zWZW9BrT6/MnCwS5pdQbc3vf7ItvmEqIGngXuvr0NNUFswXRUiqUV37VJJXMWQojg=
X-Received: by 2002:a1f:94c1:: with SMTP id w184mr15904600vkd.43.1582236705816;
	Thu, 20 Feb 2020 14:11:45 -0800 (PST)
MIME-Version: 1.0
References: <20200220002849.9126-1-schnitzeltony@gmail.com>
	<CANNYZj9pFMxP7nYkUOyQ4wcejkr4j+EBqa3OdJZXgEKB7ZtX=Q@mail.gmail.com>
	<CALbNGRTruaPGSJTNd816++UuYJTyL1=r2KHeKquENLTa=08UWA@mail.gmail.com>
	<CALbNGRSFZcsh0ZKBgyRX+eg3ThZbRf1ryiVbHU5Y0vZgd0BkTg@mail.gmail.com>
	<CAMKF1srmsrx8Nq4gSj5ZDK0o1d4t8AtDWnjtDgzT1Py8i=Njtg@mail.gmail.com>
	<CAJ86T=URADiQr=_iOdw990WWCHhkDL0sAS-oD1JEtyV9UOHGXg@mail.gmail.com>
	<7dd9779b1be7e10a54b3b1bff4788cae931cb02a.camel@gmail.com>
In-Reply-To: <7dd9779b1be7e10a54b3b1bff4788cae931cb02a.camel@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 20 Feb 2020 14:11:34 -0800
Message-ID: <CAJ86T=UnK1KcPrZ+CYhJapB-Akpiz29wjvLgs0pu5NSQgnkQsA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][master-next] webkitgtk: add PACKAGECONFIG gobject-introspection
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
X-List-Received-Date: Thu, 20 Feb 2020 22:11:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 20, 2020 at 2:06 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Thu, 2020-02-20 at 14:00 -0800, Andre McCurdy wrote:
> > On Thu, Feb 20, 2020 at 12:33 PM Khem Raj <raj.khem@gmail.com> wrote:
> > > On Thu, Feb 20, 2020 at 12:24 PM Andreas M=C3=BCller <
> > > schnitzeltony@gmail.com> wrote:
> > > > On Thu, Feb 20, 2020 at 1:45 PM Andreas M=C3=BCller <
> > > > schnitzeltony@gmail.com> wrote:
> > > > > On Thu, Feb 20, 2020 at 11:07 AM Alexander Kanavin
> > > > > <alex.kanavin@gmail.com> wrote:
> > > > > > You need to at the same time drop the introspection
> > > > > > enablement logic from EXTRA_OECMAKE I think?
> > > > > > This line:
> > > > > > http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipe=
s-sato/webkit/webkitgtk_2.26.4.bb?h=3Dmaster-next#n70
> > > > > >
> > > > > > And for consistency, it would be good to do the same for gtk-
> > > > > > doc.
> > > > >
> > > > > This is odd: I fell over this because there was no gir created.
> > > > > Did
> > > > > not notice it was few lines below. Need to check that - maybe I
> > > > > am a
> > > > > bit off-sync to master or something is wrong elsewhere.
> > > > >
> > > > > Will sync to master and send V2 then.
> > > > >
> > > > Finally had time to look into again. In the recipe there is
> > > >
> > > > GI_DATA_ENABLED_armv7a =3D "False"
> > > > GI_DATA_ENABLED_armv7ve =3D "False"
> > > >
> > > > =3D> My patch is wrong it overrides above accidentally - thanks
> > > > Alex!
> > > >
> > > > Since webkit builds gir fine (my machine is armv7ve) that does
> > > > not
> > > > seem necessary any more. I would like to send out a patch
> > > > removing at
> > > > least armv7ve - shall I take the risk to remove armv7a - maybe as
> > > > two
> > > > patches?
> >
> > These two should be equivalent for all practical purposes and so
> > should be updated together. ie remove them both, one patch.
>
> it will run user mode qemu underneath, which is not same for both, are
> you sure libraries and apps it will run are identical ?

Binaries built for armv7ve will contain HW integer division
instructions. Binaries build for armv7a will not.

That should have no impact on gobject-introspection.

There's a much bigger risk in letting these two build variants drift
apart than there is from updating them together but only testing one.

