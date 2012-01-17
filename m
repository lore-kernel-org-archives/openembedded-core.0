Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RmxFV-0007pA-Gz
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 01:50:05 +0100
Received: (qmail invoked by alias); 17 Jan 2012 00:42:29 -0000
Received: from p4FDF042B.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.223.4.43]
	by mail.gmx.net (mp069) with SMTP; 17 Jan 2012 01:42:29 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX187L6FAGKA7/6I3QjgN2cElxZT0aG4D/bB4AvdflB
	xA0qAaucOlDk3o
From: Andreas =?iso-8859-1?q?M=FCller?= <schnitzeltony@gmx.de>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jan 2012 01:43:45 +0100
User-Agent: KMail/1.13.7 (Linux/2.6.35.14-106.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
MIME-Version: 1.0
Message-Id: <201201170143.46134.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: update-alternatives questions
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
X-List-Received-Date: Tue, 17 Jan 2012 00:50:05 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi

when starting a fresh image (angstrom/opkg) I see for xfwm4 (xfce window manager 
included in meta-oe)

S98configure[285]: //var/lib/opkg/info/xfwm4.postinst: line 2: update-
alternatives: command not found

I checked: 

* there is no  update-alternatives in my image
* update-alternatives is packed in update-alternatives-cworth (sub package of 
opkg) which is not part of my image

Isn't it required to have update-alternatives on the target because it is used 
in postinst- / and postrm scripts?

Andreas


