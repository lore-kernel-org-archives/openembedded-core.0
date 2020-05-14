Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
 by mx.groups.io with SMTP id smtpd.web10.2007.1589493228330743722
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2020 14:53:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kynetics-com.20150623.gappssmtp.com header.s=20150623 header.b=F2qAgnBB;
 spf=neutral (domain: kynetics.com, ip: 209.85.218.66, mailfrom: diego.rondini@kynetics.com)
Received: by mail-ej1-f66.google.com with SMTP id h21so251935ejq.5
        for <openembedded-core@lists.openembedded.org>; Thu, 14 May 2020 14:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kynetics-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Sq5IK46aL6qHk+BRBM+rbDQCHYR7EEEzOYOPANij9CU=;
        b=F2qAgnBBW51kOpYjMt5maY/3o7fNTta+e9o13gBQ14lb2xgGB7ZhN4PGxnlOdc/pNM
         AoBrsp50hGZGGXbBZ5aZLBHJ905nm+CIBR9//aDqh6gIaXVPpiAgPw78fBEje0YpNbC2
         ybnp7CefPANiqh2funKGe78EroxIWF/MPhl3Seh8K7F9iyNmtXvMOPc7C8yoPzcJ5Fpw
         1JkXHyNuFxgsPLB4fWQEblZKQ1A50Nh6QLuTnAjrHP+Fq7Poi5+IbmJP87WBPhKMUfAD
         jYAJr/NIYMfL5dA7m2Xes9Jpt2v75hVFGTKzLe+Eku7o2pOX5hDdky4RyfyS4JmLfJ2+
         Mtwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Sq5IK46aL6qHk+BRBM+rbDQCHYR7EEEzOYOPANij9CU=;
        b=CBX1+WxEBWjgbTFJfCN+ylQBvAt0aL8mLiyxZdEFgngn6IcWTU7NPKeRFeM6UhSUqL
         /V6lsxglrg8kLCDO+mX1UYW6yKXJYlkFlrer0t760s4GsU5Zqlq/37vvr38QKklLdNUr
         dCccTtbejuZ7jrVDx/J5HxEw3Zg8s+qVieQIeeD5LLklouLQbAcDfBB/PFTaHO41LDff
         h5jYco3nbmz3Kr0/P5Hs4X5Pc5KK5RVjT6BfgVUrtNDTk+WcttJ/nGUEaVLsbpiXmfaL
         hhdRd/c3ZAhlJaMKYO5J00iQ/cfvhwHKaMVznjw+FBPrmNcwlJN3ylko6dhGGYr9GBnT
         Qo0g==
X-Gm-Message-State: AOAM530VX28UZI6zZc/HP/sGUL1v+oMCRpEmbliLuGZZVQQok8HWELxn
	Vccx98Ps+ILQtbjHwHrg3WPsWuXIPiml3b9e3MrEsA==
X-Google-Smtp-Source: ABdhPJxIVpjnh+CSaDNIRIKr4M8m1jBpJQZX0te5oTkbQ/+1giRSGuaR03HhLzNybA+cjECQ2J1R1+7jVh46MRw++ps=
X-Received: by 2002:a17:906:dc2:: with SMTP id p2mr97500eji.212.1589493226756;
 Thu, 14 May 2020 14:53:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200514131956.18463-1-diego.rondini@kynetics.com> <46e7dbc17ee0237529c6ae3d3f5162aa16105cd0.camel@linuxfoundation.org>
In-Reply-To: <46e7dbc17ee0237529c6ae3d3f5162aa16105cd0.camel@linuxfoundation.org>
From: "Diego" <diego.rondini@kynetics.com>
Date: Thu, 14 May 2020 23:53:35 +0200
Message-ID: <CAMfw5YopZDvTBsL=zVKGTLPv5uvfmJ0L7j+y0r9PpO7drYwKMQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] image_types: declare support for wic.zst
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000027724c05a5a2bb90"

--00000000000027724c05a5a2bb90
Content-Type: text/plain; charset="UTF-8"

Hi Richard,

On Thu, May 14, 2020 at 11:21 PM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Thu, 2020-05-14 at 15:19 +0200, Diego wrote:
> > Declare images in wic.zst format as supported, as bmaptool now supports
> > zstd:
> >
> https://github.com/intel/bmap-tools/commit/1b8437d58447d3796dc11fd0f2c62bec5746e5d6
> > Given the very fast decompression speed of zstd over, for example, gzip,
> > writing images with bmaptool can provide big write speed improvements
> > when decompression speed is the limiting factor (especially with very
> > sparse images).
> >
> > Signed-off-by: Diego Rondini <diego.rondini@kynetics.com>
> > ---
> >  meta/classes/image_types.bbclass | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/classes/image_types.bbclass
> b/meta/classes/image_types.bbclass
> > index f82f1d8862..ab05cc90ff 100644
> > --- a/meta/classes/image_types.bbclass
> > +++ b/meta/classes/image_types.bbclass
> > @@ -273,7 +273,7 @@ IMAGE_TYPES = " \
> >      ubi ubifs multiubi \
> >      tar tar.gz tar.bz2 tar.xz tar.lz4 tar.zst \
> >      cpio cpio.gz cpio.xz cpio.lzma cpio.lz4 \
> > -    wic wic.gz wic.bz2 wic.lzma \
> > +    wic wic.gz wic.bz2 wic.lzma wic.zst \
> >      container \
> >      f2fs \
> >  "
>
> Causes selftest failures:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/931
>
> (oe-selftest -r imagefeatures.ImageFeatures.test_image_fstypes)
>
>
I'm wondering how this didn't pop up earlier. The following patch
introduced zstd support:
http://git.openembedded.org/openembedded-core/commit/meta/classes/image_types.bbclass?id=77e0f502020085875bbc74da66815c89f19a9351
of course specifying a DEPENDS on zstd-native:
http://git.openembedded.org/openembedded-core/tree/meta/classes/image_types.bbclass?h=yocto-3.1#n316
but... zstd is NOT in oe-core, but in meta-oe!
http://layers.openembedded.org/layerindex/recipe/116635/

I guess the solution for master is to move zstd to oe-core, right?

But what about dunfell? It has the zstd support in image_types.bbclass
patch, but we can't add zstd. Shall we revert the patch?

Regards,
Diego Rondini
Sr. Embedded Engineer

Kynetics
www.kynetics.com

--00000000000027724c05a5a2bb90
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Richard,<br></div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 14, 2020 at 11=
:21 PM Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.=
org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">On Thu, 2020-05-14 at 15:19 +0200, D=
iego wrote:<br>
&gt; Declare images in wic.zst format as supported, as bmaptool now support=
s<br>
&gt; zstd:<br>
&gt; <a href=3D"https://github.com/intel/bmap-tools/commit/1b8437d58447d379=
6dc11fd0f2c62bec5746e5d6" rel=3D"noreferrer" target=3D"_blank">https://gith=
ub.com/intel/bmap-tools/commit/1b8437d58447d3796dc11fd0f2c62bec5746e5d6</a>=
<br>
&gt; Given the very fast decompression speed of zstd over, for example, gzi=
p,<br>
&gt; writing images with bmaptool can provide big write speed improvements<=
br>
&gt; when decompression speed is the limiting factor (especially with very<=
br>
&gt; sparse images).<br>
&gt; <br>
&gt; Signed-off-by: Diego Rondini &lt;<a href=3D"mailto:diego.rondini@kynet=
ics.com" target=3D"_blank">diego.rondini@kynetics.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes/image_types.bbclass | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_typ=
es.bbclass<br>
&gt; index f82f1d8862..ab05cc90ff 100644<br>
&gt; --- a/meta/classes/image_types.bbclass<br>
&gt; +++ b/meta/classes/image_types.bbclass<br>
&gt; @@ -273,7 +273,7 @@ IMAGE_TYPES =3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ubi ubifs multiubi \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 tar tar.gz tar.bz2 tar.xz tar.lz4 tar.zst \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 cpio cpio.gz cpio.xz cpio.lzma cpio.lz4 \<br>
&gt; -=C2=A0 =C2=A0 wic wic.gz wic.bz2 wic.lzma \<br>
&gt; +=C2=A0 =C2=A0 wic wic.gz wic.bz2 wic.lzma wic.zst \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 container \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 f2fs \<br>
&gt;=C2=A0 &quot;<br>
<br>
Causes selftest failures:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/87/build=
s/931" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoprojec=
t.org/typhoon/#/builders/87/builds/931</a><br>
<br>
(oe-selftest -r imagefeatures.ImageFeatures.test_image_fstypes)<br>
<br></blockquote><div><br></div><div>I&#39;m wondering how this didn&#39;t =
pop up earlier. The following patch introduced zstd support:</div><div><a h=
ref=3D"http://git.openembedded.org/openembedded-core/commit/meta/classes/im=
age_types.bbclass?id=3D77e0f502020085875bbc74da66815c89f19a9351">http://git=
.openembedded.org/openembedded-core/commit/meta/classes/image_types.bbclass=
?id=3D77e0f502020085875bbc74da66815c89f19a9351</a></div><div>of course spec=
ifying a DEPENDS on zstd-native:</div><div><a href=3D"http://git.openembedd=
ed.org/openembedded-core/tree/meta/classes/image_types.bbclass?h=3Dyocto-3.=
1#n316">http://git.openembedded.org/openembedded-core/tree/meta/classes/ima=
ge_types.bbclass?h=3Dyocto-3.1#n316</a></div><div>but... zstd is NOT in oe-=
core, but in meta-oe!</div><div><a href=3D"http://layers.openembedded.org/l=
ayerindex/recipe/116635/">http://layers.openembedded.org/layerindex/recipe/=
116635/</a></div><div><br></div><div>I guess the solution for master is to =
move zstd to oe-core, right?</div><div><br></div><div>But what about dunfel=
l? It has the zstd support in image_types.bbclass patch, but we can&#39;t a=
dd zstd. Shall we revert the patch?<br></div><br></div>Regards,<br><div><di=
v dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr">Diego Rondini<br>S=
r. Embedded Engineer<br><br>Kynetics<br><a href=3D"http://www.kynetics.com"=
 target=3D"_blank">www.kynetics.com</a><br></div></div></div></div>

--00000000000027724c05a5a2bb90--
