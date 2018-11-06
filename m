Return-Path: <armccurdy@gmail.com>
Received: from mail-vk1-f195.google.com (mail-vk1-f195.google.com
	[209.85.221.195])
	by mail.openembedded.org (Postfix) with ESMTP id B66F179CFA
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Nov 2018 08:25:28 +0000 (UTC)
Received: by mail-vk1-f195.google.com with SMTP id h128so2664663vkg.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Nov 2018 00:25:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=x/Yw7p5b58Mvr1pfp3/TdNy1YmEO0c8LkDLvdgqjRLo=;
	b=CP05ifHOAOJQ81go6WqvrMamSQB7OdNzLsfC72vi8cqVVAs937XXipCRvHsj72LMoj
	onfNDW04l2ILLYgAFzB/r0QC+W3+Xne234o+RpQqpqRsBWZFtCuob8Qu4F1JIRKSYatd
	IHuw/jsS86ijB5VJOuMNqyHGnYDF52YfjRkm0MUTZ9lPUwr88HWSBV2J4LsR/tTt+2mK
	ufux0skkDTO6gQ2ZgGG4ChNz40GXlX34o075GDSjfyLF1HfA7CR6ucZuRAQRqs3hOUo9
	eqns+nN8ZuTFD7JOEEWkC+MsuDpuFQeQGr5fSQRaqpxGz5IIZNCjwZyMmhL8n3LMDdm5
	WKBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=x/Yw7p5b58Mvr1pfp3/TdNy1YmEO0c8LkDLvdgqjRLo=;
	b=sZxLTJmrVbnuQl0WPNLx3cWXp3u/nYr4B8wtzHu9yZQcHR0WTqGvhtU/Kutrt33HBR
	rshOsZF6VV2l1WQDtfMuDuQAFx3V46zim/3YSm9Vnzu35qb3PLMGFv3Nix3ohjjxXTfT
	KM+vI6YbmKPGsqZaaAOumDWdbh1dsSOf9SBWKKW//FLt6LP4+Xw5cC6lHAYscVjd3UFA
	plgM+D3pojpgIk9+l0dVjiNcOuNOz9i0WTPRXHAF8PEJQMBP1/sQUHPbXHoLDia2uEDt
	8DfWSqX4ef8KbjNY+mYOIz23zVjg3vJFEsfuW8lrjXeI8yXa5+D5kz3E5Ob56tyGKI99
	XXyw==
X-Gm-Message-State: AGRZ1gKzf9TEl2XHD8Q3b//uoFjFm7688+CCq9Udn7xML2te1SGBsbpo
	tJY+Bu+a741MtHHk/kQNlyabX+ycEIFF7Rbgr5w=
X-Google-Smtp-Source: AJdET5fzhRHcW1LRsbDYEKXN2NcJRd3HzLJhSs4nkYU7cw4jSy7Rxgo5bSF2rQGDXEEUvnWSabkj4/FT4mOGkv2ViwA=
X-Received: by 2002:a1f:24d3:: with SMTP id k202mr9539402vkk.45.1541492729336; 
	Tue, 06 Nov 2018 00:25:29 -0800 (PST)
MIME-Version: 1.0
References: <20181102143927.15387-1-matthias.schiffer@ew.tq-group.com>
	<8ba204af82c54d23805deefb5197dd6f@XBOX04.axis.com>
	<8897ab754bea0fda7195a851b2d19695dd7553e9.camel@linuxfoundation.org>
	<CAJ86T=WHs0P3+o8_k=FJvM4PTkQT9ggWZfc0Hejieg+zzBH+Tg@mail.gmail.com>
	<71b9588f36d8a6932687bace51faab7b64e13a7c.camel@ew.tq-group.com>
	<b56e02a25bf0bd1b833769fe0b0142655a4ee233.camel@ew.tq-group.com>
In-Reply-To: <b56e02a25bf0bd1b833769fe0b0142655a4ee233.camel@ew.tq-group.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 6 Nov 2018 00:25:17 -0800
Message-ID: <CAJ86T=WzkZ6zkEykAA4v_2dQ23kF=SkxHK1Q8Dh6h-+Xx-f=ow@mail.gmail.com>
To: matthias.schiffer@ew.tq-group.com
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base.bbclass: avoid 'find -ignore_readdir_race -delete'
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
X-List-Received-Date: Tue, 06 Nov 2018 08:25:28 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 6, 2018 at 12:23 AM Matthias Schiffer
<matthias.schiffer@ew.tq-group.com> wrote:
>
> On Mon, 2018-11-05 at 09:36 +0100, Matthias Schiffer wrote:
> > On Fri, 2018-11-02 at 20:28 -0700, Andre McCurdy wrote:
> > > On Fri, Nov 2, 2018 at 8:43 AM Richard Purdie
> > > <richard.purdie@linuxfoundation.org> wrote:
> > > >
> > > > On Fri, 2018-11-02 at 15:19 +0000, Peter Kjellerstedt wrote:
> > > > > > -----Original Message-----
> > > > > > From: openembedded-core-bounces@lists.openembedded.org
> > > > > > <openembedded-
> > > > > > core-bounces@lists.openembedded.org> On Behalf Of
> > > > > > matthias.schiffer@ew.tq-group.com
> > > > > > Sent: den 2 november 2018 15:39
> > > > > > To: openembedded-core@lists.openembedded.org
> > > > > > Subject: [OE-core] [PATCH] base.bbclass: avoid 'find -
> > > > > > ignore_readdir_race -delete'
> > > > > >
> > > > > > From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
> > > > > >
> > > > > > Until recent versions of findutils, -ignore_readdir_race did
> > > > > > not
> > > > > > work
> > > > > > correctly with -delete. This led to spurious build failures
> > > > > > when
> > > > > > files
> > > > > > disappeared; specifically this was seen due to do_configure
> > > > > > and
> > > > > > do_populate_lic running concurrently for packages with ${B}
> > > > > > ==
> > > > > > ${WORKDIR}:
> > > > > >
> > > > > >    find: '.../sstate-build-populate_lic': No such file or
> > > > > > directory
> > > > > >
> > > > > > As the find command of the host system is used here, we can't
> > > > > > ensure that
> > > > > > the used version contains the fix. Work around the issue by
> > > > > > passing
> > > > > > the
> > > > > > output of find to 'rm -f' instead of using -delete.
> > > > > >
> > > > > > Signed-off-by: Matthias Schiffer <
> > > > > > matthias.schiffer@ew.tq-group.com
> > > > > > >
> > > > > >
> > > > > > ---
> > > > > >
> > > > > > It would be great if this patch could be backported to all
> > > > > > versions
> > > > > > back to Rocko, as our current setup is still based on Rocko.
> > > > > >
> > > > > >  meta/classes/base.bbclass | 2 +-
> > > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > >
> > > > > > diff --git a/meta/classes/base.bbclass
> > > > > > b/meta/classes/base.bbclass
> > > > > > index df11c8b270..5ffd8396e3 100644
> > > > > > --- a/meta/classes/base.bbclass
> > > > > > +++ b/meta/classes/base.bbclass
> > > > > > @@ -303,7 +303,7 @@ base_do_configure() {
> > > > > >                     if [ "${CLEANBROKEN}" != "1" -a \( -e
> > > > > > Makefile
> > > > > > -o -e makefile -o -e GNUmakefile \) ]; then
> > > > > >                             oe_runmake clean
> > > > > >                     fi
> > > > >
> > > > > You might want to include a comment here explaining why rm -f
> > > > > is
> > > > > used instead of -delete, or someone might come along and
> > > > > optimize
> > > > > the
> > > > > code...
> > > >
> > > > We should detail which versions of findutils have the issue as
> > > > ultimately it would be nice to use the simpler command. I'm
> > > > curious
> > > > how
> > > > many of the distros we support have the problem.
> > >
> > > There's a test case in the patch proposed to fix the issue:
> > >
> > >   https://savannah.gnu.org/bugs/?52981
> > >   https://savannah.gnu.org/bugs/download.php?file_id=43119
> > >
> > > Regarding the proposed patch for base.bbclass, xargs should
> > > generally
> > > always be called with --no-run-if-empty, unless there's a clear
> > > reason
> > > not to.
> >
> > Do we generally assume that we have a GNU xargs with --no-run-if-
> > empty
> > support? Calling rm -f without further arguments at least doesn't
> > cause
> > an error, so --no-run-if-empty is only a minor optimization in this
> > case.
>
>
> I've grepped bitbake, openembedded-core and meta-openembedded for --no-
> run-if-empty, and there is only a single instance in the whole code
> base - which is conditionalized so that the option is not passed on
> Darwin. I take from this that --no-run-if-empty is not acceptable in
> OpenEmbedded to ensure portability.

Did you grep for the short form too, ie -r ?

> >
> > I'll send an updated patch with the proposed changes later today.
> >
> > Kinds regards,
> > Matthias
> >
>

