Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web09.8209.1632490408707441556
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Sep 2021 06:33:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MPqDJD89;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: jpewhacker@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id u18so27632604wrg.5
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Sep 2021 06:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EY6BDvHhRtuxw9RTUWJV8TjdII74rn56oyeJ+k8GXIw=;
        b=MPqDJD89x3LcgPCllBAoK4+trsRWeiKqzYz8IXJT0tq9YomTGdTCdNNVm8kgnxK1VK
         iDdtmAnOCBDo4lXrVC19vtKdjNt0/6CjThaAEjKGHuQMhdJqRO+W6AzOcwtwAtZKd1Oi
         3h2jLPJDGEPWv/4Y4a+FpBDzAkueqYbx/b7XxOBW3V1k4ZplCnH6wC9ubFS3zOtwyUrw
         NpyHhUnCkWsa+MaCw6iIwQX58e73ivytmUjhHvQ6Ysl1xtk4CpEQRIFWl7vsjGfoWN8R
         7yNcSDV+coIcbs0rqgORhDyu8fMqzULckMm7+BBGbrOXPV3oH4R7MPpckkn2e97aeQOa
         iDnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EY6BDvHhRtuxw9RTUWJV8TjdII74rn56oyeJ+k8GXIw=;
        b=jfLnq8o0Rdcp9f7SGm3qzqnNyQgt9GyGEnuZKocbAiwn0MzA8eCLHCNye47F/+Lno6
         7bPgUfBeezJIECl6B+i3KzUNBL87yIlKE2QqPZ8jFEWnfadU4yvZoLCRArkryv3pEHeV
         uPKCGidKFy4kMZVRtgQi7/unJoU2J6M/Mqvmeu6dpS3wHXpS6j3tk50nrkWz5KpuDjVM
         HmvE6juq0xgTfwDHVbxxZ/krKoQ3Bga+qWbxjxFwGjr7O8CE0fXl6UtqHONGs/fAMRcI
         smMqcVU3ZV/0YOTgF91awylY4GPokVUr4fWMdpi08m6KELH8oprhER/VkrKtr0YsZBDl
         rgDw==
X-Gm-Message-State: AOAM5336wX9WHLzxw2sxeQUwxskpBMDFvht1nlvhfBadoc0/WMRe26RR
	6qIxIomR+44Bu7QXK8k8UUQxn9dm7buaISbKRnk=
X-Google-Smtp-Source: ABdhPJxPlynD+lDKcM1tblhXgMHlyJ5/+g7ZG+WyEbHDKE3Y3ue1V6eWPFOSWoREF+9HbH7ycMTXLoEPm/Z3bHbvj7g=
X-Received: by 2002:a05:600c:22d6:: with SMTP id 22mr2229081wmg.17.1632490406693;
 Fri, 24 Sep 2021 06:33:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210923205328.2662727-1-saul.wold@windriver.com>
 <91fdbb39-dded-4c59-75de-4a8e223f370a@gmail.com> <bd23a9da-94ad-4386-1460-8107b7be59ec@windriver.com>
 <5e3b148c-9e63-60fd-0a0d-096c73889ae4@gmail.com> <02196b6e-af2e-8046-a64b-8fe8b13e3fbf@gmail.com>
 <00ee293a25fb1c441bfe8c54015eb85f05178789.camel@linuxfoundation.org>
In-Reply-To: <00ee293a25fb1c441bfe8c54015eb85f05178789.camel@linuxfoundation.org>
From: "Joshua Watt" <JPEWhacker@gmail.com>
Date: Fri, 24 Sep 2021 08:33:15 -0500
Message-ID: <CAJdd5GZ46R6ovG0Px8p5zGm-k6SNHw_cvD_jXmEZWYsVX_7w=A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] create-spdx: Don't collect natives sources
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Saul Wold <Saul.Wold@windriver.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000ca4dc805ccbdca0f"

--000000000000ca4dc805ccbdca0f
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 24, 2021, 2:16 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Thu, 2021-09-23 at 17:14 -0500, Joshua Watt wrote:
> > On 9/23/21 5:07 PM, Joshua Watt wrote:
> > >
> > > On 9/23/21 4:29 PM, Saul Wold wrote:
> > > >
> > > >
> > > > On 9/23/21 2:05 PM, Joshua Watt wrote:
> > > > >
> > > > > On 9/23/21 3:53 PM, Saul Wold wrote:
> > > > > > Extend the SPDXPackage to include is_native so it can be used
> later in
> > > > > > the processing.
> > > > > >
> > > > > > When the collect_dep_sources() runs, it collects sources from
> both
> > > > > > native
> > > > > > and non-native recipes. Later when the GENERATED_FROM matching
> > > > > > occurs it
> > > > > > may find the file (via checksum) from the native recipe since
> it's the
> > > > > > same checksum as the target file. The that are generated
> DocumentRefs
> > > > > > point to the native recipe rather than the target recipe
> DocumentRef.
> > > > > >
> > > > > > Signed-off-by: Saul Wold <saul.wold@windriver.com>
> > > > > > ---
> > > > > >   meta/classes/create-spdx.bbclass | 11 +++++++++--
> > > > > >   meta/lib/oe/spdx.py              |  1 +
> > > > > >   2 files changed, 10 insertions(+), 2 deletions(-)
> > > > > >
> > > > > > diff --git a/meta/classes/create-spdx.bbclass
> > > > > > b/meta/classes/create-spdx.bbclass
> > > > > > index 3c73c21c04..e565f0bf6c 100644
> > > > > > --- a/meta/classes/create-spdx.bbclass
> > > > > > +++ b/meta/classes/create-spdx.bbclass
> > > > > > @@ -336,6 +336,10 @@ def collect_dep_sources(d, dep_recipes):
> > > > > >       sources = {}
> > > > > >       for dep in dep_recipes:
> > > > > > +        # Don't collect sources from native recipes as they
> > > > > > +        # match non-native sources also.
> > > > > > +        if dep.recipe.is_native == "True":
> > > > > > +            continue
> > > > > >           recipe_files = set(dep.recipe.hasFiles)
> > > > > >           for spdx_file in dep.doc.files:
> > > > > > @@ -382,7 +386,6 @@ python do_create_spdx() {
> > > > > >       include_sources = d.getVar("SPDX_INCLUDE_SOURCES") == "1"
> > > > > >       archive_sources = d.getVar("SPDX_ARCHIVE_SOURCES") == "1"
> > > > > >       archive_packaged = d.getVar("SPDX_ARCHIVE_PACKAGED") == "1"
> > > > > > -    is_native = bb.data.inherits_class("native", d)
> > > > > >       creation_time =
> > > > > > datetime.now(tz=timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")
> > > > > > @@ -401,6 +404,10 @@ python do_create_spdx() {
> > > > > >       recipe.name = d.getVar("PN")
> > > > > >       recipe.versionInfo = d.getVar("PV")
> > > > > >       recipe.SPDXID = oe.sbom.get_recipe_spdxid(d)
> > > > > > +    if bb.data.inherits_class("native", d):
> > > > > > +        recipe.is_native = "True"
> > > > > > +    else:
> > > > > > +        recipe.is_native = "False"
> > > > > >       for s in d.getVar('SRC_URI').split():
> > > > > >           if not s.startswith("file://"):
> > > > > > @@ -480,7 +487,7 @@ python do_create_spdx() {
> > > > > >       sources = collect_dep_sources(d, dep_recipes)
> > > > > >       found_licenses = {license.name:recipe_ref.externalDocumentId
>
> > > > > > + ":" + license.licenseId for license in
> > > > > > doc.hasExtractedLicensingInfos}
> > > > > > -    if not is_native:
> > > > > > +    if recipe.is_native is "False":
> > > > > >           bb.build.exec_func("read_subpackage_metadata", d)
> > > > > >           pkgdest = Path(d.getVar("PKGDEST"))
> > > > > > diff --git a/meta/lib/oe/spdx.py b/meta/lib/oe/spdx.py
> > > > > > index 9814fbfd66..452148f339 100644
> > > > > > --- a/meta/lib/oe/spdx.py
> > > > > > +++ b/meta/lib/oe/spdx.py
> > > > > > @@ -164,6 +164,7 @@ class SPDXPackage(SPDXObject):
> > > > > >       packageVerificationCode =
> _Object(SPDXPackageVerificationCode)
> > > > > >       hasFiles = _StringList()
> > > > > >       packageFileName = _String()
> > > > > > +    is_native = _String()
> > > > >
> > > > > It's probably not well documented in this file, but this has to
> > > > > match to the SPDX standard; we can't add arbitrary fields here.
> When
> > > > > I was referring to an "annotation" I was specifcially referring to
> > > > > an SPDX annotation:
> > > > >
> > > > I should have figured that!
> > > >
> > > > > https://spdx.github.io/spdx-spec/8-annotations/
> > > > >
> > > > > We'd need to decide on some schema for encoding the data in the
> > > > > annotation
> > > > >
> > > > So we need to create an SPDXAnnotation type on spdx.py and define
> > > > what we want in the AnnotationComment field?
> > >
> > > Exactly. We can use the tool field to indicate that this is data we
> > > care about for a specific annotation, then put JSON or something in
> > > the annotation itself.
> >
> >
> > Also, I forgot to mention but I found it really hard to convert the
> > normal SPDX spec document into the structure we need for JSON encoding
> > in spdx.py. I found it *much* easier to decipher the actual SPDX JSON
> > schema document:
> >
> >
> https://github.com/spdx/spdx-spec/blob/development/v2.2.1/schemas/spdx-schema.json
> >
> >
>
> Could someone put a few comments into the code just so that we don't
> forget some
> of these constraints in future please?
>

Yes I will do that



> Cheers,
>
> Richard
>
>

--000000000000ca4dc805ccbdca0f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, Sep 24, 2021, 2:16 AM Richard Purdie &lt;<a hr=
ef=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfounda=
tion.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Thu, 202=
1-09-23 at 17:14 -0500, Joshua Watt wrote:<br>
&gt; On 9/23/21 5:07 PM, Joshua Watt wrote:<br>
&gt; &gt; <br>
&gt; &gt; On 9/23/21 4:29 PM, Saul Wold wrote:<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; On 9/23/21 2:05 PM, Joshua Watt wrote:<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; On 9/23/21 3:53 PM, Saul Wold wrote:<br>
&gt; &gt; &gt; &gt; &gt; Extend the SPDXPackage to include is_native so it =
can be used later in<br>
&gt; &gt; &gt; &gt; &gt; the processing.<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; When the collect_dep_sources() runs, it collects s=
ources from both <br>
&gt; &gt; &gt; &gt; &gt; native<br>
&gt; &gt; &gt; &gt; &gt; and non-native recipes. Later when the GENERATED_F=
ROM matching <br>
&gt; &gt; &gt; &gt; &gt; occurs it<br>
&gt; &gt; &gt; &gt; &gt; may find the file (via checksum) from the native r=
ecipe since it&#39;s the<br>
&gt; &gt; &gt; &gt; &gt; same checksum as the target file. The that are gen=
erated DocumentRefs<br>
&gt; &gt; &gt; &gt; &gt; point to the native recipe rather than the target =
recipe DocumentRef.<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; Signed-off-by: Saul Wold &lt;<a href=3D"mailto:sau=
l.wold@windriver.com" target=3D"_blank" rel=3D"noreferrer">saul.wold@windri=
ver.com</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt; ---<br>
&gt; &gt; &gt; &gt; &gt; =C2=A0 meta/classes/create-spdx.bbclass | 11 +++++=
++++--<br>
&gt; &gt; &gt; &gt; &gt; =C2=A0 meta/lib/oe/spdx.py=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +<br>
&gt; &gt; &gt; &gt; &gt; =C2=A0 2 files changed, 10 insertions(+), 2 deleti=
ons(-)<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; diff --git a/meta/classes/create-spdx.bbclass <br>
&gt; &gt; &gt; &gt; &gt; b/meta/classes/create-spdx.bbclass<br>
&gt; &gt; &gt; &gt; &gt; index 3c73c21c04..e565f0bf6c 100644<br>
&gt; &gt; &gt; &gt; &gt; --- a/meta/classes/create-spdx.bbclass<br>
&gt; &gt; &gt; &gt; &gt; +++ b/meta/classes/create-spdx.bbclass<br>
&gt; &gt; &gt; &gt; &gt; @@ -336,6 +336,10 @@ def collect_dep_sources(d, de=
p_recipes):<br>
&gt; &gt; &gt; &gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sources =3D {}<br>
&gt; &gt; &gt; &gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for dep in dep_reci=
pes:<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Don&=
#39;t collect sources from native recipes as they<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # matc=
h non-native sources also.<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if dep=
.recipe.is_native =3D=3D &quot;True&quot;:<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 continue<br>
&gt; &gt; &gt; &gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 recipe_files =3D set(dep.recipe.hasFiles)<br>
&gt; &gt; &gt; &gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 for spdx_file in dep.doc.files:<br>
&gt; &gt; &gt; &gt; &gt; @@ -382,7 +386,6 @@ python do_create_spdx() {<br>
&gt; &gt; &gt; &gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 include_sources =3D=
 d.getVar(&quot;SPDX_INCLUDE_SOURCES&quot;) =3D=3D &quot;1&quot;<br>
&gt; &gt; &gt; &gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 archive_sources =3D=
 d.getVar(&quot;SPDX_ARCHIVE_SOURCES&quot;) =3D=3D &quot;1&quot;<br>
&gt; &gt; &gt; &gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 archive_packaged =
=3D d.getVar(&quot;SPDX_ARCHIVE_PACKAGED&quot;) =3D=3D &quot;1&quot;<br>
&gt; &gt; &gt; &gt; &gt; -=C2=A0=C2=A0=C2=A0 is_native =3D bb.data.inherits=
_class(&quot;native&quot;, d)<br>
&gt; &gt; &gt; &gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 creation_time =3D <=
br>
&gt; &gt; &gt; &gt; &gt; datetime.now(tz=3Dtimezone.utc).strftime(&quot;%Y-=
%m-%dT%H:%M:%SZ&quot;)<br>
&gt; &gt; &gt; &gt; &gt; @@ -401,6 +404,10 @@ python do_create_spdx() {<br>
&gt; &gt; &gt; &gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <a href=3D"http://r=
ecipe.name" rel=3D"noreferrer noreferrer" target=3D"_blank">recipe.name</a>=
 =3D d.getVar(&quot;PN&quot;)<br>
&gt; &gt; &gt; &gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 recipe.versionInfo =
=3D d.getVar(&quot;PV&quot;)<br>
&gt; &gt; &gt; &gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 recipe.SPDXID =3D o=
e.sbom.get_recipe_spdxid(d)<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0 if bb.data.inherits_class(&quo=
t;native&quot;, d):<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 recipe=
.is_native =3D &quot;True&quot;<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0 else:<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 recipe=
.is_native =3D &quot;False&quot;<br>
&gt; &gt; &gt; &gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for s in d.getVar(&=
#39;SRC_URI&#39;).split():<br>
&gt; &gt; &gt; &gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 if not s.startswith(&quot;file://&quot;):<br>
&gt; &gt; &gt; &gt; &gt; @@ -480,7 +487,7 @@ python do_create_spdx() {<br>
&gt; &gt; &gt; &gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sources =3D collect=
_dep_sources(d, dep_recipes)<br>
&gt; &gt; &gt; &gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 found_licenses =3D =
{license.name:recipe_ref.externalDocumentId <br>
&gt; &gt; &gt; &gt; &gt; + &quot;:&quot; + license.licenseId for license in=
 <br>
&gt; &gt; &gt; &gt; &gt; doc.hasExtractedLicensingInfos}<br>
&gt; &gt; &gt; &gt; &gt; -=C2=A0=C2=A0=C2=A0 if not is_native:<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0 if recipe.is_native is &quot;F=
alse&quot;:<br>
&gt; &gt; &gt; &gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 bb.build.exec_func(&quot;read_subpackage_metadata&quot;, d)<br>
&gt; &gt; &gt; &gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 pkgdest =3D Path(d.getVar(&quot;PKGDEST&quot;))<br>
&gt; &gt; &gt; &gt; &gt; diff --git a/meta/lib/oe/spdx.py b/meta/lib/oe/spd=
x.py<br>
&gt; &gt; &gt; &gt; &gt; index 9814fbfd66..452148f339 100644<br>
&gt; &gt; &gt; &gt; &gt; --- a/meta/lib/oe/spdx.py<br>
&gt; &gt; &gt; &gt; &gt; +++ b/meta/lib/oe/spdx.py<br>
&gt; &gt; &gt; &gt; &gt; @@ -164,6 +164,7 @@ class SPDXPackage(SPDXObject):=
<br>
&gt; &gt; &gt; &gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 packageVerification=
Code =3D _Object(SPDXPackageVerificationCode)<br>
&gt; &gt; &gt; &gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hasFiles =3D _Strin=
gList()<br>
&gt; &gt; &gt; &gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 packageFileName =3D=
 _String()<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0 is_native =3D _String()<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; It&#39;s probably not well documented in this file, but=
 this has to <br>
&gt; &gt; &gt; &gt; match to the SPDX standard; we can&#39;t add arbitrary =
fields here. When <br>
&gt; &gt; &gt; &gt; I was referring to an &quot;annotation&quot; I was spec=
ifcially referring to <br>
&gt; &gt; &gt; &gt; an SPDX annotation:<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; I should have figured that!<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; <a href=3D"https://spdx.github.io/spdx-spec/8-annotatio=
ns/" rel=3D"noreferrer noreferrer" target=3D"_blank">https://spdx.github.io=
/spdx-spec/8-annotations/</a><br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; We&#39;d need to decide on some schema for encoding the=
 data in the <br>
&gt; &gt; &gt; &gt; annotation<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; So we need to create an SPDXAnnotation type on spdx.py and d=
efine <br>
&gt; &gt; &gt; what we want in the AnnotationComment field?<br>
&gt; &gt; <br>
&gt; &gt; Exactly. We can use the tool field to indicate that this is data =
we <br>
&gt; &gt; care about for a specific annotation, then put JSON or something =
in <br>
&gt; &gt; the annotation itself.<br>
&gt; <br>
&gt; <br>
&gt; Also, I forgot to mention but I found it really hard to convert the <b=
r>
&gt; normal SPDX spec document into the structure we need for JSON encoding=
 <br>
&gt; in spdx.py. I found it *much* easier to decipher the actual SPDX JSON =
<br>
&gt; schema document:<br>
&gt; <br>
&gt; <a href=3D"https://github.com/spdx/spdx-spec/blob/development/v2.2.1/s=
chemas/spdx-schema.json" rel=3D"noreferrer noreferrer" target=3D"_blank">ht=
tps://github.com/spdx/spdx-spec/blob/development/v2.2.1/schemas/spdx-schema=
.json</a><br>
&gt; <br>
&gt; <br>
<br>
Could someone put a few comments into the code just so that we don&#39;t fo=
rget some<br>
of these constraints in future please?<br></blockquote></div></div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Yes I will do that</div><div dir=3D"a=
uto"><br></div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"=
gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div></div></div>

--000000000000ca4dc805ccbdca0f--
