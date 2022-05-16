Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A94E8C433F5
	for <webhook@archiver.kernel.org>; Mon, 16 May 2022 22:36:17 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web12.333.1652740569405718526
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 May 2022 15:36:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fzOruLvq;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id
 c190-20020a1c35c7000000b0038e37907b5bso430284wma.0
        for <openembedded-core@lists.openembedded.org>;
 Mon, 16 May 2022 15:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=x3rSZLqHGrixZqGiNKpzKOMWWzVi9txv8Ec3ztVUsQg=;
        b=fzOruLvqTh9PTuqVrcucU7fxXiPSIZgV0SzM2RmDmdjSJ0FCwg72FpOLDBrCAdoAes
         /UAbg+btPRONpKAzGQVdpWMI7VnWn4Zs6k6s7ILjo9khrCgUfxMsXxe4/5F7xLIPkCA9
         821Cu39svK6UIXiacaSijgg2epmAfsW3u/43A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=x3rSZLqHGrixZqGiNKpzKOMWWzVi9txv8Ec3ztVUsQg=;
        b=ASKfauRWx+SiPh9u7/X8GPvlf7JLuynoCzpvwzynbConYkX/XIHs7JW0qD12DpINH+
         jD+oE9y+vRj6gP0q3b2KUJFkEVIE23rFpf3A1lOrN7yyVBiGMPADj3kd8N5wc2je6ahd
         p5pUvkN5qI/uUXgVyShgvM6xGITIiuVbD5IuzYaYeOq/G51TEKnc8TUOStrk6cuBt8SV
         U1MGTmhguJzeJl+6QiZ+5+8stmufDtlIE8B3fuXbnFZr6uFyr09AikifntDMKDY9GXs/
         JpFWnee27p2X2/XGgB7oLLx0wqsfLri2Ffx0mzMDslOhweEpkYjghzCRWoHZI45bK6wU
         tHhg==
X-Gm-Message-State: AOAM532uF4C8Zvi1gXnIMDSbXK7/9vxY5Lm6jpM0zS76pPHobMGG9Ct0
	Z9dvPnM7/n8VuhZ438M788qNIQ==
X-Google-Smtp-Source: 
 ABdhPJzvymyA0uVkwMzdSrnkHc1s9N/SVOCigW/01XKAa7C8gQ9hI0VgE3DNq7G+l308Aio00ZAXhA==
X-Received: by 2002:a1c:acc4:0:b0:392:9dd4:fbcc with SMTP id
 v187-20020a1cacc4000000b003929dd4fbccmr18306108wme.78.1652740567847;
        Mon, 16 May 2022 15:36:07 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:9c35:e819:58b3:2e94?
 ([2001:8b0:aba:5f3c:9c35:e819:58b3:2e94])
        by smtp.gmail.com with ESMTPSA id
 p30-20020a1c545e000000b003942a244f48sm382870wmi.33.2022.05.16.15.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 May 2022 15:36:07 -0700 (PDT)
Message-ID: 
 <0e805ea6bb38fff80238e689074a4392d5f6ba46.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCHv2 2/2] base-passwd: Update to 3.5.52
From: richard.purdie@linuxfoundation.org
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	openembedded-core@lists.openembedded.org
Date: Mon, 16 May 2022 23:36:06 +0100
In-Reply-To: <20220516181413.6755-2-pkj@axis.com>
References: <20220516181413.6755-1-pkj@axis.com>
	 <20220516181413.6755-2-pkj@axis.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.0-1ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 May 2022 22:36:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165699

On Mon, 2022-05-16 at 20:14 +0200, Peter Kjellerstedt wrote:
> * Add a patch to allow the use of debconf to be disabled.
> * Replace 0007-Disable-generation-of-the-documentation.patch with a new
>   patch to disable the generation of the documentation using a
>   configuration option.
> * Replace 0006-Disable-shell-for-default-users.patch with a sed
>   expression that uses a variable, NOLOGIN, to specify what command to
>   use for users that are not expected to login. This allows to use some
>   other command than "nologin", e.g., "false". Also, by using
>   ${base_sbindir}, it adheres to usrmerge being configured.
>=20
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>=20
> PATCHv2: Updated the Upstream-Status.

Sorry, this had already made it through testing and into the tree
before I saw this. Could you send the delta please?

Thanks,

Richard


