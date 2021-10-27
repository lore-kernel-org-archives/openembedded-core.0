Return-Path: <tomasz.dziendzielski@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47773C433EF
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 08:04:31 +0000 (UTC)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com
 [209.85.221.170])
 by mx.groups.io with SMTP id smtpd.web11.8569.1635321870033342592
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 01:04:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PecMbq4q;
 spf=pass (domain: gmail.com, ip: 209.85.221.170,
 mailfrom: tomasz.dziendzielski@gmail.com)
Received: by mail-vk1-f170.google.com with SMTP id 144so646086vky.7
        for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 01:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FldILVHd9q+6IuGsDWLqdv69bzhEhRoNqCM2xjet93M=;
        b=PecMbq4q2QU4eAQdkD8dRBe2w0BrNnAjE8sdt7Js1f3tf1JXr8AigVxPxSBI9/gFBW
         yhtfhD0GGSubF/WIYnXbnlKjzBS02JUQrL7pyEfJ4i6TwLd0W/o0g/Z5/8GOPqGvJCBQ
         xw7jLIrI3vT56gjT+H7xvgxuwCZPOvjcVK6AI8dMHeqepOTvGaAw7onOFkpbg/5xbuTg
         ACfVCjijqF0q96iXO+KTen/6ZZM/zuMLhPqkLsX3sOl/pw5Py2Wb+1bOg/gsChoVtOl5
         vCuqaHxjUH+F4LzGyIKKq2zYam4gZzhXGZMpM53fNZwH62LLvwLcFqmWtkZnmdcezmaT
         qzBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FldILVHd9q+6IuGsDWLqdv69bzhEhRoNqCM2xjet93M=;
        b=pjko3Z1HtiiI+XW77Pienbu7wbS2UTkDkqXJ/9OrHxOMajou/Ks5hRO9GvjUY+WrCx
         uAEx45CraNzuwJAtWPrcciVQoT/IJwPoUF1JdypSZ6MCjXPjw8oXR1ofMMMfjIscOlah
         ZtYh6qeKhI2jI1KlVOEv+kGQ/C/PMOLzhFF779wGzT6Khl7Wp2TcIPvyBiaOfECmuR5h
         Pon40OKdNjJiFWwpi1loSkzZ3EbNUX2WgOZFZQZVqptlPyRsF7OIacWvrRck6M4a27q8
         His9BU75noXW3Xcd6CmpDzL4MXcvuxuJPg8xGvi3hbMqE1XGGBKS9C3zzBer0ELoA74j
         hedw==
X-Gm-Message-State: AOAM531tMoY4UaUH0+naxazQYXJViaF0HUIL3SBWZJPZNVSZpowNIbKR
	hveATtcDYmGVt71s70radoXWfNKJRWdCQQF0D6Q=
X-Google-Smtp-Source: 
 ABdhPJxRtVjNVTfGg6G5zfxAIQ744sj+BYOHz0oYmd34j0tzeg3C7f2rzhmhUn5mgkzljS3joTdmaJ9t6LnM7HJL54E=
X-Received: by 2002:a05:6122:550:: with SMTP id
 y16mr28973901vko.18.1635321869156;
 Wed, 27 Oct 2021 01:04:29 -0700 (PDT)
MIME-Version: 1.0
References: <20211026073249.3424-1-tomasz.dziendzielski@gmail.com>
 <e72e9ae071bc25c6d14749c1604fb9b4b890a0ae.camel@linuxfoundation.org>
In-Reply-To: 
 <e72e9ae071bc25c6d14749c1604fb9b4b890a0ae.camel@linuxfoundation.org>
From: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
Date: Wed, 27 Oct 2021 10:06:11 +0200
Message-ID: 
 <CAJkqNs0mS8YTdnidQ+tXOWOVEihY+pACG3jThrPTi0GfMRNsPQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] license_image: Prevent do_populate_lic_deploy
 from using image recipes' recipeinfo
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>,
	Jan Brzezanski <jan.brzezanski@gmail.com>,
 Ricardo Rodrigues <rrodrigues80@gmail.com>,
	Szymon Czarnuch <szymek125.14@gmail.com>, Kamil Kwiek <kamil.kwiek@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000001ac7c005cf510b7b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Oct 2021 08:04:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157475

--0000000000001ac7c005cf510b7b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>a) we can't tell the difference between a broken recipe which failed to
generate
>recipeinfo for some reason and an image target
We can, only image targets generate image_license.manifest and
license.manifest, that's why in the patch I'm checking for it.

>b) The license info is effectively lost/ignored for the second image
Maybe I'll try to merge license.manifest from the first image target to the
second image.

Best regards,
Tomasz Dziendzielski

wt., 26 pa=C5=BA 2021 o 14:55 Richard Purdie <richard.purdie@linuxfoundatio=
n.org>
napisa=C5=82(a):

> On Tue, 2021-10-26 at 09:32 +0200, Tomasz Dziendzielski wrote:
> > If image recipe depends on another image recipe it will try to use
> > license recipeinfo that is not deployed. It will result in:
> > > Exception: FileNotFoundError: [Errno 2] No such file or directory:
> > > 'TMPDIR/deploy/licenses/foo-image/recipeinfo'
> >
> > In such case check for image_license.manifest file (which means dep is
> > an image recipe) and skip if true.
> >
> > Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
> > Signed-off-by: Jan Brzezanski <jan.brzezanski@gmail.com>
> > Signed-off-by: Ricardo Rodrigues <rrodrigues80@gmail.com>
> > Signed-off-by: Szymon Czarnuch <szymek125.14@gmail.com>
> > Signed-off-by: Kamil Kwiek <kamil.kwiek@gmail.com>
> > ---
> >  meta/classes/license_image.bbclass | 15 +++++++++++----
> >  1 file changed, 11 insertions(+), 4 deletions(-)
> >
> > diff --git a/meta/classes/license_image.bbclass
> b/meta/classes/license_image.bbclass
> > index bf70bee99b..cc1d9ea651 100644
> > --- a/meta/classes/license_image.bbclass
> > +++ b/meta/classes/license_image.bbclass
> > @@ -201,10 +201,17 @@ def license_deployed_manifest(d):
> >          man_dic[dep]["PN"] =3D dep
> >          man_dic[dep]["FILES"] =3D \
> >              " ".join(get_deployed_files(dep_dic[dep]))
> > -        with open(os.path.join(lic_dir, dep, "recipeinfo"), "r") as f:
> > -            for line in f.readlines():
> > -                key,val =3D line.split(": ", 1)
> > -                man_dic[dep][key] =3D val[:-1]
> > +        try:
> > +            with open(os.path.join(lic_dir, dep, "recipeinfo"), "r") a=
s
> f:
> > +                for line in f.readlines():
> > +                    key,val =3D line.split(": ", 1)
> > +                    man_dic[dep][key] =3D val[:-1]
> > +        except FileNotFoundError:
> > +            if os.path.exists(os.path.join(
> > +                    lic_dir, "%s-%s" % (dep, d.getVar("MACHINE")),
> "image_license.manifest")):
> > +                del man_dic[dep]
> > +            else:
> > +                raise
> >
> >      lic_manifest_dir =3D os.path.join(d.getVar('LICENSE_DIRECTORY'),
> >                                      d.getVar('IMAGE_NAME'))
>
> We've seen this issue before. I don't like the fixes I've seen for two
> reasons:
>
> a) we can't tell the difference between a broken recipe which failed to
> generate
> recipeinfo for some reason and an image target
>
> b) The license info is effectively lost/ignored for the second image
>
> I think we need to do something better than this.
>
> Cheers,
>
> Richard
>
>
>
>

--0000000000001ac7c005cf510b7b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">&gt;a) we can&#39;t tell the difference between a broken r=
ecipe which failed to generate<br><div>
&gt;recipeinfo for some reason and an image target</div><div>We can, only i=
mage targets generate image_license.manifest and license.manifest, that&#39=
;s why in the patch I&#39;m checking for it.</div><div><br></div><div>&gt;b=
) The license info is effectively lost/ignored for the second image<br></di=
v><div>Maybe I&#39;ll try to merge license.manifest from the first image ta=
rget to the second image.</div><div><br></div><div>Best regards,</div><div>=
Tomasz Dziendzielski<br></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">wt., 26 pa=C5=BA 2021 o 14:55=C2=A0Richard Pu=
rdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purd=
ie@linuxfoundation.org</a>&gt; napisa=C5=82(a):<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On Tue, 2021-10-26 at 09:32 +0200, Tomasz =
Dziendzielski wrote:<br>
&gt; If image recipe depends on another image recipe it will try to use<br>
&gt; license recipeinfo that is not deployed. It will result in:<br>
&gt; &gt; Exception: FileNotFoundError: [Errno 2] No such file or directory=
:<br>
&gt; &gt; &#39;TMPDIR/deploy/licenses/foo-image/recipeinfo&#39;<br>
&gt; <br>
&gt; In such case check for image_license.manifest file (which means dep is=
<br>
&gt; an image recipe) and skip if true.<br>
&gt; <br>
&gt; Signed-off-by: Tomasz Dziendzielski &lt;<a href=3D"mailto:tomasz.dzien=
dzielski@gmail.com" target=3D"_blank">tomasz.dziendzielski@gmail.com</a>&gt=
;<br>
&gt; Signed-off-by: Jan Brzezanski &lt;<a href=3D"mailto:jan.brzezanski@gma=
il.com" target=3D"_blank">jan.brzezanski@gmail.com</a>&gt;<br>
&gt; Signed-off-by: Ricardo Rodrigues &lt;<a href=3D"mailto:rrodrigues80@gm=
ail.com" target=3D"_blank">rrodrigues80@gmail.com</a>&gt;<br>
&gt; Signed-off-by: Szymon Czarnuch &lt;<a href=3D"mailto:szymek125.14@gmai=
l.com" target=3D"_blank">szymek125.14@gmail.com</a>&gt;<br>
&gt; Signed-off-by: Kamil Kwiek &lt;<a href=3D"mailto:kamil.kwiek@gmail.com=
" target=3D"_blank">kamil.kwiek@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes/license_image.bbclass | 15 +++++++++++----<br>
&gt;=C2=A0 1 file changed, 11 insertions(+), 4 deletions(-)<br>
&gt; <br>
&gt; diff --git a/meta/classes/license_image.bbclass b/meta/classes/license=
_image.bbclass<br>
&gt; index bf70bee99b..cc1d9ea651 100644<br>
&gt; --- a/meta/classes/license_image.bbclass<br>
&gt; +++ b/meta/classes/license_image.bbclass<br>
&gt; @@ -201,10 +201,17 @@ def license_deployed_manifest(d):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 man_dic[dep][&quot;PN&quot;] =3D dep=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 man_dic[dep][&quot;FILES&quot;] =3D =
\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot; &quot;.join(get=
_deployed_files(dep_dic[dep]))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(os.path.join(lic_dir, dep, &quo=
t;recipeinfo&quot;), &quot;r&quot;) as f:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for line in f.readlines():<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 key,val =3D l=
ine.split(&quot;: &quot;, 1)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 man_dic[dep][=
key] =3D val[:-1]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(os.path.join(lic_=
dir, dep, &quot;recipeinfo&quot;), &quot;r&quot;) as f:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for line in f=
.readlines():<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 key,val =3D line.split(&quot;: &quot;, 1)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 man_dic[dep][key] =3D val[:-1]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 except FileNotFoundError:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.path.exists(os.path.j=
oin(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 lic_dir, &quot;%s-%s&quot; % (dep, d.getVar(&quot;MACHINE&quot;)), &quot;i=
mage_license.manifest&quot;)):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 del man_dic[d=
ep]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 lic_manifest_dir =3D os.path.join(d.getVar(&#39;LI=
CENSE_DIRECTORY&#39;),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.getVar(&#3=
9;IMAGE_NAME&#39;))<br>
<br>
We&#39;ve seen this issue before. I don&#39;t like the fixes I&#39;ve seen =
for two reasons:<br>
<br>
a) we can&#39;t tell the difference between a broken recipe which failed to=
 generate<br>
recipeinfo for some reason and an image target<br>
<br>
b) The license info is effectively lost/ignored for the second image<br>
<br>
I think we need to do something better than this.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
<br>
</blockquote></div>

--0000000000001ac7c005cf510b7b--

