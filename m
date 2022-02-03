Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF66AC433F5
	for <webhook@archiver.kernel.org>; Thu,  3 Feb 2022 13:07:33 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web08.8762.1643893652412590554
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 05:07:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PJup3QAq;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id k18so4907294wrg.11
        for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 05:07:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=81lDavu/qx2vhdBjTu7iZMsbKWooc4AoimtQ9aDjI0Q=;
        b=PJup3QAqxZ2wodjOds41XupaQyO+JiGjcTNLBh19/S+UwLQsgU7Y9i4ateA1gTSdW0
         ruBjmMtgjm6zEFjcLlrDZ0xe037S/mGQ9e6rlYa29NTLDwoYYiEMqrTFxHc1w5knOhUo
         D/cBceF/eVMicfG1Jc+J4m7nqJGHNDTVlnAJw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=81lDavu/qx2vhdBjTu7iZMsbKWooc4AoimtQ9aDjI0Q=;
        b=C85AVIKjGTQz85lQT+TGQdv+iOwQFmiMk492hekAhsaqKZ9LmHcXko5I6Ed/ltLD1q
         x20hBxu+A2V2xaiJ3BAsD5eGZymZbHlimFj4coxBAUvcAvUOClhMWqA0WgWGoOSB4W3X
         Q71eyaMesAd8RazmK4u1LT+ZmB9lBfxRocjM1B/YXZdlDajtlwmZELSoDSmM3nzBDHlR
         +BAfYUGu9ail6j6oOCOO+A0QIROCnrmpBIa7fqLdg2guhIwEoBDLABg5I6qQHK8FgBSW
         a0itH0tnbpe6B7IZcMpGL7hcFxhtfpbzd/qZ6FvFdzHb1aebs78q9bRJ81xNgopCjZoP
         QhAA==
X-Gm-Message-State: AOAM531+y/Wq/l0oZU88Lekp08rDo/sZmkMDV2gaYjxqpDkRJkiaaqF8
	ExS1t7jIqG4iZOV7Z596o7oB5A==
X-Google-Smtp-Source: 
 ABdhPJx+sZPrcXEm3qHJjHrWzH1udk0ul4EIrYqukcsjfLHDCGzgXyxVegQjBTyAYu1Lb6XvSsbPLQ==
X-Received: by 2002:a5d:598c:: with SMTP id n12mr3091570wri.463.1643893650850;
        Thu, 03 Feb 2022 05:07:30 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:e772:7635:2207:1103?
 ([2001:8b0:aba:5f3c:e772:7635:2207:1103])
        by smtp.gmail.com with ESMTPSA id
 m6sm23377430wrw.54.2022.02.03.05.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 05:07:30 -0800 (PST)
Message-ID: 
 <0c0df739719f528922ef60b1f6e553e3a1d114cf.camel@linuxfoundation.org>
Subject: Re: [RFC] support for multi project toolchain-cmake
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Tobias Neumann <tobias@neumann-web.eu>,
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Thu, 03 Feb 2022 13:07:28 +0000
In-Reply-To: <1540523266.294149.1643372553712@office.mailbox.org>
References: <1540523266.294149.1643372553712@office.mailbox.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Feb 2022 13:07:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161278

Hi,

On Fri, 2022-01-28 at 13:22 +0100, Tobias Neumann wrote:
> regarding my bug report
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=14703 I was
> forwarded to here to discuss requirements for a proper fix.
> 
> In the report, I already mentioned a non-generic workaround for that.
> By extending the CMAKE_FIND_ROOT_PATH with CMAKE_INSTALL_PREFIX.
> However this probably doesn't cover all ways a toolchain can be used.
> 
> Another solution could be to respect the user provided path and
> instead of overwriting the CMAKE_FIND_ROOT_PATH variable, to only
> extent it by the toolchains location.
> This however would make it quite easy for a toolchain build to break
> isolation, when wrong user input is set. I don't know how strong your
> requirements regarding that would be.
> 
> So feedback how a fix should look like and what requirements it needs
> to fulfill would be appreciated.

Firstly, I'm a little unclear on your exact use case. Just to be really clear,
are you using cmake within a bitbake build or are we talking about using cmake
from within an SDK or eSDK external to the project?

I'm guessing this is probably an SDK question but you never mention the SDK
anywhere so I wasn't entirely sure. I'll assume that in my next comment.

With the SDK, if you have two projects, one of which depends on the other, I
have to wonder where the first is being installed to? Usually I'd have expected
it to go into the target sysroot that the SDK toolchain is using, then it should
be found by the second build? We don't support multiple sysroots for building
things with the SDK.

I'm therefore still a bit puzzled about exactly what the issue is here so
perhaps you could give a little more detail on the above?

Cheers,

Richard


