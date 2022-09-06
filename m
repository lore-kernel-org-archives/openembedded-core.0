Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D398DECAAD5
	for <webhook@archiver.kernel.org>; Tue,  6 Sep 2022 14:18:45 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web09.4549.1662473916008446410
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Sep 2022 07:18:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=H1b4eNiU;
 spf=pass (domain: gmail.com, ip: 209.85.208.174,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id b26so12428469ljk.12
        for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Sep 2022 07:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=c5ILMQDmmZ0/+nLvAj8ItGbLI6pcTQ9W8NEYgqbw6ko=;
        b=H1b4eNiUiaUEugverGuP7t/8JItefoPgI+pQH/nyC61E+dno6Dj2kBMnkzTEJzJAqh
         UTaTfNw6Fm8P2olBjayFdn2yMO1Iv2F06seM9HGUEeP5rBMdHN7+6E6cqkffGzG4WbTo
         crjDqxX4Wh8FQ4OT6jPBjuktARyGgOdCEnt9nH8xRmx1r7Q7e8IkUd26auYSj80nlzbv
         rpDzLPelKLQFudu5zveCCwQegXII9iIftz870qLM/FGta4rABSeJiljG/u1qwczrKetP
         pH9WqGpoToj/PpDVo8qXnLLJVRIaifhZcLcx0CcySQorTUJvSheaId8R6sUWtR5C/id6
         aFfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=c5ILMQDmmZ0/+nLvAj8ItGbLI6pcTQ9W8NEYgqbw6ko=;
        b=lkOf+J7AeA4DagAECa+mwvzGSWDDs4dHBzgu1gRc8hzTVxQsf5KhBOfjOUlcgdltvS
         cvb5Azeee4ML0Hk4NrKadXebd95SBjosfrP5g0AOsZh+WtScP50DMlJwBe0gdW7P5rjb
         4QNxgqcQ7BOFfdhwejd1gkBdplX/nlvPAuzhSs0Ee4t1J62DihNBjCvbExbRZ0lWdwUz
         cXsP7hPTBIm8LNpru6oqWY3RDqldvzHGE247LdVJZYBN+9Arws8hwX6TpUwd2TAZKs3L
         IAK6Vinc0gAV7SQ84KEtydvBBqRMJCNT/LARB0Xmdpj9MlXU9LaC13fFzhba2/y0vmVg
         E5zA==
X-Gm-Message-State: ACgBeo30HYjoUcJ1ICXmpCSokJPF6uPjdt86TFDohJi7c7ac+SfppXO5
	c5AAMCOSS5d7W7HU7S5aJ1XiUSbe89iy6ZDHXzI=
X-Google-Smtp-Source: 
 AA6agR6eGNnuRUiEPhfVlSNcWbr8iLm32d6cNBXkOcG9Fl/YMnkF6yh4gEoHnUn81/C9g9JI2IvxUZ6Xq8NU6aE9BfE=
X-Received: by 2002:a05:651c:1787:b0:261:c1ff:4407 with SMTP id
 bn7-20020a05651c178700b00261c1ff4407mr16043666ljb.257.1662473914082; Tue, 06
 Sep 2022 07:18:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220906135010.2610775-1-pkj@axis.com>
In-Reply-To: <20220906135010.2610775-1-pkj@axis.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 6 Sep 2022 16:18:23 +0200
Message-ID: 
 <CANNYZj9X7KD9EMVWgBJx1qBZCk15OTxvAPdhSx1JXudnsiT8TQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] oe-setup-builddir: Correct when validation
 of the templates dir is run
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000018ea5705e802df35"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Sep 2022 14:18:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170357

--00000000000018ea5705e802df35
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The patch context doesn=E2=80=99t show the nested conditions, so it would b=
e good
to add a description of what is being corrected.

Alex

On Tue 6. Sep 2022 at 15.50, Peter Kjellerstedt <peter.kjellerstedt@axis.co=
m>
wrote:

> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  scripts/oe-setup-builddir | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/scripts/oe-setup-builddir b/scripts/oe-setup-builddir
> index d3c7f943e7..70f2245b16 100755
> --- a/scripts/oe-setup-builddir
> +++ b/scripts/oe-setup-builddir
> @@ -63,11 +63,11 @@ if [ -n "$TEMPLATECONF" ]; then
>              echo >&2 "Error: TEMPLATECONF value points to nonexistent
> directory '$TEMPLATECONF'"
>              exit 1
>          fi
> -        templatesdir=3D$(python3 -c "import sys;
> print(sys.argv[1].strip('/').split('/')[-2])" $TEMPLATECONF)
> -        if [ ! -f "$TEMPLATECONF/../../layer.conf" -o $templatesdir !=3D
> "templates" ]; then
> -            echo >&2 "Error: TEMPLATECONF value (which is $TEMPLATECONF)
> must point to meta-some-layer/conf/templates/template-name"
> -            exit 1
> -        fi
> +    fi
> +    templatesdir=3D$(python3 -c "import sys;
> print(sys.argv[1].strip('/').split('/')[-2])" $TEMPLATECONF)
> +    if [ ! -f "$TEMPLATECONF/../../layer.conf" -o $templatesdir !=3D
> "templates" ]; then
> +        echo >&2 "Error: TEMPLATECONF value (which is $TEMPLATECONF) mus=
t
> point to meta-some-layer/conf/templates/template-name"
> +        exit 1
>      fi
>      OECORELAYERCONF=3D"$TEMPLATECONF/bblayers.conf.sample"
>      OECORELOCALCONF=3D"$TEMPLATECONF/local.conf.sample"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#170354):
> https://lists.openembedded.org/g/openembedded-core/message/170354
> Mute This Topic: https://lists.openembedded.org/mt/93500975/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000018ea5705e802df35
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">The patch context doesn=E2=80=99t show the nested conditi=
ons, so it would be good to add a description of what is being corrected.</=
div><div dir=3D"auto"><br></div><div dir=3D"auto">Alex</div><div><br><div c=
lass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue 6. Sep 20=
22 at 15.50, Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kjellerstedt@ax=
is.com">peter.kjellerstedt@axis.com</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;=
border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)=
" dir=3D"auto">Signed-off-by: Peter Kjellerstedt &lt;<a href=3D"mailto:pete=
r.kjellerstedt@axis.com" target=3D"_blank">peter.kjellerstedt@axis.com</a>&=
gt;<br>
---<br>
=C2=A0scripts/oe-setup-builddir | 10 +++++-----<br>
=C2=A01 file changed, 5 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/scripts/oe-setup-builddir b/scripts/oe-setup-builddir<br>
index d3c7f943e7..70f2245b16 100755<br>
--- a/scripts/oe-setup-builddir<br>
+++ b/scripts/oe-setup-builddir<br>
@@ -63,11 +63,11 @@ if [ -n &quot;$TEMPLATECONF&quot; ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &gt;&amp;2 &quot;Error=
: TEMPLATECONF value points to nonexistent directory &#39;$TEMPLATECONF&#39=
;&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit 1<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 templatesdir=3D$(python3 -c &quot;import sys; =
print(sys.argv[1].strip(&#39;/&#39;).split(&#39;/&#39;)[-2])&quot; $TEMPLAT=
ECONF)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ ! -f &quot;$TEMPLATECONF/../../layer.conf=
&quot; -o $templatesdir !=3D &quot;templates&quot; ]; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &gt;&amp;2 &quot;Error: TEM=
PLATECONF value (which is $TEMPLATECONF) must point to meta-some-layer/conf=
/templates/template-name&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit 1<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
+=C2=A0 =C2=A0 fi<br>
+=C2=A0 =C2=A0 templatesdir=3D$(python3 -c &quot;import sys; print(sys.argv=
[1].strip(&#39;/&#39;).split(&#39;/&#39;)[-2])&quot; $TEMPLATECONF)<br>
+=C2=A0 =C2=A0 if [ ! -f &quot;$TEMPLATECONF/../../layer.conf&quot; -o $tem=
platesdir !=3D &quot;templates&quot; ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &gt;&amp;2 &quot;Error: TEMPLATECONF valu=
e (which is $TEMPLATECONF) must point to meta-some-layer/conf/templates/tem=
plate-name&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 exit 1<br>
=C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0 =C2=A0 =C2=A0OECORELAYERCONF=3D&quot;$TEMPLATECONF/bblayers.conf.sam=
ple&quot;<br>
=C2=A0 =C2=A0 =C2=A0OECORELOCALCONF=3D&quot;$TEMPLATECONF/local.conf.sample=
&quot;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#170354): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/170354" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/170354</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/93500975/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/93500975/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000018ea5705e802df35--

