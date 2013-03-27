Received: from mail-la0-f49.google.com ([209.85.215.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders.roxell@gmail.com>) id 1UKmsJ-0002Hp-S2
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Mar 2013 10:42:37 +0100
Received: by mail-la0-f49.google.com with SMTP id fs13so14937972lab.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2013 02:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=YSzokFEPNvny5Ypn3+igxZNuCG8RNsxLFhkKm+CNn7M=;
	b=0r9JiegO2q8SDY2jLOGSEr/vm2xBwBa29jfmQc2CW2e6w0/qYP1F+46wa2FftTLuDg
	9DxxLJxTg46VV+XivTri82Szj7nCLHo7dbH+jpGCxWEhdhWdmj3GUrGjUSiPnwekz8nx
	1L7gcfiA478Mj2yv89OVxMyNJe2UN81ABdzJ8Yzjd4v++rV8WIgfd7d6CbWI1KYgLs+N
	8Qh2wholLIV1MOn5JIXZm8OrzyVhoVsUSs+TAbg/yY0ll2+oIAzOsN/q/qq8eHPV1G3w
	DuJdwwLdeN8UxcEuZw3l+V5Ou+BcerymxfozZ4h62m4T4PHoZMIo/4OfQjflqboklGxK
	Z4Eg==
MIME-Version: 1.0
X-Received: by 10.112.139.130 with SMTP id qy2mr7202517lbb.34.1364376330609;
	Wed, 27 Mar 2013 02:25:30 -0700 (PDT)
Received: by 10.114.98.66 with HTTP; Wed, 27 Mar 2013 02:25:30 -0700 (PDT)
In-Reply-To: <CADkTA4NitxAbPH-Nb=67ZwboTBFPUCMNXTQLMCYzQ2dL_On8hQ@mail.gmail.com>
References: <1363785756-35510-1-git-send-email-anders.roxell@gmail.com>
	<CADkTA4MZoRJp5gddPpkhKHkSXphettB=B4Fx=f0NPmtzfnGWGw@mail.gmail.com>
	<CAEUf8FtQUc-pTOMb=yYtcjjUF7F=0ytN=OT-Y2Am71+v_oJGnA@mail.gmail.com>
	<CADkTA4NitxAbPH-Nb=67ZwboTBFPUCMNXTQLMCYzQ2dL_On8hQ@mail.gmail.com>
Date: Wed, 27 Mar 2013 10:25:30 +0100
Message-ID: <CAEUf8FusP9QunJeVc-T81o4V_XT8kGkqtactZDC0+wqD04JFGg@mail.gmail.com>
From: Anders Roxell <anders.roxell@gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Anders Roxell <anders.roxell@enea.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-kernel-base: linux/version.h path update for 3.7-rc1
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Mar 2013 09:42:38 -0000
Content-Type: multipart/alternative; boundary=001a11c34b4e86ac1404d8e49ee0

--001a11c34b4e86ac1404d8e49ee0
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Mar 20, 2013 at 4:30 PM, Bruce Ashfield <bruce.ashfield@gmail.com>wrote:

> On Wed, Mar 20, 2013 at 10:55 AM, Anders Roxell <anders.roxell@gmail.com>
> wrote:
> >
> >
> >
> > On Wed, Mar 20, 2013 at 2:42 PM, Bruce Ashfield <
> bruce.ashfield@gmail.com>
> > wrote:
> >>
> >> On Wed, Mar 20, 2013 at 9:22 AM,  <anders.roxell@gmail.com> wrote:
> >> > From: Anders Roxell <anders.roxell@enea.com>
> >> >
> >> > In mainline kernel 3.7-rc1 (hash:abbf1590de22a6d22)
> >> > The path include/linux/version.h was updated to
> >> > include/generated/uapi/linux/version.h
> >>
> >> It's true that uapi now holds the generated version.h, but what build
> >> error were you seeing without this change in place ?
> >
> >
> > We were trying to build linx
> > (http://linx.sourceforge.net/linxdoc/doc/index.html)
> > Please let me know if it is better to rewrite linx or include this patch?
>
> My concern is that as a list of alternatives builds up over time, that
> don't
> necessarily use the same format of the linux version, you'll end up with
> applications that are making the wrong decisions if a fallback is used.
> Having
> a clear public / exported file, and throwing errors if it doesn't exist
> would
> ensure consistent behaviour (granted annoying if you get the error when you
> think you shouldn't).
>
> If you look at the code in get_kernelversion() it shouldn't even work if
> version.h is used versus utsrelease.h.  I'd be inclined to suggest the
> removal of the existing version.h fallback, versus adding another.
>
> You might not even need to modify the application code to fix this. What
> are the dependencies of your recipe that would allow for utsrelease.h
> to not be generated when the build calls get_kernelversion ?
>
>
Sorry for the late response!
I agree with you that its better to use utsrelease.h rather than depending
on version.h.

We have added a patch for the linx source to solve this.

Thank you very much for the help and support!

With kind regards,
Anders


> Cheers,
>
> Bruce
>
> >
> > Regards,
> > Anders
> >
> >>
> >> utsrelease.h is
> >> still created where it has been for some time, and should be what is
> >> typically used for any version checks.
> >>
> >> Cheers,
> >>
> >> Bruce
> >>
> >>
> >>
> >> >
> >> > Signed-off-by: Anders Roxell <anders.roxell@enea.com>
> >> > ---
> >> >  meta/classes/linux-kernel-base.bbclass |    3 +++
> >> >  1 files changed, 3 insertions(+), 0 deletions(-)
> >> >
> >> > diff --git a/meta/classes/linux-kernel-base.bbclass
> >> > b/meta/classes/linux-kernel-base.bbclass
> >> > index 4f2b0a4..b7d0ffa 100644
> >> > --- a/meta/classes/linux-kernel-base.bbclass
> >> > +++ b/meta/classes/linux-kernel-base.bbclass
> >> > @@ -8,6 +8,9 @@ def get_kernelversion(p):
> >> >          fn = p + '/include/generated/utsrelease.h'
> >> >      if not os.path.isfile(fn):
> >> >          fn = p + '/include/linux/version.h'
> >> > +    if not os.path.isfile(fn):
> >> > +        # after 3.7-rc1
> >> > +        fn = p + '/include/generated/uapi/linux/version.h'
> >> >
> >> >      import re
> >> >      try:
> >> > --
> >> > 1.7.5.4
> >> >
> >> >
> >> > _______________________________________________
> >> > Openembedded-core mailing list
> >> > Openembedded-core@lists.openembedded.org
> >> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> >>
> >>
> >>
> >> --
> >> "Thou shalt not follow the NULL pointer, for chaos and madness await
> >> thee at its end"
> >
> >
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"
>

--001a11c34b4e86ac1404d8e49ee0
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra">On Wed, Mar 20, 2013 at 4:3=
0 PM, Bruce Ashfield <span dir=3D"ltr">&lt;<a href=3D"mailto:bruce.ashfield=
@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;</span> wrote=
:<br><div class=3D"gmail_quote">
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On Wed, Mar 20, 2013 at 10=
:55 AM, Anders Roxell &lt;<a href=3D"mailto:anders.roxell@gmail.com">anders=
.roxell@gmail.com</a>&gt; wrote:<br>

&gt;<br>
&gt;<br>
&gt;<br>
&gt; On Wed, Mar 20, 2013 at 2:42 PM, Bruce Ashfield &lt;<a href=3D"mailto:=
bruce.ashfield@gmail.com">bruce.ashfield@gmail.com</a>&gt;<br>
&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On Wed, Mar 20, 2013 at 9:22 AM, =A0&lt;<a href=3D"mailto:anders.r=
oxell@gmail.com">anders.roxell@gmail.com</a>&gt; wrote:<br>
&gt;&gt; &gt; From: Anders Roxell &lt;<a href=3D"mailto:anders.roxell@enea.=
com">anders.roxell@enea.com</a>&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; In mainline kernel 3.7-rc1 (hash:abbf1590de22a6d22)<br>
&gt;&gt; &gt; The path include/linux/version.h was updated to<br>
&gt;&gt; &gt; include/generated/uapi/linux/version.h<br>
&gt;&gt;<br>
&gt;&gt; It&#39;s true that uapi now holds the generated version.h, but wha=
t build<br>
&gt;&gt; error were you seeing without this change in place ?<br>
&gt;<br>
&gt;<br>
&gt; We were trying to build linx<br>
&gt; (<a href=3D"http://linx.sourceforge.net/linxdoc/doc/index.html" target=
=3D"_blank">http://linx.sourceforge.net/linxdoc/doc/index.html</a>)<br>
&gt; Please let me know if it is better to rewrite linx or include this pat=
ch?<br>
<br>
</div>My concern is that as a list of alternatives builds up over time, tha=
t don&#39;t<br>
necessarily use the same format of the linux version, you&#39;ll end up wit=
h<br>
applications that are making the wrong decisions if a fallback is used. Hav=
ing<br>
a clear public / exported file, and throwing errors if it doesn&#39;t exist=
 would<br>
ensure consistent behaviour (granted annoying if you get the error when you=
<br>
think you shouldn&#39;t).<br>
<br>
If you look at the code in get_kernelversion() it shouldn&#39;t even work i=
f<br>
version.h is used versus utsrelease.h. =A0I&#39;d be inclined to suggest th=
e<br>
removal of the existing version.h fallback, versus adding another.<br>
<br>
You might not even need to modify the application code to fix this. What<br=
>
are the dependencies of your recipe that would allow for utsrelease.h<br>
to not be generated when the build calls get_kernelversion ?<br>
<br></blockquote><div style><br></div><div style>Sorry for the late respons=
e!</div><div style>I agree with you that its better to use utsrelease.h rat=
her than depending on version.h.</div><div style><br></div><div style>
We have added a patch for the linx source to solve this.</div><div style><b=
r></div><div style>Thank you very much for the help and support!</div><div =
style><br></div><div style>With kind regards,</div><div style>Anders</div>
<div style>=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
Cheers,<br>
<br>
Bruce<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt;<br>
&gt; Regards,<br>
&gt; Anders<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; utsrelease.h is<br>
&gt;&gt; still created where it has been for some time, and should be what =
is<br>
&gt;&gt; typically used for any version checks.<br>
&gt;&gt;<br>
&gt;&gt; Cheers,<br>
&gt;&gt;<br>
&gt;&gt; Bruce<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Signed-off-by: Anders Roxell &lt;<a href=3D"mailto:anders.rox=
ell@enea.com">anders.roxell@enea.com</a>&gt;<br>
&gt;&gt; &gt; ---<br>
&gt;&gt; &gt; =A0meta/classes/linux-kernel-base.bbclass | =A0 =A03 +++<br>
&gt;&gt; &gt; =A01 files changed, 3 insertions(+), 0 deletions(-)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; diff --git a/meta/classes/linux-kernel-base.bbclass<br>
&gt;&gt; &gt; b/meta/classes/linux-kernel-base.bbclass<br>
&gt;&gt; &gt; index 4f2b0a4..b7d0ffa 100644<br>
&gt;&gt; &gt; --- a/meta/classes/linux-kernel-base.bbclass<br>
&gt;&gt; &gt; +++ b/meta/classes/linux-kernel-base.bbclass<br>
&gt;&gt; &gt; @@ -8,6 +8,9 @@ def get_kernelversion(p):<br>
&gt;&gt; &gt; =A0 =A0 =A0 =A0 =A0fn =3D p + &#39;/include/generated/utsrele=
ase.h&#39;<br>
&gt;&gt; &gt; =A0 =A0 =A0if not os.path.isfile(fn):<br>
&gt;&gt; &gt; =A0 =A0 =A0 =A0 =A0fn =3D p + &#39;/include/linux/version.h&#=
39;<br>
&gt;&gt; &gt; + =A0 =A0if not os.path.isfile(fn):<br>
&gt;&gt; &gt; + =A0 =A0 =A0 =A0# after 3.7-rc1<br>
&gt;&gt; &gt; + =A0 =A0 =A0 =A0fn =3D p + &#39;/include/generated/uapi/linu=
x/version.h&#39;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; =A0 =A0 =A0import re<br>
&gt;&gt; &gt; =A0 =A0 =A0try:<br>
&gt;&gt; &gt; --<br>
&gt;&gt; &gt; 1.7.5.4<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; _______________________________________________<br>
&gt;&gt; &gt; Openembedded-core mailing list<br>
&gt;&gt; &gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">O=
penembedded-core@lists.openembedded.org</a><br>
&gt;&gt; &gt; <a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/m=
ailman/listinfo/openembedded-core</a><br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; &quot;Thou shalt not follow the NULL pointer, for chaos and madnes=
s await<br>
&gt;&gt; thee at its end&quot;<br>
&gt;<br>
&gt;<br>
<br>
<br>
<br>
--<br>
&quot;Thou shalt not follow the NULL pointer, for chaos and madness await<b=
r>
thee at its end&quot;<br>
</div></div></blockquote></div><br></div></div>

--001a11c34b4e86ac1404d8e49ee0--
