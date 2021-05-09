Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.21906.1620584231900863405
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 May 2021 11:17:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=s1dbyQNh;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id t2-20020a17090ae502b029015b0fbfbc50so8785801pjy.3
        for <openembedded-core@lists.openembedded.org>; Sun, 09 May 2021 11:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=vhCbLhJ/pEpVkKW9wPKVKuPmJv+5c06xo9JL2gdNDow=;
        b=s1dbyQNhYZxwQCfnM3/zf7l5ryDQNRqM5gI+tNjZ1dj1faI3C6pS33/ncT36wkGqSd
         sPqlCrbXgiNHDVpPI9dS3opvoY6sft8lff0sCmN4R12PUS76CwDKttMgtacYsw+/tRWG
         ugk+YE8aCdv1rT+Vn1BQOd4uqBCU/s/t6xEtAhS8qSPUL5RumwtF4DSx766b4/sNZmIl
         EWmWyIdkTodsrNME+tZ5wlM5+Ts3jbjOolytMkw17a8z8iAopkuu7Rsbzw4D3uaY/pJT
         LHattfIcRUmfCkNOxgHMg4WG62iXrmXVPQ0jrrdys3kuM4t1W9TCY3gUUc+wHBe+jHgk
         2iKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=vhCbLhJ/pEpVkKW9wPKVKuPmJv+5c06xo9JL2gdNDow=;
        b=htx4Tr6O6FMzHdnLdXFqo8veet99o8tfNLp3IxG84G95irBS6Whl1q6jXZSjjEy8BH
         A1Vlp0hSNT+hqGUKUjvdHC6+mYu8R1GoQ3hC4geskrrygibA9Kn5cWeB/Baen3bTPH6Q
         3Tqkg/Ik+gB/Rrz65Z8n3lIFlC76/bWdnVxi2azYIrGa1ZdeA9UUl+9xyLGhfH2FdnL7
         EGXrDIe4A3REzkiCEO+elCe328Oj80k59+agppvvlZoStiTtrrdi4ATMrCjW6nzIkWji
         0warRZjNL3g8iO4agNTcZgrMw+SEfRv0JQZzm/F0BK3w86V107rIM5PqvFREzFXQzQ9b
         vy+g==
X-Gm-Message-State: AOAM533rzDYio2MvcSJh9yrP5uORbF0tTqxSBaVeyTkKrR5xnYNEWI8I
	QmlK9u6U3Y2nFN6Im+VQY9iWvi9i2msrhQ==
X-Google-Smtp-Source: ABdhPJyKt1NVKJ7WKy/Sb9z0onEreEWf2j9vdpjRhrsqWBNbhrbjurA6hJ7XoeCfA2dlwiObMTuenQ==
X-Received: by 2002:a17:902:b109:b029:ef:1ee:9d02 with SMTP id q9-20020a170902b109b02900ef01ee9d02mr16644488plr.85.1620584230869;
        Sun, 09 May 2021 11:17:10 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:f138:4616:c38c:eadc? ([2601:202:4180:a5c0:f138:4616:c38c:eadc])
        by smtp.gmail.com with ESMTPSA id k69sm9581611pgc.45.2021.05.09.11.17.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 May 2021 11:17:10 -0700 (PDT)
Subject: Re: [OE-core] [PATCH] cve-extra-exclusions.inc: add exclusion list for intractable CVE's
To: Steve Sakoman <steve@sakoman.com>,
 openembedded-core@lists.openembedded.org
References: <20210506171232.2832063-1-steve@sakoman.com>
From: "Armin Kuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <6a7e59c6-594e-b2c1-9d71-d9976fab4b70@gmail.com>
Date: Sun, 9 May 2021 11:17:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210506171232.2832063-1-steve@sakoman.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US



On 5/6/21 10:12 AM, Steve Sakoman wrote:
> The preferred methods for CVE resolution are:
>
> 1. Version upgrades where possible
> 2. Patches where not possible
> 3. Database updates where version info is incorrect
> 4. Exclusion from checking where it is determined that the CVE
>    does not apply to our environment
I do see the desire of doing this as it is one file to maintain if there
are multiple packages being updated at once.=C2=A0 This does highlight a f=
ew
things to me:

1) We have been dealing with this on a per-recipe basis. This is a shift
from that. ( Does this need to be documented)
2) Recipe Maintainers aren't engage in this area of activity as we had
original hoped. So we are working around that.
=C2=A0
Reporting a false positive is better than masking an actual issue IMHO.=C2=
=
=A0
So what was the Policy used to decide on what can be put into this file?
Did I miss that conversion ? Is it documented anywhere?


- Armin

> In some cases none of these methods are possible. For example the
> CVE may be decades old with no apparent resolution, and with broken
> links that make further research impractical.
>
> This patch creates a mechanism for users to remove this type of
> CVE from the cve-check results via an optional include file.
>
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>  .../distro/include/cve-extra-exclusions.inc    | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 meta/conf/distro/include/cve-extra-exclusions.inc
>
> diff --git a/meta/conf/distro/include/cve-extra-exclusions.inc b/meta/co=
nf/distro/include/cve-extra-exclusions.inc
> new file mode 100644
> index 0000000000..956b3a9a3c
> --- /dev/null
> +++ b/meta/conf/distro/include/cve-extra-exclusions.inc
> @@ -0,0 +1,18 @@
> +# This file contains a list of CVE's where resolution has proven to be =
impractical.
> +# It contains all the information we are aware of about an issue and an=
alysis about
> +# why we believe it can't be fixed/handled. Additional information is w=
elcome through
> +# patches to the file.
> +#
> +# Include this file in your local.conf or distro.conf to exclude these =
CVE's
> +# from the cve-check results
> +
> +# strace https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2000-00=
06
> +# CVE is more than 20 years old with no resolution evident
> +# broken links in CVE database references make resolution impractical
> +CVE_CHECK_WHITELIST +=3D "CVE-2000-0006"
> +
> +# groff:groff-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=
=3DCVE-2000-0803
> +# CVE is more than 20 years old with no resolution evident
> +# broken links in CVE database references make resolution impractical
> +CVE_CHECK_WHITELIST +=3D "CVE-2000-0803"
> +
>
>=20
>


