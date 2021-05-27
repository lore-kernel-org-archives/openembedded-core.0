Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.2125.1622084876899242583
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 May 2021 20:07:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=ToXHsGIH;
 spf=softfail (domain: sakoman.com, ip: 209.85.221.49, mailfrom: steve@sakoman.com)
Received: by mail-wr1-f49.google.com with SMTP id n2so3188166wrm.0
        for <openembedded-core@lists.openembedded.org>; Wed, 26 May 2021 20:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=L6hETAidE+VOC59ef1apyaHOpq0UXYuKUMbodGEVPv8=;
        b=ToXHsGIHl7YKxQsgc3W/EFiBnJioYKLwNEsgvj8pilfH2HGx5HeHWN39HfKK6UQZKB
         YoQp1Cd0Ca6DsdWGkNNbUCw0IIhhv8fQZcnm0hGI8v/AQuhU3jpF9hSo3qa7D16mliwy
         39gKKjyLp7t4Espyf2urjEeTgzmKdjWSxifDB91l34keQ9K03Q1H7NbsSxM83b8GHc1a
         sbFb+dcdLDU4BftWAi4M/6sSpR/KJIWofinxcqDtBZS7U79IcN2weTHlzd7D8WBnF84p
         zjy6yS1oKbC/DUlTC6Nee+oE5DQIVpOTzcUBclIHEtCLxESujLU7WxTXSJLFGSoQUtc/
         t+MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=L6hETAidE+VOC59ef1apyaHOpq0UXYuKUMbodGEVPv8=;
        b=WeLPiVy2uzRSI2GYe1uYOlqDjEgtsfD+KMY8HjUeDaxfLHkuMEFxrvWpF5x6sQ9bmv
         uyVX9l2pKiAYQXGkbV9p6wIinQU4d1/mBxIIW0cRhaYM2ZfXlidPfe+r6Igt7S+E4EdS
         P6NNhHqxMwNWOBkY0G/iCJ6eFNuzG82fCeld/CAK9p3uF/i4zy1YEJu0K9DTTo+AgCzM
         PFURSW/ecGBjpy7QOIHnYNPmQdkDkRg+LoxrjwdrjBAUhq0fahOu/nwT6IMKa+VfQpYO
         Te9xScYho8tRO296ugcIvqWsnKkFq+KPO5gVOd4SJLgC3x2JdAxltYTqTCfMxepp19As
         GuYQ==
X-Gm-Message-State: AOAM5329fyftRGEyt8RuD7nBmeldzPyJDbVJFr+0oGL4xVxQI9b+A541
	5BFrwt6LDWX0ZVnlC44TnJE1IFv6IA8hPb4jQOjw1w==
X-Google-Smtp-Source: ABdhPJx7lkGlG8/oOOAhYqc8gnO+MCC75PAm3n0f2GZ0B72GgU+xqho/uktTrYwwBo0F9AjWSTLyYwfFgcQxFoHk1Uk=
X-Received: by 2002:a5d:514b:: with SMTP id u11mr907421wrt.350.1622084875136;
 Wed, 26 May 2021 20:07:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210526152204.1282585-1-steve@sakoman.com> <6e79a9ed-ce41-eeb5-e1f2-4cdda18ea040@windriver.com>
In-Reply-To: <6e79a9ed-ce41-eeb5-e1f2-4cdda18ea040@windriver.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Wed, 26 May 2021 17:07:39 -1000
Message-ID: <CAOSpxdZOzR0zpjDQjb9yT1VcFbS1DkWCE9r9W20Mk7R-v_sj2Q@mail.gmail.com>
Subject: Re: [OE-core][PATCH] expat: set CVE_PRODUCT
To: ChenQi <Qi.Chen@windriver.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000c7469105c3471023"

--000000000000c7469105c3471023
Content-Type: text/plain; charset="UTF-8"

On Wed, May 26, 2021, 4:10 PM ChenQi <Qi.Chen@windriver.com> wrote:

> Both 'libexpat' and 'expat' are used, from a fast grep in the json files.
> Maybe we should use CVE_PRODUCT = "expat libexpat"?
>

Good suggestion, I'll send a V2

Steve

Regards,
> Chen Qi
>
> On 05/26/2021 11:22 PM, Steve Sakoman wrote:
>
> Upstream database uses "libexpat" to report CVEs
>
> Signed-off-by: Steve Sakoman <steve@sakoman.com> <steve@sakoman.com>
> ---
>  meta/recipes-core/expat/expat_2.3.0.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-core/expat/expat_2.3.0.bb b/meta/recipes-core/expat/expat_2.3.0.bb
> index 14d2855df3..b77b114fe2 100644
> --- a/meta/recipes-core/expat/expat_2.3.0.bb
> +++ b/meta/recipes-core/expat/expat_2.3.0.bb
> @@ -24,3 +24,5 @@ do_install_ptest_class-target() {
>  }
>
>  BBCLASSEXTEND += "native nativesdk"
> +
> +CVE_PRODUCT = "libexpat"
>
>
>
> 
>
>
>
>

--000000000000c7469105c3471023
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Wed, May 26, 2021, 4:10 PM ChenQi &lt;<a href=3D"ma=
ilto:Qi.Chen@windriver.com">Qi.Chen@windriver.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex">

  
  <div bgcolor=3D"#FFFFFF" text=3D"#000000">
    <div>Both &#39;libexpat&#39; and &#39;expat&#39; are used,
      from a fast grep in the json files.<br>
      Maybe we should use CVE_PRODUCT =3D &quot;expat libexpat&quot;?<br><=
/div></div></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D=
"auto">Good suggestion, I&#39;ll send a V2</div><div dir=3D"auto"><br></div=
><div dir=3D"auto">Steve</div><div dir=3D"auto"><br></div><div dir=3D"auto"=
><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div bgcolor=3D"=
#FFFFFF" text=3D"#000000"><div>
      Regards,<br>
      Chen Qi<br>
      <br>
      On 05/26/2021 11:22 PM, Steve Sakoman wrote:<br>
    </div>
    <blockquote type=3D"cite">
      <pre>Upstream database uses &quot;libexpat&quot; to report CVEs

Signed-off-by: Steve Sakoman <a href=3D"mailto:steve@sakoman.com" target=
=3D"_blank" rel=3D"noreferrer">&lt;steve@sakoman.com&gt;</a>
---
 meta/recipes-core/expat/<a href=3D"http://expat_2.3.0.bb" target=3D"_blan=
k" rel=3D"noreferrer">expat_2.3.0.bb</a> | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/expat/<a href=3D"http://expat_2.3.0.bb" tar=
get=3D"_blank" rel=3D"noreferrer">expat_2.3.0.bb</a> b/meta/recipes-core/ex=
pat/<a href=3D"http://expat_2.3.0.bb" target=3D"_blank" rel=3D"noreferrer">=
expat_2.3.0.bb</a>
index 14d2855df3..b77b114fe2 100644
--- a/meta/recipes-core/expat/<a href=3D"http://expat_2.3.0.bb" target=3D"=
_blank" rel=3D"noreferrer">expat_2.3.0.bb</a>
+++ b/meta/recipes-core/expat/<a href=3D"http://expat_2.3.0.bb" target=3D"=
_blank" rel=3D"noreferrer">expat_2.3.0.bb</a>
@@ -24,3 +24,5 @@ do_install_ptest_class-target() {
 }
=20
 BBCLASSEXTEND +=3D &quot;native nativesdk&quot;
+
+CVE_PRODUCT =3D &quot;libexpat&quot;
</pre>
      <br>
      <fieldset></fieldset>
      <br>
      <pre>

</pre>
    </blockquote>
    <p><br>
    </p>
  </div>

</blockquote></div></div></div>

--000000000000c7469105c3471023--
