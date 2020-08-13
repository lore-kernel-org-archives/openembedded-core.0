Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web10.6639.1597311131484454419
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Aug 2020 02:32:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CXSMfNQO;
 spf=pass (domain: gmail.com, ip: 209.85.128.68, mailfrom: liu.ming50@gmail.com)
Received: by mail-wm1-f68.google.com with SMTP id g8so4098535wmk.3
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2020 02:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=E9WSdi23Jq/5laqbNLKDZmeUoo3JB5s99nhGZbbjQhA=;
        b=CXSMfNQOSsKTxxBxhSOTAjyac1eqgZqKGuq3Z5lX1hTMgE84fqbgFF16Xjgf+drrFD
         Z4/bbpOmKDdbL8EMi2yIXPt71++ey21K5zDqlSRJCKw6z0Q4OS5nUXwGRZ0JBWebsFmQ
         Y37ZnR298a8VGi1orivDhncaMDBcbmv/A6ifyquLFOn6SrS/1jzBPA+KldR7BjWgYn0L
         kILtjMQxasfaPGOvDBkBo1ZR6FJhlBYEAzR++1AIkKLNxpycDzCBxbKNZKOC6tdryjGf
         r5j/WBU3sRHuwIrlLQH4RUVxiDXD8pOM/UsXEPjj7TWI8G23sdxlnCu4leul4Aze+O/t
         eQDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E9WSdi23Jq/5laqbNLKDZmeUoo3JB5s99nhGZbbjQhA=;
        b=r3OeUUmdl2qURsjQYJsRvQh55m8PIVNNDRfIBYJipoPYriP/1vkl8B9ZT4xQcTLPt4
         hncmf1stpUlB/GG6yvNujaNa4teOwncrwUh3o+xiNX2QjxJRgJkLVbVAHT/dz6Ve8WSR
         RlEQLn4q1RX5pN4iaMjWRqdov1xSQKwC/J3uRD+XaYwg189sT+AtijrSQYlssuFemmIJ
         6M5e0QiIBcf7uNHt7Zp3CCucPy98JnQZvP4T+CUVDh+EtlVL/Jkiaa5zbRX4HH6IUhjp
         1V/0+SG3T0yVcV6k+zKzjJ4LvUhguq8OGJNaaKaUYV2QKBd/wxqcL4v/brRdGDujQkS/
         ayGQ==
X-Gm-Message-State: AOAM530wCqlMJkc+sYW4c3pqa+FtbUSBc0oFqONKipywEO0Pq/r2lBmt
	8a0aMLZWSMNPYI0AP/UPTIDIMpzzoYzwL90vFPM=
X-Google-Smtp-Source: ABdhPJwsRHRfwhRtXpnQ+uNwhMhWi+2Y/JVVquctCmdgskIhu+XVhjWfQsUHsK/OAt4IBgLGVBluuQ3cgaVhcJXHTm0=
X-Received: by 2002:a05:600c:2209:: with SMTP id z9mr3467926wml.70.1597311130021;
 Thu, 13 Aug 2020 02:32:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200812121715.10548-1-liu.ming50@gmail.com> <beb12038274a4c2c0e5af09191501f1dd686db46.camel@linuxfoundation.org>
In-Reply-To: <beb12038274a4c2c0e5af09191501f1dd686db46.camel@linuxfoundation.org>
From: "Ming Liu" <liu.ming50@gmail.com>
Date: Thu, 13 Aug 2020 11:32:00 +0200
Message-ID: <CALatG=58VteAQJ5iuXM1thUqcTw3x-s1r-Qm2rzEci5we6oqzQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libubootenv: uprev to v0.3
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Stefan Agner <stefan.agner@toradex.com>, sergio.prado@toradex.com, 
	Max Krummenacher <max.krummenacher@toradex.com>
Content-Type: multipart/alternative; boundary="00000000000080336705acbefa27"

--00000000000080336705acbefa27
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Arha, a multilib failure, I did not verify it with multilib build, will
check that.

//Ming Liu

Richard Purdie <richard.purdie@linuxfoundation.org> =E6=96=BC 2020=E5=B9=B4=
8=E6=9C=8813=E6=97=A5 =E9=80=B1=E5=9B=9B
=E4=B8=8A=E5=8D=881:01=E5=AF=AB=E9=81=93=EF=BC=9A

> On Wed, 2020-08-12 at 14:17 +0200, Ming Liu wrote:
> > From: Ming Liu <liu.ming50@gmail.com>
> >
> > Update libubootenv to the latest 0.3 release, which comprises the
> > following commits:
>
> Seems to break world builds:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/52/builds/2280
> https://autobuilder.yoctoproject.org/typhoon/#/builders/108/builds/791
>
> Cheers,
>
> Richard
>
>

--00000000000080336705acbefa27
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><div dir=3D"ltr">Arha, a multil=
ib failure, I did not verify it with multilib build, will check that.</div>=
<div><br></div><div>//Ming Liu</div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">Richard Purdie &lt;<a href=3D"mailto:richard.=
purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt; =E6=
=96=BC 2020=E5=B9=B48=E6=9C=8813=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8A=E5=
=8D=881:01=E5=AF=AB=E9=81=93=EF=BC=9A<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">On Wed, 2020-08-12 at 14:17 +0200, Ming Liu wrote:<br=
>
&gt; From: Ming Liu &lt;<a href=3D"mailto:liu.ming50@gmail.com" target=3D"_=
blank">liu.ming50@gmail.com</a>&gt;<br>
&gt; <br>
&gt; Update libubootenv to the latest 0.3 release, which comprises the<br>
&gt; following commits:<br>
<br>
Seems to break world builds:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/52/build=
s/2280" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/52/builds/2280</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/108/buil=
ds/791" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/108/builds/791</a><br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div></div>

--00000000000080336705acbefa27--
