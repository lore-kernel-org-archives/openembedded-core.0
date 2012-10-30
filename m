Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TTD63-0002BP-FA
	for openembedded-core@lists.openembedded.org;
	Tue, 30 Oct 2012 15:47:15 +0100
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1TTCsr-0001hc-Ro; Tue, 30 Oct 2012 15:33:38 +0100
From: Phil Blundell <philb@gnu.org>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 30 Oct 2012 14:33:36 +0000
In-Reply-To: <CAJTo0LZg4x6GpDHAop6aCMNfOE-zK_hnr=T4SxfgSYEucRVWkA@mail.gmail.com>
References: <508FA924.4030301@communistcode.co.uk>
	<CAJTo0LZg4x6GpDHAop6aCMNfOE-zK_hnr=T4SxfgSYEucRVWkA@mail.gmail.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1351607617.13864.59.camel@phil-desktop>
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Removing netbase from an image
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
X-List-Received-Date: Tue, 30 Oct 2012 14:47:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-10-30 at 10:22 +0000, Burton, Ross wrote:
> You don't want to remove netbase, you just want to remove the
> /etc/network/interfaces file.  The rest of netbase is very important
> to have.

Well, FSVO "very important".  There's very little in there which is
actually indispensible; /etc/hosts is probably the only file that I'd
consider to be all that important, and arguably it's a libc bug that
this one is necessary.  I don't use netbase itself in any of my own
images.

p.




