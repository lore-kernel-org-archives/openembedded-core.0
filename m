Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QMkHi-0005Yl-4G for openembedded-core@lists.openembedded.org;
	Wed, 18 May 2011 19:11:46 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QMkEv-0006uX-Mh
	for openembedded-core@lists.openembedded.org;
	Wed, 18 May 2011 19:08:53 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <BANLkTikiNW0UEfLM_UtKeekTcrW5UNNfUA@mail.gmail.com>
References: <cover.1305665459.git.raj.khem@gmail.com>
	<cc2e6337ae338737455bf63bd43278dee302fb5c.1305665459.git.raj.khem@gmail.com>
	<1305734038.18415.108.camel@lenovo.internal.reciva.com>
	<BANLkTikiNW0UEfLM_UtKeekTcrW5UNNfUA@mail.gmail.com>
Date: Wed, 18 May 2011 18:08:47 +0100
Message-ID: <1305738527.18415.126.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH 1/1] default-distrovars.inc, task-core-boot.bb: Create distro overridable varibales
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
X-List-Received-Date: Wed, 18 May 2011 17:11:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-05-18 at 09:40 -0700, Khem Raj wrote:
> Problem I have is, I dont want udev in RDEPENDS which is added by
> task-core-boot
> and task-core-boot is added to DISTRO_EXTRA_RDEPENDS through
> default-distrovars.inc -> defaultsetup.conf -> bitbake.conf
> 
> and my distro adds DISTRO_EXTRA_RDEPENDS to its RDEPENDS
> as I think the variable is meant for distro's to define some extra
> stuff if needed.
> 
> How should I solve this problem ?

Well, what I did in micro-base-image was simply to not use
task-core-boot at all.  But in your case I was thinking that you could
overlay that recipe with from your distro's layer and make it do
whatever you wanted.

p.




