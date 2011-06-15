Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QWt3c-00089s-9D for openembedded-core@lists.openembedded.org;
	Wed, 15 Jun 2011 18:35:08 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QWt0J-0005oY-Vg
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Jun 2011 18:31:44 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4DF8DD52.70502@gmail.com>
References: <1308065443.25285.268.camel@phil-desktop>
	<E934E895-3391-4437-A310-E5B99624AC38@dominion.thruhere.net>
	<1308125091.6879.39.camel@lenovo.internal.reciva.com>
	<1308148335.25285.1774.camel@phil-desktop> <4DF8DD52.70502@gmail.com>
Organization: Phil Blundell Consulting Ltd
Date: Wed, 15 Jun 2011 17:31:42 +0100
Message-ID: <1308155502.25285.2038.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH RFC] binutils: allow distro to select gold as default cross-linker
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
X-List-Received-Date: Wed, 15 Jun 2011 16:35:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-06-15 at 09:26 -0700, Khem Raj wrote:
> this might not work second time around when gcc-cross has been staged.

Oh, I thought that mess was fixed nowadays.  Doesn't eglibc always use
the -intermediate compiler from the special tcbootstrap place?  

If it's just picking whatever was staged most recently then yeah, this
will lose. 

p.




