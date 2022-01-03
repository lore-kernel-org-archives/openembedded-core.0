Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD24EC433EF
	for <webhook@archiver.kernel.org>; Mon,  3 Jan 2022 22:19:49 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web09.36182.1641248388736511699
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jan 2022 14:19:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BEW24yrD;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id j18so72362545wrd.2
        for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jan 2022 14:19:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=Ruz5XZV/irMXTpBOSY+Yep/7pwBv94mFmyM0W0aRiBE=;
        b=BEW24yrDxqCwi7rR48tbaq1S7Dw9Jk5P4ncn/gb/ovaZ/WkgmjkJ4R7CqnhzAqR3NL
         XeBemZlgxG/7zqyCmTIy0Dzt0AupXGCGPkUDSiN6VI4zESOUD3qSvl51VZ7kYEA+9pzr
         nvZZqCWX2XXNOkce2RGWXHyOPsm6cHz1wuZbM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Ruz5XZV/irMXTpBOSY+Yep/7pwBv94mFmyM0W0aRiBE=;
        b=NDyY7pqxfgmlydtKDf2KSvu6gEONiFgHsjv/ZyMwrjARqmY9XZm+1XZaBysl3iIEcS
         jShK6KdEyI9nlQ/oQgL36qeejnQmdev9s8XKTseSZRuzh4kLVzTrIEAPhK0sa8Ks29C+
         CnN5+81W/YHbd+t+hiR14O3I+Hj+S0kl+5utieb5gORooh0dQQfQbLiht7MdxaAKmd3g
         b8sWzjmRWGJ5YbBseeo+appWtj9+8zyyIh7sx2eGGArfX6IvSiALPK2O3dsvrirgDpvy
         GZbBgP3I3gviUpU4DjiFfH4UVPDZPnWQcY69ib/U6QnsjO5fe0E2czlh2PfU1JGWVmEp
         Hx2Q==
X-Gm-Message-State: AOAM532t+q7XMPr9rxfBsJiO8KPQkWOIutbsUBdAN76xsOIxB+HG4AMV
	73hJ4mn/+Keo2UrqOPu1ogspBw==
X-Google-Smtp-Source: 
 ABdhPJzarGDj0sM1nHLev3V0yARX2f7D2e1ffOyhiKrJLVgA8FFJSDGvoz1IkcZZ5Expv9ibD9LUhQ==
X-Received: by 2002:a5d:6e90:: with SMTP id
 k16mr20588593wrz.112.1641248386987;
        Mon, 03 Jan 2022 14:19:46 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:da22:f51:54c3:4a4f?
 ([2001:8b0:aba:5f3c:da22:f51:54c3:4a4f])
        by smtp.gmail.com with ESMTPSA id
 z17sm37832656wmi.22.2022.01.03.14.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 14:19:46 -0800 (PST)
Message-ID: 
 <3ffd4598019daa0ce6a1f431267d2349f590342a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 11/24] meson: upgrade 0.60.2 -> 0.60.3
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Otavio Salvador
	 <otavio.salvador@gmail.com>
Cc: OpenEmbedded Core Mailing List
 <openembedded-core@lists.openembedded.org>,  Otavio Salvador
 <otavio@ossystems.com.br>
Date: Mon, 03 Jan 2022 22:19:45 +0000
In-Reply-To: 
 <CANNYZj-p+nJv1bVoEf9wps8iJbAPykON1ShNgQGyG+aUJ+o_iA@mail.gmail.com>
References: <20220103161854.301148-1-otavio@ossystems.com.br>
	 <20220103161854.301148-11-otavio@ossystems.com.br>
	 <CANNYZj-p+nJv1bVoEf9wps8iJbAPykON1ShNgQGyG+aUJ+o_iA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jan 2022 22:19:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160150

On Mon, 2022-01-03 at 20:09 +0100, Alexander Kanavin wrote:
> nativesdk-meson recipe too please.

Right, this caused a ton of failures on the autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/4569/steps/11/logs/stdio

There are also two python related issues in there in systemtap and btrfs-tools.
I think this may be the setuptools upgrade so I'm retrying without that but
something in master-next is causing that and I think it is one of the patches in
this series but can't be sure yet.

Cheers,

Richard


