Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RYSoa-0008KN-5G
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Dec 2011 02:30:24 +0100
Received: (qmail invoked by alias); 08 Dec 2011 01:23:34 -0000
Received: from p4FDF0CDD.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.223.12.221]
	by mail.gmx.net (mp008) with SMTP; 08 Dec 2011 02:23:34 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1+YDnUs7b6YjoDXq/fca9zsdiMeCJLwquq5tynFBY
	d+X6pCzcB0R8Ds
From: Andreas =?utf-8?q?M=C3=BCller?= <schnitzeltony@gmx.de>
To: "Patches and discussions about the oe-core layer"
	<openembedded-core@lists.openembedded.org>
Date: Thu, 8 Dec 2011 02:23:41 +0100
User-Agent: KMail/1.13.7 (Linux/2.6.35.14-103.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
References: <1323279247.30601.51.camel@ted>
	<201112080053.11966.schnitzeltony@gmx.de>
	<1323302508.971.0.camel@ted>
In-Reply-To: <1323302508.971.0.camel@ted>
MIME-Version: 1.0
Message-Id: <201112080223.41629.schnitzeltony@gmx.de>
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
X-List-Received-Date: Thu, 08 Dec 2011 01:30:24 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit

On Thursday, December 08, 2011 01:01:48 AM Richard Purdie wrote:
> > dbus still needs manual call of
> > 
> > 	chown messagebus:messagebus /var/run/dbus /var/lib/dbus
> > 
> > ( it is root:root on my image) and
> > 
> > 	chown root:messagebus /usr/libexec/dbus-daemon-launch-helper
> > 
> > ( it is avahi:netdev on my image )
> > 
> > Does this one fix it?
> > To test: Is it enough to rebuild dbus?
> 
> It could well do. You just need to apply the patch and rebuild the
> image.
> 
I've tested the patch and seems not to fix dbus issues:

/var/run/dbus -> root:root
/var/lib/dbus -> 70:netdev
/usr/libexec/dbus-daemon-launch-helper -> root:netdev

Andreas


