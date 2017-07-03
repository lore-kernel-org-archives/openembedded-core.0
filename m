Return-Path: <maxin.john@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id C538471D9C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jul 2017 11:38:40 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Jul 2017 04:38:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,302,1496127600"; d="scan'208";a="1167543309"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.84])
	by fmsmga001.fm.intel.com with ESMTP; 03 Jul 2017 04:38:38 -0700
Date: Mon, 3 Jul 2017 14:39:03 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: "Thomas A. F. Thorne MEng AUS MIET" <Thomas.Thorne@Net2Edge.com>
Message-ID: <20170703113903.GA26374@mbabyjoh-desk.ger.corp.intel.com>
References: <017fe027-8557-dada-f6f6-e112faee58d4@Net2Edge.com>
MIME-Version: 1.0
In-Reply-To: <017fe027-8557-dada-f6f6-e112faee58d4@Net2Edge.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: New Recipe for ser2net with IPv6 Support (v3.0 & v3.1)
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
X-List-Received-Date: Mon, 03 Jul 2017 11:38:40 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Fri, Jun 30, 2017 at 08:30:20AM +0100, Thomas A. F. Thorne MEng AUS MIET wrote:
> Good afternoon,
> 
> Would submitting a patch to this list that adds a recipe for ser2net
> v3.0 and ser2net v3.1 be the right thing to do to get it one day
> included in the layer?  Would the new versions beneficial to the wider
> community? 

The chances of a package upgrade, just for new features, in a released branch
like "krogoth" will be close to impossible (There may be exceptions, if changes
are security related) 

> I am working on an application that will use the ser2net application to
> access some serial ports over IPv6.  The current version of ser2net
> included with the meta-openembedded/meta-oe layer is 2.9.1 which does
> not include IPv6 support.  I believe that v3.0 onwards may include IPv6
> support and I am testing that out now. 
> 
> I am creating recipes for ser2net_3.0.bb and ser2net_3.1.bb as part of
> my testing.  I would be happy to submit the files as patches.  I am
> currently working on krogoth but could submit the patch against another
> version if preferred. 
> 
> I have CCed the meta-oe maintainers (on my first message attempt but not my second) 
> as that the is the layer that holds the ser2net recipe at present.  I hope that was not a mistake, please
> for give the extra email if it was. 

Sent a patch to upgrade ser2net to version 3.4 (for master branch):
http://lists.openembedded.org/pipermail/openembedded-devel/2017-July/113484.html

> Regards,
> Thomas Thorne  Software Engineer  Net2Edge Limited

Thanks and Regards,
Maxin

