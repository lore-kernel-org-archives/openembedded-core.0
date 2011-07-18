Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1QivDz-0006e7-JB
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Jul 2011 23:19:35 +0200
Received: (qmail invoked by alias); 18 Jul 2011 21:08:51 -0000
Received: from p5B0A326A.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.50.106]
	by mail.gmx.net (mp033) with SMTP; 18 Jul 2011 23:08:51 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1/nQ/0SXpzn29cfzHvlaqc2BCXiJnzJw5c5lgRhiO
	2m1l68dTlcciY8
From: Andreas Mueller <schnitzeltony@gmx.de>
To: "Patches and discussions about the oe-core layer"
	<openembedded-core@lists.openembedded.org>
Date: Mon, 18 Jul 2011 23:10:55 +0200
User-Agent: KMail/1.13.7 (Linux/2.6.35.13-92.fc14.x86_64; KDE/4.6.3; x86_64; ;
	)
MIME-Version: 1.0
Message-Id: <201107182310.56104.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Problems downloading xfwm4 4.8.1
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
X-List-Received-Date: Mon, 18 Jul 2011 21:19:35 -0000
X-Groupsio-MsgNum: 6060
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_gFKJOg3sNxcGB8v"

--Boundary-00=_gFKJOg3sNxcGB8v
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Ciao

currently I am porting my local oe recipes for xfce-4.8 to oe-core. Everything 
seems fine so far - except xfwm4. This one drives me totally insane:
If you check the fetch log attched and copy the first url into a browser it 
starts downloading without problems but oe complains.

Could somebody please point me onto what is going wrong - if you need further 
information I'll send...

Andreas

--Boundary-00=_gFKJOg3sNxcGB8v
Content-Type: text/plain;
  charset="UTF-8";
  name="log.do_fetch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="log.do_fetch"

NOTE: fetch http://archive.xfce.org/src/xfce/xfwm4/4.8/xfwm4-4.8.1.tar.bz2
NOTE: fetch http://www.angstrom-distribution.org/unstable/sources/xfwm4-4.8.1.tar.bz2
ERROR: Function 'Fetcher failure for URL: 'http://archive.xfce.org/src/xfce/xfwm4/4.8/xfwm4-4.8.1.tar.bz2'. Unable to fetch URL http://archive.xfce.org/src/xfce/xfwm4/4.8/xfwm4-4.8.1.tar.bz2 from any source.' failed

--Boundary-00=_gFKJOg3sNxcGB8v--
