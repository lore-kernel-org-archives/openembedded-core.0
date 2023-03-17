Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1C30C74A5B
	for <webhook@archiver.kernel.org>; Fri, 17 Mar 2023 07:28:06 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web11.13848.1679038076831257829
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Mar 2023 00:27:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MJF4vWa/;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id g18so4133619ljl.3
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Mar 2023 00:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679038074;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MrJsUHELsP5nwO5loIptUMLG4ZFR9Pub//7OZ73eMMo=;
        b=MJF4vWa/9b+rV7wn6rY6hUcUZiosfjN0u5pMFq4iMKMXQNWrxXz64+cLK+gz49WncI
         2d/B9oNqEmw5vCutIzfKj6DxeIF8wvK/m5gJ9Kkiy+8r23POcynqgg+Q6eKf9LSL8hBh
         6oyleQ3fVN93g7N6LmbPNxludmEyaeQU6ckzGO+ULZjyakUsUuANZKvlOLfPvlCKcKu0
         hCfxuAiwhjrfVzQR8H5hAEHv0boIDJbNoOI0r6vKLiclHRMZxDzYcROw/2J+b6QOWTuJ
         5bscOl40+VMT0yOGrag61fJjD6rOZhSmkHDm/QudQS+W15DY1ITnZrOq1sAvRIudBI3B
         mjYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679038074;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MrJsUHELsP5nwO5loIptUMLG4ZFR9Pub//7OZ73eMMo=;
        b=snIr81tJq2d6JDM6TbiYc5IxzdBcCaStB6Qn4Bhua4+kpLbL768iSTOG/owSihsY82
         xzL7CgxmOqpPJahvC08qILhlTkU/SbD+mo5Q3qLHsaXa94bqUAGJNqMJc8VQWLJUD8Xv
         yA0KOGmMsFvFSAGBZOe/zQzifLwHWyGUXK1fIMpzh3B0I+fcT7iNxNs8n+yQIQMFJl6Y
         1uSsYGJCYfdUGIzWyLEyMJMb/OdhGqsgPnmkw50MW+A8Lc1epgVZ7cEJdx4WLNJQN7TM
         cXOUOmhfwYDTzUcQAL3RuoZ12hpAwyLl5UvPiHJ6xxqtvXY74o8gePTORyPEb96xKk8T
         ml9g==
X-Gm-Message-State: AO0yUKVdgjqU/nKsZ5HFwZu3g08vqRqfS6amKadr0qBQ+Ys3SOU0Jb1C
	ELzJia4MPmbMODH7SvoosFH+MkL64hCrrH8kAGc=
X-Google-Smtp-Source: AK7set8XTqpHAsIDK3be6++UkoS0cimxnChZZF3C+LSPq+bKEXRhG5f99Q4mpe1hPPjpLe/THk9kAsYYN/gIC1N3ctM=
X-Received: by 2002:a2e:9248:0:b0:299:9de5:2f1b with SMTP id
 v8-20020a2e9248000000b002999de52f1bmr1667018ljg.7.1679038074299; Fri, 17 Mar
 2023 00:27:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230317060342.386014-1-f_l_k@t-online.de>
In-Reply-To: <20230317060342.386014-1-f_l_k@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 17 Mar 2023 08:27:43 +0100
Message-ID: <CANNYZj87ZtxwYP3riyMqa6syhbv6CFi+5b+eHn9pmCor-=cumA@mail.gmail.com>
Subject: Re: [RFC][oe-core][PATCH] initscripts: dont use /tmp symlink if ptest
 is enabled
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000fba7a505f7138356"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Mar 2023 07:28:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178742

--000000000000fba7a505f7138356
Content-Type: text/plain; charset="UTF-8"

This is not suitable unfortunately. Having ptest should not be affecting
completely unrelated files. The problem should be solved without using it
as a decision point.

Alex

On Fri 17. Mar 2023 at 7.04, Markus Volk <f_l_k@t-online.de> wrote:

> glib-2.0 ptest will fail if /tmp is a symlink to /var/tmp
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  meta/recipes-core/initscripts/initscripts_1.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb
> b/meta/recipes-core/initscripts/initscripts_1.0.bb
> index 4dc477bb8d..51a90ddf58 100644
> --- a/meta/recipes-core/initscripts/initscripts_1.0.bb
> +++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
> @@ -108,7 +108,7 @@ do_install () {
>                 sed -i -e '\@^d root root 0755 /var/volatile/log none$@
> a\l root root 0755 /var/log /var/volatile/log' \
>                         ${D}${sysconfdir}/default/volatiles/00_core
>         fi
> -       if [ "${VOLATILE_TMP_DIR}" != "yes" ]; then
> +       if [ "${VOLATILE_TMP_DIR}" != "yes" ]  ||
> ${@bb.utils.contains('DISTRO_FEATURES','ptest','true','false',d)}; then
>                 sed -i -e "/\<tmp\>/d"
> ${D}${sysconfdir}/default/volatiles/00_core
>         fi
>         install -m 0755    ${WORKDIR}/dmesg.sh
> ${D}${sysconfdir}/init.d
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#178739):
> https://lists.openembedded.org/g/openembedded-core/message/178739
> Mute This Topic: https://lists.openembedded.org/mt/97667599/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000fba7a505f7138356
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">This is not suitable unfortunately. Having ptest should n=
ot be affecting completely unrelated files. The problem should be solved wi=
thout using it as a decision point.</div><div dir=3D"auto"><br></div><div d=
ir=3D"auto">Alex</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri 17. Mar 2023 at 7.04, Markus Volk &lt;<a href=
=3D"mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(=
204,204,204)">glib-2.0 ptest will fail if /tmp is a symlink to /var/tmp<br>
<br>
Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=
=3D"_blank">f_l_k@t-online.de</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/initscripts/<a href=3D"http://initscripts_1.0.bb" r=
el=3D"noreferrer" target=3D"_blank">initscripts_1.0.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-core/initscripts/<a href=3D"http://initscripts_1.=
0.bb" rel=3D"noreferrer" target=3D"_blank">initscripts_1.0.bb</a> b/meta/re=
cipes-core/initscripts/<a href=3D"http://initscripts_1.0.bb" rel=3D"norefer=
rer" target=3D"_blank">initscripts_1.0.bb</a><br>
index 4dc477bb8d..51a90ddf58 100644<br>
--- a/meta/recipes-core/initscripts/<a href=3D"http://initscripts_1.0.bb" r=
el=3D"noreferrer" target=3D"_blank">initscripts_1.0.bb</a><br>
+++ b/meta/recipes-core/initscripts/<a href=3D"http://initscripts_1.0.bb" r=
el=3D"noreferrer" target=3D"_blank">initscripts_1.0.bb</a><br>
@@ -108,7 +108,7 @@ do_install () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i -e &#39;\@^d=
 root root 0755 /var/volatile/log none$@ a\l root root 0755 /var/log /var/v=
olatile/log&#39; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ${D}${sysconfdir}/default/volatiles/00_core<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;${VOLATILE_TMP_DIR}&quot; !=3D &quot=
;yes&quot; ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;${VOLATILE_TMP_DIR}&quot; !=3D &quot=
;yes&quot; ]=C2=A0 || ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;,&#39;p=
test&#39;,&#39;true&#39;,&#39;false&#39;,d)}; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i -e &quot;/\&=
lt;tmp\&gt;/d&quot; ${D}${sysconfdir}/default/volatiles/00_core<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0755=C2=A0 =C2=A0 ${WORKDIR}/dmesg.s=
h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${D}${sysconfdir}/init.d<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#178739): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/178739" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/178739</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/97667599/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/97667599/1686489</a><br>
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

--000000000000fba7a505f7138356--

