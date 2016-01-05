Return-Path: <maxin.john@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 90CF36FFF7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jan 2016 15:20:27 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 05 Jan 2016 07:20:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,525,1444719600"; d="scan'208";a="884199849"
Received: from mbabyjoh-mobl.fi.intel.com ([10.237.72.71])
	by orsmga002.jf.intel.com with ESMTP; 05 Jan 2016 07:20:23 -0800
Date: Tue, 5 Jan 2016 17:21:57 +0200
From: "Maxin B. John" <maxin.john@intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20160105152157.GA31893@mbabyjoh-mobl.fi.intel.com>
References: <1452002894-10301-1-git-send-email-maxin.john@intel.com>
	<20160105150124.GB2574@jama>
MIME-Version: 1.0
In-Reply-To: <20160105150124.GB2574@jama>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] bluez5: upgrade to 5.37
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
X-List-Received-Date: Tue, 05 Jan 2016 15:20:27 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Martin,

On Tue, Jan 05, 2016 at 04:01:24PM +0100, Martin Jansa wrote:
> On Tue, Jan 05, 2016 at 04:08:13PM +0200, Maxin B. John wrote:
> > 5.36 -> 5.37
> > 
> > Remove the backported patch:
> > core-profile-Fix-possible-crash-when-registering-pro.patch
> Don't you need to remove
> file://core-profile-Fix-possible-crash-when-registering-pro.patch
> from SRC_URI when you're removing the file?

Yes, that change is present in the patch (based on "ross/mut" branch)

> Can you please add PNBLACKLIST which will blacklist bluez5 when bluez4
> is in DISTRO_FEATURES?

Sure, will do that.

> Like I did for bluez4 in:
> http://git.openembedded.org/meta-openembedded/commit/?id=73ba7cd70f75a898bf4c3f8ae38c9904fc3e4724
> 
> Making bluez4 and bluez5 really mutually exclusive would help with
> issues like this one:
> http://lists.openembedded.org/pipermail/openembedded-devel/2016-January/105341.html

Thank you very much for the comments. Will include these changes in v2.

> > Signed-off-by: Maxin B. John <maxin.john@intel.com>
> > ---
> >  ...e-Fix-possible-crash-when-registering-pro.patch | 54 ----------------------
> >  .../bluez5/{bluez5_5.36.bb => bluez5_5.37.bb}      |  5 +-
> >  2 files changed, 2 insertions(+), 57 deletions(-)
> >  delete mode 100644 meta/recipes-connectivity/bluez5/bluez5/core-profile-Fix-possible-crash-when-registering-pro.patch
> >  rename meta/recipes-connectivity/bluez5/{bluez5_5.36.bb => bluez5_5.37.bb} (83%)

<snip>

> > -SRC_URI += "file://core-profile-Fix-possible-crash-when-registering-pro.patch"
> > -SRC_URI[md5sum] = "9a0ee479cacc44fac68f6a65b1cd3eba"
> > -SRC_URI[sha256sum] = "a343ea1aeb53d3bd139087f3b1c1e1fb70db452d9762cc7a3d23e75962e578f2"
> > +SRC_URI[md5sum] = "33177e5743e24b2b3738f72be64e3ffb"
> > +SRC_URI[sha256sum] = "c14ba9ddcb0055522073477b8fd8bf1ddf5d219e75fdfd4699b7e0ce5350d6b0"

Best Regards,
Maxin


