Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id 457FC6BC7D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Jan 2019 21:35:51 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id e5so34938691qtr.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Jan 2019 13:35:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=7jeNJQvrA996bVsdW+8fQQBaTOjh3opRlsh2FN38/0U=;
	b=nsFYoP4+7tsyeROmmdAzW+ZN9WqnBgq+fyZBMo36fEJEeAwc8DzImECbn5v+JRgVDf
	Z5KBD2DpoEZ9pr96ELJorNM58ytdlWcZCunZoXE3cArIaWp/9Q416CVeeqJ6s8uNnhIX
	QUIQYHfX9h6wi7yiYFEqiwJQPoK695USRtVJ1STrIHkKxynjHRrjs8s2wKASieBGjSbr
	YnsejKlPet5+7mwZ5zKDsCvUqq45GYFX4ZeqrWNT0YOO8YYm4SNUyThBvl73tEfKf+Zx
	ZxU9nbLJgLciNGKG7mflmeSrqqZA4Vahg6I1Q09tJZOy4jRJyvVYwi4o6sCILuM19mJ1
	zt6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=7jeNJQvrA996bVsdW+8fQQBaTOjh3opRlsh2FN38/0U=;
	b=Jz5z2g7eu6I330EB6nVQvi/tuk7uUJ5tKu11DOpIRuA+BWLWmjTwdupKau4rIKYSLE
	FtCtQ1RCHoveS+byaCzVhFpwK8lOHkatYVltFgdfBWFulq+8kyimLgRlklB/SizBBraI
	Gi1mzpstWlPZc3TqH4BpVAyrvFDqSslkqHwRYS9jcGndDQDLc3/LSYnyOOcr7C8Lag/w
	oSqd4Cg9UDGZTX5j8yqEfSfqFvEMfRnVrZDru/EOIAokpoTaLsSUIIvC/IodaNe+9pH0
	qziA1xdunhsWt395/cCMDr6Qte7618UovhH45khvCLuI4C2gGuzjUsXS91y1LIPNcAAF
	gvvg==
X-Gm-Message-State: AJcUukcZWkPX4fecjZij7mfiMhT4K+S9Vd2k3DXignPC8lkT1KJmYuSc
	5MquMnvNPumipLql4/OprFu1YOa5t6xHG6LPPow=
X-Google-Smtp-Source: ALg8bN764UAPZcfqqLajfUNLdI1mg9fMcYCuWOfPl0ZVHQYenkXKDMn/nChQ28LLL5+5q9IAHFWmpQjPeVAKJ8geaDg=
X-Received: by 2002:a0c:98a1:: with SMTP id f30mr43042629qvd.224.1546464951976;
	Wed, 02 Jan 2019 13:35:51 -0800 (PST)
MIME-Version: 1.0
References: <20190102192111.33587-1-raj.khem@gmail.com>
	<CAPbeDCm6H0C=nKk=z_uB+SAP_3fJya5UDJKKGSQq9oA6wVdJAA@mail.gmail.com>
	<CAMKF1so9UFQCtP_F8HZdopREaR1rp8poUyeCpr7yZj43xESnxQ@mail.gmail.com>
	<a4363be9273e627354f245ec4a2490a216e74c86.camel@linuxfoundation.org>
In-Reply-To: <a4363be9273e627354f245ec4a2490a216e74c86.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 2 Jan 2019 13:35:26 -0800
Message-ID: <CAMKF1spXqA=jN-Ws0Gfzedask=8bABJiFZwh=Dz-KsLbE10zfw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] gdb-cross-canadian: Add bison-native for gdb-cross-canadian
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
X-List-Received-Date: Wed, 02 Jan 2019 21:35:51 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 2, 2019 at 1:31 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2019-01-02 at 11:42 -0800, Khem Raj wrote:
> > On Wed, Jan 2, 2019 at 11:32 AM Jacob Kroon <jacob.kroon@gmail.com>
> > wrote:
> > > On Wed, Jan 2, 2019 at 8:21 PM Khem Raj <raj.khem@gmail.com> wrote:
> > > > From: pino-kim <sungwon.pino@gmail.com>
> > > >
> > > > This fixes RISC-V gdb-cross-canadian cross compile configure
> > > > failure on missing bison.
> > > >
> > > > Signed-off-by: pino-kim <sungwon.pino@gmail.com>
> > > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > > ---
> > > >  meta/recipes-devtools/gdb/gdb-cross-canadian.inc | 3 ++-
> > > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
> > > > b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
> > > > index 475e4f08ef..e54766bbb2 100644
> > > > --- a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
> > > > +++ b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
> > > > @@ -6,7 +6,8 @@ PN = "gdb-cross-canadian-
> > > > ${TRANSLATED_TARGET_ARCH}"
> > > >  BPN = "gdb"
> > > >
> > > >  DEPENDS = "nativesdk-ncurses nativesdk-expat nativesdk-gettext \
> > > > -           virtual/${HOST_PREFIX}gcc-crosssdk
> > > > virtual/${HOST_PREFIX}binutils-crosssdk virtual/nativesdk-libc"
> > > > +           virtual/${HOST_PREFIX}gcc-crosssdk
> > > > virtual/${HOST_PREFIX}binutils-crosssdk \
> > > > +           virtual/nativesdk-libc bison-native"
> > > >
> > >
> > > Would it make sense to restrict this to DEPENDS_append_riscv32/64 ?
> >
> > Its not particular to riscv, it just happens to unearth the problem
> > for us since its building gdb from upstream
> > master, we are going to land into this problem eventually when we
> > upgrade.
>
> Is this not a tarball verses source control issue (the git version
> needs the dependency, the tarball doesn't)?

yes that has triggered it but I have also seen it on certain bare
minimum build host OSes in past
even with tarballs.

