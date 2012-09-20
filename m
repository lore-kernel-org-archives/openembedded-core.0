Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TEh5l-0003pj-96 for openembedded-core@lists.openembedded.org;
	Thu, 20 Sep 2012 15:46:57 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8KDYBrH012206;
	Thu, 20 Sep 2012 14:34:11 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 11861-03; Thu, 20 Sep 2012 14:34:07 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8KDY3rJ012200
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Thu, 20 Sep 2012 14:34:04 +0100
Message-ID: <1348148042.10108.6.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Thu, 20 Sep 2012 14:34:02 +0100
In-Reply-To: <CAMKF1spysZ_tcHRu1XoTTdvvMCbSxfjkJnk6xgg1KU_Hm__DBQ@mail.gmail.com>
References: <1348048754-30379-1-git-send-email-constantinx.musca@intel.com>
	<CAMKF1spysZ_tcHRu1XoTTdvvMCbSxfjkJnk6xgg1KU_Hm__DBQ@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Constantin Musca <constantinx.musca@intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] intltool: include intltool.m4 and add missing rdepends
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
X-List-Received-Date: Thu, 20 Sep 2012 13:46:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-09-19 at 06:23 -0700, Khem Raj wrote:
> On Wed, Sep 19, 2012 at 2:59 AM, Constantin Musca
> <constantinx.musca@intel.com> wrote:
> > - include /usr/share/aclocal/intltool.m4 into the intltool
> > package (the files from intltool-dev must be included into the
> > main package, as intltool is a development tool)
> > - add missing rdepends: gettext-dev, libxml-parser-perl
> >
> > [YOCTO #2597]
> >
> > Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
> > ---
> >  meta/recipes-devtools/intltool/intltool.inc       |    9 ++++++++-
> >  meta/recipes-devtools/intltool/intltool_0.50.0.bb |    2 +-
> >  2 files changed, 9 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/recipes-devtools/intltool/intltool.inc b/meta/recipes-devtools/intltool/intltool.inc
> > index 1c41f0f..59974d8 100644
> > --- a/meta/recipes-devtools/intltool/intltool.inc
> > +++ b/meta/recipes-devtools/intltool/intltool.inc
> > @@ -7,11 +7,18 @@ SRC_URI = "http://launchpad.net/${BPN}/trunk/${PV}/+download/${BP}.tar.gz"
> >  S = "${WORKDIR}/intltool-${PV}"
> >
> >  DEPENDS = "libxml-parser-perl-native"
> > +RDEPENDS_${PN} = "gettext-dev libxml-parser-perl"
> 
> creating a runtime dependency on a dev package seems troublesome to me.
> Can you explain why is this being done ?

Constantin has posted an update about this. The issue is the intltool.m4
macros references macros that come from gettext-dev.

I think that whilst this unusual, developer tools can need other
development tools. We need to remember that intltool is only ever used
for development.

Cheers,

Richard



