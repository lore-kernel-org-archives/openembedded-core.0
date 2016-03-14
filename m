Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f43.google.com (mail-vk0-f43.google.com
	[209.85.213.43])
	by mail.openembedded.org (Postfix) with ESMTP id 3120E6014F;
	Mon, 14 Mar 2016 16:00:26 +0000 (UTC)
Received: by mail-vk0-f43.google.com with SMTP id k1so214381834vkb.0;
	Mon, 14 Mar 2016 09:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=gl8y9ql3GbKeP8G8z69UqhEGYqDvv7Bi/S1UVw6yX5o=;
	b=MW2uMYfk558RI/wHb/3SJyHMZGid1lthU6lZRB/vZ8NB9fBoUi23Hopvtq17Mc0jTB
	eI6oSjMPcnjpwvRLJ+uvgOeCI1RSyJnFhmJhUJimtPDhPbCXDwJ52yDHlxcJFZAtCLTJ
	oTEbpeqBz2KkJ9D8YYNJCCxZcswoRqmj8aU4hFpyfQHxbJCKzqe0rlk3RFUk0UGhc9V9
	wVaAuJM0MTq6xOGAIKCnJXADGOAqjo5nj+VxtHUBAsjYBQ8C7BAXh1PdEAEa+5iQC4mu
	pTaxi6+R18xjX2nfhIZpnr+gyDvPVeGyK0jaAtdiN9CjlsWmPyA1LSZGU31bL4QnGdtA
	31eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=gl8y9ql3GbKeP8G8z69UqhEGYqDvv7Bi/S1UVw6yX5o=;
	b=ZPMbqUy6k5bXnzQHL0Vj0imcro2331HzcMGrpJP5MYR9vFXr1i5EgnL4UQ+vbo3ujd
	VT0yPv3cVhBfw43oEwTswedD0DvHO0ZrypJsS+/VhepNIABCcPjXcr52x9JND5YySw0W
	oycRbqdAdiSI+dchnq+/sv1jLV91SLl9kxloUX9bq05ADy7z6AuDB+hdcMFWSvgHb4eY
	SfSbnpi9CfztQ5aNNRHACGYmfzaoB6JA8DJi8Fi4QZ5wi6XdLCqSV8djpMkTWDm4Nl7S
	rRoprXrD+DvlqWuNCCEsj11GCqrUjd+5BGsBTjOdcTnO2EBelLezSG4/Ts4+wO2KmWMa
	AQXA==
X-Gm-Message-State: AD7BkJII4b30J5W/o4bxijIt5lDD3Xha99pfE5I55vwB8cKVKzKdHCzG8ItWxldMci7QcJ4alss0+bfWAxfpuQ==
MIME-Version: 1.0
X-Received: by 10.31.52.134 with SMTP id b128mr25264542vka.124.1457971226684; 
	Mon, 14 Mar 2016 09:00:26 -0700 (PDT)
Received: by 10.159.55.167 with HTTP; Mon, 14 Mar 2016 09:00:26 -0700 (PDT)
In-Reply-To: <20160314110620.GB2560@jama>
References: <20160314110620.GB2560@jama>
Date: Mon, 14 Mar 2016 17:00:26 +0100
Message-ID: <CALbNGRRDdw=1xwT-KSiA-sLhRBCMYoXE_TbhH7A0AwJyd1YcBg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: State of bitbake world, Failed tasks 2016-03-12
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
X-List-Received-Date: Mon, 14 Mar 2016 16:00:28 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Mar 14, 2016 at 12:06 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> Blacklisting linux-yocto-tiny and linux-yocto-tiny-kexecboot helped
> with random failures in qemux86* builds
>
> == Tested changes (not included in master yet) - bitbake ==
> 0eacf83 world-image: add extra target
>
> == Tested changes (not included in master yet) - openembedded-core ==
> a780836 base.bbclass: Introduce EXTRA_CONF_PACKAGECONFIG variable
> a5bbd85 recipes: Replace "cp -a" with "cp -R --no-dereference --preserve=mode,links"
> 9008d90 sstate-sysroot-cruft.sh: Extend the whitelist
> 1120aa7 qemux86: Add identical qemux86copy variant for tests
> 03118aa report-error: Allow to upload reports automatically
> dd626c4 arch-armv7ve.inc: respect armv7a override as well
> e6ee471 Revert "gstreamer1.0-plugins-XXX: move inherit gettext into common .inc file"
> bdd884f musl: disable building of gobject introspection data
> 20664e4 machine/include/arch-x86: Make x32 ABI not supporting gobject-introspection-data
> d90f3de bitbake.conf: add 'gobject-introspection-data' to DISTRO/MACHINE_FEATURES_BACKFILL
> 74a2009 packagegroup-core-x11-sato: add python-pygobject and gtk+3
> 2c7f859 webkitgtk: enable gobject introspection
> 9852c8a recipes-gnome: fix introspection support
> e2304e5 python-pygobject: update to 3.18.2
> d3936fb gnomebase.bbclass: do not disable gobject introspection
> a4ee4f5 gstreamer: enable gobject introspection
> def43fd libsoup-2.4: enable gobject introspection
> 93df729 clutter: enable gobject introspection
> 643f85a gtk+3: enable gobject-introspection
> 0734f01 gtk+: enable gobject introspection
> a256cc0 avahi: enable gobject-introspection
> d3c113a python-pygtk: remove the recipe
> 7ee6b12 avahi-ui: remove the dependency on python-pygtk by disabling avahi-discover
> e8d093f vala.bbclass: remove pre-packaged vapigen.m4 from tarballs
> 7d96429 vala: enable the use of vapigen by packages with vala support
> 1b5e580 gobject-introspection.bbclass: add a class that enables gobject introspection
> 4c7a3b6 gtk-doc-stub: remove introspection stubs
> d308fc7 gobject-introspection: add the recipe
> 891e17c xcursor-transparent-theme: upgrade to latest git revision
>
> == Tested changes (not included in master yet) - meta-openembedded ==
> 20fc729 luajit: depend on luajit-native to provide host lua
> 9fe6c7b synergy: add dependency on openssl
> 9090641 compat-wireless: Remove
> c6946f4 synergy: add dependency on curl
> 9c465c0 synergy: add dependency on unzip-native
> 09b8556 system-config-keyboard: inherit gettext and add dependency on intltool-native
> 8200885 dfu-util: upgrade to 0.9
> eec2938 dfu-util: fix .patch files
> 4f1cc7a mpv: Media Player
> 656f7a7 postgresql: Security Advisory-postgresql-CVE-2016-0766
> d016d0f python-m2crypto: fix build issue
> c3eec9a gnome-panel: fix gobject introspection
> 19f7ccb network-manager-applet: fix gobject introspection
> 9923037 nautilus: fix gobject introspection
> 560f30f libgtop: fix gobject introspection
> 99b775c libgdata: fix gobject introspection
> 8d71c8b gnome-menus: fix gobject introspection
> 82351e9 python-dbusmock: use real introspection instead on legacy pygobject
> 600612d upower: fix gobject introspection
> c35dca4 udisks2: fix gobject introspection
> 8775ef2 poppler: fix gobject introspection
> 43d3403 omgps: remove the recipe
> 6c58e96 gimp: accept newer versins of babl and gegl
> 6dcb35a gegl: update to 0.3.4
> 939dce3 babl: update to 0.1.16
> 14c4edf libunique: fix gobject introspection support
> 45a3f19 gtkextra: fix gobject introspection support
> c636d68 polkit: fix gobject introspection support
> 9b7ab4f libgee: fix gobject introspection support
> e7f52a9 telepathy-glib: fix gobject introspection support
> 8e95a7b networkmanager: fix introspection and vala support
> 0232ca1 modemmanager: fix vala support
> eb0be9e bluez4: use real introspection instead of legacy pygobject
> 89919ba libmediaart: fix gobject introspection
> 4b6ea5a gstreamer-0.10: disable gobject introspection
> 90c6649 python-gst: remove the 0.10 recipe
> 2c42b1e media-service-demo: remove the recipe
> a8fa606 rygel: fix gobject introspection
> f1c7047 gupnp: fix gobject introspection
> a76eb61 tracker: fix gobject introspection
> 079bb24 goffice: fix gobject introspection
> 1fbbbeb libxklavier: fix gobject introspection
> c6a5df4 libwnck: fix gobject introspection
> cb6d349 libgsf: fix gobject introspection
> 7dd50b3 gnumeric: fix gobject introspection support
> fe0cde2 gnome-desktop: remove pygtk dependency
> d029108 gnome-bluetooth: update to 3.18.2
> 86e7b8b evince: update to 3.18.2
> 2fdc117 evolution-data-server: fix gobject introspection
Looks as if the gobject introspection transition is close to painless
- wow - hope to find time for test...

Andreas

