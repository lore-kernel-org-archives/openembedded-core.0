Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id D40F37FE59
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jan 2020 21:23:21 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id g17so5031727wro.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Jan 2020 13:23:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=rSAzFgSNDcHeV2jnv9Yz6y9PE1BDqqe5igO3+Avduz4=;
	b=FOU6UQFUOe1QL+TxrdNYDef5TSNw+gwxi6KHs838uTSA3NUS2d0rubKV6kgZELIizV
	8BqWFyxSROn7gJ4vPQ99fgeD47jGE9PX790QF3V0rPs01D/V+JpALvBJWhTYD44wjcxV
	b2UXgJjLhUCleruXAy8MSBbbPFM/YITymgB2w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=rSAzFgSNDcHeV2jnv9Yz6y9PE1BDqqe5igO3+Avduz4=;
	b=dHnV0kIuVs3pfVKO5CTgZAvPe5EHDfjPTpFT62jXXlzue0IrdpWykN2ADmS1e560To
	NQPgBZtmt6JDWYVtDebthReOPQ3IyzQYyjnEjdsMsjh49pVqcONSyXWXsl/V6ZiKwbkP
	yQ0AK6CS1iatO663iDKToqHiZUXT9+H3OC5h38u8X7G7OTUF9XrhK7mbAcdkqDHjWkVf
	C3TcEdd3AuhlqrNX2pKWHnTZvS2lrrcUVbMzZC3uoN94nbgFMplG62X2RXR7pEMAHFmJ
	eX7xZqjtpf2Y5CAgSW3AXG9jfCmEgl1Cjwi/coi+5bK6iyjYbCUYLTWjzvJzGKzDob9W
	1F1A==
X-Gm-Message-State: APjAAAUiLqwpxTzh/FxnN2Jg1Xrqn12ebRzX6UOodUQSgt2lKCclMVr5
	u6qf9fiPC8IvX3KWpAMkMOaBh8oTp7s=
X-Google-Smtp-Source: APXvYqz614EGiqTpN28uwcBGpttoIj2BeUBOBEQg+KBb52YKsePuqjRaUgNzZoAakhlj9qcipses+Q==
X-Received: by 2002:a05:6000:149:: with SMTP id
	r9mr6873345wrx.147.1578518602650; 
	Wed, 08 Jan 2020 13:23:22 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id 2sm5474745wrq.31.2020.01.08.13.23.21
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 08 Jan 2020 13:23:22 -0800 (PST)
Message-ID: <15ea8a58c140419c32f08e4ab6148677bb23e920.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 08 Jan 2020 21:23:21 +0000
In-Reply-To: <20200108132759.95603-11-alex.kanavin@gmail.com>
References: <20200108132759.95603-1-alex.kanavin@gmail.com>
	<20200108132759.95603-11-alex.kanavin@gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH 11/28] ifupdown: update 0.8.22 -> 0.8.35
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
X-List-Received-Date: Wed, 08 Jan 2020 21:23:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-01-08 at 14:27 +0100, Alexander Kanavin wrote:
> Remove inet-6-.defn-fix-inverted-checks-for-loopback.patch as
> it is difficult to rebase and not clear if still necessary.
> 
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  ...efn-fix-inverted-checks-for-loopback.patch | 403 ----------------
> --
>  ...{ifupdown_0.8.22.bb => ifupdown_0.8.35.bb} |  11 +-
>  2 files changed, 5 insertions(+), 409 deletions(-)
>  delete mode 100644 meta/recipes-core/ifupdown/files/inet-6-.defn-
> fix-inverted-checks-for-loopback.patch
>  rename meta/recipes-core/ifupdown/{ifupdown_0.8.22.bb =>
> ifupdown_0.8.35.bb} (83%)


http://errors.yoctoproject.org/Errors/Details/305656/

Cheers,

Richard


