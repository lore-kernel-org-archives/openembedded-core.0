Return-Path: <mathieu.dubois-briand@hyprua.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BAD5C4332F
	for <webhook@archiver.kernel.org>; Fri,  9 Dec 2022 16:18:24 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.5719.1670602695070919109
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Dec 2022 08:18:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@hyprua-org.20210112.gappssmtp.com header.s=20210112 header.b=VRQhPFjn;
 spf=none, err=SPF record not found (domain: hyprua.org, ip: 209.85.128.54, mailfrom: mathieu.dubois-briand@hyprua.org)
Received: by mail-wm1-f54.google.com with SMTP id f13-20020a1cc90d000000b003d08c4cf679so178694wmb.5
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Dec 2022 08:18:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hyprua-org.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=is/vE7M2D/+QQMV9NiOgGjOwwS/jz2AEVzG+5HL/Q9I=;
        b=VRQhPFjnEn3q0vJUaWNZMK5pl20z433yIdHuQgIJZUnckfu4zyLzONpG630wKjXkXB
         8cfu76Y8ffrWyY2pCxFN4W2RD/xLPE1jVam2+8/YKogfirNKsBT5GXXN/47OY46G4tIm
         MoIbPzjJrXS1hfSFMvGFt9akLnh8kEmzOew0hC+PH6YaeVIlJIZ6Sjh0OgTlqfYfPDJ0
         XgOKdAARv8kUo4zDGKchiqyfYn7d4V8ybqfGb7jiz6hzlgg8/UInEgs+d8bKf0WcaX+b
         199VCifd42l72eXMUVRSZmVKTfiRDta3FmkDVRCRVlS4pGRiijbjhFASyFvXrNoSeHVE
         OGAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=is/vE7M2D/+QQMV9NiOgGjOwwS/jz2AEVzG+5HL/Q9I=;
        b=3g5klbtz+kFij4KwJE6nWgjIODdX8Kx7XfcYTr7wsyIjZhjZmN/IN3i9j5CdG8LtK0
         PgWk16rXxA+5efPIPjvjKkX5AiGmvscOGybln3HahOxMM6/BQGuRldjDRC7Pum9Bm7K/
         GPvaNSb+X/YW+9Bwf00l1Q5LOp2SAaWb3+ngTxH/Kyyweee249ScY4elPn2OX9N01dxr
         7DpiCUURKgiqzooLpLofqt7VY57GcX4kIXyAqanoOzmU440X+oa4aNWMVBlcrW8q4hej
         qJH59qsfW613HB0vchEr8wQ9QslSeR9KdPvtInt3ggEnQLNrWaOKsb3HnL0HIsgIKaY/
         ZSIA==
X-Gm-Message-State: ANoB5pkiArj0nQCwrs9fYZZpYztThmOSCwXUUgRFzHC/iMEcUce2eESp
	Y/XLlPHkFnFiikmeEtyOaCT8Rg==
X-Google-Smtp-Source: AA0mqf7LyKUnleBn1PSvGxIie8djGr8bBbUxdvPCa1xvZRoGz3SFOcRHE5q5N1Ztng2rturM+H07tg==
X-Received: by 2002:a05:600c:a54:b0:3cf:894f:964b with SMTP id c20-20020a05600c0a5400b003cf894f964bmr5261163wmq.16.1670602693524;
        Fri, 09 Dec 2022 08:18:13 -0800 (PST)
Received: from WIPC21110265 (229.163.185.81.rev.sfr.net. [81.185.163.229])
        by smtp.gmail.com with ESMTPSA id 13-20020a05600c228d00b003d1b4d957aasm161671wmf.36.2022.12.09.08.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Dec 2022 08:18:13 -0800 (PST)
Date: Fri, 9 Dec 2022 17:18:10 +0100
From: Mathieu Dubois-Briand <mathieu.dubois-briand@hyprua.org>
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org, Qi.Chen@windriver.com,
	Mathieu Dubois-Briand <mbriand@witekio.com>
Subject: Re: [OE-core] [dunfell][PATCH 2/2] dbus: Update to 1.12.24
Message-ID: <Y5Nfwth9EKOOKYDq@WIPC21110265>
References: <20221209152504.2513715-1-mbriand@witekio.com>
 <20221209152504.2513715-2-mbriand@witekio.com>
 <CAOSpxdaEDSkWoQQFTctAY+7wyb6wtqgXKNrio3T-3kX8vWPTqQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOSpxdaEDSkWoQQFTctAY+7wyb6wtqgXKNrio3T-3kX8vWPTqQ@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Dec 2022 16:18:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174466

On Fri, Dec 09, 2022 at 05:59:01AM -1000, Steve Sakoman wrote:
> I suspect you aren't using the current dunfell head since dbus has
> already been bumped to 1.12.24:
> 
> https://git.yoctoproject.org/poky/commit/?h=dunfell&id=bff6562223f646404842ae1631a9df17158808b8
> 

Yes, you're right. Sorry, I was on a branch that was a few weeks old and
forgot to rebase.

So the second part of this patchset has to be skipped, the first one is
still valid.

Mathieu

