Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1S8XbM-00054s-V8
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 14:53:53 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 16 Mar 2012 06:45:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="119783527"
Received: from azsmsx601.amr.corp.intel.com ([10.2.121.193])
	by azsmga001.ch.intel.com with ESMTP; 16 Mar 2012 06:45:04 -0700
Received: from azsmsx602.amr.corp.intel.com (10.2.121.201) by
	azsmsx601.amr.corp.intel.com (10.2.121.193) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Fri, 16 Mar 2012 06:45:03 -0700
Received: from shsmsx101.ccr.corp.intel.com (10.239.4.153) by
	azsmsx602.amr.corp.intel.com (10.2.121.201) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Fri, 16 Mar 2012 06:45:02 -0700
Received: from shsmsx102.ccr.corp.intel.com ([169.254.2.36]) by
	SHSMSX101.ccr.corp.intel.com ([169.254.1.142]) with mapi id
	14.01.0355.002; Fri, 16 Mar 2012 21:45:01 +0800
From: "Wang, Shane" <shane.wang@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 00/60] Package Upgrade
Thread-Index: AQHNA3CsQ8+z3aukyk6hGMA3aSAeMJZs7lOA
Date: Fri, 16 Mar 2012 13:45:01 +0000
Message-ID: <3AB6CE7F274E534CAFD089D127A8A1FC23AED2D9@SHSMSX102.ccr.corp.intel.com>
References: <cover.1331859046.git.shane.wang@intel.com>
	<F29B7771-8017-4CB4-AFCF-19CB857CAAD1@dominion.thruhere.net>
In-Reply-To: <F29B7771-8017-4CB4-AFCF-19CB857CAAD1@dominion.thruhere.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
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
X-List-Received-Date: Fri, 16 Mar 2012 13:53:53 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I built those recipes separately, built core-image-sato on qemux86 and qemu=
arm, and launched the image in the emulator and ran some applications.

--
Shane

Koen Kooi wrote on=A02012-03-16:

> Op 16 mrt. 2012, om 01:52 heeft Shane Wang het volgende geschreven:
>=20
>> Upgrade recipes for M4. Please review.
>=20
> Judging from experience these mass upgrades always have one or two
> recipes that break horribly, so:
>=20
> 1) does the buildhistory output show any unexpected changes?
> 2) did you test upgrade paths?
> 3) did you runtime test the upgraded recipes?
> 4) did you runtime test any dependants of the upgraded recipes?
>=20
> Richard/Saul,
>=20
> A number of these recipes have bbappends in other layers, so please let u=
s
> know when this is supposed to go into oe-core, so we can minimize the
> window of breakage.
>=20
> regards,
>=20
> Koen
>=20
>>=20
>> The following changes since commit
>> bd2d8904181aa67258b6be8a7bbeaf8d12a8dd5a:
>>=20
>>  xorg-xserver: Explictly disable dtrace, its not in DEPENDS (2012-03-12
> 17:45:41 +0000)
>>=20
>> are available in the git repository at:
>>  git://git.pokylinux.org/poky-contrib shane/m4upgrade
>>  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Dshane/m4upgrade
>> Dongxiao Xu (1):
>>  dbus-glib: upgrade to 0.98
>> Shane Wang (59):
>>  distro_tracking: update the recipe info for manual check
>>  glib-2.0: upgrade to 2.30.3
>>  gdk-pixbuf: upgrade to 2.24.1
>>  glproto: update its info in distro tracking
>>  libvorbis: upgrade to 1.3.3
>>  tremor: upgrade to 18221
>>  alsa-lib: upgrade to 1.0.25
>>  alsa-utils: upgrade to 1.0.25
>>  telepathy-glib: upgrade to 0.17.5
>>  telepathy-mission-control: upgrade to 5.11.0
>>  ofono: upgrade to 1.5
>>  bluez4: upgrade to 4.99
>>  bluez-hcidump: upgrade to 2.3
>>  gst-plugin-bluetooth: upgrade to 4.99
>>  gstreamer: upgrade to 0.10.36
>>  gst-plugins-base: upgrade to 0.10.36
>>  gst-plugins-good: upgrade to 0.10.31
>>  gst-plugins-bad: upgrade to 0.10.23
>>  gst-plugins-ugly: upgrade to 0.10.19
>>  libpcap: upgrade to 1.2.1
>>  busybox: upgrade to 1.19.4
>>  curl: upgrade to 7.24.0
>>  dropbear: upgrade to 2012.55
>>  avahi: upgrade to 0.6.31
>>  avahi-ui: upgrade to 0.6.31
>>  apr: upgrade to 1.4.6
>>  minicom: upgrade to 2.6.1
>>  tzdata: upgrade to 2012b
>>  util-macros: upgrade to 1.17
>>  libxcursor: upgrade to 1.1.13
>>  libxinerama: upgrade to 1.1.2
>>  libsm: upgrade to 1.2.1
>>  libxkbfile: upgrade to 1.0.8
>>  libice: upgrade to 1.0.8
>>  pixman: upgrade to 0.25.2
>>  libxdmcp: upgrade to 1.1.1
>>  libXxf86vm: upgrade to 1.1.2
>>  libXrender: upgrade to 0.9.7
>>  libxpm: upgrade to 3.5.10
>>  libXext: upgrade to 1.3.1
>>  libXv: upgrade to 1.0.7
>>  libxt: upgrade to 1.1.2
>>  libXmu: upgrade to 1.1.1
>>  libfontenc: upgrade to 1.1.1
>>  libxscrnsaver: upgrade to 1.2.2
>>  libxau: upgrade to 1.0.7
>>  libdmx: upgrade to 1.1.2
>>  libxft: upgrade to 2.3.0
>>  libxtst: upgrade to 1.2.1
>>  libpciaccess: upgrade to 0.13
>>  libXvMC: upgrade to 1.0.7
>>  libxfont: upgrade to 1.4.5
>>  libxres: upgrade to 1.0.6
>>  inputproto: upgrade to 2.2
>>  font-util: upgrade to 1.3.0
>>  libxcb: upgrade to 1.8.1
>>  libxi: upgrade to 1.4.5
>=20
>=20
>=20
> _______________________________________________ Openembedded-core
> mailing list Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



