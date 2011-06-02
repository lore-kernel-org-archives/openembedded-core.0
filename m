Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QS45Y-00084y-AI for openembedded-core@lists.openembedded.org;
	Thu, 02 Jun 2011 11:21:13 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>)
	id 1QS42U-00032L-BX; Thu, 02 Jun 2011 11:18:02 +0200
From: Phil Blundell <pb@pbcl.net>
To: Mark Hatle <mark.hatle@windriver.com>
In-Reply-To: <4DE6AC56.7010308@windriver.com>
References: <1306944074.2529.107.camel@phil-desktop>
	<1306944235.2529.109.camel@phil-desktop>
	<5DBF32A5-22D5-4499-AD32-9C48680B7EBA@dominion.thruhere.net>
	<1306945014.2529.113.camel@phil-desktop> <4DE66D53.30505@windriver.com>
	<1306947245.2529.148.camel@phil-desktop>
	<4DE66FC6.4030607@windriver.com>
	<1306948134.2529.158.camel@phil-desktop>
	<4DE68B24.8060503@windriver.com>
	<1306958566.3119.1.camel@lenovo.internal.reciva.com>
	<4DE6AC56.7010308@windriver.com>
Organization: Phil Blundell Consulting Ltd
Date: Thu, 02 Jun 2011 10:18:01 +0100
Message-ID: <1307006281.2529.169.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: rpmdeps, was Re: dbus-native --with-x
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
X-List-Received-Date: Thu, 02 Jun 2011 09:21:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-06-01 at 16:17 -0500, Mark Hatle wrote:
> I'm not sure if the libraries that RPM uses would even be able to link w/o
> openssl.  (I never tried it.)  But that will affect people who are using RPM
> packages as signing and validation routines come from openssl.

Sure, but if rpmdeps doesn't need those bits then we could have two
recipes: a heavy one for those people who want rpm packages, and a
lighter one for those who need rpmdeps to make package.bbclass work but
don't otherwise have any requirement for rpm.

p.




