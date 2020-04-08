Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web12.8972.1586342349345928446
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Apr 2020 03:39:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Uq9MypS7;
 spf=pass (domain: gmail.com, ip: 209.85.208.173, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id z26so2951780ljz.11
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2020 03:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KDgM2ju4zhDYpPa1h950Bvj0xR9Y31BkGvGqvjgQe2I=;
        b=Uq9MypS7mIkuXR7ytIj1UhLqf6lYYY//rBkQU7JDoRhcv2zsSBe9lCH32YA5zfBlO1
         PeFH6s0fZjMihICg0a0TUrSWrx9cNURgtII3sjrF8abBeg0JUf6XgeX48NCJF5Ae7M4a
         3rIphIjjzHkLe50VbD7jxtHti2uJ13YzF/NTuJKR8LNHjyovx0AGLno+QBHrGku8wPzu
         sPX4U3mrqWfL6V4Sar+2wq44dheKvrKnJlkjSGYeYGN448qTwZ3IFEUTgDdxE9A/GoVe
         DImN9/NWJyTrnoCYZg4G97B/BmkWw5cwdn4xqz7lRRh5oJf5dDoTxm9BVHKkZR+J8ubV
         HhXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KDgM2ju4zhDYpPa1h950Bvj0xR9Y31BkGvGqvjgQe2I=;
        b=Vkf3r9GuMkV6V6C2eZtbR+w4MrwqT8DWhGPQjmhThr2IZX4ESou6bJDj857VSAzoNh
         alV3SzL+alGwDX0jVhLM3t9jjSgLB+XNVh2wjL+25x4akpsFgS9/nUng2D3jRqtkO9dR
         lAe8e7ccFtQuwjOBQ/1vS6Pus2AjiUvTPkHFwYBxpy+CxvcILl73BtKoGVQOUDEiE5lw
         m767sKk6UC9+nu3WClp3Mu4w/XDn5CCpTSCaQ5vcND7Fu3/gKdT2yZ9pKAikfmksu3BX
         6xayoHwmThynyqq4qqb2Q2ZpxLQgU8uoCnT0xgaowqUwBd9zePvuZq1OyxjtJz1c6MPF
         FMCg==
X-Gm-Message-State: AGi0PuaUEicrdNe8KhMqH1rWENfaQ2Weahx4JefEclqZaPdLDgrRaCeO
	VWnRqL6Q2yavGQ4TrEGfD3fja5K5Bgj1vkHWBNY=
X-Google-Smtp-Source: APiQypI6rTJGY7L9PPQUj/FIY6z7lj41x0/Yo8iPOhrIfJ18uIR8BBbt97GA+WfEmqGtvR/V0TBmlBjssOp8enH40Mo=
X-Received: by 2002:a2e:7e06:: with SMTP id z6mr4746564ljc.60.1586342347345;
 Wed, 08 Apr 2020 03:39:07 -0700 (PDT)
MIME-Version: 1.0
References: <CADySD0GO0510UjoSWx=sK9oiyCFCJanB7-C7Ph6y62BtOmfNXA@mail.gmail.com>
 <20200408064233.GE104502@korppu>
In-Reply-To: <20200408064233.GE104502@korppu>
From: "Ankur Tyagi" <ankur.tyagi85@gmail.com>
Date: Wed, 8 Apr 2020 22:38:56 +1200
Message-ID: <CADySD0EXOCLT=bT8qZ2RqNWvmdQcWAzuqXon+Rn1xxJQr7OMrg@mail.gmail.com>
Subject: Re: [OE-core] Including vendor's pre-built binary in image
To: Mikko.Rapeli@bmw.de
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000001b12a005a2c51ca7"

--0000000000001b12a005a2c51ca7
Content-Type: text/plain; charset="UTF-8"

Hi,

Ideally yes but vendor won't be able to do so.
I am looking for a fix at my end.

thanks
Ankur

On Wed, Apr 8, 2020 at 6:42 PM <Mikko.Rapeli@bmw.de> wrote:

> Hi,
>
> On Wed, Apr 08, 2020 at 01:52:47PM +1200, Ankur Tyagi wrote:
> > Hi,
> >
> > I am sure this is not being discussed for first time and I tried
> > all suggested solution in previous emails but none worked hence I am
> asking
> > again.
> >
> > Trying to include a pre-built binary from vendor in my image but getting
> > following QA error:
> >
> > ERROR: my-recipe-1.0-r0 do_package_qa: QA Issue: /etc/vendor/tool
> contained
> > in package my-recipe requires libstdc++.so.6(CXXABI_1.3), but no
> providers
> > found in RDEPENDS_my-recipe ? [file-rdeps]
> > ERROR: my-recipe -1.0-r0 do_package_qa: QA Issue: /etc/vendor/tool
> > contained in package my-recipe requires libstdc++.so.6(GLIBCXX_3.4), but
> no
> > providers found in RDEPENDS_my-recipe ? [file-rdeps]
> > ERROR: my-recipe -1.0-r0 do_package_qa: QA run found fatal errors. Please
> > consider fixing them.
> > ERROR: my-recipe -1.0-r0 do_package_qa: Function failed: do_package_qa
> >
> > I have tried following in my-recipe_1.0.bb but error still persists
> > RDEPENDS_${PN} += "libstdc++6"
>
> This shared library comes from gcc-runtime recipe and libstdc++ binary
> package
> (before name manglings). buildhistory helps with cases like this.
>
> I would write recipes for all binaries and make sure all QA checks are
> passing
> with them. Best way is to get vendors to compile with your SDK.
>
> Cheers,
>
> -Mikko
>
> >
> > How can I fix this?
> >
> > thanks
> > Ankur
>
> > 
>

--0000000000001b12a005a2c51ca7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-family:verdana,sans-serif">Hi,</div><div class=3D"gmail_default" style=3D=
"font-family:verdana,sans-serif"><br></div><div class=3D"gmail_default" sty=
le=3D"font-family:verdana,sans-serif">Ideally yes but vendor won&#39;t be a=
ble to do so.</div><div class=3D"gmail_default" style=3D"font-family:verdan=
a,sans-serif">I am looking for a fix at my end.</div><div class=3D"gmail_de=
fault" style=3D"font-family:verdana,sans-serif"><br></div><div class=3D"gma=
il_default" style=3D"font-family:verdana,sans-serif">thanks</div><div class=
=
=3D"gmail_default" style=3D"font-family:verdana,sans-serif">Ankur</div></d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On =
Wed, Apr 8, 2020 at 6:42 PM &lt;<a href=3D"mailto:Mikko.Rapeli@bmw.de">Mikk=
o.Rapeli@bmw.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">Hi,<br>
<br>
On Wed, Apr 08, 2020 at 01:52:47PM +1200, Ankur Tyagi wrote:<br>
&gt; Hi,<br>
&gt; <br>
&gt; I am sure this is not being discussed for first time and I tried<br>
&gt; all suggested solution in previous emails but none worked hence I am =
asking<br>
&gt; again.<br>
&gt; <br>
&gt; Trying to include a pre-built binary from vendor in my image but gett=
ing<br>
&gt; following QA error:<br>
&gt; <br>
&gt; ERROR: my-recipe-1.0-r0 do_package_qa: QA Issue: /etc/vendor/tool con=
tained<br>
&gt; in package my-recipe requires libstdc++.so.6(CXXABI_1.3), but no prov=
iders<br>
&gt; found in RDEPENDS_my-recipe ? [file-rdeps]<br>
&gt; ERROR: my-recipe -1.0-r0 do_package_qa: QA Issue: /etc/vendor/tool<br=
>
&gt; contained in package my-recipe requires libstdc++.so.6(GLIBCXX_3.4), =
but no<br>
&gt; providers found in RDEPENDS_my-recipe ? [file-rdeps]<br>
&gt; ERROR: my-recipe -1.0-r0 do_package_qa: QA run found fatal errors. Pl=
ease<br>
&gt; consider fixing them.<br>
&gt; ERROR: my-recipe -1.0-r0 do_package_qa: Function failed: do_package_q=
a<br>
&gt; <br>
&gt; I have tried following in <a href=3D"http://my-recipe_1.0.bb" rel=3D"=
noreferrer" target=3D"_blank">my-recipe_1.0.bb</a> but error still persists=
<br>
&gt; RDEPENDS_${PN} +=3D &quot;libstdc++6&quot;<br>
<br>
This shared library comes from gcc-runtime recipe and libstdc++ binary pac=
kage<br>
(before name manglings). buildhistory helps with cases like this.<br>
<br>
I would write recipes for all binaries and make sure all QA checks are pas=
sing<br>
with them. Best way is to get vendors to compile with your SDK.<br>
<br>
Cheers,<br>
<br>
-Mikko<br>
<br>
&gt; <br>
&gt; How can I fix this?<br>
&gt; <br>
&gt; thanks<br>
&gt; Ankur<br>
<br>
&gt; <br>
</blockquote></div></div>

--0000000000001b12a005a2c51ca7--
