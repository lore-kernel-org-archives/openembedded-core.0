Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Qm0a9-0004kX-HB
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 11:39:13 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1Qm0W5-00022T-Il
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 11:35:01 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 27 Jul 2011 10:35:00 +0100
In-Reply-To: <704B147D-6F12-4534-9C34-01AE69290717@dominion.thruhere.net>
References: <346abefc87d21d0cc111ef87a6e48f40c5b6cb0b.1311683981.git.richard.purdie@linuxfoundation.org>
	<992efbf4ec3d7c55346953dbe82f9745590e64bf.1311683981.git.richard.purdie@linuxfoundation.org>
	<969FA904-0086-42FA-B605-07B74FB728B4@kernel.crashing.org>
	<1311688752.2344.238.camel@rex>
	<627CF4AB-F07D-4285-B31C-3C5631270420@kernel.crashing.org>
	<1311697113.2344.268.camel@rex>
	<7B0836D8-31B6-407E-848E-FED9C5BFE78A@kernel.crashing.org>
	<1311720776.2344.319.camel@rex>
	<9A300C7A-E352-4566-AB92-88DF3CF743D7@kernel.crashing.org>
	<1311755778.2344.325.camel@rex>
	<704B147D-6F12-4534-9C34-01AE69290717@dominion.thruhere.net>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1311759301.30326.271.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH 3/3] Add basic PowerPC core tune config
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
X-List-Received-Date: Wed, 27 Jul 2011 09:39:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-07-27 at 10:44 +0200, Koen Kooi wrote:
> Op 27 jul. 2011, om 10:36 heeft Richard Purdie het volgende geschreven:
> 
> > [..]
> 
> > We could also put:
> > 
> > GLIBC_EXTRA_OECONF = "--with-cpu=e500"
> > 
> > in the machine config files.
> 
> Note that that will make glibc 'machine' specific and by association all userspace. So if you're going that route, you need to touch TUNE_PKGARCH as well.

That's true for glibc but it isn't entirely accurate to extend that to
"all userspace" since (AFAIK) none of the --with-cpu optimisations that
glibc does are ABI-changing.  So, it's just eglibc itself that needs to
get a different package architecture, everything else can stay with the
generic value.

p.




