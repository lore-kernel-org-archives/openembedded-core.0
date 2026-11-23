Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.51912.1795432075696282301
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Nov 2026 03:07:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=QcvF53fo;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb6c7b6dbdso28788045e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2026 03:07:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795432074; x=1796036874; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8t44jhXnr6lk/TvtV2HJxaQLMldC9CyzHJtr1t7Q3y8=;
        b=QcvF53fovWU2tM0RqRw/V7PdB43sobGn+JjrTwp8jaz72leo2Wvq1qTQW2M18KvZLd
         NUfH0Ils4SyK0z+3ijTUQh2pgB5Fr6hueBi4GD84mACBjlVMqJf1myb6tn1/ZszmhYzX
         /ctPFJvdlxdCGJJG/ZSHE4UGlrE2lR92MbulBMvLFjgfQFCskK/qvZk5EZBkwcu+DU7e
         EqU/I8TaWmLtR2JYyS34pDkNlUukNPF2Oycbroqe70DzA9CweqoI0zOOzh2tVbgsDbQx
         AKiUjr39q3FnakR4/NAXE7iGMxPXTcFms8HyJM0w6FRwasfWr8/uQDWvhyIpdSSMa1vq
         iMmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432074; x=1796036874;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8t44jhXnr6lk/TvtV2HJxaQLMldC9CyzHJtr1t7Q3y8=;
        b=zwii/xD0p3GjuehiXXOF3MWk7hpmQRBuxRRA1x4Hk9tzTruPw+wlzLIPYVgfhF62Yk
         41Q9KYEr9iRqUZG8YDvyDl2FQ9Z8lROOMIl1dPMU6GGoc564ezIKwyLGuo7k9IPAcPPD
         mElwHr6QI7OLNTYzdW4rktCx90WArH/aCBu5RFmi8hxiQQ1xOJ6m/R7907l0Mzf3oPk8
         97NLYjqn+I3iZjxP6V8K0ntMy4TVnnqrE0jpGdg+DZ9ZdJxyaUObsfuhdjZgFgOaR5ci
         q7s6pesRdbwvgRP8xSy60t+lNwke87DOiVYRDHoUcGBf6sL7M6d7FlHes+126/xEajSF
         sQYQ==
X-Forwarded-Encrypted: i=1; AL+hErFR9VtZtY2nGHU8t7sQ4M1ERAZEJwvpstE5CPxO+Q0emSJWybocmV6F+uvwSCW0z7LORYve8WG88G8PDalsJH1BqA==@lists.openembedded.org
X-Gm-Message-State: APuU4Z8GUABUkHPgS6n6Bxq2dkg50xM9rdp0Vmxi+gzh60yWhb+uQPxT
	utlcBr9DDksoiKA5A9li5g9r2v3kAQCYRKsEoWes+gJawKPbDZ6Qgc4YVbSrriQV1SE=
X-Gm-Gg: AZFdTZdmrGqkhKF3dgP3414opInck72J3WagpraDxfpOnS+jIqiFZGlZsIUUudJ1apC
	nxrN+JvIT6+3pgj6svGtxPlul1/+zqcclB4VOib00pWqTzU2YLFv+XwUcZLHVhma1NCm5vKuCte
	qjT5KHPt+ZWr7Zj1y+iKQMUA/gkUOLZMC7/JFC4EhDOg7C04rlABZfUhvi85lPuNvAS7VJ9p6Rm
	NU3ZziHVOWgAh0mPvMe4NRqGwdyvhcT1Lg4x2pKPyZkiyznwYHstgy5GG/XDpylxVtaFR7+uwmW
	qTvfAkw8h+zZqudsSFHj3jJiebVhh1mrqCZu+H+a+cYEOb9TGoGOZOKgTAYE6ZBU4HLhW3RSjES
	+k8jarGice4ZHGu2N3oVQyDqjFNRruwoSDv426UUDJkTHKH4AEnLjFzcT95fjLjZUq/3ZrjJhuT
	cXyFab5gd/9PvBrVkNPleiSdznwnqM4PtLWYvUXOIHNzw/YubZUIthbvvx3IP8uqDMkIoP3nyf4
	kdu1bZSmsUccwbiVddBM1Y3NnT6EHwcu3VLmni/xEmzqfnUJE6dHN1jezcaIFBq6lE6YLP2To9b
	i/1IeELz06PIzkx7FwzGwzLbUDIz6ehMMEilnj+xLY7SgD6qdp+73GEXp5EUp/C2doziootYqBW
	Sdr2uBT/WQnPStQ==
X-Received: by 2002:a05:600d:1c:b0:4bb:685e:cc41 with SMTP id 5b1f17b1804b1-4bb8c526ac4mr186316175e9.8.1795432073837;
        Mon, 23 Nov 2026 03:07:53 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm157936115e9.0.2026.11.23.03.07.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 03:07:53 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Nov 2026 12:07:53 +0100
Message-Id: <DN2JJVPC3MA5.114RNC15I0JUG@smile.fr>
Cc: <hsimeliere.opensource@witekio.com>, "Wahid ESSID" <wahid.essid@se.com>,
 "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>, "Richard
 Purdie" <richard.purdie@linuxfoundation.org>
To: <tgaige.opensource@witekio.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [scarthgap][PATCH 2/2] python3-pyelftools: add
 missing runtime dependencies
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20261021123722.2713530-1-tgaige.opensource@witekio.com>
 <20261021123722.2713530-2-tgaige.opensource@witekio.com>
In-Reply-To: <20261021123722.2713530-2-tgaige.opensource@witekio.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2026 11:08:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250899

On Wed Oct 21, 2026 at 2:37 PM CEST, Theo Gaige via lists.openembedded.org =
wrote:
> From: "Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>
>
> python3-asyncio and python3-json are needed as runtime dependencies of
> python3-pyelftools else the readelf.py script run into the following erro=
rs :
>
> ```
> Traceback (most recent call last):
>   File "/bin/readelf.py", line 30, in <module>
>     from elftools.common.utils import bytes2str, iterbytes
>   File "/usr/lib/python3.14/site-packages/elftools/common/utils.py", line=
 11, in <module>
>     from ..construct import ConstructError, ULInt8
>   File "/usr/lib/python3.14/site-packages/elftools/construct/__init__.py"=
, line 36, in <module>
>     from .debug import Probe, Debugger
>   File "/usr/lib/python3.14/site-packages/elftools/construct/debug.py", l=
ine 7, in <module>
>     import pdb
>   File "/usr/lib/python3.14/pdb.py", line 87, in <module>
>     import asyncio
> ModuleNotFoundError: No module named 'asyncio'
> ```
>
> ```
> Traceback (most recent call last):
>   File "/bin/readelf.py", line 30, in <module>
>     from elftools.common.utils import bytes2str, iterbytes
>   File "/usr/lib/python3.14/site-packages/elftools/common/utils.py", line=
 11, in <module>
>     from ..construct import ConstructError, ULInt8
>   File "/usr/lib/python3.14/site-packages/elftools/construct/__init__.py"=
, line 36, in <module>
>     from .debug import Probe, Debugger
>   File "/usr/lib/python3.14/site-packages/elftools/construct/debug.py", l=
ine 7, in <module>
>     import pdb
>   File "/usr/lib/python3.14/pdb.py", line 77, in <module>
>     import json
> ModuleNotFoundError: No module named 'json'
> ```
>
> Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio=
.com>
> Reviewed-by: Hugo SIMELIERE (Schneider Electric) <hsimeliere.opensource@w=
itekio.com>
> Reviewed-by: Wahid ESSID <wahid.essid@se.com>
> Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit 0dc1a2f9df58cf2dd1418426e38e95372aecdcde)
> Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio=
.com>
> ---
>  meta/recipes-devtools/python/python3-pyelftools_0.30.bb | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/python/python3-pyelftools_0.30.bb b/me=
ta/recipes-devtools/python/python3-pyelftools_0.30.bb
> index b799f5acf8..bc981051cd 100644
> --- a/meta/recipes-devtools/python/python3-pyelftools_0.30.bb
> +++ b/meta/recipes-devtools/python/python3-pyelftools_0.30.bb
> @@ -12,4 +12,10 @@ inherit pypi setuptools3
> =20
>  BBCLASSEXTEND =3D "native"
> =20
> -RDEPENDS:${PN} +=3D "python3-debugger python3-pprint python3-logging"
> +RDEPENDS:${PN} +=3D " \
> +    python3-debugger \
> +    python3-pprint \
> +    python3-logging \
> +    python3-asyncio \
> +    python3-json \
> +"

Hello,

Scarthgap is at python3.12 and python3.12/pdb.py does not import json
nor asyncio:
https://github.com/python/cpython/blob/v3.12.16/Lib/pdb.py

How did you trigger this on scarthgap?

I suspect you were too quick to backport on scarthgap from one of the
more recent branches, I'll hold this for now.

Regards,
--=20
Yoann Congal
Smile ECS

