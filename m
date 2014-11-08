Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 038FE65C87
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Nov 2014 14:47:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sA8ElJ19022841; Sat, 8 Nov 2014 14:47:19 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id KlL30WYo8tzF; Sat,  8 Nov 2014 14:47:19 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sA8El65E022837
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 8 Nov 2014 14:47:17 GMT
Message-ID: <1415458061.2820.23.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andreas =?ISO-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>
Date: Sat, 08 Nov 2014 14:47:41 +0000
In-Reply-To: <1415346729-16760-3-git-send-email-schnitzeltony@googlemail.com>
References: <1415346729-16760-1-git-send-email-schnitzeltony@googlemail.com>
	<1415346729-16760-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] xserver-xorg: update to 1.16.1
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
X-List-Received-Date: Sat, 08 Nov 2014 14:48:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2014-11-07 at 08:52 +0100, Andreas Müller wrote:
> * first version supporting rootless X (not tested yet)
> * modesetting working for non PCI gpus (tested on gumstix overo)
> 
> Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
> ---
>  .../xorg-xserver/xserver-xorg/crosscompile.patch   | 22 --------
>  .../xserver-xorg/mips64-compiler.patch             | 29 ----------
>  .../xorg-xserver/xserver-xorg/present-module.patch | 66 ----------------------
>  ...erver-xorg_1.15.1.bb => xserver-xorg_1.16.1.bb} |  9 +--
>  4 files changed, 3 insertions(+), 123 deletions(-)
>  delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/crosscompile.patch
>  delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/mips64-compiler.patch
>  delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/present-module.patch
>  rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_1.15.1.bb => xserver-xorg_1.16.1.bb} (75%)

Whilst I haven't 100% confirmed it:

https://autobuilder.yoctoproject.org/main/builders/nightly-x86-64/builds/96
https://autobuilder.yoctoproject.org/main/builders/nightly-qa-logrotate/builds/95
https://autobuilder.yoctoproject.org/main/builders/nightly-qa-skeleton/builds/95
https://autobuilder.yoctoproject.org/main/builders/nightly-qa-systemd/builds/94
https://autobuilder.yoctoproject.org/main/builders/nightly-x32/builds/95

all look like it may well be as a result of this change (which was
included in the master-next build in question). This change will be
delayed merging until we figure out if this patch is responsible and how
to fix whatever the cause is. Obviously any help in doing that is much
appreciated.

Cheers,

Richard


