Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03079C433EF
	for <webhook@archiver.kernel.org>; Thu, 30 Jun 2022 08:10:50 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web09.22559.1656576646274666696
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 01:10:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Q0joJX/t;
 spf=pass (domain: gmail.com, ip: 209.85.208.176,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id bx13so13441248ljb.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 01:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XIgvQf/hvAlOYv3hNWSeSG8DOp4T2yAZ5sHFgI+eX5I=;
        b=Q0joJX/tnuWokmIoU0OZV4E5JJw42rRBGIjN2r6xqrZNx2fj6T4ZTPoVOs6voZmKR0
         LfEs9f87MzPbsFO1J5iK3GLBCwNsAuxShp8IfL1pRuR5QagEarWLA0SVMmFjPfJSD1Nu
         2eCIvTR7TtBX0gDYkXXj7WmIkOltMwoxmLOaBZ3U6J/YDDTep0KFvUx75FjL54kXNjSq
         h9SJ/TfjBB/IR3W1aGIVKyvozVEci6QYzE6EOdfMx38KvIM41GxKJXI0xXsEUKL5/xq3
         bvKmM4+FohICHO3c+gmw74p8Fqwz4+IZytvFAJvnB2gQ/1QnriSDdVpfa5enZ/Eb1VVV
         u84g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XIgvQf/hvAlOYv3hNWSeSG8DOp4T2yAZ5sHFgI+eX5I=;
        b=P5Oe42zFXs+dOppBFlHYevH/ckMKr9r2T1b+sWd3aS0yOPOzIShcnHEF4yxWygxFgh
         dTBdugfG1YLllFtNUcBPtXTB/ZtO+9f6vpYUFc9oWYIsvgDVLH1YOQgr36IY7y14TCMq
         Uz+7LVfWfBqzAeZUKfy5SF9r7DFFib8FFul+uhmiU6ZKTORDnZY8i6iRzuW3Eow71JVy
         NRo/H7zKNAEKiPAO69cnOQtZJwHfcc/OIcxUJMRgn1vJr3noCtKIVtRATeAL7B2ZFCl7
         LxOO2oH7nOUfoVodtJ9z8KtlpOFQjXIayLmCJTTmPVOjJnbhEjaaCizpD3wCSopOGaLU
         VPXA==
X-Gm-Message-State: AJIora82tiBs1leljx5xneURzqlVMnwFruDnZYUEyWQTUVk50iD0/BXk
	meHyIdR8pZ8tWrTyP+8qgFu8nZmGy40frHvJhww=
X-Google-Smtp-Source: 
 AGRyM1semDm8RMTyBAZikBgYNoGh7fpN91xjsiXtqZ+BkHvqgYdsftKCAJb2lxGVZVOIjyPJYWr8lJQdtd2TR8uSUm0=
X-Received: by 2002:a2e:bc1d:0:b0:25b:9667:87b9 with SMTP id
 b29-20020a2ebc1d000000b0025b966787b9mr4073417ljf.91.1656576644429; Thu, 30
 Jun 2022 01:10:44 -0700 (PDT)
MIME-Version: 1.0
References: <1656562773-11393-1-git-send-email-wangmy@fujitsu.com>
 <1656562773-11393-4-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1656562773-11393-4-git-send-email-wangmy@fujitsu.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Thu, 30 Jun 2022 09:10:33 +0100
Message-ID: 
 <CANPvuR=4vnxmJPP2gPEFyatr85g8VkrR9iM-bc_FPNnSwiFDXw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gstreamer1.0: upgrade 1.20.2 -> 1.20.3
To: wangmy <wangmy@fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000006f3f8c05e2a5ce17"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jun 2022 08:10:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167401

--0000000000006f3f8c05e2a5ce17
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi wangmy,

This doesn't work, gstreamer is a framework so when you update one element
you need to update all of them.

Jose

wangmy <wangmy@fujitsu.com> escreveu no dia quinta, 30/06/2022 =C3=A0(s) 05=
:20:

> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../{gstreamer1.0_1.20.2.bb =3D> gstreamer1.0_1.20.3.bb}          | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.20.2.bb =3D>
> gstreamer1.0_1.20.3.bb} (97%)
>
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb
> similarity index 97%
> rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb
> rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb
> index 3aa9aa7048..1f4576c3e1 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb
> @@ -23,7 +23,7 @@ SRC_URI =3D "
> https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
>
> file://0004-tests-add-helper-script-to-run-the-installed_tests.patch;stri=
plevel=3D3
> \
>
> file://0005-tests-remove-gstbin-test_watch_for_state_change-test.patch \
>             "
> -SRC_URI[sha256sum] =3D
> "df24e8792691a02dfe003b3833a51f1dbc6c3331ae625d143b17da939ceb5e0a"
> +SRC_URI[sha256sum] =3D
> "607daf64bbbd5fb18af9d17e21c0d22c4d702fffe83b23cb22d1b1af2ca23a2a"
>
>  PACKAGECONFIG ??=3D "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests',
> '', d)} \
>                     check \
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#167394):
> https://lists.openembedded.org/g/openembedded-core/message/167394
> Mute This Topic: https://lists.openembedded.org/mt/92080526/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000006f3f8c05e2a5ce17
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi wangmy,</div><div><br></div><div>This doesn&#39;t =
work, gstreamer is a framework so when you update one element you need to u=
pdate all of them.</div><div><br></div><div>Jose</div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">wangmy &lt;<a href=3D"mailt=
o:wangmy@fujitsu.com">wangmy@fujitsu.com</a>&gt; escreveu no dia quinta, 30=
/06/2022 =C3=A0(s) 05:20:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Signed-off-by: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.=
com" target=3D"_blank">wangmy@fujitsu.com</a>&gt;<br>
---<br>
=C2=A0.../{<a href=3D"http://gstreamer1.0_1.20.2.bb" rel=3D"noreferrer" tar=
get=3D"_blank">gstreamer1.0_1.20.2.bb</a> =3D&gt; <a href=3D"http://gstream=
er1.0_1.20.3.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0_1.20.3.b=
b</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
=C2=A0rename meta/recipes-multimedia/gstreamer/{<a href=3D"http://gstreamer=
1.0_1.20.2.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0_1.20.2.bb<=
/a> =3D&gt; <a href=3D"http://gstreamer1.0_1.20.3.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">gstreamer1.0_1.20.3.bb</a>} (97%)<br>
<br>
diff --git a/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1=
.0_1.20.2.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0_1.20.2.bb</=
a> b/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0_1.20.=
3.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0_1.20.3.bb</a><br>
similarity index 97%<br>
rename from meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.=
0_1.20.2.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0_1.20.2.bb</a=
><br>
rename to meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0_=
1.20.3.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0_1.20.3.bb</a><=
br>
index 3aa9aa7048..1f4576c3e1 100644<br>
--- a/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0_1.20=
.2.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0_1.20.2.bb</a><br>
+++ b/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0_1.20=
.3.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0_1.20.3.bb</a><br>
@@ -23,7 +23,7 @@ SRC_URI =3D &quot;<a href=3D"https://gstreamer.freedeskto=
p.org/src/gstreamer/gstreamer-$%7BPV%7D.tar.x" rel=3D"noreferrer" target=3D=
"_blank">https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.ta=
r.x</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0004-tests-add-helper-scri=
pt-to-run-the-installed_tests.patch;striplevel=3D3 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0005-tests-remove-gstbin-t=
est_watch_for_state_change-test.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-SRC_URI[sha256sum] =3D &quot;df24e8792691a02dfe003b3833a51f1dbc6c3331ae625=
d143b17da939ceb5e0a&quot;<br>
+SRC_URI[sha256sum] =3D &quot;607daf64bbbd5fb18af9d17e21c0d22c4d702fffe83b2=
3cb22d1b1af2ca23a2a&quot;<br>
<br>
=C2=A0PACKAGECONFIG ??=3D &quot;${@bb.utils.contains(&#39;PTEST_ENABLED&#39=
;, &#39;1&#39;, &#39;tests&#39;, &#39;&#39;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 check=
 \<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#167394): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/167394" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/167394</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/92080526/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/92080526/5052612</a><br>
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

--0000000000006f3f8c05e2a5ce17--

