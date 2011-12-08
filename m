Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RYnO5-0007oG-AV
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Dec 2011 00:28:25 +0100
Received: (qmail invoked by alias); 08 Dec 2011 23:21:35 -0000
Received: from p5B0A2C51.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.44.81]
	by mail.gmx.net (mp070) with SMTP; 09 Dec 2011 00:21:35 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX18TIPRpqkMTyF/gUsi7XV4rrK3lu49ZaqFQ6Xl6aC
	JN2bDlaIPm272V
From: Andreas =?iso-8859-1?q?M=FCller?= <schnitzeltony@gmx.de>
To: "Patches and discussions about the oe-core layer"
	<openembedded-core@lists.openembedded.org>
Date: Fri, 9 Dec 2011 00:21:41 +0100
User-Agent: KMail/1.13.7 (Linux/2.6.35.14-103.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
References: <1323279247.30601.51.camel@ted>
	<20111208070548.GB3761@jama.jama.net>
	<4EE0DA76.8060807@windriver.com>
In-Reply-To: <4EE0DA76.8060807@windriver.com>
MIME-Version: 1.0
Message-Id: <201112090021.41843.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: [PATCH] bitbake.conf/image.bbclass: Ensure images use the correct passwd/group files
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
X-List-Received-Date: Thu, 08 Dec 2011 23:28:25 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Thursday, December 08, 2011 04:40:38 PM Mark Hatle wrote:
> Andreas: What packaging type are you using?
> 
> I know that RPM never uses the uid/gid, it always does a look up.  If the
> look up fails it then falls back to "root".  So you should never see
> something like a 70, unless there is a manual chown/grp somewhere making
> the change.
> 
> opkg had a bug before where it only used the uid/gid number, I know Richard
> patched that -- but I'm not sure what happens if the look up fails.  It may
> fall back to the embedded numeric ids.  If that is the case, the real
> issue may simply be that the uname/gname hasn't yet made it into the
> passwd/group files.
> 
> If you are using opkg, try switching to RPM and see if the behavior on
> these files changes, if it does what the new value is.
I am using opkg - will try RPM when I have time next week.

Andreas


