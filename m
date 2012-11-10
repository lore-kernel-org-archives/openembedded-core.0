Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TX9Bt-0001FX-AW
	for openembedded-core@lists.openembedded.org;
	Sat, 10 Nov 2012 12:25:33 +0100
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1TX8yX-0005PC-6U; Sat, 10 Nov 2012 12:11:45 +0100
Message-ID: <1352545898.6869.103.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Sat, 10 Nov 2012 11:11:38 +0000
In-Reply-To: <CAP9ODKpa0gkf5ZQGVemLYRNKVKA4cWbV4v1E_SZwAs9RuMd61A@mail.gmail.com>
References: <cover.1352455397.git.ross.burton@intel.com>
	<154a30032b03a9ce269752adbf5bbec85205720e.1352455397.git.ross.burton@intel.com>
	<CAP9ODKor1L_sv0hLi_-FTCY383fyE0NguXEeMp1U0=KcPQrk1A@mail.gmail.com>
	<1352501827.9083.21.camel@ted>
	<CAP9ODKpa0gkf5ZQGVemLYRNKVKA4cWbV4v1E_SZwAs9RuMd61A@mail.gmail.com>
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] meta: remove redundant _FOR_BUILD variables
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
X-List-Received-Date: Sat, 10 Nov 2012 11:25:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-11-09 at 21:23 -0200, Otavio Salvador wrote:
> If it rebuilds it might get a different binary package and for
> preserve the upgrade path PR bumps are need, aren't they?

Binary upgrade paths have always been a DISTRO issue.  If you want to
bump PR on everything in your distro config then you certainly can do
that, though from the point of view of an end-user I don't think that
performing a phony "upgrade" of every autotools-using package without
any functional change would necessarily be a desirable thing.

The whole PR-bumping thing is just a massive pain in the backside and,
now that all the metadata is hashed into the signature files anyway, I
think we should consider just ditching PR from oe-core altogether.
Distros that want to go on using PR can do so, either by maintaining it
manually or by using some sort of automated PR server.  Distros that
don't use binary feeds and/or support online upgrades will generally
have less of a requirement for PR and might prefer just to do without it
altogether.

p.





