Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web12.20728.1589569562192071468
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2020 12:06:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Hj6ACyFP;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f65.google.com with SMTP id s8so4716187wrt.9
        for <openembedded-core@lists.openembedded.org>; Fri, 15 May 2020 12:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=0AR5rVHTt3b/m2jsGw/WDDKuVCbbN5bkRRqwf+xRURQ=;
        b=Hj6ACyFPtksxfZYouhHcVoIStVhJEDry/Lb5rhc9sHpQ63cyfJlQ9cF8D+xYUh59xZ
         iaePKhcnSBw3sfFS3ljTgVg/ebOY6YHH+DqDxAlNoskDnKJM6/t4Xc0wmbxkBaLaym4p
         Wqawz/IV3hDI7v8O7m1wELQ4B3DcBy/WFevB8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=0AR5rVHTt3b/m2jsGw/WDDKuVCbbN5bkRRqwf+xRURQ=;
        b=JU5V++BojldJEnaguQQM2875+0QiH0ccqO8KAJLz6k7dM9GfZG8lVvuuv7LKcV2O00
         kW7xeKghxwxAp1O94ftzAIB5t73JcGGBXZ28PtHhqbPavo+eZPkiEF2pV7um8S/D9zJZ
         zjyqGWuw8CDihGlBvvH3CStHpMQ+Vehj+2ENNwRHAOsk+WJooaEhbJ+pj8JJS8a0Le7B
         RHGEQV8kZq1knREo42LrOfTpnuWFShyiMyU+H+wgoTO17FP6fCeINDG8INfyY9UZwr6V
         a9XKdMlUgvu0W7Kqq8fQFLpeX6GfwUEox38U0wn8KHEcokqbTZA+RgmxcuBXOqKdU7tI
         xBuQ==
X-Gm-Message-State: AOAM531NpykntaW+7602hLsEbzX3eZYfVbmK2vHpYotikJaPhdOv6dEN
	GiTmwpFaHDDLFOi6I6vD08oWIA==
X-Google-Smtp-Source: ABdhPJzuTlU8Y4y9udVSDXdgxvXrkP0gN7hy1hceBtvOR8U/GOCM0JFVP6IYh/I53Lv7EimqsRVczA==
X-Received: by 2002:adf:eac8:: with SMTP id o8mr5696686wrn.268.1589569560653;
        Fri, 15 May 2020 12:06:00 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id w12sm4789691wmk.12.2020.05.15.12.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2020 12:06:00 -0700 (PDT)
Message-ID: <591d657764bbea63ad2a2fa5cd0587cc305e600a.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH 0/4] Import recipes from meta-python
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Denys Dmytriyenko <denis@denix.org>, Joshua Watt <jpewhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org, jdmason@kudzu.us, Khem Raj
	 <raj.khem@gmail.com>
Date: Fri, 15 May 2020 20:05:58 +0100
In-Reply-To: <20200515185354.GE11927@denix.org>
References: <20200514210458.33543-1-JPEWhacker@gmail.com>
	 <20200515185354.GE11927@denix.org>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-05-15 at 14:53 -0400, Denys Dmytriyenko wrote:
> I see Richard has merged these to master-next, thanks!
> And thanks Joshua for volunteering to maintain these recipes :)
> I submitted removal patches to meta-python.
> 
> So, it is good we are getting this extra dependency resolved in master. The 
> question is - can we get these backported to dunfell, does it qualify?
> 
> Otherwise Jon wanted to finally branch off meta-arm into dunfell today and 
> we'll have to live with it until gatesgarth.

I put them into -next so we could test them, see if the autobuilder had
any surprises. Good news is there weren't any.

The question still remains whether this is the best approach or not and
some people I talked to were not convinced that a consensus had been
reached.

The question I guess is how widely used is optee and does it warrant
adding this? Its a little ironic the thing people want is trusted-
firmware...

Cheers,

Richard

