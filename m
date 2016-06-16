Return-Path: <maxin.john@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id ED60260124
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jun 2016 08:05:55 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga101.jf.intel.com with ESMTP; 16 Jun 2016 01:05:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,478,1459839600"; d="scan'208";a="122889325"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.71])
	by fmsmga004.fm.intel.com with ESMTP; 16 Jun 2016 01:05:55 -0700
Date: Thu, 16 Jun 2016 11:05:46 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20160616080546.GA12991@mbabyjoh-desk.ger.corp.intel.com>
References: <1465996380-32444-1-git-send-email-maxin.john@intel.com>
	<1465996380-32444-4-git-send-email-maxin.john@intel.com>
	<1466009898.13979.230.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1466009898.13979.230.camel@linuxfoundation.org>
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
X-List-Received-Date: Thu, 16 Jun 2016 08:05:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi RP,

On Wed, Jun 15, 2016 at 05:58:18PM +0100, Richard Purdie wrote:
> On Wed, 2016-06-15 at 16:13 +0300, Maxin B. John wrote:
> > In qemu, the emulated PS/2 mouse reports itself as an "absolute
> > coordinate"
> > device and that makes xinput_calibrator think it could be calibrated.
> > 
> > Add a dummy calibration file as a work around to prevent
> > xinput_calibrator from
> > popping up on every boot in qemu.
> > 
> > [YOCTO #8380]
> > 
> > Signed-off-by: Maxin B. John <maxin.john@intel.com>
> > Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> 
> This doesn't sound right. In qemu, we add a usb touchpad which allows
> absolute coordinate entry, which means qemu doesn't have to grab the
> mouse.
> 
> Are there two devices? A mouse shouldn't be seen as an absolute
> coordinate device.

Yes, both qemu monitor and xinput_calibrator in target shows two devices:

(qemu) info mice
  Mouse #2: QEMU PS/2 Mouse
  * Mouse #3: QEMU HID Tablet (absolute)

#  xinput_calibrator --list
 Device "QEMU QEMU USB Tablet" id=8
 Device "ImExPS/2 Generic Explorer Mouse" id=9

> Cheers,
> 
> Richard

Best Regards,
Maxin

