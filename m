Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QlR7J-0002Jh-Ff
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jul 2011 21:47:05 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QlR3H-00010A-5T
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jul 2011 21:42:55 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4E2DBF35.2020707@windriver.com>
References: <bd2e16888f6520e2d02d3ff6c43b360d217572e4.1311601422.git.richard.purdie@linuxfoundation.org>
	<586cbf5404ff76795c3d967266e7338b01e47c8b.1311601422.git.richard.purdie@linuxfoundation.org>
	<1311602747.30326.224.camel@phil-desktop>
	<4E2DBF35.2020707@windriver.com>
Date: Mon, 25 Jul 2011 20:42:48 +0100
Message-ID: <1311622968.3098.4.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCH 5/5] package.bbclass: fixup_perms - symlink bug fix
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
X-List-Received-Date: Mon, 25 Jul 2011 19:47:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-07-25 at 14:08 -0500, Mark Hatle wrote:
> symlinks do not have an ownership/group on most filesystems.  They automatically
> inherit the uid/gid of the target.  (I also believe this is the same for
> permissions.)

I'm not sure about "most" filesystems, but as far as I know all the
standard Linux filesystems do support UIDs and GIDs for symlinks.

> How do you change the mode of the link itself?  As far as I understood this
> can't be done on most filesystems.  I'd be happy to attempt to change the
> owner/group (and mode) of symlinks if there is a way not to follow the link.

You can't (in POSIX) change the mode of the link but, as someone else
already noted, you can change the ownership via lchown(2).  See:

http://pubs.opengroup.org/onlinepubs/009695399/functions/lchown.html

p.



