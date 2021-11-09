Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75178C433EF
	for <webhook@archiver.kernel.org>; Tue,  9 Nov 2021 08:21:47 +0000 (UTC)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com
 [209.85.222.47])
 by mx.groups.io with SMTP id smtpd.web10.9222.1636446106760401534
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Nov 2021 00:21:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iZ3NW9Te;
 spf=pass (domain: gmail.com, ip: 209.85.222.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f47.google.com with SMTP id o26so36958404uab.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Nov 2021 00:21:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yN7egtkXVPQcl1WmE8htzQy64xOXMvw2ZIF3jEjd0FE=;
        b=iZ3NW9Te02oIMb6G7uwEMH754WEkXpoRXEBgxBrFK4/eaxBU7umfiGh99AjVRy+Rsq
         PuYlsXcxzEu1VylFSGQ1YOrSZnXHrLzm5bSg/eZ0zeG8JtHFW4khGKAGYMRGA0MKGIiv
         903Rl6XK62b3WNeJxBT7/P/0nLC5DiknnX5l/0HqVs1Np3lMsAXMk9ep94hk0PqLRCMI
         qJ4A9SAXQpyA+VwoVVC2MaDpuw3RjnuzZtZCd9x/3gK5sOuOaafqvs+6Jz8vzXOZhHvX
         MUWSK52pKCSC4F7tCVaK3I3+Ppu6TzOg9nM+66JiXN+L3DH9xfmFZih/ba1slkWBF/Ta
         WxmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yN7egtkXVPQcl1WmE8htzQy64xOXMvw2ZIF3jEjd0FE=;
        b=UARLT5q1sHb7z68nfBkgpztV0BaepPO8ncSimIpE6r2I5BF95e05pQLBSTDPTSNCk8
         NrHkKZcROjOPwjF7oBRNmspDJ3zkX1Gr7OC7vz6OdE80LW/GXbpc2W1kT/2YXQNXrzg5
         M5wQc3v9Vv6JX5RrITXvHynBNN0P9uOH2A3JrvGwwilrX7SBI2CCKaYmA7NYCJ5t6bLt
         nURgonaCPRUHip/FgEbPB93c4V+1rcTrlwlpg8rOQjp9CuI4xecGXECdGRf9ZbOOwraQ
         wa4F6QRGaGCICC0Ewh13KwJ2VL0O3Pm3OMX8UHAaVkTXyaE/yMo7hfCVqAeoZld/ua86
         Q6hw==
X-Gm-Message-State: AOAM530tYY6YkjkFDE7Iqz3kITasD0BOFp9SnlG38PrSyXFnJZTqVgG4
	H8G8GuWkBJBIkCMvq7NvzFxDUuJ0gumWsY/Mwqm7p0LC
X-Google-Smtp-Source: 
 ABdhPJzcRfUh07NUQ8jSlB4yfYHRIvwwKfC9FGZJlZgl4oaS6vHLVpb5gVzV6MVqmO58eyp3CBuyZo+2GTnazbtKrDI=
X-Received: by 2002:a05:6102:b13:: with SMTP id
 b19mr9627232vst.1.1636446105879;
 Tue, 09 Nov 2021 00:21:45 -0800 (PST)
MIME-Version: 1.0
References: <cover.1636447679.git.liezhi.yang@windriver.com>
 <5e10cddcd2697c7b762c8c8d245bb76f8666aefc.1636447679.git.liezhi.yang@windriver.com>
In-Reply-To: 
 <5e10cddcd2697c7b762c8c8d245bb76f8666aefc.1636447679.git.liezhi.yang@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 9 Nov 2021 09:21:34 +0100
Message-ID: 
 <CANNYZj_y=ujQf8poDv1seVjWTOid1H=4Hn1OVi1NJ_o55vwwTQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] bitbake.conf: Set ZSTD_THREADS to half of
 cpu number
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000d5c6dd05d056cc50"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Nov 2021 08:21:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158000

--000000000000d5c6dd05d056cc50
Content-Type: text/plain; charset="UTF-8"

But does this mean we need to globally restrict this and make things twice
slower for everyone? I'm not sure.


Alex

On Tue, 9 Nov 2021 at 09:12, Robert Yang <liezhi.yang@windriver.com> wrote:

> The original value is very easy to cause do_packge error when cpu number is
> larger, for example, 128 cores and 512G mem:
>
> error: create archive failed: cpio: write failed - Cannot allocate memory"
>
> Set the ZSTD_THREADS to half of the CPU number can avoid the error in my
> testing.
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/conf/bitbake.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 71c1e52ad6..46ebf5113f 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -833,7 +833,7 @@ XZ_DEFAULTS ?= "--memlimit=${XZ_MEMLIMIT}
> --threads=${XZ_THREADS}"
>  XZ_DEFAULTS[vardepsexclude] += "XZ_MEMLIMIT XZ_THREADS"
>
>  # Default parallelism for zstd
> -ZSTD_THREADS ?= "${@oe.utils.cpu_count(at_least=2)}"
> +ZSTD_THREADS ?= "${@int(oe.utils.cpu_count(at_least=4)/2)}"
>  ZSTD_THREADS[vardepvalue] = "1"
>
>  # Limit the number of threads that OpenMP libraries will use. Otherwise
> they
> --
> 2.17.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#157998):
> https://lists.openembedded.org/g/openembedded-core/message/157998
> Mute This Topic: https://lists.openembedded.org/mt/86926962/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000d5c6dd05d056cc50
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>But does this mean we need to globally restrict this =
and make things twice slower for everyone? I&#39;m not sure.</div><div><br>=
</div><div><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 9 Nov 2021 at 09:12, Robert=
 Yang &lt;<a href=3D"mailto:liezhi.yang@windriver.com">liezhi.yang@windrive=
r.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">The original value is very easy to cause do_packge error when cpu numb=
er is<br>
larger, for example, 128 cores and 512G mem:<br>
<br>
error: create archive failed: cpio: write failed - Cannot allocate memory&q=
uot;<br>
<br>
Set the ZSTD_THREADS to half of the CPU number can avoid the error in my<br=
>
testing.<br>
<br>
Signed-off-by: Robert Yang &lt;<a href=3D"mailto:liezhi.yang@windriver.com"=
 target=3D"_blank">liezhi.yang@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/conf/bitbake.conf | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf<br>
index 71c1e52ad6..46ebf5113f 100644<br>
--- a/meta/conf/bitbake.conf<br>
+++ b/meta/conf/bitbake.conf<br>
@@ -833,7 +833,7 @@ XZ_DEFAULTS ?=3D &quot;--memlimit=3D${XZ_MEMLIMIT} --th=
reads=3D${XZ_THREADS}&quot;<br>
=C2=A0XZ_DEFAULTS[vardepsexclude] +=3D &quot;XZ_MEMLIMIT XZ_THREADS&quot;<b=
r>
<br>
=C2=A0# Default parallelism for zstd<br>
-ZSTD_THREADS ?=3D &quot;${@oe.utils.cpu_count(at_least=3D2)}&quot;<br>
+ZSTD_THREADS ?=3D &quot;${@int(oe.utils.cpu_count(at_least=3D4)/2)}&quot;<=
br>
=C2=A0ZSTD_THREADS[vardepvalue] =3D &quot;1&quot;<br>
<br>
=C2=A0# Limit the number of threads that OpenMP libraries will use. Otherwi=
se they<br>
-- <br>
2.17.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#157998): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/157998" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/157998</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/86926962/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/86926962/1686489</a><br>
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

--000000000000d5c6dd05d056cc50--

