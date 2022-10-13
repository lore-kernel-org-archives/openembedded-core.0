Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6369AC4332F
	for <webhook@archiver.kernel.org>; Thu, 13 Oct 2022 08:10:51 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web12.5084.1665648643292543665
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Oct 2022 01:10:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DoMq0/eL;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: rybczynska@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id a29so1338964lfo.1
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Oct 2022 01:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6z5GHZf7JtErlB6aWFsztlt8QsSO8al9/YOSGARpmEM=;
        b=DoMq0/eL5RFlQG5YIJwZ0h7SbXi5PjncO10u9OsKSNp6fUK44o6eI5YfV7YFbG81Td
         s35iDTWZi68jL9F1rnB/7Eb8NDlg8Eb4KvVbPO57yIybl+KnKhDYzneza3pHhFyM8k8u
         ikt1IPV/w3YBj7UXmc+LUikJh329a10wAek5/Ru7vX2h0R6yS2kBes6KO8K3ZgLmx1Qg
         z0FVWlijLPqqEn18fr4nD+TBkVMLUlyyfYnFFuEho5xOtfpdXQEQf7dqD9F00YsHV4Y4
         AKSyLG0JB6wSSC43JmlP/EF44r0f5Q17AFqRUsYagGapt7hrB4VJf3Rk7ryaWy83A3cp
         hRFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6z5GHZf7JtErlB6aWFsztlt8QsSO8al9/YOSGARpmEM=;
        b=iGtcOCs2Dfbhf3IhbuIpwmtQYodRv0HRuYkHI1VrPyUiQFTwtDCePGwiNfaQAzOfJK
         GMGWVYsvSRPGpjXfIMyqLoC6Hv5kaRqjQzp0R23p208vyiClM3Ycq7Pep5IFvTE4znpJ
         TTscyKS2eJAK7QPqZnGGWHaAOVUTLazEs/5qNo7So7cYyfyCM3e+HQngDFvdhi57rBl5
         S1sd3vrMLSUlGL6AVdYtO6rUZRz5xnv3pF3YYQLeBTSwtUOUDCisthRK7oJ8v4lCu8rV
         4JK+8AwcZTEazKJUFXpua9QYNz7Jh0Nlisj3qC2Tlj4rx5FzxqGkhy6qzxYs+03inUrS
         GNjw==
X-Gm-Message-State: ACrzQf1b2IPvIFKxO3Z/yDSkLF2x0pF1WqPD0Rp/i0viZdQzl6jEHvCR
	0XNSiAPKV1Lomhvzx/E2umnzyqMcko5Cdl3tA+8=
X-Google-Smtp-Source: AMsMyM5Kwqi1vRMQN1YDiQsbzutp+Vu4mdNvuZCHgqmPBqqFRRIP+qogGwbp/xuKpEEcTdVMzf7giWjbPgCQgIgH6ls=
X-Received: by 2002:ac2:4bcf:0:b0:4a2:c241:1979 with SMTP id
 o15-20020ac24bcf000000b004a2c2411979mr9848328lfq.89.1665648641017; Thu, 13
 Oct 2022 01:10:41 -0700 (PDT)
MIME-Version: 1.0
References: <CAApg2=TmNEnu+KQTz9iJ72LaduRoHQh_YwevzJgpROj5C8qJew@mail.gmail.com>
 <Y0fFumcfL7RGRxvL@mail.local>
In-Reply-To: <Y0fFumcfL7RGRxvL@mail.local>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Thu, 13 Oct 2022 17:10:28 +0900
Message-ID: <CAApg2=S0J4iqqPNVuYd6Dw8D6x5wM_0e6f6iq2bCeL0x+fH=7A@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone] core-image-weston doesn't build
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000918ec205eae60b24"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Oct 2022 08:10:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171687

--000000000000918ec205eae60b24
Content-Type: text/plain; charset="UTF-8"

On Thu, 13 Oct 2022, 17:00 Alexandre Belloni, <alexandre.belloni@bootlin.com>
wrote:

> On 13/10/2022 09:52:44+0200, Marta Rybczynska wrote:
> > Hello all,
> > I'm trying to build the core-image-weston in kirkstone to look into
> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=14926
> >
> > It turns out that the image does not build (oe-core
> > e728d0965d6fda8ac54e065ca7bf7eb9da9a8170 with bitbake
> > 6603c3e39f1cf746669ec6c9f0be8c6e6ece426e). I'm getting:
> >
> > $ bitbake core-image-weston
> > Loading cache: 100%
> >
> |###################################################################################################################################|
> > Time: 0:00:00
> > Loaded 1640 entries from dependency cache.
> > NOTE: Resolving any missing task queue dependencies
> > ERROR: Nothing RPROVIDES 'weston-xwayland' (but
> > /oe-standalone/oe-core/meta/recipes-graphics/images/core-image-weston.bb
> > RDEPENDS on
> > or otherwise requires it)
> > NOTE: Runtime target 'weston-xwayland' is unbuildable, removing...
> > Missing or unbuildable dependency chain was: ['weston-xwayland']
> > ERROR: Required build target 'core-image-weston' has no buildable
> providers.
> > Missing or unbuildable dependency chain was: ['core-image-weston',
> > 'weston-xwayland']
> >
> > Summary: There were 2 ERROR messages, returning a non-zero exit code.
> >
> > I can't find this one in bugzilla. Is it a known issue?
> >
>
> Did you remove x11 from your DISTRO_FEATURES?
>

No. This is a fresh clone. The only changes I have are in local.conf:
DL_DIR and parallel build options. That's why I'm surprised.

Regards
Marta

>

--000000000000918ec205eae60b24
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu, 13 Oct 2022, 17:00 Alexandre Belloni, &lt;<a h=
ref=3D"mailto:alexandre.belloni@bootlin.com">alexandre.belloni@bootlin.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On 13/10/2022 09:52:=
44+0200, Marta Rybczynska wrote:<br>
&gt; Hello all,<br>
&gt; I&#39;m trying to build the core-image-weston in kirkstone to look int=
o<br>
&gt; <a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14926" =
rel=3D"noreferrer noreferrer" target=3D"_blank">https://bugzilla.yoctoproje=
ct.org/show_bug.cgi?id=3D14926</a><br>
&gt; <br>
&gt; It turns out that the image does not build (oe-core<br>
&gt; e728d0965d6fda8ac54e065ca7bf7eb9da9a8170 with bitbake<br>
&gt; 6603c3e39f1cf746669ec6c9f0be8c6e6ece426e). I&#39;m getting:<br>
&gt; <br>
&gt; $ bitbake core-image-weston<br>
&gt; Loading cache: 100%<br>
&gt; |#####################################################################=
##############################################################|<br>
&gt; Time: 0:00:00<br>
&gt; Loaded 1640 entries from dependency cache.<br>
&gt; NOTE: Resolving any missing task queue dependencies<br>
&gt; ERROR: Nothing RPROVIDES &#39;weston-xwayland&#39; (but<br>
&gt; /oe-standalone/oe-core/meta/recipes-graphics/images/<a href=3D"http://=
core-image-weston.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">core-=
image-weston.bb</a><br>
&gt; RDEPENDS on<br>
&gt; or otherwise requires it)<br>
&gt; NOTE: Runtime target &#39;weston-xwayland&#39; is unbuildable, removin=
g...<br>
&gt; Missing or unbuildable dependency chain was: [&#39;weston-xwayland&#39=
;]<br>
&gt; ERROR: Required build target &#39;core-image-weston&#39; has no builda=
ble providers.<br>
&gt; Missing or unbuildable dependency chain was: [&#39;core-image-weston&#=
39;,<br>
&gt; &#39;weston-xwayland&#39;]<br>
&gt; <br>
&gt; Summary: There were 2 ERROR messages, returning a non-zero exit code.<=
br>
&gt; <br>
&gt; I can&#39;t find this one in bugzilla. Is it a known issue?<br>
&gt; <br>
<br>
Did you remove x11 from your DISTRO_FEATURES?<br></blockquote></div></div><=
div dir=3D"auto"><br></div><div dir=3D"auto">No. This is a fresh clone. The=
 only changes I have are in local.conf: DL_DIR and parallel build options. =
That&#39;s why I&#39;m surprised.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Regards</div><div dir=3D"auto">Marta</div><div dir=3D"auto"><div =
class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--000000000000918ec205eae60b24--

