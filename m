Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
 by mx.groups.io with SMTP id smtpd.web10.48.1589477725477234543
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2020 10:35:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=aOucH8Pg;
 spf=pass (domain: gmail.com, ip: 209.85.221.174, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f174.google.com with SMTP id 21so552333vkq.6
        for <openembedded-core@lists.openembedded.org>; Thu, 14 May 2020 10:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ep/nPK6vHhGYzrL6zKwp55HnpbQ7iTcq0Tb6Pv+XEbw=;
        b=aOucH8PgjM4z6Q0nJ1jR1Zln8P70Meh0V+3nqq9FUfgxcgyQZQTn1rfVEj+9mSomQa
         TbrbMTkoDHFKkba9B+bSPrqmIkUOrnWDP9n3h2amE1pLuJ/iRQ4G01HZKPsL8xr5Jg42
         fe84Z/odU1k3iyzbO4iBlbeWHnKwVrbyvjZQ9nLRDykzuz1YDVTW2zL1R2U6zBFmbC/A
         DlgVDqgWVow+TB3/y2KFfzWoz0IuBeQG1gYPfbMo23KJEDwbiCycCqRELj+KyPduwz6S
         nXXyOzZyJHfOCU0ZztRoym3QuKFzgdputBdZGX82tyUBAFknBooj7LvAIqkNTs+mjyn6
         RNvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ep/nPK6vHhGYzrL6zKwp55HnpbQ7iTcq0Tb6Pv+XEbw=;
        b=mnZ2T3yGPq8GvKNQsJYol6abVLJj0pHvkXlZKyGISUjCyr4spNhvBH6AtoZtfKzRF9
         aZLCmrrW5g2z8n1BvLXRI1LA833T14V1wvFy5b9i2tkPuzuIIkyKKSy10chjge4jFbNv
         VnMuoPLNZ0HfotYgEmJQB+qaugzouKB32zrelhwu/9aZzBH9xZEfEl7eh+sxYq/tU84W
         juWA4/Lk41HG1yyILzRIiHLscdJpanoxVwFsHWpegBmIp46ttTe4A8hpQPmM6ZGJPDN3
         nEupTGg8UvY1Z7b2bOmQDiMrVzoGNBsIs6IbyaCQv+zUrDbFZwaucfzwpLwMAzJgVMql
         kSmQ==
X-Gm-Message-State: AOAM532XSDOcO2PdilrIxACvhACn5u6FGcz9EPWT+OkpywFrY+xEydy/
	27TkFvVhsy2cX1jJ8lqAFcyImssD+0FGW09B+j0=
X-Google-Smtp-Source: ABdhPJwqpPljYVOxlM76Ukvfp7Zl2x2iqMpJuk6ZwYHB69ADIRXmNod8A8J+rpKzhQ4ymt8qlsuXuPs2xR65OD0rku8=
X-Received: by 2002:a1f:d0c5:: with SMTP id h188mr4708472vkg.0.1589477724672;
 Thu, 14 May 2020 10:35:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200514142107.20702-1-diego.rondini@kynetics.com> <160EF5579BF06DF2.15154@lists.openembedded.org>
In-Reply-To: <160EF5579BF06DF2.15154@lists.openembedded.org>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Thu, 14 May 2020 19:35:13 +0200
Message-ID: <CANNYZj8hQ_nP8-zRb9VRdQyH-week4FwktLabgDdjvVuhy-LcA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] bmap-tools: update to latest git master
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Diego <diego.rondini@kynetics.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000285c6205a59f1fea"

--000000000000285c6205a59f1fea
Content-Type: text/plain; charset="UTF-8"

Another option is to backport the needed patch.

Alex

On Thu, 14 May 2020 at 19:31, Alexander Kanavin via lists.openembedded.org
<alex.kanavin=gmail.com@lists.openembedded.org> wrote:

> You can't generally update to a random development commit, especially if
> PV stays the same. Please ask upstream to make a new release.
>
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

--000000000000285c6205a59f1fea
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Another option is to backport the needed patch.</div>=
<div><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Thu, 14 May 2020 at 19:31, Alexander K=
anavin via <a href=3D"http://lists.openembedded.org">lists.openembedded.org=
</a> &lt;alex.kanavin=3D<a href=3D"mailto:gmail.com@lists.openembedded.org"=
>gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=
=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>You can&#39;t gener=
ally update to a random development commit, especially if PV stays the same=
. Please ask upstream to make a new release.</div><div><br></div><div>Alex<=
br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gma=
il_attr">On Thu, 14 May 2020 at 16:22, Diego &lt;<a href=3D"mailto:diego.ro=
ndini@kynetics.com" target=3D"_blank">diego.rondini@kynetics.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Update to l=
atest revision of git master to include, among other<br>
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
<br>
</blockquote></div>

--000000000000285c6205a59f1fea--
