Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1R6KDu-0001jO-Bk
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Sep 2011 12:40:14 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1R6K8o-0000bN-4p; Wed, 21 Sep 2011 12:34:58 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 21 Sep 2011 11:34:57 +0100
In-Reply-To: <1316601066-1445-1-git-send-email-koen@dominion.thruhere.net>
References: <1316601066-1445-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1316601298.3510.97.camel@phil-desktop>
Mime-Version: 1.0
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH] bitbake wrapper: Make sure grep runs without colorized output
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
X-List-Received-Date: Wed, 21 Sep 2011 10:40:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-09-21 at 12:31 +0200, Koen Kooi wrote:
> -    PSEUDOBINDIR=`bitbake -e | grep STAGING_BINDIR_NATIVE=\" | cut -d '=' -f2 | cut -d '"' -f2`
> +    PSEUDOBINDIR=`bitbake -e | grep --color=never STAGING_BINDIR_NATIVE=\" | cut -d '=' -f2 | cut -d '"' -f2`
>      ret=$?

That's a GNU extension and won't work on all greps.  How about just
unsetting GREP_OPTIONS, or alternatively replacing that whole pipeline
with awk?

p.




