Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.7218.1603970292991496256
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2020 04:18:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BIo5PLPN;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id w14so2292772wrs.9
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2020 04:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=eIEIwmIBcUf+CxbJ9eGe1L2AGvxQSKYygyObBFIjarY=;
        b=BIo5PLPNOVbu0Wj9571mPkRRN7zthRYKgudkw1RaPuCvTJwXyovdqVKC5O6+7F36oA
         CqsvWJZRmMb8ZxPe0oclyoJSiDnlcahB9IeEtUzgWprRfiiiTRDhoc9B2IpryaZCVBNo
         4n/ZiMLtXameRXBwjTNKwswuhm3TU5Tp18bBw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=eIEIwmIBcUf+CxbJ9eGe1L2AGvxQSKYygyObBFIjarY=;
        b=jORrMIurHvbTOgPKVgKhmOX9vt5/Gw9PU2y77nQfl9ZZ3QXXoNaU93w61/8jywvoLp
         zCm1dmMTDEl93XBDdC9EdC/tvFeRAL+rk3wl9CzMDYP6QtaGVvDKGHtNODPsn1NfEnCG
         tBu62Mwk1Xznrfk4U5b3DPj2xZyxhORs0VfGvLyS8fucppNCeFfUGnCGgHD0mfIU0Htv
         UxXwPGzPiEn4fIatewQnILemuviKq4NYQugLTfHPXoSKUBsXM+daZmSGpjHWP1lfvd2n
         cQdcTcF1BEKXT6oTUiC/aNuYeuhqboKigYWT7focZCbMEiYXpb5yT5PmN4p6ufMWw8oP
         jWew==
X-Gm-Message-State: AOAM530df5nXPQU3rTlhPkp7VQ8irj0yNVt8P8qKdOnO8CBoWs5imy+G
	P+ceUonSQduJH3wvfqH/CUZ3Cg==
X-Google-Smtp-Source: ABdhPJz/xclIGZ5TEwaguwzIVSqib1x/T4q7YaVxncMkTPCkgx+KEoLde1f1RHK0VqFZqiaR5oWROg==
X-Received: by 2002:adf:f286:: with SMTP id k6mr5005551wro.34.1603970291357;
        Thu, 29 Oct 2020 04:18:11 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 7.7.e.c.f.b.4.b.6.c.1.d.5.8.1.b.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (7.7.e.c.f.b.4.b.6.c.1.d.5.8.1.b.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:b185:d1c6:b4bf:ce77])
        by smtp.gmail.com with ESMTPSA id e25sm4989054wrc.76.2020.10.29.04.18.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2020 04:18:10 -0700 (PDT)
Message-ID: <6c5cc7223aec5587143b1d7e165346494a4ab77d.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v4 00/21] Updates the gstreamer to version 1.18.0
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Jose Quaresma <quaresma.jose@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 29 Oct 2020 11:18:09 +0000
In-Reply-To: <20201023184132.3208737-1-quaresma.jose@gmail.com>
References: <20201023184132.3208737-1-quaresma.jose@gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-10-23 at 19:41 +0100, Jose Quaresma wrote:
> V2:
> - Fixes the build of vulkan plugin
> - Fixes pacth headers
> - Upgrade orc 0.4.31 -> 0.4.32
> 
> V3:
> - gstreamer1.0: Fix reproducibility issue around libcap
> - gstreamer1.0-python: install append is not need any more
> - gstreamer1.0-plugins-[good/bad]: disable new meson options
> - gstreamer1.0-plugins-[base/good/bad]: add new meson option as
> PACKAGECONFIG
> - Update pacth headers
> 
> V4:
> 
> - gstreamer1.0-plugins-good: on wayland qt5 needs qtwayland

Thanks for these, I've tried running some tests in master-next with the
patchset. There was an issue on no-x11 builds:

step1b: ERROR: Nothing PROVIDES 'ffmpeg' (but /home/pokybuild/yocto-worker/no-x11/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.0.bb DEPENDS on or otherwise requires it)
step1b: ERROR: Nothing RPROVIDES 'gstreamer1.0-libav-dev' (but /home/pokybuild/yocto-worker/no-x11/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.0.bb RDEPENDS on or otherwise requires it)
step1b: ERROR: Nothing RPROVIDES 'gstreamer1.0-libav' (but /home/pokybuild/yocto-worker/no-x11/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.0.bb RDEPENDS on or otherwise requires it)

in the build:

https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/2629

Would you be able to help sort that out?

Cheers,

Richard

