Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
 by mx.groups.io with SMTP id smtpd.web12.4668.1610730287242256754
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 09:04:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@google.com header.s=20161025 header.b=OuG+R19y;
 spf=pass (domain: google.com, ip: 209.85.166.43, mailfrom: gmouse@google.com)
Received: by mail-io1-f43.google.com with SMTP id n4so19359412iow.12
        for <openembedded-core@lists.openembedded.org>; Fri, 15 Jan 2021 09:04:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jGzeMmgFWJPkiCwm2pFk5DdePPeHqLE77wlGOikz+nU=;
        b=OuG+R19yDF5bVoyQAInwrE0gcICs1y3QO1WhWEoftyTWb1vV+B2pY08ZZqmg+C19UR
         xyK/8Lce7ATEyZc9N3eH1sDaSgME9CtLHUJQ6u84CIEsWZGB6yJZaf0ixXxfIW8us+lu
         PnGS4mCVDo69S13v8BRFixN/3PLVOK3sRP66s4MVzmUeVruKNQXAp6UQDG0r1TwuiHCx
         On7PS2AW8mI9pM7YSijEzmPayazD0ctx1fGTAno4b/HeDGdQOPBYi5aPDwttzCvO1w0E
         SLFmCKc/r6F2/vC43G+5spsCF1uc5AhOdGNiQbPAQn4M4amdbCmaqY+TF3D0jgdcQv3h
         8b1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jGzeMmgFWJPkiCwm2pFk5DdePPeHqLE77wlGOikz+nU=;
        b=F2os9zxlbu3mZGboKVDuHHIFTsu5/n/84YjPsue29G9I1q89DgI5qXfWnmEiBKEqlS
         UnCpCn0m4u/+OXfKzyi7/iPXE1J2Fpdh1V1CCvRtHe1i9dJtcRGPZY45GGa4olq9oXhF
         nyGr7q0gmwqgIlvE4ZJpvDs73IqN/8BVFOV257VkyhpY8wFcAVHefct+njqPQVORQK94
         lb+d+WZLMepaZDf3mip3NdWfQSMBRwGrVoL8pubB5v+FDuP9LgMbZlHsC1W8sOv+stBu
         K2SdT5YGjLML5xStfssyF2gWArSJLAq30U2unOYcE6o45OZtUkfmfsxxQnNETYllr5P4
         8tNw==
X-Gm-Message-State: AOAM533gaQD4WxI+QWOn2DfFb7MfxTR7P9+3pBnSWq2w1mor3nYoYe2V
	I50MGpM24avED9AD/MRkXbJ52idN4wKpcOiprtxZng==
X-Google-Smtp-Source: ABdhPJwYJHic9yGzPuUlsCyph1R0yOD6hXA14NkBCbEcMkFcbFL2EDZdw0hXMzproGiZIN3dZpRMbBtmY+KtQwohRhU=
X-Received: by 2002:a92:b01:: with SMTP id b1mr7244538ilf.160.1610730286148;
 Fri, 15 Jan 2021 09:04:46 -0800 (PST)
MIME-Version: 1.0
References: <20210107215121.3901938-1-gmouse@google.com> <CADVsX8-dMLvuccRjzU73=-reDjEBRq5PZZ+S6ZeugSvTy-iqog@mail.gmail.com>
 <CADVsX8924shMc+PFUQ6jsmnUqsF+VAeRfn0xM+4G406EgvGFCg@mail.gmail.com>
 <63d70805b829d08faf3e73865ed7f9c2ad9a1366.camel@linuxfoundation.org>
 <CADVsX89HCqKYNOyDMK1czkfaOw_TdrwVLK=bi_RanOKgDd=ZuQ@mail.gmail.com>
 <bfb21f1ec874e5d9638885885eb2530104c28ac5.camel@linuxfoundation.org> <3810611592a344cbaeb1b907e150c2c5@XBOX03.axis.com>
In-Reply-To: <3810611592a344cbaeb1b907e150c2c5@XBOX03.axis.com>
From: "Anton Kachalov" <rnouse@google.com>
Date: Fri, 15 Jan 2021 18:04:35 +0100
Message-ID: <CADVsX8_otuGr+Ct3pAWHmSAPwEGgXMxpA8=qUdQ1N3-Z1S+nsg@mail.gmail.com>
Subject: Re: [OE-core] [poky][PATCH] bitbake: remove /usr from pseudo ignore paths
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000894e6e05b8f35e34"

--000000000000894e6e05b8f35e34
Content-Type: text/plain; charset="UTF-8"

Hello,

nope, setting the entire PSEUDO_IGNORE_PATHS without "/usr" doesn't work.
The do_install task fails with error code 134 without any log file. Neither
temp/run.do_install file exists. The pseudo.log doesn't have any errors.

On Mon, 11 Jan 2021 at 19:22, Peter Kjellerstedt <
peter.kjellerstedt@axis.com> wrote:

> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-
> > core@lists.openembedded.org> On Behalf Of Richard Purdie
> > Sent: den 8 januari 2021 09:27
> > To: Anton Kachalov <rnouse@google.com>
> > Cc: openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core] [poky][PATCH] bitbake: remove /usr from pseudo
> > ignore paths
> >
> > On Fri, 2021-01-08 at 01:56 +0100, Anton Kachalov wrote:
> > > Hello, Richard.
> > > Yes, for various reasons we can not move out from /usr/local.
>
> Using a build directory anywhere under /usr sounds like a very unusual
> setup and I do not think it is a situation that warrants special
> treatment in the common configuration. Workarounds are better done in
> the local environment.
>
> > > Before the change it works smoothly and we didn't notice about any
> > > kind of performance issues.
> > > May be we can explicitly add various standard subdirs under /usr
> > > excluding /usr/local?
>
> I believe it would be hard to maintain a suitable list of subdirectories
> of /usr (including /usr/local) that pseudo should ignore. However,
> do we actually know if pseudo is normally accessing paths under /usr,
> or was it just added as a "pseudo should never care about anything here
> so we may as well add it"?
>
> > Can you add local config like:
> >
> > PSEUDO_IGONRE_PATHS_remove = "/usr/,"
> >
> > which should allow things to work for you?
>
> Correct me if I am wrong, but AFAIK you cannot use the _remove operator
> to remove a part of a string. It only works on space separated words.
> You will have to redefine the entire PSEUDO_IGONRE_PATHS to remove any
> parts of it.
>
> This is a drawback of using a list in a bitbake variable that is separated
> using something other than spaces. I guess commas were chosen as separator
> for this variable since spaces are more common (if still rare) in paths
> than commas, but it causes problems like this.
>
> >
> > Cheers,
> >
> > Richard
>
> //Peter
>
>

--000000000000894e6e05b8f35e34
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<div><br></div><div>nope, setting the entire PSEUDO_=
IGNORE_PATHS without &quot;/usr&quot; doesn&#39;t work. The do_install task=
 fails with error code 134 without any log file. Neither temp/run.do_instal=
l file exists. The pseudo.log doesn&#39;t have any errors.</div></div><br><=
div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 11 =
Jan 2021 at 19:22, Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kjellerst=
edt@axis.com">peter.kjellerstedt@axis.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">&gt; -----Original Message-----<br=
>
&gt; From: <a href=3D"mailto:openembedded-core@lists.openembedded.org" targ=
et=3D"_blank">openembedded-core@lists.openembedded.org</a> &lt;openembedded=
-<br>
&gt; <a href=3D"mailto:core@lists.openembedded.org" target=3D"_blank">core@=
lists.openembedded.org</a>&gt; On Behalf Of Richard Purdie<br>
&gt; Sent: den 8 januari 2021 09:27<br>
&gt; To: Anton Kachalov &lt;<a href=3D"mailto:rnouse@google.com" target=3D"=
_blank">rnouse@google.com</a>&gt;<br>
&gt; Cc: <a href=3D"mailto:openembedded-core@lists.openembedded.org" target=
=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
&gt; Subject: Re: [OE-core] [poky][PATCH] bitbake: remove /usr from pseudo<=
br>
&gt; ignore paths<br>
&gt; <br>
&gt; On Fri, 2021-01-08 at 01:56 +0100, Anton Kachalov wrote:<br>
&gt; &gt; Hello, Richard.<br>
&gt; &gt; Yes, for various reasons we can not move out from /usr/local.<br>
<br>
Using a build directory anywhere under /usr sounds like a very unusual <br>
setup and I do not think it is a situation that warrants special <br>
treatment in the common configuration. Workarounds are better done in <br>
the local environment.<br>
<br>
&gt; &gt; Before the change it works smoothly and we didn&#39;t notice abou=
t any<br>
&gt; &gt; kind of performance issues.<br>
&gt; &gt; May be we can explicitly add various standard subdirs under /usr<=
br>
&gt; &gt; excluding /usr/local?<br>
<br>
I believe it would be hard to maintain a suitable list of subdirectories <b=
r>
of /usr (including /usr/local) that pseudo should ignore. However, <br>
do we actually know if pseudo is normally accessing paths under /usr, <br>
or was it just added as a &quot;pseudo should never care about anything her=
e <br>
so we may as well add it&quot;?<br>
<br>
&gt; Can you add local config like:<br>
&gt; <br>
&gt; PSEUDO_IGONRE_PATHS_remove =3D &quot;/usr/,&quot;<br>
&gt; <br>
&gt; which should allow things to work for you?<br>
<br>
Correct me if I am wrong, but AFAIK you cannot use the _remove operator <br=
>
to remove a part of a string. It only works on space separated words. <br>
You will have to redefine the entire PSEUDO_IGONRE_PATHS to remove any <br>
parts of it.<br>
<br>
This is a drawback of using a list in a bitbake variable that is separated =
<br>
using something other than spaces. I guess commas were chosen as separator =
<br>
for this variable since spaces are more common (if still rare) in paths <br=
>
than commas, but it causes problems like this.<br>
<br>
&gt; <br>
&gt; Cheers,<br>
&gt; <br>
&gt; Richard<br>
<br>
//Peter<br>
<br>
</blockquote></div>

--000000000000894e6e05b8f35e34--
