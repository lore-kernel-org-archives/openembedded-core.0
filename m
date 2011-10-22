Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RHarl-0002K8-Pq
	for openembedded-core@lists.openembedded.org;
	Sat, 22 Oct 2011 14:39:57 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RHam5-0007Xd-CI
	for openembedded-core@lists.openembedded.org;
	Sat, 22 Oct 2011 14:34:05 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <20111021161620.GS3522@jama.jama.net>
References: <cover.1319184832.git.Martin.Jansa@gmail.com>
	<bfd27053f71157d3f3d3c0bf523015347714d3f8.1319184832.git.Martin.Jansa@gmail.com>
	<9e9f9e73e7bfa4a5184196b874cfb1dfe179be24.1319184832.git.Martin.Jansa@gmail.com>
	<CAMKF1soRAhf065VCJqZsQMUct1a0Ob5S2rJzN9QpE0A0R0SZ6g@mail.gmail.com>
	<20111021161620.GS3522@jama.jama.net>
Date: Sat, 22 Oct 2011 13:33:46 +0100
Message-ID: <1319286826.3310.1.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCH 3/8] pulseaudio-0.9.23: force ARM mode
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
X-List-Received-Date: Sat, 22 Oct 2011 12:39:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-10-21 at 18:16 +0200, Martin Jansa wrote:
> On Fri, Oct 21, 2011 at 08:40:20AM -0700, Khem Raj wrote:
> > On Fri, Oct 21, 2011 at 1:17 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> > > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > > ---
> > >  .../pulseaudio/pulseaudio_0.9.23.bb                |    1 +
> > >  1 files changed, 1 insertions(+), 0 deletions(-)
> > >
> > > diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb
> > > index 4ac2418..2f872b8 100644
> > > --- a/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb
> > > +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb
> > > @@ -23,3 +23,4 @@ do_compile_prepend() {
> > >     cp ${STAGING_LIBDIR}/libltdl* ${S}/libltdl
> > >  }
> > >
> > > +ARM_INSTRUCTION_SET = "arm"
> > 
> > not averse to patch but it would be nice to know what fails in thumb mode.
> 
> selected processor does not support Thumb mode `swp r1,r2,[r3]'

If it's only that one error (presumably some kind of home-grown atomic
operation) then let's just fix the code in question rather than forcing
the whole thing to build in ARM-state.  Or if the code is hard to fix,
patch the makefile so that only the particular source files with the
assembly in are built for ARM and let the rest stay as Thumb.  Making
the whole package be ARM is a bit of a heavyweight fix for that issue.

p.




