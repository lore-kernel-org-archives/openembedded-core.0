Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id B671760116
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Aug 2019 06:05:24 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id t16so33338817pfe.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2019 23:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=5DFvKSijNliEB8XLOcRDp4jBywxEEXTLg2qkmip+gfQ=;
	b=G9HoJ8Wx4dh1XeItmM2RH+fjXYYfwZnX3TOuSzip44EIjkC012dh0/lMX8H0nSI6mc
	dShmLKUyDHp8L85pgy9BM1fVls384WZKBuau0kbPrbzNfHFaghRUTt7vXGVFUmweXuqT
	fgxdeIP2i60FU2fXypjtm5sFPdzIGSu+xXlS2o/HlyQ3rVdo8z8tbf0BkrufWI5Rp/LF
	6YT5kowp0o3kWh7cMNfLMiX6KDZloJWS4iTv6C79xtNzIQx3wXhbU+fr7L3n32TlKZr7
	YWf8VY6YZ8xf3rRSFJJZj1AdnivKQBBR8AQgehQ7cRQBXmJvhkEsbEc1Xl/DnAXlbZto
	BJlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=5DFvKSijNliEB8XLOcRDp4jBywxEEXTLg2qkmip+gfQ=;
	b=RVjnN+q4tJ0xKIe8RqCUSLgv+zPqqBiHDEeI3QWBT+zQ3YzcegGvR4dxl8t848bNAX
	c3A62DGIbw6VE9lkWVhmvJKfOAqz8hlAfX5zJvoQrJ7KUYsEx6iKx84QRlZigjIj6hrQ
	Xv4LquOpunhqvAk6yfiszZndhKxAul22PsGyy7JGqlxHXdAmdE12TUmnTVrC4NvFvDy+
	hs2rfNUhJGGuy1AHA/sQjLa7Tng16uTHii4BX+Nj/X+yDUiV/21jQ6s9qPP8Os3/vshC
	nSTP3/iImGo2oAuB41+eO789UKWiAIFUnvCEejmR4LsENiavZGlwhxZxVYLQ3b3PT4qy
	JoEA==
X-Gm-Message-State: APjAAAWytO+RL8XZIJC4RmD0MqXcXx0gKvinysYEFIrVXHg3YkYmVwnP
	E4AfhnT0UmMFIAh/ybc0LiEu2yaojxo=
X-Google-Smtp-Source: APXvYqxGtRljPrRpbCwGyaBwD/k8hL3ZMjqj+fI269EqSpkUHgrlGfeE+nyZZXds9KWT8grxRjNg+Q==
X-Received: by 2002:a63:c203:: with SMTP id b3mr118681401pgd.450.1564639525327;
	Wed, 31 Jul 2019 23:05:25 -0700 (PDT)
Received: from ?IPv6:2601:646:8500:6bc6::c2e0? ([2601:646:8500:6bc6::c2e0])
	by smtp.gmail.com with ESMTPSA id
	bo20sm3058834pjb.23.2019.07.31.23.05.24
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Wed, 31 Jul 2019 23:05:24 -0700 (PDT)
To: Adrian Bunk <bunk@stusta.de>
References: <20190801045001.19548-1-bunk@stusta.de>
	<CAMKF1so74xJArBvgMKUi34Lh65C5+BHV5xznsG=HUfXa18tQZg@mail.gmail.com>
	<20190801053715.GA12769@localhost>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS
Message-ID: <0f5751c5-ad0e-ec3e-7f70-773d9e22c9ab@gmail.com>
Date: Wed, 31 Jul 2019 23:05:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190801053715.GA12769@localhost>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] webkitgtk: Stop disabling gold on aarch64 and mips
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
X-List-Received-Date: Thu, 01 Aug 2019 06:05:25 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 7/31/19 10:37 PM, Adrian Bunk wrote:
> On Wed, Jul 31, 2019 at 10:19:24PM -0700, Khem Raj wrote:
>> I don’t remember if mips disable reason was same as aarch64 I hope it was
>> not a runtime failure can you dig a bit
> Author: Khem Raj <raj.khem@gmail.com>
> Date:   Mon Aug 8 15:51:00 2016 -0700
>
>      webkitgtk: Disable gold for mips/mips64
>      
>      with binutils 2.27, mips has got the gold support
>      but it doesnt work for webkitgtk _yet_ therefore
>      disable it for now.
>
> To me this looked like a buildtime failure, but it's hard to be sure
> when the problem is not described.


yes i remember it now it was build time failure

> cu
> Adrian
>

