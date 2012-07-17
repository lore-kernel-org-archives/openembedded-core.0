Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1SrGTD-0002V9-Vd
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jul 2012 00:42:20 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1SrGII-000446-4j; Wed, 18 Jul 2012 00:31:02 +0200
Message-ID: <1342564161.6448.38.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, Damien Lespiau
	<damien.lespiau@intel.com>
Date: Tue, 17 Jul 2012 23:29:21 +0100
In-Reply-To: <1342563792-17634-1-git-send-email-damien.lespiau@gmail.com>
References: <1342563792-17634-1-git-send-email-damien.lespiau@gmail.com>
X-Mailer: Evolution 3.4.3-1 
Mime-Version: 1.0
Subject: Re: [PATCH] eglic: Update the svn URL
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
X-List-Received-Date: Tue, 17 Jul 2012 22:42:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-07-17 at 23:23 +0100, Damien Lespiau wrote:
> -SRC_URI = "svn://www.eglibc.org/svn/branches/;module=${EGLIBC_BRANCH};protocol=http \
> +SRC_URI = "http://www.eglibc.org/svn/branches/;module=${EGLIBC_BRANCH};protocol=http \

Er, really?  Isn't "protocol=http" enough to get the svn fetcher to use
http?  What version of bitbake do you have?

I'm slightly surprised that "http://" even works here since there is no
obvious clue to bitbake that it ought to be using svn for that URI.
Won't that just give you a download of the html index page? 

p.




