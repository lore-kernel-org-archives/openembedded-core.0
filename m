Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RNPiu-000760-Hn
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Nov 2011 14:58:52 +0100
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RNPcv-0006am-Mv
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Nov 2011 14:52:41 +0100
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 07 Nov 2011 13:52:31 +0000
In-Reply-To: <CAP9ODKp-5oZ3Fr=5EWbm7F1vR3ZFGXw9ezkPj-Ciui12SczM6A@mail.gmail.com>
References: <CAP9ODKp-5oZ3Fr=5EWbm7F1vR3ZFGXw9ezkPj-Ciui12SczM6A@mail.gmail.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1320673961.22985.653.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: Broken BAD_RECOMMENDATIONS support
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
X-List-Received-Date: Mon, 07 Nov 2011 13:58:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-11-07 at 11:45 -0200, Otavio Salvador wrote:
> Hello,
> 
> It seems BAD_RECOMMENDATIONS support, in ipk, is broken.
> 
> I checked and the rootfs_ipk is writting the contents into the opkg's
> status file however it seems opkg when starts to install the packages
> it overwrites or ignores it. People at IRC confirmated that this also
> happens to them and thus this is indeed broken.
> 
> Do someone know how I can debug opkg to see what's going on?

You can add -V4 to ${ipkg_args} in package_install_internal_ipk() to get
more verbosity, though the output is not always especially illuminating.
It might be easiest to just hack the scripting so that it bails out at
that point and then run opkg-cl by hand under the debugger.

p.




