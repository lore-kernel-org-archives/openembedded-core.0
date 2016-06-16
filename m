Return-Path: <maxin.john@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 5C96B731C8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jun 2016 11:11:37 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 16 Jun 2016 04:11:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,480,1459839600"; d="scan'208";a="976943422"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.71])
	by orsmga001.jf.intel.com with ESMTP; 16 Jun 2016 04:11:37 -0700
Date: Thu, 16 Jun 2016 14:11:29 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20160616111129.GB12991@mbabyjoh-desk.ger.corp.intel.com>
References: <1465996380-32444-1-git-send-email-maxin.john@intel.com>
	<1465996380-32444-4-git-send-email-maxin.john@intel.com>
	<1466009898.13979.230.camel@linuxfoundation.org>
	<20160616080546.GA12991@mbabyjoh-desk.ger.corp.intel.com>
	<1466066620.13979.256.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1466066620.13979.256.camel@linuxfoundation.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/4] pointercal-xinput: add a dummy calibration file for qemu
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
X-List-Received-Date: Thu, 16 Jun 2016 11:11:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Thu, Jun 16, 2016 at 09:43:40AM +0100, Richard Purdie wrote:
> On Thu, 2016-06-16 at 11:05 +0300, Maxin B. John wrote:
> > Hi RP,
> > 
> > On Wed, Jun 15, 2016 at 05:58:18PM +0100, Richard Purdie wrote:
> > > On Wed, 2016-06-15 at 16:13 +0300, Maxin B. John wrote:
> > > > In qemu, the emulated PS/2 mouse reports itself as an "absolute
> > > > coordinate"
> > > > device and that makes xinput_calibrator think it could be
> > > > calibrated.
> > > > 
> > > > Add a dummy calibration file as a work around to prevent
> > > > xinput_calibrator from
> > > > popping up on every boot in qemu.
> > > > 
> > > > [YOCTO #8380]
> > > > 
> > > > Signed-off-by: Maxin B. John <maxin.john@intel.com>
> > > > Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> > > 
> > > This doesn't sound right. In qemu, we add a usb touchpad which
> > > allows
> > > absolute coordinate entry, which means qemu doesn't have to grab
> > > the
> > > mouse.
> > > 
> > > Are there two devices? A mouse shouldn't be seen as an absolute
> > > coordinate device.
> > 
> > Yes, both qemu monitor and xinput_calibrator in target shows two
> > devices:
> > 
> > (qemu) info mice
> >   Mouse #2: QEMU PS/2 Mouse
> >   * Mouse #3: QEMU HID Tablet (absolute)
> > 
> > #  xinput_calibrator --list
> >  Device "QEMU QEMU USB Tablet" id=8
> >  Device "ImExPS/2 Generic Explorer Mouse" id=9
> 
> So with these patches, are we still calibrating the tablet input?

We won't be calibrating tablet input in qemu targets.This patch is supposed
to be a work-around to avoid mouse input calibration only in qemu targets.

> pointercal ships default calibrations for that under the current setup
> but those likely aren't compatible with xinput and we'd need the same
> thing but for xinput here?

Yes, the default values shipped by pointercal aren't compatible with xinput.

> Cheers,
> Richard

Best Regards,
Maxin

