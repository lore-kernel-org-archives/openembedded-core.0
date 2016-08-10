Return-Path: <maxin.john@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2A15C77154
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2016 11:09:22 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 10 Aug 2016 04:09:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,499,1464678000"; d="scan'208";a="1011829852"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.71])
	by orsmga001.jf.intel.com with ESMTP; 10 Aug 2016 04:09:23 -0700
Date: Wed, 10 Aug 2016 14:10:30 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20160810111030.GA8007@mbabyjoh-desk.ger.corp.intel.com>
References: <1470821429-6094-1-git-send-email-maxin.john@intel.com>
	<20160810095812.duksmuoyl5r6t5zt@jama>
MIME-Version: 1.0
In-Reply-To: <20160810095812.duksmuoyl5r6t5zt@jama>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 00/10] replace xtscal with xinput-calibrator
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
X-List-Received-Date: Wed, 10 Aug 2016 11:09:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Martin,

On Wed, Aug 10, 2016 at 11:58:12AM +0200, Martin Jansa wrote:
> On Wed, Aug 10, 2016 at 12:30:19PM +0300, Maxin B. John wrote:
> > Remove xtscal in preference of xinput-calibrator
> > 
> > [YOCTO #9365]
> > [YOCTO #8380]
> > 
> > Changes in v2:
> >     1. Removed bash dependency from xinput-calibrator
> >     2. Moved tslib recipe from oe-core since modern systems tend to use
> >        kernel driver or libinput
> >     3. removed pointercal reference from packagegroup-core-x11-base
> >     4. removed tslib references from packagegroup-core-tools-testapps
> > 
> > The following changes since commit dfc016fbf13e62f7767edaf7abadf1d1b72680b2:
> > 
> > maintainers.inc: remove augeas (2016-08-02 14:05:58 +0100)
> 
> It would be nice to order the changes in this series that the recipes
> are removed only after the references to them to keep the history
> bisect-able, e.g. xtscal, tslib and pointercal are removed while they are still
> referenced from elsewhere.

Sure, I have reordered the patches and force pushed those to "maxin/xtscal" branch:

New order is as below:

 Maxin B. John (10):
 xtscal: remove recipe
 tslib: remove recipe
 pointercal: remove recipe
 x11-common: replace xtscal with xinput-calibrator
 pointercal-xinput: add a dummy calibration file for qemu
 packagegroup-core-x11-base.bb: remove pointercal
 xinput-calibrator: remove bash dependency
 packagegroup-core-tools-testapps: remove tslib references
 distro_alias.inc: remove xtscal, pointercal and tslib references
 layer.conf: remove pointercal

> > are available in the git repository at:
> > 
> > git://git.yoctoproject.org/poky-contrib maxin/xtscal
> > http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=maxin/xtscal
> > 
> > Maxin B. John (10):
> >   xtscal: remove recipe
> >   x11-common: replace xtscal with xinput-calibrator
> >   pointercal-xinput: add a dummy calibration file for qemu
> >   packagegroup-core-x11-base.bb: remove pointercal
> >   xinput-calibrator: remove bash dependency
> >   pointercal: remove recipe
> >   tslib: remove recipe
> >   packagegroup-core-tools-testapps: remove tslib references
> >   distro_alias.inc: remove xtscal, pointercal and tslib references
> >   layer.conf: remove pointercal
> > 
<snip>

Best Regards,
Maxin


