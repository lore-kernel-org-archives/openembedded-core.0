Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f180.google.com (mail-yk0-f180.google.com
	[209.85.160.180])
	by mail.openembedded.org (Postfix) with ESMTP id D7BFC71790
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Dec 2014 19:19:21 +0000 (UTC)
Received: by mail-yk0-f180.google.com with SMTP id 9so1266728ykp.25
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Dec 2014 11:19:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=QFbZtsKmjpjfebxw9vKv5ubmsTkhB7aRlybeUseaEZw=;
	b=T/n9tm3tEVZDTPfLUXKuusAHXC+jnMWdPKkgW01ZOTBpy5eJStX84iOruiR4xvaoNf
	U6mPCv1V5nBfICfBVT/q6V4a1dhYPip5LQQ/Fa+dlQOk4lxASWZEjcV9BXOlNGFhdoEf
	u+kZ0exL0OSihAlE/C9HXjKanpNBW77C0/SAr+rVAtecIxQ3Ttuvbu7slFoSWnmq3yZw
	M/knu3vUa5F9EIbhOtjcMR1nnSiqKDqXEa7w3P3pxfdmiW28LudvTcg3TiCWyffNv6AJ
	TxuRrVx7XE+B39/IsjEEhsbPRRBQbabg1tTUsaJ54WHHUcvs7ktaTOYgrUXyvc1z/1Hi
	GX2g==
MIME-Version: 1.0
X-Received: by 10.170.130.21 with SMTP id w21mr13408106ykb.22.1419103162308;
	Sat, 20 Dec 2014 11:19:22 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.171.132 with HTTP; Sat, 20 Dec 2014 11:19:22 -0800 (PST)
In-Reply-To: <1419074109.13316.31.camel@linuxfoundation.org>
References: <1418984914.13316.6.camel@linuxfoundation.org>
	<1418992908.13316.14.camel@linuxfoundation.org>
	<54942326.8080806@windriver.com>
	<1418994949.13316.16.camel@linuxfoundation.org>
	<1419074109.13316.31.camel@linuxfoundation.org>
Date: Sat, 20 Dec 2014 17:19:22 -0200
X-Google-Sender-Auth: JvwjxhdTawrf--nKUhNX5fObErY
Message-ID: <CAP9ODKpOb_c1ZhF6B5W9DejgTbLtuMVpqCKDVxb=+8muQxVbuQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Merging problems
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
X-List-Received-Date: Sat, 20 Dec 2014 19:19:25 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Dec 20, 2014 at 9:15 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> So where are we at?
...
> * there are continuing problems with linux-imx from meta-fsl-arm, I
>   thought these were addressed but clearly not :(

I have addressed those:

commit 150b8fe5fb428f9d62b8d5e589ba50bcb64bdb6a (HEAD,
yocto/master-next, pending)
Author: Otavio Salvador <otavio@ossystems.com.br>
Date:   Sat Dec 20 17:11:24 2014 -0200

    fsl-kernel-localversion.bbclass: Fix building using out-of-tree

    Since OE-Core:df9975f4 (kernel: Fix non linux-yocto builds) the way
    the build of kernel is done has change. Now the source code is moved
    placed at STAGING_KERNEL_DIR and the build is done at ${WORKDIR}/build
    which is B.

    This patch adapts the configure task prepending to cope with those changes.

    Change-Id: I9ea4254ffd56e4b7201daf9a90b52756a399c0f6
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>


This is under meta-fsl-arm master-next branch so people give it a go
in AB and let me know about any other issue you have.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

