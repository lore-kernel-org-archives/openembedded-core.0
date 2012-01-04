Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RiU0y-0004x5-JD
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jan 2012 17:48:36 +0100
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RiTtt-0002P2-20
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jan 2012 17:41:17 +0100
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 04 Jan 2012 16:41:16 +0000
In-Reply-To: <CABcZANmEZ6Oy6q7gL2WCCtphSA7fEHJsM0dre0tNpXvPdn2crQ@mail.gmail.com>
References: <1325689535.28005.59.camel@phil-desktop>
	<1325691189.20759.14.camel@ted>
	<CAEsOVNcsY-dNYBz1Y6BVAQ-N7hVyaxOMcsniev9z455m9GYh5A@mail.gmail.com>
	<CABcZANmEZ6Oy6q7gL2WCCtphSA7fEHJsM0dre0tNpXvPdn2crQ@mail.gmail.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1325695277.28005.76.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: sstate compression
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
X-List-Received-Date: Wed, 04 Jan 2012 16:48:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-01-04 at 09:32 -0700, Chris Larson wrote:
> Agreed. Sstate can get truly massive, being able to opt-into xz or
> something would be lovely for us as well.

Yes, that would be nice.  xz does seem to compress nearly twice as well
as "gzip -9", though it takes about six times as long to do it.  (16M
and 55 seconds vs 28M and 9.5 seconds for my webkit testcase.)
Personally I don't care about the disk space as much as the build time,
but I can see that sstate could start to become quite unwieldy if you
have a lot of packages in there.

Alternatively, maybe we could have sstate.bbclass accept multiple
compression types when reading (i.e. look for .tar.xz, .tar.gz, .tar.lzo
etc in turn), make it use the fastest reasonable compression when
generating the archives in the first place, and then folks who want to
either put them into long-term storage or send them over slow links can
post-process the sstate-cache by transcoding them into .xz or whatever
format.

p.




