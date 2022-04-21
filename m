Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77D3EC83030
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:12 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web08.19626.1650535564106944077
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Apr 2022 03:06:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CEC+NDFv;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id
 ay36-20020a05600c1e2400b0038ebc885115so3402090wmb.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Apr 2022 03:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=YK5QUpYpv+eGViEl7xXRs6wJIiHKJGxg7UV5KrktLsk=;
        b=CEC+NDFvP5BUbft8akRtErpEw32sg76nVlcWT2IW/JkF/lfIuPSI70P9CY0GGjJ4IK
         uIsgHZXn1KU6g07sDsIDK9hLAERPwQwmYrBZ0eQz3ZRGAnsBlgf4Z6Xtl51eZouIT/Ke
         PUOzx+tGd0fCmLMxWjuY8GTdSMX0Nw9isP1C8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=YK5QUpYpv+eGViEl7xXRs6wJIiHKJGxg7UV5KrktLsk=;
        b=IQ3x8krgvr+jnSylcYyRbMA5ttx0xLDbQ2JOuynD1sNhfqb5g9uLrJDY1Fktjv+vaH
         tu6PLMSTW5+M004VHgTXi5Ruvxa9OMydFFT47GdMneBcRoXLB9aQ77KYFJLQaRG9ehDh
         iq4W7DyFDJcKdtkq0AOklTF+jsjhi/CMNk/LyyMr5OOXwNXCIANAqePmSepdG9/Lnire
         Hafek8B/WMcPsAtF6YUiJqS9zQvsUWCZN6np8wre03XalVx0Bc3z+6Qc/SdxmajXIY/+
         W3zpB6C9/hOqC7csXoXBkNykRHxfa68jmLJB5kgneXT9Jf/QU3lOOJcwyONjSpNTSkZq
         wYhg==
X-Gm-Message-State: AOAM531/4D71VoyoBM5Ah0coswOrCCLga0Mn2MdDHUD87nmJY0ioZB57
	Zkc8O1N1wnII3YzTGOc+lnwKCQ==
X-Google-Smtp-Source: 
 ABdhPJwtRf/H56AXYCMHUJQGzqaV1p9gpQN0uDri1f+2vHX6EJceLsd2LCnzjLw1yDy2/5Klw2He7Q==
X-Received: by 2002:a05:600c:6011:b0:38e:bc5f:5197 with SMTP id
 az17-20020a05600c601100b0038ebc5f5197mr7926659wmb.37.1650535562001;
        Thu, 21 Apr 2022 03:06:02 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:be2e:566:8fa4:996b?
 ([2001:8b0:aba:5f3c:be2e:566:8fa4:996b])
        by smtp.gmail.com with ESMTPSA id
 f16-20020a05600c155000b0039288e17458sm1937078wmg.19.2022.04.21.03.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Apr 2022 03:06:01 -0700 (PDT)
Message-ID: 
 <a202e0b962ce90da8c68599db32bc1d218be6530.camel@linuxfoundation.org>
Subject: Re: [OE-core] create-spdx: question about virtual/kernel dependency
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Davide Gardenal <davidegarde2000@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 21 Apr 2022 11:06:00 +0100
In-Reply-To: <LgTp.1650534808496385241.DMV0@lists.openembedded.org>
References: <LgTp.1650534808496385241.DMV0@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164755

On Thu, 2022-04-21 at 02:53 -0700, Davide Gardenal wrote:
> Greetings,
> 
> I'm currently having a problem with this dependency in create-spdx.bbclass.
> When building Linux everything is fine but using FreeRTOS brakes the build
> because there is no "virtual/kernel" provided.
> My question now is, is it really a necessary thing to have or not?

It is ensuring the kernel license information is included even if the image
doesn't actually contain the kernel binary. You'd obviously want to ensure the
FreeRTOS kernel is accounted for in your license information but I'm not sure
the right dependency for that.

We could add some variable that FreeRTOS builds could use to mask that
dependency out?

Cheers,

Richard


