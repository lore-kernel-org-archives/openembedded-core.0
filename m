Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RYxpL-00039J-1o
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Dec 2011 11:37:17 +0100
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RYxik-0002YV-Lk
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Dec 2011 11:30:26 +0100
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 09 Dec 2011 10:30:25 +0000
In-Reply-To: <F51D9870-839E-4A3F-8B95-5B22B288BF46@dominion.thruhere.net>
References: <cover.1323327959.git.xiaofeng.yan@windriver.com>
	<7ceb01f6db6edfad6c78c5a7ebc685c23bb11358.1323327959.git.xiaofeng.yan@windriver.com>
	<67C6F211-C6C2-4655-889A-A254F4E0D7D9@dominion.thruhere.net>
	<1323363345.5309.42.camel@ted>
	<1323364334.26081.383.camel@phil-desktop>
	<1323381564.5309.65.camel@ted>
	<CB3A9DC8-124F-4314-A7B5-17C34B59E9D0@dominion.thruhere.net>
	<1323425298.26081.409.camel@phil-desktop>
	<F51D9870-839E-4A3F-8B95-5B22B288BF46@dominion.thruhere.net>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1323426626.26081.414.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH 04/10] gtk.inc: add feature based on directfb
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
X-List-Received-Date: Fri, 09 Dec 2011 10:37:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-12-09 at 11:25 +0100, Koen Kooi wrote:
> gtk 2.x is one of the few places where directfb/x11/whatever conflict,
> so if I want directfb support for sane things (gtk 3.x, qt, etc) the
> current patch will make me jump through a ton of hoops.

Well, you can set:

# support both graphical backends where possible
DISTRO_FEATURES = "directfb x11"

# for gtk+ 2.x, have to pick either x11 or directfb not both
PACKAGECONFIG_pn-gtk+ = "x11"

in your distro config.  I don't think that one extra line really counts
as a "ton of hoops", and if you aren't using gtk+ 2.0 then you can just
leave it out.

p.




