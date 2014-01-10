Return-Path: <fathi.boudra@linaro.org>
Received: from mail-lb0-f178.google.com (mail-lb0-f178.google.com
	[209.85.217.178])
	by mail.openembedded.org (Postfix) with ESMTP id AEE8C601AA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2014 07:03:02 +0000 (UTC)
Received: by mail-lb0-f178.google.com with SMTP id c11so3046314lbj.37
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jan 2014 23:03:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=0CEtM36K3pBOep+zLwWBVPCpG9tsaRx680ZRikdOPX4=;
	b=lHkMgchLV+NA9mgdMNAGykZa0h78ukEbxqkPsRYOL2iMPMmjMl6WX4JzgGiEPDMxmx
	ewJ6ScbFYYOT0/guT/EeY0hXzbkaAfKeRqzL9BzOUtr34L9eQjztM8TwOm7nnDo+fyb7
	X2FgCjPT+xOQ7/dTfjtwP5fMSood01b2kNJ88e5LzNMiiXZS/HKC1OSohgyJSdfd3zoQ
	Xfdu3OKjL2JMM4YUJSFRVZ8GfKYJxnNuRDo0eNwvqeh9WEZrER8YUxrHVeZBOvlWn49c
	p7JPYE9LU2+M4LgV9iEPLniP06LvuvmMvCfzQKPmIItXHPkb/FDYA6PSLY1iGfxG5BhO
	578A==
X-Gm-Message-State: ALoCoQn19kydiW3rqVsAz0ykFOJUFrEZtx6L7G/ijalttdPE3IG99NUDB0Vpq1d65fQ+TsbZavZG
MIME-Version: 1.0
X-Received: by 10.152.120.66 with SMTP id la2mr2982531lab.62.1389337382912;
	Thu, 09 Jan 2014 23:03:02 -0800 (PST)
Received: by 10.112.45.230 with HTTP; Thu, 9 Jan 2014 23:03:02 -0800 (PST)
In-Reply-To: <52CEEE43.1090209@linaro.org>
References: <52CEEE43.1090209@linaro.org>
Date: Fri, 10 Jan 2014 09:03:02 +0200
Message-ID: <CAGNsrLAj4gU-uvT=XOC3-5GyG20wRs7g-bBYrzZP_ZS8rPMupg@mail.gmail.com>
From: Fathi Boudra <fathi.boudra@linaro.org>
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
X-List-Received-Date: Fri, 10 Jan 2014 07:03:04 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 9 January 2014 20:45, Trevor Woerner <trevor.woerner@linaro.org> wrote:
> Hi everyone,
>
> At the last TSC meeting the topic of unmaintained layers came up. Here
> is the sorted list of master layers from the layer index [1], would it
> be possible for those in the know to indicate which layers are, or are
> suspected of being, unmaintained?
>
>
> meta-aarch64

maintained.

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
> meta-kirkwood

> meta-linaro
> meta-linaro-toolchain

both maintained.

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

Cheers,
Fathi

