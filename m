Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QrUGb-0006mL-NF
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Aug 2011 14:21:41 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QrUCB-0006NN-Co
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Aug 2011 14:17:07 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 11 Aug 2011 13:17:01 +0100
X-Mailer: Evolution 3.0.2- 
Message-ID: <1313065027.6733.127.camel@phil-desktop>
Mime-Version: 1.0
Subject: X11 as DISTRO_FEATURE
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
X-List-Received-Date: Thu, 11 Aug 2011 12:21:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Right now, there are a bunch of recipes (e.g. dbus, cairo) which always
build against X11 even though the underlying software can work without
it.  This makes it somewhat painful to build a display system using
clutter (for example) without X.

It's also moderately fiddly to stop X11 from leaking in by mistake; you
can't just BBMASK the whole of "xorg-*" because things like pixman are
still needed by cairo even when not using X11.

So, to combat this, I would like to make X11 be a DISTRO_FEATURE and
arrange for:

a) libx11 to skip itself; and

b) recipes for which x11 is optional to not depend on X stuff 

if that feature isn't selected.

Any objections, better suggestions, ...?

p.




