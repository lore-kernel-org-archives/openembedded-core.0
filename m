Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web08.1784.1607543757952950026
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Dec 2020 11:55:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=gXs2dq9l;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.49, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f49.google.com with SMTP id jx16so3903611ejb.10
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Dec 2020 11:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Bx1V/vM0tzMq1Yra9rXBaWGmiOn5dLFpwL8DBD/D3Sc=;
        b=gXs2dq9lvbTZac4coIuc0FZ/6B8vvTccXvJ37eC2HfnT9pTF5XHp3RVKzzZDg0n0J3
         sBYhTtL5uwiiOQccZ5PkPnj4jJMhmtDeEhzcvvlHf+kxNV3fZjWOdzOvVQV8UscoWtNL
         gmo9WdcAorjy51i4EoQEmFX3mkLOFloOyewbNhaA3gV1m011uw1d7haFyYvfLJJLxIg0
         B3RQW7tYqOt7eg2dNRHndtyG9ZaYiVHzXdzLz6ODr3PlT5g2AgGazgEfJOvOm8IeR2XU
         qr4r0fvYwDVGLv9pCQA2aD86dUhaq7ANMcMQ7Z8YbtHHusaM862o+Yqe3mu9NNzuZeXH
         PUIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Bx1V/vM0tzMq1Yra9rXBaWGmiOn5dLFpwL8DBD/D3Sc=;
        b=WAeXrKb77SSjDEGw1JAQGuNJW5GFN7Vm5jYCt72o0zs9fmeXiKDLo1JwKakhQVYk8M
         EJkojS4Wx+Fxn6t5MTuUZAlion2W8+h9ogzUnxVNXDtDyfG9N0zty9q/Piy13TrOcEZj
         tvWcf+F/ZUh2IHCsMfJuzWmz6titiYOd8B12p+tgaEE0HE9kBOngulC4KNpi2BSmxM1z
         zG67fr16KMUAYHSWB+NIwgi9Z9vbWTKJzBw5778Z64740MqsNdnjP6ol9VnihjIMmZQz
         xTnpoRE7/Kv821WJQOBCzJysqibZWWIc6A6+y5bFEDjaNgLLiuqC25UvYJWvetkBp1iA
         mA7Q==
X-Gm-Message-State: AOAM532mKHVi9K1DabVCp+lzytxDRtY2cOczy9hvcSJ8LDwCYrZg7e+C
	8vzKQEdKetiMGGImiGYgCoDvyFuSQLu8EqC1ksgblg==
X-Google-Smtp-Source: ABdhPJz1+awFiS/QM4u+OtDXPWQRy78CdxtVpYCqQQV3ab9FBwM2/HZFtU3HmpREqYx0DmxFSiEq59+kgVl5xpMEIuw=
X-Received: by 2002:a17:906:fa8b:: with SMTP id lt11mr3466317ejb.94.1607543756280;
 Wed, 09 Dec 2020 11:55:56 -0800 (PST)
MIME-Version: 1.0
References: <20201209192111.21817-1-dmurphy@ti.com> <20201209192111.21817-2-dmurphy@ti.com>
In-Reply-To: <20201209192111.21817-2-dmurphy@ti.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Wed, 9 Dec 2020 09:55:45 -1000
Message-ID: <CAOSpxdbceaaD4NKn34zwb73+jP1Y9ra7UwYi82LNL-KmPLGs5g@mail.gmail.com>
Subject: Re: [OE-core] [dunfell] [PATCH 2/2] lz4: upgrade 1.9.2 -> 1.9.3
To: dmurphy@ti.com
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Alexander Kanavin <alex.kanavin@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Dan,

I already have the first patch of this series in testing.  Is version
1.9.3 a bug fix only release?

Steve

On Wed, Dec 9, 2020 at 9:21 AM Dan Murphy via lists.openembedded.org
<dmurphy=ti.com@lists.openembedded.org> wrote:
>
> From: Alexander Kanavin <alex.kanavin@gmail.com>
>
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  meta/recipes-support/lz4/{lz4_1.9.2.bb => lz4_1.9.3.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-support/lz4/{lz4_1.9.2.bb => lz4_1.9.3.bb} (90%)
>
> diff --git a/meta/recipes-support/lz4/lz4_1.9.2.bb b/meta/recipes-support/lz4/lz4_1.9.3.bb
> similarity index 90%
> rename from meta/recipes-support/lz4/lz4_1.9.2.bb
> rename to meta/recipes-support/lz4/lz4_1.9.3.bb
> index 455d2a5141f0..00f2dd32fedd 100644
> --- a/meta/recipes-support/lz4/lz4_1.9.2.bb
> +++ b/meta/recipes-support/lz4/lz4_1.9.3.bb
> @@ -9,9 +9,9 @@ LIC_FILES_CHKSUM = "file://lib/LICENSE;md5=ebc2ea4814a64de7708f1571904b32cc \
>
>  PE = "1"
>
> -SRCREV = "fdf2ef5809ca875c454510610764d9125ef2ebbd"
> +SRCREV = "d44371841a2f1728a3f36839fd4b7e872d0927d3"
>
> -SRC_URI = "git://github.com/lz4/lz4.git;branch=dev \
> +SRC_URI = "git://github.com/lz4/lz4.git;branch=release \
>             file://run-ptest \
>             "
>  UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.*)"
> --
> 2.29.2
>
>
> 
>
