Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QgdE4-0005Rq-Eh for openembedded-core@lists.openembedded.org;
	Tue, 12 Jul 2011 15:42:12 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>) id 1QgdAH-00036c-GP
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jul 2011 15:38:17 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 12 Jul 2011 14:38:16 +0100
In-Reply-To: <4E169528.9080001@gmail.com>
References: <cover.1310081443.git.sgw@linux.intel.com>
	<d188228df9d99be77ec2b3becc354a1fc905ab65.1310081443.git.sgw@linux.intel.com>
	<886C3867-FF12-4B5E-90C3-9E5906BAA94F@gmail.com>
	<4E165A1C.3060604@linux.intel.com> <4E169528.9080001@gmail.com>
Organization: Phil Blundell Consulting Ltd
X-Mailer: Evolution 3.0.2- 
Message-ID: <1310477897.6337.207.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH 7/8] eglibc: Add RDEPENDS on bash
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
X-List-Received-Date: Tue, 12 Jul 2011 13:42:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-07-07 at 22:27 -0700, Khem Raj wrote:
> On 07/07/2011 06:15 PM, Saul Wold wrote:
> > On 07/07/2011 05:59 PM, Khem Raj wrote:
> >> While typo fix is ok why do we need dependency on bash ?
> >> If it is for ldd then there is already a fix to free it from bashism
> >> We should use that
> >
> > Where's the fix for ldd? I don't think its part of eglibc currently.
> 
> 0a831e2cd1c27d30cd76ddada9a44a703ab60f41 in oe.dev

As we discussed on IRC the other day, that patch is not really a
complete fix.  All it does is change the #!/bin/bash to #!/bin/sh
without addressing the parts of the script that actually use
bash-specific syntax.  In particular there are quite a lot of places
that use the $"string" gettext shorthand.

p.




