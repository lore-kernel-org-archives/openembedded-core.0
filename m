Return-Path: <tomasz.dziendzielski@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A184C433EF
	for <webhook@archiver.kernel.org>; Thu, 30 Jun 2022 14:13:21 +0000 (UTC)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com
 [209.85.217.53])
 by mx.groups.io with SMTP id smtpd.web12.25729.1656598399359886887
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 07:13:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=d8+w57Or;
 spf=pass (domain: gmail.com, ip: 209.85.217.53,
 mailfrom: tomasz.dziendzielski@gmail.com)
Received: by mail-vs1-f53.google.com with SMTP id 189so7522153vsh.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 07:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cMaA1nyzsHHIyVsupdd2AveqCuHeoqCD/EE44fEOuqk=;
        b=d8+w57OrMQEk13WjhfYx/VfhZQgosP1/xeX8aAbQO1PtneweLxKWDFNIz6VLyJEhHc
         QVz4/nW2vgHic//O4xeVJwrTJDAnqWjdg4JzP5UChkN+7BUopN8jtYkuQorOVEcZ5GQL
         3WjY2KvUS6t3i3MFjCPWSI8dmhOy9aJlNfWbQphRU9fMn3VTvbHSUStauKs2M/vmztDA
         dh6riOPepaIOw4QPW5M2ru0QqTuyuyRvY7B8RUoeMBMaUDMN+kGv8FxRwM6HgNPxaKct
         RNk6hH3/EonMhhKcFNJUnIcEtmNOZPlbRYSkePi8v+ZgT+b8rglGgLPF1O+7jibffIze
         ajvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cMaA1nyzsHHIyVsupdd2AveqCuHeoqCD/EE44fEOuqk=;
        b=hoJ1ja1PV1VqXMvIVHgOjMpaW6Kz6yEx1qjVZSPB7jvWGwficxiutfom8qON//xMC/
         ZszlptlqPwLAnvXIw0QHbJUIqqMTe0vueDXEVw0ZYee3Obz+Mt53o9q8nI4o4w/vlRoQ
         wws8mg7Yu9+XGuLcWbBy732qOGfY738eHlcoPgNYT1V45dPlEgXur7NsokQyO7exehPf
         BnkU/9ni2RsW26n2UIWK9MSeH0wVIKNs/HkPxvDMtvPcnLCxBqOPF1djKOScQ6BSpRaV
         no0SAlveFS21Z2vKqQEXY7/IRvT89x2iUfLARnh9T9cWLt47cxDDS7adLVw3HIku6qlf
         Ujdg==
X-Gm-Message-State: AJIora+rMoHZhIXVaoYahxfTxYb+VWPydHgbi0OGldP2rBSYq0FkwFRS
	r5H/HJwk9kmd5iiHt3YDYHME2E/F1fp10UMnyd4=
X-Google-Smtp-Source: 
 AGRyM1sRzCCT29wUxi4uXTbhQ7PyPlUjG/00VEuxp0O5VAXyvDE4p/hZHvat5qFQEjih8IcrCG2P2bW/FxCPmqJzTVI=
X-Received: by 2002:a67:fe04:0:b0:354:3541:4030 with SMTP id
 l4-20020a67fe04000000b0035435414030mr8114001vsr.16.1656598398295; Thu, 30 Jun
 2022 07:13:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220629130830.48974-1-tomasz.dziendzielski@gmail.com>
 <d0ea870012451b209c23dd76627aceee97530ef1.camel@linuxfoundation.org>
In-Reply-To: 
 <d0ea870012451b209c23dd76627aceee97530ef1.camel@linuxfoundation.org>
From: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
Date: Thu, 30 Jun 2022 16:14:07 +0200
Message-ID: 
 <CAJkqNs3CpSbHOEeEBQefHf0vu_cETZ2oAe0MExETSVGUEi1q+Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] base.bbclass: Add sstate-cache dependency to
 GCCVERSION
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>,
	Jan Brzezanski <jan.brzezanski@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000010e27105e2aadf9d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jun 2022 14:13:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167412

--00000000000010e27105e2aadf9d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Would setting dependency to SDKGCCVERSION be more acceptable? That way
native recipes will not depend on target gcc version.

>I'm guessing what has happened in your case is that a
>TMPDIR as reused after changing gcc version but something didn't
>rebuild, probably as ${S} =3D=3D ${B} and hence ${B} couldn't be cleaned

The problem is not that it didn't rerun the make or didn't clean the ${B}
or ${S}. After changing GCCVERSION the nativesdk-mgen is taken from
sstate-cache.

Best regards,
Tomasz Dziendzielski


=C5=9Br., 29 cze 2022 o 16:23 Richard Purdie <richard.purdie@linuxfoundatio=
n.org>
napisa=C5=82(a):

> On Wed, 2022-06-29 at 15:08 +0200, Tomasz Dziendzielski wrote:
> > If we have the build with different gcc versions in the same workspace
> > it might happen that nativesdk recipe will not detect the change of gcc
> > and the package will be taken from sstate-cache. This will lead to
> > do_package_qa failure due to binaries requiring symbols that are not
> > present in the older libstdc++.
> >
> > Example error:
> > > ERROR: nativesdk-mgen-1.0-r0 do_package_qa: QA Issue:
> > > /opt/poky/3.2.3/sysroots/x86_64-pokysdk-linux/usr/lib/libssh2pp.so.0.=
1
> > > contained in package nativesdk-mgen requires
> > > libstdc++.so.6(GLIBCXX_3.4.11)(64bit), but no providers found in
> > > RDEPENDS_nativesdk-mgen? [file-rdeps]
> >
> > Add vardeps dependency to GCCVERSION to make sure the package is rebuil=
d
> > with correct gcc version.
> >
> > Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
> > Signed-off-by: Jan Brzezanski <jan.brzezanski@gmail.com>
> > ---
> >  meta/classes/base.bbclass | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> > index cc02de5f77..da2dc05bba 100644
> > --- a/meta/classes/base.bbclass
> > +++ b/meta/classes/base.bbclass
> > @@ -148,6 +148,7 @@ do_fetch[dirs] =3D "${DL_DIR}"
> >  do_fetch[file-checksums] =3D "${@bb.fetch.get_checksum_file_list(d)}"
> >  do_fetch[file-checksums] +=3D " ${@get_lic_checksum_file_list(d)}"
> >  do_fetch[vardeps] +=3D "SRCREV"
> > +do_fetch[vardeps] +=3D "GCCVERSION"
> >  do_fetch[network] =3D "1"
> >  python base_do_fetch() {
> >
>
>
> We're definitely not doing that, it is incorrect on many different
> levels (e.g. fetching is not dependent on the target compiler version
> just for starters). You also just made all native recipes rebuild for
> the target GCC version too, which again, is just wrong.
>
> Building with a different target gcc version should mean all the sstate
> checksums change. I'm guessing what has happened in your case is that a
> TMPDIR as reused after changing gcc version but something didn't
> rebuild, probably as ${S} =3D=3D ${B} and hence ${B} couldn't be cleaned.
> We should really track down where the corruption came in and improve
> the build output isolation of wherever that came from.
>
> Worse is that your "fix" above probably won't even solve the problem as
> if you repeat your build workflow where this broke originally, I'd
> strongly suspect it will still break with that change above too.
>
> Cheers,
>
> Richard
>
>

--00000000000010e27105e2aadf9d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Would setting dependency to SDKGCCVERSION be more acc=
eptable? That way native recipes will not depend on target gcc version.<br>=
<br>&gt;I&#39;m guessing what has happened in your case is that a<br>&gt;TM=
PDIR as reused after changing gcc version but something didn&#39;t<br>&gt;r=
ebuild, probably as ${S} =3D=3D ${B} and hence ${B} couldn&#39;t be cleaned=
<br><br></div>The problem is not that it didn&#39;t rerun the make or didn&=
#39;t clean the ${B} or ${S}. After changing GCCVERSION the nativesdk-mgen =
is taken from sstate-cache.<br><div><br></div><div>Best regards,</div><div>=
Tomasz Dziendzielski<br></div><br></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">=C5=9Br., 29 cze 2022 o 16:23=C2=A0Richar=
d Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=
=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt; napisa=C5=82(a):<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed, 2022-06-29 =
at 15:08 +0200, Tomasz Dziendzielski wrote:<br>
&gt; If we have the build with different gcc versions in the same workspace=
<br>
&gt; it might happen that nativesdk recipe will not detect the change of gc=
c<br>
&gt; and the package will be taken from sstate-cache. This will lead to<br>
&gt; do_package_qa failure due to binaries requiring symbols that are not<b=
r>
&gt; present in the older libstdc++.<br>
&gt; <br>
&gt; Example error:<br>
&gt; &gt; ERROR: nativesdk-mgen-1.0-r0 do_package_qa: QA Issue:<br>
&gt; &gt; /opt/poky/3.2.3/sysroots/x86_64-pokysdk-linux/usr/lib/libssh2pp.s=
o.0.1<br>
&gt; &gt; contained in package nativesdk-mgen requires<br>
&gt; &gt; libstdc++.so.6(GLIBCXX_3.4.11)(64bit), but no providers found in<=
br>
&gt; &gt; RDEPENDS_nativesdk-mgen? [file-rdeps]<br>
&gt; <br>
&gt; Add vardeps dependency to GCCVERSION to make sure the package is rebui=
ld<br>
&gt; with correct gcc version.<br>
&gt; <br>
&gt; Signed-off-by: Tomasz Dziendzielski &lt;<a href=3D"mailto:tomasz.dzien=
dzielski@gmail.com" target=3D"_blank">tomasz.dziendzielski@gmail.com</a>&gt=
;<br>
&gt; Signed-off-by: Jan Brzezanski &lt;<a href=3D"mailto:jan.brzezanski@gma=
il.com" target=3D"_blank">jan.brzezanski@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes/base.bbclass | 1 +<br>
&gt;=C2=A0 1 file changed, 1 insertion(+)<br>
&gt; <br>
&gt; diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass<br>
&gt; index cc02de5f77..da2dc05bba 100644<br>
&gt; --- a/meta/classes/base.bbclass<br>
&gt; +++ b/meta/classes/base.bbclass<br>
&gt; @@ -148,6 +148,7 @@ do_fetch[dirs] =3D &quot;${DL_DIR}&quot;<br>
&gt;=C2=A0 do_fetch[file-checksums] =3D &quot;${@bb.fetch.get_checksum_file=
_list(d)}&quot;<br>
&gt;=C2=A0 do_fetch[file-checksums] +=3D &quot; ${@get_lic_checksum_file_li=
st(d)}&quot;<br>
&gt;=C2=A0 do_fetch[vardeps] +=3D &quot;SRCREV&quot;<br>
&gt; +do_fetch[vardeps] +=3D &quot;GCCVERSION&quot;<br>
&gt;=C2=A0 do_fetch[network] =3D &quot;1&quot;<br>
&gt;=C2=A0 python base_do_fetch() {<br>
&gt; <br>
<br>
<br>
We&#39;re definitely not doing that, it is incorrect on many different<br>
levels (e.g. fetching is not dependent on the target compiler version<br>
just for starters). You also just made all native recipes rebuild for<br>
the target GCC version too, which again, is just wrong.<br>
<br>
Building with a different target gcc version should mean all the sstate<br>
checksums change. I&#39;m guessing what has happened in your case is that a=
<br>
TMPDIR as reused after changing gcc version but something didn&#39;t<br>
rebuild, probably as ${S} =3D=3D ${B} and hence ${B} couldn&#39;t be cleane=
d.<br>
We should really track down where the corruption came in and improve<br>
the build output isolation of wherever that came from.<br>
<br>
Worse is that your &quot;fix&quot; above probably won&#39;t even solve the =
problem as<br>
if you repeat your build workflow where this broke originally, I&#39;d<br>
strongly suspect it will still break with that change above too.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div>

--00000000000010e27105e2aadf9d--

