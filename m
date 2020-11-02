Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web09.29808.1604317256600390201
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 03:40:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LYiZ0oZY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f66.google.com with SMTP id e2so9182790wme.1
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 03:40:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=0l62EDf8n7cUjt1duxxZw5heHDa4CfabvB0/m4DEWgU=;
        b=LYiZ0oZYxBNymxAlBPRgV6/fLCm0busn0sfB63Sxwe7erAiGflC7eHkg2wPqWJ38/k
         WxPL9NgizxBUd0hwk2VFxodNT1x+othlS70B2im0O5tKlAYuMl8Ev1uapVprG6K+hhpV
         IqLI8nXC13KfquXIdVolw+/KSC+kSqykQfA8E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=0l62EDf8n7cUjt1duxxZw5heHDa4CfabvB0/m4DEWgU=;
        b=ofJOGXKiTCWhFZPaLA8R8ETdGDwCSLC4S64u0ARtXBAJiV5CWdvgBhrX6jyeroGpGU
         rDbDM+1Yun+8/tHm/qAIwhgkwm1ZJ5VZ4n7Y4cj2QlJd73eyFinh4PxA755XSv9mFfvo
         PqTZwvELxnbNyRSrcawbKFkyfTYBpGPETF4S4LozZWn6+h3AcLFE14vh9l9bb+RR9vx+
         5PCwjnJFOqh3IHfxDMlqB7OZOstGnNa2fP50wELQrPNX7t6Wm9hIfRWQOVOLG1upO1zB
         NTKRXjLmLeGgtz7jsmt+ZrbhpMdWo3Fz8OqPLvaX3oy8o6qz8jiQo+bwBv+FspliSnB7
         6yDw==
X-Gm-Message-State: AOAM533z0RcA8kpDRCmcp0gg8mHsBjxLZlOENATW9vV6FOCbRdKiuDg3
	yLK6P22siXCT/90kFRY9qIOpBw==
X-Google-Smtp-Source: ABdhPJxsT/XhnM+zg73BzIyEQxXG8rWUGteX4AUfYsrUkCqadlBnhwUnI9h1Xo4RJmJrj8Rifnel9w==
X-Received: by 2002:a1c:2d53:: with SMTP id t80mr16589282wmt.125.1604317255198;
        Mon, 02 Nov 2020 03:40:55 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from d.3.f.c.c.4.3.5.e.4.0.8.b.a.1.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (d.3.f.c.c.4.3.5.e.4.0.8.b.a.1.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:11ab:804e:534c:cf3d])
        by smtp.gmail.com with ESMTPSA id b4sm13907939wro.57.2020.11.02.03.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 03:40:54 -0800 (PST)
Message-ID: <bbc810895cce2a28cfb9449a69661c98a29324f8.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] pulseaudio: unify volatiles file name
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Yi Zhao <yi.zhao@windriver.com>, openembedded-core@lists.openembedded.org
Date: Mon, 02 Nov 2020 11:40:54 +0000
In-Reply-To: <20201102092012.15968-1-yi.zhao@windriver.com>
References: <20201102092012.15968-1-yi.zhao@windriver.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-11-02 at 17:20 +0800, Yi Zhao wrote:
> Make the volatiles file name starts with digital.

I think you mean starts with a numeric value? Could you say why that is
necessary in the commit message please?

Thanks,

Richard

