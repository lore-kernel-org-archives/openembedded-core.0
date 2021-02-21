Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web08.16033.1613876687621182541
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Feb 2021 19:04:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=r6Us1e8P;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: idadelm@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id e13so20091714ejl.8
        for <openembedded-core@lists.openembedded.org>; Sat, 20 Feb 2021 19:04:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XoN5jrgkBHlO/z/V8ouYr2fUHX7fNM49S99Eeqn+eEM=;
        b=r6Us1e8PC6egkfXFSpA4MeTA/V1Qs4zoWxPp73o7NyRqRJWpdwbP3qq540znjTtHzy
         9Ies2CAtZtVu0Oxv1UmN2xmfAjuAAMfP1/zxgtu22HwwfReBQ0e7Jfye/pwa2A6WL3mU
         6fTQt/eemtHo0qIl22nSQLgN3TSmqeaOTKM5uMV7hSV+PtF1jxTa8YZRwYGyuLGq1d8o
         o2aoXf2iNtG+jwp9w6yuxYfHc5lTZeiEq18Do051BdbEBq/S+JBCsE4dl3288HF73/4g
         d4w4NLmdYQ1Tv0Y8VihLm8U8yg0SIZW+lpq45pG4YraGDnInrM8Cukj/YtNSWbj2kCE1
         jWNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XoN5jrgkBHlO/z/V8ouYr2fUHX7fNM49S99Eeqn+eEM=;
        b=Sxx+O3P4YWW+WlEf6ftcr7gkqULUeI9xKOuJ51150FvxrJfFgLQQf4Naz4rajSgFhQ
         Y3ECFFODd1mbA7S7zD5uxk/zI2X7czQ6+hL1Uclccpbp11y1zFmjpyiPxsvIk5cTRiev
         QEFmWe2xOm/l8ogS1VjEHRKo//ZzWJ7cbJPrcZlaXFGo4avB2wmXwXk32Q7ADIVZAyHo
         iHwaec1CCSYUcFUxmutXVMLB9BWPLGxZoXF6nQzKq9qJ/pB37IdutY6/LLlMQgWp2tio
         P7Q8Mu6Jpf/Vist7KC868xuTrvPoSJrqw9I2ARBCZlUVnbK7kScgtUfblI8Vs7uNo+i5
         Ox9w==
X-Gm-Message-State: AOAM531BqH2fRzltHJR3vUla+WDXHXYZr5iLXjYcjKmQnp7v5DyEYjR5
	UoN5nYl+jJsKYheEjPiEs7xhBaMMoSogUVqmB4Q=
X-Google-Smtp-Source: ABdhPJxoGvdB7sGsHTEI/+D8jqin/r8AEhxZ8juJiUaBturitwUv2uSD0eaVvZToruqNO5al1FhoOemsfySe6gHWN6M=
X-Received: by 2002:a17:906:780b:: with SMTP id u11mr15326330ejm.492.1613876685993;
 Sat, 20 Feb 2021 19:04:45 -0800 (PST)
MIME-Version: 1.0
References: <20210217040033.21541-1-idadelm@gmail.com> <20210217040033.21541-5-idadelm@gmail.com>
 <2efffee96fae455b8cdb77d47c576bfe@XBOX03.axis.com> <06102c024bfec00745d9b2dbde8b19a7fb4207b8.camel@linuxfoundation.org>
 <CAN7sTgsoLjsnao0ijuidAP_hjTQyibeU7MWHXybbROTU0k290g@mail.gmail.com> <a04c7bcd2ac63ea7a9971f011c4755f741deaaed.camel@linuxfoundation.org>
In-Reply-To: <a04c7bcd2ac63ea7a9971f011c4755f741deaaed.camel@linuxfoundation.org>
From: "Meh Mbeh Ida Delphine" <idadelm@gmail.com>
Date: Sun, 21 Feb 2021 04:04:34 +0100
Message-ID: <CAN7sTgsLSTjyLvPrtUVjhEBxh1bOVRHkp+9DkO6rEQ4=uJtTNA@mail.gmail.com>
Subject: Re: [OE-core] [poky-contrib][RFC PATCH 4/5] license.bbclass: Add functions to split and canonicalise license strings
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000094770a05bbcff222"

--00000000000094770a05bbcff222
Content-Type: text/plain; charset="UTF-8"

Hi Richard,

About moving the functions to license.py I have some trouble importing a
.bbclass file to the python file. In one of the functions I made use of a
function found in license.bbclass. Just wondering why it's better to move
the functions to license.py instead of leaving them at license.bbclass and
how I will deal with this import issue

Cheers,
Ida

On Wed, Feb 17, 2021 at 9:51 PM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Wed, 2021-02-17 at 17:55 +0100, Ida Delphine wrote:
> > Thanks for the feedback. I will get rid of the logic to take care of
> > those licenses with "or-later" and move the functions to license.py.
> > Does this also mean I shouldn't try removing "WITH-Linux-syscall-note"
> > from the licences?
>
> I think the idea of what you're looking at is to remove "noise" from the
> output and see if we can identify real licence issues. Removing the
> "XXX WITH-Linux-syscall-note" where XXX is removed is key to that but
> XXX must me removed too.
>
> > The point of me doing that was for there to be more matches and the
> > number of warnings reduced.
>
>
> > Also there is more license-related logic in package.bbclass. Will it
> > be okay if I move it as well to meta/lib/oe/license.py putting it
> > in functions?
>
> Possibly, but please do it in a separate patch which we can evaluate
> on its own merit, I haven't looked at which code you mean so its hard
> to tell offhand.
>
> Cheers,
>
> Richard
>
>

--00000000000094770a05bbcff222
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Richard,</div><div><br></div><div>About moving the=
 functions to license.py I have some trouble importing a .bbclass file to t=
he python file. In one of the functions I made use of a function found in l=
icense.bbclass. Just wondering why it&#39;s better to move the functions to=
 license.py instead of leaving them at license.bbclass and how I will deal =
with this import issue</div><div><br></div><div>Cheers,</div><div>Ida<br></=
div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Wed, Feb 17, 2021 at 9:51 PM Richard Purdie &lt;<a href=3D"mailto:ri=
chard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed,=
 2021-02-17 at 17:55 +0100, Ida Delphine wrote:<br>
&gt; Thanks for the feedback. I will get rid of the logic to take care of=
=C2=A0<br>
&gt; those licenses with &quot;or-later&quot; and move the functions to lic=
ense.py.=C2=A0<br>
&gt; Does this also mean I shouldn&#39;t try removing &quot;WITH-Linux-sysc=
all-note&quot;=C2=A0<br>
&gt; from the licences?<br>
<br>
I think the idea of what you&#39;re looking at is to remove &quot;noise&quo=
t; from the=C2=A0<br>
output and see if we can identify real licence issues. Removing the=C2=A0<b=
r>
&quot;XXX WITH-Linux-syscall-note&quot; where XXX is removed is key to that=
 but=C2=A0<br>
XXX must me removed too.<br>
<br>
&gt; The point of me doing that was for there to be more matches and the=C2=
=A0<br>
&gt; number of warnings reduced.<br>
<br>
<br>
&gt; Also there is more license-related logic in package.bbclass. Will it=
=C2=A0<br>
&gt; be okay if I move it as well to meta/lib/oe/license.py putting it=C2=
=A0<br>
&gt; in functions?<br>
<br>
Possibly, but please do it in a separate patch which we can evaluate=C2=A0<=
br>
on its own merit, I haven&#39;t looked at which code you mean so its hard=
=C2=A0<br>
to tell offhand.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div>

--00000000000094770a05bbcff222--
