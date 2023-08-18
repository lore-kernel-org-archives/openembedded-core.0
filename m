Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCEFBC001DE
	for <webhook@archiver.kernel.org>; Fri, 18 Aug 2023 07:20:30 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.6552.1692343229083975919
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Aug 2023 00:20:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KF0SUlE5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-3fe4cdb724cso6021665e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Aug 2023 00:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1692343227; x=1692948027;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/q/0/UgVUHdNF+GboDWbmvRmPEJdB6ak606GgsDDZ0s=;
        b=KF0SUlE5WehYXiejo+y26wyd0wx9K4gvFuPCdDsIEX6Ymlcy5HZBQsrqLh96zfOaHb
         H7cuiq/MxaSyiS4sE7svg32LJobHG5SlOvu7Db+g3TM22kjPT4QR2KubFpRBfKgcg83w
         yezXt4dK0IzspTn50PHiLIpawQ3DNBMocZwY0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692343227; x=1692948027;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/q/0/UgVUHdNF+GboDWbmvRmPEJdB6ak606GgsDDZ0s=;
        b=gl9fnhNPHpPLUB+TV4aILAWCpvyZQ6P0nQ+C0qdhE7etKAxZy0TgpGP3dmEIv3JclJ
         s5joiJ+bB4HwWODccCffcMyNmwPKTdLo9ar46gO4dZmCQLdDKjMN7ZerHww/qOLKQUC0
         fashXcERUlrM1swxhS7tKNTICSy7M2m/F9CiX51Fu1WAkUI0mNbUxfbB/CHpgw6ua607
         Lf/t0FY6Kmn9NEZl3L5F+29E1SkaieeqoEUk9vkH6wGMrVVHygMiOMXV9kzfrZfw26iM
         u+ZswEA6vIobEMOvwRnu3853Q/xWSfwb3eAhBzTNPNqt3hs7d+RHyAy07uLFS4KJL95p
         AKaQ==
X-Gm-Message-State: AOJu0YwkLkSF+RuC4lvebFZPnlwm1tmN7NvPXYzyz7TFpjANre6Uocmw
	qJ5b4SyYaZR77IXvopqKXC3BQg==
X-Google-Smtp-Source: AGHT+IHMdy4DHpaX82FGq6Ndwu0VlM14H3yRMpbfkDDu0hJTr1kAg7Bt57DL610IbOJkeABb8KawwA==
X-Received: by 2002:a05:600c:2107:b0:3fc:e1:24b5 with SMTP id u7-20020a05600c210700b003fc00e124b5mr1420370wml.23.1692343227336;
        Fri, 18 Aug 2023 00:20:27 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:b8a:199f:e210:2fe8? ([2001:8b0:aba:5f3c:b8a:199f:e210:2fe8])
        by smtp.gmail.com with ESMTPSA id g18-20020a5d5552000000b003142ea7a661sm1787136wrw.21.2023.08.18.00.20.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Aug 2023 00:20:26 -0700 (PDT)
Message-ID: <fce3961fa5372d09bfb8292fd273dc45c91344b9.camel@linuxfoundation.org>
Subject: Re: [OE-core][RFC v2] sstatesig: Add ACL and XATTR data to outhash
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Joshua Watt <JPEWhacker@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: p.lobacz@welotec.com
Date: Fri, 18 Aug 2023 08:20:25 +0100
In-Reply-To: <20230817191202.1565879-1-JPEWhacker@gmail.com>
References: <20230817185431.1562460-1-JPEWhacker@gmail.com>
	 <20230817191202.1565879-1-JPEWhacker@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Aug 2023 07:20:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186350

On Thu, 2023-08-17 at 13:12 -0600, Joshua Watt wrote:
> Records the ACL and (some) extended attributes in the outhash
>=20
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
> NOTE: This requires ACL and XATTR support from bitbake
>=20
> V2: Filter ACLs to not duplicate the stat mode (since that also does
> extra filtering)

I put this into testing as I was curious:

https://autobuilder.yoctoproject.org/typhoon/#/builders/154/builds/374/step=
s/12/logs/stdio

and more. I've not looked into what went wrong.

Cheers,

Richard

