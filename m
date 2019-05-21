Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 1CF407E165
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 10:42:05 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id 198so2443682wme.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 03:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=+0VDCOgWzvw67oiyuNhZETHwCPOdULKvfx4dOpLZjyY=;
	b=ZMGw07cQoC05ycdDBEFoHJQTNdFGYUUGBveGQwns+EQzM0gYSpHqGrief67Ow9SObB
	7ROsuvWyaCr25qWVRi0FgLCWJrm9x1gGgWQ4qH2XKUIL/9Ihx0ZWgEe/k+7Cveo01ip3
	J7E3NkXAN6U3UykpUzhy3YuXVmRR7v8YFEnR8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=+0VDCOgWzvw67oiyuNhZETHwCPOdULKvfx4dOpLZjyY=;
	b=Un8QtfPpQUp3bI8Zlwl7Zid8T7nkELeBrun3d1YTXjHOw+I+qKECKMTEphbbiI0yrx
	ot9xYBQOebUs1esEKF22TMtZcBt5R3c1uQ1HjuFHEwYnwu4tO+CVr5I64Dqg/rH8fAIi
	wpA+6Ob4mXxS3wn7XeaoSE4w93CYphpjzXOqgSRxtRghvDHuJ0DpF4dLJYv7eZWqERnY
	DWzN8ZKSUZacy8pXYsn0IgjCBCPFUug2y40Sfbx9zC1ztyC74VGzuzOBBteWJRu3iIFW
	Vqa/vJPp74T3SG7bNdNqzsqDpuMWDbLMdTdpQuVuHSy3spzjRXWxW3zlO3d1wjazyZdt
	a6Vg==
X-Gm-Message-State: APjAAAUDHyolRavUm3Ca5lYpZmk3X2UKAMNnfpPnu/8ojRGatbjKZMn7
	1Z4Scy7KqlWNlQ4pj//iSZNnDQ==
X-Google-Smtp-Source: APXvYqw6mDLXwVqIG0V5vziLj/eUtCNdU4WH39KvMTlSrCo7bUuFIN4So3VJizM4i0rci/qCieP8hA==
X-Received: by 2002:a7b:cd0e:: with SMTP id f14mr2754026wmj.127.1558435326809; 
	Tue, 21 May 2019 03:42:06 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id 74sm2659137wma.7.2019.05.21.03.42.05
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 21 May 2019 03:42:06 -0700 (PDT)
Message-ID: <3271f12b90cabf68ba0a2223b48aaf24b723d79e.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Adrian Bunk <bunk@stusta.de>, openembedded-core@lists.openembedded.org
Date: Tue, 21 May 2019 11:42:04 +0100
In-Reply-To: <20190516085636.9992-1-bunk@stusta.de>
References: <20190516085636.9992-1-bunk@stusta.de>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH v3] ofono: upgrade 1.25 -> 1.29
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
X-List-Received-Date: Tue, 21 May 2019 10:42:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-05-16 at 11:56 +0300, Adrian Bunk wrote:
> Remove patch applied upstream.
> Backport two fixes for build failures
> 
> Signed-off-by: Adrian Bunk <bunk@stusta.de>
> ---
> v3: Another buildfix backported.

I merged this but it seems there are still some other races in there
which appeared in later builds:

https://autobuilder.yoctoproject.org/typhoon/#/builders/67/builds/612

Cheers,

Richard


