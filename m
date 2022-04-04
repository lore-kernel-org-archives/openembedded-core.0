Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FB6EC433FE
	for <webhook@archiver.kernel.org>; Mon,  4 Apr 2022 23:51:29 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web08.94.1649100052920643879
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Apr 2022 12:20:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=M3nhGxXO;
 spf=pass (domain: gmail.com, ip: 209.85.208.52,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id d7so417038edn.11
        for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Apr 2022 12:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ANA+tkO1UcjQUae+HHnMlBw8U7qHOJlIRkxRhzuuyIc=;
        b=M3nhGxXORNRQ9Bb88SfNLOjLjJdrHPZGMr5kFnlQBgPTKMPIwpXi421chY/bA4Xo6y
         xlztHS3QitZV+c/zERMQ+ovuqkLlqgBzU3OzOTqnhWsBS+7T7RmeSHvuNE/0VzmX+MD1
         DNDFQNGMoO/9tWaQ96HUAgh9a9mVoy78SqlVisw99AJv69LlTuvt9Dse/+TjxTVJN3tV
         S0ASshr8NssAOkf4KwWH8lYoyz4WcwyCWw1aKlpbzUaRzeyWslQsOPSAU13XnHWmOmIT
         9Olo05GQTMypRsDU+TNELZwCbG6oxc3pUt7dt7p+SmmJtqlBsoDKXw0NQJV5IefxNy0h
         /KaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ANA+tkO1UcjQUae+HHnMlBw8U7qHOJlIRkxRhzuuyIc=;
        b=qAyVbKVPmEjlSHA1M03EVtHecwiKzn+qVoW+vckx9Z9HNauqlgMGcLRJ/itBgtoZJB
         gX/HK85T91M2O3xdEye6Pt73+cJTeaPAR/IkGTCEXai4kpQ7kNGJlK5m+Y589LmPRA/9
         VJSpCXGnIqHcQZvzjgRLnZl7Tn0dW070JPYZMEK4MtnhwbDcJzf86dLoHUswwYBEo8ca
         4hP7Yp98C+f21XiNpTfVeITVn00nMBS0cO9EuKkzmYpKi9J5uaIUnHomHntED2vItGhG
         IQKuz80Ndwt/iH34GE54eWJBFfILHQmtn+5zwNcqnxVMkgHWAgRZmL0umOU+iZkWwKFc
         1hLA==
X-Gm-Message-State: AOAM533XN6E6HQQgiRmHW23prqA41YgTBocmtPPG2lWzSxHW5p9x7J58
	H3u7JZdLMOQ3afKwmsxwmENcyoAS6Xf9AIaZxrM=
X-Google-Smtp-Source: 
 ABdhPJyU4lk+X3pMBBpUdCTDDCGDXaYJcasItV9+PT02gjvRQawMsahuqLYo5c0PFgHWnLQu1g6ucoyWAOHuwY2tdtk=
X-Received: by 2002:aa7:c88b:0:b0:41c:c3d6:ab95 with SMTP id
 p11-20020aa7c88b000000b0041cc3d6ab95mr1782723eds.141.1649100051187; Mon, 04
 Apr 2022 12:20:51 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1649085436.git.bruce.ashfield@gmail.com>
 <d33fc5157b584b60177b4928d4883d9e86377d7c.1649085436.git.bruce.ashfield@gmail.com>
In-Reply-To: 
 <d33fc5157b584b60177b4928d4883d9e86377d7c.1649085436.git.bruce.ashfield@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 4 Apr 2022 15:20:40 -0400
Message-ID: 
 <CADkTA4PKpe6Y7WS64mYqZOfqQKAVOBgFwGhD9-QGaSec23Kj_w@mail.gmail.com>
Subject: Re: [PATCH 5/6] linux-yocto/5.15: features/security: Move x86_64
 configs to separate file
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000c00b0b05dbd9066b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Apr 2022 23:51:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164008

--000000000000c00b0b05dbd9066b
Content-Type: text/plain; charset="UTF-8"

I've heard this may be causing warnings on some configurations.

I'm re-testing this now, and will follow up one way or the other. But until
then, there's no sense queuing them.

Bruce

On Mon, Apr 4, 2022 at 11:19 AM <bruce.ashfield@gmail.com> wrote:

> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> Integrating the following commit(s) to linux-yocto/.:
>
>     63e25b57177 features/security: Move x86_64 configs to separate file
>
> Signed-off-by: Kamil Dziezyk <kamil.dziezyk@arm.com>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb   | 2 +-
>  meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb | 2 +-
>  meta/recipes-kernel/linux/linux-yocto_5.15.bb      | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
> b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
> index 73a720d348..87ccfc1f45 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
> @@ -12,7 +12,7 @@ python () {
>  }
>
>  SRCREV_machine ?= "29d051cc421a76432897019edc33edae35b16e39"
> -SRCREV_meta ?= "7dd85143b4ed77bdcb6628ac8ea69917e1cd29e5"
> +SRCREV_meta ?= "63e25b5717751b4b33685bd5991d10c52934a4c6"
>
>  SRC_URI = "git://
> git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine
> <http://git.yoctoproject.org/linux-yocto.git;branch=$%7BKBRANCH%7D;name=machine>
> \
>             git://
> git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}
> <http://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=$%7BKMETA%7D>
> "
> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
> b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
> index d5b301b4d5..d8ce5dc518 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
> @@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
>
>  SRCREV_machine:qemuarm ?= "cc9e92e826af229b841fcaf8c645e638a86eba43"
>  SRCREV_machine ?= "c3d54a67cbf3fb8e6df2d88c80e9d2c74f69aba4"
> -SRCREV_meta ?= "7dd85143b4ed77bdcb6628ac8ea69917e1cd29e5"
> +SRCREV_meta ?= "63e25b5717751b4b33685bd5991d10c52934a4c6"
>
>  PV = "${LINUX_VERSION}+git${SRCPV}"
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
> b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
> index b936257aa7..54157fd245 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
> @@ -23,7 +23,7 @@ SRCREV_machine:qemux86 ?=
> "c9f3902d8069e32a8928153a38d8f6115194d128"
>  SRCREV_machine:qemux86-64 ?= "c9f3902d8069e32a8928153a38d8f6115194d128"
>  SRCREV_machine:qemumips64 ?= "a4805fe749c9c56d18a60b5378674760ef0e85ed"
>  SRCREV_machine ?= "c9f3902d8069e32a8928153a38d8f6115194d128"
> -SRCREV_meta ?= "7dd85143b4ed77bdcb6628ac8ea69917e1cd29e5"
> +SRCREV_meta ?= "63e25b5717751b4b33685bd5991d10c52934a4c6"
>
>  # set your preferred provider of linux-yocto to 'linux-yocto-upstream',
> and you'll
>  # get the <version>/base branch, which is pure upstream -stable, and the
> same
> --
> 2.19.1
>
>

-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000c00b0b05dbd9066b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">I&#=
39;ve heard this may be causing warnings on some configurations.</div><div =
class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"g=
mail_default" style=3D"font-size:small">I&#39;m re-testing this now, and wi=
ll follow up one way or the other. But until then, there&#39;s no sense que=
uing=C2=A0them.</div><div class=3D"gmail_default" style=3D"font-size:small"=
><br></div><div class=3D"gmail_default" style=3D"font-size:small">Bruce</di=
v></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr=
">On Mon, Apr 4, 2022 at 11:19 AM &lt;<a href=3D"mailto:bruce.ashfield@gmai=
l.com">bruce.ashfield@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">From: Bruce Ashfield &lt;<a href=3D"mailto=
:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&g=
t;<br>
<br>
Integrating the following commit(s) to linux-yocto/.:<br>
<br>
=C2=A0 =C2=A0 63e25b57177 features/security: Move x86_64 configs to separat=
e file<br>
<br>
Signed-off-by: Kamil Dziezyk &lt;<a href=3D"mailto:kamil.dziezyk@arm.com" t=
arget=3D"_blank">kamil.dziezyk@arm.com</a>&gt;<br>
Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.co=
m" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_5.15.bb" r=
el=3D"noreferrer" target=3D"_blank">linux-yocto-rt_5.15.bb</a>=C2=A0 =C2=A0=
| 2 +-<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_5.15.bb"=
 rel=3D"noreferrer" target=3D"_blank">linux-yocto-tiny_5.15.bb</a> | 2 +-<b=
r>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_5.15.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto_5.15.bb</a>=C2=A0 =C2=A0 =C2=
=A0 | 2 +-<br>
=C2=A03 files changed, 3 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_5.1=
5.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto-rt_5.15.bb</a> b/met=
a/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_5.15.bb" rel=3D"nor=
eferrer" target=3D"_blank">linux-yocto-rt_5.15.bb</a><br>
index 73a720d348..87ccfc1f45 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_5.15.bb" r=
el=3D"noreferrer" target=3D"_blank">linux-yocto-rt_5.15.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_5.15.bb" r=
el=3D"noreferrer" target=3D"_blank">linux-yocto-rt_5.15.bb</a><br>
@@ -12,7 +12,7 @@ python () {<br>
=C2=A0}<br>
<br>
=C2=A0SRCREV_machine ?=3D &quot;29d051cc421a76432897019edc33edae35b16e39&qu=
ot;<br>
-SRCREV_meta ?=3D &quot;7dd85143b4ed77bdcb6628ac8ea69917e1cd29e5&quot;<br>
+SRCREV_meta ?=3D &quot;63e25b5717751b4b33685bd5991d10c52934a4c6&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://git.yoctoproject.org/linux-=
yocto.git;branch=3D$%7BKBRANCH%7D;name=3Dmachine" rel=3D"noreferrer" target=
=3D"_blank">git.yoctoproject.org/linux-yocto.git;branch=3D${KBRANCH};name=
=3Dmachine</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 git://<a href=3D"http://git.yocto=
project.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;branch=3Dyocto-5.15=
;destsuffix=3D$%7BKMETA%7D" rel=3D"noreferrer" target=3D"_blank">git.yoctop=
roject.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;branch=3Dyocto-5.15;=
destsuffix=3D${KMETA}</a>&quot;<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_5=
.15.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto-tiny_5.15.bb</a> b=
/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_5.15.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto-tiny_5.15.bb</a><br>
index d5b301b4d5..d8ce5dc518 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_5.15.bb"=
 rel=3D"noreferrer" target=3D"_blank">linux-yocto-tiny_5.15.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_5.15.bb"=
 rel=3D"noreferrer" target=3D"_blank">linux-yocto-tiny_5.15.bb</a><br>
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL =3D &quot;2&quot;<br>
<br>
=C2=A0SRCREV_machine:qemuarm ?=3D &quot;cc9e92e826af229b841fcaf8c645e638a86=
eba43&quot;<br>
=C2=A0SRCREV_machine ?=3D &quot;c3d54a67cbf3fb8e6df2d88c80e9d2c74f69aba4&qu=
ot;<br>
-SRCREV_meta ?=3D &quot;7dd85143b4ed77bdcb6628ac8ea69917e1cd29e5&quot;<br>
+SRCREV_meta ?=3D &quot;63e25b5717751b4b33685bd5991d10c52934a4c6&quot;<br>
<br>
=C2=A0PV =3D &quot;${LINUX_VERSION}+git${SRCPV}&quot;<br>
<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_5.15.b=
b" rel=3D"noreferrer" target=3D"_blank">linux-yocto_5.15.bb</a> b/meta/reci=
pes-kernel/linux/<a href=3D"http://linux-yocto_5.15.bb" rel=3D"noreferrer" =
target=3D"_blank">linux-yocto_5.15.bb</a><br>
index b936257aa7..54157fd245 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_5.15.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto_5.15.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_5.15.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto_5.15.bb</a><br>
@@ -23,7 +23,7 @@ SRCREV_machine:qemux86 ?=3D &quot;c9f3902d8069e32a8928153=
a38d8f6115194d128&quot;<br>
=C2=A0SRCREV_machine:qemux86-64 ?=3D &quot;c9f3902d8069e32a8928153a38d8f611=
5194d128&quot;<br>
=C2=A0SRCREV_machine:qemumips64 ?=3D &quot;a4805fe749c9c56d18a60b5378674760=
ef0e85ed&quot;<br>
=C2=A0SRCREV_machine ?=3D &quot;c9f3902d8069e32a8928153a38d8f6115194d128&qu=
ot;<br>
-SRCREV_meta ?=3D &quot;7dd85143b4ed77bdcb6628ac8ea69917e1cd29e5&quot;<br>
+SRCREV_meta ?=3D &quot;63e25b5717751b4b33685bd5991d10c52934a4c6&quot;<br>
<br>
=C2=A0# set your preferred provider of linux-yocto to &#39;linux-yocto-upst=
ream&#39;, and you&#39;ll<br>
=C2=A0# get the &lt;version&gt;/base branch, which is pure upstream -stable=
, and the same<br>
-- <br>
2.19.1<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div>

--000000000000c00b0b05dbd9066b--

