Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web09.15490.1609776526948926461
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Jan 2021 08:08:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20201202 header.b=RqfipPdx;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: okaya@kernel.org)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1901920578;
	Mon,  4 Jan 2021 16:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1609776526;
	bh=GRkctPG2+Pcdes7a18mpp6/6vhUovuX/1rAu2PKUhuU=;
	h=Subject:To:References:From:Date:In-Reply-To:From;
	b=RqfipPdxbtlhWJY5XawyZth07NXwDyyz4EUgt+MglZc8hH0vHuxHtBKhAueNybdfj
	 sjgErUJVCSj6aKfidWZVbMojUJ8sBLcIdqHqflR612SOR+RfyHfr99ATfSgGPBWeCO
	 aa9295Rc68BZzStiY+Yyt8sZLSGeNqjSjeoDH09NRtaE6qTgc4rs0NGhotDrIQjzBe
	 YTEV9nb8i7ELRopH/Xi0i873Brb8MNYmusfe1ISFbnF7PnLcjXEXm1Al5jUyqkojQa
	 O3IaWoTiHWwlCbj2+gnCdM7SyLBjGsbeh2npvDheKbrCKETJowujY8fX0xJahD5W0P
	 J16k3MS6AnjOA==
Subject: Re: [OE-core] [meta-oe][PATCH v5] net-tools: split mii-tool into its own package
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20201216224837.29524-1-okaya@kernel.org>
 <036d635c9ab0f70b30df61bc65a53ce32de2f13e.camel@linuxfoundation.org>
From: "Sinan Kaya" <okaya@kernel.org>
Message-ID: <c3d2d85c-cc9d-d60f-6f5b-1068104c13bd@kernel.org>
Date: Mon, 4 Jan 2021 11:08:45 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <036d635c9ab0f70b30df61bc65a53ce32de2f13e.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12/22/2020 4:51 AM, Richard Purdie wrote:
> I'm still trying to work through testing of these. This one seems to
> result in:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/23/builds/3077/steps/11/logs/warnings
> 
> which is from net-tools-native.
> 
> NETTOOLS_PACKAGES_class-native = ""
> 
> may be the neatest fix for that I can think of offhand.

Thanks for taking care of this.
