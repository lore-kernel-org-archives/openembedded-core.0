Return-Path: <freesilicon@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 56E8E71B9E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Apr 2017 07:44:46 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id z129so15258072wmb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Apr 2017 00:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=OSD7wOhk4l5F0MGHAK2qsYd9WQkQhWDpmmEQuyhJIGY=;
	b=g1YkyaZ/4EvpAbELOyBxhQo+vegYml1mk6cCcWImHz8o91Kp+Wf68Fh/vkhTRYo+1c
	PGZJlGFaqhV/3DftDXq6gYGcCrrh0nE3Xi2z+pSCwQX0fVvAU7k42VMoIdC9ChaZZs+A
	YDzHGtuwLKQS2o8ICQ3BCn2p7kgRhpIp8A7D4aGQHOwV74GzcgO938hGee+7KS/eYkEH
	Ff89SEYCGNmMvsEzDq0l+LBOuZPfR5Mp1nckLd3csvz/lL1BvYx4oYkx/bOX387GI3Av
	EW4CeC2keaK2CY1h+i7C3lA0Vmnjs39VJGYBB72z0v7hBwrehLA3DGdS5LMFn2QIa4kA
	pL5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=OSD7wOhk4l5F0MGHAK2qsYd9WQkQhWDpmmEQuyhJIGY=;
	b=OAfZ7BpiGEcgzqFCzGPEA7LvA+S1T/bmxGRZ2jOdaxuTJtiauVXRoDAKuddyVEyd0d
	KsegSrP0F/Qq9k/cJtZJiw7QF+zbHAj4RKVXVvT1+mLuZ4zT1fuwJlMbBm7qrj5tPBoc
	MxdHxCzMS0tLjHr37RdYG8VPWNkpzaknH3Ah1UnGrL5vCis3+GyQnM3vjnh2EwY1o20t
	1668Wq1uXvBQw7C/7A5/G9Dl+LQ1vzmihih1MOhiR9EFm2mY+yohRk/zZij72hOQjdjh
	JZTVYMu2TI8zu5gHk0tWap/Vg/iyInSf5hZHDAWd6Pql6JBwmgJf5ex9FCXVy2gkxcw2
	p3ig==
X-Gm-Message-State: AN3rC/5FKIhHmAG+Ot3JMyarboanvCnw3byd9+ktL/diDe5ZB+yQLgtR
	A94GuGvImN4r1g==
X-Received: by 10.28.226.11 with SMTP id z11mr8335098wmg.91.1493019887798;
	Mon, 24 Apr 2017 00:44:47 -0700 (PDT)
Received: from crde-port-20.cahors.local ([185.47.80.46])
	by smtp.gmail.com with ESMTPSA id s81sm664703wms.6.2017.04.24.00.44.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Apr 2017 00:44:47 -0700 (PDT)
From: David Vincent <freesilicon@gmail.com>
To: Andrea Adami <andrea.adami@gmail.com>
Date: Mon, 24 Apr 2017 09:44:45 +0200
Message-ID: <1860443.iW1fikDZVJ@crde-port-20.cahors.local>
In-Reply-To: <CAAQYJAuZtXMhZ4FniXEkLXJK8-ZT6RRs-AYTJXtu6L5jPC_TwQ@mail.gmail.com>
References: <1492771191-4445-1-git-send-email-obi@opendreambox.org>
	<20170421144817.66c189b6@t510.zcs.saftware.de>
	<CAAQYJAuZtXMhZ4FniXEkLXJK8-ZT6RRs-AYTJXtu6L5jPC_TwQ@mail.gmail.com>
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Revert "kernel: Fix symlinks"
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
X-List-Received-Date: Mon, 24 Apr 2017 07:44:47 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"

On samedi 22 avril 2017 00:04:34 CEST Andrea Adami wrote:
> 
> We lived for years with the relative symlink.
> 
> Then  78ee4d8  broke the bootloaders in 2014
> Finally it was reverted end 2016 and now it is under review again...ouch
> 
> What broke what?
> 
> My point is, while I had the sources and could modify and reflash the
> bootloader, the same is not valid for many people.
> 
> Anyway, I have found out that there was a workaround to allow boot from NFS:
> 
> +ROOTFS_POSTPROCESS_COMMAND += "make_zimage_symlink_relative;"

This works at image level, it is not package upgrade safe. IMHO, the symlinks 
must be relative (like every other distro) and therefore should not be 
maintained with update-alternatives (postinstall task should use plain 'ln')

> 
> Cheers
> Andrea

David

