Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E19F1C43219
	for <webhook@archiver.kernel.org>; Tue, 21 Dec 2021 15:12:23 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web08.6800.1640099542337271591
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Dec 2021 07:12:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FiAXXeJn;
 spf=pass (domain: gmail.com, ip: 209.85.208.170,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id r22so2178719ljk.11
        for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Dec 2021 07:12:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FShDpiRNgySNar6b5ZjYD+WGwH3UXbEC8ZhhV8BNqyE=;
        b=FiAXXeJnsLfC72r8Q1RWosU12TABXd9ZI8Dch6XczM9Hm0d+40ff0zCuzGuIDaFPWU
         4LHIJUo1OMOAw89GWta4hyGWHEthgaXnNWQgs4Wg+sQA1t/JoZwuK4w5jdz7nLzeh+fp
         miE7HjLRYwVnjivgYX/WrJYPSnFfuCAoVJw9JnpbD09PQP/dhzw43PWFb5OX9ZEY/2P/
         hZvC+0acFX6ojxzj1I/GIny23XZAc0/Iu6OVv1Mun/wS9Wgy07curqnaV9F7LoXLtgbO
         Dklr43rTbdV/oNNavnUKHCnlEgoLDxZwzS2wXvRgUWzBwORybmBjs4sXC+dzWey+sa5a
         wIcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FShDpiRNgySNar6b5ZjYD+WGwH3UXbEC8ZhhV8BNqyE=;
        b=wsU7+sqYSxTMK+TLgyyp700lU1FBKhX0eV4fmeDupDczKQ3PmRoM102wnMkr9EsjY1
         zPOV+fKMuZWRTs7h1P9DYxK0hs1uFk7jmCCeHbOvcecuo7G0cWWjEosHzuI9rSGBaKOu
         IAl9Vn92GtD6QR5lGrY2GR++r8+zRVw6BIkx0JsF/OalvnbJQS8SKZI4BzDrHMXIP1Nt
         MCxy7lkKacmh9wnNmUYwPyi2NUzAo+8uHIMRRfeVhFbxzXqp+BmdyUaQCR+vXuN6YBZc
         rf4/BHjX+ldFH3Sz8jWBix2he4i/OkWBeTvEy+x+PPaGWWY1cYZumiiOziJNxyZzkWzX
         7IOg==
X-Gm-Message-State: AOAM531Pwp3BmScD74ee0S465+wWYN05hoSeCk+5RlUUsD+PB8NjUZum
	dcfEFL4Q+HMirgQE92nB/DvsZpDRRwlyDzS9MDU=
X-Google-Smtp-Source: 
 ABdhPJwSFFUAFvwypjWJmuGFjCiLw7M+DL6WJKwYtV14a5A8zuilx/Ls4ANX/L3RV+Gu3phbvsJecwNVXZyZ23sKibg=
X-Received: by 2002:a2e:b169:: with SMTP id a9mr2875314ljm.369.1640099540385;
 Tue, 21 Dec 2021 07:12:20 -0800 (PST)
MIME-Version: 1.0
References: 
 <99e75b930d85e240c51074406b0cd896c93257cb.camel@linuxfoundation.org>
 <DM5PR1101MB23482FA91A07CA4057E768D9BB7C9@DM5PR1101MB2348.namprd11.prod.outlook.com>
 <CANPvuRkqyngQAqhqfou9ka7J3oufuSCubf9J7cgZ-ZU9KLTJjg@mail.gmail.com>
 <97b16a070ca838dfe87ae579edf36c0e01d01175.camel@linuxfoundation.org>
In-Reply-To: 
 <97b16a070ca838dfe87ae579edf36c0e01d01175.camel@linuxfoundation.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Tue, 21 Dec 2021 15:12:09 +0000
Message-ID: 
 <CANPvuRkxfQ60H_OUwru_a+Xhkx6WCJu2f-EgGkONLB8GSvL2vw@mail.gmail.com>
Subject: Re: [OE-core] [yocto] [qa-build-notification] QA notification for
 completed autobuilder build (yocto-3.1.13.rc1)
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: "Teoh, Jay Shen" <jay.shen.teoh@intel.com>,
	"qa-build-notification@lists.yoctoproject.org"
 <qa-build-notification@lists.yoctoproject.org>,
	"<yocto@lists.yoctoproject.org>" <yocto@lists.yoctoproject.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000008043f305d3a96e74"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Dec 2021 15:12:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159923

--0000000000008043f305d3a96e74
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia ter=C3=
=A7a,
21/12/2021 =C3=A0(s) 14:19:

> On Tue, 2021-12-21 at 11:15 +0000, Jose Quaresma wrote:
> >
> >
> > Teoh, Jay Shen <jay.shen.teoh@intel.com> escreveu no dia ter=C3=A7a,
> 21/12/2021
> > =C3=A0(s) 07:46:
> > > Hi all,
> > >
> > > This is the full report for yocto-3.1.13.rc1:
> > >
> https://git.yoctoproject.org/cgit/cgit.cgi/yocto-testresults-contrib/tree=
/?h=3Dintel-yocto-testresults
> > >
> > > =3D=3D=3D=3D=3D=3D=3D Summary =3D=3D=3D=3D=3D=3D=3D=3D
> > > No high milestone defects.
> > >
> > > new issue found
> > >
> > > Bug 14669 - [QA 3.1.13 RC1] failure in ptest :gstreamer1.0.gstreamer-
> > > 1.0/pipelines_seek.test
> > >
> > >
> > > =3D=3D=3D=3D=3D=3D=3D Bugs =3D=3D=3D=3D=3D=3D=3D=3D
> > > https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14669
> > >
> >
> >
> > This patch is a bug fix 14669
> > https://lists.openembedded.org/g/openembedded-core/message/159911
> >
>
> Great, thanks!
>
> I assume we don't need that in the version on master as it is already
> present?
>


https://git.yoctoproject.org/poky/commit/?id=3D7b90027aac9fa41b3dc98765151d=
761df8dabb97
The first version of the patch on the master branch is this one and it
fixes the [YOCTO #14194].
I cherry-picked that with some adaptation for dunfell but the content is
the same.

We need the patch on master as well and we will drop it with the gstreamer
1.20 update.

Jose


>
> Cheers,
>
> Richard
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000008043f305d3a96e74
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Richard Purdie &lt;<a href=3D"mailto:=
richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&=
gt; escreveu no dia ter=C3=A7a, 21/12/2021 =C3=A0(s) 14:19:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">On Tue, 2021-12-21 at 11:15 +00=
00, Jose Quaresma wrote:<br>
&gt; <br>
&gt; <br>
&gt; Teoh, Jay Shen &lt;<a href=3D"mailto:jay.shen.teoh@intel.com" target=
=3D"_blank">jay.shen.teoh@intel.com</a>&gt; escreveu no dia ter=C3=A7a, 21/=
12/2021<br>
&gt; =C3=A0(s) 07:46:<br>
&gt; &gt; Hi all,<br>
&gt; &gt; <br>
&gt; &gt; This is the full report for yocto-3.1.13.rc1:=C2=A0 <br>
&gt; &gt; <a href=3D"https://git.yoctoproject.org/cgit/cgit.cgi/yocto-testr=
esults-contrib/tree/?h=3Dintel-yocto-testresults" rel=3D"noreferrer" target=
=3D"_blank">https://git.yoctoproject.org/cgit/cgit.cgi/yocto-testresults-co=
ntrib/tree/?h=3Dintel-yocto-testresults</a><br>
&gt; &gt; <br>
&gt; &gt; =3D=3D=3D=3D=3D=3D=3D Summary =3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; &gt; No high milestone defects. <br>
&gt; &gt; <br>
&gt; &gt; new issue found <br>
&gt; &gt; <br>
&gt; &gt; Bug 14669 - [QA 3.1.13 RC1] failure in ptest :gstreamer1.0.gstrea=
mer-<br>
&gt; &gt; 1.0/pipelines_seek.test<br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; =3D=3D=3D=3D=3D=3D=3D Bugs =3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; &gt; <a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14=
669" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.org=
/show_bug.cgi?id=3D14669</a><br>
&gt; &gt; <br>
&gt; <br>
&gt; <br>
&gt; This patch is a bug fix 14669<br>
&gt; <a href=3D"https://lists.openembedded.org/g/openembedded-core/message/=
159911" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-core/message/159911</a><br>
&gt; =C2=A0<br>
<br>
Great, thanks!<br>
<br>
I assume we don&#39;t need that in the version on master as it is already p=
resent?<br></blockquote><div><br></div><div><br></div><div><a href=3D"https=
://git.yoctoproject.org/poky/commit/?id=3D7b90027aac9fa41b3dc98765151d761df=
8dabb97">https://git.yoctoproject.org/poky/commit/?id=3D7b90027aac9fa41b3dc=
98765151d761df8dabb97</a><br></div><div>The first version of the patch on t=
he master branch is this one and it fixes the=C2=A0[YOCTO #14194].</div><di=
v>I cherry-picked=C2=A0that with some adaptation=C2=A0for dunfell but the c=
ontent=C2=A0is the same.<br></div><div><br></div><div>We need the patch on =
master as well and we will drop it with the gstreamer 1.20 update.</div><di=
v><br></div><div>Jose</div><div>=C2=A0</div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div>

--0000000000008043f305d3a96e74--

