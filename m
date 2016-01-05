Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 8B08D731F4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jan 2016 22:04:55 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25] helo=e130.local)
	by hetzner.pbcl.net with esmtpsa (TLS1.2:RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1aGZio-0001VO-V4; Tue, 05 Jan 2016 23:04:55 +0100
Message-ID: <1452031483.2002.104.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Matthias Schiffer <mschiffer@universe-factory.net>
Date: Tue, 05 Jan 2016 22:04:43 +0000
In-Reply-To: <568AF44A.2040804@universe-factory.net>
References: <c00e9825d8e0221666adffd95ed157f9affe06b8.1451778497.git.mschiffer@universe-factory.net>
	<7ef127138c4ba5c89b42b892c84aaa7766f78a4c.1451778497.git.mschiffer@universe-factory.net>
	<1451826066.2002.96.camel@pbcl.net>
	<568AF44A.2040804@universe-factory.net>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 3/3] base-files: create typical merged /usr symlinks if the "merged-usr" distro feature is set
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Jan 2016 22:04:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2016-01-04 at 23:38 +0100, Matthias Schiffer wrote:
> Of course, the alternative would be to force such distros to
> override the bases-files recipe in a .bbappend.

I don't think this would be an especially big deal.  The whole contents
of base-files is already fairly distro-specific and almost any
non-trivial distro is probably going to be either adjusting or replacing
that recipe anyway.

Alternatively, one could argue that these symlinks have nothing much to
do with the rest of base-files and they should go in a completely
separate recipe which the distro could add to IMAGE_INSTALL if it
wished.  That might be even better.

p.



