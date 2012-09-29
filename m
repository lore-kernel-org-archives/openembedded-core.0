Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1THxOF-0005L7-J5
	for openembedded-core@lists.openembedded.org;
	Sat, 29 Sep 2012 15:47:31 +0200
Received: by wgbdq11 with SMTP id dq11so2190224wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Sep 2012 06:34:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=BAlhqif5ppTzg5rp7cqXoyxud0u4wQPqUIDYrM64uvE=;
	b=CesjljWLVzWLmGirQPXlIrWxofZXSfgh71R3FXQXbbZdYHO/Wa5nnx2HA8CeH8LQrj
	LT8AvQLsCD5MDkcQl2lp2X60MxG0qD8lqx57uE2TmvsVpMkYZBGAyC8v5zNZ3LVegVBK
	3Rq4/0tyxs8ELLjLK2wRzwRFXmVW1/ZygWQ/Nz2PUQiGMok9ZOkVz7ETZZGz2/U81vrO
	hIkYT/IYSa7yHc7JnhvcqdjfRPww2xO7V8n2NULGKMyK7XJUAALEZ0+S+cRWWDPoAP1O
	SGSxwe12d8v0QXULIfcmudsgENsgp3lKtHZqyeDZJEVSQcypBIM4mIlCU6BTNcfg0pOT
	dG3w==
Received: by 10.216.214.92 with SMTP id b70mr5422275wep.86.1348925677171;
	Sat, 29 Sep 2012 06:34:37 -0700 (PDT)
Received: from [172.20.0.22] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id k2sm5766368wiz.7.2012.09.29.06.34.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 29 Sep 2012 06:34:35 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.1 \(1498\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1348867656.15753.86.camel@ted>
Date: Sat, 29 Sep 2012 15:34:32 +0200
Message-Id: <BCD7AC26-F8DD-4A25-92CC-9E8324C9AC09@dominion.thruhere.net>
References: <1348866282-30437-1-git-send-email-koen@dominion.thruhere.net>
	<1348867656.15753.86.camel@ted>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.1498)
X-Gm-Message-State: ALoCoQk/Wje6kvJlCuXDO2Q4GUKc6N51qQJ6APz6xvajY8v2qXHmVAbiXA3ihz2bXoizn7M4CmEM
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Revert "opkg svn: respect to the arch priority"
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 29 Sep 2012 13:47:31 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 28 sep. 2012, om 23:27 heeft Richard Purdie =
<richard.purdie@linuxfoundation.org> het volgende geschreven:

> On Fri, 2012-09-28 at 23:04 +0200, Koen Kooi wrote:
>> This completely breaks installing packages from feeds:
>>=20
>> root@bone-mainline:~# opkg install libgtk-2.0
>> Installing libgtk-2.0 (2.24.8-r7.1) to root...
>> Downloading =
http://eu.feeds.angstrom-distribution.org/feeds/core/ipk/eglibc/armv7a-vfp=
-neon/base/libgtk-2.0_2.24.8-r7.1_armv7a-vfp-neon.ipk.
>> Installing pango (1.30.0-r1.1) to root...
>> Downloading =
http://eu.feeds.angstrom-distribution.org/feeds/core/ipk/eglibc/armv7a-vfp=
-neon/base/pango_1.30.0-r1.1_armv7a-vfp-neon.ipk.
>> Installing pango-module-basic-x (1.30.0-r1.1) to root...
>> Downloading =
http://eu.feeds.angstrom-distribution.org/feeds/core/ipk/eglibc/armv7a-vfp=
-neon/base/pango-module-basic-x_1.30.0-r1.1_armv7a-vfp-neon.ipk.
>> Installing pango-module-basic-fc (1.30.0-r1.1) to root...
>> Downloading =
http://eu.feeds.angstrom-distribution.org/feeds/core/ipk/eglibc/armv7a-vfp=
-neon/base/pango-module-basic-fc_1.30.0-r1.1_armv7a-vfp-neon.ipk.
>> Installing shared-mime-info (0.91-r4.9) to root...
>> Downloading =
http://eu.feeds.angstrom-distribution.org/feeds/core/ipk/eglibc/armv7a-vfp=
-neon/base/shared-mime-info_0.91-r4.9_armv7a-vfp-neon.ipk.
>> Installing gdk-pixbuf-loader-png (2.24.1-r7.1) to root...
>> Downloading =
http://eu.feeds.angstrom-distribution.org/feeds/core/ipk/eglibc/armv7a-vfp=
-neon/base/gdk-pixbuf-loader-png_2.24.1-r7.1_armv7a-vfp-neon.ipk.
>> Installing gdk-pixbuf-loader-jpeg (2.24.1-r7.1) to root...
>> Downloading =
http://eu.feeds.angstrom-distribution.org/feeds/core/ipk/eglibc/armv7a-vfp=
-neon/base/gdk-pixbuf-loader-jpeg_2.24.1-r7.1_armv7a-vfp-neon.ipk.
>> Installing libjpeg8 (8d+1.2.1-r1.1) to root...
>> Configuring pango-module-basic-x.
>> Configuring pango.
>> Configuring pango-module-basic-fc.
>> Configuring shared-mime-info.
>> Configuring hicolor-icon-theme.
>> //var/lib/opkg/info/hicolor-icon-theme.postinst: line 11: =
gtk-update-icon-cache: command not found
>> Configuring gdk-pixbuf-loader-png.
>> Collected errors:
>> * opkg_download_pkg: Package libjpeg8 is not available from any =
configured src.
>> * opkg_install_pkg: Failed to download libjpeg8. Perhaps you need to =
run 'opkg update'?
>> * opkg_install_cmd: Cannot install package libgtk-2.0.
>> * pkg_run_script: package "hicolor-icon-theme" postinst script =
returned status 127.
>> * opkg_configure: hicolor-icon-theme.postinst returned 127.
>=20
> I'm not entirely seeing the connection to this patch based on the =
above
> errors.=20
>=20
> Also did you try opkg with the new options? I'm not saying there isn't =
a
> problem but some help in figuring out how to resolve this would be =
good.

I'll see if the new option help next week, but even if they do, needing =
to use opkg install --unbreak-me is unacceptable.=


