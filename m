Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id D68FB78562
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 17:48:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id CAFCB20900;
	Mon, 31 Jul 2017 17:48:34 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id lQeC5vdE4h_j; Mon, 31 Jul 2017 17:48:34 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9C00A2085A;
	Mon, 31 Jul 2017 17:48:32 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 1C2EF162549; Mon, 31 Jul 2017 13:48:32 -0400 (EDT)
Date: Mon, 31 Jul 2017 13:48:32 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Andre McCurdy <armccurdy@gmail.com>
Message-ID: <20170731174832.GV26405@denix.org>
References: <1501273600-109472-1-git-send-email-denis@denix.org>
	<CAJ86T=WdvrPzvz6325onhpMWxgdOz5weZ=hUSSVXo94NzoA7Cw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ86T=WdvrPzvz6325onhpMWxgdOz5weZ=hUSSVXo94NzoA7Cw@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Denys Dmytriyenko <denys@ti.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] autoconf: fix mistakes in SUMMARY and DESCRIPTION
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 31 Jul 2017 17:48:34 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 28, 2017 at 04:47:40PM -0700, Andre McCurdy wrote:
> On Fri, Jul 28, 2017 at 1:26 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> > From: Denys Dmytriyenko <denys@ti.com>
> >
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > ---
> > v1 - procude -> produce
> > v2 - produce -> produces
> >
> >  meta/recipes-devtools/autoconf/autoconf.inc | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/recipes-devtools/autoconf/autoconf.inc b/meta/recipes-devtools/autoconf/autoconf.inc
> > index f1b2dfc..17ee50f 100644
> > --- a/meta/recipes-devtools/autoconf/autoconf.inc
> > +++ b/meta/recipes-devtools/autoconf/autoconf.inc
> > @@ -1,5 +1,5 @@
> > -SUMMARY = "A GNU tool that procude shell scripts to automatically configure software"
> > -DESCRIPTION = "Autoconf is an extensible package of M4 macros that produce shell scripts to automatically \
> > +SUMMARY = "A GNU tool that produces shell scripts to automatically configure software"
> > +DESCRIPTION = "Autoconf is an extensible package of M4 macros that produces shell scripts to automatically \
> 
> The DESCRIPTION was correct originally (since it's the M4 macros which
> produce the shell scripts, not the extensible package).
> 
> https://www.gnu.org/software/autoconf/autoconf.html

Good thing Richard picked up v1 of the patch then! :)


> >  configure software source code packages. Autoconf creates a configuration script for a package from a template \
> >  file that lists the operating system features that the package can use, in the form of M4 macro calls."
> >  LICENSE = "GPLv3"
> > --
> > 2.7.4
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 

