Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46])
	by mail.openembedded.org (Postfix) with ESMTP id 9466B7C947
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 Mar 2019 17:17:02 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id i12so2981527wrw.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 03 Mar 2019 09:17:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=tGNKjDxIOFaqrOtyqAghCPjISGlI8lUIuMUNVnfAknM=;
	b=NeqqGKi6nTRY4FQqu+gYi1U8d2gJu+b3n3NV0wHYTEdweHKZJpm9r8j1gilFqQe5LE
	JQxREN5PhSMI8a0HIl5MA7HWwDg89l1lcOleQwizlY2kek/Hac0C1SyLmuCrM7noGo47
	DURPuog1lvlD1rk1msSO4xuS2Iltgxp+Uo7pU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=tGNKjDxIOFaqrOtyqAghCPjISGlI8lUIuMUNVnfAknM=;
	b=QLUGSugUvtyh4RM3Ob3TGtMKsVeBRjcI9tCEqURIkD3J0Int9ztO81DRXFmdJdqbjY
	R7THLSKl7MS6kT9s7xZovRex3d+yaGRWOVnq2VvntX0ulO5r1ddqHPa0zxm6nrm9/zcI
	vdZP8msf373Oh3oLi5TLg+lqIdNzNgS92svsf8hVKNHdOQQVu7fEddZ/idrgLH019zyB
	x43O2O1q97+uekFgJoxCIVx6VxGB7VG3P1nlgnaNY6y+PH6I0Hczw82vOwFQX2FkBaBl
	Hh/kUmhvFIOjqTv/OUBS28b05ibkDobOlwcUiB83u0UGs5Icrm4mZ1rH4CA98l72W0j3
	6Svg==
X-Gm-Message-State: APjAAAXmr+yLfxR/ed2Ihn6YG26wXG03NjQ1mA1Vnu+5hW/tFk8IdC/+
	Ew60LpjaOerE1blBbp0QMuWMCQ==
X-Google-Smtp-Source: APXvYqxfdPNlavuTE0zdl2gTupsjm3lpmLacxljx33+g8eMkn3SFZsSymW20sBNXw8LhZj38BrtjyQ==
X-Received: by 2002:a5d:4887:: with SMTP id g7mr10083756wrq.51.1551633423205; 
	Sun, 03 Mar 2019 09:17:03 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	h13sm3320087wrs.42.2019.03.03.09.17.01
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 03 Mar 2019 09:17:02 -0800 (PST)
Message-ID: <c79c6a71ba004e65a4269e9aca743e3efcc3ab60.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Oleksandr Kravchuk
	<open.source@oleksandr-kravchuk.com>
Date: Sun, 03 Mar 2019 17:17:00 +0000
In-Reply-To: <CANNYZj83wehnRQN_MF84Mm7TG8LHKkx1brPKtgjzfgKdQBFWnA@mail.gmail.com>
References: <20190303165242.14424-1-open.source@oleksandr-kravchuk.com>
	<CANNYZj83wehnRQN_MF84Mm7TG8LHKkx1brPKtgjzfgKdQBFWnA@mail.gmail.com>
User-Agent: Evolution 3.31.90-1 
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] qemu-native: add dependency on dtc-native
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
X-List-Received-Date: Sun, 03 Mar 2019 17:17:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2019-03-03 at 18:00 +0100, Alexander Kanavin wrote:
> This has been previously discussed: qemu doesn't properly reconfigure
> itself when settings change. Wipe tmp/ and things should just work.

or just clean qemu-native...

Cheers,

Richard


