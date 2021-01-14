Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web11.3098.1610638361848191273
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Jan 2021 07:32:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FwNGdHFd;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: kergoth@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id dk8so6162318edb.1
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Jan 2021 07:32:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JcyiVYO06B8xZTFC2nAVrtYRhoynvbpsr96YPlSv970=;
        b=FwNGdHFddd3hRQVSJkd9ZJxir81PhDbPeSHISmuRF8uJsW5V0o3RD71Vgmr55ImMCD
         DWzSHaW61eGId0hTQdu/lM7n4wfY8HNYIqgXtPGp4SMmpGlCJM5cg5xdCKc7yq3DzF3F
         F6aKYN16KLQeHv/VwucoDvPfqKKTqO+s1Ag01e+mcAzfZXyshxoMh8eEdl3liXUwQUK/
         9UMyRuTY5IsYEyUj6jz/j1xu1J6LDUTaieQVRWj8TkgQa7FZxw7tM5EjdnkGP47OcCQT
         poPjWOWvjlCNL1tCKtFG1i6d1IUgBUMSCK0549l6ZWLzsfo8EeYcqoDFSuyZXUIJVhJL
         O8Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JcyiVYO06B8xZTFC2nAVrtYRhoynvbpsr96YPlSv970=;
        b=Szv6aujUNxFWIBUi+2HfVumdPMwFWpim3aqS15ADDWoMRBkw83hQfM7B7ADid0JNe+
         mUCziuFrDn/Z5Am1yCicq+kmAjFtu45D7kT2P2RyS/NbijYsPrNGPCIXapKZ8ALyhzhk
         v6XIvDqijd/fgXWWuQreNJBc1NqN6oYVR3bXzNsYBLcftWTsuepnNRwec5tJ8LLEn78j
         xcvLp7OuC/4dy/VJJoXEVqhDC/ySxAeSxxHKuJTrtVW3y/3J5xY5UruD9IOCbWrjICI3
         3ZXQvVBtX30gAU/DhjP3/9b20NU07c5IR1karrahqFKecoyoNVaRaA006w0adLaOZSWw
         t5aw==
X-Gm-Message-State: AOAM530DTsVayOIkPjgYI++RdcjdM/+nKER5yQ6stDC17UAtnOqvV63m
	+tJ4kDeBljPoCukXRzX0Cfm1/2rqFF4klYu3WZs=
X-Google-Smtp-Source: ABdhPJyMDSoRQX5YLyTTxu0wXx7AfH5JZqD+C3I4lEl6Nk8LbBC/6mntNZ496/gvOlVz28JyzUpgKP7mB8Fpnxc/SRY=
X-Received: by 2002:a05:6402:94c:: with SMTP id h12mr6281178edz.268.1610638359727;
 Thu, 14 Jan 2021 07:32:39 -0800 (PST)
MIME-Version: 1.0
References: <830757c5aad2db5f7524e7a99f3b97e309592517.1610611154.git.diego.sueiro@arm.com>
 <CAP9ODKrAHAYfPvF=xjZk1aPPXuwP2_zOcg11U71sKiiR1o6kRw@mail.gmail.com> <AM6PR08MB3461999C01D85C12EECF933192A80@AM6PR08MB3461.eurprd08.prod.outlook.com>
In-Reply-To: <AM6PR08MB3461999C01D85C12EECF933192A80@AM6PR08MB3461.eurprd08.prod.outlook.com>
From: "Christopher Larson" <kergoth@gmail.com>
Date: Thu, 14 Jan 2021 08:32:29 -0700
Message-ID: <CABcZANnpbJ3YhBkpZ-GoRNk4cxxaUObZJspCAmscqTLENuBCwQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] classes: Introduce intermediate-deploy.bbclass
To: Diego Sueiro <diego.sueiro@arm.com>
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	"Purdie, Richard" <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="0000000000004b116505b8ddf7a2"

--0000000000004b116505b8ddf7a2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 14, 2021 at 5:45 AM Diego Sueiro <diego.sueiro@arm.com> wrote:

> >-----Original Message-----
> >From: Otavio Salvador <otavio.salvador@ossystems.com.br>
> >Sent: 14 January 2021 11:57
> >To: Diego Sueiro <Diego.Sueiro@arm.com>
> >Cc: Patches and discussions about the oe-core layer <openembedded-
> >core@lists.openembedded.org>; Purdie, Richard
> ><richard.purdie@linuxfoundation.org>
> >Subject: Re: [OE-core] [PATCH 1/2] classes: Introduce intermediate-
> >deploy.bbclass
> >
> >Em qui., 14 de jan. de 2021 =C3=A0s 05:06, Diego Sueiro <diego.sueiro@ar=
m.com>
> >escreveu:
> >>
> >> The intermediate-deploy class is to be inherited by recipes that
> >> install intermediate artifacts which are not present in the filesystem
> >> to be further processed by other recipes.
> >>
> >> The INTERMEDIATE_DEPLOY_DIRS variable is a space separated list of
> >> dirnames from ${D} which include the intermediate artifacts.
> >>
> >> Change-Id: I314987587c1cf0e4cdb28fbf11463f1feb37504b
> >...
> >> +        for dir in ${INTERMEDIATE_DEPLOY_DIRS}; do
> >> +            dir=3D"${dir%/}"
> >> +            dir=3D"${dir#/}"
> >
> >Does this work with dash? I believe this is bashism.
> >
>
> I think so since on my host I have "/bin/sh -> dash".
>

This is not a bashism, but is POSIX. See
https://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.html#t=
ag_18_06_02
at the end of the parameter expansion section.
--=20
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--0000000000004b116505b8ddf7a2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 14, 2021 at 5:45 AM Diego=
 Sueiro &lt;<a href=3D"mailto:diego.sueiro@arm.com">diego.sueiro@arm.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">&gt=
;-----Original Message-----<br>
&gt;From: Otavio Salvador &lt;<a href=3D"mailto:otavio.salvador@ossystems.c=
om.br" target=3D"_blank">otavio.salvador@ossystems.com.br</a>&gt;<br>
&gt;Sent: 14 January 2021 11:57<br>
&gt;To: Diego Sueiro &lt;<a href=3D"mailto:Diego.Sueiro@arm.com" target=3D"=
_blank">Diego.Sueiro@arm.com</a>&gt;<br>
&gt;Cc: Patches and discussions about the oe-core layer &lt;openembedded-<b=
r>
&gt;<a href=3D"mailto:core@lists.openembedded.org" target=3D"_blank">core@l=
ists.openembedded.org</a>&gt;; Purdie, Richard<br>
&gt;&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_bl=
ank">richard.purdie@linuxfoundation.org</a>&gt;<br>
&gt;Subject: Re: [OE-core] [PATCH 1/2] classes: Introduce intermediate-<br>
&gt;deploy.bbclass<br>
&gt;<br>
&gt;Em qui., 14 de jan. de 2021 =C3=A0s 05:06, Diego Sueiro &lt;<a href=3D"=
mailto:diego.sueiro@arm.com" target=3D"_blank">diego.sueiro@arm.com</a>&gt;=
<br>
&gt;escreveu:<br>
&gt;&gt;<br>
&gt;&gt; The intermediate-deploy class is to be inherited by recipes that<b=
r>
&gt;&gt; install intermediate artifacts which are not present in the filesy=
stem<br>
&gt;&gt; to be further processed by other recipes.<br>
&gt;&gt;<br>
&gt;&gt; The INTERMEDIATE_DEPLOY_DIRS variable is a space separated list of=
<br>
&gt;&gt; dirnames from ${D} which include the intermediate artifacts.<br>
&gt;&gt;<br>
&gt;&gt; Change-Id: I314987587c1cf0e4cdb28fbf11463f1feb37504b<br>
&gt;...<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 for dir in ${INTERMEDIATE_DEPLOY_DIRS=
}; do<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dir=3D&quot;${dir%/}&qu=
ot;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dir=3D&quot;${dir#/}&qu=
ot;<br>
&gt;<br>
&gt;Does this work with dash? I believe this is bashism.<br>
&gt;<br>
<br>
I think so since on my host I have &quot;/bin/sh -&gt; dash&quot;.<br></blo=
ckquote><div><br></div><div>This is not a bashism, but is POSIX. See=C2=A0<=
a href=3D"https://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_cha=
p02.html#tag_18_06_02">https://pubs.opengroup.org/onlinepubs/9699919799/uti=
lities/V3_chap02.html#tag_18_06_02</a> at the end of the parameter expansio=
n section.</div></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><di=
v dir=3D"ltr"><div><div dir=3D"ltr">Christopher Larson<br>kergoth at gmail =
dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Senior Software E=
ngineer, Mentor Graphics</div></div></div></div></div>

--0000000000004b116505b8ddf7a2--
