Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id B1AF3607A5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jul 2016 17:42:15 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id n132so15786413qka.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jul 2016 10:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=CY9TzhQvlZ3wz7g/MyeC1+gQFvIJvUAJGDoJH4X2+FE=;
	b=HXjFQJhBAj/FilpQGBaizrtr8rE/HA2ss9nze/hnJzjeFKLWe/nIxf6YPomR6gcaHC
	aLjE+IiyuGtlvw4Aq9i3HzwpV0WK1BtYBTw5zZtSmN8M7tKVpUKaQKApVU5wefED4zxD
	BudRybsrqnDdlettifHsM+KFmJZBaL536h4B+XIRnItZ7XoGr93UJhU/Rh90ZtCV1UNi
	j9AHhr2h5rikJbs+opZyoU0HvRBU2vscFx/ndI57NIS1Ad9nSF35BrqB34I01VShpDoI
	6CXtRYj0lW84dw2WzP09KsXzFf12gPbUKf7Zf7yMSoR2o912UysK2dgGc1/nGjknocl7
	CqEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=CY9TzhQvlZ3wz7g/MyeC1+gQFvIJvUAJGDoJH4X2+FE=;
	b=Iqsx01vzWojE8BcWG+Z3NNDLEbaSqAoFnUFD52Sb4Xh0nPlP7SE+u6Z8ntD6xjqBDB
	WcDHxUBAMa8ufSAXkgDQgCH/kVXgl4B62k1kwpwwLJr6JYoAR3r8zyt7rpd/AC0e5LTh
	rY83QZCwWOGdfz5fGoT7MrVf52Rs3iROmq2ejTtbjL/Hk7kwZu5PFedJEt92nkEWmmqP
	eKFcz04y8HcJNrwfPSKN2qMJRjk55La5o8LgsZ0e6LbpTwqhhiGW/lBqUHdu8B5uaBcT
	eZyLWuv6k1uwDC7hFioi7VO31ifMfLGD3t1Q597d4HjhGVhmsyj43F2sTsL9cWubgGFM
	pi+g==
X-Gm-Message-State: ALyK8tK1bnCJzqGobg7oD2Kv/aG3SzQ0aa8JR3LNbrWHT+RVsbjZ/cOdpV5wP0gnCGgRlp8iTwwUUYI4eat6fw==
X-Received: by 10.55.97.18 with SMTP id v18mr26000441qkb.102.1468258936124;
	Mon, 11 Jul 2016 10:42:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.214.83 with HTTP; Mon, 11 Jul 2016 10:41:46 -0700 (PDT)
In-Reply-To: <CAP9ODKpQJ8aJ3ZcOoxWSUn6V+L7RtXDF_rreVmB=P42_K5N-Fw@mail.gmail.com>
References: <CAP9ODKpQJ8aJ3ZcOoxWSUn6V+L7RtXDF_rreVmB=P42_K5N-Fw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 11 Jul 2016 10:41:46 -0700
Message-ID: <CAMKF1sqi=9-2E9u9M4iuh5JUs+4Dr7cx80uCR8do78DSXnRoUw@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [for-krogoth] musl backport
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
X-List-Received-Date: Mon, 11 Jul 2016 17:42:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 11, 2016 at 10:39 AM, Otavio Salvador
<otavio.salvador@ossystems.com.br> wrote:
> Hello Khem and OE-Core fellows,
>
> I would like to propose the backport of following changes:
>
> commit a572a1181411668a9bd4c264f5124d13f3d7cead (HEAD -> for-krogoth)
> Author: Khem Raj <raj.khem@gmail.com>
> Date:   Thu Jun 23 15:23:19 2016 -0700
>
>     musl: Upgrade to tip
>
>     Rich Felker (4):
>           fix undefined pointer arithmetic in CMSG_NXTHDR macro
>           fix a64l undefined behavior on ILP32 archs, wrong results on
> LP64 archs
>           avoid padding gaps in struct sockaddr_storage
>           remove comments on copyright status from UTF-8 implementation f=
iles
>
>     Szabolcs Nagy (8):
>           fix the use of uninitialized value in regcomp
>           add preadv2 and pwritev2 syscall numbers for linux v4.6
>           add SO_CNX_ADVICE to sys/socket.h, new in linux v4.6
>           add ETH_P_MACSEC netinet/if_ether.h, new in linux v4.6
>           update siginfo struct for linux v4.6
>           add CLONE_NEWCGROUP clone flag, new in linux v4.6
>           add new tcp_info fields from linux v4.6
>           update sys/socket.h to linux v4.6
>
>     Signed-off-by: Khem Raj <raj.khem@gmail.com>
>     Signed-off-by: Ross Burton <ross.burton@intel.com>
>     (cherry picked from commit d81bb8c6362d59a124bbe9b3a60cb259733b120d)
>
> commit a8e05129847ac01bddb01dcd8f1592fcacf0c908
> Author: Khem Raj <raj.khem@gmail.com>
> Date:   Fri May 20 07:03:30 2016 -0700
>
>     musl: Update to latest tip
>
>     Bobby Bingham (3):
>           x32: remove arch-specific syscall remapping
>           x32: eliminate __X32_SYSCALL_BIT constant
>           deduplicate __NR_* and SYS_* syscall number definitions
>
>     Signed-off-by: Khem Raj <raj.khem@gmail.com>
>     Signed-off-by: Ross Burton <ross.burton@intel.com>
>     (cherry picked from commit 6993e88cccbfe2f990e4ea9bd7cc186d59e5a84b)
>
> commit d782ecec07bd270f1a9c7a440460cf4dd0cb1616
> Author: Khem Raj <raj.khem@gmail.com>
> Date:   Wed May 11 10:35:30 2016 -0700
>
>     musl: Upgrade to tip of tree
>
>     COPYRIGHT file was changed to clarfiy the MIT Licence
>     which resulted in checksum change, see
>
>     http://git.musl-libc.org/cgit/musl/commit/?id=3Df0a61399330bae42beeb2=
7d6ecd05570b3382a60
>
>     below are changes in upgrade
>
>     Andrew Kelley (1):
>           fix incorrect protocol name and number for egp
>
>     Bobby Bingham (1):
>           add powerpc64 port
>
>     LeMay, Michael (1):
>           fix redundant processing of --build flag in configure script
>
>     Petr Van=C4=9Bk (1):
>           remove dead store in res_msend
>
>     Rich Felker (10):
>           fix undefined pointer comparison in stdio-internal __toread
>           fix regression disabling use of pause instruction for x86 a_spi=
n
>           fix read past end of haystack buffer for short needles in memme=
m
>           add support for mips and mips64 r6 isa
>           add mips n32 port (ILP32 ABI for mips64)
>           fix thread structure/dtv-pointer corruption on powerpc
>           fix FILE buffer underflow in ungetwc
>           update COPYRIGHT file to clarify that permissions apply for all=
 files
>           follow standard configure behavior for cross compile prefix
>           fix spurious trailing whitespace in powerpc & powerpc64 bits/er=
rno.h
>
>     Signed-off-by: Khem Raj <raj.khem@gmail.com>
>     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>     (cherry picked from commit 21d8d60b2bfb205dcb5d304119d4dbd627db7163)
>
> We have been using those backports locally with success and it fixes a
> number of important things for our application, as musl is ABI
> compatible I think those backports would be good for stable. What do
> you think?

These changes are safe for krogoth. Go ahead and send a pull request for kr=
ogoth

