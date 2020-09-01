Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web10.11812.1598963545254204738
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2020 05:32:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eprdGova;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f66.google.com with SMTP id c18so1317685wrm.9
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2020 05:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=1RIXDJPb4wBdzqPkyBhNNV2NWuF9+PA+HNkGSrjLWtA=;
        b=eprdGovasIWr/u9euYFcYYUTaFMDDPb/SS81/wbM+AXjCSTwsuTODl+Blfm8uVbAGg
         lI2v3QZKBL/2CliwQpVflx5TIMg4OaJptOhEx/KcJRDffmg8UlbH9wCrwA/RrBMJnzV0
         b01I+QLANee4jdMA4B57Hv8xewYL31GJ+4QPE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=1RIXDJPb4wBdzqPkyBhNNV2NWuF9+PA+HNkGSrjLWtA=;
        b=OKQ0FboKelKjCQa4QjOPreQvjZpGesmshzYGDJRxZMlzOyVVyfPB4txnORbu8NhnvW
         UqG/2ExD619RAetvSs6TbGHeL1IV/OzbxbSU/kL4FRJ1MXtmA7CIrtddhrK+oibk9E3O
         Q+QcuZNULpLz3HV0ojzWNc654cMkrhe+0gMb7Sr2P/JKbBP+OoKAXKxHZZ5cDpTGA4Fc
         VwkjQAcoZbix4ccvdqd199aXPKv8kJCn1dhKTLFIJJWYGtpnz6jCHlO0ZPfDRGRsT+Id
         ddGOZuAb0M4LPGw/vo7xfe3+Y0RKADMYfKwHyW/CMF2itwSQnfakqxuzjYus2Wpnx+3P
         xVPA==
X-Gm-Message-State: AOAM5303zy8Hxrc3fP2UsYeZP2C5yFt9sUzyhVeizmKOIbLUgcoPYQ5E
	nLChLxmshE3P7Oj4RfGtnC3fWw==
X-Google-Smtp-Source: ABdhPJwW+eoQ20G2OTO+p5Rl4YW9cqE4XV3n4CMIgGj3Mz4+HGYgdwUs78QwyutAt5WkmVYJKw4VNQ==
X-Received: by 2002:adf:80cb:: with SMTP id 69mr1738483wrl.313.1598963543540;
        Tue, 01 Sep 2020 05:32:23 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from f.d.2.7.a.9.f.9.6.8.f.0.2.a.5.d.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (f.d.2.7.a.9.f.9.6.8.f.0.2.a.5.d.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:d5a2:f86:9f9a:72df])
        by smtp.gmail.com with ESMTPSA id c9sm1695275wmf.3.2020.09.01.05.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2020 05:32:22 -0700 (PDT)
Message-ID: <b2d48e4fdb1020a36aed221b472014cbf41735b3.camel@linuxfoundation.org>
Subject: Re: [OE-Core][PATCH 2/2] iputils: upgrade s20190709 -> s20200821
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Changhyeok Bae <changhyeok.bae@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 01 Sep 2020 13:32:20 +0100
In-Reply-To: <20200831095948.15750-2-changhyeok.bae@gmail.com>
References: <20200831095948.15750-1-changhyeok.bae@gmail.com>
	 <20200831095948.15750-2-changhyeok.bae@gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-08-31 at 11:59 +0200, Changhyeok Bae wrote:
> - libgcrypt is not required anymore because the md5 implementation was
>   part of this project.
> - ninfod patches are upstreamed and other patch is not required anymore.
> 
> Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
> ---
>  .../0001-iputils-Initialize-libgcrypt.patch   | 55 -------------------
>  ...riable-name-to-avoid-colliding-with-.patch | 51 -----------------
>  ...-fix-systemd-Documentation-url-error.patch | 28 ----------
>  ...tils_s20190709.bb => iputils_s20200821.bb} |  8 +--
>  4 files changed, 2 insertions(+), 140 deletions(-)
>  delete mode 100644 meta/recipes-extended/iputils/iputils/0001-iputils-Initialize-libgcrypt.patch
>  delete mode 100644 meta/recipes-extended/iputils/iputils/0001-ninfod-change-variable-name-to-avoid-colliding-with-.patch
>  delete mode 100644 meta/recipes-extended/iputils/iputils/0001-ninfod-fix-systemd-Documentation-url-error.patch
>  rename meta/recipes-extended/iputils/{iputils_s20190709.bb => iputils_s20200821.bb} (87%)

Hi,

Thanks for the upgrade. There seems to be an issue with tftpd:

https://autobuilder.yoctoproject.org/typhoon/#/builders/75/builds/2389

Error: 
 Problem: package packagegroup-core-full-cmdline-1.0-r6.noarch requires packagegroup-core-full-cmdline-extended, but none of the providers can be installed
  - package packagegroup-core-full-cmdline-extended-1.0-r6.noarch requires iputils, but none of the providers can be installed
  - conflicting requests
  - nothing provides iputils-tftpd needed by iputils-s20200821-r0.core2_32
(try to add '--skip-broken' to skip uninstallable packages)

Any ideas what changed?

Cheers,

Richard

