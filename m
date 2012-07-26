Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1SuTSx-0007jL-9P
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 21:11:19 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1SuTHq-0007kF-FJ
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 20:59:50 +0200
Message-ID: <1343329086.4470.56.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 26 Jul 2012 19:58:06 +0100
In-Reply-To: <1343328564-3644-1-git-send-email-sgw@linux.intel.com>
References: <1343328564-3644-1-git-send-email-sgw@linux.intel.com>
X-Mailer: Evolution 3.4.3-1 
Mime-Version: 1.0
Subject: Re: [PATCH] package.bbclass: Let pn be eglibc for eglibc-locale
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
X-List-Received-Date: Thu, 26 Jul 2012 19:11:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-07-26 at 11:49 -0700, Saul Wold wrote:
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index 0c7fe80..06e2e04 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -389,6 +389,8 @@ python package_do_split_locales() {
>  
>      dvar = d.getVar('PKGD', True)
>      pn = d.getVar('PN', True)
> +    if pn == "eglibc-locale":
> +        pn = "eglibc"

Bletch!  There must surely be some way to solve this problem without
hacking recipe names into package.bbclass.

p.




