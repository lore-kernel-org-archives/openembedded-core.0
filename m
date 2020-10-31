Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
 by mx.groups.io with SMTP id smtpd.web11.10208.1604150113066492607
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Oct 2020 06:15:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nzOc/1/b;
 spf=pass (domain: gmail.com, ip: 209.85.208.67, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f67.google.com with SMTP id w1so8384950edv.11
        for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2020 06:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YOCPppb6qJ16U3OiVHZ+m3nZUPzx5K7GnVnuwmGGDXw=;
        b=nzOc/1/bTulAHQloeLOwGQBaCFXPgyk2V6s0x85S2cm77asedv/J5zK/fWiiiwbDis
         9MOyHkWdxHEheURc5pxTcuu1v2od5n2nna021sj+3ADz+KGkU6Oy44HCAe5418Hq/6ne
         nUnqEVFDghyRkqyIArtslC8cWkiC7scUsLskkfszY2tOE8gvYqUSutvMpvf4g2zm5mFe
         j+99I9FUuTqlSANqLl3SX9wDQ5Yi7VdQMMOcIp2VFb93LkQSg3A4LFKMJzZZXvyCUh0U
         Hn0L6lqSG0EP8e5Gvxa8E3mTXQYVNiBbZQWDyGVn6sOFibGuBd9hhxgRECbKSPy3WyY/
         2Ksw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YOCPppb6qJ16U3OiVHZ+m3nZUPzx5K7GnVnuwmGGDXw=;
        b=ehe1D9/Ch8CTyq1WwVUBt3g9FKeGosAEmiqTm3hoCdxKi7pPEUp+WCjqJFpoiVAk0q
         S4nF2JHxkDZpI2hYrIKV2lEU+vMpEFE19sqKg/CaguH2CIaFCQ62QYjJX6PX8u47xHws
         N8qc3zo6QtwW02IoY/+EMzEaLI1YC2VHxH8MjTyJelGtFcWUOU7E/BlrOrW1JkHDj3n+
         SVGhSvM9kkYxzVNji1XrHfeR/+2PBOMzidxcnWTPl0MnVCQSj9T+OjXOUt2eKucuHUsN
         lR9R+k5SBNDf7vP1AmPwh3gJoHw7yqzQMAbg0iYr3BnXJnjo+NRv/8ug2frr6XcSj0f7
         32Bw==
X-Gm-Message-State: AOAM532UwhCcQdG6GfELwr6dPn3Hk7wSHcRyeIAuHVyd1/Nh+GmxBABw
	deNksuFDwpR8dvd7t5Apx/m3slF7Djbl87iB5Ec=
X-Google-Smtp-Source: ABdhPJzWajUVpNoimK4pAdhRBDJRMcg/sTiYlgx9vihbfrsIT6Ri3cL+Wk6rpyv7kCUxGq41yzLtoJkzSuSOS7Tx/Bg=
X-Received: by 2002:a05:6402:1457:: with SMTP id d23mr7336530edx.311.1604150111266;
 Sat, 31 Oct 2020 06:15:11 -0700 (PDT)
MIME-Version: 1.0
References: <20201030232256.624297-1-quaresma.jose@gmail.com>
 <aa090613e34863ee936811011d3019eafba3db81.camel@linuxfoundation.org>
 <CANPvuRk3P=9Ho7w=PzdUVKQpVgoechnSX0cTY3TaTdcOaqiHHw@mail.gmail.com> <CAHtQpK41tvJ3w0DTu=p431crPm_66n3c-9t4BHhX7iwJAmxCuQ@mail.gmail.com>
In-Reply-To: <CAHtQpK41tvJ3w0DTu=p431crPm_66n3c-9t4BHhX7iwJAmxCuQ@mail.gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Sat, 31 Oct 2020 14:15:00 +0100
Message-ID: <CA+chaQcx3pcrnZpgtd8nzh=AqeBS-D0qEp96z+hURf=1_wrcTw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gstreamer: use git to fetch the sources
To: Andrey Zhizhikin <andrey.z@gmail.com>
Cc: Jose Quaresma <quaresma.jose@gmail.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000008c6bb505b2f74d85"

--0000000000008c6bb505b2f74d85
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Are you sure _generated_ tarballs from gitlab are better?

https://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg=
73109.html

On Sat, Oct 31, 2020 at 1:29 PM Andrey Zhizhikin <andrey.z@gmail.com> wrot=
e:

> On Sat, Oct 31, 2020 at 12:40 PM Jose Quaresma <quaresma.jose@gmail.com>
> wrote:
> >
> > Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia
> > s=C3=A1bado, 31/10/2020 =C3=A0(s) 00:32:
> > >
> > > On Fri, 2020-10-30 at 23:22 +0000, Jose Quaresma wrote:
> > > > gstreamer has the code hosted on [1] and this repo as tags.
> > > > manage code with git its more convenient than with tarball archive=
s.
> > > >
> > > > [1] - https://gitlab.freedesktop.org/gstreamer
> > > >
> > > > Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> > >
> > > I'm not 100% sure about this. Tarballs tend to be less overhead for
> > > fetching and make for easier source archiving. The git repos are eas=
ier
> > > for day to day dev work but tend to be harder for the AUH to handle =
and
> > > slower to fetch for the users taking up more space to download and
> > > unpack. I'm therefore torn. I know where we have used git for other
> > > core components it has caused performance issues.
> >
> > I have the same opinion that tarballs have less overhead, It's much
> smaller.
> > In this specific case the git repos are very big because the gstreamer
> project
> > started a long time ago and it contains the full evolution of the
> project.
> >
> > However I sent this patch because I think it is easy managing patches
> with
> > git but with the devtool we can achieve a very similar workflow.
> > With the difference that more steps are needed, to do a backport for
> example.
> >
> > >
> > > We do also have the option of the devupstream class although I know
> > > that doesn't quite work for the native cases yet sadly.
> >
> > I don't understand this sentence. What is the opinion of devupstream
> class?
> >
> > >
> > > Cheers,
> > >
> > > Richard
> > >
> > >
> > >
> >
> > Someone on the mailing list has suggested that git is preferred over t=
he
> archive
> > but now I understand that this is only for github and it's mainly
> > because of the inconsistency
> > of the archives that they generate.
>
> I believe that was me and Alex, and this applies currently to GitHub
> only. There is a QA warning about using tarballs from GitHub since
> they tend to be unstable, GitLab seems to be better in this regard.
>
> >
> > --
> > best regards,
> > Jos=C3=A9 Quaresma
> >
> >
> >
>
>
> --
> Regards,
> Andrey.
>
>=20
>
>

--0000000000008c6bb505b2f74d85
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Are you sure _generated_ tarballs from gitlab are better?<=
div><br></div><div><a href=3D"https://www.mail-archive.com/openembedded-dev=
el@lists.openembedded.org/msg73109.html">https://www.mail-archive.com/opene=
mbedded-devel@lists.openembedded.org/msg73109.html</a><br></div></div><br><=
div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Oct=
 31, 2020 at 1:29 PM Andrey Zhizhikin &lt;<a href=3D"mailto:andrey.z@gmail.=
com">andrey.z@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">On Sat, Oct 31, 2020 at 12:40 PM Jose Quaresma &lt;<=
a href=3D"mailto:quaresma.jose@gmail.com" target=3D"_blank">quaresma.jose@g=
mail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.o=
rg" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt; escreveu n=
o dia<br>
&gt; s=C3=A1bado, 31/10/2020 =C3=A0(s) 00:32:<br>
&gt; &gt;<br>
&gt; &gt; On Fri, 2020-10-30 at 23:22 +0000, Jose Quaresma wrote:<br>
&gt; &gt; &gt; gstreamer has the code hosted on [1] and this repo as tags.=
<br>
&gt; &gt; &gt; manage code with git its more convenient than with tarball =
archives.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; [1] - <a href=3D"https://gitlab.freedesktop.org/gstreamer" =
rel=3D"noreferrer" target=3D"_blank">https://gitlab.freedesktop.org/gstream=
er</a><br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:quaresma=
.jose@gmail.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; I&#39;m not 100% sure about this. Tarballs tend to be less overh=
ead for<br>
&gt; &gt; fetching and make for easier source archiving. The git repos are=
 easier<br>
&gt; &gt; for day to day dev work but tend to be harder for the AUH to han=
dle and<br>
&gt; &gt; slower to fetch for the users taking up more space to download a=
nd<br>
&gt; &gt; unpack. I&#39;m therefore torn. I know where we have used git fo=
r other<br>
&gt; &gt; core components it has caused performance issues.<br>
&gt;<br>
&gt; I have the same opinion that tarballs have less overhead, It&#39;s mu=
ch smaller.<br>
&gt; In this specific case the git repos are very big because the gstreame=
r project<br>
&gt; started a long time ago and it contains the full evolution of the pro=
ject.<br>
&gt;<br>
&gt; However I sent this patch because I think it is easy managing patches=
 with<br>
&gt; git but with the devtool we can achieve a very similar workflow.<br>
&gt; With the difference that more steps are needed, to do a backport for =
example.<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt; We do also have the option of the devupstream class although I k=
now<br>
&gt; &gt; that doesn&#39;t quite work for the native cases yet sadly.<br>
&gt;<br>
&gt; I don&#39;t understand this sentence. What is the opinion of devupstr=
eam class?<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt; Cheers,<br>
&gt; &gt;<br>
&gt; &gt; Richard<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt;<br>
&gt; Someone on the mailing list has suggested that git is preferred over =
the archive<br>
&gt; but now I understand that this is only for github and it&#39;s mainly=
<br>
&gt; because of the inconsistency<br>
&gt; of the archives that they generate.<br>
<br>
I believe that was me and Alex, and this applies currently to GitHub<br>
only. There is a QA warning about using tarballs from GitHub since<br>
they tend to be unstable, GitLab seems to be better in this regard.<br>
<br>
&gt;<br>
&gt; --<br>
&gt; best regards,<br>
&gt; Jos=C3=A9 Quaresma<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
<br>
-- <br>
Regards,<br>
Andrey.<br>
<br>
<br>
<br>
</blockquote></div>

--0000000000008c6bb505b2f74d85--
