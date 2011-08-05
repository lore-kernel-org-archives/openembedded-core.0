Received: from mail-iy0-f171.google.com ([209.85.210.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QpAPv-0003WT-L3
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 04:45:43 +0200
Received: by iyf13 with SMTP id 13so4044245iyf.16
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Aug 2011 19:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:organization:user-agent:in-reply-to
	:references:mime-version:content-transfer-encoding:content-type;
	bh=nfQj0qgdVDL97NjISpyFOnavM1Jf215AH12fRvF9DE0=;
	b=BXZf8g2PF/+9a6fXmlTIuWsVfNKzGP/Pxqqg72CBURfyKfX5aMs629FPiXFqFZF/YA
	LQicv7DGGjudogQVxKHeqcNVyrRH6icOwjHDCDE9KaE15cujfgokuQAVwZCqguMuWjTJ
	bYwo5Azn71dtZkdadNXx3FXYzLJItEcKztyZQ=
Received: by 10.231.119.104 with SMTP id y40mr1191087ibq.172.1312512078832;
	Thu, 04 Aug 2011 19:41:18 -0700 (PDT)
Received: from perseus.localnet (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id es17sm457260ibb.54.2011.08.04.19.41.17
	(version=SSLv3 cipher=OTHER); Thu, 04 Aug 2011 19:41:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 04 Aug 2011 19:41:14 -0700
Message-ID: <2753681.lWo6xksBfj@perseus>
Organization: Sakrah Inc.
User-Agent: KMail/4.7.0  (Linux/3.0.0-7-generic; KDE/4.7.0; i686; ; )
In-Reply-To: <CAD=GYpYWZYYe0d6dqGyHn0+N5p-QM+VAryomfOfo-CtHMFQUdQ@mail.gmail.com>
References: <CAG+hza7G2jZDtHQ5iOK3KCwYRGcZ-YPBfUcyMfJuWnKaxJdSKw@mail.gmail.com>
	<CAD=GYpbOnTOuEsNXiPuoC+cyuyo6MGFh1TqGKf8BB3o=S-YSmA@mail.gmail.com>
	<CAD=GYpYWZYYe0d6dqGyHn0+N5p-QM+VAryomfOfo-CtHMFQUdQ@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: gstreamer-ti, questions
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 05 Aug 2011 02:45:43 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday, August 04, 2011 08:59:23 PM Joel A Fernandes wrote:
> > Here's the compiler log:
> > [..]
> > #
> > # lnkv5T bin/ti_platforms_evm3530/app_remote.xv5T ...
> > /home/joel/angstrom-oe/setup-scripts-core/build/tmp-angstrom_2010_x-egli
> > bc/sysroots/i686-linux/usr/bin/armv7a-angstrom-linux-gnueabi/arm-angstro
> > m-linux-gnueabi-gcc -o bin/ti_platforms_evm3530/app_remote.xv5T
> > package/cfg/bin/ti_platforms_evm3530/app_remote/main_native.ov5T
> > package/cfg/bin/ti_platforms_evm3530/app_remote_xv5T.ov5T
> > package/cfg/bin/ti_platforms_evm3530/app_remote/app.ov5T
> > package/cfg/bin/ti_platforms_evm3530/app_remote_xv5T.xdl
> > -L/home/joel/angstrom-oe/setup-scripts-core/build/tmp-angstrom_2010_x-eg
> > libc/sysroots/i686-linux/usr/bin/armv7a-angstrom-linux-gnueabi/arm-angst
> > rom-linux-gnueabi/lib -lpthread
> 
> Interestingly the path:
> /home/joel/angstrom-oe/setup-scripts-core/build/tmp-angstrom_2010_x-eglibc/s
> ysroots/i686-linux/usr/bin/armv7a-angstrom-linux-gnueabi/arm-angstrom-linux-
> gnueabi/lib
> 
> doesn't exist, which explains the symbol errors.
> 
> libgcc contains the symbol `__aeabi_uidivmod'
> 
> Does this point to another problem with the toolchain?

I doubt that

> How would we fix
> this?

make sure libgcc is linked in. It seems the linker commandline is customized



