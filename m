Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E235C47090
	for <webhook@archiver.kernel.org>; Tue, 12 Apr 2022 16:46:40 +0000 (UTC)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com
 [209.85.217.51])
 by mx.groups.io with SMTP id smtpd.web08.7798.1649745930105965849
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Apr 2022 23:45:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ez1YC/Kq;
 spf=pass (domain: gmail.com, ip: 209.85.217.51,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-vs1-f51.google.com with SMTP id e11so15343520vso.7
        for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Apr 2022 23:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Pk7cEbbqUVbXdc+9isCHzf12cyAue4FwMm3LSAm826g=;
        b=Ez1YC/KqO7Jy/HreUXOkWPiSf0+7cvxhRs/i4GW0OQjfnYqJcV0St58GR/2KA3u3tT
         Qeyhj5sm1bQYl/6JGquGETQRbPwcUqgubLizH02kaQDwkO3uNAv719mYdaRjNpRahJWl
         ydv9nvsEQSCiiwzh7E1mKWpcujXxFI4NtfgoXwNMM20+UTSpnFQ4Eqtxkzg+52++wJnc
         QVVUadahSJOfs3HxiHnMjrM8PCp+qKFP8pe8vEt3XialqxrYqXZ9eGhkKqjaaYUsSnel
         j2EtElMD6R47PGaApdCJigjvkrGJpPYyUL+ElbdrOJI9dn9E1Z5kXPQy5zXCG3pctDfC
         SczQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Pk7cEbbqUVbXdc+9isCHzf12cyAue4FwMm3LSAm826g=;
        b=tMHR1ya6L32miCR28xj6MwJe2Q3fOdrl/zTNhxXa6wD5PHUWc3c2MT790LZcMKuFVO
         99TOeTJQdpVMcbojoJcGJZC7ftM30sXSiVM2xdULWeRb0QeMb19ioCUGTcpBjmqtsY1a
         LDGM2avNw2VAWNj1FOwaMdc5IOanM6AY7+WSO4w44xlx+Hi0GFUerzlwPoBJKvXW7516
         fOoY41Ndyx2eiNj9xOiGR2GEEGNnp92o7Gur0qtE7zojsANUP6E+9moCU3Qb2wFQC1N4
         acttuLjZCsCL4ax1ebJSQ/eEZBJOyLxMxjZ5QXKuFo0x2SkLgBXqV3+ph0kDIFrpf/fP
         p7LA==
X-Gm-Message-State: AOAM530+18YfVn95DKpPVkhT2/By5klPIrf+EBxY6SGMOnHcgV9pjsN8
	ZR0Mb2/BxD3E3RQSu8LXPX/rysjXRTPZGuAo6dE=
X-Google-Smtp-Source: 
 ABdhPJyLH1vVsgaf1zAUb21usPLkgZwxjfHTMdG7KP6XGSbn35EH8tfPQSW73arZ4LZaIJJzHFRFOELNjMakJ4t0YNk=
X-Received: by 2002:a05:6102:570f:b0:324:dcb0:d66e with SMTP id
 dg15-20020a056102570f00b00324dcb0d66emr10440299vsb.26.1649745928950; Mon, 11
 Apr 2022 23:45:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220412064015.34597-1-karn.jye.lau@intel.com>
 <16E5131D095207E7.9041@lists.openembedded.org>
In-Reply-To: <16E5131D095207E7.9041@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 12 Apr 2022 08:45:17 +0200
Message-ID: 
 <CA+chaQdfevqSnbXPh71Bo7NqxCXTB-5M-BVhpgAdkNFg3YtQ6w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] icewm:include imlib2-loaders package
To: martin.jansa@gmail.com
Cc: karn.jye.lau@intel.com, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000010977705dc6f68b7"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Apr 2022 16:46:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164254

--00000000000010977705dc6f68b7
Content-Type: text/plain; charset="UTF-8"

Or just add it in the line above and save bitbake some work with the append.

On Tue, Apr 12, 2022 at 8:44 AM Martin Jansa via lists.openembedded.org
<Martin.Jansa=gmail.com@lists.openembedded.org> wrote:

> wrong ML and you probably wanted RDEPENDS:${PN}:append not
> RDEPENDS:append:${PN}
>
> On Tue, Apr 12, 2022 at 8:40 AM <karn.jye.lau@intel.com> wrote:
>
>> From: KARN JYE LAU <karn.jye.lau@intel.com>
>>
>> icewm 2.0.0 above have use imlib2 as default
>> rendering engine.Update icewm  recipe to include
>> the essential packages for icewm to work properly.
>>
>> Signed-off-by: KARN JYE LAU <karn.jye.lau@intel.com>
>> ---
>>  meta-oe/recipes-extended/icewm/icewm_2.9.0.bb | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/meta-oe/recipes-extended/icewm/icewm_2.9.0.bb
>> b/meta-oe/recipes-extended/icewm/icewm_2.9.0.bb
>> index dac025de7..f28ab2fa0 100644
>> --- a/meta-oe/recipes-extended/icewm/icewm_2.9.0.bb
>> +++ b/meta-oe/recipes-extended/icewm/icewm_2.9.0.bb
>> @@ -24,6 +24,7 @@ DEPENDS = "asciidoc-native fontconfig fribidi
>> gdk-pixbuf imlib2       libxft libxpm li
>>      libxfixes"
>>  DEPENDS:append = " qemu-native"
>>  RDEPENDS:${PN} = "perl fribidi"
>> +RDEPENDS:append:${PN} = " imlib2 imlib2-loaders"
>>
>>  do_compile:prepend:class-target() {
>>
>> --
>> 2.25.1
>>
>>
>>
>>
>>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#164253):
> https://lists.openembedded.org/g/openembedded-core/message/164253
> Mute This Topic: https://lists.openembedded.org/mt/90413099/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> Martin.Jansa@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000010977705dc6f68b7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Or just add it in the line above and save bitbake some wor=
k with the append.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Tue, Apr 12, 2022 at 8:44 AM Martin Jansa via <a href=
=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;Martin.Ja=
nsa=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.o=
penembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex"><div dir=3D"ltr">wrong ML and you probably wanted RDEPENDS:$=
{PN}:append not RDEPENDS:append:${PN}</div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Tue, Apr 12, 2022 at 8:40 AM &lt;<a=
 href=3D"mailto:karn.jye.lau@intel.com" target=3D"_blank">karn.jye.lau@inte=
l.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">From: KARN JYE LAU &lt;<a href=3D"mailto:karn.jye.lau@intel.com" targe=
t=3D"_blank">karn.jye.lau@intel.com</a>&gt;<br>
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
<br>
<br>
</blockquote></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#164253): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/164253" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/164253</a><br>
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

--00000000000010977705dc6f68b7--

