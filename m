Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 5416E7E79F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jul 2019 16:35:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45f6Cp0LZSz23;
	Wed,  3 Jul 2019 18:35:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1562171718;
	bh=OtPE18A344SL8MqAu3MjkfCXZ6UyNjv+7sv6j8QhnZw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A+fp9+tgz8adxYtIs0nTryZtb0N7lknyv/dsMYAkvRm2j6/G6NeRlCJKIB04BoJM5
	f7pj9jt9yhBTIHI9wfYLs/NTaBSNHCehFTlY4TGGyDtWlcQBKxeCt7zcKN1WQQijzv
	ImXrTs05R+GI+QC+CbLyMgLr0meL4M+J0zFSuARhOsk1A8wRDl8u1qC5MXlWI4mTuu
	ISaCRT2IrwPE/VuceTPpTr9dDUEg4DfFqf6She3Hu8FzYiz1RoV9lFuhuTuUbP1TTe
	kRuRQnQq9oQphVjEvxNpmeNQhNj1dMrBh81ZiCH2sfDnogXNlLO5ZeJFPvAITpzLSM
	9aJv7nf7xfqhK2+HdXukxQwyxOWCwwBdyZlxjYDkOiUMxnMqujAOCBKgnAPDdyAWsz
	OO2hxCnkRkxRh1kUpSlMDLVze2ZC5Gk1F4r1H8lJLGi8LRFPpiQfOiQr8RMsVVcxUj
	d0pdB7hSEVkGLRtiPDI6N8zEq8PmqkE9lIN4rh0+uxChQnGb97Y981SQrRbBLV3cNT
	yFbwWaPvf/QoZ6qq29gxJ9Dbx/w/eV9n9dKEiHdxZdUnHoLcgsev7fb8Nxq/y+jj2Y
	m7rGYmsRM5WP/duRvabW3Jc3gjr1jqG0cTi3QwAimhh7r9XKkMGMpf7Z3qKsnHn+fU
	Irp6F//POTHNe635G/59/vP4=
Date: Wed, 3 Jul 2019 19:35:16 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Message-ID: <20190703163516.GA13618@localhost>
References: <20190702202909.3501-1-open.source@oleksandr-kravchuk.com>
MIME-Version: 1.0
In-Reply-To: <20190702202909.3501-1-open.source@oleksandr-kravchuk.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3] ifupdown: update to 0.8.22
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
X-List-Received-Date: Wed, 03 Jul 2019 16:35:18 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Jul 02, 2019 at 10:29:09PM +0200, Oleksandr Kravchuk wrote:
>...
> ++#if !defined(FNM_EXTMATCH)
> ++#define FNM_EXTMATCH 0
> ++#endif
>...

This fixes the musl build, but the code will misbehave on musl.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


