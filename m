Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B94CACDB46E
	for <webhook@archiver.kernel.org>; Thu, 12 Oct 2023 12:24:11 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web11.9759.1697113449304645348
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Oct 2023 05:24:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=A5OCqsb1;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2c3f0c68e5dso10550181fa.1
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Oct 2023 05:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697113447; x=1697718247; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sqjK9adWhFcN/SifewGy+liBwxplmmgkDNcTtyP4Uis=;
        b=A5OCqsb1U8fXan6v4C0NvTIh6v4DLGOc0O4C3hp6DHvLyHCAhUzBwU+RqYgU+uGcbP
         cQ1F4HuBr3vZv+IZ8XP9CFRKMkzkHSN9NEe55Yfwb5yNfAomcdzYyfwfIHUMMFxFWQSN
         m8+xYao7e1Wm82DDwrn1iDTVdiXmgXxcg9QKSQkJXgxIXoltN/MAxPWQ67vDz0mjHcqh
         /qzZ5rYEJLEG8l4XVNyxdALIotSSz8bnRIHclFcSoAmwwpK7ogZQQydImGLOmgXHa2H+
         H7odl16sT6896RjkxrNTR1dQizkrgJdBbKA87qAfQH4Euq/K15NbBvcQNkH9yDvogukA
         Mxkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697113447; x=1697718247;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sqjK9adWhFcN/SifewGy+liBwxplmmgkDNcTtyP4Uis=;
        b=r3urxQYW5ipgLSv4/Jxcj7YWGVoiFsX4sRYOlF8cnQ8O3HWI2rjJbDDWKA2WyulzkN
         gMIylNxXuAXcQrzW9tpLm2wwWecMNIXyTwLa6GDR7ic3Ma4+Xac02KvSmnTfttgkej1y
         uvEDgyHp04YeOoOLniLUvmauP6fmSzlmfsjLgSJetJf5TVptaN8ObTsiZzLVSWbfUyB6
         UGFOHuPuAuWOZgSoPJvjI2Gli9oB1s4tWWPWUnBHPmwF5m6QIUzFbnDmQyQ4TRf+G4RD
         tB2DyeR7+5mDM1XwUsX2f5jgY/rzepPQvFNhiNOagZBzReHHPdWlrv0Oaw411DvxwRFn
         OWnA==
X-Gm-Message-State: AOJu0YxodLmtjdfDOPfCDhwq1P6upIBWdmLfFUqPJ1W3gNpJF04m3LOU
	P4vNGsJ+6sjQViZjc/BzOohPiohOpRReJZ8D2dXACIay
X-Google-Smtp-Source: AGHT+IGvk9zCUepQfD7smId4yUGv3tH44l38rLumEMAsr6koBCQAsFTQtDAXofoo7g7fxlPtVhJQsQ6fupkCasMu/WU=
X-Received: by 2002:a2e:a0c8:0:b0:2b9:f13b:613c with SMTP id
 f8-20020a2ea0c8000000b002b9f13b613cmr21311628ljm.2.1697113446987; Thu, 12 Oct
 2023 05:24:06 -0700 (PDT)
MIME-Version: 1.0
References: <0970d630a7876bb902557710603578d0d82d8047.1697113042.git.joerg.sommer@navimatix.de>
In-Reply-To: <0970d630a7876bb902557710603578d0d82d8047.1697113042.git.joerg.sommer@navimatix.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 12 Oct 2023 14:23:56 +0200
Message-ID: <CANNYZj9NNwEpNwi3ioWQ+7bmWvq7Q24P_ZCUopjW51NdGo==Mg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libtirpc: Support ipv6 in DISTRO_FEATURES
To: joerg.sommer@navimatix.de
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000026ba7b060784043a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Oct 2023 12:24:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188994

--00000000000026ba7b060784043a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

If netconfig file comes from the upstream source, then it should be
correctly patched or dynamically formed at that point, and not after the
fact at installation. Why aren=E2=80=99t the ipv6 enable/disable options ta=
king
care of it?

Alex

On Thu 12. Oct 2023 at 14.17, J=C3=B6rg Sommer via lists.openembedded.org
<joerg.sommer=3Dnavimatix.de@lists.openembedded.org> wrote:

> If the ipv6 feature for the distribution is not set, the package should n=
ot
> contain settings for ipv6. This makes rpcbind doesn't try to bind to a IP=
v6
> socket, and complain that this fails.
>
> Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
> ---
>  meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb
> b/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb
> index 6980135a92..14db4a5eda 100644
> --- a/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb
> +++ b/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb
> @@ -20,8 +20,20 @@ inherit autotools pkgconfig
>
>  EXTRA_OECONF =3D "--disable-gssapi"
>
> +PACKAGECONFIG ??=3D " \
> +    ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} \
> +"
> +PACKAGECONFIG[ipv6] =3D "--enable-ipv6,--disable-ipv6"
> +
>  do_install:append() {
> -       test -e ${D}${sysconfdir}/netconfig && chown root:root
> ${D}${sysconfdir}/netconfig
> +       if test -e ${D}${sysconfdir}/netconfig
> +       then
> +               if ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6',
> 'false', 'true', d)}
> +               then
> +                       sed -i '/^tcp6\|^udp6/d'
> ${D}${sysconfdir}/netconfig
> +               fi
> +               chown root:root ${D}${sysconfdir}/netconfig
> +       fi
>  }
>
>  BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#188993):
> https://lists.openembedded.org/g/openembedded-core/message/188993
> Mute This Topic: https://lists.openembedded.org/mt/101916628/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000026ba7b060784043a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">If netconfig file comes from the upstream source, then it=
 should be correctly patched or dynamically formed at that point, and not a=
fter the fact at installation. Why aren=E2=80=99t the ipv6 enable/disable o=
ptions taking care of it?</div><div dir=3D"auto"><br></div><div dir=3D"auto=
">Alex</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Thu 12. Oct 2023 at 14.17, J=C3=B6rg Sommer via <a href=3D"ht=
tp://lists.openembedded.org">lists.openembedded.org</a> &lt;joerg.sommer=3D=
<a href=3D"mailto:navimatix.de@lists.openembedded.org">navimatix.de@lists.o=
penembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:so=
lid;padding-left:1ex;border-left-color:rgb(204,204,204)">If the ipv6 featur=
e for the distribution is not set, the package should not<br>
contain settings for ipv6. This makes rpcbind doesn&#39;t try to bind to a =
IPv6<br>
socket, and complain that this fails.<br>
<br>
Signed-off-by: J=C3=B6rg Sommer &lt;<a href=3D"mailto:joerg.sommer@navimati=
x.de" target=3D"_blank">joerg.sommer@navimatix.de</a>&gt;<br>
---<br>
=C2=A0meta/recipes-extended/libtirpc/<a href=3D"http://libtirpc_1.3.2.bb" r=
el=3D"noreferrer" target=3D"_blank">libtirpc_1.3.2.bb</a> | 14 ++++++++++++=
+-<br>
=C2=A01 file changed, 13 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-extended/libtirpc/<a href=3D"http://libtirpc_1.3.=
2.bb" rel=3D"noreferrer" target=3D"_blank">libtirpc_1.3.2.bb</a> b/meta/rec=
ipes-extended/libtirpc/<a href=3D"http://libtirpc_1.3.2.bb" rel=3D"noreferr=
er" target=3D"_blank">libtirpc_1.3.2.bb</a><br>
index 6980135a92..14db4a5eda 100644<br>
--- a/meta/recipes-extended/libtirpc/<a href=3D"http://libtirpc_1.3.2.bb" r=
el=3D"noreferrer" target=3D"_blank">libtirpc_1.3.2.bb</a><br>
+++ b/meta/recipes-extended/libtirpc/<a href=3D"http://libtirpc_1.3.2.bb" r=
el=3D"noreferrer" target=3D"_blank">libtirpc_1.3.2.bb</a><br>
@@ -20,8 +20,20 @@ inherit autotools pkgconfig<br>
<br>
=C2=A0EXTRA_OECONF =3D &quot;--disable-gssapi&quot;<br>
<br>
+PACKAGECONFIG ??=3D &quot; \<br>
+=C2=A0 =C2=A0 ${@bb.utils.filter(&#39;DISTRO_FEATURES&#39;, &#39;ipv6&#39;=
, d)} \<br>
+&quot;<br>
+PACKAGECONFIG[ipv6] =3D &quot;--enable-ipv6,--disable-ipv6&quot;<br>
+<br>
=C2=A0do_install:append() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0test -e ${D}${sysconfdir}/netconfig &amp;&amp; =
chown root:root ${D}${sysconfdir}/netconfig<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if test -e ${D}${sysconfdir}/netconfig<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ${@bb.utils.cont=
ains(&#39;DISTRO_FEATURES&#39;, &#39;ipv6&#39;, &#39;false&#39;, &#39;true&=
#39;, d)}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0sed -i &#39;/^tcp6\|^udp6/d&#39; ${D}${sysconfdir}/netconfig<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0chown root:root ${D=
}${sysconfdir}/netconfig<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0}<br>
<br>
=C2=A0BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#188993): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/188993" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/188993</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/101916628/168=
6489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/101916628/1686489</a><br>
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

--00000000000026ba7b060784043a--

