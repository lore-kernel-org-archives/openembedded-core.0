Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21703C6FA9D
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 14:11:28 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.22949.1677679882278829004
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Mar 2023 06:11:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BFrrWTjg;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id j2so13337560wrh.9
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Mar 2023 06:11:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BqU3N+B8oCCjvRdHj0gXUyGi7zvC7vB+ATC5mMFxfeY=;
        b=BFrrWTjgl4dn5OX8YLT1RVjRthVosBt+redaGPRhuEYAkX32c4ySLSS/js43L/sHl/
         DLaZKU6gubb0xqCHSibF0cj8XrgHvC/eEmWLNUuTzvtqEGzQN1SfOWXIPkZU+IWpDlqP
         Vk/u4CU21l6Yvhp6KWdjkYppfA43r76Os2acM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BqU3N+B8oCCjvRdHj0gXUyGi7zvC7vB+ATC5mMFxfeY=;
        b=UqVCd4mVfjplFN0cyX0mg5RyhfCyCX/7JH1dqCxyx3ZxBELFIXhx3jNglrJSWoxXR6
         IKIniEwNt0uTaTI94usyQ8ecHYMSEKbpGiikLZhxYsBFs/UbcWFtzUT5LvMguxNOXvrs
         nIbe7/jDumJvEEjHYH6eoodJLKicCjLtVgq8JxA4NPoaBs67GzXG5gy8NVn/ey3uiZHm
         1quuccvIShAO7lGh4ETs19ic3fh6nMOjSzw2BkimQKfRlnj0IM4PrKBYAUiflRVV2FbU
         E6AIgOj1KossVshCSQ4dfzB5+h4RBooAZ8dh+rPsALdFCJcDjeqAFyDicUJNZIJiOPh9
         S/fA==
X-Gm-Message-State: AO0yUKXZREehT/fwm7/yDQATzdxHy4b+jT1b0aS0x78HJWb9h7BZKZ+l
	++OlIMqpxfB+AKnO4FxBNXP5zA==
X-Google-Smtp-Source: AK7set+AkAqiAnJHMgED4WuxFP9Go+rgZlVSlPDKFZoN625K5f6UoClkMPx/0OwcMjtnAF0V5PsDkw==
X-Received: by 2002:a5d:63c6:0:b0:2c9:e34e:7d0 with SMTP id c6-20020a5d63c6000000b002c9e34e07d0mr5576470wrw.3.1677679880581;
        Wed, 01 Mar 2023 06:11:20 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:cc9e:5433:f22d:3a1c? ([2001:8b0:aba:5f3c:cc9e:5433:f22d:3a1c])
        by smtp.gmail.com with ESMTPSA id l1-20020a1c7901000000b003e2058a7109sm19215033wme.14.2023.03.01.06.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Mar 2023 06:11:19 -0800 (PST)
Message-ID: <4b3623567692b08b281fc2157701dfae310c3229.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] cve-extra-exclusions: ignore inapplicable
 linux-yocto CVEs
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Geoffrey GIRY <geoffrey.giry@smile.fr>, 
	openembedded-core@lists.openembedded.org, Bruce Ashfield
	 <bruce.ashfield@gmail.com>
Cc: Yoann Congal <yoann.congal@smile.fr>
Date: Wed, 01 Mar 2023 14:11:19 +0000
In-Reply-To: <20230227110027.804671-1-geoffrey.giry@smile.fr>
References: <20230227110027.804671-1-geoffrey.giry@smile.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Mar 2023 14:11:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177887

On Mon, 2023-02-27 at 12:00 +0100, Geoffrey GIRY wrote:
> Multiple CVE are patched in kernel but appears as active because the NVD
> database is not up to date.
>=20
> CVE are ignored if and only if all versions of kernel used by master are =
patched.
>=20
> Also ignore CVEs with wrong CPE (applied to kernel but actually are for
>  another package)
>=20
> Signed-off-by: Geoffrey GIRY <geoffrey.giry@smile.fr>
> Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
> ---
>  .../distro/include/cve-extra-exclusions.inc   | 296 ++++++++++++++++++
>  1 file changed, 296 insertions(+)

FWIW, with this applied, the list reported by our tooling was reduced
to:

https://autobuilder.yocto.io/pub/non-release/patchmetrics/cve-status-master=
.txt

Cheers,

Richard

