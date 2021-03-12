Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web08.1394.1615570170364124983
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Mar 2021 09:29:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZE648ymz;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: idadelm@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id k16so1298171ejx.1
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Mar 2021 09:29:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vI5fxk6w5b4h3e496zMjuDDbxraGZsSvK/1BdfwNoyM=;
        b=ZE648ymzY+h5iZBa+6jukzY3I0QAVy/TmONFeJ6x+Lm3iBQHmG5Y2oWf3yKTTGrJqD
         0i4VaJzy/FSn7AyAJq2w3vJ7hLuqxkUtYzy/BacGx+7tDdzZu3Wf5HYpVypi/MPYyoOt
         B0pp5iuwjUKvfzP3nroO1kbWnjWxf4Zw8ZdX5iBTD6icx6nlphPfkGgC2+wTPCknrddd
         Dr/mSvXnLClkospuTBEpGIIxXVc1autZZiA3jdm+SnefUhyspyfnNT3eo7aGaAlm6CAR
         2AYomxoxaoDMaPgMn+0LtE1DB1bdQXEovD6lpXQGfl6yy7RDV4BO5/prRC9XJ3mq3+jF
         PINQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vI5fxk6w5b4h3e496zMjuDDbxraGZsSvK/1BdfwNoyM=;
        b=VSEEiPzi/VGPw+qs9a0wpmU4GGEP6Da7o6YoiE64Um7wloBMFKOMdIO9dauUU/oCye
         S4/a4oZHartMyDbI43r+VKh3GJjmSZNe2rpZUv0QcF3xfxaObra2N5CAH3VGNw2lMIWe
         9akJi2d8D6gwQYoEigYxXG3drRTkGt+7N06yBNkZftUwve3jqzYSN/JySDL2PoEsZPC7
         IoOZy7972bPhF7UU1wwYy/JEq/OYE98KIHt5ek6d4UJ2wjCjdQcGtxtHSAi+8WzQnKC+
         t+oiBUlDVmFbTXqZ31ZJDB75pEvLHyosXnJnFAi5Exhp+FODBNL1sHT03Z6XHgR5TUtr
         s3zQ==
X-Gm-Message-State: AOAM531dTu2NpsusT8fjyQuddNtuRAn6rQqN1csSFvHskurxmyt3EI0B
	ERfa9jO/bVgIaLZybsezZGkAtKy7PoQb8Rg12O0=
X-Google-Smtp-Source: ABdhPJz9C/y0Dp0CP0F3+eKUqIevEANkfq2UA0i0Yk9eA4ikYKCH0c2JycnMdpvDHQ+QmP2HOMWIxXvEVfCnqynijh8=
X-Received: by 2002:a17:906:780b:: with SMTP id u11mr9928587ejm.492.1615570168866;
 Fri, 12 Mar 2021 09:29:28 -0800 (PST)
MIME-Version: 1.0
References: <20210309233130.104839-1-idadelm@gmail.com> <20210309233130.104839-3-idadelm@gmail.com>
 <0e7e667066734d1c9276c1730742c659@XBOX03.axis.com> <CABcZAN=e_-OTy0x8jsiEb1-ysqfP6fqf27BoG9ZE63dzkGm_Ug@mail.gmail.com>
 <9e6ab3f507f8325cb41a6caff9c1dcaca8c9b23d.camel@linuxfoundation.org>
In-Reply-To: <9e6ab3f507f8325cb41a6caff9c1dcaca8c9b23d.camel@linuxfoundation.org>
From: "Meh Mbeh Ida Delphine" <idadelm@gmail.com>
Date: Fri, 12 Mar 2021 18:29:16 +0100
Message-ID: <CAN7sTgsA=9=JSsAkGgKJRy0Wdz3=dc+3CVZPcPiP=TavFw6=BA@mail.gmail.com>
Subject: Re: [OE-core] [poky-contrib][PATCH 3/4] package.bbclass: Add handle_qa_error check
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Christopher Larson <kergoth@gmail.com>, Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000066be605bd5a3e05"

--000000000000066be605bd5a3e05
Content-Type: text/plain; charset="UTF-8"

Thanks for the feedback. I will make the changes accordingly. I was hoping
to document a in the manual after getting feedback in case there are
corrections that need to be made.

Cheers,
Ida.

On Fri, 12 Mar 2021, 5:59 pm Richard Purdie, <
richard.purdie@linuxfoundation.org> wrote:

> On Fri, 2021-03-12 at 09:54 -0700, Christopher Larson wrote:
> > Indeed, bitbake only requires python 3.5.0 right now, we can't use
> >  3.6 or 3.7 features in it or oe-core at this time.
>
> We did increase the version requirement to 3.6:
>
>
> http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=c08279f9c3a0260f80fb0948520a24bf2fcdb422
>
> at least in OE-Core.
>
> Cheers,
>
> Richard
>
>

--000000000000066be605bd5a3e05
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Thanks for the feedback. I will make the changes accordin=
gly. I was hoping to document a in the manual after getting feedback in cas=
e there are corrections that need to be made.<div dir=3D"auto"><br></div><d=
iv dir=3D"auto">Cheers,</div><div dir=3D"auto">Ida.</div></div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, 12 Mar 202=
1, 5:59 pm Richard Purdie, &lt;<a href=3D"mailto:richard.purdie@linuxfounda=
tion.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">On Fri, 2021-03-12 at 09:54 -0700, Christopher Lar=
son wrote:<br>
&gt; Indeed, bitbake only requires python 3.5.0 right now, we can&#39;t use=
<br>
&gt;=C2=A0 3.6 or 3.7 features in it or oe-core at this time.<br>
<br>
We did increase the version requirement to 3.6:<br>
<br>
<a href=3D"http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=3Dc08279f9c=
3a0260f80fb0948520a24bf2fcdb422" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=3Dc08279f9c3a026=
0f80fb0948520a24bf2fcdb422</a><br>
<br>
at least in OE-Core.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div>

--000000000000066be605bd5a3e05--
