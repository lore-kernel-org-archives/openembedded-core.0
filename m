Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QSFdS-0004Xo-Ks for openembedded-core@lists.openembedded.org;
	Thu, 02 Jun 2011 23:40:58 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QSFaO-0003FH-Sr
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Jun 2011 23:37:49 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1307049946.27470.589.camel@rex>
References: <1307008107.2529.175.camel@phil-desktop>
	<1307049946.27470.589.camel@rex>
Date: Thu, 02 Jun 2011 22:37:42 +0100
Message-ID: <1307050662.4028.3.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH] rpm: avoid dependency on perl and python for -native build
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
X-List-Received-Date: Thu, 02 Jun 2011 21:40:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-06-02 at 22:25 +0100, Richard Purdie wrote:
> | checking pcre.h usability... no
> | checking pcre.h presence... no
> | checking for pcre.h... no
> | checking for pcre_compile in -lpcre... no
> | checking whether to build with PCRE library... no
> | ++ executing failure action
> | configure: error: PCRE is mandatory. If you don't have  libpcre then --with-pcre=internal could be used

Oh dear, that's not too good.  Can you send me a copy of the config.log
corresponding to that failure?  Is pcre actually in your sysroot, or has
it just not been built and staged at all?

p.




