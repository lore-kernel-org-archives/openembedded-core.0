Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RWdIW-0003cy-Tc
	for openembedded-core@lists.openembedded.org;
	Sat, 03 Dec 2011 01:17:45 +0100
Received: (qmail invoked by alias); 03 Dec 2011 00:11:01 -0000
Received: from p5B0A105A.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.16.90]
	by mail.gmx.net (mp017) with SMTP; 03 Dec 2011 01:11:01 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX18nI0Y9uN8n318wviDave3wGEmsGNvSA6QOySWDUa
	8flKgdUiKlv+VT
From: Andreas =?iso-8859-1?q?M=FCller?= <schnitzeltony@gmx.de>
To: openembedded-core@lists.openembedded.org
Date: Sat, 3 Dec 2011 01:11:03 +0100
User-Agent: KMail/1.13.7 (Linux/2.6.35.14-103.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
MIME-Version: 1.0
Message-Id: <201112030111.04094.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Parse error with empty builddir
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
X-List-Received-Date: Sat, 03 Dec 2011 00:17:45 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi

after pulling latest sources (angstrom environment) I get:

Pseudo is not present but is required, building this first before the main build
NOTE: angstrom DOES NOT support libiconv because the eglibc provided iconv 
library is used                                                                                                        
| ETA:  00:01:10
NOTE: angstrom DOES NOT support libiconv because the eglibc provided iconv 
library is used
ERROR: Failure expanding variable PRINC[:=], expression was ${@int(PRINC) + 1} 
which triggered exception NameError: name 'PRINC' is not defined                                                   
| ETA:  00:00:44
ERROR: Command execution failed: Exited with 1
[Superandy@localhost oe-core]$ grep -r PRINC *

It seems contstructs like ${@int(PRINC) + 1}  are common and found in several 
recipes (outside of oe-core). I was out last week and still checking mails: did 
I miss something?

Andreas


