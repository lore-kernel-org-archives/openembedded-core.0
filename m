Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RyUYp-00020c-CW
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Feb 2012 21:37:43 +0100
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RyUQt-0000NY-3I
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Feb 2012 21:29:31 +0100
Message-ID: <1329510550.2591.122.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 17 Feb 2012 20:29:10 +0000
In-Reply-To: <CAP9ODKqgFVA5K6DQG-hZXww+fiFX+H4hGcqfWjn691ng3jgGVA@mail.gmail.com>
References: <cover.1329500798.git.otavio@ossystems.com.br>
	<a186127453b155d8f35a32fac48a56dad98aad7f.1329500798.git.otavio@ossystems.com.br>
	<1329501107.14363.205.camel@phil-desktop>
	<CAP9ODKqd=j7wye-W2ZGtS5eC+ALf_i9X7F0BWiN-VaY+SkRB2A@mail.gmail.com>
	<1329506739.2591.114.camel@x121e.pbcl.net>
	<CAP9ODKq5jiun+bcQZeR2d9Dx2gJM3v=eu2N2WiCuwTb7sb4A-A@mail.gmail.com>
	<1329508773.2591.116.camel@x121e.pbcl.net>
	<CAP9ODKq7u3Vg+YU8GDMQH3vBw_GPH-Wuq9C7fa=DnEuUo0mr1A@mail.gmail.com>
	<1329509501.2591.118.camel@x121e.pbcl.net>
	<CAP9ODKqgFVA5K6DQG-hZXww+fiFX+H4hGcqfWjn691ng3jgGVA@mail.gmail.com>
X-Mailer: Evolution 3.2.2-1 
Mime-Version: 1.0
Subject: Re: [PATCH 3/3] rootfs_ipk.bbclass: fix unpacked postinst support if no package management
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
X-List-Received-Date: Fri, 17 Feb 2012 20:37:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-02-17 at 18:14 -0200, Otavio Salvador wrote:
> On Fri, Feb 17, 2012 at 18:11, Phil Blundell <philb@gnu.org> wrote:
>         We seem to be going in circles here but, to go back to what I
>         said at
>         the beginning, why can't you use the existing run-postinsts
>         recipe
>         rather than adding a new script?
> 
> 
> My image didn't end with it installed. I did a very small image and I
> expect that independently of what I choose, rootfs behave right.

Ah, I see.  Yes, that's a fair point.  Maybe rootfs_ipk itself should
inject ${ROOTFS_PKGMANAGE_BOOTSTRAP} into the image if it notices that
there are postinsts which require running and no other package manager
is installed.  I think it would be better not to have multiple scripts
doing the same thing if we can avoid it, otherwise you end up having to
fix things like ordering issues in all of them independently.

p.





