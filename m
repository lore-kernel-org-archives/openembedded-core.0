Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 405077ED1B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2019 09:08:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45pWdV5L73z7G;
	Wed, 17 Jul 2019 11:08:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1563354495;
	bh=XnhfcbmbnXHiYR7PAfppzDTUenisgSkuuR6p2SEAlrU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NbOG55SjxsFTzEKi0vZt9n1zFaA4hWDcNMBIZglxsdn+fmNn7m0KJ2T9xG+QLiEqX
	96J0M2OtUYLJFdhnJZvtzyprgwkYRu94ubQ72Z0pHsRB1IFRDzqJUQjnOhwSY6PK95
	cbSpJTtPPqFSSItTW79hQFr6uq3Zfm4gHSCVMYo7oCtX36xHGozBWs1w0z5WsiJL8w
	mlfKh58X8VlINGkq5pfxsbCcjtqggZLo4CEOayE3GcJVkusQvqEmS5eoWTg3q+9mHP
	p1dRccom04HcO4JsCav/fARS3YsK6w+uIeJNCgR/h2RC0kZiVgL19j5xKhZjCAdBdo
	X0FmJ9VEMaczQTsnEXaX794WKGIJYwOE5HsnIBD+BgHDkts51MSyZDLpWy84YFydD/
	TnfJaAASdtG4vTIo1P7UQPDWlTLYpZREgFnfSdwSY7EH2EN1waIZFaY5NAfpQzq7qn
	OFN6no273crwro3ot9Ru4bw18sqHgfIEQAuOMM3cvA9BdtqEyZsduAyxXWXfoA0y0b
	JrRjCc3oQ/HGXeE3MZRV2ggESuaMJgODj40h4CMazGtwAybiV/u7aXe3t7Or7CM/YO
	Lm5x1FTAcggXoHbkB0/gRseR1t9dHpdTQncw4RhgpwVW6r1mr6V6A5VcNwjET5uob8
	UF1mC52h3KiHnKjfLEhQEQ/8=
Date: Wed, 17 Jul 2019 12:08:12 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Ulrich =?utf-8?Q?=C3=96lmann?= <u.oelmann@pengutronix.de>
Message-ID: <20190717090812.GA18597@localhost>
References: <20190716135444.12057-1-u.oelmann@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20190716135444.12057-1-u.oelmann@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: =?utf-8?B?U8O4cmVu?= Andersen <san@skov.dk>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] squashfs-tools: upgrade to commit f95864afe883
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
X-List-Received-Date: Wed, 17 Jul 2019 09:08:15 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, Jul 16, 2019 at 03:54:44PM +0200, Ulrich Ölmann wrote:
>...
> Commits [5] & [6] introduced interesting features, namely zstd support and
> reproducibility of created SquashFS images. They are reflected in two new
> PACKAGECONFIG options now.
>...
> -PACKAGECONFIG ??= "gzip xz lzo lz4 lzma xattr"
> +PACKAGECONFIG ??= "gzip xz lzo lz4 lzma xattr zstd reproducible"
>...

zstd is not in OE-core, so this cannot be enabled by default.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


