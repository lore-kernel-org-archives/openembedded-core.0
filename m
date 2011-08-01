Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QntaB-00043r-3m
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Aug 2011 16:35:03 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QntW1-0001v6-8e
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Aug 2011 16:30:45 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 01 Aug 2011 15:30:44 +0100
In-Reply-To: <1312208500-13381-1-git-send-email-galak@kernel.crashing.org>
References: <1312208500-13381-1-git-send-email-galak@kernel.crashing.org>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1312209045.30326.515.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH] gcc: Add ability for tune files to pass in configure options to gcc
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
X-List-Received-Date: Mon, 01 Aug 2011 14:35:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-08-01 at 09:21 -0500, Kumar Gala wrote:
> Added a ${GCC_EXTRA_OECONF} to the the building up of gcc's
> ${EXTRA_OECONF}.  This is similar to what we have in the glibc recipe
> files.
> 
> This allows for a tune file to add something like:
> 
> GCC_EXTRA_OECONF += "--with-cpu=e5500"
> 
> If needed.
> 
> Signed-off-by: Kumar Gala <galak@kernel.crashing.org>

Why is that desirable?  From the looks of that patch it will affect
gcc-cross as well as target gcc and, if you're going to do this, I think
you need to find some way to disambiguate the resulting compilers.
Otherwise there is going to be no way to predict what options ${CC} was
built with.  

Even for the on-target gcc case, if you are going to start putting
MACHINE-specific variables into the configure commandline then you need
to make sure that the output packages have an appropriate Architecture.
I don't think that's going to be the case at the moment.

p.




