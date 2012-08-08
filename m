Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Sz2mT-0002in-BL
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Aug 2012 11:42:21 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1Sz2b6-0006KX-Ir
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Aug 2012 11:30:36 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 08 Aug 2012 10:30:35 +0100
In-Reply-To: <CAJTo0Lb2jyRgUxqKE_ggZDwGr9FQuHig8rnQsYZTghdMXUpKhw@mail.gmail.com>
References: <CAJTo0Lb2jyRgUxqKE_ggZDwGr9FQuHig8rnQsYZTghdMXUpKhw@mail.gmail.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1344418236.23275.219.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: Configurable host name
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
X-List-Received-Date: Wed, 08 Aug 2012 09:42:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-08-08 at 09:13 +0100, Burton, Ross wrote:
> My proposal would be to add something like HOSTNAME ?= "$MACHINE" to
> default-distrovars.inc, and changing base-files to write the hostname
> file in a new task using something like addtask hostname after
> do_rootfs.

Adding a new global variable does have a certain cost associated with
it, since this ends up in the metadata for every single recipe.  Ideally
we want to try to avoid doing that for things that are only really used
in one place.

I suspect that most distros are probably going to want to do at least
some customisation of base-files anyway (if they use the recipe from
oe-core at all) so this doesn't seem like it ought to be a big deal for
them. 

And, any distros that do use base-files from oe-core and don't (want to)
have a .bbappend for it can already override the hostname fairly
trivially by putting:

hostname_pn-base-files = "my-distro-rocks"

in their config files.  So it doesn't seem to me that there is any real
problem to be solved here.

p.




