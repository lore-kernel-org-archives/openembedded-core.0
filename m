Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9EF7C7449D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Apr 2018 00:45:15 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id d20-v6so17663045lfe.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Apr 2018 17:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=lRoehL16FSVsEJqBVM1Sl8Dr07jHSiz3DwHENte1MDw=;
	b=qIOZqxspPb+80yBc/kW/+L0kbXRpW/itT9Yl/nIjr5p0CeirDZJ6R23Xs3YpoKrcK9
	Ok8307ZwOWEuZ2wCMgndeNGiDplCIZlrzSIDxzze/d0NEsUzWKmK4rjbU7cIcBl/lsSx
	1d2BsLLYF7nLiOMEQb3x1CMQyZPrJ+Sh3gtItCke1q//lhENdhWbT8fmkbGp7cwJHKq9
	DGDgcW727SXM/TQ7LsIrmkqhYrrhcBe0SEM2noF+N+NyDkIO3BTqVGo6CeK5KzEHjPLh
	twiF9RslQb8Gp7MO+8159NKVuJIo3hjinaHjdSJ9u40CpRJxszi6Gh9Hqhq/N5tlYrNU
	umPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=lRoehL16FSVsEJqBVM1Sl8Dr07jHSiz3DwHENte1MDw=;
	b=PDA8e7gbTYUwnXUKJ4S7F7I+xKX0WcyM3pWK5AFHrlta6BKyJd1a1pRa2QWnGr4Mkg
	kAHszUoy+oJzaqEgHV5lO4nNawH9jtBsNwO0aaZVqvt/Cf/jO90PPqP9Od0NoXqUl3wQ
	WQI/TmdoCuDB5joqprtJzofvzOASY9NsmUAuyt1VP2t93DE3VVsLKqvHabRw/eAni+d/
	3lpoOdVJJ2s94LO6CR4LBHUf6guaN+g/EJVMBRJkDGvFd/7kcKOkiFwExbuGMYfQOZfM
	D/AojWcyalezNH1CUFQk5sYTJd39KJ98CjqdbwPmf4kMFA+Gb0R0LEk6aR6fbimiaWTq
	Yxzg==
X-Gm-Message-State: ALQs6tDN5HZkDDQZAY5edrgiYJBf8FXaMreJ9qKDIO2XrDVAuLjGl7JE
	5ve7rG9LJqHIf6Vrhus5PfpV9pUq3SKpEqru3E4=
X-Google-Smtp-Source: AIpwx49FmlMutqufxS/gf9jPdJNQeXgC8tSjpeih8qCeEcU3bL405x6wS9jGQfd2XsT2U2xHJDqt69dthLKzod2eGoc=
X-Received: by 10.46.152.83 with SMTP id e19mr15909149ljj.133.1524530715459;
	Mon, 23 Apr 2018 17:45:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.2.22 with HTTP; Mon, 23 Apr 2018 17:45:14 -0700 (PDT)
In-Reply-To: <1524521143.18865.174.camel@linuxfoundation.org>
References: <1524471238-4908-1-git-send-email-hongxu.jia@windriver.com>
	<df7a7e3b-09a9-26ac-8969-bc369f9bc2c4@windriver.com>
	<1524521143.18865.174.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 23 Apr 2018 20:45:14 -0400
Message-ID: <CADkTA4NhgDeZQKr-6iZL-yw_ijW6W0Pr2Vq7_wMTzucGqno_XA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] perf: make a copy of kernel source to perf workdir
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
X-List-Received-Date: Tue, 24 Apr 2018 00:45:15 -0000
Content-Type: multipart/alternative; boundary="883d24f2195cbe8697056a8d777d"

--883d24f2195cbe8697056a8d777d
Content-Type: text/plain; charset="UTF-8"

On Mon, Apr 23, 2018 at 6:05 PM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Mon, 2018-04-23 at 13:51 -0400, Bruce Ashfield wrote:
> > On 2018-04-23 4:13 AM, Hongxu Jia wrote:
> > >
> > > Since perf modify kernel source which shared by multiple
> > > recipes, it probably caused kernel-devsrc compile failure
> > > at world build.
> > > ...
> > > >
> > > > 0 blocks
> > > > cpio: ./tools/perf/arch/arm/util/sedr7ORqk: Cannot stat:
> > > No such file or directory
> > > >
> > > > 0 blocks
> > > ...
> > > cpio tried to find a file at ${S}/tools/perf and failed
> > > if the input list is not valid.
> > >
> > > Make a copy of kernel shared source directory into a perf workdir
> > > could fix the issue.
> > >
> > > Drop `Fix for rebuilding' which is obsolete
> > >
> > > Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> > > ---
> > >   meta/recipes-kernel/perf/perf.bb | 11 ++++++-----
> > >   1 file changed, 6 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-
> > > kernel/perf/perf.bb
> > > index 872b5f0..8b40806 100644
> > > --- a/meta/recipes-kernel/perf/perf.bb
> > > +++ b/meta/recipes-kernel/perf/perf.bb
> > > @@ -61,7 +61,7 @@ export PERL_ARCHLIB = "${STAGING_LIBDIR}${PERL_OW
> > > N_DIR}/perl/${@get_perl_version
> > >
> > >   inherit kernelsrc
> > >
> > > -B = "${WORKDIR}/${BPN}-${PV}"
> > > +S = "${WORKDIR}/${BP}"
> > >   SPDX_S = "${S}/tools/perf"
> > >
> > >   # The LDFLAGS is required or some old kernels fails due missing
> > > @@ -119,11 +119,12 @@ do_install() {
> > >     fi
> > >   }
> > >
> > > -do_configure_prepend () {
> > > -    # Fix for rebuilding
> > > -    rm -rf ${B}/
> > > -    mkdir -p ${B}/
> > > +do_configure[prefuncs] += "git_clone_kernel_source"
> > > +git_clone_kernel_source () {
> > > +    git clone --single-branch ${STAGING_KERNEL_DIR} ${S}
> > I probably would have used "cp -a -r", or similar. Since it
> > is possible that a kernel may not actually be a git repo (linux-yocto
> > always is, but that is just one data point).
> >
> > Also, did you try just copying the tools SRC dir + whatever
> > infrastructure is needed to build ? That will save us a LOT
> > of i/o when moving the source around for perf to build.
> >
> > But outside of those details/mechanics, the approach is sound.
>
> Our "copy hardlink tree" function, whatever its called is sometimes of
> use in these cases...
>
> I think I'm the current owner of a bug in this area which I've sadly
> not gotten to yet :(.
>
> Also, have we considered the alternative - not copying tools/perf for
> the kernel devsrc?
>

We could, but sometimes the devsrc is actually used to build the tools.
I know that I have used it to build perf in the past.

It is mostly skipped in my rewritten version (which I'll resubmit after 2.5
releases). So for now, I'm thinking the smallest footprint change makes
the most sense (as to which that is, that is probably not black and white).

Bruce


>
> Cheers,
>
> Richard
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--883d24f2195cbe8697056a8d777d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, Apr 23, 2018 at 6:05 PM, Richard Purdie <span dir=3D"ltr">&lt;<=
a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">rich=
ard.purdie@linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><div class=3D"HOEnZb"><div class=3D"h5">On Mon, 2018-04-23 at=
 13:51 -0400, Bruce Ashfield wrote:<br>
&gt; On 2018-04-23 4:13 AM, Hongxu Jia wrote:<br>
&gt; &gt; <br>
&gt; &gt; Since perf modify kernel source which shared by multiple<br>
&gt; &gt; recipes, it probably caused kernel-devsrc compile failure<br>
&gt; &gt; at world build.<br>
&gt; &gt; ...<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; 0 blocks<br>
&gt; &gt; &gt; cpio: ./tools/perf/arch/arm/util/<wbr>sedr7ORqk: Cannot stat=
:<br>
&gt; &gt; No such file or directory<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; 0 blocks<br>
&gt; &gt; ...<br>
&gt; &gt; cpio tried to find a file at ${S}/tools/perf and failed<br>
&gt; &gt; if the input list is not valid.<br>
&gt; &gt; <br>
&gt; &gt; Make a copy of kernel shared source directory into a perf workdir=
<br>
&gt; &gt; could fix the issue.<br>
&gt; &gt; <br>
&gt; &gt; Drop `Fix for rebuilding&#39; which is obsolete<br>
&gt; &gt; <br>
&gt; &gt; Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windri=
ver.com">hongxu.jia@windriver.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt; =C2=A0 meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D=
"noreferrer" target=3D"_blank">perf.<wbr>bb</a> | 11 ++++++-----<br>
&gt; &gt; =C2=A0 1 file changed, 6 insertions(+), 5 deletions(-)<br>
&gt; &gt; <br>
&gt; &gt; diff --git a/meta/recipes-kernel/perf/<a href=3D"http://perf.bb" =
rel=3D"noreferrer" target=3D"_blank">per<wbr>f.bb</a> b/meta/recipes-<br>
&gt; &gt; kernel/perf/<a href=3D"http://perf.bb" rel=3D"noreferrer" target=
=3D"_blank">perf.bb</a><br>
&gt; &gt; index 872b5f0..8b40806 100644<br>
&gt; &gt; --- a/meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"=
noreferrer" target=3D"_blank">per<wbr>f.bb</a><br>
&gt; &gt; +++ b/meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"=
noreferrer" target=3D"_blank">per<wbr>f.bb</a><br>
&gt; &gt; @@ -61,7 +61,7 @@ export PERL_ARCHLIB =3D &quot;${STAGING_LIBDIR}=
${PERL_OW<br>
&gt; &gt; N_DIR}/perl/${@get_perl_<wbr>version<br>
&gt; &gt; =C2=A0=C2=A0<br>
&gt; &gt; =C2=A0 inherit kernelsrc<br>
&gt; &gt; =C2=A0=C2=A0<br>
&gt; &gt; -B =3D &quot;${WORKDIR}/${BPN}-${PV}&quot;<br>
&gt; &gt; +S =3D &quot;${WORKDIR}/${BP}&quot;<br>
&gt; &gt; =C2=A0 SPDX_S =3D &quot;${S}/tools/perf&quot;<br>
&gt; &gt; =C2=A0=C2=A0<br>
&gt; &gt; =C2=A0 # The LDFLAGS is required or some old kernels fails due mi=
ssing<br>
&gt; &gt; @@ -119,11 +119,12 @@ do_install() {<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0 fi<br>
&gt; &gt; =C2=A0 }<br>
&gt; &gt; =C2=A0=C2=A0<br>
&gt; &gt; -do_configure_prepend () {<br>
&gt; &gt; -=C2=A0=C2=A0=C2=A0=C2=A0# Fix for rebuilding<br>
&gt; &gt; -=C2=A0=C2=A0=C2=A0=C2=A0rm -rf ${B}/<br>
&gt; &gt; -=C2=A0=C2=A0=C2=A0=C2=A0mkdir -p ${B}/<br>
&gt; &gt; +do_configure[prefuncs] +=3D &quot;git_clone_kernel_source&quot;<=
br>
&gt; &gt; +git_clone_kernel_source () {<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0git clone --single-branch ${STAGING_KERN=
EL_DIR} ${S}<br>
&gt; I probably would have used &quot;cp -a -r&quot;, or similar. Since it<=
br>
&gt; is possible that a kernel may not actually be a git repo (linux-yocto<=
br>
&gt; always is, but that is just one data point).<br>
&gt; <br>
&gt; Also, did you try just copying the tools SRC dir + whatever<br>
&gt; infrastructure is needed to build ? That will save us a LOT<br>
&gt; of i/o when moving the source around for perf to build.<br>
&gt; <br>
&gt; But outside of those details/mechanics, the approach is sound.<br>
<br>
</div></div>Our &quot;copy hardlink tree&quot; function, whatever its calle=
d is sometimes of<br>
use in these cases...<br>
<br>
I think I&#39;m the current owner of a bug in this area which I&#39;ve sadl=
y<br>
not gotten to yet :(.<br>
<br>
Also, have we considered the alternative - not copying tools/perf for<br>
the kernel devsrc?<br></blockquote><div><br></div><div>We could, but someti=
mes the devsrc is actually used to build the tools.</div><div>I know that I=
 have used it to build perf in the past.</div><div><br></div><div>It is mos=
tly skipped in my rewritten version (which I&#39;ll resubmit after 2.5</div=
><div>releases). So for now, I&#39;m thinking the smallest footprint change=
 makes</div><div>the most sense (as to which that is, that is probably not =
black and white).</div><div><br></div><div>Bruce</div><div>=C2=A0</div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
<div class=3D"HOEnZb"><div class=3D"h5">-- <br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
<div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Tho=
u shalt not follow the NULL pointer, for chaos and madness await thee at it=
s end&quot;</div>
</div></div>

--883d24f2195cbe8697056a8d777d--
