Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QSRyh-0005Re-3z for openembedded-core@lists.openembedded.org;
	Fri, 03 Jun 2011 12:51:43 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QSRvc-0003Yo-Ns
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Jun 2011 12:48:32 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1307043926-18177-1-git-send-email-raj.khem@gmail.com>
References: <1307043926-18177-1-git-send-email-raj.khem@gmail.com>
Organization: Phil Blundell Consulting Ltd
Date: Fri, 03 Jun 2011 11:48:31 +0100
Message-ID: <1307098111.2529.254.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH 1/2] allarch.bbclass: Define BASE_PACKAGE_ARCH = "all"
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
X-List-Received-Date: Fri, 03 Jun 2011 10:51:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-06-02 at 12:45 -0700, Khem Raj wrote:
> +BASE_PACKAGE_ARCH = "all"
>  PACKAGE_ARCH = "all"

Is it necessary to define both of those?  bitbake.conf does:

PACKAGE_ARCH = "${BASE_PACKAGE_ARCH}"

so it seems like, if setting B_P_A is the right thing to do, there
should be no need to set PACKAGE_ARCH as well.

I don't understand the semantics of those two variables well enough to
say whether setting BASE_PACKAGE_ARCH here is actually the right thing
or not.  Is there any documentation anywhere which describes what
exactly the relation is meant to be between B_P_A and P_A, and when it's
appropriate to set each of them?

p.




