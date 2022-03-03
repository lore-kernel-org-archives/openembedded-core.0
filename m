Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22F97C433F5
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 23:47:04 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.1465.1646351222701181255
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Mar 2022 15:47:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Wkarv/Fm;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id l10so222178wmb.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Mar 2022 15:47:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=GHjBPWi9tX0cP/Sn5rAmOzrr+C5KIwl4pYynDr/8mas=;
        b=Wkarv/FmP/6KNeWHrpr87YCpzJqOyyswxxWqHNOKW2M5qxcOwsvu9tN/NU3+4Y+IjF
         3DKaDgUn2OxKVok2fPHOGCzMDYbjLG9MDUMsDTG2FPw14sZ0p3fC9WBKFEkveu3SbI9o
         6dl7I6aYbVW6dWJ7E2yGE1+zMSYXra6eTUrBk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=GHjBPWi9tX0cP/Sn5rAmOzrr+C5KIwl4pYynDr/8mas=;
        b=GjXRirW0h69baUGatORQERHi3iCcXTbaEcjS3JtrH+jqZhp2X6zYMQDSUZHJeQu7jS
         pAMM3E8T3LZgc3lfIgUbtulMvxfEytgTlm9miVvfgUYAqjhDyX8xpKSbXjoMOUSrM3q5
         sYTmEtmQ7Xrhx/+XnlwuZ/QWCRfyW1CHxZTeogJtJAyaraGXn9+4UU4xYlFvEhWVBANI
         dv2u/+t7XPqbkYRZBi3k3V1tIkFy0dkDDaC558WLYEJ8YFMYSqDaAyShe3AmFop4k4+C
         cVthMPclQP1+7rsK+FCnM/aFju0T7f882OJHAMPa21qMe6/5XwEsyBHj0uJarXzKtNpW
         4Dbg==
X-Gm-Message-State: AOAM532scrXH9Qm8wHcYT0NVZ5Onx2m6xR7N2v8JDRGcZfZOH65KYJ8V
	38poHxdVWqtLAkaR9fCuY2JMpg==
X-Google-Smtp-Source: 
 ABdhPJxGnkAjI9HSmzES/sbeT4is1OGO29SwoCsgJdgJrpq28u1pGgnrm6sLjRwwqkcbLRIHCbQeWQ==
X-Received: by 2002:a7b:c94e:0:b0:386:3694:3e78 with SMTP id
 i14-20020a7bc94e000000b0038636943e78mr5872827wml.22.1646351220991;
        Thu, 03 Mar 2022 15:47:00 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:f5cf:8b05:e0eb:94af?
 ([2001:8b0:aba:5f3c:f5cf:8b05:e0eb:94af])
        by smtp.gmail.com with ESMTPSA id
 p3-20020a05600c358300b003897e440047sm194649wmq.28.2022.03.03.15.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Mar 2022 15:47:00 -0800 (PST)
Message-ID: 
 <d4f51c5770e4ffa626acffe9042aadd9d6e6ba92.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] python3-native: Remove all pyc files
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Tim Orling <ticotimo@gmail.com>
Cc: Ross Burton <ross@burtonini.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 03 Mar 2022 23:46:59 +0000
In-Reply-To: 
 <CANx9H-Cn8e6-5q-6YJurv0TkTDvFnVd=9Kd5qFs5geP7i8YXGQ@mail.gmail.com>
References: <20220303163451.336518-1-richard.purdie@linuxfoundation.org>
	 <CAAnfSTu78H+UG34pykED6G8M939LLmupEghxaUaz8_mToAwwFg@mail.gmail.com>
	 <6d880923351fe7e16d4c44d25dd8f43d1de390c6.camel@linuxfoundation.org>
	 <CANx9H-Cn8e6-5q-6YJurv0TkTDvFnVd=9Kd5qFs5geP7i8YXGQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Mar 2022 23:47:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162706

On Thu, 2022-03-03 at 15:28 -0800, Tim Orling wrote:
> 
> 
> On Thu, Mar 3, 2022 at 9:16 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Thu, 2022-03-03 at 17:14 +0000, Ross Burton wrote:
> > > On Thu, 3 Mar 2022 at 16:34, Richard Purdie
> > > <richard.purdie@linuxfoundation.org> wrote:
> > > > This removes a further 1600 files from sstate handling and lets python
> > > > create the ones it wants at runtime which is likely much better overall
> > > > for performance.
> > > 
> > > Playing devil's advocate: doesn't having them in sstate mean they're
> > > generated once and hardlinked, instead of needing to be generated for
> > > every recipe which runs pythonnative?
> > > 
> > > Whilst I can't disagree that 1600 files being dropped from sstate is
> > > good, we're just punting the recompile step to every recipe when it
> > > runs python code.
> > > 
> > > I guess the question here is how long does the Python library take to
> > recompile.
> > 
> 
> 
> At runtime it should only generate pyc for modules actually used?

Yes.

> > Another consideration is that there are many sysroots pulling in python3-
> > native
> > which don't run python and they're only there as there are python scripts
> > being
> > added which means python has to come too.
> > 
> > I suspect for that reason it could be a net win but it is a tough call.
> > 
> 
> I tend to be in favor of the reduced number of files moving around. I suppose
> we could do some timing comparisons if we really care. It will be a trade-off
> of network/io vs compute/io, correct?

Yes. I suspect the compile cost is tiny compared to the io/network cost of
chucking so many small files around when I suspect they're not used that often.

Cheers,

Richard





