Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
 by mx.groups.io with SMTP id smtpd.web08.4258.1620854262138416790
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 May 2021 14:17:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=A1n7SAtL;
 spf=pass (domain: gmail.com, ip: 209.85.217.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f48.google.com with SMTP id j128so12720547vsc.5
        for <openembedded-core@lists.openembedded.org>; Wed, 12 May 2021 14:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tKAn8Mr7it4cAT7zDuLRhL2DvmrfNjAmQi+ebfo3uOc=;
        b=A1n7SAtLxPiv8HHgrQk0uWuWNySesQL2AdmsFmvsNNu/dcNItx+kjBmkuDagtNdVNy
         vXkgM6Arkz1IZW72H2/Z1tB6RE6ntLVsutyLjf+tVKlbdX4mjVIdPOb7kvRVMrlyrzXU
         awzuC/iuLKZ9F+fKSWrmwCImoKUlmSafQoCG7dQRxhnFu7s9HnaFBl8/ijYKqMnhRXY4
         XuKqsHuD2HR3mlH3FviKhdufWYnNx8vkscOMaz2UX0Z0P6j4oxi7eIE4iANd/es7NrtP
         4kiD3dUiJSMwoMw6hnhABZftRuIITL3QFJv0Jbqj6VGIgaZzknkDUL8AiM0UMQR4eFrd
         44aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tKAn8Mr7it4cAT7zDuLRhL2DvmrfNjAmQi+ebfo3uOc=;
        b=U/4i7k8iNkN2rq/xag9CDPWWQuhDPu8iTULkhs1kA+X2SbqK5HwGEeqPorQbBUycxY
         MlNONtYUcbq0HN0nyJ9IK5Pawq+ksr8sS8r9eknOffM9Tvb1C1eey+jXIsw5ZkpQu4QZ
         E1khggoGzC/dsoK0kXIvzXiNMCsbUheH81b8gxdDbMAi3JLOrwFjboyK+3a+QM9+NKqQ
         fiHbk+UWDSrmYiQAWS6kB0eJO7xqUbW0wSUbNtULnSPkAm7M1SLDcYpKjHKi9rBjj/In
         oE3dFEmdwmf1YJYVIiuF36kw1wZCqdzlOdU6uPHF8EtNTbisb03seYiPgRhLkzT+O0Am
         Gt1g==
X-Gm-Message-State: AOAM532/vOvcNVFoxmKOgIDU+Z/TZabr61Gf2UaIL2UWjYnLXSEYcmy9
	r3mfMmHn1QJjsZERdR6DAAqgD3zkl/AaN99Z6Sg=
X-Google-Smtp-Source: ABdhPJwO8Vj4if0b3aMbvnkL2uSPiZn0b41qAB9CYXufB9Btve1nziGO9rXg7UOcW1DfssgbGjlbB+Ej26YK0r2lVFQ=
X-Received: by 2002:a67:2fc8:: with SMTP id v191mr33653889vsv.54.1620854261344;
 Wed, 12 May 2021 14:17:41 -0700 (PDT)
MIME-Version: 1.0
References: <ca363208-ab63-44c4-92e7-98b1788a8a8c@www.fastmail.com>
 <CANNYZj9_4WC91DoTeXcsVAJi=kS2DRXHTHE5L6Wgbb2PJfTimA@mail.gmail.com> <255c6c61-af04-4866-bb2f-0ddc50ca6391@www.fastmail.com>
In-Reply-To: <255c6c61-af04-4866-bb2f-0ddc50ca6391@www.fastmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Wed, 12 May 2021 23:17:30 +0200
Message-ID: <CANNYZj-PSq4bAQpy3s=8Vuqk-PcstZZFPzr710VXfS3Lj8Aiow@mail.gmail.com>
Subject: Re: [OE-core] master/main branch renaming and bitbake
To: Colin Walters <walters@verbum.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000007aeced05c2288a41"

--0000000000007aeced05c2288a41
Content-Type: text/plain; charset="UTF-8"

On Wed, 12 May 2021 at 22:44, Colin Walters <walters@verbum.org> wrote:

> On Wed, May 12, 2021, at 4:40 PM, Alexander Kanavin wrote:
> > For ostree, yes:
> > http://git.openembedded.org/meta-openembedded/log/?h=master-next
> >
> > For the generic case, no. It's not a good idea to start guessing what
> > the upstream did.
>
> What is the goal of the `branch=` specification?  I can understand it
> being *informative* for humans specifically when things like
> non-master/main branches e.g. `release-4.x`, `lts-`, `stable-` etc. are
> involved.
>
> But why is bitbake explicitly checking it?  Is it to validate what the
> human expressed, or is it to try to cover some security aspect?  Something
> else?
>

To ensure the specified revision is actually linked with the specified
branch, and not just free-floating, and catch branch renames, deletions and
force pushes. You can override that behaviour with nobranch=1, at your own
risk - free-floating revisions can be 'garbage collected'.

Yes, it's annoying when the upstream renames branches, but it's no
different than upstreams clearing up old tarballs, or disappearing
altogether. Ensure you have proper download mirrors.

Alex

--0000000000007aeced05c2288a41
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Wed, 12 May 2021 at 22:44, Colin Walters &lt;<a href=3D"mailto:wa=
lters@verbum.org">walters@verbum.org</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">On Wed, May 12, 2021, at 4:40 PM, Alexa=
nder Kanavin wrote:<br>
&gt; For ostree, yes:<br>
&gt; <a href=3D"http://git.openembedded.org/meta-openembedded/log/?h=3Dmast=
er-next" rel=3D"noreferrer" target=3D"_blank">http://git.openembedded.org/m=
eta-openembedded/log/?h=3Dmaster-next</a><br>
&gt; <br>
&gt; For the generic case, no. It&#39;s not a good idea to start guessing w=
hat <br>
&gt; the upstream did.<br>
<br>
What is the goal of the `branch=3D` specification?=C2=A0 I can understand i=
t being *informative* for humans specifically when things like non-master/m=
ain branches e.g. `release-4.x`, `lts-`, `stable-` etc. are involved.<br>
<br>
But why is bitbake explicitly checking it?=C2=A0 Is it to validate what the=
 human expressed, or is it to try to cover some security aspect?=C2=A0 Some=
thing else?<br></blockquote><div><br></div><div>To ensure the specified rev=
ision is actually linked with the specified branch, and not just free-float=
ing, and catch branch renames, deletions and force pushes. You can override=
 that behaviour with nobranch=3D1, at your own risk - free-floating revisio=
ns can be &#39;garbage collected&#39;.</div><div><br></div><div>Yes, it&#39=
;s annoying when the upstream renames branches, but it&#39;s no different t=
han upstreams clearing up old tarballs, or disappearing altogether. Ensure =
you have proper download mirrors.<br></div><div><br></div><div>Alex<br></di=
v></div></div>

--0000000000007aeced05c2288a41--
