Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web12.9092.1624873669495960910
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Jun 2021 02:47:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BQdRmeQH;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id o22so10043159wms.0
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Jun 2021 02:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=k6Pvg5rHlvtVXBDkEZVeZLcTWYg4YnGzNf+m6/CkxUQ=;
        b=BQdRmeQHcQPp86Ul1foYTkA2/P3PvYBEeNr7TEX+qBvbt2Dhf+/37xkGNDJOGijuCQ
         R9q+tH6OvK/6rP7AYEOyHA2QDmbtaqvVeyMOwuN7U3kfbEPhkfFdCxU3JSI1umXEbWnA
         X2wMKi8PZKeMwuJ1VN89DiNPu7Hgff4/8IOy8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=k6Pvg5rHlvtVXBDkEZVeZLcTWYg4YnGzNf+m6/CkxUQ=;
        b=pOvk7ZJGTsVuasQCGpSp7t6g9yveiiuLrokkhUfGRqmaoEC35ud6VKq/YxpSsM9Wgu
         WYL2xXJlHGXMdbSQ2WXcNWYX4guGVEFzV+dLO1xITdoPzNJJ40dL3ScERMcprhBULeYC
         GMVAmHcoo2xbvucztDtW/vgoSEl7OzVs3zTedU0A0CnHFQ63E0Pj6x3b1CT0rtHzWKoz
         ghuowI4WuneQ1bWgoVhejGIcW3Xv6hAO3xm5Am/hL665EXwviPkLKtCnUUXpXsja9Up8
         XT0F3m2pBb/wfXM+1fRlLjAhdLy9nrGEdmi4HsK/MKcnSXzW5hnGyfcr0TcsRll1gT1A
         2/YQ==
X-Gm-Message-State: AOAM530tgyGgAYc866gLtgCaBKNBKHFYL17lvn4FWrOTq6Wo4ET2b8SC
	D9oviztAN4adupX7U9tSbBJ3Tg==
X-Google-Smtp-Source: ABdhPJwDzxQ7qIULJEoOt4oZeMVf1ifNunXfpvSOqgCw7b1yiHbivv1rUH7SLIyKTJm8hipnFs1hvQ==
X-Received: by 2002:a05:600c:a45:: with SMTP id c5mr26036855wmq.153.1624873668165;
        Mon, 28 Jun 2021 02:47:48 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:6f48:4aa9:490d:a26? ([2001:8b0:aba:5f3c:6f48:4aa9:490d:a26])
        by smtp.gmail.com with ESMTPSA id p9sm1911385wrx.59.2021.06.28.02.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jun 2021 02:47:47 -0700 (PDT)
Message-ID: <4e0756103e5453a65b763d7a458b4576a97ad5ae.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] python3-pip: upgrade 21.1.2 -> 21.1.3
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: zangrc <zangrc.fnst@fujitsu.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 28 Jun 2021 10:47:47 +0100
In-Reply-To: <1624868106-101368-1-git-send-email-zangrc.fnst@fujitsu.com>
References: <1624868106-101368-1-git-send-email-zangrc.fnst@fujitsu.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2021-06-28 at 16:15 +0800, zangrc wrote:
> Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
> ---
>  .../python/{python3-pip_21.1.2.bb => python3-pip_21.1.3.bb}   | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-devtools/python/{python3-pip_21.1.2.bb => python3-pip_21.1.3.bb} (83%)
> 
> diff --git a/meta/recipes-devtools/python/python3-pip_21.1.2.bb b/meta/recipes-devtools/python/python3-pip_21.1.3.bb
> similarity index 83%
> rename from meta/recipes-devtools/python/python3-pip_21.1.2.bb
> rename to meta/recipes-devtools/python/python3-pip_21.1.3.bb
> index 04c6bb587c..239e83fced 100644
> --- a/meta/recipes-devtools/python/python3-pip_21.1.2.bb
> +++ b/meta/recipes-devtools/python/python3-pip_21.1.3.bb
> @@ -10,8 +10,8 @@ inherit pypi distutils3
>  
> 
>  SRC_URI += "file://0001-change-shebang-to-python3.patch"
>  
> 
> -SRC_URI[md5sum] = "a867fd51eacfd5293f5b7e0c2e7867a7"
> -SRC_URI[sha256sum] = "eb5df6b9ab0af50fe1098a52fd439b04730b6e066887ff7497357b9ebd19f79b"
> +SRC_URI[md5sum] = "e459d41a10ce33688b5d389216a8876f"
> +SRC_URI[sha256sum] = "b5b1eb91b36894bd01b8e5a56a422c2f3838573da0b0a1c63a096bb454e3b23f"
>  
> 

Could you drop the md5sum lines in future please rather than update them
as we no longer keep those?

Cheers,

Richard

