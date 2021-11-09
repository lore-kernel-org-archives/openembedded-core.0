Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ED03C433F5
	for <webhook@archiver.kernel.org>; Tue,  9 Nov 2021 08:45:15 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web09.9543.1636447514131424600
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Nov 2021 00:45:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iqHHbPyP;
 spf=pass (domain: gmail.com, ip: 209.85.208.177,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id d11so13647788ljg.8
        for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Nov 2021 00:45:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=R9FaFExRWQGLrVkQAoUi/1NZOCU1FAdewVLtKLeTZE4=;
        b=iqHHbPyPHWJMWfK6PdQVAexm/c/C1WqzDk1f/Svv+ABoTnrsdxQlttNnEVKshuOYE7
         Ln6wIPw0MhoJBa/cYThkWugAr/gvGp58mUHcBpDs2q8ranGocuAjxgUfvLDaz7HfPXF4
         hD0k9lt24/ZzJ4r9IUuO8HWOBwooapYjRovexZiI+rl1zXaw+KmhFO93T/o6CkgjkyXN
         4sVCpBCWEdK385Mr4lJgkmflTknQ8PpODgmx9DVEMgfMYV8b6RP+MhURoR4HzOgr8zuo
         unHj9CDvDThWoN1xlSNxq+9b3iAzcxh46nj3gfWpeGbb7bkwo+wqNSBKnq34W4670EJk
         /DWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=R9FaFExRWQGLrVkQAoUi/1NZOCU1FAdewVLtKLeTZE4=;
        b=hyxZ6f5tvldHOIq+3GuOqUVqrAJ1THzs9FKTnNjN8BIoHJXYUmhT2DIEZy2JmLcq/+
         DsaciON+64RvBRDGtLGmIns2ctXXixTJrVfPV8QrfZGOeFa1VJRD/fidSa6Pso30GA5h
         kvT3NYQ9LW4TZfvKrk5MDI57XjWdnQXpmEOHzVNtoOBvDKd9e+4Y6yNtpfPLJKFyqFni
         3jvrJee9r3oQ2nHNo2w2qso9Xoyan+0U5GpNnOKdFGVNZtZb0aOm/Ct5NpjpcQtF0iLq
         3oRaSqDkwg8ZSyps5+Zi9mPnSbH/z4LVvw66OblxaR/8DuD45drTS9r/iet67yvno5dT
         2kmw==
X-Gm-Message-State: AOAM532IJ1fzKKrnkdJLAf3Pq+8P1v9WyosB4p88hg7SryteyIgS7Wmt
	o0b2THRlaVQtJbhDwOgDGGbe3RfEriJVa2kIstA=
X-Google-Smtp-Source: 
 ABdhPJwDiWcOXxG7oztZ8AaxpQ04vu0s83XLzKhopWHxVDJMgOkRJ9gL5U8Ot4fN75fhUwOOMZeoIY9mKwbhk2EIQN4=
X-Received: by 2002:a2e:9510:: with SMTP id f16mr5785438ljh.409.1636447512226;
 Tue, 09 Nov 2021 00:45:12 -0800 (PST)
MIME-Version: 1.0
References: <cover.1636447679.git.liezhi.yang@windriver.com>
 <5e10cddcd2697c7b762c8c8d245bb76f8666aefc.1636447679.git.liezhi.yang@windriver.com>
In-Reply-To: 
 <5e10cddcd2697c7b762c8c8d245bb76f8666aefc.1636447679.git.liezhi.yang@windriver.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Tue, 9 Nov 2021 08:45:01 +0000
Message-ID: 
 <CANPvuR=wmR=220txWqXq_51G_FGGHUDHFVQx=163A38CJhNZJQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] bitbake.conf: Set ZSTD_THREADS to half of
 cpu number
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000a8ed9705d057202e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Nov 2021 08:45:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158002

--000000000000a8ed9705d057202e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Robert Yang <liezhi.yang@windriver.com> escreveu no dia ter=C3=A7a, 9/11/20=
21
=C3=A0(s) 08:12:

> The original value is very easy to cause do_packge error when cpu number =
is
> larger, for example, 128 cores and 512G mem:
>
> error: create archive failed: cpio: write failed - Cannot allocate memory=
"
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
> @@ -833,7 +833,7 @@ XZ_DEFAULTS ?=3D "--memlimit=3D${XZ_MEMLIMIT}
> --threads=3D${XZ_THREADS}"
>  XZ_DEFAULTS[vardepsexclude] +=3D "XZ_MEMLIMIT XZ_THREADS"
>
>  # Default parallelism for zstd
> -ZSTD_THREADS ?=3D "${@oe.utils.cpu_count(at_least=3D2)}"
> +ZSTD_THREADS ?=3D "${@int(oe.utils.cpu_count(at_least=3D4)/2)}"
>

This will slow down all the systems with lower cpu cores.


>  ZSTD_THREADS[vardepvalue] =3D "1"
>
>  # Limit the number of threads that OpenMP libraries will use. Otherwise
> they
> --
> 2.17.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#157998):
> https://lists.openembedded.org/g/openembedded-core/message/157998
> Mute This Topic: https://lists.openembedded.org/mt/86926962/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000a8ed9705d057202e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Robert Yang &lt;<a href=3D"mailto:lie=
zhi.yang@windriver.com">liezhi.yang@windriver.com</a>&gt; escreveu no dia t=
er=C3=A7a, 9/11/2021 =C3=A0(s) 08:12:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">The original value is very easy to cause do_packge er=
ror when cpu number is<br>
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
br></blockquote><div><br></div><div>This will=C2=A0slow down all the system=
s with lower cpu cores.</div><div>=C2=A0</div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">
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
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/86926962/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/86926962/5052612</a><br>
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

--000000000000a8ed9705d057202e--

