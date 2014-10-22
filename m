Return-Path: <tom.zanussi@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 0BA9E60233
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Oct 2014 13:26:45 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 22 Oct 2014 06:26:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,769,1406617200"; d="scan'208";a="618512210"
Received: from justinda-mobl1.ger.corp.intel.com (HELO [10.255.13.67])
	([10.255.13.67])
	by fmsmga002.fm.intel.com with ESMTP; 22 Oct 2014 06:26:45 -0700
Message-ID: <1413984404.8474.32.camel@empanada.home.network>
From: Tom Zanussi <tom.zanussi@intel.com>
To: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
Date: Wed, 22 Oct 2014 08:26:44 -0500
In-Reply-To: <3835144.lX68KSfk9D@comp-006-thk>
References: <54454A41.7090900@balister.org> <2808693.YK3zlpjAPq@comp-006-thk>
	<1413981637.8474.30.camel@empanada.home.network>
	<3835144.lX68KSfk9D@comp-006-thk>
X-Mailer: Evolution 3.8.5 (3.8.5-2.fc19) 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: wic debug suggestions
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
X-List-Received-Date: Wed, 22 Oct 2014 13:26:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2014-10-22 at 14:48 +0200, Maciej Borzecki wrote:
> On Wednesday 22 of October 2014 07:40:37 Tom Zanussi wrote:
> > On Wed, 2014-10-22 at 09:03 +0200, Maciej Borzecki wrote:
> > > On Monday 20 of October 2014 13:45:37 Philip Balister wrote:
> > > > I'm trying to make an sd card using the sdimage-bootpart.wks file. I've
> > > > made an image and dd'ed it to a card. The card has a good vfat
> > > > partition, but the ext4 partition won't mount. Looks like bad
> > > > superblock. I can format the partition manually, so partitions seem OK
> > > > and card works.
> > > > 
> > > > Does anyone have any suggestions for debugging this?
> > > 
> > > In default wks, the vfat partition is /boot, ext4 is /. If I understood
> > > you
> > > correctly / fails to mount, is that right?
> > > 
> > > I've rebuilt an image with poky rev
> > > 8ac8eca2e3bd8c78e2b31ea974930ed0243258a3. Loading via loopback and
> > > mounting partition 2 (/ in this case) works fine.
> > > 
> > > Can you post the output this command?
> > > 
> > >   wic create -D -e core-image-minimal sdimage-bootpart
> > 
> > It seems the problem is in handling a large file system.  A new bug has
> > been opened for this:
> > 
> > Bug 6863 - Wic fails to create a working image for a large file system
> > 
> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=6863
> Do you need help?
> 
> 

No, it doesn't look like it's sdimage-bootpart-specific at this point,
thanks.

Tom  



