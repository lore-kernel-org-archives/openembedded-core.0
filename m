Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
 by mx.groups.io with SMTP id smtpd.web08.12515.1620738442388261167
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 May 2021 06:07:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=db6frU5H;
 spf=pass (domain: gmail.com, ip: 209.85.166.49, mailfrom: akuster808@gmail.com)
Received: by mail-io1-f49.google.com with SMTP id z24so18091043ioj.7
        for <openembedded-core@lists.openembedded.org>; Tue, 11 May 2021 06:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=kxNZfG9TfOp5M04nkF4ECVisMCfbg/rIQ3nrhq5sXV0=;
        b=db6frU5HtiDwtclwSv0tlBESjvUOCuyqULCRqfv2LYM5xLou1cL9aLuXScE7jo5443
         LyOq6kG2YMhayMQgmm7GEtcjO/5p+CYltf/+zdhHv/MA4knIsqQkv7HjRAutK5jjdHin
         /EU+APUID5++JFEe3LH1NGlS0Jgq7dynRJhKv5WumT79+syHkY6Sr9mniOR6N/e+JKq6
         mTG2wc36ena7KEW5sYg4vBbYw3sHke85AX/DZQkQsyxxG3pvxK3Wx6Wnevx+Mg2HMnqo
         YXMzHb72ns5qiWemnd4LO2sBPbC1rio6/BVLgijAgVwNlHJOGmrJJEvOoSu7+UtUtOHC
         9B9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=kxNZfG9TfOp5M04nkF4ECVisMCfbg/rIQ3nrhq5sXV0=;
        b=bJKvl66xyTI2+gxWqjNxVHh/MLq0A0Ajo0ce+LyBjXhYpC+wuiAfoF5aO4sYvvgSOq
         tDvdusRQ1FQkWchPiBRp7Abzx1DZJYp1ldSBfYUF/tLJR81e453xE/DR7S96mbHOsXVv
         h30WqDJyD1qgASoKbn+Vf0xFmaS3LFX6HJU2G2EkoSccHIkRaabuxT9BI9IG0IBuoz6T
         MOFF1ckbXiCnbx4ZMCPMcF+j3hapzWLG7qm0CbRUC+urURlP09bDYH3ocjWxSwXmUp0h
         q/kvY/O5Y3c/Rq9upIV2B1VqkDz8Skzit3iojRrmH9D1bvHeRC1nqyw564LzP6Qm/PzV
         zP9A==
X-Gm-Message-State: AOAM5314S01AbHmHMugtE3doioHrb/iR8Z3h6T+a3tLQ26/iGBw5+u/L
	r+Ayh7fMS3JJMTnzY1+ePM0BY8NV6UbxnA==
X-Google-Smtp-Source: ABdhPJztwMSvZyDhaYeQT415YfwDieRJN0V9DAfekWrPccbZpTsb23ZYWvMZp3ZIGgHQSrCpQmCJjg==
X-Received: by 2002:a5d:9598:: with SMTP id a24mr21947200ioo.24.1620738441216;
        Tue, 11 May 2021 06:07:21 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:f4b0:1313:b42f:b478? ([2601:202:4180:a5c0:f4b0:1313:b42f:b478])
        by smtp.gmail.com with ESMTPSA id h30sm9447472ila.15.2021.05.11.06.07.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 May 2021 06:07:20 -0700 (PDT)
Subject: Re: [OE-core] [PATCH] openssh: Exclude CVE-2007-2768 from cve-check
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20210510155625.2169407-1-richard.purdie@linuxfoundation.org>
From: "Armin Kuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <f492dd59-7957-18c0-49c9-af98ef04919e@gmail.com>
Date: Tue, 11 May 2021 06:07:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210510155625.2169407-1-richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US



On 5/10/21 8:56 AM, Richard Purdie wrote:
> We don't build/use the OPIE PAM module, exclude the CVE from this recipe=
.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-connectivity/openssh/openssh_8.6p1.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-connectivity/openssh/openssh_8.6p1.bb b/meta/r=
ecipes-connectivity/openssh/openssh_8.6p1.bb
> index be56fe43b9e..57ad5e841ca 100644
> --- a/meta/recipes-connectivity/openssh/openssh_8.6p1.bb
> +++ b/meta/recipes-connectivity/openssh/openssh_8.6p1.bb
> @@ -27,6 +27,9 @@ SRC_URI =3D "http://ftp.openbsd.org/pub/OpenBSD/OpenSS=
H/portable/openssh-${PV}.tar
>             "
>  SRC_URI[sha256sum] =3D "c3e6e4da1621762c850d03b47eed1e48dff4cc9608ddeb5=
47202a234df8ed7ae"
>  
> +# This CVE is specific to OpenSSH with the pam opie which we don't buil=
d/use here
> +CVE_CHECK_WHITELIST +=3D "CVE-2007-2768"
> +
That sounds like what a distro says when it provides you with binaries
where they control most things. I thought this was a framework to build
a distro so what I select , you don't know.

Too bad there isn't a var like CVE_CHECK_NO_UPSTREAM_FIX and have a
cve-check level to exclude those at will.

-armin
>  # This CVE is specific to OpenSSH server, as used in Fedora and Red Hat=
 Enterprise Linux 7
>  # and when running in a Kerberos environment. As such it is not relevan=
t to OpenEmbedded
>  CVE_CHECK_WHITELIST +=3D "CVE-2014-9278"
>
>=20
>


