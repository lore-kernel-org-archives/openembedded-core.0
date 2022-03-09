Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5D19C433F5
	for <webhook@archiver.kernel.org>; Wed,  9 Mar 2022 06:38:31 +0000 (UTC)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com
 [209.85.221.181])
 by mx.groups.io with SMTP id smtpd.web12.3020.1646807910328241388
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Mar 2022 22:38:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EpYc3pg3;
 spf=pass (domain: gmail.com, ip: 209.85.221.181,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f181.google.com with SMTP id e188so753269vkh.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Mar 2022 22:38:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7OITNpOC6le7usQAwyOxmaP/EBjw+wW9+lLyUTXsEro=;
        b=EpYc3pg3DycZkVSQHUwWWZljM1oU8HTVK7wJmMvzWVvFY7OINEvXf9Q/tvTvFiczeb
         A1Sh+MgA5/ES/4oXtbRhOwwDY6AF01YLn69bspPZ2PHxVIZLUF9An1lhF3pUSe85vxVO
         s3MFXrJH1NjCMpAqAwSj/M/8KjfbstvOnCFWXyDtD9S784vRgd+mUWsfH79R2ChaJgh2
         LybwtHBNDkKy9FDBzMsXhd4hdj1o2xS+SLHu9Vw0sCF/odCkp6k6szDpW7Ym3mpRd0/H
         WThH21aj1OFfgTl5BlwLa4Dc7Amm4v6VaMypoHsRxLyIL6hWvZ2U6x7fuS9yBJOzXBld
         SHYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7OITNpOC6le7usQAwyOxmaP/EBjw+wW9+lLyUTXsEro=;
        b=Sz7BAC182Acj05GDb4zPzXJxFsnfoGtCD6nvNxhiiM44LSzb31+OITU1nA0pE/0wpg
         t3PdzSIx94bWJKuiO0zH8BeYeMUaGce8zQJbqfNm2zocZ4tapekBNI3JELMpQtGIkuBK
         zNZKDiDOPwGAvt9PSPJ2ahimbsawIzLagWkSIFgD6AL6275jqutc0HwPMujS9OUvhLYS
         BBDf0S49SHxXEAzcWp+D4GlIcty//xkxImHtI66Leo+pa1UTsqdYmmQP+wGc6y8zcon2
         H3s9px8zm7bwcHsJqQwGlInu3qJJH5nV2KxtxLQfXax6rgX0iKWv+QhhRi1zR/6vhUJr
         OCBw==
X-Gm-Message-State: AOAM531GEs9kS1sLIXLKZ8w0sHbSxjgvfe9XViN1YNJi3VXxIGGBbWtm
	6t3onTVXFMFpLqKwHPKx/CtImW/h6HbmGEGjQfo=
X-Google-Smtp-Source: 
 ABdhPJyvrghEix8AzpJEz+bwyorfcW2geUP5VYR48LJH2Ot3c+oh80GJ8Gx1Omij7HYBGagG+W7jzf0dqtvOgosJkCk=
X-Received: by 2002:a05:6122:208d:b0:337:7db2:8684 with SMTP id
 i13-20020a056122208d00b003377db28684mr5537514vkd.1.1646807909246; Tue, 08 Mar
 2022 22:38:29 -0800 (PST)
MIME-Version: 1.0
References: <20220309011830.3130440-1-raj.khem@gmail.com>
 <16DAA19DB5E87A22.14238@lists.openembedded.org>
In-Reply-To: <16DAA19DB5E87A22.14238@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 9 Mar 2022 07:38:18 +0100
Message-ID: 
 <CANNYZj-=3wf4HUAP6yTUQBg+qo07XwjxkbN9k=Dqgu9MiCuZTg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] qemu: Fix build when x11 is not in distro
 features
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com
Content-Type: multipart/alternative; boundary="00000000000071abeb05d9c35851"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Mar 2022 06:38:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162948

--00000000000071abeb05d9c35851
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Also, what error specifically are you seeing? How is your build set up?

Alex

On Wed 9. Mar 2022 at 7.11, Alexander Kanavin via lists.openembedded.org
<alex.kanavin=3Dgmail.com@lists.openembedded.org> wrote:

> Why is this issue not seen on autobuilder=E2=80=99s no-x11 job?
>
> Alex
>
> On Wed 9. Mar 2022 at 2.18, Khem Raj <raj.khem@gmail.com> wrote:
>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  meta/recipes-devtools/qemu/qemu_6.2.0.bb | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/meta/recipes-devtools/qemu/qemu_6.2.0.bb
>> b/meta/recipes-devtools/qemu/qemu_6.2.0.bb
>> index 062ed32b015..c7eef0a9d5e 100644
>> --- a/meta/recipes-devtools/qemu/qemu_6.2.0.bb
>> +++ b/meta/recipes-devtools/qemu/qemu_6.2.0.bb
>> @@ -6,6 +6,8 @@ DEPENDS =3D "glib-2.0 zlib pixman bison-native ninja-nat=
ive
>> meson-native"
>>
>>  DEPENDS:append:libc-musl =3D " libucontext"
>>
>> +CFLAGS +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '',
>> '-DEGL_NO_X11=3D1', d)}"
>> +
>>  RDEPENDS:${PN}:class-target +=3D "bash"
>>
>>  EXTRA_OECONF:append:class-target =3D "
>> --target-list=3D${@get_qemu_target_list(d)}"
>> --
>> 2.35.1
>>
>>
>>
>>
>>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#162947):
> https://lists.openembedded.org/g/openembedded-core/message/162947
> Mute This Topic: https://lists.openembedded.org/mt/89652908/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000071abeb05d9c35851
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Also, what error specifically are you seeing? How is your=
 build set up?</div><div dir=3D"auto"><br></div><div dir=3D"auto">Alex</div=
><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
On Wed 9. Mar 2022 at 7.11, Alexander Kanavin via <a href=3D"http://lists.o=
penembedded.org">lists.openembedded.org</a> &lt;alex.kanavin=3D<a href=3D"m=
ailto:gmail.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1=
ex;border-left-color:rgb(204,204,204)"><div dir=3D"auto">Why is this issue =
not seen on autobuilder=E2=80=99s no-x11 job?</div><div dir=3D"auto"><br></=
div><div dir=3D"auto">Alex</div><div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Wed 9. Mar 2022 at 2.18, Khem Raj &lt;<a =
href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1e=
x;border-left-color:rgb(204,204,204)">Signed-off-by: Khem Raj &lt;<a href=
=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;=
<br>
---<br>
=C2=A0meta/recipes-devtools/qemu/<a href=3D"http://qemu_6.2.0.bb" rel=3D"no=
referrer" target=3D"_blank">qemu_6.2.0.bb</a> | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/meta/recipes-devtools/qemu/<a href=3D"http://qemu_6.2.0.bb" re=
l=3D"noreferrer" target=3D"_blank">qemu_6.2.0.bb</a> b/meta/recipes-devtool=
s/qemu/<a href=3D"http://qemu_6.2.0.bb" rel=3D"noreferrer" target=3D"_blank=
">qemu_6.2.0.bb</a><br>
index 062ed32b015..c7eef0a9d5e 100644<br>
--- a/meta/recipes-devtools/qemu/<a href=3D"http://qemu_6.2.0.bb" rel=3D"no=
referrer" target=3D"_blank">qemu_6.2.0.bb</a><br>
+++ b/meta/recipes-devtools/qemu/<a href=3D"http://qemu_6.2.0.bb" rel=3D"no=
referrer" target=3D"_blank">qemu_6.2.0.bb</a><br>
@@ -6,6 +6,8 @@ DEPENDS =3D &quot;glib-2.0 zlib pixman bison-native ninja-n=
ative meson-native&quot;<br>
<br>
=C2=A0DEPENDS:append:libc-musl =3D &quot; libucontext&quot;<br>
<br>
+CFLAGS +=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;x11=
&#39;, &#39;&#39;, &#39;-DEGL_NO_X11=3D1&#39;, d)}&quot;<br>
+<br>
=C2=A0RDEPENDS:${PN}:class-target +=3D &quot;bash&quot;<br>
<br>
=C2=A0EXTRA_OECONF:append:class-target =3D &quot; --target-list=3D${@get_qe=
mu_target_list(d)}&quot;<br>
-- <br>
2.35.1<br>
<br>
<br>
<br>
<br>
</blockquote></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#162947): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/162947" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/162947</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/89652908/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/89652908/1686489</a><br>
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

--00000000000071abeb05d9c35851--

