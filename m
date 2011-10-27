Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RJWc8-0002qH-B6
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Oct 2011 22:31:48 +0200
Received: (qmail invoked by alias); 27 Oct 2011 20:25:47 -0000
Received: from p5B0A2075.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.32.117]
	by mail.gmx.net (mp009) with SMTP; 27 Oct 2011 22:25:47 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX19lqzV05sZlV2Z+kuxRHMXwl/jTcDw9xsqDrRX4C0
	joXoqCbpzwYkgN
From: Andreas =?iso-8859-1?q?M=FCller?= <schnitzeltony@gmx.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Oct 2011 22:30:27 +0200
User-Agent: KMail/1.13.7 (Linux/2.6.35.14-97.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
MIME-Version: 1.0
Message-Id: <201110272230.29012.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Trouble by last dbus patch (46e6c3fa8034b12d178d605f3f5d7efe69671a13)?
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
X-List-Received-Date: Thu, 27 Oct 2011 20:31:48 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Since the last updates of all layers (angstrom based) I have issues with

* networkmanager/nm-applet (meta-oe): I am not allowed to change the settings
  any more
* xfce-session (meta-oe): Logging out takes very long and Restart/Shutdown is 
  disabled

I remember that I had similar issues a while ago. That could be worked around
by starting some dbus stuff ( do not exactly remember what it was ).

With this vague idea I checked and found in oe-core:

| dbus: use useradd class to allow use in read-only filesystems
| author	Otavio Salvador <otavio@ossystems.com.br>
| commit	46e6c3fa8034b12d178d605f3f5d7efe69671a13

Not understanding totally what is all about I see in /etc/passw

| messagebus:x:999:998::/var/lib/dbus:/bin/sh

but I don't have /var/lib/dbus on my sytem!!

I did not check yet, but maybe this is an incompatibilty with angstrom custom

| FILESYSTEM_PERMS_TABLES = "fs-perms-angstrom.txt"

somebody around to enlight the darkness?

Andreas


