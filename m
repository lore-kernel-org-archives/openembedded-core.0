Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QNK8j-0000Hd-Ah
	for openembedded-core@lists.openembedded.org;
	Fri, 20 May 2011 09:28:53 +0200
Received: by wwb17 with SMTP id 17so3035098wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 May 2011 00:25:56 -0700 (PDT)
Received: by 10.216.221.72 with SMTP id q50mr3641701wep.99.1305876356489;
	Fri, 20 May 2011 00:25:56 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id k63sm1668151wed.23.2011.05.20.00.25.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 20 May 2011 00:25:55 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 20 May 2011 09:25:49 +0200
Message-Id: <BF0FE697-3489-4B92-AB20-36DE6B63E5C0@dominion.thruhere.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Apple Message framework v1084)
X-Mailer: Apple Mail (2.1084)
Subject: New fetcher failure for local files
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
X-List-Received-Date: Fri, 20 May 2011 07:28:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,

Since a few days the fetcher is behaving strangely:

NOTE: package =
linux-omap-psp-2.6.32-r99b+gitr5fc29e7b2a76a64a739f857858ef0b98294aa155: =
task do_fetch: Started
ERROR: Function 'Fetcher failure for URL: 'file://defconfig'. Unable to =
fetch URL file://defconfig from any source.' failed

It is present:

koen@dominion:/OE/tentacle/sources/meta-texasinstruments$ find . -name =
"defconfig" | grep beagle
./recipes-bsp/linux/linux-omap-psp-2.6.32/beagleboard/defconfig
./recipes-bsp/linux/linux-omap/beagleboard/defconfig

The strange thing is that it will work once (e.g. bitbake console-image) =
but it will fail after switching TCLIBC. And once it started failing, it =
doesn't work for the default TCLIBC either.

What's the best way to debug this? -DDD isn't giving much clues, nor =
does strace :(

regards,

Koen=


