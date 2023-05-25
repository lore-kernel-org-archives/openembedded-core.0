Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9701C77B7A
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 10:52:58 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.8737.1685011976675259366
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 May 2023 03:52:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=R7LICP4/;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3093a7b71fbso1893577f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 25 May 2023 03:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1685011975; x=1687603975;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sKhoXF5sMVV7Ry/KiKykBtAQSvlQwjg2TwZgUDz0gYw=;
        b=R7LICP4/Zgn2cDsf5Jm97Yy/DXIEP2ybB4faM46/HVIqs96iwaG+GWni6A3Ncdnxsw
         B3JJtTRxsZTAdNFYKxFAu2HkgCHA9dpFFpzscHHmWcstt9w0vuWTZpXvmN0NNirU+lsy
         sLmOGKGWHvmK2ttdEmQrF3JCE4nzlnftmfObU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685011975; x=1687603975;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sKhoXF5sMVV7Ry/KiKykBtAQSvlQwjg2TwZgUDz0gYw=;
        b=CLSu0Bc7iUD7NE1Xq7pWTXlOnl9xLL1HzYhySzqtk64/IIJ8zSXi3HfhaeMUsJGLwP
         QLMrpWlrmNb5MEms0igfeXRp0BkhSOk32X0VrLYHvPfA+Kd4BYgWSf4XZcoRrlasgA86
         vQoUeSPtVf+DTQPuWcN0eEVQDU8G3U0FkMoppS8Opr35FEu7R4rPBEIpc5pp8pYjk6J4
         Bz8v67CxNnjUZkp8uDJ7E3RV6eG2+TWpkir+ofedwTtdocWSSIeBb5DneTkE88/DBh5K
         xv/qRXfAGeso/tJd517aTRm1bZshoUxfOcl1XSUeM9YzBVOeEOgH8FqvGpxc23yNEP7v
         +ziw==
X-Gm-Message-State: AC+VfDxntgyv5Z0SLOntNKIZInrsmv75etm605cHoBF9sbQJRSPg7nNp
	Olr4YSxghUQQ9nMYQK5ihIWbJA==
X-Google-Smtp-Source: ACHHUZ6kkCGhUBqrsSWylEIKauHrKrxh7XpGRkoMhEoS6joHkJdulHTblDhepPw/M6LFAoGFXadl1Q==
X-Received: by 2002:a5d:504d:0:b0:2f5:aadb:4642 with SMTP id h13-20020a5d504d000000b002f5aadb4642mr1937159wrt.41.1685011975044;
        Thu, 25 May 2023 03:52:55 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:85f3:29ee:f2af:493a? ([2001:8b0:aba:5f3c:85f3:29ee:f2af:493a])
        by smtp.gmail.com with ESMTPSA id g14-20020a5d540e000000b00307a86a4bcesm1418978wrv.35.2023.05.25.03.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 03:52:54 -0700 (PDT)
Message-ID: <773baf587feb68c4d83cbd8ce5f9fd6fef64998a.camel@linuxfoundation.org>
Subject: Re: [oe-core][PATCH 2/2] classes: Add new packagefeed class.
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Charlie Johnston <charlie.johnston@ni.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 25 May 2023 11:52:54 +0100
In-Reply-To: <20230524215526.323283-2-charlie.johnston@ni.com>
References: <20230524215526.323283-1-charlie.johnston@ni.com>
	 <20230524215526.323283-2-charlie.johnston@ni.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 May 2023 10:52:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181710

On Wed, 2023-05-24 at 16:55 -0500, Charlie Johnston wrote:
> Added a new packagefeed class that contains both a
> packagegroup and the package index builds. This allows a
> one-line bitbake for a packagegroup that defines a feed
> without explicitly needing to run the package-index recipe.
>=20
> Signed-off-by: Charlie Johnston <charlie.johnston@ni.com>
> ---
>  meta/classes/packagefeed.bbclass | 5 +++++
>  1 file changed, 5 insertions(+)
>  create mode 100644 meta/classes/packagefeed.bbclass
>=20
> diff --git a/meta/classes/packagefeed.bbclass b/meta/classes/packagefeed.=
bbclass
> new file mode 100644
> index 0000000000..b83ac54f21
> --- /dev/null
> +++ b/meta/classes/packagefeed.bbclass
> @@ -0,0 +1,5 @@
> +#
> +#   Special case of packagegroup that includes package index builds.
> +#
> +
> +inherit packagegroup package_index

A new class with two inherits in it doesn't really seem worthwhile to
me? Was there more you planned to add here?

Cheers,

Richard

