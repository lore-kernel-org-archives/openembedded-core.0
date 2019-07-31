Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6BE587F463
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2019 14:08:51 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id c2so66632470wrm.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2019 07:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=TGc0nLNPgAJypPld298FQzBl2lAAbEhuh3/4A6oDTfU=;
	b=AhblUlbW/7XVuTZQO5yggNqJkD03m3mA+UJLQeKG9Ax+DwSjWQZhAkyCP9obtnM8YD
	cftssCylTdOpHPUG/ouNXNlfgrTC6+tRxh/K39NMGWD8a+q2j5rtFgFAn62sEu0kR8gM
	a+FUNAxQgG4k2XfE1VOWwsNW7W4YF2ltf2lL4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=TGc0nLNPgAJypPld298FQzBl2lAAbEhuh3/4A6oDTfU=;
	b=IZP2smew1ueEmbJ/aYA/SN29FK0JTeMAidGi2WdszQaEDh8CSODxglIcp8qn03i93O
	i54OV7BdjjZQX5WaRhchcH6SuEc5Vj06aIWflIiqOy3h/IRTb4Vcideh3cyooWS2A4yB
	AoqRBm+2W58CblkDoW9gDxnwgHav1ntAjlsZnV4oTIuh7GygBsA46D9OZPI9D2subIz1
	zS+Zw4+99KPL/kJDSyG4f6HFcD9kDmvenDrkeWFVBZkscCeocf7D8Z6M+bCillyZwDVA
	uGZqbO6RoJ0PfjlsHj4BXJfzyhH1G0Qwj5mX5wA2cv1s7YF2uSJTuvwAB2Lmxt3hODvP
	GJcQ==
X-Gm-Message-State: APjAAAUnWxTYyai1n99JWwyFUD3oeXk+MtIMJRZSg+6QthQP8rgXQW2+
	rzRq+FVCDvZGTVcD6WswRka6kw==
X-Google-Smtp-Source: APXvYqx4otsiBL0q+GYQGiFPEuyzV7shVRipS5pCr08R0fO96rtOVc1i8xmr9tIbka4O0qWJUMIh3Q==
X-Received: by 2002:adf:ca0f:: with SMTP id o15mr18798363wrh.135.1564582132049;
	Wed, 31 Jul 2019 07:08:52 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	r5sm73151990wmh.35.2019.07.31.07.08.51
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 31 Jul 2019 07:08:51 -0700 (PDT)
Message-ID: <48417a96cf6cdec3d2b13e6857bbaf2df2567dae.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 31 Jul 2019 15:08:50 +0100
In-Reply-To: <20190731082539.27000-1-zangrc.fnst@cn.fujitsu.com>
References: <20190731082539.27000-1-zangrc.fnst@cn.fujitsu.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH] kexec-tools:upgrade 2.0.19 -> 2.0.20
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
X-List-Received-Date: Wed, 31 Jul 2019 14:08:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-07-31 at 16:25 +0800, Zang Ruochen wrote:
> From: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
> 
> Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
> ---
>  .../kexec/{kexec-tools_2.0.19.bb => kexec-
> tools_2.0.20.bb}            | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-kernel/kexec/{kexec-tools_2.0.19.bb => kexec-
> tools_2.0.20.bb} (95%)

Doesn't seem to build:

https://autobuilder.yoctoproject.org/typhoon/#/builders/50/builds/877

Cheers,

Richard


