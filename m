Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id C438661600
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 15:27:57 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id m10so3063059wmc.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 07:27:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=15EgxfkN0o/A4u40Xqj0kz4r/kEL5uctj4h033DsluQ=;
	b=Yq/IHwK4hOiuU2kcCnheXr/x7H/ea1NyZkw+Wpz0OQ7oLBMePE+nDjMt4KvS+HkX0h
	ow3XuiYV3Og8ANbBQ6IQhE65GIERsGunoobs65ojr/GGXRsTP9dcwA0QagVhJo5HLwV+
	r9jktB2lOxawf4AvIVMwASayoXon0zGuQc3CI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=15EgxfkN0o/A4u40Xqj0kz4r/kEL5uctj4h033DsluQ=;
	b=tXA9nUL/KCAexSzCnfdTKxLLKdGIbnkZYtiys5U8RsvgmqEy/CsE9WSXn1VJyJZbwh
	zDnf4bUT+F3XynN01MFrA3d9fddHF82ytH99wJ86int+OqqMAB85Hs3bI46WwHE8LAS7
	ClPhIF8E4xRdnWHV2Kjs8Lj8qKpermNQNTH+DyJQJ7eh9jC40TToT7N/KLgo1Q0ULhZo
	Rk85NEzK9CnuWOhlfFoBOrnxeQeB+J9h8XXc957X5naariw19vwbUljuRlAS/LS0W2Mq
	dmCncg0Ze6FuqXW99IMF6VJ6AX3m3gq6YW9GYCYwzreogkSJaesP08ck3W+rYX6StGXs
	HLmg==
X-Gm-Message-State: APjAAAUFkY89ofquhep0YnguObe88m1zO9oMVxy0rWDF6WqS63dgo2wf
	9Ceond+J5+2LTrCycfqEKjcYBw==
X-Google-Smtp-Source: APXvYqxCKZzd8hnlO7/IJv29CrLDuVP/OWUeD0J/6zrP5vvZVwL8esylA2fbo+iBX6w9pV3bgl2CpA==
X-Received: by 2002:a1c:4c10:: with SMTP id z16mr5054007wmf.136.1582212478393; 
	Thu, 20 Feb 2020 07:27:58 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id t81sm4865047wmg.6.2020.02.20.07.27.57
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 20 Feb 2020 07:27:57 -0800 (PST)
Message-ID: <18c55700df9ee84ea44fbffc93ba4e9f3c0e1663.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Nataliya Korovkina <malus.brandywine@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 20 Feb 2020 15:27:56 +0000
In-Reply-To: <20200220150318.20003-1-malus.brandywine@gmail.com>
References: <20200220150318.20003-1-malus.brandywine@gmail.com>
User-Agent: Evolution 3.34.1-4 
MIME-Version: 1.0
Subject: Re: [PATCH] Set default CONNECTIVITY_CHECK_URIS to https://www.yoctoproject.org/
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
X-List-Received-Date: Thu, 20 Feb 2020 15:27:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-02-20 at 10:03 -0500, Nataliya Korovkina wrote:
> Signed-off-by: Nataliya Korovkina <malus.brandywine@gmail.com>
> ---
>  meta/conf/distro/include/default-distrovars.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/conf/distro/include/default-distrovars.inc
> b/meta/conf/distro/include/default-distrovars.inc
> index 433d4b6651..6c9155b2ae 100644
> --- a/meta/conf/distro/include/default-distrovars.inc
> +++ b/meta/conf/distro/include/default-distrovars.inc
> @@ -48,4 +48,4 @@ KERNEL_IMAGETYPES ??= "${KERNEL_IMAGETYPE}"
>  # fetch from the network (and warn you if not). To disable the test
> set
>  # the variable to be empty.
>  # Git example url: git://git.yoctoproject.org/yocto-firewall-
> test;protocol=git;rev=master
> -CONNECTIVITY_CHECK_URIS ?= "https://www.example.com/"
> +CONNECTIVITY_CHECK_URIS ?= "https://www.yoctoproject.org/"

Why would that be better?

There have been several requests to change this however I'm not sure we
can find one perfect url we can use :(

Cheers,

Richard


