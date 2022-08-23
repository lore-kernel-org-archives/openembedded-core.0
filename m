Return-Path: <mateuszmar2@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76D49C32772
	for <webhook@archiver.kernel.org>; Tue, 23 Aug 2022 19:15:17 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com
 [209.85.160.41])
 by mx.groups.io with SMTP id smtpd.web08.2081.1661282107310007676
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 12:15:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YHulP7bU;
 spf=pass (domain: gmail.com, ip: 209.85.160.41,
 mailfrom: mateuszmar2@gmail.com)
Received: by mail-oa1-f41.google.com with SMTP id
 586e51a60fabf-11c5ee9bf43so17964662fac.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 12:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=nq637YlGtrB7IxZ+L8qhd+ovk/3gMcsTytkDKrT7oAc=;
        b=YHulP7bUys4wU2Dt7Jkqi2z/YfirCosMkrKjZZctpIFvBgoH48YOVME6ma2p2EuF6N
         sFsognipmucwma73mJMJwyVI7nxwrVweju+sdb6XxEqc629tyuiqUMvhQsQe2H9tLflw
         dH/NCxGIdQBXvWgRNjZp1Du92lhVH//ZvII1wKUd5Rg5KJy5CHgxfSkaxeLs6aks9Vym
         b5i2dS8ebP1vANDnESs6ykUIpXZFwBz9iPhMt2VnKrR15OZP2qcdVjWPf91oypOtaRDw
         pCf5XzVMRj4LcH908Dp/oUEGLzyU52fm2DLTTSGHc3Pw/tIogp0jsydppOZw6q/YV1SJ
         94NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=nq637YlGtrB7IxZ+L8qhd+ovk/3gMcsTytkDKrT7oAc=;
        b=AT4E+x9rcK5a4gOVFKPjlOgEXAMVzt9GMrEuKWCz/fzACVpiCjgAOG1jE46ppnUUXG
         IrD37wS+8jjllzku/bqSWVDW9xi0G7s2Qa7AycxNvrYFV6riUMYlgP/IQxhGtDaRabk3
         6BfGSEOKjAcJcOQQUlC9BosmutgnnSTlzlDUiU0sKJzmjr5eIDzsFuhE1bO7OJ/RzfYz
         Usd+vHgqxJ1Ipb8jEaZaH03Nja/jXup/zKH/5khGdKYfz/7oNExx/I4ZMAeVsM2ZV8UM
         fgayCn6BYGRZ/jTL6JXSg1lW659Xl4hS1027OHLVtnzO9MdbnSiVTGi/bhKabq0jOsHN
         X3mQ==
X-Gm-Message-State: ACgBeo0n+GST/1b84Bx5ZXQZnfcAMicQ5/JxUnECQg3nFCQdfl1Esx1+
	brbbpiBGBXQKi+stEqejq6e+uRmK+gFk+Kd56cw=
X-Google-Smtp-Source: 
 AA6agR5xoLQcIBBjDYwSz4yI1hOJHk29X81IXsfNyDtgEHv/a+3Gfo/0rgTOsv/Zicfxho4fOc+JGeGCmU/q4UHcbuk=
X-Received: by 2002:a05:6870:4597:b0:11c:ab4e:9fe8 with SMTP id
 y23-20020a056870459700b0011cab4e9fe8mr2144441oao.123.1661282106644; Tue, 23
 Aug 2022 12:15:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220823110239.667405-1-mateuszmar2@gmail.com>
 <d6b2c431-88ff-27b6-1b64-f857b6d7e146@theobroma-systems.com>
In-Reply-To: <d6b2c431-88ff-27b6-1b64-f857b6d7e146@theobroma-systems.com>
From: Mateusz Marciniec <mateuszmar2@gmail.com>
Date: Tue, 23 Aug 2022 21:14:55 +0200
Message-ID: 
 <CAFZoAkxKMjsTGDL5jGu1wz33nmGscr4z9KHpWncTaXTFJQFmtQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] configure.ac: Improve check for magic
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Cc: openembedded-core@lists.openembedded.org,
	Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000d69cf005e6ed61d2"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Aug 2022 19:15:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169725

--000000000000d69cf005e6ed61d2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Quentin,

yes, my bad, I didn't notice that this commit title doesn't belong here.
I will make changes according to your comments.
Thank you very much for your explanation :)

Best Regards,
Mateusz

wt., 23 sie 2022 o 13:25 Quentin Schulz <
quentin.schulz@theobroma-systems.com> napisa=C5=82(a):

> Hi Mateusz,
>
> Your commit title should have the recipe this applies to:
>
> util-linux: Improve check for magic in configure.ac
>
> for example.
> On 8/23/22 13:02, Mateusz Marciniec wrote:
> > Check whether magic.h header exists before defining HAVE_MAGIC.
> >
> > Despite library availability there still can be missing header.
> > Current test doesn't cover that possibility which will lead compilation
> > to fail in case of separate sysroot.
> >
> > Upstream-Status: Accepted [expected in next release after 2.38.1]
> >
> > Signed-off-by: Mateusz Marciniec <mateuszmar2@gmail.com>
> > Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
> > ---
> >   meta/recipes-core/util-linux/util-linux.inc   |  1 +
> >   ...configure.ac-Improve-check-for-magic.patch | 39 ++++++++++++++++++=
+
> >   2 files changed, 40 insertions(+)
> >   create mode 100644
> meta/recipes-core/util-linux/util-linux/0001-configure.ac-Improve-check-f=
or-magic.patch
> >
> > diff --git a/meta/recipes-core/util-linux/util-linux.inc
> b/meta/recipes-core/util-linux/util-linux.inc
> > index 416550a6b2..3868b1c41d 100644
> > --- a/meta/recipes-core/util-linux/util-linux.inc
> > +++ b/meta/recipes-core/util-linux/util-linux.inc
> > @@ -36,6 +36,7 @@ SRC_URI =3D
> "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
> >              file://display_testname_for_subtest.patch \
> >              file://avoid_parallel_tests.patch \
> >              file://0001-check-for-sys-pidfd.h.patch \
> > +           file://0001-configure.ac-Improve-check-for-magic.patch \
> >              "
> >
> >   SRC_URI[sha256sum] =3D
> "60492a19b44e6cf9a3ddff68325b333b8b52b6c59ce3ebd6a0ecaa4c5117e84f"
> > diff --git
> a/meta/recipes-core/util-linux/util-linux/0001-configure.ac-Improve-check=
-for-magic.patch
> b/meta/recipes-core/util-linux/util-linux/0001-configure.ac-Improve-check=
-for-magic.patch
> > new file mode 100644
> > index 0000000000..0748e4cfb5
> > --- /dev/null
> > +++
> b/meta/recipes-core/util-linux/util-linux/0001-configure.ac-Improve-check=
-for-magic.patch
> > @@ -0,0 +1,39 @@
> > +From 263381ddd46eea2293c70bc811273b66bc52087b Mon Sep 17 00:00:00 2001
> > +From: Mateusz Marciniec <mateuszmar2@gmail.com>
> > +Date: Fri, 19 Aug 2022 14:47:49 +0200
> > +Subject: [PATCH] configure.ac: Improve check for magic
> > +
> > +Check whether magic.h header exists before defining HAVE_MAGIC.
> > +
> > +Despite library availability there still can be missing header.
> > +Current test doesn't cover that possibility which will lead compilatio=
n
> > +to fail in case of separate sysroot.
> > +
> > +Upstream-Status: Accepted [expected in next release after 2.38.1]
> > +
>
> This is a backport I would say, please use:
> Upstream-Status: Backport
> [
> https://github.com/util-linux/util-linux/commit/263381ddd46eea2293c70bc81=
1273b66bc52087b
> ]
>
> I assume the Accepted status would be for projects not using software
> version control (e.g. svn, git) where it's difficult to extract a simple
> patch. What comes to mind is ncurses project for example.
>
> Not a biggie, but having at least the link would be very nice though :)
>
> Cheers,
> Quentin
>

--000000000000d69cf005e6ed61d2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Quentin,<br><br>yes, my bad, I didn&#39;t notice tha=
t this commit title doesn&#39;t belong here.<br>I will make changes accordi=
ng to=C2=A0your=C2=A0comments.<br>Thank you very much for your explanation =
:)<br><br>Best Regards,<br>Mateusz</div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">wt., 23 sie 2022 o 13:25=C2=A0Quentin Sch=
ulz &lt;<a href=3D"mailto:quentin.schulz@theobroma-systems.com">quentin.sch=
ulz@theobroma-systems.com</a>&gt; napisa=C5=82(a):<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">Hi Mateusz,<br>
<br>
Your commit title should have the recipe this applies to:<br>
<br>
util-linux: Improve check for magic in <a href=3D"http://configure.ac" rel=
=3D"noreferrer" target=3D"_blank">configure.ac</a><br>
<br>
for example.<br>
On 8/23/22 13:02, Mateusz Marciniec wrote:<br>
&gt; Check whether magic.h header exists before defining HAVE_MAGIC.<br>
&gt; <br>
&gt; Despite library availability there still can be missing header.<br>
&gt; Current test doesn&#39;t cover that possibility which will lead compil=
ation<br>
&gt; to fail in case of separate sysroot.<br>
&gt; <br>
&gt; Upstream-Status: Accepted [expected in next release after 2.38.1]<br>
&gt; <br>
&gt; Signed-off-by: Mateusz Marciniec &lt;<a href=3D"mailto:mateuszmar2@gma=
il.com" target=3D"_blank">mateuszmar2@gmail.com</a>&gt;<br>
&gt; Signed-off-by: Tomasz Dziendzielski &lt;<a href=3D"mailto:tomasz.dzien=
dzielski@gmail.com" target=3D"_blank">tomasz.dziendzielski@gmail.com</a>&gt=
;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0meta/recipes-core/util-linux/util-linux.inc=C2=A0 =C2=A0|=
=C2=A0 1 +<br>
&gt;=C2=A0 =C2=A0...configure.ac-Improve-check-for-magic.patch | 39 +++++++=
++++++++++++<br>
&gt;=C2=A0 =C2=A02 files changed, 40 insertions(+)<br>
&gt;=C2=A0 =C2=A0create mode 100644 meta/recipes-core/util-linux/util-linux=
/0001-configure.ac-Improve-check-for-magic.patch<br>
&gt; <br>
&gt; diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipe=
s-core/util-linux/util-linux.inc<br>
&gt; index 416550a6b2..3868b1c41d 100644<br>
&gt; --- a/meta/recipes-core/util-linux/util-linux.inc<br>
&gt; +++ b/meta/recipes-core/util-linux/util-linux.inc<br>
&gt; @@ -36,6 +36,7 @@ SRC_URI =3D &quot;${KERNELORG_MIRROR}/linux/utils/ut=
il-linux/v${MAJOR_VERSION}/util-lin<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://display_testnam=
e_for_subtest.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://avoid_parallel_=
tests.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-check-for-=
sys-pidfd.h.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-configure.ac-Imp=
rove-check-for-magic.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0SRC_URI[sha256sum] =3D &quot;60492a19b44e6cf9a3ddff68325b3=
33b8b52b6c59ce3ebd6a0ecaa4c5117e84f&quot;<br>
&gt; diff --git a/meta/recipes-core/util-linux/util-linux/0001-configure.ac=
-Improve-check-for-magic.patch b/meta/recipes-core/util-linux/util-linux/00=
01-configure.ac-Improve-check-for-magic.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..0748e4cfb5<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-core/util-linux/util-linux/0001-configure.ac-Improv=
e-check-for-magic.patch<br>
&gt; @@ -0,0 +1,39 @@<br>
&gt; +From 263381ddd46eea2293c70bc811273b66bc52087b Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Mateusz Marciniec &lt;<a href=3D"mailto:mateuszmar2@gmail.com" =
target=3D"_blank">mateuszmar2@gmail.com</a>&gt;<br>
&gt; +Date: Fri, 19 Aug 2022 14:47:49 +0200<br>
&gt; +Subject: [PATCH] <a href=3D"http://configure.ac" rel=3D"noreferrer" t=
arget=3D"_blank">configure.ac</a>: Improve check for magic<br>
&gt; +<br>
&gt; +Check whether magic.h header exists before defining HAVE_MAGIC.<br>
&gt; +<br>
&gt; +Despite library availability there still can be missing header.<br>
&gt; +Current test doesn&#39;t cover that possibility which will lead compi=
lation<br>
&gt; +to fail in case of separate sysroot.<br>
&gt; +<br>
&gt; +Upstream-Status: Accepted [expected in next release after 2.38.1]<br>
&gt; +<br>
<br>
This is a backport I would say, please use:<br>
Upstream-Status: Backport <br>
[<a href=3D"https://github.com/util-linux/util-linux/commit/263381ddd46eea2=
293c70bc811273b66bc52087b" rel=3D"noreferrer" target=3D"_blank">https://git=
hub.com/util-linux/util-linux/commit/263381ddd46eea2293c70bc811273b66bc5208=
7b</a>]<br>
<br>
I assume the Accepted status would be for projects not using software <br>
version control (e.g. svn, git) where it&#39;s difficult to extract a simpl=
e <br>
patch. What comes to mind is ncurses project for example.<br>
<br>
Not a biggie, but having at least the link would be very nice though :)<br>
<br>
Cheers,<br>
Quentin<br>
</blockquote></div>

--000000000000d69cf005e6ed61d2--

