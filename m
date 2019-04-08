Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id 0E8E07D527
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Apr 2019 16:37:20 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id k130so8385293qke.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Apr 2019 09:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=6ZDn/18j0Cx8lLUzNT3YqDSmB2KL9bNNIk5KtD46cYw=;
	b=SHmuffWWf0oPNyOGPhpwf6UFzzdwCQXijRFWh1rIY/WE4Urq0TExYKTkq7PtgF0SPm
	08mHvlUlCIGQaWVs4bhSqJH9yTImhx5wOTck62HVV6n94LhePJuDb7FQXWZGp3+Gvnv/
	lrWVuNm9NohFhnUFGQZ2RGRVFCRncNgZ/A9lCrUi024vMDOPp64qiZPdu0iL61izn1Ck
	qirPfwZrTs7kojIwvtVCO4dqzEct/WCH9M3d6H/lpkFMS/dIRBZNST4853RvxpBihW+z
	BCWYn7xQQU90f8ivgOgzimNxsRtJ3jra80ISgVjM+n9AHmORyVirLtC/sihKrA4ePK2n
	PfSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=6ZDn/18j0Cx8lLUzNT3YqDSmB2KL9bNNIk5KtD46cYw=;
	b=Ow23AN3sX46VcAy3tVFASN5ijk9G2Wc9ZSe952G9j3ySpaLtZptYESZdb9/Jm5QfAr
	KaNMBI8WWzl2Hbmqxd0t69eFSAvZ7TCX8E+dL3+KXe5q91DO7TXlU4aCAXopo+Cm5W/7
	GCXDA8qUfe79j33lIskwiX7wkJOEwUw35B6PumC9/w1xcjhOUedexgYvLAlE7W5a1ZXj
	Hy/Os0tFoYK0H0RCkOOdZfDNFIJQj7uI97F0HzxeQt81QIEetpGWgnt5zteRtuLUw6sR
	wUotMhvVkIdsmOiiMmmr2d6s5MljzJS7jseBhe9PH8btdvaGIJ3TqnKISCaWoi9rCocd
	pzQA==
X-Gm-Message-State: APjAAAXqw9RFpt7UJRCvJnmAvET7DYFhRVLHnETQwrM+qlHp2yJJeMAv
	xTNn9e5DOkTGI9Fi3wCGIZxJb1EAOgCJxyE03xE=
X-Google-Smtp-Source: APXvYqznOzHZPWXdixxAW4G5Nf+621n/f/PyUO+ou6yKPpOGPciaVht3tyHaMSh10S4mE67DxvT6wBz/nA0l11QPKAI=
X-Received: by 2002:a37:9d84:: with SMTP id g126mr22395013qke.22.1554741441636;
	Mon, 08 Apr 2019 09:37:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190404075205.108547-1-kai.kang@windriver.com>
	<d7797aa9-4b8d-9bb9-536e-f4bfa5ab906e@windriver.com>
In-Reply-To: <d7797aa9-4b8d-9bb9-536e-f4bfa5ab906e@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 8 Apr 2019 09:36:55 -0700
Message-ID: <CAMKF1sqeKbYiMWLj=+KBh8Sx-8hR8uQbMDT9qTr7WgV=HdsVkg@mail.gmail.com>
To: Kang Kai <Kai.Kang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] virglrenderer: remove link option -Bsymbolic
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
X-List-Received-Date: Mon, 08 Apr 2019 16:37:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 7, 2019 at 6:59 PM Kang Kai <Kai.Kang@windriver.com> wrote:
>
> On 2019/4/4 =E4=B8=8B=E5=8D=883:52, kai.kang@windriver.com wrote:
> > From: Kai Kang <kai.kang@windriver.com>
> >
> > When gcc compile options '-O2 -fvisibility=3Ddefault' are applied, it
> > fails to compile virglrenderer for x86:
> >
> > | ld: gallium/auxiliary/.libs/libgallium.a(u_cpu_detect.o): relocation
> >    R_386_GOTOFF against undefined symbol `util_cpu_caps' can not be use=
d
> >    when making a shared object
> > | ld: final link failed: bad value
> > | collect2: error: ld returned 1 exit status
> >
> > Remove link option '-Bsymbolic' to fix the failure.
>
>
> Any comments on this patch? Thank.
>
> Kai
>
>
> >
> > Signed-off-by: Kai Kang <kai.kang@windriver.com>
> > ---
> >   .../0001-Remove-link-option-Bsymbolic.patch   | 34 ++++++++++++++++++=
+
> >   .../virglrenderer/virglrenderer_0.7.0.bb      |  1 +
> >   2 files changed, 35 insertions(+)
> >   create mode 100644 meta/recipes-graphics/virglrenderer/virglrenderer/=
0001-Remove-link-option-Bsymbolic.patch
> >
> > diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer/0001-Rem=
ove-link-option-Bsymbolic.patch b/meta/recipes-graphics/virglrenderer/virgl=
renderer/0001-Remove-link-option-Bsymbolic.patch
> > new file mode 100644
> > index 0000000000..faefa16aae
> > --- /dev/null
> > +++ b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-Remove-lin=
k-option-Bsymbolic.patch
> > @@ -0,0 +1,34 @@
> > +When gcc compile options '-O2 -fvisibility=3Ddefault' are applied, it =
fails to
> > +compile virglrenderer for x86:
> > +
> > +| ld: gallium/auxiliary/.libs/libgallium.a(u_cpu_detect.o): relocation
> > +  R_386_GOTOFF against undefined symbol `util_cpu_caps' can not be use=
d
> > +  when making a shared object
> > +| ld: final link failed: bad value
> > +| collect2: error: ld returned 1 exit status
> > +
> > +Remove link option '-Bsymbolic' to fix the failure.
> > +

In spite of removing the option can we try replacing it with
-Bsymbolic-functions

> > +Upstream-Status: Submitted [https://gitlab.freedesktop.org/virgl/virgl=
renderer/merge_requests/213]
> > +
> > +Signed-off-by: Kai Kang <kai.kang@windriver.com>
> > +---
> > + src/Makefile.am | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/src/Makefile.am b/src/Makefile.am
> > +index 9b668c8..7a421b8 100644
> > +--- a/src/Makefile.am
> > ++++ b/src/Makefile.am
> > +@@ -48,7 +49,7 @@ endif
> > + lib_LTLIBRARIES =3D libvirglrenderer.la
> > + noinst_LTLIBRARIES =3D libvrend.la
> > +
> > +-GM_LDFLAGS =3D -Wl,-Bsymbolic -version-number 0:2 -no-undefined
> > ++GM_LDFLAGS =3D -version-number 0:2 -no-undefined
> > +
> > + libvirglrenderer_la_SOURCES =3D virglrenderer.c
> > + libvirglrenderer_ladir =3D $(libdir)
> > +--
> > +2.20.1
> > +
> > diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer_0.7.0.bb=
 b/meta/recipes-graphics/virglrenderer/virglrenderer_0.7.0.bb
> > index 225a0b8b0c..afc709bc48 100644
> > --- a/meta/recipes-graphics/virglrenderer/virglrenderer_0.7.0.bb
> > +++ b/meta/recipes-graphics/virglrenderer/virglrenderer_0.7.0.bb
> > @@ -9,6 +9,7 @@ SRCREV =3D "402c228861c9893f64cffbbcb4cb23044b8c721c"
> >   SRC_URI =3D "git://anongit.freedesktop.org/virglrenderer \
> >              file://0001-vtest-add-missing-includes.patch \
> >              file://0001-Makefile.am-explicitly-link-with-libdrm.patch =
\
> > +           file://0001-Remove-link-option-Bsymbolic.patch \
> >              "
> >
> >   S =3D "${WORKDIR}/git"
>
>
> --
> Kai Kang
>

