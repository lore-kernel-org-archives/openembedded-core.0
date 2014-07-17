Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A5D24705D9;
	Thu, 17 Jul 2014 11:23:00 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s6HBMswA016094; Thu, 17 Jul 2014 12:22:54 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 8qBvTsTss6kE; Thu, 17 Jul 2014 12:22:54 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s6HBMoRD016080
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Thu, 17 Jul 2014 12:22:51 +0100
Message-ID: <1405596165.3668.13.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 17 Jul 2014 12:22:45 +0100
In-Reply-To: <20140717084749.GJ2433@jama>
References: <20140716130503.GW2433@jama> <20140717084749.GJ2433@jama>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: State of bitbake world, test-dependencies 2014-06-27
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
X-List-Received-Date: Thu, 17 Jul 2014 11:23:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2014-07-17 at 10:47 +0200, Martin Jansa wrote:
> ttf-arphic-uming-20080216: ttf-arphic-uming rdepends on fontconfig-utils but its not a build dependency?
> ttf-bitstream-vera-1.10: ttf-bitstream-vera rdepends on fontconfig-utils but its not a build dependency?
> ttf-dejavu-2.23: ttf-dejavu-sans rdepends on fontconfig-utils but its not a build dependency?
> ttf-dejavu-2.23: ttf-dejavu-sans-condensed rdepends on fontconfig-utils but its not a build dependency?
> ttf-dejavu-2.23: ttf-dejavu-sans-mono rdepends on fontconfig-utils but its not a build dependency?
> ttf-dejavu-2.23: ttf-dejavu-serif rdepends on fontconfig-utils but its not a build dependency?
> ttf-dejavu-2.23: ttf-dejavu-serif-condensed rdepends on fontconfig-utils but its not a build dependency?
> ttf-droid-0.1+gitrAUTOINC+21e6e2de1f: ttf-droid-sans rdepends on fontconfig-utils but its not a build dependency?
> ttf-droid-0.1+gitrAUTOINC+21e6e2de1f: ttf-droid-sans-fallback rdepends on fontconfig-utils but its not a build dependency?
> ttf-droid-0.1+gitrAUTOINC+21e6e2de1f: ttf-droid-sans-japanese rdepends on fontconfig-utils but its not a build dependency?
> ttf-droid-0.1+gitrAUTOINC+21e6e2de1f: ttf-droid-sans-mono rdepends on fontconfig-utils but its not a build dependency?
> ttf-droid-0.1+gitrAUTOINC+21e6e2de1f: ttf-droid-serif rdepends on fontconfig-utils but its not a build dependency?
> ttf-gentium-1.02: ttf-gentium rdepends on fontconfig-utils but its not a build dependency?
> ttf-gentium-1.02: ttf-gentium-alt rdepends on fontconfig-utils but its not a build dependency?
> ttf-hunkyfonts-0.3.0: ttf-hunky-sans rdepends on fontconfig-utils but its not a build dependency?
> ttf-hunkyfonts-0.3.0: ttf-hunky-serif rdepends on fontconfig-utils but its not a build dependency?
> ttf-inconsolata-20100526: ttf-inconsolata rdepends on fontconfig-utils but its not a build dependency?
> ttf-liberation-0.2: ttf-liberation-mono rdepends on fontconfig-utils but its not a build dependency?
> ttf-liberation-0.2: ttf-liberation-sans rdepends on fontconfig-utils but its not a build dependency?
> ttf-liberation-0.2: ttf-liberation-serif rdepends on fontconfig-utils but its not a build dependency?
> ttf-mplus-027: ttf-mplus-1c-black rdepends on fontconfig-utils but its not a build dependency?
> ttf-mplus-027: ttf-mplus-1c-black rdepends on ttf-common but its not a build dependency?
> ttf-mplus-027: ttf-mplus-1c-bold rdepends on fontconfig-utils but its not a build dependency?
> ttf-mplus-027: ttf-mplus-1c-bold rdepends on ttf-common but its not a build dependency?
> ttf-mplus-027: ttf-mplus-1c-heavy rdepends on fontconfig-utils but its not a build dependency?
> ttf-mplus-027: ttf-mplus-1c-heavy rdepends on ttf-common but its not a build dependency?
> ttf-mplus-027: ttf-mplus-1c-light rdepends on fontconfig-utils but its not a build dependency?
> ttf-mplus-027: ttf-mplus-1c-light rdepends on ttf-common but its not a build dependency?
> ttf-mplus-027: ttf-mplus-1c-medium rdepends on fontconfig-utils but its not a build dependency?
> ttf-mplus-027: ttf-mplus-1c-medium rdepends on ttf-common but its not a build dependency?
> ttf-mplus-027: ttf-mplus-1c-regular rdepends on fontconfig-utils but its not a build dependency?
> ttf-mplus-027: ttf-mplus-1c-regular rdepends on ttf-common but its not a build dependency?
> ttf-mplus-027: ttf-mplus-1c-thin rdepends on fontconfig-utils but its not a build dependency?
> ttf-mplus-027: ttf-mplus-1c-thin rdepends on ttf-common but its not a build dependency?
> ttf-mplus-027: ttf-mplus-1m-bold rdepends on fontconfig-utils but its not a build dependency?
> ttf-mplus-027: ttf-mplus-1m-bold rdepends on ttf-common but its not a build dependency?
> ttf-mplus-027: ttf-mplus-1m-light rdepends on fontconfig-utils but its not a build dependency?
> ttf-mplus-027: ttf-mplus-1m-light rdepends on ttf-common but its not a build dependency?
> ttf-mplus-027: ttf-mplus-1m-medium rdepends on fontconfig-utils but its not a build dependency?
> ttf-mplus-027: ttf-mplus-1m-medium rdepends on ttf-common but its not a build dependency?
> ttf-mplus-027: ttf-mplus-1m-regular rdepends on fontconfig-utils but its not a build dependency?
> ttf-mplus-027: ttf-mplus-1m-regular rdepends on ttf-common but its not a build dependency?
> ttf-mplus-027: ttf-mplus-1m-thin rdepends on fontconfig-utils but its not a build dependency?
> ttf-mplus-027: ttf-mplus-1m-thin rdepends on ttf-common but its not a build dependency?
> ttf-mplus-027: ttf-mplus-1mn-bold rdepends on fontconfig-utils but its not a build dependency?
> ttf-mplus-027: ttf-mplus-1mn-bold rdepends on ttf-common but its not a build dependency?
> ttf-mplus-027: ttf-mplus-1mn-light rdepends on fontconfig-utils but its not a build dependency?
> ttf-mplus-027: ttf-mplus-1mn-light rdepends on ttf-common but its not a build dependency?
> ttf-mplus-027: ttf-mplus-1mn-medium rdepends on fontconfig-utils but its not a build dependency?
> ttf-mplus-027: ttf-mplus-1mn-medium rdepends on ttf-common but its not a build dependency?
> ttf-mplus-027: ttf-mplus-1mn-regular rdepends on fontconfig-utils but its not a build dependency?
> ttf-mplus-027: ttf-mplus-1mn-regular rdepends on ttf-common but its not a build dependency?
> ttf-mplus-027: ttf-mplus-1mn-thin rdepends on fontconfig-utils but its not a build dependency?
> ttf-mplus-027: ttf-mplus-1mn-thin rdepends on ttf-common but its not a build dependency?
> ttf-mplus-027: ttf-mplus-1p-black rdepends on fontconfig-utils but its not a build dependency?
> ttf-mplus-027: ttf-mplus-1p-black rdepends on ttf-common but its not a build dependency?
> ttf-mplus-027: ttf-mplus-1p-bold rdepends on fontconfig-utils but its not a build dependency?
> ttf-mplus-027: ttf-mplus-1p-bold rdepends on ttf-common but its not a build dependency?
> ttf-mplus-027: ttf-mplus-1p-heavy rdepends on fontconfig-utils but its not a build dependency?
> ttf-mplus-027: ttf-mplus-1p-heavy rdepends on ttf-common but its not a build dependency?
> ttf-mplus-027: ttf-mplus-1p-light rdepends on fontconfig-utils but its not a build dependency?
> ttf-mplus-027: ttf-mplus-1p-light rdepends on ttf-common but its not a build dependency?
> ttf-mplus-027: ttf-mplus-1p-medium rdepends on fontconfig-utils but its not a build dependency?
> ttf-mplus-027: ttf-mplus-1p-medium rdepends on ttf-common but its not a build dependency?
> ttf-mplus-027: ttf-mplus-1p-regular rdepends on fontconfig-utils but its not a build dependency?
> ttf-mplus-027: ttf-mplus-1p-regular rdepends on ttf-common but its not a build dependency?
> ttf-mplus-027: ttf-mplus-1p-thin rdepends on fontconfig-utils but its not a build dependency?
> ttf-mplus-027: ttf-mplus-1p-thin rdepends on ttf-common but its not a build dependency?
> ttf-mplus-027: ttf-mplus-2c-black rdepends on fontconfig-utils but its not a build dependency?
> ttf-mplus-027: ttf-mplus-2c-black rdepends on ttf-common but its not a build dependency?
> ttf-mplus-027: ttf-mplus-2c-bold rdepends on fontconfig-utils but its not a build dependency?
> ttf-mplus-027: ttf-mplus-2c-bold rdepends on ttf-common but its not a build dependency?
> ttf-mplus-027: ttf-mplus-2c-heavy rdepends on fontconfig-utils but its not a build dependency?
> ttf-mplus-027: ttf-mplus-2c-heavy rdepends on ttf-common but its not a build dependency?
> ttf-mplus-027: ttf-mplus-2c-light rdepends on fontconfig-utils but its not a build dependency?
> ttf-mplus-027: ttf-mplus-2c-light rdepends on ttf-common but its not a build dependency?
> ttf-mplus-027: ttf-mplus-2c-medium rdepends on fontconfig-utils but its not a build dependency?
> ttf-mplus-027: ttf-mplus-2c-medium rdepends on ttf-common but its not a build dependency?
> ttf-mplus-027: ttf-mplus-2c-regular rdepends on fontconfig-utils but its not a build dependency?
> ttf-mplus-027: ttf-mplus-2c-regular rdepends on ttf-common but its not a build dependency?
> ttf-mplus-027: ttf-mplus-2c-thin rdepends on fontconfig-utils but its not a build dependency?
> ttf-mplus-027: ttf-mplus-2c-thin rdepends on ttf-common but its not a build dependency?
> ttf-mplus-027: ttf-mplus-2m-bold rdepends on fontconfig-utils but its not a build dependency?
> ttf-mplus-027: ttf-mplus-2m-bold rdepends on ttf-common but its not a build dependency?
> ttf-mplus-027: ttf-mplus-2m-light rdepends on fontconfig-utils but its not a build dependency?
> ttf-mplus-027: ttf-mplus-2m-light rdepends on ttf-common but its not a build dependency?
> ttf-mplus-027: ttf-mplus-2m-medium rdepends on fontconfig-utils but its not a build dependency?
> ttf-mplus-027: ttf-mplus-2m-medium rdepends on ttf-common but its not a build dependency?
> ttf-mplus-027: ttf-mplus-2m-regular rdepends on fontconfig-utils but its not a build dependency?
> ttf-mplus-027: ttf-mplus-2m-regular rdepends on ttf-common but its not a build dependency?
> ttf-mplus-027: ttf-mplus-2m-thin rdepends on fontconfig-utils but its not a build dependency?
> ttf-mplus-027: ttf-mplus-2m-thin rdepends on ttf-common but its not a build dependency?
> ttf-mplus-027: ttf-mplus-2p-black rdepends on fontconfig-utils but its not a build dependency?
> ttf-mplus-027: ttf-mplus-2p-black rdepends on ttf-common but its not a build dependency?
> ttf-mplus-027: ttf-mplus-2p-bold rdepends on fontconfig-utils but its not a build dependency?
> ttf-mplus-027: ttf-mplus-2p-bold rdepends on ttf-common but its not a build dependency?
> ttf-mplus-027: ttf-mplus-2p-heavy rdepends on fontconfig-utils but its not a build dependency?
> ttf-mplus-027: ttf-mplus-2p-heavy rdepends on ttf-common but its not a build dependency?
> ttf-mplus-027: ttf-mplus-2p-light rdepends on fontconfig-utils but its not a build dependency?
> ttf-mplus-027: ttf-mplus-2p-light rdepends on ttf-common but its not a build dependency?
> ttf-mplus-027: ttf-mplus-2p-medium rdepends on fontconfig-utils but its not a build dependency?
> ttf-mplus-027: ttf-mplus-2p-medium rdepends on ttf-common but its not a build dependency?
> ttf-mplus-027: ttf-mplus-2p-regular rdepends on fontconfig-utils but its not a build dependency?
> ttf-mplus-027: ttf-mplus-2p-regular rdepends on ttf-common but its not a build dependency?
> ttf-mplus-027: ttf-mplus-2p-thin rdepends on fontconfig-utils but its not a build dependency?
> ttf-mplus-027: ttf-mplus-2p-thin rdepends on ttf-common but its not a build dependency?
> ttf-sazanami-20040629: ttf-sazanami-gothic rdepends on fontconfig-utils but its not a build dependency?
> ttf-sazanami-20040629: ttf-sazanami-mincho rdepends on fontconfig-utils but its not a build dependency?
> ttf-ubuntu-font-family-0.80: ttf-ubuntu-mono rdepends on fontconfig-utils but its not a build dependency?
> ttf-ubuntu-font-family-0.80: ttf-ubuntu-sans rdepends on fontconfig-utils but its not a build dependency?
> ttf-wqy-zenhei-0.6.26: ttf-wqy-zenhei rdepends on fontconfig-utils but its not a build dependency?
> xf86-video-intel-2.99.910: xf86-video-intel rdepends on libxcursor but its not a build dependency?
> xf86-video-intel-2.99.910: xf86-video-intel rdepends on libxinerama but its not a build dependency?
> xf86-video-intel-2.99.910: xf86-video-intel rdepends on libxrandr but its not a build dependency?
> xf86-video-intel-2.99.910: xf86-video-intel rdepends on libxrender but its not a build dependency?
> xf86-video-intel-2.99.910: xf86-video-intel rdepends on libxtst but its not a build dependency?
> xserver-xorg-1.15.1: xserver-xorg rdepends on nettle but its not a build dependency?
> xserver-xorg-1.15.1: xserver-xorg-xvfb rdepends on nettle but its not a build dependency?

Thankfully a tweak to fontcache.bbclass should at least result the
fontconfig ones above, I also have patches out for the xserver-xorg ones
so its a start...

Cheers,

Richard


