Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web08.5941.1613650919289468010
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Feb 2021 04:21:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FNjkqIDe;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: idadelm@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id h10so4102606edl.6
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Feb 2021 04:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OwV/wEbwBlnMNOeyh2qKfxNdMU7a2fJM3i9WjBaGNPY=;
        b=FNjkqIDeTKQqsKbPChlIuoi60j4jnqXatLJvswnt0bRzqF5YMzkTnjjrZF+d+uq/Nx
         kJf8px40P0WvygTSASWck9Q6uy1/OgrW7o+pg7pCvjkqtq1S01pLanetJG1QfegKIwFj
         2L2AE22oubVN7LpKV9vF4o/xyD3RemXtjBf4fzyK8Zb/xtTGll0wCuQHaPiBefwS77nn
         ds1rR+D61e4hY8rTnxiSDda5WM0p7o8waDG5pUO7hZZxJYYEagbdJuernUB3bp8ToJkW
         p/wQiEC+AAD/j05EuDZrv+ipoicz2ZJM+YLYwubQmVicnUe43VR2WQfYhI5YnJoSaFdh
         RGWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OwV/wEbwBlnMNOeyh2qKfxNdMU7a2fJM3i9WjBaGNPY=;
        b=CrBdodY5G+ru0FC+YeNkYuUunBm9Y8yq8EVHFYCrdIHJOD/frR5CunnpNFE1jPskZ5
         g39x+MW+CP8CZJ0g70rT7S96jTks9rbynPE2T9NLBnCrmntyquRAiupQzdu9b4us6R+F
         pxJ1e1jehJNrt09zCoR0V2+4ZuDmn5wXgqLP79ore9aFjxYnle4H6X2FZ5hq2yCm55F9
         xn71N11V3jQA+EFKL89WjT6K9zVRSeTMgimeA+2XtnTSEV+hiEu1xUBPEg5FElKm1O/U
         krpBj+OQL38UJMc/RHqlQMkZXrr6LEhpJBd4A7+jnUMIaANNkxiMBdUTPoob/758hTOh
         6l9w==
X-Gm-Message-State: AOAM530VvulEMuPx3IJYXdfyCtDXOeqX0WDLxCv57qtyaKxOnPxaRWQ4
	4G+637ltO5n1Q+BOZR+t4fj2tcPbVa3YkSM1gQQ=
X-Google-Smtp-Source: ABdhPJyyjngn6Ynn0OAHXYww2F3u449V7v7183Gpz3+4YRX7AfJUKL0zFVIWEs4OjOONLSEiZB8+2MRnTAagjNE60Dg=
X-Received: by 2002:a50:b765:: with SMTP id g92mr3917324ede.317.1613650917640;
 Thu, 18 Feb 2021 04:21:57 -0800 (PST)
MIME-Version: 1.0
References: <20210217040033.21541-1-idadelm@gmail.com> <d2c6bc1c604946f799ea00ec68ee6209@XBOX03.axis.com>
 <CAN7sTgvSHSbPAMrtbHcTU1B_f+LoXBZMeetuXAb7C5mj_iAcfQ@mail.gmail.com> <60906f028ebf4e5f805108b8e6516add@XBOX03.axis.com>
In-Reply-To: <60906f028ebf4e5f805108b8e6516add@XBOX03.axis.com>
From: "Meh Mbeh Ida Delphine" <idadelm@gmail.com>
Date: Thu, 18 Feb 2021 13:21:46 +0100
Message-ID: <CAN7sTgtYF3y0O2hOSfuVon7cSKcLSb8KK4xtO-q_aZufoijzYw@mail.gmail.com>
Subject: Re: [OE-core] [poky-contrib][RFC PATCH 0/5] Suggestions for improvements?
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000bccfc205bb9b6110"

--000000000000bccfc205bb9b6110
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I'm using poky-contrib; checkout paule/rpurdie-license-experiments-osls

Cheers,
Ida

On Thu, Feb 18, 2021 at 12:17 PM Peter Kjellerstedt <
peter.kjellerstedt@axis.com> wrote:

> None of the context for the second hunk in the first patch exists. E.g.,
> if I checkout master of poky and grep for =E2=80=9CLicense for package %s=
=E2=80=9D (part of
> the line that the first patch replaces), there is no match in any file.
>
>
>
> //Peter
>
>
>
> *From:* Ida Delphine <idadelm@gmail.com>
> *Sent:* den 17 februari 2021 17:59
> *To:* Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> *Cc:* openembedded-core@lists.openembedded.org
> *Subject:* Re: [OE-core] [poky-contrib][RFC PATCH 0/5] Suggestions for
> improvements?
>
>
>
> Please what exactly didn't match?
>
>
>
> Ida
>
>
>
> On Wed, Feb 17, 2021 at 4:50 PM Peter Kjellerstedt <
> peter.kjellerstedt@axis.com> wrote:
>
> I tried to apply these patches, but the context does not match. Are
> there other patches I need to apply before these can be applied?
>
> //Peter
>
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-
> > core@lists.openembedded.org> On Behalf Of Meh Mbeh Ida Delphine
> > Sent: den 17 februari 2021 05:00
> > To: openembedded-core@lists.openembedded.org
> > Subject: [OE-core] [poky-contrib][RFC PATCH 0/5] Suggestions for
> > improvements?
> >
> > Hello everyone,
> >
> > The following patchset is aimed at improving the Yocto Project license
> > tracing.
> >
> > Initially, after a build I will come across 130 license warnings with
> some
> > false positives. I got rid of these by replacing "or-later" with "+" fo=
r
> > source licenses (computedpkglics) and also passing the recipe license
> > through canonical_license of license.py(). As a result, some of the
> > licenses will match during comparism hence some warnings eliminate.
> >
> > Though some false positive warnings were eliminated, lots of warnings
> were
> > ouputed as a result of several source licenses having "WITH
> Linux-syscall-
> > note". With the help of a variable being set in local.conf, one can
> > chooses whether or not to get lid of the "WITH Linux-syscall-note" stri=
ng
> > from the source licenses. Just by doing this, several warnings are
> dropped
> > and now left with 118.
> >
> > I later on added some logic depending on "source_spdx_license" variable
> > whether or not for the user to allow the warnings being outputed during
> > the build. It reduces the extra processing and reduces time if the user
> > chooses not to display warnings. It uses bb.utils.contains() to find ou=
t
> > if that particular vaiable is present. Also, I added
> > package_qa_handle_error() to allow the user decide whether they want th=
e
> > issues treated as warnings, errors or not at all.
> >
> > Some of the license-related logic I added to take care of splitting
> recipe
> > licences before canonicalizing, getting rid of "or-later" warnings, I
> > moved it to license.bbclass and put it in functions. I also plan on
> fixing
> > the variable naming since some have underscores whereas others do not
> > have. However, I will love to move more license logic in package.bbclas=
s
> > to license.bbclass but I need help with the right way to go about it.
> > Also, general suggestions on any improvements to this are highly
> welcomed.
> >
> > Cheers,
> > Ida.
> >
> > Ida Delphine (5):
> >   package: Remove false positive lic warnings
> >   package: Remove false positive lic warnings
> >   package: Remove false positive lic warnings
> >   license.bbclass: Add functions to split and canonicalise license
> >     strings
> >   package.bbclass: Remove false positive license warnings
> >
> >  meta/classes/license.bbclass |  27 ++++++++
> >  meta/classes/package.bbclass | 127 +++++++++++++++++++----------------
> >  2 files changed, 96 insertions(+), 58 deletions(-)
> >
> > --
> > 2.25.1
>
>

--000000000000bccfc205bb9b6110
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I&#39;m using poky-contrib; checkout paule/rpurdie-li=
cense-experiments-osls</div><div><br></div><div>Cheers,</div><div>Ida<br></=
div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Thu, Feb 18, 2021 at 12:17 PM Peter Kjellerstedt &lt;<a href=3D"mail=
to:peter.kjellerstedt@axis.com">peter.kjellerstedt@axis.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">





<div style=3D"overflow-wrap: break-word;" lang=3D"SV">
<div class=3D"gmail-m_-75106000434161247WordSection1">
<p class=3D"MsoNormal"><span style=3D"color:rgb(148,54,52)" lang=3D"EN-US">=
None of the context for the second hunk in the first patch exists. E.g., if=
 I checkout master of poky and grep for =E2=80=9CLicense for package %s=E2=
=80=9D (part of the line that the first
 patch replaces), there is no match in any file. <u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"color:rgb(148,54,52)" lang=3D"EN-US">=
<u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"color:rgb(148,54,52)" lang=3D"EN-US">=
//Peter<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"color:rgb(148,54,52)" lang=3D"EN-US">=
<u></u>=C2=A0<u></u></span></p>
<div style=3D"border-color:currentcolor currentcolor currentcolor blue;bord=
er-style:none none none solid;border-width:medium medium medium 1.5pt;paddi=
ng:0cm 0cm 0cm 4pt">
<div>
<div style=3D"border-color:rgb(225,225,225) currentcolor currentcolor;borde=
r-style:solid none none;border-width:1pt medium medium;padding:3pt 0cm 0cm"=
>
<p class=3D"MsoNormal"><b><span lang=3D"EN-US">From:</span></b><span lang=
=3D"EN-US"> Ida Delphine &lt;<a href=3D"mailto:idadelm@gmail.com" target=3D=
"_blank">idadelm@gmail.com</a>&gt;
<br>
<b>Sent:</b> den 17 februari 2021 17:59<br>
<b>To:</b> Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kjellerstedt@axis=
.com" target=3D"_blank">peter.kjellerstedt@axis.com</a>&gt;<br>
<b>Cc:</b> <a href=3D"mailto:openembedded-core@lists.openembedded.org" targ=
et=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
<b>Subject:</b> Re: [OE-core] [poky-contrib][RFC PATCH 0/5] Suggestions for=
 improvements?<u></u><u></u></span></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal">Please what exactly didn&#39;t match? <u></u><u></u>=
</p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Ida<u></u><u></u></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal">On Wed, Feb 17, 2021 at 4:50 PM Peter Kjellerstedt &=
lt;<a href=3D"mailto:peter.kjellerstedt@axis.com" target=3D"_blank">peter.k=
jellerstedt@axis.com</a>&gt; wrote:<u></u><u></u></p>
</div>
<blockquote style=3D"border-color:currentcolor currentcolor currentcolor rg=
b(204,204,204);border-style:none none none solid;border-width:medium medium=
 medium 1pt;padding:0cm 0cm 0cm 6pt;margin-left:4.8pt;margin-right:0cm">
<p class=3D"MsoNormal" style=3D"margin-bottom:12pt">I tried to apply these =
patches, but the context does not match. Are
<br>
there other patches I need to apply before these can be applied?<br>
<br>
//Peter<br>
<br>
&gt; -----Original Message-----<br>
&gt; From: <a href=3D"mailto:openembedded-core@lists.openembedded.org" targ=
et=3D"_blank">
openembedded-core@lists.openembedded.org</a> &lt;openembedded-<br>
&gt; <a href=3D"mailto:core@lists.openembedded.org" target=3D"_blank">core@=
lists.openembedded.org</a>&gt; On Behalf Of Meh Mbeh Ida Delphine<br>
&gt; Sent: den 17 februari 2021 05:00<br>
&gt; To: <a href=3D"mailto:openembedded-core@lists.openembedded.org" target=
=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
&gt; Subject: [OE-core] [poky-contrib][RFC PATCH 0/5] Suggestions for<br>
&gt; improvements?<br>
&gt; <br>
&gt; Hello everyone,<br>
&gt; <br>
&gt; The following patchset is aimed at improving the Yocto Project license=
<br>
&gt; tracing.<br>
&gt; <br>
&gt; Initially, after a build I will come across 130 license warnings with =
some<br>
&gt; false positives. I got rid of these by replacing &quot;or-later&quot; =
with &quot;+&quot; for<br>
&gt; source licenses (computedpkglics) and also passing the recipe license<=
br>
&gt; through canonical_license of license.py(). As a result, some of the<br=
>
&gt; licenses will match during comparism hence some warnings eliminate.<br=
>
&gt; <br>
&gt; Though some false positive warnings were eliminated, lots of warnings =
were<br>
&gt; ouputed as a result of several source licenses having &quot;WITH Linux=
-syscall-<br>
&gt; note&quot;. With the help of a variable being set in local.conf, one c=
an<br>
&gt; chooses whether or not to get lid of the &quot;WITH Linux-syscall-note=
&quot; string<br>
&gt; from the source licenses. Just by doing this, several warnings are dro=
pped<br>
&gt; and now left with 118.<br>
&gt; <br>
&gt; I later on added some logic depending on &quot;source_spdx_license&quo=
t; variable<br>
&gt; whether or not for the user to allow the warnings being outputed durin=
g<br>
&gt; the build. It reduces the extra processing and reduces time if the use=
r<br>
&gt; chooses not to display warnings. It uses bb.utils.contains() to find o=
ut<br>
&gt; if that particular vaiable is present. Also, I added<br>
&gt; package_qa_handle_error() to allow the user decide whether they want t=
he<br>
&gt; issues treated as warnings, errors or not at all.<br>
&gt; <br>
&gt; Some of the license-related logic I added to take care of splitting re=
cipe<br>
&gt; licences before canonicalizing, getting rid of &quot;or-later&quot; wa=
rnings, I<br>
&gt; moved it to license.bbclass and put it in functions. I also plan on fi=
xing<br>
&gt; the variable naming since some have underscores whereas others do not<=
br>
&gt; have. However, I will love to move more license logic in package.bbcla=
ss<br>
&gt; to license.bbclass but I need help with the right way to go about it.<=
br>
&gt; Also, general suggestions on any improvements to this are highly welco=
med.<br>
&gt; <br>
&gt; Cheers,<br>
&gt; Ida.<br>
&gt; <br>
&gt; Ida Delphine (5):<br>
&gt;=C2=A0 =C2=A0package: Remove false positive lic warnings<br>
&gt;=C2=A0 =C2=A0package: Remove false positive lic warnings<br>
&gt;=C2=A0 =C2=A0package: Remove false positive lic warnings<br>
&gt;=C2=A0 =C2=A0license.bbclass: Add functions to split and canonicalise l=
icense<br>
&gt;=C2=A0 =C2=A0 =C2=A0strings<br>
&gt;=C2=A0 =C2=A0package.bbclass: Remove false positive license warnings<br=
>
&gt; <br>
&gt;=C2=A0 meta/classes/license.bbclass |=C2=A0 27 ++++++++<br>
&gt;=C2=A0 meta/classes/package.bbclass | 127 +++++++++++++++++++----------=
------<br>
&gt;=C2=A0 2 files changed, 96 insertions(+), 58 deletions(-)<br>
&gt; <br>
&gt; --<br>
&gt; 2.25.1<u></u><u></u></p>
</blockquote>
</div>
</div>
</div>
</div>

</blockquote></div>

--000000000000bccfc205bb9b6110--
