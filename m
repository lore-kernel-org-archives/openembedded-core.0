Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ie0-f176.google.com (mail-ie0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id DA1C16B4F0
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2014 18:45:24 +0000 (UTC)
Received: by mail-ie0-f176.google.com with SMTP id at1so4019835iec.35
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jan 2014 10:45:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:content-type:content-transfer-encoding;
	bh=mAyKYM2JkYDrqh2NiVudZnJ2eL81P/Iel6m9Gnol1TE=;
	b=IDaNZ3fDPmE5B/3n9XLdi7PLlp8ItdaX4Ejs6y4mV6YxgfUDxiWYYgRdfB641TnKdj
	m5uqqab7ihcYn9EBPaz6rVPra2BLGAr90Z/+FXn6shcX9/B+WbiAtebbxIyu82Ehrm30
	pA/nu+4nBs695YhL3PLWEFdqm8bixTQNqFBliJ/y28RO04JYA/wja3xtoYW6odxdu6HQ
	DV1qJRQuEOuP3AKUM82xtJ1Z1txXbM0N5LybIQXIxlgR/uWQf2i26xJQN7Ae/MZgewTo
	Q7VLBnUbpby+o6Xf8wi+mVeTS9awaPQLbw3xUA9Q26uaNyXwJSJlEsYc7ZO7it0kQRH0
	yGiA==
X-Gm-Message-State: ALoCoQlEOOmJKoFXmcZhr4qeb2jqmaBi+LgCFKKTO+we4PCwDlV1zQGhPWQsRiDhIBwaed+4irWv
X-Received: by 10.50.176.201 with SMTP id ck9mr5063606igc.46.1389293125592;
	Thu, 09 Jan 2014 10:45:25 -0800 (PST)
Received: from [192.168.141.83] (69-165-220-158.dsl.teksavvy.com.
	[69.165.220.158])
	by mx.google.com with ESMTPSA id c10sm15598750igx.4.2014.01.09.10.45.24
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 09 Jan 2014 10:45:24 -0800 (PST)
Message-ID: <52CEEE43.1090209@linaro.org>
Date: Thu, 09 Jan 2014 13:45:23 -0500
From: Trevor Woerner <trevor.woerner@linaro.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: unmaintained layers
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
X-List-Received-Date: Thu, 09 Jan 2014 18:45:26 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi everyone,

At the last TSC meeting the topic of unmaintained layers came up. Here
is the sorted list of master layers from the layer index [1], would it
be possible for those in the know to indicate which layers are, or are
suspected of being, unmaintained?


meta-aarch64
meta-acer
meta-ada
meta-android
meta-angstrom
meta-arago-distro
meta-arago-extras
meta-asus
meta-aurora
meta-baryon
meta-beagleboard
meta-beagleboard-extras
meta-browser
meta-bug
meta-buglabs
meta-chicken
meta-chiefriver
meta-clutter
meta-crownbay
meta-crystalforest
meta-cubox
meta-darwin
meta-eca
meta-efikamx
meta-efl
meta-eldk
meta-emenlow
meta-erlang
meta-ettus
meta-filesystems
meta-fri2
meta-fsl-arm
meta-fsl-arm-extra
meta-fsl-demos
meta-fsl-ppc
meta-fso
meta-games
meta-geeksphone
meta-gir
meta-gnome
meta-gpe
meta-gstreamer10
meta-guacamayo
meta-gumstix
meta-gumstix-community
meta-gumstix-extras
meta-hamradio
meta-handheld
meta-hipos
meta-htc
meta-igep
meta-initramfs
meta-intel
meta-ivi
meta-jasperforest
meta-java
meta-kde
meta-kernel-dev
meta-kirkwood
meta-linaro
meta-linaro-toolchain
meta-lsi
meta-lxcbench
meta-measured
meta-mentor
meta-micro
meta-mingw
meta-minnow
meta-mono
meta-multimedia
meta-n450
meta-netbookpro
meta-netmodule
meta-networking
meta-nokia
meta-nslu2
meta-nuc
meta-oe
meta-openmoko
meta-openpandora
meta-openstack
meta-openstack-compute-deploy
meta-openstack-controller-deploy
meta-openstack-qemu
meta-opie
meta-oracle-java
meta-osmocombb
meta-ouya
meta-palm
meta-perl
meta-picosam9
meta-qt3
meta-qt5
meta-raspberrypi
meta-realtime
meta-ro-rootfs
meta-romley
meta-ros
meta-ruby
meta-samsung
meta-sdr
meta-security
meta-selinux
meta-shr
meta-shr-distro
meta-slugos
meta-smalltalk
meta-sourcery
meta-sugarbay
meta-sunxi
meta-sys940x
meta-systemd
meta-telephony
meta-telldus
meta-ti
meta-tlk
meta-tracing
meta-virtualization
meta-web-kiosk
meta-webos
meta-webos-ports
meta-webserver
meta-woce
meta-x10
meta-xfce
meta-xilinx
meta-xilinx-community
meta-yassl
meta-yocto
meta-yocto-bsp
meta-zynq
meta-zynq-milo
openembedded-core
toolchain-layer


Thank you for your input, and best regards,
    Trevor




[1] http://layers.openembedded.org/layerindex/branch/master/layers/

