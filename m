Return-Path: <maxin.john@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3798B77071
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 May 2016 10:43:47 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 31 May 2016 03:43:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,395,1459839600"; d="scan'208";a="965698392"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.71])
	by orsmga001.jf.intel.com with ESMTP; 31 May 2016 03:43:46 -0700
Date: Tue, 31 May 2016 13:43:51 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20160531104351.GA3216@mbabyjoh-desk.ger.corp.intel.com>
References: <1464621623-16991-1-git-send-email-maxin.john@intel.com>
	<1464621623-16991-2-git-send-email-maxin.john@intel.com>
	<1464680256.19134.110.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1464680256.19134.110.camel@linuxfoundation.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Alexander Kanavin <alexander.kanavin@intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] bluez5: update to 5.40
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
X-List-Received-Date: Tue, 31 May 2016 10:43:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Tue, May 31, 2016 at 08:37:36AM +0100, Richard Purdie wrote:
> On Mon, 2016-05-30 at 18:20 +0300, Maxin B. John wrote:
> > 5.39 -> 5.40
> > 
> > Signed-off-by: Maxin B. John <maxin.john@intel.com>
> > ---
> >  meta/recipes-connectivity/bluez5/{bluez5_5.39.bb => bluez5_5.40.bb}
> > | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >  rename meta/recipes-connectivity/bluez5/{bluez5_5.39.bb =>
> > bluez5_5.40.bb} (89%)
> 
> I had this in master-next and suspect it caused:
> 
> https://autobuilder.yoctoproject.org/main/builders/nightly-mips64/build
> s/448/steps/BuildImages/logs/stdio
> 
> https://autobuilder.yoctoproject.org/main/builders/nightly-qa-pam/build
> s/800/steps/BuildImages/logs/stdio
> 
> and the world targets also showed some issues. There were other changes
> mixed in (particularly python3) and some builds succeeded so it could
> also be some kind of dependency race.

Please ignore that patch then. As you have mentioned, it could be some
kind of dependency race (couldnt re-create the failure in the local build)

I will send the bluez5 upgrade along with ofono after python(2->3) work.

> Cheers, 
> Richard

Best Regards,
Maxin

