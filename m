Return-Path: <andre.draszik@gmail.com>
Received: from mail-lf0-f54.google.com (mail-lf0-f54.google.com
	[209.85.215.54])
	by mail.openembedded.org (Postfix) with ESMTP id B8AF971C54
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Dec 2017 11:18:17 +0000 (UTC)
Received: by mail-lf0-f54.google.com with SMTP id x204so6183976lfa.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Dec 2017 03:18:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=cv1AwMQrjiYTCz9Wd8Z9MUiUFp7IeVnqudF8mtQB3xg=;
	b=KsqX+ppJ2gGXJwVuoEqfs3CZxmHEafkXCk/PV3UeuE76vpWhjwW2zML8xf+K6piuXa
	umgy0YNMx0IEthGrjV+pqcn3mTUwdUhimwPiBdZOv1LNZswjlPkvmTBxMpesTM72AWwc
	VT4fvfKcBJcsLAnSGrSgyHlUCD+DhbDd6PBEPK1c8X4qlzCdYRPyPtYoFzRNMWqcLYVp
	DBskweJdD456pVr647PaujOOaKyiZFT38VOjp+FOodXJLG/dC8AGcd+vh5ewliGJixox
	nNwmBSPveFMEKZit2pSdN/aEvK7Cr7yM6MfoBKWWp3T7sciKNbi/abp3e1gCDnW/qKcC
	Ynug==
X-Gm-Message-State: AKGB3mK2LC6YdiGm2TZOvKB4FpuDOo5jcCU08h/W9J/vDuFfxs/BlUNq
	2U5JCry11j79zhpVB9NAZwwauIv7
X-Google-Smtp-Source: ACJfBovwqwyWMNiHgtECgDm91Nh9pPv4wprRpNin/u2fCpZH0QPN+oTQZYZPFuCCX36/z9GqQIbZHQ==
X-Received: by 10.46.75.1 with SMTP id y1mr3602576lja.141.1513250298007;
	Thu, 14 Dec 2017 03:18:18 -0800 (PST)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id 19sm723723ljx.58.2017.12.14.03.18.16
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 14 Dec 2017 03:18:17 -0800 (PST)
Message-ID: <1513250295.30397.73.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Dec 2017 11:18:15 +0000
In-Reply-To: <1513218231-12626-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
References: <1513218231-12626-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
X-Mailer: Evolution 3.26.2-1 
Mime-Version: 1.0
Subject: Re: [PATCH 0/2] Fix build issues with fitimage
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
X-List-Received-Date: Thu, 14 Dec 2017 11:18:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2017-12-13 at 18:23 -0800, Manjukumar Matha wrote:
> While building fitimage with initramfs bundle using INITRAMFS_IMAGE and
> INITRAMFS_IMAGE_BUNDLE = "1", we have few failures

Nothing against these patches, but what is the use-case to do that? Why
don't you just disable INITRAMFS_IMAGE_BUNDLE?

Cheers,
Andre'


