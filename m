Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id A9A8375E2D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Oct 2015 12:27:33 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 29 Oct 2015 05:27:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,214,1444719600"; d="scan'208";a="590292578"
Received: from djwalsh-mobl.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.4.5])
	by FMSMGA003.fm.intel.com with ESMTP; 29 Oct 2015 05:27:32 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Jens Rehsack <rehsack@gmail.com>
Date: Thu, 29 Oct 2015 12:27:31 +0000
Message-ID: <1556288.oU3CJGhmjq@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.1.8-100.fc21.x86_64; KDE/4.14.11; x86_64; ; )
In-Reply-To: <16FB52C0-E87A-40C9-A677-F1220982FB30@gmail.com>
References: <6A0E85DF-31B7-4955-B4A2-0F3E099FCF99@gmail.com>
	<16FB52C0-E87A-40C9-A677-F1220982FB30@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] Update libusb1 from 1.0.19 to 1.0.20
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
X-List-Received-Date: Thu, 29 Oct 2015 12:27:34 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Jens,

On Thursday 29 October 2015 12:47:18 Jens Rehsack wrote:
> > Am 08.10.2015 um 16:36 schrieb Jens Rehsack <rehsack@gmail.com>:
> > 
> > This updates libusb1 from 1.0.19 to 1.0.20
> > 
> > 2015-09-13: v1.0.20
> > * Add Haiku support
> > * Fix multiple memory and resource leaks (#16, #52, #76, #81)
> > * Fix possible deadlock when executing transfer callback
> > * New libusb_free_pollfds() API
> > * Darwin: Fix devices not being detected on OS X 10.8 (#48)
> > * Linux: Allow larger isochronous transfer submission (#23)
> > * Windows: Fix broken builds Cygwin/MinGW builds and compiler warnings
> > * Windows: Fix broken bus number lookup
> > * Windows: Improve submission of control requests for composite devices
> > * Examples: Add two-stage load support to fxload (#12)
> > * Correctly report cancellations due to timeouts
> > * Improve efficiency of event handling
> > * Improve speed of transfer submission in multi-threaded environments
> > * Various other bug fixes and improvements
> > The (#xx) numbers are libusb issue numbers, see ie:
> > https://github.com/libusb/libusb/issues/16
> > 
> > Signed-off-by: Jens Rehsack <sno@netbsd.org>
> > ---
> > meta/recipes-support/libusb/{libusb1_1.0.19.bb => libusb1_1.0.20.bb} | 4
> > ++-- 1 file changed, 2 insertions(+), 2 deletions(-)
> > rename meta/recipes-support/libusb/{libusb1_1.0.19.bb =>
> > libusb1_1.0.20.bb} (85%)
> > 
> > diff --git a/meta/recipes-support/libusb/libusb1_1.0.19.bb
> > b/meta/recipes-support/libusb/libusb1_1.0.20.bb similarity index 85%
> > rename from meta/recipes-support/libusb/libusb1_1.0.19.bb
> > rename to meta/recipes-support/libusb/libusb1_1.0.20.bb
> > index a20e1fc..21b8b45 100644
> > --- a/meta/recipes-support/libusb/libusb1_1.0.19.bb
> > +++ b/meta/recipes-support/libusb/libusb1_1.0.20.bb
> > @@ -11,8 +11,8 @@ BBCLASSEXTEND = "native nativesdk"
> > SRC_URI = "${SOURCEFORGE_MIRROR}/libusb/libusb-${PV}.tar.bz2 \
> > 
> >           "
> > 
> > -SRC_URI[md5sum] = "f9e2bb5879968467e5ca756cb4e1fa7e"
> > -SRC_URI[sha256sum] =
> > "6c502c816002f90d4f76050a6429c3a7e0d84204222cbff2dce95dd773ba6840"
> > +SRC_URI[md5sum] = "1d4eb194eaaa2bcfbba28102768c7dbf"
> > +SRC_URI[sha256sum] =
> > "cb057190ba0a961768224e4dc6883104c6f945b2bf2ef90d7da39e7c1834f7ff"
> > 
> > S = "${WORKDIR}/libusb-${PV}"
> 
> Ping :)

At this point in the release it's too late for version upgrades unless the 
upgrade fixes a critical issue and applying the patch to fix that issue is more 
risky than the upgrade. I should imagine Ross has this queued for master when 
the release happens and we diverge.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

