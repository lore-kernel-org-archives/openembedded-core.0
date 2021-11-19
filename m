Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A019C433EF
	for <webhook@archiver.kernel.org>; Fri, 19 Nov 2021 11:39:30 +0000 (UTC)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com
 [209.85.222.48])
 by mx.groups.io with SMTP id smtpd.web08.7691.1637321968999249243
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Nov 2021 03:39:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=X1G+Psho;
 spf=pass (domain: gmail.com, ip: 209.85.222.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f48.google.com with SMTP id p37so20559173uae.8
        for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Nov 2021 03:39:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HAJrnEm8iNTULSli5MyYyx9TJoye7OSAOgvsBHKjq6w=;
        b=X1G+PshoFgsW/CSdmTbXjvBGtKf6Grcd/Iv9bfZuKFYU8PHS/x5EWcMVzVxrDErcyr
         7oqyIjCQZrhkP38E1vQK3MWQZSCotor0TMi99CyW7oJFXss2i36Z8Qe73M6z9xVh5RbW
         8/EU8lwo3zbkUObnOpIIJmoPd+DavW2VULgsh4J4BICxaSfsRE7sZdWbeyPh4wcE1kw2
         uHTLI7970T4iofaA9/Lnp643IbZbYl43U/idoqiQzH8Me9U22fsI0TQmbNcK5eRCIYWG
         EQOvq1FSdq4xnWYpu930hZwHaBeMAixq5in3qKmOtHrjZt+agLHnWFiTd6cWc3kUu5CU
         az/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HAJrnEm8iNTULSli5MyYyx9TJoye7OSAOgvsBHKjq6w=;
        b=DgPPEfr4jImOwS06YTjXzzYFYAj0t2Brswii9ioxH2qoTaQYINaaGixeeeKNBGfAfa
         76cUd3X0u1DQD7aRkG/6StPkhgKCJ1bVFrBA/SGRzwkJdCXr8krBStBDNeU/K3JYy+ly
         v06+0kmhBArzV54f2IxCjk0Pme5E4eA/nkoBV1TMdffNnYKnRBk/m/RbZCE+eJDsjK6q
         /xVLo65pteniI64Pk3OM3rDwLy+kX9hQpoM2Wgva5b+SQdEVh+Vy44IbOgiC5CvXbpBI
         Dc58tI/PJgJeVTQbTeH6lO9cqTHfQMeNSYc5V0YcSzR6jNCKSuT13MNg/i56NWLA/KL9
         TQGg==
X-Gm-Message-State: AOAM5337Ekc0oXS8J91LjS8pOQ6XqLnXEK8FgIxtX+geRH/63eOIMRgf
	ImkkC6+qk1pxhVozg114c6SjmmpATPGHx+PJYSQ=
X-Google-Smtp-Source: 
 ABdhPJz+gXpQh1jwOsY31iv8VkbCHkL0pyrpxNdKFYlq++gKxCrZMRXlxhmDiWUSRQ+2VZoXSbB0LsLL5zzTYMU/7xY=
X-Received: by 2002:a67:ca8f:: with SMTP id a15mr86327631vsl.18.1637321968071;
 Fri, 19 Nov 2021 03:39:28 -0800 (PST)
MIME-Version: 1.0
References: <20211117123201.111905-1-luca.boccassi@gmail.com>
 <20211119113429.502652-1-luca.boccassi@gmail.com>
 <20211119113429.502652-7-luca.boccassi@gmail.com>
In-Reply-To: <20211119113429.502652-7-luca.boccassi@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 19 Nov 2021 12:39:16 +0100
Message-ID: 
 <CANNYZj9Hf-fFaXDScePBNQ8vdoJ9zhZWTgaNU7AiMtkPr7fzJA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 7/7] systemd: add nativesdk
To: Luca Bocassi <luca.boccassi@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
 paul.eggleton@microsoft.com
Content-Type: multipart/alternative; boundary="0000000000004a3a7605d122ba60"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Nov 2021 11:39:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158516

--0000000000004a3a7605d122ba60
Content-Type: text/plain; charset="UTF-8"

Once again, I do not want this accepted in oe-core, not until there's
equivalent native functionality.

Alex

On Fri, 19 Nov 2021 at 12:35, Luca Bocassi <luca.boccassi@gmail.com> wrote:

> From: Luca Boccassi <luca.boccassi@microsoft.com>
>
> Allows using tools like systemd-analyze at build time and in
> CI systems
>
> Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> ---
>  meta/recipes-core/systemd/systemd-conf_1.0.bb    | 2 ++
>  meta/recipes-core/systemd/systemd-serialgetty.bb | 2 ++
>  meta/recipes-core/systemd/systemd_249.5.bb       | 2 ++
>  3 files changed, 6 insertions(+)
>
> diff --git a/meta/recipes-core/systemd/systemd-conf_1.0.bb
> b/meta/recipes-core/systemd/systemd-conf_1.0.bb
> index 61ce7939d3..84de4d17cf 100644
> --- a/meta/recipes-core/systemd/systemd-conf_1.0.bb
> +++ b/meta/recipes-core/systemd/systemd-conf_1.0.bb
> @@ -41,3 +41,5 @@ FILES:${PN} = "\
>      ${systemd_unitdir}/system.conf.d/ \
>      ${systemd_unitdir}/network/ \
>  "
> +
> +BBCLASSEXTEND = "nativesdk"
> diff --git a/meta/recipes-core/systemd/systemd-serialgetty.bb
> b/meta/recipes-core/systemd/systemd-serialgetty.bb
> index 7ca951cdbd..f877e6ad18 100644
> --- a/meta/recipes-core/systemd/systemd-serialgetty.bb
> +++ b/meta/recipes-core/systemd/systemd-serialgetty.bb
> @@ -50,3 +50,5 @@ FILES:${PN} = "${systemd_system_unitdir}/*.service
> ${sysconfdir}"
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>
>  ALLOW_EMPTY:${PN} = "1"
> +
> +BBCLASSEXTEND = "nativesdk"
> diff --git a/meta/recipes-core/systemd/systemd_249.5.bb
> b/meta/recipes-core/systemd/systemd_249.5.bb
> index 2928a85c93..445a50b1e3 100644
> --- a/meta/recipes-core/systemd/systemd_249.5.bb
> +++ b/meta/recipes-core/systemd/systemd_249.5.bb
> @@ -773,6 +773,8 @@ ALTERNATIVE_TARGET[runlevel] =
> "${base_bindir}/systemctl"
>  ALTERNATIVE_LINK_NAME[runlevel] = "${base_sbindir}/runlevel"
>  ALTERNATIVE_PRIORITY[runlevel] ?= "300"
>
> +BBCLASSEXTEND = "nativesdk"
> +
>  # Nothing picks up /var in the nativesdk case
>  do_install_append_class-nativesdk () {
>         rm -rf ${D}/var
> --
> 2.30.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#158513):
> https://lists.openembedded.org/g/openembedded-core/message/158513
> Mute This Topic: https://lists.openembedded.org/mt/87165499/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000004a3a7605d122ba60
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Once again, I do not want this accepted in oe-core, n=
ot until there&#39;s equivalent native functionality.</div><div><br></div><=
div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Fri, 19 Nov 2021 at 12:35, Luca Bocassi &lt;<a href=3D=
"mailto:luca.boccassi@gmail.com">luca.boccassi@gmail.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">From: Luca Boccassi=
 &lt;<a href=3D"mailto:luca.boccassi@microsoft.com" target=3D"_blank">luca.=
boccassi@microsoft.com</a>&gt;<br>
<br>
Allows using tools like systemd-analyze at build time and in<br>
CI systems<br>
<br>
Signed-off-by: Luca Boccassi &lt;<a href=3D"mailto:luca.boccassi@microsoft.=
com" target=3D"_blank">luca.boccassi@microsoft.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/systemd/<a href=3D"http://systemd-conf_1.0.bb" rel=
=3D"noreferrer" target=3D"_blank">systemd-conf_1.0.bb</a>=C2=A0 =C2=A0 | 2 =
++<br>
=C2=A0meta/recipes-core/systemd/<a href=3D"http://systemd-serialgetty.bb" r=
el=3D"noreferrer" target=3D"_blank">systemd-serialgetty.bb</a> | 2 ++<br>
=C2=A0meta/recipes-core/systemd/<a href=3D"http://systemd_249.5.bb" rel=3D"=
noreferrer" target=3D"_blank">systemd_249.5.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 2 ++<br>
=C2=A03 files changed, 6 insertions(+)<br>
<br>
diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd-conf_1.0.b=
b" rel=3D"noreferrer" target=3D"_blank">systemd-conf_1.0.bb</a> b/meta/reci=
pes-core/systemd/<a href=3D"http://systemd-conf_1.0.bb" rel=3D"noreferrer" =
target=3D"_blank">systemd-conf_1.0.bb</a><br>
index 61ce7939d3..84de4d17cf 100644<br>
--- a/meta/recipes-core/systemd/<a href=3D"http://systemd-conf_1.0.bb" rel=
=3D"noreferrer" target=3D"_blank">systemd-conf_1.0.bb</a><br>
+++ b/meta/recipes-core/systemd/<a href=3D"http://systemd-conf_1.0.bb" rel=
=3D"noreferrer" target=3D"_blank">systemd-conf_1.0.bb</a><br>
@@ -41,3 +41,5 @@ FILES:${PN} =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${systemd_unitdir}/system.conf.d/ \<br>
=C2=A0 =C2=A0 =C2=A0${systemd_unitdir}/network/ \<br>
=C2=A0&quot;<br>
+<br>
+BBCLASSEXTEND =3D &quot;nativesdk&quot;<br>
diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd-serialgett=
y.bb" rel=3D"noreferrer" target=3D"_blank">systemd-serialgetty.bb</a> b/met=
a/recipes-core/systemd/<a href=3D"http://systemd-serialgetty.bb" rel=3D"nor=
eferrer" target=3D"_blank">systemd-serialgetty.bb</a><br>
index 7ca951cdbd..f877e6ad18 100644<br>
--- a/meta/recipes-core/systemd/<a href=3D"http://systemd-serialgetty.bb" r=
el=3D"noreferrer" target=3D"_blank">systemd-serialgetty.bb</a><br>
+++ b/meta/recipes-core/systemd/<a href=3D"http://systemd-serialgetty.bb" r=
el=3D"noreferrer" target=3D"_blank">systemd-serialgetty.bb</a><br>
@@ -50,3 +50,5 @@ FILES:${PN} =3D &quot;${systemd_system_unitdir}/*.service=
 ${sysconfdir}&quot;<br>
=C2=A0PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;<br>
<br>
=C2=A0ALLOW_EMPTY:${PN} =3D &quot;1&quot;<br>
+<br>
+BBCLASSEXTEND =3D &quot;nativesdk&quot;<br>
diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd_249.5.bb" =
rel=3D"noreferrer" target=3D"_blank">systemd_249.5.bb</a> b/meta/recipes-co=
re/systemd/<a href=3D"http://systemd_249.5.bb" rel=3D"noreferrer" target=3D=
"_blank">systemd_249.5.bb</a><br>
index 2928a85c93..445a50b1e3 100644<br>
--- a/meta/recipes-core/systemd/<a href=3D"http://systemd_249.5.bb" rel=3D"=
noreferrer" target=3D"_blank">systemd_249.5.bb</a><br>
+++ b/meta/recipes-core/systemd/<a href=3D"http://systemd_249.5.bb" rel=3D"=
noreferrer" target=3D"_blank">systemd_249.5.bb</a><br>
@@ -773,6 +773,8 @@ ALTERNATIVE_TARGET[runlevel] =3D &quot;${base_bindir}/s=
ystemctl&quot;<br>
=C2=A0ALTERNATIVE_LINK_NAME[runlevel] =3D &quot;${base_sbindir}/runlevel&qu=
ot;<br>
=C2=A0ALTERNATIVE_PRIORITY[runlevel] ?=3D &quot;300&quot;<br>
<br>
+BBCLASSEXTEND =3D &quot;nativesdk&quot;<br>
+<br>
=C2=A0# Nothing picks up /var in the nativesdk case<br>
=C2=A0do_install_append_class-nativesdk () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -rf ${D}/var<br>
-- <br>
2.30.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#158513): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/158513" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/158513</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/87165499/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/87165499/1686489</a><br>
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

--0000000000004a3a7605d122ba60--

