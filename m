Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com [209.85.167.65])
 by mx.groups.io with SMTP id smtpd.web12.9579.1604147376405092211
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Oct 2020 05:29:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Y07micQ6;
 spf=pass (domain: gmail.com, ip: 209.85.167.65, mailfrom: andrey.z@gmail.com)
Received: by mail-lf1-f65.google.com with SMTP id 126so11309666lfi.8
        for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2020 05:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=6NnlbipoUhMovw+tHTuHbVn1OShD6djiW+C2FkdDABM=;
        b=Y07micQ6DKgWSOFzin5Natv8f5HA+vFH1tYbyt6liBPEVLGxrRsQ0r0HC1qoEng5Xq
         VsOZHrI6sUwjfxGhczoQnDWQtjcuhT4NpqNt+vBkDpjLAE7F4fkm9pXbLssfKP5u6vf9
         D37skkDJnSkEEOq2GU25bCZNx9zc5AWrWXcFs4eOsyXBnFVWqy+B6m7Vq55Gzc9DwOIX
         jnmgNEarKfpugqDRv5Glgs2AlECNZbqwoQi46ZyBPfCFDupQJ/+0yAlkzrDFH3SriOzF
         rb3E2Y8uuYgfHpiKl/0hv85zzNqMVtcRUJMELS2fr8NYapzuePYQX/NR/5HTou1RT3xd
         cMHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=6NnlbipoUhMovw+tHTuHbVn1OShD6djiW+C2FkdDABM=;
        b=iTwSsy9ruI979PEW5k6ldeMldWA3yLWlex0Uap46U3o9r1On+QMgxNdh8XLOvForVS
         XyVFpmE/dduFte6IbPfZibakV2WaXpz/DSfdSGftJrvOVWdQbAqePDl88Lm4EmaDvitd
         DfE4CJKBEXFZ2NFWM2r2e+2ErOR94MwWbg7Jh1YsgfzLo4sHJluT/XppC8IjgpbYbP8V
         dcScPTi3kwpOhIOLf4pDPOVBnyT9GCbToYeNm/rngoJNmKCJ+L6J9C4BlxEHFzxV+f7X
         4kYbJNmvXH+o+fy9i4OpbplNgMP7lXwpoIpMnJqF0LYD/dSpQjxBQQ8MUfLBAddOhcir
         X4oQ==
X-Gm-Message-State: AOAM5327J5lJoqxmii2RICz7XHH87lxngajoK6XqFXNzdE7Oy7YjPDVP
	Cf9Yn6Ckh3VXIPbWjbmTDhSazf0XXiO4sTX1bdg=
X-Google-Smtp-Source: ABdhPJyanOEA1CWiQhJGppvEqlvfrfHDgaJ+5cUsNrgRCutEjm+Thi2SLd9IAPlD3oH0NklFQOH9o/ciZoA3DcsTMtQ=
X-Received: by 2002:a19:e04e:: with SMTP id g14mr2460651lfj.590.1604147374145;
 Sat, 31 Oct 2020 05:29:34 -0700 (PDT)
MIME-Version: 1.0
References: <20201030232256.624297-1-quaresma.jose@gmail.com>
 <aa090613e34863ee936811011d3019eafba3db81.camel@linuxfoundation.org> <CANPvuRk3P=9Ho7w=PzdUVKQpVgoechnSX0cTY3TaTdcOaqiHHw@mail.gmail.com>
In-Reply-To: <CANPvuRk3P=9Ho7w=PzdUVKQpVgoechnSX0cTY3TaTdcOaqiHHw@mail.gmail.com>
From: "Andrey Zhizhikin" <andrey.z@gmail.com>
Date: Sat, 31 Oct 2020 13:29:22 +0100
Message-ID: <CAHtQpK41tvJ3w0DTu=p431crPm_66n3c-9t4BHhX7iwJAmxCuQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gstreamer: use git to fetch the sources
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 31, 2020 at 12:40 PM Jose Quaresma <quaresma.jose@gmail.com> wr=
ote:
>
> Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia
> s=C3=A1bado, 31/10/2020 =C3=A0(s) 00:32:
> >
> > On Fri, 2020-10-30 at 23:22 +0000, Jose Quaresma wrote:
> > > gstreamer has the code hosted on [1] and this repo as tags.
> > > manage code with git its more convenient than with tarball archives.
> > >
> > > [1] - https://gitlab.freedesktop.org/gstreamer
> > >
> > > Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> >
> > I'm not 100% sure about this. Tarballs tend to be less overhead for
> > fetching and make for easier source archiving. The git repos are easie=
r
> > for day to day dev work but tend to be harder for the AUH to handle an=
d
> > slower to fetch for the users taking up more space to download and
> > unpack. I'm therefore torn. I know where we have used git for other
> > core components it has caused performance issues.
>
> I have the same opinion that tarballs have less overhead, It's much smal=
ler.
> In this specific case the git repos are very big because the gstreamer p=
roject
> started a long time ago and it contains the full evolution of the projec=
t.
>
> However I sent this patch because I think it is easy managing patches wi=
th
> git but with the devtool we can achieve a very similar workflow.
> With the difference that more steps are needed, to do a backport for exa=
mple.
>
> >
> > We do also have the option of the devupstream class although I know
> > that doesn't quite work for the native cases yet sadly.
>
> I don't understand this sentence. What is the opinion of devupstream cla=
ss?
>
> >
> > Cheers,
> >
> > Richard
> >
> >
> >
>
> Someone on the mailing list has suggested that git is preferred over the=
 archive
> but now I understand that this is only for github and it's mainly
> because of the inconsistency
> of the archives that they generate.

I believe that was me and Alex, and this applies currently to GitHub
only. There is a QA warning about using tarballs from GitHub since
they tend to be unstable, GitLab seems to be better in this regard.

>
> --
> best regards,
> Jos=C3=A9 Quaresma
>
>=20
>


--=20
Regards,
Andrey.
