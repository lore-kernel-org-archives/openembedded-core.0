Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QNRFr-0000rm-GK for openembedded-core@lists.openembedded.org;
	Fri, 20 May 2011 17:04:43 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QNRD2-00083z-Q7
	for openembedded-core@lists.openembedded.org;
	Fri, 20 May 2011 17:01:48 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1305873952.18415.249.camel@lenovo.internal.reciva.com>
References: <cover.1305839225.git.raj.khem@gmail.com>
	<836208067c345a911ddb3a266ac398b435054798.1305839225.git.raj.khem@gmail.com>
	<1305873952.18415.249.camel@lenovo.internal.reciva.com>
Organization: Phil Blundell Consulting Ltd
Date: Fri, 20 May 2011 16:01:47 +0100
Message-ID: <1305903707.2525.29.camel@phil-desktop>
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
X-List-Received-Date: Fri, 20 May 2011 15:04:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-05-20 at 07:45 +0100, Phil Blundell wrote:
> On Thu, 2011-05-19 at 14:09 -0700, Khem Raj wrote:
> > Some packages have uppercase letters in their names e.g.
> > efikamx kernel. We allow uppercase character with
> > uppercase-letters.patch
> 
> This is not a good idea.  Uppercase characters have never been permitted
> in .deb/.ipk. 
> 
> Isn't legitimize_package_name() crunching them to lower case for you?
> If not then I think it should be made to do that.

I just checked the code and it certainly looks like it should be doing
that:

	# Remaining package name validity fixes
	return s.lower().replace('_', '-').replace('@', '+').replace(',', '+').replace('/', '-')

So if that isn't working for you then I think it needs a bit of
debugging.

p.




