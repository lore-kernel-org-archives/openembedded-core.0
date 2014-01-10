Return-Path: <andrei@gherzan.ro>
Received: from mail-we0-f178.google.com (mail-we0-f178.google.com
	[74.125.82.178])
	by mail.openembedded.org (Postfix) with ESMTP id 1A1F160CF2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2014 17:27:36 +0000 (UTC)
Received: by mail-we0-f178.google.com with SMTP id t60so4404263wes.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2014 09:27:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=fmKMahvcpjxiKSLP+/4qJPY8zKe093ld0Ps6Z6Mtq8M=;
	b=hQ3HcaWGMzwdgu7MkDaDIOiJ71nmu/tabjtfWNBHcg0Fm/U4v9OZ7pJnrKD8Hn+zxL
	QiZ3ZvCPzAt5ymNMhdJO8PIT5LLoM/5+b2ZqW7gNcPeXl41r4yj0jXRw1XXaRPw175Yg
	Rj7xA1A/tQ8PhEjSS4xGiXLTkr90Sd/CTAZw+NhW6FTlnjePaCwpP+9IsFvrDk+V08oZ
	kRSS7qLtflfRwRJ5mRv0EeWMMhJfMFh4cUBHu/2XnFXY5rLgsaWla/nJ1Up1x7eTK0uK
	TR0/gnoPvaDNbYmlunlHF1q0r1KCOdbloRJlD1kynHCmYYKIoj7BbryJ3Iqa5jT9WnHK
	EXXQ==
X-Gm-Message-State: ALoCoQmkZ6CAcPUmBv5j/MPwg2dUlSWfQwCx0tPuGLszsekkG8yFPc8nJz+Vjf3Sl4z8m1H+LPjl
MIME-Version: 1.0
X-Received: by 10.180.90.230 with SMTP id bz6mr3808787wib.17.1389374857444;
	Fri, 10 Jan 2014 09:27:37 -0800 (PST)
Received: by 10.217.150.199 with HTTP; Fri, 10 Jan 2014 09:27:37 -0800 (PST)
X-Originating-IP: [109.166.135.164]
Received: by 10.217.150.199 with HTTP; Fri, 10 Jan 2014 09:27:37 -0800 (PST)
In-Reply-To: <52CEEE43.1090209@linaro.org>
References: <52CEEE43.1090209@linaro.org>
Date: Fri, 10 Jan 2014 19:27:37 +0200
Message-ID: <CAK18fxGG0F0hCWf0fPfb6xSKVMji=Pa3QzhnfoxqKu4j+t+x+g@mail.gmail.com>
From: Andrei Gherzan <andrei@gherzan.ro>
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
X-List-Received-Date: Fri, 10 Jan 2014 17:27:38 -0000
Content-Type: multipart/alternative; boundary=f46d043be008d6edd604efa10a4f

--f46d043be008d6edd604efa10a4f
Content-Type: text/plain; charset=ISO-8859-1

Hi,

On Jan 9, 2014 8:45 PM, "Trevor Woerner" <trevor.woerner@linaro.org> wrote:
>
> Hi everyone,
>
> At the last TSC meeting the topic of unmaintained layers came up. Here
> is the sorted list of master layers from the layer index [1], would it
> be possible for those in the know to indicate which layers are, or are
> suspected of being, unmaintained?
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

Maintained.

--f46d043be008d6edd604efa10a4f
Content-Type: text/html; charset=ISO-8859-1

<p dir="ltr">Hi, </p>
<p dir="ltr">On Jan 9, 2014 8:45 PM, &quot;Trevor Woerner&quot; &lt;<a href="mailto:trevor.woerner@linaro.org">trevor.woerner@linaro.org</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi everyone,<br>
&gt;<br>
&gt; At the last TSC meeting the topic of unmaintained layers came up. Here<br>
&gt; is the sorted list of master layers from the layer index [1], would it<br>
&gt; be possible for those in the know to indicate which layers are, or are<br>
&gt; suspected of being, unmaintained?<br>
&gt;<br>
&gt;<br>
&gt; meta-aarch64<br>
&gt; meta-acer<br>
&gt; meta-ada<br>
&gt; meta-android<br>
&gt; meta-angstrom<br>
&gt; meta-arago-distro<br>
&gt; meta-arago-extras<br>
&gt; meta-asus<br>
&gt; meta-aurora<br>
&gt; meta-baryon<br>
&gt; meta-beagleboard<br>
&gt; meta-beagleboard-extras<br>
&gt; meta-browser<br>
&gt; meta-bug<br>
&gt; meta-buglabs<br>
&gt; meta-chicken<br>
&gt; meta-chiefriver<br>
&gt; meta-clutter<br>
&gt; meta-crownbay<br>
&gt; meta-crystalforest<br>
&gt; meta-cubox<br>
&gt; meta-darwin<br>
&gt; meta-eca<br>
&gt; meta-efikamx<br>
&gt; meta-efl<br>
&gt; meta-eldk<br>
&gt; meta-emenlow<br>
&gt; meta-erlang<br>
&gt; meta-ettus<br>
&gt; meta-filesystems<br>
&gt; meta-fri2<br>
&gt; meta-fsl-arm<br>
&gt; meta-fsl-arm-extra<br>
&gt; meta-fsl-demos<br>
&gt; meta-fsl-ppc<br>
&gt; meta-fso<br>
&gt; meta-games<br>
&gt; meta-geeksphone<br>
&gt; meta-gir<br>
&gt; meta-gnome<br>
&gt; meta-gpe<br>
&gt; meta-gstreamer10<br>
&gt; meta-guacamayo<br>
&gt; meta-gumstix<br>
&gt; meta-gumstix-community<br>
&gt; meta-gumstix-extras<br>
&gt; meta-hamradio<br>
&gt; meta-handheld<br>
&gt; meta-hipos<br>
&gt; meta-htc<br>
&gt; meta-igep<br>
&gt; meta-initramfs<br>
&gt; meta-intel<br>
&gt; meta-ivi<br>
&gt; meta-jasperforest<br>
&gt; meta-java<br>
&gt; meta-kde<br>
&gt; meta-kernel-dev<br>
&gt; meta-kirkwood<br>
&gt; meta-linaro<br>
&gt; meta-linaro-toolchain<br>
&gt; meta-lsi<br>
&gt; meta-lxcbench<br>
&gt; meta-measured<br>
&gt; meta-mentor<br>
&gt; meta-micro<br>
&gt; meta-mingw<br>
&gt; meta-minnow<br>
&gt; meta-mono<br>
&gt; meta-multimedia<br>
&gt; meta-n450<br>
&gt; meta-netbookpro<br>
&gt; meta-netmodule<br>
&gt; meta-networking<br>
&gt; meta-nokia<br>
&gt; meta-nslu2<br>
&gt; meta-nuc<br>
&gt; meta-oe<br>
&gt; meta-openmoko<br>
&gt; meta-openpandora<br>
&gt; meta-openstack<br>
&gt; meta-openstack-compute-deploy<br>
&gt; meta-openstack-controller-deploy<br>
&gt; meta-openstack-qemu<br>
&gt; meta-opie<br>
&gt; meta-oracle-java<br>
&gt; meta-osmocombb<br>
&gt; meta-ouya<br>
&gt; meta-palm<br>
&gt; meta-perl<br>
&gt; meta-picosam9<br>
&gt; meta-qt3<br>
&gt; meta-qt5<br>
&gt; meta-raspberrypi</p>
<p dir="ltr">Maintained. </p>

--f46d043be008d6edd604efa10a4f--
