Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6ECA279980
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2019 10:37:53 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id t5so20410851wri.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2019 03:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=LDte6XYcIAjq2NNlNDKACKIZcVntgw+ojJkaAmBLFf8=;
	b=d9Yfxls8F98AuwskvWXT0Wouq5ec8fosiJZ1a/GbioNV8foAj/AFGnlZ6hi9dFAb3Z
	0D0vOfaOzpbp//T90dEqKfmq1s4Zq9HyVEQdsvYI6mILNzcFdHpKyLFDsfhZMrKf/NhI
	h82mNTAj2ELT+zCOge6S/rRAjSpYoq+POGRMg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=LDte6XYcIAjq2NNlNDKACKIZcVntgw+ojJkaAmBLFf8=;
	b=DbLFowA0eSGWa/Ha1vYoMlpcTA8n9ADUcYW25O3z7uPnMPaUboIhTJqGaXpeBcgBVZ
	ZyTU6FFNfqagoHp14j0648Ruz0J1st+4WXeaj41qqNnLeDRSj7paRw74Hb1J/orIsYeJ
	P3k3XxY2/0fTyDAUBsGDU7WL6TTkdNQYLNb1WOtuvUirgOfSKdpTyD89ikYV4NMPr633
	Lkf7QPZIzt6wwhjzQgDwnzdGBM/95eO2KS1lRSJQsqgtx0rCa+96zxNAge2ndlGYoGG1
	PM1NEzGVB9XolF4a8R1RmGtbRCNaNLpFXjmud4rruvB77dpZgDJf5LLSayybjJWRNGr3
	zEog==
X-Gm-Message-State: APjAAAVthRiRqcrhErAIWYyB4vegGO/139L61cyIMhvyQu8R4POZYscR
	ChGCX/LD12wOdm0tmWD6hMrQ/g==
X-Google-Smtp-Source: APXvYqxrr3ljxH3+anNr1qjGCvIYQVr4wPC2Is8i13ocWGot2YLiaa6TC74q4RKTlnOXivLIty7WZQ==
X-Received: by 2002:adf:dc08:: with SMTP id t8mr17044250wri.103.1552991874225; 
	Tue, 19 Mar 2019 03:37:54 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	y140sm8030929wmd.18.2019.03.19.03.37.52
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 19 Mar 2019 03:37:53 -0700 (PDT)
Message-ID: <31a8aaaefcfd375138a1c0536cbb8f54cbe0c236.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Fabio Berton <fabio.berton@ossystems.com.br>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 19 Mar 2019 10:37:51 +0000
In-Reply-To: <20190318211307.12700-1-fabio.berton@ossystems.com.br>
References: <20190318211307.12700-1-fabio.berton@ossystems.com.br>
User-Agent: Evolution 3.31.90-1 
MIME-Version: 1.0
Cc: Eric Engestrom <eric.engestrom@intel.com>, Matt Turner <mattst88@gmail.com>
Subject: Re: [PATCH v2 1/2] mesa: Update 18.3.4 -> 19.0.0
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
X-List-Received-Date: Tue, 19 Mar 2019 10:37:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-03-18 at 18:13 -0300, Fabio Berton wrote:
>   - Patch 0005-egl-add-missing-include-stddef.h-in-egldevice.h.patch
>     was applied on commit e68777c87ceed02ab199b32f941778c3cf97c794.
>   - Refresh all patches
>   - mesa 19.0.0 deprecated the use of autotools and we need to add
>     --enable-autotools flag. For details see mesa commit:
>     e68777c87ceed02ab199b32f941778c3cf97c794
> 
>   The complete change log can be found here:
>     https://www.mesa3d.org/relnotes/19.0.0.html
> 
> Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>

mesa-native fails to build and qemu seems to be struggling with this
change:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/93

I appreciate that wider testing on the autobuilder is helpful but
these mesa upgrades don't seem to have even the basics right :(

There were other issues in this build as one of the workers seems to
have been failing to clean up old files which complicates the output.

Cheers,

Richard




