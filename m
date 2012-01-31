Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RsBO2-00078r-FL
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jan 2012 11:56:30 +0100
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RsBGQ-0002xw-75
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jan 2012 11:48:38 +0100
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 31 Jan 2012 10:48:37 +0000
In-Reply-To: <79a999f69d58ca98393991d18d0efd274932ff56.1327980240.git.sgw@linux.intel.com>
References: <cover.1327980240.git.sgw@linux.intel.com>
	<79a999f69d58ca98393991d18d0efd274932ff56.1327980240.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1328006918.29933.91.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [CONSOLIDATED PULL 16/19] tunearch/arm: Differentiate between thumb code generation and thumb capability
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
X-List-Received-Date: Tue, 31 Jan 2012 10:56:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-01-30 at 20:13 -0800, Saul Wold wrote:
> We have diverged a bit from oe.dev where thumb in OVERRIDES meant
> the code was being compiled in thumb mode. With tunearch this got
> a different meaning where it meant that if a core is capable of
> generating thumb code them we will have this in overrides. With this
> patch I am trying to address the problem where 'thumbmode' in TUNE_FEATURES
> means that code will be compiled in thumb mode by default and
> 'thumb' is to denote that core is capable of thumb instruction set.

So this patch is changing the meaning of the "thumb" override in
oe-core, right?  Is that really a good idea?

Also, I'm not quite sure I understand what the "thumb" tuning would be
useful for when this patch is applied.  You seem to have removed most of
the code which checks for "thumb" in TUNE_FEATURES which seems to leave
it not doing anything very much.

Can you clarify what exactly is the problem that this patch is solving,
what the old and new semantics of the overrides and tune flags are, and
why it's an improvement?

p.




