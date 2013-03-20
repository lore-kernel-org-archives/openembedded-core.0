Received: from mail-la0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders.roxell@gmail.com>) id 1UIKgg-00055y-HT
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Mar 2013 16:12:25 +0100
Received: by mail-la0-f47.google.com with SMTP id fj20so3067979lab.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2013 07:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=4C1hobaOHrBTAdui2LaRHu0qQvnt15JUtMYGgO3rSZg=;
	b=l58fiAk3oNBpNm4PXrer/Duy0Qj200gaEmtQ5GSbD+kIfclavks/OZq89dXZetG/1b
	vzGnUDhg5vqeZ0psu1DurUqAFEvy+EHS5HHeEP9KABHnMXx9O6nQb/A1H8sR45/ebppS
	ajGZMmBA2A1o+QEBGTcIKFSDZhdAKM6pUQUbhV98GHwlVII70J7ZcIH8Rq8sFC+3tUcu
	XwXQeTxvJK36DMrN6axTP237AIZ6/pHsJ4w9q675Fj6A0LID9dARX2w3f9FX3xGnLGCY
	X7m6GGclLf4SF33TvHajSqDnQTuyj4fdME9xEQnMOYpIOw+4Wh8qDLRmVOcPzIJCc2Pm
	S9rA==
MIME-Version: 1.0
X-Received: by 10.112.58.232 with SMTP id u8mr9672650lbq.96.1363791331114;
	Wed, 20 Mar 2013 07:55:31 -0700 (PDT)
Received: by 10.114.98.66 with HTTP; Wed, 20 Mar 2013 07:55:30 -0700 (PDT)
In-Reply-To: <CADkTA4MZoRJp5gddPpkhKHkSXphettB=B4Fx=f0NPmtzfnGWGw@mail.gmail.com>
References: <1363785756-35510-1-git-send-email-anders.roxell@gmail.com>
	<CADkTA4MZoRJp5gddPpkhKHkSXphettB=B4Fx=f0NPmtzfnGWGw@mail.gmail.com>
Date: Wed, 20 Mar 2013 15:55:30 +0100
Message-ID: <CAEUf8FtQUc-pTOMb=yYtcjjUF7F=0ytN=OT-Y2Am71+v_oJGnA@mail.gmail.com>
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
X-List-Received-Date: Wed, 20 Mar 2013 15:12:25 -0000
Content-Type: multipart/alternative; boundary=e89a8f6474a7d6c54404d85c69da

--e89a8f6474a7d6c54404d85c69da
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Mar 20, 2013 at 2:42 PM, Bruce Ashfield <bruce.ashfield@gmail.com>wrote:

> On Wed, Mar 20, 2013 at 9:22 AM,  <anders.roxell@gmail.com> wrote:
> > From: Anders Roxell <anders.roxell@enea.com>
> >
> > In mainline kernel 3.7-rc1 (hash:abbf1590de22a6d22)
> > The path include/linux/version.h was updated to
> > include/generated/uapi/linux/version.h
>
> It's true that uapi now holds the generated version.h, but what build
> error were you seeing without this change in place ?


We were trying to build linx (
http://linx.sourceforge.net/linxdoc/doc/index.html)
Please let me know if it is better to rewrite linx or include this patch?

Regards,
Anders


> utsrelease.h is
> still created where it has been for some time, and should be what is
> typically used for any version checks.
>
> Cheers,
>
> Bruce
>
>
>
> >
> > Signed-off-by: Anders Roxell <anders.roxell@enea.com>
> > ---
> >  meta/classes/linux-kernel-base.bbclass |    3 +++
> >  1 files changed, 3 insertions(+), 0 deletions(-)
> >
> > diff --git a/meta/classes/linux-kernel-base.bbclass
> b/meta/classes/linux-kernel-base.bbclass
> > index 4f2b0a4..b7d0ffa 100644
> > --- a/meta/classes/linux-kernel-base.bbclass
> > +++ b/meta/classes/linux-kernel-base.bbclass
> > @@ -8,6 +8,9 @@ def get_kernelversion(p):
> >          fn = p + '/include/generated/utsrelease.h'
> >      if not os.path.isfile(fn):
> >          fn = p + '/include/linux/version.h'
> > +    if not os.path.isfile(fn):
> > +        # after 3.7-rc1
> > +        fn = p + '/include/generated/uapi/linux/version.h'
> >
> >      import re
> >      try:
> > --
> > 1.7.5.4
> >
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"
>

--e89a8f6474a7d6c54404d85c69da
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Wed, Mar 20, 2013 at 2:42 PM, Bruce Ashfield <span dir=3D"ltr">&=
lt;<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashf=
ield@gmail.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><div class=3D"im">On Wed, Mar 20, 2013 at 9:22 AM, =A0&lt;=
<a href=3D"mailto:anders.roxell@gmail.com">anders.roxell@gmail.com</a>&gt; =
wrote:<br>

&gt; From: Anders Roxell &lt;<a href=3D"mailto:anders.roxell@enea.com">ande=
rs.roxell@enea.com</a>&gt;<br>
&gt;<br>
&gt; In mainline kernel 3.7-rc1 (hash:abbf1590de22a6d22)<br>
&gt; The path include/linux/version.h was updated to<br>
&gt; include/generated/uapi/linux/version.h<br>
<br>
</div>It&#39;s true that uapi now holds the generated version.h, but what b=
uild<br>
error were you seeing without this change in place ?</blockquote><div><br><=
/div><div>We were trying to build linx (<a href=3D"http://linx.sourceforge.=
net/linxdoc/doc/index.html">http://linx.sourceforge.net/linxdoc/doc/index.h=
tml</a>)=A0</div>
<div>Please let me know if it is better to rewrite linx or include this pat=
ch?</div><div><br></div><div style>Regards,</div><div style>Anders</div><di=
v style>=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-l=
eft-style:solid;padding-left:1ex">
 utsrelease.h is<br>
still created where it has been for some time, and should be what is<br>
typically used for any version checks.<br>
<br>
Cheers,<br>
<br>
Bruce<br>
<div class=3D"im"><br>
<br>
<br>
&gt;<br>
&gt; Signed-off-by: Anders Roxell &lt;<a href=3D"mailto:anders.roxell@enea.=
com">anders.roxell@enea.com</a>&gt;<br>
&gt; ---<br>
&gt; =A0meta/classes/linux-kernel-base.bbclass | =A0 =A03 +++<br>
&gt; =A01 files changed, 3 insertions(+), 0 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/classes/linux-kernel-base.bbclass b/meta/classes/lin=
ux-kernel-base.bbclass<br>
&gt; index 4f2b0a4..b7d0ffa 100644<br>
&gt; --- a/meta/classes/linux-kernel-base.bbclass<br>
&gt; +++ b/meta/classes/linux-kernel-base.bbclass<br>
&gt; @@ -8,6 +8,9 @@ def get_kernelversion(p):<br>
&gt; =A0 =A0 =A0 =A0 =A0fn =3D p + &#39;/include/generated/utsrelease.h&#39=
;<br>
&gt; =A0 =A0 =A0if not os.path.isfile(fn):<br>
&gt; =A0 =A0 =A0 =A0 =A0fn =3D p + &#39;/include/linux/version.h&#39;<br>
&gt; + =A0 =A0if not os.path.isfile(fn):<br>
&gt; + =A0 =A0 =A0 =A0# after 3.7-rc1<br>
&gt; + =A0 =A0 =A0 =A0fn =3D p + &#39;/include/generated/uapi/linux/version=
.h&#39;<br>
&gt;<br>
&gt; =A0 =A0 =A0import re<br>
&gt; =A0 =A0 =A0try:<br>
&gt; --<br>
&gt; 1.7.5.4<br>
&gt;<br>
&gt;<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openemb=
edded-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/li=
stinfo/openembedded-core</a><br>
<br>
<br>
<br>
</div>--<br>
&quot;Thou shalt not follow the NULL pointer, for chaos and madness await<b=
r>
thee at its end&quot;<br>
</blockquote></div><br></div></div>

--e89a8f6474a7d6c54404d85c69da--
