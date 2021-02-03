Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.7351.1612348219367106274
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Feb 2021 02:30:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Stao/mas;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id l12so23566403wry.2
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Feb 2021 02:30:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=5RaY1bFY4OvUZalbjpryxC+ac62BJLlrb+Y6NXN36Ow=;
        b=Stao/masu9FbWmrIPQfSBTdpcQjRaQeP5kzB0Lh3qv+iAxMj26ctMoluv8jvkaVZ0H
         fGUYfcAyXwy5xn+r5hG7+4Elfg5Sg7/b61jG/2Y3Lr9/rrE8qhvuj9BbwOdKpyJclZ1X
         Wf123t1zXP2+zFjwobgPUX89lL8Od0qcVdcoo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=5RaY1bFY4OvUZalbjpryxC+ac62BJLlrb+Y6NXN36Ow=;
        b=src03Y/ojXPdgafLugHwS0IrF2P92Nd9E0kHpVjmvy/iX8BImuquKh2yaLTSdKn70b
         I5lAt+M6xLAuQmHbztRrT5hmIaz34Q02s8SLVPU0oAyI0EPJ311LRsaxt2i4LVTncxif
         SW4ko8e4qQ2zIzK1a6Ga/tKWpr/6XX7oTdIKjopd8VwDegU/XIdp3qvtpM5AXc3KLToC
         rje4pQ5+y6S8tq1xTCkfNPce8mpb6GLGW/LspTMuJMz+nQmb2bxuNYfz6aLPtILIBWrc
         OAhVCl4YoxvDYkiiFD/7Ez6hB3ZeK45lDxvl8wrSxoI8SFGEJ6UuHiv2suC2GARRkNHc
         MYng==
X-Gm-Message-State: AOAM533CPRi+9sT9zfmyIc0cUFZKvDXH5g+AgEXulsgCVocFcEN2E8kF
	i+fkDEcURFjxixIc9l24hV8bCA==
X-Google-Smtp-Source: ABdhPJy8CaxF8gl7Rpa19Dyll0pVK8RFaQv+miCjWi5tNBUhL6VqL/QnaK2OenHUQ+ne9P3HpRegFw==
X-Received: by 2002:adf:9427:: with SMTP id 36mr2697148wrq.271.1612348217854;
        Wed, 03 Feb 2021 02:30:17 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:a910:113:8225:ce6d? ([2001:8b0:aba:5f3c:a910:113:8225:ce6d])
        by smtp.gmail.com with ESMTPSA id n4sm2885236wrt.47.2021.02.03.02.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Feb 2021 02:30:17 -0800 (PST)
Message-ID: <6557c3fc0dfcfa0968186079d6db005856b745a9.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] glibc: Upgrade to 2.33
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Wed, 03 Feb 2021 10:30:11 +0000
In-Reply-To: <20210201183910.145052-1-raj.khem@gmail.com>
References: <20210201183910.145052-1-raj.khem@gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2021-02-01 at 10:39 -0800, Khem Raj wrote:
> Drop backported patches
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---

Patches fail to apply, e.g.:

https://autobuilder.yoctoproject.org/typhoon/#/builders/106/builds/1911

(but basically everything failed)

Cheers,

Richard

