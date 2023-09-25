Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 949ACCE7A94
	for <webhook@archiver.kernel.org>; Mon, 25 Sep 2023 13:34:12 +0000 (UTC)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
 by mx.groups.io with SMTP id smtpd.web10.60887.1695648844529013767
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Sep 2023 06:34:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=clFJF9wC;
 spf=pass (domain: gmail.com, ip: 209.85.166.48, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-79f9acc857cso184696439f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Sep 2023 06:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695648844; x=1696253644; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RUYBTG/z6rVc8Wt25puAbTbY3CgQ5+gQilaaMXecr4U=;
        b=clFJF9wC7qatoNt5egIcgp9lHZF7NNEOT+gLOu52F0BrBtWhOzJR1P30ERVf2PdIIO
         KEVA9IuhgjOrJdVuWFCTd3HbMOyO3BIbtTeUZencdJGB9hiCiK6FWmyN818/tCRCqWbI
         CxntoqJFVW0ARiqPHXElq+YBdB0cmN5hZ4Eynd+czuNoKoDgyddBWqjqBbJwxzPvvawL
         lPKKdWfz9IVKhHy2iA0PqSp6OGCndem7QGOZk3O+Zpc81aRmgOEYL01UcsyUDwQ5JM3j
         WNd3bKcd2ymIJgBL2JlBqGXysgAXoVPCzFL7XRQyZUZ2QxqPjCLtUT+yJysOCf3VjY0K
         jmjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695648844; x=1696253644;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RUYBTG/z6rVc8Wt25puAbTbY3CgQ5+gQilaaMXecr4U=;
        b=lEl3pPToKonkEPzFlkIbC9qJJcUC50IN5MMNhiLqBTowxYrgzrmRvBgJcXKtQr2Iql
         bUz6FdcY9VTpPrY1Z+CvHZNCLkZLif34dAsjIa8NVqJXTf2/QW3IuHR74zh9FAg2iYLT
         RsPKdimxDdl6we0yv+XJCF1mwLso5DYqFzaSjUBszxlwlYBunl9/g6zSL3eoyWnCJsEw
         ctbVLFN0eX9RnJMARuxZ0o6FU9deDwrX+miIk/E1z/TGeS2tVHhstSeaPREkDDA+n2vk
         y1+th9yxzrLvIZVJ9wPXZ80dPQjuMBjgDa7aaoh7CaL5zTOM12rpuu1/d5nPKjeQiFQn
         qUMA==
X-Gm-Message-State: AOJu0Yxql2z3alzNlu1uK4S61LCs45nT6zWo1y2+eZEZUqYlwbMpCCB3
	G28bxZ0OonRDUr9aIsZmBNaakWq18IpLLTNorz4=
X-Google-Smtp-Source: AGHT+IElD7GCjmBwT6TLZ0XQDjfpWc/7bDoOFx8WVNWxQA00MWgxOndu7yJU93b/3J0zInfDnnfGgZdpGdr9iD018PI=
X-Received: by 2002:a5e:8d0c:0:b0:790:cb89:44eb with SMTP id
 m12-20020a5e8d0c000000b00790cb8944ebmr7323139ioj.1.1695648843422; Mon, 25 Sep
 2023 06:34:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230925132919.1910323-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20230925132919.1910323-1-richard.purdie@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 25 Sep 2023 09:33:52 -0400
Message-ID: <CADkTA4P1CanO9ABtAWt9=txXYrgaXhWZ87ZwuUd8tdm8_U82aQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] create-spdx: Ensure it is clear where the
 message comes from
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000f9e30a06062f0256"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Sep 2023 13:34:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188190

--000000000000f9e30a06062f0256
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 25, 2023 at 9:29=E2=80=AFAM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> This message can appear in do_rootfs and the users tend to think this is
> some kind of packaging issue. Add SPDX to the message so users like me
> think in the right direction.
>

This user definitely did!

Although hard to trigger, I know this will save a poor soul some time if
they do manage to hit the condition.

Bruce



>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes/create-spdx-2.2.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/create-spdx-2.2.bbclass
> b/meta/classes/create-spdx-2.2.bbclass
> index 885f07a1f87..3ee1b7ee0d8 100644
> --- a/meta/classes/create-spdx-2.2.bbclass
> +++ b/meta/classes/create-spdx-2.2.bbclass
> @@ -1031,7 +1031,7 @@ def combine_spdx(d, rootfs_name, rootfs_deploydir,
> rootfs_spdxid, packages, spdx
>
>      for name in sorted(packages.keys()):
>          if name not in providers:
> -            bb.fatal("Unable to find provider for '%s'" % name)
> +            bb.fatal("Unable to find SPDX provider for '%s'" % name)
>
>          pkg_name, pkg_hashfn =3D providers[name]
>
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#188189):
> https://lists.openembedded.org/g/openembedded-core/message/188189
> Mute This Topic: https://lists.openembedded.org/mt/101573796/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000f9e30a06062f0256
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, Sep 25, 2023 at 9:29=E2=80=AFAM Richard Pur=
die &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdi=
e@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">This message can appear in do_rootfs and the users ten=
d to think this is<br>
some kind of packaging issue. Add SPDX to the message so users like me<br>
think in the right direction.<br></blockquote><div><br></div><div><div clas=
s=3D"gmail_default" style=3D"font-size:small">This user definitely did!</di=
v><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div cla=
ss=3D"gmail_default" style=3D"font-size:small">Although hard to trigger, I =
know this will save a poor soul some time if they do manage to hit the cond=
ition.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></di=
v><div class=3D"gmail_default" style=3D"font-size:small">Bruce</div><br></d=
iv><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<b=
r>
---<br>
=C2=A0meta/classes/create-spdx-2.2.bbclass | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-spd=
x-2.2.bbclass<br>
index 885f07a1f87..3ee1b7ee0d8 100644<br>
--- a/meta/classes/create-spdx-2.2.bbclass<br>
+++ b/meta/classes/create-spdx-2.2.bbclass<br>
@@ -1031,7 +1031,7 @@ def combine_spdx(d, rootfs_name, rootfs_deploydir, ro=
otfs_spdxid, packages, spdx<br>
<br>
=C2=A0 =C2=A0 =C2=A0for name in sorted(packages.keys()):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if name not in providers:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.fatal(&quot;Unable to find pr=
ovider for &#39;%s&#39;&quot; % name)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.fatal(&quot;Unable to find SP=
DX provider for &#39;%s&#39;&quot; % name)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pkg_name, pkg_hashfn =3D providers[name]<=
br>
<br>
-- <br>
2.39.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#188189): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/188189" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/188189</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/101573796/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/101573796/1050810</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.com" =
target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">- =
Thou shalt not follow the NULL pointer, for chaos and madness await thee at=
 its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br><b=
r></div></div>

--000000000000f9e30a06062f0256--

