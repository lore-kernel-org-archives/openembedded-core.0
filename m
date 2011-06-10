Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QV2Zc-0006JP-Mj for openembedded-core@lists.openembedded.org;
	Fri, 10 Jun 2011 16:20:32 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QV2WQ-0000Im-71
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Jun 2011 16:17:14 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1307667467-467-2-git-send-email-raj.khem@gmail.com>
References: <1307667467-467-1-git-send-email-raj.khem@gmail.com>
	<1307667467-467-2-git-send-email-raj.khem@gmail.com>
Organization: Phil Blundell Consulting Ltd
Date: Fri, 10 Jun 2011 15:17:13 +0100
Message-ID: <1307715433.25285.18.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH 2/2] sysklogd.inc: Check for package-management in IMAGE_FEATURES
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
X-List-Received-Date: Fri, 10 Jun 2011 14:20:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-06-09 at 17:57 -0700, Khem Raj wrote:
> -RDEPENDS_${PN}_append = " ${@base_conditional("ONLINE_PACKAGE_MANAGEMENT", "none", "", "update-rc.d", d)}"
> +RDEPENDS_${PN}_append = " ${@oe.utils.contains("IMAGE_FEATURES", "package-management", "update-rc.d", "", d)}"

This sort of thing shouldn't be necessary in oe-core.  See previous
discussions between me and Richard as to why IMAGE_FEATURES is not the
right thing, and code in package_ipk.bbclass which ought to be taking
care of it.  If you're using a different package manager then it should
be fairly straightforward to adapt that logic to suit.

You're right though the the reference to O_P_M is clearly wrong and
should be removed.  I'm not quite sure how that got in there in the
first place; must have been some oversight during patch review I guess.

p.




