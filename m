Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4D3F87C757
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2019 07:58:38 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id q1so24813737wrp.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2019 23:58:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=rkh3TVR8030roU0Q/DKLHFBHeg456hu0W/qT4YmzyDY=;
	b=XRrVblm8vKh/+np2bmZkHK9ysyyQy6Jb8NsieY+xo06CERUqqW3J8f9owkPUbGHbwf
	uQsYm4TZUpy1XwxbhgCR44aDaZOXVB/dT7npi2v9IPStQWrYtLfRQUqsKAgqO8R/QhCJ
	B8YtGqm/GS261B5C92jDvXlMUejzYB7NgZrwU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=rkh3TVR8030roU0Q/DKLHFBHeg456hu0W/qT4YmzyDY=;
	b=EcqUho9Kg4fjBjV+IvLZm3ogveg4m6sYgumwciRMp/luD8D06CoDjfN1O1hHI+turF
	Ejxg8fpzxRHJleATOwWl3ayrWMAbJt1YAKBzfFaRR8/yAV1jhvADVe7qilNL+5ZemR5/
	bgEnK0M+oALAWeT0kmbYsmf/+mhkn7BsNj9Wv3mw9ROkztv+bHuLnJsQMLQb5WXEhj//
	y6k8qkBo6HoMBWcjN/2lK5Zb+Oecopq8uvDaXNdvUlmTVt/l2BmRhpKjREv6WO1XhVje
	qEssfPbNXiABaQ/EyGfHNzTKd7P9+a9eTVu1Yjd6zxztTksB4dV/B9pYzxNSej93536i
	iqVw==
X-Gm-Message-State: AHQUAuYW0YI6jU9UYIfnVrE/WdmTfmC06VyDGEQ8FEybN/3M8+ss4E8B
	RZoIIEA/Cza8nF25Sc0976KHOw==
X-Google-Smtp-Source: AHgI3IZSt5+rbayme8Zi+79bnsrX+kAYoaoQIGSXDo96WPrUBLBEvQPnByGh0R9+MNG61dvek2Ln6Q==
X-Received: by 2002:adf:f388:: with SMTP id m8mr25042180wro.133.1550649518988; 
	Tue, 19 Feb 2019 23:58:38 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id x6sm8179329wmg.0.2019.02.19.23.58.37
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 19 Feb 2019 23:58:38 -0800 (PST)
Message-ID: <bd16855764cfba4d700e2be8c8ea7cecbf2dec9e.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Khem Raj <raj.khem@gmail.com>
Date: Wed, 20 Feb 2019 07:58:37 +0000
In-Reply-To: <CANNYZj9Abo0ZeUVq7jgkHLc6rENns=GptXNHq9eN-j_rJ20noA@mail.gmail.com>
References: <20190219165906.14377-1-fabio.berton@ossystems.com.br>
	<CAMKF1souMyUMczQ+-s_+W2Tomi=Q-7dj7Us1bwQ23rDS5CPx=Q@mail.gmail.com>
	<CANNYZj9Abo0ZeUVq7jgkHLc6rENns=GptXNHq9eN-j_rJ20noA@mail.gmail.com>
User-Agent: Evolution 3.31.90-1 
MIME-Version: 1.0
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/3] mesa: Update 18.1.9 -> 18.3.4
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
X-List-Received-Date: Wed, 20 Feb 2019 07:58:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-02-20 at 08:52 +0100, Alexander Kanavin wrote:
> I guess xrandr needs to be in X11_DEPS, this was added in the
> original
> mega-patch, but overlooked in the split version.

There were failures all over the autobuilder from this as well :(

Cheers,

Richard


