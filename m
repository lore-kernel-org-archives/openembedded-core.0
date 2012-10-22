Received: from host46-141-dynamic.2-87-r.retail.telecomitalia.it
	([87.2.141.46] helo=router.workgroup)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gnutoo@no-log.org>) id 1TQNoc-0006p8-DZ
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Oct 2012 21:37:34 +0200
Received: from [192.168.1.121] (helo=gnutoo-desktop)
	by router.workgroup with esmtpsa (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.76) (envelope-from <gnutoo@no-log.org>)
	id 1TQNai-0008WI-Jl; Mon, 22 Oct 2012 21:23:12 +0200
Date: Mon, 22 Oct 2012 21:22:04 +0200
From: Denis 'GNUtoo' Carikli <gnutoo@no-log.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20121022212204.4d19975e@gnutoo-desktop>
In-Reply-To: <1350920382.22340.0.camel@ted>
References: <1350748213-6436-1-git-send-email-GNUtoo@no-log.org>
	<1350920382.22340.0.camel@ted>
X-Mailer: Claws Mail 3.7.9 (GTK+ 2.24.6; i686-pc-linux-gnu)
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] boost: Activate zlib and bzip2 because they now work.
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
X-List-Received-Date: Mon, 22 Oct 2012 19:37:34 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 22 Oct 2012 16:39:42 +0100
Richard Purdie <richard.purdie@linuxfoundation.org> wrote:

> On Sat, 2012-10-20 at 17:50 +0200, Denis 'GNUtoo' Carikli wrote:
> > This patch is needed for making wesnoth(will be sumbited
> >   in meta-games) work.
> > 
> > Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
> > ---
> >  meta/recipes-support/boost/boost.inc |    7 +------
> >  1 files changed, 1 insertions(+), 6 deletions(-)
> 
> I tried this in master-next, the build broke:
> 
> | libs/iostreams/src/bzip2.cpp:20:56: fatal error: bzlib.h: No such
> file or directory | compilation terminated.
[...]
> http://autobuilder.yoctoproject.org:8010/builders/nightly-world/builds/348/steps/shell_41/logs/stdio
> 
> Missing changes to DEPENDS maybe?
yes probably, I have that:
./work/armv7a-vfp-neon-oe-linux-gnueabi/bzip2/bzip2-1.0.6-r5/sysroot-destdir/usr/include/bzlib.h
So it should depend on bzip2...

Denis.


