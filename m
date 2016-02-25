Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id B4FA377352
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 21:40:45 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 25 Feb 2016 13:40:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,498,1449561600"; d="scan'208";a="894856715"
Received: from jlock-mobl1.gar.corp.intel.com ([10.252.4.104])
	by orsmga001.jf.intel.com with ESMTP; 25 Feb 2016 13:40:43 -0800
Message-ID: <1456436434.13135.5.camel@linux.intel.com>
From: Joshua G Lock <joshua.g.lock@linux.intel.com>
To: Mark Hatle <mark.hatle@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 25 Feb 2016 21:40:34 +0000
In-Reply-To: <56CF364B.3080704@windriver.com>
References: <cover.1456325292.git.joshua.g.lock@intel.com>
	<4df77b79cf9ded923721b47de270b2c43c21cc18.1456325292.git.joshua.g.lock@intel.com>
	<56CF364B.3080704@windriver.com>
X-Mailer: Evolution 3.18.5.1 (3.18.5.1-1.fc23) 
Mime-Version: 1.0
Subject: Re: [PATCH 03/10] hardlink: add new recipe
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
X-List-Received-Date: Thu, 25 Feb 2016 21:40:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2016-02-25 at 11:13 -0600, Mark Hatle wrote:
> I just noticed this, any reason to use this over fdupes?

No reason other than that hardlink is what the Clear Linux team, who
authored swupd, are using. Is there a compelling reason to look at
fdupes instead?

Thanks,

Joshua

> 
> I've used fdupes in the past for this exact thing -- primarily with
> shrinking
> the size of multilib SDKs with a lot of locales.
> 
> --Mark
> 
> On 2/24/16 8:52 AM, Joshua Lock wrote:
> > 
> > ---
> >  meta/recipes-extended/hardlink/hardlink_0.3.0.bb | 19
> > +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> >  create mode 100644 meta/recipes-
> > extended/hardlink/hardlink_0.3.0.bb
> > 
> > diff --git a/meta/recipes-extended/hardlink/hardlink_0.3.0.bb
> > b/meta/recipes-extended/hardlink/hardlink_0.3.0.bb
> > new file mode 100644
> > index 0000000..2e06ac2
> > --- /dev/null
> > +++ b/meta/recipes-extended/hardlink/hardlink_0.3.0.bb
> > @@ -0,0 +1,19 @@
> > +SUMMARY = "hardlink is a tool which replaces multiple copies of a
> > file with hardlinks."
> > +LICENSE = "MIT"
> > +LIC_FILES_CHKSUM =
> > "file://hardlink.c;endline=22;md5=168464a4fc92fa7389c53b0755b39fbb"
> > +
> > +SRC_URI = "http://jak-linux.org/projects/hardlink/${BPN}_${PV}.tar
> > .xz"
> > +SRC_URI[md5sum] = "72f1a460adb6874c151deab766e434ad"
> > +SRC_URI[sha256sum] =
> > "e8c93dfcb24aeb44a75281ed73757cb862cc63b225d565db1c270af9dbb7300f"
> > +
> > +DEPENDS = "libpcre attr"
> > +
> > +do_compile () {
> > +	oe_runmake 'DESTDIR=${D}' 'PREFIX=${prefix}'
> > BINDIR='${bindir}'
> > +}
> > +
> > +do_install () {
> > +	oe_runmake install 'DESTDIR=${D}' 'PREFIX=${prefix}'
> > BINDIR='${bindir}'
> > +}
> > +
> > +BBCLASSEXTEND = "native nativesdk"
> > 

