Return-Path: <damien.riegel@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id CD9337BE2C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2018 01:52:23 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id i12so84174pfo.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Dec 2018 17:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=PJ6iVf+UdlvtthP5AkmFFzdLz1FzwuCtZ023agnm0zM=;
	b=qHfMU6iqAwSvYLMawG0g8yM4YbNjaMZd5Pqj7eW0Rct+Ek599FeXMMgpvyzAtIPHx1
	LEx39VHlv8ud3QX68h0QwIYNDRIZ2rq+wkXuHLxCQoNmmO/KeVeLWsaFjjcV4d+QBQL/
	BRtfvjk6kN8gfU3zPgDpeKTt+SjE9KiewtZAJr6ARXsy4oligb+mlYnKCTxOcawoqdmP
	jmgcHSco5NlPmSeBUnQNwVKnP2wTv7ntbvAbYiCAOSiemkzWUxBHajVqDfhDgcG1fFCw
	ILZZgHTKMrFusiQsOmEqk9tX6PqzIeKDPGF/FbdTunYBP7D2rTyzKGNof8JXCUVV4X2e
	jHEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=PJ6iVf+UdlvtthP5AkmFFzdLz1FzwuCtZ023agnm0zM=;
	b=V4iUiFpB5sYK4zE0WnyibDaU3Ous8F/zMYTcUDo49ELMRM79nYFt+10h8SxBzpVR6N
	bvPU7vypdNx9g4KA5wUWmg7711yaWblzqTxr3cfKOw7A+WesHDDxEJNpi0qf4etbg953
	2mtq2sVtRt0Qem5VQrRao9rBs/KqkS0o18elAtFkP3VumQ3C9bmOPdF+S/hr9rz4u7x9
	DgbjM2l1hKi1NGWssSub4N6AjIa7KCq89WpQJOiHIlYnHgYaTbb5a79RN6FC+J2XDRuF
	TGgaDCsnhF6yay6C13UOrA9gnXhRG3KFqX/U0DaxUS68vkKpIH81D9mhsGLCQXKTP0OT
	E2PA==
X-Gm-Message-State: AA+aEWaeoLde05qObGfxuk86SFLh2mJiYqRTKN/bU8YxpHmpvVjCY3OD
	qVzjN/BhPNM3NZ4JMlIfU9rdzJD2pb8XvVXBqSfpWZFw
X-Google-Smtp-Source: AFSGD/UXuxsjMY2suTpHqZwNnbscNt+FxffNAIppFpvaWGmmbyraUc0i1ud0Ma9b9qr8mKvm+hsUMnMKKLH8JVwsG1A=
X-Received: by 2002:a62:13c3:: with SMTP id 64mr22500948pft.93.1545270744609; 
	Wed, 19 Dec 2018 17:52:24 -0800 (PST)
MIME-Version: 1.0
References: <20181219175040.10507-1-damien.riegel@gmail.com>
	<CAGgRHJr+obHJrRNFCDsPJN18w0-dtQsxAa_+Kk2KBMppDSycoA@mail.gmail.com>
In-Reply-To: <CAGgRHJr+obHJrRNFCDsPJN18w0-dtQsxAa_+Kk2KBMppDSycoA@mail.gmail.com>
From: Damien Riegel <damien.riegel@gmail.com>
Date: Wed, 19 Dec 2018 20:52:13 -0500
Message-ID: <CAL4iiOeed+At5V0hyFUEdS_JdRgG0o63dYLkiTkt0F-btK8tUw@mail.gmail.com>
To: Matt Madison <matt@madison.systems>
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
X-List-Received-Date: Thu, 20 Dec 2018 01:52:24 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, 19 Dec 2018 at 16:41, Matt Madison <matt@madison.systems> wrote:
>
> On Wed, Dec 19, 2018 at 9:51 AM Damien Riegel <damien.riegel@gmail.com> wrote:
> >
> > To package a go application in Yocto, one needs to also package its
> > dependencies to keep the build reproducible and under control. The
> > default install task of the go class puts the source in ${libdir}/go/src.
> >
> > ${libdir}/go/src is where the standard go packages resides, aka $GOROOT.
> > When a go package has dependencies on other go packages, they must be
> > located under $GOPATH, otherwise errors like this one may happen:
> >
> >   Non-standard package <packagename> in standard package <packagename>
> >
> > This point of this patch is to trigger a discussion on how this issue
> > can be tackled in Yocto. Following code is working but should not be
> > considered for inclusion.
>
> Can you describe the context of this a bit more?  The way go.bbclass
> is set up, all of your recipe's dependencies (and their dependencies)
> should already have been installed in the per-recipe sysroot (where
> GOROOT lives for the current recipe's build), and should get resolved
> from there. GOPATH gets set to ${B} for the current recipe's build.
> Nothing in the GOROOT should be importing packages that reside in
> GOPATH, which is what that particular error message is indicating. If
> you're getting that error, then there might be something wrong with
> recipe dependencies.

Sure. I think the issue is because I have the following chain of
dependencies:

A --> B --> C
  `-> C

Building C is fine, building B is fine, but building A triggers the
error I mentioned, because the Go compiler complains about B using a
non-standard package C. It thinks B is a standard package because it's
located in GOROOT.

Regarding dependencies, I created recipes named foocorp.com-{A,B,C}.bb
and used DEPENDS_append = " foocorp.com-A" for instance.

I understand it's convenient to install dependencies in the GOROOT
directory of recipes' sysroot, but we should keep in mind that when one
calls `go get`, dependencies are installed in GOPATH, not GOROOT. I
think that if we want to avoid (a bit obscure) build failures and cover
all use cases, we should try to mimic that behaviour as close as we can.

>
> -Matt
> >
> > Signed-off-by: Damien Riegel <damien.riegel@gmail.com>
> > ---
> >  meta/classes/go.bbclass | 18 +++++++++++++++---
> >  1 file changed, 15 insertions(+), 3 deletions(-)
> >
> > diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
> > index 167d02e3fa..c0ed3211cd 100644
> > --- a/meta/classes/go.bbclass
> > +++ b/meta/classes/go.bbclass
> > @@ -111,9 +111,9 @@ do_compile_ptest_base() {
> >  do_compile_ptest_base[dirs] =+ "${GOTMPDIR}"
> >
> >  go_do_install() {
> > -       install -d ${D}${libdir}/go/src/${GO_IMPORT}
> > +       install -d ${D}/gopath/src/${GO_IMPORT} ${D}${libdir}/go
> >         tar -C ${S}/src/${GO_IMPORT} -cf - --exclude-vcs --exclude '*.test' --exclude 'testdata' . | \
> > -               tar -C ${D}${libdir}/go/src/${GO_IMPORT} --no-same-owner -xf -
> > +               tar -C ${D}/gopath/src/${GO_IMPORT} --no-same-owner -xf -
> >         tar -C ${B} -cf - pkg | tar -C ${D}${libdir}/go --no-same-owner -xf -
> >
> >         if [ -n "`ls ${B}/${GO_BUILD_BINDIR}/`" ]; then
> > @@ -172,9 +172,21 @@ do_install_ptest_base() {
> >         chown -R root:root ${D}${PTEST_PATH}
> >  }
> >
> > +do_fixupdeps() {
> > +       gopath="${WORKDIR}/recipe-sysroot/gopath"
> > +       if [ -d ${gopath} ]; then
> > +               tar -C ${gopath} -cf - src | tar -C ${B} --no-same-owner -k -xf -
> > +       else
> > +               echo "no dependencies to fixup"
> > +       fi
> > +}
> > +
> >  EXPORT_FUNCTIONS do_unpack do_configure do_compile do_install
> >
> > -FILES_${PN}-dev = "${libdir}/go/src"
> > +addtask do_fixupdeps after do_configure before do_compile
> > +
> > +SYSROOT_DIRS_append = "/gopath"
> > +FILES_${PN}-dev = "/gopath/src"
> >  FILES_${PN}-staticdev = "${libdir}/go/pkg"
> >
> >  INSANE_SKIP_${PN} += "ldflags"
> > --
> > 2.19.2
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

