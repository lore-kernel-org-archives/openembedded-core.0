Return-Path: <maxin.john@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 2FF3F71A80
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Oct 2016 07:53:38 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 24 Oct 2016 00:53:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,541,1473145200"; d="scan'208";a="893220889"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.71])
	by orsmga003.jf.intel.com with ESMTP; 24 Oct 2016 00:53:39 -0700
Date: Mon, 24 Oct 2016 10:54:12 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20161024075412.GA7910@mbabyjoh-desk.ger.corp.intel.com>
References: <1477222197-3698-1-git-send-email-maxin.john@intel.com>
	<1477222197-3698-10-git-send-email-maxin.john@intel.com>
	<CAMKF1sq-2EiAYS553aeE++pGRvQDd+2FCARq7DMOgVNg4_OZTQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sq-2EiAYS553aeE++pGRvQDd+2FCARq7DMOgVNg4_OZTQ@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 10/10] libpng: Upgrade 1.6.24 -> 1.6.25
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
X-List-Received-Date: Mon, 24 Oct 2016 07:53:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Khem,

On Sun, Oct 23, 2016 at 08:59:48AM -0700, Khem Raj wrote:
> On Sun, Oct 23, 2016 at 4:29 AM, Maxin B. John <maxin.john@intel.com> wrote:
> > License file changes are due to updates in Version and Copyright date
> 
> version of license or version of package ?

It was supposed to be Package version. Generally libpng upgrade modifies it's
version and Copyright dates in the License file. eg:

* libpng versions 1.0.7, July 1, 2000 through 1.6.26, October 20, 2016 are
* Copyright (c) 2000-2002, 2004, 2006-2016 Glenn Randers-Pehrson

Sorry for creating confusion here.

> >
> > Signed-off-by: Maxin B. John <maxin.john@intel.com>
> > ---
> >  .../libpng/{libpng_1.6.24.bb => libpng_1.6.26.bb}                 | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >  rename meta/recipes-multimedia/libpng/{libpng_1.6.24.bb => libpng_1.6.26.bb} (67%)
> >
> > diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.24.bb b/meta/recipes-multimedia/libpng/libpng_1.6.26.bb
> > similarity index 67%
> > rename from meta/recipes-multimedia/libpng/libpng_1.6.24.bb
> > rename to meta/recipes-multimedia/libpng/libpng_1.6.26.bb
> > index f91ab7f..8c1cb8c 100644
> > --- a/meta/recipes-multimedia/libpng/libpng_1.6.24.bb
> > +++ b/meta/recipes-multimedia/libpng/libpng_1.6.26.bb
> > @@ -2,14 +2,14 @@ SUMMARY = "PNG image format decoding library"
> >  HOMEPAGE = "http://www.libpng.org/"
> >  SECTION = "libs"
> >  LICENSE = "Libpng"
> > -LIC_FILES_CHKSUM = "file://LICENSE;md5=5089214833586ba444048fd1dbbc76a4 \
> > -                    file://png.h;endline=149;md5=376d8ff7f69b7c4ad3a09f4672cec696"
> > +LIC_FILES_CHKSUM = "file://LICENSE;md5=ce8d0bd8303802e5492f064ddddef0e7 \
> > +                    file://png.h;endline=149;md5=8cca27e71fd88e1fe1adad7d9e841b5f"
> >  DEPENDS = "zlib"
> >
> >  SRC_URI = "${GENTOO_MIRROR}/libpng-${PV}.tar.xz \
> >            "
> > -SRC_URI[md5sum] = "ffcdbd549814787fa8010c372e35ff25"
> > -SRC_URI[sha256sum] = "7932dc9e5e45d55ece9d204e90196bbb5f2c82741ccb0f7e10d07d364a6fd6dd"
> > +SRC_URI[md5sum] = "faed9bb495d2e12dd0c9ec561ca60cd8"
> > +SRC_URI[sha256sum] = "266743a326986c3dbcee9d89b640595f6b16a293fd02b37d8c91348d317b73f9"
> >
> >  BINCONFIG = "${bindir}/libpng-config ${bindir}/libpng16-config"
> >
> > --

Best Regards,
Maxin

