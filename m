Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
 by mx.groups.io with SMTP id smtpd.web11.8379.1594980970719897460
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2020 03:16:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kQc4TYOk;
 spf=pass (domain: gmail.com, ip: 209.85.222.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f46.google.com with SMTP id b13so2707530uav.3
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2020 03:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EqeocAS20PbM+zFyk5so/Q93fcOgRWLCwIuXbF6Nt7w=;
        b=kQc4TYOksiWO97OQ57/uVvgg173YPCrm4qLeib+OODkw/HJwfv2+6+h8l+NMQDXrwM
         2/cEUq4eMe068MiGPMZ6rsV9T4vhnMqnToYWEar3ZR0x2WU67Hx0l9DYPQWTA9Qs/+kq
         lEFTKZDJNS+zotYeQfrAt8L7E1dDlR6ras7YeTZTAgSnF3xFKLgrwqKr3M/NUPokReZ6
         3UWCe6rh52tJnVfs0+NM9u3vrR4yZEMjnD2Kl74ugnOnd9DylxfwbhM7l5Lg4rsAAQJF
         W+STOvBzDwX6tCEIhNLBiz/5/dXANP6eXeTiCaLVfPmg5JHYt2gQyTMj+YkFUAxZyOOS
         Ft5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EqeocAS20PbM+zFyk5so/Q93fcOgRWLCwIuXbF6Nt7w=;
        b=iyeFXx2x1DiJEn+pC4cqvvRq0EqMbYtpOgP6D3A+03KQcRMVIUPUDgHJ4iyP/ISire
         J+W1H+G5Q39uQvUpLexVFShz4zWFE2tOvhlsg4ASHui3p8ubn+NkxFyoCHvMturwBu9k
         KqAvg1ufaBOKq1iO9E5CKR6jnIOc2cXrhwLxRmTtvRfA5YDSZGQWJcQIE1qtaOg9f91E
         UGJ0/22Erbj83S+wWvo/+f9kEzCq+Z5G+wFwGjP8WwEHTV1R/TeobyxIMoH638VvLtBT
         lGGGKjIrkh4d76p8s3cO9J+HNboFZHENwlKXYMomqJLWArnagAHSCB0wdXrSeY3q9Kct
         iNiQ==
X-Gm-Message-State: AOAM530vURZ7tFig4Qv7qz8XQxqt5YnX7kilXki0CqxNN7djBqTO16FR
	tepqJ8+p4E8LJGk4IOMELLqLMB/c2RmI79WCZjE=
X-Google-Smtp-Source: ABdhPJz5OkoUWDXm6jzR9qM4us1Ssya6tOVT4LndiwxLCb3X6u48Ewfoq0mNxtn1eadYSYxlYMHOINmsgph3+daosWA=
X-Received: by 2002:ab0:348c:: with SMTP id c12mr6412910uar.89.1594980969792;
 Fri, 17 Jul 2020 03:16:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200715164441.DDD23E01EAA@yocto-www.yoctoproject.org>
 <CANNYZj8drAJ8fvTC_KPhQ3yZr7KN7iaB-616DnQHmf43TjCFmg@mail.gmail.com> <09ec097fc3cd3f5bb1ebbc7248cc52e56716fbfb.camel@linuxfoundation.org>
In-Reply-To: <09ec097fc3cd3f5bb1ebbc7248cc52e56716fbfb.camel@linuxfoundation.org>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Fri, 17 Jul 2020 12:15:58 +0200
Message-ID: <CANNYZj8VV-OHJa6epGPvUsQb=29ezhACQ8bop+oD2GNn9ADsDw@mail.gmail.com>
Subject: Re: [OE-core] [AUH] Upgrade status: 2020-07-15
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000020c7f305aaa07244"

--00000000000020c7f305aaa07244
Content-Type: text/plain; charset="UTF-8"

Thanks - obviously, the most appreciated work for volunteer upgrades is
taking items that AUH wasn't able to handle, and resolving the issues (most
often patch rebase conflicts or build failures - AUH tells in the email
exactly what the problem was).

Alex

On Thu, 16 Jul 2020 at 17:55, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Thu, 2020-07-16 at 16:31 +0200, Alexander Kanavin wrote:
> > we have changed the AUH behavior so that it sends all upgrade patches
> > not just to maintainers, but also to this mailing list. What this
> > means is that if you are interested in an upgrade, and would like to
> > contribute to Yocto, do not hesitate to take these patches, and send
> > them to the mailing list according to instructions in the mails. Do
> > not wait for 'official' maintainers to do it!
>
> I did pull a chunk of the successful ones into master-next for
> evaluation/testing.
>
> I had to drop libhandy as it breaks epiphany:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/1175
>
> I needed a fix for mpfr in meta-mingw. Also, vulkan-headers breaks
> gstreamer-plugins:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/1173
>
> There is another build running of -next as I send this...
>
> Cheers,
>
> Richard
>
>
>
>
>

--00000000000020c7f305aaa07244
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks - obviously, the most appreciated work for vol=
unteer upgrades is taking items that AUH wasn&#39;t able to handle, and res=
olving the issues (most often patch rebase conflicts or build failures - AU=
H tells in the email exactly what the problem was).</div><div><br></div><di=
v>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, 16 Jul 2020 at 17:55, Richard Purdie &lt;<a href=3D=
"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.=
org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">On Thu, 2020-07-16 at 16:31 +0200, Alexander Kanavin wrote:<br>
&gt; we have changed the AUH behavior so that it sends all upgrade patches<=
br>
&gt; not just to maintainers, but also to this mailing list. What this<br>
&gt; means is that if you are interested in an upgrade, and would like to<b=
r>
&gt; contribute to Yocto, do not hesitate to take these patches, and send<b=
r>
&gt; them to the mailing list according to instructions in the mails. Do<br=
>
&gt; not wait for &#39;official&#39; maintainers to do it!<br>
<br>
I did pull a chunk of the successful ones into master-next for<br>
evaluation/testing.<br>
<br>
I had to drop libhandy as it breaks epiphany:<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/83/build=
s/1175" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/83/builds/1175</a><br>
<br>
I needed a fix for mpfr in meta-mingw. Also, vulkan-headers breaks<br>
gstreamer-plugins:<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/83/build=
s/1173" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/83/builds/1173</a><br>
<br>
There is another build running of -next as I send this...<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--00000000000020c7f305aaa07244--
