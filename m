Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.220.1627936320011984734
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Aug 2021 13:32:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YdMBOIy+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id m12so18094688wru.12
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Aug 2021 13:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=XmQhOerF8Rx5KSSnYq3DgdHDeBtDsA6pvLvmNNC1UoU=;
        b=YdMBOIy+V8M8jOR9MZeoNvKrP0Jufx7nYBdOvlVrRNP+v8Gn6XsrAvx2eTH0avGRqu
         0Cp8WPwFoKTgNRYd51wz+J5iRKy6svA8VaDCfQPYo8rkm/0jTWLAo/TxSBEN0YQzKp+d
         BzGU4s9+PbdwAju3zrMS5OnfxzVx8uVgXej3g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=XmQhOerF8Rx5KSSnYq3DgdHDeBtDsA6pvLvmNNC1UoU=;
        b=EDbeYD2e9ty+mzE3ujuX7jg9TeGaFZQSqM4sADMYGRAi7/evS3pUEq0gVWSflO8kuy
         R4cOUWAQRbi3K4wBFmELoF6UVoIJMaAdvWif10FFoLgn9wu9d6TOGkEE6rb4/SakIOGo
         K4SbIFP9Vla++mJBAWxZk0ppfpgLE0NVHZU8JyuZwnjrqwXi2n+wktxuTxcE9EHF+EKS
         TByejrOPOzNeKtBDdf6LJEb2X8L5eUAJRktemjDdToghneYK9/BMS+dzI3cJgQfpuPka
         fGsFCQX6GQVvIeTCyJComQ1ZVFaBhpcTusEf8EdqDf3lh8J8tJ6/cMQIx/yYjmMJFfCd
         bRKQ==
X-Gm-Message-State: AOAM531a+1M898AMwIZhG9JqUldUUA7zW3VsnWfwPNMiWF3/D2QjGhUz
	j1Ofaqf5QqnO09v3zDsVJxOw9A==
X-Google-Smtp-Source: ABdhPJzwaAWq4PZSczd1havXAnDhfGp2oVmzLLtMZFWrLueY/j3fymujSvfrKPP+pHiCXOKslq8Bcg==
X-Received: by 2002:a5d:6186:: with SMTP id j6mr19909758wru.115.1627936318476;
        Mon, 02 Aug 2021 13:31:58 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:4fdb:827:88eb:62c7? ([2001:8b0:aba:5f3c:4fdb:827:88eb:62c7])
        by smtp.gmail.com with ESMTPSA id x15sm413738wmc.13.2021.08.02.13.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Aug 2021 13:31:58 -0700 (PDT)
Message-ID: <1ff300b8d5d7447325576536760bbed872b65f13.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3 1/4] glibc: Upgrade to 2.34 release
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, Patches and discussions about the
	oe-core layer <openembedded-core@lists.openembedded.org>
Date: Mon, 02 Aug 2021 21:31:57 +0100
In-Reply-To: <CAMKF1soO6HGJ_8gJsgtrmz_iSp1JsD1kgk0P2TAt0qxp6ahefQ@mail.gmail.com>
References: <20210802154639.4181923-1-raj.khem@gmail.com>
	 <CAMKF1soO6HGJ_8gJsgtrmz_iSp1JsD1kgk0P2TAt0qxp6ahefQ@mail.gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi Khem,

On Mon, 2021-08-02 at 13:17 -0700, Khem Raj wrote:
> please note that v3 is rebased on top of master-next, if you are using
> master then v2 is good.

I'm afraid I can't get any version of these to apply. Is there a branch I 
could pull from?

Cheers,

Richard


