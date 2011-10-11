Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RDlUI-0004al-LO
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Oct 2011 01:11:54 +0200
Received: (qmail invoked by alias); 11 Oct 2011 23:06:12 -0000
Received: from p5B0A3D7B.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.61.123]
	by mail.gmx.net (mp035) with SMTP; 12 Oct 2011 01:06:12 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX19HSi8dE8BHCmQSrrrhB4MYGVU7OAlWoAPWV3H5oh
	TYKDtQsOBC/5Av
From: Andreas =?iso-8859-1?q?M=FCller?= <schnitzeltony@gmx.de>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Oct 2011 01:10:38 +0200
User-Agent: KMail/1.13.7 (Linux/2.6.35.14-97.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
MIME-Version: 1.0
Message-Id: <201110120110.38951.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Cc: openembedded-devel@lists.openembedded.org
Subject: oe parse fails
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
X-List-Received-Date: Tue, 11 Oct 2011 23:11:54 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Angstrom environment / fresh pull / clean tmp dir -> error

Pseudo is not present but is required, building this first before the main build
NOTE: angstrom DOES NOT support libiconv because the eglibc provided iconv library is used                                                                                                        | ETA:  00:00:34
NOTE: angstrom DOES NOT support libiconv because the eglibc provided iconv library is used
NOTE: angstrom DOES NOT support gconf-dbus because gconf-dbus has been merged back into main GConf                                                                                                | ETA:  00:00:34
NOTE: angstrom DOES NOT support gconf-dbus-native because gconf-dbus has been merged back into main GConf
ERROR: Could not include required file recipes-graphics/xorg-xserver/xserver-xf86-dri-lite.inc##############################################################                                      | ETA:  00:00:09
ERROR: Command execution failed: Exited with 1

Andreas


