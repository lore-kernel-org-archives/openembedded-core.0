Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id D9CA771976
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2016 06:51:46 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 21 Sep 2016 23:51:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,378,1470726000"; d="scan'208";a="1060352281"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 21 Sep 2016 23:51:48 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.68])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 47B676A4006;
	Wed, 21 Sep 2016 23:51:22 -0700 (PDT)
Date: Thu, 22 Sep 2016 09:40:57 +0300
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Maciej =?utf-8?B?Qm9yesSZY2tp?= <maciej.borzecki@rndity.com>
Message-ID: <20160922064057.GA7406@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <1474471092-4321-1-git-send-email-ed.bartosh@linux.intel.com>
	<CAD4b0_KyEWXR4AQ0PEeN2zuP2VKudyM63aL9HiFymfkqgAuajw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAD4b0_KyEWXR4AQ0PEeN2zuP2VKudyM63aL9HiFymfkqgAuajw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [wic][PATCH] wic: add beaglebone.wks
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
X-List-Received-Date: Thu, 22 Sep 2016 06:51:47 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Sep 21, 2016 at 06:34:33PM +0200, Maciej Borzęcki wrote:
> On Wed, Sep 21, 2016 at 5:18 PM, Ed Bartosh <ed.bartosh@linux.intel.com> wrote:
> > Added wks to make an image for Beaglebone board.
> >
> > Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
> > ---
> >  scripts/lib/wic/canned-wks/beaglebone.wks | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >  create mode 100644 scripts/lib/wic/canned-wks/beaglebone.wks
> >
> > diff --git a/scripts/lib/wic/canned-wks/beaglebone.wks b/scripts/lib/wic/canned-wks/beaglebone.wks
> > new file mode 100644
> > index 0000000..753418e
> > --- /dev/null
> > +++ b/scripts/lib/wic/canned-wks/beaglebone.wks
> > @@ -0,0 +1,7 @@
> > +# short-description: Create Beaglebone disk image
> > +# long-description: Creates a partitioned disk image for Beaglebone board
> > +# which can be directly copied to SD card.
> > +
> > +part /boot --ondisk mmcblk0 --label boot --fstype vfat --source bootimg-partition --align 1024 --active
> > +part /     --ondisk mmcblk0 --label root --fstype ext4 --source rootfs --align 1024
> > +
> 
> Should be basically the same as sdimage-bootpart.wks as I used BBB
> back when I posted it along with some wic fixes. It also used to be
> possible to build a usable RaspberryPI image with the same kickstart
> file, though I have not tried that lately.

Thank you for pointing this out to me. I've just built wic image using
sdimage-bootpart.wks and it worked just fine on my BBB.

I didn't need any fixes though. Have your fixes been merged? Can you
point me out to them?

--
Regards,
Ed

