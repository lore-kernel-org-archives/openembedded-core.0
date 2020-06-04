Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web12.21243.1591296278876481863
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jun 2020 11:44:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista-com.20150623.gappssmtp.com header.s=20150623 header.b=rbgz5Zb5;
 spf=permerror, err=parse error for token &{10 18 websitewelcome.com}: parse error for token &{10 18 _spf.google.com}: limit exceeded (domain: mvista.com, ip: 209.85.128.67, mailfrom: rahulk@mvista.com)
Received: by mail-wm1-f67.google.com with SMTP id f5so6733913wmh.2
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jun 2020 11:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Lxsy952GZpKKh8UfpF8E0a4GFS2lWm1Wr1gralN/Pcg=;
        b=rbgz5Zb5z0y3VI8cjuRdxOVVmo2RKKHnXwfnzo/A6TlE4oiS8M3YjK33u+PuzhdwPF
         hiC89rcCEtD2Uk7dJzX4aOGLGmuLybrRi7/upAadVPASC/Ly2MFr0vHT2Y53sAMlp9tR
         SbZgpSgMXZyg/6e3aCxnKNGYrxl3f31SWrS8aIPuPrY4sISzraU06HKMxRrB7KLs4qCp
         mccuzn0rqJpgvF2DNal/fNmZJ4zUrMD2bCvEIPQLvytqd6b0r1h6+EeuKpr1YOfrft2E
         SbLpx82Gd3nWLLDi/AN0LiOHrpmLBdOY59/nvgDieu+cZrHm1afRZbCl1EC1Zq5//Ptw
         FwJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Lxsy952GZpKKh8UfpF8E0a4GFS2lWm1Wr1gralN/Pcg=;
        b=g+a72rJDZ9fXIjfUuSeeib4awjJUd3QImNQPYdveEk6jU5S5BIoB7glRLLoaMd7kkF
         D2SzeIxCYUjVcJa6dwsR+QhBvqe8Kw1aZrP68fF4z2x5/t/TEsEfJlmKGWouugFBXJeq
         7OZWhgzAULwSAvOohZMbC/C+Jam4OwdvEKAj5F15B6MTGU5WGGaeUKZv/CYWzmUp7D6D
         pFkMfDGVoSy2cBPMYP9GKJ1lfRVW9BnoSCCeF2+ygKHh23fMMHenSwu/BXdL+V+ZmTWG
         RnTRT5jEHOwhiyUJ2ZG4DI7wdORGICyFDCg1w+A+BdCCtN08qpeacZQ66MNW3OBJ46JZ
         5lmg==
X-Gm-Message-State: AOAM530lTI1KujVbUri5yam1wlv8Wy5UUxdt0cDXtQXamRdp/b7sIGwL
	6djpsaqptl9Yl7DE58ll3dV1eBAao3ibaNA5ctgYVQ==
X-Google-Smtp-Source: ABdhPJzSY6Wy6Mmf+bR8+ckd4Nlx/mljbWKPQPKFlfyd0vZpXT01ElsuSY6iFiePQkcBHtgkZNDxN+fknn+PGRl3+AM=
X-Received: by 2002:a1c:7517:: with SMTP id o23mr5064833wmc.7.1591296277251;
 Thu, 04 Jun 2020 11:44:37 -0700 (PDT)
MIME-Version: 1.0
References: <1591292828-25442-1-git-send-email-rahulk@mvista.com> <20200604180937.GC17660@denix.org>
In-Reply-To: <20200604180937.GC17660@denix.org>
From: "Rahul Kumar" <rahulk@mvista.com>
Date: Fri, 5 Jun 2020 00:14:26 +0530
Message-ID: <CANv91vM=_q_dh7u9eexkDVHudvxPOxrrRrEZgnc2dELv0vsnBA@mail.gmail.com>
Subject: Re: [OE-core] [meta-oe,zeus][PATCH] tremor: update SRC_URI as project moved to gitlab
To: Denys Dmytriyenko <denis@denix.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Armin Kuster <akuster808@gmail.com>, Khem Raj <raj.khem@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000569f4a05a74689b4"

--000000000000569f4a05a74689b4
Content-Type: text/plain; charset="UTF-8"

Hi Denys,

I apologize, By Mistake it happened.
Now i have sent it to the correct mailing list .

*Thanks & Regards,*
Rahul Kumar
Software Engineer,Linux Solutions Engineering
Group,Montavista Software LLC
Email Id: rahulk@mvista.com
<https://plus.google.com/+CodeTwoSoftware>


On Thu, Jun 4, 2020 at 11:39 PM Denys Dmytriyenko <denis@denix.org> wrote:

> Why openembedded-core mailing list?
>
> On Thu, Jun 04, 2020 at 11:17:08PM +0530, Rahul Kumar wrote:
> > From: Armin Kuster <akuster808@gmail.com>
> >
> > It appears Xiph.Org is now on gitlab
> > https://gitlab.xiph.org/xiph
> >
> > Signed-off-by: Armin Kuster <akuster808@gmail.com>
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > (cherry picked from commit cc6e59fdff71e47ef5b9b40aab3bcd9438960ea4)
> > Signed-off-by: Rahul Kumar <rahulk@mvista.com>
> > ---
> >  meta-multimedia/recipes-multimedia/tremor/tremor_20180319.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta-multimedia/recipes-multimedia/tremor/
> tremor_20180319.bb b/meta-multimedia/recipes-multimedia/tremor/
> tremor_20180319.bb
> > index beeb23a..d2ad961 100644
> > --- a/meta-multimedia/recipes-multimedia/tremor/tremor_20180319.bb
> > +++ b/meta-multimedia/recipes-multimedia/tremor/tremor_20180319.bb
> > @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =
> "file://COPYING;md5=db1b7a668b2a6f47b2af88fb008ad555 \
> >
> file://os.h;beginline=3;endline=14;md5=5c0af5e1bedef3ce8178c89f48cd6f1f"
> >  DEPENDS = "libogg"
> >
> > -SRC_URI = "git://git.xiph.org/tremor.git;protocol=https \
> > +SRC_URI = "git://gitlab.xiph.org/xiph/tremor.git;protocol=https \
> >             file://obsolete_automake_macros.patch;striplevel=0 \
> >             file://tremor-arm-thumb2.patch \
> >  "
> > --
> > 2.7.4
> >
>
> > 
>
>

--000000000000569f4a05a74689b4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:verdana,=
sans-serif;color:#0b5394">Hi Denys,</div><div class=3D"gmail_default" style=
=
=3D"font-family:verdana,sans-serif;color:#0b5394"><br></div><div class=3D"=
gmail_default" style=3D"font-family:verdana,sans-serif;color:#0b5394">I apo=
logize, By Mistake it happened.<br>Now i have sent it to the correct mailin=
g list .<br clear=3D"all"></div><div><div dir=3D"ltr" class=3D"gmail_signat=
ure" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"l=
tr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div>=
<div dir=3D"ltr"><div><span style=3D"color:rgb(111,168,220)"><b><span style=
=
=3D"color:rgb(11,83,148)"><br></span></b></span></div><div><span style=3D"=
color:rgb(111,168,220)">	=09
  =09
  
   <b><span style=3D"color:rgb(11,83,148)">Thanks &amp; Regards,</span></b=
></span></div><div><span style=3D"color:rgb(111,168,220)"><span style=3D"co=
lor:rgb(11,83,148)"></span></span><span style=3D"color:rgb(111,168,220)"><s=
pan style=3D"color:rgb(11,83,148)"></span></span></div><div><span style=3D"=
color:rgb(111,168,220)"><span style=3D"color:rgb(11,83,148)">Rahul Kumar</s=
pan></span></div><div><span style=3D"color:rgb(11,83,148)">Software Enginee=
r,Linux Solutions Engineering</span></div><div><span style=3D"color:rgb(11,=
83,148)"> Group,Montavista Software LLC</span></div><div><span style=3D"col=
or:rgb(11,83,148)">Email Id: <span style=3D"font-size:10pt"><a href=3D"mail=
to:rahulk@mvista.com" target=3D"_blank">rahulk@mvista.com</a></span></span>=
<span><a href=3D"https://plus.google.com/+CodeTwoSoftware" rel=3D"noopener"=
 target=3D"_blank"><span style=3D"font-family:Verdana,sans-serif;font-size:=
10pt;color:rgb(42,42,42)"><br></span></a></span></div></div></div></div></d=
iv></div></div></div></div></div></div></div></div></div><br></div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jun 4,=
 2020 at 11:39 PM Denys Dmytriyenko &lt;<a href=3D"mailto:denis@denix.org">=
denis@denix.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">Why openembedded-core mailing list?<br>
<br>
On Thu, Jun 04, 2020 at 11:17:08PM +0530, Rahul Kumar wrote:<br>
&gt; From: Armin Kuster &lt;<a href=3D"mailto:akuster808@gmail.com" target=
=
=3D"_blank">akuster808@gmail.com</a>&gt;<br>
&gt; <br>
&gt; It appears Xiph.Org is now on gitlab<br>
&gt; <a href=3D"https://gitlab.xiph.org/xiph" rel=3D"noreferrer" target=3D=
"_blank">https://gitlab.xiph.org/xiph</a><br>
&gt; <br>
&gt; Signed-off-by: Armin Kuster &lt;<a href=3D"mailto:akuster808@gmail.co=
m" target=3D"_blank">akuster808@gmail.com</a>&gt;<br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; (cherry picked from commit cc6e59fdff71e47ef5b9b40aab3bcd9438960ea4)<=
br>
&gt; Signed-off-by: Rahul Kumar &lt;<a href=3D"mailto:rahulk@mvista.com" t=
arget=3D"_blank">rahulk@mvista.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta-multimedia/recipes-multimedia/tremor/<a href=3D"http://tre=
mor_20180319.bb" rel=3D"noreferrer" target=3D"_blank">tremor_20180319.bb</a=
> | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meta-multimedia/recipes-multimedia/tremor/<a href=3D"htt=
p://tremor_20180319.bb" rel=3D"noreferrer" target=3D"_blank">tremor_2018031=
9.bb</a> b/meta-multimedia/recipes-multimedia/tremor/<a href=3D"http://trem=
or_20180319.bb" rel=3D"noreferrer" target=3D"_blank">tremor_20180319.bb</a>=
<br>
&gt; index beeb23a..d2ad961 100644<br>
&gt; --- a/meta-multimedia/recipes-multimedia/tremor/<a href=3D"http://tre=
mor_20180319.bb" rel=3D"noreferrer" target=3D"_blank">tremor_20180319.bb</a=
><br>
&gt; +++ b/meta-multimedia/recipes-multimedia/tremor/<a href=3D"http://tre=
mor_20180319.bb" rel=3D"noreferrer" target=3D"_blank">tremor_20180319.bb</a=
><br>
&gt; @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Ddb1b7=
a668b2a6f47b2af88fb008ad555 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 file://os.h;beginline=3D3;endline=3D14;md5=3D5c0af5e1bedef3ce8178c8=
9f48cd6f1f&quot;<br>
&gt;=C2=A0 DEPENDS =3D &quot;libogg&quot;<br>
&gt;=C2=A0 <br>
&gt; -SRC_URI =3D &quot;git://<a href=3D"http://git.xiph.org/tremor.git;pr=
otocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">git.xiph.org/tremor.gi=
t;protocol=3Dhttps</a> \<br>
&gt; +SRC_URI =3D &quot;git://<a href=3D"http://gitlab.xiph.org/xiph/tremo=
r.git;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">gitlab.xiph.or=
g/xiph/tremor.git;protocol=3Dhttps</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://obsolete_automa=
ke_macros.patch;striplevel=3D0 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://tremor-arm-thum=
b2.patch \<br>
&gt;=C2=A0 &quot;<br>
&gt; -- <br>
&gt; 2.7.4<br>
&gt; <br>
<br>
&gt; <br>
<br>
</blockquote></div>

--000000000000569f4a05a74689b4--
