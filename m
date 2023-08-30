Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 670A6C83F01
	for <webhook@archiver.kernel.org>; Wed, 30 Aug 2023 08:08:41 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.9329.1693382914393137588
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Aug 2023 01:08:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cfQGg5ry;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-31dcd553fecso2415520f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Aug 2023 01:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1693382912; x=1693987712; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QbNlK0FCSZa7T+S+1W9tAIwNX1bevkSZz1bOSyVIg0Q=;
        b=cfQGg5ry1J6uSF10Sf6Ks8tLrGsr59pkIsS7bu+1RSJyWhhIHFlDq0IBVVIC5/sI9+
         exkmhSXLedlSsSrqiF1XIwouSCnMmeRJpC5OFWwu6rmNw7XPxc2ma2X0DDDGdub+sB/J
         f6bIQgNvO9M5zeC2D7mbMBDhrg/Zg2AyTYytw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693382912; x=1693987712;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QbNlK0FCSZa7T+S+1W9tAIwNX1bevkSZz1bOSyVIg0Q=;
        b=j9y+JBsccXcgcsHucYNNHwk/Ecwu8SJwGfLpm8YMJUre9D5aga+xpGlG2z/XkdUois
         rYRxQTmgime6DwiUbLA8q1Uv7bUxuFSqMMdf7EdjR017nAXp6wI71V5y9s3qPuCddNyH
         BQ3lfQ4N1OtSF8f+XObBHsanCCZr0KKNkYXwbWV6fTAUgx99JpColKwK72ffyN4HQ8kS
         nW/mdY99GNUfBXdFlfX3xYyxPCLfF3UK+fzoDx7Jg0+xJhSWSgPo4lXa/K4DgkXN5vme
         jr7Iu231B79Y9WYisgCmS7zCvDsd7sUZ+6BrwUCt9AJJLgF3vq8MC9nPmUT3VuETUfkt
         F7Jg==
X-Gm-Message-State: AOJu0Yy8x0nj5wRMdkoWKvlchKQPymeCff0dV16hn156d1tfgHQ1pS7n
	B+faQE44hdvvbAEdTQHqFuXmWw==
X-Google-Smtp-Source: AGHT+IHEIwTRtIuTba6/fjBD8FbCwd3QgDu2MoAotFqyiPhZHijAXGzzVyTMNaBTNidBJ4DZBy1Eng==
X-Received: by 2002:adf:fc85:0:b0:319:55bc:4416 with SMTP id g5-20020adffc85000000b0031955bc4416mr985209wrr.5.1693382912140;
        Wed, 30 Aug 2023 01:08:32 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:15ec:a052:9304:60a5? ([2001:8b0:aba:5f3c:15ec:a052:9304:60a5])
        by smtp.gmail.com with ESMTPSA id k1-20020adfe3c1000000b0031c6e1ea4c7sm15778987wrm.90.2023.08.30.01.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 01:08:31 -0700 (PDT)
Message-ID: <7b5715489ab7dfbc7a6d16ab14d89039b447d0db.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] bitbake.conf: add bunzip2 in HOSTTOOLS
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: aplanas@suse.com, openembedded-core@lists.openembedded.org
Date: Wed, 30 Aug 2023 09:08:30 +0100
In-Reply-To: <20230818093056.10499-1-aplanas@suse.com>
References: <20230818093056.10499-1-aplanas@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Aug 2023 08:08:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186871

On Fri, 2023-08-18 at 11:30 +0200, Alberto Planas via
lists.openembedded.org wrote:
> From: Alberto Planas <aplanas@suse.com>
>=20
> rpm2cpio.sh can make calls to bunzip2 to uncompress the RPM payload that
> conform the cpio file.
>=20
> bzip2 is already part of HOSTTOOLS, as a link to the system installed
> bzip2.
>=20
> This patch add bunzip2 in HOSTOOLS list as a non-optional binary, so is
> available to rpm2cpio.sh when it is required.
>=20
> The currect rpm2cpio.sh has other calls to gunzip (present in HOSTOOLS),
> xzcat (missing), unlzma (missing) and unzstd (present in HOSTTOOLS since
> bff58d337890e804d33d7decbaa46065a4d3bba4)
>=20
> Adding the missing ones will not add any new host dependency as xz-utils
> is already listed as a requirement.
>=20
> Signed-off-by: Alberto Planas <aplanas@suse.com>
> ---
>  meta/conf/bitbake.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 599bbc4ba8..b19f265b3d 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -516,7 +516,7 @@ HOSTTOOLS_DIR =3D "${TMPDIR}/hosttools"
> =20
>  # Tools needed to run builds with OE-Core
>  HOSTTOOLS +=3D " \
> -    [ ar as awk basename bash bzip2 cat chgrp chmod chown chrpath cmp co=
mm cp cpio \
> +    [ ar as awk basename bash bunzip2 bzip2 cat chgrp chmod chown chrpat=
h cmp comm cp cpio \
>      cpp cut date dd diff diffstat dirname du echo egrep env expand expr =
false \
>      fgrep file find flock g++ gawk gcc getconf getopt git grep gunzip gz=
ip \
>      head hostname iconv id install ld ldd ln ls lz4c make md5sum mkdir m=
kfifo mknod \

I ended up thinking we should take this in favour of an easier life. It
resulted in this repoducibility issue:

http://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20230829-oldigjb=
2/packages/diff-html/

sadly I only discovered that after merging the patch :(

Cheers,

Richard

