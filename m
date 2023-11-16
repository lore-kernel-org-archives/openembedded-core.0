Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7A8CC197A0
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 21:25:50 +0000 (UTC)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
 by mx.groups.io with SMTP id smtpd.web11.18460.1700169945925531274
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Nov 2023 13:25:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=L4ZsVUB2;
 spf=pass (domain: gmail.com, ip: 209.85.210.43, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-6ce2eaf7c2bso738469a34.0
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 13:25:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700169945; x=1700774745; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P6HiIr/xXqYHtKorwWuA04F9xMAcdEzUmjTHNc5XFlU=;
        b=L4ZsVUB2GDijiTne8nrDXfb4DWVhtBOgkRhZOk7OAoQ+dDW8/2CWXLUP2UCyLWroLb
         XCE+Fjk35ekaiG/4QQWWnOnhKGJ5kCa3HuTUitxoxIhbh66n37Pqtihp8BefmiOhbPBT
         oj5ZJkzLcTUtRQvUnGNBIOpiHeHsBUlHWH96Cu7ZiSw7p7tBQTxJZIJpzvHdhWTPUHOD
         vwliZ7eoSOcLs/TaXQfycs3sephlxvbeYeHvko4KtMhnYK+bOcvSxpYav1/1J7GO5Lv/
         MM4aBj3gWFO8H4SoOAjYcPl6bb6IoNxNFCePP399zJMOiXqzAFA53iyJJCCWZLXQniEz
         KJVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700169945; x=1700774745;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P6HiIr/xXqYHtKorwWuA04F9xMAcdEzUmjTHNc5XFlU=;
        b=oC/btKIEZZDUWFU32kCQnI1UNlbEn9sb1UoCibs0M9mB+rpDeGwOOiQ9ad2z2FU8fH
         Ft9E1DUJEOCQou/yWTSthH7uRaxzMcKVjp3+8qxqRN7aNlisZHQ8wAgHe+Jcqtxt3eZ+
         2xY2ZCfUN+QmxlnbcE6eDf4hdmJTPwX56Tyi6bP2eVMnnt7iSeGWJsS3ywjU7R11RGvH
         vcBhl4UIIAe5MwxoljwbCY4HVvgSky7iKRMGQs6Zc+T8O1RUH/LTUd+mlycVZKwAA+4Q
         6lpqbpOqfiZ7u0SaRke0xk4tlzRK17eXnghjlolqK7cThMX4MLJYhuTfnd8P7ghQpH/e
         iBbg==
X-Gm-Message-State: AOJu0Yw9kQvC818sa/Li5u4lNsSn/XJh6kJv3n4aZj6nYZS04J9xfTMR
	tVGRY24c7Y9/tyjFKZ+Q3sxI9QnvMnof2mn+01k=
X-Google-Smtp-Source: AGHT+IEFDWqqFXF72pr+S5lPM0esRKptk07iVX5lDa50PwFvg/UGgrzdYWTOn86j3GtiRLE6r2IDlz1EHklc4ITuEAo=
X-Received: by 2002:a05:6870:3d85:b0:1e5:89d8:81fb with SMTP id
 lm5-20020a0568703d8500b001e589d881fbmr23435702oab.10.1700169944931; Thu, 16
 Nov 2023 13:25:44 -0800 (PST)
MIME-Version: 1.0
References: <20231116165250.2863415-1-richard.purdie@linuxfoundation.org> <20231116165250.2863415-2-richard.purdie@linuxfoundation.org>
In-Reply-To: <20231116165250.2863415-2-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 16 Nov 2023 13:25:18 -0800
Message-ID: <CAMKF1soCqH=+=QUeaF-ikMmwHCe0L0K8Cp_-X3tVqe6xTkQVFg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] bitbake.conf: Drop oldincludedir
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 21:25:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190811

On Thu, Nov 16, 2023 at 8:53=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> Autoconf defines this as:
>
> "The directory for installing C header files for non-GCC compilers."
>
> Whilst this is something autoconf does allow changing, I find it hard
> to believe it has much use in the wild now and that headers don't get
> split like this in reality, it would probably only be useful on really
> old unixes.. The values are the same in our configuration anyway.
>
> Drop the value and just use includedir everywhere.

Maybe alias it to includedir instead. Since some makefiles may assume
a default value in its absence
which might change the install behavior. It does not matter much on
native builds but for cross builds it might.

>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes-recipe/autotools.bbclass  | 2 +-
>  meta/conf/bitbake.conf                 | 1 -
>  meta/files/fs-perms-persistent-log.txt | 1 -
>  meta/files/fs-perms.txt                | 1 -
>  meta/lib/oe/package.py                 | 3 +--
>  5 files changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/meta/classes-recipe/autotools.bbclass b/meta/classes-recipe/=
autotools.bbclass
> index 5ed21a3d684..1663307b061 100644
> --- a/meta/classes-recipe/autotools.bbclass
> +++ b/meta/classes-recipe/autotools.bbclass
> @@ -76,7 +76,7 @@ CONFIGUREOPTS =3D " --build=3D${BUILD_SYS} \
>                   --localstatedir=3D${localstatedir} \
>                   --libdir=3D${libdir} \
>                   --includedir=3D${includedir} \
> -                 --oldincludedir=3D${oldincludedir} \
> +                 --oldincludedir=3D${includedir} \
>                   --infodir=3D${infodir} \
>                   --mandir=3D${mandir} \
>                   --disable-silent-rules \
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 12292714d2f..500f0112742 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -46,7 +46,6 @@ export sbindir =3D "${exec_prefix}/sbin"
>  export libdir =3D "${exec_prefix}/${baselib}"
>  export libexecdir =3D "${exec_prefix}/libexec"
>  export includedir =3D "${exec_prefix}/include"
> -export oldincludedir =3D "${exec_prefix}/include"
>  localedir =3D "${libdir}/locale"
>
>  # Linkage between native/cross/nativesdk layouts
> diff --git a/meta/files/fs-perms-persistent-log.txt b/meta/files/fs-perms=
-persistent-log.txt
> index 518c1be3c93..61f0a6e26a1 100644
> --- a/meta/files/fs-perms-persistent-log.txt
> +++ b/meta/files/fs-perms-persistent-log.txt
> @@ -38,7 +38,6 @@ ${datadir}/locale     0755    root    root    true    0=
644    root    root
>
>  # Cleanup headers
>  ${includedir}          0755    root    root    true    0644    root    r=
oot
> -${oldincludedir}       0755    root    root    true    0644    root    r=
oot
>
>  # Cleanup debug src
>  /usr/src/debug         0755    root    root    true    0644    root    r=
oot
> diff --git a/meta/files/fs-perms.txt b/meta/files/fs-perms.txt
> index daa4aed840f..48191f504ce 100644
> --- a/meta/files/fs-perms.txt
> +++ b/meta/files/fs-perms.txt
> @@ -38,7 +38,6 @@ ${datadir}/locale     0755    root    root    true    0=
644    root    root
>
>  # Cleanup headers
>  ${includedir}          0755    root    root    true    0644    root    r=
oot
> -${oldincludedir}       0755    root    root    true    0644    root    r=
oot
>
>  # Cleanup debug src
>  /usr/src/debug         0755    root    root    true    0644    root    r=
oot
> diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
> index 1dd20f85ebd..f69bf9c353c 100644
> --- a/meta/lib/oe/package.py
> +++ b/meta/lib/oe/package.py
> @@ -456,8 +456,7 @@ def fixup_perms(d):
>                  'sbindir',
>                  'libexecdir',
>                  'libdir',
> -                'includedir',
> -                'oldincludedir' ]
> +                'includedir' ]
>
>      for path in target_path_vars:
>          dir =3D d.getVar(path) or ""
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#190807): https://lists.openembedded.org/g/openembedde=
d-core/message/190807
> Mute This Topic: https://lists.openembedded.org/mt/102630315/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

