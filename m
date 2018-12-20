Return-Path: <matt@madison.systems>
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
	[209.85.208.177])
	by mail.openembedded.org (Postfix) with ESMTP id EC0F36C0E1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2018 12:53:24 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id c19-v6so1452482lja.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2018 04:53:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=pcGh3eLfAmoq4fJ47RP5bhph6AzTDYIu5qJ+2WBnG1A=;
	b=naeXLm0DY3Qwenr+k8alCIE8U4KUXORkkOO8mT4I62xWsJErE/y6HZ4UUlxoF+5u0L
	vjjx82luCJ41pB3qQXIWfG5UzoJ5gp51ZTNA0tDOva/ZCEEFD7LhMcdONqP9077JVomc
	1xroWh/itWt1C+qjl+ETJWY2jjLA2mqwaroxDs/hAS9GOJCoGXYQp9Zr1G02ojBq4ALN
	G0/vE1kOgZkwuRt11/gJ8+rYv73swZJC5eTUMZpQeGNzhbcsDMPHnDOQ0MnVgLXsxBwF
	pACzUI0TD7g+kShErrl+JsS+iWbXGLFtOO3+B5pQEHH2rNe3YScuao+g/9lpetuEmoPH
	sK6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=pcGh3eLfAmoq4fJ47RP5bhph6AzTDYIu5qJ+2WBnG1A=;
	b=O6Xbh8OxNYJf9pcqG/Rl2p3Au3O6VZ8wxhXaIBP+o/9WCmChFMxfjtRKH/cjC7nucg
	hSziRWiEEaiothxEzMVuKKPvbyXV5EXTwzgk6W5Q9Bhyg2+EYwnx6xINCOu4u1Hwf5do
	Myt47+HiaaQe98v98jpIHIaT+SDe+qmUB2q0Yt/1hzU+kjoxh58A3d4tzq3o+J73v7o9
	fhd5NKroshIdSxTq8yqmY/EDETenC1/VM0eq2+Ica6sQcPq0qmVYQn+fnixy3+qkA14D
	dNYZLFzshsGY2btbkaqLzhz0e25raDNXIKRBG2Qs1kd/rwufSWze8GNIqmk8NILYJu2W
	6Ncg==
X-Gm-Message-State: AA+aEWZNSUAsMxg/hCAiT2chHoaq0W/rxJ7OwWOFwwTnao06sATC5IOb
	pkgvTYxB2ne4I44RquRqihfD2b7wKVbQ2BNBjTULsg==
X-Google-Smtp-Source: AFSGD/X1ivGJORm5MDuzVrv1o15uSHuYjeKAf634PfpI66Sl+EfXF2gf06Cf5HlJTFueWLM9WRPeF9rqR1FamBEfk2o=
X-Received: by 2002:a2e:8ec8:: with SMTP id
	e8-v6mr15077590ljl.162.1545310405357; 
	Thu, 20 Dec 2018 04:53:25 -0800 (PST)
MIME-Version: 1.0
References: <20181219175040.10507-1-damien.riegel@gmail.com>
	<CAGgRHJr+obHJrRNFCDsPJN18w0-dtQsxAa_+Kk2KBMppDSycoA@mail.gmail.com>
	<CAL4iiOeed+At5V0hyFUEdS_JdRgG0o63dYLkiTkt0F-btK8tUw@mail.gmail.com>
In-Reply-To: <CAL4iiOeed+At5V0hyFUEdS_JdRgG0o63dYLkiTkt0F-btK8tUw@mail.gmail.com>
From: Matt Madison <matt@madison.systems>
Date: Thu, 20 Dec 2018 04:53:14 -0800
Message-ID: <CAGgRHJrg+VzfKq09yhJG6xEHkfWYXmA7fsVK_X96ozTG5z9k1A@mail.gmail.com>
To: Damien Riegel <damien.riegel@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] [RFC] go.bbclass: install dependencies under $GOPATH instead of $GOROOT
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
X-List-Received-Date: Thu, 20 Dec 2018 12:53:25 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Dec 19, 2018 at 5:52 PM Damien Riegel <damien.riegel@gmail.com> wrote:
>
> On Wed, 19 Dec 2018 at 16:41, Matt Madison <matt@madison.systems> wrote:
> >
> > On Wed, Dec 19, 2018 at 9:51 AM Damien Riegel <damien.riegel@gmail.com> wrote:
> > >
> > > To package a go application in Yocto, one needs to also package its
> > > dependencies to keep the build reproducible and under control. The
> > > default install task of the go class puts the source in ${libdir}/go/src.
> > >
> > > ${libdir}/go/src is where the standard go packages resides, aka $GOROOT.
> > > When a go package has dependencies on other go packages, they must be
> > > located under $GOPATH, otherwise errors like this one may happen:
> > >
> > >   Non-standard package <packagename> in standard package <packagename>
> > >
> > > This point of this patch is to trigger a discussion on how this issue
> > > can be tackled in Yocto. Following code is working but should not be
> > > considered for inclusion.
> >
> > Can you describe the context of this a bit more?  The way go.bbclass
> > is set up, all of your recipe's dependencies (and their dependencies)
> > should already have been installed in the per-recipe sysroot (where
> > GOROOT lives for the current recipe's build), and should get resolved
> > from there. GOPATH gets set to ${B} for the current recipe's build.
> > Nothing in the GOROOT should be importing packages that reside in
> > GOPATH, which is what that particular error message is indicating. If
> > you're getting that error, then there might be something wrong with
> > recipe dependencies.
>
> Sure. I think the issue is because I have the following chain of
> dependencies:
>
> A --> B --> C
>   `-> C
>
> Building C is fine, building B is fine, but building A triggers the
> error I mentioned, because the Go compiler complains about B using a
> non-standard package C. It thinks B is a standard package because it's
> located in GOROOT.

Are the three packages in separate source repositories? If so, the go
tool should not be finding any C files in GOPATH.

If A and C are part of the same source repository, but B is separate,
that would make the situation a bit trickier, but still solvable.

> Regarding dependencies, I created recipes named foocorp.com-{A,B,C}.bb
> and used DEPENDS_append = " foocorp.com-A" for instance.

If A imports from B and C, you should have DEPENDS = "foocorp.com-B
foocorp.com-C" in the recipe for A, and
DEPENDS = "foocorp.com-C" in the recipe for B.

> I understand it's convenient to install dependencies in the GOROOT
> directory of recipes' sysroot, but we should keep in mind that when one
> calls `go get`, dependencies are installed in GOPATH, not GOROOT. I
> think that if we want to avoid (a bit obscure) build failures and cover
> all use cases, we should try to mimic that behaviour as close as we can.

go.bbclass does not use `go get`.  It only uses `go install`.

-Matt

>
> >
> > -Matt
> > >
> > > Signed-off-by: Damien Riegel <damien.riegel@gmail.com>
> > > ---
> > >  meta/classes/go.bbclass | 18 +++++++++++++++---
> > >  1 file changed, 15 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
> > > index 167d02e3fa..c0ed3211cd 100644
> > > --- a/meta/classes/go.bbclass
> > > +++ b/meta/classes/go.bbclass
> > > @@ -111,9 +111,9 @@ do_compile_ptest_base() {
> > >  do_compile_ptest_base[dirs] =+ "${GOTMPDIR}"
> > >
> > >  go_do_install() {
> > > -       install -d ${D}${libdir}/go/src/${GO_IMPORT}
> > > +       install -d ${D}/gopath/src/${GO_IMPORT} ${D}${libdir}/go
> > >         tar -C ${S}/src/${GO_IMPORT} -cf - --exclude-vcs --exclude '*.test' --exclude 'testdata' . | \
> > > -               tar -C ${D}${libdir}/go/src/${GO_IMPORT} --no-same-owner -xf -
> > > +               tar -C ${D}/gopath/src/${GO_IMPORT} --no-same-owner -xf -
> > >         tar -C ${B} -cf - pkg | tar -C ${D}${libdir}/go --no-same-owner -xf -
> > >
> > >         if [ -n "`ls ${B}/${GO_BUILD_BINDIR}/`" ]; then
> > > @@ -172,9 +172,21 @@ do_install_ptest_base() {
> > >         chown -R root:root ${D}${PTEST_PATH}
> > >  }
> > >
> > > +do_fixupdeps() {
> > > +       gopath="${WORKDIR}/recipe-sysroot/gopath"
> > > +       if [ -d ${gopath} ]; then
> > > +               tar -C ${gopath} -cf - src | tar -C ${B} --no-same-owner -k -xf -
> > > +       else
> > > +               echo "no dependencies to fixup"
> > > +       fi
> > > +}
> > > +
> > >  EXPORT_FUNCTIONS do_unpack do_configure do_compile do_install
> > >
> > > -FILES_${PN}-dev = "${libdir}/go/src"
> > > +addtask do_fixupdeps after do_configure before do_compile
> > > +
> > > +SYSROOT_DIRS_append = "/gopath"
> > > +FILES_${PN}-dev = "/gopath/src"
> > >  FILES_${PN}-staticdev = "${libdir}/go/pkg"
> > >
> > >  INSANE_SKIP_${PN} += "ldflags"
> > > --
> > > 2.19.2
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-core mailing list
> > > Openembedded-core@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-core

