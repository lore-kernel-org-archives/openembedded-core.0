Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web10.4305.1588852139489449077
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2020 04:48:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NokBFNlO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f66.google.com with SMTP id x17so6003460wrt.5
        for <openembedded-core@lists.openembedded.org>; Thu, 07 May 2020 04:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=iesbgphoBwB2HU4I+sNLKAhfOjwNoBwfH+bY78Wasjo=;
        b=NokBFNlO6yMqiW90q6aL+Cb3gUIIfYav0y0BIkc1FiU3X+suE0c08g4puToSaZ/4cS
         JuwXvfk9y8d0n88ht2Uas+VnSuoOsJFOUSyC+TpyinfuxZ1qEMYm+1OUhSg/TPI7quKG
         74drFwi8t5STPYNqsxBLId37K2QjcjRuKklMw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=iesbgphoBwB2HU4I+sNLKAhfOjwNoBwfH+bY78Wasjo=;
        b=QjE5UQk45l/eS7wXiCpBGvJ2YnH7tKmaDw9GDma00HeTAAkWxeqgG5vZutSKc2SRdu
         PrS5zNhRdEXkErRndQY7Yyl9nk7iNfonYGZa4iSzpDIzkwyh7kWKO5zSbRXH9wpFXDA0
         x/CUGZc/uUDvQWINTIfDA/Bgx4xpXSabSPsqF1pjr64NYe+GTg4/DQqxYqcgeKVhJIht
         2l0FrIQOOsqnC9BBtKZHkUE//fVcIyTm7N6wgCTizikR9v+3E4eAsBuL6g3GaB0jSBeK
         ZwGWbP9Eh5ysoUQ0bA4nj/gv0sbvNwL1R+bmjRMNle7AX48BeydYnhnhtiijR8l4cPUW
         tOLQ==
X-Gm-Message-State: AGi0PuYvlbxEP5ybYGCu0+s1YISijb2inMnkwbiKaFcV5HurnwMRVkiE
	8mf2dGywm5jG7bxcq3h3TeoTmQ==
X-Google-Smtp-Source: APiQypKvwbGSm8tilcVG1MgwfZ41qrNAiL1S6/B8S5mmpsC+uSlJb6W0E2nEUcEcYXhQKz87MeJmVw==
X-Received: by 2002:adf:c381:: with SMTP id p1mr15299745wrf.148.1588852138013;
        Thu, 07 May 2020 04:48:58 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id m6sm1449681wrq.5.2020.05.07.04.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2020 04:48:57 -0700 (PDT)
Message-ID: <610a380ebc8ef2638a8d13c8d3a84b3059bcf8aa.camel@linuxfoundation.org>
Subject: Re: [OE-core] [meta-oe][PATCH] libva: Removed virtual/mesa dependency
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: zboszor@pr.hu, =?UTF-8?Q?Bart=C5=82omiej?= Burdukiewicz
 <bartlomiej.burdukiewicz@gmail.com>,
 openembedded-core@lists.openembedded.org
Date: Thu, 07 May 2020 12:48:56 +0100
In-Reply-To: <44fb22eb-a3ea-15cb-f93e-c0ff4503705b@pr.hu>
References: <20200424150143.374520-1-bartlomiej.burdukiewicz@gmail.com>
	 <44fb22eb-a3ea-15cb-f93e-c0ff4503705b@pr.hu>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2020-05-06 at 14:41 +0200, Zoltan Boszormenyi via
lists.openembedded.org wrote:
> 2020. 04. 24. 17:01 keltezéssel, Bartłomiej Burdukiewicz írta:
> > Mesa can be compiled with libva support, in order to avoid
> > recursive
> > dependency between mesa and libva, virtual/mesa must be removed
> > from libva recipe.
> 
> This is why this patch series was created, to break the
> circular dependency in a clean way:
> https://patchwork.openembedded.org/series/22976/#
> 
> The libva-initial recipe was introduced that doesn't need
> mesa, then mesa can be built with vaapi state tracker enabled,
> finally libva can be built with dependency on mesa so its
> GLX support is enabled.
> 
> What happened to it?

I think it came in late during the release and was a bit too risky to
be taken at the time. It think it is a good solution to the problem,
would you be able to rebase the patches and we can queue them for
testing? Its a much better time now to merge a change like that.

Cheers,

Richard

