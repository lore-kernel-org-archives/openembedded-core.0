Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1QrfPJ-0006t4-P8
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Aug 2011 02:15:26 +0200
Received: (qmail invoked by alias); 12 Aug 2011 00:10:53 -0000
Received: from p4FDF1A77.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.223.26.119]
	by mail.gmx.net (mp051) with SMTP; 12 Aug 2011 02:10:53 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX18rC+kSkJIrN0hHvfDTN8TzYB2tEW0uGasjG9zXOr
	C2RV1Zl5To0bPa
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Aug 2011 02:14:10 +0200
User-Agent: KMail/1.13.7 (Linux/2.6.35.13-92.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
MIME-Version: 1.0
Message-Id: <201108120214.10933.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: gcc-cross-initial fails for maiden build
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
X-List-Received-Date: Fri, 12 Aug 2011 00:15:26 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi

I just pulled latest metas, deleted all my temp stuff, start build and get

ERROR: Function 'do_headerfix' failed (see /home/Superandy/tmp/oe-core-
eglibc/work/armv7a-angstrom-linux-gnueabi/gcc-cross-initial-4.5-
r40+svnr176640/temp/log.do_headerfix.25304 for further information)
ERROR: Logfile of failure stored in: /home/Superandy/tmp/oe-core-
eglibc/work/armv7a-angstrom-linux-gnueabi/gcc-cross-initial-4.5-
r40+svnr176640/temp/log.do_headerfix.25304
Log data follows:
| + do_headerfix
| + sed -i '/home/Superandy/tmp/oe-core-eglibc/work-shared/gcc-4.5/gcc-4_5-
branch/gcc/config/*/linux*.h' -e 's#\(GLIBC_DYNAMIC_LINKER[^ ]*\) \( 
*"/lib.*\)/\(.*\)#\1 SYSTEMLIBS_DIR "\3#'
| sed: can't read /home/Superandy/tmp/oe-core-eglibc/work-
shared/gcc-4.5/gcc-4_5-branch/gcc/config/*/linux*.h: No such file or directory
| ERROR: Function 'do_headerfix' failed (see /home/Superandy/tmp/oe-core-
eglibc/work/armv7a-angstrom-linux-gnueabi/gcc-cross-initial-4.5-
r40+svnr176640/temp/log.do_headerfix.25304 for further information)
NOTE: package gcc-cross-initial-4.5-r40+svnr176640: task do_headerfix: Failed

do_headerfix makes 970af6b09e1d69041b0d82fa56ace19543405eb1 suspicious...

Good night

Andreas


