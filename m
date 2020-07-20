Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web10.3061.1595272916406997869
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2020 12:21:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Mgdwo7xF;
 spf=pass (domain: gmail.com, ip: 209.85.222.196, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f196.google.com with SMTP id b4so16654545qkn.11
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2020 12:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=djFU3bwIm2dWbF2wfugf2VkbB/2Bf22UNSx4/ilQaNg=;
        b=Mgdwo7xFDatJQZITWAhvDjPjUAv481Y8pQPW4kj4He9TT3eRbSzVQ3JF69cwch3I2Q
         hoebDWAa2451C61YvCro7fyYIps1FYo1QbFZxVEkcjeQfzFTU1vFNr+VJBrEcd7z0cZw
         yXcA99eYnsBHs+UuvwjBTckuFAmQ+Gb7QiD25ysuyzz+vDAdOuqeGE8Ify+jUFiVod7u
         7b4ccYX/zAJ6vJNcofu6pnD+uo4ybw1ODcCQKNdNTrrz4xUIeHulCJmLEmW6nmFvFc6L
         Ku7Mo7ZPzgnX0xN9atalZRLR2Kn1p3JvJJCeqvs7EYs3qrhZbeeg8+VCvt3ZjTZIicrZ
         cHVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=djFU3bwIm2dWbF2wfugf2VkbB/2Bf22UNSx4/ilQaNg=;
        b=saTdZkWL2zYnIxnX6N0BXXnPi+uAsxTI41CnGzNo8/QFDeMP+o2pgjJYG+4HlZKh6D
         DkrI4CjfA4+O6WsCHXK4RHQJb8+YZX0Ki2/4eN24mi4qWf418W40vUoq8yholrjiiHf+
         zmIl67tahlJWvkZt59vfs23t/F2aes7t/qAwDrJHgDSyqMkxeRA5F6KNT3SK9HLuyvPl
         PT1dFyixFY8xB5pXn8AsV/hfVErp5CHkMR01egLlDF3PKHjpI1DlU2j98Gw+tYhDyy2s
         gVeNQ+UxZi/+iww3E4suYmkEz5TEInJoU/ciDKScJEmrm/tT8YrYz8DstuFLXc617VdK
         hyiQ==
X-Gm-Message-State: AOAM531EZn14PeVzB9bZBKRezqoX3WNIzUPIO3nub8d9Xy3VVfTIbXS7
	btkcBQCcVfWibuguMJqLXWGecNla0AfMzos/fEE=
X-Google-Smtp-Source: ABdhPJxq9GZLl5PurGSaxu0s+t49aKJFCun2nPb5R7v9zhrAscf79b7nUj6FP9sMIJc5KRMuDMwS5PCJMFtmfbaRa10=
X-Received: by 2002:a05:620a:209b:: with SMTP id e27mr8270668qka.431.1595272915474;
 Mon, 20 Jul 2020 12:21:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200719204923.20911-1-akuster808@gmail.com>
In-Reply-To: <20200719204923.20911-1-akuster808@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 20 Jul 2020 12:21:29 -0700
Message-ID: <CAMKF1spGwv6ARwhLBZh+CdpKY17qYUX7HP+pKqoat+6LCfSmKQ@mail.gmail.com>
Subject: Re: [OE-core] [master][dunfell][PATCH] glibc: whitelist CVE-2010-10029
To: akuster <akuster808@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, Jul 19, 2020 at 1:49 PM akuster <akuster808@gmail.com> wrote:
>
> The update via Commit https://git.openembedded.org/openembedded-core/commit/meta/recipes-core/glibc?id=2c7e0e0bf32eb1ed0b7d8acddb16c0d1e93f2aa1
>
> should have added the whitelist for this CVE removed
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta/recipes-core/glibc/glibc_2.31.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-core/glibc/glibc_2.31.bb b/meta/recipes-core/glibc/glibc_2.31.bb
> index 61679e2c1cb..9b2cf1bdeb4 100644
> --- a/meta/recipes-core/glibc/glibc_2.31.bb
> +++ b/meta/recipes-core/glibc/glibc_2.31.bb
> @@ -1,6 +1,8 @@
>  require glibc.inc
>  require glibc-version.inc
>
> +CVE_CHECK_WHITELIST += "CVE-2020-10029"
> +

thanks for fixing it, it should have been part of original commit

>  DEPENDS += "gperf-native bison-native make-native"
>
>  NATIVESDKFIXES ?= ""
> --
> 2.17.1
>
> 
