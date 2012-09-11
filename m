Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TBV9w-0004Rj-Jw
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 20:26:04 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1TBUxr-0000Tv-NV; Tue, 11 Sep 2012 20:13:35 +0200
Message-ID: <1347387090.29443.36.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 11 Sep 2012 19:11:30 +0100
In-Reply-To: <CA+chaQdNwKQQg9d3hUK-XMQP-d21nBFxpic78yWmrJrWe=-o-w@mail.gmail.com>
References: <1347386679.29443.33.camel@x121e.pbcl.net>
	<CA+chaQdNwKQQg9d3hUK-XMQP-d21nBFxpic78yWmrJrWe=-o-w@mail.gmail.com>
X-Mailer: Evolution 3.4.3-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] eglibc: Restore ${PN} to before ${PN}-dev in PACKAGES
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Sep 2012 18:26:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Ah right, yeah, I guess so.  Thanks, I'll re-send.

Do we have any roadmap for getting to a point where we don't need to
keep bumping PR by hand anymore?

p.

On Tue, 2012-09-11 at 20:09 +0200, Martin Jansa wrote:
> Missing PR bumps?
> 
> On Tue, Sep 11, 2012 at 8:04 PM, Phil Blundell <philb@gnu.org> wrote:
> > Commit 13544fbc6217fee1731a6da1e2cf94901a500842 changed the ordering
> > of PACKAGES so that ${PN}-dev came before ${PN}.  However, this caused
> > the FILES matching to go wrong if ${libdir} == ${base_libdir}.  Fix this
> > by moving ${PN} ahead of ${PN}-dev once again.




