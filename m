Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0E0117F02F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 15:55:18 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id k1so621528wmi.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 08:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=VUPCypwMU8k3sOe1O2fo8akbDl8EqcXdBFQFlW9T9aQ=;
	b=aDZJYSroub50cxrXMopzd1qEjNyFJtI+mgRnlcBY8Qyakevv6WlZP9WuGH11zfh5La
	N/8LAnzmnBJC+KtOHsHrnDYRmIe/a8IZc490WA1vzG6v9A7aY9rRv3AagfIPAwf2Bl5q
	lmZpIqHrRt1Gw2mvDkMPJ2lMrYdRY6DpqhogU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=VUPCypwMU8k3sOe1O2fo8akbDl8EqcXdBFQFlW9T9aQ=;
	b=mN7M3rl+5s7VqOV3WtvuiGofyL8oNwQ68HylaJCSR9haiRmXgBH79oyJrxRkSdYOKP
	3ig14iRA2IyO9pFdUJFFTA/PD+vVHJSjf+WZ6WsydUZRQzMX3T0DPnTkRtpsdJgMCXnh
	DSj5Ph3BiCLLjV6BhOMaKm1HgAEB+awAZOye3YtNaZ5gJf1OzwuIbI/q634DS3wFJuxm
	FW0Xm2C8Mw28zMlQjSHFtRLzDeXPxM/xFMjgiwewF5E7rwdLgO4x/5MiptOM09+eBE6u
	QFQFLKI7EM3iAVqm2wA+pTKHYgCIX2dFpo1+s2zdZdtIdlsohkJ+woEBLrXM7Kp1h5Ss
	IfLQ==
X-Gm-Message-State: APjAAAWMZsFxG/tBwO8vtD5NoKGseV1iw3ht81cKAfPnpkhN0Akte8EC
	qWi/+K9bw7Sq1QhSdSEczO/gfA==
X-Google-Smtp-Source: APXvYqxmi249wFF79oAQd74l/w0yn6MukFjJc2DQVlhYU1xmyjMk//nbKXKthXp97BokDLdSDMnYzA==
X-Received: by 2002:a1c:eb13:: with SMTP id j19mr4311341wmh.18.1567007719519; 
	Wed, 28 Aug 2019 08:55:19 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id n8sm6069634wma.7.2019.08.28.08.55.18
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 28 Aug 2019 08:55:18 -0700 (PDT)
Message-ID: <2e5401e08e3f6ce180b02419fe717f5016838b23.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Kang Kai <Kai.Kang@windriver.com>, Hongxu Jia
	<hongxu.jia@windriver.com>, openembedded-core@lists.openembedded.org, 
	armccurdy@gmail.com,  alex.kanavin@gmail.com
Date: Wed, 28 Aug 2019 16:55:17 +0100
In-Reply-To: <84d55359-1e84-688f-553b-0d0cdc175e35@windriver.com>
References: <CAJ86T=WtuV46YbMMcGigKRrsvTNTtgWWdNLDp2P27-Zx6Rn+Yw@mail.gmail.com>
	<1566279918-9733-1-git-send-email-hongxu.jia@windriver.com>
	<7210fb6d-563e-497c-a25b-bc53ffe15954@windriver.com>
	<dbf4f8583c8616bdc437c37cc68a0f76e98d608f.camel@linuxfoundation.org>
	<84d55359-1e84-688f-553b-0d0cdc175e35@windriver.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH V3] nfs-utils: decrease RLIMIT_NOFILE to 4k for systemd
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
X-List-Received-Date: Wed, 28 Aug 2019 15:55:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2019-08-28 at 09:29 +0800, Kang Kai wrote:
> On 2019/8/28 上午7:29, richard.purdie@linuxfoundation.org wrote:
> > On Tue, 2019-08-27 at 17:43 +0800, Kang Kai wrote:
> > > Hi Richard,
> > > 
> > > This patch could fix the test_image failure with systemd. Would
> > > like
> > > to
> > > try systemd as default init manager on yocto build again
> > > to check whether any more blocking issues?
> > 
> > There is at least one issue:
> > 
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/67/builds/967
> > 
> > Please monitor this build which should show up any other issues:
> 
> Got it. Thanks.
> 
> 
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/85/builds/645
> > 
> > (master-next was looking green other than this change).
> 
> It fails with libedit-native do fetch errors. I'll check it but it
> seems not systemd related at first sight.

Agreed, that is a different issue. For the systemd vs sysvinit we have:

qemux86-lsb parselogs failure:
https://autobuilder.yoctoproject.org/typhoon/#/builders/67/builds/967

qemuarm-lsb parselogs failure:
https://autobuilder.yoctoproject.org/typhoon/#/builders/38/builds/970

qemumips runtime systemd test failure:
https://autobuilder.yoctoproject.org/typhoon/#/builders/60/builds/962

qemumips64 runtime systemd test failure:
https://autobuilder.yoctoproject.org/typhoon/#/builders/74/builds/967

oe-selftest failures:
https://autobuilder.yoctoproject.org/typhoon/#/builders/56/builds/658
2019-08-28 00:55:15,114 - oe-selftest - INFO - RESULTS -
runqemu.RunqemuTests.test_boot_machine_slirp_qcow2: ERROR (1025.19s)
2019-08-28 00:55:15,114 - oe-selftest - INFO - RESULTS -
runqemu.RunqemuTests.test_boot_recipe_image_vdi: ERROR (1010.73s)
2019-08-28 00:55:15,114 - oe-selftest - INFO - RESULTS -
runqemu.RunqemuTests.test_boot_recipe_image_vmdk: ERROR (1028.30s)
2019-08-28 00:55:15,114 - oe-selftest - INFO - RESULTS -
wic.Wic.test_iso_image: FAILED (63.97s)

and it looks like those runqemu failures happen on
qemux86-64:
https://autobuilder.yoctoproject.org/typhoon/#/builders/73/builds/969
qemumips:
https://autobuilder.yoctoproject.org/typhoon/#/builders/60/builds/962
qemux86:
https://autobuilder.yoctoproject.org/typhoon/#/builders/59/builds/961
qemuppc:
https://autobuilder.yoctoproject.org/typhoon/#/builders/63/builds/961
qemumips64:
https://autobuilder.yoctoproject.org/typhoon/#/builders/74/builds/967
qemuarm:
https://autobuilder.yoctoproject.org/typhoon/#/builders/53/builds/969

so it looks like 3-4 different issues.

Cheers,

Richard


