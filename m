Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SXrMM-0000l8-N8
	for openembedded-core@lists.openembedded.org;
	Fri, 25 May 2012 12:03:02 +0200
Received: by eaal1 with SMTP id l1so221305eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 May 2012 02:52:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=tAxh4gIu8YLegT2NsjgogJbKVk9FUoYrBBzAE8Oo1c8=;
	b=NmUPnaUdmcPpst1D9gLfnfwtfULghLDk+SFyE4dhUMsk6BJIfKck/bFj5rtHtPOR5L
	n7EJBIMJeJwzTtp76ypm3HKvhRHBpx9jNU7ctaiCzYmMGjlIFoZGUDBFkhxUdlbJp53h
	16sqNR2EPt6c6tmKTU/JrhZvW7Klnf9azp70zubhcEqoKbBd5tyYXvnwbUlmLF8mpmjZ
	WsPxYFB34RgoslmiGz7PgkLVsRyKQQmz+eKH1JCGGggioX9jv/PaMSEjfsTO5UkCygzG
	q+oVeaW4yFpsUhFcg0s2E/VS3Tp1xJkvNj0ejodMonctc6G0TStZx4dOZ8DRt4KGat1r
	rrJA==
Received: by 10.14.101.7 with SMTP id a7mr535430eeg.47.1337939570404;
	Fri, 25 May 2012 02:52:50 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id u7sm5293878eeb.7.2012.05.25.02.52.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 25 May 2012 02:52:49 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <cover.1337868781.git.radu.moisan@intel.com>
Date: Fri, 25 May 2012 11:52:46 +0200
Message-Id: <CEE8F75B-A174-4331-A63A-048600549503@dominion.thruhere.net>
References: <cover.1337868781.git.radu.moisan@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQln9/bEXfZuLg5nHpsWbzZ0lGiobwHl5gzsq3e+vi7bHo5E+qYz6gts1F1tjYEOtvQQgvla
Subject: Re: [PATCH 0/3] Package Updates
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
X-List-Received-Date: Fri, 25 May 2012 10:03:02 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 25 mei 2012, om 10:50 heeft Radu Moisan het volgende geschreven:

> This patchset updates dbus, mtd-utils and foomatic-filters.
>=20
> The following changes since commit =
0f795f81fe5ad3ef78c21a177eca90fbc8810f81:
>=20
>  qemu: disable vnc-jpeg compression (2012-05-24 08:53:40 +0100)
>=20
> are available in the git repository at:
>=20
>  git://git.yoctoproject.org/poky-contrib rmoisan/updates
>  =
http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=3Drmoisan/updates=

>=20
> Radu Moisan (3):
>  foomatic-filters: update to version 4.0.15
>  mtd-utils: Update to version 1.5.0
>  dbus: Update to version 1.5.12

First: how was this tested?
Second: =46rom the dbus website:

	The current stable branch is D-Bus 1.4.x. This is the =
recommended version for most purposes.
	The current development branch is D-Bus 1.5.x, which will lead =
to a 1.6.x stable branch in future.

Why are you deleting the stable branch based recipe and add one from the =
development branch?=


