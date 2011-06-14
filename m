Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QWQAC-0004eU-Ef for openembedded-core@lists.openembedded.org;
	Tue, 14 Jun 2011 11:44:00 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QWQ6q-00041q-FE
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Jun 2011 11:40:32 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1308029130-29774-1-git-send-email-raj.khem@gmail.com>
References: <1308029130-29774-1-git-send-email-raj.khem@gmail.com>
Organization: Phil Blundell Consulting Ltd
Date: Tue, 14 Jun 2011 10:40:31 +0100
Message-ID: <1308044431.25285.237.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH] allarch.bbclass: Set FEED_ARCH to 'allarch'
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
X-List-Received-Date: Tue, 14 Jun 2011 09:44:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-06-13 at 22:25 -0700, Khem Raj wrote:
> PACKAGE_ARCH is set to BASE_PACKAGE_ARCH so we do not
> need to define it here since we already define BASE_PACKAGE_ARCH
> 
> Additionally set FEED_ARCH to 'allarch' some distros e.g.
> angstrom sets FEED_ARCH like
> 
> FEED_ARCH ?= "${BASE_PACKAGE_ARCH}"

Um?  Surely if FEED_ARCH is defined in terms of B_P_A then just setting
the latter variable ought to be enough.  Why do you need to set both?

> and 'all' doesnt go well for FEED_ARCH as it ends up with
> parsing error for x86 machines.

That sounds a bit odd as well.  I wouldn't have expected any value of
FEED_ARCH to result in parsing errors.  What actually goes wrong?

p.

> 
> This might be a latent bug in bitbake but allarch.bbclass
> excavated it and we burry it in the same class.
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/classes/allarch.bbclass |    5 ++---
>  1 files changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/classes/allarch.bbclass b/meta/classes/allarch.bbclass
> index e3ac392..971cb92 100644
> --- a/meta/classes/allarch.bbclass
> +++ b/meta/classes/allarch.bbclass
> @@ -2,9 +2,8 @@
>  # This class is used for architecture independent recipes/data files (usally scripts)
>  #
>  
> -BASE_PACKAGE_ARCH = "all"
> -PACKAGE_ARCH = "all"
> -
> +BASE_PACKAGE_ARCH = "allarch"
> +FEED_ARCH = "allarch"
>  # No need for virtual/libc or a cross compiler
>  INHIBIT_DEFAULT_DEPS = "1"
>  




