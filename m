Return-Path: <maxin.john@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 64D4A73216
	for <openembedded-core@lists.openembedded.org>;
	Sun,  5 Jun 2016 04:46:33 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 04 Jun 2016 21:46:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,419,1459839600"; d="scan'208";a="969076211"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.71])
	by orsmga001.jf.intel.com with ESMTP; 04 Jun 2016 21:46:32 -0700
Date: Sun, 5 Jun 2016 07:47:06 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: Mark Hatle <mark.hatle@windriver.com>
Message-ID: <20160605044705.GA8971@mbabyjoh-desk.ger.corp.intel.com>
References: <1464953991-4125-1-git-send-email-maxin.john@intel.com>
	<cf6e48c8-4fc8-aaec-87d2-940623951477@windriver.com>
	<54951.10.252.18.48.1464982415.squirrel@linux.intel.com>
	<e0e0244c-0099-8c8c-0e47-5077b67ab22d@windriver.com>
MIME-Version: 1.0
In-Reply-To: <e0e0244c-0099-8c8c-0e47-5077b67ab22d@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] rpm: update patch to support db-6.2.23
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
X-List-Received-Date: Sun, 05 Jun 2016 04:46:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

> On 6/3/16 2:33 PM, alexander.kanavin@linux.intel.com wrote:
> >> On 6/3/16 6:39 AM, Maxin B. John wrote:
> >>> Refresh the rpm-db60.patch to support db-6.2.23
> >>
> >> NAK NAK NAK
> >>
> >> Please do NOT merge this set.
> >>
> >> 6.2.23 does NOT work with the version of RPM.
> > 
> > Should db be updated to the latest 6.1 release then?
> 
> Latest 6.1 release has the same problem unfortunately.  So it needs to wait as well.
> 
> > Generally, Mark, do you want to be the maintainer of db recipe? Since it
> > is so tightly coupled with rpm, and is full of nontrivial issues like
> > this, it makes sense that you take care of updating both.

Agree with Alex here. As it is coupled with rpm, it makes more sense to have
the same maintainer for both these packages.

> I'm fine with moving BDB maintenance to me, and I'll try to keep them in sync
> moving forward.. (for the most part they are decoupled, it was only recently
> that things broke like this.)

Mark, thanks a lot !

> --Mark
> 
> > Alex
> > 

Best Regards,
Maxin

