Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DD03C433EF
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 16:10:42 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web11.21673.1646064641219969076
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Feb 2022 08:10:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CRVvkbqu;
 spf=pass (domain: gmail.com, ip: 209.85.208.170,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id p20so18148276ljo.0
        for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Feb 2022 08:10:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=m8ocrTr/3gX9Yw15+kiX8oo52q6Wz0LbZAsG+N9ZV0U=;
        b=CRVvkbqut1+LNsUEYxt0RJNDxql1jeNoapHEhCk+odgz53hVT+pIJmlhFkQVmBwxlU
         jpzTXj8MjzaImjG6AkjYxYg6PDP0PG0yS1foT3rOQD1lMwMyelOH+stdIKOjvKH6dd1k
         RpuASrwO1viZ/DX1lQDlnhP9U56Y1MJC1BPwnr06gwXlVJmvUFMjPAkT64QT+dd/I29x
         g88dkJcWwE8alXeX+FKSPNlR6oNjApivY0nXycsmRGIEQoZltp2+tM+jkQi5GBh7PPTX
         EkzA7KK2cg01L4ZC5GVr2Z+r501nd9hKxesptx0/BCRBgF/c3OPW92T8yxZnTjrrnKRz
         H4mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=m8ocrTr/3gX9Yw15+kiX8oo52q6Wz0LbZAsG+N9ZV0U=;
        b=7lANojc3V3Rw3hmWx3Mz9/HVs6NO5M+eAwqI883jHxLIlzU7756GS7ybvL8oEWcbes
         OVuaa2kEG6+vWfJkp/6rJBJ91rKTxK9c/hTlnSSzojmRdOuVtEb9aI/rtfLFNI2R70Xs
         8dcX8ylYY7cuPIomYNx0y0ihaF+ACYVMHDzvrNwR/Ah6BO7oNXjv4MskEV3DSACKIWYA
         Y7TMSY4Fnh8GdBguSXX0PfOaMw5gIVCt6UZaobci0lMJi1dxmC1yTVySioWkGsPegN5E
         YBgfpvRbnkE2jOp4BkW1LP0wVrtFhEitkz0URIvG39nTW+9u07kh+y/1+beD0Ah/+RG8
         k3tQ==
X-Gm-Message-State: AOAM530hGywkiTdjpPaFejvqPi0Ac6J4u7SKnzor/Fj1e08U4c5ENJG3
	iPJDJABh5WwydeKPH+Es5cCO5LRsogn4P5qOCxw=
X-Google-Smtp-Source: 
 ABdhPJwHj+Qxj14wCLoZoex1gA6ob4Q63hyVr3jajZL8bYYZ6BBK2IcOb8zF0wVk5zbNeQ3FqhqY08wMp/w680DO9a8=
X-Received: by 2002:a2e:8e98:0:b0:246:3f53:6b0d with SMTP id
 z24-20020a2e8e98000000b002463f536b0dmr15030177ljk.255.1646064639254; Mon, 28
 Feb 2022 08:10:39 -0800 (PST)
MIME-Version: 1.0
References: <16D467EAE661BF11.21797@lists.openembedded.org>
In-Reply-To: <16D467EAE661BF11.21797@lists.openembedded.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Mon, 28 Feb 2022 16:10:28 +0000
Message-ID: 
 <CANPvuRn8mgL6FMWj0143ZTPXY5VyzHfA81kJruqFEq0xdpBgnQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] icecc.bbclass: enable networking in all tasks
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000019a4c205d9164aa9"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Feb 2022 16:10:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162509

--00000000000019a4c205d9164aa9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This patch can't be the right fix but currently the icecc.bbclass doesn't
work on master.

Jose

Jose Quaresma via lists.openembedded.org <quaresma.jose=3D
gmail.com@lists.openembedded.org> escreveu no dia quarta, 16/02/2022 =C3=A0=
(s)
23:27:

> The icecc.bbclass needs network access to work properly.
>
> Currently I build with icecc inside a container with network isolation an=
d
> my icecc daemon runs outside of the build container in my host.
> The only thing I need to do for using the icecc inside my build container
> is
> mounting the unix socket /var/run/icecc/iceccd.socket inside the containe=
r.
>
> I think we need something like this mount functionality to have access to
> some sockets connections inside the tasks that runs on the new namespace
> created with unshare system call.
>
> This patch is not a the real solution for the problem and is more like
> an hack so we can use the icecc.bbclass again.
>
> Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> ---
>  meta/classes/icecc.bbclass | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
> index 3bbd2645af..68415b04c7 100644
> --- a/meta/classes/icecc.bbclass
> +++ b/meta/classes/icecc.bbclass
> @@ -428,18 +428,22 @@ set_icecc_env() {
>      bbnote "Using icecc tarball: $ICECC_VERSION"
>  }
>
> +do_configure[network] =3D "1"
>  do_configure:prepend() {
>      set_icecc_env
>  }
>
> +do_compile[network] =3D "1"
>  do_compile:prepend() {
>      set_icecc_env
>  }
>
> +do_compile_kernelmodules[network] =3D "1"
>  do_compile_kernelmodules:prepend() {
>      set_icecc_env
>  }
>
> +do_install[network] =3D "1"
>  do_install:prepend() {
>      set_icecc_env
>  }
> --
> 2.35.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#161785):
> https://lists.openembedded.org/g/openembedded-core/message/161785
> Mute This Topic: https://lists.openembedded.org/mt/89198407/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000019a4c205d9164aa9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>This patch can&#39;t be the right=C2=A0fix but curren=
tly the icecc.bbclass doesn&#39;t work on master.<br></div><div><br></div><=
div>Jose</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmai=
l_attr">Jose Quaresma via <a href=3D"http://lists.openembedded.org">lists.o=
penembedded.org</a> &lt;quaresma.jose=3D<a href=3D"mailto:gmail.com@lists.o=
penembedded.org">gmail.com@lists.openembedded.org</a>&gt; escreveu no dia q=
uarta, 16/02/2022 =C3=A0(s) 23:27:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">The icecc.bbclass needs network access to work properly.=
<br>
<br>
Currently I build with icecc inside a container with network isolation and<=
br>
my icecc daemon runs outside of the build container in my host.<br>
The only thing I need to do for using the icecc inside my build container i=
s<br>
mounting the unix socket /var/run/icecc/iceccd.socket inside the container.=
<br>
<br>
I think we need something like this mount functionality to have access to<b=
r>
some sockets connections inside the tasks that runs on the new namespace<br=
>
created with unshare system call.<br>
<br>
This patch is not a the real solution for the problem and is more like<br>
an hack so we can use the icecc.bbclass again.<br>
<br>
Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmail.com"=
 target=3D"_blank">quaresma.jose@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/icecc.bbclass | 4 ++++<br>
=C2=A01 file changed, 4 insertions(+)<br>
<br>
diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass<br>
index 3bbd2645af..68415b04c7 100644<br>
--- a/meta/classes/icecc.bbclass<br>
+++ b/meta/classes/icecc.bbclass<br>
@@ -428,18 +428,22 @@ set_icecc_env() {<br>
=C2=A0 =C2=A0 =C2=A0bbnote &quot;Using icecc tarball: $ICECC_VERSION&quot;<=
br>
=C2=A0}<br>
<br>
+do_configure[network] =3D &quot;1&quot;<br>
=C2=A0do_configure:prepend() {<br>
=C2=A0 =C2=A0 =C2=A0set_icecc_env<br>
=C2=A0}<br>
<br>
+do_compile[network] =3D &quot;1&quot;<br>
=C2=A0do_compile:prepend() {<br>
=C2=A0 =C2=A0 =C2=A0set_icecc_env<br>
=C2=A0}<br>
<br>
+do_compile_kernelmodules[network] =3D &quot;1&quot;<br>
=C2=A0do_compile_kernelmodules:prepend() {<br>
=C2=A0 =C2=A0 =C2=A0set_icecc_env<br>
=C2=A0}<br>
<br>
+do_install[network] =3D &quot;1&quot;<br>
=C2=A0do_install:prepend() {<br>
=C2=A0 =C2=A0 =C2=A0set_icecc_env<br>
=C2=A0}<br>
-- <br>
2.35.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#161785): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/161785" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/161785</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/89198407/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/89198407/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div>

--00000000000019a4c205d9164aa9--

