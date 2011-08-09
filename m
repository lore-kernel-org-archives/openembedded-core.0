Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1Qqvd0-0006s6-RL
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Aug 2011 01:22:30 +0200
Received: (qmail invoked by alias); 09 Aug 2011 23:18:01 -0000
Received: from p5B0A210D.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.33.13]
	by mail.gmx.net (mp070) with SMTP; 10 Aug 2011 01:18:01 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1+keBk03CCkmGOpmnxgt4GLgOu5POwQz5TkhLCK40
	5VEJFp9Qm89HGE
From: Andreas Mueller <schnitzeltony@gmx.de>
To: "Patches and discussions about the oe-core layer"
	<openembedded-core@lists.openembedded.org>
Date: Wed, 10 Aug 2011 01:21:10 +0200
User-Agent: KMail/1.13.7 (Linux/2.6.35.13-92.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
MIME-Version: 1.0
Message-Id: <201108100121.11110.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Howto create image with -O0 optimization
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
X-List-Received-Date: Tue, 09 Aug 2011 23:22:31 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi

I am debugging thunar to find the reason for segfault and modified the recipe to 
be compiled without optimization -O0. Now I need to step into shared libraries 
too but since they are compiled with optimization it causes confusing step 
seqences.

So: How do I force -O0 optimization for whole images?

Andreas


