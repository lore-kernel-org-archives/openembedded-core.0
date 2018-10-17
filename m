Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2527B79B11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2018 11:59:47 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id q7-v6so1512904wrr.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2018 04:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=2eF1K39uSTdJDxsMp0EbN94bDP/jmIjhuaqpJu2fJuI=;
	b=FAnDCBg8asTSYKbE4+aMWpGpvUHQ38NZF9PaFsjv5EzgCX/zHe3DvoscSFr2Ypft5c
	B4sYfNhLG3dGI7TiscVWd4+HkP31/wynvf8pFENs9uHT8Fuz/IeErSNccAyMysyV5fXT
	LM78z8OvWQ135r5MeXC1g3KzKokWHSyNK/hMc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=2eF1K39uSTdJDxsMp0EbN94bDP/jmIjhuaqpJu2fJuI=;
	b=qOMLxMbFx7ROR/EXYuCa3B/6j+TXNbbaNO5944cNbBtdC4Bl2YWh3waIPBhpIgU7+E
	MyO+Dow5IK7Bbl3AYQa3dAVFtozt42Ow4t3JQKq7pFrNdoLkczQ1dXHwCHg/VV+bkO+2
	j38OAVXIDou3UHtiD6TvzBzThaWAwlgcLxlN1DDpSybCj0sKWn9NuKA91XpUGRk3y8xv
	6JRJWO7h3HG/KfawaizanOQDQwnUrIUsKUvtu+ElxUI4gCHg3v546DspD0lf1hwZScO4
	eV4hji9Wr8TZ9tdnCKW64H89Y8NE1L7sQrNjAkPkBZogi2+TBWKylCS/t4MLXklILaem
	c9ow==
X-Gm-Message-State: ABuFfoiepdv8LIOW7okgq3PgAM6K1tNaA9rOTwbmmazbluYsjsA9JgaL
	EbrB3jpaZ5Onaba/u4LAFr9m5FOVM7Q=
X-Google-Smtp-Source: ACcGV61pkyEJQUgZ9/eN2/60zvuI35zfGSBOQDtoml3OH09l+wCJ2+ARUUwegDaYKEXiED9deFPWnQ==
X-Received: by 2002:adf:9792:: with SMTP id
	s18-v6mr24570092wrb.283.1539777587518; 
	Wed, 17 Oct 2018 04:59:47 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	z12-v6sm15467378wrv.46.2018.10.17.04.59.45
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 17 Oct 2018 04:59:46 -0700 (PDT)
Message-ID: <118f12f46497b3b4fda287b64c5e432afde9b6d9.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Victor Kamensky <kamensky@cisco.com>
Date: Wed, 17 Oct 2018 12:59:45 +0100
In-Reply-To: <alpine.LRH.2.00.1810162250430.53155@sjc-ads-6991.cisco.com>
References: <20181015182128.13115-1-kamensky@cisco.com>
	<CAJTo0LYWG7O+VryaFi9r4kc5JagPtuynWHi9gV6nV+cLPUw+SQ@mail.gmail.com>
	<9f182627633f75c8383901510cc11e4b87349084.camel@linuxfoundation.org>
	<alpine.LRH.2.00.1810162250430.53155@sjc-ads-6991.cisco.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemtap: 3.3 -> 4.0
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
X-List-Received-Date: Wed, 17 Oct 2018 11:59:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2018-10-16 at 22:56 -0700, Victor Kamensky wrote:
> In the long term it would be beneficial that those issues be
> fixed in SystemTap itself, correct? If so, I can look at creating
> proper patches and pushing them into SystemTap.

Yes, fixing those upstream would be very helpful, probably through
adding the ability to configure the systemd unit path and fixing the
file installation method.

> Also on my todo list is to attempt to push few existing
> OE systemtap patches into SystemTap upstream source. I believe
> they look like quite legit issues and I hope they could be
> upstreamed.

That kind of work is very much appreciated and makes everyone's life
easier in the future!

Cheers,

Richard


