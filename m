Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RvdeV-00005d-Jw
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Feb 2012 00:43:47 +0100
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RvdWi-0005ot-OZ
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Feb 2012 00:35:44 +0100
Message-ID: <1328830528.2716.305.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 09 Feb 2012 23:35:28 +0000
In-Reply-To: <20120209223044.GF10322@jama.jama.net>
References: <20120201151531.BE60410330@opal>
	<20120201153742.GA6969@jama.jama.net>
	<4F344389.7060005@linux.intel.com>
	<20120209223044.GF10322@jama.jama.net>
X-Mailer: Evolution 3.2.2-1 
Mime-Version: 1.0
Subject: Re: [oe-commits] Saul Wold : opkg-utils: convert to git repo at git.yoctoproject.org
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
X-List-Received-Date: Thu, 09 Feb 2012 23:43:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-02-09 at 23:30 +0100, Martin Jansa wrote:
> Why +git when we have +svnr not +svn? and both systems call it revision?
> 
> Wouldn't it be more consistent to use +gitr and then also we wouldn't
> have this problem with PV going backwards..

The "svnrNNNN" name came about because the Subversion convention is that
revisions are always named "r1982" or whatever.  Git doesn't do that, it
just uses the hash directly, so it would be more natural to just write
"+gitNNNNN".  Adding an extra "r" in there doesn't contribute any useful
information.

All that said, though, this seems like a fairly trivial issue and I
don't think there is any good reason to go around changing existing
recipes just to "fix" the version strings.

p.




