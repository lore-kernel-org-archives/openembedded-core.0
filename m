Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id 42314744B1
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Oct 2018 14:33:28 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id o14-v6so18120782ljj.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Oct 2018 07:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=1e6peyzteEuM5pZUCVS+CngE2f2/QQwadLolcMG0TT8=;
	b=ayKJFf/meUEXqOSnJhDxHXQRRNzaKo9enWDJxI7iX///5UiGTRyFuh4qE2lYlg+LPL
	3RwwFNHmyeyPNTTycrUDrBsexMWHD5lO//Pz1hkpe3STu+bbrvMzQ/ENdU9Vx4mxCmMq
	1z1xq9jwxRh0z27cpVfyTy2mTNw8fbPKeciDdlMmv0RJVgDMri9509XZsb+KkABzmAqd
	GDjkmTX4kxy9QWf0WgYFFRGwea8GcVNbczZmj1C8HFcdsVVbLELGnf8+XfPh3CQgtX4x
	/DRqPwfOapUVwsWlo6TkydIehKb+Vdx4FPb6vP8x38cBMYqnhE3QEuljH/OnLZtQ6KJD
	rtmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=1e6peyzteEuM5pZUCVS+CngE2f2/QQwadLolcMG0TT8=;
	b=cblCWT/uyR3EjfbaACox8dHXvIj5a2iq3+A7v7vLD6br0+HHh1nZMq7QNENeNStTXG
	whgSSJsQMeLO5UTJSLsXeulK6eklrEn7IVNxqQ7Up3zTjHDRgUC6ZFo5FgYDR7GaObhC
	82RZ88bpB7ul+pkV/FaXyvAWI+ub9NIjQjlBsBmufny/4myscJz2suYtVgOrwh6Tp3hg
	Bl3+FfUnqVFuBY3vkt40PCjQWx3e2E6ASnNKIuVlVLwn6b9qRgsj5Q7VDFC5dIRdALW4
	ZOv9bPsbZkyZ68GHb6cgXKCDJS71jXA7naas/OtqnyJr2KFRMN/ckdr20vEEX4oCuivc
	DU/g==
X-Gm-Message-State: ABuFfogVXdBJW4tlNIaZcn6DO2siOtYZEMuCW9s4S+LA5gy68xpPt3Q0
	gu+5j8jMteMMlGL04vvwm5ywlPjZShS5kI2APX3T2w==
X-Google-Smtp-Source: ACcGV62Sv/mzpsLFL6rnYVsR5PUEwUMOo5W8yIiE+o1NEkozacj9TUWgnYMBBdL/jsNPTRwUAjbN49Nk0J2L2LKwPK0=
X-Received: by 2002:a2e:8589:: with SMTP id
	b9-v6mr11940959lji.122.1539009208429; 
	Mon, 08 Oct 2018 07:33:28 -0700 (PDT)
MIME-Version: 1.0
References: <20181001124209.12503-1-urs.fassler@bbv.ch>
	<93a276f8-7465-ffd9-9279-44aacd1c2337@windriver.com>
	<2585c52cf6e9a30822d3417299c3df681e5ec7a4.camel@bbv.ch>
In-Reply-To: <2585c52cf6e9a30822d3417299c3df681e5ec7a4.camel@bbv.ch>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 8 Oct 2018 10:33:16 -0400
Message-ID: <CADkTA4PS+VBNpLn490QBXeoR964UmohE-uSE0UtDCkUjZ9FVzA@mail.gmail.com>
To: urs.fassler@bbv.ch
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] [yocto-docs][PATCH] kernel-dev: document the change detection of kernel feature files
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
X-List-Received-Date: Mon, 08 Oct 2018 14:33:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 8, 2018 at 5:18 AM Urs F=C3=A4ssler <urs.fassler@bbv.ch> wrote:
>
> On Tue, 2018-10-02 at 10:44 -0400, bruce.ashfielda wrote:
> > On 2018-10-01 8:42 AM, Urs F?ssler wrote:
> > > Recommend to add recipe-space features to SRC_URI so that changes
> > > to them
> > > are detected automatically.
> > >
> > > Signed-off-by: Urs F?ssler <urs.fassler at bbv.ch>
> > > Signed-off-by: Pascal Bach <pascal.bach at siemens.com>
> > > ---
> > >   documentation/kernel-dev/kernel-dev-common.xml | 7 +++++--
> > >   1 file changed, 5 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/documentation/kernel-dev/kernel-dev-common.xml
> > > b/documentation/kernel-dev/kernel-dev-common.xml
> > > index 83b02b1c1..6289ce8d4 100644
> > > --- a/documentation/kernel-dev/kernel-dev-common.xml
> > > +++ b/documentation/kernel-dev/kernel-dev-common.xml
> > > @@ -2623,6 +2623,9 @@
> > >               <filename>.scc</filename> file in the
> > >               <filename>SRC_URI</filename> statement to reference
> > > multiple kernel
> > >               features.
> > > +            Since BitBake only detects changes on files listed in
> > > +            <filename>SRC_URI</filename>, it is best to add all
> >
> > This is not necessarily true. It would be better stated that if you
> > are modifying the .cfg files in the layer directly, you should list
> > them on the SRC_URI to have the changes picked up by bitbake.
> >
> > It is not a matter of "best", so it should be stated that way.
>
> Thank you for the feedback. I am not sure if I don't understand the
> problem or your answer correctly.

I meant to say "not stated that way".

>
> We faced the problem, that our CI server did not picked up the changes
> made in the .cfg files. I investigated the problem and found that
> BitBake only detects changes on files listed in SRC_URI. This is
> supported in the chapter "Working with Advanced Metadata" that states:

I'm aware of how the items are currently written, having provided much
of the information for those sections.

>
> "BitBake parses [the .scc files] and fetches any files referenced in
> the .scc files by the include, patch, or kconf commands. Because of
> this, it is necessary to bump the recipe PR value when changing the
> content of files not explicitly listed in the SRC_URI."
> https://www.yoctoproject.org/docs/latest/mega-manual/mega-manual.html#rec=
ipe-space-metadata
>
> The behavior is imho not what you expect. But fixing this is quite a
> big change since it involves changes in the interaction of BitBake
> (change detection on files) with Yocto classes (recursive parsing of
> scc files). Therefore I try to solve it with a better description.

Yep. I've had a bug/feature to do just that for some time, but it hasn't
made it to the top of the list yet.

My point is that the description should not say "best", it isn't a matter
of best or worst. It is a matter of stating the behaviour, knowing how
you plan to interact with the elements and then using them appropriately.

>
> You stated that it is only necessary to add the .cfg files when you
> change the .cfg files in the layer directly. I don't see how you would
> change the .cfg files otherwise or what use case you have in mind.

By using a kernel-cache repository. Just like all the main linux-yocto
builds. Alternatively, you could make sure the gather meta-data task
is always run, but then that typically triggers more compiles/builds
than you want.

>
> > > @+            <filename>.cfg</filename> to
> > > <filename>SRC_URI</filename>.
> > >           </para>
> > >
> > >           <para>
> > > @@ -2674,10 +2677,10 @@
> > >                       </para></listitem>
> > >                   <listitem><para>
> > >                       <emphasis>Add the Feature File to
> > > <filename>SRC_URI</filename>:</emphasis>
> > > -                    Add the <filename>.scc</filename> file to the
> > > +                    Add the <filename>.cfg</filename> and
> > > <filename>.scc</filename> file to the
> > >                       recipe's <filename>SRC_URI</filename>
> > > statement:
> > >                       <literallayout class=3D'monospaced'>
> > > -     SRC_URI_append =3D " file://test.scc"
> > > +     SRC_URI_append =3D " file://test.cfg file://test.scc"
> >
> > This is wrong. You should not have both on the SRC_URI
>
> I concluded this also from the description in the "Working with
> Advanced Metadata" chapter (see above). But I would be happy to know
> about another solution for our problem.

If all that test.scc does is include test.cfg, you don't put both on
the SRC_URI.
All you've done is include it twice. If you are worried about modifying the
.cfg's and having sstate be invalided so the tasks re-run, then you'd just
put the .cfg on the SRC_URI.

Bruce

>
> Urs
>
> > >                       </literallayout>
> > >                       The leading space before the path is
> > > important as the
> > >                       path is appended to the existing path.
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

