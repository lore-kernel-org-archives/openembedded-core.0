Return-Path: <trini@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 114D3C43334
	for <webhook@archiver.kernel.org>; Wed,  8 Jun 2022 13:54:29 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web11.6661.1654696467107005821
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jun 2022 06:54:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=nvxdW23S;
 spf=pass (domain: konsulko.com, ip: 209.85.160.177,
 mailfrom: trini@konsulko.com)
Received: by mail-qt1-f177.google.com with SMTP id c8so14933085qtj.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jun 2022 06:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=CI8jE1clcUrSMGcPH5zeFpYesUYIQSQUh2nHCGLXSF8=;
        b=nvxdW23Sv7zp9AnQoOf9sPL2PgDXqLiUfl8x3QVQ0WTpnqtm7mHQc7lUZl0EbSkufA
         Ak0ZNId4JJ4hWnUQhsanSIxQRoRFiDOJqUYZEK6+aGvmDfsPRN7RkjJ0uTAz/iNMf4FR
         PP6Sj4QuCYdOv+byWfjmZ4FH693dOyMuOBx7E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CI8jE1clcUrSMGcPH5zeFpYesUYIQSQUh2nHCGLXSF8=;
        b=zmt0nqhH3/9HTWCFD7B7WrJqJVnQjWpL3diTmV8RhZImkaTqTP80vltFUbgRIHTWUm
         XEx+wU5zeARsnkUsNU+qxMa3wfraIA/zPA/U9K2XCGfJnx9eNy7ffvye6C6lnoMN2d9U
         cRryAKMPdl4A7DISJMED+Fk9Wm7sRUMVF91+42zsAYtgQDkNL/ofSJ2pq7NVw2GhgBtp
         xvGIH4z8lbO+Fh/RwsvvodhvZMiTs05VOWcukzq2u/aaIG+klOMopMD4JWG8Rd5p1i3s
         NBfAkL5aM11X1/ESqkFWOiU57lAX6ZhvbmxtrBDVdLMqa2mUnV14oMTnpkF7NeUwpeE/
         T+CA==
X-Gm-Message-State: AOAM532ZT+Al6Twfw7u0zFSYBykFh8Xfko1QcueQWM5cAq4h0w+HgD0X
	aV+OnDlC6Nu1qLak3vQl6d04ng==
X-Google-Smtp-Source: 
 ABdhPJxPgKBV3dFrSBGnTOGPdcVXesn53vWlA6tmXuad0rjjDOjJCzdvVR40RfIbz6rV+LiNF8al4A==
X-Received: by 2002:ac8:5b95:0:b0:2f3:d1f8:bbbf with SMTP id
 a21-20020ac85b95000000b002f3d1f8bbbfmr26713589qta.344.1654696466199;
        Wed, 08 Jun 2022 06:54:26 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-195-139.ec.res.rr.com.
 [65.184.195.139])
        by smtp.gmail.com with ESMTPSA id
 bm32-20020a05620a19a000b006a6d20386f6sm5227721qkb.42.2022.06.08.06.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jun 2022 06:54:25 -0700 (PDT)
Date: Wed, 8 Jun 2022 09:54:23 -0400
From: Tom Rini <trini@konsulko.com>
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Cc: openembedded-core@lists.openembedded.org,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH] vim: put xxd in its own package
Message-ID: <20220608135423.GB2484912@bill-the-cat>
References: <20220608074245.1962967-1-rasmus.villemoes@prevas.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220608074245.1962967-1-rasmus.villemoes@prevas.dk>
X-Clacks-Overhead: GNU Terry Pratchett
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jun 2022 13:54:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166709

On Wed, Jun 08, 2022 at 09:42:45AM +0200, Rasmus Villemoes wrote:

> The xxd tool can be quite handy by itself, and doesn't have anything
> to do with vim per se. Make it possible to include the rather tiny xxd
> in a rootfs without pulling in the several MB vim binary and
> associated data.
> 
> For backwards compatibility, add an RDEPENDS from the main package to
> the new vim-xxd package.
> 
> Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>

Reviewed-by: Tom Rini <trini@konsulko.com>

-- 
Tom

