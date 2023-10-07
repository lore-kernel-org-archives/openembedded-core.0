Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14D25E95A6B
	for <webhook@archiver.kernel.org>; Sat,  7 Oct 2023 21:19:22 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.26797.1696713558523989652
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Oct 2023 14:19:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CITWnLkV;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-406650da82bso29947785e9.3
        for <openembedded-core@lists.openembedded.org>; Sat, 07 Oct 2023 14:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1696713557; x=1697318357; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i/VccFMjGo5Y+q1KfswnnKN3A81iVcrgVVfbFjKU1wE=;
        b=CITWnLkVtGTwfoByWjnwbRHZ9TIxmdEyEaBzksdKpV6KS+9pWqoHOnCJbdWNksoMk9
         dlmYje/S0aqQD+WrDDdTQ2jIufTj0JnwZFnPegtc2v3r9y87YW3cOvl4j6NvR4rvu89b
         57o867ECdkhSTy9115bwJWPwdT98g+3MifDhI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696713557; x=1697318357;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i/VccFMjGo5Y+q1KfswnnKN3A81iVcrgVVfbFjKU1wE=;
        b=F6b6OReMsMr9DjDM3cXDStO9GUuyH1VuZNegVUigmUphUVpP/AusMuN6/wbCdAcgiT
         TFfP5HJ3HBMXGWZMK9Css4qKX9HZ800PWoplSM/nU+WK0B19FY0qYObeD74mUIVEuZfY
         V47t/wEbeWna2oyaOcugdiSONSARRg3VYeWVogAkZCV7Y3JWSxdH0/XvpDRtXofGviOD
         i4FvGllsJKOQkwENvl1DzKf/qVEtH1kHXy0XApLATwKTaGvQCmydSlHSRSW1UNMAh+jy
         Jt6y99RHrJGIFfSt5951YNwU5DuiUWXIJr0XxcQ1idu4gq1pehf8dSD+HwOkenyQVCLr
         Fwqg==
X-Gm-Message-State: AOJu0YxJJi/p1gKpKonqEUtj5ZxDwrFRGCIi3XhDZLCrZ6ioDrtbkWuI
	1A+nTo+Y3YpTfvUIGZZCSSpkxw==
X-Google-Smtp-Source: AGHT+IFcKLeExT76zpTou9NnFqeNIar4zE/r53sx8VkhxymzmbVoQwRFN3ksB5YmKtMCH1M44rcC5w==
X-Received: by 2002:a05:600c:2284:b0:401:b493:f7c1 with SMTP id 4-20020a05600c228400b00401b493f7c1mr10994248wmf.35.1696713556735;
        Sat, 07 Oct 2023 14:19:16 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e3cf:21eb:ad11:4ec9? ([2001:8b0:aba:5f3c:e3cf:21eb:ad11:4ec9])
        by smtp.gmail.com with ESMTPSA id k1-20020a05600c0b4100b00405442edc69sm9210927wmr.14.2023.10.07.14.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Oct 2023 14:19:16 -0700 (PDT)
Message-ID: <ed60fed5785baae650ba805049d43501962e940f.camel@linuxfoundation.org>
Subject: Re: Useful for me to send more Python 3.12 patches?
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "chris.laplante@agilent.com" <chris.laplante@agilent.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Sat, 07 Oct 2023 22:19:12 +0100
In-Reply-To: <DM8PR12MB543033AE5F5845070EBDA2EC8BC9A@DM8PR12MB5430.namprd12.prod.outlook.com>
References: 
	<DM8PR12MB543033AE5F5845070EBDA2EC8BC9A@DM8PR12MB5430.namprd12.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 07 Oct 2023 21:19:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188799

Hi Chris,

On Fri, 2023-10-06 at 15:04 +0000, chris.laplante@agilent.com wrote:
> Thanks for accepting my patch from a few days ago :). Just wanted to
> check if you would like me to send more Python 3.12 compatibility
> patches. If there are bigger fish to fry I will hold off, otherwise
> I=E2=80=99m happy to help with making everything compatible.=20

There is a lot going on at the moment but those ones tend to be
relatively straight forward to review/merge and we are going to get
people reporting 3.12 issues soon enough so I'm happy to see them. It
is actually nice to review a patch which isn't a headache!

> P.S. I ask because I didn=E2=80=99t realize that Python 3.12 released on =
the
> same day as when I sent the patch. The tool I use to maintain Python
> envs (rye) dutifully updated to the latest Python version on the day
> I started some work on poky.

It is actually useful to know what happened as I try and keep on top of
things like this and I was wondering where people were testing it from!
:)

Thanks for the patches.

Cheers,

Richard

