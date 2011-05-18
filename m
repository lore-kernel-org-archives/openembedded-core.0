Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QMn91-0000u4-12 for openembedded-core@lists.openembedded.org;
	Wed, 18 May 2011 22:14:59 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QMn6E-00070D-6t
	for openembedded-core@lists.openembedded.org;
	Wed, 18 May 2011 22:12:06 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <BANLkTinwdO5XBGH=py2iw0kyJt6o77q7rw@mail.gmail.com>
References: <cover.1305665459.git.raj.khem@gmail.com>
	<cc2e6337ae338737455bf63bd43278dee302fb5c.1305665459.git.raj.khem@gmail.com>
	<1305734038.18415.108.camel@lenovo.internal.reciva.com>
	<BANLkTikiNW0UEfLM_UtKeekTcrW5UNNfUA@mail.gmail.com>
	<1305738527.18415.126.camel@lenovo.internal.reciva.com>
	<8A91C5F6-313A-4A0F-A18E-094CFC3BB337@dominion.thruhere.net>
	<BANLkTinvqEeyXsiH79UHb3Zhx+qkXZRJ5w@mail.gmail.com>
	<BANLkTinwdO5XBGH=py2iw0kyJt6o77q7rw@mail.gmail.com>
Date: Wed, 18 May 2011 21:12:00 +0100
Message-ID: <1305749520.18415.167.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH 1/1] default-distrovars.inc, task-core-boot.bb: Create distro overridable varibales
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
X-List-Received-Date: Wed, 18 May 2011 20:14:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-05-18 at 11:07 -0700, Khem Raj wrote:
> there are certain common parts that can be abstracted
> and can be maintained in oe-core so everyone benefits
> from it and certain image specific parts can be done in
> distros. So keeping common parts in core would still
> be better IMO

Which are the common parts you're thinking of?  I'm not sure there's
anything in task-core-boot which all distros are guaranteed to want.  If
we're basically going to end up with a recipe which is just a list of
distro-defined variable substitutions then it seems to me that a more
readable way to achieve the same end is just to have the distro provide
the recipe in the first place.

p.




