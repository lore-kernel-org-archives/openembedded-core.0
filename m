Return-Path: <kergoth@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBA0AC433FE
	for <webhook@archiver.kernel.org>; Fri, 22 Apr 2022 19:12:53 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web11.101.1650646790021170324
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Apr 2022 09:59:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IlKAyReT;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: kergoth@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id e30so7624804eda.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Apr 2022 09:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=b+KAWfcI/7ix7lAJjXyYc/2e0jOyAxbJJm15uP6So30=;
        b=IlKAyReT+FV9O/GwYIwHlSLi/fCvpmxQqw80fONv7PEiKm/r1X8f8m+F2yBmforSJZ
         Cz7vTN5KgprxZwCaOuUMOzgN5dN/w2sRKhD1Vm4SJg13rssou95VBYz1o7jU6vOXNS8z
         nWSIOV8T+IuoU75wIBHKrMIR42SkmoRMWg0bTn+9RgZHfPyA6obRkej+VEFV05EH10XJ
         hDvR32+1fp4P5ScdVDhz0eWzQvrTiKL3aAyS+4MobV7dHQNESTp4/vacJUNB4rTxOlfO
         /bp7+tXwlt5OAH21Mfz1Se2nGHlxyVLSs7Wp7pPizhe0wN2FMVXqDgie/hmWuYV1lwgI
         OP2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b+KAWfcI/7ix7lAJjXyYc/2e0jOyAxbJJm15uP6So30=;
        b=PrfiENjH9cjK7R8CSpYIgIpxE02KNAhEX2zlvovsFP7NF2zoDYMstWkkJ8/0GPlr/4
         nhSB6HqzKImYfRgDj0ulQn3HpNiLVXdCagOF8DniVM/G/xZdV+hmd+VWtRJsi65Zob5K
         Ha3wQyH376rtiMN3du0lQq4wZGoyoGKdR10ZxPDd0vmSyyiUsVqIAroirsSjU9F/AmAO
         8dBYJrFbuTURRhGcXR27iksxnvWoIRBCopWtnTeouOLKH338rE5bbkVFq2Xqb/sCrtpd
         em+Wd/S4gF27FbgpJP78Q8pHR6wkmaAs9ybELcwBUSfVa3kfyYv8ALzerXddtO60l1Nt
         Kutg==
X-Gm-Message-State: AOAM532hExPiCZztXu/r0tHHlj1kqXpYLduSKrouTSBZCc7awQ7s6/Jb
	9D8IbxXIzmKm6+5BUqoIeEjdQF1KJ7lxfdPEYRA=
X-Google-Smtp-Source: 
 ABdhPJzyXxnQMOZGeBY4qqqW9ePjmDhGDMiFSH/ugilicX+lt7t+0ulv4BFs37zk52P6aPKhjLJ7+p61akWRWRViYXI=
X-Received: by 2002:a05:6402:909:b0:415:cdbf:4748 with SMTP id
 g9-20020a056402090900b00415cdbf4748mr5835592edz.395.1650646788180; Fri, 22
 Apr 2022 09:59:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220413160033.8456-1-kergoth@gmail.com>
 <8c3060148a98b280c93b7eb5da65699f1c6745aa.camel@linuxfoundation.org>
 <68938ba5b4034939b472e0c9977bf507@axis.com>
In-Reply-To: <68938ba5b4034939b472e0c9977bf507@axis.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Fri, 22 Apr 2022 09:59:37 -0700
Message-ID: 
 <CABcZANnF_6OnnbVnaHzYt06UbJiEyikewgOy1kprjgaPRaotOg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] license: add 'any_incompatible' function
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000758f2705dd4127fa"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Apr 2022 19:12:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164797

--000000000000758f2705dd4127fa
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 13, 2022 at 1:35 PM Peter Kjellerstedt <
peter.kjellerstedt@axis.com> wrote:

> > > +            ${@"dbench" if not any_incompatible(d, "dbench",
> "GPL-3.0-only") else ""} \
>
> This usage seems error prone at best. What if the license for dbench
> is changed?
>
> Also, the way I would prefer to do something like the above (assuming you
> meant to include it as a dependency in RDEPENDS:${PN} rather than
> PACKAGES)
> would be to instead unconditionally add it to RRECOMMENDS:${PN}. Then
> the normal licensing support should skip the package if you have the
> incompatible license globally configured, but since it is only a
> recommendation, that should not be a problem.


The issue is, a missing RRECOMMENDS will currently abort the build. Bitbake
doesn't treat RRECOMMENDS as optional to build, only optional to install,
so this approach is not viable. I'm still submitting v3 of this to get the
job done for now. Thanks for your thoughts, though, I actually agree that
your idea is a better method, it just doesn't work with bitbake as it
stands today!
-- 
Christopher Larson
chris_larson@mentor.com, chris.larson@siemens.com, kergoth@gmail.com
Principal Software Engineer, Embedded Linux Solutions, Siemens Digital
Industries Software

--000000000000758f2705dd4127fa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 13, 2022 at 1:35 PM Peter=
 Kjellerstedt &lt;<a href=3D"mailto:peter.kjellerstedt@axis.com">peter.kjel=
lerstedt@axis.com</a>&gt; wrote:</div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@&quot;dbench&quot; =
if not any_incompatible(d, &quot;dbench&quot;, &quot;GPL-3.0-only&quot;) el=
se &quot;&quot;} \<br>
<br>
This usage seems error prone at best. What if the license for dbench <br>
is changed?<br>
<br>
Also, the way I would prefer to do something like the above (assuming you <=
br>
meant to include it as a dependency in RDEPENDS:${PN} rather than PACKAGES)=
 <br>
would be to instead unconditionally add it to RRECOMMENDS:${PN}. Then <br>
the normal licensing support should skip the package if you have the <br>
incompatible license globally configured, but since it is only a <br>
recommendation, that should not be a problem.</blockquote><div><br></div><d=
iv>The issue is, a missing RRECOMMENDS will currently abort the build. Bitb=
ake doesn&#39;t treat RRECOMMENDS as optional to build, only optional to in=
stall, so this approach is not viable. I&#39;m still submitting v3 of this =
to get the job done for now. Thanks for your thoughts, though, I actually a=
gree that your idea is a better method, it just doesn&#39;t work with bitba=
ke as it stands today!</div></div>-- <br><div dir=3D"ltr" class=3D"gmail_si=
gnature"><div dir=3D"ltr"><div dir=3D"ltr"><font color=3D"#333333">Christop=
her Larson<br><a>chris_larson@mentor.com</a>,=C2=A0<a>chris.larson@siemens.=
com</a>,=C2=A0<a>kergoth@gmail.com</a><br>Principal Software Engineer,=C2=
=A0Embedded Linux Solutions,=C2=A0Siemens Digital Industries Software</font=
><br></div></div></div></div>

--000000000000758f2705dd4127fa--

