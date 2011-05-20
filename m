Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QNJW0-0007LJ-9Z for openembedded-core@lists.openembedded.org;
	Fri, 20 May 2011 08:48:52 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QNJTC-0007rG-24
	for openembedded-core@lists.openembedded.org;
	Fri, 20 May 2011 08:45:58 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <836208067c345a911ddb3a266ac398b435054798.1305839225.git.raj.khem@gmail.com>
References: <cover.1305839225.git.raj.khem@gmail.com>
	<836208067c345a911ddb3a266ac398b435054798.1305839225.git.raj.khem@gmail.com>
Date: Fri, 20 May 2011 07:45:52 +0100
Message-ID: <1305873952.18415.249.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH 2/2] opkg-utils: Allow uppercase lettlers in package names
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
X-List-Received-Date: Fri, 20 May 2011 06:48:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-05-19 at 14:09 -0700, Khem Raj wrote:
> Some packages have uppercase letters in their names e.g.
> efikamx kernel. We allow uppercase character with
> uppercase-letters.patch

This is not a good idea.  Uppercase characters have never been permitted
in .deb/.ipk. 

Isn't legitimize_package_name() crunching them to lower case for you?
If not then I think it should be made to do that.

p.




