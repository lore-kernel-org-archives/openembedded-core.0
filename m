Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QTskp-0006ji-6g for openembedded-core@lists.openembedded.org;
	Tue, 07 Jun 2011 11:39:19 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QTshg-0006lM-6E
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Jun 2011 11:36:04 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1307102133.2529.260.camel@phil-desktop>
References: <1307102133.2529.260.camel@phil-desktop>
Organization: Phil Blundell Consulting Ltd
Date: Tue, 07 Jun 2011 10:36:02 +0100
Message-ID: <1307439362.2529.4741.camel@phil-desktop>
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
X-List-Received-Date: Tue, 07 Jun 2011 09:39:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Ping?

p.

On Fri, 2011-06-03 at 12:55 +0100, Phil Blundell wrote:
> There is no good reason for uclibc to be machine specific.  Remove local
> assignment to PACKAGE_ARCH so that it gets the default target
> architecture and bump PR for that change.
> 
> See http://lists.linuxtogo.org/pipermail/openembedded-core/2011-May/003064.html
> 
> Also replace a chunk of anonymous python with a COMPATIBLE_HOST
> declaration.
> 
> Signed-off-by: Phil Blundell <philb@gnu.org>




