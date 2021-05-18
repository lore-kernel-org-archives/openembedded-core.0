Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
 by mx.groups.io with SMTP id smtpd.web09.6221.1621330839154198172
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 May 2021 02:40:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nlO+3+D5;
 spf=pass (domain: gmail.com, ip: 209.85.221.182, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f182.google.com with SMTP id n74so1929170vkc.6
        for <openembedded-core@lists.openembedded.org>; Tue, 18 May 2021 02:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=a7GqXq/4eDI+3FPGfzPIPZJHFpPsXYCPt5JYFdkJcQo=;
        b=nlO+3+D5pztgsO3D94xn/n2gtedXsf/ds58bZa11Z72a96ox71bpKL3o38rdTw4ON2
         qbZ9l6qtVxnYrySPJYn3U44pt+j0kgytDX5U06c1EG9jzY1A7AlcWMPNXDIw4yC7uXSH
         7RAdT6+LWT8ybKTaAfx8wvs2x6cYjwHIDoT9hQzo43+iWzTpFeiBRf1YRDWEiCgFrbz7
         /qX9nWYzjydMPEaxcl9W9lLu7/EvHXQpmdELbuVxGrAibBYsB0YE31P9ebhYjNzpj2eR
         xCMDs71veeSs/PzG5j99YxJ0A8Vt5gPvwaMyWu8480wZIxLP76UqFukTg9XKf66M5AA8
         Xs7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=a7GqXq/4eDI+3FPGfzPIPZJHFpPsXYCPt5JYFdkJcQo=;
        b=e34Lfeo5R6guLetWz0bvcooWTHas2M5g+3Sxvw8M+6gEilgO7lSanukIfVDu/dEHBd
         4grOARidX3emMXCMfmb4ze0HmLdddhC02rrNmNwyT/2Mn3mJtQgLQ4rVuDh0clOOtJbu
         jXyyA2IO7ohXRKJooDXVip58IyZajXXXMJvHtYPjJPvN9GwS8YMaTLUcvnZo7bl9GQd4
         ee4WLFiN7TiHoMF3E7D5Bz8zsfoX6yS1aSthNHtRY8duKfPMIsgunJm5bwqP0SNOzYtR
         aD/18fUxIqJ+pLUrzibVkdsEM9Ojsmw2W4k9v/Wx5WoQtWHFBYUA412T7NrWfdaDTjSf
         a8RA==
X-Gm-Message-State: AOAM531R9MvHEb83EwHq4ToLoix/RL7XQsaRNeVSQsRMKUvYb4osK1SG
	hNUGe5fjzBM/hw3Ji8586D18kkE3EpG3TbDdivI=
X-Google-Smtp-Source: ABdhPJw659zJ9zxNzWBCzbjXpxKdfBnWjTywpFSB20igzx6ht0F1M625vkcGkvwcTVCZC2YJUrQlHpFirzrufVergFs=
X-Received: by 2002:a1f:9d46:: with SMTP id g67mr4859849vke.10.1621330838410;
 Tue, 18 May 2021 02:40:38 -0700 (PDT)
MIME-Version: 1.0
References: <1621302185-15385-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1621302185-15385-1-git-send-email-wangmy@fujitsu.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 18 May 2021 11:40:27 +0200
Message-ID: <CANNYZj_3u5AWuKB_fFS+-=iWUNn6ZTYZwt-BwexTD10dYbgvDA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] elfutils: upgrade 0.183 -> 0.184
To: wangmy <wangmy@fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000afdaf505c29780a2"

--000000000000afdaf505c29780a2
Content-Type: text/plain; charset="UTF-8"

On Tue, 18 May 2021 at 03:43, wangmy <wangmy@fujitsu.com> wrote:

> -@@ -263,7 +263,7 @@ debuginfod_clean_cache(debuginfod_client *c,
> -       if (interval_file == NULL)
> -         return -errno;
> -
> --      int rc = fprintf(interval_file, "%ld",
> cache_clean_default_interval_s);
> -+      int rc = fprintf(interval_file, "%jd",
> (intmax_t)cache_clean_default_interval_s);
> -       fclose(interval_file);
> -
> -       if (rc < 0)
> -@@ -275,7 +275,7 @@ debuginfod_clean_cache(debuginfod_client *c,
> -   interval_file = fopen(interval_path, "r");
> -   if (interval_file)
> -     {
> --      if (fscanf(interval_file, "%ld", &clean_interval) != 1)
> -+      if (fscanf(interval_file, "%jd", (intmax_t*)(&clean_interval)) !=
> 1)
> -         clean_interval = cache_clean_default_interval_s;
> -       fclose(interval_file);
> -     }
> -@@ -291,7 +291,7 @@ debuginfod_clean_cache(debuginfod_client *c,
> -   max_unused_file = fopen(max_unused_path, "r");
> -   if (max_unused_file)
> -     {
> --      if (fscanf(max_unused_file, "%ld", &max_unused_age) != 1)
> -+      if (fscanf(max_unused_file, "%jd", (intmax_t*)(&max_unused_age))
> != 1)
> -         max_unused_age = cache_default_max_unused_age_s;
> -       fclose(max_unused_file);
> -     }
>

I think this cannot be removed, it needs to be rebased (e.g. using 'devtool
upgrade') - the problem is still there, it just moved to different
functions:
https://sourceware.org/git/?p=elfutils.git;a=blob;f=debuginfod/debuginfod-client.c;h=ee7eda24df9f672eb291663cc35fb4b945ad70f5;hb=HEAD#l217

Can you try a x32 build to check please?

Alex

--000000000000afdaf505c29780a2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Tue, 18 May 2021 at 03:43, wangmy &lt;<a href=3D"mailto:wangmy@fu=
jitsu.com">wangmy@fujitsu.com</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">-@@ -263,7 +263,7 @@ debuginfod_clean_cache(de=
buginfod_client *c,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (interval_file =3D=3D NULL)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -errno;<br>
- <br>
--=C2=A0 =C2=A0 =C2=A0 int rc =3D fprintf(interval_file, &quot;%ld&quot;, c=
ache_clean_default_interval_s);<br>
-+=C2=A0 =C2=A0 =C2=A0 int rc =3D fprintf(interval_file, &quot;%jd&quot;, (=
intmax_t)cache_clean_default_interval_s);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0fclose(interval_file);<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (rc &lt; 0)<br>
-@@ -275,7 +275,7 @@ debuginfod_clean_cache(debuginfod_client *c,<br>
-=C2=A0 =C2=A0interval_file =3D fopen(interval_path, &quot;r&quot;);<br>
-=C2=A0 =C2=A0if (interval_file)<br>
-=C2=A0 =C2=A0 =C2=A0{<br>
--=C2=A0 =C2=A0 =C2=A0 if (fscanf(interval_file, &quot;%ld&quot;, &amp;clea=
n_interval) !=3D 1)<br>
-+=C2=A0 =C2=A0 =C2=A0 if (fscanf(interval_file, &quot;%jd&quot;, (intmax_t=
*)(&amp;clean_interval)) !=3D 1)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0clean_interval =3D cache_clean_default_i=
nterval_s;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0fclose(interval_file);<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
-@@ -291,7 +291,7 @@ debuginfod_clean_cache(debuginfod_client *c,<br>
-=C2=A0 =C2=A0max_unused_file =3D fopen(max_unused_path, &quot;r&quot;);<br=
>
-=C2=A0 =C2=A0if (max_unused_file)<br>
-=C2=A0 =C2=A0 =C2=A0{<br>
--=C2=A0 =C2=A0 =C2=A0 if (fscanf(max_unused_file, &quot;%ld&quot;, &amp;ma=
x_unused_age) !=3D 1)<br>
-+=C2=A0 =C2=A0 =C2=A0 if (fscanf(max_unused_file, &quot;%jd&quot;, (intmax=
_t*)(&amp;max_unused_age)) !=3D 1)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0max_unused_age =3D cache_default_max_unu=
sed_age_s;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0fclose(max_unused_file);<br>
-=C2=A0 =C2=A0 =C2=A0}<br></blockquote><div><br></div><div>I think this can=
not be removed, it needs to be rebased (e.g. using &#39;devtool upgrade&#39=
;) - the problem is still there, it just moved to different functions:</div=
><div><a href=3D"https://sourceware.org/git/?p=3Delfutils.git;a=3Dblob;f=3D=
debuginfod/debuginfod-client.c;h=3Dee7eda24df9f672eb291663cc35fb4b945ad70f5=
;hb=3DHEAD#l217">https://sourceware.org/git/?p=3Delfutils.git;a=3Dblob;f=3D=
debuginfod/debuginfod-client.c;h=3Dee7eda24df9f672eb291663cc35fb4b945ad70f5=
;hb=3DHEAD#l217</a></div><div><br></div><div>Can you try a x32 build to che=
ck please?</div><div><br></div><div>Alex<br> </div><div>=C2=A0</div></div><=
/div>

--000000000000afdaf505c29780a2--
