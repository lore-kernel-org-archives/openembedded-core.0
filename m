Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 8C234756C3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 May 2015 22:09:53 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25] helo=e130.local)
	by hetzner.pbcl.net with esmtpsa (TLS1.2:RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1YySTR-0006tZ-3W; Sat, 30 May 2015 00:09:53 +0200
Message-ID: <1432937385.2461.36.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Mike Looijmans <mike.looijmans@topic.nl>
Date: Fri, 29 May 2015 23:09:45 +0100
In-Reply-To: <5568AEC2.7090606@topic.nl>
References: <5568AEC2.7090606@topic.nl>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: boost fails to build on MIPS
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 29 May 2015 22:09:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2015-05-29 at 20:24 +0200, Mike Looijmans wrote:
> On current OE master, boost fails to build, because something attempts 
> to add "-m32" to the gcc commandline for no apparent reason.
> 
> Can anyone confirm this, or am I the only MIPS user in the world?

This is an upstream boost bug.  See the entertaining history at:

https://github.com/boostorg/build/commit/9576ca216cae888d7efb5da97c009c245c5ba567

p.



