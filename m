Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QlLr8-0002Cn-8L
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jul 2011 16:10:02 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QlLn1-0000rO-CZ
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jul 2011 16:05:47 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 25 Jul 2011 15:05:46 +0100
In-Reply-To: <586cbf5404ff76795c3d967266e7338b01e47c8b.1311601422.git.richard.purdie@linuxfoundation.org>
References: <bd2e16888f6520e2d02d3ff6c43b360d217572e4.1311601422.git.richard.purdie@linuxfoundation.org>
	<586cbf5404ff76795c3d967266e7338b01e47c8b.1311601422.git.richard.purdie@linuxfoundation.org>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1311602747.30326.224.camel@phil-desktop>
Mime-Version: 1.0
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
X-List-Received-Date: Mon, 25 Jul 2011 14:10:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-07-25 at 14:47 +0100, Richard Purdie wrote:
> From: Mark Hatle <mark.hatle@windriver.com>
> 
> We don't want to change the owner/mode of symlinks, as this may
> affect the target of the link.  Also broken links will fail as well.

This seems like it will cause links themselves to end up getting shipped
under the UID/GID that was used for building, which was the whole thing
that fixup_perms was trying to avoid in the first place.  Surely you do
want to fix their ownership, it's just the mode that you oughtn't to be
trying to change.

Also, unrelated to the technical details, the subject line of this patch
is not especially illuminating.  It would be better to say something
like "package.bbclass: don't change mode/owner of symlinks" rather than
like "symlink bug fix".

p.




