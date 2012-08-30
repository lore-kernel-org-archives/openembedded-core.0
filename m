Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1T7BKn-0000de-TE
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Aug 2012 22:27:25 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1T7B8x-000372-VE
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Aug 2012 22:15:12 +0200
Message-ID: <1346357591.4396.76.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: oe-core <openembedded-core@lists.openembedded.org>
Date: Thu, 30 Aug 2012 21:13:11 +0100
In-Reply-To: <CABcZANn-7+kaOPJq1DV2QsjG3qqk_H=Vx8O3W5RN=rsfv+EsRA@mail.gmail.com>
References: <1346356090-13811-1-git-send-email-sgw@linux.intel.com>
	<CABcZANn-7+kaOPJq1DV2QsjG3qqk_H=Vx8O3W5RN=rsfv+EsRA@mail.gmail.com>
X-Mailer: Evolution 3.4.3-1 
Mime-Version: 1.0
Subject: Re: [PATCH] poky-tiny: Enable x86-64 to build eglibc correctly
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
X-List-Received-Date: Thu, 30 Aug 2012 20:27:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-08-30 at 13:04 -0700, Chris Larson wrote:
> On Thu, Aug 30, 2012 at 12:48 PM, Saul Wold <sgw@linux.intel.com> wrote:
> > The libc-libm-big option allows eglibc to correctly configure
> > itself to include the correct math functions for 64bit operations
> >
> > [YOCTO #2943]
> >
> > Signed-off-by: Saul Wold <sgw@linux.intel.com>
> 
> I'm curious, is this needed for other 64 bit platforms, e.g. powerpc64?

Also out of curiosity, what's the use-case for 64-bit userspace in a
"tiny" context?  I would have thought that you'd generally want x32.

p.




