Return-Path: <ricardo.neri-calderon@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 2EEC671989
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Dec 2016 23:26:23 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 28 Dec 2016 15:26:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,423,1477983600"; d="scan'208";a="1087621559"
Received: from ranerica-desktop.sc.intel.com (HELO [10.3.52.169])
	([10.3.52.169])
	by fmsmga001.fm.intel.com with ESMTP; 28 Dec 2016 15:26:24 -0800
Message-ID: <1482967584.106950.71.camel@ranerica-desktop>
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Date: Wed, 28 Dec 2016 15:26:24 -0800
In-Reply-To: <1482953240.32048.21.camel@intel.com>
References: <cover.1482324587.git.patrick.ohly@intel.com>
	<CAGNsrLAhdfQ7KGvBGCtSype2niB7AvqXGtWqFYOVd7e2GqvJfg@mail.gmail.com>
	<1482893793.106950.42.camel@ranerica-desktop>
	<1482953240.32048.21.camel@intel.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/9] UEFI + Secure Boot + qemu
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
X-List-Received-Date: Wed, 28 Dec 2016 23:26:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2016-12-28 at 20:27 +0100, Patrick Ohly wrote:
> > > fwiw, I've been maintaining acpica recipe in meta-oe, and will
> keep an
> > > eye here as well.
> > > meta-luv supports both x86* and arm*, and we have an interest in
> > > having the same features available and working for qemuaarch64.
> > 
> > I was not aware of this. Perhaps there is no need for us to maintain
> a
> > separate recipe in meta-luv.
> 
> Looks like there is consensus that maintaining an acpica recipe in
> OE-core is the right approach. I'll prepare a revision of this patch
> series that includes acpica instead of iasl and also addresses the
> other
> points that Ricardo raised.

Just to be clear. I meant that it would be better for meta-luv to
leverage the acpica recipe present in meta-OE :).


