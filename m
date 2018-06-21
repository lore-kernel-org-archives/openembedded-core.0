Return-Path: <maxin.john@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 45A87786EF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2018 08:33:35 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Jun 2018 01:33:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,251,1526367600"; d="scan'208";a="234373397"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.84])
	by orsmga005.jf.intel.com with ESMTP; 21 Jun 2018 01:33:33 -0700
Date: Thu, 21 Jun 2018 11:33:39 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20180621083339.GA22158@mbabyjoh-desk.ger.corp.intel.com>
References: <1529503642-7158-1-git-send-email-maxin.john@intel.com>
	<1529503642-7158-5-git-send-email-maxin.john@intel.com>
	<CAMKF1spbWUXYQ-Gz1z-sbm+f_QYz_FPHh0bR=uqmVbfUTcSULA@mail.gmail.com>
	<CAJTo0LaWe1NNusp==RoC767_Tq-3ifozumgdRLxyYRhG5XbmZg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaWe1NNusp==RoC767_Tq-3ifozumgdRLxyYRhG5XbmZg@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/5] harfbuzz: upgrade 1.7.5 -> 1.8.1
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
X-List-Received-Date: Thu, 21 Jun 2018 08:33:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Khem, Ross,

On Wed, Jun 20, 2018 at 07:07:58PM +0100, Burton, Ross wrote:
> Yes, those should be in the -dev package.

I will update it and send a v2 soon. 

> Ross

Best Regards,
Maxin

> On 20 June 2018 at 18:18, Khem Raj <raj.khem@gmail.com> wrote:
> > On Wed, Jun 20, 2018 at 7:07 AM Maxin B. John <maxin.john@intel.com> wrote:
> >>
> >> Signed-off-by: Maxin B. John <maxin.john@intel.com>
> >> ---
> >>  .../harfbuzz/{harfbuzz_1.7.5.bb => harfbuzz_1.8.1.bb}             | 8 ++++++--
> >>  1 file changed, 6 insertions(+), 2 deletions(-)
> >>  rename meta/recipes-graphics/harfbuzz/{harfbuzz_1.7.5.bb => harfbuzz_1.8.1.bb} (82%)
> >>
> >> diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_1.7.5.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_1.8.1.bb
> >> similarity index 82%
> >> rename from meta/recipes-graphics/harfbuzz/harfbuzz_1.7.5.bb
> >> rename to meta/recipes-graphics/harfbuzz/harfbuzz_1.8.1.bb
> >> index 0a9b029..f8b0056 100644
> >> --- a/meta/recipes-graphics/harfbuzz/harfbuzz_1.7.5.bb
> >> +++ b/meta/recipes-graphics/harfbuzz/harfbuzz_1.8.1.bb
> >> @@ -12,8 +12,8 @@ DEPENDS = "glib-2.0 cairo fontconfig freetype"
> >>
> >>  SRC_URI = "http://www.freedesktop.org/software/harfbuzz/release/${BP}.tar.bz2"
> >>
> >> -SRC_URI[md5sum] = "1466ab51fc5aaa6af4065936939cec62"
> >> -SRC_URI[sha256sum] = "84574e1b1f65ca694cb8fb6905309665c0368af18a312357f8ff886ee2f29563"
> >> +SRC_URI[md5sum] = "97cb89c6e2a914c05c8b7e858703885f"
> >> +SRC_URI[sha256sum] = "fbed6392ddb085e45e6090a9f389f72926d0e355f4b0a2ef51d35cf21686df45"
> >>
> >>  inherit autotools pkgconfig lib_package gtk-doc
> >>
> >> @@ -27,6 +27,10 @@ EXTRA_OECONF = " \
> >>      --with-glib \
> >>      --without-graphite2 \
> >>  "
> >> +do_install_append() {
> >> +    # Remove unnecessary cmake files
> >> +    rm -rf ${D}${libdir}/cmake
> >> +}
> >
> > perhaps they should go into -dev package instead.
> >
> >>
> >>  PACKAGES =+ "${PN}-icu ${PN}-icu-dev"
> >>
> >> --
> >> 2.4.0
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

