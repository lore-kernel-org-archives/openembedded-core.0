Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
 by mx.groups.io with SMTP id smtpd.web11.3224.1585706631617715961
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Mar 2020 19:03:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=E/iWAky+;
 spf=pass (domain: gmail.com, ip: 209.85.208.68, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f68.google.com with SMTP id a43so27766297edf.6
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2020 19:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vyktEdvAe9VLfpEYK8bHXFTLQvtFGJMdJOpZprBtLKs=;
        b=E/iWAky+EUIOHIHatF9XvXDZRgjTQJvhSz8TJfv5OrhZdRunBNsZXEaxc2fkecunnJ
         DpAogfWNtqCFeuJqd3U1md+MMR00MFYpJBUtYvo3DXclYFw3dkaLJTEwH2HAW4j/MH2C
         EJ0oMDDQLSAb7zSdT1dcq1wAfPYAoKk5TMsjIKgJZ3zsAGcjUViTrAtj2UBuYpzH0noH
         0zox9i8tP5MLwy7kAA0T2NrOJjthdOK3sqsuWRkAHjFw450yTx3xt4aic2JNQ/dTRmME
         nC06UE9BiNYGAHrOZ/oddaKNaJRTWsBlFpZFhs80mRvpIyNm7m8EQvhM+28ZsoFYEZ+S
         8NZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vyktEdvAe9VLfpEYK8bHXFTLQvtFGJMdJOpZprBtLKs=;
        b=C6UU0wc7MOfgpD4pX17v+X6lvgtZSTX+Pqe/II9qb05R16xGiBXeQm+gRXSJxEjK0x
         KOty5vwYGwUBnkRqjXqcEDlMcQjzKGf6mHlOMIKb2B+yZCfcsIqOyDC5fREiOCFat14b
         gzwkVIrzfU9WNJ9UEtWYqKP9X2f7vgO+ouo4gSxA4bZ8OoBKBFHyz3qdZJoRHPQBFmxh
         ji7cyDYtaqnTuVZVFV2AxhX2+jcoSs+YxlFcxWQkEzVPWADJhycBE88bjifHrOjDXkj5
         ppUxP+1pUhTv6SabgBS+SqyD0REn4dl74Uwh6jRNdDuNSYwq/mRVTlP19R4GME0URGKO
         NcMA==
X-Gm-Message-State: ANhLgQ20RQ3LnQnR6LEhRbRQ3HHFhTJiyC0pJV4hHG/mldfow3vC6iOt
	BD6LfXjxq46AUi/abm2Wz0Rk033vuT5V5GoopEQ=
X-Google-Smtp-Source: ADFU+vtwBhnJ4lQWbgFJG5Yz2tkUxH5RBUMecZfHrB8Lw7srpZ5XQ7WhSwXlk5CyVvLm2XB+6SFsQ9+4t/CjMmZDXxA=
X-Received: by 2002:a17:907:405b:: with SMTP id ns19mr18328362ejb.55.1585706629803;
 Tue, 31 Mar 2020 19:03:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200331235607.93023-1-paulburton@google.com> <CADkTA4NEN1PPVrm7N2HF+tVa4j2Tgv1_=YYFmQhbFscV5RSjWA@mail.gmail.com>
 <CADkTA4NQ4g1qOrbi1fdzmUq6Xk_8fm=QtNPpm7C+0U-oVpmU=w@mail.gmail.com>
In-Reply-To: <CADkTA4NQ4g1qOrbi1fdzmUq6Xk_8fm=QtNPpm7C+0U-oVpmU=w@mail.gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Wed, 1 Apr 2020 02:03:38 +0100
Message-ID: <CA+chaQcg5NS+DJ0be92Wz+EaozpomKg12fkFrmFFaJcr7RGdiA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel.bbclass: Stop creating empty .scmversion files
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: paulburton@google.com, Trevor Woerner <twoerner@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000006331b505a23118e1"

--0000000000006331b505a23118e1
Content-Type: text/plain; charset="UTF-8"

Another piece of this puzzle might also be that in 2012 I was still using
minimalistic gentoo chroot, which was shared across all builders as git
repository, so even when you were building some kernel from tarball it
might have incorrectly assume that the kernel repo is dirty (even when it
was the git repo in top level rootfs directory which was dirty).

But I agree that my commit message in:
https://git.openembedded.org/meta-openembedded/commit/?id=ef29620a796fc3004afaf998c875ad76c533652c

sucks considering that the ML archives were changed at least 2 times since
this commit.

On Wed, Apr 1, 2020 at 2:32 AM Bruce Ashfield <bruce.ashfield@gmail.com>
wrote:

> On Tue, Mar 31, 2020 at 9:29 PM Bruce Ashfield <bruce.ashfield@gmail.com>
> wrote:
> >
> > On Tue, Mar 31, 2020 at 7:56 PM Paul Burton via Lists.Openembedded.Org
> > <paulburton=google.com@lists.openembedded.org> wrote:
> > >
> > > The kernel_do_configure() function creates empty .scmversion files
> > > within both the source & build directories. The presence of these files
> > > causes the scm_version function within the kernel's
> > > scripts/setlocalversion to always output the empty string, breaking the
> > > kernel's CONFIG_LOCALVERSION_AUTO=y functionality which appends that
> > > string to the kernel version. Rather than appending the git commit hash
> > > or another SCM revision to the kernel version, the empty string is
> > > appended causing CONFIG_LOCALVERSION_AUTO to do nothing.
> > >
> > > This behavior was introduced for the build directory by commit
> > > c73e50a91e02 ("kernel.bbclass: fix extra + in kernelrelease") and
> > > extended to the source directory by commit cafb94f57123
> > > ("kernel.bbclass: touch .scmversion also in ${S}"). The motive isn't
> > > entirely clear since these commits contain no meaningful descriptions
> > > and the former links to a mailing list archive that is no longer
> online,
> > > but the '+' character referenced would be appended if the kernel were
> > > built from a dirty working tree. This in itself is useful information;
> > > hiding that fact can only serve to muddy a user's understanding of what
> > > kernel they're actually running. I have verified that building a kernel
> > > from a clean working tree does not result in a spurious '+' character.
> >
> > I have all the original email from 2011 on the topic, Martin probably
> does
> > as well.
>
> Also note that in 2017 Trevor Woerner tried exactly the same fix that
> you are doing, but ended up retracting it when he found a test case
> that was still adding a + to the version.
>
> see: [OE-core] [PATCH] meta/classes/kernel.bbclass: revert 56fe5300ab5
>
> It might be worth checking with Trevor to see if he recalls what case
> it was where the + snuck back in.
>
> Cheers,
>
> Bruce
>
> Bruce
>
> >
> > A snippet from the conversation is this, and it is about moving some
> kernel
> > build steps into oe-core from meta-oe:
> >
> > ------
> > "If you're working on shared linux.inc in meta-oe, could you please
> > integrate this:
> >
> > do_configure_prepend() {
> > #otherwise it gets extra '+' "2.6.37+"
> > #because:
> > #$ scripts/setlocalversion . => +
> > #$ make kernelversion => 2.6.37
> > #$ make kernelrelease => 2.6.37+
> >   rm -rf ${S}/.git
> > }
> >
> > I have to do this in every git recipe as I don't like dirs like
> > /lib/modules/2.6.37+
> >
> > Maybe it should be fixed on kernel.bbclass level, because linux-yocto
> > suffers the same ie /lib/modules/3.0.12-yocto-standard+
> >
> > Ccing oe-core for that.."
> > ------
> >
> > I didn't make any of the changes, but looking at the thread, if you
> aren't
> > getting a + added to the localversion or directories, then I can't see
> how
> > it would break anything.
> >
> > Cheers,
> >
> > Bruce
> >
> > >
> > > Remove the creation of the empty .scmversion files in order to restore
> > > the kernel's CONFIG_LOCALVERSION_AUTO functionality. This allows users
> > > of kernels built from non-tagged source & configured with
> > > CONFIG_LOCALVERSION_AUTO=y to better determine what kernel they're
> > > actually running.
> > >
> > > Signed-off-by: Paul Burton <paulburton@google.com>
> > > ---
> > >  meta/classes/kernel.bbclass | 6 ------
> > >  1 file changed, 6 deletions(-)
> > >
> > > diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> > > index a724645466..46e24a19e2 100644
> > > --- a/meta/classes/kernel.bbclass
> > > +++ b/meta/classes/kernel.bbclass
> > > @@ -521,12 +521,6 @@ check_oldest_kernel[vardepsexclude] +=
> "OLDEST_KERNEL KERNEL_VERSION"
> > >  do_configure[prefuncs] += "check_oldest_kernel"
> > >
> > >  kernel_do_configure() {
> > > -       # fixes extra + in /lib/modules/2.6.37+
> > > -       # $ scripts/setlocalversion . => +
> > > -       # $ make kernelversion => 2.6.37
> > > -       # $ make kernelrelease => 2.6.37+
> > > -       touch ${B}/.scmversion ${S}/.scmversion
> > > -
> > >         if [ "${S}" != "${B}" ] && [ -f "${S}/.config" ] && [ ! -f
> "${B}/.config" ]; then
> > >                 mv "${S}/.config" "${B}/.config"
> > >         fi
> > > --
> > > 2.26.0.rc2.310.g2932bb562d-goog
> > >
> > >
> >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
> 
>

--0000000000006331b505a23118e1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Another piece of this puzzle might also be that in 2012 I =
was still using minimalistic gentoo chroot, which was shared across all bui=
lders as git repository, so even when you were building some kernel from ta=
rball it might have incorrectly assume that the kernel repo is dirty (even =
when it was the git repo in top level rootfs directory which was dirty).<di=
v><br></div><div>But I agree that my commit message in:</div><div><a href=
=3D"https://git.openembedded.org/meta-openembedded/commit/?id=3Def29620a79=
6fc3004afaf998c875ad76c533652c">https://git.openembedded.org/meta-openembed=
ded/commit/?id=3Def29620a796fc3004afaf998c875ad76c533652c</a>=C2=A0</div><d=
iv>sucks considering that the ML archives were changed at least 2 times sin=
ce this commit.=C2=A0<br></div></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Wed, Apr 1, 2020 at 2:32 AM Bruce Ashfiel=
d &lt;<a href=3D"mailto:bruce.ashfield@gmail.com">bruce.ashfield@gmail.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">O=
n Tue, Mar 31, 2020 at 9:29 PM Bruce Ashfield &lt;<a href=3D"mailto:bruce.a=
shfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt; wrote=
:<br>
&gt;<br>
&gt; On Tue, Mar 31, 2020 at 7:56 PM Paul Burton via <a href=3D"http://Lis=
ts.Openembedded.Org" rel=3D"noreferrer" target=3D"_blank">Lists.Openembedde=
d.Org</a><br>
&gt; &lt;paulburton=3D<a href=3D"mailto:google.com@lists.openembedded.org"=
 target=3D"_blank">google.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; The kernel_do_configure() function creates empty .scmversion fil=
es<br>
&gt; &gt; within both the source &amp; build directories. The presence of =
these files<br>
&gt; &gt; causes the scm_version function within the kernel&#39;s<br>
&gt; &gt; scripts/setlocalversion to always output the empty string, break=
ing the<br>
&gt; &gt; kernel&#39;s CONFIG_LOCALVERSION_AUTO=3Dy functionality which ap=
pends that<br>
&gt; &gt; string to the kernel version. Rather than appending the git comm=
it hash<br>
&gt; &gt; or another SCM revision to the kernel version, the empty string =
is<br>
&gt; &gt; appended causing CONFIG_LOCALVERSION_AUTO to do nothing.<br>
&gt; &gt;<br>
&gt; &gt; This behavior was introduced for the build directory by commit<b=
r>
&gt; &gt; c73e50a91e02 (&quot;kernel.bbclass: fix extra + in kernelrelease=
&quot;) and<br>
&gt; &gt; extended to the source directory by commit cafb94f57123<br>
&gt; &gt; (&quot;kernel.bbclass: touch .scmversion also in ${S}&quot;). Th=
e motive isn&#39;t<br>
&gt; &gt; entirely clear since these commits contain no meaningful descrip=
tions<br>
&gt; &gt; and the former links to a mailing list archive that is no longer=
 online,<br>
&gt; &gt; but the &#39;+&#39; character referenced would be appended if th=
e kernel were<br>
&gt; &gt; built from a dirty working tree. This in itself is useful inform=
ation;<br>
&gt; &gt; hiding that fact can only serve to muddy a user&#39;s understand=
ing of what<br>
&gt; &gt; kernel they&#39;re actually running. I have verified that buildi=
ng a kernel<br>
&gt; &gt; from a clean working tree does not result in a spurious &#39;+&#=
39; character.<br>
&gt;<br>
&gt; I have all the original email from 2011 on the topic, Martin probably=
 does<br>
&gt; as well.<br>
<br>
Also note that in 2017 Trevor Woerner tried exactly the same fix that<br>
you are doing, but ended up retracting it when he found a test case<br>
that was still adding a + to the version.<br>
<br>
see: [OE-core] [PATCH] meta/classes/kernel.bbclass: revert 56fe5300ab5<br>
<br>
It might be worth checking with Trevor to see if he recalls what case<br>
it was where the + snuck back in.<br>
<br>
Cheers,<br>
<br>
Bruce<br>
<br>
Bruce<br>
<br>
&gt;<br>
&gt; A snippet from the conversation is this, and it is about moving some =
kernel<br>
&gt; build steps into oe-core from meta-oe:<br>
&gt;<br>
&gt; ------<br>
&gt; &quot;If you&#39;re working on shared linux.inc in meta-oe, could you=
 please<br>
&gt; integrate this:<br>
&gt;<br>
&gt; do_configure_prepend() {<br>
&gt; #otherwise it gets extra &#39;+&#39; &quot;2.6.37+&quot;<br>
&gt; #because:<br>
&gt; #$ scripts/setlocalversion . =3D&gt; +<br>
&gt; #$ make kernelversion =3D&gt; 2.6.37<br>
&gt; #$ make kernelrelease =3D&gt; 2.6.37+<br>
&gt;=C2=A0 =C2=A0rm -rf ${S}/.git<br>
&gt; }<br>
&gt;<br>
&gt; I have to do this in every git recipe as I don&#39;t like dirs like<b=
r>
&gt; /lib/modules/2.6.37+<br>
&gt;<br>
&gt; Maybe it should be fixed on kernel.bbclass level, because linux-yocto=
<br>
&gt; suffers the same ie /lib/modules/3.0.12-yocto-standard+<br>
&gt;<br>
&gt; Ccing oe-core for that..&quot;<br>
&gt; ------<br>
&gt;<br>
&gt; I didn&#39;t make any of the changes, but looking at the thread, if y=
ou aren&#39;t<br>
&gt; getting a + added to the localversion or directories, then I can&#39;=
t see how<br>
&gt; it would break anything.<br>
&gt;<br>
&gt; Cheers,<br>
&gt;<br>
&gt; Bruce<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt; Remove the creation of the empty .scmversion files in order to r=
estore<br>
&gt; &gt; the kernel&#39;s CONFIG_LOCALVERSION_AUTO functionality. This al=
lows users<br>
&gt; &gt; of kernels built from non-tagged source &amp; configured with<br=
>
&gt; &gt; CONFIG_LOCALVERSION_AUTO=3Dy to better determine what kernel the=
y&#39;re<br>
&gt; &gt; actually running.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Paul Burton &lt;<a href=3D"mailto:paulburton@goog=
le.com" target=3D"_blank">paulburton@google.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 meta/classes/kernel.bbclass | 6 ------<br>
&gt; &gt;=C2=A0 1 file changed, 6 deletions(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.b=
bclass<br>
&gt; &gt; index a724645466..46e24a19e2 100644<br>
&gt; &gt; --- a/meta/classes/kernel.bbclass<br>
&gt; &gt; +++ b/meta/classes/kernel.bbclass<br>
&gt; &gt; @@ -521,12 +521,6 @@ check_oldest_kernel[vardepsexclude] +=3D &q=
uot;OLDEST_KERNEL KERNEL_VERSION&quot;<br>
&gt; &gt;=C2=A0 do_configure[prefuncs] +=3D &quot;check_oldest_kernel&quot=
;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 kernel_do_configure() {<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0# fixes extra + in /lib/modules/2.6.=
37+<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0# $ scripts/setlocalversion . =3D&gt=
; +<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0# $ make kernelversion =3D&gt; 2.6.3=
7<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0# $ make kernelrelease =3D&gt; 2.6.3=
7+<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0touch ${B}/.scmversion ${S}/.scmvers=
ion<br>
&gt; &gt; -<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;${S}&quot; !=3D &quo=
t;${B}&quot; ] &amp;&amp; [ -f &quot;${S}/.config&quot; ] &amp;&amp; [ ! -f=
 &quot;${B}/.config&quot; ]; then<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mv =
&quot;${S}/.config&quot; &quot;${B}/.config&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; &gt; --<br>
&gt; &gt; 2.26.0.rc2.310.g2932bb562d-goog<br>
&gt; &gt;<br>
&gt; &gt; <br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; - Thou shalt not follow the NULL pointer, for chaos and madness await=
<br>
&gt; thee at its end<br>
&gt; - &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
<br>
<br>
<br>
--<br>
- Thou shalt not follow the NULL pointer, for chaos and madness await<br>
thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
<br>
</blockquote></div>

--0000000000006331b505a23118e1--
