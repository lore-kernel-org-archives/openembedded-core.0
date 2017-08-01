Return-Path: <maxin.john@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 53FE778297
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Aug 2017 08:41:58 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Aug 2017 01:42:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,305,1498546800"; d="scan'208";a="1157626289"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.84])
	by orsmga001.jf.intel.com with ESMTP; 01 Aug 2017 01:41:58 -0700
Date: Tue, 1 Aug 2017 11:43:16 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: akuster808 <akuster808@gmail.com>
Message-ID: <20170801084316.GA33379@mbabyjoh-desk.ger.corp.intel.com>
References: <1500551462-19196-1-git-send-email-maxin.john@intel.com>
	<11c0cdf9-c369-f90e-1c3c-3e1e60ac9e57@gmail.com>
MIME-Version: 1.0
In-Reply-To: <11c0cdf9-c369-f90e-1c3c-3e1e60ac9e57@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [morty][PATCH 1/2] libpng: move SRC_URI back to SOURCEFORGE_MIRROR
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
X-List-Received-Date: Tue, 01 Aug 2017 08:41:59 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Armin,

On Mon, Jul 24, 2017 at 09:04:40PM -0700, akuster808 wrote:
> 
> 
> On 07/20/2017 04:51 AM, Maxin B. John wrote:
> >Since GENTOO_MIRROR removes older binaries, move back to
> >SOURCEFORGE_MIRROR
> your fix is cleaner than what I had stagged.
> thanks,
> Armin
> >[YOCTO #11554]

Please ignore this fix. I will send v2 which fixes the MIRRORS.

> >Signed-off-by: Maxin B. John <maxin.john@intel.com>
> >---
> >  meta/recipes-multimedia/libpng/libpng_1.6.24.bb | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> >diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.24.bb b/meta/recipes-multimedia/libpng/libpng_1.6.24.bb
> >index f91ab7f..4ee5983 100644
> >--- a/meta/recipes-multimedia/libpng/libpng_1.6.24.bb
> >+++ b/meta/recipes-multimedia/libpng/libpng_1.6.24.bb
> >@@ -6,8 +6,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5089214833586ba444048fd1dbbc76a4 \
> >                      file://png.h;endline=149;md5=376d8ff7f69b7c4ad3a09f4672cec696"
> >  DEPENDS = "zlib"
> >-SRC_URI = "${GENTOO_MIRROR}/libpng-${PV}.tar.xz \
> >-          "
> >+LIBV = "16"
> >+
> >+SRC_URI = "${SOURCEFORGE_MIRROR}/project/libpng/libpng${LIBV}/older-releases/${PV}/libpng-${PV}.tar.xz"
> >+
> >  SRC_URI[md5sum] = "ffcdbd549814787fa8010c372e35ff25"
> >  SRC_URI[sha256sum] = "7932dc9e5e45d55ece9d204e90196bbb5f2c82741ccb0f7e10d07d364a6fd6dd"

Best Regards,
Maxin

