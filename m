Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web08.13588.1605643223741316038
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2020 12:00:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jffMs7zo;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id y17so25518942ejh.11
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2020 12:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jryUoqxw1K2oAZEdaw23Ts72T0uSG8n6SqeZba48yDQ=;
        b=jffMs7zo4VganOawFsrMiB4cn/h0Naz+O71XVKt7Sm3f7NB58mlgxN+Fc411IRd8RT
         XG45Wu9j5rkwYlP/phcqxDh5vYVZus2TDyStohJduWOtgLVNOeerWgXM0ocebR8MZSDf
         XOSo7ywEymia/lX86RA+6/c68ypUo5VAjvaawHbco5y87PmDgkv8v5QvtKDAw1Pv/+uS
         /N5Ww1x4bSMVRXdQ8qK4B92SYecJkJ+CnXX7I0SwMXWJo1LPWrtXs9DaL9EtXcH81lIj
         mankA9mcGgzP4zybriuT4NmtKW7xpBWPO4jzaSnZyjKSdzO48rHtO/+bMv1+LHCxRK0b
         Rccw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jryUoqxw1K2oAZEdaw23Ts72T0uSG8n6SqeZba48yDQ=;
        b=quRdVbGMN5b5WH3MDdChicEMqMudBqMWxoatKMiXl9PtDkmPguRUtBZiI1nso1cmnn
         aJEFvWOeHtO6UCti/DTuNlCnCdS93uzigza5SW1jmvJtFbBqz15trKmH3JFcPzsMpEwy
         aAFgkfKq+gZ8dnTDNt//zEQ1xr8LtuectVEZ/N1iGYYOkv1iVfimmcQ72FxgRl7u80qE
         gScFPF99x/JAav7OQy9SrboBIohGPm2yPcIKVH0Sllg2jFAPUZIrt74uqtRDHoyRA+UX
         GLq7m8wjsjzX7NZFBuBzZHmfpA/q3cA+NBqB6iCuE5zDyWja8yCaT7TNgRDhBvsOgSsW
         +RCg==
X-Gm-Message-State: AOAM532ciBfsscojB27qU7wYtrn9vEAIh35qTSvp6h7DYfbC7LzIcAgp
	6tGEZABl+Qev+ku+i3CxoaLbVjXD/Lr8auDVzxM=
X-Google-Smtp-Source: ABdhPJzb1Z4b7aOl8iEyqnoNfu0tscC+g5kJvZn4jkwMsY0wPHW/CQo3IXu9vDEYiws2W5UyfzmQAExPluT+K16tVQc=
X-Received: by 2002:a17:906:4dd4:: with SMTP id f20mr20801924ejw.94.1605643222212;
 Tue, 17 Nov 2020 12:00:22 -0800 (PST)
MIME-Version: 1.0
References: <20201117065508.1575532-1-raj.khem@gmail.com> <CANNYZj-mVEE0vD8tpJQTPvA_+0Ny7JNk0co97xU5gs+U=PbUOg@mail.gmail.com>
 <CA+chaQcyh_i92pMt32-iiehDsxr1TyhF5pNKiRQstwPz7UVArQ@mail.gmail.com>
 <CANNYZj-SwsznTXvooSHeVijaUPVPgBBN_gFfKednZCe-OGcdow@mail.gmail.com>
 <CAMKF1sqzEw8sAhzsUvPz6rB1OR=i8Cg7-2WUtpjW8tmS3HGF_Q@mail.gmail.com>
 <CANNYZj_Eu38-cpsb767mdgqLn6SEXjdfiJKdQheRWuZv47FYAQ@mail.gmail.com> <CAMKF1sq77HcFtdxMODMk231BfW0=vqCV+BL4vOTpcKcAMVTBoA@mail.gmail.com>
In-Reply-To: <CAMKF1sq77HcFtdxMODMk231BfW0=vqCV+BL4vOTpcKcAMVTBoA@mail.gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Tue, 17 Nov 2020 21:00:10 +0100
Message-ID: <CA+chaQdg9wcYFrOuU6zTMMib-Rp0hNYSn_AC3RjFvBwpXM-J4w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] distutils3-base.bbclass: Inherit python3targetconfig only for target recipes
To: Khem Raj <raj.khem@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000e5651905b452f165"

--000000000000e5651905b452f165
Content-Type: text/plain; charset="UTF-8"

And there are some cases where we need only native recipe and creating a
target one just to BBCLASSEXTEND seems worse than the current state with
native.bbclass.

Or there are some cases where the native build is so significantly
different from the target one, that using BBCLASSEXTEND just makes it more
difficult to read without any benefit.

So please don't remove the option to just inherit native if there aren't
any technical reasons to do that.

On Tue, Nov 17, 2020 at 7:09 PM Khem Raj <raj.khem@gmail.com> wrote:

> On Tue, Nov 17, 2020 at 9:33 AM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > On Tue, 17 Nov 2020 at 16:41, Khem Raj <raj.khem@gmail.com> wrote:
> >>
> >> On Tue, Nov 17, 2020 at 1:19 AM Alexander Kanavin
> >> <alex.kanavin@gmail.com> wrote:
> >> >
> >> > Yes - and if python3-scons-native is the only such recipe we can
> find, I think it's better to merge the recipe with the target one.
> >> >
> >> python3-scons-native is just a manifestation of a larger problem which
> >> is a regression and this suggestion compounds the problem by setting
> >> an unequal rule where non-python packages can
> >> have a native-recipe and recipe but python ones can not, therefore we
> >> need to fix this properly in core classes instead.
> >
> >
> > If non-python native-only recipes inherit something that DEPENDS on a
> target item, they will have the exact same problem. This is what needs
> fixing - but not by special-casing DEPENDS in every class where it happens,
> or might happen.
> >
>
> keep this issue aside and think in a generic way about how recipes can
> be written regardless of native or not. behavior has to be consistent
>
> > I'd rather convert all native-only recipes to target ones +
> BBCLASSEXTEND, so it works the same way everywhere, and minimizes surprises.
> >
>
> that's wishful, there are a lot of layers that will have to also
> change, and we have to change the semantics of native recipes where
> BBCLASSEXTEND is the only way to do them.
>
>
> > Alex
> >
>

--000000000000e5651905b452f165
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">And there are some cases where we need only native recipe =
and creating a target one just to BBCLASSEXTEND seems worse than the curren=
t state with native.bbclass.<div><br></div><div>Or there are some cases whe=
re the native build is so significantly different from the target one, that=
 using BBCLASSEXTEND just makes it more difficult to read without any benef=
it.</div><div><br></div><div>So please don&#39;t remove the option to just =
inherit native if there aren&#39;t any technical=C2=A0reasons to do that.</=
div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Tue, Nov 17, 2020 at 7:09 PM Khem Raj &lt;<a href=3D"mailto:raj.khem=
@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">On Tue, Nov 17, 2020 at 9:33 AM Alexander Kan=
avin<br>
&lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavi=
n@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Tue, 17 Nov 2020 at 16:41, Khem Raj &lt;<a href=3D"mailto:raj.khem@=
gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On Tue, Nov 17, 2020 at 1:19 AM Alexander Kanavin<br>
&gt;&gt; &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">al=
ex.kanavin@gmail.com</a>&gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Yes - and if python3-scons-native is the only such recipe we =
can find, I think it&#39;s better to merge the recipe with the target one.<=
br>
&gt;&gt; &gt;<br>
&gt;&gt; python3-scons-native is just a manifestation of a larger problem w=
hich<br>
&gt;&gt; is a regression and this suggestion compounds the problem by setti=
ng<br>
&gt;&gt; an unequal rule where non-python packages can<br>
&gt;&gt; have a native-recipe and recipe but python ones can not, therefore=
 we<br>
&gt;&gt; need to fix this properly in core classes instead.<br>
&gt;<br>
&gt;<br>
&gt; If non-python native-only recipes inherit something that DEPENDS on a =
target item, they will have the exact same problem. This is what needs fixi=
ng - but not by special-casing DEPENDS in every class where it happens, or =
might happen.<br>
&gt;<br>
<br>
keep this issue aside and think in a generic way about how recipes can<br>
be written regardless of native or not. behavior has to be consistent<br>
<br>
&gt; I&#39;d rather convert all native-only recipes to target ones + BBCLAS=
SEXTEND, so it works the same way everywhere, and minimizes surprises.<br>
&gt;<br>
<br>
that&#39;s wishful, there are a lot of layers that will have to also<br>
change, and we have to change the semantics of native recipes where<br>
BBCLASSEXTEND is the only way to do them.<br>
<br>
<br>
&gt; Alex<br>
&gt;<br>
</blockquote></div>

--000000000000e5651905b452f165--
