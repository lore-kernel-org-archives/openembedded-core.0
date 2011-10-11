Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <Schnitzeltony@gmx.de>) id 1RDaVx-0002rU-0X
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Oct 2011 13:28:53 +0200
Received: (qmail 9403 invoked by uid 0); 11 Oct 2011 11:23:08 -0000
Received: from 95.222.156.232 by www023.gmx.net with HTTP;
	Tue, 11 Oct 2011 13:23:06 +0200 (CEST)
Date: Tue, 11 Oct 2011 13:23:06 +0200
From: =?iso-8859-1?Q?=22Andreas_M=FCller=22?= <Schnitzeltony@gmx.de>
In-Reply-To: <DDA1B8C5-0867-406F-BB88-0D33B7501900@dominion.thruhere.net>
Message-ID: <20111011112306.15960@gmx.net>
MIME-Version: 1.0
References: <DDA1B8C5-0867-406F-BB88-0D33B7501900@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org, schnitzeltony@gmx.de
X-Authenticated: #62780362
X-Flags: 0001
X-Mailer: WWW-Mail 6100 (Global Message Exchange)
X-Priority: 3
X-Provags-ID: V01U2FsdGVkX18sZqIRQeUsGted99SPvJgKD2iCQePz8UXJ9v0nxh
	BfSUpCYlTgMafjpT/mCHfpx0UB8ypYv5Od8Q== 
X-GMX-UID: IxWtewdLeWUocaKSznZzuQ0xU3U4Nw9k
Subject: Re: How to overlay files/fs-perms.txt?
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
X-List-Received-Date: Tue, 11 Oct 2011 11:28:53 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

See

I guess it is found in line 553 of oe-core package.bbclass

fs_perms_tables = bb.data.getVar('FILESYSTEM_PERMS_TABLES', d, True)

Andreas
-------- Original-Nachricht --------
> Datum: Tue, 11 Oct 2011 12:42:01 +0200
> Von: Koen Kooi <koen@dominion.thruhere.net>
> An: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
> Betreff: [OE-core] How to overlay files/fs-perms.txt?

> Hi,
> 
> In angstrom we have base-files overlayed to clean out /var and
> files/fs-perms.txt is getting in the way of that:
> 
> koen@dominion:/OE/tentacle/sources/openembedded-core/meta$ grep localstate
> files/fs-perms.txt 
> ${localstatedir}/cache	link	volatile/cache
> ${localstatedir}/run	link	volatile/run
> ${localstatedir}/log	link	volatile/log
> ${localstatedir}/lock	link	volatile/lock
> ${localstatedir}/tmp	link	volatile/tmp
> 
> In angstrom those aren't symlinks anymore, but tmpfs bind mounts managed
> by systemd.
> 
> So, how doI overlay that file in this oe-core layer universe?
> 
> regards,
> 
> Koen
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
NEU: FreePhone - 0ct/min Handyspartarif mit Geld-zurück-Garantie!		
Jetzt informieren: http://www.gmx.net/de/go/freephone


