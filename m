Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web09.11830.1615394150980568389
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Mar 2021 08:35:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uFds0sYW;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id t16so1053933qvr.12
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Mar 2021 08:35:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=X5SPhVeG/wBpmpXJTTbUfNFuemkHyOdrgyV8E5mCBUo=;
        b=uFds0sYWT3/v8fzSL7vF0R3qYYdVmuiMOfBtEyAbQoMvPgEYISyun7HgkEjK7l96Jn
         Vk0+V7OB4wPL70f+IFtuGFK3/76Fta7GfEeSLk8Gz4aLqwMYkWmRtLwsJFEAp+mfX4l6
         vzt2G6rTG0T44f8DUs0Yzgn8+gFS/MwYQ30MaXWFty/OD4a9+J/LTYWGgC5+2JuauW/S
         RIxglRt6I8o40a5Ma/MapFVq3PN5vx9dTXVjpSXQEzHz1T+EszFpj9XQd02tiq9ILEez
         o//gX5wyosX+IHQ+yxKWTqhVfBsEzInHWOMiz/n1HF6MIyO6BHCCXxzVP9h6WqAr/RRI
         sDZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=X5SPhVeG/wBpmpXJTTbUfNFuemkHyOdrgyV8E5mCBUo=;
        b=Inp5J6Ndi1XhnxKKEPpBZlH5x7CfHpCWJFtu7hzhAufKiIYQHNSjz3pyE72H56yTUV
         a9LlBu/XSTn9RbveSwKDgpPQv500VVS1auGc0JHQU6x3SignDR48xGwA6+/7lxmYEQNT
         hUFSYfFPwKNxT5pdl8CXHpYdS+EL0KNVUmbS+SoKYKlYWfeQ6Vf4QDw7b6vISde14FFv
         bciaFPEpHCKuMUv6QkovAfJCOCEk2BhPOuJUtfHwIaqL5LD38OuSMp06yu68bP9PC/Di
         xnrdmmDFniqdSU0nhj2vEa5bAb3be6rJv+spX3KMRyF2KD1ItgT/+JjIzko6T7oaObtE
         pDtQ==
X-Gm-Message-State: AOAM532Lk1LjfL9XM+IHKqY5foKO3xpfSvqV6jZFCOgAUD0PidFbdLKX
	bo5J9ekSMJGhEOyoyleM/onOMt+ricni7XLTagKbvTTZBUg=
X-Google-Smtp-Source: ABdhPJy4QFW2Z1eKABtL/mSKPF0LqH5Ny86nsgirLoQ9MCI0eenjiMcDQoFAmgaI/oJky2F5j7hBE/mU5pUEw6HlgWc=
X-Received: by 2002:a05:6214:80d:: with SMTP id df13mr3590809qvb.55.1615394149950;
 Wed, 10 Mar 2021 08:35:49 -0800 (PST)
MIME-Version: 1.0
References: <b0117e87-c17f-e22f-c2b9-868dd12ea09@crashcourse.ca>
 <cf23928e-ea00-6f4e-78b3-82bed1658fc1@gmail.com> <ed7fc1ff-d861-a0b9-e749-627193f3db66@crashcourse.ca>
In-Reply-To: <ed7fc1ff-d861-a0b9-e749-627193f3db66@crashcourse.ca>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 10 Mar 2021 08:35:39 -0800
Message-ID: <CAMKF1soLYJS7Gn8f6mYxhnesv5uXd2uA+NLZ=bNoixFdLMypRQ@mail.gmail.com>
Subject: Re: [OE-core] any reason for "cmake_" prefix on cmake_runcmake_build()?
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000007ae99705bd3142d5"

--0000000000007ae99705bd3142d5
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 10, 2021 at 3:38 AM Robert P. J. Day <rpjday@crashcourse.ca>
wrote:

> On Mon, 8 Mar 2021, Khem Raj wrote:
>
> >
> >
> > On 3/8/21 3:22 AM, Robert P. J. Day wrote:
> > >
> > >    collecting some examples of inheritance of class functions using
> > > EXPORT_FUNCTIONS, and ran across this routine in cmake.bbclass:
> > >
> > >    ... snip ...
> > >    cmake_runcmake_build() {
> > >  bbnote ...
> > >  eval ...
> > >    }
> > >
> > >    cmake_do_compile()  {
> > >          cmake_runcmake_build --target ${OECMAKE_TARGET_COMPILE}
> > >    }
> > >    ... snip ...
> > >
> > > what puzzles me is that the routine cmake_runcmake_build(), despite
> > > having a "cmake_" prefix, is not being exported with EXPORT_FUNCTIONS,
> > > so while that's a perfectly respectable function, it's not clear why
> > > it would have a "cmake_" prefix. is there some value to that prefix,
> > > or is it just arbitrary?
> >
> > it does not intend to provide a default function like do_compile
> do_install
> > exporting it is not necessary
>
>   no, that part i understand ... the nitpicky observation was the use
> of the "cmake_" prefix for a function which was not intended to be
> exported for the purpose of inheritance. sure, it's perfectly legal,
> but in a stylistic sense, it just leaves open the possibility of
> misinterpretation by someone reading the code.
>
>   a simpler style rule might be, "reserve classname_ prefixes for only
> those routines you plan on exporting." but i admit this is a quibble.


This is more towards code styling issue and we have not really bothered to
define such namespaces they cause more confusion than the problem they
solve since such things should be checked by linters other wise they fall
apart

>
>
> rday
>

--0000000000007ae99705bd3142d5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Mar 10, 2021 at 3:38 AM Robert P. J. Day &lt;<a hre=
f=3D"mailto:rpjday@crashcourse.ca">rpjday@crashcourse.ca</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex">On Mon, 8 Mar 2021, Khem Raj wrote:<br=
>
<br>
&gt;<br>
&gt;<br>
&gt; On 3/8/21 3:22 AM, Robert P. J. Day wrote:<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 collecting some examples of inheritance of class fun=
ctions using<br>
&gt; &gt; EXPORT_FUNCTIONS, and ran across this routine in cmake.bbclass:<b=
r>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 ... snip ...<br>
&gt; &gt;=C2=A0 =C2=A0 cmake_runcmake_build() {<br>
&gt; &gt;=C2=A0 bbnote ...<br>
&gt; &gt;=C2=A0 eval ...<br>
&gt; &gt;=C2=A0 =C2=A0 }<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 cmake_do_compile()=C2=A0 {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cmake_runcmake_build --target $=
{OECMAKE_TARGET_COMPILE}<br>
&gt; &gt;=C2=A0 =C2=A0 }<br>
&gt; &gt;=C2=A0 =C2=A0 ... snip ...<br>
&gt; &gt;<br>
&gt; &gt; what puzzles me is that the routine cmake_runcmake_build(), despi=
te<br>
&gt; &gt; having a &quot;cmake_&quot; prefix, is not being exported with EX=
PORT_FUNCTIONS,<br>
&gt; &gt; so while that&#39;s a perfectly respectable function, it&#39;s no=
t clear why<br>
&gt; &gt; it would have a &quot;cmake_&quot; prefix. is there some value to=
 that prefix,<br>
&gt; &gt; or is it just arbitrary?<br>
&gt;<br>
&gt; it does not intend to provide a default function like do_compile do_in=
stall<br>
&gt; exporting it is not necessary<br>
<br>
=C2=A0 no, that part i understand ... the nitpicky observation was the use<=
br>
of the &quot;cmake_&quot; prefix for a function which was not intended to b=
e<br>
exported for the purpose of inheritance. sure, it&#39;s perfectly legal,<br=
>
but in a stylistic sense, it just leaves open the possibility of<br>
misinterpretation by someone reading the code.<br>
<br>
=C2=A0 a simpler style rule might be, &quot;reserve classname_ prefixes for=
 only<br>
those routines you plan on exporting.&quot; but i admit this is a quibble.<=
/blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">This is more towa=
rds code styling issue and we have not really bothered to define such names=
paces they cause more confusion than the problem they solve since such thin=
gs should be checked by linters other wise they fall apart=C2=A0</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex" dir=3D"auto"><br>
<br>
rday<br>
</blockquote></div></div>

--0000000000007ae99705bd3142d5--
