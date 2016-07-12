Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-vk0-f66.google.com (mail-vk0-f66.google.com
	[209.85.213.66])
	by mail.openembedded.org (Postfix) with ESMTP id 4378D606D0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2016 10:13:06 +0000 (UTC)
Received: by mail-vk0-f66.google.com with SMTP id v6so659899vkb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2016 03:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=Cqmr+peJR6D9cVExtp6EGfpDREU7HLXO5Z0czC/Qsc8=;
	b=bIGiqSqD+cLR5tNVJi3TKJufIncE2Otrx8gZfPRijELY1pb5WjSkpm8ggIZSwelJGT
	xTWlzRUYNEhV7B0u7FbNl9qkEmM1fJlIDNOuK4EFs8fj1yFu2P5jm6tB4lAsHiZ3Ke3o
	j0XezN0/OOCI1BphY1g0zCqWEqaDQmN4Iyio39Gfn3lr2Z5MSAIPg0HlfdjMWJwQ5tAp
	gxke4/xbryBV0PmZDzV1BxLkw/8WMkxGRN9VT96ZRhbm6llumR+xxJVJbiptu6ROj08H
	mqRaBM0d9kz1RXR/ymwpTmDMaGfSNV45y31CJ7uXiaMhH1UBXFEAObE8cOjvuyG3f5rp
	qLrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=Cqmr+peJR6D9cVExtp6EGfpDREU7HLXO5Z0czC/Qsc8=;
	b=T5l7hHJiJ4KwKNt6PFDjJutypSEWISG88h7ALNXqwV8/lGLfTmR9NmE6QmumcuWKmi
	aZ1OaIBqS3JMBv9iAwUtmWFjw/XMx1OSUedB2PXy2MB8Mn8FijCihgxk+atlzjmg/Drd
	MlZcY4KmZuW2jxbkqQeUJB34jYjbsDTtS6DZ4BE01aGT3gw3ISDfaLCI9uR/YzAjqUN4
	6X/4urP68Sj0QXv3j+5dgqfa14yAfwwJO+e0EtAM2tkhI82NrXfVFSJPpcftr1apnhcA
	7px5v/nqYKKOEqpFfKxokvsiZcqaFJdJXFluXdL48LvYL/7clsMGoTCevNFdeX6jaBYD
	SWZA==
X-Gm-Message-State: ALyK8tKwx3G1gd/tHJSExwABNhCAlaIEqkTbOUch03Q8DTMyWVFhclCLchB4AusdAt/mlQ==
X-Received: by 10.31.171.74 with SMTP id u71mr655879vke.119.1468318386196;
	Tue, 12 Jul 2016 03:13:06 -0700 (PDT)
Received: from mail-vk0-f51.google.com (mail-vk0-f51.google.com.
	[209.85.213.51]) by smtp.gmail.com with ESMTPSA id
	w65sm5177384vkw.11.2016.07.12.03.13.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Jul 2016 03:13:04 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-vk0-f51.google.com with SMTP id v6so14806270vkb.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2016 03:13:04 -0700 (PDT)
X-Received: by 10.176.0.180 with SMTP id 49mr532079uaj.107.1468318384259; Tue,
	12 Jul 2016 03:13:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.192.195 with HTTP; Tue, 12 Jul 2016 03:13:03 -0700 (PDT)
In-Reply-To: <1468274809-10301-1-git-send-email-tom.hochstein@nxp.com>
References: <1468274809-10301-1-git-send-email-tom.hochstein@nxp.com>
Date: Tue, 12 Jul 2016 07:13:03 -0300
X-Gmail-Original-Message-ID: <CAP9ODKrf1L7UTe4FnHOZ=pcKPjEoXnp9iR39tPEXd8-BOiUv-g@mail.gmail.com>
Message-ID: <CAP9ODKrf1L7UTe4FnHOZ=pcKPjEoXnp9iR39tPEXd8-BOiUv-g@mail.gmail.com>
To: Tom Hochstein <tom.hochstein@nxp.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] weston-init: De-couple framebuffer console from Weston
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
X-List-Received-Date: Tue, 12 Jul 2016 10:13:09 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jul 11, 2016 at 7:06 PM, Tom Hochstein <tom.hochstein@nxp.com> wrote:
> The framebuffer console was using the same I/O as Weston. We fix this
> by having openvt switch to the new VT when starting weston-launch.
>
> Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

