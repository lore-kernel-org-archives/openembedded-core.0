Return-Path: <kergoth@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3443C4708C
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:53 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web12.3685.1649882457250640895
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 13:40:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=coHjlJhu;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: kergoth@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id ks6so6368015ejb.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 13:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GakNSzNmlkcAaDgqqNLB3LdrqzHv8JORJroRPRNxyYE=;
        b=coHjlJhu85EbaXoX98jP1SdQtrOaIntLAHcZqhU7F0Fq1VLLhZxT+OXlF80xZ3kPGc
         4+TvwYojWtkdZ15j7RrEbuwlMB+TK40ThP1H4SVNo5UK+zwSwtxXOxTo+ImINytB8lQd
         r1IxER72BXJDbJqyJlxId4s5tQ0XF8b+/mCuCFnNn2t3gaqK9woptnrOmmlb3Uslat+V
         zBwMjlu+M3ur6YnpSArlyarcb5VZg0MRoOaSsnbtYNl71u7aWk+qQHQC9/0PLN5VQ4VZ
         AOoUUEFliPlirhLmQ2ktssFHuVDmEgerL/+cofAlNeNV3hzEdcL0Tt+ePbFITbxl9JH0
         pKDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GakNSzNmlkcAaDgqqNLB3LdrqzHv8JORJroRPRNxyYE=;
        b=efR9PZzxTvXGpAubU8NkcO8rV0MjSMRjiwuUoptxf5U4sPUCZglt0iPB93tF3wFqHW
         w9DJ2N6lnoO06gzghtoCTGgiFN4XWmmHdTowPBSjPsLalfX2zmQrPA8mL6s4QBIQgEw9
         X7lu4+Ym70kyJfP0mOxwl2bKhdc+2XX4tmEJMA2+ismQX/8dy+HzbdO5gDvSnnTYIt+W
         RR5itz1MXT4dHWN2NV5HSEgajiTI89oQgdhRVXltYy8JQOzdzJOqTzmRsWUkGNjgtGFu
         9JJBxDB0AAlB+rq51Y+PgQL6aJm4vPd1FxYTqD8Tj4ZHbcd4U3vekcv6VNvoqTeK+eqf
         wEww==
X-Gm-Message-State: AOAM532ICS68ecXdLCAoxxV6Bz/tms42BR8SGwx2r1lMIBQLiHid/Ueo
	Z1u6phJT+7zPnMm5hT6e8vR0AAZge6myNbdXK6M=
X-Google-Smtp-Source: 
 ABdhPJyrnYEFkoSLEypC2qFbclgTcNyJW38XDPZQsBXav2OHBLMWYtoQm0g9iq07kc6YwJX3N/TBheVzFQDtCqsOY8k=
X-Received: by 2002:a17:907:7f94:b0:6da:64ec:fabc with SMTP id
 qk20-20020a1709077f9400b006da64ecfabcmr40736808ejc.717.1649882455481; Wed, 13
 Apr 2022 13:40:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220413160033.8456-1-kergoth@gmail.com>
 <8c3060148a98b280c93b7eb5da65699f1c6745aa.camel@linuxfoundation.org>
 <68938ba5b4034939b472e0c9977bf507@axis.com>
In-Reply-To: <68938ba5b4034939b472e0c9977bf507@axis.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Wed, 13 Apr 2022 13:40:44 -0700
Message-ID: 
 <CABcZANnAYtsxdGFszZ7vjY17udfsSOKRkmBXkNpxpRt7nQigZA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] license: add 'any_incompatible' function
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000ae224d05dc8f31fb"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Apr 2022 16:03:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164369

--000000000000ae224d05dc8f31fb
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 13, 2022 at 1:35 PM Peter Kjellerstedt <
peter.kjellerstedt@axis.com> wrote:

> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <
> openembedded-core@lists.openembedded.org> On Behalf Of Richard Purdie
> > Sent: den 13 april 2022 19:45
> > To: Christopher Larson <kergoth@gmail.com>;
> openembedded-core@lists.openembedded.org
> > Cc: Christopher Larson <chris_larson@mentor.com>
> > Subject: Re: [OE-core] [PATCH v2] license: add 'any_incompatible'
> function
> >
> > On Wed, 2022-04-13 at 16:00 +0000, Christopher Larson wrote:
> > > This function returns True if any of the specified packages are
> skipped due to
> > > incompatible license.
> > >
> > > License exceptions are obeyed. The user may specify the package's
> license for
> > > cross-recipe checks.
> > >
> > > This allows for additions to packagegroups only for non-incompatible
> builds. For
> > > example:
> > >
> > >     RDEPENDS_${PN} += "${@'dbench' if not any_incompatible(d,
> 'dbench', 'GPL-3.0-only') else ''}"
> > >
> > > Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> > > ---
> > >  meta/classes/license.bbclass                  | 38 +++++++++++++++++++
> > >  .../packagegroups/packagegroup-base.bb        |  2 +
> > >  2 files changed, 40 insertions(+)
> > >
> > > v2 changes: fixed string packages logic, corrected reference to
> > > apply_pkg_license_exception, and avoided use of ${@} in the function
> docstring
> > > to avoid bitbake expanding it and recursing.
> > >
> > > diff --git a/meta/classes/license.bbclass
> b/meta/classes/license.bbclass
> > > index 0c637e966e..41993b7227 100644
> > > --- a/meta/classes/license.bbclass
> > > +++ b/meta/classes/license.bbclass
> > > @@ -320,6 +320,44 @@ def incompatible_license(d, dont_want_licenses,
> package=None):
> > >
> > >      return incompatible_pkg_license(d, dont_want_licenses, license)
> > >
> > > +def any_incompatible(d, packages, licensestring=None):
> > > +    """Return True if any of the packages are skipped due to
> incompatible license.
> > > +
> > > +    License exceptions are obeyed. The user may specify the package's
> license
> > > +    for cross-recipe checks.
> > > +
> > > +    This allows for additions to packagegroups only for
> non-incompatible builds.
> > > +
> > > +    For example: 'dbench' if not any_incompatible(d, 'dbench',
> 'GPL-3.0-only') else ''
> > > +    """
> > > +    import oe.license
> > > +
> > > +    if isinstance(packages, str):
> > > +        packages = packages.split()
> > > +
> > > +    bad_licenses = (d.getVar("INCOMPATIBLE_LICENSE") or "").split()
> > > +    if not bad_licenses:
> > > +        return False
> > > +    bad_licenses = expand_wildcard_licenses(d, bad_licenses)
> > > +
> > > +    if licensestring is None:
> > > +        licensestring = d.getVar("LICENSE:%s" % package) if package
> else None
> > > +        if not licensestring:
> > > +            licensestring = d.getVar("LICENSE")
> > > +
> > > +    exceptions = (d.getVar("INCOMPATIBLE_LICENSE_EXCEPTIONS") or
> "").split()
> > > +    for pkg in packages:
> > > +        remaining_bad_licenses =
> oe.license.apply_pkg_license_exception(
> > > +            pkg, bad_licenses, exceptions
> > > +        )
> > > +
> > > +        incompatible_lic = incompatible_pkg_license(
> > > +            d, remaining_bad_licenses, licensestring
> > > +        )
> > > +        if incompatible_lic:
> > > +            return True
> > > +    return False
> > > +
> > >  def check_license_flags(d):
> > >      """
> > >      This function checks if a recipe has any LICENSE_FLAGS that
> > > diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb
> b/meta/recipes-core/packagegroups/packagegroup-base.bb
> > > index 7489ef61b0..1c97d03c21 100644
> > > --- a/meta/recipes-core/packagegroups/packagegroup-base.bb
> > > +++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
> > > @@ -14,6 +14,8 @@ PACKAGES = ' \
> > >              packagegroup-distro-base \
> > >              packagegroup-machine-base \
> > >              \
> > > +            ${@"dbench" if not any_incompatible(d, "dbench",
> "GPL-3.0-only") else ""} \
>
> This usage seems error prone at best. What if the license for dbench
> is changed?
>

It is, but we can't know other recipes licenses, so the options are
limited. It's also not the only similar thing we do along these lines. More
than once we've had to exclude something from a packagegroup based on the
current context and our knowledge that it's not buildable in this context,
such as knowing the required distro features of the recipe or its
unsupported architectures or COMPATIBLE_MACHINE.

I don't love it, but I don't see a lot of alternatives. RRECOMMENDS is an
interesting idea, but I don't believe it works as you'd hope today, and
would presumably require use of BAD_RECOMMENDATIONS for pickier images. I'm
certainly open to the alternatives on this, but in the meantime some
images/packagegroups just aren't buildable at all for incompatible_license
builds right now without risking layer-inclusion-based tweaks in meta-gplv2.

> I suspect you didn't mean to include this piece since dbench isn't in
> > core?
>

Indeed, v3 forthcoming. Thanks!

-- 
Christopher Larson
chris_larson@mentor.com, chris.larson@siemens.com, kergoth@gmail.com
Principal Software Engineer, Embedded Linux Solutions, Siemens Digital
Industries Software

--000000000000ae224d05dc8f31fb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 13, 2022 at 1:35 PM Peter=
 Kjellerstedt &lt;<a href=3D"mailto:peter.kjellerstedt@axis.com">peter.kjel=
lerstedt@axis.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">&gt; -----Original Message-----<br>
&gt; From: <a href=3D"mailto:openembedded-core@lists.openembedded.org" targ=
et=3D"_blank">openembedded-core@lists.openembedded.org</a> &lt;<a href=3D"m=
ailto:openembedded-core@lists.openembedded.org" target=3D"_blank">openembed=
ded-core@lists.openembedded.org</a>&gt; On Behalf Of Richard Purdie<br>
&gt; Sent: den 13 april 2022 19:45<br>
&gt; To: Christopher Larson &lt;<a href=3D"mailto:kergoth@gmail.com" target=
=3D"_blank">kergoth@gmail.com</a>&gt;; <a href=3D"mailto:openembedded-core@=
lists.openembedded.org" target=3D"_blank">openembedded-core@lists.openembed=
ded.org</a><br>
&gt; Cc: Christopher Larson &lt;<a href=3D"mailto:chris_larson@mentor.com" =
target=3D"_blank">chris_larson@mentor.com</a>&gt;<br>
&gt; Subject: Re: [OE-core] [PATCH v2] license: add &#39;any_incompatible&#=
39; function<br>
&gt; <br>
&gt; On Wed, 2022-04-13 at 16:00 +0000, Christopher Larson wrote:<br>
&gt; &gt; This function returns True if any of the specified packages are s=
kipped due to<br>
&gt; &gt; incompatible license.<br>
&gt; &gt;<br>
&gt; &gt; License exceptions are obeyed. The user may specify the package&#=
39;s license for<br>
&gt; &gt; cross-recipe checks.<br>
&gt; &gt;<br>
&gt; &gt; This allows for additions to packagegroups only for non-incompati=
ble builds. For<br>
&gt; &gt; example:<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0RDEPENDS_${PN} +=3D &quot;${@&#39;dbench&#39; =
if not any_incompatible(d, &#39;dbench&#39;, &#39;GPL-3.0-only&#39;) else &=
#39;&#39;}&quot;<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Christopher Larson &lt;<a href=3D"mailto:chris_lar=
son@mentor.com" target=3D"_blank">chris_larson@mentor.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 meta/classes/license.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 38 +++++++++++++++++++<br>
&gt; &gt;=C2=A0 .../packagegroups/<a href=3D"http://packagegroup-base.bb" r=
el=3D"noreferrer" target=3D"_blank">packagegroup-base.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 2 +<br>
&gt; &gt;=C2=A0 2 files changed, 40 insertions(+)<br>
&gt; &gt;<br>
&gt; &gt; v2 changes: fixed string packages logic, corrected reference to<b=
r>
&gt; &gt; apply_pkg_license_exception, and avoided use of ${@} in the funct=
ion docstring<br>
&gt; &gt; to avoid bitbake expanding it and recursing.<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/classes/license.bbclass b/meta/classes/license.=
bbclass<br>
&gt; &gt; index 0c637e966e..41993b7227 100644<br>
&gt; &gt; --- a/meta/classes/license.bbclass<br>
&gt; &gt; +++ b/meta/classes/license.bbclass<br>
&gt; &gt; @@ -320,6 +320,44 @@ def incompatible_license(d, dont_want_licens=
es, package=3DNone):<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 return incompatible_pkg_license(d, dont_want_=
licenses, license)<br>
&gt; &gt;<br>
&gt; &gt; +def any_incompatible(d, packages, licensestring=3DNone):<br>
&gt; &gt; +=C2=A0 =C2=A0 &quot;&quot;&quot;Return True if any of the packag=
es are skipped due to incompatible license.<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 License exceptions are obeyed. The user may specif=
y the package&#39;s license<br>
&gt; &gt; +=C2=A0 =C2=A0 for cross-recipe checks.<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 This allows for additions to packagegroups only fo=
r non-incompatible builds.<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 For example: &#39;dbench&#39; if not any_incompati=
ble(d, &#39;dbench&#39;, &#39;GPL-3.0-only&#39;) else &#39;&#39;<br>
&gt; &gt; +=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 import oe.license<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 if isinstance(packages, str):<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 packages =3D packages.split()<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 bad_licenses =3D (d.getVar(&quot;INCOMPATIBLE_LICE=
NSE&quot;) or &quot;&quot;).split()<br>
&gt; &gt; +=C2=A0 =C2=A0 if not bad_licenses:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return False<br>
&gt; &gt; +=C2=A0 =C2=A0 bad_licenses =3D expand_wildcard_licenses(d, bad_l=
icenses)<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 if licensestring is None:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 licensestring =3D d.getVar(&quot;LIC=
ENSE:%s&quot; % package) if package else None<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not licensestring:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 licensestring =3D d.ge=
tVar(&quot;LICENSE&quot;)<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 exceptions =3D (d.getVar(&quot;INCOMPATIBLE_LICENS=
E_EXCEPTIONS&quot;) or &quot;&quot;).split()<br>
&gt; &gt; +=C2=A0 =C2=A0 for pkg in packages:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 remaining_bad_licenses =3D oe.licens=
e.apply_pkg_license_exception(<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pkg, bad_licenses, exc=
eptions<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 incompatible_lic =3D incompatible_pk=
g_license(<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d, remaining_bad_licen=
ses, licensestring<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if incompatible_lic:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return True<br>
&gt; &gt; +=C2=A0 =C2=A0 return False<br>
&gt; &gt; +<br>
&gt; &gt;=C2=A0 def check_license_flags(d):<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 This function checks if a recipe has any LICE=
NSE_FLAGS that<br>
&gt; &gt; diff --git a/meta/recipes-core/packagegroups/<a href=3D"http://pa=
ckagegroup-base.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-base.=
bb</a> b/meta/recipes-core/packagegroups/<a href=3D"http://packagegroup-bas=
e.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-base.bb</a><br>
&gt; &gt; index 7489ef61b0..1c97d03c21 100644<br>
&gt; &gt; --- a/meta/recipes-core/packagegroups/<a href=3D"http://packagegr=
oup-base.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-base.bb</a><=
br>
&gt; &gt; +++ b/meta/recipes-core/packagegroups/<a href=3D"http://packagegr=
oup-base.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-base.bb</a><=
br>
&gt; &gt; @@ -14,6 +14,8 @@ PACKAGES =3D &#39; \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 packagegroup-dist=
ro-base \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 packagegroup-mach=
ine-base \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@&quot;dbench&quot; =
if not any_incompatible(d, &quot;dbench&quot;, &quot;GPL-3.0-only&quot;) el=
se &quot;&quot;} \<br>
<br>
This usage seems error prone at best. What if the license for dbench <br>
is changed?<br></blockquote><div><br></div><div>It is, but we can&#39;t kno=
w other recipes licenses, so the options are limited. It&#39;s also not the=
 only similar thing we do along these lines. More than once we&#39;ve had t=
o exclude something from a packagegroup based on the current context and ou=
r knowledge that it&#39;s not buildable in this context, such as knowing th=
e required distro features of the recipe or its unsupported architectures o=
r COMPATIBLE_MACHINE.</div><div><br></div><div>I don&#39;t love it, but I d=
on&#39;t see a lot of alternatives. RRECOMMENDS is an interesting idea, but=
 I don&#39;t believe it works as you&#39;d hope today, and would presumably=
 require use of BAD_RECOMMENDATIONS for pickier images. I&#39;m certainly o=
pen to the alternatives on this, but in the meantime some images/packagegro=
ups just aren&#39;t buildable at all for incompatible_license builds right =
now without risking layer-inclusion-based tweaks in meta-gplv2.</div><div><=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">&gt; I suspect y=
ou didn&#39;t mean to include this piece since dbench isn&#39;t in<br>
&gt; core?<br></blockquote><div><br></div><div>Indeed, v3 forthcoming. Than=
ks!</div></div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signat=
ure"><div dir=3D"ltr"><div dir=3D"ltr"><font color=3D"#333333">Christopher =
Larson<br><a>chris_larson@mentor.com</a>,=C2=A0<a>chris.larson@siemens.com<=
/a>,=C2=A0<a>kergoth@gmail.com</a><br>Principal Software Engineer,=C2=A0Emb=
edded Linux Solutions,=C2=A0Siemens Digital Industries Software</font><br><=
/div></div></div></div>

--000000000000ae224d05dc8f31fb--

