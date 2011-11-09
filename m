Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1ROGRv-00045t-Du
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Nov 2011 23:16:51 +0100
Received: (qmail invoked by alias); 09 Nov 2011 22:10:35 -0000
Received: from p5B0A37AB.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.55.171]
	by mail.gmx.net (mp055) with SMTP; 09 Nov 2011 23:10:35 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1+A92I0Nv6AXy5bwQ6JJKbX1II0RI2mr+HNDUT7kj
	3WiUyufVA7xtLd
From: Andreas =?iso-8859-1?q?M=FCller?= <schnitzeltony@gmx.de>
To: "Patches and discussions about the oe-core layer"
	<openembedded-core@lists.openembedded.org>
Date: Wed, 9 Nov 2011 23:15:30 +0100
User-Agent: KMail/1.13.7 (Linux/2.6.35.14-100.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
MIME-Version: 1.0
Message-Id: <201111092315.30348.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: systemd packages -> image
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
X-List-Received-Date: Wed, 09 Nov 2011 22:16:51 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

Imagine a recipe is included into an image by a task and later gets systemd-
native support.
How about forcing the packages in SYSTEMD_PACKAGES packed into images in case 

IMAGE_INIT_MANAGER  = "systemd"

is found in the image definition?

Andreas



