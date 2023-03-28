Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D72AC6FD18
	for <webhook@archiver.kernel.org>; Tue, 28 Mar 2023 20:13:41 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.7228.1680034418307795817
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Mar 2023 13:13:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=J5QX8uDZ;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id e18so13437651wra.9
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Mar 2023 13:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680034417;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fECUTlBd/MGImtDcpOAu4qI59DdPv5N4W+7mVljrH1M=;
        b=J5QX8uDZV373P6dkCqcBz5hQNaB9X1gm56wdn+2RXBHN4+zVOaPmLtzyRsOBbmOgOs
         omCi8zBvwqc6KrWtgxkJU/+2F9GiT3vQQ26XwTfH5CjbwdamyDSMKKZ2/W+I3pCjcGmh
         cgdewH96dsvih553hri/Va/sANGHpZkosgH0hjWWuUKkjdcwNBdLX6RiWljYGc6EzAIl
         n1+Yh4KMfkPCqbz9/u9u9RvtlH5tTXJizQ+Ws0ApD/RVoi775wGpHVQE6G0K7baClIkF
         egA/laiUxR1fcP4GpkNj/70NuFJTtOVF7U+wM5jCvdVx4d6/glptWepgq6B6AJQoTvwV
         6X+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680034417;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fECUTlBd/MGImtDcpOAu4qI59DdPv5N4W+7mVljrH1M=;
        b=IjJbHIAc4nK1D3ZhUQBaglL/r+0DMYWwXup8teGj812HN8t30o+5dp3xlrRLQqpiqi
         RmZvzzCpkO2rq3geI/ebWFezVDb4l1on0ZKmiyf7K6QyOLxkJQU4qtqQ8QhsPi45OAvN
         Q0GC8zb8sZpUlaXwsjnii6dsBgZPcxS+G9r99imUSxeqKHT68BXqaRZqQKZOQ98lrWEJ
         5IHT8THA63nzgNDy/AFm/1j1ocr/scRBIr7M3//Ywt+4Ouwpy7yqq+MiaqjplKpjBloB
         FDMG1/3p9PsswonVf8rLIPFwxTm526SgqXSQpLxIUrL7n50Elxi3DJSC9+uEB+t6uJbv
         2mlQ==
X-Gm-Message-State: AAQBX9eJA9wnHaot5+C3j6z8TfsNjnZSQWM5VpEUpjruenWgNM4CU+8W
	m33kb5itezZM96ymvCUDY4SCkHf1J+a/DStVIrc=
X-Google-Smtp-Source: AKy350bC2YjAdTN94fPbwxFsv5HqTdUE8NhOlW/sAEBpPqQ3gmAMwbTglzJoL6Nu+tdWi9IjyhnZH0zpXtcXXfp+csw=
X-Received: by 2002:a05:6000:18a1:b0:2cf:ea35:f8bc with SMTP id
 b1-20020a05600018a100b002cfea35f8bcmr7330357wri.6.1680034416618; Tue, 28 Mar
 2023 13:13:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230207215439.1391583-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20230207215439.1391583-1-richard.purdie@linuxfoundation.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 28 Mar 2023 22:13:23 +0200
Message-ID: <CA+chaQegKKEqfCG3-BG=zs44CTLojSu0tFAWqpuPk3aze2jYiA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] uninative: Upgrade to 3.9 to include glibc 2.37
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org, 
	Michael Halstead <mhalstead@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="0000000000009cf27405f7fb7e22"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Mar 2023 20:13:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179247

--0000000000009cf27405f7fb7e22
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 7, 2023 at 10:54=E2=80=AFPM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> From: Michael Halstead <mhalstead@linuxfoundation.org>
>
> Update uninative to work with the new glibc 2.37.
>


> Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/conf/distro/include/yocto-uninative.inc | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/meta/conf/distro/include/yocto-uninative.inc
> b/meta/conf/distro/include/yocto-uninative.inc
> index 51c0cdee438..8a5cab5360d 100644
> --- a/meta/conf/distro/include/yocto-uninative.inc
> +++ b/meta/conf/distro/include/yocto-uninative.inc
> @@ -6,10 +6,10 @@
>  # to the distro running on the build machine.
>  #
>
> -UNINATIVE_MAXGLIBCVERSION =3D "2.36"
> -UNINATIVE_VERSION =3D "3.8.1"
> +UNINATIVE_MAXGLIBCVERSION =3D "2.37"
> +UNINATIVE_VERSION =3D "3.9"
>

Was there some dependency on other changes to consider this for backport to
langdale (which already has the libgcc change with 3.8.1) and then
kirkstone (needs both update to 3.8.1 and then this).

I'll start using it for my ubuntu-23.10 builds (with glibc 2.37) and ask
for backport later if there is no reply on this.

Cheers,

--0000000000009cf27405f7fb7e22
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, Feb 7, 2023 at 10:54=E2=80=AFPM R=
ichard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">ric=
hard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><div class=3D"gmail=
_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Michael Hal=
stead &lt;<a href=3D"mailto:mhalstead@linuxfoundation.org" target=3D"_blank=
">mhalstead@linuxfoundation.org</a>&gt;<br>
<br>
Update uninative to work with the new glibc 2.37.<br></blockquote><div><br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Signed-off-by: Michael Halstead &lt;<a href=3D"mailto:mhalstead@linuxfounda=
tion.org" target=3D"_blank">mhalstead@linuxfoundation.org</a>&gt;<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<b=
r>
---<br>
=C2=A0meta/conf/distro/include/yocto-uninative.inc | 10 +++++-----<br>
=C2=A01 file changed, 5 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distr=
o/include/yocto-uninative.inc<br>
index 51c0cdee438..8a5cab5360d 100644<br>
--- a/meta/conf/distro/include/yocto-uninative.inc<br>
+++ b/meta/conf/distro/include/yocto-uninative.inc<br>
@@ -6,10 +6,10 @@<br>
=C2=A0# to the distro running on the build machine.<br>
=C2=A0#<br>
<br>
-UNINATIVE_MAXGLIBCVERSION =3D &quot;2.36&quot;<br>
-UNINATIVE_VERSION =3D &quot;3.8.1&quot;<br>
+UNINATIVE_MAXGLIBCVERSION =3D &quot;2.37&quot;<br>
+UNINATIVE_VERSION =3D &quot;3.9&quot;<br></blockquote><div><br></div><div>=
Was there some dependency on other changes to consider this for backport to=
 langdale (which already has the libgcc change with 3.8.1) and then kirksto=
ne (needs both update to 3.8.1 and then this).</div><div><br></div><div>I&#=
39;ll start using it for my ubuntu-23.10 builds (with glibc 2.37) and ask f=
or backport later if there is no reply on this.</div><div><br></div><div>Ch=
eers,</div></div></div>

--0000000000009cf27405f7fb7e22--

