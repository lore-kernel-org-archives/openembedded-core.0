Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web10.187.1622048999617516073
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 May 2021 10:09:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BHMXboen;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id s22so3577575ejv.12
        for <openembedded-core@lists.openembedded.org>; Wed, 26 May 2021 10:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NCNbROYWPONRo0KcKY1jlQ7tn1wrnZn9mzVJPWc2zJU=;
        b=BHMXboenqL6+elTnr4vwZInTFhoyEkUtMmhilPJ25AmajlZA69YkkYMYFtkWIx0BVK
         xzk19bbYM8BDeGB1JxLCu5OM55YO2wQBCurHNttM7x/9ZDhwEm6t32L53ACJBBeXQbBT
         Tp+6cshiODqd6FLuWXfhVacQ3bJY0VATIk+9yy9yGZ54QlKI5Dgw+CbV2x0FwR1FzJSv
         WMr+uYybg5kWoJoe2iaJ6RuSVX339oZZh3IHGq8lm3OTG05Of/cgMMG7Z5Bgc/cxTu05
         C7D9VjwhmV6EpTUNoEHX89yHTWvJ6/Wrsi8E/XFvqGdMM8UDigfeZjqBEh3qj8wtmnvr
         8pmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NCNbROYWPONRo0KcKY1jlQ7tn1wrnZn9mzVJPWc2zJU=;
        b=byz/DhTVWAW1HB04MPI5o6B68zelyownOLyxz+W+pOn12F4aOsRtlBuDq/CLpRFnaP
         bQAXgeu766gIFzSSTWggm/lUInGyN+v+1OLwNRSsTzJDMeJfiCa9QbSC1Je+OPT73yjW
         M+UioAp2gHpmw8t5PT+wO35049tYWALqZnxYEtwpin73xSTbwnTY0v2YsdHkxJBIl9LK
         YQymd2Qh3ZDQgJN8SFbmCt4G0MGTk+YiopT/XiwzfFyAGF/LNraLJ2z1OnT008BKrwuF
         dACMDsnN4ZHpHJYxxpcZ5Bb/6NjH/TOEp2032Oeux0cwb8WIyP3FCbxdb3m4Dm7eal2N
         b+lQ==
X-Gm-Message-State: AOAM530fYs0A7rqYZGo7SIill3b+j9jVq0SiDTgaxAI3Sw5LGOyRpeE2
	Qm2kiAc6xcWIXdbUYckJhEGvxbIKODDo+tnnWtA=
X-Google-Smtp-Source: ABdhPJwfbY6z1WzvN4cHgJ5v7Qy1oTLXOKl1AuTNIKPA07QbzAmslsnSSKZ9elvZ+U7Co1p/pMPSMbQhwZ5wVD4g3GU=
X-Received: by 2002:a17:906:68c:: with SMTP id u12mr33856841ejb.470.1622048998038;
 Wed, 26 May 2021 10:09:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210524152106.4160032-1-raj.khem@gmail.com> <CAAnfSTvgOiJ5hvG41fTqW3XD73bBB5nJOG7FaySPzspcGOj1bg@mail.gmail.com>
 <CAMKF1soOUcqa6huRjbn5QgP0hkBaFafS2PkgWHbVazW4R0NRnQ@mail.gmail.com> <1682A83F9B9CCAC9.4904@lists.openembedded.org>
In-Reply-To: <1682A83F9B9CCAC9.4904@lists.openembedded.org>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Wed, 26 May 2021 19:09:47 +0200
Message-ID: <CA+chaQd8yVVJA=U1KieF_sPaQU-Yo0vcHAfkGnNLdTtE7uNw3g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] gcc: Update to latest on release/gcc-11 branch
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>, Ross Burton <ross@burtonini.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000056221705c33eb6d1"

--00000000000056221705c33eb6d1
Content-Type: text/plain; charset="UTF-8"

On Wed, May 26, 2021 at 5:43 PM Martin Jansa via lists.openembedded.org
<Martin.Jansa=gmail.com@lists.openembedded.org> wrote

> I'm seeing different error with gcc-sanitizers and this new revision:
>
> work-shared/gcc-11.1.0-r0/gcc-11.1.0/libsanitizer/lsan/lsan_common_linux.cpp:164:25:
> error: invalid conversion from 'void (*)(void*)' to 'void* (*)(void*)'
> [-fpermissive]
>
> will double-check if it was introduced by this upgrade or something else
> in oe-core master update today and also if there is a fix in even newer gcc
> already.
>

Sorry for noise, this line of code comes from our local patch and the
upgrade just started triggering this issue in it.

--00000000000056221705c33eb6d1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, May 26, 2021 at 5:43 PM Martin Ja=
nsa via <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a=
> &lt;Martin.Jansa=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gm=
ail.com@lists.openembedded.org</a>&gt; wrote<br></div><div class=3D"gmail_q=
uote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><d=
iv>I&#39;m seeing different error with gcc-sanitizers and this new revision=
:</div><div><br></div>work-shared/gcc-11.1.0-r0/gcc-11.1.0/libsanitizer/lsa=
n/lsan_common_linux.cpp:164:25: error: invalid conversion from &#39;void (*=
)(void*)&#39; to &#39;void* (*)(void*)&#39; [-fpermissive]<br><div><br></di=
v><div>will double-check if it was introduced by this upgrade or something =
else in oe-core master update today and also if there is a fix in even newe=
r gcc already.</div></div></blockquote><div><br></div><div>Sorry for noise,=
 this line of code comes from our local patch and the upgrade just started =
triggering this issue in it.</div></div></div>

--00000000000056221705c33eb6d1--
