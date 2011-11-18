Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RRLQM-0002rB-J2
	for openembedded-core@lists.openembedded.org;
	Fri, 18 Nov 2011 11:11:58 +0100
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RRLKA-00016D-Sd
	for openembedded-core@lists.openembedded.org;
	Fri, 18 Nov 2011 11:05:35 +0100
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 18 Nov 2011 10:05:28 +0000
In-Reply-To: <1321575634-24108-1-git-send-email-raj.khem@gmail.com>
References: <1321575634-24108-1-git-send-email-raj.khem@gmail.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1321610734.29435.195.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH] gcc-4.6: Fix gcc ICE on qt4-x11-free/armv7-a
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
X-List-Received-Date: Fri, 18 Nov 2011 10:11:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-11-17 at 16:20 -0800, Khem Raj wrote:
> Backport fix for PR 47551 fixes the ICE seen on armv7-a/qt4-x11-free
> Bump up SRCREV past gcc 4.6.2 release

I thought it was our policy to keep SRCREV aligned with releases as far
as possible rather than jumping to some random-ish checkin.  Are you
saying that the fix for the ice requires both the patch and the SRCREV
update?

p.




