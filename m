Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B535C00140
	for <webhook@archiver.kernel.org>; Wed, 24 Aug 2022 08:52:21 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.8740.1661331134976085035
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Aug 2022 01:52:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZXojWE2D;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id z16so1095461wrh.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Aug 2022 01:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc;
        bh=tuukqMZLaNnCZwTTekPmWFhZVlgV3LDCazeIVTK2VX0=;
        b=ZXojWE2D91yu+GngewApB06UI9SMJh2z5VmqTTA3Yz1tspuOf7w72MMgH8QExnuJtt
         DqQlkJiPpOrWbLBKM95TgWjFPuV2FwSbFBHpX1EZjNsQ7zAlfJyh7E19uRSzUhCIEAuB
         MslPaWVZ5FXdBJFlndlUV9DVMdgm66xjB4OEQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc;
        bh=tuukqMZLaNnCZwTTekPmWFhZVlgV3LDCazeIVTK2VX0=;
        b=QZM7R94OlOcfRH6sTcNrfnRGQlNZJLg9EMbLYLTf8AzAZwEeBBB7k3SmOfADx4vVVW
         QfcutA3yee1bwnG0Rzks+QIizND0TvDXmzR1ZIIvwWrb6AFHA10b0RdsfYa3N4xq4hOE
         g6arqDe2ZCdtOQbqb6t154bEDCVna8kdsalaal1aa8XbzAhwmYhQG67qDZTd6jPa5rgD
         Cy9veLOft5e37uGI/4CrG4+LGK9VBverPyb9zhZ3QE84rpo6ZvwsFMZ3bFlY6M1yUHW+
         x4eF9eX1OkEj7T49Nab1VNya+0KsMhvieR3Al5sWzEcVoLDc4b4SGxlgX2nrPdPf5deV
         n3Cw==
X-Gm-Message-State: ACgBeo1lO/eGbT8F9vYOpqQVeUF2e5IW8gzNxi+qcS8D5ABQksNj+aYD
	TxYo1YuLvbmT8kfc/11tLOxlQw==
X-Google-Smtp-Source: 
 AA6agR4gxeELvGHKuEMTrlAD/Apv1+PiuMx2NhKoPjoNe8dKlnJrEr/3jwCzHiUYOPcBBwKMQ0IXAw==
X-Received: by 2002:a5d:6d85:0:b0:220:7084:35e9 with SMTP id
 l5-20020a5d6d85000000b00220708435e9mr15813405wrs.11.1661331133336;
        Wed, 24 Aug 2022 01:52:13 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:4e4:9da0:6de0:5e33?
 ([2001:8b0:aba:5f3c:4e4:9da0:6de0:5e33])
        by smtp.gmail.com with ESMTPSA id
 r2-20020a1c2b02000000b003a5b6086381sm1113811wmr.48.2022.08.24.01.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Aug 2022 01:52:12 -0700 (PDT)
Message-ID: 
 <6ca1d415a0faeba53e6a3945bd1fafd89866e2e9.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] oeqa/sdk: extend rust test to also use a
 build script
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Bergin <peter@berginkonsult.se>,
	openembedded-core@lists.openembedded.org
Date: Wed, 24 Aug 2022 09:52:11 +0100
In-Reply-To: <20220823085636.30868-2-peter@berginkonsult.se>
References: <20220823085636.30868-1-peter@berginkonsult.se>
	 <20220823085636.30868-2-peter@berginkonsult.se>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Aug 2022 08:52:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169795

On Tue, 2022-08-23 at 10:56 +0200, Peter Bergin wrote:
> The test for rust in the SDK is extended with the simplest
> possible build script. This will make use of the host toolchain
> for building build.rs before building the rust package for target.
>=20
> Signed-off-by: Peter Bergin <peter@berginkonsult.se>
> ---
>  meta/lib/oeqa/sdk/files/rust/hello/build.rs | 3 +++
>  1 file changed, 3 insertions(+)
>  create mode 100644 meta/lib/oeqa/sdk/files/rust/hello/build.rs
>=20
> diff --git a/meta/lib/oeqa/sdk/files/rust/hello/build.rs b/meta/lib/oeqa/=
sdk/files/rust/hello/build.rs
> new file mode 100644
> index 00000000000..b1a533d5dfa
> --- /dev/null
> +++ b/meta/lib/oeqa/sdk/files/rust/hello/build.rs
> @@ -0,0 +1,3 @@
> +/* This is the simplest build script just to invoke host compiler
> +   in the build process. */
> +fn main() {}

This seemed to break everywhere :(

https://autobuilder.yoctoproject.org/typhoon/#/builders/48/builds/5773/step=
s/13/logs/stdio

and many others.

Cheers,

Richard


