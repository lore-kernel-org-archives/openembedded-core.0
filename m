Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id DDDF37455D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Sep 2018 03:47:54 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id r196-v6so10910252iod.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Sep 2018 20:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=O4NDQ+lqA2kRZZkNFZREUk1cHjfcEO81VMkCaTd+bRk=;
	b=AKru3Q9DV+Zxfrs+17/vvZE9V9bKBbsSl7ptpWDBSUy8I3UCt3t3V7KbVWPQebF7Ml
	Lo0mrWl9U8DqorLCCasPNYvyZyElFD+e4c2NEAL3cs5r8SkuipQ+wUs7HLeg3T6RAdz9
	50NbPrUgaZc9hut6KTf6t5FvkxzU9ZgxMoTAw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=O4NDQ+lqA2kRZZkNFZREUk1cHjfcEO81VMkCaTd+bRk=;
	b=bmgRL6TBaluOnbVAVe+6NbvsYImmX1kKzQCxrb4yzX6kcebM1HvyvPzV9232cDHMjG
	VU84JQcrbIrjae7t/bU46D9rwCPeYOyL/x/WWht9hdchRzCcgCdlY/JtH57nFQ+wx7nS
	NDIbuBTQ2qYi3ZdD1r3px75O1Qe0Z/D/qd0wPrnQFREmQxWv8YyP8GaKAT/bGvsDDPeL
	kfS3/UoxzNdri+ANg7DZRndk2taAGS/+T/KT87M0EIFL7gEr/OktOuX7TetowcwOHjzS
	9BZOvEbccCEkv1LJpa6LqEWCFjBaOcjwdN/cQ7gmJTdM7PyC3PwMxZtHqDLbtwRmsXit
	+ZCQ==
X-Gm-Message-State: APzg51DA+0u1GKr802GHH80DTvgOTD37h425fmY68qQxqv9Wqcfj2HJN
	8THAu7cJv6hcAKm3kJL6rN0ovw==
X-Google-Smtp-Source: ANB0VdbHmc43fdAe7QFnU5Y8kE9rZFHRbqHAtcoWH03DM06paIZD5RKsEH36Gz7CdOqKAaUjt/gcOQ==
X-Received: by 2002:a6b:1acf:: with SMTP id
	a198-v6mr35767221ioa.286.1537501675838; 
	Thu, 20 Sep 2018 20:47:55 -0700 (PDT)
Received: from hex ([209.82.80.116]) by smtp.gmail.com with ESMTPSA id
	m25-v6sm9670514ioc.9.2018.09.20.20.47.54
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 20 Sep 2018 20:47:54 -0700 (PDT)
Message-ID: <a67901f5659bea6428a41bb3277b2d8e3d4e4110.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Hongxu Jia <hongxu.jia@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 20 Sep 2018 20:47:52 -0700
In-Reply-To: <009c3d50-37ee-f2e7-30f4-f9a083233ded@windriver.com>
References: <1537358370-3557-1-git-send-email-hongxu.jia@windriver.com>
	<78fad439cd03f6e9be71a0a917667bcf94ebea51.camel@linuxfoundation.org>
	<526c8d02-733b-0345-f68a-52004c62817e@windriver.com>
	<3310e627615370184fd7a1a58997b516ce36f2a7.camel@linuxfoundation.org>
	<f0425061-1d49-84f7-33f3-a3f2b3504c43@windriver.com>
	<983d28517b9e9015b590405bbb7f91ffc0d6aa48.camel@linuxfoundation.org>
	<009c3d50-37ee-f2e7-30f4-f9a083233ded@windriver.com>
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
X-List-Received-Date: Fri, 21 Sep 2018 03:47:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2018-09-21 at 09:55 +0800, Hongxu Jia wrote:
> On 2018年09月21日 01:54, richard.purdie@linuxfoundation.org wrote:
> > On Fri, 2018-09-21 at 00:25 +0800, Hongxu Jia wrote:
> > > On 2018年09月20日 12:54, richard.purdie@linuxfoundation.org wrote:
> > > > On Thu, 2018-09-20 at 09:45 +0800, Hongxu Jia wrote:
> > > > > I will fix it as my top priority today.
> > > > > 
> > > > > Reproduce steps:
> > > > > 
> > > > > - Build core-image-sato-sdk on qemuarm64
> > > > > - Run qemu
> > > > > - Log over ssh (openssh) failed
> > > > > 
> > > > 
> > > > I did have a little bit of a look at this. It seems to hang
> > > > during
> > > > key
> > > > generation before starting the server during boot.
> > > > 
> > > > I had a suspicion that the problem could be a lack of entropy.
> > > > We're
> > > > supposed to have the virtio entropy generation being passed
> > > > through
> > > > from the host to avoid problems with entropy starvation but I'm
> > > > not
> > > > sure its running for arm64.
> > > > 
> > > > I noticed the .config shows CONFIG_CRYPTO_DEV_VIRTIO=m but
> > > > setting
> > > > that
> > > > to =y didn't help. The virtio rng connects via pci bus iirc and
> > > > CONFIG_PCI isn't set so I'm now looking into that...
> > > > 
> > > > To update, adding this config to the kernel:
> > > > 
> > > > CONFIG_CRYPTO_DEV_VIRTIO=y
> > > > CONFIG_PCI=y
> > > > CONFIG_PCI_HOST_GENERIC=y
> > > 
> > > Hi RP,
> > > 
> > > Without modify config, just revert two commits on kernel source
> > > could
> > > fix the issue
> > > (sshd start successfully)
> > > 
> > > 
> > > 1. Revert "random: fix crng_ready() test"
> > > 
> > > This reverts commit 43838a23a05fbd13e47d750d3dfd77001536dd33
> > > 
> > > 
> > > 2. Revert "random: use a different mixing algorithm for
> > > add_device_randomness()"
> > > 
> > > This reverts commit dc12baacb95f205948f64dc936a47d89ee110117
> > > 
> > > But I am not sure the affect of the modification to other arch,
> > > and
> > > the root
> > > cause the above two commits introduced
> > > 
> > > Still requiring more digging
> > 
> > We do not want to revert those commits. I think the right solution
> > is
> > to enabled:
> > 
> > CONFIG_CRYPTO_DEV_VIRTIO=y
> > CONFIG_PCI=y
> > CONFIG_PCI_HOST_GENERIC=y
> 
> Hi RP,
> 
> I config kernel as you suggested, but the issue (hung) still existed
> 
> [    4.184330] random: udevd: uninitialized urandom read (16 bytes
> read)
> [    4.191186] random: udevd: uninitialized urandom read (16 bytes
> read)
> [    4.193425] random: udevd: uninitialized urandom read (16 bytes
> read)
> 
> root@qemuarm64:~# zcat /proc/config.gz | grep -e
> "CONFIG_CRYPTO_ENGINE=" 
> -e "CONFIG_PCI=" -e "CONFIG_PCI_HOST_GENERIC="
> CONFIG_PCI=y
> CONFIG_PCI_HOST_GENERIC=y
> CONFIG_CRYPTO_ENGINE=y
> 
> The attach is my kernel config, maybe I miss something in config?

The problem I really want to fix is the hang as openssh-server starts.
Without the defconfig options above, openssh server hangs at key
generation. With the changes I've mentioned applied, key generation
proceeds, the server starts and we can ssh into the machine.

The errors you mention above are worrying/annoying but are separate to
the issue of openssh hanging (they could be related in that they both
involve entropy in the random pool).

Cheers,

Richard

