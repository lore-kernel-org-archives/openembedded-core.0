Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1Qe2pq-0005J1-CV for openembedded-core@lists.openembedded.org;
	Tue, 05 Jul 2011 12:26:30 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>) id 1Qe2mB-0001Eo-Jy
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Jul 2011 12:22:43 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 05 Jul 2011 11:22:42 +0100
In-Reply-To: <0C757E680E33864AB113392C7E83F910BE5196@GSX300A.mxchg.m.corp>
References: <1865303E0DED764181A9D882DEF65FB6A167F0C70B@shsmsx502.ccr.corp.intel.com>
	<4E095480.3070001@windriver.com><1309266943.20015.290.camel@rex>
	<4E09E8B7.1070901@windriver.com>
	<0C757E680E33864AB113392C7E83F910BE518E@GSX300A.mxchg.m.corp>
	<1865303E0DED764181A9D882DEF65FB6A200B1C937@shsmsx502.ccr.corp.intel.com>
	<CACzvQmYM-Tn0xWL9Hc3hyn8EEUeZjbkfTDOYskETJrq7=TB77A@mail.gmail.com>
	<0C757E680E33864AB113392C7E83F910BE5196@GSX300A.mxchg.m.corp>
Organization: Phil Blundell Consulting Ltd
X-Mailer: Evolution 3.0.2- 
Message-ID: <1309861363.19115.7.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [Draft design][RFC] Running postinst at rootfs generation time
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
X-List-Received-Date: Tue, 05 Jul 2011 10:26:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-07-05 at 12:06 +0200, Hauser, Wolfgang (external) wrote:
> Especially we have to cover some adduser/addgroup issues, modify the volatile file handling for our needs, and for omap3 graphics the handling of the GLES version.
> A failed offline postinst causing a runtime configuration. So the image generation log has to be checked for such failing scripts.

Nowadays you can set IMAGE_FEATURES = "read-only-rootfs", which will
result in a fatal error if any packages are still unconfigured after
rootfs construction is finished.

p.




