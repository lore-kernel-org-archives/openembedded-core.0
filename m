Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QQ4ZA-0007Z2-EI for openembedded-core@lists.openembedded.org;
	Fri, 27 May 2011 23:27:32 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QQ4WD-0006L7-HL
	for openembedded-core@lists.openembedded.org;
	Fri, 27 May 2011 23:24:29 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <8046a9b60d086b3f82c0733ecbf24785066625e4.1306530446.git.sgw@linux.intel.com>
References: <cover.1306530446.git.sgw@linux.intel.com>
	<8046a9b60d086b3f82c0733ecbf24785066625e4.1306530446.git.sgw@linux.intel.com>
Date: Fri, 27 May 2011 22:24:22 +0100
Message-ID: <1306531463.3120.124.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH 1/1] xserver: force to use libdl
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
X-List-Received-Date: Fri, 27 May 2011 21:27:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-05-27 at 14:09 -0700, Saul Wold wrote:
> From: Yu Ke <ke.yu@intel.com>
> 
> [YOCTO #737]
> 
> The AC_CHECK_FUNC([dlopen], [], AC_CHECK_LIB([dl], [dlopen], DLOPEN_LIBS="-ldl"))
> macro seems not work well in ppc arch, so this patch force the DLOPEN_LIBS="-ldl"
> 

That's a bit of a weird report.  Do we know why it doesn't work?  I
guess we don't care all that much about Solaris targets, but equally I
can't think of any reason why ppc should be special.

p.




