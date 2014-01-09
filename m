Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f176.google.com (mail-lb0-f176.google.com
	[209.85.217.176])
	by mail.openembedded.org (Postfix) with ESMTP id 20DFC6002A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2014 21:45:37 +0000 (UTC)
Received: by mail-lb0-f176.google.com with SMTP id l4so2725410lbv.21
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jan 2014 13:45:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=u1wgt9kX1Ytmofj/+bPylBufQmLpxr5kCtxfkldYi1M=;
	b=poOr+7ZPV5mchymyZ6Fe+dbO8SBTa7Vl8v1v2HxFNGscgwcYAEAuYkWUIPx2e3nSAO
	NDCNYpqRWpuT9KoCaSvVAOW+peA5AXwEoJOOTzNWPG8LS7givfe1E9R15AFI5T1ckrlJ
	zjAD+Lrr/Vrqn0YmEF2LsJoD+riXwuxpa5u9M4h4FmlKKGGam/BFBpGjvoGqWl0EEAWZ
	tSmcAo56a6vB0DTvcq3xXwhWMBn6pxX2h0K04qAm55T0iyu0UEM0vogJvmjH4cr+qVZr
	5y+KZhsB+fNsCGHltw0Nz2uoUugUjTSLSE4ZuKY+54abXi94dC5FxYeNbItKFreX1tM8
	ERug==
MIME-Version: 1.0
X-Received: by 10.112.151.42 with SMTP id un10mr2203232lbb.7.1389303938237;
	Thu, 09 Jan 2014 13:45:38 -0800 (PST)
Received: by 10.112.77.170 with HTTP; Thu, 9 Jan 2014 13:45:38 -0800 (PST)
In-Reply-To: <52CEEE43.1090209@linaro.org>
References: <52CEEE43.1090209@linaro.org>
Date: Thu, 9 Jan 2014 16:45:38 -0500
Message-ID: <CADkTA4M+KG9uXtb91ANThgzMgOAb0WjiVmBvf48UszmSnX62dA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Trevor Woerner <trevor.woerner@linaro.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: unmaintained layers
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
X-List-Received-Date: Thu, 09 Jan 2014 21:45:39 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Jan 9, 2014 at 1:45 PM, Trevor Woerner
<trevor.woerner@linaro.org> wrote:
> Hi everyone,
>
> At the last TSC meeting the topic of unmaintained layers came up. Here
> is the sorted list of master layers from the layer index [1], would it
> be possible for those in the know to indicate which layers are, or are
> suspected of being, unmaintained?

Wouldn't it be easier to do an initial sort based on commit activity ? Versus an
opt-in query ?

>
>
> meta-aarch64
> meta-acer
> meta-ada
> meta-android
> meta-angstrom
> meta-arago-distro
> meta-arago-extras
> meta-asus
> meta-aurora
> meta-baryon
> meta-beagleboard
> meta-beagleboard-extras
> meta-browser
> meta-bug
> meta-buglabs
> meta-chicken
> meta-chiefriver
> meta-clutter
> meta-crownbay
> meta-crystalforest
> meta-cubox
> meta-darwin
> meta-eca
> meta-efikamx
> meta-efl
> meta-eldk
> meta-emenlow
> meta-erlang
> meta-ettus
> meta-filesystems
> meta-fri2
> meta-fsl-arm
> meta-fsl-arm-extra
> meta-fsl-demos
> meta-fsl-ppc
> meta-fso
> meta-games
> meta-geeksphone
> meta-gir
> meta-gnome
> meta-gpe
> meta-gstreamer10
> meta-guacamayo
> meta-gumstix
> meta-gumstix-community
> meta-gumstix-extras
> meta-hamradio
> meta-handheld
> meta-hipos
> meta-htc
> meta-igep
> meta-initramfs
> meta-intel
> meta-ivi
> meta-jasperforest
> meta-java
> meta-kde
> meta-kernel-dev

maintained.

> meta-kirkwood
> meta-linaro
> meta-linaro-toolchain
> meta-lsi
> meta-lxcbench
> meta-measured
> meta-mentor
> meta-micro
> meta-mingw
> meta-minnow
> meta-mono
> meta-multimedia
> meta-n450
> meta-netbookpro
> meta-netmodule
> meta-networking
> meta-nokia
> meta-nslu2
> meta-nuc
> meta-oe
> meta-openmoko
> meta-openpandora
> meta-openstack
> meta-openstack-compute-deploy
> meta-openstack-controller-deploy
> meta-openstack-qemu

All openstack layers are maintained.

> meta-opie
> meta-oracle-java
> meta-osmocombb
> meta-ouya
> meta-palm
> meta-perl
> meta-picosam9
> meta-qt3
> meta-qt5
> meta-raspberrypi
> meta-realtime

mantained

> meta-ro-rootfs
> meta-romley
> meta-ros
> meta-ruby
> meta-samsung
> meta-sdr
> meta-security
> meta-selinux
> meta-shr
> meta-shr-distro
> meta-slugos
> meta-smalltalk
> meta-sourcery
> meta-sugarbay
> meta-sunxi
> meta-sys940x
> meta-systemd
> meta-telephony
> meta-telldus
> meta-ti
> meta-tlk
> meta-tracing
> meta-virtualization

maintained

But I can't say if I didn't miss something I maintain in the list,
since it is long and I scanned
it quickly.

Bruce

> meta-web-kiosk
> meta-webos
> meta-webos-ports
> meta-webserver
> meta-woce
> meta-x10
> meta-xfce
> meta-xilinx
> meta-xilinx-community
> meta-yassl
> meta-yocto
> meta-yocto-bsp
> meta-zynq
> meta-zynq-milo
> openembedded-core
> toolchain-layer
>
>
> Thank you for your input, and best regards,
>     Trevor
>
>
>
>
> [1] http://layers.openembedded.org/layerindex/branch/master/layers/
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

