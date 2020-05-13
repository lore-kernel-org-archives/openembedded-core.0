Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web10.428.1589386944873308025
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2020 09:22:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Fh2h3ioh;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f66.google.com with SMTP id l11so187610wru.0
        for <openembedded-core@lists.openembedded.org>; Wed, 13 May 2020 09:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=/Uk+T5fpfaAzNI1gUP/mTREhuUs6+2t5u52NlEtWbN8=;
        b=Fh2h3ioh04mMoL+9k2XJwwUfspkcn27XBslteyajZFJKOLdXg7hkl092LjQd/RyLZW
         zYPipz9Da5FTQX/ZqyGuUbGQHHSijgow5eF24LE8JMReEnFqfK6WzmXTkTCnWGqG2R97
         Qv/aygheFcd2Femkwa9UuXm1Q2qCp37nN/kQ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=/Uk+T5fpfaAzNI1gUP/mTREhuUs6+2t5u52NlEtWbN8=;
        b=JPLys65cXgtmupHh1Xi9PpyJ6l4rxjpAAbdTeajD6gvOgSEnFadhywU44bnAbN+yCR
         FnEXPfMy5k3leuBTqTW0ELsmWrLWQ/m6+E9dsgAtep25kPiH1GmNSqe4L8IIsnUNAmi9
         b16RSPPmSMvRCC96SN3ONbHNbaRx99jlzoAlaF3rmGQ4tPDd5jDnYNz0/FhhUkK+BccJ
         vaVUlOjo+ybbD4j6y3e6VG439BsmUYUO1qTjqCwimekRJ/6GuY6xVgmxjVK9d5ctgyd3
         86mtNJeMPM/Ep4i3ZdCah5g13gmcDvT6VePghAox+GEuwclLHFMl/QB8SBon4QhTgp/M
         Kmbg==
X-Gm-Message-State: AOAM533aXWPH2BSAMucHQ80ypeSob/Gxwy3Y10jyxpljyRGzJlCrc8HN
	JlN66nOZJ00hkzFHOSJ2lrSIIg==
X-Google-Smtp-Source: ABdhPJwVyhcDTLWtQ7g3WS/69kcgSFzqxU0ioWHO3hcxFTi8fCSzg9zzIsVhQ0j3YRxn1BVQ6xKzIA==
X-Received: by 2002:adf:c651:: with SMTP id u17mr137453wrg.416.1589386943393;
        Wed, 13 May 2020 09:22:23 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id e5sm16868wro.3.2020.05.13.09.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2020 09:22:22 -0700 (PDT)
Message-ID: <df250cd28d9a02cb8cf4645d167f5d7a91041f49.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH v2] wic: Add --offset argument for partitions
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Joshua Watt <JPEWhacker@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 13 May 2020 17:22:21 +0100
In-Reply-To: <20200511194835.20890-1-JPEWhacker@gmail.com>
References: <20200511192646.16901-1-JPEWhacker@gmail.com>
	 <20200511194835.20890-1-JPEWhacker@gmail.com>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-05-11 at 14:48 -0500, Joshua Watt wrote:
> Add support for an --offset argument when defining a partition. Many
> SoCs require that boot partitions be located at specific offsets.
> Prior
> to this argument, most WKS files were using the --align attribute to
> specify the location of these fixed partitions but this is not ideal
> because in the event that the partition couldn't be placed in the
> specified location, wic would move it to the next sector with that
> alignment, often preventing the device from booting. Unlike the --
> align
> argument, wic will fail if a partition cannot be placed at the exact
> offset specified with --offset.
> 
> Changes in V2:
> * Fixed a small typo that prevented test_fixed_size_error from
> passing

https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/934

(and the other selftests failed too)

Cheers,

Richard

