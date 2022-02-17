Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0186C433F5
	for <webhook@archiver.kernel.org>; Thu, 17 Feb 2022 23:50:06 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web08.4539.1645141805185048428
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 15:50:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YNxRosVY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id h6so11617916wrb.9
        for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 15:50:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=9IVfWKhAas8YRVw/mvJwNmd9RnZoZRX2mlSoBGgDdcA=;
        b=YNxRosVY1+OWqlRkjuHztVKSEY6+m/tPsgWZkUXYZWSzRa6HPbJ5pnguUorqyeemtd
         H1kRt6KEfrOwd88PtT2nk0BNkQxwEfJaOUUnPkWtfmGDVhPoGNEzRNJzvJ8tH7MpxwqM
         DqbyJlk7i3LFi6hokJp+8YwptuHcYQp2udf3U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=9IVfWKhAas8YRVw/mvJwNmd9RnZoZRX2mlSoBGgDdcA=;
        b=PX1Fvu+MnUp28LSfwTabK176xv9wXljBak+tiy9IDXL+q/kQZPEqdYIjd2+BzUneRP
         vJcAC2osS2rdNpShCqedeMqShxxBXODO3yJUdFm+5fTMT4Etggfz9y/8IHFLPgLszCQ/
         aAPt91FLWm4hmtzi7IWEoTGZIMaTjx1BC70kDZoBOlHSnPTvZ0zsnkfSg2ZoZTR1Ryl1
         O71dma+SjL7A9Cl42UFvWfuzOHBfjMligILO4e3I/Ym7TBKZEDGHlfWHFD29LvGeZ7KE
         PqEA7YIHpjt123fbWDENSXp262WRISAgIlmkEAaM3QJ6fbB8cUXt6s92XZFSrWSCkNDj
         KlNQ==
X-Gm-Message-State: AOAM532Z420V8tOGUoBM0v+KYXLHZSwOzFytgEjhNSkBQw1NFTnJ5q3P
	ZXYLSBsmWeF6ThR+XIrfF3yNpw==
X-Google-Smtp-Source: 
 ABdhPJwF5nzvssd3RLZbx3D8xXFFZcxofnO7Il92MvLeq4UoYeG7f+HU+QK9tqaFpPD0cuYSGjUMQg==
X-Received: by 2002:adf:dfc4:0:b0:1e4:ed7c:34ca with SMTP id
 q4-20020adfdfc4000000b001e4ed7c34camr3971690wrn.22.1645141803257;
        Thu, 17 Feb 2022 15:50:03 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:7bc9:59b:7021:269f?
 ([2001:8b0:aba:5f3c:7bc9:59b:7021:269f])
        by smtp.gmail.com with ESMTPSA id
 j10sm3276078wmq.20.2022.02.17.15.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Feb 2022 15:50:02 -0800 (PST)
Message-ID: 
 <c017f7a95fa977fd113892c8d4f2b0882b410df8.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] gstreamer1.0: update licences of all modules
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jose Quaresma <quaresma.jose@gmail.com>, Peter Kjellerstedt
	 <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Thu, 17 Feb 2022 23:49:59 +0000
In-Reply-To: 
 <CANPvuRkQiwKXTB-6SXD4sf1vtBWH7DQEG-Q_M+tXo1N6S1QNYw@mail.gmail.com>
References: <20220216232803.1868265-1-quaresma.jose@gmail.com>
	 <705135fb77074d9c9ac87d0d060592e1@axis.com>
	 <CANPvuRkQiwKXTB-6SXD4sf1vtBWH7DQEG-Q_M+tXo1N6S1QNYw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Feb 2022 23:50:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161874

On Thu, 2022-02-17 at 23:08 +0000, Jose Quaresma wrote:
> It's not as simple as I was thinking, I'll need more time.

Perhaps split the patch so the main change to LICENSE can be resolved, then the
remaining later patches focus on the harder bit?

Cheers,

Richard


