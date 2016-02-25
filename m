Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 5FB93763F8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 08:51:11 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga104.fm.intel.com with ESMTP; 25 Feb 2016 00:51:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,497,1449561600"; d="scan'208";a="923572069"
Received: from unknown (HELO jlock-mobl1.gar.corp.intel.com) ([10.252.4.104])
	by fmsmga002.fm.intel.com with ESMTP; 25 Feb 2016 00:51:11 -0800
Message-ID: <1456390270.3610.11.camel@linux.intel.com>
From: Joshua G Lock <joshua.g.lock@linux.intel.com>
To: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
Date: Thu, 25 Feb 2016 08:51:10 +0000
In-Reply-To: <20160225081152.GB3868@comp-006-thk.openrnd.local>
References: <cover.1456325292.git.joshua.g.lock@intel.com>
	<971c0d25fa2239884b0f99fa1fa1423305d14896.1456325292.git.joshua.g.lock@intel.com>
	<20160225081152.GB3868@comp-006-thk.openrnd.local>
X-Mailer: Evolution 3.18.5.1 (3.18.5.1-1.fc23) 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 02/10] swupd-server: initial recipe 2.53
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
X-List-Received-Date: Thu, 25 Feb 2016 08:51:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2016-02-25 at 09:11 +0100, Maciej Borzecki wrote:
> On 02/24 14:52, Joshua Lock wrote:
> > +SRC_URI = "\
> > +    https://download.clearlinux.org/releases/5940/clear/source/SRP
> > MS/${BPN}-${PV}-4.src.rpm;extract=${BP}.tar.gz \
> I'm going throught he patches in reverse order, but IIRC you used
> release 5700 for swupd-client, here it's release 5940. Is there a
> chance
> that client and server might be out of sync?

Well spotted! This combination do work together, both from my own
testing and that of colleagues using swupd, but I would like to sync up
on the same version soon.

Regards,

Joshua


