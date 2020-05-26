Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web12.81.1590531303902766329
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 May 2020 15:15:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TyNmnzam;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f66.google.com with SMTP id j198so932021wmj.0
        for <openembedded-core@lists.openembedded.org>; Tue, 26 May 2020 15:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=Vgu2ZGZ+e5K34Xn6hHlFoNjppkA/5Vvc/4ofg/Kv+ng=;
        b=TyNmnzamzLlrucIDbkpvZI8rPIVFnkPUxaY/q+82T1SFCVSPVOkHJpRnlgrvoMIHIc
         GFrdVzlhYqWERIr/yOHmZkxgdu/hp3j9KOSZXB3Gj7K1PeFzd1IGFXOuufbBmTUPX/gE
         YDaezFumUeVRWTa/nMpXCAfJm2rmF95aEmsFA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Vgu2ZGZ+e5K34Xn6hHlFoNjppkA/5Vvc/4ofg/Kv+ng=;
        b=Mv3Uj0bhK9B40e6vEjmVX1cfLWnomGOBuUySQl2UsDWSPRv1H3SVfieidR+v+waRWx
         1f0vi7AfM5QyLWp1tY+jj8KLWb/bTvPx0CO/C+abgpNYadlHmJ5Miaa6PG1Lnds63HAn
         lG8btD5TbKMrmPscqTr9FL4byy1RCcuPBJJRyA+KFsdDjzvgHnHIcpHiS3BF1cGQ1H5f
         R2TaWd/Fn5DNCLoMHXRz7EgxyHvRn5NlQnvZ6zO3N2RZAY8MS0F2ou6Fxsxl3aLqLsUw
         o3RcUjNIBaF7GlXHG7CyOx2F3nPY8b/tgGVhqY37yE3+cYFmPf9IzofgFNkDUwu+aWzS
         66EA==
X-Gm-Message-State: AOAM530z2capzauUe+0/pD/771SPwiaezEutGwM9eVpQGj6mq/BJfNQ8
	nUP9K3RBjAaXtn3b9kjRm99YWA==
X-Google-Smtp-Source: ABdhPJym4Y4Kg2RFNNJk2K+vWY0W5vBe7CxEcGLlzL+5vhEHExHh2gv0mYV+dVIALK+4zNJiRPXO0g==
X-Received: by 2002:a1c:3206:: with SMTP id y6mr1135539wmy.12.1590531302393;
        Tue, 26 May 2020 15:15:02 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id d18sm1020930wrn.34.2020.05.26.15.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2020 15:15:01 -0700 (PDT)
Message-ID: <1807e13f6272cc2935d974fde93d160e1cb6607f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/5 v2] multilib/recipes: Use new RecipePostKeyExpansion event
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Jeremy Puhlman <jpuhlman@mvista.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 26 May 2020 23:15:00 +0100
In-Reply-To: <7c11dc36-84e0-fe06-02e8-4bc3b0156729@mvista.com>
References: <20200526215725.992258-1-richard.purdie@linuxfoundation.org>
	 <7c11dc36-84e0-fe06-02e8-4bc3b0156729@mvista.com>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-05-26 at 15:12 -0700, Jeremy Puhlman wrote:
> The one question I did have is there are a couple of places where you
> add the ML prefix for
> nativesdk classes. If we don't have them, it shouldn't hurt anything,
> but do we actually support
> multilib nativesdk packages?

nativesdk actually uses the same mechanism to extend the package names
as multilib does so for nativesdk, MLPREFIX="nativesdk-".

So no, we don't support mulitlib nativesdk but nativesdk is a kind of
multilib in some ways as it also sets MLPREFIX.

Cheers,

Richard

