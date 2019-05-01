Return-Path: <armccurdy@gmail.com>
Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com
	[209.85.217.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5CFC97D70C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 May 2019 19:12:19 +0000 (UTC)
Received: by mail-vs1-f66.google.com with SMTP id g127so10188vsd.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 May 2019 12:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=U+uBbES0Qhb55nS6Lvd/Uzcf1FakpDQ9fXC6VbdYNPE=;
	b=OlbQt8iUpYXGP4ZhKuAAJcKpeX13T0XYjaKwH69hTp6gNnu7uGpPg8Wkt6XtEecpE8
	LnBr0ATNOCiNBVzvzoojP2CAqHtwgOZChrdeumkxTcet9OW1gl5DctkvZEhJPjA2q3I7
	bdE9i0NjUeatfSqmIzggFvLuFuT165ZUV5zjhz6uckTOibcWL/CtFTnkW4OK+luXvqVl
	zjEHO4CPaSNl+WLvgZsT4v9CayFMRm6+7wQIffRW6k/MpOrmL+lwXHFDr5sNx9nJRCXD
	s4+tA/wbSZNBXekScgCkkgacBpybb4Z8+r6xAh18q3QwlphmpyR63ej69U0ke0gpaYjz
	5OLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=U+uBbES0Qhb55nS6Lvd/Uzcf1FakpDQ9fXC6VbdYNPE=;
	b=l7VV2NRv25kNYXB+oMQPzmJRr919viRdYZ/6pE4OnErGg7FuXS0DM85GmR0MFizU5J
	Pu3Uk44KoTaWEkyovl8ex2dHzzNT1wms6NxsaounIyQHYIgnwSG9gx3SJebordyZU0Q/
	QUhV2V04gaJ09R/XLkoYSYwebfDc0DytKlffWWfSLs+OfVfT3sbkBNhlpu/mYi6U2bL7
	OBrhWUzL6sL5BUAYqSAp8/ULs3y+tbNiS93owahIe+iU/s5gR3+2iYCgLIKVwlyVWOp8
	bL6gmg+QVkrU+KC8S8+7dLFnweComHG/iCOqbPttNyoaGEEUYD5wPB9zc2HtOodzKX0j
	Sx9g==
X-Gm-Message-State: APjAAAW9kWevNMVPK75k8R/zBHravt+5vFa99FJyPUJ/Nrd/nH/9NCaz
	DBGFYCFIBVkbaWkodEmKclyoh0R3NM5zoaoSm4E=
X-Google-Smtp-Source: APXvYqzLNRpL2Ryhwy3lsB1GXuDJ+NbnRxrsjTz/oZOP8v7Oc6vEIYbczF0nl2iwPwMYD+BgEGpB2TFSGhHFdANDmfw=
X-Received: by 2002:a67:8988:: with SMTP id l130mr1380834vsd.137.1556737939820;
	Wed, 01 May 2019 12:12:19 -0700 (PDT)
MIME-Version: 1.0
References: <eb6e23843ff14f079f0218e579894f31@mtkmbs06n1.mediatek.inc>
	<CAJTo0LbPQo6RDo02=rS+pJLJ5y22VHwQbgjJ6zLa35m59KDVPg@mail.gmail.com>
In-Reply-To: <CAJTo0LbPQo6RDo02=rS+pJLJ5y22VHwQbgjJ6zLa35m59KDVPg@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 1 May 2019 12:12:08 -0700
Message-ID: <CAJ86T=UM+kPXNm_zRyfHsBbRWhbdKuCcQk9GAZp4JuhcBoLOpw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: =?UTF-8?B?U3RldmVuIEh1bmcgKOa0quS6jueOiSk=?= <Steven.Hung@mediatek.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] musl: fix build failure when ld-is-gold is in DISTRO_FEATURES
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
X-List-Received-Date: Wed, 01 May 2019 19:12:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 1, 2019 at 8:28 AM Burton, Ross <ross.burton@intel.com> wrote:
>
> Can you send this using git-send-email so that your mailer doesn't
> corrupt the patch?

Even better would be to submit upstream to musl. Give or take some
formatting tweaks (e.g. perhaps the .s file should be renamed to .S if
it's going to rely on the C preprocessor?) it looks like this change
should be acceptable upstream. OE would get the fix automatically
during a version update without the effort of carrying a patch.

> On Mon, 29 Apr 2019 at 09:36, Steven Hung (=E6=B4=AA=E4=BA=8E=E7=8E=89)
> <Steven.Hung@mediatek.com> wrote:
> >
> > based on the solution: http://ffmpeg.org/pipermail/ffmpeg-devel/2018-Ap=
ril/228246.html
> >
> > Signed-off-by: Steven Hung (=E6=B4=AA=E4=BA=8E=E7=8E=89) <Steven.Hung@m=
ediatek.com>
> > ---
> >  ...branch-to-PLT-in-THUMB-2-not-support.patch | 34 +++++++++++++++++++
> >  meta/recipes-core/musl/musl_git.bb            |  1 +
> >  2 files changed, 35 insertions(+)
> >  create mode 100644 meta/recipes-core/musl/musl/0003-fix-conditional-br=
anch-to-PLT-in-THUMB-2-not-support.patch
> >
> > diff --git a/meta/recipes-core/musl/musl/0003-fix-conditional-branch-to=
-PLT-in-THUMB-2-not-support.patch b/meta/recipes-core/musl/musl/0003-fix-co=
nditional-branch-to-PLT-in-THUMB-2-not-support.patch
> > new file mode 100644
> > index 0000000000..e1aa126b85
> > --- /dev/null
> > +++ b/meta/recipes-core/musl/musl/0003-fix-conditional-branch-to-PLT-in=
-THUMB-2-not-support.patch
> > @@ -0,0 +1,34 @@
> > +From ee3d6b0f35ec4e71cbc2ae4d1a7561f9cb27d51f Mon Sep 17 00:00:00 2001
> > +From: =3D?UTF-8?q?Steven=3D20Hung=3D20=3D28=3DE6=3DB4=3DAA=3DE4=3DBA=
=3D8E=3DE7=3D8E=3D89=3D29?=3D
> > + <Steven.Hung@mediatek.com>
> > +Date: Mon, 29 Apr 2019 16:25:17 +0800
> > +Subject: [PATCH] fix conditional branch to PLT in THUMB-2 not supporte=
d yet.
> > +MIME-Version: 1.0
> > +Content-Type: text/plain; charset=3DUTF-8
> > +Content-Transfer-Encoding: 8bit
> > +
> > +based on the solution: http://ffmpeg.org/pipermail/ffmpeg-devel/2018-A=
pril/228246.html
> > +
> > +Upstream-Status: Pending
> > +Signed-off-by: Steven Hung (=E6=B4=AA=E4=BA=8E=E7=8E=89) <Steven.Hung@=
mediatek.com>
> > +---
> > + src/signal/arm/sigsetjmp.s | 3 +++
> > + 1 file changed, 3 insertions(+)
> > +
> > +diff --git a/src/signal/arm/sigsetjmp.s b/src/signal/arm/sigsetjmp.s
> > +index 318addba..1ac79293 100644
> > +--- a/src/signal/arm/sigsetjmp.s
> > ++++ b/src/signal/arm/sigsetjmp.s
> > +@@ -6,6 +6,9 @@
> > + sigsetjmp:
> > + __sigsetjmp:
> > +       tst r1,r1
> > ++#ifdef __thumb2__
> > ++      it eq
> > ++#endif
> > +       beq setjmp
> > +
> > +       str lr,[r0,#256]
> > +--
> > +2.18.0
> > +
> > diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/mus=
l/musl_git.bb
> > index 1e324804e1..779e1dc751 100644
> > --- a/meta/recipes-core/musl/musl_git.bb
> > +++ b/meta/recipes-core/musl/musl_git.bb
> > @@ -15,6 +15,7 @@ PV =3D "${BASEVER}+git${SRCPV}"
> >  SRC_URI =3D "git://git.musl-libc.org/musl \
> >             file://0001-Make-dynamic-linker-a-relative-symlink-to-libc.=
patch \
> >             file://0002-ldso-Use-syslibdir-and-libdir-as-default-pathes=
-to-l.patch \
> > +           file://0003-fix-conditional-branch-to-PLT-in-THUMB-2-not-su=
pport.patch \
> >            "
> >
> >  S =3D "${WORKDIR}/git"
> > --
> > 2.18.0
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

