Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QeOF0-0005qs-2O for openembedded-core@lists.openembedded.org;
	Wed, 06 Jul 2011 11:17:54 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>) id 1QeOBK-00047h-72
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Jul 2011 11:14:06 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 06 Jul 2011 10:14:05 +0100
In-Reply-To: <d0bae3ed1b9aead05a353ade871e71bf5b1c01b1.1309906154.git.richard.purdie@linuxfoundation.org>
References: <696f00b67217242f3a372d070c2473f8ced639ed.1309906154.git.richard.purdie@linuxfoundation.org>
	<d0bae3ed1b9aead05a353ade871e71bf5b1c01b1.1309906154.git.richard.purdie@linuxfoundation.org>
Organization: Phil Blundell Consulting Ltd
X-Mailer: Evolution 3.0.2- 
Message-ID: <1309943646.6337.5.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH 02/17] connman: Package unpackaged .la file
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
X-List-Received-Date: Wed, 06 Jul 2011 09:17:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-07-05 at 23:51 +0100, Richard Purdie wrote:
> +FILES_${PN}-dev += "${libdir}/connman/plugins/*.la"

Actually, in this specific case, I think adding *.la to FILES is the
wrong thing to do.  The DSOs in question are plugins, not libraries, and
nobody is ever going to link against them.  So the corresponding .la
files (and the .so symlinks, if those are also getting created) really
are just dross and should be deleted.

p.




