Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EDA8C0015E
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 19:01:32 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.15754.1690484490261100199
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jul 2023 12:01:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=mPLP2+JL;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.51, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-98e39784a85so548318566b.1
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 12:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1690484488; x=1691089288;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6zAFDZf8S19nLbOWuBVO8dMk4iS36j62h4bEmTwP1oY=;
        b=mPLP2+JLXNDBe9zoOcOGWS0DDbN6iAfotbWY7RbfYhJhHjzFP1v1Sf6dadvuBRDZR+
         3klCjJai7Gp3JVh5dasGTpjdcKR9v8dtgvM13ahRr1iKJ+WFeTIRNGyQoJ29JDRBv3MK
         VL/v81MmodC4teFgttwkmOMYJUphKGiVYWFPJnhSYxjFY5F2g0nswZuoavY0F5lGMHFd
         G1ZNnXdI0cikGDSsj2vXjG/rVGHIJSOW5Lo4sn/Y5WDDJnQskMybahtdGXpFj1P9+TPi
         1ID6P3oSySs8umX4GduLikfEqmnkWsxv+H/xSusgf0wEhBWj4ysj+Tnv3xBeFOdHI2vb
         hfeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690484488; x=1691089288;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6zAFDZf8S19nLbOWuBVO8dMk4iS36j62h4bEmTwP1oY=;
        b=XYZFNCvAXGcyFq4qi1B2FyXPzjWoIgyQ7V0G3Feh8eOETjzWDVEZdJnZRI7Y+uzeSc
         KcXP+m5nm/YcVVe95g93hPwbgfqq7pWp2L051FAQ+28ehfajpqY8O6utIyxeUknTwOCw
         q0aPsbkPSFSNrakPrFbceZ/Z9XBrV8QUsIj6IIwaQ/i3ebxi7Zv0/5XC6nRouvTHCNZ8
         9a6vDv5hVI6CZAunR3+s7mI13t20dStAOxQC5LlPpJAqU0ZMF7V2Q5WzsBEcseJxbLlJ
         Ydkupc5rdH52dOXzWibqB73rgFhpXUQQ8xQcqxT0MQDOqwacWlzKRsCESBra3M293+c6
         aYiQ==
X-Gm-Message-State: ABy/qLbTCWkODhce2rAV+gCJLoH+ix17+KzfpIeIMEll62Ph/UhwkNjr
	pNZJbbx71cCiGfFQV+nfDLl+1z+pQasa1ygduTAXm7cTJoeczzr8
X-Google-Smtp-Source: APBJJlGW5YDnS0kkd+x8YVi9zt+be0QcQLygornnce3fO+vy1q++lWYRI+RfAMQR28bcr491YI/UKlhT3w4aL6TE0RQ=
X-Received: by 2002:a17:906:74d5:b0:99b:c8bf:3f06 with SMTP id
 z21-20020a17090674d500b0099bc8bf3f06mr235082ejl.24.1690484488029; Thu, 27 Jul
 2023 12:01:28 -0700 (PDT)
MIME-Version: 1.0
References: <4430b025-a805-3efa-3bc0-58089c47e8f2@lineo.co.jp>
In-Reply-To: <4430b025-a805-3efa-3bc0-58089c47e8f2@lineo.co.jp>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 27 Jul 2023 09:01:16 -1000
Message-ID: <CAOSpxdZXPpKb637BuzjiuAuYYpWb1iJYk8saZrA1Q6Ro__fUDw@mail.gmail.com>
Subject: Re: [kirkstone][dunfell][PATCH] cve-update-nvd2-native: always pass
 str for json.loads()
To: Yuta Hayama <hayama@lineo.co.jp>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000068607606017c97d3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 19:01:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184971

--00000000000068607606017c97d3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Will this change also work on master and mickledore?  If so, please submit
for master and I will cherry-pick to the other branches.

I've been trying to keep the cve checking in the stable branches in sync
with master as much as possible.

Thanks!

Steve

On Wed, Jul 26, 2023 at 10:56=E2=80=AFPM Yuta Hayama <hayama@lineo.co.jp> w=
rote:

> Currently json.loads() accepts one of the types str, bytes, or bytearray
> as an argument, but bytes and bytearrays have only been allowed since
> python 3.6. The version of Python3 provided by default on Ubuntu 16.04
> and Debian 9.x is 3.5, so make raw_data type str to work correctly on
> these build hosts.
>
> Signed-off-by: Yuta Hayama <hayama@lineo.co.jp>
> ---
>  meta/recipes-core/meta/cve-update-nvd2-native.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb
> b/meta/recipes-core/meta/cve-update-nvd2-native.bb
> index 2f7dad7e82..67d76f75dd 100644
> --- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
> +++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
> @@ -136,7 +136,7 @@ def nvd_request_next(url, api_key, args):
>
>              if (r.headers['content-encoding'] =3D=3D 'gzip'):
>                  buf =3D r.read()
> -                raw_data =3D gzip.decompress(buf)
> +                raw_data =3D gzip.decompress(buf).decode("utf-8")
>              else:
>                  raw_data =3D r.read().decode("utf-8")
>
> --
> 2.25.1
>
>

--00000000000068607606017c97d3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Will this change also work on master and mickledore?=C2=A0=
 If so, please submit for master and I will cherry-pick to the other branch=
es.<div><br></div><div>I&#39;ve been trying to keep the cve checking in the=
 stable branches=C2=A0in sync with master as much=C2=A0as possible.</div><d=
iv><br></div><div>Thanks!</div><div><br></div><div>Steve</div></div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 2=
6, 2023 at 10:56=E2=80=AFPM Yuta Hayama &lt;<a href=3D"mailto:hayama@lineo.=
co.jp">hayama@lineo.co.jp</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">Currently json.loads() accepts one of the types st=
r, bytes, or bytearray<br>
as an argument, but bytes and bytearrays have only been allowed since<br>
python 3.6. The version of Python3 provided by default on Ubuntu 16.04<br>
and Debian 9.x is 3.5, so make raw_data type str to work correctly on<br>
these build hosts.<br>
<br>
Signed-off-by: Yuta Hayama &lt;<a href=3D"mailto:hayama@lineo.co.jp" target=
=3D"_blank">hayama@lineo.co.jp</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/meta/<a href=3D"http://cve-update-nvd2-native.bb" r=
el=3D"noreferrer" target=3D"_blank">cve-update-nvd2-native.bb</a> | 2 +-<br=
>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-core/meta/<a href=3D"http://cve-update-nvd2-nativ=
e.bb" rel=3D"noreferrer" target=3D"_blank">cve-update-nvd2-native.bb</a> b/=
meta/recipes-core/meta/<a href=3D"http://cve-update-nvd2-native.bb" rel=3D"=
noreferrer" target=3D"_blank">cve-update-nvd2-native.bb</a><br>
index 2f7dad7e82..67d76f75dd 100644<br>
--- a/meta/recipes-core/meta/<a href=3D"http://cve-update-nvd2-native.bb" r=
el=3D"noreferrer" target=3D"_blank">cve-update-nvd2-native.bb</a><br>
+++ b/meta/recipes-core/meta/<a href=3D"http://cve-update-nvd2-native.bb" r=
el=3D"noreferrer" target=3D"_blank">cve-update-nvd2-native.bb</a><br>
@@ -136,7 +136,7 @@ def nvd_request_next(url, api_key, args):<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (r.headers[&#39;content-=
encoding&#39;] =3D=3D &#39;gzip&#39;):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0buf =3D r.rea=
d()<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raw_data =3D gzip.=
decompress(buf)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raw_data =3D gzip.=
decompress(buf).decode(&quot;utf-8&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raw_data =3D =
r.read().decode(&quot;utf-8&quot;)<br>
<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div>

--00000000000068607606017c97d3--

