Return-Path: <akuster@mvista.com>
Received: from mail-pb0-f52.google.com (mail-pb0-f52.google.com
	[209.85.160.52])
	by mail.openembedded.org (Postfix) with ESMTP id 91EF56FC3D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jun 2014 21:10:12 +0000 (UTC)
Received: by mail-pb0-f52.google.com with SMTP id rr13so1414883pbb.39
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jun 2014 14:10:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:message-id:subject:reply-to:to:cc:date
	:in-reply-to:references:organization:content-type:mime-version
	:content-transfer-encoding;
	bh=rF6XUcDHGDaGOhnV0aVQmpXHwxqCV9DWEhvRHDglNUo=;
	b=DuIn1naLpSY/w6rbDZBRmgUjHS61PUrlJjppDczCZaHdhh2BZQhtfxAB2kO1axb2QN
	VBLP/31FBav1HZtc9OUKEGVe7WRH1uKwmorYstYejrsw4RCoHcAxkcfEyoJLX2bq/aCT
	IsG3vdmCPSFqaJaCmppUkHZG4Dyzbyvg6Z95UrwYpXf8EkaQNR+JezqX94h2gtwckd+w
	RNRAyOi6N24imIQYX1o79+gf64CQrp82iHP0+ojDqfvZq3XR3WsXFifa3wzI0Q3EBP1F
	yLJcYWTMYpkxZkPhI8HXphkoOLJEh+SxIfMad5vRuwVlhH+MjqLAU+ViO0zmKmpzEfcQ
	x6bA==
X-Gm-Message-State: ALoCoQl7DiVCZu2Li6QQvu3GyVYLsYjCL5Dzw17Zuk/21U/pVt5fbUWbLwxRbAy9Pd0NzdNhNm1K
X-Received: by 10.68.164.100 with SMTP id yp4mr15269918pbb.136.1402607412951; 
	Thu, 12 Jun 2014 14:10:12 -0700 (PDT)
Received: from [10.7.100.231] (64.2.3.195.ptr.us.xo.net. [64.2.3.195])
	by mx.google.com with ESMTPSA id
	qw8sm82076734pbb.27.2014.06.12.14.10.11 for <multiple recipients>
	(version=SSLv3 cipher=RC4-SHA bits=128/128);
	Thu, 12 Jun 2014 14:10:12 -0700 (PDT)
From: akuster <akuster@mvista.com>
X-Google-Original-From: akuster <akuster@mvista. com>
Message-ID: <1402607410.2294.16.camel@Pahoa2>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 12 Jun 2014 14:10:10 -0700
In-Reply-To: <20140612174147.GE2428@jama>
References: <20140612174147.GE2428@jama>
Organization: MontaVista LLC
X-Mailer: Evolution 3.10.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: State of bitbake world, test-dependencies 2014-06-12
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: akuster@mvista.com
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Jun 2014 21:10:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2014-06-12 at 19:41 +0200, Martin Jansa wrote:
> This time it was "incremental" and it's not really complete because
> there is still a lot of failing recipes in "world" (see my other "State"
> e-mails).
> 
> Complete logs:
> http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.20140611_213746.log/
> 
> failed recipes:
> abiword:ERROR: Task 333 (meta-openembedded/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.26.bb, do_compile) failed with exit code '1'
> claws-mail:ERROR: Task 6 (meta-openembedded/meta-oe/recipes-sato/claws-mail/claws-mail_3.9.0.bb, do_compile) failed with exit code '1'
> claws-plugin-gtkhtml2-viewer:ERROR: Task 206 (meta-openembedded/meta-oe/recipes-sato/claws-mail/claws-mail_3.9.0.bb, do_compile) failed with exit code '1'
> claws-plugin-mailmbox:ERROR: Task 183 (meta-openembedded/meta-oe/recipes-sato/claws-mail/claws-mail_3.9.0.bb, do_compile) failed with exit code '1'
> claws-plugin-rssyl:ERROR: Task 206 (meta-openembedded/meta-oe/recipes-sato/claws-mail/claws-mail_3.9.0.bb, do_compile) failed with exit code '1'
> cups:ERROR: Task 6 (openembedded-core/meta/recipes-extended/cups/cups_1.7.3.bb, do_compile) failed with exit code '1'

I believe I submitted a fix for cups, not sure where in process it is.
http://patches.openembedded.org/patch/73565/


> ghostscript:ERROR: Task 222 (openembedded-core/meta/recipes-extended/cups/cups_1.7.3.bb, do_compile) failed with exit code '1'
> gnumeric:ERROR: Task 206 (meta-openembedded/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.26.bb, do_compile) failed with exit code '1'
> goffice:ERROR: Task 255 (meta-openembedded/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.26.bb, do_compile) failed with exit code '1'
> libgsf:ERROR: Task 6 (meta-openembedded/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.26.bb, do_compile) failed with exit code '1'
> libhybris:ERROR: Task 6 (meta-smartphone/meta-android/recipes-core/libhybris/libhybris_git.bb, do_compile) failed with exit code '1'
> liboauth:ERROR: Task 6 (meta-openembedded/meta-oe/recipes-support/liboauth/liboauth_1.0.3.bb, do_compile) failed with exit code '1'
> mesa:ERROR: Task 5 (openembedded-core/meta/recipes-graphics/mesa/mesa_10.1.3.bb, do_configure) failed with exit code '1'
> mesa-demos:ERROR: Task 182 (openembedded-core/meta/recipes-graphics/mesa/mesa_10.1.3.bb, do_configure) failed with exit code '1'
> mesa-glut:ERROR: Task 221 (openembedded-core/meta/recipes-graphics/mesa/mesa_10.1.3.bb, do_configure) failed with exit code '1'
> packagegroup-shr-feed:ERROR: Task 7931 (meta-smartphone/meta-shr/recipes-shr/shr/python-phoneutils_git.bb, do_compile) failed with exit code '1'
> packagegroup-shr-feed:ERROR: Task 7905 (meta-openembedded/meta-oe/recipes-devtools/python/python-pyyaml_3.10.bb, do_compile) failed with exit code '1'
> pidgin:ERROR: Task 5 (meta-openembedded/meta-oe/recipes-support/pidgin/pidgin_2.7.9.bb, do_configure) failed with exit code '1'
> rtorrent:ERROR: Task 5 (meta-openembedded/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.9.3.bb, do_configure) failed with exit code '1'
> wv:ERROR: Task 183 (meta-openembedded/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.26.bb, do_compile) failed with exit code '1'
> xwd:ERROR: Task 5 (meta-openembedded/meta-oe/recipes-graphics/xorg-app/xwd_1.0.6.bb, do_configure) failed with exit code '1'
> 
> Found differences: 
> ccid/ccid/latest lost dependency on  flex
> consolekit/consolekit/latest lost dependency on  polkit
> directfb/directfb/latest lost dependency on  libdrm libdrm-kms liblzma libwebp tiff
> engrave/engrave/latest lost dependency on  flex
> epiphany/epiphany/latest lost dependency on  libavahi-client libavahi-common libavahi-gobject libnotify
> expedite/expedite/latest lost dependency on  libsdl
> flashrom/flashrom/latest lost dependency on  libftdi
> gammu/gammu/latest lost dependency on  glib-2.0 libgudev-1.0
> gammu/libgammu/latest lost dependency on  glib-2.0
> gd/gd/latest lost dependency on  liblzma tiff
> glade3/glade3/latest lost dependency on  dbus-glib dbus-lib gconf gnome-vfs libart-lgpl libavahi-client libavahi-common libavahi-glib libbonobo libbonoboui libcanberra libcap libgcrypt libgnome libgnome-keyring libgnomecanvas libgnomeui libgpg-error libice libltdl libogg libsm libvorbis libxcomposite libxcursor libxdamage libxfixes libxrandr orbit2 popt util-linux-libuuid
> gmtk/gmtk/latest lost dependency on  cairo-gobject dbus-lib gtk+3 json-c libcap libice libpulse libpulse-mainloop-glib libpulsecommon libsm libsndfile1 libx11-xcb libxi libxtst util-linux-libuuid
> gnokii/libgnokii/latest lost dependency on  bluez4 libical libusb-compat libusb1 pcsc-lite-lib
> gnome-disk-utility/gnome-disk-utility-libs/latest lost dependency on  libcap libgcrypt libgnome-keyring libgpg-error
> gnome-panel/gnome-panel/latest lost dependency on  dbus-lib
> gnutls/gnutls-bin/latest lost dependency on  libidn
> guile/guile/latest lost dependency on  libgc ncurses-libncurses readline
> libarchive/libarchive/latest lost dependency on  nettle
> libarchive/libarchive-bin/latest lost dependency on  libxml2 nettle
> libmicrohttpd/libmicrohttpd-bin/latest lost dependency on  file
> libssh/libssh/latest lost dependency on  krb5
> libungif/libungif/latest lost dependency on  libice libsm libx11 libxau libxcb libxdmcp util-linux-libuuid
> libungif/libungif-utils/latest lost dependency on  libx11
> ltrace/ltrace/latest lost dependency on  libunwind
> midori/midori/latest lost dependency on  libxscrnsaver
> mpd/mpd/latest lost dependency on  fluidsynth libao libcdio libcdio-cdda libcdio-paranoia libjack libmms libmodplug libopus libwrap mpg123 wavpack yajl
> mpeg2dec/mpeg2dec/latest lost dependency on  libx11 libxext libxv
> mpg123/mpg123/latest lost dependency on  audiofile esound libjack libsdl portaudio-v19 tslib
> opencv/libopencv-highgui/latest lost dependency on  jasper libdc1394
> oscam/oscam/latest lost dependency on  pcsc-lite-lib
> piglit/piglit/latest lost dependency on  libxrender
> protobuf/protobuf/latest lost dependency on  zlib
> python/python-tkinter/latest lost dependency on  eglibc libpython2 libx11 tcl-lib
> python3/python3-tkinter/latest lost dependency on  eglibc libpython3 tcl-lib
> samba/libnetapi/latest lost dependency on  talloc
> samba/libnss-winbind/latest lost dependency on  talloc
> samba/libsmbclient/latest lost dependency on  talloc
> samba/samba/latest lost dependency on  talloc
> samba/swat/latest lost dependency on  talloc
> samba/winbind/latest lost dependency on  talloc
> stunnel/stunnel/latest lost dependency on  libwrap zlib
> synergy/synergy/latest lost dependency on  libxinerama
> tracker/tracker/latest lost dependency on  dbus-glib enca gmp gnutls gtk+3 libgee libgudev-1.0 libnmglib libnmutil libudev libunistring nettle upower
> tracker/tracker-dev/latest lost dependency on  cairo enca expat fontconfig freetype giflib gstreamer lcms libgstpbutils-0.10 libgsttag-0.10 liblzma libpoppler libpoppler-glib libunistring libx11 libxau libxcb libxcb-render libxcb-shm libxdmcp libxext libxrender pixman taglib taglib-c tiff
> tracker/tracker-nautilus-extension/latest lost dependency on  atk cairo eglibc expat fontconfig freetype gdk-pixbuf glib-2.0 gtk+ harfbuzz libffi libpng libsqlite3 libunistring libx11 libxau libxcb libxcb-render libxcb-shm libxdmcp libxext libxrender pango pixman tracker util-linux-libuuid zlib
> tumbler/tumbler/latest lost dependency on  gstreamer1.0 libgsttag-1.0
> vagalume/vagalume/latest lost dependency on  libproxy
> weston/weston/latest lost dependency on  libwebp
> weston/weston-examples/latest lost dependency on  libwebp
> wvstreams/wvstreams/latest lost dependency on  dbus-lib libwvstreams-base readline
> xserver-xorg/xserver-xorg/latest lost dependency on  libunwind libxshmfence nettle
> xserver-xorg/xserver-xorg-xvfb/latest lost dependency on  libunwind nettle
> perf/perf/latest lost dependency on  libunwind
> 



