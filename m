Return-Path: <matt@madison.systems>
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
	[209.85.167.50])
	by mail.openembedded.org (Postfix) with ESMTP id B875979DAB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2018 16:00:12 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id n18so1747484lfh.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2018 08:00:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=6PbUiyeN/7xMco6GJ0voKEzuZutXsNdJq/ooG0iSmig=;
	b=ZXgzhuDbYP34FrmdSTl4WKARVDWQT7cXp4Xuq6NXsnc1C5asLhu1EGceDb708hxE7a
	uxwYVyTB1GA0dZw47//LnodytsT6lKJqbJ/GvIGTaSVb8WfdNY42OX++iVk0n+lOM9rV
	9zW5dDPmtyGN0mt5WLqaVUW4QpCaQtwP3+tYsUsbzb02A40i0WSVS505u7b41GJdzzZO
	D1VJb//iRooicYXew3Yf1pt8n+GkNvzmclF4b/aXgtpisCVkxyL953HxpP5kaKwNKNsc
	F8SMqK85XPksARNQnu20CoZaIUQl6DiqDsKbwsy3YxDsxzgm/6JKWaekN6FeL/0CMhpV
	BRLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=6PbUiyeN/7xMco6GJ0voKEzuZutXsNdJq/ooG0iSmig=;
	b=Qw2/hECbPtosDbXkEX66l9ECsmp8vnjgSZ+U+JF30dcBknHeOkzuSFD8YTijv2wvR/
	NUDlBt6jhePykgpT+BZZZzjy+7UUdub0jD3pX+s0v957pwD05jCCSP5dJpsnovN6NzoV
	XveHISF+0yKPAYhiOrEGv0tFB7WtIG+L7H/wzXMiyyxF37oegHpgcqYUC4GFKqYNdAag
	GywDrWfTtD3ag1PX7RG5tb/yzWNtciZjvCDdmNv3RPN8Dgtbq1/5YUXSwzvOJ8Jmxz0F
	bo2mdwvjPj/U9zd+MGBM89cREFSXopKr3G/gVIuhkFoyoJ65MLGJMtOnomqsY+XhqHzl
	BI4A==
X-Gm-Message-State: AA+aEWYinj6Yn7hXQlTEQHUs0AbPNg87yV0ctvbHtJ0lDqEytCWtmzl7
	6bA3npBet+MDWitPvgdoJ0OogmGkThuvMf6DKSu/1w==
X-Google-Smtp-Source: AFSGD/VDQakMBD1XboZ/y142aIwpYId+5INLCrO01iPZeL+DA6mjIKlhdBgHabvDvtTkIb1GHnC3rvW2+IxzkYH59nk=
X-Received: by 2002:a19:5ad0:: with SMTP id y77mr16473264lfk.109.1545321613044;
	Thu, 20 Dec 2018 08:00:13 -0800 (PST)
MIME-Version: 1.0
References: <20181219175040.10507-1-damien.riegel@gmail.com>
	<CAGgRHJr+obHJrRNFCDsPJN18w0-dtQsxAa_+Kk2KBMppDSycoA@mail.gmail.com>
	<CAL4iiOeed+At5V0hyFUEdS_JdRgG0o63dYLkiTkt0F-btK8tUw@mail.gmail.com>
	<CAGgRHJrg+VzfKq09yhJG6xEHkfWYXmA7fsVK_X96ozTG5z9k1A@mail.gmail.com>
	<CAL4iiOd3YC9-12r5gPF78_6edXRUzctmzWq4bBcv2XQf-Q2CBw@mail.gmail.com>
In-Reply-To: <CAL4iiOd3YC9-12r5gPF78_6edXRUzctmzWq4bBcv2XQf-Q2CBw@mail.gmail.com>
From: Matt Madison <matt@madison.systems>
Date: Thu, 20 Dec 2018 08:00:01 -0800
Message-ID: <CAGgRHJphjj3Bzu5FVjw8m-uFivAJ-k5fqZiNQ++s+w8hk3QCcg@mail.gmail.com>
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
X-List-Received-Date: Thu, 20 Dec 2018 16:00:13 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 20, 2018 at 6:02 AM Damien Riegel <damien.riegel@gmail.com> wrote:
>
> On Thu, 20 Dec 2018 at 07:53, Matt Madison <matt@madison.systems> wrote:
> >
> > On Wed, Dec 19, 2018 at 5:52 PM Damien Riegel <damien.riegel@gmail.com> wrote:
> > >
> > > On Wed, 19 Dec 2018 at 16:41, Matt Madison <matt@madison.systems> wrote:
> > > >
> > > > On Wed, Dec 19, 2018 at 9:51 AM Damien Riegel <damien.riegel@gmail.com> wrote:
> > > > >
> > > > > To package a go application in Yocto, one needs to also package its
> > > > > dependencies to keep the build reproducible and under control. The
> > > > > default install task of the go class puts the source in ${libdir}/go/src.
> > > > >
> > > > > ${libdir}/go/src is where the standard go packages resides, aka $GOROOT.
> > > > > When a go package has dependencies on other go packages, they must be
> > > > > located under $GOPATH, otherwise errors like this one may happen:
> > > > >
> > > > >   Non-standard package <packagename> in standard package <packagename>
> > > > >
> > > > > This point of this patch is to trigger a discussion on how this issue
> > > > > can be tackled in Yocto. Following code is working but should not be
> > > > > considered for inclusion.
> > > >
> > > > Can you describe the context of this a bit more?  The way go.bbclass
> > > > is set up, all of your recipe's dependencies (and their dependencies)
> > > > should already have been installed in the per-recipe sysroot (where
> > > > GOROOT lives for the current recipe's build), and should get resolved
> > > > from there. GOPATH gets set to ${B} for the current recipe's build.
> > > > Nothing in the GOROOT should be importing packages that reside in
> > > > GOPATH, which is what that particular error message is indicating. If
> > > > you're getting that error, then there might be something wrong with
> > > > recipe dependencies.
> > >
> > > Sure. I think the issue is because I have the following chain of
> > > dependencies:
> > >
> > > A --> B --> C
> > >   `-> C
> > >
> > > Building C is fine, building B is fine, but building A triggers the
> > > error I mentioned, because the Go compiler complains about B using a
> > > non-standard package C. It thinks B is a standard package because it's
> > > located in GOROOT.
> >
> > Are the three packages in separate source repositories? If so, the go
> > tool should not be finding any C files in GOPATH.
> >
> > If A and C are part of the same source repository, but B is separate,
> > that would make the situation a bit trickier, but still solvable.
>
> They are three separate repositories. The issue is precisely that C
> files are not in GOPATH but in GOROOT. C files _should be_ in GOPATH or
> that will break Go tools.

Go does allow for non-"standard" packages to be in GOROOT as well.
The way the go tool marks a package as "standard" is if it resides in
GOROOT _and_ starts with a prefix that does not look like a domain
name (specifically, does not contain a dot '.').  The Go convention,
though, is to use a domain name as the first element of the import
path for anything that isn't part of the base runtime (std, cmd).

If you do have a situation where you have multiple interdependent
packages that for some reason have import paths that do not start with
a domain name, you could build them all using a single recipe, rather
than splitting them up into separate recipes.  I've had to do that for
cases where there were circular dependencies between two (or more)
packages; the same technique could work this, though, too.

-Matt

> > > Regarding dependencies, I created recipes named foocorp.com-{A,B,C}.bb
> > > and used DEPENDS_append = " foocorp.com-A" for instance.
> >
> > If A imports from B and C, you should have DEPENDS = "foocorp.com-B
> > foocorp.com-C" in the recipe for A, and
> > DEPENDS = "foocorp.com-C" in the recipe for B.
>
> Okay, that part I got right then!
>
> > > I understand it's convenient to install dependencies in the GOROOT
> > > directory of recipes' sysroot, but we should keep in mind that when one
> > > calls `go get`, dependencies are installed in GOPATH, not GOROOT. I
> > > think that if we want to avoid (a bit obscure) build failures and cover
> > > all use cases, we should try to mimic that behaviour as close as we can.
> >
> > go.bbclass does not use `go get`.  It only uses `go install`.
>
> Sorry, that was not clear, I was talking about Go development outside of
> Yocto. So outside of Yocto, I would use `go fetch` to get the
> dependencies and they would end up somewhere in GOPATH.  When packaging
> these dependencies in Yocto, they will end up in the GOROOT of recipes'
> sysroots, and that breaks builds.
>
> My point was that if we want to be able to write recipe for any valid Go
> package, dependencies should be found under GOPATH, not GOROOT.
>
> > -Matt
> >
> > >
> > > >
> > > > -Matt
> > > > >
> > > > > Signed-off-by: Damien Riegel <damien.riegel@gmail.com>
> > > > > ---
> > > > >  meta/classes/go.bbclass | 18 +++++++++++++++---
> > > > >  1 file changed, 15 insertions(+), 3 deletions(-)
> > > > >
> > > > > diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
> > > > > index 167d02e3fa..c0ed3211cd 100644
> > > > > --- a/meta/classes/go.bbclass
> > > > > +++ b/meta/classes/go.bbclass
> > > > > @@ -111,9 +111,9 @@ do_compile_ptest_base() {
> > > > >  do_compile_ptest_base[dirs] =+ "${GOTMPDIR}"
> > > > >
> > > > >  go_do_install() {
> > > > > -       install -d ${D}${libdir}/go/src/${GO_IMPORT}
> > > > > +       install -d ${D}/gopath/src/${GO_IMPORT} ${D}${libdir}/go
> > > > >         tar -C ${S}/src/${GO_IMPORT} -cf - --exclude-vcs --exclude '*.test' --exclude 'testdata' . | \
> > > > > -               tar -C ${D}${libdir}/go/src/${GO_IMPORT} --no-same-owner -xf -
> > > > > +               tar -C ${D}/gopath/src/${GO_IMPORT} --no-same-owner -xf -
> > > > >         tar -C ${B} -cf - pkg | tar -C ${D}${libdir}/go --no-same-owner -xf -
> > > > >
> > > > >         if [ -n "`ls ${B}/${GO_BUILD_BINDIR}/`" ]; then
> > > > > @@ -172,9 +172,21 @@ do_install_ptest_base() {
> > > > >         chown -R root:root ${D}${PTEST_PATH}
> > > > >  }
> > > > >
> > > > > +do_fixupdeps() {
> > > > > +       gopath="${WORKDIR}/recipe-sysroot/gopath"
> > > > > +       if [ -d ${gopath} ]; then
> > > > > +               tar -C ${gopath} -cf - src | tar -C ${B} --no-same-owner -k -xf -
> > > > > +       else
> > > > > +               echo "no dependencies to fixup"
> > > > > +       fi
> > > > > +}
> > > > > +
> > > > >  EXPORT_FUNCTIONS do_unpack do_configure do_compile do_install
> > > > >
> > > > > -FILES_${PN}-dev = "${libdir}/go/src"
> > > > > +addtask do_fixupdeps after do_configure before do_compile
> > > > > +
> > > > > +SYSROOT_DIRS_append = "/gopath"
> > > > > +FILES_${PN}-dev = "/gopath/src"
> > > > >  FILES_${PN}-staticdev = "${libdir}/go/pkg"
> > > > >
> > > > >  INSANE_SKIP_${PN} += "ldflags"
> > > > > --
> > > > > 2.19.2
> > > > >
> > > > > --
> > > > > _______________________________________________
> > > > > Openembedded-core mailing list
> > > > > Openembedded-core@lists.openembedded.org
> > > > > http://lists.openembedded.org/mailman/listinfo/openembedded-core

