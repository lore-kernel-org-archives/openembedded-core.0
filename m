Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1QhkKi-0000kE-2N
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Jul 2011 17:29:40 +0200
Received: (qmail invoked by alias); 15 Jul 2011 15:17:19 -0000
Received: from p5B0A184D.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.24.77]
	by mail.gmx.net (mp011) with SMTP; 15 Jul 2011 17:17:19 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX19+i8oWKg1+FyNb3B2moDIebOQvByLvZDNQTSDLI1
	d5etPH+xHtF2CQ
From: Andreas Mueller <schnitzeltony@gmx.de>
To: "Patches and discussions about the oe-core layer"
	<openembedded-core@lists.openembedded.org>
Date: Fri, 15 Jul 2011 17:19:21 +0200
User-Agent: KMail/1.13.7 (Linux/2.6.35.13-92.fc14.x86_64; KDE/4.6.3; x86_64; ;
	)
References: <cover.1310735644.git.paul.eggleton@linux.intel.com>
	<769b19321ac3436a2b3e2bc7db4204aca0449f94.1310735644.git.paul.eggleton@linux.intel.com>
	<76BA0D0F-4665-4D73-A7F3-C8D4401F5DC2@dominion.thruhere.net>
In-Reply-To: <76BA0D0F-4665-4D73-A7F3-C8D4401F5DC2@dominion.thruhere.net>
MIME-Version: 1.0
Message-Id: <201107151719.22159.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: [PATCH 3/3] classes: remove classes that don't belong in oe-core
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
X-List-Received-Date: Fri, 15 Jul 2011 15:29:40 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Friday, July 15, 2011 04:52:04 PM Koen Kooi wrote:
> Op 15 jul 2011, om 15:17 heeft Paul Eggleton het volgende geschreven:
> > These classes are not used within oe-core and really belong in an upper
> > layer that makes use of them, if they are still useful:
> > 
> > * mozilla.bbclass
> > * openmoko*.bbclass
> > * srec.bbclass
> > * xfce.bbclass
> 
> I'll take patches to add those to meta-xfce and meta-oe if people are
> interested 
Regarding xfce I am interested (working on it currently - anybody else too?). 
But I would like to have a cleaned up version so for me it is not a problem to 
delete xfce.bbclass. 

For xfce I started to put the meta-data in meta-openembedded/meta-xfce. Is that 
OK?

Andreas


