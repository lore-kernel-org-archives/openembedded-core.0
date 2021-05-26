Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web08.190.1622049025142263642
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 May 2021 10:10:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Ed9aCoj4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id f20-20020a05600c4e94b0290181f6edda88so988261wmq.2
        for <openembedded-core@lists.openembedded.org>; Wed, 26 May 2021 10:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=fUND2l7qeXHl+iNdiZFPaPiO4p9MyKfYlxMy/Lw6jHo=;
        b=Ed9aCoj4ECQrMFpXL3a0jaYeSEyhCT22Q/s9WIn3PbB9Qo5rePx7l37NmffonsgXjS
         4HXKbXLRjmILw72pzqdWHnjWBF19fOqeaFnNvBalnTCR8pzmWeR+seuXtDH26ROGg9yM
         kh/tVCkB+tu+BgA3U9dpS7gWpOew7tY5Os3eQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=fUND2l7qeXHl+iNdiZFPaPiO4p9MyKfYlxMy/Lw6jHo=;
        b=W2uRPgD5FhImCidu7fbH0IoWUVJo6O1SfGcD7RDTiwFEWXuLtzT94bo45zYqU02Tkw
         EBjltYBkGGJmR4ZC53zUhgXSF5mADb++PBt7E1uz2Dxs4ePnHUQzyIdjvK9LuEOpJnvM
         0PU7wrPsp8fiaC/2s7v+7huw+2CU/9AuoJhq0NEV9t81c7oyfHCpUBYGwL1aI/dmN2Zj
         Z9s39MRwvcYKGb6EHScG549+GbmaXu+acB82U5ZQ5s/XxYekkwwQe0xjEwrMjFoAoGHm
         aEahrssRTsNHACjX+6+NiJ5eDAB6ulZ/PriSD4T757BT4icMZEEWpm6o189iy1d5BYj6
         U35Q==
X-Gm-Message-State: AOAM533hFFjDE9yhJ1dOkPcSkAbzK2Cog7pobyS86LRPWidVNQP6fCo+
	5PrpR6fJYVFV/UQ+tDYNsw46Tw==
X-Google-Smtp-Source: ABdhPJyUmJFIzsSvLIXG4x7Ei55j3BQJvxeYap47/yBRFO6M+WLEvg3HkA9B9kQpJBgg8TTifO1eAg==
X-Received: by 2002:a1c:3b04:: with SMTP id i4mr4198813wma.116.1622049023494;
        Wed, 26 May 2021 10:10:23 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:a7fa:b38f:3320:9d46? ([2001:8b0:aba:5f3c:a7fa:b38f:3320:9d46])
        by smtp.gmail.com with ESMTPSA id q186sm15398099wme.20.2021.05.26.10.10.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 10:10:23 -0700 (PDT)
Message-ID: <f3e694df4726cc21060cb296a8c6b0848f4e6c96.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] package_rpm: pass XZ_THREADS to rpm
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Ross Burton
 <ross@burtonini.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Date: Wed, 26 May 2021 18:10:22 +0100
In-Reply-To: <CANNYZj_3=8Fg2pBPQt5SYVD6QZpN=UfVC1+_Ndupiuf4-Grcpw@mail.gmail.com>
References: <20210526145910.3930141-1-ross.burton@arm.com>
	 <CANNYZj_3=8Fg2pBPQt5SYVD6QZpN=UfVC1+_Ndupiuf4-Grcpw@mail.gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-05-26 at 18:30 +0200, Alexander Kanavin wrote:
> What  happens if XZ_THREADS isn't set?

It is given a default in bitbake.conf so you'd have to go out 
of your way to do it...

Cheers,

Richard

