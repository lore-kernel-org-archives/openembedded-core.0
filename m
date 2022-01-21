Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECF3AC433F5
	for <webhook@archiver.kernel.org>; Fri, 21 Jan 2022 11:36:33 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.10817.1642764992273800043
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jan 2022 03:36:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Egx+JoVF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id
 l35-20020a05600c1d2300b0034d477271c1so21698402wms.3
        for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jan 2022 03:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=HDJ6VZO1sHALdm+z0vT1yHnAR3ZsOZK/zFOO20vwZgY=;
        b=Egx+JoVFsn5zx9JhslbOcs40l4fjkABr5lJCOgmdYQiAGm1N4GizaveoSPnX4Bb/T3
         oDn9yXpZxtqPwFnGNbu1ChrrDlAcEAV36BAvU1t0DzwI0TFzYP+9LtZN818ROvY+lUEv
         I8DMQ3zvfhJSqraiDIq6DRUnT/tqHsjZbx6sE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=HDJ6VZO1sHALdm+z0vT1yHnAR3ZsOZK/zFOO20vwZgY=;
        b=BuxG6uDRrlU23V9hRGjawF49PBnI/A+QnvnY5Pu++KU9t4t+LpJ7FHLat47qIJPEDG
         K1DU+B1zlNZSis2/iS3fSTFcaRbyGKSvQXszMKpltegg6R7RcKHWoFInG9U89j4oF+pD
         LvDxwS7mHWZLjWrXYLWvWWhIrFBYOxbzBXn0OpD7ATpRhh+cC6cRHfUrZrXv2vvvYVwa
         lugXqYrrar+4aV4rv/S7Fiv2QLL1lio1ymRRyOvkDc1P7zUST/Tv8TyxpXNZFPZcj9Vx
         Dl6tDvMebZhnVNiFBwxbnibG+DBbemxmuAPszhKN0lA42S4p+IcdZfbnqLToJDn9swcp
         WF+g==
X-Gm-Message-State: AOAM530+f+n8n5iZayhuTF1EUnoS/zmmaE9AdnOfRb5oeSbky2yIwdzr
	NoS4P2y39jmTFa4RZLO7eSg1sg==
X-Google-Smtp-Source: 
 ABdhPJxRlLo0VVQ+LACSQPkktLFzozmKnU7LiPYklfJMRJ5ZLzaSECXbBxFIbPs2cP302We1TgX3OA==
X-Received: by 2002:a1c:9817:: with SMTP id a23mr339951wme.168.1642764990738;
        Fri, 21 Jan 2022 03:36:30 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:4dc7:4aef:2fda:b7ee?
 ([2001:8b0:aba:5f3c:4dc7:4aef:2fda:b7ee])
        by smtp.gmail.com with ESMTPSA id
 g17sm14687188wmq.9.2022.01.21.03.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jan 2022 03:36:30 -0800 (PST)
Message-ID: 
 <8f702dfd93898764fd8eae2e692fa0f5f79639bc.camel@linuxfoundation.org>
Subject: Re: qemu tests
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Valek, Andrej" <andrej.valek@siemens.com>,
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Cc: "Freihofer, Adrian" <adrian.freihofer@siemens.com>
Date: Fri, 21 Jan 2022 11:36:27 +0000
In-Reply-To: <af147eec110b7964f388fb5f0398042a7310cb90.camel@siemens.com>
References: <af147eec110b7964f388fb5f0398042a7310cb90.camel@siemens.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jan 2022 11:36:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160818

On Fri, 2022-01-21 at 11:32 +0000, Valek, Andrej wrote:
> Hi all,
> 
> I have a generic question about testimage task. Currently
> 'TESTIMAGEDEPENDS:append:qemuall = " qemu-native:do_populate_sysroot
> qemu-helper-native:do_populate_sysroot qemu-helper-
> native:do_addto_recipe_sysroot"' means that no other machine then qemu*
> has the feature available. So when "rm_work" is enabled and '-c
> testimage' is going to be run, ti fail, because sysroot-native stuff is
> not available. Does it means, that I have to add the those content to
> my not-qemu machine, or it's a feature?
> 
> Maybe it could be transferred into variable like:
> "TESTIMAGEDEPENDS_qemu" and then I can it assign to my machine as well.
> 
> How to deal with that?

The qemu machines are by definition able to run under qemu but we have no such
guarantees about any other machine. If they are able to, even then we don't know
what dependencies they might have and if the ones above are correct or not. 

I guess it could be abstracted but I'm not thrilled at the idea. The suggested
name above is certainly doesn't look right to me.

Cheers,

Richard


