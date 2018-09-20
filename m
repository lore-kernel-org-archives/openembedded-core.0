Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 9E3B379612
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Sep 2018 17:54:30 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id f6-v6so4702850plo.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Sep 2018 10:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=52SGTIHl+zs3ehfdl7OA5CDlKF2m8zFJLfs4XG5sV04=;
	b=VP02Y1RfzecEJb0EdCK/ef7VDeWxtaFeQb4aFf4k+DBp1JqzJuim2Xj4xUIkkDqFcD
	/jKmcgIkor9o5gniXTmNNDTNBMQMl/S79Xo4Exd95ylp266PCFDn5trG5GHSXKp2nJep
	mTP3nOSHpRSzmy1wy71lTY5aS/K9cVsVlVbYI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=52SGTIHl+zs3ehfdl7OA5CDlKF2m8zFJLfs4XG5sV04=;
	b=DyH57YAWtrZPbk73ZQxZZ50sAO/ayx7Zwc9/0PZslSaKL3QFmJBWWGqInupUwH+ykX
	gjbz6zDFpKpzTG7+i7d8D+08yGStJyEsU0yIUFXhBUm7TfNzvUc9e8O8AOHgaCQKg97e
	Zt5dQqF6jCCOtDR+1uMoB/U8UD8tJW71fzckzLFLX5N2glFfcIfyD9zXy2Vlkg26aFlu
	jR66Sh2iALWLy0cNAf4JOtpTckRVuolU9MIFcwtVZisFwxnC629Agz5IPLeE0WUSHaD5
	0eVTPEeOIeT4ixp34NCoiiJkbxm1gom/BvyrbFDX0vYoS0Q2WrG/n5g9HMErDNh/oa+l
	FG/g==
X-Gm-Message-State: APzg51AnINbg0OUuI/lI7dJ7bGU9aRc9jKSE+EuGA62L+x1D4bdWtfBf
	zYh8oNyQMau100w47ycw4njwwQ==
X-Google-Smtp-Source: ANB0Vdax4kSwPjSpou+Y/BoHdwXIxNBff/sQXMpPOSt2eekjBiFcE1tqhr0YeSGC62QT+2ZOpQVpMA==
X-Received: by 2002:a17:902:b491:: with SMTP id
	y17-v6mr40788754plr.160.1537466071587; 
	Thu, 20 Sep 2018 10:54:31 -0700 (PDT)
Received: from hex ([209.121.128.187]) by smtp.gmail.com with ESMTPSA id
	d9-v6sm50958850pfb.86.2018.09.20.10.54.29
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 20 Sep 2018 10:54:30 -0700 (PDT)
Message-ID: <983d28517b9e9015b590405bbb7f91ffc0d6aa48.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Hongxu Jia <hongxu.jia@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 20 Sep 2018 10:54:29 -0700
In-Reply-To: <f0425061-1d49-84f7-33f3-a3f2b3504c43@windriver.com>
References: <1537358370-3557-1-git-send-email-hongxu.jia@windriver.com>
	<78fad439cd03f6e9be71a0a917667bcf94ebea51.camel@linuxfoundation.org>
	<526c8d02-733b-0345-f68a-52004c62817e@windriver.com>
	<3310e627615370184fd7a1a58997b516ce36f2a7.camel@linuxfoundation.org>
	<f0425061-1d49-84f7-33f3-a3f2b3504c43@windriver.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>,
	Koen Kooi <koen.kooi@linaro.org>
Subject: Re: [PATCH V2 1/2] openssh: upgrade 7.8p1 -> 7.8p1+git to support openssl 1.1.x
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
X-List-Received-Date: Thu, 20 Sep 2018 17:54:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2018-09-21 at 00:25 +0800, Hongxu Jia wrote:
> On 2018年09月20日 12:54, richard.purdie@linuxfoundation.org wrote:
> > On Thu, 2018-09-20 at 09:45 +0800, Hongxu Jia wrote:
> > > I will fix it as my top priority today.
> > > 
> > > Reproduce steps:
> > > 
> > > - Build core-image-sato-sdk on qemuarm64
> > > - Run qemu
> > > - Log over ssh (openssh) failed
> > > 
> > 
> > I did have a little bit of a look at this. It seems to hang during
> > key
> > generation before starting the server during boot.
> > 
> > I had a suspicion that the problem could be a lack of entropy.
> > We're
> > supposed to have the virtio entropy generation being passed through
> > from the host to avoid problems with entropy starvation but I'm not
> > sure its running for arm64.
> > 
> > I noticed the .config shows CONFIG_CRYPTO_DEV_VIRTIO=m but setting
> > that
> > to =y didn't help. The virtio rng connects via pci bus iirc and
> > CONFIG_PCI isn't set so I'm now looking into that...
> > 
> > To update, adding this config to the kernel:
> > 
> > CONFIG_CRYPTO_DEV_VIRTIO=y
> > CONFIG_PCI=y
> > CONFIG_PCI_HOST_GENERIC=y
> 
> Hi RP,
> 
> Without modify config, just revert two commits on kernel source
> could 
> fix the issue
> (sshd start successfully)
> 
> 
> 1. Revert "random: fix crng_ready() test"
> 
> This reverts commit 43838a23a05fbd13e47d750d3dfd77001536dd33
> 
> 
> 2. Revert "random: use a different mixing algorithm for 
> add_device_randomness()"
> 
> This reverts commit dc12baacb95f205948f64dc936a47d89ee110117
> 
> But I am not sure the affect of the modification to other arch, and
> the root
> cause the above two commits introduced
> 
> Still requiring more digging

We do not want to revert those commits. I think the right solution is
to enabled:

CONFIG_CRYPTO_DEV_VIRTIO=y
CONFIG_PCI=y
CONFIG_PCI_HOST_GENERIC=y

in the qemuarm64 machine's kernel defconfig and this will then allow
the host entropy to pass through to the guest. This is how all the
other qemu machines are working, its just not working on qemuarm64 due
to the PCI bus being disabled currently (the device is a PCI virtio
driver).

We therefore need to give Bruce the right changes to the kernel config
fragments to enable the above options. I think the options you
mentioned are automatically enabled if the PCI bus and host generic
options are enabled.

Cheers,

Richard

