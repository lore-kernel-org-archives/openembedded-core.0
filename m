Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E70CC47091
	for <webhook@archiver.kernel.org>; Tue, 12 Apr 2022 16:46:40 +0000 (UTC)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com
 [209.85.221.176])
 by mx.groups.io with SMTP id smtpd.web08.7794.1649745853518664049
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Apr 2022 23:44:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OJxDXQq5;
 spf=pass (domain: gmail.com, ip: 209.85.221.176,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-vk1-f176.google.com with SMTP id n5so3448278vkq.10
        for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Apr 2022 23:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Bpc10vHhPdvsKXvdjh/qAroXyCv0u42S7mlw2fSplaY=;
        b=OJxDXQq5pRzU3UMLBb1RcuAww95P61wdQ5ek8CvFQs/wPVuGwSELi4l8XowBu2gqIh
         XaAVk4dgQDjUNWM5PK3PvEa/IpXlpUWD4G4hKombhA70gHyxQX1Zu2A/F0JceCnJqj4U
         wGyregaDgN3QKq4kAvtxUeYXt/jO0ks4/38peyJ66S18P1a5oIkx8v8cdEHnhk0nY+/9
         ib3xTood5N2w68VOMEYRTE58Fuhoem37YEK4AqZCW6dax4NyvOlYQJfSpX23DN3xFPhs
         CZkMMpm6SWs9KFvwi4RJONgI7m/IX7Ehr5LsnHIMUs3JHqYScki0Lhbu7JUXghMUdrZU
         BAdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Bpc10vHhPdvsKXvdjh/qAroXyCv0u42S7mlw2fSplaY=;
        b=vWbYG6bFA/wqbe5CI1ddjrqrIRv76+b1QTYGiKOQPZRO1Vcu5W1VsrUtD6XN8rmLnV
         iboOdG6wNZf1bIyglZeh+fYFmWQmMTY6idbcjifu/aa5Ed6cZPVBqNdEGnm/D+kyShCK
         qeKNYsyupXziz+QgKFPsp7kC7Bnyn4mfGPQxCOvGQuJL8mhXU43QBsFQ4I2L3gTr/wq3
         1HNXdxwAyrL5XA2m8qYkJ3SgyX4xx0DYpWPAYNd8ZRPlsH7ekVoh+06/5pUflBUKf4YX
         b4AIbTMcJAOuba1dETwx8I5qhQfd0jXlj1ITKTZcwB44x5Ky6dMuluguA0J0D8AQKpZy
         IwUw==
X-Gm-Message-State: AOAM533XTCTReYTrm34dOZZGtzlDSu7UD/Xb6PN5TmMLdKJWBl7Mx+0G
	l69iFByjo6+lhxrG+KENVez6wl0e2raH7yP3X6o=
X-Google-Smtp-Source: 
 ABdhPJz2hJvu0CZaU+u33oZGdjNN88LzdS7smSsimjfxrH+FdBbeyqBSu57pHdOuALmrA1fyOwqACms/X+eycj9PYyU=
X-Received: by 2002:ac5:cde6:0:b0:345:aeb7:b902 with SMTP id
 v6-20020ac5cde6000000b00345aeb7b902mr2393733vkn.39.1649745852180; Mon, 11 Apr
 2022 23:44:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220412064015.34597-1-karn.jye.lau@intel.com>
In-Reply-To: <20220412064015.34597-1-karn.jye.lau@intel.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 12 Apr 2022 08:44:00 +0200
Message-ID: 
 <CA+chaQcxPy7R6ZKV0ot76AewzAK5369Fm2BU0eQZ-38oOFWLNA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] icewm:include imlib2-loaders package
To: karn.jye.lau@intel.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000007d2b9b05dc6f63b0"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Apr 2022 16:46:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164253

--0000000000007d2b9b05dc6f63b0
Content-Type: text/plain; charset="UTF-8"

wrong ML and you probably wanted RDEPENDS:${PN}:append not
RDEPENDS:append:${PN}

On Tue, Apr 12, 2022 at 8:40 AM <karn.jye.lau@intel.com> wrote:

> From: KARN JYE LAU <karn.jye.lau@intel.com>
>
> icewm 2.0.0 above have use imlib2 as default
> rendering engine.Update icewm  recipe to include
> the essential packages for icewm to work properly.
>
> Signed-off-by: KARN JYE LAU <karn.jye.lau@intel.com>
> ---
>  meta-oe/recipes-extended/icewm/icewm_2.9.0.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-oe/recipes-extended/icewm/icewm_2.9.0.bb
> b/meta-oe/recipes-extended/icewm/icewm_2.9.0.bb
> index dac025de7..f28ab2fa0 100644
> --- a/meta-oe/recipes-extended/icewm/icewm_2.9.0.bb
> +++ b/meta-oe/recipes-extended/icewm/icewm_2.9.0.bb
> @@ -24,6 +24,7 @@ DEPENDS = "asciidoc-native fontconfig fribidi gdk-pixbuf
> imlib2       libxft libxpm li
>      libxfixes"
>  DEPENDS:append = " qemu-native"
>  RDEPENDS:${PN} = "perl fribidi"
> +RDEPENDS:append:${PN} = " imlib2 imlib2-loaders"
>
>  do_compile:prepend:class-target() {
>
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#164252):
> https://lists.openembedded.org/g/openembedded-core/message/164252
> Mute This Topic: https://lists.openembedded.org/mt/90413099/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> Martin.Jansa@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000007d2b9b05dc6f63b0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">wrong ML and you probably wanted RDEPENDS:${PN}:append not=
 RDEPENDS:append:${PN}</div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Tue, Apr 12, 2022 at 8:40 AM &lt;<a href=3D"mailto=
:karn.jye.lau@intel.com">karn.jye.lau@intel.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">From: KARN JYE LAU &lt;<a hr=
ef=3D"mailto:karn.jye.lau@intel.com" target=3D"_blank">karn.jye.lau@intel.c=
om</a>&gt;<br>
<br>
icewm 2.0.0 above have use imlib2 as default<br>
rendering engine.Update icewm=C2=A0 recipe to include<br>
the essential packages for icewm to work properly.<br>
<br>
Signed-off-by: KARN JYE LAU &lt;<a href=3D"mailto:karn.jye.lau@intel.com" t=
arget=3D"_blank">karn.jye.lau@intel.com</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-extended/icewm/<a href=3D"http://icewm_2.9.0.bb" rel=
=3D"noreferrer" target=3D"_blank">icewm_2.9.0.bb</a> | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta-oe/recipes-extended/icewm/<a href=3D"http://icewm_2.9.0.b=
b" rel=3D"noreferrer" target=3D"_blank">icewm_2.9.0.bb</a> b/meta-oe/recipe=
s-extended/icewm/<a href=3D"http://icewm_2.9.0.bb" rel=3D"noreferrer" targe=
t=3D"_blank">icewm_2.9.0.bb</a><br>
index dac025de7..f28ab2fa0 100644<br>
--- a/meta-oe/recipes-extended/icewm/<a href=3D"http://icewm_2.9.0.bb" rel=
=3D"noreferrer" target=3D"_blank">icewm_2.9.0.bb</a><br>
+++ b/meta-oe/recipes-extended/icewm/<a href=3D"http://icewm_2.9.0.bb" rel=
=3D"noreferrer" target=3D"_blank">icewm_2.9.0.bb</a><br>
@@ -24,6 +24,7 @@ DEPENDS =3D &quot;asciidoc-native fontconfig fribidi gdk-=
pixbuf imlib2=C2=A0 =C2=A0 =C2=A0 =C2=A0libxft libxpm li<br>
=C2=A0 =C2=A0 =C2=A0libxfixes&quot;<br>
=C2=A0DEPENDS:append =3D &quot; qemu-native&quot;<br>
=C2=A0RDEPENDS:${PN} =3D &quot;perl fribidi&quot;<br>
+RDEPENDS:append:${PN} =3D &quot; imlib2 imlib2-loaders&quot;<br>
<br>
=C2=A0do_compile:prepend:class-target() {<br>
<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#164252): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/164252" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/164252</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/90413099/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/90413099/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" ta=
rget=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000007d2b9b05dc6f63b0--

