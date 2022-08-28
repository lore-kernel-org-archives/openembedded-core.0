Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22348ECAAA2
	for <webhook@archiver.kernel.org>; Sun, 28 Aug 2022 19:07:41 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web12.62296.1661713651701495066
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Aug 2022 12:07:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nGLssxwI;
 spf=pass (domain: gmail.com, ip: 209.85.208.178,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id q16so6182027ljp.8
        for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Aug 2022 12:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=p85pV2N308ti+5xgPliGUOeoyvnWoKw+lZlEvV7EIwY=;
        b=nGLssxwIQMzsIyD3AEstLXoo7ewx0BRBdRtOmblXUJqtUoWMFQmV94b5YiJqocyAo0
         gGMY2/o9TimoBG7P6DpL3aGF5Cm4l6SF37jagZ7CA4Cuk2weeIn7Ckv69xZ9udHqdvR0
         dMNawGQwXWcWEUWCG9wDN3nrgAUFv/D4xonFlZA+I8NxjLIzLrwhTOc0JP0KRVIRXEhm
         MNhSoCP6xBoktgI6N5wiLKrqoiHnmlcTs+ixESYSrgZYZr3ph5flFhJvIBazSKgfiL8s
         bmrN5eQ2kyhIfl+ZYKIKoiaDzdGkreMvcwJtFln4fYYq3/oXFA6do3ziF/NsuXVoXhwX
         fXTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=p85pV2N308ti+5xgPliGUOeoyvnWoKw+lZlEvV7EIwY=;
        b=BWNnd4p8iKAe4uzqimmwrlT47JbEBizu5snfabxnbG+ZMBpvyZYTQoOiXn/I9bDHgE
         7CIZYcuEJNo+g/zJ35T1EMikaa1g51bSFMfSjsFWDH9fvHIEF3y5DqxxBWp9+p+xqm+6
         27w1tc8szVG0huOpYNlA/e8KBNiri2JJJ5l/7phHDCrS32fr9ByMqVEAPR+PRB9m/jIU
         wmLCdI+cZhcnM8lYKnELlpbbh73X4RZZobEdJplld1dh9szmeg6MTZXKnSJG+4+RPwmX
         k565wkIep47X9aPpq2A9rpO1D6bqOlOyYw3wEBpyRbxKFitEV4S5oqoVQszKvo5zZUW6
         Si8Q==
X-Gm-Message-State: ACgBeo0/HXR6TBBUpoLkEanoIx0fZ5Ri+e4r90R9+/GxNun3QO25OrpJ
	/RJuGaYdR7+XSitNPWS2pdBXeY+hUY6nouj/ktA=
X-Google-Smtp-Source: 
 AA6agR7+ir/89E5XXRvCz0XWO8pRnphQHreaGOTEAgd6CXZcLnnLoBezV8joM073x2aJgEFF6fETmcgzafAYSfvtTPg=
X-Received: by 2002:a2e:161d:0:b0:264:87b0:fc7e with SMTP id
 w29-20020a2e161d000000b0026487b0fc7emr1069487ljd.191.1661713649653; Sun, 28
 Aug 2022 12:07:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220828174356.3074391-1-ptsneves@gmail.com>
In-Reply-To: <20220828174356.3074391-1-ptsneves@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 28 Aug 2022 21:07:18 +0200
Message-ID: 
 <CANNYZj9GcGzGr_mHTA4FA2QVerAeNGTgkgqX5jSXtfMBorOFgA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 1/2] ntirpc: Add ntirpc recipe
To: Paulo Neves <ptsneves@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Aug 2022 19:07:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169995

On Sun, 28 Aug 2022 at 19:44, Paulo Neves <ptsneves@gmail.com> wrote:
>
> ntirpc is an actively maintained rpc implementation. We cannot completely
> remove libtirpc due to arising circular dependencies where ntirpc
> depends on libnsl2, which in turn depends on an RPC implementation.

The circular dependency issue should be filed upstream, with a link to
the ticket in the commit. It's possible upstream can suggest a way
out, or take it as a bug.

Alex

