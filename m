Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QZPz1-0005D6-Ii for openembedded-core@lists.openembedded.org;
	Wed, 22 Jun 2011 18:08:51 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QZPva-0003KS-7u
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Jun 2011 18:05:19 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1308758420.20015.82.camel@rex>
References: <cover.1308706692.git.raj.khem@gmail.com>
	<1308758420.20015.82.camel@rex>
Organization: Phil Blundell Consulting Ltd
Date: Wed, 22 Jun 2011 17:05:09 +0100
Message-ID: <1308758709.21613.104.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH V2 0/2] Change gcc 4.6 recipes to use svn in SRC_URI
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
X-List-Received-Date: Wed, 22 Jun 2011 16:08:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-06-22 at 17:00 +0100, Richard Purdie wrote:
> I'm afraid I don't like having "gcc 4.6" being so publicly visible. Its
> fine for the recipe names but the PV itself really needs to be something
> like "4.6.2+svn".

Well, er, gcc 4.6.1 hasn't even been released yet.  I think "4.6.0
+svn" (or just "4.6+svn") is the only reasonable thing to put there.
Calling it 4.6.2 would definitely be misleading.

p.




