Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QUyIz-0006nq-9g for openembedded-core@lists.openembedded.org;
	Fri, 10 Jun 2011 11:47:05 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QUyFn-0000Ei-0o
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Jun 2011 11:43:47 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1307697909.2529.4983.camel@phil-desktop>
References: <cover.1307686598.git.sgw@linux.intel.com>
	<79966738c56b3d8dbcb262642447f9efe7af930a.1307686610.git.sgw@linux.intel.com>
	<1307697909.2529.4983.camel@phil-desktop>
Organization: Phil Blundell Consulting Ltd
Date: Fri, 10 Jun 2011 10:43:40 +0100
Message-ID: <1307699021.2529.4986.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [CONSOLIDATED PULL 4/4] multiple recipes converted to -staticdev packages
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
X-List-Received-Date: Fri, 10 Jun 2011 09:47:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-06-10 at 10:25 +0100, Phil Blundell wrote:
> This can't be right.  I guess that would be a good thing for
> recipe-sanity to test for in fact.

... except that this wouldn't have helped because oe-core doesn't
currently have recipe_sanity at all.  Heh.  I'll send a patch for that
later, and then maybe we can add the bogus DEPENDS checking as a future
enhancement.

p.




