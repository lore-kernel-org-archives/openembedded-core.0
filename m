Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
 by mx.groups.io with SMTP id smtpd.web12.949.1589490000041207333
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2020 14:00:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kynetics-com.20150623.gappssmtp.com header.s=20150623 header.b=gGT50dtU;
 spf=neutral (domain: kynetics.com, ip: 209.85.218.65, mailfrom: diego.rondini@kynetics.com)
Received: by mail-ej1-f65.google.com with SMTP id n17so126606ejh.7
        for <openembedded-core@lists.openembedded.org>; Thu, 14 May 2020 13:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kynetics-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=anQC8gDm1ylLzJK7/aqxOnqlDnflratHKFtslcWfIkg=;
        b=gGT50dtUyxr9j2alxWQWbYB52/t+pfl8vTQsMqnbKJAHc6HR79M64FBqGroncdO6zu
         LuVe715ZY5kDPQAZP3xQB4HXqtdH2sCS3P4Uk4gL53SzJqfew8SKkSm4tDjSmDAfXJSg
         KY3arooQsbiPLMBGL86toAUVfXF3wFyFQlp4kxymfmmnVGN4/vkquKeosDyy6lUOaYhz
         h6lP5Fvn0xLyBvVWwZRmNRW+F8IDk6OqW9+MUfDP8/WzeZCG4Ne332Sdjy82rVtlCp2S
         qzzdKqQAtk5H6IfIKRVsRkQ0IBOgO4YeYvuvBESB7LZ+XNk4rWJBVpwoTIt+u0g7+MH9
         UqiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=anQC8gDm1ylLzJK7/aqxOnqlDnflratHKFtslcWfIkg=;
        b=pvtvuO7n1dXdvVsHk5nHfg7wLATVXS8orPdXzPbZwWr0cfXzKY9VM/c4ZAvukAHXqX
         7S0kKpgF32bQell7Gkft7bK4iIs17jtskSrXQZFzxaVA5fxuhe+v3oXhtAqPVV/Q6SyG
         PL50L4OFXwJF02Njf9joorcijjSapuolbMxAxbFWv3f7ERn2Hu4i99UR+aiS6XTWEq7q
         EwANrLTZBH7uy48eg0pObtLw07l1VclBLJddSB3s7mhQsimp7cYpZ9tgG5jj3q5xN8Af
         WEx4KkDAKOPnt/Sa8/Yxzer45uXTxj+vg6whyBpEDd+Zm1ivorwu9qUgzwoLeBLj947o
         LCGQ==
X-Gm-Message-State: AOAM532gEyfKKNFiWZuRl+IFQY8f0T8iTeGBfleCVN7xvQybq/HgaCya
	fOaQSrHBwqSleU7WNcUx6+beqthkfNO2Htp/2uhCEQ==
X-Google-Smtp-Source: ABdhPJzZjCt4SODPZ2TjG46VsiUhE8I7ur1UQPsgBM34WpwK26JlR5LgatsRvwPnoEgT+1vu5TMOJViyrH6SYDH0X88=
X-Received: by 2002:a17:906:c155:: with SMTP id dp21mr5993301ejc.92.1589489998508;
 Thu, 14 May 2020 13:59:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200514142107.20702-1-diego.rondini@kynetics.com> <CANNYZj8_gXYNTewvCX3TFp5nj9LP6+cZfKYgdBEF9Y_F_U2S_A@mail.gmail.com>
In-Reply-To: <CANNYZj8_gXYNTewvCX3TFp5nj9LP6+cZfKYgdBEF9Y_F_U2S_A@mail.gmail.com>
From: "Diego" <diego.rondini@kynetics.com>
Date: Thu, 14 May 2020 22:59:47 +0200
Message-ID: <CAMfw5YofhKNfDTmSAKf+Xa=jU49F4FedfZsyYBdJKWv3c4wgwA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] bmap-tools: update to latest git master
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000bc58f805a5a1fa2c"

--000000000000bc58f805a5a1fa2c
Content-Type: text/plain; charset="UTF-8"

Hi Alexander,

On Thu, May 14, 2020 at 7:31 PM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> You can't generally update to a random development commit, especially if
> PV stays the same. Please ask upstream to make a new release.
>
>
Thank you for your feedback, I understand your point.
The odd thing is that the situation is already broken, as what's in oe-core
master right now is not bmap-tools release 3.5, but some "random
development commit" in between 3.5 and current master:
http://git.openembedded.org/openembedded-core/commit/meta/recipes-support/bmap-tools?id=3fbee26af2f3263180f75652b5dd6e50adb1d8fe

https://github.com/intel/bmap-tools/commits/master
Release 3.5:
https://github.com/intel/bmap-tools/commit/14b411a65c371e273fe599bee9e52bd9f9b751e1
Commit in oe-core:
https://github.com/intel/bmap-tools/commit/db7087b883bf52cbff063ad17a41cc1cbb85104d

What do you suggest?

Thanks
Diego Rondini


> Alex
>
> On Thu, 14 May 2020 at 16:22, Diego <diego.rondini@kynetics.com> wrote:
>
>> Update to latest revision of git master to include, among other
>> improvements, support for zstd compression format.
>>
>> Signed-off-by: Diego Rondini <diego.rondini@kynetics.com>
>> ---
>>  meta/recipes-support/bmap-tools/bmap-tools_3.5.bb | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-support/bmap-tools/bmap-tools_3.5.bb
>> b/meta/recipes-support/bmap-tools/bmap-tools_3.5.bb
>> index 7c4db85b32..694c5f09be 100644
>> --- a/meta/recipes-support/bmap-tools/bmap-tools_3.5.bb
>> +++ b/meta/recipes-support/bmap-tools/bmap-tools_3.5.bb
>> @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =
>> "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>>
>>  SRC_URI = "git://github.com/intel/${BPN}
>> <http://github.com/intel/$%7BBPN%7D>"
>>
>> -SRCREV = "db7087b883bf52cbff063ad17a41cc1cbb85104d"
>> +SRCREV = "a17f0e3ff8669dd3b1c44a741ae4f8162155faed"
>>  S = "${WORKDIR}/git"
>>  PV .= "+git${SRCPV}"
>>
>> --
>> 2.21.3
>>
>> 
>>
>

--000000000000bc58f805a5a1fa2c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Alexander,<br></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 14, 2020 at =
7:31 PM Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">ale=
x.kanavin@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex"><div dir=3D"ltr"><div>You can&#39;t generally update to =
a random development commit, especially if PV stays the same. Please ask up=
stream to make a new release.</div><div><br></div></div></blockquote><div><=
br></div><div>Thank you for your feedback, I understand your point.</div><d=
iv>The odd thing is that the situation is already broken, as what&#39;s in =
oe-core master right now is not bmap-tools release 3.5, but some &quot;rand=
om development commit&quot; in between 3.5 and current master:</div><div><a=
 href=3D"http://git.openembedded.org/openembedded-core/commit/meta/recipes-=
support/bmap-tools?id=3D3fbee26af2f3263180f75652b5dd6e50adb1d8fe">http://gi=
t.openembedded.org/openembedded-core/commit/meta/recipes-support/bmap-tools=
?id=3D3fbee26af2f3263180f75652b5dd6e50adb1d8fe</a></div><div><br></div><div=
><a href=3D"https://github.com/intel/bmap-tools/commits/master">https://git=
hub.com/intel/bmap-tools/commits/master</a></div><div>Release 3.5:<br><a hr=
ef=3D"https://github.com/intel/bmap-tools/commit/14b411a65c371e273fe599bee9=
e52bd9f9b751e1">https://github.com/intel/bmap-tools/commit/14b411a65c371e27=
3fe599bee9e52bd9f9b751e1</a></div><div>Commit in oe-core:</div><div><a href=
=
=3D"https://github.com/intel/bmap-tools/commit/db7087b883bf52cbff063ad17a4=
1cc1cbb85104d">https://github.com/intel/bmap-tools/commit/db7087b883bf52cbf=
f063ad17a41cc1cbb85104d</a></div><div><br></div><div>What do you suggest?</=
div><div><br></div><div>Thanks<br></div><div>Diego Rondini</div><div>=C2=A0=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><d=
iv></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Thu, 14 May 2020 at 16:22, Diego &lt;<a h=
ref=3D"mailto:diego.rondini@kynetics.com" target=3D"_blank">diego.rondini@k=
ynetics.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">Update to latest revision of git master to include, among other=
<br>
improvements, support for zstd compression format.<br>
<br>
Signed-off-by: Diego Rondini &lt;<a href=3D"mailto:diego.rondini@kynetics.=
com" target=3D"_blank">diego.rondini@kynetics.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-support/bmap-tools/<a href=3D"http://bmap-tools_3.5.bb"=
 rel=3D"noreferrer" target=3D"_blank">bmap-tools_3.5.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-support/bmap-tools/<a href=3D"http://bmap-tools_=
3.5.bb" rel=3D"noreferrer" target=3D"_blank">bmap-tools_3.5.bb</a> b/meta/r=
ecipes-support/bmap-tools/<a href=3D"http://bmap-tools_3.5.bb" rel=3D"noref=
errer" target=3D"_blank">bmap-tools_3.5.bb</a><br>
index 7c4db85b32..694c5f09be 100644<br>
--- a/meta/recipes-support/bmap-tools/<a href=3D"http://bmap-tools_3.5.bb"=
 rel=3D"noreferrer" target=3D"_blank">bmap-tools_3.5.bb</a><br>
+++ b/meta/recipes-support/bmap-tools/<a href=3D"http://bmap-tools_3.5.bb"=
 rel=3D"noreferrer" target=3D"_blank">bmap-tools_3.5.bb</a><br>
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Db234ee4d=
69f5fce4486a80fdaf4a4263&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/intel/$%7BBPN%7=
D" rel=3D"noreferrer" target=3D"_blank">github.com/intel/${BPN}</a>&quot;<b=
r>
<br>
-SRCREV =3D &quot;db7087b883bf52cbff063ad17a41cc1cbb85104d&quot;<br>
+SRCREV =3D &quot;a17f0e3ff8669dd3b1c44a741ae4f8162155faed&quot;<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
=C2=A0PV .=3D &quot;+git${SRCPV}&quot;<br>
<br>
-- <br>
2.21.3<br>
<br>
<br>
</blockquote></div>
</blockquote></div><br clear=3D"all"><br></div>

--000000000000bc58f805a5a1fa2c--
