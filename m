Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web12.1940.1631644874310752980
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Sep 2021 11:41:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=xd2nx9Jz;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.47, mailfrom: steve@sakoman.com)
Received: by mail-wm1-f47.google.com with SMTP id e26so296327wmk.2
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Sep 2021 11:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7q30/s8Ev6mk0DxChY/4lE7tbCCQZsdm/hBpaEg2MBc=;
        b=xd2nx9JzwwolAT/v/v3LbLEJjQuyVBedbrMp2MBkx93GBI+w/N5Adm8mWckDkmdiXK
         8HhHZ/TaKyaBtPHghjzZV8SpR/r3ykxnYNzrUNXDZcegDNT4a9VPwc46NANBIialZ75Y
         xpQfsCXc89U7TFT5jBXUz1nr4PwCnits54fZjo2TD0n2GmOsN84dLZaeBAZJmjXNyVHR
         enWXkucvqUjqOOy9BPikzs1WImpLpY4jNqB3VLPqPlo1OPrDbDt5Oty3ujeELLxpHKRn
         1YD8K6WV4gFZPEvigP84HOhda/1C/njDpe7iA0tic0r0zKfGQWkVpymXcABIlzep7zSm
         qPeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7q30/s8Ev6mk0DxChY/4lE7tbCCQZsdm/hBpaEg2MBc=;
        b=ySzTT4PyAbhlBOW4GEUZarBcRHiN68CKZKJbv/PS/Kefzsv6YwbFyC9MyfyNI9AFfa
         mp6zjf8vczptEAK9hX4QYHOT3UeRmj9UhIXb/SPuft6ODYWvAeCYvloA4HgXnP/DsNHm
         X28sUeiHw6/a3X5a4+K5C2FwGpGi0cwKzuGDy5YOKjhoSFF45gP5DQIFZ3xj0d9TZKVM
         HGiz5f2ZFGze90ARBBX5jDWO3iWsYMGZd8qSmkT26o4lUPkY4zEm2/QYrjvkS96NT6Ed
         4Ml2x1B+li0hzLVHv5bUAOc22ELwbi3umOn/TK3k6MsdAUzkWSb91iXlIX4huuadiG7n
         iOJw==
X-Gm-Message-State: AOAM531gni9WRFT/YyIm4aw5fV5gM9jwmIcaU4Vl6bDFbYhDY1htjWCN
	GUFGVXei69zVWh7HGijtnOrVi1eXNS0BAIkv10bS3A==
X-Google-Smtp-Source: ABdhPJwI7wpceWjBMVyiCdGxglxnLtwM7SZS1p5bPtexUn4pb2ECmEbMPaq+dLF8kM+Gpd4ynG7IDU4DgH/Leipw/Aw=
X-Received: by 2002:a7b:c8c3:: with SMTP id f3mr648187wml.30.1631644872525;
 Tue, 14 Sep 2021 11:41:12 -0700 (PDT)
MIME-Version: 1.0
References: <16A4C2594C8DE450.1120@lists.openembedded.org>
In-Reply-To: <16A4C2594C8DE450.1120@lists.openembedded.org>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Tue, 14 Sep 2021 08:41:00 -1000
Message-ID: <CAOSpxdbPVKGeYLc6A=p37r9rOCP+wjTrCpeKnSSWOXTQ+NsA1g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] [master] [dunfell] [hardknott] Revert "db: update CVE_PRODUCT"
To: Steve Sakoman <steve@sakoman.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 14, 2021 at 8:04 AM Steve Sakoman via
lists.openembedded.org <steve=sakoman.com@lists.openembedded.org>
wrote:
>
> The CVE database correctly reports CVEs for oracle_berkley_db and
> berkley_db.  We use the oracle_berkley_db source tree and therefore
> should only check for oracle_berkely_db CVEs. Otherwise the scanner
> falsely reports CVEs that are fixed in oracle_berkley_db

Please hold off on taking this patch -- I need to do some more
research.  I may have confused myself :-(

Steve

> This reverts commit ad799b109716ccd2f44dcf7a6a4cfcbd622ea661.
>
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>  meta/recipes-support/db/db_5.3.28.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-support/db/db_5.3.28.bb b/meta/recipes-support/db/db_5.3.28.bb
> index d5b788a3d7..5e9305ab06 100644
> --- a/meta/recipes-support/db/db_5.3.28.bb
> +++ b/meta/recipes-support/db/db_5.3.28.bb
> @@ -15,7 +15,7 @@ HOMEPAGE = "https://www.oracle.com/database/technologies/related/berkeleydb.html
>  LICENSE = "Sleepycat"
>  RCONFLICTS:${PN} = "db3"
>
> -CVE_PRODUCT = "oracle_berkeley_db berkeley_db"
> +CVE_PRODUCT = "oracle_berkeley_db"
>  CVE_VERSION = "11.2.${PV}"
>
>  PR = "r1"
> --
> 2.25.1
>
>
> 
>
