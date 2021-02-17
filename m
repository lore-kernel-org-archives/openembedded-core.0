Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web09.10582.1613580914733508982
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Feb 2021 08:55:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=deMkN6Ea;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: idadelm@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id v9so12995950edw.8
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Feb 2021 08:55:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WZoC/zAiO+/BcPmYaQ8SmFULi2w+9U0ereYx3BWB3io=;
        b=deMkN6EaBbgqjlcl/Drmg/e3G6dphJeQvW4gRq2+ikXwk5WVvheROJT9F0R2V4aPKO
         k/kqh18LA/YblMX7HDeQWZ+Ih/HS923kdH3wOEFQ6becHDpMdZtD54V3W/j1Kv0OQxTs
         n6MCNemj8Y+kW9fzdshuf7/5qYYF8zzecyBn62sCc9HQK5AHHzvzXUUWyXSBbX2jkUia
         PEJ5FFxKlsM7N8X5zYdkVGjsHfqjU6p0ShNx9ax36VTUYexBQqHg6RQj3iT1XA3ZMtla
         oJ0oeVQ/B4T/FmG0jTy2yM5uS7gpGPyXrp2A+ElPQdP7JeRaVcvv3j4UwvgtWrcrivM1
         X6bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WZoC/zAiO+/BcPmYaQ8SmFULi2w+9U0ereYx3BWB3io=;
        b=fURU8WQ848eYq4Iti3kPxR4JuP8bhZMo/bhNsPXyR9ilnpAiRWtKZZ0YpZsTznCOIr
         +4fvCWfNgjw0aRxVAgmuSHXhYCZELUrLzVNPmXbK9BGgfhWgEK2YhoObx4MAeOBIBuc/
         JsbYMgFYFcbMWD+Ooh7j0XaJ8/WOIoFm46lYpIuQtjsJjxlrqOC5sY9R/CGcjHPrdNgW
         NTSYwBRhZezko5TwfjoOT7QJge+NJRCRRt/gntj5Ur7310jhqqo74bDJU4+kq3F91IQo
         5V8wrPu2Twao4yh07LIGWpDomr89CqA1I2AZUG3XM0Gge4IgUTub3HkrFSM/x80LfHYc
         U61w==
X-Gm-Message-State: AOAM533VooVXTvDCIFnZ3VarYSnl1KU50CVM1oK3Qh7+W3LrlMwAkMKz
	1KgwQfi+JTCErgURTtgGERgCikTu+Zs7X+AwTqQ=
X-Google-Smtp-Source: ABdhPJyeGmu3NMWt3BbvQZ6q6noB//ypky2eLUBxSvG6sCwRUzLDCUG/q5pHbaUByoW/zamKhnDcN4WyLM33Ad7V9Nc=
X-Received: by 2002:aa7:c0da:: with SMTP id j26mr27196315edp.253.1613580913173;
 Wed, 17 Feb 2021 08:55:13 -0800 (PST)
MIME-Version: 1.0
References: <20210217040033.21541-1-idadelm@gmail.com> <20210217040033.21541-5-idadelm@gmail.com>
 <2efffee96fae455b8cdb77d47c576bfe@XBOX03.axis.com> <06102c024bfec00745d9b2dbde8b19a7fb4207b8.camel@linuxfoundation.org>
In-Reply-To: <06102c024bfec00745d9b2dbde8b19a7fb4207b8.camel@linuxfoundation.org>
From: "Meh Mbeh Ida Delphine" <idadelm@gmail.com>
Date: Wed, 17 Feb 2021 17:55:01 +0100
Message-ID: <CAN7sTgsoLjsnao0ijuidAP_hjTQyibeU7MWHXybbROTU0k290g@mail.gmail.com>
Subject: Re: [OE-core] [poky-contrib][RFC PATCH 4/5] license.bbclass: Add functions to split and canonicalise license strings
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000025676005bb8b15e6"

--00000000000025676005bb8b15e6
Content-Type: text/plain; charset="UTF-8"

Thanks for the feedback. I will get rid of the logic to take care of those
licenses with "or-later" and move the functions to license.py. Does this
also mean I shouldn't try removing "WITH-Linux-syscall-note" from the
licences? The point of me doing that was for there to be more matches and
the number of warnings reduced.

Also there is more license-related logic in package.bbclass. Will it be
okay if I move it as well to meta/lib/oe/license.py putting it in functions?

Cheers,
Ida.

On Wed, Feb 17, 2021 at 5:36 PM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Wed, 2021-02-17 at 15:04 +0000, Peter Kjellerstedt wrote:
> > > -----Original Message-----
> > > From: openembedded-core@lists.openembedded.org <openembedded-
> > > core@lists.openembedded.org> On Behalf Of Meh Mbeh Ida Delphine
> > > Sent: den 17 februari 2021 05:01
> > > To: openembedded-core@lists.openembedded.org
> > > Subject: [OE-core] [poky-contrib][RFC PATCH 4/5] license.bbclass: Add
> > > functions to split and canonicalise license strings
> > >
> > > These functions that will later be used in package.bbclass simply make
> the
> > > source and recipe licenses in the same format so that they can easily
> be
> > > compared and the ouput warnings filtered accordingly.
> > > split_spdx_lic() splits the license strings and returns a set of the
> > > canonicalised licenses.
> > > rem_false_lics() does two things:
> > > - Converts '-or-later' licenses to their canonicalised form
> > > - Gets rid of "WITH Linux-syscall-note" from license string if
> specified
> > > in local.conf
> > >
> > > Signed-off-by: Ida Delphine <idadelm@gmail.com>
> > > ---
> > >  meta/classes/license.bbclass | 27 +++++++++++++++++++++++++++
> > >  1 file changed, 27 insertions(+)
> > >
> > > diff --git a/meta/classes/license.bbclass
> b/meta/classes/license.bbclass
> > > index dc91118340..576464cb26 100644
> > > --- a/meta/classes/license.bbclass
> > > +++ b/meta/classes/license.bbclass
> > > @@ -435,3 +435,30 @@ python do_populate_lic_setscene () {
> > >      sstate_setscene(d)
> > >  }
> > >  addtask do_populate_lic_setscene
> > > +
> > > +
> > > +def split_spdx_lic(d, licensestr):
> > > +    """
> > > +    Split the license strings and returns a set of the
> > > +    canonicalised licenses.
> > > +    """
> > > +    import oe.license
> > > +    split_lic = oe.license.list_licenses(licensestr)
> > > +    spdx_lic = set([canonical_license(d, l) for l in split_lic])
> > > +    return spdx_lic
> > > +
> > > +def rem_false_lics(d, pkglic):
> > > +    pkglicsperpkg = set([])
> > > +    for l in pkglic:
> > > +        if l.endswith('-or-later'):
> > > +            # Converts '-or-later' licenses to their canonicalised
> form
> > > +            lic_ = l.replace('-or-later', '+')
> >
> > Given that licenses such as "GPL-2.0+" are deprecated by SPDX, shouldn't
> we
> > instead introduce the canonical "GPL-2.0-only" and "GPL-2.0-or-later"?
> > And then add mappings for, e.g., "GPL-2.0" to "GPL-2.0-only" and
> "GPL-2.0+"
> > to "GPL-2.0-or-later".
>
> Something like:
>
> http://git.yoctoproject.org/cgit.cgi/poky/commit/?h=master-next&id=1c2ce4565bc85915ab970e42bf7af3a78ec2dd6a
> ?
>
> :)
>
> > > +            pkglicsperpkg.add(lic_)
> > > +        elif l.endswith(' WITH Linux-syscall-note'):
> > > +        # Gets rid of "WITH Linux-syscall-note from license sring"
> > > +            if d.getVar("LICENSE_WITH_LINUX_SYS") == "1":
> > > +                lic_ = l.replace(' WITH Linux-syscall-note', '')
> >
> > Looking at https://spdx.org/licenses/exceptions-index.html, there is a
> long
> > list of predefined exceptions and "Linux-syscall-note" is just one of
> them.
> > We probably want a more generic solution for how to handle exceptions.
>
> Agreed, I was trying to make that point in one of my replies!
>
> Cheers,
>
> Richard
> >
>
>

--00000000000025676005bb8b15e6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks for the feedback. I will get rid of the logic =
to take care of those licenses with &quot;or-later&quot; and move the funct=
ions to license.py. Does this also mean I shouldn&#39;t try removing &quot;=
WITH-Linux-syscall-note&quot; from the licences? The point of me doing that=
 was for there to be more matches and the number of warnings reduced.</div>=
<div><br></div><div>Also there is more license-related logic in package.bbc=
lass. Will it be okay if I move it as well to meta/lib/oe/license.py puttin=
g it in functions?<br></div><div><br></div><div>Cheers,</div><div>Ida.<br><=
/div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Wed, Feb 17, 2021 at 5:36 PM Richard Purdie &lt;<a href=3D"mailto:r=
ichard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed=
, 2021-02-17 at 15:04 +0000, Peter Kjellerstedt wrote:<br>
&gt; &gt; -----Original Message-----<br>
&gt; &gt; From: <a href=3D"mailto:openembedded-core@lists.openembedded.org"=
 target=3D"_blank">openembedded-core@lists.openembedded.org</a> &lt;openemb=
edded-<br>
&gt; &gt; <a href=3D"mailto:core@lists.openembedded.org" target=3D"_blank">=
core@lists.openembedded.org</a>&gt; On Behalf Of Meh Mbeh Ida Delphine<br>
&gt; &gt; Sent: den 17 februari 2021 05:01<br>
&gt; &gt; To: <a href=3D"mailto:openembedded-core@lists.openembedded.org" t=
arget=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
&gt; &gt; Subject: [OE-core] [poky-contrib][RFC PATCH 4/5] license.bbclass:=
 Add<br>
&gt; &gt; functions to split and canonicalise license strings<br>
&gt; &gt; <br>
&gt; &gt; These functions that will later be used in package.bbclass simply=
 make the<br>
&gt; &gt; source and recipe licenses in the same format so that they can ea=
sily be<br>
&gt; &gt; compared and the ouput warnings filtered accordingly.<br>
&gt; &gt; split_spdx_lic() splits the license strings and returns a set of =
the<br>
&gt; &gt; canonicalised licenses.<br>
&gt; &gt; rem_false_lics() does two things:<br>
&gt; &gt; - Converts &#39;-or-later&#39; licenses to their canonicalised fo=
rm<br>
&gt; &gt; - Gets rid of &quot;WITH Linux-syscall-note&quot; from license st=
ring if specified<br>
&gt; &gt; in local.conf<br>
&gt; &gt; <br>
&gt; &gt; Signed-off-by: Ida Delphine &lt;<a href=3D"mailto:idadelm@gmail.c=
om" target=3D"_blank">idadelm@gmail.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt; =C2=A0meta/classes/license.bbclass | 27 +++++++++++++++++++++++++=
++<br>
&gt; &gt; =C2=A01 file changed, 27 insertions(+)<br>
&gt; &gt; <br>
&gt; &gt; diff --git a/meta/classes/license.bbclass b/meta/classes/license.=
bbclass<br>
&gt; &gt; index dc91118340..576464cb26 100644<br>
&gt; &gt; --- a/meta/classes/license.bbclass<br>
&gt; &gt; +++ b/meta/classes/license.bbclass<br>
&gt; &gt; @@ -435,3 +435,30 @@ python do_populate_lic_setscene () {<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0sstate_setscene(d)<br>
&gt; &gt; =C2=A0}<br>
&gt; &gt; =C2=A0addtask do_populate_lic_setscene<br>
&gt; &gt; +<br>
&gt; &gt; +<br>
&gt; &gt; +def split_spdx_lic(d, licensestr):<br>
&gt; &gt; +=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 Split the license strings and returns a set of the=
<br>
&gt; &gt; +=C2=A0 =C2=A0 canonicalised licenses.<br>
&gt; &gt; +=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 import oe.license<br>
&gt; &gt; +=C2=A0 =C2=A0 split_lic =3D oe.license.list_licenses(licensestr)=
<br>
&gt; &gt; +=C2=A0 =C2=A0 spdx_lic =3D set([canonical_license(d, l) for l in=
 split_lic])<br>
&gt; &gt; +=C2=A0 =C2=A0 return spdx_lic<br>
&gt; &gt; +<br>
&gt; &gt; +def rem_false_lics(d, pkglic):<br>
&gt; &gt; +=C2=A0 =C2=A0 pkglicsperpkg =3D set([])<br>
&gt; &gt; +=C2=A0 =C2=A0 for l in pkglic:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if l.endswith(&#39;-or-later&#39;):<=
br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Converts &#39;-or-la=
ter&#39; licenses to their canonicalised form<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lic_ =3D l.replace(&#3=
9;-or-later&#39;, &#39;+&#39;)<br>
&gt; <br>
&gt; Given that licenses such as &quot;GPL-2.0+&quot; are deprecated by SPD=
X, shouldn&#39;t we <br>
&gt; instead introduce the canonical &quot;GPL-2.0-only&quot; and &quot;GPL=
-2.0-or-later&quot;?<br>
&gt; And then add mappings for, e.g., &quot;GPL-2.0&quot; to &quot;GPL-2.0-=
only&quot; and &quot;GPL-2.0+&quot; <br>
&gt; to &quot;GPL-2.0-or-later&quot;.<br>
<br>
Something like:<br>
<a href=3D"http://git.yoctoproject.org/cgit.cgi/poky/commit/?h=3Dmaster-nex=
t&amp;id=3D1c2ce4565bc85915ab970e42bf7af3a78ec2dd6a" rel=3D"noreferrer" tar=
get=3D"_blank">http://git.yoctoproject.org/cgit.cgi/poky/commit/?h=3Dmaster=
-next&amp;id=3D1c2ce4565bc85915ab970e42bf7af3a78ec2dd6a</a><br>
?<br>
<br>
:)<br>
<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pkglicsperpkg.add(lic_=
)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 elif l.endswith(&#39; WITH Linux-sys=
call-note&#39;):<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Gets rid of &quot;WITH Linux-sysca=
ll-note from license sring&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if d.getVar(&quot;LICE=
NSE_WITH_LINUX_SYS&quot;) =3D=3D &quot;1&quot;:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lic_ =3D=
 l.replace(&#39; WITH Linux-syscall-note&#39;, &#39;&#39;)<br>
&gt; <br>
&gt; Looking at <a href=3D"https://spdx.org/licenses/exceptions-index.html"=
 rel=3D"noreferrer" target=3D"_blank">https://spdx.org/licenses/exceptions-=
index.html</a>, there is a long <br>
&gt; list of predefined exceptions and &quot;Linux-syscall-note&quot; is ju=
st one of them. <br>
&gt; We probably want a more generic solution for how to handle exceptions.=
<br>
<br>
Agreed, I was trying to make that point in one of my replies!<br>
<br>
Cheers,<br>
<br>
Richard<br>
&gt; <br>
<br>
</blockquote></div>

--00000000000025676005bb8b15e6--
