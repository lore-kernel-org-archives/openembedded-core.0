Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3A6A07C4CF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Feb 2019 21:05:29 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id q18so1357152wrx.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Feb 2019 13:05:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=mGdHURqkjMYkW0herd3JeoDZqiqoTZJw/Kr7NAeysLk=;
	b=eGqCs921YsOfIsA8AwgwEJfHERAH+kyiYPpy+2CibaDm0XGYDI7aWrWX5/NNfCjCmG
	57BHVlYheEnmszm0SJbucn0j10m/Ae10aTHH8p/oW+JbHIECZMzI3jqycSHpgnYL//+4
	kbvw+EUzoIYtAwKJBYYBRXMd502Zn/Bg/elFw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=mGdHURqkjMYkW0herd3JeoDZqiqoTZJw/Kr7NAeysLk=;
	b=AcmZ7simDzUPfdVT3/YcmMSktXXEWH6RGHToruALQeS5e6mHbM7NafX6FYWM1VoBFA
	exOWuqKuV0uvTTd8pOC/KcDrDQY3NK0Pid0vRwapcYrUNcds12qOirJ5Ip2iv+KPSg7/
	jIPIbF3gXkkmHovmkvYULQqNokciCVKSSS8Gz0EFkdy9WE1MCI5X2+pvCgpI/J/YGhcp
	r4vADLmgqlR2VRJO6HXmEneMU+9oXBe8X2h5rXMPtChHRXdjcZLQIsKIBNttXmm4EV2C
	QOVdM720V85jG0NZ7C4YJOdNs5T7h0jj0mMN/tUviNGACyRtX1F7MLsQhkad9wZ5JtDW
	EiZw==
X-Gm-Message-State: AHQUAubY4hDkbOe5tPNHE8F2bLrtqzK1M6uagBdachnzadxs8Q7FBnDj
	I3Fh2A7jS0L/5mcsFeJBqD+TzQ==
X-Google-Smtp-Source: AHgI3Ia0AebQlv8nYUf8MV3PoIbXZ94hr03C4PWOUlhe2vbKBctV6So1st3NBIVkbfFo6youZMKL0A==
X-Received: by 2002:a5d:4b01:: with SMTP id v1mr13277197wrq.5.1549573529788;
	Thu, 07 Feb 2019 13:05:29 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	c129sm250537wma.48.2019.02.07.13.05.28
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 07 Feb 2019 13:05:29 -0800 (PST)
Message-ID: <bdafac99fb9115efca1501c60cf0091fa07d6bd4.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Anuj Mittal <anuj.mittal@intel.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 07 Feb 2019 21:05:22 +0000
In-Reply-To: <20190207055714.25880-1-anuj.mittal@intel.com>
References: <20190207055714.25880-1-anuj.mittal@intel.com>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Subject: Re: [PATCH 1/3] libva: upgrade 2.3.0 -> 2.4.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 07 Feb 2019 21:05:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-02-07 at 13:57 +0800, Anuj Mittal wrote:
> For changes, see:
> 
> https://github.com/intel/libva/releases
> 
> Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> ---
>  .../recipes-graphics/libva/{libva_2.3.0.bb => libva_2.4.0.bb} | 4
> ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-graphics/libva/{libva_2.3.0.bb =>
> libva_2.4.0.bb} (92%)

This seemed to cause:

https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/266

Cheers,

Richard




