Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51755EB64D9
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 12:50:31 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.17272.1686833424655340131
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 05:50:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=CpGQE1AS;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-3f8d2bfed53so5907765e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Jun 2023 05:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1686833423; x=1689425423;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zDiAS5k4kRclQtgFpIxnkXQs8nDhe0z4cZ1Qt/KEnQQ=;
        b=CpGQE1ASNHppFPw4rNp5O0aHgSoz2E21KRPEPoQR7cx64Tdlobygc96B6Sgjw+oEdu
         F4uY9O/g6En+peyY0LFJ1HR7WI4wHIU+Tiv74QHItHEz2OUw5tBaH2/4rZXpWL0FjHJF
         A/sZ+smeTf7FSYvOmroK2AZTKQIqTlieUwhgw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686833423; x=1689425423;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zDiAS5k4kRclQtgFpIxnkXQs8nDhe0z4cZ1Qt/KEnQQ=;
        b=kGg7YSvqhaZmoP6L9KAEc39TjYUfj4Y5FXamXd5aKGbb9wQV0B61/taCM+I+b2Agfx
         FqSo/SyFv488Degvhz/Big5LHfbVPQSEbpPv+bW3Lofgljz3GZ1X+x2jBkvJ1UPCYz9I
         cZpez8T4pmLSf2hYHlM7Uog6ABiJf7lL1QMaMEz0fBqLi3abMFMISrq7EkUwZZW9uAdU
         TK8HCJxYNg3IWs9Dj27GE1K8YISNkxAkStEbqn2rBg1YVTPQFWEXb+OmBZ6xNFQHe/My
         /m8HrByIAv4+DiNuF2qFppv33db+DVG1bYyQ0uYMUCK3mG0V91f+m2+Q4gkkun35HauW
         Y5Zw==
X-Gm-Message-State: AC+VfDz2UMK/dOPAjSDKSlY2nfS4yEGRh02Q9S5ca3nNCE5vcsEqm7V0
	kbsnvsom52JxYEBeUU3yvHN9E0E0uhy1nCRjGxM=
X-Google-Smtp-Source: ACHHUZ5U1dvNDNJQ29/F9s+uAIOYW1nlCV3i+z8A+vAxalP4P0rAtActZp+mtptPd1ILS3gcNvDPmA==
X-Received: by 2002:a05:600c:5254:b0:3f8:651:4b37 with SMTP id fc20-20020a05600c525400b003f806514b37mr4203784wmb.2.1686833423043;
        Thu, 15 Jun 2023 05:50:23 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:441c:bff7:bd09:d1e1? ([2001:8b0:aba:5f3c:441c:bff7:bd09:d1e1])
        by smtp.gmail.com with ESMTPSA id f26-20020a1c6a1a000000b003f7ea771b5dsm20715091wmc.1.2023.06.15.05.50.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 05:50:22 -0700 (PDT)
Message-ID: <3c195fe070c377e91e697d5eb9eda135e2959ff4.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 2/2] bitbake.conf: add unzstd in HOSTTOOLS
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: aplanas@suse.com, openembedded-core@lists.openembedded.org
Date: Thu, 15 Jun 2023 13:50:22 +0100
In-Reply-To: <20230615105447.29690-2-aplanas@suse.com>
References: <20230615105447.29690-1-aplanas@suse.com>
	 <20230615105447.29690-2-aplanas@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jun 2023 12:50:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182856

On Thu, 2023-06-15 at 12:54 +0200, Alberto Planas via
lists.openembedded.org wrote:
> From: Alberto Planas <aplanas@suse.com>
>=20
> rpm2cpio.sh can make calls to unzstd to uncompress the RPM payload that
> conform the cpio file.
>=20
> zstd is already part of HOSTTOOLS, as a link to the system installed
> zstd.
>=20
> This patch add unzstd in HOSTOOLS list as a non-optional binary, so is
> available to rpm2cpio.sh when it is required.
>=20
> Signed-off-by: Alberto Planas <aplanas@suse.com>
> ---
>  meta/conf/bitbake.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index e28df7478f..702881144e 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -524,7 +524,7 @@ HOSTTOOLS +=3D " \
>      python3 pzstd ranlib readelf readlink realpath rm rmdir rpcgen sed s=
eq sh \
>      sha1sum sha224sum sha256sum sha384sum sha512sum \
>      sleep sort split stat strings strip tail tar tee test touch tr true =
uname \
> -    uniq wc wget which xargs zstd \
> +    uniq unzstd wc wget which xargs zstd \
>  "
> =20
>  # Tools needed to run testimage runtime image testing

Couldn't we just use zstd -d in the script? They're always the same
binary anyway as far as I understand it...

Cheers,

Richard

