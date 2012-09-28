Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1THiIa-0007Lr-0U for openembedded-core@lists.openembedded.org;
	Fri, 28 Sep 2012 23:40:40 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8SLRg6r014832;
	Fri, 28 Sep 2012 22:27:42 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 13751-06; Fri, 28 Sep 2012 22:27:37 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8SLRYSF014826
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Fri, 28 Sep 2012 22:27:36 +0100
Message-ID: <1348867656.15753.86.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 28 Sep 2012 22:27:36 +0100
In-Reply-To: <1348866282-30437-1-git-send-email-koen@dominion.thruhere.net>
References: <1348866282-30437-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
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
X-List-Received-Date: Fri, 28 Sep 2012 21:40:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-09-28 at 23:04 +0200, Koen Kooi wrote:
> This completely breaks installing packages from feeds:
> 
> root@bone-mainline:~# opkg install libgtk-2.0
> Installing libgtk-2.0 (2.24.8-r7.1) to root...
> Downloading http://eu.feeds.angstrom-distribution.org/feeds/core/ipk/eglibc/armv7a-vfp-neon/base/libgtk-2.0_2.24.8-r7.1_armv7a-vfp-neon.ipk.
> Installing pango (1.30.0-r1.1) to root...
> Downloading http://eu.feeds.angstrom-distribution.org/feeds/core/ipk/eglibc/armv7a-vfp-neon/base/pango_1.30.0-r1.1_armv7a-vfp-neon.ipk.
> Installing pango-module-basic-x (1.30.0-r1.1) to root...
> Downloading http://eu.feeds.angstrom-distribution.org/feeds/core/ipk/eglibc/armv7a-vfp-neon/base/pango-module-basic-x_1.30.0-r1.1_armv7a-vfp-neon.ipk.
> Installing pango-module-basic-fc (1.30.0-r1.1) to root...
> Downloading http://eu.feeds.angstrom-distribution.org/feeds/core/ipk/eglibc/armv7a-vfp-neon/base/pango-module-basic-fc_1.30.0-r1.1_armv7a-vfp-neon.ipk.
> Installing shared-mime-info (0.91-r4.9) to root...
> Downloading http://eu.feeds.angstrom-distribution.org/feeds/core/ipk/eglibc/armv7a-vfp-neon/base/shared-mime-info_0.91-r4.9_armv7a-vfp-neon.ipk.
> Installing gdk-pixbuf-loader-png (2.24.1-r7.1) to root...
> Downloading http://eu.feeds.angstrom-distribution.org/feeds/core/ipk/eglibc/armv7a-vfp-neon/base/gdk-pixbuf-loader-png_2.24.1-r7.1_armv7a-vfp-neon.ipk.
> Installing gdk-pixbuf-loader-jpeg (2.24.1-r7.1) to root...
> Downloading http://eu.feeds.angstrom-distribution.org/feeds/core/ipk/eglibc/armv7a-vfp-neon/base/gdk-pixbuf-loader-jpeg_2.24.1-r7.1_armv7a-vfp-neon.ipk.
> Installing libjpeg8 (8d+1.2.1-r1.1) to root...
> Configuring pango-module-basic-x.
> Configuring pango.
> Configuring pango-module-basic-fc.
> Configuring shared-mime-info.
> Configuring hicolor-icon-theme.
> //var/lib/opkg/info/hicolor-icon-theme.postinst: line 11: gtk-update-icon-cache: command not found
> Configuring gdk-pixbuf-loader-png.
> Collected errors:
>  * opkg_download_pkg: Package libjpeg8 is not available from any configured src.
>  * opkg_install_pkg: Failed to download libjpeg8. Perhaps you need to run 'opkg update'?
>  * opkg_install_cmd: Cannot install package libgtk-2.0.
>  * pkg_run_script: package "hicolor-icon-theme" postinst script returned status 127.
>  * opkg_configure: hicolor-icon-theme.postinst returned 127.

I'm not entirely seeing the connection to this patch based on the above
errors. 

Also did you try opkg with the new options? I'm not saying there isn't a
problem but some help in figuring out how to resolve this would be good.

Cheers,

Richard



