Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web10.1500.1596577643683245127
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2020 14:47:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aIVLQ4rY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f65.google.com with SMTP id f1so38217485wro.2
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2020 14:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=lG843cBWx7Bw6PUPJo7EJgRZrGVB2D90DLJVo8lGRcc=;
        b=aIVLQ4rYeQ69Wa/Nt43/eZX9+M7MHv4nUXp95CYZLli4l/bbcrKNEPgwRMeuLVkFVo
         enh2Afdu7yYAicNbHH0jGSgzv1U66v1Nr/unM2RFh8pGbNePE+GJQvcyDpJCS6vssM3j
         MIWoXU6oxZuR+7jxtuPI8F2svX5wfoh+5Rd9A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=lG843cBWx7Bw6PUPJo7EJgRZrGVB2D90DLJVo8lGRcc=;
        b=XBRWlDddDf7DbdYpOoLkFWOnIgGzlAzpE3mxpkHQNgkPGyh6OlmiORw0wqd0vABMz5
         tbfi3lO4XV/HKXfthSLeKR+fYDIJxdxzgabFDKBHqe7dD4QD15krf7Jiv6glv2Cz8sMf
         n7vRYdAYgp/Al2TaVDEKMWg6KLvG2+ysOO4rr8O1A8lnSgJyyvK2TZMF/rjYee7Y2UuA
         ypqJVc/MhpKQxXYIC9N/rb1LgxiiWa0owisZrfSH3ZXiXoqbhnOkhVuBq3mnHxlWHhmL
         y0nPDSr/YGrpPlovM94Yrj6uCoGYWIOj/+rtJGI3TL3dRestasS23hbScwD6IWoS/Wom
         GReg==
X-Gm-Message-State: AOAM532HTsp3ndWaELq+IfFJh05ESJQM8TxXc33GOLR+AbmeFcYFt8bu
	kLoaMSfSvfkjqb3tZDeeKxYMd48sQcM54A==
X-Google-Smtp-Source: ABdhPJzm7aewTLQabTWhFIiTqgvKFLFbDTHa1gqahHwiFu1oXYl+bwFKTOmvHp7NGtrvDnkENteSjw==
X-Received: by 2002:adf:82f6:: with SMTP id 109mr23129259wrc.25.1596577642215;
        Tue, 04 Aug 2020 14:47:22 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 1.8.8.2.4.4.9.8.7.6.b.0.9.5.0.7.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (1.8.8.2.4.4.9.8.7.6.b.0.9.5.0.7.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:7059:b67:8944:2881])
        by smtp.gmail.com with ESMTPSA id p6sm190421wmg.0.2020.08.04.14.47.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2020 14:47:21 -0700 (PDT)
Message-ID: <0345b07862124c6a7c14ba32284cbef88b7313d0.camel@linuxfoundation.org>
Subject: Re: [OE-core][dunfell 06/12] gtk-icon-cache.bbclass: add features_check
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Steve Sakoman <steve@sakoman.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 04 Aug 2020 22:47:21 +0100
In-Reply-To: <8f55aa8139347e8ac491002f10d1ba220430ea82.1596464561.git.steve@sakoman.com>
References: <cover.1596464561.git.steve@sakoman.com>
	 <8f55aa8139347e8ac491002f10d1ba220430ea82.1596464561.git.steve@sakoman.com>
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-08-03 at 04:26 -1000, Steve Sakoman wrote:
> From: Changqing Li <changqing.li@windriver.com>
> 
> 'bitbake world -k' when DISTRO_FEATURES don't have x11 and wayland,
> report errors:
> Nothing PROVIDES 'gtk+3'
> Nothing RPROVIDES 'blueman'
> 
> gtk+3 set ANY_OF_DISTRO_FEATURES, so add it here too
> since we DEPENDS on it
> 
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit ab9ff563c77cd5105f4ef9426f076b10ea8e2ee8)
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>  meta/classes/gtk-icon-cache.bbclass | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/meta/classes/gtk-icon-cache.bbclass b/meta/classes/gtk-
> icon-cache.bbclass
> index dd394af27c..340a283851 100644
> --- a/meta/classes/gtk-icon-cache.bbclass
> +++ b/meta/classes/gtk-icon-cache.bbclass
> @@ -1,5 +1,10 @@
>  FILES_${PN} += "${datadir}/icons/hicolor"
>  
> +#gtk+3 reqiure GTK3DISTROFEATURES, DEPENDS on it make all the
> +#recipes inherit this class require GTK3DISTROFEATURES
> +inherit features_check
> +ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
> +

Sorry, I understand now. I'd suggest we don't backport this as it
causes problems in other layers and is probably too invasive for the
LTS.

Cheers,

Richard

