Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1S8Xjw-0005bN-Pd
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 15:02:44 +0100
Received: by wera1 with SMTP id a1so3972497wer.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Mar 2012 06:53:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=WsIUvtyz5BV8qqxJomqAIqz8C78PvZTr3yHwTibL+es=;
	b=naIVOXHEzhzSPiiND3HM+BAQhSJIJD/R/Ds9hYg8M7M+dCYFcGZmBZ3WBKRbMY98/x
	z5mK3q39pPfzf0KbK+ewvzyqzBegECatXYb8HKnWEpBytskq17Q3KkHU4CcWapDU1LPN
	nnvMQ90vqxZCGlylc25Yw9YBJfieLb4OQZkOZTyTRRyXalfU1hZpwb1yzl28muT5fTYr
	jnvA6bDNN+FiWS7/ECCCjRnKNFw0hTJPczCfbkczxKu0RCTTRrNIOhaXiWeNhP+GSEEF
	uL5gGRLujnjmld9dwQV1yXntgGIWj2HK0tg4mMDadz38pjlmUr72Z2Bn/X9JttklenLy
	17sQ==
Received: by 10.180.94.33 with SMTP id cz1mr6817885wib.13.1331906036497;
	Fri, 16 Mar 2012 06:53:56 -0700 (PDT)
Received: from [10.68.37.3] ([87.111.147.121])
	by mx.google.com with ESMTPS id o2sm22559945wiv.11.2012.03.16.06.53.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 16 Mar 2012 06:53:55 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <3AB6CE7F274E534CAFD089D127A8A1FC23AED2D9@SHSMSX102.ccr.corp.intel.com>
Date: Fri, 16 Mar 2012 14:53:57 +0100
Message-Id: <A4E92037-A984-4CCF-BDCF-E1020891494E@dominion.thruhere.net>
References: <cover.1331859046.git.shane.wang@intel.com>
	<F29B7771-8017-4CB4-AFCF-19CB857CAAD1@dominion.thruhere.net>
	<3AB6CE7F274E534CAFD089D127A8A1FC23AED2D9@SHSMSX102.ccr.corp.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQlMjwCUdMq3Ka+gNEO16Kr9qZEY1zvYJhv0Bt7YsEs0/nQV2pWutpvDsb2GsvAJHHVBlKHe
Subject: Re: [PATCH 00/60] Package Upgrade
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
X-List-Received-Date: Fri, 16 Mar 2012 14:02:44 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

Op 16 mrt. 2012, om 14:45 heeft Wang, Shane het volgende geschreven:

> I built those recipes separately, built core-image-sato on qemux86 and =
qemuarm, and launched the image in the emulator and ran some =
applications.

So no checks for buildhistory changes and upgrade paths.



>=20
> --
> Shane
>=20
> Koen Kooi wrote on 2012-03-16:
>=20
>> Op 16 mrt. 2012, om 01:52 heeft Shane Wang het volgende geschreven:
>>=20
>>> Upgrade recipes for M4. Please review.
>>=20
>> Judging from experience these mass upgrades always have one or two
>> recipes that break horribly, so:
>>=20
>> 1) does the buildhistory output show any unexpected changes?
>> 2) did you test upgrade paths?
>> 3) did you runtime test the upgraded recipes?
>> 4) did you runtime test any dependants of the upgraded recipes?
>>=20
>> Richard/Saul,
>>=20
>> A number of these recipes have bbappends in other layers, so please =
let us
>> know when this is supposed to go into oe-core, so we can minimize the
>> window of breakage.
>>=20
>> regards,
>>=20
>> Koen
>>=20
>>>=20
>>> The following changes since commit
>>> bd2d8904181aa67258b6be8a7bbeaf8d12a8dd5a:
>>>=20
>>> xorg-xserver: Explictly disable dtrace, its not in DEPENDS =
(2012-03-12
>> 17:45:41 +0000)
>>>=20
>>> are available in the git repository at:
>>> git://git.pokylinux.org/poky-contrib shane/m4upgrade
>>> =
http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Dshane/m4upgrade
>>> Dongxiao Xu (1):
>>> dbus-glib: upgrade to 0.98
>>> Shane Wang (59):
>>> distro_tracking: update the recipe info for manual check
>>> glib-2.0: upgrade to 2.30.3
>>> gdk-pixbuf: upgrade to 2.24.1
>>> glproto: update its info in distro tracking
>>> libvorbis: upgrade to 1.3.3
>>> tremor: upgrade to 18221
>>> alsa-lib: upgrade to 1.0.25
>>> alsa-utils: upgrade to 1.0.25
>>> telepathy-glib: upgrade to 0.17.5
>>> telepathy-mission-control: upgrade to 5.11.0
>>> ofono: upgrade to 1.5
>>> bluez4: upgrade to 4.99
>>> bluez-hcidump: upgrade to 2.3
>>> gst-plugin-bluetooth: upgrade to 4.99
>>> gstreamer: upgrade to 0.10.36
>>> gst-plugins-base: upgrade to 0.10.36
>>> gst-plugins-good: upgrade to 0.10.31
>>> gst-plugins-bad: upgrade to 0.10.23
>>> gst-plugins-ugly: upgrade to 0.10.19
>>> libpcap: upgrade to 1.2.1
>>> busybox: upgrade to 1.19.4
>>> curl: upgrade to 7.24.0
>>> dropbear: upgrade to 2012.55
>>> avahi: upgrade to 0.6.31
>>> avahi-ui: upgrade to 0.6.31
>>> apr: upgrade to 1.4.6
>>> minicom: upgrade to 2.6.1
>>> tzdata: upgrade to 2012b
>>> util-macros: upgrade to 1.17
>>> libxcursor: upgrade to 1.1.13
>>> libxinerama: upgrade to 1.1.2
>>> libsm: upgrade to 1.2.1
>>> libxkbfile: upgrade to 1.0.8
>>> libice: upgrade to 1.0.8
>>> pixman: upgrade to 0.25.2
>>> libxdmcp: upgrade to 1.1.1
>>> libXxf86vm: upgrade to 1.1.2
>>> libXrender: upgrade to 0.9.7
>>> libxpm: upgrade to 3.5.10
>>> libXext: upgrade to 1.3.1
>>> libXv: upgrade to 1.0.7
>>> libxt: upgrade to 1.1.2
>>> libXmu: upgrade to 1.1.1
>>> libfontenc: upgrade to 1.1.1
>>> libxscrnsaver: upgrade to 1.2.2
>>> libxau: upgrade to 1.0.7
>>> libdmx: upgrade to 1.1.2
>>> libxft: upgrade to 2.3.0
>>> libxtst: upgrade to 1.2.1
>>> libpciaccess: upgrade to 0.13
>>> libXvMC: upgrade to 1.0.7
>>> libxfont: upgrade to 1.4.5
>>> libxres: upgrade to 1.0.6
>>> inputproto: upgrade to 2.2
>>> font-util: upgrade to 1.3.0
>>> libxcb: upgrade to 1.8.1
>>> libxi: upgrade to 1.4.5
>>=20
>>=20
>>=20
>> _______________________________________________ Openembedded-core
>> mailing list Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



