Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1Qojgj-0004PD-1g
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Aug 2011 00:13:17 +0200
Received: (qmail invoked by alias); 03 Aug 2011 22:08:54 -0000
Received: from p4FDF1F1E.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.223.31.30]
	by mail.gmx.net (mp071) with SMTP; 04 Aug 2011 00:08:54 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX18YqssXzXsYiiXD10Sz53hCxR6Pj6kCcFIb0bCkBb
	Oe24KpzxME9gig
From: Andreas Mueller <schnitzeltony@gmx.de>
To: "Patches and discussions about the oe-core layer"
	<openembedded-core@lists.openembedded.org>
Date: Thu, 4 Aug 2011 00:11:51 +0200
User-Agent: KMail/1.13.7 (Linux/2.6.35.13-92.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
MIME-Version: 1.0
Message-Id: <201108040011.52049.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Howto pin u-boot to a version supplied by oe-core
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
X-List-Received-Date: Wed, 03 Aug 2011 22:13:17 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

for gumstix overo I am in the lucky situation that vanilla u-boot v2011.03 ( and 
maybe later version too ) meets my needs.

My current approach (in angstrom environment) was quick but poor: I simply 
copied here and there without reusing anything [1].

To improve I checked u-boot_2011.03 shipped by oe-core and think that one 
exactly builds what I need - without bbappend.

So I tried in overo.conf to pin by "PREFERRED_VERSION_u-boot=":

1. "2011.03"
2. "v2011.03"
3. "v2011.03+git19b54a701811220221fc4d5089a2bb18892018ca"
4. "v2011.03+git7+19b54a701811220221fc4d5089a2bb18892018ca"

got messages like 
NOTE: preferred version 2011.03 of u-boot not available (for item u-boot)
NOTE: versions of u-boot available: git 
v2011.03+git7+19b54a701811220221fc4d5089a2bb18892018ca 
v2011.06+git7+b1af6f532e0d348b153d5c148369229d24af361a
NOTE: Resolving any missing task queue dependencies
NOTE: preferred version 2011.03 of u-boot not available (for item u-boot)
NOTE: versions of u-boot available: git 
v2011.03+git7+19b54a701811220221fc4d5089a2bb18892018ca 
v2011.06+git7+b1af6f532e0d348b153d5c148369229d24af361a
NOTE: preferred version 2011.03 of u-boot not available (for item u-boot-dev)
NOTE: versions of u-boot available: git 
v2011.03+git7+19b54a701811220221fc4d5089a2bb18892018ca 
v2011.06+git7+b1af6f532e0d348b153d5c148369229d24af361a

and builds of
meta-texasinstruments/recipes-bsp/u-boot/u-boot_git.bb


How can I get the desired oe-core u-boot recipe pinned to reduce code 
redundancies?

Cheers

Andreas

[1] https://gitorious.org/schnitzeltony-oe-meta/meta-
gumstix/trees/master/recipes-bsp/u-boot



