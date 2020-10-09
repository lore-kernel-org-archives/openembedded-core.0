Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web11.16439.1602257040787828610
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Oct 2020 08:24:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BpKJyVCQ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f68.google.com with SMTP id k18so10214981wmj.5
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Oct 2020 08:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=xHQstBQXxvbFEBfWzEAv9S3UuxifA8q19E80l/gULj0=;
        b=BpKJyVCQaysr+3MKWXGdu4jEqOlXgFUTnM789YoZeIjqyksY+BZP3DCFgl8IM5OczX
         Qya9BSi9t9M1ohdl3ChepO+xEWlyB8TiFCaS+y/Ovwr9S2vkpYKMrOUAXDORI0AqAPvS
         o6HMWSx6SctuJzilkVaNBq/Iz5O86I4Di08jw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=xHQstBQXxvbFEBfWzEAv9S3UuxifA8q19E80l/gULj0=;
        b=IsTqN8qWnGOvANTxiYcQ50WmZ7CXLhib8WDzIrmlKy9Nd+clHNpGg+uhdzmRBqS/0N
         PbvWENejWKnRRhdV5RvTJ1W6mTwrKthCggW5HodLa2hg5sNpIPYBLBPNChAJ+S9H07fd
         MNJoxfaJQmHXAK+Sw0mUBpj3wWdtE6aZsmbvf1a2G43RF3sL5cYnbfb36Elg8+Hse0Xf
         IJJCPaeVtikRLNPWAx6JY6DbwGDGiBSKuZw6rhy7O5IrLjGhhIkz20kBDZcKeMBqPyWh
         WJ+cVTXcyyM7ymkxxr9CfPyGh6blpKVxZb9As7RVeffhkmmb49u5lQO7Fb1728GAzL56
         AHcg==
X-Gm-Message-State: AOAM532COn8vZ2V04nGKqGvKi9D7R1EgD5/Ll0Xu3kEGpDbMJmXJesqT
	AQSmawrz5ailQ7mv/LXiQkagew==
X-Google-Smtp-Source: ABdhPJzRjyQxf9lgpMxCB+rXkHSyiviqoQ1wsHl0VuhxNVZws8FOuZ+MCy6gSNBRzGRGiq8XMgzfpA==
X-Received: by 2002:a1c:9c13:: with SMTP id f19mr14104290wme.97.1602257039265;
        Fri, 09 Oct 2020 08:23:59 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 0.6.6.4.7.a.b.4.4.1.e.0.e.3.c.2.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (0.6.6.4.7.a.b.4.4.1.e.0.e.3.c.2.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:2c3e:e14:4ba7:4660])
        by smtp.gmail.com with ESMTPSA id n9sm11952392wrq.72.2020.10.09.08.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2020 08:23:58 -0700 (PDT)
Message-ID: <9e26168866709695b827450ba2e933efdb3077cd.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] allarch: Remove MACHINEOVERRIDES
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: douglas.royds@taitradio.com, openembedded-core@lists.openembedded.org
Date: Fri, 09 Oct 2020 16:23:58 +0100
In-Reply-To: <20201009043246.20465-1-douglas.royds@taitradio.com>
References: <20201009043246.20465-1-douglas.royds@taitradio.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-10-09 at 17:32 +1300, Douglas via lists.openembedded.org
wrote:
> Avoid machine-specific settings sneaking into allarch tasks.
> 
> Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
> ---
>  meta/classes/allarch.bbclass | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/classes/allarch.bbclass
> b/meta/classes/allarch.bbclass
> index 5bd5c44a27..2365691fae 100644
> --- a/meta/classes/allarch.bbclass
> +++ b/meta/classes/allarch.bbclass
> @@ -42,6 +42,7 @@ python () {
>          d.setVar("TARGET_CXXFLAGS", "none")
>          d.setVar("TARGET_LDFLAGS", "none")
>          d.setVar("POPULATESYSROOTDEPS", "")
> +        d.setVar("MACHINEOVERRIDES", "allarch")

Why would a recipe which is using allarch be using machine specific
overrides?

Cheers,

Richard

