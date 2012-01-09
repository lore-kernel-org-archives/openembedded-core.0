Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RkAPJ-0006dp-CN
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jan 2012 09:16:41 +0100
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1RkAI6-0006rT-Ni; Mon, 09 Jan 2012 09:09:14 +0100
From: Phil Blundell <philb@gnu.org>
To: McClintock Matthew-B29882 <B29882@freescale.com>, Patches and
	discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <CAEsOVNeAuF5u2J_MhZg9tVezexCNyK2rGsZ2sUgBpTeJ90ZVqw@mail.gmail.com>
References: <1326067422-30771-1-git-send-email-andrei@gherzan.ro>
	<CAEsOVNeAuF5u2J_MhZg9tVezexCNyK2rGsZ2sUgBpTeJ90ZVqw@mail.gmail.com>
Date: Mon, 09 Jan 2012 08:09:08 +0000
Message-ID: <1326096548.3234.3.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Cc: Andrei Gherzan <andrei@gherzan.ro>,
	Andrei Gherzan <andrei.gherzan@windriver.com>
Subject: Re: [PATCH] busybox: defconfig modified in order to activate CONFIG_EXPR_MATH_SUPPORT_64
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
X-List-Received-Date: Mon, 09 Jan 2012 08:16:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

You could take a look at the busybox-config.inc stuff in oe-classic as a
starting point.  It doesn't do PACKAGECONFIG (since oe-classic doesn't
have that) but it can do the equivalent with DISTRO_FEATURES.

p.

On Mon, 2012-01-09 at 05:08 +0000, McClintock Matthew-B29882 wrote:
> Is anyone working on more fine grained control of busybox? Some ideas include:
> 
> 1) configure via PACKAGECONFIG?
> 
> 2) supply a defconfig for busybox?
> 
> 3) multiple busybox recipes?
> 
> -M
> 
> On Sun, Jan 8, 2012 at 6:03 PM, Andrei Gherzan <andrei@gherzan.ro> wrote:
> > From: Andrei Gherzan <andrei.gherzan@windriver.com>
> >
> > Enable 64-bit math support in the expr applet. This will make
> > the applet slightly larger, but will allow computation with very
> > large numbers.
> >
> > [YOCTO #1767]
> >
> > Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
> > ---
> >  meta/recipes-core/busybox/busybox-1.19.3/defconfig |    2 +-
> >  1 files changed, 1 insertions(+), 1 deletions(-)
> >
> > diff --git a/meta/recipes-core/busybox/busybox-1.19.3/defconfig b/meta/recipes-core/busybox/busybox-1.19.3/defconfig
> > index 1990f28..ebd751d 100644
> > --- a/meta/recipes-core/busybox/busybox-1.19.3/defconfig
> > +++ b/meta/recipes-core/busybox/busybox-1.19.3/defconfig
> > @@ -214,7 +214,7 @@ CONFIG_FEATURE_ENV_LONG_OPTIONS=y
> >  # CONFIG_EXPAND is not set
> >  # CONFIG_FEATURE_EXPAND_LONG_OPTIONS is not set
> >  CONFIG_EXPR=y
> > -# CONFIG_EXPR_MATH_SUPPORT_64 is not set
> > +CONFIG_EXPR_MATH_SUPPORT_64=y
> >  CONFIG_FALSE=y
> >  # CONFIG_FOLD is not set
> >  # CONFIG_FSYNC is not set
> > --
> > 1.7.5.4
> >
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core




