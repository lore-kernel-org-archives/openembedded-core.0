Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1QiEEE-0004Zb-HS
	for openembedded-core@lists.openembedded.org;
	Sun, 17 Jul 2011 01:24:59 +0200
Received: (qmail invoked by alias); 16 Jul 2011 23:20:44 -0000
Received: from p4FDF0445.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.223.4.69]
	by mail.gmx.net (mp040) with SMTP; 17 Jul 2011 01:20:44 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1/kEUkxG1TkAQRZ1QIfyKHPButzpdJ0E4/b1rvH8G
	WxvJDWDWWxamKA
From: Andreas Mueller <schnitzeltony@gmx.de>
To: "Patches and discussions about the oe-core layer"
	<openembedded-core@lists.openembedded.org>
Date: Sun, 17 Jul 2011 01:22:49 +0200
User-Agent: KMail/1.13.7 (Linux/2.6.35.13-92.fc14.x86_64; KDE/4.6.3; x86_64; ;
	)
MIME-Version: 1.0
Message-Id: <201107170122.49326.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: How to force rebuild of a recipe
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
X-List-Received-Date: Sat, 16 Jul 2011 23:24:59 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi

in oe during development I forced a full recipe rebuild by

bitbake -cclean recipe && bitbake recipe

in oe-core environment this does not seem to work. I found out that it 
additional needs manual deleting of the archives belonging to the recipe in the 
build folder sstate-cache. Is it a bug that -cclean does not delete these? Or 
how do I force a rebuild of a recipe under oe-core?

Thanks

Andreas


