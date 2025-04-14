Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03C67C369B2
	for <webhook@archiver.kernel.org>; Mon, 14 Apr 2025 20:56:19 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web11.5362.1744664178577429678
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Apr 2025 13:56:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=c+tzMyt4;
 spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7c6a59a515aso293178685a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Apr 2025 13:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744664177; x=1745268977; darn=lists.openembedded.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sNueODyk9Set2/jkA5bMGDV3mJMdsZwewHbp16CSTxk=;
        b=c+tzMyt4Fxnviz64u4odwnCVA3Taeajugj53A1oedXxajFckTChIIfX0Y5A9qSTRl2
         93tvv+8ywXozq1tQgDQie7Mi4R+n8kpBrU7C2Msj9OcEkIMH8K/6WWB9yJd92u6ytSgG
         bgJPoWhLqZbmTKRnKYWSpUzhLdTUW0bbchdjxZeHRaz8fSllQTciVcQ/5o2ZSOGofEMv
         bJwDADKGsPmdZd2KDw79zqlw8ut//VR2Li9il0r053ADsVfDPbw8AT58tuYffyQ4p/To
         NR8vbrNdJ7vZ6Zn9c65AlWqU4+Qid+GGMqEX6abFoUvOrXoyNROsyjmf9yNE+4a9KA6Q
         lNEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744664177; x=1745268977;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sNueODyk9Set2/jkA5bMGDV3mJMdsZwewHbp16CSTxk=;
        b=h3zcvfJwtRtEQHM/6/Zzh7HXMrIUAA8kZwLmvPwWkpFcEBSSHC1snSFP1QHWR1mMFR
         vZXeTs70Ge3VSms+VKivcIfuaffaST7bxpgd5txFZhET39esFlgrT2FI35LFOqpsZfCP
         fOtNdEyTzyfmft+wjZY9Kp5hT1fYWUkZts/SB3ieNJA0W1twA78QBhLiaRtWD/vqcjMO
         ShSAynIjF6v2cOfBQT6P3lDgTJZcEy9pKGPYIpxsS0KTcPnyRuWZ+mY3KtDH3cQQ7rAc
         snBMDSsuzg9vqrCY3XQSNGlq1YIEdHjWtQy1nTeJV3rgkrEIbZslgSbo7QUELQOZ9pmA
         d5JQ==
X-Gm-Message-State: AOJu0Yz6sOCjMlqMMpQ7X/5LzlbIIbGcwaClrj1kQii8VcZBAAcJJKgc
	Z8D+LhTuDvLJdMFkk2wMOBNbD3BSu85iiroXZr+RYjofcDSmJ6tNQ3qpyKH4
X-Gm-Gg: ASbGncu4e0uZa96FASKiSmy5uQ0CpJLEAQ0dsXAd0uTS4rw0yVQ4+BRkG09w8FI5IwM
	t/qDX39mhydnMD4RZIIf9zXFFIeQacZsqYf1nubSTlXGdRawmQ2rGsE1hJ2wpnjsePI9fZKCLvq
	iwMX1gTJFHDg/k0ty1HUrx5ylDKzZ0z6vuq13fOFem9MXmb/6Cd4EAAGbMo3FPge365wYz+QOWz
	HGh9BOfhK1+8L92qORoy3K2kCZvOxnaUMjpqZOTl7XNv4v3n5vJhbnDWmZLoFjCc+4n9o7UKufa
	b1/8swIcdoeVAANMflUx22+V2/P7QWpOY15sZFk6R8QnKjQhxsKqlt1Mvl/5AkH/Y19V
X-Google-Smtp-Source: AGHT+IGs+ct8Sf4BedJls7UwnM4vafIDkUb7GmU3D8IatUUfwJSnxZJ5F/8Y41MzQaZEeXYZgDF2tQ==
X-Received: by 2002:a05:6214:2681:b0:6ea:d393:962b with SMTP id 6a1803df08f44-6f230d79f18mr243868286d6.22.1744664177534;
        Mon, 14 Apr 2025 13:56:17 -0700 (PDT)
Received: from localhost (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f0de973230sm88456876d6.41.2025.04.14.13.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 13:56:16 -0700 (PDT)
Date: Mon, 14 Apr 2025 16:56:14 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: mikko.rapeli@linaro.org
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] oeqa wic.py: clean image build dir before
 rebuild in test_permissions()
Message-ID: <20250414205613.GA8398@localhost>
References: <20250407110946.47038-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250407110946.47038-1-mikko.rapeli@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Apr 2025 20:56:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214813

On Mon 2025-04-07 @ 02:09:45 PM, Mikko Rapeli via lists.openembedded.org wrote:
> The test builds images using wic and then with bitbake
> and compares results. This fails at least on aarch64
> build machine and multiple target machines due to
> pseudo errors. Fix by cleaning the build recipe
> build directory before rebuild.
> 
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
>  meta/lib/oeqa/selftest/cases/wic.py | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
> index 4f5d43b5ee..55c655cd6d 100644
> --- a/meta/lib/oeqa/selftest/cases/wic.py
> +++ b/meta/lib/oeqa/selftest/cases/wic.py
> @@ -674,6 +674,7 @@ part /etc --source rootfs --fstype=ext4 --change-directory=etc
>  
>                  config = 'IMAGE_FSTYPES += "wic"\nWKS_FILE = "%s"\n' % wks_file
>                  self.append_config(config)
> +                bitbake('-c clean core-image-minimal')
>                  bitbake('core-image-minimal')
>                  tmpdir = os.path.join(get_bb_var('WORKDIR', 'core-image-minimal'),'build-wic')
>  

I have seen this issue too, but it is intermittent for me; is this an
intermittent issue with you as well? This feels a lot more like a hack rather
than a solution.

