Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60208C433EF
	for <webhook@archiver.kernel.org>; Sat, 21 May 2022 21:25:43 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.9829.1653168333928779861
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 May 2022 14:25:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SY9sNUoE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id t6so15813915wra.4
        for <openembedded-core@lists.openembedded.org>;
 Sat, 21 May 2022 14:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=u0P5gnRq3itBxDTl8a5/PeNHL2ykVfXwmkoDCDKSI3o=;
        b=SY9sNUoEoyaOvZT9+VSxcaUsN6YTSQ28e/EwhoX9sd2D9o+cEpy1ftxJMCWb4GVMVj
         fjQTyrsL+peUsNTF/mQx9U5DFu4y8v6VgDu1NPH7Pjg0yKLtGp+Osl7mfvEQ77j1JueW
         7UILdeBzENKTYxiBA8T65RN362QdjKbU9Y10I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=u0P5gnRq3itBxDTl8a5/PeNHL2ykVfXwmkoDCDKSI3o=;
        b=d/1Qh6pqtKKmF1ffxtHHWRirmRWYOe57kR/GM1YqW3Jp04La0HUsTSgufdRZuOGljU
         r77lNIo/khf292Q4UjD3oAU4mbHvwkXJb+c4NvhEEyRcqCMw1D+vmz/UFtTul7HpLfc/
         ROoRqqHRJDlrYejfnhRsrf3620zfTuWa5SV7kl0K7HeAoo8LUrVxZGVVvy7BMXMygVFk
         IDKxqK0zm7/0yQuhNRV9by7w4kzfR+vkCGMV8G5RTVdGVbv5do5CqzwwnkiqlHu3fIcL
         RZe/u7M+5QlWr4odfGoyf9j6Hpo5ECNuUs1LvpL5g8/65j+ZQ5ETm3Uz069/mvCK8jvB
         NWbA==
X-Gm-Message-State: AOAM53273dle6FV+b+QFjkZMg46N0K3PnEY+aHTGuiGUy55fHFXiyVvq
	nILmp/zCTo7kSIHLfE+zVpFDWQ==
X-Google-Smtp-Source: 
 ABdhPJz1U5/CqZX7MldtW7nKTSkiD7E0sm0NPVcK+NLD9smeBN1GptrmuZVwm4YHsSIaCLCAuCmHVQ==
X-Received: by 2002:a5d:5887:0:b0:20c:83c9:b72 with SMTP id
 n7-20020a5d5887000000b0020c83c90b72mr13087092wrf.588.1653168332389;
        Sat, 21 May 2022 14:25:32 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a337:fcd8:5dd9:46df?
 ([2001:8b0:aba:5f3c:a337:fcd8:5dd9:46df])
        by smtp.gmail.com with ESMTPSA id
 p17-20020adf9591000000b0020fd392df33sm451771wrp.29.2022.05.21.14.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 May 2022 14:25:31 -0700 (PDT)
Message-ID: 
 <4bbc8472ffac36701ccc5d89dd100c6bf524acad.camel@linuxfoundation.org>
Subject: Re: [OE-Core][PATCH v4 1/3] eudev: Convert dependencies to
 PACKAGECONFIG
From: richard.purdie@linuxfoundation.org
To: Alex Kiernan <alex.kiernan@gmail.com>,
	openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alexk@zuma.ai>
Date: Sat, 21 May 2022 22:25:30 +0100
In-Reply-To: <20220521082520.5473-1-alex.kiernan@gmail.com>
References: <20220521082520.5473-1-alex.kiernan@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.0-1ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 May 2022 21:25:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165966

On Sat, 2022-05-21 at 09:25 +0100, Alex Kiernan wrote:
> GObject support was dropped in 252150e181c5 ("src/gudev: remove Gobject
> libudev support."), drop all g-i-r support which appears to be dead
> upstream.
>=20
> Fill out PACKAGECONFIG options.
>=20
> Signed-off-by: Alex Kiernan <alexk@zuma.ai>
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> ---
>  ...uild-Remove-dead-g-i-r-configuration.patch | 155 ++++++++++++++++++
>  meta/recipes-core/udev/eudev_3.2.11.bb        |   8 +-
>  2 files changed, 161 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-core/udev/eudev/0001-build-Remove-dead-g=
-i-r-configuration.patch

Thanks, removing dependencies like this does help the build a lot!

Cheers,

Richard

