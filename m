Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web10.6492.1588431306042732470
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 May 2020 07:55:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FXfyVCpQ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f65.google.com with SMTP id d17so15329190wrg.11
        for <openembedded-core@lists.openembedded.org>; Sat, 02 May 2020 07:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=6xzyhweN+PgX+fWP9dPOLnGtqYkc+bZVTn6GE06G9pc=;
        b=FXfyVCpQEWA5MTTA/5EDnXx2fWIU15bPpaH+8u9Ha4EFcwPvN1yWKrampIPLPdmVNh
         FOVVit5ck7Am2I3jiSt6Sdsf42yGndkYHbqA905w9ojW033RFk4cBl0M1CCmjLvMobrB
         rP9dGk29d6EfT5eK+OjaLhEkILVRSGBVhQAtE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=6xzyhweN+PgX+fWP9dPOLnGtqYkc+bZVTn6GE06G9pc=;
        b=iK/AAQVNtzJe17RtYxVhKVPZBwwUGlgdrm7tolebc1kjApgYuIe7eTuTpYr+9dDVQR
         8oThqgaFMLmFHn/rYmR6n4v1+xtFiBygswQpi4v9ofP7xs3LZjCFmawYyQ2mN413FNnW
         CKbrWRjJZ0nXfOM+jSAtDY75JQZZNoDBzcLuUebeB6Akx2dMzf6LSFlVbBh/s0fzcHSZ
         LZZvIuQD0WxBTsK9hCu1uTj5LJYDi39zAybR83r821XEGhG2HwyY6GTIFl7cC6ablpgH
         oUkAaLCdGNoTVjN3v7/j2uktUIx46419f4nFPv4AsVRTP2WoUGPAoogUKoQVZwJZlT/8
         jxWQ==
X-Gm-Message-State: AGi0PuYBIxvCyRYl2DKgD2592lbbP4o8o8QycStkQKNqIhwb15lIE+DV
	c6vaJtUxy9xVze7bg9V+c9AJng8V9kw=
X-Google-Smtp-Source: APiQypJ9TWQl5p93w1OdJ3RMSCS3nk69eMnzldx3GG/dd4yyCia2gTwqh7XGiSffp28fnq2QOAJpXw==
X-Received: by 2002:a5d:490f:: with SMTP id x15mr9157246wrq.37.1588431304221;
        Sat, 02 May 2020 07:55:04 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id q18sm4346803wmj.11.2020.05.02.07.55.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2020 07:55:03 -0700 (PDT)
Message-ID: <d5b04ccfb0a9c477022d96cebb7c17929635517d.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 08/17] mc: update to 4.8.24
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 02 May 2020 15:55:02 +0100
In-Reply-To: <20200430095815.2824-8-alex.kanavin@gmail.com>
References: <20200430095815.2824-1-alex.kanavin@gmail.com>
	 <20200430095815.2824-8-alex.kanavin@gmail.com>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-04-30 at 11:58 +0200, Alexander Kanavin wrote:
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  ...Add-option-to-control-configure-args.patch |  99 ----------------
>  ...29-configure.ac-drop-bundled-gettext.patch | 110 ------------------
>  .../mc/{mc_4.8.23.bb => mc_4.8.24.bb}         |   6 +-
>  3 files changed, 2 insertions(+), 213 deletions(-)
>  delete mode 100644 meta/recipes-extended/mc/files/0001-Add-option-to-control-configure-args.patch
>  delete mode 100644 meta/recipes-extended/mc/files/0001-Ticket-3629-configure.ac-drop-bundled-gettext.patch
>  rename meta/recipes-extended/mc/{mc_4.8.23.bb => mc_4.8.24.bb} (88%)

https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/1843

Cheers,

Richard

