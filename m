Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web09.7063.1619273904991228670
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 Apr 2021 07:18:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Y9tXKLPV;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id h15so15387709qvu.4
        for <openembedded-core@lists.openembedded.org>; Sat, 24 Apr 2021 07:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=O9q2sdLXMKy9qsWKQPr9OQHgKdSVAiVU9kwg7LtkK5A=;
        b=Y9tXKLPVfCCVIhYKDFlIqOXEKJsWakI5Rd4iBlOJXxwIwfMh71XEgSE//uUto7fXSP
         /oQqUtqt3zigpBb+ucrtkk0K8VXu7GKn04bkIVp4QyX94o4w/qlDeV7/50uV0dS0Bbst
         PSWp8A1Z3h5Cw9563PvxzraREBjBgbsxS/aG4c9PvS1fDimDy5xfHMFXFG6bkvtEJ+VL
         KJKmdmHPSb+ZSEm6fKmRA2GmkvhM3GV4EaL2bfkkhU33bRjKoD8MOEFas5Xt0217JS6s
         Lpq6OkIASn+LanFUs7sC9aealslJotKIIBL8i6ZfXHbQJ4puKjAXVdvSSM+XpjM0xjAC
         yskA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=O9q2sdLXMKy9qsWKQPr9OQHgKdSVAiVU9kwg7LtkK5A=;
        b=QGHF7QBP3KiWcuvnP5VtSEpkG4kk8FFR+33u2QiHyM/JYpFVXLXA8siCruA3hhFl6e
         BD1XXhNAjHGiUUiSjRMCAtJBg6nViM7f1fwVt5VHtXCwt9DoYgqn8CuG6kwDq91UC9tb
         svcOvsIFp12tNW3ZAal9+KnN9iXUF6LCrWaaMbhDpayaQoLiECZP8SRWXHyvX1YFAJQX
         9tFqHMCLFit6ux7EBrBPd82QNBuIcywJf+nA40HWY9k6FqHPzACDHz10Hub3lfUBfQYV
         G1bCa3VAkf49D0pOT0Rc23RVi7QUb8IYM2nCOxJHlQQuGw/M+l2vJnMYbUfAESX56K4c
         HuKA==
X-Gm-Message-State: AOAM530puW9yj64YcwP7q2eufAOTdJ+qjtiOLpZelcVD0iXBd/J9uGpY
	seyDLbTaURlbpPylJJgVtafBEKzlovD+vuvafB4=
X-Google-Smtp-Source: ABdhPJwnt3SEQ36le1iHBVuKqUM1loQLuk3UW/lG3+glQHalnOBuYFGZTuZinnEoNz3C1yJdLxjEteqJ557R5Cly7/Q=
X-Received: by 2002:ad4:438e:: with SMTP id s14mr9479250qvr.31.1619273904122;
 Sat, 24 Apr 2021 07:18:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210424135152.1645643-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20210424135152.1645643-1-richard.purdie@linuxfoundation.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 24 Apr 2021 07:17:57 -0700
Message-ID: <CAMKF1sqztuEgo=tNnrnmNmT+d767_RYaLPmMUv42MmC7zZTirA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] pyyaml: Add missing HOMEPAGE
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

thanks for fixing it.

On Sat, Apr 24, 2021 at 6:51 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> Add a HOMEPAGE to the new recipe to avoid sanity test failures.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-devtools/python/python3-pyyaml_5.4.1.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-devtools/python/python3-pyyaml_5.4.1.bb b/meta/recipes-devtools/python/python3-pyyaml_5.4.1.bb
> index c3025fdc662..dce1ad57d3f 100644
> --- a/meta/recipes-devtools/python/python3-pyyaml_5.4.1.bb
> +++ b/meta/recipes-devtools/python/python3-pyyaml_5.4.1.bb
> @@ -1,5 +1,6 @@
>  SUMMARY = "Python support for YAML"
>  DEPENDS += "libyaml ${PYTHON_PN}-cython-native"
> +HOMEPAGE = "https://pyyaml.org/"
>
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=6d8242660a8371add5fe547adf083079"
> --
> 2.30.2
>
>
> 
>
