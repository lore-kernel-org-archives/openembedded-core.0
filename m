Received: from katalix.com ([82.103.140.233] helo=mail.katalix.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <celston@katalix.com>) id 1Qf7ck-0006ZX-SP
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 11:45:26 +0200
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	(Authenticated sender: chris)
	by mail.katalix.com (Postfix) with ESMTPA id 6AE65A6206D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jul 2011 10:41:34 +0100 (BST)
From: Chris Elston <celston@katalix.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <201107080938.37370.paul.eggleton@linux.intel.com>
References: <cover.1310044227.git.paul.eggleton@linux.intel.com>
	<201107071534.51372.paul.eggleton@linux.intel.com>
	<4E1693CC.8080403@gmail.com>
	<201107080938.37370.paul.eggleton@linux.intel.com>
Organization: Katalix Systems Ltd
Date: Fri, 08 Jul 2011 09:46:34 +0100
Message-ID: <1310114794.3629.7.camel@ce-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: [PATCH 1/2] bitbake.conf: update OLDEST_KERNEL to 2.6.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: celston@katalix.com, Patches and discussions about the oe-core layer
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
X-List-Received-Date: Fri, 08 Jul 2011 09:45:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-07-08 at 09:38 +0100, Paul Eggleton wrote:
> On Friday 08 July 2011 06:21:16 Khem Raj wrote:
> > If oe-core never supported older kernel than 2.6.37 then setting it to
> > 2.6.37 would be better IMO
> 
> It's not necessarily just about oe-core - it's about what layers get used on 
> top, and some of those will be using kernels older than 2.6.37.

It's very rare that we get a free hand in the choice of kernel version.
We get stuck with whichever version the silicon vendor chooses to
support, so it would be bad for us if we couldn't use an older kernel in
our layers.

Cheers,

Chris.



