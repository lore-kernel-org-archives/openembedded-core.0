Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QWoLu-00010p-MY for openembedded-core@lists.openembedded.org;
	Wed, 15 Jun 2011 13:33:42 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QWoIc-0005bD-H0
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Jun 2011 13:30:18 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4DF81C2D.70502@gmail.com>
References: <1308065443.25285.268.camel@phil-desktop>
	<4DF81C2D.70502@gmail.com>
Organization: Phil Blundell Consulting Ltd
Date: Wed, 15 Jun 2011 12:30:17 +0100
Message-ID: <1308137417.25285.1500.camel@phil-desktop>
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
X-List-Received-Date: Wed, 15 Jun 2011 11:33:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-06-14 at 19:42 -0700, Khem Raj wrote:
> I think we need to document this distro feature somewhere as well.

Yeah, agreed.  Any suggestions for "somewhere"?  Traditionally this kind
of thing has been sort-of-documented in local.conf.sample{.extended} but
that doesn't seem like a terribly good model for the future.  

If the wiki were ever to become editable then I guess a page there might
be a good place, perhaps.

>We need the same for target binutils too.

Yeah, though it wants slightly different handling in the target case.  I
was planning to leave that for someone who actually uses on-target
binutils to sort out :-)

There's also the sdk case which I haven't looked at either.  I'm not
sure to what extent that needs special handling.

p.




