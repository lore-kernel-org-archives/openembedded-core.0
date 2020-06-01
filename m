Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web10.26902.1590971060637949262
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 May 2020 17:24:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Fc4nBrQo;
 spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id n141so7624970qke.2
        for <openembedded-core@lists.openembedded.org>; Sun, 31 May 2020 17:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=lK+5VWNJHZIuxqKZPMnvmVb+J5/4wC8duJpiGFiSG5A=;
        b=Fc4nBrQobg4kmLb2XRa0wJesuZOds+hBGZYhIEpD9L0GpsXPwWcGAwveH2IFNx+xrG
         g0Z7t/JV4kUWq74HfbgH5G+2Cm9MyZwVaVBua0Gg9Ttk+aaw3/nKOJiFmf49Z1KR66m6
         TACqwlzEpt7FN+FYVudJftxIdVI04M9lBpfwj4kAu6Sv5MPQYYKhmciQizwRb9zJRAxH
         AIGQwZdc2KfNgVIRXsWpXCPjfRa859Hvi3/F1RQ4UqPvT+lgUjiYhfg7BPkvrVBzK6Q7
         cLsvlqI1LD36jUKA0+IlmRjmdl22rLO4IhLgAbsCBoPpJY/WaAgDCy0NI5hbeaeRBuJ0
         gNJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=lK+5VWNJHZIuxqKZPMnvmVb+J5/4wC8duJpiGFiSG5A=;
        b=oZpo2g9t5329NFly7q/d3vOvqPQVOUcZZoPQbkTVbzRdPTFhk96ZmKpGUTtWR/V0IK
         qfAC/3MysgOMR5bDK/Kvj1bNJ+XbY3bxtUciXdhRWaxPaBeNKNO1LGt0PCxazKDHP37Y
         7dTh9Hgy53EKzI8L2ClyqhMKCsOIJIQegl6nVjvKwWdp8npRcaF5UdZOGxjmYPO9uiKp
         xT2kCju48iqafDoNjqChKfci2ubUhpovdCa23hRwMHKYQK7dAJvdSIZZ8FNl+WtZdmGn
         TlJKh4oPdiwwAxz2P7gRjLfUw06G/lg6IBCBpR6rxMFXKFaoQiKnN+eaFCy59R6DXkCc
         H2Ig==
X-Gm-Message-State: AOAM532VkM/on2ufIX/NsMsBPEhwyU72uP2+k/UoVABWzIxBFJBNpjFE
	4rLhZGFBIpPLHVaIkZ7Q4xyLy2hevdsYIBrWBz9zK1HEfMY=
X-Google-Smtp-Source: ABdhPJw5KWYq0PjLi6k9Pfl/KncnabdQlPwHPjt9dUbW3OqE4qNZghg+XNu+GbH/lrOA2koh67qoDlDnCKiH5ahsqPY=
X-Received: by 2002:a37:9c55:: with SMTP id f82mr17441131qke.225.1590971059458;
 Sun, 31 May 2020 17:24:19 -0700 (PDT)
MIME-Version: 1.0
References: <1590772282-43066-1-git-send-email-zangrc.fnst@cn.fujitsu.com> <1590772282-43066-2-git-send-email-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <1590772282-43066-2-git-send-email-zangrc.fnst@cn.fujitsu.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sun, 31 May 2020 17:23:53 -0700
Message-ID: <CAMKF1sqXOp88HSgjgHBqyq_=LT7hJnnAgaYg79NfmpPDXu_1mg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3-setuptools:upgrade 45.2.0 -> 47.1.1
To: zangrc <zangrc.fnst@cn.fujitsu.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This fails zopeinterface module builds see

https://errors.yoctoproject.org/Errors/Details/414650/

On Fri, May 29, 2020 at 1:11 AM zangrc <zangrc.fnst@cn.fujitsu.com> wrote:
>
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  meta/recipes-devtools/python/python-setuptools.inc  |  4 ++--
>  .../0001-change-shebang-to-python3.patch            | 13 +------------
>  ...tools_45.2.0.bb =3D> python3-setuptools_47.1.1.bb} |  0
>  3 files changed, 3 insertions(+), 14 deletions(-)
>  rename meta/recipes-devtools/python/{python3-setuptools_45.2.0.bb =3D> =
python3-setuptools_47.1.1.bb} (100%)
>
> diff --git a/meta/recipes-devtools/python/python-setuptools.inc b/meta/r=
ecipes-devtools/python/python-setuptools.inc
> index e9ad93dbee..c91cca9f06 100644
> --- a/meta/recipes-devtools/python/python-setuptools.inc
> +++ b/meta/recipes-devtools/python/python-setuptools.inc
> @@ -12,8 +12,8 @@ SRC_URI_append_class-native =3D " file://0001-conditio=
nally-do-not-fetch-code-by-e
>
>  SRC_URI +=3D "file://0001-change-shebang-to-python3.patch"
>
> -SRC_URI[md5sum] =3D "0c956eea142af9c2b02d72e3c042af30"
> -SRC_URI[sha256sum] =3D "89c6e6011ec2f6d57d43a3f9296c4ef022c2cbf49bab26b=
407fe67992ae3397f"
> +SRC_URI[md5sum] =3D "6e9de90b242fdd60ef59f497424ce13a"
> +SRC_URI[sha256sum] =3D "145fa62b9d7bb544fce16e9b5a9bf4ab2032d2f758b7cd6=
74af09a92736aff74"
>
>  DEPENDS +=3D "${PYTHON_PN}"
>
> diff --git a/meta/recipes-devtools/python/python3-setuptools/0001-change=
-shebang-to-python3.patch b/meta/recipes-devtools/python/python3-setuptools=
/0001-change-shebang-to-python3.patch
> index 33af8daed7..6dcf52771b 100644
> --- a/meta/recipes-devtools/python/python3-setuptools/0001-change-sheban=
g-to-python3.patch
> +++ b/meta/recipes-devtools/python/python3-setuptools/0001-change-sheban=
g-to-python3.patch
> @@ -8,8 +8,7 @@ Upstream-Status: Pending
>  Signed-off-by: Changqing Li <changqing.li@windriver.com>
>  ---
>   pkg_resources/_vendor/appdirs.py   | 2 +-
> - setuptools/command/easy_install.py | 2 +-
> - 2 files changed, 2 insertions(+), 2 deletions(-)
> + 1 files changed, 1 insertions(+), 1 deletions(-)
>
>  diff --git a/pkg_resources/_vendor/appdirs.py b/pkg_resources/_vendor/a=
ppdirs.py
>  index ae67001..933e398 100644
> @@ -21,16 +20,6 @@ index ae67001..933e398 100644
>   # -*- coding: utf-8 -*-
>   # Copyright (c) 2005-2010 ActiveState Software Inc.
>   # Copyright (c) 2013 Eddy Petri=C8=99or
> -diff --git a/setuptools/command/easy_install.py b/setuptools/command/ea=
sy_install.py
> -index abca1ae..6bcdc98 100644
> ---- a/setuptools/command/easy_install.py
> -+++ b/setuptools/command/easy_install.py
> -@@ -1,4 +1,4 @@
> --#!/usr/bin/env python
> -+#!/usr/bin/env python3
> - """
> - Easy Install
> - ------------
>  --
>  2.24.1
>
> diff --git a/meta/recipes-devtools/python/python3-setuptools_45.2.0.bb b=
/meta/recipes-devtools/python/python3-setuptools_47.1.1.bb
> similarity index 100%
> rename from meta/recipes-devtools/python/python3-setuptools_45.2.0.bb
> rename to meta/recipes-devtools/python/python3-setuptools_47.1.1.bb
> --
> 2.17.1
>
>
>
>=20
