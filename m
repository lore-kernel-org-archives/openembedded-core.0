Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.10582.1613581126966514032
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Feb 2021 08:58:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vZt54v9U;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: idadelm@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id i23so17185660ejg.10
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Feb 2021 08:58:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pnQXJEfKtJWcuVWbQohanGmntCKjaSRrPoLPrhhtwvI=;
        b=vZt54v9UuN+cA/0elVuZYx+vGrMsI0brsli1uxXkYqm5TkiJnRekPkLNvFQfs/xpcy
         vzdos2/5dXYbPGczDZ23Z2HMWmUMZJFS5BNDzt+DI5O4V5hbhHjELR5+JR43YNedbCWq
         YjyJzrnuNszUykyHifpLlsB+uNDmNmLQ3ftqs8z4Lm/pXENfglcGZmD82V9HLvQaGgDO
         H7tx2/1oUDS5er2Nl1jJDYpJMKo0ZYi3pvq8TE75k0p/WBM746n/EcwustWP8U6FUQke
         w/a0Y59+sLQELn7gCEX00ZsUKoxGn2QRSO7aS/qqk2Ad+nlNI2SeBTrcarIZFmbnQrt5
         yxKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pnQXJEfKtJWcuVWbQohanGmntCKjaSRrPoLPrhhtwvI=;
        b=UahznLjJWYCtu8C8Ab5Z9uinqF+oVVQJ9VzDzPTdyc/S1reftuTo/8X3tNA4fCV9SN
         WZz7Ilbpl7Eow67hvZIbS5UhVB2ZLqYhQ29yUA2PrGGclHM7y43ocg/o3EMps65EH1sN
         XdZSJaHkrtg3Ri6UN6/VAPuxuBWmwcHc4yIdgTfUtoCoFQFU1SuO6227emfAM7JpVF2u
         aIMbX2C3ka/9Ll8hD6BQtbxRx9Gy0ogRHp8CExLrzCgCbwT0xbmsFEkj8HInUTzYUzFl
         zncjPPX2K7X9xMieSWfS8aQzLH7AhoZSO+UQDG0C/98ycgEIlX085UrTU2PM04p22AEk
         LpQQ==
X-Gm-Message-State: AOAM532dwAywBihJa4Y3mWzKJUJeqZwIbFHgfpqkndwUuZK/cyjEMCyx
	Rg22QFxWecb9YtkA+xmVy8VdJNX5F5ITiF9C6w8=
X-Google-Smtp-Source: ABdhPJzAAeZBLu4nr/XXIMUUUS9wURJal6F7deS/7PsOpauoQslGd/0swoPbf3W1WeCygZ7WBdF4rCwy0EF4HcmS7GM=
X-Received: by 2002:a17:906:b43:: with SMTP id v3mr15721791ejg.439.1613581125353;
 Wed, 17 Feb 2021 08:58:45 -0800 (PST)
MIME-Version: 1.0
References: <20210217040033.21541-1-idadelm@gmail.com> <d2c6bc1c604946f799ea00ec68ee6209@XBOX03.axis.com>
In-Reply-To: <d2c6bc1c604946f799ea00ec68ee6209@XBOX03.axis.com>
From: "Meh Mbeh Ida Delphine" <idadelm@gmail.com>
Date: Wed, 17 Feb 2021 17:58:33 +0100
Message-ID: <CAN7sTgvSHSbPAMrtbHcTU1B_f+LoXBZMeetuXAb7C5mj_iAcfQ@mail.gmail.com>
Subject: Re: [OE-core] [poky-contrib][RFC PATCH 0/5] Suggestions for improvements?
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000cb039205bb8b2178"

--000000000000cb039205bb8b2178
Content-Type: text/plain; charset="UTF-8"

Please what exactly didn't match?

Ida

On Wed, Feb 17, 2021 at 4:50 PM Peter Kjellerstedt <
peter.kjellerstedt@axis.com> wrote:

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
> > false positives. I got rid of these by replacing "or-later" with "+" for
> > source licenses (computedpkglics) and also passing the recipe license
> > through canonical_license of license.py(). As a result, some of the
> > licenses will match during comparism hence some warnings eliminate.
> >
> > Though some false positive warnings were eliminated, lots of warnings
> were
> > ouputed as a result of several source licenses having "WITH
> Linux-syscall-
> > note". With the help of a variable being set in local.conf, one can
> > chooses whether or not to get lid of the "WITH Linux-syscall-note" string
> > from the source licenses. Just by doing this, several warnings are
> dropped
> > and now left with 118.
> >
> > I later on added some logic depending on "source_spdx_license" variable
> > whether or not for the user to allow the warnings being outputed during
> > the build. It reduces the extra processing and reduces time if the user
> > chooses not to display warnings. It uses bb.utils.contains() to find out
> > if that particular vaiable is present. Also, I added
> > package_qa_handle_error() to allow the user decide whether they want the
> > issues treated as warnings, errors or not at all.
> >
> > Some of the license-related logic I added to take care of splitting
> recipe
> > licences before canonicalizing, getting rid of "or-later" warnings, I
> > moved it to license.bbclass and put it in functions. I also plan on
> fixing
> > the variable naming since some have underscores whereas others do not
> > have. However, I will love to move more license logic in package.bbclass
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

--000000000000cb039205bb8b2178
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Please what exactly didn&#39;t match? <br></div><div>=
<br></div><div>Ida<br></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Wed, Feb 17, 2021 at 4:50 PM Peter Kjeller=
stedt &lt;<a href=3D"mailto:peter.kjellerstedt@axis.com">peter.kjellerstedt=
@axis.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">I tried to apply these patches, but the context does not match. =
Are <br>
there other patches I need to apply before these can be applied?<br>
<br>
//Peter<br>
<br>
&gt; -----Original Message-----<br>
&gt; From: <a href=3D"mailto:openembedded-core@lists.openembedded.org" targ=
et=3D"_blank">openembedded-core@lists.openembedded.org</a> &lt;openembedded=
-<br>
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
&gt; 2.25.1<br>
<br>
</blockquote></div>

--000000000000cb039205bb8b2178--
