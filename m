Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web08.10753.1611060696084514363
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Jan 2021 04:51:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Y0OqMSab;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id c5so19610806wrp.6
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Jan 2021 04:51:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=lMxDhKcKjj6cL8GU5ewdQy/Dgs00Z9Et2HSw+Fh2AQ8=;
        b=Y0OqMSabxiyZg87r4osgG6i7AfOc4w6tgw0UF++TXk8hbSBPTgijOKgjR4S7o7qB0x
         ySARnVwz0pyFNS4TKPFW9UxxJGh7l8CerJVM/P90Fa09Rqc7ap5HdcgadQuEU5mzsc9s
         fvZDsucc6n7Ydix08gLOKYs5puvNLIshdD3wA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=lMxDhKcKjj6cL8GU5ewdQy/Dgs00Z9Et2HSw+Fh2AQ8=;
        b=pBl70eKmqaUMRRcN9bPz1RWzTDKrI+so/yGAQVX46O3yn7AVKGjKOBZ3dlkeDCRIRo
         Pp6JGb1zC/sUEFhctlOQqt7w3ft1nkHJ5QSKJAgIliqo3z203h27VJOY3KVCJUTQRfbF
         F3OlkD0X/WjDePI38uSRZA+tnSVzQ4GTkKzHeyswTv07DLhw9miPJVcxVbA41J7gkAFC
         DYE4I8VAHDlJ1xxP/NtvUvIAloMcScNmoTS2RFy8ya2c5geRXsSXsky0ZXmcJzUXBiCC
         dP81wEEAEdXH+u7eI/QgKElyt7OrawCgGSizIUGQl8E4N21ijf4igJvRG8055sUo2LVc
         pHtQ==
X-Gm-Message-State: AOAM5331aImnOuxbKY2faHzDZeMHi7WhD7K4KmMU0aJwz3eH+/q4v/d0
	b23GGbNfQJo5L8dw31eKTbuRbQ==
X-Google-Smtp-Source: ABdhPJwyf1/V0fFLA+aaWaQico9R9uX2P63+esLt3ZA00Axj5iNfLpTMvJyjNGVLEBNqQc36FDmyWw==
X-Received: by 2002:adf:c109:: with SMTP id r9mr4309506wre.261.1611060694610;
        Tue, 19 Jan 2021 04:51:34 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:f7a4:851a:48d5:440b? ([2001:8b0:aba:5f3c:f7a4:851a:48d5:440b])
        by smtp.gmail.com with ESMTPSA id n9sm35064461wrq.41.2021.01.19.04.51.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jan 2021 04:51:34 -0800 (PST)
Message-ID: <7d05167fb80882dea83fb8c4ec0da8f28a61243a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [poky][PATCH] rootfs: add option to allow delayed postinsts on read-only rootfs
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: rnouse@google.com
Cc: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jan 2021 12:51:33 +0000
In-Reply-To: <CADVsX8-aLgbLwqT_zVAh3jBG11KrPMvGKR8Kpi087y75Ao__ow@mail.gmail.com>
References: <165A723B7A040876.29781@lists.openembedded.org>
	 <CADVsX8-aLgbLwqT_zVAh3jBG11KrPMvGKR8Kpi087y75Ao__ow@mail.gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2021-01-19 at 12:39 +0100, Anton Kachalov via lists.openembedded.org wrote:
> Ping on the patch

It merged a couple of days ago: 
http://git.yoctoproject.org/cgit.cgi/poky/commit/?h=master-next&id=49c4fdcb884057c0fc713925c8040e36fd26af8d 

?

Cheers,

Richard

