Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A7E2EB64DB
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 14:03:24 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.8300.1687183396875273540
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Jun 2023 07:03:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=N0ub4Bou;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-3f8f3786f20so41753425e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Jun 2023 07:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1687183395; x=1689775395;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dOYVhnkhB1Boz7K0K3YBvDFTmSNgw0jZ556B9PsQ3K0=;
        b=N0ub4BoutG9qFR4I8TUkEb8wZAAX2EFszZsRf6h/KBkvyYKH1/werAdVk5JYjynF7V
         j0ZltErmX3sUM6lwKeRkEJhwOr1SlVV7+EsiyJnlrnT4XQHckDlruEsKE3kzUZom/2fW
         blVmdud71OH1R5i1evzCvBw13AYhvgPyiGpGg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687183395; x=1689775395;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dOYVhnkhB1Boz7K0K3YBvDFTmSNgw0jZ556B9PsQ3K0=;
        b=U4yciQRsD4IGSVHYCE8KgCcNHpe0/hGArow6EtSsN6/+CUNTLQe4dCAp7LoyO0QdgL
         wi3KQBZkEZLCF8ubz5j63Cx2dNVM0OedauY2CTICWGfExIa0lQWlh8RBRtNDivn5sm2/
         ydw74cVgpeAapjRKDxhGQgbUZhPKWkFPpregNE67GpBcQA/pSVEeYuM2VKOfpw45xv2U
         BkfjXTRfwJSS1MKUnATDNb5mUJmAiXfC1gePmo/oLkkNq7JTJ37xUr8FmWMe1uRC9DWP
         8YLBN3z33j3b6kZjaSibl5aXfrZLH3qqcsA4Ddo0p07KfM3gMbGe0F9XywBzJ38ie3jC
         A0Hw==
X-Gm-Message-State: AC+VfDwpvoJ6OOrk6QEMEMuqt14kZhKTRfa/Wu3BjRxOfy3t78T63p/g
	eXAvy0/V6baEDOMTW3HWVUkcSA==
X-Google-Smtp-Source: ACHHUZ5/28qFixopKS9x9nlO6qOpgrj93rvd82+5KlY7cx7cuDJ/XeqzYMXSRJIdD3/Ux3+XHp5EQQ==
X-Received: by 2002:a5d:530f:0:b0:311:14ab:5621 with SMTP id e15-20020a5d530f000000b0031114ab5621mr9443313wrv.30.1687183395298;
        Mon, 19 Jun 2023 07:03:15 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f105:ba55:87cc:dc34? ([2001:8b0:aba:5f3c:f105:ba55:87cc:dc34])
        by smtp.gmail.com with ESMTPSA id m6-20020adfdc46000000b0030e5bd253aasm31671420wrj.39.2023.06.19.07.03.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 07:03:14 -0700 (PDT)
Message-ID: <d114391afb2fb86d115abb740af5a4a9473848b6.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] runqemu-gen-tapdevs: pass
 STAGING_BINDIR_NATIVE to ifup
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Trevor Gamblin <tgamblin@baylibre.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 19 Jun 2023 15:03:13 +0100
In-Reply-To: <20230619135416.1640748-1-tgamblin@baylibre.com>
References: <20230619135416.1640748-1-tgamblin@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Jun 2023 14:03:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183112

On Mon, 2023-06-19 at 09:54 -0400, Trevor Gamblin wrote:
> Without this, runqemu-gen-tapdevs fails with the following error:
>=20
> [tgamblin@megalith build]$ sudo /workspace/yocto/manual/poky/scripts/runq=
emu-gen-tapdevs 1000 1002 4 tmp/sysroots-components/x86_64/qemu-helper-nati=
ve/usr/bin
> Creating 4 tap devices for UID: 1000 GID: 1002...
> Creating tap0
> Error bringing up interface: sudo runqemu-ifup <uid> <gid> <native-sysroo=
t-basedir>
>=20
> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ---
>  scripts/runqemu-gen-tapdevs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/scripts/runqemu-gen-tapdevs b/scripts/runqemu-gen-tapdevs
> index ec3ecb03b9..dc730e413d 100755
> --- a/scripts/runqemu-gen-tapdevs
> +++ b/scripts/runqemu-gen-tapdevs
> @@ -79,7 +79,7 @@ fi
>  echo "Creating $COUNT tap devices for UID: $TUID GID: $GID..."
>  for ((index=3D0; index < $COUNT; index++)); do
>  	echo "Creating tap$index"
> -	if ! ifup=3D`$RUNQEMU_IFUP $TUID $GID 2>&1`; then
> +	if ! ifup=3D`$RUNQEMU_IFUP $TUID $GID $STAGING_BINDIR_NATIVE 2>&1`; the=
n
>  		echo "Error bringing up interface: $ifup"
>  		exit 1
>  	fi

I'm a bit puzzled as I removed the use of STAGING_BINDIR_NATIVE in that
script?

Are you mixing different releases?

Cheers,

Richard


