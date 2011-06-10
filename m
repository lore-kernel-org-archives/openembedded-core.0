Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QV2Lh-00067Y-FI for openembedded-core@lists.openembedded.org;
	Fri, 10 Jun 2011 16:06:09 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QV2IU-0000IL-W7
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Jun 2011 16:02:51 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1307478987.15712.60.camel@rex>
References: <1307102133.2529.260.camel@phil-desktop>
	<1307439362.2529.4741.camel@phil-desktop>
	<1307478987.15712.60.camel@rex>
Organization: Phil Blundell Consulting Ltd
Date: Fri, 10 Jun 2011 15:02:50 +0100
Message-ID: <1307714570.25285.8.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH] uclibc: remove PACKAGE_ARCH, fix compilation on i586
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
X-List-Received-Date: Fri, 10 Jun 2011 14:06:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-06-07 at 21:36 +0100, Richard Purdie wrote:
> I'm not against this move at all but before this patch merges we should
> really have a cleanup which removes the *.machine configuration files
> from the uclibc recipe directory along with all the machine specific
> overrides that are in use instead making them arch specific.

Okay, fair enough.  I've resent the other, unrelated changes as separate
patches and we can deal with PACKAGE_ARCH when the time is right.

p.




