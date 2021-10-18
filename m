Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02A66C433EF
	for <webhook@archiver.kernel.org>; Mon, 18 Oct 2021 12:18:17 +0000 (UTC)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com
 [209.85.222.48])
 by mx.groups.io with SMTP id smtpd.web12.35699.1634559495999373436
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Oct 2021 05:18:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ProZLIfu;
 spf=pass (domain: gmail.com, ip: 209.85.222.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f48.google.com with SMTP id e2so3220963uax.7
        for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Oct 2021 05:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=B4tfdCcSkWx6YIpbOZz4JOkz2okPhSV4E1129EtNpeg=;
        b=ProZLIfuR5f/uHVGaOaoxPFzOwcwZzjiRvhWlF0j/i9wC36rKzl3wry/FYaV7CjDrd
         gTVeJauryW6mpE5CDBEnMbUO6fs/js86BJLxatT6xzUci2Qij9mJKVzp54BKFQQ//59m
         Dk+SXwGOQV4cxgvvSXFsFCPXz4Amzz0AU78efPCWxac8xRkYV8EiLd39Q48p7UY/HWTs
         p4awmKNtqnU72zd4qyiaUkrc2+4WcQSwPfWlbTDDgTbOEPemydpsLvz3wdBwyU3OyZI/
         jdK711mPXMLsxNtjbtBGnOPamwSQZoeEliuqB0PFE2ZeUOIVP16jp9k0MIStENQWNYKi
         MrvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=B4tfdCcSkWx6YIpbOZz4JOkz2okPhSV4E1129EtNpeg=;
        b=RKrP86WGN5VvS7r5dFMpF6jNGcExnNfcCHJwtOXXKsMshXfLcbgpWjeAIBJT69qi+N
         7KiSxuzyktzNBYw5feijvTkI+qUtjD2sYcIE5NSCChbVOrQFJbUIXhyvckcQgNFIxkUy
         AYowickmJNnZ5mkAOcvAMU2c0kj9LZC6iWagiKo21xFKHs/QZf5JnUYU5h44Lil6oOqh
         uIM0HQYhm1/TNyjhFcnXbhVmat0xHa13DTnHse5NsS99dVjIKus8Y3JJ3CmVmPYOlzBP
         WEvnaRdFaV//B3jhYbqqHpbPcC/o0Koo7gFw+lAilSiYh7yvCnCt+jMFEdHQROKRVwM6
         pQdw==
X-Gm-Message-State: AOAM531HjO/vunG0UBckJGDSOH+LeE/IanMdZcsyo8Cu3OVfELcjpZN4
	os6oSqRAqHIj8y2mEPdIh0qcDQWjPbuotBBDm9IP5mcJ
X-Google-Smtp-Source: 
 ABdhPJwX0QYrZgzXSNZXfIPWMrf84cbPpwvoEgQWGwzbKQzqM7696+ZwLDLFyvAiGRcH3z+o1O00n0/9DkB0uEBHTgs=
X-Received: by 2002:a67:df18:: with SMTP id s24mr26347085vsk.40.1634559495142;
 Mon, 18 Oct 2021 05:18:15 -0700 (PDT)
MIME-Version: 1.0
References: <20211018120251.1203204-1-yuka@yuka.dev>
In-Reply-To: <20211018120251.1203204-1-yuka@yuka.dev>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 18 Oct 2021 14:18:03 +0200
Message-ID: 
 <CANNYZj-n25b2=M5Lnqaq5HLKcDBredEg2dZsh_gtqUKs8z1Gow@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] systemd: add missing include for musl
To: yuka@yuka.dev
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000127fda05ce9f8a7d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Oct 2021 12:18:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157056

--000000000000127fda05ce9f8a7d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The recipe needs to be adjusted as well?

Alex

On Mon, 18 Oct 2021 at 14:03, Yureka via lists.openembedded.org <yuka=3D
yuka.dev@lists.openembedded.org> wrote:

> Fixes "error: =E2=80=98FTW_ACTIONRETVAL=E2=80=99 undeclared (first use in=
 this
> function)" in src/shared/mount-setup.c.
>
> Signed-off-by: Yureka <yuka@yuka.dev>
> ---
>  .../0008-add-missing-FTW_-macros-for-musl.patch  | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
>
> diff --git
> a/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-for-musl=
.patch
> b/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-for-musl=
.patch
> index 95c3000aa1..792727ed8e 100644
> ---
> a/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-for-musl=
.patch
> +++
> b/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-for-musl=
.patch
> @@ -10,10 +10,10 @@ This is to avoid build failures like below for musl.
>  Upstream-Status: Inappropriate [musl specific]
>
>  Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> -
>  ---
>   src/basic/missing_type.h | 20 ++++++++++++++++++++
> - 1 file changed, 20 insertions(+)
> + src/shared/mount-setup.c |  1 +
> + 2 files changed, 21 insertions(+)
>
>  diff --git a/src/basic/missing_type.h b/src/basic/missing_type.h
>  index aeaf6ad5ec..3df1084ef2 100644
> @@ -43,3 +43,15 @@ index aeaf6ad5ec..3df1084ef2 100644
>  +#ifndef FTW_SKIP_SIBLINGS
>  +#define FTW_SKIP_SIBLINGS 3
>  +#endif
> +diff --git a/src/shared/mount-setup.c b/src/shared/mount-setup.c
> +index ef3527e9a7..c1cab40eb8 100644
> +--- a/src/shared/mount-setup.c
> ++++ b/src/shared/mount-setup.c
> +@@ -32,6 +32,7 @@
> + #include "strv.h"
> + #include "user-util.h"
> + #include "virt.h"
> ++#include "missing_type.h"
> +
> + typedef enum MountMode {
> +         MNT_NONE           =3D 0,
> --
> 2.33.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#157055):
> https://lists.openembedded.org/g/openembedded-core/message/157055
> Mute This Topic: https://lists.openembedded.org/mt/86411771/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000127fda05ce9f8a7d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>The recipe needs to be adjusted as well?</div><div><b=
r></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Mon, 18 Oct 2021 at 14:03, Yureka via <a href=
=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;yuka=3D<a=
 href=3D"mailto:yuka.dev@lists.openembedded.org">yuka.dev@lists.openembedde=
d.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">Fixes &quot;error: =E2=80=98FTW_ACTIONRETVAL=E2=80=99 undeclared (firs=
t use in this<br>
function)&quot; in src/shared/mount-setup.c.<br>
<br>
Signed-off-by: Yureka &lt;<a href=3D"mailto:yuka@yuka.dev" target=3D"_blank=
">yuka@yuka.dev</a>&gt;<br>
---<br>
=C2=A0.../0008-add-missing-FTW_-macros-for-musl.patch=C2=A0 | 16 ++++++++++=
++++--<br>
=C2=A01 file changed, 14 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros=
-for-musl.patch b/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-m=
acros-for-musl.patch<br>
index 95c3000aa1..792727ed8e 100644<br>
--- a/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-for-mu=
sl.patch<br>
+++ b/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-for-mu=
sl.patch<br>
@@ -10,10 +10,10 @@ This is to avoid build failures like below for musl.<br=
>
=C2=A0Upstream-Status: Inappropriate [musl specific]<br>
<br>
=C2=A0Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" t=
arget=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
-<br>
=C2=A0---<br>
=C2=A0 src/basic/missing_type.h | 20 ++++++++++++++++++++<br>
- 1 file changed, 20 insertions(+)<br>
+ src/shared/mount-setup.c |=C2=A0 1 +<br>
+ 2 files changed, 21 insertions(+)<br>
<br>
=C2=A0diff --git a/src/basic/missing_type.h b/src/basic/missing_type.h<br>
=C2=A0index aeaf6ad5ec..3df1084ef2 100644<br>
@@ -43,3 +43,15 @@ index aeaf6ad5ec..3df1084ef2 100644<br>
=C2=A0+#ifndef FTW_SKIP_SIBLINGS<br>
=C2=A0+#define FTW_SKIP_SIBLINGS 3<br>
=C2=A0+#endif<br>
+diff --git a/src/shared/mount-setup.c b/src/shared/mount-setup.c<br>
+index ef3527e9a7..c1cab40eb8 100644<br>
+--- a/src/shared/mount-setup.c<br>
++++ b/src/shared/mount-setup.c<br>
+@@ -32,6 +32,7 @@<br>
+ #include &quot;strv.h&quot;<br>
+ #include &quot;user-util.h&quot;<br>
+ #include &quot;virt.h&quot;<br>
++#include &quot;missing_type.h&quot;<br>
+ <br>
+ typedef enum MountMode {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MNT_NONE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0=3D 0,<br>
-- <br>
2.33.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#157055): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/157055" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/157055</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/86411771/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/86411771/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000127fda05ce9f8a7d--

