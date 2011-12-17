Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1Rbjdn-0003dx-UP
	for openembedded-core@lists.openembedded.org;
	Sat, 17 Dec 2011 03:04:52 +0100
Received: (qmail invoked by alias); 17 Dec 2011 01:57:48 -0000
Received: from p4FDF1017.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.223.16.23]
	by mail.gmx.net (mp023) with SMTP; 17 Dec 2011 02:57:48 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1/+DaQ2q27+ZSG/OWBx0KhEXt8SveqdSsEb7UTe6B
	2klORgQ7nW08/H
From: Andreas =?iso-8859-1?q?M=FCller?= <schnitzeltony@gmx.de>
To: openembedded-core@lists.openembedded.org
Date: Sat, 17 Dec 2011 02:58:09 +0100
User-Agent: KMail/1.13.7 (Linux/2.6.35.14-106.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
MIME-Version: 1.0
Message-Id: <201112170258.10212.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: require *.bbappend
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
X-List-Received-Date: Sat, 17 Dec 2011 02:04:53 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi

I have the following use case:

In my working layer I would like to have a recipe adding functionality to a 
recipe from another layer (e.g systemd-image.bb from angstrom) with a different 
name ( -> no bbappend ). How about

* create systemd-image.bbapend with just 'FILESEXTRAPATHS := "${THISDIR}"' to 
get it into the scope of my layer
* create a recipe  which contains 'require systemd-image.bbappend'

Currently parser complains that systemd-image.bbappend is not a BitBake file. 

Would a modification be possible or is there another way to solve?

Andreas


